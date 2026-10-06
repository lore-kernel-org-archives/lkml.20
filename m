Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF32C4A0138;
	Tue,  6 Oct 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308416; cv=none; b=ejr4ZdSzNIPaiu6riTRlLAVCsjFkGOTi7mGWCIflbj+S+AUeoTc2HSXWk7ieweNwnNSnV3oUh5XosGVTB5uBCb0+CB6U8fQgeYOC9zzTf+0USJgkN/OasulhHNjApCSV10aitYviPSXqb2ocr6/tMFfGZ9WAlh+EoL2RAB4d5uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308416; c=relaxed/simple;
	bh=Cyedh5hvGjdmnRHaSEJ+NgtF8dBjwBBzKLIjDAlGZ9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILAs9PHxh71bKPkd9FUYsOu9jUgP4hjqZSbfiMGcZAGKZC4gSnOqVkpff6+7alRSfuJk07PDnwii2s4bS5d4+xv0YZEqmHccyXvQYN5Cd1pC4jkU8uceVbrlTLKFJJpCBPdpvUXPoBl7Dip89AM/SF/zc1G/OOfiyiATHtKZ+nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Awo3Agx1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VLrpDCdT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ROwdeZOF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fN1ZN8hM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Awo3Agx1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VLrpDCdT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ROwdeZOF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fN1ZN8hM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9285121F64;
	Tue,  6 Oct 2026 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpM5TelmzHm/aiRfs7BsGTHJF0ZQJXXxSFF502rehfM=;
	b=Awo3Agx1pM3nQBBEPHjBazgwxcHAVT2S2pNkZ3UjqNFRVi8gcG3Iw2YvO/D36t1YMiUKcp
	T8TQGWijNrSCa6/MXdM2t1u0gy2cTvuzUHL4X2XvuabS7ochE4zmJzkhLCA70lG390tFz5
	XCHu2ci7AV/vpWYw60aHfW1qaKsRp2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpM5TelmzHm/aiRfs7BsGTHJF0ZQJXXxSFF502rehfM=;
	b=VLrpDCdTLB0S00A77j5OH4T/YldA7y33tw1GJsLxoXHYOzrButtjru5urUZqs+jhmXy0Ay
	lsVWgG9jFTa6W6BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ROwdeZOF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fN1ZN8hM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpM5TelmzHm/aiRfs7BsGTHJF0ZQJXXxSFF502rehfM=;
	b=ROwdeZOFouH8hmQDX6ffUJdr8Yi0d1HfWKBJP2Gp5KfMiSLmgPbskzPzR+wDAUWkB9nk0L
	uPwta20C/fEdJcJaCOxMcbazO0W82bFruA+SZNNpNxsR1wdhY5Ff+oiK+Jul2NCUGLjTdP
	v7HqpXlBaQfYX2CH1eLd3DbZZz7fPg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpM5TelmzHm/aiRfs7BsGTHJF0ZQJXXxSFF502rehfM=;
	b=fN1ZN8hM4BjSGlx+BqD2BqnYh0DPKH1YAOX5ELCxhsMjvQF6GMvYFpv+adgQkGRaCxamX7
	CIF8alv1dtKu9yAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E45C913B84;
	Tue,  6 Oct 2026 17:40:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qpimInMyxWr1eAAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 17:40:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] ALSA: aloop: Avoid a bad mixure of guard() and goto
Date: Tue,  6 Oct 2026 19:39:55 +0200
Message-ID: <20261006174002.703431-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006174002.703431-1-tiwai@suse.de>
References: <20261006174002.703431-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9285121F64
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

The rewrite of aloop driver code using guard() leaded to a mixture of
guard() and some goto; although it currently works, it isn't really a
good match.

For avoiding the bad match, rewrite with scoped_guard(), so that we
can replace goto with break gracefully.

Fixes: ebd9b6c91d4e ("ALSA: aloop: Use guard() for mutex locks")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 154 +++++++++++++++++++++---------------------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 5f0e2dc96769..f9659f436bfc 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1384,94 +1384,94 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	int err = 0;
 	int dev = get_cable_index(substream);
 
