Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D724D797D;
	Fri,  2 Oct 2026 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953475; cv=none; b=XNp0V/2p/Yaiek/OX5sAWp8Dx9nqZ2XV0W2MBWIAdjfptySVYlyLQzhNAMfuTMsdDLOncN6hMwEeLhkyjKL8z0SjV8PHyow1FQr+FXgM115NGjGD5qxvM9qfx4JWCKBX5rKtSUOTeZcWYh7NfYRv1GJBRLg1BRLLC+d/907MIGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953475; c=relaxed/simple;
	bh=qX52uZmAdbiSCRetvyhNuUWaXF0HDavOVq7HF3qgQj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mjr9MgExj2ftDI6l2W0EWTAnlzdNGaydI9iWF528tU9Vv4mNlVWu7V8xoX1u/MoRFV1YGXWGa5teAO/+WxMHSqVRb+jyI+Z6WHvgWsN7iE7Kx5A/VqYC7FzFvaR3M9MKVhkhxsmOkasbo2lnqC+UBmaaT74t4FHHbPhxR0I7jcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ma/aZjpw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4wrVxpDR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p0sQRTRq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cONnvlG9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ma/aZjpw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4wrVxpDR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p0sQRTRq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cONnvlG9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 415C421293;
	Fri,  2 Oct 2026 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kfhHvWRUAoY09w/A/I09Y35lGwW7C9QqCketHYsArFo=;
	b=Ma/aZjpwQP+TlbmpqDX1gCMhdagximRoYz6MsT7wAD6SAORKeSPhLsSOZwf1OewuZlFL52
	2CoxVMJgdGjGV/YXA+SOKb7F16Il1IU/6+xVTTKT3ahDRk20pIgOIXMpwM0TpEoRe3RAwm
	CC5qjOvHr/UecutUH9PqDTM5U3Z6ofs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kfhHvWRUAoY09w/A/I09Y35lGwW7C9QqCketHYsArFo=;
	b=4wrVxpDRCe1HMJKBO15xA3q//bCn4vDdBXWlNPoAdlLfCu7gvuRl7hbq9gdZRnSxi8GHXa
	GnTzSUJN8xqBrvCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kfhHvWRUAoY09w/A/I09Y35lGwW7C9QqCketHYsArFo=;
	b=p0sQRTRq++sl43tL0HnHN7g3KgpcdjaHaBG5kgyJkvc82Tj5ET4zj7cjmtPGKzxRnASQTQ
	sC1JSXEeU6aYRXUJ+2wEcclmpcrCj5IemPTAHtcWnp3DBiThlb8ZpiRJ2innou0BLWpcC4
	eOVucU7ZgyeHf6DOdglqtgmphPJCXX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kfhHvWRUAoY09w/A/I09Y35lGwW7C9QqCketHYsArFo=;
	b=cONnvlG93aB+/Sip4qXQR4B/TttTbRpfwCME/Zl/835+xwCoo9Xn8iFJA1gMY4F94txFnV
	S2sPPvl+IQZE8VCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFC0E139D3;
	Fri,  2 Oct 2026 15:04:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mI9DLfXHv2p9ZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:04:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Optimize cpu_latency_qos_*() calls
Date: Fri,  2 Oct 2026 17:04:19 +0200
Message-ID: <20261002150420.879056-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

We have a few cpu_latency_qos_*() calls in PCM callbacks, but they
seem suboptimal in a few aspects:
- We call them at each time when the hw_params changed, but explicitly
  do remove and (re-)add; this could be
  cpu_latency_qos_update_request(), instead
- The setup of cpu_latency_qos_*() doesn't have to be in hw_params at
  all; it's not the place where the actual parameters are set up, but
  rather better at the prepare callback.
- The hw_free calls cpu_latency_qos_remove_request() unconditionally,
  which may be poking a WARNING when it wasn't queued.

For addressing the issues above, this patch cleans up and reorganize
the cpu_latency_qos_*() calls in the PCM core by a couple helper
functions.  Now, they are set up at prepare callback, and cleared at
hw_free and release callbacks via the new helpers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 5abe16a03b34..6efaebc7f8b4 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -778,11 +778,32 @@ EXPORT_SYMBOL_GPL(snd_pcm_runtime_buffer_set_silence);
 #define is_oss_stream(substream)	false
 #endif
 
+static void pcm_qos_req_clear(struct snd_pcm_substream *substream)
+{
+	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
+		cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
+}
+
+static void pcm_qos_req_update(struct snd_pcm_substream *substream, int usecs)
+{
+	if (usecs < 0) {
+		pcm_qos_req_clear(substream);
+		return;
+	}
+
+	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
+		cpu_latency_qos_update_request(&substream->latency_pm_qos_req,
+					       usecs);
+	else
+		cpu_latency_qos_add_request(&substream->latency_pm_qos_req,
+					    usecs);
+}
+
 static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime;
-	int err, usecs;
+	int err;
 	unsigned int bits;
 	snd_pcm_uframes_t frames;
 
@@ -889,12 +910,6 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_timer_resolution_change(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
 
-	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
-		cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
-	usecs = period_to_usecs(runtime);
-	if (usecs >= 0)
-		cpu_latency_qos_add_request(&substream->latency_pm_qos_req,
-					    usecs);
 	err = 0;
  _error:
 	if (err) {
@@ -971,7 +986,7 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 		goto unlock;
 	result = do_hw_free(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
-	cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
+	pcm_qos_req_clear(substream);
  unlock:
 	snd_pcm_buffer_access_unlock(runtime);
 	return result;
@@ -2005,6 +2020,7 @@ static int snd_pcm_do_prepare(struct snd_pcm_substream *substream,
 	err = substream->ops->prepare(substream);
 	if (err < 0)
 		return err;
+	pcm_qos_req_update(substream, period_to_usecs(substream->runtime));
 	return snd_pcm_do_reset(substream, state);
 }
 
@@ -2795,8 +2811,7 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 		substream->ops->close(substream);
 		substream->hw_opened = 0;
 	}
-	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
-		cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
+	pcm_qos_req_clear(substream);
 	if (substream->pcm_release) {
 		substream->pcm_release(substream);
 		substream->pcm_release = NULL;
-- 
2.55.0

