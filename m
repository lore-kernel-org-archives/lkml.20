Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398FF4ED1A9;
	Thu,  1 Oct 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852715; cv=none; b=h9SERDSwgBp8cCtOXabBjUrHOGH2zxC/qRJLkeIRyaW8bfNqy/beqkBirj9ysuOXUSG9zHVwNPzuO/d4NkEGIqMPhZeXs6Fa+SN8Pa+pYGCLT/ty3OKugQmGCN/XFFFHSEn72iNYSjRtF1V2+bTMEhGlZTpQVR4ZpeB4zBG90qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852715; c=relaxed/simple;
	bh=+fwy/01gDtJpRCFlyw1zo/4rOTcXu/8O6GGVm4KVZOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGS+iJ+nyi/Aaz5wGcS/MiXnRo1fv4LBeNyGD+CoDYmNYZGAYpebAQa7wkqSYeERvNn0CRSa+yfZf720VEEJMfkK0pOMa9KA0HkmlLpH+JPR29CtIsuO6L2c4elM+MSAGd1dGguByAWT903oxBT8Y2QESSNbDhQNTSBfukbu7bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y5X/RXuD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DUV1+opt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YtQeBjZO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LLhmfW7x; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y5X/RXuD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DUV1+opt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YtQeBjZO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LLhmfW7x"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2447F21F45;
	Thu,  1 Oct 2026 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWl/wHxbJlhAW/NCskNeLvOVRmU5Coz0mchBsZ57vv4=;
	b=Y5X/RXuD47BRzbmWfQoLu1XJ3Ad5/LQUTI0OfXAy7W/f0rYsjWM5EBvXEKhnEpcJWugMt1
	M7v2i9KupuWrTUhcxWvwjvLPHck+hynMU/4uD5+yyYrlLaJTV1Yjv+ocrj3JxQGcfeUevz
	9ouMk5XuYaQbF60d6AGcogqxwUpdxv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWl/wHxbJlhAW/NCskNeLvOVRmU5Coz0mchBsZ57vv4=;
	b=DUV1+optp9mxR9B923I99Keme3vQKl79zrMh64K4gzly5CRXn7LlWqudFcOV+P82kbm1rS
	FwTFWgmNkBRim1DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YtQeBjZO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LLhmfW7x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWl/wHxbJlhAW/NCskNeLvOVRmU5Coz0mchBsZ57vv4=;
	b=YtQeBjZOH1wMDqFyS4qD32woq1FT4lWMDzu3Ok6ho6PgvdX0H+6sMNHh1xVXNMzMEbeh3L
	5f9Ea3hxVJbvRMzt5hMlVbETr+dkdkNpZj0zOs81p85ZFJgo61tHYia2uzgCwr/30N3jy/
	WDGvboP2ZYg3h9x4uow0TDr8ltTf+RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWl/wHxbJlhAW/NCskNeLvOVRmU5Coz0mchBsZ57vv4=;
	b=LLhmfW7xyavbvHXUAkqQQ3D7x/cz+V2kpjMcQZY+Z3V3uhovQZGqmgZTAEVBag04EESyfV
	5jw7U4IuXSgJJ1DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0513B13B62;
	Thu,  1 Oct 2026 11:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T9
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 08/32] ALSA: azt3328: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:48 +0200
Message-ID: <20261001110447.486782-9-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001110447.486782-1-tiwai@suse.de>
References: <20261001110447.486782-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2447F21F45
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/azt3328.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index ccca82417657..fa81a31d809e 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2403,10 +2403,10 @@ snd_azf3328_create(struct snd_card *card,
 }
 
 static int
-__snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_azf3328 *chip;
 	struct snd_opl3 *opl3;
 	int err;
@@ -2492,16 +2492,11 @@ __snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	snd_azf3328_gameport(chip, dev);
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int
-snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_azf3328_probe(pci, pci_id));
-}
-
 static inline void
 snd_azf3328_suspend_regs(const struct snd_azf3328 *chip,
 			 unsigned long io_addr, unsigned count, u32 *saved_regs)
-- 
2.55.0

