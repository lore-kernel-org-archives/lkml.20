Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792441146;
	b=n0C0+3+22+c9P1+sRxTjvP7xuX49hPAmM6lUZweSNPSxgzc680McIn6YPKE33lcZ/EzI
	 uXOQWP1PgBqOZoAXIWzDw9zpCWhj+8cSFcWFZGKa2ZogWO6Ye165SnS0ONwpPibwdt/IY
	 hydhpi9jVXEIVcXE8Cz0umKrS+ZrlXfwF8+y0FDVuugJdorjMmXy4tnmCgQKHbPpiQ2O5
	 GwzLAQFz72OcZ5ztbagkketbSRYfTNpj2IniQ4ObKpH2cAC732tnAC0uprtMgJGnBcid0
	 yIAHTLlgQmCDRupC4gLL1uPPeP9s/FpiVl83AWIjXWe9JPzi/H4b7+xm34vGOh/cMkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441146;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=h7rLyLmPOSGJVU+slJNzOH7TKhaynybzvfIwWX2W/cE=;
	b=3VCNAPBsl4MZPCZRz8D1uWZzgEfQEaWhaMUPSN6xTIRZDgnEcdYSHUFZeVbFzpC0rYkH
	 y45vRtJUxRahVdijhfsSVx77U+0GHTSMENd2YZN3y5OySBVMLpyofIYOncgL5b5hcvJPJ
	 XJfUKiDbWTVHZhbst0w2NAUYK/IqwUweOE4RokCj6hoJRQZGsX0NpLWTzAmAS4h+IM20m
	 fA6o9e7dVXVMxWNx1Q6hMf0Qlc6RiruTscBXjIaBrZnt1OTFp4A+84GcfFMR8eIXNX2gn
	 QovSXpIeu2T55ocLYkir94KHRTTheX2QZtwMBhygesHuk920eq2wdYjPXnnQBxugvVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=bGLevzhL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E759606A31D;
	Mon, 19 Oct 2026 20:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E759606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=bGLevzhL
ARC-Seal: i=1; a=rsa-sha256; t=1792441123; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iyI+wCbn8xqKBVA8rsvER2qGIclnTZgUQTyR0hNWKNgCSg875FJBnOkuVT6m/UyN19fW+a4n7rZmYGDH0+JKicW+T1f1xkKr0YIMi9JJnXEotQqLBTPk5tZ9ZOCwT97+EYzJtrqapXlWY1vveRYzAgMdG9tYktn70lfVZH7Op/U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792441123; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h7rLyLmPOSGJVU+slJNzOH7TKhaynybzvfIwWX2W/cE=; 
	b=Lvmtz/N/o2OO9nZ0lrTd9UT2KQQ5QO1w4AoNzB/GVHQ0yGgyLoGRGkwPs+GxW62gNV2KdnGIXKalR1laleE6/Oo2Gi0HEb8/boITA72k1YWYJ+8GC2ZMd9hTgCq3d2qy1xOl4P2Sb/WHaIExYleQAp/KeGVYzXsNd647Q9ks7v0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792441123;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=h7rLyLmPOSGJVU+slJNzOH7TKhaynybzvfIwWX2W/cE=;
	b=bGLevzhLYTTI7/kSrjki2/iOfs6PrRf4a6qN8TqJgPkyrLlT/7Fl5/9RiqHUbITv
	VuXg61yMDDAsxCm3K+BkbMUFfL1ytg418Vlc0LnAIn/u3he9g2KFpFOZRbLIZ0dEc0y
	JHN6pJbPKFJal1Zg89VYSWsnVB9UTPmkONVZ7tzL/a6xwasMWv0UXr0mbChk8yQJYJw
	vMouIOAvi+urxQdtYnK7U1wQV6fpFT3DlBoiPOvBNgIl94La1Ea/B5mOOmUNXShFc9p
	DYo6GfYfBHyHTvYfmagPS0hnIndeoqxFG3GthHITcm1G3EKuRKQT7q+XFo0nqZ8aNZA
	gOT9quKHdw==
Received: by smtp.zohomail.com with SMTPS id 1792441120531582.0075408062726;
	Mon, 19 Oct 2026 13:18:40 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 20 Oct 2026 04:18:22 +0800
Subject: [PATCH 1/4] ALSA: usb-audio: Unify dB scale override
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-b4-uac-ya-audio-v1-1-2d6e053b7f50@rong.moe>
References: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
In-Reply-To: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.de>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
X-ZohoMailClient: External

Currently, both snd_dragonfly_quirk_db_scale() and
snd_usb_mixer_fu_quirk_linear_scale() override dB scale.

Collect the code snippets for dB scale override into a helper function,
with unified info and warning messages. Also deconflict playback dB
scale quirks of DragonFly.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer_quirks.c | 107 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 34 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index fc622eb95dc5..e2f7ca4252e2 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4646,6 +4646,72 @@ void snd_usb_mixer_rc_memory_change(struct usb_mixer_interface *mixer,
 	}
 }
 
