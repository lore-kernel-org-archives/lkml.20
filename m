Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F5B4D2ED3;
	Wed,  7 Oct 2026 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393662; cv=none; b=pj9BnyJ1H6Shcj7Xc6OT+/aMZi3JKBMOZrLIJs/pmDh4GQqAL9me+FFNaS4RjMFH+pYgOiUE/N6oavhNUwOqLJIs1djEGUy9wYRGbweZc/YqjToX9ZNpa/Ly/Ji7gEGDjgntGNWO478AQO6642nFrR7uw6j5G5YKUbOYFSabmt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393662; c=relaxed/simple;
	bh=78jGNEWbAvC+11xXJ47IE2ibWqcFzH4Cl/QZq3VAqJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhkQu+QQNOVl/C7zg5hQP/m0fGx2hapDxt8V1wonkhW3/QeqeDKKERVwbjy/ArdWbOhoNAylMfPBeSJddnbQ7PMjddKdumGRiI8lI/6Wf3ga3vawtnbf6ToMaSOdKCyAI9vlkSRGPMvRInqX0KQ/5MUwNNEj6OAdjDIEAcIxrfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QiknVNJL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7WtLWDjZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QiknVNJL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7WtLWDjZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QiknVNJL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7WtLWDjZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QiknVNJL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7WtLWDjZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D6BE921BC7;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZKojQminosrTvxzCU93CJreJFQ7s4th1j+CYYoAcdI=;
	b=QiknVNJLNGxgq3tC9PGYooVPf1uoh18cWBtBAUd9HkFUz1UBZWc0ThnnfLcJaWALEqxRuG
	RVb/mfFVwfnrZf7ZV4OgIg/oDfSwWrBmp84hjNBuX+iblJTC44UoFBi4JlzE9elTSj1yDN
	K4y8C6scA/x/jPVa2VlkHc5cl2r0kr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZKojQminosrTvxzCU93CJreJFQ7s4th1j+CYYoAcdI=;
	b=7WtLWDjZVSwwIUBvZTF0CTxCkZUxBGZXY9ZBBfhSs4b41N5F+ytbXLVlPiMyeq80tUsJzM
	Bj7QZq/mnDEfYBBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZKojQminosrTvxzCU93CJreJFQ7s4th1j+CYYoAcdI=;
	b=QiknVNJLNGxgq3tC9PGYooVPf1uoh18cWBtBAUd9HkFUz1UBZWc0ThnnfLcJaWALEqxRuG
	RVb/mfFVwfnrZf7ZV4OgIg/oDfSwWrBmp84hjNBuX+iblJTC44UoFBi4JlzE9elTSj1yDN
	K4y8C6scA/x/jPVa2VlkHc5cl2r0kr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZKojQminosrTvxzCU93CJreJFQ7s4th1j+CYYoAcdI=;
	b=7WtLWDjZVSwwIUBvZTF0CTxCkZUxBGZXY9ZBBfhSs4b41N5F+ytbXLVlPiMyeq80tUsJzM
	Bj7QZq/mnDEfYBBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55047139BC;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8rcALXZ/xmp1CgAAD6G6ig:T8
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:20:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/8] ALSA: usb-audio: Fix mixer bitmap cache over 32 channels
Date: Wed,  7 Oct 2026 19:20:43 +0200
Message-ID: <20261007172051.13240-8-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007172051.13240-1-tiwai@suse.de>
References: <20261007172051.13240-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

USB-audio driver keeps the bitmap for the cached mixer channels, but
since a 32bit integer is used, it's currently broken for over 32
channels.  As the driver is supposed to support up to 64 channels,
this patch extends the bitmap properly -- now to be more flexible, use
the standard bitmap instead of the manual bit shifts.

Some checks for master channels are replaced in a slightly different
manner (checking the channel index 0) instead of the full cval->cached
check, so that it fits better in the bitmap helper usage.

Fixes: 16ee07bfa935 ("ALSA: usb-audio: Extend max number of channels to 64")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c          | 20 ++++++++++----------
 sound/usb/mixer.h          |  2 +-
 sound/usb/mixer_scarlett.c | 18 +++++++++---------
 sound/usb/mixer_us16x08.c  | 20 ++++++++++----------
 4 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 695d51f7aeb4..49a8a26f1a96 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -423,7 +423,7 @@ int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
 {
 	int err;
 
-	if (cval->cached & BIT(channel)) {
+	if (test_bit(channel, cval->cached)) {
 		*value = cval->cache_val[index];
 		return 0;
 	}
@@ -440,7 +440,7 @@ int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
 				      cval->control, channel, err);
 		return err;
 	}
-	cval->cached |= BIT(channel);
+	set_bit(channel, cval->cached);
 	cval->cache_val[index] = *value;
 	return 0;
 }
@@ -604,7 +604,7 @@ int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
 					  value);
 	if (err < 0)
 		return err;
