Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A53DD85F;
	Wed,  7 Oct 2026 17:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393960; cv=none; b=l8BmSeQItssCESRBjXS7YgCooryt9vbfag0oHzMRtbMA+7QYfPD42lS3QG9R1JxUttmw7MjiueT4Ytvzhnlvcp87ApMbDD6k+gb3jMFTsIaXKstHE8uMfVWhUDUXzwhciySWoRG6qUn09CoaqdnjKBy68c2CDMeXa7EZbNYvCxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393960; c=relaxed/simple;
	bh=o7J6SnrK01yk0HAGVb9tuBIphY4zxCQH9eEQdxi2dLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOn/9XvtBL6Ueqj32xwC4Z+r2Z/ANSV9+pTQhzIZ3U8tVHhFB2rafeZ2Jfh/a2NFvm3f8ZHuYCKc66668x+SjeZZwoxwF0oyOlGgmIRUx9SB+nclLiA+Bdx74t2RRmZE7YrZYCTPV7tPR/UopswH2REbH/vGYl5nX2xs0LQ/zKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gYkOBNdU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S4McHYeW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gYkOBNdU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S4McHYeW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gYkOBNdU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S4McHYeW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gYkOBNdU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S4McHYeW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79A4B1F44E;
	Wed,  7 Oct 2026 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5D6y8eS3NIKrpHnEUphVei105g40leR6yus68QbR/sU=;
	b=gYkOBNdUIvs4BhA1DPbBKQk5pofVb0/QZQZkRasM0F3Ljrio10K+lBeiWNEjsINZKl4aEd
	gPIv/G7GDRhqVpXMBXODMruFdSDpjn7c7ROfDoMoFPuM+D58iUs3a5XcjxHeIsVJHu2V1R
	Rp8ixQUso63SYo74rR9lkOuppyKtQr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5D6y8eS3NIKrpHnEUphVei105g40leR6yus68QbR/sU=;
	b=S4McHYeWYQyKlHjsji/2wFsj2Teu7bDuhCFsoV73JVtV9Q9alv5cMN6MWVAfYGOfWID053
	kiD7eYl8TwXbgpAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gYkOBNdU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=S4McHYeW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5D6y8eS3NIKrpHnEUphVei105g40leR6yus68QbR/sU=;
	b=gYkOBNdUIvs4BhA1DPbBKQk5pofVb0/QZQZkRasM0F3Ljrio10K+lBeiWNEjsINZKl4aEd
	gPIv/G7GDRhqVpXMBXODMruFdSDpjn7c7ROfDoMoFPuM+D58iUs3a5XcjxHeIsVJHu2V1R
	Rp8ixQUso63SYo74rR9lkOuppyKtQr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5D6y8eS3NIKrpHnEUphVei105g40leR6yus68QbR/sU=;
	b=S4McHYeWYQyKlHjsji/2wFsj2Teu7bDuhCFsoV73JVtV9Q9alv5cMN6MWVAfYGOfWID053
	kiD7eYl8TwXbgpAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3CF7139B6;
	Wed,  7 Oct 2026 17:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p6IPF6SAxmqXDwAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] ALSA: aloop: Avoid a bad mixure of guard() and goto
Date: Wed,  7 Oct 2026 19:25:23 +0200
Message-ID: <20261007172533.14667-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007172533.14667-1-tiwai@suse.de>
References: <20261007172533.14667-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 79A4B1F44E

The rewrite of aloop driver code using guard() leaded to a mixture of
guard() and some goto; although it currently works, it isn't really a
good match.

For avoiding the bad match, just move the code using goto into a
function and wrap it with guard().

Fixes: ebd9b6c91d4e ("ALSA: aloop: Use guard() for mutex locks")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 5f0e2dc96769..0aaa64b189da 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1375,7 +1375,7 @@ static const struct loopback_ops loopback_snd_timer_ops = {
 	.dpcm_info = loopback_snd_timer_dpcm_info,
 };
 
-static int loopback_open(struct snd_pcm_substream *substream)
+static int __loopback_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct loopback *loopback = substream->private_data;
@@ -1384,7 +1384,6 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	int err = 0;
 	int dev = get_cable_index(substream);
 
-	guard(mutex)(&loopback->cable_lock);
 	dpcm = kzalloc_obj(*dpcm);
 	if (!dpcm)
 		return -ENOMEM;
@@ -1479,6 +1478,14 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	return err;
 }
 
+static int loopback_open(struct snd_pcm_substream *substream)
+{
+	struct loopback *loopback = substream->private_data;
+
+	guard(mutex)(&loopback->cable_lock);
+	return __loopback_open(substream);
+}
+
 static int loopback_close(struct snd_pcm_substream *substream)
 {
 	struct loopback *loopback = substream->private_data;
-- 
2.55.0

