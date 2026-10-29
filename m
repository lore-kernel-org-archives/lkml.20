Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793233351;
	b=EmWUP99BWzObGXoGb+QNBgZUgJZ29PUpBGDhjYFwjsRkd7sPiosAZIVlA0zqkSLE3wJ4
	 0pdBiaQ6AX/VGrgB7XNSMUHzJrMVccwhe6Og3w9yKDRNXtRZtLjvWoyPtU3iroJZGH1Dz
	 8liFI+kHl57s3GFU7dbBwIaRYHcxRMXP1aFr6WBOrinNjylhzYT+RCvSyFxDEdzWIJ5/8
	 pRV1NSkYRBgr0hWEH3MHd3nxf6vspUaTyDCZu12BIv6BbtFmvH9WLVLbMHlqMqMRarCIH
	 k/8V8UnFsnsRfkfru3vGATEcDBXNq/DX7H4UvuRc69hZYaLo7Xq2sDbYmfTsYHFm3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793233351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dfPBfDLUwvq86AdWInBVQftIi/RMxzYxDIMnjvA3HSU=;
	b=XfIwEF2myvTvkyPU+F/ZXI9Liq8J8BTAihc0T2bsnURxt/rHSjIyi9A6j/hogxPMns3h
	 Iyzijed5JA/46+uLRc4+DwKMsIm14HorJAeCpF9QU4bmx7Om1+jknV+KqNHzMKKRne+lm
	 8qODNYkK5UR4nbt7dyww3OBJqvJwz1JRXruUuM3c276hwX3clsuyz3ZDp27UIKm/a5uGc
	 hwMePw1qgBZjEsehGViPMHVJxMlNLcXTxQZ90hrMvcE/Y5FJKm0AWxdRXpLu7q+Z5hhHj
	 VeQPJEjXiPqHNl8JTrZ1rN+cDidQAMR7Er6ZvJ6LU+8rIMJCs0M6UDq0GI0xMC6UZEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E60gA0Fa;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6EA606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E60gA0Fa
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso12593745e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793233349; x=1793838149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfPBfDLUwvq86AdWInBVQftIi/RMxzYxDIMnjvA3HSU=;
        b=E60gA0FaHq71TzjUeWv1owrj0oRTiw01yC8Spwnc1J372yDy7q2ydrsBAQXSvzynlT
         kgXXXJ+RprS0ii9mxM4yXZbGnlocAFuyhGBwx72dk9MYgBD6O8KLLSyejs+pR6/saEjS
         +XiZl4QM17DIXROSwFOxY4Nlh8qGDWqngjQUC5h6urtKJt27ycL0ON9nIMxAuTt3Bcz8
         1gY4m6LKv8Y0eO2huShG8novUmrET+NKMKBPFF/5cydW6Te10cR5ALpmRWxnhiiACaAw
         knC4tXwKUMLxmA7wUgSTtbVgj1nvxC0gFu1yKeFcClnvcUcXfSQgrSR3vYeTDU3LWfPZ
         vDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793233349; x=1793838149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfPBfDLUwvq86AdWInBVQftIi/RMxzYxDIMnjvA3HSU=;
        b=RZpFP1SEWVaIPO79dqbAvR+MhpPx4jF/s42UAgWRY4XZPRH531n0UJM3lcUIaUSQSJ
         qkxFRvsLd+pL7nzB4YF2BhYmS8Vze2O0zvImCfUaPsk9cl8xetc/ksT2Jfexvn9FtRn0
         Rxzvbk7lV5pCi6ukfhz/QDP6C6lJsvPAUG4puT8YNH1BGcyzB6oBxPOGfxGK03xXr07G
         oGsAAuDJULhTxHLpe/RVaAdxzWanRa9MAx+soSouYnnU5aPmx6pfesCRYPIrYbbnEg2R
         oRYJh+Txy4VaKShn8OZdDGjS1Nw5W6W943+iIX+mGa/OJzaF7ZjEMmpyn7M1/WMwkrTV
         t98w==
X-Forwarded-Encrypted: i=1; AKwUvBz7C7NlbzQ9xwwY/O57eOJjm5xDc5PolyqOkngANEGknmbzDjVsQSAW1iZ5cmapJOFpoioNMglM6i8xOLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEN2kOD2IoYlKcgy50150uIOLgzKzrJ6MGhjGhATR5XRgFTjJx
	Z0aj8hqx+LzXgj7g7moK5vol+zE5rakfZZyhigkzlIAbmN495gJ9+9o=
