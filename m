Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F334A0152;
	Tue,  6 Oct 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308416; cv=none; b=qWKt0CTT8qBhcf8SvH88dILR1awVaRO2ycG7BBqTnZFO/yhSI43p7cuJySS1b4JOwAIUgclFfFQnpY+QQie7go7tJAfByxybjdLScLYeg9LrVcXkY7sUuu/SeP2rxCZSGVIi/vglfVn0Y6gTkNZ7cwwBRrqjIC6WPYlnz2h44Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308416; c=relaxed/simple;
	bh=UjyL6Es26vFAFB/S3/YnieZpMLLCpRpRI+vU8NyANxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s55nEPKDz35QGoCZ7UsgbOu7NswBu+SUNgFXZPB0fxVTI81gYz+DmRoSRy9mcqJYvfW97NVsVDzrNoapmUDL7lw1DuTdyCbCzGxUV+hDtSgPypiq3sjGlM70Ex5PEsEdE0glcgTSvEcMnLIQxjcYCI/iGwR+6e06NipPykdQZCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1cE7EeXK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YLzd5yiQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VrMAmsGX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8xU6lXwu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1cE7EeXK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YLzd5yiQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VrMAmsGX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8xU6lXwu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BCB6D1F797;
	Tue,  6 Oct 2026 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=1cE7EeXKcO0DfisoczbBRsNbVIqnLR1ywBCVIqfDZfd8wbV4npiH2vf45AlhRuFF7cBaD8
	hfNJ5B30qKTX8hNLYwmrgQ9ZCd8nudzDCRZYD+oJx+kM8jOHMN0wdvnk3FqT8LQq/njfxx
	xqjj5NTrWgOyYbR2RQmBWFx1+KYN09E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=YLzd5yiQkf/Obh/nQbK7W8pIlwvCZHR3JI7bioOFSmP6WLRBkpIr1dwzF5dXqgCZUJIKOj
	A438zsnU4rOMVGAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VrMAmsGX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8xU6lXwu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=VrMAmsGXGXmf1hHe0Mv3vtIBshKKg5R0QPRb9HLGZG9wxPk8Kfwyh4DPQoyV5ENpY4Qi7z
	JPI0JA9in/DdjVPHRWwBYGWHBlHVxBfUK9n3CjusoviYl9oK73uUmXtHuIquM4uvoNpLq2
	viNvsfrskZ6m0JQR0ZEOmqNJaM+0em8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=8xU6lXwux8yvD4LwgWWumsbIOpKPv65Pr7AWDhP9l66w0q0qx8kK0a3E8P1H3j4aSb3g88
	xpwRCmuO5ENQyNBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0157D13B85;
	Tue,  6 Oct 2026 17:40:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qpimInMyxWr1eAAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 17:40:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] ALSA: core: Fix leaks at snd_card_init() error paths
Date: Tue,  6 Oct 2026 19:39:56 +0200
Message-ID: <20261006174002.703431-5-tiwai@suse.de>
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
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: BCB6D1F797
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

When the snd_card object is initialized internally in snd_card_init(),
the error path of card->value_buf allocation returns straightly as an
error without invoking the destructor, which would leak resources.

Also, the other error paths in snd_card_init() release the card object
only via put_device(), and this misses the cleanups that are done in
snd_card_disconnect(); namely, the reserved slot bit in snd_cards_lock
is never cleared, so the card index remains occupied, and the debugfs
directory created for the card is left over.

Fix them by calling snd_card_free() at the error path, which performs
both the disconnection and the release properly.  As snd_card_free()
calls snd_device_free_all() internally, the explicit call is dropped,
and the error labels are unified.

Fixes: 84446536f63d ("ALSA: control: Verify put() result when in debug mode")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index dbe2acfa59fe..9deb5e920d0d 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -334,7 +334,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	err = snd_info_card_create(card);
 	if (err < 0) {
 		dev_err(parent, "unable to create card info\n");
-		goto __error_ctl;
+		goto __error;
 	}
 
 #ifdef CONFIG_SND_DEBUG
@@ -343,16 +343,16 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 #endif
 #ifdef CONFIG_SND_CTL_DEBUG
 	card->value_buf = kmalloc_obj(*card->value_buf);
-	if (!card->value_buf)
-		return -ENOMEM;
+	if (!card->value_buf) {
+		err = -ENOMEM;
+		goto __error;
+	}
 #endif
 	return 0;
 
-      __error_ctl:
-	snd_device_free_all(card);
       __error:
-	put_device(&card->card_dev);
-  	return err;
+	snd_card_free(card);
+	return err;
 }
 
 /**
-- 
2.55.0

