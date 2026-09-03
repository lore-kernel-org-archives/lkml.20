Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A14C77D5;
	Thu,  3 Sep 2026 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448109; cv=none; b=hJPo5ehccBr31O6bHV3THh1dLOAoyQQqBaMzbIcwMQ41uenoiE0oSFdCNJFATu5xp2213dcmZAA9qAK6J+drtpsMc5se2OxzHE8vp2ru1Dk+GXw41cVb4jod3jU5Cn95ovUzEysxv+JVOoWG8w86q1bU3ScpOVReXX3QXPo7mV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448109; c=relaxed/simple;
	bh=dv4/qn4nx2++bbjwRGUc4f7yY00pFeA8FolBZJf67JA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oe7y7WGuvWuHsZe8KmEd2Qwt2c6AKGmxVwj73LKFlHyo2YvDhZrLcAkSs7s3nH6EKOMu8lUHaCqhlTt5WsVrgP2i7csiW1jtIUtTgIdjBnMccsjHVMoN6M4m762vFHVIM0XyIJf6TjRJHcGVEEDgih5gbjuj7HcG1ZQHXtJNoC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fjfsNDxI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x44kAsc7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RF8Wy01o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ECpbuIa9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fjfsNDxI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x44kAsc7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RF8Wy01o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ECpbuIa9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B91521EF9;
	Thu,  3 Sep 2026 15:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788448102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NNng1xi7wnGZOTn8LdAzNwBMYqT5fQMJKIW9obh2AUk=;
	b=fjfsNDxIAXaN3RL+M96qH0XhXUtVwLu0etC+o088PJLrOerttPyjT/wa+DtOvnsOgl496i
	gxAJ8ufYM0tO1HTfFPlQvSiq4H65uaEM8zJEcA0YIjXSNPPHbtVZyed6PlZgWsi0QwYhtB
	WeBbf8JIjnO+bUm7PUYyf8EYYdB/kNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788448102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NNng1xi7wnGZOTn8LdAzNwBMYqT5fQMJKIW9obh2AUk=;
	b=x44kAsc7MAipC/tWxE8GvNS8v+RmwpsFF4wcbvb+tnYvwKkXhiln9uUPXpjkSvipL/UR+a
	PPMh9PSinrEdJyBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RF8Wy01o;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ECpbuIa9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788448098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NNng1xi7wnGZOTn8LdAzNwBMYqT5fQMJKIW9obh2AUk=;
	b=RF8Wy01o4ONUhMrGjDiMJag5xfkutq9NCGP6KJtqwSSiw1x/nqV09rnF4F2LOiqd8vxW1F
	dODdxLXW/vri3DFYjdViVQHtKd/hYo+9IleiLumkjj1bL4pPqHCVADbO6BUtuVKKnEAzU/
	X/1vm6//y+6tJmbWlZKKf3QrXL7zLFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788448098;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NNng1xi7wnGZOTn8LdAzNwBMYqT5fQMJKIW9obh2AUk=;
	b=ECpbuIa9Vd6l+jVBBz8LTsx4X9Ln76Ob62kLaA5YG2NZI2CPIXi1E+uAHgXpiIgYN4cVi4
	kXA40p8z/LtgltAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3640A136D9;
	Thu,  3 Sep 2026 15:08:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6iT5C2KNmWpUPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 15:08:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: rawmidi: Add a proper disconnect handling
Date: Thu,  3 Sep 2026 17:08:13 +0200
Message-ID: <20260903150816.1917831-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 6B91521EF9
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

The rawmidi core detaches only exposed devices at disconnection, but
it doesn't deal with the pending bytes or gate the further unexpected
accesses, leaving naively to each driver dealing with such situations.

Let's try to restrict it in the core side for more safety: introduce
the disconnected flag to each substream, set it at disconnection call,
then trigger down &  cancel the pending event work.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: cover the forgotten snd_rawmidi_receive(), too

 include/sound/rawmidi.h |  1 +
 sound/core/rawmidi.c    | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 4154035af414..d812f70725bd 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -86,6 +86,7 @@ struct snd_rawmidi_substream {
 	bool opened;			/* open flag */
 	bool append;			/* append flag (merge more streams) */
 	bool active_sensing;		/* send active sensing when close */
+	bool disconnected;		/* already disconnected */
 	unsigned int framing;		/* whether to frame input data */
 	unsigned int clock_type;	/* clock source to use for input framing */
 	int use_count;			/* use counter (for output) */
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 34b4c7d6dbe6..2e582688923d 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -208,14 +208,14 @@ static int snd_rawmidi_runtime_free(struct snd_rawmidi_substream *substream)
 
 static inline void snd_rawmidi_output_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	if (!substream->opened)
+	if (!substream->opened || substream->disconnected)
 		return;
 	substream->ops->trigger(substream, up);
 }
 
 static void snd_rawmidi_input_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	if (!substream->opened)
+	if (!substream->opened || substream->disconnected)
 		return;
 	substream->ops->trigger(substream, up);
 	if (!up)
@@ -254,7 +254,8 @@ int snd_rawmidi_drain_output(struct snd_rawmidi_substream *substream)
 
 	scoped_guard(spinlock_irq, &substream->lock) {
 		runtime = substream->runtime;
-		if (!substream->opened || !runtime || !runtime->buffer)
+		if (!substream->opened || !runtime || !runtime->buffer ||
+		    substream->disconnected)
 			return -EINVAL;
 		snd_rawmidi_buffer_ref(runtime);
 		runtime->drain = 1;
@@ -537,7 +538,7 @@ static void close_substream(struct snd_rawmidi *rmidi,
 	if (--substream->use_count)
 		return;
 
-	if (cleanup) {
+	if (cleanup && !substream->disconnected) {
 		if (substream->stream == SNDRV_RAWMIDI_STREAM_INPUT)
 			snd_rawmidi_input_trigger(substream, 0);
 		else {
@@ -1151,7 +1152,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 	struct snd_rawmidi_runtime *runtime;
 
 	guard(spinlock_irqsave)(&substream->lock);
-	if (!substream->opened)
+	if (!substream->opened || substream->disconnected)
 		return -EBADFD;
 	runtime = substream->runtime;
 	if (!runtime || !runtime->buffer) {
@@ -2063,8 +2064,13 @@ static int snd_rawmidi_dev_disconnect(struct snd_device *device)
 		struct snd_rawmidi_substream *s;
 
 		list_for_each_entry(s, &rmidi->streams[dir].substreams, list) {
-			if (s->runtime)
+			scoped_guard(spinlock_irq, &s->lock)
+				s->disconnected = true;
+			if (s->runtime) {
+				s->ops->trigger(s, 0);
+				cancel_work_sync(&s->runtime->event_work);
 				wake_up(&s->runtime->sleep);
+			}
 		}
 	}
 
-- 
2.55.0

