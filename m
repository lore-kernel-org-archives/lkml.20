Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F803503905;
	Thu,  1 Oct 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852726; cv=none; b=CxnsNfS7tnOqVSZwErz32vad1DfUk+pS8wGhT0T/Jl9iKuNPNO0sA7YcJ7sfHsMI0TU+cZ29PNkamMnhMXB1T1Vv4gMhZp7wEDbT3irAF/6cpVdW9LNZjb2OmXr+yiV0L99MDGGUfJ4t5r4jm2DJ+BbDHVhzd1jRWaiS4HdqKug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852726; c=relaxed/simple;
	bh=x06mcJV1WAROwPLgm3tnL5cf4mOVTNwircKfVhRV/1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLQp6bPPaDf5e4dLSSDNlDzoDWd+NLMyOdwOnosQ0rFWr4yhoTIsi/WFFc6yaPRgsUZ0y6i7aWJaFhUPZ0clkwqWhwfY7Tw5dKOBT6x8pjV9sWIdb09W+hPFozeR7oZV11/DfJpZsE2oFCSv/mOxAuK5KvFXbNAZ2e3iwK77lVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yRCvZLtT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n2ATo4xL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=knOITVaI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f4Bl1J8x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yRCvZLtT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n2ATo4xL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="knOITVaI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f4Bl1J8x"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 114B41FCFA;
	Thu,  1 Oct 2026 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCol0EdW649HGxRujyw5N3el5RLqDHOY8dbhzEGvE7M=;
	b=yRCvZLtTb/ktlm7t5ZqXxjmUxWArKEcWfEE3K/J67P/FnoMo12J2tph/knbuWsrcBsA5nh
	XFdvac1F2KLoDfTpl1KK4sTrp5Qmli2FLbwP2gZCMaP2UeJiEqlSNfeXzysEAKt3w/GZ2B
	Y9vt/8ga5wK046y40Vl8Sqit/2xOnB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCol0EdW649HGxRujyw5N3el5RLqDHOY8dbhzEGvE7M=;
	b=n2ATo4xLYZwsW0InZSJ+I8+OLaBkIJPH86IHXWPespSV2uD7UojQGCNdnVVHfZwIVz6WQz
	4tXF7lt+ZtMGnJBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCol0EdW649HGxRujyw5N3el5RLqDHOY8dbhzEGvE7M=;
	b=knOITVaI4g33t6yo7sOoTrQCCjxa7DoV/0kMXmDKdR6hDkkTx8ZSUY+1hsYwu9DQ4wS8HF
	U0wMPjRLbROF7FNCF5VWmSwKw2++ST6LQkhssnlDHkg9grHg2CYTOIvEd8i88kdRW57PFP
	pFqVBNGhWL8syW/aAHOzWpujVlWTjyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCol0EdW649HGxRujyw5N3el5RLqDHOY8dbhzEGvE7M=;
	b=f4Bl1J8xMYgqZBLb1Td7s4ZwvogYUpMNsgwjsRY9vgJRyZwDBymbpM4K/kfVl2pRp/cEX2
	ZJsauhkdkT5PzIDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5503D13B72;
	Thu,  1 Oct 2026 11:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T24
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 23/32] ALSA: oxygen: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:03 +0200
Message-ID: <20261001110447.486782-24-tiwai@suse.de>
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
 sound/pci/oxygen/oxygen_lib.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/pci/oxygen/oxygen_lib.c b/sound/pci/oxygen/oxygen_lib.c
index 6b096d654f9f..9d48cfbf4c23 100644
--- a/sound/pci/oxygen/oxygen_lib.c
+++ b/sound/pci/oxygen/oxygen_lib.c
@@ -572,7 +572,7 @@ static void oxygen_card_free(struct snd_card *card)
 	mutex_destroy(&chip->mutex);
 }
 
-static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
+int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 		     struct module *owner,
 		     const struct pci_device_id *ids,
 		     int (*get_model)(struct oxygen *chip,
@@ -580,7 +580,7 @@ static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 				     )
 		    )
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct oxygen *chip;
 	const struct pci_device_id *pci_id;
 	int err;
@@ -695,18 +695,9 @@ static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
-
-int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
-		     struct module *owner,
-		     const struct pci_device_id *ids,
-		     int (*get_model)(struct oxygen *chip,
-				      const struct pci_device_id *id))
-{
-	return snd_card_free_on_error(&pci->dev,
-				      __oxygen_pci_probe(pci, index, id, owner, ids, get_model));
-}
 EXPORT_SYMBOL(oxygen_pci_probe);
 
 static int oxygen_pci_suspend(struct device *dev)
-- 
2.55.0