-	cval->cached |= BIT(channel);
+	set_bit(channel, cval->cached);
 	cval->cache_val[index] = value;
 	return 0;
 }
@@ -1449,7 +1449,7 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		 * properly.
 		 */
 		if (ret)
-			cval->cached = 0;
+			bitmap_zero(cval->cached, MAX_CHANNELS + 1);
 
 		cval->initialized = 1;
 	}
@@ -3669,7 +3669,7 @@ void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid)
 		info = mixer_elem_list_to_info(list);
 		/* invalidate cache, so the value is read from the device */
 		if (!info->get_cur_broken)
-			info->cached = 0;
+			bitmap_zero(info->cached, MAX_CHANNELS + 1);
 		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &list->kctl->id);
 	}
@@ -3736,7 +3736,7 @@ static void snd_usb_mixer_interrupt_v2(struct usb_mixer_interface *mixer,
 	__u8 channel = value & 0xff;
 	unsigned int count = 0;
 
-	if (channel >= MAX_CHANNELS) {
+	if (channel > MAX_CHANNELS) {
 		usb_audio_dbg(mixer->chip,
 			"%s(): bogus channel number %d\n",
 			__func__, channel);
@@ -3768,9 +3768,9 @@ static void snd_usb_mixer_interrupt_v2(struct usb_mixer_interface *mixer,
 			/* invalidate cache, so the value is read from the device */
 			if (!info->get_cur_broken) {
 				if (channel)
-					info->cached &= ~BIT(channel);
+					clear_bit(channel, info->cached);
 				else /* master channel */
-					info->cached = 0;
+					bitmap_zero(info->cached, MAX_CHANNELS + 1);
 			}
 
 			snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
@@ -4008,7 +4008,7 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
 		for (c = 0; c < MAX_CHANNELS; c++) {
 			if (!(cval->cmask & BIT(c)))
 				continue;
-			if (cval->cached & BIT(c + 1)) {
+			if (test_bit(c + 1, cval->cached)) {
 				err = snd_usb_set_cur_mix_value(cval, c + 1, idx,
 							cval->cache_val[idx]);
 				if (err < 0)
@@ -4018,7 +4018,7 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
 		}
 	} else {
 		/* master */
-		if (cval->cached)
+		if (test_bit(0, cval->cached))
 			snd_usb_set_cur_mix_value(cval, 0, 0, *cval->cache_val);
 	}
 
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 2ff4490f97c2..0d0a8b343756 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -93,7 +93,7 @@ struct usb_mixer_elem_info {
 	int min, max, res;
 	int max_exposed; /* control API exposes the value in 0..max_exposed */
 	int dBmin, dBmax;
-	int cached;
+	DECLARE_BITMAP(cached, MAX_CHANNELS + 1);
 	int cache_val[MAX_CHANNELS];
 	u8 initialized;
 	u8 min_mute;
diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index 369968565c19..6808730ef047 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -292,7 +292,7 @@ static int forte_get_ctl_value(struct usb_mixer_elem_info *elem, int *value)
 	/* Device may not support reading input controls.
 	 * Return cached value or default to avoid blocking module load.
 	 */
-	if (elem->cached)
+	if (test_bit(0, elem->cached))
 		*value = elem->cache_val[0];
 	else
 		*value = 0;  /* Default: first option */
@@ -353,7 +353,7 @@ static int forte_input_gain_put(struct snd_kcontrol *kctl,
 		err = forte_set_ctl_value(elem, val);
 		if (err < 0)
 			return err;
-		elem->cached |= 1;
+		set_bit(0, elem->cached);
 		elem->cache_val[0] = val;
 		return 1;
 	}
@@ -364,7 +364,7 @@ static int forte_input_gain_resume(struct usb_mixer_elem_list *list)
 {
 	struct usb_mixer_elem_info *elem = mixer_elem_list_to_info(list);
 
-	if (elem->cached)
+	if (test_bit(0, elem->cached))
 		forte_set_ctl_value(elem, *elem->cache_val);
 	return 0;
 }
@@ -405,7 +405,7 @@ static int forte_ctl_enum_put(struct snd_kcontrol *kctl,
 		err = forte_set_ctl_value(elem, val);
 		if (err < 0)
 			return err;
-		elem->cached |= 1;
+		set_bit(0, elem->cached);
 		elem->cache_val[0] = val;
 		return 1;
 	}
@@ -416,7 +416,7 @@ static int forte_ctl_enum_resume(struct usb_mixer_elem_list *list)
 {
 	struct usb_mixer_elem_info *elem = mixer_elem_list_to_info(list);
 
-	if (elem->cached)
+	if (test_bit(0, elem->cached))
 		forte_set_ctl_value(elem, *elem->cache_val);
 	return 0;
 }
@@ -454,7 +454,7 @@ static int forte_ctl_switch_put(struct snd_kcontrol *kctl,
 		err = forte_set_ctl_value(elem, val);
 		if (err < 0)
 			return err;
-		elem->cached |= 1;
+		set_bit(0, elem->cached);
 		elem->cache_val[0] = val;
 		return 1;
 	}
@@ -465,7 +465,7 @@ static int forte_ctl_switch_resume(struct usb_mixer_elem_list *list)
 {
 	struct usb_mixer_elem_info *elem = mixer_elem_list_to_info(list);
 
-	if (elem->cached)
+	if (test_bit(0, elem->cached))
 		forte_set_ctl_value(elem, *elem->cache_val);
 	return 0;
 }
@@ -532,7 +532,7 @@ static int scarlett_ctl_resume(struct usb_mixer_elem_list *list)
 	int i;
 
 	for (i = 0; i < elem->channels; i++)
-		if (elem->cached & (1 << i))
+		if (test_bit(i, elem->cached))
 			snd_usb_set_cur_mix_value(elem, i, i,
 						  elem->cache_val[i]);
 	return 0;
@@ -692,7 +692,7 @@ static int scarlett_ctl_enum_resume(struct usb_mixer_elem_list *list)
 {
 	struct usb_mixer_elem_info *elem = mixer_elem_list_to_info(list);
 
-	if (elem->cached)
+	if (test_bit(0, elem->cached))
 		snd_usb_set_cur_mix_value(elem, 0, 0, *elem->cache_val);
 	return 0;
 }
diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index 14fb1ad764a7..8e5ccd3282a7 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -236,7 +236,7 @@ static int snd_us16x08_route_put(struct snd_kcontrol *kcontrol,
 		return err;
 	}
 
-	elem->cached |= 1 << index;
+	set_bit(index, elem->cached);
 	elem->cache_val[index] = val;
 	return 1;
 }
@@ -295,7 +295,7 @@ static int snd_us16x08_master_put(struct snd_kcontrol *kcontrol,
 		return err;
 	}
 
-	elem->cached |= 1 << index;
+	set_bit(index, elem->cached);
 	elem->cache_val[index] = val;
 	return 1;
 }
@@ -336,7 +336,7 @@ static int snd_us16x08_bus_put(struct snd_kcontrol *kcontrol,
 		return err;
 	}
 
-	elem->cached |= 1;
+	set_bit(0, elem->cached);
 	elem->cache_val[0] = val;
 	return 1;
 }
@@ -404,7 +404,7 @@ static int snd_us16x08_channel_put(struct snd_kcontrol *kcontrol,
 		return err;
 	}
 
-	elem->cached |= 1 << index;
+	set_bit(index, elem->cached);
 	elem->cache_val[index] = val;
 	return 1;
 }
@@ -508,7 +508,7 @@ static int snd_us16x08_comp_put(struct snd_kcontrol *kcontrol,
 	}
 
 	store->val[val_idx][index] = val;
-	elem->cached |= 1 << index;
+	set_bit(index, elem->cached);
 	elem->cache_val[index] = val;
 	return 1;
 }
@@ -567,7 +567,7 @@ static int snd_us16x08_eqswitch_put(struct snd_kcontrol *kcontrol,
 		return err;
 	}
 
-	elem->cached |= 1 << index;
+	set_bit(index, elem->cached);
 	elem->cache_val[index] = val;
 	return 1;
 }
