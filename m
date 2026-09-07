Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC373E9580
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762732; cv=none; b=DPGHXoKoAbzaWn75wAygpSArAMoo9dAw9ObAS40qzKuES66g/EiWcyfwkV/tN+SvbfkmWWAU8dM8FadeaZ6o+WZxJ/3ptwWqB4hVHxUt/hxHGp6ZkB7qz8bHTF7X1AjynPimXAV1/OebbAr7E/lY0fC32DF5w1olmmLT+2reb60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762732; c=relaxed/simple;
	bh=Ka9zf/mgpATO1G7iBmQhGjL0xwu8Ftbt1RDUJQeq1xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nie/fYJAXX71gaQ1rqB5UE3t1Q9hvm85pjx7H24pnF6EiM7JzCbApru0h5bl0wKOgQ0ssjA8UDXom/LrQ/o5HtuZ2eXb06/kKRyTMxomiavo19zSoSW/8RDxRR5uON9EtQKMrV8Vw1o4zmIik4opABXvFRkVtdvw1awHd4pdd7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J77+r4Dj; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J77+r4Dj"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f84a55cc06so2309980a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762727; x=1789367527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2d8OuPAlxNZ8hjWv+WV2WB8KqXzC5UIFEWCoCdAk0U=;
        b=J77+r4DjuUNrk8GU+Vudmy7AjuZpCUbCRI4skHBBklVb/G050qD1I4weFLw+eaBT0X
         GvCccLXshr2dAEhRxXMf8oi8j6ibLEMzKNoVkXT6w4pj4rTUtXzZrxEasU4H6WUqQjCi
         fZqB0iAWgXd7RleG9U/VQrOwcVq0TK0jN5qpftujnRO4i1oL8o77QdmMGBvvjPp4NxZy
         s4AETR6mJ1q4kP4vGLYQfUYk7LshotlWvBoRvxoiGp5M9Hm4je0f+xR3+VJoDBNkA79s
         0dcQOTJKbbYGOyXZq8MiIY+ugvUpDHVmM6S/jNcocMmUT7MPSkiokaqpLIUdru9y2PsT
         l4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762727; x=1789367527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2d8OuPAlxNZ8hjWv+WV2WB8KqXzC5UIFEWCoCdAk0U=;
        b=aMPlcV1ga9xymy7GcAExFPEMdvqPzeXq6HlgxVXAK2pnuTSVPllxp1dCWihWhhSeeV
         JW3TfCVzI7Ka6w/Z66zuWMmjkv0bRL5gEf+cCcCk9DU6pbeumrcVVJeFURTholpL1ftu
         N8beHaPLzGZzU78aLHg06Nwk0xg0dcpFB6LQuZtacoIXaFeWX7YnYSTSXDdAL8psoFn2
         JOHcWpZvL3be9opJRTcdhxSLZ00ygmRlozznZs6OBrVKwje9EWZeQH7rmCN+BJjxOhW+
         +ja8V26u2Q8USE1hkrVhsbQWJU92APef+qX7gAUfHotpOLl4TrcXM+4CzOJi+0uHGzYG
         w6yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxgBY1IAZhpc2d0ELTh75UdTo3UpVtATUZxbCP/RL0wXvPMwA1ezaSHZMkkybuzJ+/43Cfv2sHymgtpvc=@vger.kernel.org
X-Gm-Message-State: AFuF++mcj+ON/mA3qDjV/aFrgaRCHZg+Y8RL6Z2Gda06329bCgRQOsHX
	JiZZxdymiA5U+cqtGTCYNw3z1nmPGhswrr07cfPEB+Ql7EArV5G2X+Ib
X-Gm-Gg: AYBFou0XebSTvQ+udvLhfanNnC/Pf7zsvKu6juc5cIAUrA3bG0++/PeN1yHSzb90jfO
	QRBWnFT2eHvZpfe4MVDUHTc9AtZ/0rTQmI1vq8ObzpD+LelJYom/fi81Mm4DNlFGdeN7C5a9j88
	43wnOUG+yukCJbp0Jw7rd+rCZxf5tfJ010b5FwtALS2mlSTwzly+ZNh15SrV/8TLvTuQlYgglIW
	586qsf38EahqmaTVtLKXgijS7T1STxyveGM3t2lV2DA1pFM4XwIZ0R50VASEqDAadCQwVnFBbkP
	ZPVyCiQHOECZ46+h2eBKpd8fHCQMJjk7cdnqZ5arktDi0SDeCX+HtN+CWZ6xcdQY8hdDweNHQ/8
	NjYAT/P0HNdal7bgGPMZyYG8T4FBfVPuLkPzgAKXxO5ZZUpzt6KiCWFmzbw87NwO/h/PWcT4LkB
	54bahGwkOriMoB9r/mF8PuyWwTrEUeoRHWVDd5oiS+6x0RcS76jbTo4HtRwgwdlD/aaz2Up8vTr
	KURWfvkXMPusbjOjiKIhHwN
