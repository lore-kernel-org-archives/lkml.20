Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543908;
	b=3E/mQ7GVX7YMQoUiWW35ON49mNU+ldI20SYAZTqsUQND8/Q+C19NTwprM8HrBYOooXjR
	 JWLb+ZIYe/DiSjj6iaXa3VMq1dzTMFoUj3WcRKvRrhMRSYL39cnz8CIGk7njH1g+KHhl+
	 qfSZaxNXmeuVrojltyWbuqR7vycrwmK1may/pdWaTGms4hURfYxvdtuGO29fU7YW4ForI
	 bdiG7YL28qVajQknk7WBVmGGFoDjryZEUE5nfN5PHtffpiea10mjTuB1onnfuaYaW1b3E
	 KTPTBG1OqBpXtFpBpACF2G29sDMFVqYUiRqMPovO2mbQkxDMcIM5iSJfi+/fbVloexQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yj7uHm+i6moRPp1T/k/KtCZpjWPn8bcWSFuA0A8wuVI=;
	b=vgEMxZWrcvxcmZDofUsZpNXu2VkkdZVOOEJmKKfdPOs0EWed+myYvfPI/uifZnOGC4N1
	 RxOUg6W1G0eU2OctUh74ZpZlUbc871gBEINQj8XZAkgDoXx76tt778pprDx7wpbnE+Vsn
	 +TvXR85wzTJcSQAQCh9TAqsKj+eZUGwKXccJ1OsZoyimmOtXg5OjRL0Xs2PJrX1i+3NKl
	 ZUbQ8ElH9jYBqVOj0lo6onpqUJs/rIellqLU4bMf/IoIaTYvO/pyhmNSivuAtZORzLRY0
	 UVmBNWGz4Z3Peh0Oukn1bqp4X6kAwXR51SXUCbKjK00JFpKP1H//+mNa7EcysLzK41g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZm2TLGX;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E226F606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E226F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZm2TLGX
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a2551d7b5so4203895eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543907; x=1794148707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yj7uHm+i6moRPp1T/k/KtCZpjWPn8bcWSFuA0A8wuVI=;
        b=YZm2TLGXk3iUa5GS57Vn23sf5WFeg0RVJUwNmU+aOqDVWLnV3F5iGB1X0JV1SZMfdY
         nhxUfU3zqQ+pC9wytFmv1h0tpGp8sf62VCVfM1xpBTUGIBG1xbW1I78DpUwYMC/McE9Z
         XlHErLLDloDrcD9zaAcz6466PMCxwGaz6NL6Fy7nnmC6LT0AiPrIHxfU7WMgV/V3LPYD
         wLoCIOX9PNJDxXSI9v9iRSxk58SbR3E3k95xJB91w+tBzszD0KIehBG3zBxOgy7C5piC
         IzdiTycmxGZesXLKN88R3su+C804/WXUkDpZ/GvXAquEmIaKgSotWtdSTCsaI0ltiHVC
         vk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543907; x=1794148707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj7uHm+i6moRPp1T/k/KtCZpjWPn8bcWSFuA0A8wuVI=;
        b=zPensU2jD7KSFNynBbeZ+4j42VCPY3/sfQK9cyRdlRUG2ghCJKU5dSI9ATAQmj0LW/
         umqU9JUIrYtvHr6vS4wHHv+qLiqug63Wyr7SuOJX/NLSxafRX04XOEWHa7t3Fghpf1B6
         Hin1NQn2PIFyFzh0K9InzNVEWlBhQ1KVGxP8ICClaPjDZlDhBdmGFsar/GIeInTl/Zde
         23Oumc1wdLTsvZDcENEBZJmy2srZrb5W4dCKTV8pvCPRpgsFlyop6+2D+fm5PxgDEBlb
         xBSpqtJnw7vHguqpyhUAEN2oNhrWkLFT7STw0Rdr9vG5XBE494VRfpgXjeMRMolUdEYx
         Oggw==
