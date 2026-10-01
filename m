Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A04EFFCD;
	Thu,  1 Oct 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852715; cv=none; b=YCO2OWQdJifDgrzUNqzRSXgIKsY8c3BqN0T8MnB0QZbQs04b9uibl1ETFlnkr0hN+cclJMONgUDuHqmkfboaX0Ra/40aUQQphXYDVcPPxXPF+OwafUhHEYt9+hs1Wu1dF0DBifkTV2yRAhhhurS4x/9kFReDY6Uh6zUGaAECVPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852715; c=relaxed/simple;
	bh=Qw86MzIoQkgd7jDJRVtwN4D6sNUvdExi9bz7JNnJdd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inqHF6n/XtAVyZWnilQSBlZKMNYu5AzFhdrtF3fxK56ea8jOvviPNxBOiVKeXS0xXaaPhChCpIG6ZLDFBYtyQsLNjP27q8smfepJcLsefJqUCwpmd9g/gMop0FrKoT8RFmebMyUKzQjPrEMuVOV5kEN7bsaFogSVSz7jYpbmBno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ral9owDP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pryA6Qsh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hsAc9RRx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zPHOjDBW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ral9owDP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pryA6Qsh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hsAc9RRx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zPHOjDBW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 52B0521F47;
	Thu,  1 Oct 2026 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34cw1ksXb5GVds7DA2PgbglYLvCuh8ncSnA8HNsqdIA=;
	b=Ral9owDPlLK4mNKrqZy0bol0MuBkT1kTYBFeVq7mMybRDNvaP6x+yBZ4MMXGPUExa1L0lq
	eXy5L0rlaPHUs4bsnBL9z+MNA/MZSmtpXksb6eUKF0ixdknpEsiQtFvkrRisErsFuIoHHD
	5HKc+rYvy7nyR2PDDoIlJSI3n7GuuFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34cw1ksXb5GVds7DA2PgbglYLvCuh8ncSnA8HNsqdIA=;
	b=pryA6Qsht2R9t0STibV9ewl5hAyds0xJBSA8UXaKYCF6Zx7tR7FX7St49aqfqA29gRYXKP
	PHigQLyCUniJRQDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hsAc9RRx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zPHOjDBW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34cw1ksXb5GVds7DA2PgbglYLvCuh8ncSnA8HNsqdIA=;
	b=hsAc9RRxG4dwmshD/C5aWl5bqbvr4oU+4b/A7Es8MwwxzDEkSKivbSo0kFKPLGt+Xjwxsq
	36ZNCFQ5z10VNsOmSPKq1+uwPaHi2BP/ggRCPV5+1zE8wEBjlH2xcEUmeo7XSG2PQm9Axs
	uk5rG0J8ZDdbqr+vKBOejx8dNqnMLlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34cw1ksXb5GVds7DA2PgbglYLvCuh8ncSnA8HNsqdIA=;
	b=zPHOjDBWlJ9i3mDyVFAztpOcr/+aYQlMyJ58oT24SoF31biy2ipovV7lIfiHvGKhryNbmp
	sVLh6GNQovp8DlAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5177E13B64;
	Thu,  1 Oct 2026 11:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T11
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 10/32] ALSA: ca0106: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:50 +0200
Message-ID: <20261001110447.486782-11-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 52B0521F47
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
 sound/pci/ca0106/ca0106_main.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index cf923f551211..bd1a6420c9e5 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1710,11 +1710,11 @@ static int snd_ca0106_midi(struct snd_ca0106 *chip, unsigned int channel)
 }
 
 
-static int __snd_ca0106_probe(struct pci_dev *pci,
+static int snd_ca0106_probe(struct pci_dev *pci,
 			      const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_ca0106 *chip;
 	int i, err;
 
@@ -1767,16 +1767,11 @@ static int __snd_ca0106_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_ca0106_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_ca0106_probe(pci, pci_id));
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int snd_ca0106_suspend(struct device *dev)
 {
-- 
2.55.0

