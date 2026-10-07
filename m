Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B53A6F0F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380270; cv=none; b=oZFJP37aOU4Mr1OG2mIcYBgOYteRDIOY1x7erKANq1weUb9Sb6mqv8KggVfTHzZypsttUTx3skK7nKNyX/yx1DNCvj72Y5tofHCLW/6uJX/M1DsLlt5/2kGJDI3IV71foLaiFLO5vzoCPtxp/FBKwHpWgwFbKhcy8iUcHH3WtXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380270; c=relaxed/simple;
	bh=vGn5F4/8gx7udjLq3m3YOtzi0fzhZQuIIhA+TEwAYQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ifFmOyGpaRGkvsmtM3+j77FCIgt74snO/s5rDceQ3dh3wNBQkJF/aNI/GdFb+K9qzfU+yUEyHP6AeLAmeIyiJwOmaQ7398i/VC14sjGtUxEg+l4QtZ70NPUMXd4TSL43YLKF23zydmlqhzHXv6YobWaPBhK8ranS0xyVckZcgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rFDyl9tK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DQvFHKn8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rFDyl9tK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DQvFHKn8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rFDyl9tK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DQvFHKn8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rFDyl9tK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DQvFHKn8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A6831F38E;
	Wed,  7 Oct 2026 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791380254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xlmGp5g1ROPPOMujI4Nm43qqNQffy7/o8+rZP+crrCQ=;
	b=rFDyl9tKKNFLeozgvPvT5+BK8bK2AL4L8odG3KBFkPmZa3jMrO5AFPe78IwjQt5g8P3G/M
	n6AJNkkr8O3Pqw76SmU+UtpB3TZ5O4SjlZCSNfPn27El2n5UaQ+opKLM7UY1gHKKLeF/hY
	1LfIATE+AHRzfLWEpboQoLDohGXan/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791380254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xlmGp5g1ROPPOMujI4Nm43qqNQffy7/o8+rZP+crrCQ=;
	b=DQvFHKn8EzOAHLyXVPDHNSH+pJCUeMGrh4bZHxr8mkGMGoOLKoGlMZhh8fNzHOYhl9iaCq
	8D0txWbDLvJK+OBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791380254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xlmGp5g1ROPPOMujI4Nm43qqNQffy7/o8+rZP+crrCQ=;
	b=rFDyl9tKKNFLeozgvPvT5+BK8bK2AL4L8odG3KBFkPmZa3jMrO5AFPe78IwjQt5g8P3G/M
	n6AJNkkr8O3Pqw76SmU+UtpB3TZ5O4SjlZCSNfPn27El2n5UaQ+opKLM7UY1gHKKLeF/hY
	1LfIATE+AHRzfLWEpboQoLDohGXan/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791380254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xlmGp5g1ROPPOMujI4Nm43qqNQffy7/o8+rZP+crrCQ=;
	b=DQvFHKn8EzOAHLyXVPDHNSH+pJCUeMGrh4bZHxr8mkGMGoOLKoGlMZhh8fNzHOYhl9iaCq
	8D0txWbDLvJK+OBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 451DE13312;
	Wed,  7 Oct 2026 13:37:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HyUsCB5Lxmq6FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 13:37:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: liux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: Use linked list for jack table
Date: Wed,  7 Oct 2026 15:37:13 +0200
Message-ID: <20261007133720.1133042-1-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

So far we've used snd_array infrastructure for managing the
hda_jack_tbl elements, but it turned out that this may lead to a UAF
when a different order of destruction procedure is applied; namely,
each hda_jack_tbl object creates a snd_jack object and sets the
private_data pointing to the hda_jack_tbl, and private_free to release
it.  It looks harmless, but since snd_array may reallocate the whole
table at growing, the formerly referred jack pointer may become stale.

Fortunately, currently there is no call pattern that triggers this
issue, so it's only hypothetical, but we should address it in anyway.

There are several ways to address this, and at this time, we rather
redesign the hda_jack_tbl allocations: instead of snd_array(), do a
normal kmalloc() + linked list.  There will be more kmalloc calls than
the original code, but as the number of jacks are usually at most
handful, it must not be a problem.  This change allows us the
persistent jack pointer, so no stale pointer access can happen any
longer.

This also fixes another reported issue about the stale jack pointer
reference in snd_hda_jack_tbl_new(), too.

Fixes: 31ef22579302 ("ALSA: hda - Integrate input-jack stuff into kctl-jack")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h       |  6 ++-
 sound/hda/common/codec.c        |  1 -
 sound/hda/common/hda_jack.h     |  1 +
 sound/hda/common/jack.c         | 67 +++++++++++++++++----------------
 sound/soc/sof/intel/hda-codec.c |  4 +-
 5 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 1d05f991f2ce..c7f29ad64e02 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -28,6 +28,7 @@ struct hda_codec;
 struct hda_pcm;
 struct hda_pcm_stream;
 struct hda_codec_ops;