X-Forwarded-Encrypted: i=1; AKwUvBzL7jIv7Q76iLquEQma9t+cGmkvHtvVildtX70egvZJrRROUGmcmIvYXZVH4NY2ViY6YFCdwCIKmrinyys=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyMNi1RCADYBXyl8F9/6lRnyApdtUeoYVs5lr1eNq56Eg7aN1C
	c6Bsdff0uz5OHX5DJum11ISOoWyB4ICEJ0xo+4Ai6QUdCxecnB0SWRPb
X-Gm-Gg: AYBFou2xa99PDwE6UzX70yuWxIB5ccvIkfjsE8UPjuUqWEBpPja37GmX/2Dv7pMGi/1
	oMswDkS2cw3xNdD3XiENbZNPfXPGjwmIb+/UBEQxHcnhd7qsMNLX421PxCkX9Tvqd/MV9xUD+HX
	q0o6T+zxRRwcYH3BNP7PafRgk4e74GFQJ7fh2CFWbj9AtxzhEeDnlFowPPAUDEjQ05aEN05Vooj
	0QD/g74v1rQvtwf80bQtceA3PU7NJLC12fTHQRG3Pepu8LtRBXC82HTUHicAhf48jVnTBT6vpH+
	0BuTTvB+7Jt7KCv8NFkzTGoLF1djancPcPc0pUYU2M90Q6ENDFLBh2j49piOiliZ8dmXX+r8Fa2
	CTzBStiUM2meCOIXMz7hL9uul/whx0JU2dIx8xCthY7Oy1zxLVg5h3SJwiDWrkNKEFcsWWfFEbX
	IFAsfhJLq2tDyv4z6dU61M51nmNxjF4BtKhMFCR0VE6HsJ6sLCp0UEL+dUOpo9NIMdvpi24vBET
	V0lvkSdwu5Fiebs2qQBZx92vDnvrPFqH016SYspB/lhjcWcRiNrKh84lpF9Kd/dMRSJ1ASrwk0L
	krykKzy3gSCu+UBTrWfVnzbv21yWysQRRHZb6ohhbYl42KBupe7hqQEsf36t3ZMVziIwOSQuioW
	mS5xf9G2wUnmQNYLJ8D13hNbwnXnbMTq4
X-Received: by 2002:a05:7023:a4b:10b0:159:f192:5290 with SMTP id a92af1059eb24-1a9496c2a81mr14598214c88.13.1793543906838;
        Sun, 01 Nov 2026 06:38:26 -0800 (PST)
Received: from puter ([49.207.217.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm24898966c88.18.2026.11.01.06.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:38:26 -0800 (PST)
From: Shivam Madlani <shivammadlani5@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Madlani <shivammadlani5@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP OmniBook 7
Date: Sun,  1 Nov 2026 20:08:18 +0530
Message-ID: <20261101143818.17714-1-shivammadlani5@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The HP OmniBook 7 Laptop 14-fr0xxx (PCI SSID 103c:8e3b) uses an ALC245
codec with CS35L41 amplifiers. The existing quirk
ALC287_FIXUP_CS35L41_I2C_2 does not configure the speaker mute or
mic-mute LEDs, leaving them non-functional.

Switch to ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED, which controls
the speaker mute LED via COEF index 0x0b, the mic-mute LED via GPIO
0x04, and chains to the CS35L41 amplifier setup. Also update the model
name from the internal board codename ("HP Agusta") to the retail
product name.

Signed-off-by: Shivam Madlani <shivammadlani5@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23329d5887a5..b040cea9c268 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8067,7 +8067,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP OmniBook 7", ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e43, "HP Laptop 15-fd2xxx", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	HDA_CODEC_QUIRK(0x103c, 0x84ee, "HP Pavilion AiO 24", ALC225_FIXUP_HP_AIO_SPK),
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP OmniBook 7 Laptop 16-bh0xxx", ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED),
-- 
2.56.0

