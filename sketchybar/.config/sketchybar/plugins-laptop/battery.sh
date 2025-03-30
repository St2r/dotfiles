PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
    sketchybar --set "$NAME" icon="" icon.padding_right=-4
    exit 0
fi

declare -A BATTERY_ICONS=(
    ["a"]="󰁹"
    ["9"]="󰂂"
    ["8"]="󰂁"
    ["7"]="󰂀"
    ["6"]="󰁿"
    ["5"]="󰁾"
    ["4"]="󰁽"
    ["3"]="󰁼"
    ["2"]="󰁻"
    ["1"]="󰁺"
    ["0"]="󰂎"
)

declare -A CHARGING_ICONS=(
    ["a"]="󰂅"
    ["9"]="󰂋"
    ["8"]="󰂊"
    ["7"]="󰢞"
    ["6"]="󰂉"
    ["5"]="󰢝"
    ["4"]="󰂈"
    ["3"]="󰂇"
    ["2"]="󰂆"
    ["1"]="󰢜"
    ["0"]="󰢟"
)

# 获取对应电量范围的图标
get_battery_icon() {
    local percentage=$1
    local charging=$2
    local icon_map

    # 根据充电状态选择图标映射
    if [[ "$charging" != "" ]]; then
        icon_map=("${CHARGING_ICONS[@]}")
    else
        icon_map=("${BATTERY_ICONS[@]}")
    fi

    # 根据电量百分比选择图标
    case $percentage in
    100) echo "${icon_map["a"]}" ;;
    9[0-9]) echo "${icon_map["9"]}" ;;
    8[0-9]) echo "${icon_map["8"]}" ;;
    7[0-9]) echo "${icon_map["7"]}" ;;
    6[0-9]) echo "${icon_map["6"]}" ;;
    5[0-9]) echo "${icon_map["5"]}" ;;
    4[0-9]) echo "${icon_map["4"]}" ;;
    3[0-9]) echo "${icon_map["3"]}" ;;
    2[0-9]) echo "${icon_map["2"]}" ;;
    1[0-9]) echo "${icon_map["1"]}" ;;
    *) echo "${icon_map["0"]}" ;;
    esac
}

# 使用函数获取图标
ICON=$(get_battery_icon "$PERCENTAGE" "$CHARGING")

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
