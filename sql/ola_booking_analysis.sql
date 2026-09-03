CREATE DATABASE ola;
use ola;

-- 1. Retrieve all successful bookings:
CREATE VIEW succesfull_bookings AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        booking_status = 'success';


-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW avg_ride_distance_for_each_vehicle AS
    SELECT 
        Vehicle_type, AVG(ride_distance)
    FROM
        bookings
    GROUP BY Vehicle_type
    ORDER BY AVG(ride_distance) DESC;


-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW total_canceled_rides_by_customers AS
    SELECT 
        booking_status,
        COUNT(booking_status = 'canceled by customer') AS canceled_rides
    FROM
        bookings
    WHERE
        booking_status = 'canceled by customer';

-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top5_customer_with_highest_bookings AS
    SELECT 
        customer_id, COUNT(booking_id) AS booking_id
    FROM
        bookings
    GROUP BY customer_id
    ORDER BY booking_id DESC
    LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_cancelled_by_drivers AS
    SELECT 
        canceled_rides_by_driver,
        COUNT(canceled_rides_by_driver = 'personal & car related issue') AS canceled_rides
    FROM
        bookings
    WHERE
        canceled_rides_by_driver = 'personal & car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW max_min_ratings AS
    SELECT 
        vehicle_type,
        MAX(driver_ratings) AS max_rating,
        MIN(driver_ratings) AS min_rating
    FROM
        bookings
    WHERE
        vehicle_type = 'prime sedan';

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW payment_upi AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        payment_method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
CREATE VIEW avg_customer_rating AS
    SELECT 
        vehicle_type,
        ROUND(AVG(customer_rating), 2) AS avg_customer_rating
    FROM
        bookings
    GROUP BY vehicle_type
    ORDER BY avg_customer_rating DESC;

-- 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_booking_value AS
    SELECT 
        SUM(booking_value) AS total_value
    FROM
        bookings
    WHERE
        booking_status = 'success';

-- 10. List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides AS
    SELECT 
        incomplete_rides, incomplete_rides_reason
    FROM
        bookings
    WHERE
        incomplete_rides = 'yes';




