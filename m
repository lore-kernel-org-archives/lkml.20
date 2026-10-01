Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8BE503918;
	Thu,  1 Oct 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852727; cv=none; b=rtsuaYd/SQblUNLD5PVZ5XL5yNo1ie1assAmm502ylBpmFYrLmpj4aB3HKuZjbdfaTxYxqZkGL17GU6eETVaAEzK7Jrj3tfdpKq7+wVlEiv1dtFD2w1dxnu6u+95nNedn2nvy+Ca2okj0t9FDGZKBJoNdgEbgEV8Gs29sLbvl8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852727; c=relaxed/simple;
	bh=68p1dPShdiSSVIyPFrPCz+W6V/jFc+uXaDkazU2SNOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TV73XCJmwaQ7p5oLdNscYDsJD21bDfqt2ISK9PLxepVDa3d5rvveACxwCXCpppLc/x8okySsHiL4pyHYh0RpK6FZ5QbFbNOmAjz+9OkYFwtF0AuW0VT8FGze/vqyHsXqDfJzNksFOqr6H/xwre4lf3Nr+aguHm/jn0CXVAddyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rnDHYMyD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ruyw4iXM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BWmuL5Zp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TdVQ27ZN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rnDHYMyD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ruyw4iXM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BWmuL5Zp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TdVQ27ZN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E10131FCF4;
	Thu,  1 Oct 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDFNNP4jp5YleG3LNVPDb+4QG1/HJbq38yV/oknHpW0=;
	b=rnDHYMyDozT0/d6zzJ/Bhq2wyYQDZ3yaYX0OpgZzJDNwEiys7zs3P3dCDF0TCPx5qH7ZYu
	cIcHgXM9SvR5UJeRD3EFwQvHQExFTP1nbscR3DiUXfCSScEHJdVuDV4uAmZ/u6AJY4EZx9
	P4ikhxhDvvyNvDVlbuY+gN1RKMjgKSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDFNNP4jp5YleG3LNVPDb+4QG1/HJbq38yV/oknHpW0=;
	b=ruyw4iXMJSNG7AZmx20vSA9jHgtIuWjASuXDvTQ2/pdsR2Vkfj+1TRhcIKtjnmKMMaj9Fx
	Ona3PFbJY5smiqBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDFNNP4jp5YleG3LNVPDb+4QG1/HJbq38yV/oknHpW0=;
	b=BWmuL5ZpJD2quUjzZ2QCdPHR0QI4aJX0xQ5eC+GIj5ogjYvJ5VvNk5RL2dVE2BRVARtzuV
	rQVe1vEZw3e3S4z7/9CFDs/m0hX+TbZJLyw5OJyNRr7VYal+FKmAozFe0EuBQsu+9m8l4N
	66nH8ehEnV9XTEn00R+peZj95hIinBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDFNNP4jp5YleG3LNVPDb+4QG1/HJbq38yV/oknHpW0=;
	b=TdVQ27ZN66JrGEM1DJMtzYF4zEmBY7S9cw4UGhWNKhbif+BBt8N0jJX3S61F0ew2jHDiuW
	3AGd27O/HK+X5WAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D45A813B6F;
	Thu,  1 Oct 2026 11:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T21
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 20/32] ALSA: intel8x0: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:00 +0200
Message-ID: <20261001110447.486782-21-tiwai@suse.de>
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
 sound/pci/intel8x0.c  | 14 +++++---------
 sound/pci/intel8x0m.c | 13 ++++---------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index e2ea9016a73e..fb021b65729e 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -3167,10 +3167,10 @@ static int check_default_spdif_aclink(struct pci_dev *pci)
 	return 0;
 }
 
-static int __snd_intel8x0_probe(struct pci_dev *pci,
-				const struct pci_device_id *pci_id)
+static int snd_intel8x0_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct intel8x0 *chip;
 	int err;
 	struct shortname_table *name;
@@ -3244,13 +3244,9 @@ static int __snd_intel8x0_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
-	return 0;
-}
+	card = NULL; /* probe succeeded, don't release as error */
 
-static int snd_intel8x0_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_intel8x0_probe(pci, pci_id));
+	return 0;
 }
 
 static struct pci_driver intel8x0_driver = {
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 27dbf6125427..a84436d60937 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -1218,10 +1218,10 @@ static struct shortname_table {
 	{ 0 },
 };
 
-static int __snd_intel8x0m_probe(struct pci_dev *pci,
-				 const struct pci_device_id *pci_id)
+static int snd_intel8x0m_probe(struct pci_dev *pci,
+			       const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct intel8x0m *chip;
 	int err;
 	struct shortname_table *name;
@@ -1262,15 +1262,10 @@ static int __snd_intel8x0m_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_intel8x0m_probe(struct pci_dev *pci,
-			       const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_intel8x0m_probe(pci, pci_id));
-}
-
 static struct pci_driver intel8x0m_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_intel8x0m_ids,
-- 
2.55.0

