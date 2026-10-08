Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD853CFF56;
	Thu,  8 Oct 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487570; cv=none; b=pPWD/rzwbv9MEjXJ7otnD5eJal1cWDE8d4y6Hzah58kvknS5ivJJcGlogFrvZocgH3lmOps0kiofSI1k+p997nDwGQRnP5qOwRsyR6YThFQICmijiK9oar1YpizVyqHJPpvRuJuGiHLfkup8/mqumsEPJYMJ3Psj8vH2SXKWKoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487570; c=relaxed/simple;
	bh=vJTKVMa9k++ITjlU3XGgN+fIRNu0PD0kg4NlSt0WEHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIKIlMnEwRFFy9RBArHW9A8237g4vKWsyUXiQdyHGK/3995KxrjD7ePAke0/32pPH3uZjLInSXyTmr7DIAVjF75hNTPDGE0r33dwUAAqcxrP2JOIxzfKnOyCW/9qcdGFUTJ78QckFeY+wKsCD9HSI0bdMWM3NdHEjyNzxvEgtC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A8D881F444;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ACAE1395B;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] ALSA: hda: intel: Cancel delayed work at shutdown, too
Date: Thu,  8 Oct 2026 21:25:41 +0200
Message-ID: <20261008192553.300025-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008192553.300025-1-tiwai@suse.de>
References: <20261008192553.300025-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spam-Flag: NO
X-Spamd-Bar: /
X-Rspamd-Queue-Id: A8D881F444
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [0.00 / 50.00]
X-Spam-Score: 0.00

The shutdown procedure needs to cancel the delayed probe work in case
where the probe work stalls or is slow but still possible to
reactivated.

Fixes: c0f1886de7e1 ("ALSA: hda: intel: Allow repeatedly probing on codec configuration errors")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 88b0207fde9c..2b5b5d555f2c 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2484,12 +2484,17 @@ static void azx_remove(struct pci_dev *pci)
 static void azx_shutdown(struct pci_dev *pci)
 {
 	struct snd_card *card = pci_get_drvdata(pci);
+	struct hda_intel *hda;
 	struct azx *chip;
 
 	if (!card)
 		return;
 	chip = card->private_data;
-	if (chip && chip->running)
+	if (!chip)
+		return;
+	hda = container_of(chip, struct hda_intel, chip);
+	cancel_delayed_work_sync(&hda->probe_work);
+	if (chip->running)
 		__azx_shutdown_chip(chip, true);
 }
 
-- 
2.55.0

