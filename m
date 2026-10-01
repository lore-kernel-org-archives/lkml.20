Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7D63EB118;
	Thu,  1 Oct 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852706; cv=none; b=obAJuYiErMG4c9p1dTWj98eHEddRlD97FUYxIuX0YtRe+9F6IWDCKwnpHEVL2BGFa6Spy6R/fYLydmRqTqnbzZqqyQ7fmD9Nr4ARUyE/Zp+ZyqY0ygyvJ/3AiblDHVpclNZM5XUCeGfjPzNxcQ87cbpBBuVTbizP1ymEA//ECCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852706; c=relaxed/simple;
	bh=p7zVD2dgW1XorREu+s5qK4D7x5OCUX4h1BzLDB/FsFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZunH0xgJMVE6EnPtCggcfKzlFIlhLORg28DBfbqtbEBHIs41anzt1gn6Qajs1FjlDhpFxnlr+tSR/VtfyKS1kcfNxinILv9Njk06MY4dlqa5LpHWVESB5iJN/uryI7MaQVj/PzM1mTkB68zu2nrNgZ7Bfjv0anzrWH37R0pXTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pJ3EDP0l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ruUp8Q8m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UtFN7zvS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NvLJH9bN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pJ3EDP0l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ruUp8Q8m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UtFN7zvS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NvLJH9bN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A84021F15;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMEYzxggM8m7mqh3r6IbzK/U9HdFm27+w6Z03BtotKI=;
	b=pJ3EDP0lXRTBMtmJ6eHavVdvEMQpUgVfeK17BscvsOcVJQitBtrRYWaltVTaywPbthI52j
	sW4YKR/J/HR+n/6RM5UT7VbXPeeHQl0M69DUbAd8Ulo8dt61D54P2vkgn3TVCdDKj/yqGX
	rr4KPysMnn0eC6S5sUp73Yjh9iAHAjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMEYzxggM8m7mqh3r6IbzK/U9HdFm27+w6Z03BtotKI=;
	b=ruUp8Q8mgYiuq5iRG2LbnLSB5Px8pRSz7kZNBIcXDSvrgGTnLf2czP52f2p3cLO+z0PSLN
	1ubQU/MTKIgqiiDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UtFN7zvS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NvLJH9bN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMEYzxggM8m7mqh3r6IbzK/U9HdFm27+w6Z03BtotKI=;
	b=UtFN7zvS6U31xJNCBkbLLCj8LHpfg3rGn1Cgov3IyhwaFX73/qCl1+ULN5NOxeGOLDAaWX
	G8HKxUGVSfKfCSXeGv+oxE+AOLRduex/4Wo/jX98qEks+7E/KgK3pdtnuGcr6UDfY2HFUj
	sB/AseWuRG60YfZVgE8mCh+marAroyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMEYzxggM8m7mqh3r6IbzK/U9HdFm27+w6Z03BtotKI=;
	b=NvLJH9bN6suIh9NIOiMKFG7o/BfzCXYKgaa93lqZjFR0IGox4+1bkUnyC9pOlgRJsADqsc
	FrRtuVExiBvkXUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B1B113B5D;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 03/32] ALSA: ad1889: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:43 +0200
Message-ID: <20261001110447.486782-4-tiwai@suse.de>
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7A84021F15
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index f4ec404c0d15..bfd6b023b5aa 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -837,12 +837,12 @@ snd_ad1889_create(struct snd_card *card, struct pci_dev *pci)
 }
 
 static int
-__snd_ad1889_probe(struct pci_dev *pci,
-		   const struct pci_device_id *pci_id)
+snd_ad1889_probe(struct pci_dev *pci,
+		 const struct pci_device_id *pci_id)
 {
 	int err;
 	static int devno;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_ad1889 *chip;
 
 	/* (1) */
@@ -892,17 +892,12 @@ __snd_ad1889_probe(struct pci_dev *pci,
 
 	/* (7) */
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 
 	devno++;
 	return 0;
 }
 
-static int snd_ad1889_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_ad1889_probe(pci, pci_id));
-}
-
 static const struct pci_device_id snd_ad1889_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ANALOG_DEVICES, PCI_DEVICE_ID_AD1889JS) },
 	{ 0, },
-- 
2.55.0

