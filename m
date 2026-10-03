Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA950316199
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 05:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791006831; cv=none; b=ptgCF7jNdEUNCNvAeL6BZPbcuRxC19JZJ78suOAuraog7zh1yYh0nb297d5Ux6nMeE+tnOy7QRmz97Wo4ATjO9fbhfKe/s7VR1+JvasGqnzZqLsskuW5DiSzRNfrtmBK7pRoIZWsWQGnt4ROfHcHed0pmZqygcs4PIDyjvcAbtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791006831; c=relaxed/simple;
	bh=bgkVWI9xXLd0nO8KTFTzylCKcdnG7XdCgRt6hDnHG68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nenDdnkVuPEWI8T2Hb45j9smtMiSy0Qa2Y1xs1Ta1jGHDS6MpPFjAjIkOg8gtyBD4ZK/aGBPTVEw/nWrRVr3hvhiE47XI6vhBb65iNxjBgCXF0nSv+24bnw7sxgLtz3PtMopWnhy3SvV0dgYqExQ9nSwtFYDNMUSLQ80JhWnD6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGRlZfNB; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGRlZfNB"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1460bcc512eso25701c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 22:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791006829; x=1791611629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbzqWeCGv8CWYCDqlKs6MMVA3wQh3Tzas61qMifSYnA=;
        b=LGRlZfNBWvNkacOCQmfUbuPFLkcur7i0Zr1KAxTgeI/ucdAZ/dmJBVD3Ay7AlUBUDn
         ODlGqi4s2IebXQOefn61KpldW++iNd9COl5RVztnYeAYf8F6CL2WudIUumvCwL9raVAw
         ZvwpU9yZW/CNRCrqERYR/uhw52NNrnbY3egpYU/ekw3laqCnOad5Jc3iyFlRAv4kpiTi
         gcgw1A2VRYOCsRkyob/IazpU6BHOOxdSea79VaweNvQE2QoOmyvzETgPmjtrKQyLzwxt
         ZnnvBb9Ef4IB9+XcbVSp5K0AqpH/9xbWWBvcS5ozVJHUW0pk2fb6tAK/kIOxN2J+onRL
         5FZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791006829; x=1791611629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbzqWeCGv8CWYCDqlKs6MMVA3wQh3Tzas61qMifSYnA=;
        b=UwSuyP/itqjCwDq6FK5Y29A53spe7NLH0yunooUx6Tmwg+mvDIg2CKxmLee6qev1VY
         8EZYto2O0zRaOGaYm4nR6ZubXV4aQ/tZsrHFYr7ieJjY6y1bZkdFnGEND82WnX0QubHA
         56Xui3ce67jsQd14hs0D9a4cypDraCiG6wnQA9feZWgT7gcecD+NaexLgXPuW4ajROoI
         UpxCI/V0aXboprYvsvGJqFwjJa88qF2GmlOLg6MqulqIWQxs8S8Zt6hn3BhnLRGIGFHO
         fMBfNDlERUMhYGuBOj9ympUWC8lEzbg4dOmSpmmxR2XGN4YUFpzQrCg1JXim8P/WLh4T
         1nDQ==
X-Forwarded-Encrypted: i=1; AKwUvByJOf6PGW6o80QEbSujUQUzhS5dbc0Y59Ob8yVZLP1PWYmDyCwnmxjvoNRfcWtOL2SkIdDVBDX0bn81Pa8=@vger.kernel.org
X-Gm-Message-State: AFuF++n80zh5fOXUTh+Q9Bq0cvoTo9fSx6+4tz8JrfrtGKeY+lso78dw
	MkPTHhrJaEo6Y42yqD/RH5h7pB6V4qzqLOYUbWl2nCBNkiPWdwJhUyeS
X-Gm-Gg: AYBFou07pfY3/eXOJyL+h/hlPExQqUGv41ktMdc6LlOJVgtMIwFmdzEqrjV7cDbRd5p
	nPkAqI+/YE9AlafQUdTp+2Agepr5fcC+O5BgliAryHcpcNuZ4q1tLn3fjNiZv/jUKQykyK4yMvh
	gaHpR+6l4mY3tKNlychfvdZRFgJnQbvAkkkSCjZ1G5u24fcjWDUdfb3BcN3gqwTSNyKLH9JCft7
	9dLW/rZyCMOPRfC6PG2NUtOWVI1FtPtkolmPaTmDMv/Q7hW03FT22X445qKbmIv/qWzSp0LtTiv
	tpcf1t01rpERvJ+7lpZ2u1SVOjBLBsu33YppuWSWGI/NG8y4WEegyaQraBLHVlLKh/xkIphPBSG
	bBYg1NSK5X1BKJFULJUBQF2/bp4s329KiuZLwRsQ7e9n6ceocAgJg9Wjrhk31A+IuaDL1Dk7cNb
	leexp35i5gFoMiVhe9ZMO6fa8vW6NXSDlvJEzU50TIs1vcTDQf1NDqgrNZC32tMePehWNnr8JhP
	jgqtx7DL2rH64TElH1XeTe6EDmWOD5VcJF2kwtkQ1ZviaAdMOtSZuZg8V5kcncGCg2rsctDaWxP
	+Rz0TqkGkfFU1egG
X-Received: by 2002:a05:701b:4586:20b0:138:4e43:6399 with SMTP id a92af1059eb24-14f5bc00817mr5463175c88.11.1791006828933;
        Fri, 02 Oct 2026 22:53:48 -0700 (PDT)
Received: from kapoor ([117.235.138.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a6cbsm2720364c88.5.2026.10.02.22.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 22:53:48 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sean Nyekjaer <sean@geanix.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: imu: inv_icm42600: drop stale vdd_supply kernel-doc
Date: Sat,  3 Oct 2026 11:23:36 +0530
Message-ID: <20261003055339.143977-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdd_supply member was removed from struct inv_icm42600_state when
the driver switched to devm_regulator_get_enable() for the VDD
regulator, but its kernel-doc entry was left behind. This triggers a
W=1 warning:

  Warning: drivers/iio/imu/inv_icm42600/inv_icm42600.h:186 Excess struct
  member 'vdd_supply' description in 'inv_icm42600_state'

Drop the stale line.

Fixes: 9fd569aa3d70 ("iio: imu: inv_icm42600: Use devm_regulator_get_enable() for vdd regulator")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Comment-only change, checked with scripts/kernel-doc -Wall.

 drivers/iio/imu/inv_icm42600/inv_icm42600.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600.h b/drivers/iio/imu/inv_icm42600/inv_icm42600.h
index e56943931b6a..3737e79dbcc1 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600.h
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600.h
@@ -151,7 +151,6 @@ struct inv_icm42600_apex {
  *  @chip:		chip identifier.
  *  @name:		chip name.
  *  @map:		regmap pointer.
- *  @vdd_supply:	VDD voltage regulator for the chip.
  *  @vddio_supply:	I/O voltage regulator for the chip.
  *  @irq:		chip irq, required to enable/disable and set wakeup
  *  @orientation:	sensor chip orientation relative to main hardware.
-- 
2.53.0

