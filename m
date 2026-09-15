Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA83009CB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434434; cv=none; b=mO5KSVr60+STQZzG4bCR+u2akzCwKp+h5Wcymd1fZyXCy+tjWV/qCxK2dfX/Vszijz2c+srA+g+GvkgSMUqU6C+LNVH+/l0G6QwZuIVjx0cuqPcFbLkWoUq5ArsQrsHijXIG0JB/vu3hT6qh68+qSqQwznu8Urq5ioSDlM4X1rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434434; c=relaxed/simple;
	bh=8aiq2U0cMdT8aeMJm9exBgQ8xmbn4lraHLl5T2NHQYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JF7He+qV2YlpTuc3nsuZzEoGbiLl6BHxQtXQ6eGx26SLzyGfpJVUeKJWFJUbettC2TbB+82YSaPkB3MuI+08q+TkP371VC1uS2FkLZfNmzxQm5c32l6nOGutixsBefWG1DkXD6eOJP9cMjAkED7oh9sgsUbOmgIshvixDHQS0J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOleToaO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOleToaO"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed6d6eso19435915ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434432; x=1790039232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ev4IqTnyFvWbIWoUOJNvt7lvIGchN18OiKzums0HmPc=;
        b=oOleToaO8JKPTpxRvmdYazUwmJXfYlSlIcO9aVuLvoW8AudFrWA8YL5Vi6ojaH9xRU
         iYiGkqNyZ75ztwJ3AxAQEoAruwGuk8DUd3PAlo+J/UIe3ewqkFSESofmls3wk1AmUxxv
         wFSreZ/JqcJ/3OLFu8LbZSBUoy6fvGBnez2LxthQmAdHphbI6/NByz8O2xijsirnc1NL
         amEFNwlWt+7g4Z8HPF1kD0JQG0D0RxJKYSe/by5CDq5kB00CYsr4eG5t3RNO4ztO3lFV
         r/7HC5OBySe5kqCTmG+Z5eiE18BoYiH1mgN3P1GrRCOWoG8pGXxxT4/0XwPaVV292fGz
         7UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434432; x=1790039232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ev4IqTnyFvWbIWoUOJNvt7lvIGchN18OiKzums0HmPc=;
        b=M4MWHkZjb3SqA22zd2+8wbucf4robDvUsZu4aWQTAKtzLnL9k82SzlozsWcOgn7jIq
         dt1ou/B3gj6M4dY4NQONljRUJyKxkzC5V390OYJ6pPh20XSeRr1C3Iff/lQefGtUD/fF
         moi9Pm8jf7bQVBnHdW+w+nSwKHC/l6nZiv6vK/iYOCaP9B9MqcWQv04NPDpPtS2EyZ/D
         c3AgEuz4ARnS45UydcxqoyHUkjCghkB6XagxrJb4FCsdI5lc7F49+sPTLND2Md1UBMmu
         gcxmXmsobZkzcuFJil5yG9KsTirbKLj0sXKuCxWbX2+0pJdUQVRK64niV1oMDJkzn35F
         Mj7w==
X-Forwarded-Encrypted: i=1; AKwUvByPyu5bXR8dMKGQaR3jtdVqOrf9ohxmF1URLa3PN7eDq5GD9tAy9ec40ht3IyGjJN2jIpcOJUD4ZoJVhwo=@vger.kernel.org
X-Gm-Message-State: AFuF++nJFI43RPZbDjwMgahNfVvQJYliOncies50inMy9P7kLfAmvXRd
	8WlyHBHm860Ohu3eIIIGpR4fEXpNtTKMHTpHwjVLIMb7AKf74SLAdAST
X-Gm-Gg: AYBFou3rqtg9gPjnTDAkG+rEaYTKCTp3r73Vvp1lolBYw8IAZuew56zIF1ixVt1j7nL
	/QL6lUBc5PYajY0cBW4hzsXZDmB76gCTmSWc83kAKHm7JAO0OViHEBsfuFiI7hNi+o0E1dh6Vpu
	SZv4aHdB4fq25yUAreLsxWmAU8dYrbu0Z3jnkDsh1MWc20KgVhHEp69NbGXWrvYarTrvYB7QEsJ
	nW8OxNzPAsT8meLzkdzNRvdC9j2dXzL7sg8QUnj5FFItvE0NpqBC2xJk7brmKfcIjft74/a/MWN
	B8kkj+R+qFztcjKqnuWGKaK/vCS9nMU214URvwcgT/XzSQikQMbb8PFfGq9Hyay4RzluCWc3oGu
	s/wrwoco1ABbEbnIxsi2fScubxndMeFCBm3CHnhGYHnoyyZvB5lYWvBRq6tQ8t95kpNAKU/tk6X
	SedfYvUL3bPyx6zCjUdDvwRTzlBNnLEA2/pSE14jp/KWzmJC08zZKp9LQLUYdtX1HEBPb8eUyJv
	aX3TDIGiQzgikv3W/858IJv9DxuKGHvLmX81aa2eKUUUZoEWHJ8uk2GeTl8H67+d+9BMKD/fOhE
	uIRn6KQQvukPWhgAM1hzVRamo47gprvXFZ99SbkrUN0ny2K2uMwmBwee8RpiORZN
