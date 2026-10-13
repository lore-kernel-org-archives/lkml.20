Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A8047A88D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924145; cv=none; b=Vh++ExKIW/O/U0GC+XAWLXPB1gh2/fXmU2mvpDo2zm1B7xw72FgyK0pmbc/OwfhqTBSTIWnQtN3+NW40Ry6+QAdIsPQQRNRXF1AXNCc7TCcsGxsCisRhSyRbet6htlVCLP798w8WrxXXaqrn+IifRT8EZRrH4c/dLBaE50fwCE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924145; c=relaxed/simple;
	bh=EU/lXhcyesppo2k4iqqbE1WUHSYLUnCdm/FVETA/lG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c8hS1+aT0DVf4sJBJhopOBQdf7MzGO0453tAv1SqWLZLrjvtw0svXAGaTIbWSE3G43LKIk1WCvboUkZ1krlyxxlfADJpKX25XMyQS0752pqK8cerZY2SrkARTDI2+g3Jnd2RT1UWkTV/5+aebDs0SRkhJA5HvXsmyQ2LPFBt0fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+X5sNFu; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+X5sNFu"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15354aa70e8so806286c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924143; x=1792528943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLt6GKuvAarV8gdf+zpsyObKDRlnXSW8t5lVL3DEXxI=;
        b=S+X5sNFuYrBsi1WR8vN9OktaV8ts6Tgcf8FVPR+wcIgjkonfrogXtxjCd27jY32lGm
         ieTVmz6+xKgJ6ueiWYG3sOxZW5FxuroAvh0/qQqNYJhvBa8iBqApokceLhjBpeC8Xc0I
         kqk1UHDpVOdRIHOULswFRLi1JP8NIU+93vvkEi44L8Uxc1d+yIdfVvQu4bV3pbFIb67k
         nNqF4cvcOMDYtdTWIQLsOsDBYIQ+PIPJJjwUYZloY/cF2tvD9oW+yUPih4N6Q8XV+Qpl
         XGwNm0h54LFzzauV8/UEPq2LVp9WNtgY8CcwSVbrPmqHkgGogpwCEKBZw0yx1h8U6PWt
         yVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924143; x=1792528943;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLt6GKuvAarV8gdf+zpsyObKDRlnXSW8t5lVL3DEXxI=;
        b=MXFYeI0d8B+wbGCVyQPsf8ACyYfrc2GxAx/8A8u7d2ZIfDPlN+4/WiTKw501qfFwlr
         rDaeQ8kRjQtxCxP7MAiFzWXht+HrsrGBpllAWbV0iE0k1CnrhpRfYKKNnVF1PD6riJ6d
         EMThEAs6QzaEy/YapbLBzoAmK18YH/h4ibRXbOHSIKvakrGx5AG6o36xNPRsbWJkVynK
         NsyexKbSB4WNyFtgsopgXEDLSZPdWW5SNtPqgFYYorf1ehlOzcuFq6XVIEr2Q4fI7Rfi
         COT2YKAQT77rzxciG8zaYU0rp8ZvbCE1l1Ajj8zLKJFPswdVRBKng1bTGI/ov1gg8KIo
         PdQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXTfujZ021KiZliwpxQW8uwUiRhUtZh8xXSw9zrv9gbyRC0xf5zsc3l8R9Fs/lwfXEDOvAyFaMSlvawF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVkGP967rxaFGDqwPYTQspVx39kOqZlAgvpf9H2R/UOvsdEfST
	TDRBhC9A7/eu0IFxRkOgSlpQQIsqICkL0gpmUZM4rtFzEA5fRjiIQ3uc
