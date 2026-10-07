Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210874D37DB;
	Wed,  7 Oct 2026 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393963; cv=none; b=I2o52DDTxX0Ra4XmIld4hzlkvjYs+xjYPmHUbSyxYzn/O0GXTz/Lc4q4kbIdb0cFmUV1NUT4CdGh+57kO80BmhFd9Ekkhb8xa9MDnINfm8y8yQGtnp0plYkC7BMR+Jtb89VoTjYPxOouoyheURgI9XRqCmBUe6LSkp5ba+YlKzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393963; c=relaxed/simple;
	bh=E7hx7HXe6WTGMnBDyFTf21+9zvrhgEo7vcD9UjWY44I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpExUg338iEGjvTm9zC2mULBb+t2kquSKl9Hhu0dp7LFvfXKFnsIv5EkZ5Xzil8S6RJNNTWqK1xZkGFI1b8f3GXYq9B6j+FSzr7SBbjHa1THyB49wWi7nqGdtmJTT3RhiJgYsKIbt08y5k/jlWeiQiS4vL9DO9w5wm1RMvtTryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pu5OHxCf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VmTISBEh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pu5OHxCf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VmTISBEh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pu5OHxCf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VmTISBEh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pu5OHxCf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VmTISBEh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B46C21BBF;
	Wed,  7 Oct 2026 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15xrk/GAho7y6wxPq7i8ZfeSYPT8bk0M5REYDCILGzM=;
	b=pu5OHxCfoDw/xtUvXqtUTfYbS+Bzf2BxNHzGMHRLsRmhNRtOg8cOmOvoDBLAHppaTyA9ul
	+3MsD0/WM8/GmbYGlYFAuZmA3zUqFOtjPNq2tr/uyqWG5iDVAPVoytQhfkgJDmJrsH8il/
	fC4cKCgbp4mvxkdiKQhSNTWdhuOLuQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15xrk/GAho7y6wxPq7i8ZfeSYPT8bk0M5REYDCILGzM=;
	b=VmTISBEh71VQfIwidDkefaU/o3tQiPfLBjOnYIuV03X2fAy56Du5Aj9mgIhFAGKgntFqKL
	1GYTuaj1zutGkSDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pu5OHxCf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VmTISBEh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15xrk/GAho7y6wxPq7i8ZfeSYPT8bk0M5REYDCILGzM=;
	b=pu5OHxCfoDw/xtUvXqtUTfYbS+Bzf2BxNHzGMHRLsRmhNRtOg8cOmOvoDBLAHppaTyA9ul
	+3MsD0/WM8/GmbYGlYFAuZmA3zUqFOtjPNq2tr/uyqWG5iDVAPVoytQhfkgJDmJrsH8il/
	fC4cKCgbp4mvxkdiKQhSNTWdhuOLuQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15xrk/GAho7y6wxPq7i8ZfeSYPT8bk0M5REYDCILGzM=;
	b=VmTISBEh71VQfIwidDkefaU/o3tQiPfLBjOnYIuV03X2fAy56Du5Aj9mgIhFAGKgntFqKL
	1GYTuaj1zutGkSDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C42B7139B3;
	Wed,  7 Oct 2026 17:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p6IPF6SAxmqXDwAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] ALSA: info: Fix memory leak at card removal
Date: Wed,  7 Oct 2026 19:25:22 +0200
Message-ID: <20261007172533.14667-5-tiwai@suse.de>
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
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4B46C21BBF
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

The fix for potential deadlock at disconnection by the commit
c7a606519533 ("ALSA: info: Fix potential deadlock at disconnection")
clears card->proc_root pointer at snd_info_card_disconnect(), in order
just to be sure.  But this leads to a memory leak of card->proc_root
content that should have been released at a later call of
snd_info_card_free().

For addressing the memory leak, simply drop the card->proc_root
clearance at snd_info_card_disconnect().

Since card->proc_root might be still looked at in
snd_info_card_id_change() that may be running concurrently during the
connection procedure, add a sanity check there, too.

Fixes: c7a606519533 ("ALSA: info: Fix potential deadlock at disconnection")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261006174002.703431-1-tiwai%40suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index 3b8ccda04e1a..c4d57d0809ad 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -528,6 +528,8 @@ int snd_info_card_register(struct snd_card *card)
 void snd_info_card_id_change(struct snd_card *card)
 {
 	guard(mutex)(&info_mutex);
+	if (card->shutdown)
+		return;
 	if (card->proc_root_link) {
 		proc_remove(card->proc_root_link);
 		card->proc_root_link = NULL;
@@ -555,7 +557,6 @@ void snd_info_card_disconnect(struct snd_card *card)
 	if (card->proc_root)
 		snd_info_clear_entries(card->proc_root);
 	card->proc_root_link = NULL;
-	card->proc_root = NULL;
 }
 
 /*
-- 
2.55.0

