Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592783;
	b=hBoouQZrokaf47n3Sz6Xc3Iqju9C9ZO2Bn/hU/KS0sjd+1UTZZaOso2kLc0i1mDhbe4k
	 rE3HmIPGDt1gqxFU1zlbZJHFStSgZ43+ynH702VZGLxpFrett2uoBqWuTkZ0sZa9S4u7L
	 KXGK+NJ5MKebj6ZaN8e0EINHxarTGOBb3OhvCOf8Mm62C1xSsexBisXA3DrMV6dsW/AJL
	 LzgAwU7wLndx++iIpCjgU6sjJC+as4Gp5IGQv+/tgwvQqZ8ZbKKVVJEgt9WyTNWeh399h
	 +xrfhmVlTpV8rnJ+rC9vCvsZWsN27PUWMWMweAEUDkxGYulkUdXxOCueT8qNP2HwWFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MlgQ+qJI1EzewWr/GysHup99aMMlWh58UycCkLdP/Cc=;
	b=wiu7jpv4dGqxPpNrhb+rzdBxODUDu0NYYR3K1/HAML35nYL1Z9kJWtlN62QbVja34Xrk
	 njgtIlCgyiILV6yaj9rDGo/h9odK8YXgQhnVO2f72jizdSCIXINVNkM45+93lW8Jmx6Ez
	 RVsVel9ukMcFLCELUKivbiA7R65GWRKgdAl3qk7H4xSAO85wsjjI2xvs/PNstlIHmj5i0
	 uuLFIvHORGtb+PGbe7EmS/scCfMOm204/FTDUO5mpdlrj14psgtHZ45j6WPpb/1cNly2v
	 vWQJTdotJ1/7wFtnE4IxavCNtqq8Uu5wdXK2rxuFsGKkjWUdwoJFZOaP8joQ16xrvYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dA7QwaU7;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58C1606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A58C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dA7QwaU7
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so1785413eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592782; x=1793197582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlgQ+qJI1EzewWr/GysHup99aMMlWh58UycCkLdP/Cc=;
        b=dA7QwaU7Axxc1WZbv/9pLzJPv5M9nfUhACdNd4UTRJwTJNp+TROzvqHrpKb/m6JNkh
         OqIYOp5jvZNDnOXls5bJCgTFE/HdLdErhJMP3q56Co92mBYXP/xSbfiGUaTlg7XTfDnC
         azAIactdR8Dq9p2y3q9evoymYPY9cj+r9vHorjr5ZHqz4k6NlWRWWqRIx/FKCHTtI4Fw
         wYjQMlT54uv+ALMQgvnMaosTE0/FQ0oNYxNbd6i7qUslbUAGP/cO6NZ2chhRRk0ZPwr5
         CvYQxqlwBBlBpnKXN5Lh1ZvLKsTW9x/Z+AUeQt5aA62pvJo9y2/czDOu9F6vJ0hxyKcn
         2e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592782; x=1793197582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlgQ+qJI1EzewWr/GysHup99aMMlWh58UycCkLdP/Cc=;
        b=KzrZvlrp8Juy4LwEDGMI3wFOxJlf2Xfz1UywwiV3u9ZPKaATMC8cHtYMRQrhJhSa0Y
         a9HYeBiwKkARmVC/WWUq2BtJOJCu1Q+6/dntccyBSyr5TGpMaohC51cYcbyWrptGg5I/
         HW0QJV64IjrzCe0PL8pBiSS945jBh+6BZqJaFLFNtlzwaLu9z4jsDuPYAD2TxSexijmw
         K3HMd/uBYVKsavGhuGVEH8ZGNXZhoVjgmj+H7wAEhEjvxVG669epiK0LRG2lytAK9M/H
         J+qx9BKJ+UNFDLVgOQgyWu5ZkOJqer10lO0gxqvhoifXkYGPf1xnlZKym/Npo/GTi3gH
         strQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1y/z48Ts59dHTIv2TSUmkbIcd7Fhmm8Qtm+sOQIXcLqsl2po7FONKlmB4p0x1ozwlX9AM0fkLIyUT9os=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPruioGNhZFE+VJMH2nnDoPm95LzX0JJD1aWTYN7H8asG3kZbe
	vyFOfSCZKwDYVQ4UH5NE6FuqEJjB3I+zsLwYFKRG/1konZ/0uEx8TsTr