+static void snd_usb_apply_db_scale(struct usb_mixer_interface *mixer,
+				   struct usb_mixer_elem_info *cval, struct snd_kcontrol *kctl,
+				   const unsigned int *scale, const char *desc)
+{
+	if (!scale) {
+		usb_audio_info(mixer->chip, "clearing %s dB scale on [%s] (%d/%d/%d)\n",
+			       desc, kctl->id.name, cval->min, cval->max, cval->res);
+
+		kctl->tlv.p = NULL;
+		kctl->vd[0].access &= ~(SNDRV_CTL_ELEM_ACCESS_TLV_READ |
+					SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK);
+		return;
+	}
+
+	usb_audio_info(mixer->chip, "applying %s dB scale quirk on [%s] (%d/%d/%d)\n",
+		       desc, kctl->id.name, cval->min, cval->max, cval->res);
+
+	if (kctl->vd[0].access & SNDRV_CTL_ELEM_ACCESS_TLV_READ &&
+	    !(kctl->vd[0].access & SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK)) {
+		usb_audio_warn(mixer->chip,
+			       "%s dB scale quirk overrides the previously applied one on [%s]\n",
+			       desc, kctl->id.name);
+	} else if (cval->min_mute) {
+		/*
+		 * We are clearing SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK,
+		 * resulting in min_mute becoming a no-op.
+		 */
+		usb_audio_warn(mixer->chip, "%s dB scale quirk overrides MIN_MUTE on [%s]\n",
+			       desc, kctl->id.name);
+	}
+
+	kctl->tlv.p = scale;
+	kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
+	kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
+}
+
+static void snd_usb_mixer_fu_quirk_linear_scale(struct usb_mixer_interface *mixer,
+						struct usb_mixer_elem_info *cval,
+						struct snd_kcontrol *kctl)
+{
+	static const DECLARE_TLV_DB_LINEAR(scale, TLV_DB_GAIN_MUTE, 0);
+
+	snd_usb_apply_db_scale(mixer, cval, kctl, scale, "linear volume");
+}
+
+/* Respect quirks set by module parameters or quirk flags table. */
+static inline bool deconflict_playback_tlv_quirks(struct usb_mixer_interface *mixer,
+						  struct snd_kcontrol *kctl)
+{
+	const u64 playback_quirk_flags = (QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE |
+					  QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL);
+
+	return (!(mixer->chip->quirk_flags & playback_quirk_flags) &&
+		strstr(kctl->id.name, "Playback"));
+}
+
+static inline bool deconflict_capture_tlv_quirks(struct usb_mixer_interface *mixer,
+						 struct snd_kcontrol *kctl)
+{
+	const u64 capture_quirk_flags = (QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE |
+					 QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL);
+
+	return (!(mixer->chip->quirk_flags & capture_quirk_flags) &&
+		strstr(kctl->id.name, "Capture"));
+}
+
 static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
 					 struct usb_mixer_elem_info *cval,
 					 struct snd_kcontrol *kctl)
@@ -4666,18 +4732,16 @@ static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
 		41, 50, TLV_DB_MINMAX_ITEM(-441, 0),
 	);
 
-	if (cval->min == 0 && cval->max == 50) {
-		usb_audio_info(mixer->chip, "applying DragonFly dB scale quirk (0-50 variant)\n");
-		kctl->tlv.p = scale;
-		kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
-		kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
+	if (!deconflict_playback_tlv_quirks(mixer, kctl))
+		return;
 
+	if (cval->min == 0 && cval->max == 50) {
+		snd_usb_apply_db_scale(mixer, cval, kctl, scale, "DragonFly");
 	} else if (cval->min == 0 && cval->max <= 1000) {
 		/* Some other clearly broken DragonFly variant.
 		 * At least a 0..53 variant (hw v1.0) exists.
 		 */
-		usb_audio_info(mixer->chip, "ignoring too narrow dB range on a DragonFly device");
-		kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
+		snd_usb_apply_db_scale(mixer, cval, kctl, NULL, "DragonFly");
 	}
 }
 
@@ -4745,25 +4809,6 @@ static void snd_fix_plt_name(struct snd_usb_audio *chip,
 	usb_audio_dbg(chip, "something wrong in kctl name %s\n", id->name);
 }
 
-static void snd_usb_mixer_fu_quirk_linear_scale(struct usb_mixer_interface *mixer,
-						struct usb_mixer_elem_info *cval,
-						struct snd_kcontrol *kctl)
-{
-	static const DECLARE_TLV_DB_LINEAR(scale, TLV_DB_GAIN_MUTE, 0);
-
-	if (cval->min_mute) {
-		/*
-		 * We are clearing SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK,
-		 * resulting in min_mute being a no-op.
-		 */
-		usb_audio_warn(mixer->chip, "LINEAR_VOL overrides MIN_MUTE\n");
-	}
-
-	kctl->tlv.p = scale;
-	kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
-	kctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
-}
-
 void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 				  struct usb_mixer_elem_info *cval, int unitid,
 				  struct snd_kcontrol *kctl)
@@ -4796,18 +4841,12 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 		}
 
 	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL)
-		if (cval->control == UAC_FU_VOLUME && strstr(kctl->id.name, "Playback")) {
-			usb_audio_info(mixer->chip,
-				       "applying playback linear volume quirk\n");
+		if (cval->control == UAC_FU_VOLUME && strstr(kctl->id.name, "Playback"))
 			snd_usb_mixer_fu_quirk_linear_scale(mixer, cval, kctl);
-		}
 
 	if (mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL)
-		if (cval->control == UAC_FU_VOLUME && strstr(kctl->id.name, "Capture")) {
-			usb_audio_info(mixer->chip,
-				       "applying capture linear volume quirk\n");
+		if (cval->control == UAC_FU_VOLUME && strstr(kctl->id.name, "Capture"))
 			snd_usb_mixer_fu_quirk_linear_scale(mixer, cval, kctl);
-		}
 
 	/* ALSA-ify some Plantronics headset control names */
 	if (USB_ID_VENDOR(mixer->chip->usb_id) == 0x047f &&

-- 
2.55.0

