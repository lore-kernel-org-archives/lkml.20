Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C150E5A0;
	Thu,  1 Oct 2026 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852730; cv=none; b=ozN5Jj8n/kP9ovQHPLElCIJ11Uij2jpFesNLamKBkRYIgFWWCllBY69YO7bmX5QzIvbcl9iUoEXX+DmI2yTAnbbiZkAlgwpQe1jPMqXePZpPeCIU1rzFBsD29gJ3j1crmKjnuTX2o1nJfogaH4MPmE3YkmVpxjiL0e2sxNpjJcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852730; c=relaxed/simple;
	bh=w6RFi3lGLiXEekG/r5S09kmaJ+WIapsJPIbuwAj6D2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5l6Hv/WhurQDhkK79ubfCW+EL2lrYWimMtxDsnun9C8Ck4IZOuC5R3DsQYdCimN4lAu2ysjKd5AQH/JSEiBu656knw4/kYn/wlM0g61U6oBD9XBaGLy2fYtaUUAzjFXbLHBdUu50bBOxOEjCVvja0Wp9pec0PmxNWZzQBrnC2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g75ZEowk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ds6WEIws; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MoxltET5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u0lUq42f; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g75ZEowk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ds6WEIws";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MoxltET5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u0lUq42f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 856B01FD0E;
	Thu,  1 Oct 2026 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PV14hKrGptAdWZOAD0o+Zg9lJJ0qz95/mw68nMXMsvY=;
	b=g75ZEowkAs+ezAf4S8G8f2cWfSlzT5EUxHi0y3HfUj3ZsYZszhiUFlJKufJd5AnP+BU549
	OQ3YnfIptdyF4S0sBFc0DRDUJg28nVxdj/LTHEIojGwwqtlLWy/79oeyrq70ErC2E7ePGY
	tY2CLA0Qvu4sOysmKVwi26x1FZmzTqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PV14hKrGptAdWZOAD0o+Zg9lJJ0qz95/mw68nMXMsvY=;
	b=Ds6WEIwsgTNACr+S0rFGwxGFeW2K8e0LZ6UrjVeAKYSjVqrAiAR/GJYT9crCLDh8xoHdDx
	Vj6tUqEaYPjM+oAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PV14hKrGptAdWZOAD0o+Zg9lJJ0qz95/mw68nMXMsvY=;
	b=MoxltET5uvUBmIZmo+tzQ4MasxX3WlPmI78IbpVHj4IV0M3wyY7IVUPIXRl5kC4UuOKENj
	KHKUnCLTNvI697m490MKxP3gxWtARYfRF6NIHU1pyjOgLpmYThw4PW+ADBtPOBdgGEXrHZ
	PsHepoREPs9ylqKPWNRtSbcjvOQtnws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PV14hKrGptAdWZOAD0o+Zg9lJJ0qz95/mw68nMXMsvY=;
	b=u0lUq42fUlbwdSQ45nLWJNGwszffMQgUYXPQsg5q7Ao8x6Q2yuD08WRrDSk9lMDCqFKKqS
	4IrigqvADNqkJTAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C67013B77;
	Thu,  1 Oct 2026 11:04:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T29
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 28/32] ALSA: sonicbibes: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:08 +0200
Message-ID: <20261001110447.486782-29-tiwai@suse.de>
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
 sound/pci/sonicvibes.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index a885d544acd6..c44d1fe6a361 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -1362,11 +1362,11 @@ static int snd_sonicvibes_midi(struct sonicvibes *sonic,
 	return 0;
 }
 
-static int __snd_sonic_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
+static int snd_sonic_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct sonicvibes *sonic;
 	struct snd_rawmidi *midi_uart;
 	struct snd_opl3 *opl3;
@@ -1430,16 +1430,11 @@ static int __snd_sonic_probe(struct pci_dev *pci,
 		return err;
 	
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_sonic_probe(struct pci_dev *pci,
-			   const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_sonic_probe(pci, pci_id));
-}
-
 static struct pci_driver sonicvibes_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_sonic_ids,
-- 
2.55.0