-	guard(mutex)(&loopback->cable_lock);
-	dpcm = kzalloc_obj(*dpcm);
-	if (!dpcm)
-		return -ENOMEM;
-	dpcm->loopback = loopback;
-	dpcm->substream = substream;
+	scoped_guard(mutex, &loopback->cable_lock) {
+		dpcm = kzalloc_obj(*dpcm);
+		if (!dpcm)
+			return -ENOMEM;
+		dpcm->loopback = loopback;
+		dpcm->substream = substream;
 
-	cable = loopback->cables[substream->number][dev];
-	if (!cable) {
-		cable = kzalloc_obj(*cable);
+		cable = loopback->cables[substream->number][dev];
 		if (!cable) {
-			err = -ENOMEM;
-			goto unlock;
-		}
-		spin_lock_init(&cable->lock);
-		snd_refcount_init(&cable->stop_count);
-		cable->hw = loopback_pcm_hardware;
+			cable = kzalloc_obj(*cable);
+			if (!cable) {
+				err = -ENOMEM;
+				break;
+			}
+			spin_lock_init(&cable->lock);
+			snd_refcount_init(&cable->stop_count);
+			cable->hw = loopback_pcm_hardware;
 #ifdef CONFIG_HIGH_RES_TIMERS
-		if (loopback->timer_source && !strcmp(loopback->timer_source, "hrtimer"))
-			cable->ops = &loopback_hrtimer_ops;
-		else
+			if (loopback->timer_source && !strcmp(loopback->timer_source, "hrtimer"))
+				cable->ops = &loopback_hrtimer_ops;
+			else
 #endif
-		if (loopback->timer_source && loopback->timer_source[0])
-			cable->ops = &loopback_snd_timer_ops;
-		else
-			cable->ops = &loopback_jiffies_timer_ops;
-		loopback->cables[substream->number][dev] = cable;
-	}
-	dpcm->cable = cable;
-	runtime->private_data = dpcm;
+				if (loopback->timer_source && loopback->timer_source[0])
+					cable->ops = &loopback_snd_timer_ops;
+				else
+					cable->ops = &loopback_jiffies_timer_ops;
+			loopback->cables[substream->number][dev] = cable;
+		}
+		dpcm->cable = cable;
+		runtime->private_data = dpcm;
 
-	if (cable->ops->open) {
-		err = cable->ops->open(dpcm);
-		if (err < 0)
-			goto unlock;
-	}
+		if (cable->ops->open) {
+			err = cable->ops->open(dpcm);
+			if (err < 0)
+				break;
+		}
 
-	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+		snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 
-	/* use dynamic rules based on actual runtime->hw values */
-	/* note that the default rules created in the PCM midlevel code */
-	/* are cached -> they do not reflect the actual state */
-	err = snd_pcm_hw_rule_add(runtime, 0,
-				  SNDRV_PCM_HW_PARAM_FORMAT,
-				  rule_format, dpcm,
-				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
-	if (err < 0)
-		goto unlock;
-	err = snd_pcm_hw_rule_add(runtime, 0,
-				  SNDRV_PCM_HW_PARAM_RATE,
-				  rule_rate, dpcm,
-				  SNDRV_PCM_HW_PARAM_RATE, -1);
-	if (err < 0)
-		goto unlock;
-	err = snd_pcm_hw_rule_add(runtime, 0,
-				  SNDRV_PCM_HW_PARAM_CHANNELS,
-				  rule_channels, dpcm,
-				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
-	if (err < 0)
-		goto unlock;
-
-	/* In case of sound timer the period time of both devices of the same
-	 * loop has to be the same.
-	 * This rule only takes effect if a sound timer was chosen
-	 */
-	if (cable->snd_timer.instance) {
+		/* use dynamic rules based on actual runtime->hw values */
+		/* note that the default rules created in the PCM midlevel code */
+		/* are cached -> they do not reflect the actual state */
 		err = snd_pcm_hw_rule_add(runtime, 0,
-					  SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
-					  rule_period_bytes, dpcm,
-					  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, -1);
+					  SNDRV_PCM_HW_PARAM_FORMAT,
+					  rule_format, dpcm,
+					  SNDRV_PCM_HW_PARAM_FORMAT, -1);
 		if (err < 0)
-			goto unlock;
+			break;
+		err = snd_pcm_hw_rule_add(runtime, 0,
+					  SNDRV_PCM_HW_PARAM_RATE,
+					  rule_rate, dpcm,
+					  SNDRV_PCM_HW_PARAM_RATE, -1);
+		if (err < 0)
+			break;
+		err = snd_pcm_hw_rule_add(runtime, 0,
+					  SNDRV_PCM_HW_PARAM_CHANNELS,
+					  rule_channels, dpcm,
+					  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
+		if (err < 0)
+			break;
+
+		/* In case of sound timer the period time of both devices of the same
+		 * loop has to be the same.
+		 * This rule only takes effect if a sound timer was chosen
+		 */
+		if (cable->snd_timer.instance) {
+			err = snd_pcm_hw_rule_add(runtime, 0,
+						  SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+						  rule_period_bytes, dpcm,
+						  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, -1);
+			if (err < 0)
+				break;
+		}
+
+		/* loopback_runtime_free() has not to be called if kfree(dpcm) was
+		 * already called here. Otherwise it will end up with a double free.
+		 */
+		runtime->private_free = loopback_runtime_free;
+		if (get_notify(dpcm))
+			runtime->hw = loopback_pcm_hardware;
+		else
+			runtime->hw = cable->hw;
+
+		scoped_guard(spinlock_irq, &cable->lock) {
+			cable->streams[substream->stream] = dpcm;
+		}
 	}
 
-	/* loopback_runtime_free() has not to be called if kfree(dpcm) was
-	 * already called here. Otherwise it will end up with a double free.
-	 */
-	runtime->private_free = loopback_runtime_free;
-	if (get_notify(dpcm))
-		runtime->hw = loopback_pcm_hardware;
-	else
-		runtime->hw = cable->hw;
-
-	scoped_guard(spinlock_irq, &cable->lock) {
-		cable->streams[substream->stream] = dpcm;
-	}
-
- unlock:
 	if (err < 0) {
 		free_cable(substream);
 		kfree(dpcm);
-- 
2.55.0

