Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADE246983E;
	Tue,  6 Oct 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294064; cv=none; b=fJ3dQq4Pn4QTFALUkfKqBWHERIVq2vqwMpEPxEsbda9iBv9kf/tr0ksWJhs28h6e9r6AMC+j2xe7DwvJNWhPkIHTYlHU8L8jvGFZ57NT6QY9Rgz6TiHIOWtydUvOrVEumRWfbTrcgwcsxa8eezqIF8UnC94dpk7VTrFwwB6uIsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294064; c=relaxed/simple;
	bh=S78SPd7A+JtY96CRult0hRLNyeXkONGuCwYrzm7U3EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBkX7TmP80Yg/4GOYx2w85wrMGIigUlQdGA/bqgQzGQZMhCxk+jny3fOhm1gb//ZAYND8WQyfmR89YxrFdIOqCz2vlvhKHsIW/Q92Y3ysem7sRSPJpcdEfCHcH/ogUtWg6S6pCb5janj/EXIGRo3PpM0CIcIP612+cpQOYT6RDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dlWqPxV1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a+Jv6Ozr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lv5qTwvk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bl6WHMTW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dlWqPxV1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a+Jv6Ozr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lv5qTwvk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bl6WHMTW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D86CA21AAF;
	Tue,  6 Oct 2026 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnIOiQQkXTVSclcVN0pAEVkajGmnk15WbvgSiRai0N8=;
	b=dlWqPxV1ELgJwVUJcuYNugJqMxak55WrOlEgUkWB9JAa0DAKA/qkyoB/cNnCbhdSSKzJCE
	Bz9cG08s/4C9lRtoxujfwnQ0YJvv79p0LkOxuYWpkvymnFEriD0c6lgCC8AzQA0EPToSag
	scWEgF1RHev6fmG7ibxKfqjckx8tw6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnIOiQQkXTVSclcVN0pAEVkajGmnk15WbvgSiRai0N8=;
	b=a+Jv6OzrYgkZ3W5Jnn82oP00BaadmQlFSkpU2eW5YCZHq3Wk4RZ9NYotIux4bPudWb77AP
	zY0/7N5mdZgfXACw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Lv5qTwvk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Bl6WHMTW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnIOiQQkXTVSclcVN0pAEVkajGmnk15WbvgSiRai0N8=;
	b=Lv5qTwvk6+tUlQa2RNv7wFwLLySmouLKbuudlGie5e8p20qRzcVOjrGlHZoZODAJecZkHp
	sBArZRS6aHnp9CxbePIpo89P3vtCQmdqvv8C76VfOpTHLlJy7FM+vjqeGP0RlF5ZubpH/c
	0YA4jxZUiefp0dNi02LgHJTtsQilN44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294047;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnIOiQQkXTVSclcVN0pAEVkajGmnk15WbvgSiRai0N8=;
	b=Bl6WHMTWpF3oOEvg/lhbeWOn04MNKZpdjQCi3RSpg6VHhCCtlUd0jpax+qbF0Rr9yyF4As
	fYTrAEKRFqw+k1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81EB713A60;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1eVrAVf6xGq1cAAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:40:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] ALSA: usb-audio: Fix data race at mixer_ctl_feature_info()
Date: Tue,  6 Oct 2026 15:40:29 +0200
Message-ID: <20261006134035.478529-6-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D86CA21AAF
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
 sound/usb/mixer.c | 11 ++++++++++-
 sound/usb/mixer.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 9d8007ea95d5..bc71d7210eb2 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1539,6 +1539,7 @@ static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
 	uinfo->count = cval->channels;
 	if (cval->val_type != USB_MIXER_BOOLEAN &&
 	    cval->val_type != USB_MIXER_INV_BOOLEAN) {
+		guard(mutex)(&cval->head.mixer->lock);
 		if (!cval->initialized) {
 			ret = get_min_max_with_quirks(cval, 0, kcontrol);
 			if ((ret >= 0 || ret == -EAGAIN) &&
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

