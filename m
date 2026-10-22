Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690478;
	b=T/lobMBxBa3OAahe1MGrLq0LKdpHR3K5rMYHEShWXE4MS3jbZ5uRNz4MbDvlMHlKc0h8
	 Yo+aWgYMH1zFy0zMve9D631c7X7yNcm0x95YqltF16jSx2qc7pB7CcbzhiUSEmn/1ZfuC
	 kX0wL/V+G/hEcv15CNwJMTIaHPhgFTL7pSnrhPX61Ym1bZAl0qMhX5r1AKKMJTnmn8pV9
	 br7trClB36TkIHo72TPePiF2ppTNwCuU7zZOdiY+2+Rnw6ZJlVgADXAhawp93MrYnIB1p
	 bwgGWGU8BLCSsBphgwt1IIcua+dtR63QYQrqPfF/1F2X52M/jhZPWl443XhnUCw/RwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
	b=yw5Jw3PoEjSkGvULDFOAs3M9jzIEY2MAi0+qPzvdw5h/2ysyy88i/Y50StY+IU7JZ7VO
	 b+ayKKG4c3tQRNaz5EqVBHm2ixr9PKRvZE5tyZx00JkZAIV6PnZaBw7m/yI+bqY7C9/qE
	 ZCjvwq2GgLz/G0mWaL1J7fVTqDoGTmYVeSBGeZKydniqRXq/QJV8NeA1A1AT352xvZhlw
	 JZjKW4PpSHiXPkSMjwlyhkfsGGuba+eGSHhdc1Zzm0Ei2gb0zZTBKCyOD9TfpB+V7OWXX
	 5yvcQW6ZV/rk69yEpy7gR3jiPgV6WhxHdwKFNt1jcv1vQOahtSs9EwX2uK3dxbAFxrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=redEqoEx;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D41606A329
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D41606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=redEqoEx
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so673265e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690471; x=1793295271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=redEqoExeBfRPB4HydW2hut2CDqjFdcbosZhclRkDYRZsj0r3PNwR6k4MeKJoP6J2T
         NvEjW+piKiCzWFYDMcWAD4b0BnBVr1nr33fMTixOcyVm1nMlxPjhZceSCpxsR0a7/ILu
         xmgwlev7nIsAQdVM7n/9M/yLmU8HQeCdUKW6ksHJhnSsdu0BkocGKStaYxaa/U4WbblS
         2xrnWk94n2NwSKa39n7s8DP0axdnQIzTkbhR5X18V/0eAaYOTEEgmqwtynxEb8vVzzgJ
         gsblAOloKSoprmBR+c2APf/9RU7mH6QEDaXNsG2qRYCxEEt74UKRGhnU7nETP4ni9BEl
         rxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690471; x=1793295271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=fnkn4YVJU6lYOptYLSRzOmjgwjp5rSbcioXzEte07lrFwb2clPZHFlluumQ5NcEMH6
         V+0hipmtgvL3UssgKdYcC1BfGhH8USlqYC0XCBhEznErsk/Dw7EPNHxroU2HxNOZ5u3m
         6bqu90cmghgXsbAYbhrp5OLzyqYQr3Y+6kdZNm+F3JOXI9vTYTHi5bzchRaC/ZDdq0gP
         EvfykjpoABBrnef0IDmP1H0UNsbPT0CbDAKywi6GieuL3qyUEjIkrzQq48i6tHFJE00K
         ya1Ciqqd1XMhYHRYMX7qLX3YJQR9hi7nPyECFuLQqTFFvu6qvWOO3n5ABHkSOp80SxAq
         +Yvg==
X-Forwarded-Encrypted: i=1; AKwUvBywCGW91qeuor2uBoHj4HbcQ6sfETZTHm3I64WiHOf9qMh7SxBUWIHpp8ekSoLm3rEz4d4PgAryG3M209A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF8lSdPwwuVOdfXsq4n0JbwsNPyDglvtP3Yy3h4G8Xm+Fg7tO9
	3L9ffnsEet8MDUeHC3c1xim3zH/KxgchAdjwSO2+yVRBvpTc02+ReULUCO5ymkPuqNk=
X-Gm-Gg: AYBFou000JCJw3F2ufHrunQtVc8Lu7X2rpO0dfDhwFyYbqYUDVtBem/77fq1wz07eu4
	b/KIbun7oJP9gkK7j871XkpGYaQSWKVe4Nb5bPQpr+7oRXS4T+aqxtwTMEab3dI4l7RpyPeXmM5
	ow9IRfkcR4E7jR6kwh94VymYcyCv2t00Hy9Szm/Ob6yFVyBXPfeZ7jnE9g1NMpsS7RXQC63rwGV
	h4uewIVW711I6ZtMqiRRymMaA7pdCiWOcwVIhjIitbadRefmjDnIQcj1IRQ4KooQv/GL1ViuLrR
	m3IiwAv9PVecwvVAb2k0jteiqOkA56aFEuYYX9+kZwZ4b/IoQJQxD4sMVHewb37sNd05zXftzfq
	3NXn7TMBKq729qRfPgZrL9MBR2b/XnR2ZH6bQ17h7T8VKBvarnZySMm1RqxIexoJu9Xp5NMgH/j
	xNNrmftKcU12Kfa8YYFA+41f/xevm7T3IyIWxH4lESzkeb2lm/8s0UIibBr3EGg2Z7/bFU2zLQd
	WcLchFBPLkO8VwMgJlXhe6AmjiSIfAKzJ1TbLFR0Saf2zLYKRNfouN/WI3PxMpf/GzSbUwEktec
	gvk5AutNWxHwi0d4MqQO69F0vn4kOko=
X-Received: by 2002:a05:6000:26c9:b0:48e:1299:663f with SMTP id ffacd0b85a97d-48e264f1802mr13082880f8f.56.1792690470487;
        Thu, 22 Oct 2026 10:34:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:56 +0100
Subject: [PATCH v6 03/18] media: sony-starvis2: Always program the sensor
 in window mode
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
Message-Id: <20261022-media-starvis2-v6-3-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 134fececac5c..31aa1ec6ba40 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -923,9 +923,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

