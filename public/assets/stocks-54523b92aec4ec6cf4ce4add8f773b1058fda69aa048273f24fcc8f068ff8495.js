var init_stock_lookup;init_stock_lookup=function(){$("#stock-lookup-form").on("ajax:before",function(){show_spinner()}),$("#stock-lookup-form").on("ajax:after",function(){hide_spinner()}),$("#stock-lookup-form").on("ajax:success",function(o,n){$("#stock-lookup").replaceWith(n),init_stock_lookup()}),$("#stock-lookup-form").on("ajax:error",function(){hide_spinner(),$("#stock-lookup-results").replaceWith("  "),$("#stock-lookup-errors").replaceWith("Stock was not found")})},$(document).ready(function(){init_stock_lookup()});