Received: from smtp.vivaldi.net (smtp.vivaldi.net [31.209.137.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B133C10AD;
	Sun, 27 Sep 2026 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.209.137.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790543705; cv=none; b=Tcrb2D00PbiLWhVHlpdgofrF+F9ZRk13Oe9kBMfi2cxStubO6qpoWS5bvsIqhRahP46xYXfmNwsdhy8nH4rihCM39+zvwm1i+tGE2td0ijmbIqqYZEawvmgVCrb10O65ZF4CfMXc0BkgEg3fZb6m7g9E2P1v0Vs8x/tNvAr7mN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790543705; c=relaxed/simple;
	bh=wrxtl3iVS0W5ymyFIj4s4cR8Dbo8yPPM59lw7hjkGaw=;
	h=From:To:Cc:Subject:Date:Message-ID; b=rn0kyoVN7Mmj5s6WipyeoEDmh4MxCbYAcPUyep/JQaOuwZ55eETKIqgqAPrgEc/koiAEHTo6+jAMvnkwyOzCP4KHU5hGsTbwqFoxQd0bNKRTaBT+xBm2T/vd4IQ8p1uDRztsLhC1p3Npv7RYyhc9dNzAA1/1Om6sRIQ0rYYQhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vivaldi.net; spf=pass smtp.mailfrom=vivaldi.net; dkim=pass (2048-bit key) header.d=vivaldi.net header.i=@vivaldi.net header.b=Po865YnM; arc=none smtp.client-ip=31.209.137.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vivaldi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivaldi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivaldi.net header.i=@vivaldi.net header.b="Po865YnM"
Received: from localhost (localhost [127.0.0.1])
	by smtp.vivaldi.net (Postfix) with ESMTP id 42810FC394;
	Sun, 27 Sep 2026 21:06:01 +0000 (UTC)
X-Virus-Scanned: Debian amavis at smtp.vivaldi.net
Received: from smtp.vivaldi.net ([127.0.0.1])
 by localhost (mxo-1.viv.dc01 [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4aMw1Et1aDJ; Sun, 27 Sep 2026 21:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.vivaldi.net 5202DFC393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivaldi.net;
	s=default; t=1790543159;
	bh=PH60oN8wswWxUaVkPkFcF3EmOyvjGVDsgsc65oF6COo=;
	h=From:To:Cc:Subject:Date:From;
	b=Po865YnMm2Fl6nba8dRdG17xUgamxaJpf3PVfU3/7q8v0s2NrWDeaCMqS16Irfrrl
	 L1dDQ6jpLssI7I+T6wdp3Hp+ajFrbZo3GZ+dQUy9ScrN7YVuZhREKO1QAn+Y97SsJP
	 BpzegfIPOJV/7jeY2E3oAxPblpg6pWVAYNEwm6Fjm8SHvfUjIDA0NR/G0UvWHMVbXR
	 ZzRl1HDiy8WkMi3H5ibnPLbeQCnwYNfXCehamNRwslUPLzrZ7iJjkJH4Ejka3BMAnO
	 cQ6uhnTlQrwP/ieJKa0GEFwBfmChU1ltyPbZP4RR34u6wnYdwYDXGB/hK615m/1aUk
	 l3bihnnRwWfFA==
From: Denis Yakovlev <mfthesun@vivaldi.net>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Yakovlev <mfthesun@vivaldi.net>
Subject: [PATCH] ALSA: hda/realtek: Enable bass speakers on HONOR MagicBook Pro 16 2024
Date: Mon, 28 Sep 2026 00:04:55 +0300
Message-ID: <20260927210455.13938-1-mfthesun@vivaldi.net>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The HONOR MagicBook Pro 16 2024 (DRA-XX, board M1020, ALC256, SSID
1ee7:204e) has two tweeters and four woofers. The BIOS only configures
the tweeter pin 0x1b; the woofer pin 0x14 is left at 0x411111f0, so the
woofers stay silent.

Pin 0x14 can only be connected to DAC 0x02, while the parser puts the
tweeters on DAC 0x03, which turns the second speaker pair into channels
3/4 that a stereo stream never reaches (and SOF on Meteor Lake only
exposes a 2-channel HDA analog PCM). Configure 0x14 as an internal
speaker and restrict 0x1b to DAC 0x02, so both speaker pairs play the
stereo stream with a shared volume control, as on Windows.

Tested on DRA-XX with SOF (sof-hda-generic-2ch.tplg): woofers and
tweeters play together, headphone auto-mute and the DMICs keep
working.

Assisted-by: LLM
Signed-off-by: Denis Yakovlev <mfthesun@vivaldi.net>
---
The fix and this changelog were drafted with an AI assistant (Claude).
I reviewed the change and tested the same fix on the DRA-XX hardware
(applied to the Ubuntu 7.0.0-34 kernel sources): the woofers play
(toggling the new "Bass Speaker" switch audibly removes the bass),
headphone auto-mute and the internal DMICs keep working. Before the fix, pin 0x14
was confirmed as
the woofer output with snd-hda-intel plus a hda-jack-retask override.

 sound/hda/codecs/realtek/alc269.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111..371550bb 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2721,6 +2721,17 @@ static void alc294_fixup_bass_speaker_15(struct hda_codec *codec,
 	}
 }
 
+/* route Speaker (0x1b) to DAC 0x02, the only DAC reachable from Bass Speaker (0x14) */
+static void alc256_fixup_honor_dra_xx_share_dac(struct hda_codec *codec,
+						const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		static const hda_nid_t conn[] = { 0x02 };
+
+		snd_hda_override_conn_list(codec, 0x1b, ARRAY_SIZE(conn), conn);
+	}
+}
+
 /* Hook to update amp GPIO4 for automute */
 static void alc280_hp_gpio4_automute_hook(struct hda_codec *codec,
 					  struct hda_jack_callback *jack)
@@ -4374,6 +4385,8 @@ enum {
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
 	ALC236_FIXUP_HP_DMIC,
 	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
+	ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS,
+	ALC256_FIXUP_HONOR_DRA_XX_SHARE_DAC,
 	ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX,
 	ALC287_FIXUP_ACER_MICMUTE_LED,
 	ALC236_FIXUP_DELL_HP_POP_NOISE,
@@ -7072,6 +7085,19 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		}
 	},
+	[ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170111 }, /* bass speakers */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC256_FIXUP_HONOR_DRA_XX_SHARE_DAC
+	},
+	[ALC256_FIXUP_HONOR_DRA_XX_SHARE_DAC] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc256_fixup_honor_dra_xx_share_dac,
+	},
 	[ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_i2c_two,
@@ -8345,6 +8371,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1e50, 0x7007, "Positivo DN50E", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1e50, 0x7036, "Acer Gadget E10 ETBook", ALC233_FIXUP_WUJIE_SPEAKERS),
 	SND_PCI_QUIRK(0x1e50, 0x7038, "Positivo DN140", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x1ee7, 0x204e, "HONOR DRA-XX M1020", ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),
 	SND_PCI_QUIRK(0x1f4c, 0xb020, "Minisforum AI X1 Pro",
-- 
2.43.0

