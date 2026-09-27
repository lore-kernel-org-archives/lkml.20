Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99F43CB8FC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546802; cv=none; b=elbhJLARbobsy/ElD9dAm2fNNNuM3jACLBPxutWubUdZzAbz8nlsfWM+CvSThLXb3Up256Q9nnHZ9pZPSKUDaL+Fvg05smmpaZQAWEbkc0fTTYKF4t/z1HwiEgw+J5Nn4TJ5MI9L4HaJYXa0SkFW3OIgdbxmnI4yS/s6A18XgPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546802; c=relaxed/simple;
	bh=i8R5ShupKRQcM1sWDGwuW+M5JCa5wGqjk5dVrSzAeG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDf/AzdSO40fbz1WS1P7EphZMzW7wc3ojI2IOLYmmDKtgClej9/IgK16/3DBmL0jIg95nKeHh8Q2/Tbk4z2FVJ5zr47l8i1JVAVF3l5WWDXp78pJszzyQvv8FObxTtHFO+cS73AF1qNQcv3PoyuZVFUz7DB7T5KAPiArt8RLZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLVMKap+; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLVMKap+"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfd70b08cso314651385a.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546797; x=1791151597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=318KVPravmuZL7vvBUPt/vYrDCtgz2UR58hdtie4Kas=;
        b=eLVMKap+GxB2CeobEAAwSWctSZ9ro+DIU7OTNQQTQtnU8rbBKui1JkIZIUPY6iXm11
         3N2LpLoHr0xG3Nwg1yoxczey3UARgvdzBBeTZaOft3cc05Yw5xX52OSUaxdIFvYrxw1h
         venV3vK4AMaidxOhhZL2diNANyF2ALJqNaAMtJYhXUmXkpGsF+wG1A8+sS/t6uMv94jH
         1MtqRZAy2lG9wV363Ftfy2nH6QZ0J8lkCHgo35hjLnJxEvGNeelKqPWFWy6UISEF76vt
         V3JSlhCZOQNa/ukeIsXDnoc9/TPzT3dc6l12N4QyLv9wq0VjiTXnsykC6OLjzH8jDbcf
         LlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546797; x=1791151597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=318KVPravmuZL7vvBUPt/vYrDCtgz2UR58hdtie4Kas=;
        b=LvCQuL52SQNV0hfjQ9qfHKlEKX4hPkWz7lVmq7h39lO3/PGMCHSjQB+YFo/Egphi+A
         1rxf0XAj5acgeSK6HH/4mRRoN/EPKbsfHYMk2XPgse/1a/j1wKXII/pfhLBxxH8DtPUG
         Jw1/GMMAOPN7kGLSiCjUh37Cam0yOjTLd15+Cj8YeJIwod7K1SoRdhOaI9SD5Ax+NPZ3
         ezY5nHLvAEJOSAuG8kIuOtMHx1Esx8RP/5EUJ5PJH1+DKu5KIqq0SPAlkXyodEhiMMk8
         ZV9/u+nfAZoEjRbz71mQo0wz0YQpiyouQQHDZRfZc/Hh63IOL0Rt39wsQWl8JQFMzlXB
         R9Cg==
X-Forwarded-Encrypted: i=1; AKwUvBw+PDIUlPo3eT6vunWgWXXlSTfx4s/ZOE6W7wTKOX6Qlypw5MqnAJKUhjBpdvXbMTT7wUXyMQr66ths/1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nuYXyXpB15Xm7e3rtXRFzC+Sc1h+E7O0YeVJo271ryIHXY6ASl
	sdVmIoI/BO1H+QqvC3MNkMvEHe6IAiDUFLNzJmu99HL6oY04304ceQg+
X-Gm-Gg: AYBFou0Qs/j944Y4bFgY3z05JqtBUJCSbtzIKWiCElYpEyQELZY+qDloQ+PTfYogvpK
	g4VRISPWfLc8UHzA+pgRnFlD/e0HozxDaD24HaXAWtXWNFdIhMJNSh0sFIZnCr14mSGgfwLgjsE
	7WmAEYf5P4MG5hPg4PgiPgWeuwpipaIDpJ9OSCcfmYIpxIeCRHaH58/oIkXr5cnN5/CXg/BGD9k
	x5IlrOLLp4jTTPydr7RUSWWFHvMCm/L+a3MqWn0X+VzKWx9mQcXtmTZMLMCKJ73GmY7kj7itBZg
	75HMBxXnSKtvmQQWxHR148t/MwJsmfNmPumk8st8QbWlkaRjk6MnkRLlj0rG/nzCz5YSVvsXEjN
	NOSHQmbtVonjsvAgkd7jdavPA1zOaBkjF5coXYiAuBTzYcIvc2I+ujc7VTKs4k8ksC9faT3HecR
	VCfwy4ByIigeinMJv2kXNT/9qv5Nbh+gFJMHr3b1tKPU2p7nUsa26TjUtktdTtzARffSbCYJgKO
	ot/VPbkiQ5kDNQhqHcGBQbEdFY5OkyEs5OIPsuNlUTSoG17NG1v0s3cZHXfzWG/6N/1JfnExJHT
	2k2S2n7+
