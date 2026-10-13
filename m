Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E7502D45;
	Tue, 13 Oct 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898319; cv=none; b=W2A5LQROEskDEGmOkBFj1I64ZtRFWdNb9txfR47hT17B9xWxvQYpcoFug4HvH8KcKqaJG9CW/NOtOhoeutZ8nZpA+boc5YjAzO3Dyw0oqY/jHhFV2Xnta5yLq9l+sQIP29cmEntUIEnhZc15bKOopALjKYUHc8OM99MZWi/nEtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898319; c=relaxed/simple;
	bh=3PMrCxTsFdEB0QmEh0d8jdwAQmE5xnKubbmVdmUf/1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=alsmi7vDZDTA3tARyzClPjcCJpSmxXq7TSKJ2wqpTwN6dNXRdGenMPiISQm/89/Qrxf0rxIm5HKQ23NM+uTHfUaTbl+835V8eIphKV+CUFGLf2NE1KWtBBrY0OqsWAnRailfKf6YC8CTMbKP1YHxNlmK+ZSI1N+B7ZxuwodTe8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TjP6qolo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GxV7NL3P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TjP6qolo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GxV7NL3P; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TjP6qolo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GxV7NL3P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TjP6qolo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GxV7NL3P"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 090D11F770;
	Tue, 13 Oct 2026 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791898316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/M52LAxe1L3yHV8T6gWqcS0zFKfyk9on+E5bzlgeDIs=;
	b=TjP6qolo2tZmMXRPvPHWnRdIF2ZRMGSfoMsklr+7sGJrxVVPfGMuftx0tWOXfZGBtah0AM
	vqT8c6EBffYrnmG0X7ABDYNm2tJRl9fjstyiiR1d+SQNqfBrW9gW8sodHN5fMV03J2pQCw
	qmsaZ3KNgBFsSwJA6LIngmlLjUSE04U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791898316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/M52LAxe1L3yHV8T6gWqcS0zFKfyk9on+E5bzlgeDIs=;
	b=GxV7NL3Pc3xyptvTsCS8lePFv9lbB8iir3zR8rclLo502h5lcN5Topsu+yZiX75poQVzDa
	j0Dsdff0B4wvwhAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791898316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/M52LAxe1L3yHV8T6gWqcS0zFKfyk9on+E5bzlgeDIs=;
	b=TjP6qolo2tZmMXRPvPHWnRdIF2ZRMGSfoMsklr+7sGJrxVVPfGMuftx0tWOXfZGBtah0AM
	vqT8c6EBffYrnmG0X7ABDYNm2tJRl9fjstyiiR1d+SQNqfBrW9gW8sodHN5fMV03J2pQCw
	qmsaZ3KNgBFsSwJA6LIngmlLjUSE04U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791898316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/M52LAxe1L3yHV8T6gWqcS0zFKfyk9on+E5bzlgeDIs=;
	b=GxV7NL3Pc3xyptvTsCS8lePFv9lbB8iir3zR8rclLo502h5lcN5Topsu+yZiX75poQVzDa
	j0Dsdff0B4wvwhAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A017C134C3;
	Tue, 13 Oct 2026 13:31:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9Wp9F8syzmq3dwAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 13:31:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda/intel: Clean up error handling in azx_probe_continue()
Date: Tue, 13 Oct 2026 15:31:51 +0200
Message-ID: <20261013133153.78225-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013133153.78225-1-tiwai@suse.de>
References: <20261013133153.78225-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

As all callers of azx_probe_continue() pass false to free_on_error
argument after the recent fix fbaccb1b19c7 ("ALSA: hda: intel: Don't
free card in the probe work"), just drop the argument and the
superfluous condition.

While we're at it, move the error handling around out_free label to
the tail of the function, in order to make it clearer as an error path
by renaming the goto label to "out_err".  Since the error check
becomes redundant there (as it's only for errors), drop the err check,
too.

Only code cleanup and no functional change is expected.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 36 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index b67d569fc859..2d9c2c3bc028 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1184,7 +1184,7 @@ static const struct dev_pm_ops azx_pm = {
 };
 
 
-static int azx_probe_continue(struct azx *chip, bool free_on_error);
+static int azx_probe_continue(struct azx *chip);
 
 #ifdef SUPPORT_VGA_SWITCHEROO
 static struct pci_dev *get_bound_vga(struct pci_dev *pci);
@@ -1211,7 +1211,7 @@ static void azx_vs_set_state(struct pci_dev *pci,
 		if (!disabled) {
 			dev_info(chip->card->dev,
 				 "Start delayed initialization\n");
-			if (azx_probe_continue(chip, false) < 0) {
+			if (azx_probe_continue(chip) < 0) {
 				hda->init_failed = 1;
 				dev_err(chip->card->dev, "initialization error\n");
 			}
@@ -1738,7 +1738,7 @@ static void azx_probe_work(struct work_struct *work)
 {
 	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
 
-	if (azx_probe_continue(&hda->chip, false) < 0) {
+	if (azx_probe_continue(&hda->chip) < 0) {
 		hda->init_failed = 1;
 		complete_all(&hda->probe_wait);
 		snd_card_disconnect(hda->chip.card);
@@ -2360,7 +2360,7 @@ static const unsigned int azx_max_codecs[AZX_NUM_DRIVERS] = {
 	[AZX_DRIVER_TERA] = 1,
 };
 
-static int azx_probe_continue(struct azx *chip, bool free_on_error)
+static int azx_probe_continue(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	struct hdac_bus *bus = azx_bus(chip);
@@ -2385,7 +2385,7 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 
 	err = azx_first_init(chip);
 	if (err < 0)
-		goto out_free;
+		goto out_err;
 
 #ifdef CONFIG_SND_HDA_INPUT_BEEP
 	chip->beep_mode = beep_mode[dev];
@@ -2397,7 +2397,7 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 	if (bus->codec_mask) {
 		err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
 		if (err < 0)
-			goto out_free;
+			goto out_err;
 	}
 
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
@@ -2412,7 +2412,7 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 		} else {
 			err = snd_hda_load_patch(&chip->bus, fw->size, fw->data);
 			if (err < 0)
-				goto out_free;
+				goto out_err;
 		}
 	}
 #endif
@@ -2428,13 +2428,13 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 				return 0; /* keep things up */
 			}
 			dev_err(chip->card->dev, "Cannot probe codecs, giving up\n");
-			goto out_free;
+			goto out_err;
 		}
 	}
 
 	err = snd_card_register(chip->card);
 	if (err < 0)
-		goto out_free;
+		goto out_err;
 
 	setup_vga_switcheroo_runtime_pm(chip);
 
@@ -2449,24 +2449,18 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 		pm_runtime_put_autosuspend(&pci->dev);
 	}
 
-out_free:
-	if (err < 0) {
-		if (hda->vga_switcheroo_registered)
-			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
-		display_power(chip, false);
-		if (free_on_error) {
-			pci_set_drvdata(pci, NULL);
-			snd_card_free(chip->card);
-		}
-		return err;
-	}
-
 	if (!hda->need_i915_power)
 		display_power(chip, false);
 	complete_all(&hda->probe_wait);
 	to_hda_bus(bus)->bus_probing = 0;
 	hda->probe_retry = 0;
 	return 0;
+
+out_err:
+	if (hda->vga_switcheroo_registered)
+		dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
+	display_power(chip, false);
+	return err;
 }
 
 static void azx_remove(struct pci_dev *pci)
-- 
2.55.0

