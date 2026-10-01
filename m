Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF14514776;
	Thu,  1 Oct 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852732; cv=none; b=D3Ib3Pl4CM5BLKEiDv0fxEKKA6e7dz9edKuYV/v9lb894/dvQCLZoUG7YRRWHZOlAjIVFjr2c6PtaDOpL1LfStN8hWQBybO5TtjBzR/Qgj1BgWegOWmy3UagUdEWhGE7zX8g6dzlulS1Feo1su5fmthWbfrF0NfYLEsIT3zrSQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852732; c=relaxed/simple;
	bh=hkrBHGZ+YhI4GugPW8ot+1Hn3jlqwxcJ4fpuIgSlVZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfwrTMgsQGbU0FLFoALphTdg6wU4Adi/IjiXTuY5RRs52mOc23h1h/UulXsosgtNKFeKB3znDI7bdJscq6bveJIGht73vJ87PpSFXMCaBK8aoFJ/K4/etJtbXBDSll8ZXqZsG2WKMCNWKqh5v++WQBmQG+vNhq1sxqZmInE+Pa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hKLLvowr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TcwOx7pT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CbS6X0iS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qnxzlsyi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hKLLvowr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TcwOx7pT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CbS6X0iS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qnxzlsyi"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 659C221EF0;
	Thu,  1 Oct 2026 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vl3vmxtlv0FDDrok29GwLiB61gk+9n7sFf07xBHFA+8=;
	b=hKLLvowrUoaoY/AjoTyGCmiKLVizCYhYQUDsZb6bePQULPplmsKaruTB0xhAE3No/t41Zp
	DAm1u0bPx9XrYHOONGGwWfvaZP/S+YZup99Ga/xmPw7gQv0IsydI3+BWyzRJxHZ73TJe0v
	KlPa453ZuSfrHzS5ATgy73NnApPatGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vl3vmxtlv0FDDrok29GwLiB61gk+9n7sFf07xBHFA+8=;
	b=TcwOx7pTE60Lw0nhbYMXOsi9WFeT2ZGh74Qn/3sU1ys/1zIaX9qW73hafBF4d2yb4Pqbz+
	zsGV/JxLz2fLN6Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vl3vmxtlv0FDDrok29GwLiB61gk+9n7sFf07xBHFA+8=;
	b=CbS6X0iSwrGrv3A9Oxh21cXxBL7hAyh71mmsKeL6AzP7f/heBoAhYc/iFNF+8jhz3l1NuI
	a7/46H1PNP73F2fyTlM3M0meZYrLR0yPAZP/Ii2groTGABIo+1hRCprWn+upyOZxYp/YcI
	PbM2GQWeXBwa3DjDY3nbRGBCekVMh28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vl3vmxtlv0FDDrok29GwLiB61gk+9n7sFf07xBHFA+8=;
	b=qnxzlsyidHEgu9caIbE2cIxHLPNBTp/GFG23vb7nDk24qOi2ixvFsmzARiFelChxpC5EZQ
	5Aqnzaow6IPFXGDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9DC413B76;
	Thu,  1 Oct 2026 11:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T28
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 27/32] ALSA: sis7019: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:07 +0200
Message-ID: <20261001110447.486782-28-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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
 sound/pci/sis7019.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 55c1b11a2900..5e445158f2b2 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -1309,10 +1309,10 @@ static int sis_chip_create(struct snd_card *card,
 	return 0;
 }
 
-static int __snd_sis7019_probe(struct pci_dev *pci,
-			       const struct pci_device_id *pci_id)
+static int snd_sis7019_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct sis7019 *sis;
 	int rc;
 
@@ -1361,15 +1361,10 @@ static int __snd_sis7019_probe(struct pci_dev *pci,
 		return rc;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_sis7019_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_sis7019_probe(pci, pci_id));
-}
-
 static struct pci_driver sis7019_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_sis7019_ids,
-- 
2.55.0

