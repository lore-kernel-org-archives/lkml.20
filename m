Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B60D348C4C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982270; cv=none; b=FTKiJEZ97gfEfMuzbTSQFJZr//OoanqdHcBi5CJVB/pFUMXANC8vlx85yXFvDcqFsREMQrxdgKvKOwbTLu9OJSP5r9p006pDKXgSv5dgoLwzn21odjflzl4s9UVyAfIX78h1Cw+Q1cN8Zs/oHxGSlzOoMtDSqT4poKWbAsKI1o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982270; c=relaxed/simple;
	bh=OGmMUhZHrOr6boThLHu7z77I7dRpjo6IF+jPmVb2rpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXru32wTpKHKosWN1xdzpuD31ZR1VvigbQ7mtwlzFjKPYxGcgBei+PbyqvlgFQBFt6NLv4HhlYESF9L0haHJUpRWLUS+nkkwd7Ut72owDV3bW/QBytar7NKaFRbJ2/DCtK797yH1j5xqicuIWTWZCc6Ai4RyNNX+pJyiLkKYw2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWZceMpb; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWZceMpb"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so132087241.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982267; x=1789587067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bu4GfVzH8DhuwM8RYplW9+YvYURtPxANRKmn9IzC2Nw=;
        b=GWZceMpbzLLRqJsp+gj217Q/gqjCB+2Rjfk0dQLnihPLBCxDzM4EOoOxfPCQ84DVp9
         G+M8kj6m9oLbSek8k6sAVWWstklMtXP3F8gVaQoyhQ3kMpwKQyjFRZzLNLEqNAnXlhKk
         iA3CamGvzV3Xa9wbk20Ym0DFO+tQzEapC5bUfxxQA3thzig331xcT4LjDkXmnXoInHvp
         UOaI7P48ETNP7qE7PNCt82di3bCmhJ76ZMDfNEunbI0gMdon472/Kzb7Piy4mX7RpV6w
         dBZZdUGX8cuoFsV6JabIFs2l54VXTeic1BFE1v31eXbP72WvWyAFs+FVhLutwWwpgTzk
         gr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982267; x=1789587067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bu4GfVzH8DhuwM8RYplW9+YvYURtPxANRKmn9IzC2Nw=;
        b=iXumqBvkr332080fj4B9KAiDDmw7S+8tQjkJX3tqn0NydCyNViJ02gV1GlTgKLwPj3
         AmGgCb+gAI+YMLX4CieuhCQTYVmIHPQcltfeSQboPSnFK1eTGlGt6GY48+kPnV0rDRrL
         OkJ7h+TP2xpbLX6tebY3YbU8Uty0TdKGrpH+HmDnNtQgEPBR6o08/x2cABgTAKDHdNyA
         SBxinTkgdm/hbPj5fg3pJ88xpUKY9zkwgOGCM+LwlzkTp2/yAT57bP0uA+LVNGo+wXpb
         7ba6LFESvIGccP4JZCt3O6/Sj0HtdUaofrWPKezasNK90MLq+akKBiLqibdF0uGZn/xU
         R1pg==
X-Forwarded-Encrypted: i=1; AKwUvBzOAJVvRwB2+WMTeGN3JrdebwZuw8ie5FrqByo/UzM1r0kmyi630uOCQM3x26I3ydp6MfAimxT56jVG6Fo=@vger.kernel.org
X-Gm-Message-State: AFuF++m53L5pdOV1VAmVS3dcl/T7YyHDWlXRlOpP0rUvXMr/GWxD1Ypi
	YYQ+UAb8JO9zblBLroHCWBH0+OZJVDPHlBlMNw7CCGK3MTr+Ngf4WJDq
X-Gm-Gg: AYBFou2NVJjvCrxkpQLgvrZtZN5OJy1jaJwKruiPNC+JRsIUSV7T5ArFdaBIG2ygtX+
	km27O9OlzJBsJXEW/7jNke+J/FN9LzukrpxwxGSTqI2LeT4XxwCTne0drfn+XX4XujlNdZ7zgT+
	UIsFuExw2MjYYQFz8ic07qIMxI3TIRUttmmiq5nyXlPZhycY6fkSPhVp09dWoJYNvKW6MUaX4I1
	NlrO18V4xmTlRO28W5goVIqWyvIPEx4JPDh7hOOo2BsIsdjA5rEecJN+pfGpvm1DG+Cte7qd77B
	ldCTbGBNQAB4wY8uPWkKRslTZvfdKnWIK+Vv1cUYm5uQVMNA4gZp8xBxFiWeNa5fAJdxNdOc1Iz
	u/4WEdhyT4IP12+6n25+rW9S7gbR7VFCJOe97UsXYLqnYT0KHmYcHYkG6FLIc1f0WMIkzSxB5qk
	2zUjsGSmbWKFdHkU2WrM0UfIJXVHEC/kMTGqK9EnKUywB94gfgyTWhzinfxbVXA0A=
X-Received: by 2002:a05:6102:578c:b0:774:ce64:242f with SMTP id ada2fe7eead31-790db2da0e4mr366570137.20.1788982266782;
        Wed, 09 Sep 2026 12:31:06 -0700 (PDT)
Received: from localhost ([47.201.34.27])
        by smtp.gmail.com with UTF8SMTPSA id ada2fe7eead31-78a47ae301fsm11646230137.7.2026.09.09.12.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 12:31:06 -0700 (PDT)
