Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2DA4457A3;
	Wed,  7 Oct 2026 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365829; cv=none; b=FiXIwxY0onetqf7VJ8e/OUFfmf/194qAEYQtPoSWRl49QVz42ITSGcVbhhSYVgj8OG5fTMxDrTXx1V3zrH3o3y/ZS3BfjbnwV9K2EG7Cl6NNy6Kc1B5PA3MYCN3n/vN86Kw/XrlHPWots/mTZDgva1UIL4WBk3c2DvpaOANJN4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365829; c=relaxed/simple;
	bh=ZfVdYbsJsBQYfTrXTm8hCoH1cPOzBWg+AjMYS5DQ8bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uh+E04d39OyTMOnBmuNOcwOqzi2eD3aLLt6nY43E33OoshYF0FvWZDLIXuZVGeTYYjYyOO+7QR9JVO08bpdYMBHbtw6/mrNwqP6zjpSt2EZQ6jLhLDz/ACuB1WRDQlvLHhkdfgJsyUCGqVLZuiTXFdFwHwcuF8emNcOq0h8lemU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yy/YBxs9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=71GDd4mE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yy/YBxs9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=71GDd4mE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yy/YBxs9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="71GDd4mE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yy/YBxs9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="71GDd4mE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C51B721F84;
	Wed,  7 Oct 2026 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3obG8UDLzbV18oFzrEVP9TvrGApje4IQTqwGJdbwBc=;
	b=Yy/YBxs9eGb8dZkMNXDsa9o7Ec+gPiREt1qLrRw73XTorj7B4UWZ4MAg+4yweqgLnYxDk1
	J2BTX2f/yMbcFP01Y0mP/GOSXRr7nOU+/enVEfJSAFjwum3pvEbBO//steO7P1mToiffxJ
	XPwC7Upf/Sc9q3Gm9wg2HwAA6eD6IKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365804;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3obG8UDLzbV18oFzrEVP9TvrGApje4IQTqwGJdbwBc=;
	b=71GDd4mECuM3Hrzh10xNEnzRFY4LHclFw8/4lC5f1vayIhQa9iJefXjZmxJtNPGwKKHdix
	A//2s/k2yjdtLwCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3obG8UDLzbV18oFzrEVP9TvrGApje4IQTqwGJdbwBc=;
	b=Yy/YBxs9eGb8dZkMNXDsa9o7Ec+gPiREt1qLrRw73XTorj7B4UWZ4MAg+4yweqgLnYxDk1
	J2BTX2f/yMbcFP01Y0mP/GOSXRr7nOU+/enVEfJSAFjwum3pvEbBO//steO7P1mToiffxJ
	XPwC7Upf/Sc9q3Gm9wg2HwAA6eD6IKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365804;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3obG8UDLzbV18oFzrEVP9TvrGApje4IQTqwGJdbwBc=;
	b=71GDd4mECuM3Hrzh10xNEnzRFY4LHclFw8/4lC5f1vayIhQa9iJefXjZmxJtNPGwKKHdix
	A//2s/k2yjdtLwCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F6AB13B99;
	Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9oTPLKgSxmpMDgAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:36:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] ALSA: usb-audio: Fix data race at mixer_ctl_feature_info()
Date: Wed,  7 Oct 2026 11:36:32 +0200
Message-ID: <20261007093638.1049688-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007093638.1049688-1-tiwai@suse.de>
References: <20261007093638.1049688-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	URIBL_BLOCKED(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 

The info callback for USB-audio mixer controls for feature unit has a
dynamic initialization of the contents with the check of
cval->initialized flag.  But, since the info callback may be
concurrently called, this may lead to a data race, giving back an
inconsistent state.  Similarly, get and put callbacks may have
concurrent accesses and can get bogus states.

For avoiding the data race, introduce a mutex locking for the
controls and protect against concurrent info callback calls.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: fix mutex() scope in mixer_ctl_feature_info

 sound/usb/mixer.c | 11 ++++++++++-
 sound/usb/mixer.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 9d8007ea95d5..3b6e8759130d 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1531,6 +1531,7 @@ static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
 	int ret;
 
+	guard(mutex)(&cval->head.mixer->lock);
 	if (cval->val_type == USB_MIXER_BOOLEAN ||
 	    cval->val_type == USB_MIXER_INV_BOOLEAN)
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
@@ -1565,6 +1566,7 @@ static int mixer_ctl_feature_get(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
 	int c, cnt, val, err;
 
+	guard(mutex)(&cval->head.mixer->lock);
 	ucontrol->value.integer.value[0] = cval->min;
 	if (cval->cmask) {
 		cnt = 0;
@@ -1595,10 +1597,12 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
-	int max_val = get_max_exposed(cval);
+	int max_val;
 	int c, cnt, val, oval, err;
 	int changed = 0;
 
+	guard(mutex)(&cval->head.mixer->lock);
+	max_val = get_max_exposed(cval);
 	if (cval->cmask) {
 		cnt = 0;
 		for (c = 0; c < MAX_CHANNELS; c++) {
@@ -1646,6 +1650,7 @@ static int mixer_ctl_master_bool_get(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
 	int val, err;
 
+	guard(mutex)(&cval->head.mixer->lock);
 	err = snd_usb_get_cur_mix_value(cval, 0, 0, &val);
 	if (err < 0)
 		return filter_error(cval, err);
@@ -2592,6 +2597,7 @@ static int mixer_ctl_procunit_get(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
 	int err, val;
 
+	guard(mutex)(&cval->head.mixer->lock);
 	err = get_cur_ctl_value(cval, cval->control << 8, &val);
 	if (err < 0) {
 		ucontrol->value.integer.value[0] = cval->min;
@@ -2609,6 +2615,7 @@ static int mixer_ctl_procunit_put(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
 	int val, oval, err;
 
+	guard(mutex)(&cval->head.mixer->lock);
 	err = get_cur_ctl_value(cval, cval->control << 8, &oval);
 	if (err < 0)
 		return filter_error(cval, err);
@@ -3249,6 +3256,7 @@ static void snd_usb_mixer_free(struct usb_mixer_interface *mixer)
 	}
 	usb_free_urb(mixer->rc_urb);
 	kfree(mixer->rc_setup_packet);
+	mutex_destroy(&mixer->lock);
 	kfree(mixer);
 }
 
@@ -3885,6 +3893,7 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
 	mixer = kzalloc_obj(*mixer);
 	if (!mixer)
 		return -ENOMEM;
+	mutex_init(&mixer->lock);
 	mixer->chip = chip;
 	mixer->ignore_ctl_error = !!(chip->quirk_flags & QUIRK_FLAG_IGNORE_CTL_ERROR);
 	mixer->id_elems = kzalloc_objs(*mixer->id_elems, MAX_ID_ELEMS);
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index cf45c39cbccc..2ff4490f97c2 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -18,6 +18,7 @@ struct usb_mixer_interface {
 	struct usb_host_interface *hostif;
 	struct list_head list;
 	unsigned int ignore_ctl_error;
+	struct mutex lock; /* lock for feature unit callbacks */
 	/* UAC2 status interrupt endpoint; owned by mixer.c */
 	struct urb *urb;
 	/* array[MAX_ID_ELEMS], indexed by unit id */
-- 
2.55.0

