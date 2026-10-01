Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE2502573;
	Thu,  1 Oct 2026 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852723; cv=none; b=FSB44JtOLQipg2O//6kjOqhtoAKyfVwjq2e+bCp8ytYCO7Ff7++l9tdjl97N/fkrTk5kTzE1Mb1aqQkNYSWYhP66AI7YMY9VfMLgkh0hFEUr6x07M3lWw2YN1Sc/UWUEC42bMARKgtpxG2e1rNqvGkNw1Jhepcd2gUJhJkDrAnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852723; c=relaxed/simple;
	bh=cHKl5C7bxe5jlRpFMrVmx0rLLuVcF26PPAHhuIMLW4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKeaETc/q5twjt6HjTGL9ps+DQ+DovTR4egz78M0AcrthjAq1k4E8MUEGEw+sHwFwvPBb6Fl7yd/lulVI0F9wtQ0CZrKCrCQvdomtohbeT9gJJgLtlHC624xIzz23Z+KvriAHA+cUOQvqUXenbTgvia7L/3RoeQbcr6X9dde48Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VghYCKCc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GkE/DNz7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L/+ZjLM5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uHsZPfqY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VghYCKCc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GkE/DNz7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L/+ZjLM5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uHsZPfqY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 729101FB69;
	Thu,  1 Oct 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FloW5+w1P4nGouYuCnf7MntZGnFOWQCFdIuvv5u68AM=;
	b=VghYCKCc51yNaazQ0J/DHeerMEcDaH76zw9nq8OOzGJw06rF1OcE6OblkpMKdD35UtQV2j
	SQIDGQqJWxcxmYxsEj7XWBOYlIATUxnbGL2v7UbWvHMDQHo+vby+a2uhxCbjMcFufcbAWi
	wvNU1LF/OURAt5J7s68D3rSKOZa5FN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FloW5+w1P4nGouYuCnf7MntZGnFOWQCFdIuvv5u68AM=;
	b=GkE/DNz75O6c3/r0w3sT/rxg1A4+kPa+Lb3oiQf74KGc3svWkq5/msrXcn/XuOEOkqXv6A
	ydDcSZebOPe9RlBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="L/+ZjLM5";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uHsZPfqY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FloW5+w1P4nGouYuCnf7MntZGnFOWQCFdIuvv5u68AM=;
	b=L/+ZjLM5DV3jMZU0ft3Q953nDikuxpFIIVgGiG+wSX4ThdHP3MKGP90FpqtqjBH9mZW6NG
	qQ6KMml1CPqd6VmK9OHc4as8bnKSNw2C29ifYMUbJCCF9rCF5WFci9xpLlP9+y5F7PhdGg
	AIkRRglbZXNzgi67b1ONFGXbbEGM2IY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FloW5+w1P4nGouYuCnf7MntZGnFOWQCFdIuvv5u68AM=;
	b=uHsZPfqYw7H/BIwPaOgQV2pZcRo3FhwVo1tmRfZMZyaj4tOcSEuQovEsQ2HWIDyfnAxCZu
	OMC4EdQC4yoQp/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B9DF13B6A;
	Thu,  1 Oct 2026 11:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T16
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 15/32] ALSA: ens137x: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:55 +0200
Message-ID: <20261001110447.486782-16-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 729101FB69
X-Rspamd-Action: no action
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
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
 sound/pci/ens1370.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 0b9eb55a2121..7d8acffe3d8f 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -2267,11 +2267,11 @@ static irqreturn_t snd_audiopci_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __snd_audiopci_probe(struct pci_dev *pci,
-				const struct pci_device_id *pci_id)
+static int snd_audiopci_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct ensoniq *ensoniq;
 	int err;
 
@@ -2328,16 +2328,11 @@ static int __snd_audiopci_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_audiopci_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_audiopci_probe(pci, pci_id));
-}
-
 static struct pci_driver ens137x_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_audiopci_ids,
-- 
2.55.0

