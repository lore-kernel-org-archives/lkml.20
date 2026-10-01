Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F7C5038FE;
	Thu,  1 Oct 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852726; cv=none; b=QJfte8KA1fMbA2/5CREMFalD+K6lwqv5EyYaj2tKY5dXV59Ih22DKR25hNguIEZQaMGTeXC9TeYhQcxiq1/cRI/cLlzlZs8kImpA9fiEBNp37D4NpgJjdgWcnSqe+PJB+wWol2NWw4XGr0h2xHgSgogIluDar6d7gOw6D7nf35M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852726; c=relaxed/simple;
	bh=F+ozvoMW8AmxfMkMaPonhCicdhhWkYnvebuzvlpVjBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrNYUHzWEfKD9DcF1hgbWGllCLRc1nrLPZshrfOaSBVRheMi6+9q32J5o66+tx2IdEUrcEKV8TLbpvqsVxk6ziSpTK5j51t4oWR6VVJtREGs6I1ODJOd17TUV5qEaIrYAICO9Sh0pDHKARaI5uFex76gLBVtRk8iFNzpeFP0NWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NKUe7uFW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vYsn4AwF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vnw4I/yZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=moqaaZ+/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NKUe7uFW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vYsn4AwF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vnw4I/yZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="moqaaZ+/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E00B621F03;
	Thu,  1 Oct 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiiibskNbCLaaV+CtfuHTcd3BiOoPWwXu2DAMBQ2v6I=;
	b=NKUe7uFW3CbwLMcS9kvn6vLXa2V5PsBzJQlSFOSJP9bJC+GnGp2S8DSv2OQsyaiq2kpbv5
	SMz0r0GxAUh0W+oSD2mOXpGRGsB7pYhEoYitZE69S6wV21bzLGeyLaif2rVvr/EEhuWrkW
	STCNebfeaJreB9QKvjfwCdy14WHJMhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiiibskNbCLaaV+CtfuHTcd3BiOoPWwXu2DAMBQ2v6I=;
	b=vYsn4AwFIS+vMejd/Bu6+qlxG484TC+Zcci6mldtrYXCNhikmCfxwYfwTk8LTvgE4vRwiy
	g979HaY2nyZuA/AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiiibskNbCLaaV+CtfuHTcd3BiOoPWwXu2DAMBQ2v6I=;
	b=vnw4I/yZqUvRvgT/AIIPGlA4A7bgBJRt3hM47zJu0xs3zH3cUYxhLjNx1eI0o92o8Q54Vq
	/yCSEpl9wv9AlL/qjoZRKg8zzvJV3fmMpF3I6HOw+Pv1xT8wd1h9Ai724XmrQz8V6Mk+Pv
	Hp4xWlqpkNvIRIoEVcamtmnbEXC95wE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiiibskNbCLaaV+CtfuHTcd3BiOoPWwXu2DAMBQ2v6I=;
	b=moqaaZ+/JTHR9T2AfhlyDOrODHe0usLmIJryvFB7A1z38VPJGCRyKdl19BRPeijWvrcyFw
	mvux3lcWnrUtaVCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06D1D13B70;
	Thu,  1 Oct 2026 11:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T22
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 21/32] ALSA: lola: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:01 +0200
Message-ID: <20261001110447.486782-22-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lola/lola.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index 34a3ba17deb4..bd2f8b3ab280 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -641,11 +641,11 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
 	return 0;
 }
 
-static int __lola_probe(struct pci_dev *pci,
-			const struct pci_device_id *pci_id)
+static int lola_probe(struct pci_dev *pci,
+		      const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct lola *chip;
 	int err;
 
@@ -687,16 +687,11 @@ static int __lola_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int lola_probe(struct pci_dev *pci,
-		      const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __lola_probe(pci, pci_id));
-}
-
 /* PCI IDs */
 static const struct pci_device_id lola_ids[] = {
 	{ PCI_VDEVICE(DIGIGRAM, 0x0001) },
-- 
2.55.0

