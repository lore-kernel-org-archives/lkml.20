Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670045;
	b=2c2BShAhJL2ug0K5zJsjzaxV2N32gg0781lZlbV3TtPS1Ob6MXQaNNOkPBB4MeVmTRar
	 VTT4Sb5f2HS+grIh9CaNmXNgBWPYWneaoJTYi66GMBksdFDdl9nKGfqeYsEZLGiSS5tz2
	 SFUvlY/5fz5Q21H0l4sb09MmT3s//ae2G57nwbybn2Hp4l/cp3OeRZGWg7VFO/9PwfcX7
	 do6bQoCnBTqt/6adWL7meXVRXllv7SqpOvKJ3R7i2o8fdou98RF94PH/xa1jbwL9JlfBX
	 sCqgxqXk7wR4SNVl+1OkfnZwMxy470gadWpvuFXNB1gU1UW7JNL5MYF7Bkk9OVSJhjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZrTU0BeBuJ+bZ8aHoVR9RYjt+cbmEA8pWQyKk/SbD3Y=;
	b=im3rMNWFIhwBRQ+NCSyh1VBIaorFyjukyH9bvrEc4fgF95lx/jfAXxgtYETcklaoFL1h
	 mK3kZoJndFtrnYEC+vmRB47GOYObEgXnjpxR7EyrGWEGXybKJUglgheAiraUc3wDq/3Os
	 /iqVeUmOB7UGPj33I3gnmJm1To97Ak3SlSSv1liD2jF7ZAwgMV4rzC5St4RqhHrhvV4AA
	 +PH5aepMlnqPewqfvtVeIKNIFjHod7/Ebv7vv5dzoiq5UXgIzDJG/bECU4M8WuXaPEVra
	 +XxaVpEFS6rJ6xiGL1ZJvjOF+1G9EYCBljB8Br+c8Z8atfHUMk1gk4f93CVrjGFI1Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AwcHLmmi;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E8C606A332
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2E8C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AwcHLmmi
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so12361575e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792670043; x=1793274843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrTU0BeBuJ+bZ8aHoVR9RYjt+cbmEA8pWQyKk/SbD3Y=;
        b=AwcHLmmi+l/2XjY7D+d2z46W+OqYVSpb+vE6rV5nPDDVtiqA/LqXxy7+rMDWTrNikO
         F0RF+Q6nMWGCzIC86iqTcaLwp8f96CF2U0sbCyNHwppZfNh/7x4pkEq0aVZQMhUezIKj
         iqz4p/DzLilVSURkVB454AdgDXOX6Jy56DS2yrr4YL8f6bLzVzRPMpW+CfyNPytTo2FY
         McRCtkGfYNexViUUtoCAUAfi4XmaYxjz3uHMvWr82cmS1VLyydkqQYyMHkzW8v1oCy6d
         HuCEW6oaYh00gyOKsFGG+wLYUaEwFDd+VeF/tCKKsqhA05KRlbaBel7Jv4PXMiErktGf
         zInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670043; x=1793274843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrTU0BeBuJ+bZ8aHoVR9RYjt+cbmEA8pWQyKk/SbD3Y=;
        b=gDj2SfNh2rxGsws+b3kDN1X7nbCb7SfIOq07V3BrIi8BuPXhQXSxIqNPADDm3jXHCU
         5xLG3Qhuvju9YXLyswKCQ7kzsBY2nBGOqYzwyL0ZkVlzW1cJHJJDzoYv8o6Qt7hsVkuX
         0J/s8BEgymJgpLPvaXXh4R7lAmB5/1mXM46vjn7glS9ESaLB65ILePAjG3Es1FJLY7Uy
         EFuSoY6TXGmilS+s24aZ+8v7+9U6e+AgnkiK4ssHujlFvug5fScA22Ae2jwqAyZYLls5
         SfaAk/Xje4jmd/E5oFw0KhyvBUW5X7CGF7UICJSK3PE0KS2LBeUqKXvuCnGCGCZ+uXj7
         dpjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKzXFXEFtS6eI6NiBkeXs0XtJHzcJIbLwy6ouV0XadUuZbZgxwvT/YM2TRbzKGddeXCDbLeg+Tq8oSjtc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdbd6eh3NU/LyH0gIlclcmRquulBUPWV1QWsQCcUyUyTVCvxC6
	UxWKRHLZV+rBpjwUTVso9qIJJMSVCpad0RNr65FDoQUGwOD68EuNJXO+
