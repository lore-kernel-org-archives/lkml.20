Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB64FDA75;
	Tue, 13 Oct 2026 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893143; cv=none; b=H9agcCF5BO7PIl/QqpiUBlzvUEHrBfcz8qa/+pfTcY0XU5PJuIswLcLmu+FA6lj/HzuMDRuHF7qBrQFOFjK/qGdD+Zjcuv62dDduALCASPa3fdEg/HqnNHNNh9Tukn2nem6ZnT4VvncptXe0+Va+2h+8/04QZa6q/JatFaISfnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893143; c=relaxed/simple;
	bh=rA3O7vEWHtvbOWrU57yUTKya5RIUR3g0INDBYIyfYeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAKvv+385rPqTLOx90syRwGMgaF6lytlaT5qQ5OluuwQW6w/ukoLBMAo7DKWj0YndLVVpcWPYNqgG3qNFkbkZNLpo//Q79aOQz4IuzHdhE86iXzPyrbd1+a6CaUli2r523AqblMAe9m0PoNpmb2yCMq0d4pwu/M08gRqix2xNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q8yKcMBE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ooaslPYg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q8yKcMBE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ooaslPYg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q8yKcMBE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ooaslPYg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q8yKcMBE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ooaslPYg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4735421F3B;
	Tue, 13 Oct 2026 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBs/0YVFFdMTaiMyJ4Vqs2iLya5VY5ZD/ej03fMW+w0=;
	b=q8yKcMBEgVDMtyTp29ZOmvGm0kFhqTXNSPDO2aDM9kgL3g/1wQL+F99gmhO/Mdv8RRX6s1
	LfzQSiCXWe9/DqjPXEn1HU+CHsrzMrLBmi97bRiahi4wtAuHP+7IAHmmcvnhu+/00mW+FZ
	CYr6nxubi5Q0Af3Fe4xQBvNnsA6WVSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBs/0YVFFdMTaiMyJ4Vqs2iLya5VY5ZD/ej03fMW+w0=;
	b=ooaslPYgAOkSmn+dpSG0xkezon/vUzm53w5oLknHrxE81hQ/18JYFCyU8lIdYF6ABgEFbO
	1RJcZhGL37W9RpAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q8yKcMBE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ooaslPYg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBs/0YVFFdMTaiMyJ4Vqs2iLya5VY5ZD/ej03fMW+w0=;
	b=q8yKcMBEgVDMtyTp29ZOmvGm0kFhqTXNSPDO2aDM9kgL3g/1wQL+F99gmhO/Mdv8RRX6s1
	LfzQSiCXWe9/DqjPXEn1HU+CHsrzMrLBmi97bRiahi4wtAuHP+7IAHmmcvnhu+/00mW+FZ
	CYr6nxubi5Q0Af3Fe4xQBvNnsA6WVSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBs/0YVFFdMTaiMyJ4Vqs2iLya5VY5ZD/ej03fMW+w0=;
	b=ooaslPYgAOkSmn+dpSG0xkezon/vUzm53w5oLknHrxE81hQ/18JYFCyU8lIdYF6ABgEFbO
	1RJcZhGL37W9RpAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBBAC134C7;
	Tue, 13 Oct 2026 12:05:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6Ox+GJAezmrxFQAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 12:05:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ALSA: pcm: Protect delay DMA sync in forward and rewind, too
Date: Tue, 13 Oct 2026 14:05:24 +0200
Message-ID: <20261013120528.52586-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013120528.52586-1-tiwai@suse.de>
References: <20261013120528.52586-1-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 4735421F3B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Like the previous fix for snd_pcm_delay() (in the commit 50f413b83b31
"ALSA: pcm: Protect delay DMA sync against concurrent HW_FREE"), the
snd_pcm_dma_buffer_sync() call in snd_pcm_forward() and
snd_pcm_rewind() needs the similar protection against the concurrent
hw_free action for avoiding potential UAFs.

Fixes: a25684a95646 ("ALSA: memalloc: Support for non-contiguous page allocation")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index f774358629bb..c1bad92a4e9f 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3078,11 +3078,15 @@ static snd_pcm_sframes_t rewind_appl_ptr(struct snd_pcm_substream *substream,
 static snd_pcm_sframes_t snd_pcm_rewind(struct snd_pcm_substream *substream,
 					snd_pcm_uframes_t frames)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_sframes_t ret;
 
 	if (frames == 0)
 		return 0;
 
+	/* Keep the DMA buffer alive through the sync below. */
+	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+		return -EBUSY;
 	scoped_guard(pcm_stream_lock_irq, substream) {
 		ret = do_pcm_hwsync(substream);
 		if (!ret)
@@ -3091,17 +3095,22 @@ static snd_pcm_sframes_t snd_pcm_rewind(struct snd_pcm_substream *substream,
 	}
 	if (ret >= 0)
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
+	atomic_dec(&runtime->buffer_accessing);
 	return ret;
 }
 
 static snd_pcm_sframes_t snd_pcm_forward(struct snd_pcm_substream *substream,
 					 snd_pcm_uframes_t frames)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_sframes_t ret;
 
 	if (frames == 0)
 		return 0;
 
+	/* Keep the DMA buffer alive through the sync below. */
+	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+		return -EBUSY;
 	scoped_guard(pcm_stream_lock_irq, substream) {
 		ret = do_pcm_hwsync(substream);
 		if (!ret)
@@ -3110,6 +3119,7 @@ static snd_pcm_sframes_t snd_pcm_forward(struct snd_pcm_substream *substream,
 	}
 	if (ret >= 0)
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
+	atomic_dec(&runtime->buffer_accessing);
 	return ret;
 }
 
-- 
2.55.0

