Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71C646F4A3;
	Wed,  7 Oct 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366182; cv=none; b=urypez3Q//EhptS+hjJMFvgrtzFtKrmZGwU+Fe6CqANJd0dnKQL8vBDYmtwKpGSwEX6DraxiHMCBJPFWcpedHFv7bjIgefegGc4xfjz/e3QsOkOYQhdQeBLr2aUALPsA5AcAf+EYyZpDVo2MNvDd+eJ5mmzCzzMuRaA16tqYecY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366182; c=relaxed/simple;
	bh=UjyL6Es26vFAFB/S3/YnieZpMLLCpRpRI+vU8NyANxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9QjSUFPOXUwLU9EpikeaZjGrU8QZKm3bICfv83lHRcbm3Uh1AUMGZqsaw083Q6Dj/RffjUC7MTn465cI0CZWAJhE9NblIU4NBrfwMkcpCUGwsZfCTmXQjCrD552hD4f4Ys7Rb05xLf/fcW9IxNn/XHLxiosFg00Z1BsysO2/Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rZJL8X3l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KNFvUmPJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SskTI6TF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hEfWhGvh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rZJL8X3l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KNFvUmPJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SskTI6TF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hEfWhGvh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DD93821FD9;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=rZJL8X3lBma4vKS76Z2dNNp+Sql6UWQqVr2iM22ECHCbA7GOwoIxJbF2dAHedQwwkdM/Ow
	qlwQHwBOiUftO/TFHegHeG9cxsbxr4JSlTxvJ1w7czO6wzi8Qpp/BvJVz0G5O9farBpJ/d
	0RMqdrQUldjb18Y/6DYaB05vCgOcgeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=KNFvUmPJHKlOsNjlwZB3x/g9RthBEVYP4emv0CHpVcH3l7gXuFE6teKOn/THah2p6o4Zn7
	WoQ5hxjkV6CWzNDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=SskTI6TFXRdSpVThECHxnJsTDqOrXKJg6+lnqxSuU9KlT8dYN9uOveFTeCYC7ZjTQwbS1I
	u5Xox2cPSwB09mBR1YHObYx131VEClzwCRDQ8DJ58qniTCb0apzu8r0qAVfNxz/yfeB4wE
	v9zYMBhe2apPZ26a/W7C3vgnFPy0qQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=hEfWhGvhwclpl9pYfWn4M5k7rBTg+F4H1gZeahX/vPLLM53KnW/4OxvBVNNgI+nDXRUt0U
	/rxJ1NwHzbtSUqAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD18013B9A;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AS17ChUUxmp0FQAAD6G6ig:T7
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:42:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] ALSA: core: Fix leaks at snd_card_init() error paths
Date: Wed,  7 Oct 2026 11:42:30 +0200
Message-ID: <20261007094234.1051316-7-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007094234.1051316-1-tiwai@suse.de>
References: <20261007094234.1051316-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

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

