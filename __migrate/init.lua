__pnkp = __pnkp or {}

function __pnkp.fdsmgv_migrate(paths)
    for i,path in ipairs(paths) do
        settlements.convert_mts_to_lua(path)
    end
end
