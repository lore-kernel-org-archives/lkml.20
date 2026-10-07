Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904263DA5DE;
	Wed,  7 Oct 2026 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393659; cv=none; b=cH99NizdlJ0oxyQxFb1N+Dj4OwJPN7JqFyVkF5gIhNg2TpSqj39VqNcOqNb2WFpBnaTYQylhtH+Qj99eElJeA9AHV/I4J0zGg0kwiMvba2ZITlDQzlmBsTwnkI/GaiM1UxOI4fSFOnR8XomDh7le7Mui81aL8aa1myhPBYPn2xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393659; c=relaxed/simple;
	bh=0qqBygVyh2s7AVyFozenI3LQns112e18D3VVOfGpKog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JY7kY+3p2BBVJFHhk/grrGB1N8REpAvQP68r22pjP/kI9l0bHic907/bmhEPN6ixkqHndjQhwW126gLUTv3ttTcldhc1hOCant3Q5SgiQB/PMEpztz6NPxCadTfF7wD8R+JfU7FX9kG+HN/Y4ZrF/WlafnzMRM23h/iuWfkLbNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q8Npbkdc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vvFVJfWI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q8Npbkdc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vvFVJfWI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q8Npbkdc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vvFVJfWI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q8Npbkdc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vvFVJfWI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF03421BBF;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0pu1p+K69r6ZCCEAmAJ1EHzNWTY3ZRlNdMXPAjZztM=;
	b=q8NpbkdcpJ/7PlNK/m71XiWfdPDL973k4fGBKMlm3Dm29zV2Riudodd2oIvVaE6rAy8lHx
	Ia6g3uzC6GVrRHiQY3FwenexbdDDDGYc7xq5i53mXpsgy7SOLs7ABpyTCvOHtiydgZTQ2V
	tDg+NK7Q30ZZhwWtLV3JxPK5N7jhDoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0pu1p+K69r6ZCCEAmAJ1EHzNWTY3ZRlNdMXPAjZztM=;
	b=vvFVJfWIjQA50V//zykDDUEqYCvmsrB7bJvcRbFOccrO9Lm/DqCK5Htn3weQ7r/Xvoe07N
	fAZP/CD5reyeUuCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q8Npbkdc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vvFVJfWI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0pu1p+K69r6ZCCEAmAJ1EHzNWTY3ZRlNdMXPAjZztM=;
	b=q8NpbkdcpJ/7PlNK/m71XiWfdPDL973k4fGBKMlm3Dm29zV2Riudodd2oIvVaE6rAy8lHx
	Ia6g3uzC6GVrRHiQY3FwenexbdDDDGYc7xq5i53mXpsgy7SOLs7ABpyTCvOHtiydgZTQ2V
	tDg+NK7Q30ZZhwWtLV3JxPK5N7jhDoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0pu1p+K69r6ZCCEAmAJ1EHzNWTY3ZRlNdMXPAjZztM=;
	b=vvFVJfWIjQA50V//zykDDUEqYCvmsrB7bJvcRbFOccrO9Lm/DqCK5Htn3weQ7r/Xvoe07N
	fAZP/CD5reyeUuCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38E13139B6;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8rcALXZ/xmp1CgAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:20:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] ALSA: usb-audio: Fix data race at mixer_ctl_feature_info()
Date: Wed,  7 Oct 2026 19:20:41 +0200
Message-ID: <20261007172051.13240-6-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: CF03421BBF

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
 sound/usb/mixer.c | 14 +++++++++++++-
 sound/usb/mixer.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 9d8007ea95d5..695d51f7aeb4 100644
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
@@ -2960,6 +2967,7 @@ static int mixer_ctl_selector_get(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
 	int val, err;
 
+	guard(mutex)(&cval->head.mixer->lock);
 	err = get_cur_ctl_value(cval, cval->control << 8, &val);
 	if (err < 0) {
 		ucontrol->value.enumerated.item[0] = 0;
@@ -2977,6 +2985,7 @@ static int mixer_ctl_selector_put(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
 	int val, oval, err;
 
+	guard(mutex)(&cval->head.mixer->lock);
 	err = get_cur_ctl_value(cval, cval->control << 8, &oval);
 	if (err < 0)
 		return filter_error(cval, err);
@@ -3249,6 +3258,7 @@ static void snd_usb_mixer_free(struct usb_mixer_interface *mixer)
 	}
 	usb_free_urb(mixer->rc_urb);
 	kfree(mixer->rc_setup_packet);
+	mutex_destroy(&mixer->lock);
 	kfree(mixer);
 }
 
@@ -3893,6 +3903,8 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
 		return -ENOMEM;
 	}
 
+	mutex_init(&mixer->lock);
+
 	mixer->hostif = &usb_ifnum_to_if(chip->dev, ctrlif)->altsetting[0];
 	switch (get_iface_desc(mixer->hostif)->bInterfaceProtocol) {
 	case UAC_VERSION_1:
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

