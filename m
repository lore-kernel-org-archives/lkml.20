Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476A4EBAFA;
	Thu,  1 Oct 2026 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852715; cv=none; b=WEJCDItUSktzjSBNV+xAWmTTD/+7ZRMrjINd+T/7qRcdUk/Dbc1TUVcBtaWA6xLpSA1P+8QeIcjBtR+dO0j8kCKSJqau/LOWVIn74Pg9oO6QBmbvnf811YBg+PauR991r8m698nR5YVXejk3//DbAv20G1fZdw3RuJD14pMKGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852715; c=relaxed/simple;
	bh=xyNNZ333WZXBRDYkAUTH4bGD8lZm9DzNgwyTEW4YjfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mM7uHqV35S/XeEweITG7IM5hPO61YbplgZJ/t7AE13JrqGFYZC4nYgiBKYDi1l+WhN0oq6fzgdEQuRLlgEIWWeYgMh8HK29LwRyghlQ9WqDjygP89qXFzeZC3U8zzRV3Fmnyb4Lw8lk5uhTl9N1v0OUVOPq+cNXQDZWGRgHJu9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HC2CgdGe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HAv2Ueet; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QKoxArHk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q8jFapSd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HC2CgdGe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HAv2Ueet";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QKoxArHk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q8jFapSd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E58331FCCD;
	Thu,  1 Oct 2026 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70wkUOwZACEb0UmYDfG9lzFZleca4gIFXz0tiipMtAE=;
	b=HC2CgdGe1UNdSzw83TqOzmv1wJw9pyg0P21/qZAaMSC7GQsBGU8nw0RTYYLZUR97vD7LkU
	h31EewY7fukmJ8toJliTgPRlpy6rDFcQdx1eiaYBowhyJbdlmOcfjYo+/wHhj2vEVqdP40
	RSjVClOuuxDnW+An/CuXuLOSsEkxFg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70wkUOwZACEb0UmYDfG9lzFZleca4gIFXz0tiipMtAE=;
	b=HAv2Ueet5oQTp3AEJ0B2W/djUdgCXg7rMWLQPEqbghcSgAkRRKJRDxx7GVbUctKxU3z/6h
	0OJkMem3lAARhcDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70wkUOwZACEb0UmYDfG9lzFZleca4gIFXz0tiipMtAE=;
	b=QKoxArHk78bZePg2Tlq0vhZRQ3RUBUVTpWKjrWUUwkSTg3WeDIutHP8ZDR3VEuiKtXs3Po
	oGAYT/6TMsDFPRag+XzsZx0Bb5XMwhAnmJXQgvA9kLYwPPUhwRfCdyhRNfSg7rRqSTBpTw
	q06YKARdPfF8/bHI4ypQ3oSlDjDkRV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70wkUOwZACEb0UmYDfG9lzFZleca4gIFXz0tiipMtAE=;
	b=Q8jFapSdr0y/GgvuXiiqJLoR7OH0ApXwQzTJrcpHf3NcYLgUsphAmvssjdT2O6Rp0I1diM
	amO2aehua8Cf46Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC0FF13B60;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T7
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 06/32] ALSA: atiixp: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:46 +0200
Message-ID: <20261001110447.486782-7-tiwai@suse.de>
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
 sound/pci/atiixp.c       | 13 ++++---------
 sound/pci/atiixp_modem.c | 13 ++++---------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index b738295b41e5..d4c5a00024ac 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1550,10 +1550,10 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 }
 
 
-static int __snd_atiixp_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_atiixp_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct atiixp *chip;
 	int err;
 
@@ -1598,15 +1598,10 @@ static int __snd_atiixp_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_atiixp_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_atiixp_probe(pci, pci_id));
-}
-
 static struct pci_driver atiixp_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_atiixp_ids,
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 8aaeb197ce45..ce2452ff0f1d 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -1182,10 +1182,10 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 }
 
 
-static int __snd_atiixp_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_atiixp_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct atiixp_modem *chip;
 	int err;
 
@@ -1225,15 +1225,10 @@ static int __snd_atiixp_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_atiixp_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_atiixp_probe(pci, pci_id));
-}
-
 static struct pci_driver atiixp_modem_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_atiixp_ids,
-- 
2.55.0

