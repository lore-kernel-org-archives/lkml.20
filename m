Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110416;
	b=Xse6m8BuW2XzaLK/nvQZnnj0cgnOpYyqPumeeWy23x+NS3aVHw9PqAnXKiWuxPfOA/Si
	 uYj2Lp6H7zVsBQv+/CilTagjjt4jPM3ddJ5p3Sb8VXq80yzXEhtuqfp3qRXrWhIO/GLPO
	 W5nAFZyIkBI2x3wDIw0M4uHbYilqzzRwVJ8udY6Ck7odJZBTL9uObgRnJrPRBPQ3zxdFp
	 bOOiQ1oWr/vJQPPVesBN7rMdykhngWWPu6en+9zR+Qbe7slCKNXeRy1j9SnH6okxc83WP
	 IbXuhJ/SJAZA2MSf56v2DoqHMnvLjO1YnTFeYkKxQ6zWEKK6B2S5xSrwE6hlV3v/h/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xnYL0DJtZZ3tlZVfdy8paYBQ7EQBD8QtAUTuaXFNMTE=;
	b=p/DjYT7PbvBpOHaMVu3I8j0yDd0GBx/DPGmbU1/gqcz6D4i0TjBIsN6SpVU/eiklfy2y
	 j4YiWRtjFjrkcPUoEvxV7noThyQxEAy5e2y0q+vG6mCaU+cSqvRXpSVmHlvArA9OHxS2s
	 1xlnGw+EnKYdY/0rzlLavyWljz81YNKIJCKmwvQrnFzEmVdqH6N0cQZdiKQlUlvDDevl/
	 bs5h9C4Pc0ykJzJt1LTaFzBvKH0KidoGU4FfV8eLrKmMEyyr5XVp/yUUMYE+HYkDm0PSI
	 XsDQDwglfWDlIGVvBQlqpddHHFhiAJ0ProoxtpTgisiTzaK8jfcqKAUN8pHjWt+alVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SB8Rtg1b;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D58606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D58606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SB8Rtg1b
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1376485e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794110415; x=1794715215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnYL0DJtZZ3tlZVfdy8paYBQ7EQBD8QtAUTuaXFNMTE=;
        b=SB8Rtg1bW7TaYUbYlOhqPK4aPjOwEWBhl/8/By4g7mUKToEUxzK8BuH7hs1lX2/cDF
         NXmcL0R5WFztCdsMrpI+KnYEvZ4chleCD64+b7uzOqcGjxybaq2rCuRg2ZHeFGvffre0
         +TmpIeECHOL3xmyZUOoQBRG5iq4i7Plqqe/L5GQOjMILNIka7t2cGcgqdNOszRqnbyhI
         6j42BvMdvwGPNHiQeQnsljI7D38INbXYiISVn9jSIvc7wsKHIBLs1j0f5Zv0dISZCF1o
         jHrDJZilfu/ySd+hxUSXiswE1MHu3PwyW1SU9l0g6ojrJ2EkA1mFmuPJlY6ku16BfZQ4
         48Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794110415; x=1794715215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnYL0DJtZZ3tlZVfdy8paYBQ7EQBD8QtAUTuaXFNMTE=;
        b=X3NqaV1y57oR8vDqoGU++h7Yhef27DkqoX1OCTzWvo7bR4yzM0PAZBs0iGYkbTwxMH
         9mH2xr3C0DmbSrtQ2fGMBD3Wy+RiQiXc3a0++pHOqB6hOHAOwkuniQmfMJB3EvTIKVwn
         J88hryWddnEMpWuOv9ZAdaXzV9YVzD9rY17lQAlE9bvnzaXSLXszHL3R3oaUb3HX2/fL
         nz/UHew6kMuv+whMWlgzNPiptbpQAISeTIo1V+bhQUvBDzymq1CuX5eI/9w08o7FFzek
         5EUtxY9mRDSVxfhuZEdNM8+RF9CSC+Nv2pXHBsGj110dOtm7R+lwSr5Hu+kNDsHp4Lje
         LbPw==
