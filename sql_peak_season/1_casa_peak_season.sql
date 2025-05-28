


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
            --SUM(CAST(room_sold AS INTEGER)) AS Sold_2014,

            SUM(REPLACE(room_sold, ',', '')::INTEGER) AS Sold_2014,
           -- AVG(CAST(adr_modifier AS NUMERIC)) AS avrg
            AVG(REPLACE(adr_modifier, ',', '')::NUMERIC) AS avrg


from 
        version_1
where 
        hotel_id = '1' and 
        seasons = 'Peak Season' 
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
/*
Low Season ADR Modifier Over Years
This graph shows the average ADR (Average Daily Rate) modifier for the low season over the years. It helps visualize how the pricing strategy or average rates have changed annually.

Low Season Room Sold Over Years
This graph illustrates the average number of rooms sold during the low season each year. It indicates the trends in booking volume.

Low Season Occupancy Over Years
This graph displays the average occupancy rate during the low season annually. It shows how efficiently the hotel properties were utilized.

Low Season Occupancy Difference Over Years (Year-over-Year)
This bar chart highlights the year-over-year change in occupancy. Positive bars indicate an increase in occupancy from the previous year, while negative bars show a decrease.

Low Season ADR Modifier Difference Over Years (Year-over-Year)
This bar chart illustrates the year-over-year change in the ADR modifier. Positive bars indicate an increase in the ADR modifier from the previous year, and negative bars show a decrease. */
