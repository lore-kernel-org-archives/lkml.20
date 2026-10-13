Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6B4FDA6C;
	Tue, 13 Oct 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893140; cv=none; b=so3rTvGPYECW8CD7y7Fmn/1Pwle06Dq98NVOrxFlX90i3+pnWal7wMbsjN/TXEHOxvEWaO8CNHM8Pd9OlB9kg3YOMhwNMRMcvHX9G3jB5qW+Awsd/gY7KB3Sc9v92QwZDWthQkLWBsk6jjNPqJsEou+tzRbrWcwiJNJzKphIJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893140; c=relaxed/simple;
	bh=/G9pPrk+SQ6UHI0A9ywpYQYvdolCUfbQ0A/HDZLJIus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTlit7ASczWxv9ouhxehdTz0lN/xx/1+jE7V/L5yeR5dG0912pdEOfgBKuHEURs5xylWvCvZ/48puRNhW7lP6i1y/sS0ZSQv/0bue+j8ZUmGMZbeML9F8oRKVNHBBf7XOaunttquzvavaAMpg/ecv3EVViuYEkhSfgMFD0nb1NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zxiolSmt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pkfMBt1+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zxiolSmt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pkfMBt1+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zxiolSmt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pkfMBt1+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zxiolSmt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pkfMBt1+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 419C721F35;
	Tue, 13 Oct 2026 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cD5Lqx0/qY9Q/FE943cOJjLU1IAYHhHK2Zacn0Iea2M=;
	b=zxiolSmtFLySVAaJcvrpKYrdzYTMbi8GKVrzlndluDg7HM1yF4Ha/vxguSo89AZPKjcLCk
	N7uVUx6vHInukw4Ou5eaY7AOPmuC+30D99S973z6q/SevvKJ1qCaSwflG7WWI1u2oPFV8Y
	GAYOZBD7+7e0/G/X4qRqICOxU98cOWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cD5Lqx0/qY9Q/FE943cOJjLU1IAYHhHK2Zacn0Iea2M=;
	b=pkfMBt1+9v01MoVae5GBUB/fnc9Cl1oU2LCO3ZBSRcOEBAnKcasTH5ZNNLx2WLnJEVPP9p
	5uFimg2wd59InvAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cD5Lqx0/qY9Q/FE943cOJjLU1IAYHhHK2Zacn0Iea2M=;
	b=zxiolSmtFLySVAaJcvrpKYrdzYTMbi8GKVrzlndluDg7HM1yF4Ha/vxguSo89AZPKjcLCk
	N7uVUx6vHInukw4Ou5eaY7AOPmuC+30D99S973z6q/SevvKJ1qCaSwflG7WWI1u2oPFV8Y
	GAYOZBD7+7e0/G/X4qRqICOxU98cOWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cD5Lqx0/qY9Q/FE943cOJjLU1IAYHhHK2Zacn0Iea2M=;
	b=pkfMBt1+9v01MoVae5GBUB/fnc9Cl1oU2LCO3ZBSRcOEBAnKcasTH5ZNNLx2WLnJEVPP9p
	5uFimg2wd59InvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9818134B8;
	Tue, 13 Oct 2026 12:05:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6Ox+GJAezmrxFQAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 12:05:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ALSA: usb-audio: Use fixed control index for us16x08 mixer elements
Date: Tue, 13 Oct 2026 14:05:23 +0200
Message-ID: <20261013120528.52586-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013120528.52586-1-tiwai@suse.de>
References: <20261013120528.52586-1-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

The callbacks for us16x08 mixer elements assume that id.index points
to the channel to be operated, and the assumption is correct for now.
However, since the kctls are added via snd_usb_mixer_add_control() and
it looks for the empty slot if the same control name is already
present, in theory, the index can become more than the channel numbers
(if a conflicting name really happens).

Since the mixer code in us16x08 doesn't need the search for an empty
slot but requires the fixed index, this patch changes slightly how to
assign the kcontrols.  Now, a new argument is added to
snd_usb_mixer_add_list() in order to disable the empty slot search,
and use it in us16x08's add_new_ctl() helper function, instead.

Fixes: d2bb390a2081 ("ALSA: usb-audio: Tascam US-16x08 DSP mixer quirk")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c         | 6 ++++--
 sound/usb/mixer.h         | 5 +++--
 sound/usb/mixer_quirks.c  | 2 +-
 sound/usb/mixer_us16x08.c | 3 ++-
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 49a8a26f1a96..c2c24461c5a8 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -649,14 +649,16 @@ static int check_matrix_bitmap(unsigned char *bmap,
 
 /*
  * add an alsa control element
- * search and increment the index until an empty slot is found.
+ * when @look_for_empty is set, search and increment the index until an empty
+ * slot is found.
  *
  * if failed, give up and free the control instance.
  */
 
 int snd_usb_mixer_add_list(struct usb_mixer_elem_list *list,
 			   struct snd_kcontrol *kctl,
-			   bool is_std_info)
+			   bool is_std_info,
+			   bool look_for_empty)
 {
 	struct usb_mixer_interface *mixer = list->mixer;
 	int err;
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 0d0a8b343756..c40f832852be 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -113,10 +113,11 @@ int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
 
 int snd_usb_mixer_add_list(struct usb_mixer_elem_list *list,
 			   struct snd_kcontrol *kctl,
-			   bool is_std_info);
+			   bool is_std_info,
+			   bool look_for_empty);
 
 #define snd_usb_mixer_add_control(list, kctl) \
-	snd_usb_mixer_add_list(list, kctl, true)
+	snd_usb_mixer_add_list(list, kctl, true, true)
 
 void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
 				 struct usb_mixer_interface *mixer,
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 1e266fdbbb8e..01210cc3fae7 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -167,7 +167,7 @@ static int add_single_ctl_with_resume(struct usb_mixer_interface *mixer,
 	}
 	kctl->private_free = snd_usb_mixer_elem_free;
 	/* don't use snd_usb_mixer_add_control() here, this is a special list element */
-	return snd_usb_mixer_add_list(list, kctl, false);
+	return snd_usb_mixer_add_list(list, kctl, false, true);
 }
 
 /*
diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index b447c4f7a161..18e8c2bd2678 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -1134,7 +1134,8 @@ static int add_new_ctl(struct usb_mixer_interface *mixer,
 
 	strscpy(kctl->id.name, name, sizeof(kctl->id.name));
 
-	err = snd_usb_mixer_add_control(&elem->head, kctl);
+	/* look_for_empty=false, as we want the fixed id.index as channel */
+	err = snd_usb_mixer_add_list(&elem->head, kctl, true, false);
 	if (err < 0)
 		return err;
 
-- 
2.55.0

