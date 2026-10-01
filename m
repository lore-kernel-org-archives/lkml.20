Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346144457DA;
	Thu,  1 Oct 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852715; cv=none; b=KPGNZX9cMkqDnDoY9vXPtRmoE7cVLFCa6IQjcp9G+tyQvx0hU45GWdPMahscMIm9fwfs+wvto29ew1kB96PwWzZ812Tp75552+7A/olGYlkpcdAeDPCFNsoNtyq7tmBkiNmQ8lQV7vHCJSk62oKWAzG2MJ39UssGTn2X5k35lg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852715; c=relaxed/simple;
	bh=Vk5c43JjmHl4DltP+uwp0eWI6U8oTez4EHnwQtvdxBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UybqP2Mw7H7F6ggpBs3UmFk1y7JoVYbXMcVcMCWr3UvaqQChKuyzi7dh70u0wSdwuWff5gCRpTlLpx2DfHogp+R+a/wK3QXbCNIuo/vPxHKq6FfqRs0fzxBOX2FSLG6v/qZGXuYkeZXhpH/IFehylTgnJaSMFRnam//JZlzPgv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hjd2oDzp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OZMxXufh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UQwroGm2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rixzJV/2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hjd2oDzp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OZMxXufh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UQwroGm2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rixzJV/2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E82701FCE9;
	Thu,  1 Oct 2026 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+134DWwLl5h+mkGDeUq3UMirOmGUghJJ6bmo9sswpZE=;
	b=Hjd2oDzpFFJLgR97F6ijQMb2EFfnX6LRNnjB8nks6TS0hX09cC37LxzG5InzX7K7B6yGuP
	GgDJB9mMRsObIAGyOMz5EmJna+VcnYyGY0IB0Z/Fxnpls7HBo1V05hQ2G/Ya0bZX5EMFre
	AXMUGZxwENy3adBN0fNBT/nzunhsIW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+134DWwLl5h+mkGDeUq3UMirOmGUghJJ6bmo9sswpZE=;
	b=OZMxXufhTLJt4L8RSdXVaN800AMYYBFUOKHmEqpR96v1ZiTH6rwikxXkkfVHUx4qn9wmst
	Hr/BQPvN2I4gOeDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+134DWwLl5h+mkGDeUq3UMirOmGUghJJ6bmo9sswpZE=;
	b=UQwroGm2i8WLEtq7Ddo6js6lBU4qx+81dzqbYPErNKCnU61xms+3WOMI2kgpDR3brkThqZ
	qk+ppA+iCtvU/eszc5JFtfYqrrBiWFvefKw5GpkG34KNK7c2u8rFTJCYI0nykMGhcA96BL
	jpFh4Lf/VILJDJDjKp2j3wjr/YJ9E+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+134DWwLl5h+mkGDeUq3UMirOmGUghJJ6bmo9sswpZE=;
	b=rixzJV/25lWWRXllCA0PnR63M0IRvUWHqTD31oQHVLSyzlJTTsz1g7hn+5c2VyaFSfQU4j
	VeMkPnFJ/wSZAtDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D236E13B61;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T8
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 07/32] ALSA: au88x0: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:47 +0200
Message-ID: <20261001110447.486782-8-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
 sound/pci/au88x0/au88x0.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index bb02945793f0..c68b1829c9cd 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -192,10 +192,10 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci)
 
 // constructor -- see "Constructor" sub-section
 static int
-__snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	vortex_t *chip;
 	int err;
 
@@ -303,18 +303,13 @@ __snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		return err;
 	// (7)
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	vortex_connect_default(chip, 1);
 	vortex_enable_int(chip);
 	return 0;
 }
 
-static int
-snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_vortex_probe(pci, pci_id));
-}
-
 // pci_driver definition
 static struct pci_driver vortex_driver = {
 	.name = KBUILD_MODNAME,
-- 
2.55.0