@@ -631,7 +631,7 @@ static int snd_us16x08_eq_put(struct snd_kcontrol *kcontrol,
 
 	store->val[b_idx][p_idx][index] = val;
 	/* store new value in EQ band cache */
-	elem->cached |= 1 << index;
+	set_bit(index, elem->cached);
 	elem->cache_val[index] = val;
 	return 1;
 }
@@ -1352,7 +1352,7 @@ int snd_us16x08_controls_create(struct usb_mixer_interface *mixer)
 		}
 		for (i = 0; i < 8; i++)
 			elem->cache_val[i] = i < 2 ? i : i + 2;
-		elem->cached = 0xff;
+		bitmap_set(elem->cached, 0, 8);
 
 		/* create compressor mixer elements */
 		comp_store = snd_us16x08_create_comp_store();
@@ -1374,7 +1374,7 @@ int snd_us16x08_controls_create(struct usb_mixer_interface *mixer)
 			if (err < 0)
 				return err;
 			elem->cache_val[0] = master_controls[i].default_val;
-			elem->cached = 1;
+			set_bit(0, elem->cached);
 		}
 
 		/* add channel controls */
@@ -1394,7 +1394,7 @@ int snd_us16x08_controls_create(struct usb_mixer_interface *mixer)
 				elem->cache_val[j] =
 					channel_controls[i].default_val;
 			}
-			elem->cached = 0xffff;
+			bitmap_set(elem->cached, 0, SND_US16X08_MAX_CHANNELS);
 		}
 
 		/* create eq store */
-- 
2.55.0

