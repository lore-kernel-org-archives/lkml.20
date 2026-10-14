Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CB0259C9C;
	Wed, 14 Oct 2026 06:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958451; cv=none; b=nfcD2RUEa1O9LyVBmkKZ9Dj4ZhLF+jYHAh2Ux21dsjWwPVs83lMYuvQ0KD4CNZBQGOjvTvFDAA0OUTgBoZSZAqnrqEEJTI2595NE7YsA6ujY4t6XOWoPf4LVvzgiLEBYXEN2EAhu8GbVwZI4t6j4fYzBTn1VJ/qDX0IgO4juk28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958451; c=relaxed/simple;
	bh=urBtA5a2tjF04zSo9wUwTrqqmMsbUCQNYm0f5HRuNqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IYFMsl022eUvxrAEB1mFwC2ePhsVSi4bFdilfbKPqdpEh6yI6x2Pd05DUpZ+XllTonbqHybOGhyo2bEl5OHsE1zKOajSoX5XRMt6olxfvozn1aEd47nIk1TsivjQaaoXkIqAxfQItbkGSCQVVYo1lHfphJI6KGf1GkTAMgGSA4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j2L9GnmI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sy73aR6/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j2L9GnmI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sy73aR6/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j2L9GnmI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sy73aR6/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j2L9GnmI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sy73aR6/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 00CCC1F7A9;
	Wed, 14 Oct 2026 06:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bGrLsCj+Z0JeEGrY4m4rqBrROcX2ynNSBvCMaW8ZLus=;
	b=j2L9GnmICr8CpAnyPkAS8UUZgSyaFwV1KPa6maleqc8zOX05O7TpsPciAoQ8sb0inFrZ4U
	Dw5SpJD7aMy6jPRa4QIb5YJI3jwkPAfVe046gW6aGJtTOBNeaLfuSBVAeLlEANL6dd7DNd
	wfNlH69fqwskW2XxTGS3QLgqYQHVxCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bGrLsCj+Z0JeEGrY4m4rqBrROcX2ynNSBvCMaW8ZLus=;
	b=sy73aR6/0CZ/nHKkxzDbxAJjXC3rQKChm5Rz+vUghzDdws6sYU+wUHMIN+4pXXvQXDmUA+
	ZtHMdK8ihWnAAgAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j2L9GnmI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="sy73aR6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bGrLsCj+Z0JeEGrY4m4rqBrROcX2ynNSBvCMaW8ZLus=;
	b=j2L9GnmICr8CpAnyPkAS8UUZgSyaFwV1KPa6maleqc8zOX05O7TpsPciAoQ8sb0inFrZ4U
	Dw5SpJD7aMy6jPRa4QIb5YJI3jwkPAfVe046gW6aGJtTOBNeaLfuSBVAeLlEANL6dd7DNd
	wfNlH69fqwskW2XxTGS3QLgqYQHVxCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bGrLsCj+Z0JeEGrY4m4rqBrROcX2ynNSBvCMaW8ZLus=;
	b=sy73aR6/0CZ/nHKkxzDbxAJjXC3rQKChm5Rz+vUghzDdws6sYU+wUHMIN+4pXXvQXDmUA+
	ZtHMdK8ihWnAAgAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B39CE1368E;
	Wed, 14 Oct 2026 06:14:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FA/EIq8dz2rTJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 06:14:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: usb-audio: Use fixed control index for us16x08 mixer elements
Date: Wed, 14 Oct 2026 08:14:05 +0200
Message-ID: <20261014061406.162938-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 00CCC1F7A9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

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
 sound/usb/mixer.c         | 13 +++++++++----
 sound/usb/mixer.h         |  5 +++--
 sound/usb/mixer_quirks.c  |  2 +-
 sound/usb/mixer_us16x08.c |  3 ++-
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 49a8a26f1a96..a95f26a3cfa7 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -649,20 +649,25 @@ static int check_matrix_bitmap(unsigned char *bmap,
 
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
 
-	while (snd_ctl_find_id(mixer->chip->card, &kctl->id))
-		kctl->id.index++;
+	if (look_for_empty) {
+		while (snd_ctl_find_id(mixer->chip->card, &kctl->id))
+			kctl->id.index++;
+	}
+
 	err = snd_ctl_add(mixer->chip->card, kctl);
 	if (err < 0) {
 		usb_audio_dbg(mixer->chip, "cannot add control (err = %d)\n",
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

