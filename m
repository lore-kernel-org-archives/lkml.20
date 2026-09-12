Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93647277D;
	Sat, 12 Sep 2026 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217542; cv=none; b=FzLdfjZOC4tsyQR7ul8MV/BKChD1rbKGaEjRiZ3Fp4U4U7pTZyDt64VTDI3xGeSlf47vVRPM4nPei4YgfirSXME/0MlbLrvRxwML6aZJADHL1LvYoHTV7sYr7lEOT9AqREzRXl34zuI0XSqO+I9T2bjNrEbflqv2ieas2OoX9Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217542; c=relaxed/simple;
	bh=lQacYLv3te9B/89A0+GB49kCkBCkbkX+/qHcRDvnmsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjJkoyHmimmULK8Ipojv1VEvZTB+l5HcqHtaGRlhLgPkz7kvDqwngrA2vysqY1ef/IpjEhpnpJshKIODuf3V21D8y9bHMefQEiBVrTQD3kXhT4JVQWVW2zl6cu3tUPLbv0B8GPpWx1DNHsvUs9PL8LMthCzgB89N/C5oXPRUqps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GiDU82CP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2CjfxTM7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tNKwQNQX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cvu8IijU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GiDU82CP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2CjfxTM7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tNKwQNQX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cvu8IijU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5A38E1F38E;
	Sat, 12 Sep 2026 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789217534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z0rsfkpi+MtVIAwLx93HCl/8glkcoIECYAhMbIs3M+4=;
	b=GiDU82CPtzfBrk8hyNiQvz/ORff6XiFAoclXW+lnf8k8ohXQJqHnZT7XO9wgrrmwPByLdV
	tyFTlurDcC/JFPSl2tHrUbhAc1FcNeNc/z5FZ8o1+exySJwZ/5B7yDFEGYiEmOo8XC/j0i
	7PLVcsaMbit+O2Mbc+Y+txwYrbU57mQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789217534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z0rsfkpi+MtVIAwLx93HCl/8glkcoIECYAhMbIs3M+4=;
	b=2CjfxTM7Npx1/8RhO5RApIjAf/yk1sVQ2lQVOe0LcNmILbszvhx4KFQhDB9OhADhj2TW9w
	yq22xQzgGQfJtXDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tNKwQNQX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cvu8IijU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789217530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z0rsfkpi+MtVIAwLx93HCl/8glkcoIECYAhMbIs3M+4=;
	b=tNKwQNQXapiwwn/nFej/7U31DqxFEeVrZWav0MiRMgTol73hQzQgXD5SOsX/eCuhXpxFWK
	qj/jstcXXeT6kHfprs53LT7Dh+uUeOTrCz6/EWgKUnCJH279ZgrIpIBaAtelR2K5SwKl6U
	LqEXLOLMW84OtkKR8YBo0njKUe/8Uwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789217530;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z0rsfkpi+MtVIAwLx93HCl/8glkcoIECYAhMbIs3M+4=;
	b=cvu8IijUmgFFpXOoA9PkOH8xd8awnRbKz8tJj39vGoml+HKnvx0IzkJL12LwfKp5AZckrc
	AOmwHJ3LY+KEt9Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1928213687;
	Sat, 12 Sep 2026 12:52:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 06zlBPpKpWrSHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Sep 2026 12:52:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Farhad Alemi <farhad.alemi@berkeley.edu>
Subject: [PATCH] ALSA: core: Fix potential UAF after asynchronous card release
Date: Sat, 12 Sep 2026 14:52:03 +0200
Message-ID: <20260912125205.417429-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5A38E1F38E
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,berkeley.edu:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.01

Usually a sound driver releases the resources assigned to the card via
snd_card_free(), and it synchronizes with the whole release procedure.
However, when the card is released asynchronously via
snd_card_free_when_closed() like USB-audio driver, the situation is
slightly different; although the snd_card_disconnect() call at the
disconnection guarantees that any newer accesses will be gated, the
in-flight tasks might be still accessing to the underlying card->dev
device even after the disconnection, which would cause a
use-after-free in the end, as reported by fuzzers.

For addressing the bug above, this patch takes the refcount of
card->dev at initialization of the card object, and releases at its
destructor.   This assures the availability of the card->dev in its
whole lifecycle.

Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
Closes: https://lore.kernel.org/CA+0ovChexj4TrZL_2iG_P0WBEbZc5+73GfB3DkciQi=R8pZOnA@mail.gmail.com
Closes: https://lore.kernel.org/CA+0ovCgQUQNN=Z1tJTouiCsDaXR5M-3-SQEGk-cpPXQkM5Xh+w@mail.gmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 2f7f83a7611b..bffa94b7b956 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -310,7 +310,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 			kfree(card); /* manually free here, as no destructor called */
 		return err;
 	}
-	card->dev = parent;
+	card->dev = get_device(parent);
 	card->number = idx;
 	WARN_ON(IS_MODULE(CONFIG_SND) && !module);
 	card->module = module;
@@ -605,6 +605,7 @@ static int snd_card_do_free(struct snd_card *card)
 	}
 	if (card->release_completion)
 		complete(card->release_completion);
+	put_device(card->dev);
 	if (!managed)
 		kfree(card);
 	return 0;
-- 
2.55.0

