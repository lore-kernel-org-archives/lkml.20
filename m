Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732139;
	b=OYYqw3hRgCs/W1jqaWeDv8X0iwWFsltMGhRepNCm1/MbWuW8JdIYUC169SxlNBlPCZq9
	 QX4xGg3mw9bK3HXiagNzM6KgZpE4GW36Rt0nRhbdHLbrgS4y9W+JtW/rN9mri+syQDd+x
	 IYm68cyo0cbHJpIsh61yMvVVbDyJlyXxAY7qkYX0ouf4jqX+0mhnfBsu8iXaC0p9diPHC
	 MQmkCPTwUWpQZO3o8mg6eaB2BsXf8BnZRIUwFXRCJiju3mUXSIsrJye4IVp/J3fWwBqkg
	 9+famQRqzfz/e1Mb0RhbjpGHA8zW0v31l77MqocxNwYkyiuXR2gkJJI2MleR03wVYbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=53wguHLW3cLcQzyyPPD75Tda+cMWiySwa51kbwvu2UU=;
	b=tYDySnwhdPb3PCe6dYlhgHjjnMDnw05w2Eu7xcwxZJcOz8lBpFgjkAGJrov0bgZqIDlA
	 cD2VsEiMDyo0cgFvw7og5TLx0muFEvdly1YT0CEHe89pjRL0RSRqPB0XED7rz9cyv3lQQ
	 YU5fIM9KzHDwUll87kQYo3rQiAWKZnlheC+M7YfEf7TBrm9fJiXkbllgHKY+kX6cY4ssv
	 nFqemCWBssRzNov+WatVno/nZb5qPpIDNTikkYVLfWhUNWipP9hLhaQ2x7FQ7TTbGKEG0
	 iiD/91TgMK2m7JKUisVFV0nbn2sMPaJLtTjWCVyV5ngZbnYO1P2bjQ5ir9HZ9yndzkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gL+GuAYI;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9C606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD9C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gL+GuAYI
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b056d58f2aso42837177b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732138; x=1794336938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53wguHLW3cLcQzyyPPD75Tda+cMWiySwa51kbwvu2UU=;
        b=gL+GuAYIepInqX92HWra2fb9t08+90isckYecQT6yo1uEo15tsVrZh0+ICN8Lio5hJ
         CwT/RtInFpxA+cCjl3F9iy+BfLLM1b79CIjYUNkzM2OYH60a5hSUzcqtCu8bvqvcQQHj
         y37iXrrMClocjSOGEzTWcoUBVV7UhqOx1Vxato2xA3jcjsM+PnCxd8NBc3mOz33JSKWE
         ooErB0z2mGIOELMhbbIhdlmCDTn3x7Nu1+R57Vy5LzGqe/VxnRCTVq4pX8GuWBmGwUt8
         12veGUHUKjcJAw/Z6KB/272Sbj/18VzPe1gJbWOdIwSpCV2s74UZjY7SHzA7NjUYdPIQ
         YlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732138; x=1794336938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=53wguHLW3cLcQzyyPPD75Tda+cMWiySwa51kbwvu2UU=;
        b=SkPtor54pDCH8Yix6Srv9s6i9SeTR4J483fqRnaj1lZS/Ciew+qojwv7HhLusmBh7I
         aqVTQxoTrHDTzQ3XEi/KcAM9lK5OuQcAMUO77S3eJatngmAiUrDV2teJ48SJbmU6nuFj
         0CpKUmNVloaOD/TXHzYtetzJGKn36mFmygSity0y4n4fFmlQt1yUqCbael8kiGRTKu31
         cOMULLZodq31CBmg5Kk2JZ+aE5Pd22e9aRlWLxFNMTngqJVHZyz5djMgn3k1cfibsBQN
         V+ko9LANUfBhqaRo7ttu3J2NYR7gMo5JlFF+nFMF0gFguy/4wc4CZNENUjD5q8PVeRIY
         h24w==
X-Forwarded-Encrypted: i=1; AKwUvByIwOLC2axj/KdXku3l8YAbLOqvjr5MAk1rBa+XNmsrA/JVH9BRpByOulsTbQAjafWCrKtOzod8RqQRzic=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u35lk6GK/NXs7cVMRIeNgnI9f4/kY2vovRAQVlqnSG2a5h1zt
	CpqMKG+Ar4FfufIj5zKuVNvzvPjKZICC14xCtruBndBTo211jWLKJdMl
X-Gm-Gg: AYBFou1JQOfumrGBPBxgR1AwPnGnH3+Ot1H6uBEXuqpEtDWlU5OwUgikB64U0GJdKAD
	m0FJ+N1A+diPwSI1Qj1nFJxJlGPWS6L3EaNIaeC93Bm/RJc88oFn+c7QAP6VUXGuCLvyUyLatRL
	1izeOlgTn/dVEAbAisPbIgQbWjV561G0hhnHKxM4CiispMvvVbTzwJt9Dz97/KhEL5Qo+PCEfga
	jz6JFGjbjx+obcWsQ7UyyRfNQYy16dBiuEgrSj8dHxp3HsxTCfy5c1L1I2llp7C/THp/nuWPRNN
	2thRfnpPFzaRh6cnztSHxtXkQOz39WSh6m9NAKklHEufvNreJ+657z2GAtCybZ06T8PTwXrHo24
	r7HZcJURw7aXVq9uLpNtf3ebQk9q6aTYpK1dxiE33t+oYlpuQbbyFtk10uuuowyjpFpAf/ZFakV
	A2JCTykVCey3QKaMR9G4HHNa6a0DzhXMtrnzzyOXfqidVvEuLc8vvZfImBVLEn4076jWaq++1IG
	l9Ak48AvdsLEV2Djc1lGmsA5Gvbny6AVBNYip5J/5LzOLtZI3k+V2jqf8jkFzTc/WeEi73STDqr
	wbTpuF+M+eKDe7HomMB6pFfdoEvu7CIv8elEzKOuf97nH5qyxC7MzIOFkTPElIaqTQoVnL1f
X-Received: by 2002:a05:690c:7008:b0:8b0:fb9b:8d0 with SMTP id 00721157ae682-8b2b673ca09mr70118887b3.50.1793732137456;
        Tue, 03 Nov 2026 10:55:37 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm2880387b3.17.2026.11.03.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:55:37 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH 2/2] usb: misc: usb251xb: configure battery charging from DT
Date: Tue,  3 Nov 2026 15:55:14 -0300
Message-ID: <20261103185514.72144-3-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103185514.72144-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Parse the battery-charging-enable port list from the device tree and set the corresponding bits in the hub configuration register.

Keep charging disabled by default when the property is omitted.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
---
 drivers/usb/misc/usb251xb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index fb0693742f018..166eb541ef161 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -577,6 +577,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 			      (wchar_t *)hub->serial,
 			      USB251XB_STRING_BUFSIZE);
 
+	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
+	usb251xb_get_ports_field(hub, "battery-charging-enable", data->port_cnt,
+				 true, &hub->bat_charge_en);
+
 	/*
 	 * The datasheet documents the register as 'Port Swap' but in real the
 	 * register controls the USB DP/DM signal swapping for each port.
@@ -588,7 +592,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
 	 */
-	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_57 = USB251XB_DEF_BOOST_57;
 	hub->boost_14 = USB251XB_DEF_BOOST_14;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
-- 
2.43.0

