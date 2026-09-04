Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCAE37C91A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563795; cv=none; b=iEfD0R6gcd4s451s9vm1Omdn9xeAh5j/qSfTBYj48LZ2SthnS9G1puC1fZw7ITxP7p2uOqWk7mhBpx+zdpRx+8KFMPkjaInnn0hHeAbE097g8LxQyU7yzcY9X3s3ZQLJFmx/2thOXF6sqNCBV+w6bwBK/H1g8xqz1fZMsOYXIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563795; c=relaxed/simple;
	bh=toX5g90APAEIw/JrBp16zerys93inZQ7yKT1M0I3GvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mk2uYyXpWZsZpKU/CirDDq9zJoZBVGBQ9t6tLG3hyJ5YW38arAhM5ka3bwftqhrmBFNgeDj6m4QCHNQKRXlBDdrX6LG5CaUcy72VBcRsgXGoj/W79LJoUS4g1VNyFNUvzGaHMVGi1LInIeM1jw+HTbOMZYdEr6qRj0Riwz9rWd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVH3aavB; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVH3aavB"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc149372c14so865223a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788563793; x=1789168593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fkj+tOdPJa9maROU9VRDjz0YPmPUFkrYUP9fpE+J1l4=;
        b=OVH3aavB5WPEknnETtImhRFxCL3BpbzOYUFY94/2rXlaTkElbj7Pk2/V6kedNoRxwu
         MCDljp5tbKrVDZZjW6fkwL0+kdAHInl/Z4Ztx2Wgc2rjOAG1qHY0slX1DPu9Chr1KFZc
         jJzj+BPydGCwpZQp3BlU5NNAKnHZD5KKL6VqVnJOKobjs4n5Ah7z79JVMt4b5ZbrkDel
         yBRceUQy8LdH1Fe5K2/2ngmD54gYiqct9DupY5OorqEybgRv3ZBu8Up6hVLzd0HMNwJc
         rNydsWTy51fHJXfvKCY9lRB70w0HS+Z7ErzuOsr3S1gbF4j5VEivkA6beSgW9iPmKEKR
         T0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788563793; x=1789168593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fkj+tOdPJa9maROU9VRDjz0YPmPUFkrYUP9fpE+J1l4=;
        b=KBJrsZkR01AvKAcv3Mih0YAZEd1Ua3QL1vjez8bJiVXGtRx/07lxpPdSXiAkYVZdfv
         eNOR7TBBfjtWXiV80SpDfzyO2cKnT39s/NlXBQB2eDtyhkr4sPvcTmzGHqlYU3FHRz0M
         CaEHvphbPA4FKFDs6x042aC2PI+WFVnqruHmAFNCFQJyy+FEQWGjE1f5RChyCxoy568x
         Krh6Y0d+If00xDRxkQyExrDYVFzwnQBP8I5BU/t+vUletN3rCDTk7Wk2cWhrKoUqxlYe
         42fsTilB/WjO+6Vm+GviffSBAAevxiOqtxxoeo6Qj81i5I3602QHbiqHZmPySWhPZTRR
         d1Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwkhBw5mCUFCMlly6rmFqsK/spkGrj+dsqtisyGsKpwfMg9NgMZiIdFMG7nbZssw9VlmUiDMr20TuSjqa4=@vger.kernel.org
X-Gm-Message-State: AFuF++lGQyoH/Hlq/XlrfZMAt4j41AI1Ry6VB7KUw2Hrb8I8iyyrmwjo
	xfmGrpc3TkWyY2XSCcyYuBu7A1aZWbf1PV7O2YPKopM8yJU4nq8WmdEx
