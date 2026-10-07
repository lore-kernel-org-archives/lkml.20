Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209E03DB311;
	Wed,  7 Oct 2026 17:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393960; cv=none; b=jeNwOtI9iU4dbGBtbPHHuV7vCOXifSe35JsUGpwRzW5LG+Yrs3WHbBw/gJKdF6fXi7fqlgCzTZDAX8X3NgK7sDscWTEu/qJ0NSuBCgkFbI+6+cIJhOggSeT5IZGrA8zyRw67lA9OnuXyi8Z+Yp+F4lalHWrER/yg/2sqp0UgIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393960; c=relaxed/simple;
	bh=UjyL6Es26vFAFB/S3/YnieZpMLLCpRpRI+vU8NyANxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CoForBIillmk0AiuSYMwiqSMStFxHZClMltcCcs0OUFKFYrIZ6olHH6i/28U9QOwyot+sDl2lfbxduOrc6WnS0GUbL8apq7HBOMnD5d8K0VBaO28ETZ1xvio+7Rl7BPMAr4TfUEhwY3MDd3y69sJLn+y0h50tNKc2AJ6vJwDYPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NpYMDRhi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t1k4EXCr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NpYMDRhi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t1k4EXCr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NpYMDRhi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t1k4EXCr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NpYMDRhi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t1k4EXCr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7968421BCB;
	Wed,  7 Oct 2026 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=NpYMDRhihAQhna7pq8e/JsJ27+TsnNDUKcOBcZhOLBgnarXCHpoFLVJph8HyC96pJJ+hb6
	Q3MHwrHidgg2pmR4IFV5HM00iXi2pES0wwHK4+N0S1DMWWfeX1yvwxPJLdTpVbGBDUwOQR
	+45nAwgVkrO1dpDT/PjLbH4BqYhCIMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=t1k4EXCrOS4QqoGzCv/vgBRfXLYtsVFAJOwNcyQj1bNEQAOdClsRCjnQxEdFBVBLct9oi1
	m2oZTep3XsbcJAAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=NpYMDRhihAQhna7pq8e/JsJ27+TsnNDUKcOBcZhOLBgnarXCHpoFLVJph8HyC96pJJ+hb6
	Q3MHwrHidgg2pmR4IFV5HM00iXi2pES0wwHK4+N0S1DMWWfeX1yvwxPJLdTpVbGBDUwOQR
	+45nAwgVkrO1dpDT/PjLbH4BqYhCIMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMsRGVfd87knLv2pkEnDd1RYi/QL2UhBgqYXTBSK7XE=;
	b=t1k4EXCrOS4QqoGzCv/vgBRfXLYtsVFAJOwNcyQj1bNEQAOdClsRCjnQxEdFBVBLct9oi1
	m2oZTep3XsbcJAAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E416F139BB;
	Wed,  7 Oct 2026 17:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p6IPF6SAxmqXDwAAD6G6ig:T7
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] ALSA: core: Fix leaks at snd_card_init() error paths
Date: Wed,  7 Oct 2026 19:25:24 +0200
Message-ID: <20261007172533.14667-7-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
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

