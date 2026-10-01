Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F250E59B;
	Thu,  1 Oct 2026 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852730; cv=none; b=P3nu3x/hgB1ylh0H17sAiMaIky+tCHl0r1LvDf8CvhYGCHCjw0I1OwiXAOEV6A66Sz56Nxa1vErKvcjyzHv4dkQVLqMWwcJ0XOe/NciqrSw1BN2ZbPEuqWBfXLWfdnwizcz2twdgix+mhKz6m+VX9WzXStn96CZVZL/xcyacDdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852730; c=relaxed/simple;
	bh=+bUYF8KeyrSfPLFSn+xmdqs+pNtEUgusCKF5Nrb62Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEqDSvHOeYQbsEpSBkyKsCy6IBJMJQIp9YT5i/xPmGbWxrsMZ5uxgz2yA0sqXwSHy97XanVQKiTPBT8coivqaXw939W2oOGS+bnnIgx1bqKhhkaABNVYyzaraT+fUKBMqmXLQ/aelhxFesadCQhYZTgVmsEL+V5yTv57fa2HuLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KENpsGFI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wx7h7HIc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TrLzCRpe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v46gUwwY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KENpsGFI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wx7h7HIc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TrLzCRpe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v46gUwwY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BEECA1FD11;
	Thu,  1 Oct 2026 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rRXZBQPFi+vI1khPd+yUq7CEw2ese74U68doLjqwcE=;
	b=KENpsGFIeSdXkR9JJVrPH+0MZfkFTqBsU5eqBkT6QRzzr7FgBHYk0zXWvUPVhZdofX7sKg
	v8z7+CvO+WAe/lTtMH+K001N+BYQ15zy49uqpyUGZYBKczDJ4BCXHEQyIae+WXJGpEu9t1
	sRZxDo0Q3lusSV0ATmiKnh9K5ukKNrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rRXZBQPFi+vI1khPd+yUq7CEw2ese74U68doLjqwcE=;
	b=wx7h7HIcPqN3aBUh7jV0ln6qv19lFe26W5LrnphLGB9H3Zn5pWX6WJIBP4ohQnViOkptLp
	CUknMspw3/vQ7rAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rRXZBQPFi+vI1khPd+yUq7CEw2ese74U68doLjqwcE=;
	b=TrLzCRpeDNTL/WZQqTUE2yW9zCOdXhufECwMza4pvV5qCO44H7x2kPwngxoVaFPXovCMfU
	C/IfX0B2NxkLeg4A8YQ8+YuftZIO/xPE2oMQ3/Fmc1CyBVMmF4+m/mcW7UM4oxs2GK2lwy
	JEK57eAir2QNFMtnnMBBG5ynJbTQeBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rRXZBQPFi+vI1khPd+yUq7CEw2ese74U68doLjqwcE=;
	b=v46gUwwYmETcHcP05PXjFQus0Djtf7AjtM+XQ8WVxNY6sLnxhN79858rkxR0lQ5xe2vMQg
	pTgAzAxLhwaS9sAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40D7F13B78;
	Thu,  1 Oct 2026 11:04:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T30
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 29/32] ALSA: via82xx: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:09 +0200
Message-ID: <20261001110447.486782-30-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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
 sound/pci/via82xx.c       | 13 ++++---------
 sound/pci/via82xx_modem.c | 13 ++++---------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 58816dea4996..5638d0088fb9 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2428,10 +2428,10 @@ static int check_dxs_list(struct pci_dev *pci, int revision)
 	return VIA_DXS_48K;
 };
 
-static int __snd_via82xx_probe(struct pci_dev *pci,
-			       const struct pci_device_id *pci_id)
+static int snd_via82xx_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct via82xx *chip;
 	int chip_type = 0, card_type;
 	unsigned int i;
@@ -2536,15 +2536,10 @@ static int __snd_via82xx_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_via82xx_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_via82xx_probe(pci, pci_id));
-}
-
 static struct pci_driver via82xx_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_via82xx_ids,
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index b32f84ac17cc..f4475d288a82 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1088,10 +1088,10 @@ static int snd_via82xx_create(struct snd_card *card,
 }
 
 
-static int __snd_via82xx_probe(struct pci_dev *pci,
-			       const struct pci_device_id *pci_id)
+static int snd_via82xx_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct via82xx_modem *chip;
 	int chip_type = 0, card_type;
 	unsigned int i;
@@ -1139,15 +1139,10 @@ static int __snd_via82xx_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_via82xx_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_via82xx_probe(pci, pci_id));
-}
-
 static struct pci_driver via82xx_modem_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_via82xx_modem_ids,
-- 
2.55.0

