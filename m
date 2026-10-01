Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563594ED1A9;
	Thu,  1 Oct 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852726; cv=none; b=PG/YWqfhD/BjynCpOLOAhzmLuxutO7/ke6mGUqMGZzWQM2RRC5R5MYHGqy7Ohg8VpoFPNDYBM2yDBiit1YegHSMGRiyy1Ce086YLbPIdYcX3wPc9yxBBVRLUFjbSJ48aCp8q7aXD5nWktnSTVHVDWT7Xm3dFiajjP+rSHxc2npc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852726; c=relaxed/simple;
	bh=mtLOB0Pa9v7p1yXwGZJXWpqSnYBWXBF0xwdKE6+nboo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POo7H6nsVgXllIeDmcnctsW98NlPlWu/e+3BJDHiFeYN0fdrvrQoE+gY8y+8KaFMaJZfZrmmEopcsRcU5Xm5ymFV0D+6sTX4IFbxdsWMHvj95K4vbsjkdSM92MfTLUN+e4EZ1RbOp/rjQa3ASNQbCWeTzAOjPzmSzJ5WutgR0cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=whRDCXUG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CoJXMuOO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MkXBbZM6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SIo4Eb+n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="whRDCXUG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CoJXMuOO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MkXBbZM6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SIo4Eb+n"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8ED4921E04;
	Thu,  1 Oct 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWKehKlUZoBXRCcKq4jwTGfpR85iE4e1USMxWto4Txw=;
	b=whRDCXUGCcxOJslZ1Mpp2uDy+6WOCTARAKh7RmbygYG3XIBuYH918aqqlUKy7G8Otby8/Q
	/+EvY7U3/8ZaYzM99Lrav0YUpgCXgGz0Ph6ldq21EE3+iZBwk3HtBnYWXCEDR0WfiLoReI
	ZRiTR79ANlNk3O8AO/EZMYLzYWPtr5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWKehKlUZoBXRCcKq4jwTGfpR85iE4e1USMxWto4Txw=;
	b=CoJXMuOOLYAb6URICKQlzhSlc/Jf5YoQmQzB9kUqv/9UtzCwBkkzW1erUjcqiExsd1uaPK
	JIRVAc4TfPCmPODg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWKehKlUZoBXRCcKq4jwTGfpR85iE4e1USMxWto4Txw=;
	b=MkXBbZM6BwiQVrEs0ic7YPXcLb1D3yeFkFN2WJ+vU+esx3GreKIXByflSdOZzkCc0xUbX5
	+OxHM3vkBQvX/PLge1Az6vGf1eUOdnRhDVY55DhI1SrOeCYdUJ/q0Fk6NvvxuDfdz3KQVa
	c35aS+y6a9yJJgO/Haz755DzlFmIzNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWKehKlUZoBXRCcKq4jwTGfpR85iE4e1USMxWto4Txw=;
	b=SIo4Eb+nEIBdqL3O4InnWgVS7fwcRS9Mq7RB4Ux9swlX9wfRiTsAVEhhMgUZBic/RN5kpW
	TJen8rXVTkS4yOBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F74F13B6B;
	Thu,  1 Oct 2026 11:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T17
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 16/32] ALSA: es1938: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:56 +0200
Message-ID: <20261001110447.486782-17-tiwai@suse.de>
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
 sound/pci/es1938.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 217beb9376ac..a1ceb49d572c 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1683,11 +1683,11 @@ static int snd_es1938_mixer(struct es1938 *chip)
 }
        
 
-static int __snd_es1938_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_es1938_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct es1938 *chip;
 	struct snd_opl3 *opl3;
 	int idx, err;
@@ -1759,16 +1759,11 @@ static int __snd_es1938_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_es1938_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_es1938_probe(pci, pci_id));
-}
-
 static struct pci_driver es1938_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_es1938_ids,
-- 
2.55.0

