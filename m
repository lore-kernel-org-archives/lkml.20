Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82A3D6497;
	Wed,  7 Oct 2026 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393658; cv=none; b=LyRWHCDoweqO5xu0W0QXGbuJfZGnBLKHf3SdEN6GXne/IaeizN2dcV9Fqvnu3gwvPZGVRCEInbRxxuAAWerIoWwVmZr8+OFpXn7UrlhqsXwnMODQeHRtQRbMKnpwzKPi7PT02BkixGX/fzbHURGPQpHNnt1IH9d3YZc0pchDpR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393658; c=relaxed/simple;
	bh=YqsnHd7mgXrbP3on9xTRcJHOT3e4K84a6q4VAP74nXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaqCZM58TtmpMtmk4vDRu7vj6SPwaRnh54nfCFpaybRIM0GAjKe3yDbo/ozUgzQ+P8JbiasykBoVEkLw5I8jaHCZadnUa2SBdqSDh0NOYT+tGryrNVKBZGQR2S9d+w8GTNxNGsHJ+h/8VXGzYe4/pbLg0hhvAEyZk3WjVuxrRLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U9h/rtG9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HFc8CIXy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U9h/rtG9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HFc8CIXy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U9h/rtG9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HFc8CIXy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U9h/rtG9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HFc8CIXy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9E34B21B8E;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=U9h/rtG9BDAgNu8vGfX90Xi8Y4CXk8ioPYKvnHyLdRTHZOm7w2iBeyWXWpIqUf8FyKJ3xY
	r8n2xlSgfBfIs71+dGck69d/tuCh7WzWM0BHHYKGURmOXfAO2v+unRwvcUWUyXeqEMNKlM
	2yshGXYTu8LO9/bBBEKk9DYU9xh3Llg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=HFc8CIXyzXE4PJRvzWnqkmRT5qb9IfFXfwqMFF9ODqKVUWQOz2oW5rRIB+ZW7RFBgD9pPe
	/xR9Lhi5pZt2vsCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=U9h/rtG9BDAgNu8vGfX90Xi8Y4CXk8ioPYKvnHyLdRTHZOm7w2iBeyWXWpIqUf8FyKJ3xY
	r8n2xlSgfBfIs71+dGck69d/tuCh7WzWM0BHHYKGURmOXfAO2v+unRwvcUWUyXeqEMNKlM
	2yshGXYTu8LO9/bBBEKk9DYU9xh3Llg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=HFc8CIXyzXE4PJRvzWnqkmRT5qb9IfFXfwqMFF9ODqKVUWQOz2oW5rRIB+ZW7RFBgD9pPe
	/xR9Lhi5pZt2vsCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09729139AF;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8rcALXZ/xmp1CgAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:20:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] ALSA: pcm: Fix TOCTOU state overwrite in snd_pcm_drop()
Date: Wed,  7 Oct 2026 19:20:38 +0200
Message-ID: <20261007172051.13240-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007172051.13240-1-tiwai@suse.de>
References: <20261007172051.13240-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

snd_pcm_drop() checks the current state at the beginning, and bails
out if it's in an invalid state (OPEN or DISCONNECTED).  However,
since the check is done before the PCM stream lock, this can lead to a
Time-of-Check to Time-of-Use (TOCTOU) race against the other forcible
state change like the device disconnection like below:

  CPU 0				CPU 1
  -----				-----
  snd_pcm_drop()
    runtime->state check
				snd_pcm_dev_disconnect()
				guard(pcm_stream_lock_irq)
				runtime->state = SNDRV_PCM_STATE_DISCONNECTED
    guard(pcm_stream_lock_irq)
    snd_pcm_stop(SNDRV_PCM_STATE_SETUP) <== inconsistent state

For avoiding the inconsistent state change, this patch moves the
runtime state check inside the stream lock guard.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6efaebc7f8b4..defbb2977efe 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2289,11 +2289,11 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
 		return -ENXIO;
 	runtime = substream->runtime;
 
+	guard(pcm_stream_lock_irq)(substream);
 	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
 	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 
-	guard(pcm_stream_lock_irq)(substream);
 	/* resume pause */
 	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
 		snd_pcm_pause(substream, false);
-- 
2.55.0

