Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847424;
	b=B9F8G2C+SEsa7GSqf1BARG+ZtKZcv5BjMgNYJIdGnzLfBdyudrJ/u4/NWJHk2pTZb5/h
	 DQ3SiZbaFDxQROKF2PTfIYPdBBq008Pu5hX0uWI7NkdyK/9xxX3u6eE+N1ZYflOm5hW0r
	 HAoEIq/m6mCmrhqik50ZRCClou5+EyC+KsuXVPyQVmb/aA0qt388u6ljDv9CXSlIe8pyq
	 98sGhf7pI6qz5rGAXdphWFdspM24ghAOsN3u20poD8w8ZxHystwoeYBOsofnUfXQSw/1E
	 EqmV0sNcQL7rdnAX11LrmTUy+nfDvSH0EH6jZiwLe1vYyVHPaKJOw6+BVbBAN0gi6qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=glFoeqTtNUfY2+mxzil5Yl+taLvoFmrlvPohUi507NU=;
	b=ti80qbQDArwM6NyPDjmCL0hbV9ZB+5iXKn16y3XPxDpZ+inyZXekMA0CIiO6/yYJ8QAT
	 EyQ0afk3RQXEwWvP39H0hzWD5d7rqiNel6niTJVpoDpvuXDSurIqoNfATOXox5Plha4en
	 VrZmagE6fzou32P3q9O6Stzn8P+cJVmHDi1erN+eA+rmYkCOk9hTFZ6OCYPykVzTyqIIM
	 /WrRoY8w204A22KryHVzqDfXPbMOqiQy7hsKitcIrwFqBLXTaKNsqZt/YpseCr9+D8nax
	 lC1Q7ygkU8bqYWWJdLNAhkmu57l5PhKJpJnkVDLG91KPOPFgAr58jzXwpaF01DcX6VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=R7Qt27yL;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6B2606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=R7Qt27yL
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C7D4C3F2A0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793847420;
	bh=glFoeqTtNUfY2+mxzil5Yl+taLvoFmrlvPohUi507NU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=R7Qt27yLogN3RdwhkZEmcyiyW6IZiEIXy5Zu80URZC1U8z2l53NHQULrfFmhvvgag
	 m83lobKsrmVgbMg/TZtycvej2pY1E630J62ZHBXdQTmCIHzwjOURDY7X89ulrc5e4K
	 ycE8n0+ntb9ullBhGrDttiRIDwZOH9Ia1cEshE49jjnrdzlWOTji2+wbFgtWoe+LQL
	 V/hRmOXPBK6OgKzQAdTbIStBgQW+LHMcb7WNhYxMCGqAASfVqsS/znmCo+pdfEciST
	 fX5E6BjS6THvcuZq6qOfFp7yzYjyL+Zh7x9nL7I75lYW+GWpNQ+9j/0LLq6UkWKvbk
	 fR2rRZEbFIuZ9sLVMMvtwtFBfm72GNqdBdsemj7qZRG74Q7GlBFhMjSc08QGbL92+1
	 /kBVQcI5bbGeHIKsUNt7K1DDd84BumEUvpezoGoGiaC9cntwKlkRQhGpFMWB1f0MQH
	 USl4zSQ22e59tcbCWY48fvYtmC6Hol+mh5QpIW76RU4ozEDiIEhLxiwLR2JbaSqrJH
	 MDNCHdoZbIPXNjpAk+f5qm71TvqAc4FiskyCBw+crER0li+2xTUeUh5HiYsMpQNWUd
	 KlJhNsLPRM2B4GIRFPsXN61BI2GLYRYlOxSPfAR+rhT9RSKmqiIoIFoGZyXC2+ze9A
	 xVfk7fQXJJGSf8V0e8np4gQw=
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so1925444b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793847419; x=1794452219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glFoeqTtNUfY2+mxzil5Yl+taLvoFmrlvPohUi507NU=;
        b=z7vWoAymBnj8V/Eu+kscNzdx3EXIsUKykQY8ulutjRRP9Rjfk1UYbV+2yVkpFkByRq
         lDmKfEB0rWnLv+7vs7Isf/xpc74paO8dCMcl02cz1PwK7N3lRUDL8XSEHlarijfYc+k9
         +LJBgc4CA8PnRCiKDHiWn6ilHMLqczzS0fVu/8bWihjKG/z0XW3aToF4i+45nB6RPTaq
         8PYLsHB8fCrHBd7/hzjJH7I4heSVI5odtjckdHi5hLYyYqGwCk4y4YBSKWFErivocJ8V
         X1kxSJmeAqa+Kc4k44iAE+GWOASXMxmwd//E78DPmQyBu6BbU0gbJoX2YIqvBzKRxIpH
         nrHw==
