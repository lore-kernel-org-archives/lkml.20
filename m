Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492344;
	b=HCkhgvnCS1luax0LwW/GDdLe/MJcVAJF1fYGwL6Nvhk8D8NckENqKPRMY9jxPjSk0tiS
	 FShbFBG8Fv9HTeb3Z0d1C3/ZeOfkSaiEAUIE46nWnX78+pS6YGvNOLlLm6CzRDEtvhbBo
	 BLtOeqsTXPGw5n9xflSaOtJ11oEGhwtdJc8Ii9tWL6Rh0NiOs0xqpoe9LYqhZU/+xab3v
	 oaj2ktS6pPJYlmQ7UvKJozfBWmvpdsXs19+3MOLsHSd5SvyatkTZJRbddsB7UUU3f7quf
	 LJEqd1QW7hJ/f9AWs9MyPWvY8lRf/vWicnM7tEvY8Szphxj48zTAZ37vIYK+Pxn8kZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=CQ2B9zBnVBqiFew2RiY9TRcPZBaOrzRNqLKcxfukyf0=;
	b=5KC8Z1tsJNJqUZPPkGq/E/krSjr1gx/kE59kZrI2GcWIOVUPtr1G++PB7jcDvEK2qbv4
	 Xv2mSsKSGs3OHWVt4Vi3z5xhxp3eWwszbR5HvOrL0ppuGU5SzYtQy4px0d7rMk8XVmtFf
	 QNsxcHeeB4nXi4/hqB10kj4Gd8zeBQiXNODH4iF2gMzhdrwG7Yy9BMFkHuBgYVPAzqVUX
	 ROAMjsoRSDP4kjvmJmLvquzJO5RhvcHL/4hgXtgUOD6b3xJbZI4f8BTGCzGUNsRdK2kSP
	 hlWMPApewZPsNieHkN4U6k6LQCRy8FeOdxpzh43uVGzTDMD5mWwgul9MWPUCzZSeRQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRPZBAhS;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B24606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B24606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRPZBAhS
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2dd76b1361dso3738275ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492343; x=1793097143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CQ2B9zBnVBqiFew2RiY9TRcPZBaOrzRNqLKcxfukyf0=;
        b=PRPZBAhSjTPBAThHKPulnLb0g2gKd6OAYkMQjPd6ETZA/d8EX7q9/M0byH9DVxCB3N
         nfg3N08ADqu+wmr/iCRY9WvSdxyQoPUwIKVGF3jmk9f28zTCeqkcuUh0WRDNdzsDRIPL
         16LxUjMJ9nLKG/l+sb8bSgww4QzN34hKpDJcnljc7eOgDwDS3PMWZAg/563GpThyR2dJ
         B/Kc0GDfIUsDsik84RE1Vmjln+I3uX9C8mQ5HaZBeYj8HQzWGzwNaEprvMmefCoqeL6i
         zwV1+6ylGWn52E8Zqn+xlylc+YUc90DNN2tsqtoKtCaALqBpLuQufno35hBxyaxgFrcT
         eNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492343; x=1793097143;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQ2B9zBnVBqiFew2RiY9TRcPZBaOrzRNqLKcxfukyf0=;
        b=Zu+H3D2ECMZVa6dytCDx1cyKy+WYHr3Cg1gz8Pu2cjDIVuXhg9DKuR1v8QT8OJHXHq
         G5fcZ0nbGwUHjcyhsBXwIuOAnZw42zknEKNpAoaTx4SHmLkiwbtATy7dvD7/+R3QEWCK
         ZV7RoqIO4kitPQgVPIJIWbZ5ra21p6na/WSZXIJecbKsMFq1NMIUYU18zW/oJj6S3yPm
         io5cajdJcBQuiCk9uwZ3cTw8w27MtJ2pBuu4RAQQRF/HHbEsv9e+nBYM63JvX6tF+xN+
         GcUtaD4k2bawP/86nu7TtYf8sQScFi03gT8S2lbGoH2X6FI3Qfmb9LO6HLFRcQhW/y/r
         nZfg==
X-Forwarded-Encrypted: i=1; AKwUvBwkPaRq02037LAdAKOEO7075hVein0GNYHIVeGRB5aojX4wn528G693+z9FRFBz3FD5NvpS0hD5iUxQg4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUMaqTqSANNw+HNUmu5GJGMqQdyTbw6Cc1vvAQ2fXdDFOG2GMC
	Qqr1+K0ZllLSgl0/J+iVJMCN2xa/G/schnnmjdMlmhiI00MFKQJV9t5hH6lEsnaW