X-Received: by 2002:a05:6820:4d04:b0:6a0:f44b:1265 with SMTP id 006d021491bc7-6b6fa8e0837mr12749038eaf.4.1788762727148;
        Sun, 06 Sep 2026 23:32:07 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21042867c88.6.2026.09.06.23.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:32:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: fix typos in comments
Date: Mon,  7 Sep 2026 12:02:02 +0530
Message-ID: <20260907063202.20577-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/sound/emu10k1.h             | 4 ++--
 include/sound/emux_legacy.h         | 2 +-
 sound/core/seq/oss/seq_oss_init.c   | 2 +-
 sound/firewire/bebob/bebob_hwdep.c  | 2 +-
 sound/hda/codecs/hdmi/hdmi.c        | 2 +-
 sound/hda/codecs/realtek/alc882.c   | 2 +-
 sound/hda/codecs/sigmatel.c         | 6 +++---
 sound/hda/common/codec.c            | 2 +-
 sound/i2c/other/ak4113.c            | 2 +-
 sound/i2c/other/ak4114.c            | 2 +-
 sound/i2c/other/ak4xxx-adda.c       | 2 +-
 sound/isa/opti9xx/opti92x-ad1848.c  | 2 +-
 sound/mips/hal2.c                   | 4 ++--
 sound/pci/ac97/ac97_codec.c         | 2 +-
 sound/pci/ac97/ac97_patch.c         | 2 +-
 sound/pci/au88x0/au88x0.h           | 2 +-
 sound/pci/au88x0/au88x0_mpu401.c    | 2 +-
 sound/pci/aw2/aw2-saa7146.c         | 4 ++--
 sound/pci/cs4281.c                  | 2 +-
 sound/pci/cs46xx/cs46xx_lib.c       | 6 +++---
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 8 ++++----
 sound/pci/echoaudio/echoaudio.c     | 4 ++--
 sound/pci/echoaudio/echoaudio.h     | 4 ++--
 sound/pci/lx6464es/lx_core.c        | 2 +-
 sound/pci/lx6464es/lx_defs.h        | 2 +-
 sound/pci/pcxhr/pcxhr_core.c        | 4 ++--
 sound/pci/riptide/riptide.c         | 4 ++--
 sound/pci/rme32.c                   | 2 +-
 sound/pci/rme9652/hdsp.c            | 2 +-
 sound/pci/trident/trident_memory.c  | 2 +-
 sound/pci/vx222/vx222_ops.c         | 2 +-
 sound/pcmcia/vx/vxp_ops.c           | 2 +-
 sound/ppc/tumbler.c                 | 2 +-
 sound/usb/mixer.c                   | 4 ++--
 sound/usb/mixer_us16x08.h           | 2 +-
 35 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 4f94565c9d15..6474239a11c1 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -633,8 +633,8 @@ SUB_REG(PEFE, FILTERAMOUNT,	0x000000ff)	/* Filter envlope amount				*/
 #define A_ADCCR_RCHANENABLE	0x00000020
 #define A_ADCCR_LCHANENABLE	0x00000010
 
-#define A_ADCCR_SAMPLERATE_MASK 0x0000000F      /* Audigy sample rate convertor output rate		*/
-#define ADCCR_SAMPLERATE_MASK	0x00000007	/* Sample rate convertor output rate			*/
+#define A_ADCCR_SAMPLERATE_MASK 0x0000000F      /* Audigy sample rate converter output rate		*/
+#define ADCCR_SAMPLERATE_MASK	0x00000007	/* Sample rate converter output rate			*/
 #define ADCCR_SAMPLERATE_48	0x00000000	/* 48kHz sample rate					*/
 #define ADCCR_SAMPLERATE_44	0x00000001	/* 44.1kHz sample rate					*/
 #define ADCCR_SAMPLERATE_32	0x00000002	/* 32kHz sample rate					*/