+struct hda_jack_tbl;
 
 /*
  * codec bus
@@ -274,7 +275,8 @@ struct hda_codec {
 				 struct hda_codec *codec, hda_nid_t nid);
 
 	/* jack detection */
-	struct snd_array jacktbl;
+	struct hda_jack_tbl *jacktbl, *jacktbl_last; /* linked list head/tail */
+	int jacktbl_used; /* number of jacktbl elements */
 	unsigned long jackpoll_interval; /* In jiffies. Zero means no poll, rely on unsol events */
 	struct delayed_work jackpoll_work;
 
@@ -519,7 +521,7 @@ void snd_hda_update_power_acct(struct hda_codec *codec);
 
 static inline bool hda_codec_need_resume(struct hda_codec *codec)
 {
-	return !codec->relaxed_resume && codec->jacktbl.used;
+	return !codec->relaxed_resume && codec->jacktbl_used;
 }
 
 /*
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index c61fd79c48f3..b79346d01021 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -921,7 +921,6 @@ snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
 	snd_array_init(&codec->driver_pins, sizeof(struct hda_pincfg), 16);
 	snd_array_init(&codec->cvt_setups, sizeof(struct hda_cvt_setup), 8);
 	snd_array_init(&codec->spdif_out, sizeof(struct hda_spdif_out), 16);
-	snd_array_init(&codec->jacktbl, sizeof(struct hda_jack_tbl), 16);
 	snd_array_init(&codec->verbs, sizeof(struct hda_verb *), 8);
 	INIT_LIST_HEAD(&codec->conn_list);
 	INIT_LIST_HEAD(&codec->pcm_list_head);
diff --git a/sound/hda/common/hda_jack.h b/sound/hda/common/hda_jack.h
index e9b9970c59ed..a06b315e4b05 100644
--- a/sound/hda/common/hda_jack.h
+++ b/sound/hda/common/hda_jack.h
@@ -44,6 +44,7 @@ struct hda_jack_tbl {
 	int type;
 	int button_state;
 	struct snd_jack *jack;
+	struct hda_jack_tbl *next;
 };
 
 struct hda_jack_keymap {
diff --git a/sound/hda/common/jack.c b/sound/hda/common/jack.c
index c3efab3b5bfe..fc048f8079e5 100644
--- a/sound/hda/common/jack.c
+++ b/sound/hda/common/jack.c
@@ -76,12 +76,11 @@ static u32 read_pin_sense(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 struct hda_jack_tbl *
 snd_hda_jack_tbl_get_mst(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 {
-	struct hda_jack_tbl *jack = codec->jacktbl.list;
-	int i;
+	struct hda_jack_tbl *jack;
 
-	if (!nid || !jack)
+	if (!nid)
 		return NULL;
-	for (i = 0; i < codec->jacktbl.used; i++, jack++)
+	for (jack = codec->jacktbl; jack; jack = jack->next)
 		if (jack->nid == nid && jack->dev_id == dev_id)
 			return jack;
 	return NULL;
@@ -98,12 +97,11 @@ struct hda_jack_tbl *
 snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec,
 			      unsigned char tag, int dev_id)
 {
-	struct hda_jack_tbl *jack = codec->jacktbl.list;
-	int i;
+	struct hda_jack_tbl *jack;
 
-	if (!tag || !jack)
+	if (!tag)
 		return NULL;
-	for (i = 0; i < codec->jacktbl.used; i++, jack++)
+	for (jack = codec->jacktbl; jack; jack = jack->next)
 		if (jack->tag == tag && jack->dev_id == dev_id)
 			return jack;
 	return NULL;
@@ -113,12 +111,11 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_tbl_get_from_tag);
 static struct hda_jack_tbl *
 any_jack_tbl_get_from_nid(struct hda_codec *codec, hda_nid_t nid)
 {
-	struct hda_jack_tbl *jack = codec->jacktbl.list;
-	int i;
+	struct hda_jack_tbl *jack;
 
-	if (!nid || !jack)
+	if (!nid)
 		return NULL;
-	for (i = 0; i < codec->jacktbl.used; i++, jack++)
+	for (jack = codec->jacktbl; jack; jack = jack->next)
 		if (jack->nid == nid)
 			return jack;
 	return NULL;
@@ -142,12 +139,19 @@ snd_hda_jack_tbl_new(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 
 	if (jack)
 		return jack;
-	jack = snd_array_new(&codec->jacktbl);
+	jack = kzalloc_obj(*jack);
 	if (!jack)
 		return NULL;
 	jack->nid = nid;
 	jack->dev_id = dev_id;
 	jack->jack_dirty = 1;
+	if (!codec->jacktbl)
+		codec->jacktbl = jack;
+	else
+		codec->jacktbl_last->next = jack;
+	codec->jacktbl_last = jack;
+	codec->jacktbl_used++;
+
 	if (existing_nid_jack) {
 		jack->tag = existing_nid_jack->tag;
 
@@ -158,7 +162,7 @@ snd_hda_jack_tbl_new(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 		 */
 		jack->jack_detect = existing_nid_jack->jack_detect;
 	} else {
-		jack->tag = codec->jacktbl.used;
+		jack->tag = codec->jacktbl_used;
 	}
 
 	return jack;
