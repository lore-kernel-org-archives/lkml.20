Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235043A9612;
	Thu, 15 Oct 2026 07:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048735; cv=none; b=iRGXiA0RMkEj3DiaCEqrC74O4RWwUUY1gBS4bY5NT/N/cFxwNrkZr/rJpMX7uvOc5kWT/G+dYktq8h1b9zruNL2naA48lpHE7Z1d2aAzhGo0gHJQvWdPlimsxEnLAEl5eyXgPLDiaPwq+iS3TIYfhJYhlBclsAvPY7WCEgNtogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048735; c=relaxed/simple;
	bh=V0Kkw2OIzafQSyJWxRnxorw292FPRoNIAav55cKs1Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKpt5H3xAndvD/WPbXIMEOoe05a6T1s6MPKot4OhQA2nQR/z3xQGLEoAGysNOHWCRKUQo3irEQMlEnw4uTp9W1H/Ymf68JnSqXohRSKINkaTUGxf8kpA4tTZC4N3IsFJRR33A3jx+b6xzmxtOHuvx6QuUx3FJhMpyIME8gtTPYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ELmJfCbr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FWyMb812; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FK78u+l6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bjbs026u; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ELmJfCbr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FWyMb812";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FK78u+l6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bjbs026u"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A046E22345;
	Thu, 15 Oct 2026 07:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792048723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3E9zOhiO3tXgrJVaWgIrzjy4ysINOvEXD3TRTKx6aMk=;
	b=ELmJfCbr0ZeMD78P9hdqaQ6R1gXOraIOd8UDz65kSoQTNQ232hq7qCv9Uw3SMSp5n0Y5yh
	83K9gmulioSyN8wr8JR9qIi8N02GBb3NUZBJ6LtGiJcM9F8Pvdql28kJKdui56Rz7luyHp
	/mknkkRpAwEN+Gve0SRWkoWiL1m7bTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792048723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3E9zOhiO3tXgrJVaWgIrzjy4ysINOvEXD3TRTKx6aMk=;
	b=FWyMb812SgouDfWluhXMz7whboBVnOGqleV8T/XgFTlyCo6dEhfyRrlZX9nWvdr7T6sBvs
	1WZdLGbbMSosqnAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FK78u+l6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Bjbs026u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792048721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3E9zOhiO3tXgrJVaWgIrzjy4ysINOvEXD3TRTKx6aMk=;
	b=FK78u+l6lDpV4Wuxjsuhz7er+EgbLFDbfy8v0XsL7OUMVGES2TM8toW56aPC9btsxPXSre
	MDzYoEWVL9y1KRY6pwPlfS0KVyvpUOej36yTldl9kPqNJEXdGU8+vES2YJHQtUo+lemrFr
	RLOFS0THz3sBI0Y7kGQFAGUB+lEE7vw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792048721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3E9zOhiO3tXgrJVaWgIrzjy4ysINOvEXD3TRTKx6aMk=;
	b=Bjbs026ul0TTV4hHEJlAsP3V+E5fAI2Lymm5WyG0f64odfcK3s2aTwylPnAMYmOUAz+6ot
	Iyc5Cv+AXlLvIzBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62D421373D;
	Thu, 15 Oct 2026 07:18:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qgDbDlF+0GqvNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 07:18:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: pcm: Add refcount for races between drain and unlink
Date: Thu, 15 Oct 2026 09:18:09 +0200
Message-ID: <20261015071838.31082-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A046E22345
X-Rspamd-Action: no action
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,alsa-project.org:email,suse.de:email,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01