X-Forwarded-Encrypted: i=1; AL+hErE38xvcoy9qA0aja88SrITKn8eUyEuPwOIWneXWpsBLP2/37SkqbrtteV/+/EE9G1LXu5JGaFM2RDBW6jY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lWxHDDzzPP/gfxZ1e/sLBiK/BlNX3WXH1m8MUeywxmLTZJJ9T
	hMQt+EQ3RsqACPaSHuHmRz/J3WwWJDRIwr1sIJiJXMWPqBEmeuoygtI6
X-Gm-Gg: AYBFou1mNoh64ZHdNPJwEPf4GXUQRNaKevvATbvE/xhB0rvWIc46d5a8Hb7uXiPAFz4
	zMMCBV302jlcVPDgQz3yLrfBugp1jig1nIvTwqEtUg6ULRzH+l9e24H7hNdBCsfPNDgbUNYy3XI
	HhUlvFLIFbXbFU6bp5rOQwB+zDfrgOfpMRIJyxJCqWaCIQL0Z98icbUd9uSgSWlpc4iQOS1e2nN
	7mTUd3Qsb1dRH8DkENl8Z0xaaKk4phbS2hXZXoWKhTb87ZwEkzaI0tf6UkAvq8f+oUAmEFdJyAW
	+nXKbxaALnxM0QMaPBzDqrx55/Jkoh/d5B2x4mWXAVPkpH6f61zO0lBnDtcNiGt3RvlTU3p23UM
	qV1hxOamZIMHScNVaeaKA5osQlDZEO72fgLlVEBpNrKlFfcyAwQJ1MjDeDPNuc7XlKwIRFVEdvm
	pCorHkWqzCFzGOTmV5jvusDjTxUdnyDMCZWUazYOb2iyBk+FK8RQtLBrnA8gqYBHpMK/DD9jVHx
	6NORcyXtDcfXmGATMP7pdVIBCJJ7dGA31K5ggbdZ8QKPF9+I4QRKT3a2bdzFtig4rtxzcbhb4OU
	EgBKC0Wkg5Sj4x4hpfNudDuW7DiCDmoXkXXYgu4O
X-Received: by 2002:a05:6000:4028:b0:492:b5e9:4916 with SMTP id ffacd0b85a97d-4958373113fmr1368345f8f.24.1794110414849;
        Sat, 07 Nov 2026 20:00:14 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm1736310f8f.11.2026.11.07.20.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:00:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 03:59:54 +0000
Subject: [PATCH 2/3] hwmon: (max31760) Leave standby mode at probe
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-max31760-fixes-v1-2-a61450463059@gmail.com>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
In-Reply-To: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794110404; l=1405;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wEFiFQuq9PYuDNkpFDriR7t5sEW0+xVHTdlkclQYLRU=;
 b=7IeNYSGTtldUgyFfC6Kte2YFdZSIQctytc54D4Dda3FuvteH9MyRiHF8EmWfQszD+9T1aQKpo
 d8esftuSgyvBDUXwljL5sEY+bJrPOa+vVQLy/3E3s4igMzXFkBAaXMQ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The driver never clears the standby bit (CR2_STBY) during probe.
While max31760_resume() clears this bit on resume, probe only
configured CR2_ALERTS.

If the chip was left in standby (for example, by boot firmware or a
previously running OS before a warm reboot), it remains in standby:
temperature sensing, fan speed counting, and PWM output are halted.
This occurs on the Samsung Galaxy XR, where the bootloader places the
chip in standby during boot.

Clear CR2_STBY alongside setting CR2_ALERTS in probe.

Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller driver")
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/hwmon/max31760.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index e3d86dc4257e..e967555a21af 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -533,8 +533,9 @@ static int max31760_probe(struct i2c_client *client)
 
 	dev_set_drvdata(dev, state);
 
-	/* Set alert output to comparator mode */
-	ret = regmap_set_bits(state->regmap, REG_CR2, CR2_ALERTS);
+	/* Leave standby mode, set alert output to comparator mode */
+	ret = regmap_update_bits(state->regmap, REG_CR2, CR2_STBY | CR2_ALERTS,
+				 CR2_ALERTS);
 	if (ret)
 		return dev_err_probe(dev, ret, "cannot write register\n");
 

-- 
2.55.0

