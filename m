Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1753932CD;
	Wed,  7 Oct 2026 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365824; cv=none; b=lAtQECS/evrLsKPqudgNMvmMMkCYvWuPZKOMAxUTWojrKljfneBx5kJyQ1tC2tYua3XGeEl8V0Rw7dVcgh+4lFZ21g5mhFD9zhrEgHGqnvGEuXPGVB1w0ePOGlbHg6TBr7ub+KNWPkFgTcpfQhW/D9GQEW974sjvHnKrtcFFeVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365824; c=relaxed/simple;
	bh=6xnMfE9qLhGmbG2BDtSyZKV1XqDObRjqesi0ki/MPE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJ9Hvre1B3eLnMviF+k0TtI/LilEwPMndSJlkJP8ZbhcV08sMBNDV85+rc1nDhDEs2Hg50EsvHjqQ8e1t32JGCCsaBV4FN0ewdZWlxSVqjfb1v5untBL5EWUJWtF8sPinLjmoU9qDSKlAvh/bYm2q4Q4/fG4754/kWyD+IeWrNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q9KQKhYp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ag/MakFV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q9KQKhYp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ag/MakFV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q9KQKhYp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ag/MakFV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q9KQKhYp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ag/MakFV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E97841F788;
	Wed,  7 Oct 2026 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IX4uutRB5gx+XfVbulf3ZtFl16Cjyns+9zwd/JUWRg=;
	b=q9KQKhYpUvdAN5tTD7USX2Nwsg4u2XA7hyh52AqpqPf/zSuyjdcRjDTwh9qvw27F2kzJ2Q
	p4uInpUlsdvV3NgUYS41WFGI9J/KDoP2HvqGK+08F8ewyeIdY1EFQjkvVeKJThA4ceyN6z
	0J/iNaelRjB4iJA8qj4lzIvD/m3bpdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365804;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IX4uutRB5gx+XfVbulf3ZtFl16Cjyns+9zwd/JUWRg=;
	b=Ag/MakFVkIoSBF46Ym2kCJjlFHJbkwh5aDCE/DuOV39XBVuGYHd1xEO3QuNbJb0iAlVuhK
	cq/fihcBHELRssBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IX4uutRB5gx+XfVbulf3ZtFl16Cjyns+9zwd/JUWRg=;
	b=q9KQKhYpUvdAN5tTD7USX2Nwsg4u2XA7hyh52AqpqPf/zSuyjdcRjDTwh9qvw27F2kzJ2Q
	p4uInpUlsdvV3NgUYS41WFGI9J/KDoP2HvqGK+08F8ewyeIdY1EFQjkvVeKJThA4ceyN6z
	0J/iNaelRjB4iJA8qj4lzIvD/m3bpdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365804;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IX4uutRB5gx+XfVbulf3ZtFl16Cjyns+9zwd/JUWRg=;
	b=Ag/MakFVkIoSBF46Ym2kCJjlFHJbkwh5aDCE/DuOV39XBVuGYHd1xEO3QuNbJb0iAlVuhK
	cq/fihcBHELRssBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 521A913B9A;
	Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9oTPLKgSxmpMDgAAD6G6ig:T7
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:36:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] ALSA: pcmtest: Fix a bogus pointer read in snd_pcmtst_pcm_pointer()
Date: Wed,  7 Oct 2026 11:36:33 +0200
Message-ID: <20261007093638.1049688-7-tiwai@suse.de>
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

Sashiko reported a potential bogus value for a pcmtest driver when a
concurrent call to PCM pointer is invoked while the pcmtest's timer
callback is running: since the position is updated in the timer
callback without locking, the following wrapping in inc_buf_pos()
might be screwed up:
	if (v_iter->buf_pos >= bytes)
		v_iter->buf_pos %= bytes;
Although it was reported as an OOB, the actual return is corrected
inside buffer_size, so no corruption is expected in this scenario, but
an error message could show a bogus value.

Also, the whole state is read and modified locklessly in the timer
callback, which can be racy against the pause operation, too.

For avoiding those races, simply put the PCM stream lock in the timer
callback (while the snd_pcm_period_elapsed() must be changed to its
*_under_stream_lock() variant for avoiding the deadlock).

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcmtest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 186e982d42e1..fea9580593e6 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -345,6 +345,7 @@ static void timer_timeout(struct timer_list *data)
 	v_iter = timer_container_of(v_iter, data, timer_instance);
 	substream = v_iter->substream;
 
+	guard(pcm_stream_lock_irqsave)(substream);
 	if (v_iter->suspend)
 		return;
 
@@ -358,7 +359,7 @@ static void timer_timeout(struct timer_list *data)
 	v_iter->period_pos += v_iter->b_rw;
 	if (v_iter->period_pos >= v_iter->period_bytes) {
 		v_iter->period_pos %= v_iter->period_bytes;
-		snd_pcm_period_elapsed(substream);
+		snd_pcm_period_elapsed_under_stream_lock(substream);
 	}
 
 	if (!v_iter->suspend)
-- 
2.55.0