X-Received: by 2002:a05:620a:6602:b0:939:3a81:326 with SMTP id af79cd13be357-93c47498e61mr1491329385a.37.1790546797026;
        Sun, 27 Sep 2026 15:06:37 -0700 (PDT)
Received: from cachyos-SlimIce.lan (1841343-static.dvnpiaaa.metronetinc.net. [195.252.229.229])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c44972febsm708092385a.39.2026.09.27.15.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 15:06:36 -0700 (PDT)
From: Jared Wuerzburger <jwuerz@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Dionne-Riel <samuel@dionne-riel.com>,
	Jared Wuerzburger <jwuerz@gmail.com>
Subject: [PATCH v3 2/2] iio: imu: st_lsm6dsx: Add ACPI ID SMOCF05 for LSM6DS3TR-C
Date: Sun, 27 Sep 2026 17:05:59 -0500
Message-ID: <20260927220559.24169-3-jwuerz@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927220559.24169-1-jwuerz@gmail.com>
References: <20260927220559.24169-1-jwuerz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Dionne-Riel <samuel@dionne-riel.com>

The Minisforum V3 and V3 SE tablets declare their ST LSM6DS3TR-C IMU in
the DSDT with the hardware ID SMOCF05 instead of SMO8B30, so the driver
never binds and the accelerometer and gyroscope are missing. The
Windows driver (version 1.0.4.3) binds the LSM6DS3TR-C to both IDs.

Relevant part of the DSDT, identical on both models (full excerpt in
the cover letter):

  Scope (_SB.I2CD) { Device (STS) {
    Name (_HID, EisaId ("SMOCF05"))
    Name (_CID, EisaId ("SMOCF05"))
    _CRS: I2cSerialBusV2 (0x006A, ..., "\\_SB.I2CD")  vendor data "SLA0"
          I2cSerialBusV2 (0x006A, ..., "\\_SB.I2CD")  vendor data "SLG0"
          GpioInt (Edge, ActiveHigh, ..., "\\_SB.GPIO") { 9 }  "SLA0"
    Method (SLA0): "-1 0 0", "0 -1 0", "0 0 -1"
    Method (SLG0): "1 0 0", "0 1 0", "0 0 1"
  } }

Both I2C resources describe the same address, and the driver uses the
first one. The vendor-specific SLA0/SLG0 mount matrices are not parsed
here; the accelerometer orientation is handled in userspace through
the systemd hwdb, as for SMOCF00.

Tested on:
 - V3 SE (Ryzen 7 7735U, BIOS 1.03) with this change.
 - V3 (Ryzen 7 8840U, BIOS 1.06), kernel 7.2.7, with this change and
   the stock firmware tables. The driver binds to i2c-SMOCF05:00, the
   WHO_AM_I check passes (0x6a), and both lsm6ds3tr-c_accel and
   lsm6ds3tr-c_gyro are registered. Screen auto-rotation works with
   iio-sensor-proxy (checked with the device renamed to SMO8B30 via a
   DSDT override, i.e. the same ST_LSM6DS3TRC_ID driver data).

Link: https://github.com/mudkipme/awesome-minisforum-v3/issues/2
Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
[Jared Wuerzburger: rewrote the changelog with the DSDT excerpt and test
 results, dropped the mount matrix patch from the series]
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jared Wuerzburger <jwuerz@gmail.com>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
index fbf4e4ecc..5def1d01b 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
@@ -145,6 +145,7 @@ MODULE_DEVICE_TABLE(of, st_lsm6dsx_i2c_of_match);
 static const struct acpi_device_id st_lsm6dsx_i2c_acpi_match[] = {
 	{ "SMO8B30", ST_LSM6DS3TRC_ID },
 	{ "SMOCF00", ST_LSM6DSO_ID },
+	{ "SMOCF05", ST_LSM6DS3TRC_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, st_lsm6dsx_i2c_acpi_match);
-- 
2.55.0

