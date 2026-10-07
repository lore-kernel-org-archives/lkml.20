Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FDB418361;
	Wed,  7 Oct 2026 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791412498; cv=none; b=d7bBRk6cXAvkbU7yBYh3J9YMTrfEgqWrOkDeCV7k+M2CZRahcaYTwbqNCIhDRgKxAmgMlMgdMjng/X1CAL0l9sx1aVwn5N07ZESDrQwXGWqVbTUi+H6xYX0cSP5fQ+3NH0PTJDZiRcOGHbiAcPOPB+JW8LTPG0y+UUZAE1Qhka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791412498; c=relaxed/simple;
	bh=6q3/pukp2WjRqP/L7/Z/7q8iUAI3OZTG0blnUKIcUkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4xbwbV77sYr+nkOVvbG/af0+xrFhqL3NCchq0rR8JqsjzMR3VGY6aoM7o9hRbsvGqvdgy5Xsg5fWJud7LiMkzLPf4O+CNvYXFoMywXmLy9HCCYxoSdiTfyla9P6rMZC7oiEP5etYIO5a4V2GdNR0on7Nxe9Um/h/C62ipx2yxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZdjPKJdu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r01nj3MX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZdjPKJdu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r01nj3MX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZdjPKJdu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r01nj3MX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZdjPKJdu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r01nj3MX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B6A551F74C;
	Wed,  7 Oct 2026 22:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791412494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9lJ8PC8L3JVbKUvMsYDSYiY2ZaxjDojz3sqZtTpqp9o=;
	b=ZdjPKJduHR0kQKA9iOFu/wqXrtxYNT8D98ep2OHjskI2iMWmdMhJM+xlwXi2a2UTpR7ncJ
	5qpNljc9wIr5zle2TXgqGUDtOkoqVXcCpDgnKyudqLAVhqCIhc1QglXl3NViHia9QnY986
	vmuA5FDzVrA/1dJMrh5MzkpP/1jGSS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791412494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9lJ8PC8L3JVbKUvMsYDSYiY2ZaxjDojz3sqZtTpqp9o=;
	b=r01nj3MXYpAYQK0UrTC8QqaBQ6ZGeNRQOqNfWIW54liTQDYF7/+jJWYlUjkitohtzG37Tf
	Jem4WOxFd+HNN5BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZdjPKJdu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=r01nj3MX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791412494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9lJ8PC8L3JVbKUvMsYDSYiY2ZaxjDojz3sqZtTpqp9o=;
	b=ZdjPKJduHR0kQKA9iOFu/wqXrtxYNT8D98ep2OHjskI2iMWmdMhJM+xlwXi2a2UTpR7ncJ
	5qpNljc9wIr5zle2TXgqGUDtOkoqVXcCpDgnKyudqLAVhqCIhc1QglXl3NViHia9QnY986
	vmuA5FDzVrA/1dJMrh5MzkpP/1jGSS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791412494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9lJ8PC8L3JVbKUvMsYDSYiY2ZaxjDojz3sqZtTpqp9o=;
	b=r01nj3MXYpAYQK0UrTC8QqaBQ6ZGeNRQOqNfWIW54liTQDYF7/+jJWYlUjkitohtzG37Tf
	Jem4WOxFd+HNN5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8117B13312;
	Wed,  7 Oct 2026 22:34:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nYhpEA7JxmrpTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 22:34:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: Don't free card at probe error in vga_switcheroo handler
Date: Thu,  8 Oct 2026 00:34:46 +0200
Message-ID: <20261007223448.172443-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,sashiko.dev:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: B6A551F74C

The vga_switcheroo handler azx_vs_set_state() calls
azx_probe_contine() for enabling the audio, and if an error happens
during the probe, azx_probe_continue() releases its associated sound
card object at the error path.  The card release procedure includes
the call of vga_switcheroo_unregister_client(), and this triggers the
vgasr_mutex lock again that had been already held by the caller
(vga_switcheroo_process_delayed_switch()) -- leading to a deadlock.

(Moreover, the card release will cause a potential UAF at the error
message in azx_vs_set_state() since the card object is already gone;
this was the original report by Sashiko.)

For avoiding the unneeded crash, it's better to avoid the card release
in this error path, so we make azx_probe_continue() behaving
conditionally.  In return, set hda->init_failed flag, so that any
further (re-)attempts will be filtered after that point.

The check of hda->init_failed is dropped from azx_vs_can_switch().
It's because otherwise vga_switcheroo can't be switched to turn off
GPU once when a probe error happens at the audio side.

Fixes: 39173303c838 ("ALSA: hda: Free card instance properly at probe errors")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261007213728.155092-1-tiwai%40suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 24015c73a67f..5d989e57b128 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1184,7 +1184,7 @@ static const struct dev_pm_ops azx_pm = {
 };
 
 
-static int azx_probe_continue(struct azx *chip);
+static int azx_probe_continue(struct azx *chip, bool free_on_error);
 
 #ifdef SUPPORT_VGA_SWITCHEROO
 static struct pci_dev *get_bound_vga(struct pci_dev *pci);
@@ -1211,8 +1211,10 @@ static void azx_vs_set_state(struct pci_dev *pci,
 		if (!disabled) {
 			dev_info(chip->card->dev,
 				 "Start delayed initialization\n");
-			if (azx_probe_continue(chip) < 0)
+			if (azx_probe_continue(chip, false) < 0) {
+				hda->init_failed = 1;
 				dev_err(chip->card->dev, "initialization error\n");
+			}
 		}
 	} else {
 		dev_info(chip->card->dev, "%s via vga_switcheroo\n",
@@ -1251,8 +1253,6 @@ static bool azx_vs_can_switch(struct pci_dev *pci)
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 
 	wait_for_completion(&hda->probe_wait);
-	if (hda->init_failed)
-		return false;
 	if (chip->disabled || !hda->probe_continued)
 		return true;
 	if (snd_hda_lock_devices(&chip->bus))
@@ -1738,7 +1738,7 @@ static void azx_check_snoop_available(struct azx *chip)
 static void azx_probe_work(struct work_struct *work)
 {
 	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
-	azx_probe_continue(&hda->chip);
+	azx_probe_continue(&hda->chip, true);
 }
 
 static int default_bdl_pos_adj(struct azx *chip)
@@ -2356,7 +2356,7 @@ static const unsigned int azx_max_codecs[AZX_NUM_DRIVERS] = {
 	[AZX_DRIVER_TERA] = 1,
 };
 
-static int azx_probe_continue(struct azx *chip)
+static int azx_probe_continue(struct azx *chip, bool free_on_error)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	struct hdac_bus *bus = azx_bus(chip);
@@ -2447,8 +2447,10 @@ static int azx_probe_continue(struct azx *chip)
 
 out_free:
 	if (err < 0) {
-		pci_set_drvdata(pci, NULL);
-		snd_card_free(chip->card);
+		if (free_on_error) {
+			pci_set_drvdata(pci, NULL);
+			snd_card_free(chip->card);
+		}
 		return err;
 	}
 
-- 
2.55.0

