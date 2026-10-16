Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0C400DF0;
	Fri, 16 Oct 2026 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159620; cv=none; b=LHAdLdJskJ04Y5SWjk60rc5nyBTvQZj2rxL+kuYqmlaQ3Mi4J6TZXgAkYom2s2FnIzoLJ/ptX2a5tI6sNwCOrJjweiZUubtm17rM6lLZsw9skiIALof+ePPG5Elv7nmoXl3C5ALA6i9dYSJ+QG3rmycFfMRXKRR0qIKgtakKw0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159620; c=relaxed/simple;
	bh=laXpyMbyQvikcokqa6TPuJbpMAASFo+P/IomiKQkd8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=agh4xCeIDQ1+JJd/Q+0RNQFuL2padeRdtjGl3d5cfIeyaZwUpxywQd54a3N3U8eLpntARBSIghz1H7Qar0e8ZDgYTV10SNAfrC1/0CaPfF4VkOL5cal1WKoBHPOEh/CT1gWshI+py07kq1fwFGA6FxgU9MJdh5IeIx2CZ89FSvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QwP75ijC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9cX9DZ5C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QwP75ijC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9cX9DZ5C; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QwP75ijC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9cX9DZ5C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QwP75ijC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9cX9DZ5C"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4C51A1F393;
	Fri, 16 Oct 2026 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792159617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iKCfNBhdQxIRgHQVwz4DPXBOjNDgLzPkUj6bf9817x4=;
	b=QwP75ijCOY+LTXSF0wTEBVU7NWDc87J0bUfx4l/FMt1QO1pCM3Puyzb/qs7FUZ0ozVVltI
	1+pjDdY/9lecB+D6WP8vlE0H38LfTj24QGLhxbJpJFjhADmkQ8IPubou4YT2dbXcF9+tBt
	Kf/MYnGCwtsVqQUWsqIrHm1+Bt3JOn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792159617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iKCfNBhdQxIRgHQVwz4DPXBOjNDgLzPkUj6bf9817x4=;
	b=9cX9DZ5CcQepKSXvc7sknB3tuI6q+baexqVsglJbHyRX7bVm0e3HKoSmkXV8P4p5yZjv/W
	jnXHsdTx1OeGTfBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792159617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iKCfNBhdQxIRgHQVwz4DPXBOjNDgLzPkUj6bf9817x4=;
	b=QwP75ijCOY+LTXSF0wTEBVU7NWDc87J0bUfx4l/FMt1QO1pCM3Puyzb/qs7FUZ0ozVVltI
	1+pjDdY/9lecB+D6WP8vlE0H38LfTj24QGLhxbJpJFjhADmkQ8IPubou4YT2dbXcF9+tBt
	Kf/MYnGCwtsVqQUWsqIrHm1+Bt3JOn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792159617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iKCfNBhdQxIRgHQVwz4DPXBOjNDgLzPkUj6bf9817x4=;
	b=9cX9DZ5CcQepKSXvc7sknB3tuI6q+baexqVsglJbHyRX7bVm0e3HKoSmkXV8P4p5yZjv/W
	jnXHsdTx1OeGTfBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 073071339F;
	Fri, 16 Oct 2026 14:06:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Q86NoAv0mqQCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 14:06:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH] ALSA: jack: Expose injection debugfs at device register phase
Date: Fri, 16 Oct 2026 16:06:09 +0200
Message-ID: <20261016140653.4406-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

Currently we add debugfs interfaces for jack injection (with
CONFIG_SND_JACK_INJECTION_DEBUG) at creating jack kctls in
snd_jack_kctl_add().  This means that those debugfs interfaces are
already exposed to user-space at the early probe phase -- that is, it
allows user-space already fiddling with it, while other components are
still being initialized and hidden until snd_card_register().
Depending on the driver implementation, such behavior can be an
unpleasant surprise.

For aligning the device exposure behavior, move the debugfs
registration at the device register phase, too.  snd_jack_kctl_add()
may still add the corresponding debugfs interfaces (for the
dynamically added jacks, if any), but it's done only conditionally
after the card has been registered.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/jack.h |  2 +-
 sound/core/jack.c    | 56 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/include/sound/jack.h b/include/sound/jack.h
