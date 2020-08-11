--dem so xe bi hu moi loai trong thang 5

SELECT DISTINCT B.BikeName , COUNT(B.BikeID) as sum
FROM Booking BK, Bike B , Account_Bike AB
WHERE AB.BikeUserID = BK.BikeUserID
	AND AB.BikeID = B.BikeID
	AND MONTH(BK.Date) = '6'
group by B.BikeName,B.BikeID

--tim nhan vien xuat sac trong thang


SELECT TOP 1 A.Name, COUNT(B.StaffID) AS total
FROM Booking B, Account A
WHERE B.StaffID = A.UserID
	AND MONTH(B.Date) = '6'
GROUP BY B.StaffID, A.Name
ORDER BY total DESC

--dich vu khach hang book nhieu nhat trong thang

SELECT TOP 1 S.Name, COUNT(S.ServiceID) AS total
FROM Service S, Booking B, Booking_Service BS, Shop_Service SS
WHERE B.BookingID = BS.BookingID
	AND BS.ShopServiceID = SS.ShopServiceID
	AND SS.ServiceID = S.ServiceID
	AND MONTH(B.Date) = '6'
GROUP BY S.ServiceID, S.Name
ORDER BY total DESC

--đếm số nhân viên trong của mỗi shop

SELECT DISTINCT SH.Name, COUNT(S.ShopID) as SUM
FROM Staff S, Shop SH
WHERE SH.ShopID = S.ShopID
GROUP BY SH.Name, S.ShopID

--mỗi shop có tổng bnh bill trong tháng

SELECT DISTINCT SH.Name, COUNT(S.ShopID) as SUM
FROM Staff S, Shop SH, Booking B
WHERE SH.ShopID = S.ShopID
	AND B.StaffID = S.StaffID
GROUP BY SH.Name, S.ShopID