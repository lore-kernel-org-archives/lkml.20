Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57141503900;
	Thu,  1 Oct 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852727; cv=none; b=oHfq9Ptqd7pGtpUPgPoO1Nq5b8JdEstKQzMU80PgSALNT0s5AlEoMhjQsr64elkCdMob8Z2VZfpYdKxULKqJaGWP898nHDCwQRQ1JkuuKMUxyALCoS7vcI+0ytsEa2/1csY8bIoRzy8uZ/Tkf+KDpZoP6G/dKhmMzo8BaiAnUOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852727; c=relaxed/simple;
	bh=VQK8X+nQf3j7jEbNrHIVZx6yRmCzuWEXsP6Iw+09aks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bjk2TEPbTvqXJIYh2UxbSB8ZqAMgwjOpn6KEv3aZ+mgzmMa2YQ5TfpV4uvUpU5zaAf6KB4GQjqXRhManB9QS/0VY6pASkrlCSS/tCfkU/6/zJMR/Esj1QUdcSeEd8ZZfPHBeL5X/BkgtnkRy2+zl9OL9+cQzXAQ0MyqqfsO7fHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LpnHwPN/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U+YZkDNy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k0naYzeu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UP5QvyVH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LpnHwPN/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U+YZkDNy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k0naYzeu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UP5QvyVH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BDF3021F01;
	Thu,  1 Oct 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HnVQ2K3H7yjYE892WShKsivBVnxsOYRxcIkztuXs6A=;
	b=LpnHwPN/lepkacQCo58Ce217EwtUf78KVVVY7qfTBQPZpMSMI0EOFUENGKfSTWCfkTh813
	ZpUOuPb04PntV7a6xx9JI20PbIYc+pueE39XU2yu/knZ7yYLZ17apDXyMZFn38ecc9ClGG
	xarCGNCo9ncjNZDoXLExGgdxD27E3GM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HnVQ2K3H7yjYE892WShKsivBVnxsOYRxcIkztuXs6A=;
	b=U+YZkDNyxWGSLbHbcwDY3zBSs2JE/Ri3DNKCcgYQtiABb2siF2GToGkbtfy4XI8XwfeXkK
	f+0dd/FURTElxzBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HnVQ2K3H7yjYE892WShKsivBVnxsOYRxcIkztuXs6A=;
	b=k0naYzeuSE76+R4z2QUKG0I/b5xDiRGht8a/V+er4RF3vYVDPw51op7jG5RGmD9ntffN9R
	qWN0mjjSqp2rucch5TuDZX3VMtvj9Hsvxy00lL4uxzZwGGVcpSU1IK4iYrVfyrH1+0ekxK
	X46YYeTPF8fouVgfaKmr+oio/vVHPSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HnVQ2K3H7yjYE892WShKsivBVnxsOYRxcIkztuXs6A=;
	b=UP5QvyVH4eoBZVQJNzcvnxGRomqpqoa5SX3KTzoZyIoBZKiM/rSqKC2dpzb72BaxUxYIYg
	X7Jmn7+rBtYWbFDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8919B13B6D;
	Thu,  1 Oct 2026 11:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T19
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 18/32] ALSA: fm801: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:58 +0200
Message-ID: <20261001110447.486782-19-tiwai@suse.de>
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
 sound/pci/fm801.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 9cc96b807dd7..959cb8ce2425 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1264,11 +1264,11 @@ static int snd_fm801_create(struct snd_card *card,
 	return 0;
 }
 
-static int __snd_card_fm801_probe(struct pci_dev *pci,
-				  const struct pci_device_id *pci_id)
+static int snd_card_fm801_probe(struct pci_dev *pci,
+				const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct fm801 *chip;
 	struct snd_opl3 *opl3;
 	int err;
@@ -1325,16 +1325,11 @@ static int __snd_card_fm801_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_card_fm801_probe(struct pci_dev *pci,
-				const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_card_fm801_probe(pci, pci_id));
-}
-
 static const unsigned char saved_regs[] = {
 	FM801_PCM_VOL, FM801_I2S_VOL, FM801_FM_VOL, FM801_REC_SRC,
 	FM801_PLY_CTRL, FM801_PLY_COUNT, FM801_PLY_BUF1, FM801_PLY_BUF2,
-- 
2.55.0

