local modpath = minetest.get_modpath(minetest.get_current_modname())

function all_mtschems(path)
    local handle = io.popen('find "'..path..'" -iname "*.mts" -print');
    local RTN = {}
    for file in handle:lines() do
        table.insert(RTN, file)
    end
    return RTN
end

__pnkp.fdsmgv_migrate(all_mtschems(modpath .. "/schems"))