From: Andrew Udvare <audvare@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Udvare <audvare@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speaker dropouts on MSI GE66 Raider 11UE
Date: Wed,  9 Sep 2026 15:31:04 -0400
Message-ID: <20260909193104.26508-1-audvare@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The speakers on this laptop are driven by a Realtek ALC1316 smart amplifier
sitting behind the ALC298 processing-coefficient tunnel. Nothing configures
it, so it runs on its power-up defaults with silence detection enabled: the
speaker path is muted after roughly 0.2 s of quiet and takes roughly 0.4 s
to reopen. Anything arriving in that window is lost, so the beginning of
every sound that follows a pause is cut off. It is most obvious with speech
synthesis, where the first syllable of each utterance disappears, but it
affects music equally. Headphones do not pass through the amplifier and are
never affected.

Measured on the affected machine with generated tones: isolated 150 ms
bursts spaced one second apart are inaudible, the same bursts spaced 100 ms
apart are heard, and a continuous tone loses only its first 0.4 s.

Add a fixup that programs the amplifier's initialisation sequence at codec
init, which turns silence detection off. Writes go through the tunnel with
coefficient 0x22 selecting the amplifier, 0x23 carrying the 16-bit
register, 0x24 and 0x25 the value's high and low halves, and 0x26
committing.

Link: https://github.com/thesofproject/sof/issues/5842
Signed-off-by: Andrew Udvare <audvare@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ecc9c6e6a..8f55c3c00 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1840,6 +1840,48 @@ struct alc298_samsung_amp_desc {
 	unsigned short init_seq[2][2];
 };
 
+/*
+ * The MSI GE66 Raider 11UE drives its speakers through a Realtek ALC1316 smart
+ * amplifier, reached over the ALC298 coefficient tunnel. Left unconfigured the
+ * amplifier's silence detection mutes the speaker path after about 0.2 s of
+ * quiet and takes about 0.4 s to reopen, so the start of every sound that
+ * follows a pause is lost. Headphones do not pass through the amplifier and are
+ * unaffected.
+ *
+ * Tunnel layout for ALC286/ALC298: coefficient 0x22 selects the amplifier, 0x23
+ * carries the 16-bit register, 0x24 and 0x25 the value's high and low halves,
+ * and 0x26 commits. Bit 4 of the commit word is a self-clearing go bit.
+ */
+static void alc298_fixup_alc1316_amp(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	static const unsigned short init_seq[][2] = {
+		{ 0x0000, 0x01 }, { 0xc001, 0x14 }, { 0xc003, 0x00 }, { 0xc004, 0x11 },
+		{ 0xc005, 0x00 }, { 0xc006, 0x00 }, { 0xc007, 0x11 }, { 0xc008, 0x11 },
+		{ 0xc009, 0x00 }, { 0xc730, 0x06 }, { 0xc612, 0x16 }, { 0xc00f, 0xf7 },
+		{ 0xc00a, 0xd8 }, { 0xc00b, 0xb7 }, { 0xc60b, 0xff }, { 0xc60c, 0x37 },
+		{ 0xc605, 0xf0 }, { 0xc020, 0x00 }, { 0xc022, 0xd6 }, { 0xc023, 0x00 },
+		{ 0xc025, 0xd6 }, { 0xc602, 0x07 }, { 0xc603, 0x07 }, { 0xd101, 0x00 },
+		{ 0xc093, 0x80 }, { 0xc090, 0x87 }, { 0xc091, 0x11 }, { 0xc614, 0x20 },
+		{ 0xc615, 0x0a }, { 0xc616, 0x02 }, { 0xc617, 0x00 }, { 0xc050, 0x80 },
+		{ 0xc051, 0x7f }, { 0xc052, 0x00 }, { 0xc053, 0x70 }, { 0xc054, 0x00 },
+		{ 0xc0a2, 0x01 }, { 0xc09d, 0x80 }, { 0xc09c, 0x71 }
+	};
+	int i;
+
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	alc_write_coef_idx(codec, 0x22, 0x0010);
+
+	for (i = 0; i < ARRAY_SIZE(init_seq); i++) {
+		alc_write_coef_idx(codec, 0x23, init_seq[i][0]);
+		alc_write_coef_idx(codec, 0x24, 0x0000);
+		alc_write_coef_idx(codec, 0x25, init_seq[i][1]);
+		alc_write_coef_idx(codec, 0x26, 0xb031);
+	}
+}
+
 static void alc298_fixup_samsung_amp(struct hda_codec *codec,
 				     const struct hda_fixup *fix, int action)
 {
@@ -4211,6 +4253,7 @@ enum {
 	ALC236_FIXUP_HP_15_FD0XXX,
 	ALC236_FIXUP_LENOVO_INV_DMIC,
 	ALC298_FIXUP_SAMSUNG_AMP,
+	ALC298_FIXUP_MSI_GE66_ALC1316_AMP,
 	ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS,
 	ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS,
 	ALC298_FIXUP_LG_GRAM_STYLE_14,
@@ -6006,6 +6049,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_hp_pavilion_mute_led_1b,
 	},
+	[ALC298_FIXUP_MSI_GE66_ALC1316_AMP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc298_fixup_alc1316_amp,
+	},
 	[ALC298_FIXUP_SAMSUNG_AMP] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_samsung_amp,
@@ -7933,6 +7980,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE",
+		      ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
@@ -8515,6 +8564,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
 	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
 	{.id = ALC298_FIXUP_SAMSUNG_AMP, .name = "alc298-samsung-amp"},
+	{.id = ALC298_FIXUP_MSI_GE66_ALC1316_AMP, .name = "alc298-alc1316-amp"},
 	{.id = ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS, .name = "alc298-samsung-amp-v2-2-amps"},
 	{.id = ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS, .name = "alc298-samsung-amp-v2-4-amps"},
 	{.id = ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc256-samsung-headphone"},
-- 
2.47.3

