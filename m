Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608284A3F3B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916673; cv=none; b=Q/zcpp1DlVU4FsHRPz3ssDj0IOxWX/cdDZvGJWiGYuAlEfIdW2XIOgCUuBWZHaiTB1L+WvR1Uz3qH6LmqRz6Tm3FPuioqZWE+FQ2ZITN99XhilBNBKY/6pAGuQIbsxvC77t5HbIKLcgJ+62fpu9fWlUPN5zrytjfUonI+MogZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916673; c=relaxed/simple;
	bh=nsvTE3QLhDG95L1RNwMmRqY9UdhpjfL++63DMaG025I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UmRiAYngUjX5cxPeURZJRIsCVwjTjJwDR1k5/3VU8ctLCzRMNn1FuUiaSfW/Hg1D0qN+u7e+C1wMl3yCOuPdtTQJLosb1kIgsCN6gnG3FSbKxmzgMJZMDoUN26x8RjUbKjPI/wNgE46ofnmEShPIwEZDpKS3ebFL82A1j+FIIkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXvb8iSL; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXvb8iSL"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so2980331eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916670; x=1792521470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QLO9xbCj4qAudpwqZJ8vbAOb01A4NikIR3400ncUVOw=;
        b=ZXvb8iSLKHoRJiX3ImqrUHiaOwWilcc+AqCoJMZmUGsK65bVJiT0rr1nddFeGfQr68
         6vNimC/nUM83GAoyyptg17f3G3QLzAZAxEzu0nX+mmbg1BpcXdfnPeBzbUP+Om9CkjHj
         rdJyTyh0laiSmgTiGo3nj0H+kJ7XBPSop+i4MmP/EpXF8+W337zxayVyXhSEZF0GR55N
         b+JD52CvzwXEcAk+OkaGGgKA0amPYyOgeIG/PKvateslOIiya3m5gtGGaRXtd5B3iWGf
         kwJxTR2VqH6GhLQKF8uASnh6NVS/mn25Pn//8pqgFWb17wSdPcU6rSX9xQk15fHBW7vd
         hE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916670; x=1792521470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLO9xbCj4qAudpwqZJ8vbAOb01A4NikIR3400ncUVOw=;
        b=ZHCd3IBWwUnd5dNjWd3WBW/PQNyCyjRvXWqPg8DqYd4s+qBWv2ESAJaUA6WosJftEt
         6ODnmOF5VSEy0BzpHS7tKt1yJ1GbH+Nj0h4q7sotxV/AgQamedhn0xycDhVQDehJFIt0
         p6/5XqEgPgIOe5i4fgHycVfEDeN78kB5YCThuL69rp7jkIfkF4FipX0B09DIVvR1uRCX
         ALFdpYpky1ZJWKhkx+/E8i0PC4K7EB0dyxcJfKoaC0u2KwHOzs1kimSG9ox7C7Zst1Ol
         dYIlAV2P+lP3YyyMP6RFY1bUvSMmy4I5c8UWyQxB40R4meQzNXUAPLVN6Ju5Se3Uh+vJ
         yS5g==
X-Forwarded-Encrypted: i=1; AKwUvBx+05Fz/37NQN7sUpMaIR8kQVngaRfXhwBUJGmPTSvZaO48Lxv4vqxzgI1nODXWWQRehDCGyaxOrS3aZfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqC5nXU27iHg/K2VpRMcjM25bindyNYkORecKladBSGMKotky4
	NO7o+zrmR6LDuhgwt6xk1wxzyeUUCSpth+16Z3N8r2QJ147LFhAO+Rsk
X-Gm-Gg: AYBFou1QzlCovNX4k8yFuxVEavrMkh7sH3ixyQ7NxeGjUBVEfKUbNy0nZ+8ZIUl7zX7
	NILuncuyt3IpbPhmJuFFSi83N0OwNdsxDY2GbpzNbiPm1GmgdCHSH8/CPVQdJ0A6jOIzF4GmlgW
	buRhfvjeK/Z+O5ZE/YuZsBdPFOUW/6Tff2sUzP09RnCtWVeKnLAQAkeq6RQvltXx2/dPT4J4/Pq
	L9JkCUu3N6pOQjfheewxxZGRdhySr6EK2QCKsmbNDhmwYnVEU0e/PPYWPGivXtEgan2JSSO6X6u
	zawn1nZuI/RN1b+bkim6kCg+V1U46rppPdyDleGq91Iy6mRQ0tN3QXFI0KBVuhDLkQ7clyok7L1
	4FGfWycdlEE4B7aFoQ4+lcVPuxrn2Q2UqmnnVW2Y8+/Pcdf6FPobSnktFA8nVH5dAjVIhXCiWn5
	NqzwIb44Ma5N/0VC9LyKYpyqxeTn4T1JJXC6TNgFmRl/KZ3MNymXeeFX2HYOgjrEATCcqgJ009j
	w==
X-Received: by 2002:a05:7300:ea83:b0:359:8540:19d1 with SMTP id 5a478bee46e88-35985401c49mr9955558eec.15.1791916670286;
        Tue, 13 Oct 2026 11:37:50 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm50404070eec.17.2026.10.13.11.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:37:49 -0700 (PDT)
From: Aayush Kumar <aayushkmx@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <aayushkmx@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speaker and mic mute LEDs on IdeaPad Pro 5 14IAH10
Date: Wed, 14 Oct 2026 00:07:42 +0530
Message-ID: <20261013183742.56071-1-aayushkmx@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The speaker and microphone mute LEDs on the IdeaPad Pro 5 14IAH10
do not follow the ALSA mute state. This machine has an ALC287 codec
with SSID 17aa:3914, but shares PCI SSID 17aa:3843 with the Yoga
Book 9i and currently gets its fixup.

Add a codec SSID quirk that runs the IdeaPad ACPI LED fixup. Chain
the existing bass speaker amp fixup so the audio setup is retained.

Tested on the IdeaPad Pro 5 14IAH10: muting and unmuting the
headphone sink toggled the physical speaker mute LED. Muting both
microphone controls changed the ALSA mic LED state from 0 to 1.

Signed-off-by: Aayush Kumar <aayushkmx@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index be5482530..44652fc43 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4285,6 +4285,7 @@ enum {
 	ALC295_FIXUP_HP_OMEN,
 	ALC285_FIXUP_HP_SPECTRE_X360,
 	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
+	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED,
 	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
 	ALC255_FIXUP_ACER_HEADPHONE_AND_MIC,
 	ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST,
@@ -6435,6 +6436,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_ideapad_acpi,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
+	},
 	[ALC287_FIXUP_LENOVO_YOGA_PRO7] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_yoga_pro7_audio,
@@ -8215,6 +8222,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
+	HDA_CODEC_QUIRK(0x17aa, 0x3914, "Lenovo IdeaPad Pro 5 14IAH10",
+			ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
 	/* Yoga Pro 7 14IMH9 shares PCI SSID 17aa:3847 with Legion 7 16ACHG6;
 	 * use codec SSID to distinguish them
-- 
2.56.0

