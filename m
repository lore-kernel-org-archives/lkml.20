Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9103DD508;
	Wed,  7 Oct 2026 17:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393962; cv=none; b=IZUZ4Z4nR2XcroiX0ehod69BXpuA9HHNmbHS0J1dPSwjMr5p6hzs167HiXv9AFAjJoj5ivQQtxPE/X4X3nrwvVh9h5uuZ4+8H8JSg3aNDtws4al8DkKXbKJNasECg8SPw0IZII/hZRvz2KO68RoHk4sWfl/eL+mhKfF075Nj5uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393962; c=relaxed/simple;
	bh=nCRr7Lyp3S/N3rgHjlCnH76obrZXUVahAe1oHxHrnIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U98TWs0IUdRUzA67xiAD0YIOEiKA/gOMR5BeZYRZHiZArSapwmvkYmpj4koKyYgZk7JyR+hz51hFWYSiyWPCoYK2Wj43V5yIbZlyAV6SgWmpxDhSoPpb6gPVTvp4uwAKr8IZidI27m/HqrYvvpJxX0WWLE4x05VCYGN2QHlPxG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bjxo1wsx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uOf/WWnE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bjxo1wsx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uOf/WWnE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bjxo1wsx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uOf/WWnE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bjxo1wsx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uOf/WWnE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 19F6D21BBA;
	Wed,  7 Oct 2026 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3fWfmzoFr8Gkq1T7WoyrE6qIvMAgOWPe7lj9mDq9GI=;
	b=Bjxo1wsxij+jnzY0T4Wx7vAnYTj4EhdSmrASRmUQNlCfYCN4hR1l3trASpxsdaif0v7dVM
	J0VEtHDVYasd3jqSTHyqTIf6FcQFyL4YDOgtBW9k4nHV+5uuOe3uswzgHJvB+wd+EZHcr6
	JFaCeEoH8EKFLevzxIlCXJspHCvf4Hs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3fWfmzoFr8Gkq1T7WoyrE6qIvMAgOWPe7lj9mDq9GI=;
	b=uOf/WWnE6TBnYpyl9pw4daAcnFKM/34ZZDVzdvwus12MUZjajR9VWkZrDimw7/gaOH9d3C
	CjN3LG0/Z3jM9VDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Bjxo1wsx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="uOf/WWnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3fWfmzoFr8Gkq1T7WoyrE6qIvMAgOWPe7lj9mDq9GI=;
	b=Bjxo1wsxij+jnzY0T4Wx7vAnYTj4EhdSmrASRmUQNlCfYCN4hR1l3trASpxsdaif0v7dVM
	J0VEtHDVYasd3jqSTHyqTIf6FcQFyL4YDOgtBW9k4nHV+5uuOe3uswzgHJvB+wd+EZHcr6
	JFaCeEoH8EKFLevzxIlCXJspHCvf4Hs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3fWfmzoFr8Gkq1T7WoyrE6qIvMAgOWPe7lj9mDq9GI=;
	b=uOf/WWnE6TBnYpyl9pw4daAcnFKM/34ZZDVzdvwus12MUZjajR9VWkZrDimw7/gaOH9d3C
	CjN3LG0/Z3jM9VDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A43BD139AF;
	Wed,  7 Oct 2026 17:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p6IPF6SAxmqXDwAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] ALSA: pcmtest: Fix leak at probe error
Date: Wed,  7 Oct 2026 19:25:20 +0200
Message-ID: <20261007172533.14667-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007172533.14667-1-tiwai@suse.de>
References: <20261007172533.14667-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 19F6D21BBA

When an error happens at probe of pcmtest driver before
snd_card_register() succeeds, we have to release the card explicitly,
but it's not done, leading to a potential memory leak.

Also, pcmtest driver manages struct pcmtst object unnecessarily
complicatedly by a dynamic allocation and release.

This patch fixes and cleans up the resource management:
- Use card's private_data allocation for struct sndpcmtst at the card
  creation, which is released automatically together with the card
- Since the allocation of pcmtest is gone, snd_pcmtst_create() is
  rather pointless, so just directly calling snd_pcmtst_new_pcm()
- Use the new auto-clean mechanism to handle the error case at probe.
- Many release handlers became superfluous and dropped

In the end we got a good amount of code reduction.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcmtest.c | 66 +++++++----------------------------------
 1 file changed, 10 insertions(+), 56 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index fea9580593e6..b4e333b4c438 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -446,20 +446,6 @@ static snd_pcm_uframes_t snd_pcmtst_pcm_pointer(struct snd_pcm_substream *substr
 	return bytes_to_frames(substream->runtime, v_iter->buf_pos);
 }
 
-static int snd_pcmtst_free(struct pcmtst *pcmtst)
-{
-	if (!pcmtst)
-		return 0;
-	kfree(pcmtst);
-	return 0;
-}
-
-// These callbacks are required, but empty - all freeing occurs in pdev_remove
-static int snd_pcmtst_dev_free(struct snd_device *device)
-{
-	return 0;
-}
-
 static void pcmtst_pdev_release(struct device *dev)
 {
 }
@@ -563,40 +549,9 @@ static int snd_pcmtst_new_pcm(struct pcmtst *pcmtst)
 	return err;
 }
 
-static int snd_pcmtst_create(struct snd_card *card, struct platform_device *pdev,
-			     struct pcmtst **r_pcmtst)
-{
-	struct pcmtst *pcmtst;
-	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_pcmtst_dev_free,
-	};
-
-	pcmtst = kzalloc_obj(*pcmtst);
-	if (!pcmtst)
-		return -ENOMEM;
-	pcmtst->card = card;
-	pcmtst->pdev = pdev;
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, pcmtst, &ops);
-	if (err < 0)
-		goto _err_free_chip;
-
-	err = snd_pcmtst_new_pcm(pcmtst);
-	if (err < 0)
-		goto _err_free_chip;
-
-	*r_pcmtst = pcmtst;
-	return 0;
-
-_err_free_chip:
-	snd_pcmtst_free(pcmtst);
-	return err;
-}
-
 static int pcmtst_probe(struct platform_device *pdev)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct pcmtst *pcmtst;
 	int err;
 
@@ -604,10 +559,16 @@ static int pcmtst_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = snd_devm_card_new(&pdev->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pdev->dev, index, id, THIS_MODULE,
+				sizeof(*pcmtst), &card);
 	if (err < 0)
 		return err;
-	err = snd_pcmtst_create(card, pdev, &pcmtst);
+
+	pcmtst = card->private_data;
+	pcmtst->card = card;
+	pcmtst->pdev = pdev;
+
+	err = snd_pcmtst_new_pcm(pcmtst);
 	if (err < 0)
 		return err;
 
@@ -620,17 +581,11 @@ static int pcmtst_probe(struct platform_device *pdev)
 		return err;
 
 	platform_set_drvdata(pdev, pcmtst);
+	card = NULL; /* probe succeeded, don't release as error */
 
 	return 0;
 }
 
-static void pdev_remove(struct platform_device *pdev)
-{
-	struct pcmtst *pcmtst = platform_get_drvdata(pdev);
-
-	snd_pcmtst_free(pcmtst);
-}
-
 static struct platform_device pcmtst_pdev = {
 	.name =		"pcmtest",
 	.dev.release =	pcmtst_pdev_release,
@@ -638,7 +593,6 @@ static struct platform_device pcmtst_pdev = {
 
 static struct platform_driver pcmtst_pdrv = {
 	.probe =	pcmtst_probe,
-	.remove =	pdev_remove,
 	.driver =	{
 		.name = "pcmtest",
 	},
-- 
2.55.0