X-Gm-Gg: AYBFou2RXHlbZJHS6tMijabocQ+M4B+gT/VtmeyrbIo6udBlKGuGEUyNrTiocE2mjbK
	+J+2mEIlZRfZQGzi1YaVkEU3vo1G5O2Xbb5/iX7KzOPLliC2x2KnjBPxChYsDVo3WC7CD4YxNOl
	G92fdeb1Y5GInDNcpE5b3kB2ldWnHKU5rA6tdkFfr0hbvNNTuFz7HEacBT1MvQ7Th0mKqxgh+iI
	QJTCHZrUn/pLV1SDRWjAoBbv75yxmlmG6RkGLToFGi+WK4ID2VXAqnsJM0fT/h0pRX+F1fWj4Lq
	mJfSEIrE4fngDY+XTGUOn++9E7pgTKQ85kU0YQYhvyr8u29eweyPGXJElKfsJBhtOqd5h7uKE/h
	7Iou+y7ic8SAv8sDbcEzH2W1qScMEwNeS6HGQn7XSa6uUSNN+/nsh3dUiZH4e2KJ1hoILhTIH2B
	VnMDfHckaWaBUhs4KZ3vdp8IMnh77EGiUBP5USivcKGXoDuB2PZle2a0LINBtmILxyZ8Usu9ATj
	wIdWEPmxiMNQkvUyL/SW+mB5yTcpHrCr7d+0PXdomm8mVczqPFJsrtsQfdASBM0ZUwRnXylKagx
	1fRsPJWVYw==
X-Received: by 2002:a05:600c:4684:b0:4a1:d36f:1ba0 with SMTP id 5b1f17b1804b1-4a1fdd74b6cmr103524945e9.35.1792670043037;
        Thu, 22 Oct 2026 04:54:03 -0700 (PDT)
Received: from localhost (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584afe1sm13621046f8f.56.2026.10.22.04.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:54:02 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
Date: Thu, 22 Oct 2026 13:53:58 +0200
Subject: [PATCH v3 2/4] iio: light: tsl2591: add I2C device ID table
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
Message-Id: <20261022-first-patch-v3-2-b792e89a429a@mycroftmind.com>
References: <20261022-first-patch-v3-0-b792e89a429a@mycroftmind.com>
In-Reply-To: <20261022-first-patch-v3-0-b792e89a429a@mycroftmind.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Joe Sandom <joe.g.sandom@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jan Remes <jan.remes@mycroftmind.com>, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0

From: Jan Remes <jan.remes@mycroftmind.com>

The driver has only an OF match table. Devices instantiated by name
(e.g. via the sysfs new_device interface or i2c_board_info) have no
firmware node, so the I2C core can match them against an OF table only
by comparing the name with the compatible strings, and it does that only
when CONFIG_OF is enabled. Without CONFIG_OF such devices can be matched
only through the I2C device ID table, so they never bind to this driver.

Add an I2C device ID table so that they can be matched.

Signed-off-by: Jan Remes <jan.remes@mycroftmind.com>
---
 drivers/iio/light/tsl2591.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/light/tsl2591.c b/drivers/iio/light/tsl2591.c
index f56d31404c25..8cfce720efb9 100644
--- a/drivers/iio/light/tsl2591.c
+++ b/drivers/iio/light/tsl2591.c
@@ -1149,7 +1149,14 @@ static const struct of_device_id tsl2591_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tsl2591_of_match);
 
+static const struct i2c_device_id tsl2591_id[] = {
+	{ .name = "tsl2591" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tsl2591_id);
+
 static struct i2c_driver tsl2591_driver = {
+	.id_table = tsl2591_id,
 	.driver = {
 		.name = "tsl2591",
 		.pm = pm_ptr(&tsl2591_pm_ops),

-- 
2.53.0

