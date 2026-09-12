Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4A30C60F;
	Sat, 12 Sep 2026 16:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230125; cv=none; b=u/7+Wck3ppxoeUNccnUDI8QRBUJPGpCIvPw33GU8kncD0IJq42z4qfR5ddyxNPQpUtUHDMvDTo5oZeI4ZwQijKdBllnP98q8Qi4FcYDCdY5jwHIkYo5yWcYxj/2audIvnevJ5NSpZwRc1Fp+eW0vFLmgS9WknRIKZlR/rkP2DfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230125; c=relaxed/simple;
	bh=f6+o89HyzmLe9gJjJZb1XwIVr0S4Q6r8URPRALhG7zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4PGk/FzdmO6SJ1by9QhNrfKdix0OKTPCLPtq/tLh2OC2hOFvmotB/ujyB8aN2TmtmGFOCfK+xAD91mWLsN8w2PZw5UViRe9/8tDHE1dpiyZDukx94i3naA0/tVxgIHnw0zcAaXuHpaOtelbdt56KjkfYhI4Gq4wtLWJtLUlasg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zMjaVni2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7cQTiLvX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZuiG6Buo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E6Agm5Va; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zMjaVni2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7cQTiLvX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZuiG6Buo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6Agm5Va"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 82F6921D61;
	Sat, 12 Sep 2026 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789230117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HjHJHUnN7vJPg5jVVMMJc+SL75lrCaxQ+bXY7GaUNvI=;
	b=zMjaVni23Qs2tvM15CTsjAJQ4fUbpcCFcAMyODB8yNsMu+D0vO5uyZMBFXBJYsTrIMenDM
	hFdrVny2IwVpDSYxKXNTHBWIqjolJB0RAtFn7U8r0xhclQzHYDzkhvAiClwDkq3pudSYv9
	ircm+/yc9gpZnZNMtaCRPTRn7P256Nk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789230117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HjHJHUnN7vJPg5jVVMMJc+SL75lrCaxQ+bXY7GaUNvI=;
	b=7cQTiLvXhtCRT4lqsHgZtE/yJAF6HIxYIeSQEsUHoVMWCkEKVOe+drO3SSzC/Q3McXYD33
	tObu3WlCAxOQB/Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZuiG6Buo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=E6Agm5Va
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789230113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HjHJHUnN7vJPg5jVVMMJc+SL75lrCaxQ+bXY7GaUNvI=;
	b=ZuiG6BuotMAKaaj5Pwwu7rcmkp6SBcmTuMDkCGYwl/3CixKiv7K2MBomFQoo8Us2yK53/T
	iTGG6C18pV5cp0UCveIvgetvRikOx2j2sFgeXvBoeG6/oU0H0gS+QHGeB5XImtCVMMFoWw
	4KPExoTqMgKe5aIAF4bHulNLVQ1iMlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789230113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HjHJHUnN7vJPg5jVVMMJc+SL75lrCaxQ+bXY7GaUNvI=;
	b=E6Agm5Va/F78No7N3gde7B6wA0WqlUNMuRs/JYsvcDvoqRP147oP/2iJyqA4YZW7+BnMd+
	bUgk01aGdVsaBqDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C4AF13687;
	Sat, 12 Sep 2026 16:21:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 96k6DSF8pWpHZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Sep 2026 16:21:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Farhad Alemi <farhad.alemi@berkeley.edu>
Subject: [PATCH v2] ALSA: core: Fix potential UAF after asynchronous card release
Date: Sat, 12 Sep 2026 18:21:42 +0200
Message-ID: <20260912162150.455144-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 82F6921D61
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

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
v1->v2: move put_device() before complete() that may free card object for
	devres-managed case

 sound/core/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 2f7f83a7611b..d05bea3c87f5 100644
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
@@ -603,6 +603,7 @@ static int snd_card_do_free(struct snd_card *card)
 		dev_warn(card->dev, "unable to free card info\n");
 		/* Not fatal error */
 	}
+	put_device(card->dev);
 	if (card->release_completion)
 		complete(card->release_completion);
 	if (!managed)
-- 
2.55.0