diff --git a/include/sound/emux_legacy.h b/include/sound/emux_legacy.h
index 1127e30d33bb..55a7fbfb9bfa 100644
--- a/include/sound/emux_legacy.h
+++ b/include/sound/emux_legacy.h
@@ -5,7 +5,7 @@
 /*
  *  Copyright (c) 1999-2000 Takashi Iwai <tiwai@suse.de>
  *
- *  Definitions of OSS compatible headers for Emu8000 device informations
+ *  Definitions of OSS compatible headers for Emu8000 device information
  */
 
 #include <sound/seq_oss_legacy.h>
diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 1aece46c8b06..6586e07431c3 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -376,7 +376,7 @@ delete_seq_queue(int queue)
 
 
 /*
- * free device informations - private_free callback of port
+ * free device information - private_free callback of port
  */
 static void
 free_devinfo(void *private)
diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
index 216d1fceb6e7..1c523525fad2 100644
--- a/sound/firewire/bebob/bebob_hwdep.c
+++ b/sound/firewire/bebob/bebob_hwdep.c
@@ -8,7 +8,7 @@
 /*
  * This codes give three functionality.
  *
- * 1.get firewire node infomation
+ * 1.get firewire node information
  * 2.get notification about starting/stopping stream
  * 3.lock/unlock stream
  */