X-Gm-Gg: AYBFou099bok/CFe1B+IqV76zz7rEk14W4wf/z7ZjplpkDPGGCfg3ahEeLTD0NRasSc
	5ONAX83Wad9mP9E9wny+2l4mV/Kqu1YvjMity/v4+oJksPbUjX6zuLprt5eqai1hCUQwRB3Js/M
	/UVESVRgM2B0xTA2/W9Fjj8g/4wPZ2WL21Y9tk3buVCun7CwTxEhLWSlzmYEO6AOzVR+/J6Dw5+
	Ucv8E0EiZBzg7XuiNSR3ODCXS150uWY2TB2/4QdWqYLazhY1wTfIYi3iM/UW32Y3IoSvx6y8B6G
	pVvRL5+miEA1QCKGoEk7unVceZmrMHVye25HvRwVbl53DQYDiLZHnU4MjxZRKDyocfIRCbSq5Sr
	Bkz58YISyzAkVE2w6VqQSMel1FaqqPZSQXl2ZTNA9ej7ppopRh3RYka2Iy51VuN7TvmKks8SgFj
	QrEhU7aPTYg6I7grusYSSGllExttRBf4wcrKXoNaIrt4GogUxa/PetvMNtQpVcxS4Khn6n811Pq
	UV+PGE=
X-Received: by 2002:a17:90b:4ccc:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3acee2937ffmr8422582a91.4.1792492342981;
        Tue, 20 Oct 2026 03:32:22 -0700 (PDT)
Received: from [10.122.167.120] ([45.117.247.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f90a4fsm2883645a91.14.2026.10.20.03.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:32:22 -0700 (PDT)
Message-ID: <baf51d2a-e2f8-4c01-ab2b-3fd8834c94ca@gmail.com>
Date: Tue, 20 Oct 2026 22:32:17 +1200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
From: Ajanesh Lal <ajaneshlal3@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute and mic-mute LEDs for HP ENVY 16
 (103c:8be5)
To: tiwai@suse.com
Cc: perex@perex.cz, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Assisted-by: Claude:claude-haiku-5-5
Signed-off-by: DragonicRage13 <ajaneshlal3@gmail.com>
---
  sound/hda/codecs/realtek/alc269.c | 17 ++++++++++++++++-
  1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c 
b/sound/hda/codecs/realtek/alc269.c
index e98cc42e1..850a15801 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1572,6 +1572,14 @@ static void 
alc245_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
      }
  }

+/* mute LED via COEF bit and mic-mute LED via GPIO, called directly */
+static void alc245_fixup_cs35l41_mute_micmute(struct hda_codec *codec,
+                          const struct hda_fixup *fix, int action)
+{
+    alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
+    alc245_fixup_hp_gpio_led(codec, fix, action);
+}
+
  static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
                        const struct hda_fixup *fix,
                        int action)
@@ -4230,6 +4238,7 @@ enum {
      ALC245_FIXUP_BASS_HP_DAC,
      ALC245_FIXUP_ACER_MICMUTE_LED,
      ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
+    ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED,
      ALC236_FIXUP_HP_DMIC,
      ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
      ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX,
@@ -6859,6 +6868,12 @@ static const struct hda_fixup alc269_fixups[] = {
          .chained = true,
          .chain_id = ALC287_FIXUP_CS35L41_I2C_2,
      },
+    [ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED] = {
+        .type = HDA_FIXUP_FUNC,
+        .v.func = alc245_fixup_cs35l41_mute_micmute,
+        .chained = true,
+        .chain_id = ALC287_FIXUP_CS35L41_I2C_2,
+    },
      [ALC236_FIXUP_HP_DMIC] = {
          .type = HDA_FIXUP_PINS,
          .v.pins = (const struct hda_pintbl[]) {
@@ -7361,7 +7376,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
      SND_PCI_QUIRK(0x103c, 0x8be1, "HP Envy 15", 
ALC287_FIXUP_CS35L41_I2C_2),
      SND_PCI_QUIRK(0x103c, 0x8be2, "HP Envy 15", 
ALC287_FIXUP_CS35L41_I2C_2),
      SND_PCI_QUIRK(0x103c, 0x8be3, "HP Envy 15", 
ALC287_FIXUP_CS35L41_I2C_2),
-    SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", 
ALC287_FIXUP_CS35L41_I2C_2),
+    SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16", 
ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED),
      SND_PCI_QUIRK(0x103c, 0x8be6, "HP Envy 16", 
ALC287_FIXUP_CS35L41_I2C_2),
      SND_PCI_QUIRK(0x103c, 0x8be7, "HP Envy 17", 
ALC287_FIXUP_CS35L41_I2C_2),
      SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", 
ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.56.0


