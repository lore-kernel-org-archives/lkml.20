Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBC2409285;
	Thu,  1 Oct 2026 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852714; cv=none; b=hdxHgzU9RER5Hblxcb4lfVmcL3N58HiKwcCP5yPxBOFqmC3jjChmiMb/bqTEFT7jGUkMssVG7I54BiS++IfDZFvY58u7hsSR/HSZIddfz/OKWNyPU/ZzPdHPsLnnq74j1irAd2WZccG8Cc+weXXdoI7erXonKgVL/F277hoIx30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852714; c=relaxed/simple;
	bh=wxECPHv1FeKhWIFj6Td2MSRq69tK9Do1LTLBo+79Z2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZk3it96c3rMcX0Iq2cl1jR+1v426Zygo/An95/pkP++bXGJLHYFPVLEa8Uw3fnN4PVlifqC5+IoKdw7YvEcdyIbU8Tt0jswuh5+dGVYfumSv3twbWIEIbu2TGIXhOqT1ZVzjvGI2HHP6gVtyY147fEoXdggZUUjrbQnFDiHEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jbyvpo8L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b4w2GEIW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AvGUqKAi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B4N2EqWs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jbyvpo8L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b4w2GEIW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AvGUqKAi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B4N2EqWs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D3C7D21F2F;
	Thu,  1 Oct 2026 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxyOSearmYRZNp3hHXYVVaPBbvHLF14Y6XmnRZUqsjc=;
	b=Jbyvpo8LdTiaLRAGY4c07yTUN5/X2LqquFCaYVZgByT2Pp9m8MxCHuoTVCN5AYKZRuMIuJ
	cVGMgvTt9V4oZavtb9kfqW+xNs9QIw/dYVvcvYrZbHnGovopJcLip/qoAWAZIk8mfymYo1
	jFqcqIJUwgVWy28S2wiKocYvAZSLKUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxyOSearmYRZNp3hHXYVVaPBbvHLF14Y6XmnRZUqsjc=;
	b=b4w2GEIWPV/sEiSvpjfivH7Oufia9bfATj0WWHYQO2qpbvpUewZqSmTvDL2IBcj40IsZo5
	ZvwJjxKIBfF6HUDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AvGUqKAi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=B4N2EqWs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxyOSearmYRZNp3hHXYVVaPBbvHLF14Y6XmnRZUqsjc=;
	b=AvGUqKAi5ismtDngIT3JeXH0vdZkRYT40ssIq/Y1MGgB5xOKGT4SLTrK1f3q0BviTWEomv
	ShYhmCR0POgR62k3EBjlHYvqKpCiCNhbhTztOnaGNhfMe2KoTyaS0EDS4uuYXoDiJZ6v1c
	cBO/e1Fp5h+J4PnNM1RP8E8xccx+Lng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxyOSearmYRZNp3hHXYVVaPBbvHLF14Y6XmnRZUqsjc=;
	b=B4N2EqWs0Xdi/6NTT9yCA6iVcylLJg3HjwaQGisOwXqYuTL0R6V59mnlmzP1icXZh9nY4z
	svsrZFDVR+OX8rDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8568213B5F;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 05/32] ALSA: als4000: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:45 +0200
Message-ID: <20261001110447.486782-6-tiwai@suse.de>
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D3C7D21F2F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/als4000.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index 6396aa6c3bf0..7475ae009851 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -798,11 +798,11 @@ static void snd_card_als4000_free( struct snd_card *card )
 	snd_als4000_free_gameport(acard);
 }
 
-static int __snd_card_als4000_probe(struct pci_dev *pci,
-				    const struct pci_device_id *pci_id)
+static int snd_card_als4000_probe(struct pci_dev *pci,
+				  const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_card_als4000 *acard;
 	unsigned long iobase;
 	struct snd_sb *chip;
@@ -918,16 +918,11 @@ static int __snd_card_als4000_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_card_als4000_probe(struct pci_dev *pci,
-				  const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_card_als4000_probe(pci, pci_id));
-}
-
 static int snd_als4000_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
-- 
2.55.0