X-Gm-Gg: AYBFou25oAKijNzwwU82cRF6Mni1iMguksxqZ8jMEVXTEoiwRt55lhyhonx9CSMmpZd
	dBCEjtvT6SpE9S5yy+Eer9lIejGNOT8WO3qsoWJefCATwPWqCbnXQMczl0uAV7Z1OGO8QFnlK05
	nOOwivvUmnO736IWIYD82W2/Dto/9vg3lt4gC5n9W6f2Nclwd000jgRH8QD+5sOYp5dwpzlzvnv
	XyLgofqfi8QwDxc/Th7MRDCM1OKNUacXyDIWGipG8kAagARNV0gVlaSdF/ugcAft/wDjDYdWGrl
	eI2o9fnSbhCvbFDqJPC6+VwLCwXsSbBv78N/GyutyIirEXjAJR/ZTADvyTkFLRCuGWp1wIgn9e5
	Kvj4gn2n9Q7xWN5YfCSL7+uzC2rRQrzeyzv7TLlZHT7NIaFf94uA/rEpsh5guyR9skdk7gTKnuM
	5Jzkpiyx04u4nGzGpOmB+6stoUrB2d9h2/vBl8ml1TfhBrULpGFGKqbVjSwFwun0NIUHOVzYuQ2
	bBar81GY6S1czLGYhRAXLfRiFzYqKjNNooVA0oxT/AA/Bl2/qIQrw5wNvhLaBNYFykT2MWciRNI
	QQKThehc6XY7kj5sRp2vFKxAnpOH8sWpBXLuaH+KwxY=
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr14642210a91.15.1788563793256;
        Fri, 04 Sep 2026 16:16:33 -0700 (PDT)