X-Gm-Gg: AYBFou2nwC1JjWhHCW+hOiedEbLOQu8laJJokpJqM96s3/nXl5D90aYxhu9kOgjB1bh
	rLuEMXeRkNSj4D8AprpDSTphZW9wDHf5gZOzBIBdFOFM05LOXe7fPdupfNT/cAzqNa50XiwRSi6
	qQjVJ+p27mFNuaU0BTSWHEevdxDbsfTCgawFnXhH8QY/46q12mlneHCKqEuePejNN49Eug39Tqb
	o96mtHgYmHMH1gVIz8slCN2i3rEzy7sNtgXDRXtldcRcUepKWKOb886MM8fiVdG9C3MNaqObiIf
	wqB3GNCuLmVznCWNhGvL7jJVvJQSpWo3aOW9p4MXlYTlt/4kZ8dxOoObWInuQAyorwlK4bUZ67m
	WtjfVJOw9SCsOtXc+WDvEiGHRW0KIOgCkm3nlgGIYm6RnSP7dAQd1exdNbq58Q1/LVI3d4+Bgsg
	L7ZnXwPbYhNHKQlYf8JEjWbY4QYTS6Sv+M8mB8xVbsDxBZ5JWHFOKL27fADUstpm8u
X-Received: by 2002:a05:7022:296:10b0:153:4a27:4ea5 with SMTP id a92af1059eb24-16a600667a0mr17435729c88.28.1791924143269;
        Tue, 13 Oct 2026 13:42:23 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm41761598c88.20.2026.10.13.13.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:42:22 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Cc: Kailang Yang <kailang@realtek.com>,
	Naser Al-Asbahi <nasserqahtan0@gmail.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: keep headset mic on Acer SSID 0x1640
Date: Tue, 13 Oct 2026 17:42:19 -0300
Message-ID: <20261013204219.9649-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The micmute-LED quirk for the Aspire A315-44P matches PCI SSID
1025:1640 before the Acer ALC256 pin fallback. The Aspire Go 15
AG15-42P shares that SSID and leaves nid 0x19 as 0x411111f0, so
selecting the LED-only fixup drops the headset-mic pin remap that
the fallback would have applied.

Chain ALC2XX_FIXUP_HEADSET_MIC before the GPIO3 micmute LED on that
SSID. Leave the Swift SFG16 entry (0x169a) unchanged.

Tested on Acer Aspire AG15-42P (Callisto_BCU): PCI pick 1025:1640,
Headset Mic=0x19, GPIO3 enabled with no physical micmute LED, speaker
and capture paths functional.

Fixes: d830631a128b ("ALSA: hda/realtek: Add micmute LED quirk for Acer Aspire A315-44P")
Cc: stable@vger.kernel.org
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf926c71..2793d09fbf6f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4388,6 +4388,7 @@ enum {
 	ALC285_LENOVO_DAC_RENAME,
 	ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
 	ALC256_FIXUP_IPASON_SMARTBOOK_S1,
+	ALC256_FIXUP_ACER_HEADSET_MICMUTE_LED,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6900,6 +6901,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc256_fixup_acer_sfg16_micmute_led,
 	},
+	[ALC256_FIXUP_ACER_HEADSET_MICMUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc256_fixup_acer_sfg16_micmute_led,
+		.chained = true,
+		.chained_before = true,
+		.chain_id = ALC2XX_FIXUP_HEADSET_MIC,
+	},
 	[ALC256_FIXUP_HEADPHONE_AMP_VOL] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc256_decrease_headphone_amp_val,
@@ -7230,7 +7238,13 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1616, "Acer Aspire A515-57", ALC256_FIXUP_ACER_COLDBOOT),
 	SND_PCI_QUIRK(0x1025, 0x161f, "Acer S40-54", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0x1025, 0x1640, "Acer Aspire A315-44P", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
+	/*
+	 * Shared SSID: A315-44P needs GPIO3 micmute LED; AG15-42P needs
+	 * the headset pin remap (BIOS leaves 0x19 as 0x411111f0). One
+	 * entry applies both. GPIO3 is unused on AG15.
+	 */
+	SND_PCI_QUIRK(0x1025, 0x1640, "Acer Aspire A315-44P / AG15-42P",
+		      ALC256_FIXUP_ACER_HEADSET_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x166c, "Acer Predator PH16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
-- 
2.43.0

