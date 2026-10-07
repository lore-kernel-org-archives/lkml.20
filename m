Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833DC47FB1A;
	Wed,  7 Oct 2026 09:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365829; cv=none; b=AiDtC4JOGmBrWWqiSdoXDz9nasp5ud5gjEgLx5N4jeWPSqESMNiMo8y1YbSejTzFErAuJ8ctFofdzMFmNzug0EFIV6d7qEqjhrmmYyouvgVlhosfV77o/pmCPO/yNsBdvTbQ/JT43GDZ2Ll6jXXQaZSEdhU20ERzfa0ds9Ss0z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365829; c=relaxed/simple;
	bh=YqsnHd7mgXrbP3on9xTRcJHOT3e4K84a6q4VAP74nXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1MJBmAcXHQVXnrOX3qwBGnyCeLmFij2nJgdKVZcspeJ4wlkRc4D4HtVC8auminsCQ2FOkqwp1UyYWPF196G5XnhXXMpWkFYn32lISgV17Hfo4XK2EBnJKERTgkND7n+0YaPl7Bdfbc5tky9rDr1jC8sjjt3FVofNu7UcutM3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HJxPsB85; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TliJTHkx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VDBliQQw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3/QZyfjy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HJxPsB85";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TliJTHkx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VDBliQQw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3/QZyfjy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7997821F56;
	Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=HJxPsB85HonXZcBTfCGZNRF8poi+4bWrHEwvbvL8hKOVJjSY6aMMcBHNC5TPNtlqPWy9b5
	pIccsFOuuTHxMs/LMHQubEuqRTdznH4v501ryI/fbbANjUNcQ27xnqYW7E4Fk8/5R8q4DU
	dJz6ueOXatGBsyu0gz8I7PCzAJlVUZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365806;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=TliJTHkxFR2tuyGn/zm47Pg5SfqbtV1lrbOm/uesBuUrmcJdz2Hpki/sl3UfFDJa71lb4d
	3nwS0KOo8iiR2XDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VDBliQQw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="3/QZyfjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=VDBliQQwB5FKeeBBuu43SzNm329R8vrrHBQF7OT4wR25AYsfzVq1vtwwPYrCWn5WltcuxG
	pSYcpiGVqxihpX+SZZ9iImxwuK3INVWlKolB+x8+owLXS5FfW6qOur/nQUXNXBHz5Ytm34
	yEAMjP8nzZfLio7sbujUDP6354jNfq4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=3/QZyfjyepFTTPSOXT6XNhgYgsPF/8TMtEdD/LtRsd6gwfqvS6a9dqXR34rhGv9P9t9qQe
	tfiCs7NBXOzn0ADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0644C13B97;
	Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9oTPLKgSxmpMDgAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:36:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] ALSA: pcm: Fix TOCTOU state overwrite in snd_pcm_drop()
Date: Wed,  7 Oct 2026 11:36:29 +0200
Message-ID: <20261007093638.1049688-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007093638.1049688-1-tiwai@suse.de>
References: <20261007093638.1049688-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7997821F56
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RBL_NIXSPAM_FAIL(0.00)[2a07:de40:b281:104:10:150:64:97:server fail];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 

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

