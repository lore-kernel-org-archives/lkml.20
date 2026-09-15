Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E67948C41F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461877; cv=none; b=bCcFClCsVNVOXF7PKZxkjhNvlh3kQuu9cr940gCwFzWCpHyNvv54LKxXZxE1UReZyOGGZ8+0fHBWQN1tBzCqoOjwHtAi5zhmhVTXIGhB6Hthk2RTK+RLupG2cu5HeNpWFTgXig3LpuwZf9iuE4Fy659fhh4ApFErYD0bHEfltms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461877; c=relaxed/simple;
	bh=upH+IFQ+hJJkaxU+vwAz51yIgobCT9FBEVaXNLhDiUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WB94/otR0wMFzJ9gRojA0tmNiW6psAUsVjuiKfpbP2XhDXVD62kgunJRpQaa/oGTZioikBcn4HrnorEFHK2oWzOCdoY3+t7WxVrbd/1lw/XuA5qFPmZ2JSDbmOYw4eYxQCiAs4wmr42Nvdj53/bdgBlNS4e8sGJeGDFNd/4rmQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aewuQuRd; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aewuQuRd"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so12883a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461875; x=1790066675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylilaqzGd4+wDElYgc1r6MvGWXeMih3UuS2gDpFMXzk=;
        b=aewuQuRdsbOIoJkUJxIkmSILBZ9mvfPPFY7LzmWb4KZI9xLa7SuI9zjYguJef9tJXF
         fMwxC9lHGfZCxu0vHrAoDa2SiJjvT2RMYXCZdpbhMxaNe2rOORGRIIkCQG0S7o46Bouj
         GnK31YG0Ax7TN2pSjpekVYI6egUBOVoFBPEKT+Bz/YZz2o/GDSsbBrOPMoAuvPF5gUy/
         XibkG8ae5dzDp1REzFJilKf7si5Vh8QZXNwRTzNVTQrsYdxd1kf1OQmndoS39jAyMMyB
         jdGJaDJJjvDnJVK/e+5UDSa40+hpLg3WqJOj7DQz6MRZ/2bwWUWKaQhmch1NOMhLujN+
         84Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461875; x=1790066675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ylilaqzGd4+wDElYgc1r6MvGWXeMih3UuS2gDpFMXzk=;
        b=j+fzWunThEwc6pkALLjoo5jVr4O4UKDgSOSwoc6b+2z9mh9j5jCoKgQUIfVn06RmTP
         BBftFCFzTR/aozOuimam+a0sRh2BoMJlBZ6KxmsxaDKTM1pXfTrtF+gB4mGoo1ezRIxe
         VEeaqsBZAUt8Js58wRUrb0t2wxpH9Mwvam/KaLuwLEAUHej3VpVqL10V43OvIKPDBLLy
         W7EdVq6wsfeA2Lv7+O13IUaR9trjqHy/Tr8z/RitIdCeQhT++8s9BKQJOPiQ0uYxyoJ2
         h5AV9Dm5VP7MK/3vwN3tKb0yvznE0qNN7CTHgwyeKDTe08puyGCbfDb2IE+VQosFQKMo
         4OPg==
X-Forwarded-Encrypted: i=1; AKwUvBwKbiUKedYz59MX9UzSDAuoiS8N2XblUfHezH1UY7v1ElTGf/4aheO8RThoMPnBm2iwktJcy7ICzfEXFn4=@vger.kernel.org
X-Gm-Message-State: AFuF++kKWrLo53PxKrIvOb5WuPjBAiEr4fzxEnjhdQ0F9hgoZxb3eggA
	tQyLZb68IyYT2H+N5vAcEdskYOrmIfMeRCWoOmx2RBWELFbCwJ4m4YSs
X-Gm-Gg: AYBFou2UEGf3jGKrt2YBUsyMonmSTOUOW2nlp5Aq8i1PDl6TG3GJJLFDJtqWWRaI2zy
	slSkm1Q/WdRxjqvSNxA512HZaGb02Gy16fYj0gLRq8n7lplLVP5mnOMuFm0ejtuNKTJ+F0vwCEI
	iSDP/3EkfL8jITpRoxyQbUPVgvGYnCR76WiBTWoKYp6a22/Geiw3rc/9Jgf2j4RBaxEaFh/p+OL
	2A5MM7vDsoCU+nf+yCOzQr46jkf554mFQytcSiSVyobLoYge3AZ08hIsWgDJK1oYPAelsDSYBs9
	+O18JhARtE7+zy9EXzJvRCPqEehgQ2z5mrsAT5WG2v67qH/rbOt7oYV4nvmTIja7l66tQXuq+0S
	xdxQxZo7RnbTk2MlkTAPKxHyULsPREv3fEQTB32iWhNLeLlUFqQvEdmn5sSYhH8/+YvGSviDFGd
	lnlFAszIXWCjuykb+nwAJg2xnGFkplF8MJFn6nBKEcZqdtkWZc4/tjr0Rt37pI3Ei/T6VA5V18b
	6pYEx28tGEbPyt6KwMfAbGW3FBhF3Kkdh+M
X-Received: by 2002:a05:6a21:7484:b0:3d3:b00b:26e8 with SMTP id adf61e73a8af0-3dd52968440mr501882637.28.1789461875346;
        Tue, 15 Sep 2026 01:44:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:35 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 02/23] ALSA: hda: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:03 +0530
Message-ID: <20260915084424.1007757-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/hda/codecs/hdmi/hdmi.c      | 2 +-
 sound/hda/codecs/realtek/alc882.c | 2 +-
 sound/hda/codecs/sigmatel.c       | 6 +++---
 sound/hda/common/codec.c          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

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
-- 
2.48.1