Received: from localhost.localdomain (23-93-86-111.dedicated.static.sonic.net. [23.93.86.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm9579481eec.19.2026.09.04.16.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:16:32 -0700 (PDT)
From: Rithvik Vibhu <rithvikvibhu@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rithvik Vibhu <rithvikvibhu@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix Acer Nitro 5 AN515-57 mic resume
Date: Fri,  4 Sep 2026 16:15:45 -0700
Message-ID: <20260904231545.33505-1-rithvikvibhu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing pin-configuration quirk exposes headset mic pin 0x19, but
the ALC295 loses the correct combo-jack state across suspend-to-RAM
(S3). After resume, pin 0x19 can remain falsely present after unplug and
the capture mixer can remain routed away from the internal mic on pin
0x12. The failure occurs on both 6.12 and v7.2-rc7.

Give subsystem 1025:1539 a model-specific fixup which initializes the
Acer combo-jack coefficients, enables the full Realtek CTIA/OMTP
headset state machine, gates the headset mic with the reliable
headphone pin 0x21, and feeds the corrected cached jack state through
generic HDA mic autoswitching. This keeps the actual capture mux
synchronized across boot, hotplug, unplug and S3 resume.

Apply the correction from both the headphone and microphone callback
paths. A direct event from mic pin 0x19 otherwise bypasses the headphone
hook and can restore the unreliable raw pin sense. Invalidate and
refetch pin 0x21 when handling such an event before deriving the
corrected microphone state.

Pin 0x21 indicates that a combo-jack plug is present but cannot
distinguish three-pole headphones from a four-pole headset.
Consequently, as with other headphone-gated mic configurations, a
three-pole plug is exposed as a headset mic.

Tested with cold boot and repeated S3 cycles in the unplugged and
four-pole-headset states, including unplug and reinsert after resume.

Fixes: 51db05283f7c ("ALSA: hda/realtek: Enable headset mic for Acer Nitro 5")
Cc: stable@vger.kernel.org # 6.12+
Assisted-by: LLM
Signed-off-by: Rithvik Vibhu <rithvikvibhu@gmail.com>
---
The 6.12.y backport requires adaptation because the Realtek codec code
is located in sound/pci/hda/patch_realtek.c there.

base-commit: 3b26ceef88c110f4d188387cffa0df78657be904

 sound/hda/codecs/realtek/alc269.c | 105 +++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 95b40a177..f1a83908e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3740,6 +3740,103 @@ static void alc2xx_fixup_headset_mic(struct hda_codec *codec,
 	}
 }
 
+static void alc295_acer_nitro_mic_autoswitch(struct hda_codec *codec,
+					     struct hda_jack_callback *jack)
+{
+	struct alc_spec *spec = codec->spec;
+	struct hda_jack_tbl *hp_jack, *mic_jack;
+	hda_nid_t hp_pin = alc_get_hp_pin(spec);
+	bool auto_mic = spec->gen.auto_mic;
+	bool hp_present;
+
+	hp_jack = snd_hda_jack_tbl_get(codec, hp_pin);
+	mic_jack = snd_hda_jack_tbl_get(codec, 0x19);
+	if (!hp_jack || !mic_jack) {
+		codec_warn(codec, "failed to find Acer Nitro combo-jack entries\n");
+		return;
+	}
+
+	/* A mic callback must not reuse a possibly stale cached HP sense. */
+	if (jack && jack->nid == 0x19)
+		hp_jack->jack_dirty = 1;
+	hp_present = snd_hda_jack_detect(codec, hp_pin);
+
+	/*
+	 * The codec reports a stale or inverted presence state for mic pin 0x19
+	 * after S3.  Pin 0x21 continues to track the shared combo jack reliably,
+	 * so use it as the presence source for 0x19.  Leave the entry clean so
+	 * the normal report pass does not immediately replace this value with a
+	 * broken raw pin-sense read.
+	 */
+	mic_jack->pin_sense &= ~AC_PINSENSE_PRESENCE;
+	if (hp_present)
+		mic_jack->pin_sense |= AC_PINSENSE_PRESENCE;
+	mic_jack->jack_dirty = 0;
+
+	/* Route the actual capture mux from the corrected jack state. */
+	spec->gen.auto_mic = 1;
+	snd_hda_gen_mic_autoswitch(codec, jack);
+	spec->gen.auto_mic = auto_mic;
+}
+
+static void alc295_acer_nitro_hp_automute(struct hda_codec *codec,
+					  struct hda_jack_callback *jack)
+{
+	/* Refresh the reliable HP jack and the Realtek headset mode first. */
+	alc_update_headset_jack_cb(codec, jack);
+	alc295_acer_nitro_mic_autoswitch(codec, jack);
+}
+
+static void alc295_fixup_acer_nitro_headset_mode(struct hda_codec *codec,
+						 const struct hda_fixup *fix,
+						 int action)
+{
+	struct alc_spec *spec = codec->spec;
+	static const struct hda_pintbl pincfgs[] = {
+		{ 0x19, 0x03a1103c },
+		{ }
+	};
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		snd_hda_apply_pincfgs(codec, pincfgs);
+		alc_update_coef_idx(codec, 0x45, 0xf << 12 | 1 << 10, 5 << 12);
+		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
+	}
+
+	alc271_hp_gate_mic_jack(codec, fix, action);
+	alc_fixup_headset_mode_no_hp_mic(codec, fix, action);
+
+	if (action == HDA_FIXUP_ACT_PROBE) {
+		int int_mic_idx = -1, headset_mic_idx = -1;
+		int i;
+
+		for (i = 0; i < spec->gen.input_mux.num_items; i++) {
+			if (spec->gen.imux_pins[i] == 0x12)
+				int_mic_idx = i;
+			else if (spec->gen.imux_pins[i] == 0x19)
+				headset_mic_idx = i;
+		}
+		if (int_mic_idx < 0 || headset_mic_idx < 0) {
+			codec_warn(codec,
+				   "failed to find Acer Nitro mic mux entries\n");
+			return;
+		}
+
+		spec->gen.am_num_entries = 2;
+		spec->gen.am_entry[0] = (struct automic_entry) {
+			.pin = 0x12,
+			.idx = int_mic_idx,
+		};
+		spec->gen.am_entry[1] = (struct automic_entry) {
+			.pin = 0x19,
+			.idx = headset_mic_idx,
+		};
+		spec->gen.hp_automute_hook = alc295_acer_nitro_hp_automute;
+		spec->gen.mic_autoswitch_hook =
+			alc295_acer_nitro_mic_autoswitch;
+	}
+}
+
 static void alc245_fixup_hp_spectre_x360_eu0xxx(struct hda_codec *codec,
 					  const struct hda_fixup *fix, int action)
 {
@@ -4335,6 +4432,7 @@ enum {
 	ALC287_FIXUP_THINKPAD_I2S_SPK,
 	ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
 	ALC2XX_FIXUP_HEADSET_MIC,
+	ALC295_FIXUP_ACER_NITRO_HEADSET_MODE,
 	ALC289_FIXUP_DELL_CS35L41_SPI_2,
 	ALC256_FIXUP_ACER_SFG16_MICMUTE_LED,
 	ALC256_FIXUP_HEADPHONE_AMP_VOL,
@@ -6854,6 +6952,10 @@ static const struct hda_fixup alc269_fixups[] = {
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
@@ -7177,7 +7279,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
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
