Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C04E80BD;
	Wed, 14 Oct 2026 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987147; cv=none; b=OmRVlDlzy8IU7JsEPT6c18J0foxjDyLtQmRAXbwHKF49VSEwXandk46rLTh7Ej1b5NwXHOfOtmtxvBkA5G9zqRvYSSlZ1xUACsZz1dEI7dhNLk9kkEPEjJoCCF6NDZRz9koZNd6xUVho2K8Jh+jMqziigKnA4ynrNsY3KL5kzTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987147; c=relaxed/simple;
	bh=MtgThzQ1njBUKujr+z+EvBHpcW2lCs5+op3q2fPgav8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tFze+ex5PrttEaugw6Vz5kbwN2v6CPY3qptcl1HeWzJtoRWMinzbu+EkW9iN0eX3QeDNhqmYKAssqYmBQPLQOFratzz8gxejfUEMps9zmCxCMGypa6XZKXgkRrbPlyNecKiy7x4eCeeJn98ZmHmRp9NYVvxT6T74cU0sa4A34iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IAqBnoCP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8tKvnQ2V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wIe+jS4/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sxIsUXGF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IAqBnoCP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8tKvnQ2V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wIe+jS4/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sxIsUXGF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A82BA1F7C1;
	Wed, 14 Oct 2026 14:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791987141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E1H5hcrPQh2rU12TigZSFLfiXPe8ucP8nib/3K5ch1o=;
	b=IAqBnoCP8Vv9onXKjg63wWDof5K8j8CjkTIm0MnIJxnB8aXqealP3O0FlTL0TpqJK3cFZB
	Xnt05/aSnSSWiWOTY0So9gFhzyPAPkJcw07yDlZgBvq3si6v9wpZ0pIMtu6LeGwRljmztK
	EJZbfw8ko2F6Y8SX/ouS7vKobYRfF1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791987141;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E1H5hcrPQh2rU12TigZSFLfiXPe8ucP8nib/3K5ch1o=;
	b=8tKvnQ2VaV7SPkmLvzQ9woMIXMIASQ/ppF102wLSM4tzFwX44rGcL07B0ftrXlLXhXnsTC
	JYk1npaeoknHroDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="wIe+jS4/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sxIsUXGF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791987139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E1H5hcrPQh2rU12TigZSFLfiXPe8ucP8nib/3K5ch1o=;
	b=wIe+jS4/zIJDaT5g0up4I6ucrc4n6H1XpGfzGyBkoPuP0dB1imE0TD06PHj7vMwM20SBPC
	Rmj5uCnDJ6L4ARoc6l4GQBK4fdUaU2v3daLJTIzqaDKJ1lWJE/EDhMsJcS1rFuB66tv4l4
	Tewerg9Uq6HlhCTVWLZsGS+wMb7wTIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791987139;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E1H5hcrPQh2rU12TigZSFLfiXPe8ucP8nib/3K5ch1o=;
	b=sxIsUXGFKFK+TJT69/5zF3hbK+33SeHl03QXO1KKRfXnFdTW3c9g2o8jVFSubqZsu/GH6d
	eI2PS+Z0wjfu0vCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3397F133F1;
	Wed, 14 Oct 2026 14:12:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xFLVNMKNz2o/bAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 14:12:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Add refcount for races between drain and unlink
Date: Wed, 14 Oct 2026 16:12:05 +0200
Message-ID: <20261014141212.316223-1-tiwai@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,alsa-project.org:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: A82BA1F7C1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

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

Fixes: 9b1dbd69ba6f ("ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain()")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     |  2 ++
 sound/core/pcm.c        |  1 +
 sound/core/pcm_native.c | 33 ++++++++++-----------------------
 3 files changed, 13 insertions(+), 23 deletions(-)

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
index 6c379068b54c..41b8e2d4894e 100644
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
@@ -2243,30 +2240,23 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 			runtime = s->runtime;
 			if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
 				to_check = runtime;
+				/* pin the draining substream */
+				snd_refcount_get(&to_check->refcnt);
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
 		init_wait_entry(&wait, 0);
 		prepare_to_wait(&to_check->sleep, &wait, TASK_INTERRUPTIBLE);
 		snd_pcm_stream_unlock_irq(substream);
-		if (drain_no_period_wakeup)
+		if (to_check->no_period_wakeup)
 			tout = MAX_SCHEDULE_TIMEOUT;
 		else {
 			tout = 100;
-			if (drain_rate) {
-				long t = drain_bufsz * 1100 / drain_rate;
+			if (to_check->rate) {
+				long t = to_check->buffer_size * 1100 / to_check->rate;
 				tout = max(t, tout);
 			}
 			tout = msecs_to_jiffies(tout);
@@ -2274,14 +2264,9 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 		tout = schedule_timeout(tout);
 
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
@@ -2832,7 +2817,9 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 	snd_pcm_unlink(substream);
 
 	snd_pcm_drop(substream);
+
 	if (substream->hw_opened) {
+		snd_refcount_sync(&substream->runtime->refcnt);
 		if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 			do_hw_free(substream);
 		substream->ops->close(substream);
-- 
2.55.0