We added a workaround for the case where a linked substream gets
unlinked during the drain operation by another substream of the same
linked group in the commit 9b1dbd69ba6f ("ALSA: pcm: fix
use-after-free on linked stream runtime in snd_pcm_drain()").
There, we just cached the parameters of the draining substream for
avoiding UAF.

Then, we check the draining substream (to_check) again in the loop and
remove it from the queue only when it's still present.  It means,
however, that the wait queue entry won't be removed if the substream
went out of the link beforehand, hence a stale wq entry remains.
Later on, this can be woken up, and this may hit a UAF, too.
The problem surfaced more due to the recent change to call
snd_pcm_unlink() earlier.

For properly handling both cases above, in this patch, we introduce a
refcount to the snd_pcm_runtime that indicates the substream is being
accessed / used, then at snd_pcm_release_substream(), it's synced
before the actual resource release via snd_refcount_sync().  This
guarantees that the accessors are finished, and safe to release
memories.  Along with the introduction of a refcount, the comments and
the code changes by the former fix were partially reverted as they
don't fit with the updated code flow any longer.

Last but not least, the setup of wait queue entry and
prepare_to_wait() call are moved before the group unref.  With this
change, we can avoid the race between the enqueue and the wakeup, too.

Fixes: 9b1dbd69ba6f ("ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain()")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Fix potential race between enqueue and wakeup

 include/sound/pcm.h     |  2 ++
 sound/core/pcm.c        |  1 +
 sound/core/pcm_native.c | 54 ++++++++++++++++-------------------------
 3 files changed, 24 insertions(+), 33 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 02d8689354c4..1cf511f8d880 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -8,6 +8,7 @@
  *                   Abramo Bagnara <abramo@alsa-project.org>
  */
 
+#include <sound/core.h>
 #include <sound/asound.h>
 #include <sound/memalloc.h>
 #include <sound/minors.h>
@@ -414,6 +415,7 @@ struct snd_pcm_runtime {
 	snd_pcm_uframes_t twake; 	/* do transfer (!poll) wakeup if non-zero */
 	wait_queue_head_t sleep;	/* poll sleep */
 	wait_queue_head_t tsleep;	/* transfer sleep */
+	struct snd_refcount refcnt;	/* refcount for draining, etc */
 	struct snd_fasync *fasync;
 	bool stop_operating;		/* sync_stop will be called */
 	struct mutex buffer_mutex;	/* protect for buffer changes */
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 41c2cab7a52c..c133f23418fe 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -957,6 +957,7 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 
 	init_waitqueue_head(&runtime->sleep);
 	init_waitqueue_head(&runtime->tsleep);
+	snd_refcount_init(&runtime->refcnt);
 
 	__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_OPEN);
 	mutex_init(&runtime->buffer_mutex);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 7ffbf2c0ea92..05097f2630ad 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2226,9 +2226,6 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	for (;;) {
 		long tout;
 		struct snd_pcm_runtime *to_check;
-		unsigned int drain_rate;
-		snd_pcm_uframes_t drain_bufsz;
-		bool drain_no_period_wakeup;
 
 		if (signal_pending(current)) {
 			result = -ERESTARTSYS;
@@ -2243,45 +2240,35 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 			runtime = s->runtime;
 			if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
 				to_check = runtime;
+				/* pin the draining substream */
+				snd_refcount_get(&to_check->refcnt);
+
+				init_wait_entry(&wait, 0);
+				prepare_to_wait(&to_check->sleep, &wait,
+						TASK_INTERRUPTIBLE);
+				if (to_check->no_period_wakeup) {
+					tout = MAX_SCHEDULE_TIMEOUT;
+				} else {
+					tout = 100;
+					if (to_check->rate) {
+						long t = to_check->buffer_size *
+							1100 / to_check->rate;
+						tout = max(t, tout);
+					}
+					tout = msecs_to_jiffies(tout);
+				}
 				break;
 			}
 		}
 		snd_pcm_group_unref(group, substream);
 		if (!to_check)
 			break; /* all drained */
-		/*
-		 * Cache the runtime fields needed after unlock.
-		 * A concurrent close() on the linked stream may free
-		 * its runtime via snd_pcm_detach_substream() once we
-		 * release the stream lock below.
-		 */
-		drain_no_period_wakeup = to_check->no_period_wakeup;
-		drain_rate = to_check->rate;
-		drain_bufsz = to_check->buffer_size;
-		init_wait_entry(&wait, 0);
-		prepare_to_wait(&to_check->sleep, &wait, TASK_INTERRUPTIBLE);
 		snd_pcm_stream_unlock_irq(substream);
-		if (drain_no_period_wakeup)
-			tout = MAX_SCHEDULE_TIMEOUT;
-		else {
-			tout = 100;
-			if (drain_rate) {
-				long t = drain_bufsz * 1100 / drain_rate;
-				tout = max(t, tout);
-			}
-			tout = msecs_to_jiffies(tout);
-		}
 		tout = schedule_timeout(tout);
-
 		snd_pcm_stream_lock_irq(substream);
-		group = snd_pcm_stream_group_ref(substream);
-		snd_pcm_group_for_each_entry(s, substream) {
-			if (s->runtime == to_check) {
-				finish_wait(&to_check->sleep, &wait);
-				break;
-			}
-		}
-		snd_pcm_group_unref(group, substream);
+		finish_wait(&to_check->sleep, &wait);
+		/* unpin the draining substream again now */
+		snd_refcount_put(&to_check->refcnt);
 
 		if (card->shutdown) {
 			result = -ENODEV;
@@ -2835,6 +2822,7 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 
 	snd_pcm_drop(substream);
 	if (substream->hw_opened) {
+		snd_refcount_sync(&substream->runtime->refcnt);
 		if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 			do_hw_free(substream);
 		substream->ops->close(substream);
-- 
2.55.0