X-Forwarded-Encrypted: i=1; AKwUvBwkfpQbOMrIlkQ6wScHNgq0uu/qZMG2l53OIlIDzqN7Ka4Gx5JfyTi0O8YDKBFBw2quFMacEOCS3BxjwJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d3SFdkXF3utCz6qsvoC4zEy6b6rtwzIdM0VYeHJDvSpEILclI
	uyUU7x87igMW0r42GOue7eUs8+OXvvuCP3xVYoHYxV2RJwLoffc7COmZ0O7uhnX9dDh0Yl9fHpd
	3lFYfMRZD5XawiHmkCRZonMDYchlICzOKlHQXPL+aRQ0fll32iAbBmE7KyJH0ApBTFo0Cw8sJ7F
	YOZ2BQsf59RbfZEanK1nI=
X-Gm-Gg: AYBFou1zcgrL5ZvdvCGS0ZM8AiNFF5wWHgj561Diqf1wj/FPlZGfWtTtt7S798KFB2L
	8xw3LZcW5jO/8Pyp/EjM7Jq/0SYVqyCrLFKGHu+aK1RQQzOMcxpwpNKXtGIeg4Br58OGrlPHuPV
	4UIveHnrPqJGq1//hN49hKngvNjWQ2YZQWyCnhNYneC72fSpbwBSPhqnXl2yAwIYcZlnmoJtaQn
	e+RteHCxw1CshLM9X/BpCjvXf6CFf7SiPIhrVLQ6rQ/AMyDb4OI+tNcjTEtKyUsHSZiW0FK9T/L
	/QvNINCe5ZXyfxFTkK7DrBQLgk1qHz07maiqqxtua9HsWZ/o9Ax+BrKYjA00qhqypAjifRZN99Q
	mnNm397RnQKOpk0tBIh0ULRGB3FyRX0Ge4sn1UgF1PM2WxTOXFIpNlttBTrDxs1fUxftl4Ca9oM
	ScKQe4QS+zV37egBC4vjEIyYSOVBIj
X-Received: by 2002:a05:6a00:806:b0:886:bb44:631f with SMTP id d2e1a72fcca58-8a9bb79fb0dmr15642263b3a.10.1793847419303;
        Wed, 04 Nov 2026 18:56:59 -0800 (PST)
X-Received: by 2002:a05:6a00:806:b0:886:bb44:631f with SMTP id d2e1a72fcca58-8a9bb79fb0dmr15642244b3a.10.1793847418922;
        Wed, 04 Nov 2026 18:56:58 -0800 (PST)
Received: from localhost.localdomain (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b667995sm1399905b3a.40.2026.11.04.18.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:56:58 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: Use inverted mute LED quirk for HP ZBook 8 G2a
Date: Thu,  5 Nov 2026 10:56:47 +0800
Message-ID: <20261105025647.1116662-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
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

HP ZBook 8 G2a (SSIDs 0x103c:0x8f40, 0x103c:0x8f41, 0x103c:0x8f42,
0x103c:0x8f62) use the Realtek ALC245 codec with a TAS2781 amplifier
via I2C. They share the same hardware configuration as the related
0x103c:0x8f94 / 0x103c:0x8f95 models but were left on
ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED, which drives the speaker mute
LED backwards: off when muted and on when unmuted.

Reassign these SSIDs to ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED
so the LED follows mute state correctly.

Fixes: 9afbbf490322 ("ALSA: hda/realtek - Enable Mute LED and Tas2781 for HP platform")
Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7786e1b0878..b00036f2719d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7738,11 +7738,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8f3a, "HP EliteBook 6 G2i", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f3c, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8f3d, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
-	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
-	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
-	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
+	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
+	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x103c, 0x8f57, "HP Trekker G7JC", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x103c, 0x8f7e, "HP Messi", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f94, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x103c, 0x8f95, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
-- 
2.43.0