diff --git a/sound/hda/codecs/hdmi/hdmi.c b/sound/hda/codecs/hdmi/hdmi.c
index 1e7a05c87733..a8aac0b36c73 100644
--- a/sound/hda/codecs/hdmi/hdmi.c
+++ b/sound/hda/codecs/hdmi/hdmi.c
@@ -1671,7 +1671,7 @@ int snd_hda_hdmi_generic_pcm_prepare(struct hda_pcm_stream *hinfo,
 	 * After S3, the audio driver restores pin:cvt selections
 	 * but this can happen before gfx is ready and such selection
 	 * is overlooked by HW. Thus multiple pins can share a same
-	 * default convertor and mute control will affect each other,
+	 * default converter and mute control will affect each other,
 	 * which can cause a resumed audio playback become silent
 	 * after S3.
 	 */
diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/realtek/alc882.c
index fd466b6985f0..800c3d6f5134 100644
--- a/sound/hda/codecs/realtek/alc882.c
+++ b/sound/hda/codecs/realtek/alc882.c
@@ -372,7 +372,7 @@ static const struct hda_fixup alc882_fixups[] = {
 	[ALC883_FIXUP_ACER_EAPD] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
-			/* eanable EAPD on Acer laptops */
+			/* enable EAPD on Acer laptops */
 			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
 			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3050 },
 			{ }
diff --git a/sound/hda/codecs/sigmatel.c b/sound/hda/codecs/sigmatel.c
index ee3bd21adc36..9a8ba43667f7 100644
--- a/sound/hda/codecs/sigmatel.c
+++ b/sound/hda/codecs/sigmatel.c
@@ -361,7 +361,7 @@ static unsigned int stac_vref_led_power_filter(struct hda_codec *codec,
 	return snd_hda_gen_path_power_filter(codec, nid, power_state);
 }
 
-/* update mute-LED accoring to the master switch */
+/* update mute-LED according to the master switch */
 static void stac_update_led_status(struct hda_codec *codec, bool muted)
 {
 	struct sigmatel_spec *spec = codec->spec;
@@ -1710,7 +1710,7 @@ static const struct hda_pintbl ref92hd73xx_pin_configs[] = {
 	{ 0x11, 0x01014030 },
 	// CD in
 	{ 0x12, 0x02319040 },
-	// Digial Mic ins
+	// Digital Mic ins
 	{ 0x13, 0x90a000f0 },
 	{ 0x14, 0x90a000f0 },
 	// Digital outs
@@ -3817,7 +3817,7 @@ static const struct hda_pintbl dell_3st_pin_configs[] = {
 static void stac927x_fixup_ref_no_jd(struct hda_codec *codec,
 				     const struct hda_fixup *fix, int action)
 {
-	/* no jack detecion for ref-no-jd model */
+	/* no jack detection for ref-no-jd model */
 	if (action == HDA_FIXUP_ACT_PRE_PROBE)
 		codec->no_jack_detect = 1;
 }
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 7d17d773cfbf..b1965fb66814 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -3772,7 +3772,7 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_open);
 
 /**
- * snd_hda_multi_out_analog_prepare - Preapre the analog outputs.
+ * snd_hda_multi_out_analog_prepare - Prepare the analog outputs.
  * @codec: the HDA codec
  * @mout: hda_multi_out object
  * @stream_tag: stream tag to assign
diff --git a/sound/i2c/other/ak4113.c b/sound/i2c/other/ak4113.c
index 6ef5fffda8d7..9405d985a87d 100644
--- a/sound/i2c/other/ak4113.c
+++ b/sound/i2c/other/ak4113.c
@@ -130,7 +130,7 @@ void snd_ak4113_reinit(struct ak4113 *chip)
 	scoped_guard(mutex, &chip->reinit_mutex) {
 		ak4113_init_regs(chip);
 	}
-	/* bring up statistics / event queing */
+	/* bring up statistics / event queuing */
 	if (atomic_dec_and_test(&chip->wq_processing))
 		schedule_delayed_work(&chip->work, HZ / 10);
 }
diff --git a/sound/i2c/other/ak4114.c b/sound/i2c/other/ak4114.c
index 71efb29b6c7c..4c3dbbf8c316 100644
--- a/sound/i2c/other/ak4114.c
+++ b/sound/i2c/other/ak4114.c
@@ -135,7 +135,7 @@ void snd_ak4114_reinit(struct ak4114 *chip)
 	scoped_guard(mutex, &chip->reinit_mutex) {
 		ak4114_init_regs(chip);
 	}
-	/* bring up statistics / event queing */
+	/* bring up statistics / event queuing */
 	if (atomic_dec_and_test(&chip->wq_processing))
 		schedule_delayed_work(&chip->work, HZ / 10);
 }
diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
index 9dd36b82a6ac..e7410f0f8660 100644
--- a/sound/i2c/other/ak4xxx-adda.c
+++ b/sound/i2c/other/ak4xxx-adda.c
@@ -147,7 +147,7 @@ EXPORT_SYMBOL(snd_akm4xxx_reset);
  * Volume conversion table for non-linear volumes
  * from -63.5dB (mute) to 0dB step 0.5dB
  *
- * Used for AK4524/AK4620 input/ouput attenuation, AK4528, and
+ * Used for AK4524/AK4620 input/output attenuation, AK4528, and
  * AK5365 input attenuation
  */
 static const unsigned char vol_cvt_datt[128] = {
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index abaa3ed3ab5c..8a6db40ff893 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -378,7 +378,7 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 		 */
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(21), 0x82, 0xff);
 		/* 
-		 * This bit sets OPTI931 to automaticaly select FM
+		 * This bit sets OPTI931 to automatically select FM
 		 * or digital input signal.
 		 */
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(26), 0x01, 0x01);
diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index 2beb6a0dc3b7..84f265335cf9 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -375,7 +375,7 @@ static void hal2_setup_dac(struct snd_hal2 *hal2)
 	hal2_i_clearbit16(hal2, H2I_DMA_PORT_EN, H2I_DMA_PORT_EN_CODECTX);
 	/* Setup the HAL2 for playback */
 	hal2_set_dac_rate(hal2);
-	/* Set endianess */
+	/* Set endianness */
 	hal2_i_clearbit16(hal2, H2I_DMA_END, H2I_DMA_END_CODECTX);
 	/* Set DMA bus */
 	hal2_i_setbit16(hal2, H2I_DMA_DRV, (1 << pbus->pbusnr));
@@ -400,7 +400,7 @@ static void hal2_setup_adc(struct snd_hal2 *hal2)
 	hal2_i_clearbit16(hal2, H2I_DMA_PORT_EN, H2I_DMA_PORT_EN_CODECR);
 	/* Setup the HAL2 for record */
 	hal2_set_adc_rate(hal2);
-	/* Set endianess */
+	/* Set endianness */
 	hal2_i_clearbit16(hal2, H2I_DMA_END, H2I_DMA_END_CODECR);
 	/* Set DMA bus */
 	hal2_i_setbit16(hal2, H2I_DMA_DRV, (1 << pbus->pbusnr));
diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 0bb65be021d9..207ce083593f 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -2960,7 +2960,7 @@ int snd_ac97_tune_hardware(struct snd_ac97 *ac97,
 {
 	int result;
 
-	/* quirk overriden? */
+	/* quirk overridden? */
 	if (override && strcmp(override, "-1") && strcmp(override, "default")) {
 		result = apply_quirk_str(ac97, override);
 		if (result < 0)
diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index 64cc39dd2008..8577a2e0510c 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -430,7 +430,7 @@ static int patch_yamaha_ymf753(struct snd_ac97 * ac97)
 	/* Patch for Yamaha YMF753, Copyright (c) by David Shust, dshust@shustring.com.
 	   This chip has nonstandard and extended behaviour with regard to its S/PDIF output.
 	   The AC'97 spec states that the S/PDIF signal is to be output at pin 48.
-	   The YMF753 will ouput the S/PDIF signal to pin 43, 47 (EAPD), or 48.
+	   The YMF753 will output the S/PDIF signal to pin 43, 47 (EAPD), or 48.
 	   By default, no output pin is selected, and the S/PDIF signal is not output.
 	   There is also a bit to mute S/PDIF output in a vendor-specific register.
 	*/
diff --git a/sound/pci/au88x0/au88x0.h b/sound/pci/au88x0/au88x0.h
index 6cbb2bc4a048..f97a0303da3e 100644
--- a/sound/pci/au88x0/au88x0.h
+++ b/sound/pci/au88x0/au88x0.h
@@ -28,7 +28,7 @@
 
 /* Vortex MPU401 defines. */
 #define	MIDI_CLOCK_DIV		0x61
-/* Standart MPU401 defines. */
+/* Standard MPU401 defines. */
 #define	MPU401_RESET		0xff
 #define	MPU401_ENTER_UART	0x3f
 #define	MPU401_ACK		0xfe
diff --git a/sound/pci/au88x0/au88x0_mpu401.c b/sound/pci/au88x0/au88x0_mpu401.c
index 164f6b7039ab..dff4bf80ab96 100644
--- a/sound/pci/au88x0/au88x0_mpu401.c
+++ b/sound/pci/au88x0/au88x0_mpu401.c
@@ -22,7 +22,7 @@
 
 /* Vortex MPU401 defines. */
 #define MIDI_CLOCK_DIV      0x61
-/* Standart MPU401 defines. */
+/* Standard MPU401 defines. */
 #define MPU401_RESET		0xff
 #define MPU401_ENTER_UART	0x3f
 #define MPU401_ACK		    0xfe
diff --git a/sound/pci/aw2/aw2-saa7146.c b/sound/pci/aw2/aw2-saa7146.c
index c84f1a45194f..6857a0ec2924 100644
--- a/sound/pci/aw2/aw2-saa7146.c
+++ b/sound/pci/aw2/aw2-saa7146.c
@@ -147,7 +147,7 @@ void snd_aw2_saa7146_pcm_init_playback(struct snd_aw2_saa7146 *chip,
 	unsigned long dw_page, dw_limit;
 
 	/* Configure DMA for substream
-	   Configuration informations: ALSA has allocated continuous memory
+	   Configuration information: ALSA has allocated continuous memory
 	   pages. So we don't need to use MMU of saa7146.
 	 */
 
@@ -204,7 +204,7 @@ void snd_aw2_saa7146_pcm_init_capture(struct snd_aw2_saa7146 *chip,
 	unsigned long dw_page, dw_limit;
 
 	/* Configure DMA for substream
-	   Configuration informations: ALSA has allocated continuous memory
+	   Configuration information: ALSA has allocated continuous memory
 	   pages. So we don't need to use MMU of saa7146.
 	 */
 
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index f51f4bb63766..27ceda6278c5 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -324,7 +324,7 @@ MODULE_PARM_DESC(dual_codec, "Secondary Codec ID (0 = disabled).");
 #define BA0_SSCR_XLPSRC		(1<<8)	/* External SRC Loopback Mode */
 #define BA0_SSCR_LPSRC		(1<<7)	/* SRC Loopback Mode */
 #define BA0_SSCR_CDTX		(1<<5)	/* CD Transfer Data */
-#define BA0_SSCR_HVC		(1<<3)	/* Harware Volume Control Enable */
+#define BA0_SSCR_HVC		(1<<3)	/* Hardware Volume Control Enable */
 
 #define BA0_FMLVC		0x0754	/* FM Synthesis Left Volume Control */
 #define BA0_FMRVC		0x0758	/* FM Synthesis Right Volume Control */
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 19a6927c079d..a16586f7d913 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -315,7 +315,7 @@ int snd_cs46xx_download(struct snd_cs46xx *chip,
 	dst = chip->region.idx[bank+1].remap_addr + offset;
 	len /= sizeof(u32);
 
-	/* writel already converts 32-bit value to right endianess */
+	/* writel already converts 32-bit value to right endianness */
 	while (len-- > 0) {
 		writel(*src++, dst);
 		dst += sizeof(u32);
@@ -474,7 +474,7 @@ int snd_cs46xx_clear_BA1(struct snd_cs46xx *chip,
 	dst = chip->region.idx[bank+1].remap_addr + offset;
 	len /= sizeof(u32);
 
-	/* writel already converts 32-bit value to right endianess */
+	/* writel already converts 32-bit value to right endianness */
 	while (len-- > 0) {
 		writel(0, dst);
 		dst += sizeof(u32);
@@ -3039,7 +3039,7 @@ static int snd_cs46xx_chip_init(struct snd_cs46xx *chip)
 #endif
 
 	/*
-	 *  Assert the vaid frame signal so that we can start sending commands
+	 *  Assert the valid frame signal so that we can start sending commands
 	 *  to the AC97 codec.
 	 */
 	snd_cs46xx_pokeBA0(chip, BA0_ACCTL, ACCTL_VFRM | ACCTL_ESYN | ACCTL_RSTN);
diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index fd19365026b4..d483f9a609be 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -160,15 +160,15 @@ void cs46xx_dsp_remove_scb (struct snd_cs46xx *chip, struct dsp_scb_descriptor *
 {
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 
-	/* check integrety */
+	/* check integrity */
 	if (snd_BUG_ON(scb->index < 0 ||
 		       scb->index >= ins->nscb ||
 		       (ins->scbs + scb->index) != scb))
 		return;
 
 #if 0
-	/* can't remove a SCB with childs before 
-	   removing childs first  */
+	/* can't remove a SCB with children before 
+	   removing children first  */
 	if (snd_BUG_ON(scb->sub_list_ptr != ins->the_null_scb ||
 		       scb->next_scb_ptr != ins->the_null_scb))
 		goto _end;
@@ -1656,7 +1656,7 @@ int  cs46xx_dsp_disable_spdif_out (struct snd_cs46xx *chip)
 		return -EBUSY;
 	}
 
-	/* check integrety */
+	/* check integrity */
 	if (snd_BUG_ON(!ins->asynch_tx_scb))
 		return -EINVAL;
 	if (snd_BUG_ON(!ins->spdif_pcm_input_scb))
diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 214d68657707..8b4637231deb 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -270,7 +270,7 @@ static int pcm_open(struct snd_pcm_substream *substream,
 		return -ENOMEM;
 	pipe->index = -1;		/* Not configured yet */
 
-	/* Set up hw capabilities and contraints */
+	/* Set up hw capabilities and constraints */
 	memcpy(&pipe->hw, &pcm_hardware_skel, sizeof(struct snd_pcm_hardware));
 	dev_dbg(chip->card->dev, "max_channels=%d\n", max_channels);
 	pipe->constr.list = channels_list;
@@ -1720,7 +1720,7 @@ static const struct snd_kcontrol_new snd_echo_vumeters = {
 
 
 
-/*** Channels info - it exports informations about the number of channels ***/
+/*** Channels info - it exports information about the number of channels ***/
 static int snd_echo_channels_info_info(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_info *uinfo)
 {
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index 7a5744bf3155..ac4507b7cc78 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -394,8 +394,8 @@ struct echoaudio {
 
 	u16 digital_modes;		/* Bitmask of supported modes
 					 * (see ECHOCAPS_HAS_DIGITAL_MODE_*) */
-	u16 input_clock_types;		/* Suppoted input clock types */
-	u16 output_clock_types;		/* Suppoted output clock types -
+	u16 input_clock_types;		/* Supported input clock types */
+	u16 output_clock_types;		/* Supported output clock types -
 					 * Layla20 only */
 	u16 device_id, subdevice_id;
 	u16 *dsp_code;			/* Current DSP code loaded,
diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index 9909f1067871..ae265dd19333 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -364,7 +364,7 @@ int lx_dsp_get_mac(struct lx6464es *chip)
 	macmsb = lx_dsp_reg_read(chip, eReg_ADMACESMSB) & 0x00FFFFFF;
 	maclsb = lx_dsp_reg_read(chip, eReg_ADMACESLSB) & 0x00FFFFFF;
 
-	/* todo: endianess handling */
+	/* todo: endianness handling */
 	chip->mac_address[5] = ((u8 *)(&maclsb))[0];
 	chip->mac_address[4] = ((u8 *)(&maclsb))[1];
 	chip->mac_address[3] = ((u8 *)(&maclsb))[2];
diff --git a/sound/pci/lx6464es/lx_defs.h b/sound/pci/lx6464es/lx_defs.h
index eca5367ba561..89e433d3f7a2 100644
--- a/sound/pci/lx6464es/lx_defs.h
+++ b/sound/pci/lx6464es/lx_defs.h
@@ -315,7 +315,7 @@ enum stream_flags {
 #define ED_XILINX_ERROR                 (ED_RT | 0x07)
 #define ED_COBRANET_ITF_NOT_RESPONDING  (ED_RT | 0x08)
 
-/* Complete BOARD error code for the invaid standard object class */
+/* Complete BOARD error code for the invalid standard object class */
 #define EB_ISO          (ERROR_VALUE | E_SOURCE_BOARD | \
 			 E_CLASS_INVALID_STD_OBJECT)
 #define EB_INVALID_EFFECT               (EB_ISO | 0x00)
diff --git a/sound/pci/pcxhr/pcxhr_core.c b/sound/pci/pcxhr/pcxhr_core.c
index b3b9ab4f303e..f855d3bfad4b 100644
--- a/sound/pci/pcxhr/pcxhr_core.c
+++ b/sound/pci/pcxhr/pcxhr_core.c
@@ -802,7 +802,7 @@ static int pcxhr_prepair_pipe_start(struct pcxhr_mgr *mgr,
 					   err);
 				return err;
 			}
-			/* if the pipe couldn't be prepaired for start,
+			/* if the pipe couldn't be prepared for start,
 			 * retry it later
 			 */
 			if (rmh.stat[0] == 0)
@@ -913,7 +913,7 @@ int pcxhr_set_pipe_state(struct pcxhr_mgr *mgr, int playback_mask,
 			if (err)
 				return err;
 			if (state == 0)
-				break;	/* success, all pipes prepaired */
+				break;	/* success, all pipes prepared */
 			mdelay(1);	/* wait 1 millisecond and retry */
 		}
 	} else {
diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 99c00e46ce23..697fece744e7 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -264,7 +264,7 @@ MODULE_PARM_DESC(opl3_port, "OPL3 port # for Riptide driver.");
 #define SEND_SI2S(p,b)             sendcmd(p,PARM,SI2S,WORD2(b),RET(0))
 
 #define EOB_STATUS         0x80000000	/* status flags : block boundary */
-#define EOS_STATUS         0x40000000	/*              : stoppped */
+#define EOS_STATUS         0x40000000	/*              : stopped */
 #define EOC_STATUS         0x20000000	/*              : stream end */
 #define ERR_STATUS         0x10000000
 #define EMPTY_STATUS       0x08000000
@@ -453,7 +453,7 @@ struct snd_riptide {
 	int in_suspend;
 };
 
-struct sgd {			/* scatter gather desriptor */
+struct sgd {			/* scatter gather descriptor */
 	__le32 dwNextLink;
 	__le32 dwSegPtrPhys;
 	__le32 dwSegLen;
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 454a30a2c07e..1d5390621908 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -8,7 +8,7 @@
  *      Thanks to :        Anders Torger <torger@ludd.luth.se>,
  *                         Henk Hesselink <henk@anda.nl>
  *                         for writing the digi96-driver 
- *                         and RME for all informations.
+ *                         and RME for all information.
  * 
  * ****************************************************************************
  * 
diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 31cc2d91c8d2..0ade73057731 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3664,7 +3664,7 @@ snd_hdsp_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 
 	snd_iprintf(buffer, "\n");
 
-	/* Informations about H9632 specific controls */
+	/* Information about H9632 specific controls */
 	if (hdsp->io_type == H9632) {
 		char *tmp;
 
diff --git a/sound/pci/trident/trident_memory.c b/sound/pci/trident/trident_memory.c
index 81f6348191dc..4ed0e7d68322 100644
--- a/sound/pci/trident/trident_memory.c
+++ b/sound/pci/trident/trident_memory.c
@@ -27,7 +27,7 @@
 #if PAGE_SIZE == 4096
 /* page size == SNDRV_TRIDENT_PAGE_SIZE */
 #define ALIGN_PAGE_SIZE		PAGE_SIZE	/* minimum page size for allocation */
-#define MAX_ALIGN_PAGES		SNDRV_TRIDENT_MAX_PAGES	/* maxmium aligned pages */
+#define MAX_ALIGN_PAGES		SNDRV_TRIDENT_MAX_PAGES	/* maximum aligned pages */
 /* fill TLB entrie(s) corresponding to page with ptr */
 #define set_tlb_bus(trident,page,addr) __set_tlb_bus(trident,page,addr)
 /* fill TLB entrie(s) corresponding to page with silence pointer */
diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index b6459dbdb1b0..40f3716c478f 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -431,7 +431,7 @@ static int vx2_load_dsp(struct vx_core *vx, int index, const struct firmware *ds
 /*
  * vx_test_and_ack - test and acknowledge interrupt
  *
- * called from irq hander, too
+ * called from irq handler, too
  *
  * spinlock held!
  */
diff --git a/sound/pcmcia/vx/vxp_ops.c b/sound/pcmcia/vx/vxp_ops.c
index 4211e7239138..e52b61125629 100644
--- a/sound/pcmcia/vx/vxp_ops.c
+++ b/sound/pcmcia/vx/vxp_ops.c
@@ -265,7 +265,7 @@ static int vxp_load_dsp(struct vx_core *vx, int index, const struct firmware *fw
 /*
  * vx_test_and_ack - test and acknowledge interrupt
  *
- * called from irq hander, too
+ * called from irq handler, too
  *
  * spinlock held!
  */
diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index 139c7b25927a..7ba52e7a24d7 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -1134,7 +1134,7 @@ static long tumbler_find_device(const char *device, const char *platform,
 		gp->active_val = 0x4;
 		gp->inactive_val = 0x5;
 		/* Here are some crude hacks to extract the GPIO polarity and
-		 * open collector informations out of the do-platform script
+		 * open collector information out of the do-platform script
 		 * as we don't yet have an interpreter for these things
 		 */
 		if (platform)
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ecaa8bc08d7c..33a6a1281410 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -786,7 +786,7 @@ static int parse_term_uac2_iterm_unit(struct mixer_build *state,
 		return err;
 
 	/* save input term properties after recursion,
-	 * to ensure they are not overriden by the recursion calls
+	 * to ensure they are not overridden by the recursion calls
 	 */
 	term->id = id;
 	term->type = le16_to_cpu(d->wTerminalType);
@@ -809,7 +809,7 @@ static int parse_term_uac3_iterm_unit(struct mixer_build *state,
 		return err;
 
 	/* save input term properties after recursion,
-	 * to ensure they are not overriden by the recursion calls
+	 * to ensure they are not overridden by the recursion calls
 	 */
 	term->id = id;
 	term->type = le16_to_cpu(d->wTerminalType);
diff --git a/sound/usb/mixer_us16x08.h b/sound/usb/mixer_us16x08.h
index 7b8583dd3b07..e98fe55265d1 100644
--- a/sound/usb/mixer_us16x08.h
+++ b/sound/usb/mixer_us16x08.h
@@ -60,7 +60,7 @@
 #define SND_US16X08_ID_EQHIGHMIDLEVEL 0x03
 #define SND_US16X08_ID_EQHIGHLEVEL 0x04
 
-/* EQ frequence IDs */
+/* EQ frequency IDs */
 #define SND_US16X08_ID_EQLOWFREQ 0x11
 #define SND_US16X08_ID_EQLOWMIDFREQ 0x12
 #define SND_US16X08_ID_EQHIGHMIDFREQ 0x13
-- 
2.48.1

