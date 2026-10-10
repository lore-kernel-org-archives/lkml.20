Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AD64B203E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658485; cv=none; b=lsgQ9E3nGFatDLJyjRo6OA8fIEqNkz2UhyR1caqQZ4PNgA6ne0/QJTWQyl96sUBfGcUTnllSX0zHAec3leUtpP3XOxNzi7z92yetFwF8XMC2Ousboyat3XlNnX8R+RRK1PIoc7rLdlZM6qSrvxLIWLbTpgerUOr/p3Serr75lMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658485; c=relaxed/simple;
	bh=QQRHWjyPNyIITPP2PwUj7WZ8wO1dc8TgLBYknU/SRzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0paXqGnS5Sd7nGuI1gZM1fcKuYf1xhwWnTcmrFTQDHbL3jA6rdK03170zM193AjlQF4ICPuzN5Xw2MdIiQwJ0ooU9VQciYzdUnN6DeLY0afIAr/vOLt4BGAVwqNEYkqDIdIjcwYmAWCmifQ4m0J0gIUHXO5oOCDg+KG7GRJEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFc2+aAR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFc2+aAR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e4e7351e8so12739666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791658482; x=1792263282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zC8r7BpcEUOH057Mj6oLoV8CHutZoLN2FJq+teYBUzg=;
        b=dFc2+aARihozkt6/mJWv23xFZmPabTo/I8G/HhgLB7SOAtEcKQavgQckMISx9tavYo
         EqTYWEF9Gj3zk3a8UowNO7pYtsN6xrdnE3tPPPfjwKJ32yVZngd/CFSwUZSLd+cRXLgG
         vaQ3vd5Sxf+cFOyZwysdmDrmg141Ql4IgK/hAhQDSvrdriJ86dfhc1Vw77UUZ2Tfk2Mr
         A3oEmZJYL7QVf1ng0cyz3j5FQSCxui5bjnodC7RIEOxRdkg8VYZ5g2kLCIgSXFluZ24T
         ye+p8NaEw3CEZJR+tGgqjfS0m0PGiVi4CqaGSqQey83KgbDI07SruHypd1b82/moSpBq
         XfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791658482; x=1792263282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC8r7BpcEUOH057Mj6oLoV8CHutZoLN2FJq+teYBUzg=;
        b=nx6Tq8c1ork3ugneEsTnc2Q3O5dqTg5m9V2GafGJy0DlLGjCc7E/fXduQAaE63DkZl
         +b9sldu5z40aNcSiGvvZPtONZlCGtpm/SrTH7NB0tB7RkzN9W/GTh3TwJ67687REegEW
         UROElmtX1yZNB43TbBioGXIjh8Ywk74HbEJghEpH0r/pcdideM5iH1d1xB8TqjdsGfft
         G1OlSgxwgudcHPUAo4Gq8mLEqCdAbJA4mzAzwzyswmbMlIHpPbNeAdgr47T1jWdh1VPp
         yaQr4DssARmJW7qURmlF68Rir+QTldRAMf1L7uepwmlaM2CN3kAkbehR1g4R7DdyHgz9
         GjCg==
X-Forwarded-Encrypted: i=1; AKwUvBwn4sjvTDSUDEB+AqnMPUiCVQfGeMGVqFAD2ZhXR7T+2XgftI2LP/75NakW7hz69r+Sd2LfMKVdR/hsfeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrIotCqrRCglxVzUI/dHBkW5viIPaxQHf0srAK/CC+cNJ85m4Q
	24+0mSy//AOBv1opI8T6f+Br2cLlC0SGGPXAVuIUVmTq/xeF5Op7Wk7u
X-Gm-Gg: AYBFou3zkZnLPjAaL1+YswO5Cn1kfJN0ldG02SE0E9kNvXUI5j45I/G6t8oteIRIoid
	JeEne2f1Rcp0eZL62UDzT2jQF96RiZeX1hMJK2mngOxezfwvVhKY2x4OPbmVKQDqGv/9KKqQ6ap
	9WEuugMP4Akk0JpAN4tIApfdVQ7LAJzrcB+j5lxT5D6dnPGfN4WnFf161D5v4lhnRsjC02EFhkQ
	RohMUaOEKHAVxUXCjBYv8O87vccrfBpvpUX5Q3LB3jYUpvLJCcANreh/204BuZb5S2MNcpwMWWV
	gUt/Wmky826hqY+sqoPu3sNQvT045ut3ttm4TeD8IHcfCacgMZmH02r4uuVGdpVkhmJ/7LcWjo0
	CI0it5hC6q4qAEaHuEoElvmrOpuvDPpHPQknXY1/fFmTVEPFBfaxMCNABX3wCH+NFIFe5xfK0w5
	pw09waw0ummfofryZJkz0COI1PZWZUlhDPhUckKfJmR5wCt19lUDtC3ycJJtE/qzTTO7/8IgbYK
	Ek7RPoWEX3tJbJk+1soyAEtenXIbWNbDhsj8IurpUyCw7Ktu0I6cvhQQ6PWzxKHH5bfK6XMf+E=
X-Received: by 2002:a17:906:c142:b0:c29:5700:37ec with SMTP id a640c23a62f3a-c31aa023070mr583160666b.3.1791658482158;
        Sat, 10 Oct 2026 11:54:42 -0700 (PDT)
Received: from Fire-hp-envy-laptop-17-cr1xxx.home (83.9.167.187.ipv4.supernova.orange.pl. [83.9.167.187])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm269012166b.8.2026.10.10.11.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:54:41 -0700 (PDT)
From: Maksim Krasutski <krasutskimaksim@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maksim Krasutski <krasutskimaksim@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute LEDs on HP ENVY 17-cr1xxx
Date: Sat, 10 Oct 2026 20:53:35 +0200
Message-ID: <20261010185335.30949-1-krasutskimaksim@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP ENVY Laptop 17-cr1xxx with subsystem ID 103c:8be8 uses an
ALC245 codec and two CS35L41 I2C speaker amplifiers. Its existing
quirk configures the amplifiers but does not enable the speaker
and microphone mute LED handlers.

Select ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS to retain the
amplifier setup and enable both mute indicators.

The equivalent change was tested on an HP ENVY 17-cr1xxx running
Kubuntu 26.04.1 with kernel 7.0.0-38-generic. Both keyboard mute
indicators were confirmed working.

Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
Assisted-by: LLM
Signed-off-by: Maksim Krasutski <krasutskimaksim@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 217df4301..0bfd1d093 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7817,7 +7817,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be6, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be7, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8be9, "HP Envy x360 2-in-1 Laptop 15-fh0xxx", ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c15, "HP Spectre x360 2-in-1 Laptop 14-eu0xxx", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),

base-commit: 947037990e050a3cb116631ff29a9cb621068162
-- 
2.53.0

