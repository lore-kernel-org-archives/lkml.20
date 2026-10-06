Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761B45C6F7;
	Tue,  6 Oct 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294063; cv=none; b=j9oJEz1l4b1U6iowLHxDaS0q/al+83jVW9M1emzYnKN+FlXHLq7tpruettmdMlWpR2047cEw0ujdWcFf0NpNuFvgIFbz0ZOEEGOKYadvkcxyXzaJ5AkvFRaMmobatTOmcJegZHyIjoyilbDTqm+if2MDStRDPsceMrE4RiSGwcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294063; c=relaxed/simple;
	bh=6xnMfE9qLhGmbG2BDtSyZKV1XqDObRjqesi0ki/MPE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOnd19RtetT9v4rj2GvWyjzWYvfeGu5JknZ7J2LWKyuI/6NOrFMWYibPbOF01E4cuWDrCb66XC01Zni5K6IvEqYoJWLdMOPEoKKwWv2kmx/6I4Xcc+DFfopanNOAE4oAf2x0GKKbGgWY8I3qQJb2yoQ0w479pgggm0ZJGTFzcIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rvDzaGi2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BYU42sTr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LaBdUQIc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ncttBmnS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rvDzaGi2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BYU42sTr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LaBdUQIc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ncttBmnS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EAB4C1F83A;
	Tue,  6 Oct 2026 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IX4uutRB5gx+XfVbulf3ZtFl16Cjyns+9zwd/JUWRg=;
	b=rvDzaGi2G4Q87bYaP6j2hyzDmixftx0s+19RPUjVAsWX5XTu+gFkK3lezdq/Sr7kcOcJM9
	CW77vJ2dyZLIO+Irr/53ef5O2NTTV17NN/gTPzy1OfUu2WegBtUpzUcHdKvMNQl9RbBBwQ
	rSgO5SUP7EfJUAF2KSJa6AZVaiUkf9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IX4uutRB5gx+XfVbulf3ZtFl16Cjyns+9zwd/JUWRg=;
	b=BYU42sTryaTQJqxjTbPKp9HU9x2lAHKaJO2Z9/jLAi8eZ+M1BvFBqGdyFyABZguBmuCM2a
	PO0xLmW+FeACw+BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LaBdUQIc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ncttBmnS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IX4uutRB5gx+XfVbulf3ZtFl16Cjyns+9zwd/JUWRg=;
	b=LaBdUQIcdJ6KgjPnUFd2v24ZAC1MkXEfp1ifTinjyjLU2J2WCqYTwEeR8evM0EPtNuEmIy
	WteUw1tsKn6+Ztrvbw78+PVlvpYRl0yG+7qU9iZ0WvUDjXu3locpavfEOJA2Aehst5JQMH
	ldCScyOvSSjuIvps+ce5x4aHmLmrakI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294047;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IX4uutRB5gx+XfVbulf3ZtFl16Cjyns+9zwd/JUWRg=;
	b=ncttBmnSBtbOh+6dQWPj5AZflSXY5dqhcGmoWG2rHEFGn+QgYEUQfesDF5ZDtPsdP0V8tN
	JII9EM8axTTrzLBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92A3B13A61;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1eVrAVf6xGq1cAAAD6G6ig:T7
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:40:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] ALSA: pcmtest: Fix a bogus pointer read in snd_pcmtst_pcm_pointer()
Date: Tue,  6 Oct 2026 15:40:30 +0200
Message-ID: <20261006134035.478529-7-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EAB4C1F83A
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

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

