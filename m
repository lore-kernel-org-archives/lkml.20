Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765571;
	b=EjO98/oRAKLDKOSqSjdNvcgI9JDWVmqKcdb2G96Q31Dbdixn/hHoq3Ga5KLOmVGczopv
	 ceob8drkQ/PgGz1aPiikBQbFNF40kOLcujjUuUs18sygdyXZRttH992kkcxjuy2nZywcQ
	 tE5Lg2DpxmzL9KiQU9pMDQ8pubnSD5jWzynO9iUDOejLy+sJYnOR/M5+TO4EzvlW/+IsW
	 6H8SwHw/jede6aKEhoxmQnHqlB+2CuTndPkNtU8I4Q7vZU5zW+S08xzKeNmwkqw3YmDXb
	 iBqiz/6oegxNfjGzEsc8MNHTsmA7fm60xujaU+gja3OR1MoPjRYGIoRcukrqUfE+T2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ETxWwH+3XKdmGy3va4VsbBXcOFXJDAUa18QQihknvJY=;
	b=BW2f15HKiOXcOin5maicf5iPGTOeI8yKjxDakHF8JKBtquOeOzQuMB7S9V16d8p4pGt5
	 4xH/828AuY+HlNFmNHgyk/9XVNCCvtOqV12M/pQ1k7sXaJgdgyHPr831gBtotx11M9GSJ
	 PrsaXWBhRyE/JL0CKq0I9mLZdAGCuzaSZlFO5ODXkqZqd/Hn/8k2xiCF/SmscD6K9Naxq
	 DjFVcY+O8mZBHBVNNfz0Od04lbm6C1bqzzflFTiEL5bAkD/zghFwAVzGBWa8pLz2h5QGQ
	 3wIrHAAGWap4xn8ya5g9hNxJBnykIGPpewDS/0o3b2jmyNNlI4980Q6PFCIh37HtMYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMPBtEIm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EDF606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EDF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMPBtEIm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1482125e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793765569; x=1794370369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETxWwH+3XKdmGy3va4VsbBXcOFXJDAUa18QQihknvJY=;
        b=fMPBtEImdLr6lzNVywHPVDC5UuCXcKQy5N3a/MO3j7fq+oA2GN9GpPhpGxS53+NKp1
         MpE8Tu3OquQp7jzudEMTfxpjWfR9J42q8slj3J6DyqluZIOeLT+jzNMoY92yizglDv03
         QCZf6IkpYyZQ1GCk+5TH+N70HBy8xyvH+8kkalO9jUmw54/9UWtVX2DRViUXMsUmb1/P
         Xop3iQwC8V+uWKZipkPXneGMAhWq2kzz4qAPrT88RErlW85ShKpn/ly+649lA0DxCuLA
         h/XWLf2peMm3HUvz7bR7V6e6gflSzLgCNWHsWXN7MDTor+L+CFeg+oK3hTwem6zj24uE
         iilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793765569; x=1794370369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETxWwH+3XKdmGy3va4VsbBXcOFXJDAUa18QQihknvJY=;
        b=q5RO0LhtxTKjIzHSQN6Qf+pQbYMVc5SrrMhJu6BSaXdOBGXRUwonWpYRZfRpQTUYnh
         Q3J1dnH7pyAhW7m/VyUkp5G6p/2b+jAvjUz+twKwdudYqpq58EsO9fJr20UdnGtk6yus
         UOXT4z7p1YAYYp0jN/GXWMCTI73LGTbT6TiCJeqfbs1Z04pB/85S5TsjbcXb/Gv6YOO6
         Xo8a86RYW/9LpFCAo7ZrilKrpszniypLx7jG0+M/gwhw7j2kiVYn5PgqIEConBionSrF
         +wulz7+npAhQkjYpiTmfS2vP88HBl3F6L2chITltvcunn4IwYv0Bzmg2ATT8JNlsoVlb
         XVmw==
X-Forwarded-Encrypted: i=1; AKwUvBz4336jB9dumc2DjwoYb3OYuNlqbYMm6DGlw+qm0YA+rVwghA0qD4OavCAHgjEe1s+G06eh8jH3olawGB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NXjOu9tz1tAmlYa+a3CO2Yaf9BbPMQiDMrSXXxOXxvClgkwrp
	LoBfWPQx1YFKgHahMapmMFm85hRxnRJaB/pXxcJmxSjc6S3Mad/70dzQ
X-Gm-Gg: AYBFou3grK5tRFb3RkCYGLCjv6HhhBSHmOLuDv39LypI8okuGNPRb1i3EbbQsI5SwTQ
	ErPBmafjM3uPoveWdGzFbGrxCSKDFFNi+9p/Jk9P25YsRPKvtvliFcTKy19YWFcdmzwMtQxVR5V
	8FKB8UydOl2jpGSeoFX/NJbZd7pLRDopDyQrla+SsjBgVxvWa5CP8pqDrvhEBYrb2UkLHIfG0XL
	OIKpEyEOy75WsPNoniryDVaP1onP8t+rneW2FDDwCr/SkdL+yP1HA45KdKVKlpvL80f2cV8uIf9
	V6OfvZB3R12RpZie45Wj0DwKWBY37yT5GlmemOStC7FXXY3Neiia9JN2Q06uJotaGEK5ZD0XqG+
	JqnK3pU2hl68q0OGypJjNQUcAFt5MqDwCW2hlECF4dAKnG1X/CU3JpBAU4GxcaM9EtvEQ0JTkYe
	A5pR2S/iIT6Y8Yi29g8PS61j9iXE+OXDvbSb1Ocsz23WHK2A/j8mBS0/9ivCqJjzLR6szFR/O0h
	UoTiT5hhryBg5RnkjILld5XF4Fgiw1L2JM/KF/jcMLxTQNeWly2tfJ7Nc2QqONlZ3TMRBP3WKSE
	1jGalu1da+r0WrhXLCTE29rUnzaivvgZam+bHjSL8TXg8bp4Li2W9kAtOGsztjb9MTk3AJKfe+h
	p816Sr6EojgymoqZNmsZWLHYi+eO0cE69GQ2VIRWXs64K8f2qd4eMQDsWTTtpA06AS4ZNPygwcC
	qKoU8/WVpZxsKv
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4ac17b2cdc2mr344273165e9.27.1793765569288;
        Tue, 03 Nov 2026 20:12:49 -0800 (PST)
Received: from maria-VMware-Virtual-Platform ([154.80.94.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b437864e3fsm21212225e9.0.2026.11.03.20.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:12:48 -0800 (PST)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH] staging: iio: addac: adt7316: return 0 in _adt7316_store_enabled
Date: Wed,  4 Nov 2026 09:10:45 +0500
Message-ID: <20261104041237.7978-1-mariasheikh812@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_adt7316_store_enabled() writes the config register and returns -EIO if
the write fails. When execution reaches the final "return ret;", the
write has succeeded, so ret is always 0. Return 0 directly to make the
success path obvious.

Found with cppcheck (identicalConditionAfterEarlyExit). All callers
either check for a negative return value or pass it through, so
behavior does not change.

Compile-tested with W=1. The disassembly of adt7316.o is identical
before and after this change.

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..4cb03e7808ab 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -236,7 +236,7 @@ static ssize_t _adt7316_store_enabled(struct adt7316_chip_info *chip,
 
 	chip->config1 = config1;
 
-	return ret;
+	return 0;
 }
 
 static ssize_t adt7316_store_enabled(struct device *dev,
-- 
2.53.0

