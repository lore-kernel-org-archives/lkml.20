Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499514;
	b=xAP0uwlBn5AMxjaUF/wpUCtRNksPYL6EbJ3YCSk1AUUgau8Wor8I3tZ/nZFus0u7ESyV
	 PE6qeD5BU6XBE1coEKm3rtFa2gZY85BWQ1e74H5151FlMOdbLnyH0A7VtjftvvgSzXC8g
	 zgBlaYQltqASw7lm6t+Q6A3v62zPPKLY/XFyWnnkvSqdHbE25GBua6OoZd/7RMMe3LxlY
	 Bv4fCcMOXuKQxlipV1YS9M4R4WswI4UjK/baQkyTUUBZF40GVPv9aIichbuqDTQtYRYRc
	 7CTc6JJatSsLdxbsiwBOAbLsPqTw+LK8AAMWjs45iyVPfwnbMsz6+cwT9BbWP5+hV8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GqVMC0wC5O4rqtGbrG6Pdff5be1hDQg85nj0i72Ii/g=;
	b=PS8eXiQ1on5p9QKUivdtIl610C2QFQ487n7/PB1TKuWkuo5t9NjW69E5Rfak6JXH5NlT
	 ZMnKwrUm7CDVOILc6+MpMm9DivrsmF353YJ2Dl/pMiRjJEyCuFgc5uHiMP0CpTQfOtNWR
	 LBKWQZwRhNQzGHqdbwv9hKLbJ2sxdru+pwfRUXVO38kqLu10RbbE/PR0UspKfYvscHAnh
	 WCD7TywY1gFAT5sWPyMbK9nbp8B/plpQaSCfH8TDM3PIkJEC5f3uc9AsYCW/nY8lO1aIE
	 NCD+00Gywyg03FUNCMHQbFtDT87iCiyAR5Uy44OzKP8x9ZiKSV/VS6d7HZ9a73rQfBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMdNuNUX;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E98606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E98606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMdNuNUX
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so43969585e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499513; x=1795104313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqVMC0wC5O4rqtGbrG6Pdff5be1hDQg85nj0i72Ii/g=;
        b=NMdNuNUXSgyTtbIp1Px92Wy6CYT4KOpXJgb6wgX89IVDpHoiYLq5H46PE8QjI+60WD
         BYzg8cYdLB5BJCFJeioM6ktUkZ5hJGqFqII5TNJddyAbHC+zGM5HCx9aJ+prHEHOK5rN
         5hkMbwaDIUhnIDgZ0SFLKSRrUSxKTDcaC/NJ9lhtjB8KcY/14VQTtmzet3b4eJwypnOX
         875fu9USDLNPRYKo8OLfzIHOv15/2UJ+6qsWAp9SYQgnOgFvQ5UOynDfdhUpa+ZG3iAB
         4eZs0J9RtrQjQohKAvzrq0byVRLR+bUoPjVnvXeaOWa3hxJ35qsy7cWddzh0WdeOEMqB
         vqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499513; x=1795104313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqVMC0wC5O4rqtGbrG6Pdff5be1hDQg85nj0i72Ii/g=;
        b=Ta0NjYw7hQ/5heFkgz+BGDzAa/h4J881+sRmbtsDMF7M3G2kUTpBOcd9RDRkUD8ZIY
         KycWY92sOObb9RdaKvKYXBfIN/ZtnGs3novpwVHPAxF7UIKwQ9JKMGcZB903jWYpbM7w
         Zu09Lwn1A8pWHizQ4KaYeKY9CbW9tERjIfhH7ntOIV2BHnnRqGfr4Nn3a2eaJ0nUY2Uz
         D9It+L8NUKvbsj8ISwPhW/ybHy/uRV/fwPMkGatyry1zVc1FXkRIoZ3uYU9E1iae3aL/
         lzjBW2Rz8o2b+pFfTaBwGFpAtCBej4Al2fD03ZHFaPOvzV5/U4cf/v6W/iPL3TwRlbvf
         yiKg==
X-Forwarded-Encrypted: i=1; AL+hErE5wcJiCypE1IJV4yFL+CBBsEeO5z2NFgZ0zQWkI6wAkg3D07UUMlfJi7KZ4n1m6X7hup3aaui6uZpFyzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eZJlmZrMk3cRKExjJ3dxadgRvK2Og9ocRrshDMBH5U3xfdcQY
	RCE0ePmOgA6LlaxHuazZIYEUAU3GQUUn5piYxtaCaesD9Mv3Kqi+47Y4
X-Gm-Gg: AYBFou33hYRJYzOaMIl9AJu/G4mpQ26o/fUQgZkEu/YR3JYXrHS1N8kFa7eXPqWrZhG
	D2VNUCYy4LOJDCwpu7Il4vDBzu/buGdDE99u155GsUhB6TS0uxTGl8s6LTf4SkWkXWOzaRDtIui
	zaY0OlR6LDSZe2Tq2TSRevLAZvUXJqqr8iuu72ua35GSvVM2P7yP0qPJSMe1vG9vRDz5koEpERx
	SeFjuKaQg0ZkOavmxoOKikaseMFyZkanvDFZK6HifQ2xEKVhqeKcu8CoF7dci+tAegDZPYz8T8d
	H/j3RPezRi/YfQPH5ADwrjM7BfS0rWpXypkZDdsYKk240Ez60RnFGR//k+1nyd0LyPCQdWAq7Dl
	ycLhciAvvQ0Y87Eo+YrKScsxebWsqkmcKcZxxYB7SkuKbtPQr88YkVF963N9GJY4QCdFgyzLFCg
	ldFaek9B+Z/QDG0boyeHQr6xPiPVVyuevk8uVt5/HS1UKLgQrL3+x7xMXKgEfR/oZDGBP77wnP0
	Ioni5a5zQh7wif14iXdpjyxPRILr9/IF66wHZ+1+7XwhKbIZmknIp0GYCNnH/FPaBcCMKwGeihw
	Np8ZtLOQIJbFpb0layadsQ==
X-Received: by 2002:a05:600c:3491:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4ba093aa693mr118356885e9.14.1794499512628;
        Thu, 12 Nov 2026 08:05:12 -0800 (PST)
Received: from sd-lap ([212.104.214.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm88361955e9.10.2026.11.12.08.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:05:12 -0800 (PST)
From: Shady Abu-Hussein <shady.abh@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shady Abu-Hussein <shady.abh@gmail.com>
Subject: [PATCH v3] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260 to fan control whitelist
Date: Thu, 12 Nov 2026 16:04:47 +0000
Message-ID: <20261112160447.136279-1-shady.abh@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111172707.84072-1-shady.abh@gmail.com>
References: <20261111172707.84072-1-shady.abh@gmail.com>
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

On the Dell Pro Precision 7 16 PW716260 the firmware fan control
cannot be overridden using the default SMM method, writes to pwmX
are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
policy also requests speeds below the minimum sustainable speed of
the fans, so one fan repeatedly stops and restarts every few
seconds at low load.

Add the machine to the fan control whitelist using the
I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
disables automatic fan control, the fans follow the requested
state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
pwm1_enable restores automatic fan control.

Tested on BIOS 1.5.0 with kernel 7.2.15.

Signed-off-by: Shady Abu-Hussein <shady.abh@gmail.com>
---
v2: Use real name in Signed-off-by instead of a handle, per review
v3: No code change; adding this changelog, which v2 was missing

 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5ec487843..250d8c1e6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1687,6 +1687,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell Pro Precision 7 16 PW716260",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 7 16 PW716260"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{ }
 };
 
-- 
2.56.0

