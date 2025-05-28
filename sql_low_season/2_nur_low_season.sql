SELECT 
        hotel_id,
        hotel_property,
        adr_modifier,
        seasons,
        occupancy,
        arrival_date,
            EXTRACT(YEAR FROM arrival_date::DATE) AS year,

        room_sold,
        revenue,
           
           CAST(room_sold AS INTEGER) AS room_sold,
            CAST(revenue AS NUMERIC) AS revenue,
            SUM(CAST(room_sold AS INTEGER)) AS Sold_2014,
            AVG(CAST(adr_modifier AS NUMERIC)) AS avrg


from 
        version_1
where 
        hotel_id = '2' and 
        seasons = 'Low Season' 
        and 
        EXTRACT(YEAR FROM arrival_date::DATE) IN (2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021)

        GROUP BY hotel_id,
    hotel_property,
    adr_modifier,
    seasons,
    occupancy,
    arrival_date,
    room_sold,
    revenue


ORDER BY year