X-Received: by 2002:a17:90b:2f0d:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39df024cbbfmr8751711a91.25.1789434432358;
        Mon, 14 Sep 2026 18:07:12 -0700 (PDT)
Received: from rithvik-nitroan51557.tailece47.ts.net (23-93-86-111.dedicated.static.sonic.net. [23.93.86.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33be20c67b7sm3077346eec.15.2026.09.14.18.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:07:12 -0700 (PDT)
From: Rithvik Vibhu <rithvikvibhu@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rithvik Vibhu <rithvikvibhu@gmail.com>
Subject: [PATCH v2 2/2] ALSA: hda/realtek: Fix Acer Nitro 5 AN515-57 mic switching
Date: Mon, 14 Sep 2026 18:06:57 -0700
Message-ID: <20260915010657.36140-3-rithvikvibhu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915010657.36140-1-rithvikvibhu@gmail.com>
References: <871pavol7n.wl-tiwai@suse.de>
 <20260915010657.36140-1-rithvikvibhu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Acer Nitro 5 AN515-57 (1025:1539), headset-mic pin 0x19 can
report presence with nothing plugged in after suspend-to-RAM (S3).
It can also report absence after a headset is reinserted. This causes
microphone autoswitching to select the wrong input. Headphone pin
0x21 continues to report plug presence reliably.

Use 0x21 as the presence source for 0x19. Retain the existing mic pin
configuration and coefficient initialization, and enable the existing
Realtek headset-mode fixup to restore the combo jack's input mode
during initialization, resume and jack events.

Headphone presence cannot distinguish three-pole headphones from
four-pole headsets. A three-pole plug is therefore also reported as a
headset microphone and selected by microphone autoswitching.

Tested with the internal microphone and a four-pole headset, including
unplug, reinsertion and S3 suspend/resume.

Fixes: 51db05283f7c ("ALSA: hda/realtek: Enable headset mic for Acer Nitro 5")

Assisted-by: LLM
Signed-off-by: Rithvik Vibhu <rithvikvibhu@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c..40b9d1221 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3740,6 +3740,23 @@ static void alc2xx_fixup_headset_mic(struct hda_codec *codec,
 	}
 }
 
+static void alc295_fixup_acer_nitro_headset_mode(struct hda_codec *codec,
+						 const struct hda_fixup *fix,
+						 int action)
+{
+	int err;
+
+	alc2xx_fixup_headset_mic(codec, fix, action);
+	if (action == HDA_FIXUP_ACT_PROBE) {
+		/* Mic pin 0x19 can report either state incorrectly after S3. */
+		err = snd_hda_jack_set_presence_source(codec, 0x19, 0x21);
+		if (err < 0)
+			codec_warn(codec, "failed to set headset presence source: %d\n",
+				   err);
+	}
+	alc_fixup_headset_mode_no_hp_mic(codec, fix, action);
+}
+
 static void alc245_fixup_hp_spectre_x360_eu0xxx(struct hda_codec *codec,
 					  const struct hda_fixup *fix, int action)
 {
@@ -4336,6 +4353,7 @@ enum {
 	ALC287_FIXUP_THINKPAD_I2S_SPK,
 	ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
 	ALC2XX_FIXUP_HEADSET_MIC,
+	ALC295_FIXUP_ACER_NITRO_HEADSET_MODE,
 	ALC289_FIXUP_DELL_CS35L41_SPI_2,
 	ALC256_FIXUP_ACER_SFG16_MICMUTE_LED,
 	ALC256_FIXUP_HEADPHONE_AMP_VOL,
@@ -6861,6 +6879,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc2xx_fixup_headset_mic,
 	},
+	[ALC295_FIXUP_ACER_NITRO_HEADSET_MODE] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc295_fixup_acer_nitro_headset_mode,
+	},
 	[ALC289_FIXUP_DELL_CS35L41_SPI_2] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_spi_two,
@@ -7184,7 +7206,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57",
+		      ALC295_FIXUP_ACER_NITRO_HEADSET_MODE),
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC287_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x159e, "Acer Nitro 5 AN515-46", ALC2XX_FIXUP_HEADSET_MIC),
-- 
2.55.0
