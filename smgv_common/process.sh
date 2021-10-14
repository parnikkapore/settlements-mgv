# Usage: process oldfile newfile
function process() {
    cat "$1" | sed 's/doors:door_.*_t_./doors:hidden/g' | \
    sed 's/doors:door_glass_b_1/doors:door_glass_a/g' | sed 's/doors:door_glass_b_2/doors:door_glass_b/g' | \
    sed 's/doors:door_obsidian_glass_b_1/doors:door_obsidian_glass_a/g' | sed 's/doors:door_obsidian_glass_b_2/doors:door_obsidian_glass_b/g' | \
    sed 's/doors:door_wood_b_1/doors:door_wood_a/g' | sed 's/doors:door_wood_b_2/doors:door_wood_b/g' | \
    sed 's/doors:door_steel_b_1/doors:door_steel_a/g' | sed 's/doors:door_steel_b_2/doors:door_steel_b/g' | \
    sed 's/mg_villages:torch/default:torch_wall/g' | sed 's/default:torch",/default:torch_wall",/g' | \
    sed 's/mg:ignore/air/g' | sed 's/mg_villages:mob_workplace_marker/cottages:wool_tent/g' | \
    cat > "$2"
}

for file in $(ls *.lua); do echo "$file"; process $file ../$file; done 
