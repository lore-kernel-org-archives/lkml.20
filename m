Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F94E77FB;
	Thu,  1 Oct 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852727; cv=none; b=cAmpuGg0UG4wQdDYx/ejKUiHC9bkTikInCZPj6W4clWDqb4PTOH4OwV/wZBWCFzX9vUDiwbaWRlAqKdddP4R59wwNCwywx0O5lz0siMhKmAHRj1bUarCkQQx5oG9K+Mwm4c+J85Uye44SpZerjsJ+daqzxrifHJ/rh2EQv67O2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852727; c=relaxed/simple;
	bh=mBzuBE03uMVaS3t74V9KkCPIhBtG6BiQbXawWGYaew8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvpUCfPIb38PCFmhW+enzGt5eTxF05nJW0ZFzDg6HKL4W53C0iHZQhbyYonCSHUrA8B+9Pt3sICIghFOKEYL9QaBQUgkDq7iae3KnS1o+XTMamyeXAjbrY94CG0W/q3zd/E+avTrleO62+joli6ob2mWl+uqeTy1Sgp9ly1AHVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=maR55asK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3NnJA7Yi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZrG4Ikhl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0wlyDX/i; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="maR55asK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3NnJA7Yi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZrG4Ikhl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0wlyDX/i"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ADD9F21E86;
	Thu,  1 Oct 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k//qsgi65YHbPIErivpeoU9xYXL95e3FU1NIhXcITwc=;
	b=maR55asKimuz8O5D/E9liCk3kFsSqwNf0yfTaaVrudW0mf/4sIAVk+6bvSul0pT4J4TfTG
	4436KYf10iUgPtIP11nOi9mwf+R1QCZ+KKhcL8u/C982xqNCNilPvnoT1jPkJ/rz0cyM2i
	OE9BhanXfd4v5kEXlAA2wTKDkE7mAls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k//qsgi65YHbPIErivpeoU9xYXL95e3FU1NIhXcITwc=;
	b=3NnJA7YiF7xmaapNO4J51fgQAROzWC7PysGgleKQrYbxfGn4ShLFblbjAp84pIJtbItjRE
	y+GwInpqJxU2m3Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k//qsgi65YHbPIErivpeoU9xYXL95e3FU1NIhXcITwc=;
	b=ZrG4IkhlsBHiN2HFCMC8OGZfW0usazQ+hYFlBnNRKGYY52sdGwffGyDnRjrHVyya6drylT
	zncKoIcD/e2fkRvtV3HcmZoEtHRBdFADKJ+Sue/4NmMTKkMLF00NBHOvF80+gafh7LJ3OJ
	fKnIOcYoWwXaLySNaf53iFolL8Wf2k8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k//qsgi65YHbPIErivpeoU9xYXL95e3FU1NIhXcITwc=;
	b=0wlyDX/iPeOt76LEeB+x6J++OqYGAP1GNbkQ3VlcyrtufGwjInBG1TSVKlLOPqY2NCmxUU
	r/qm+z+kHGQ56YDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6338313B6C;
	Thu,  1 Oct 2026 11:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T18
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 17/32] ALSA: es1968: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:57 +0200
Message-ID: <20261001110447.486782-18-tiwai@suse.de>
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
 sound/pci/es1968.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index f04628c8cbb7..0b1c45d57722 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2692,11 +2692,11 @@ static int snd_es1968_create(struct snd_card *card,
 
 /*
  */
-static int __snd_es1968_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_es1968_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct es1968 *chip;
 	unsigned int i;
 	int err;
@@ -2795,16 +2795,11 @@ static int __snd_es1968_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_es1968_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_es1968_probe(pci, pci_id));
-}
-
 static struct pci_driver es1968_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_es1968_ids,
-- 
2.55.0

