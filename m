Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6A4EFFDC;
	Thu,  1 Oct 2026 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852731; cv=none; b=pPJmEzj9d0OZpHZ6dYTk12pQybjan4z5psvBY4ugrCKbRPw4NGzlq+FLYQeANrZJFdVdr+MVeWIhQWe1rvluVG6g9H0JiB5BvVIbnystBOOXj40AmIwMhvhOEoa6SPd5/WoJWpNPwGbGqrkZzhlvUOcPGsuhO380qasDrWoTPGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852731; c=relaxed/simple;
	bh=Pptj2J2Ra4jk46KTPcf4p302lh/HWCn5QOGM7Iz0m9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgWWeWdVS5G/OOFJbEzNobBx+ec4AzPWmFar2RVn1uU2vmFUFanVcdkPU23Zcg6ff55nQo+ulJjF/TBkGu+4n1xEux/D91eZTyJD+XT5/yL54O3QvekzMESLtxUj8B9iPY09CUICtC2F/ZqzvYfItJ531dYxNI4se0eSKuTcr9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wG3L/ssi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w1MPChaZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wl8DdUy7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QFCkJIL2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wG3L/ssi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w1MPChaZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wl8DdUy7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QFCkJIL2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0F0191FD34;
	Thu,  1 Oct 2026 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QMUvvXs3mbnv53gf7bUZXeybg6Q6XUqq2EIOzFaIwk=;
	b=wG3L/ssiGXI1H8rPgjPtCapC5eWvAdH63n/wp17wz6mx8KDPKt+mV4iUmm8JWFZB68/Azk
	ax4VGKDbwSRdGh4aQZ5LLAa7vB+kbvtg+yhaekhKZtNYORdJU9b8x7b+uVgslLW4vLs9km
	qq5KsJ5mjUqIWrpT7eqx+um5IPPB1A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QMUvvXs3mbnv53gf7bUZXeybg6Q6XUqq2EIOzFaIwk=;
	b=w1MPChaZsou9lUOveyQvj1XBc9gq+gV2IA0addssUG+Wx/hgOHbHQM/Jjqen3jmbKke+x6
	STT2F699WOsG1yAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QMUvvXs3mbnv53gf7bUZXeybg6Q6XUqq2EIOzFaIwk=;
	b=wl8DdUy70WnnqO0ORuDnH0ByLudcj2ebdDsD7Y0zA8qaJn9jR1raYL2NLKP0cGDKt8RQfg
	Nv/JPF9ePQzIj6t74m9hVOx/ouIPb+9onG4o/os8yQakeAHu8fRfWXUJud7OuDskSRPQQs
	qFRmheOsIj6IV9zvidIzbSgTNoTZEbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QMUvvXs3mbnv53gf7bUZXeybg6Q6XUqq2EIOzFaIwk=;
	b=QFCkJIL2Cp5R5VAy0LO1LzeQ/5WNra6yop4Xz5wZVEL7ylwpfVVUYxlwWtWtXcvbMpwPmr
	Ea+WvT7IVDZa7vBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6491213B79;
	Thu,  1 Oct 2026 11:04:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T31
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 30/32] ALSA: ymfpci: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:10 +0200
Message-ID: <20261001110447.486782-31-tiwai@suse.de>
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
 sound/pci/ymfpci/ymfpci.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index d3fb047c9a45..42c7f85aa618 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -152,11 +152,11 @@ static inline int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev, i
 void snd_ymfpci_free_gameport(struct snd_ymfpci *chip) { }
 #endif /* SUPPORT_JOYSTICK */
 
-static int __snd_card_ymfpci_probe(struct pci_dev *pci,
-				   const struct pci_device_id *pci_id)
+static int snd_card_ymfpci_probe(struct pci_dev *pci,
+				 const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct resource *fm_res = NULL;
 	struct resource *mpu_res = NULL;
 	struct snd_ymfpci *chip;
@@ -344,16 +344,11 @@ static int __snd_card_ymfpci_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_card_ymfpci_probe(struct pci_dev *pci,
-				 const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_card_ymfpci_probe(pci, pci_id));
-}
-
 static struct pci_driver ymfpci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ymfpci_ids,
-- 
2.55.0