X-Gm-Gg: AYBFou1sunIzGaKXi0hhHBWkAG/lqpct9Xv0EhhzomEVdnzjEa12hYoNqiGCniRXWZJ
	5ckj98u3qdEZx2sNTRGlAINK9/kQTEhHmx8vYSi4IyBcivmbZ4kHxidu4UqnMZmCWJp9vKwZTQs
	N22DoXm1i8zpG+irOSJ+Rq5GsCpffRNw2vFydCx56bkVZ63NeoD83nDM8tij6mvAhPoHcEKxU7T
	3rOUUSZTlcoSxuL0hDZA72V0M5J6x5ZtA/cMc3Pys+5IipYyTA6W2unPmha0J3UxKWxj79YGLDK
	XPHdfDRr0uJo8wpG9904FT6vO+LT+CfdTyGaydsYfLhxxJYRjSLKXCGZrBb9SRoLFYhxxr3lLsQ
	FY9ni3Zq5Tvc6BKm3AYgNkr8/DPbS5eiHJwl8XpzxpzzgJOQ04dD2dMkwL8WNv4tnv+IbvZcD2d
	W1L44sP6xuSBKNNxWgPxlcIHFc7TQFXKEyYfs78xCgy/S10aU9JY38WeVgbtYiCQk1RiqzYKMTU
	T0PsRFqaAhhS4MoIvVmFtCuIKpLRLxIWPuRqp/QYsy8tgpeTJy6vsFkGedmykF3UIrmIRJAdwtz
	ru8X+A==
X-Received: by 2002:a05:7301:19af:b0:35c:707b:acba with SMTP id 5a478bee46e88-3674a40df15mr5149141eec.3.1792592781362;
        Wed, 21 Oct 2026 07:26:21 -0700 (PDT)
Received: from CachingPlasma ([45.117.246.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm9133554eec.15.2026.10.21.07.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:26:20 -0700 (PDT)
From: Ajanesh Lal <ajaneshlal3@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajanesh Lal <ajaneshlal3@gmail.com>
Subject: [PATCH v3] ALSA: hda/realtek: Add mute and mic-mute LEDs for HP ENVY 16 (103c:8be5)
Date: Thu, 22 Oct 2026 02:24:53 +1200
Message-ID: <20261021142453.177174-1-ajaneshlal3@gmail.com>
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

The HP ENVY Laptop 16-h1xxx (PCI SSID 103c:8be5) uses an ALC245 codec
with CS35L41 I2C speaker amplifiers. No LED fixup is applied for this
subsystem ID, so the speaker mute LED and the microphone mute LED are
never driven and do not follow their keys.

Add a fixup that calls the existing ALC245 mute LED COEF helper and the
GPIO mic-mute LED helper directly, then chains to the CS35L41 I2C
amplifier setup so the speakers keep working. Use it for 103c:8be5.

Tested on an HP ENVY Laptop 16-h1xxx running kernel 7.2.11: the
hda::mute and hda::micmute LEDs appear and follow their keys, and the
speaker amplifiers still bind (CS35L41 Bound in dmesg). The mic LED
GPIO pin and polarity are not verified on other hardware.

Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
Assisted-by: Claude:claude-haiku-5-5
Signed-off-by: Ajanesh Lal <ajaneshlal3@gmail.com>
---
Changes in v3:
- Use real name in Signed-off-by and From.
- Add Fixes tag for the commit that added the quirk.
- Rebase onto sound.git for-next.

 sound/hda/codecs/realtek/alc269.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f2ef2b265..23aa175fa 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1642,6 +1642,14 @@ static void alc245_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 	}
 }
 
+/* mute LED via COEF bit and mic-mute LED via GPIO, called directly */
+static void alc245_fixup_cs35l41_mute_micmute(struct hda_codec *codec,
+					      const struct hda_fixup *fix, int action)
+{
+	alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
+	alc245_fixup_hp_gpio_led(codec, fix, action);
+}
+
 static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
 					  const struct hda_fixup *fix,
 					  int action)
@@ -4526,6 +4534,7 @@ enum {
 	ALC245_FIXUP_BASS_HP_DAC,
 	ALC245_FIXUP_ACER_MICMUTE_LED,
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
+	ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED,
 	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
 	ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS,
 	ALC256_FIXUP_HONOR_DRA_XX_HEADSET_MODE,
@@ -7333,6 +7342,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
 	},
+	[ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_cs35l41_mute_micmute,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
+	},
 	[ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7922,7 +7937,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8be1, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be2, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be3, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8be6, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be7, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
-- 
2.56.0

