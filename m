Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47501456E11;
	Tue,  6 Oct 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294063; cv=none; b=KnJA7rd4mjgX28PRIWsisURFfiuvg7rXLdunp++/0VHWfMP2lZ+U0pp36U2chYyfkoMR9ATMJjmgX2xmYkcwHfABEhMHRNYxPzUX1TYKAn2sFQRR0QhGGFvSlUwl3jVOpOCOMM2rEfJ8BygHBNEtv/6heePOyyXe4sTqiQnbAxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294063; c=relaxed/simple;
	bh=Mr9fnEzqgL8EkJZixFQhkHZ7CElMQmB+D5ZRb90X5bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AY1yFVKdKfvp9/8NGtshiWzTFIJoXKKan/OUU3bKM4PWB//rYo6cRuha+q9vy405/Yfr3DngBZ5Tntp+Yn6qqRoArKeJMeA4mqvLCt0wAvBAshlh1lVtBnua19MGzgBGTLoa/ONUHC4rVyFaaeHLBerKPij21FTZ5o7mJFqhckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RRp5vCj0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XhKSpKhw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Idyf1nzF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BSacF5TG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RRp5vCj0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XhKSpKhw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Idyf1nzF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BSacF5TG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 001F11F8C3;
	Tue,  6 Oct 2026 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpBdHFt8ai+RbQ78E9qitjnZp//50EFHtv9DxfGtNwQ=;
	b=RRp5vCj0J1A5EAd1W73PN3DUHyl5wDw8StYlnKYf3Rt/EZDr3HF/7l1Svevk5aoMBiwOGE
	rjpbHJpCcE1cApTjN0agmki1/PkT7WblJkDUNnlsrRLTjB2yOiu4q0b/nc+k+Szf+743XY
	6mdxO15X15NXiMpKYEwnN6t1AtDQbI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpBdHFt8ai+RbQ78E9qitjnZp//50EFHtv9DxfGtNwQ=;
	b=XhKSpKhw3+z8dD4GguC/r+X1DxUzYtLzhz76Ej1ehVk0DIadjRphhnG7jWwTBM2WpLAGNl
	vGSCV/x1+8l7aZAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpBdHFt8ai+RbQ78E9qitjnZp//50EFHtv9DxfGtNwQ=;
	b=Idyf1nzFjQPBLFEkEQcGJpkDG3YoevepGRzx610m3yD7DKk+LcpwMX3u9WHDc1XRKfzIjs
	saxO6E7Zv7vNyE0eAaodAWnOfDNa2XVj20R+pqKqM6u8HcSN3/8AaZQZnB/dEFqDemgkVa
	FtbnYvkXpbGS3uFEj3Txqyeq67CDzx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpBdHFt8ai+RbQ78E9qitjnZp//50EFHtv9DxfGtNwQ=;
	b=BSacF5TGlReRiBFlFPT/UEckfCa+rKmCnfQOzE8kfpg0YFv7y/adO7I+D3nwpQed6j+HEv
	RCMs1oALSNDL5MCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3BB913A62;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1eVrAVf6xGq1cAAAD6G6ig:T8
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:40:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] ALSA: usb-audio: Fix mixer bitmap cache over 32 channels
Date: Tue,  6 Oct 2026 15:40:31 +0200
Message-ID: <20261006134035.478529-8-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006134035.478529-1-tiwai@suse.de>
References: <20261006134035.478529-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.996];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

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
 sound/usb/mixer.c          | 18 +++++++++---------
 sound/usb/mixer.h          |  2 +-
 sound/usb/mixer_scarlett.c | 18 +++++++++---------
 sound/usb/mixer_us16x08.c  | 20 ++++++++++----------
 4 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index bc71d7210eb2..8bd57a581fc1 100644
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
@@ -3667,7 +3667,7 @@ void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid)
 		info = mixer_elem_list_to_info(list);
 		/* invalidate cache, so the value is read from the device */
 		if (!info->get_cur_broken)
-			info->cached = 0;
+			bitmap_zero(info->cached, MAX_CHANNELS + 1);
 		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &list->kctl->id);
 	}
@@ -3766,9 +3766,9 @@ static void snd_usb_mixer_interrupt_v2(struct usb_mixer_interface *mixer,
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
@@ -4005,7 +4005,7 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
 		for (c = 0; c < MAX_CHANNELS; c++) {
 			if (!(cval->cmask & BIT(c)))
 				continue;
-			if (cval->cached & BIT(c + 1)) {
+			if (test_bit(c + 1, cval->cached)) {
 				err = snd_usb_set_cur_mix_value(cval, c + 1, idx,
 							cval->cache_val[idx]);
 				if (err < 0)
@@ -4015,7 +4015,7 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
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

