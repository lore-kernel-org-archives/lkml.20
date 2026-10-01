Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3F74F054E;
	Thu,  1 Oct 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852715; cv=none; b=S2ThTDX/ze0kBcRU/sT7J9fCYs3L/JEL+MmIpCyQRvJ2lEi/B0zUWzUcL0L4gcXcANkYwHlrXEDgMb68PtYAkfGok/eWmLQ144XcfFKDsoaxumvMgkJmvYlNNm9Dp4px0HmomIiybGmdyb6P0+1S7InuCOj78mPxnmPWH8iD+YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852715; c=relaxed/simple;
	bh=LebeJ/ln1THkIslMAA4nfxWy5kQoVd+Qcp7mEyL1pxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MiwFCY/zawV2n8zFGBssioYLD7rvReGydt4eC807P/syhWVrYW1GKruhY/mHz0hOCsAL6XJht6LUbxYZeh1pC9FAbWZE0yQDSyCECdWevyjKg5lh4TIjz2CaFgVIk1dXGNJiJcAM8qp4Qd9uvJjdl3ivMVpZBinU2tj5EXi+LPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RmkjzsVT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6yCAFkz7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BDk5BbVB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vWdoVf7Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RmkjzsVT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6yCAFkz7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BDk5BbVB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vWdoVf7Z"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F6151FCFC;
	Thu,  1 Oct 2026 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GdtQS57ysy7SA+iMSB7jdDebRaPe13gz9wjzkTQk1I=;
	b=RmkjzsVTklXl7wai6NrXR9aojZFeA+3XEr0A12pK2oh7lHq8/iXY++8FqmrvxAD03nSFwf
	xBRnGmoEfJs2B6LkgDCK+sDWXqv22Dyivi1A9N3JmAr1DDEzj73MBtNGYWmbg/FoiH8qpF
	r0CpLcZ+mU2E2TJOYhfOWIBkVA41Bic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GdtQS57ysy7SA+iMSB7jdDebRaPe13gz9wjzkTQk1I=;
	b=6yCAFkz77tFIcWHYpbvcOXUAlX/+ZQz8pWeEby44ybWjXDmd4a0kmuH+zDLx6iZnNxV/PL
	yV93WIcvgguIcICg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GdtQS57ysy7SA+iMSB7jdDebRaPe13gz9wjzkTQk1I=;
	b=BDk5BbVBujP0BK4bz6FCZeCKHhsVvoEYJadPZkPstJfJYvwyDc9Me4ZSSM18XnEItlu9GF
	M6nsomd1XidFGmTYj4dlXBqce5wAYXWYRHMB6wGIRBqCid/FTzVVSNAAbw8iC89QOuV6LQ
	t6fF6/4SFQFDiQfBvPhrNZZ85xHQC/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GdtQS57ysy7SA+iMSB7jdDebRaPe13gz9wjzkTQk1I=;
	b=vWdoVf7ZLntaI6egf4aTR5d48HjNV+AYzhPUQnzH2iFEIpe6RRyM62qfB8whlx03nYYyxp
	DK0Q/SlQAwsKT7Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 770F613B65;
	Thu,  1 Oct 2026 11:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T12
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 11/32] ALSA: cs4281: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:51 +0200
Message-ID: <20261001110447.486782-12-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs4281.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 27ceda6278c5..b55139a8d8bd 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1811,11 +1811,11 @@ static void snd_cs4281_opl3_command(struct snd_opl3 *opl3, unsigned short cmd,
 	udelay(30);
 }
 
-static int __snd_cs4281_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_cs4281_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct cs4281 *chip;
 	struct snd_opl3 *opl3;
 	int err;
@@ -1868,16 +1868,11 @@ static int __snd_cs4281_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_cs4281_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_cs4281_probe(pci, pci_id));
-}
-
 /*
  * Power Management
  */
-- 
2.55.0