X-Gm-Gg: AYBFou1JY/rKltaaENYpd5V31aL3d1bzoImDXAxqqMzOc+CH1L3w/CCBidvogPFZSVu
	ixDhXXir+bF/rb9AvoQgmadIZWDtAoIWg+RZfWiJXAScC8cedt2mkhzODelcqzMw8zj6zKBBKvZ
	ZSfCMVuXTUsbmqouoJQHAyXpAUnLIjOEVp6xicnln7wAhbcY0woK4Vlfw7QDlemo9VxUB0QYKI5
	zVRXsVZHkM0dwZ/s37OM3Ok9uTziDDV7FsinePQhN9lmQc3mq4My87ZQgdImvW+Rl+vLDK43eb/
	PIbNRYNZK8BK6oucCVlFs8308IHE9q98017TlWyTIOP2NmDxq+tpYRqPh+Nq579nXwuqzErh/MK
	8yfetftm384MKnR8a3HjAVAD0luRZohVUrn4LV7bB9d2fQrfPrmfoR3Yjb/EmvOxop5J/rqA9MS
	/7iRjAWyd/XEkqocAZe3UagQi92v9chigOa52HdpREZSwfhDbV43Kbox7JxFgf98tj8kuD/YAZV
	gypPzy8h+EJD77S3/8OhBC0evmVWSSh0v8CMsUpX1agtc0+i8Z1aFVNzwUtE0HTBE5wDjKfuA==
X-Received: by 2002:a05:600c:198e:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a967ba8856mr82938905e9.33.1793233348875;
        Wed, 28 Oct 2026 17:22:28 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92e103d91sm43014535e9.0.2026.10.28.17.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:22:28 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3] Input: applespi - validate ACPI property buffer length
Date: Thu, 29 Oct 2026 00:22:27 +0000
Message-ID: <20261029002227.2002174-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

applespi_get_spi_settings() reads three ACPI _DSD properties
(spiCSDelay, resetA2RUsec, resetRecUsec) as u64 values from their
buffer pointers without verifying that the buffer is at least 8
bytes long.  If a firmware implementation provides a shorter buffer,
the u64 dereference reads beyond the allocated object.

Add buffer length checks before each u64 dereference.

Fixes: 038b1a05eae6 ("Input: add Apple SPI keyboard and trackpad driver")
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v3:
- Drop Cc: stable since this is hardening rather than a fix for a
  specific regression, per Dmitry Torokhov

Changes in v2:
- Fix alignment of continued condition lines

 drivers/input/keyboard/applespi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index cf25177b48301..db8947b5cf11c 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -642,19 +642,22 @@ static int applespi_get_spi_settings(struct applespi_data *applespi)
 	const union acpi_object *o;
 	struct spi_settings *settings = &applespi->spi_settings;
 
-	if (!acpi_dev_get_property(adev, "spiCSDelay", ACPI_TYPE_BUFFER, &o))
+	if (!acpi_dev_get_property(adev, "spiCSDelay", ACPI_TYPE_BUFFER, &o) &&
+	    o->buffer.length >= sizeof(u64))
 		settings->spi_cs_delay = *(u64 *)o->buffer.pointer;
 	else
 		dev_warn(&applespi->spi->dev,
 			 "Property spiCSDelay not found\n");
 
-	if (!acpi_dev_get_property(adev, "resetA2RUsec", ACPI_TYPE_BUFFER, &o))
+	if (!acpi_dev_get_property(adev, "resetA2RUsec", ACPI_TYPE_BUFFER, &o) &&
+	    o->buffer.length >= sizeof(u64))
 		settings->reset_a2r_usec = *(u64 *)o->buffer.pointer;
 	else
 		dev_warn(&applespi->spi->dev,
 			 "Property resetA2RUsec not found\n");
 
-	if (!acpi_dev_get_property(adev, "resetRecUsec", ACPI_TYPE_BUFFER, &o))
+	if (!acpi_dev_get_property(adev, "resetRecUsec", ACPI_TYPE_BUFFER, &o) &&
+	    o->buffer.length >= sizeof(u64))
 		settings->reset_rec_usec = *(u64 *)o->buffer.pointer;
 	else
 		dev_warn(&applespi->spi->dev,
-- 
2.47.3