@@ -166,10 +170,9 @@ snd_hda_jack_tbl_new(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 
 void snd_hda_jack_tbl_disconnect(struct hda_codec *codec)
 {
-	struct hda_jack_tbl *jack = codec->jacktbl.list;
-	int i;
+	struct hda_jack_tbl *jack;
 
-	for (i = 0; i < codec->jacktbl.used; i++, jack++) {
+	for (jack = codec->jacktbl; jack; jack = jack->next) {
 		if (!codec->bus->shutdown && jack->jack)
 			snd_device_disconnect(codec->card, jack->jack);
 	}
@@ -177,12 +180,12 @@ void snd_hda_jack_tbl_disconnect(struct hda_codec *codec)
 
 void snd_hda_jack_tbl_clear(struct hda_codec *codec)
 {
-	struct hda_jack_tbl *jack = codec->jacktbl.list;
-	int i;
+	struct hda_jack_tbl *jack, *jack_next;
 
-	for (i = 0; i < codec->jacktbl.used; i++, jack++) {
+	for (jack = codec->jacktbl; jack; jack = jack_next) {
 		struct hda_jack_callback *cb, *next;
 
+		jack_next = jack->next;
 		/* free jack instances manually when clearing/reconfiguring */
 		if (!codec->bus->shutdown && jack->jack)
 			snd_device_free(codec->card, jack->jack);
@@ -191,8 +194,11 @@ void snd_hda_jack_tbl_clear(struct hda_codec *codec)
 			next = cb->next;
 			kfree(cb);
 		}
+		kfree(jack);
 	}
-	snd_array_free(&codec->jacktbl);
+
+	codec->jacktbl = codec->jacktbl_last = NULL;
+	codec->jacktbl_used = 0;
 }
 
 #define get_jack_plug_state(sense) !!(sense & AC_PINSENSE_PRESENCE)
@@ -238,10 +244,9 @@ static void jack_detect_update(struct hda_codec *codec,
  */
 void snd_hda_jack_set_dirty_all(struct hda_codec *codec)
 {
-	struct hda_jack_tbl *jack = codec->jacktbl.list;
-	int i;
+	struct hda_jack_tbl *jack;
 
-	for (i = 0; i < codec->jacktbl.used; i++, jack++)
+	for (jack = codec->jacktbl; jack; jack = jack->next)
 		if (jack->nid)
 			jack->jack_dirty = 1;
 }
@@ -478,19 +483,17 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_set_button_state);
 void snd_hda_jack_report_sync(struct hda_codec *codec)
 {
 	struct hda_jack_tbl *jack;
-	int i, state;
+	int state;
 
 	/* update all jacks at first */
-	jack = codec->jacktbl.list;
-	for (i = 0; i < codec->jacktbl.used; i++, jack++)
+	for (jack = codec->jacktbl; jack; jack = jack->next)
 		if (jack->nid)
 			jack_detect_update(codec, jack);
 
 	/* report the updated jacks; it's done after updating all jacks
 	 * to make sure that all gating jacks properly have been set
 	 */
-	jack = codec->jacktbl.list;
-	for (i = 0; i < codec->jacktbl.used; i++, jack++)
+	for (jack = codec->jacktbl; jack; jack = jack->next)
 		if (jack->nid) {
 			if (!jack->jack || jack->block_report)
 				continue;
@@ -758,10 +761,10 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_unsol_event);
  */
 void snd_hda_jack_poll_all(struct hda_codec *codec)
 {
-	struct hda_jack_tbl *jack = codec->jacktbl.list;
-	int i, changes = 0;
+	struct hda_jack_tbl *jack;
+	int changes = 0;
 
-	for (i = 0; i < codec->jacktbl.used; i++, jack++) {
+	for (jack = codec->jacktbl; jack; jack = jack->next) {
 		unsigned int old_sense;
 		if (!jack->nid || !jack->jack_dirty || jack->phantom_jack)
 			continue;
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index fd371850b0d6..91f7ca22a4a7 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -89,7 +89,7 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable)
 		list_for_each_codec(codec, hbus) {
 			/* only set WAKEEN when needed for HDaudio codecs */
 			mask |= BIT(codec->core.addr);
-			if (codec->jacktbl.used)
+			if (codec->jacktbl_used)
 				val |= BIT(codec->core.addr);
 		}
 	} else {
@@ -118,7 +118,7 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
 		 * Wake up all jack-detecting codecs regardless whether an event
 		 * has been recorded in STATESTS
 		 */
-		if (codec->jacktbl.used)
+		if (codec->jacktbl_used)
 			pm_request_resume(&codec->core.dev);
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_jack_check, "SND_SOC_SOF_HDA_AUDIO_CODEC");
-- 
2.55.0

