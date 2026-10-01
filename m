Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDE409285;
	Thu,  1 Oct 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852706; cv=none; b=X/taBKW418VSJtYI2Jqa3TAyBL8Mo8vJOruPkx4ubiEe4Y1qCsyHsqOJIMbEOnNi2PI+OyORxBn8s6FgaZqcy3/c+YGJBRvN5/KFbmXVy71Q5OUFHlyBfRfNTzckZ7HlftVXVb/RE3oslIm07Sptki6SH5DLMdKmzwvbb4biLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852706; c=relaxed/simple;
	bh=SWZ9332D3SIML/Gg4QOrjs//8vU3Wv/SQi1St7pUNSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmvV+DTf6NVLCsQlB6rK+SC0u6Rwa6suWLJvzyu7dZ9+zxbdFSTt4zne/aBq+7Coi7d+G2fhgYMUwkO3cqcM7wI1whTyVxRtuVPw9eKFr88c/pP4t2qsvAkIlhuvoaDbpH9Bx6kCublJ+2ojU3Pfzql7PLVwKROhYZlK/O9xFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pvssm3Sv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XnyqTqvQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0aCgssXH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ambfFOD9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pvssm3Sv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XnyqTqvQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0aCgssXH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ambfFOD9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C944B21F16;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xizh7diQizbMKlxG/XNGUAebIPJJqVVH06ekWh/L3S0=;
	b=pvssm3SvyF7hdJ9n13yHyTcHPrEFAlVyQ/RGyp8j0g3RKmqkMcz3b4itUsI/fVfqc+QJ0g
	1fPloiXY1l1FvDCKG2zdSge1BRp0fK9iZaRLMxShL5yug19PLmqvgcpKxr8UYCvmQ10lVn
	odZmnvGYz+oFZXFMlRy18L3zrV3WVVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xizh7diQizbMKlxG/XNGUAebIPJJqVVH06ekWh/L3S0=;
	b=XnyqTqvQYQWt/hL8bf4RIsHPXpWkqwE9ZujznCzYCctEWLGH8VsQu2oqbFJrbgqOIj2wXO
	9awls8ND/bFJdHDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xizh7diQizbMKlxG/XNGUAebIPJJqVVH06ekWh/L3S0=;
	b=0aCgssXHujBUf2cUTkHQfmeWaROa0pYDg43ARKbcDIly8adFEzi+LyUS21OKDTMonsv5ZA
	bHzvgmTaQH6vikukRBW56+Rv9fTPVLXry1WKTBQvocsyVBV0kJwzHukvtKVoelKCFELq6u
	EBo3EjyhJLb1IQDNr7/fiQ9EduIgUwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xizh7diQizbMKlxG/XNGUAebIPJJqVVH06ekWh/L3S0=;
	b=ambfFOD9mdO3xeqc/g76IjGPwH4vBucxHTt3vCR8KYMubVwbqPrBRyZuTEFLe7u4ZZT7aw
	RmEyQTgQufKQKCDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6084813B5E;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 04/32] ALSA: ali5451: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:44 +0200
Message-ID: <20261001110447.486782-5-tiwai@suse.de>
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
 sound/pci/ali5451/ali5451.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index f07c5f4c2380..9d1d57c718d0 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -2086,10 +2086,10 @@ static int snd_ali_create(struct snd_card *card,
 	return 0;
 }
 
-static int __snd_ali_probe(struct pci_dev *pci,
-			   const struct pci_device_id *pci_id)
+static int snd_ali_probe(struct pci_dev *pci,
+			 const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_ali *codec;
 	int err;
 
@@ -2129,15 +2129,10 @@ static int __snd_ali_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_ali_probe(struct pci_dev *pci,
-			 const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_ali_probe(pci, pci_id));
-}
-
 static struct pci_driver ali5451_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ali_ids,
-- 
2.55.0