index 715b95983188..cf19c333e2eb 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -62,10 +62,10 @@ struct snd_jack {
 	struct list_head kctl_list;
 	struct snd_card *card;
 	const char *id;
+	bool registered;
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	struct input_dev *input_dev;
 	struct mutex input_dev_lock;
-	int registered;
 	int type;
 	char name[100];
 	unsigned int key[6];   /* Keep in sync with definitions above */
diff --git a/sound/core/jack.c b/sound/core/jack.c
index d9132b885ea3..a81a64b3bfe7 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -38,6 +38,7 @@ static const int jack_switch_types[SND_JACK_SWITCH_TYPES] = {
 };
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 
+static void snd_jack_add_debugfs(struct snd_jack *jack);
 static void snd_jack_remove_debugfs(struct snd_jack *jack);
 
 static int snd_jack_dev_disconnect(struct snd_device *device)
@@ -88,11 +89,10 @@ static int snd_jack_dev_free(struct snd_device *device)
 }
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
-static int snd_jack_dev_register(struct snd_device *device)
+static int snd_jack_input_dev_register(struct snd_card *card,
+				       struct snd_jack *jack)
 {
-	struct snd_jack *jack = device->device_data;
-	struct snd_card *card = device->card;
-	int err, i;
+	int i;
 
 	snprintf(jack->name, sizeof(jack->name), "%s %s",
 		 card->shortname, jack->id);
@@ -120,14 +120,32 @@ static int snd_jack_dev_register(struct snd_device *device)
 		input_set_capability(jack->input_dev, EV_KEY, jack->key[i]);
 	}
 
-	err = input_register_device(jack->input_dev);
-	if (err == 0)
-		jack->registered = 1;
-
-	return err;
+	return input_register_device(jack->input_dev);
+}
+#else
+static inline int snd_jack_input_dev_register(struct snd_card *card,
+					      struct snd_jack *jack)
+{
+	return 0;
 }
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 
+static int snd_jack_dev_register(struct snd_device *device)
+{
+	struct snd_card *card = device->card;
+	struct snd_jack *jack = device->device_data;
+	int err;
+
+	err = snd_jack_input_dev_register(card, jack);
+	if (err < 0)
+		return err;
+
+	snd_jack_add_debugfs(jack);
+
+	jack->registered = true;
+	return 0;
+}
+
 #ifdef CONFIG_SND_JACK_INJECTION_DEBUG
 static void snd_jack_inject_report(struct snd_jack_kctl *jack_kctl, int status)
 {
@@ -349,6 +367,9 @@ static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
 	char *tname;
 	int i;
 
+	if (jack_kctl->jack_debugfs_root)
+		return 0;
+
 	/* Don't create injection interface for Phantom jacks */
 	if (strstr(jack_kctl->kctl->id.name, "Phantom"))
 		return 0;
@@ -387,6 +408,14 @@ static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
 	return 0;
 }
 
+static void snd_jack_add_debugfs(struct snd_jack *jack)
+{
+	struct snd_jack_kctl *jack_kctl;
+
+	list_for_each_entry(jack_kctl, &jack->kctl_list, list)
+		snd_jack_debugfs_add_inject_node(jack, jack_kctl);
+}
+
 static void snd_jack_remove_debugfs(struct snd_jack *jack)
 {
 	struct snd_jack_kctl *jack_kctl;
@@ -403,6 +432,10 @@ static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
 	return 0;
 }
 
+static void snd_jack_add_debugfs(struct snd_jack *jack)
+{
+}
+
 static void snd_jack_remove_debugfs(struct snd_jack *jack)
 {
 }
@@ -423,7 +456,8 @@ static void snd_jack_kctl_add(struct snd_jack *jack, struct snd_jack_kctl *jack_
 {
 	jack_kctl->jack = jack;
 	list_add_tail(&jack_kctl->list, &jack->kctl_list);
-	snd_jack_debugfs_add_inject_node(jack, jack_kctl);
+	if (jack->registered)
+		snd_jack_debugfs_add_inject_node(jack, jack_kctl);
 }
 
 static struct snd_jack_kctl * snd_jack_kctl_new(struct snd_card *card, const char *name, unsigned int mask)
@@ -504,9 +538,7 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 	int err;
 	static const struct snd_device_ops ops = {
 		.dev_free = snd_jack_dev_free,
-#ifdef CONFIG_SND_JACK_INPUT_DEV
 		.dev_register = snd_jack_dev_register,
-#endif /* CONFIG_SND_JACK_INPUT_DEV */
 		.dev_disconnect = snd_jack_dev_disconnect,
 	};
 
-- 
2.55.0

