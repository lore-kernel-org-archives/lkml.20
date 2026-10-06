Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D26145C6F7;
	Tue,  6 Oct 2026 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294051; cv=none; b=b4RsZY15vi/uqrR+Dilpmlu0kanyeqaD0SpljTvMoiGrrIZlAVTasFHwtIBu1o4s5NtRHZ//afXN4lijypJNc2Swau3UPoCHeWCuAUBK94Dofs/lmkCZCJboRuD4HZ4Q/jatOL89Hkrn3gQwJTyGi5LBF1F7/Yh2XuOJSFg1VkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294051; c=relaxed/simple;
	bh=YqsnHd7mgXrbP3on9xTRcJHOT3e4K84a6q4VAP74nXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0soFJj1GS/sbfWQ923dfnK9j+PDzgqOvKMW38BzebuMZkYZSQ/TJnCivWI5kZ13v7wTlYkApdP6KKXQep6c2BF7WIWbZP7T6XCwT5uGRktbtkmvNh9NXObZ9Lb9hax/mZ89mPkLKRkiLUFMFNdkEX+XpiTgs20jPtj0j1ZFxGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vGN5ca8M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nvCWnwi1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VDJm6Axd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jxgaw9kA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vGN5ca8M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nvCWnwi1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VDJm6Axd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jxgaw9kA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E39922003;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=vGN5ca8MSrFRQoEC6JA2H6zsCg9Qm2wFcCED5NTiZcfMYJ9G+tnb9OpTeGlrbNJa+vRbqJ
	B+JNoPPJOu2nIYMau4QJ1hTf/1zG3vkIfqgJnz1AxiIGGEeSO4Dd0dPtLtroj3PYvWHFVZ
	LpcXixg2Cp8AuSPob9mfQr+7U62dRkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=nvCWnwi1ieGm+4/vMWi13QjufsUFnEF8ftUplWQrFP4t1HCueqOq88kmSrCgNsQpsP1wY0
	VKIzhfBITGSmUeBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VDJm6Axd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jxgaw9kA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=VDJm6AxdH+U0sigd4eNmQuABtnwLmKUQux2JYqp0/mXSdx0RWAy2z3GE6Xkr6OitRexY+v
	/IG9jH+pvGaYB5Nh6tjL9hVNRDPRiO5b9i6QR/mP+ZbV72zwGTg4m+BDOFBXL+xco/Q9ox
	xtgugut7P+LtUmt6KwyNi2P2K28S8xc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1DSXp1I8N0A+7fDn9otSB2AsAUUUDwp/+SW1Cnn1S4=;
	b=jxgaw9kAoZ061BVDfIvzKZb8gxZ2vbhHfCbS7lmM4FhdBi9h6QEO9LUuedbpPCc5Beiqnq
	OqEc2xOH2m9YGPBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CD5413A5D;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1eVrAVf6xGq1cAAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:40:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] ALSA: pcm: Fix TOCTOU state overwrite in snd_pcm_drop()
Date: Tue,  6 Oct 2026 15:40:26 +0200
Message-ID: <20261006134035.478529-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006134035.478529-1-tiwai@suse.de>
References: <20261006134035.478529-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7E39922003
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

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

