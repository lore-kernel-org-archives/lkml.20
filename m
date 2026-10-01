Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230E24FE2E5;
	Thu,  1 Oct 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852719; cv=none; b=ltld5HPqNBi94Ix4ZRfikFQFnbd9Q4vtuJ3QI3Lvc6+4BKBFBDjVj++/IS4YPzayAwQKjUl+GuuCdvxHPs/HegHybqDAH013kYE1oKUKJIts9xFf5V6xRLogxLcRLYoT+iNegMLurUoFuPE+eDeACDvNdrq74Y5Y0zAyocqUWpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852719; c=relaxed/simple;
	bh=m9GgmoSwc0NLif/oQ2DXKTnqkfPCqtjMMKK/Pvdexa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pl24AqPjsnkL6QrlPgwHXuZDfxmziGE5Sf5rRdkeLZlp88ADsjw9uOJJBlTEyTy1qH/Zh4hs+Pm8Rs+lOcFpVYpOl2f95CKufTKC3NCwDPPDxCd65wQpzyc/je5eTI95jKkupnIcF+/tNXLRYVSwOGF/4Y0WYFDS70jcX+PhCmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o+cT7+jO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ibzFdxC5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yzRMnSuI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=naPyCQeH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o+cT7+jO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ibzFdxC5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yzRMnSuI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="naPyCQeH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C4C001FCF7;
	Thu,  1 Oct 2026 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C11NqvmaZNgf78BzWqSq+j54ZeMrskCKTkJD28dvaOM=;
	b=o+cT7+jOgInSWrW7e9FiTMQPweaudXLmmFb7/zQCDae2YDzb0lTVoXbJw0r7S8S500J7Hr
	Kti/vD7CDuOc2twFW9IqL3L0+BGOdwDLs8CeQdq4sOf3ONN3AU3K85sXSokqrc356EOSQc
	l5dZzv0qInbXQX1qDkym1wvXshgWPEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C11NqvmaZNgf78BzWqSq+j54ZeMrskCKTkJD28dvaOM=;
	b=ibzFdxC5mGePbNHIzmUhdALVUfHfS287K6SG5JRFiGCmIWlZmVdn2wGww2FfSTjClxDubz
	aKigmEzupFjPmvBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yzRMnSuI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=naPyCQeH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C11NqvmaZNgf78BzWqSq+j54ZeMrskCKTkJD28dvaOM=;
	b=yzRMnSuIn7l+5l/o79EclRw8M/c/igkHvtLiUy3PG45C6eNGImehprQcBIWcyTXbcB0WGr
	esRifIiODG+y3J/WEyZIlv9Bade4GEN3uOwE2+YfDRq4sfRyi8w0vrHMOeBpY+XuFaKubs
	ltBuXO88yxxP6Jx5zZKpu1y64+lFTng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C11NqvmaZNgf78BzWqSq+j54ZeMrskCKTkJD28dvaOM=;
	b=naPyCQeHf7A1Y1eWF1WOKz05VPU6XP1NcQKCtp3vhEevGUnwf6llrFL4GwwiP02pFj0alP
	V3expGSHoIo+fnDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C493A13B67;
	Thu,  1 Oct 2026 11:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T14
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 13/32] ALSA: echoaudio: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:53 +0200
Message-ID: <20261001110447.486782-14-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C4C001FCF7
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/echoaudio/echoaudio.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 8b4637231deb..93faeea688de 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1934,11 +1934,11 @@ static int snd_echo_create(struct snd_card *card,
 }
 
 /* constructor */
-static int __snd_echo_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
+static int snd_echo_probe(struct pci_dev *pci,
+			  const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct echoaudio *chip;
 	char *dsp;
 	int err;
@@ -2097,17 +2097,11 @@ static int __snd_echo_probe(struct pci_dev *pci,
 	dev_info(card->dev, "Card registered: %s\n", card->longname);
 
 	pci_set_drvdata(pci, chip);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_echo_probe(struct pci_dev *pci,
-			  const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_echo_probe(pci, pci_id));
-}
-
-
 static int snd_echo_suspend(struct device *dev)
 {
 	struct echoaudio *chip = dev_get_drvdata(dev);
-- 
2.55.0

