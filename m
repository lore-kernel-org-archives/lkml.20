Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564875038F7;
	Thu,  1 Oct 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852727; cv=none; b=eoybSWsyRTyHfjFpVJzKmfxQDwC8Wy83aBk3da5qdhzo8eD9jBUVzTaeITuuV8Mi9onmQBDdtgK01+qDXKNtz1LjAVLkR1nWLofO7DD7XbjRuTnkC52vm5bc2unFblcnyl30sdsGwYSkxA17WtRGgspeOLV3e8bgNIuz3q+yPLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852727; c=relaxed/simple;
	bh=hUFdZZjjg9/kEDHZSmn5U6621uoBEtynCASuuk/QldU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVCaWgRiAh7v00yF+xmf9Wlsl5yDi055cMXdDXHQWRm63iLZ1JKWPdiliDzaKYmRbVnkc9U4S8ZCVLARpz6/QvVRZtE/iGxWdNEN8KW7mz/nmww38eUiOZj/r01/qD47vX8N9AlDTk3TpfKTIRplGeaBD3nQbu12Ua644QVj1b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dMqiBITm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xYU6qlMW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=baAV3Fyy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AuE8JAh7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dMqiBITm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xYU6qlMW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="baAV3Fyy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AuE8JAh7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E887221F26;
	Thu,  1 Oct 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4A+tCAKmWX+EgbGu5AOc0CYwBdH/RrqVqpj3GeOPRo=;
	b=dMqiBITmQgFBles1di5jI4cKxsEgWGjRirN1bjeWps7xte8skRORkUQznUaPcjCrwf5FEt
	7g7EOUA8t0heTK3ghrQ+wHLKHa3Mvq97fXRCW5hY6iOU4ceevhnyCq/ffeRpiKvVEPB1Zu
	lncFLXO1ljQIfQAVydtSGg7FioKtJlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4A+tCAKmWX+EgbGu5AOc0CYwBdH/RrqVqpj3GeOPRo=;
	b=xYU6qlMW31C8ewiHSgGPQ62iyr/hFGzmpl1wKOgwTQCDAM6YshmO9XgFR9b5SWwGf1YHeB
	Rr+DHKuoS1/JqrBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=baAV3Fyy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AuE8JAh7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4A+tCAKmWX+EgbGu5AOc0CYwBdH/RrqVqpj3GeOPRo=;
	b=baAV3Fyy0EwOFPT/4ImaIqsCZ3wg8b5RBM6kBOWdLzQ1+2u2PvyakbjS81wAlmQFyfVbLs
	+ykljbOAPhr8Dr7iD9dI2E819k408Q/5Icgh3VoH6wW61K36aazJQNEs81WFl5VwPy+LyI
	iELe+iuhl1zeMblA7jRN6TOwKKIOJ64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4A+tCAKmWX+EgbGu5AOc0CYwBdH/RrqVqpj3GeOPRo=;
	b=AuE8JAh7XfZg2zuY1WJrlK+W1ItmHDdIViHCHy3LHE6LNihfeyat+3amGZBznmwSohZB/b
	zaJaa8Nhdqe8m/Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3086C13B71;
	Thu,  1 Oct 2026 11:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T23
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 22/32] ALSA: maestro3: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:02 +0200
Message-ID: <20261001110447.486782-23-tiwai@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E887221F26
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/maestro3.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index dd45ffa171e1..374bc6420f24 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2629,10 +2629,10 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 /*
  */
 static int
-__snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_m3 *chip;
 	int err;
 
@@ -2690,16 +2690,11 @@ __snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 #endif
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int
-snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_m3_probe(pci, pci_id));
-}
-
 static struct pci_driver m3_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_m3_ids,
-- 
2.55.0

