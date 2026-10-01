Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7A503BD3;
	Thu,  1 Oct 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852725; cv=none; b=csF0JWXZ/iVZdFpqbORhtOUqkOIEoVYdm6sTaE33iCiBk+Fh9pax+ynaSVKEQOx8OmMLnAeUQAl7O6MIe10dE4zBGGO+Z8fxyJTM3RU/ku74o7Apfx66k/HxgvIAkuAQgCBaXSkCmgk0PFSBgpU+qsVfsN4Zonu4w6WwBXNCNOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852725; c=relaxed/simple;
	bh=5DynP7MzVydIb58vhI03GUYOC8+Oi2ngWXRzsEUb9jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cs1kNNFFbMZRn4DjjEa7Pe7bxeHFxHtPFarDgNwqiuBcZbKYfHln7aSdLxrCu5t4i/8Jn+SM2LKgtlwEmZfkfptUTN9/czf3QPF2kOY6YA33Wk1gzUMG9TSbhqpoVxe5zvqgKGOGCvKpVZFrB/caBtVxv51MjP1DMdXxuLFE1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P8z9nqTN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wA9NhQPA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tBgQCO8R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8/5yqWcs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P8z9nqTN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wA9NhQPA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tBgQCO8R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/5yqWcs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC9461FB45;
	Thu,  1 Oct 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M53UF5iypyIYbvgXzknwAXHYlV3TSuZiWSJBan7hJIo=;
	b=P8z9nqTNv+Wr894GvfGzr4cdoJTTRsqky8HowPqn8xOoHMc3ZSKGI0AC0vOTmQPMwkqm0S
	GGRlOtt2xtnpGic2p9z92KSMQHoLXgYPb3auyfRbK627jJrJmWAm5fazkDVHHtRMexhnN5
	v7iXoWNGV6oOWiZH+/BUFRzotI7yx2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M53UF5iypyIYbvgXzknwAXHYlV3TSuZiWSJBan7hJIo=;
	b=wA9NhQPAHLdOHDvuIyQES21s4vU/AtqzRCfoJpiwJ0olnipI30+JfIVBhHNJgxljpdypii
	yLCgSIl1nfHv+LCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tBgQCO8R;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="8/5yqWcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M53UF5iypyIYbvgXzknwAXHYlV3TSuZiWSJBan7hJIo=;
	b=tBgQCO8RMR6qhdT/38/km87pjIyMtm+RtVgTvr0cIkx88imI7Lm4Lo4inJ8yl2SvXdWCoR
	DkgCISA8WNARCPm6Lr0CIR9+G3DMihFqnlGfg0Iz9jwq0aWnXKqf75/bt1C7cBrp2J82H0
	+s/i8FZAROmH7Rg/5cBcDIHGUWnfzBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M53UF5iypyIYbvgXzknwAXHYlV3TSuZiWSJBan7hJIo=;
	b=8/5yqWcsWbkTMPnhL9cYL+mYjP8o/Tzr5KIAm6/wb5vCxG8QViJzCZhJpLo3pfoECpIhHm
	Qg/ukIMy0FWK6nCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE3F613B6E;
	Thu,  1 Oct 2026 11:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T20
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 19/32] ALSA: ice1724: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:59 +0200
Message-ID: <20261001110447.486782-20-tiwai@suse.de>
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: BC9461FB45
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1724.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 859bb87393b4..dc62ee1aa8af 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2524,11 +2524,11 @@ static int snd_vt1724_create(struct snd_card *card,
  *
  */
 
-static int __snd_vt1724_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_vt1724_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_ice1712 *ice;
 	int pcm_dev = 0, err;
 	const struct snd_ice1712_card_info *c;
@@ -2663,16 +2663,11 @@ static int __snd_vt1724_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_vt1724_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_vt1724_probe(pci, pci_id));
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int snd_vt1724_suspend(struct device *dev)
 {
-- 
2.55.0

