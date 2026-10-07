Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A3D3E7630;
	Wed,  7 Oct 2026 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791409058; cv=none; b=Qqu7wJPJ8M2ueq3hus4lTrNYiQZmEtCQ4jOAUM5k4/DblXCCqxPOU+0XZLaObgOfbRZhcBEniXZmEV9/eizyix1zWIybf5G1mc3x0kBdYMdx866djty6DUsMSLc/+PybGOQq7Bwt9o9KBPOdNVRQA19ukZW6S2tDbCbcTTHJ/5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791409058; c=relaxed/simple;
	bh=8K5+op7yZCiGbAQjyUliFdoIbeNYZSJvs41dtTuNzLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btQyLzsZ7NLPzS2w+0025Z/KwUhBbzaz3gVxh0emeHAk1gz5pWjoUFhA5mbPmhwpbMdlJZ6J6KV/SPxztjjJuT7ouJOBlLdiweu8C5wnWZPRD7Lrw1RWMjkYneNhxY2QrWkJt3aP+g1fSevgCiw8BwxGdUUCK4VacHTgI4CoWZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mkGOWdnQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mkIN2z0E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mkGOWdnQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mkIN2z0E; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mkGOWdnQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mkIN2z0E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mkGOWdnQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mkIN2z0E"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 064CC21BE9;
	Wed,  7 Oct 2026 21:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791409055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QDoG8u04h7mpRz20yUPa0eb85sO0dlSnjNHPZgmGvoc=;
	b=mkGOWdnQINXegrxcos7FlrpJX9fh9H9c29BMXZUMKewdzYIj/cuwHX6Q0zn2cOeac2h1ZE
	K4o8/5llSDdbl4rpPA8hwAYCP7AfRj86or5KEmD9YzKyqqcwne+CFj+HxNYxHIJ4CM1SlL
	6OEaCFtkjeh3gxREEPXMEJ0USflQXow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791409055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QDoG8u04h7mpRz20yUPa0eb85sO0dlSnjNHPZgmGvoc=;
	b=mkIN2z0EaWc3aBvb1NHoT8f92sdPEneLKQsNVn40lAzMsalggu61pqNxexyelofwt9dP1f
	eRqnqfoPjzzdraCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791409055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QDoG8u04h7mpRz20yUPa0eb85sO0dlSnjNHPZgmGvoc=;
	b=mkGOWdnQINXegrxcos7FlrpJX9fh9H9c29BMXZUMKewdzYIj/cuwHX6Q0zn2cOeac2h1ZE
	K4o8/5llSDdbl4rpPA8hwAYCP7AfRj86or5KEmD9YzKyqqcwne+CFj+HxNYxHIJ4CM1SlL
	6OEaCFtkjeh3gxREEPXMEJ0USflQXow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791409055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QDoG8u04h7mpRz20yUPa0eb85sO0dlSnjNHPZgmGvoc=;
	b=mkIN2z0EaWc3aBvb1NHoT8f92sdPEneLKQsNVn40lAzMsalggu61pqNxexyelofwt9dP1f
	eRqnqfoPjzzdraCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F5BA13354;
	Wed,  7 Oct 2026 21:37:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /O3mEZ67xmpCFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 21:37:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: Avoid dev_err() at probe error in vga_switcheroo handler
Date: Wed,  7 Oct 2026 23:37:25 +0200
Message-ID: <20261007213728.155092-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]

The vga_switcheroo handler azx_vs_set_state() calls
azx_probe_contine() for enabling the audio, and if an error happens
during the probe, azx_probe_continue() releases its associated sound
card object at the error path.  In return, azx_vs_set_state() tries to
show an error via dev_err() with the card's device pointer, but since
the card object is already gone, this can lead to a UAF.

For avoiding the unneeded crash, replace the device for the error
message with the original PCI device that is passed to
azx_vx_set_state() itself.

Fixes: 39173303c838 ("ALSA: hda: Free card instance properly at probe errors")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 24015c73a67f..0e47f7f0947c 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1211,8 +1211,14 @@ static void azx_vs_set_state(struct pci_dev *pci,
 		if (!disabled) {
 			dev_info(chip->card->dev,
 				 "Start delayed initialization\n");
-			if (azx_probe_continue(chip) < 0)
-				dev_err(chip->card->dev, "initialization error\n");
+			if (azx_probe_continue(chip) < 0) {
+				/* since the HD-audio driver got unbound /
+				 * released upon error, we can't use card device
+				 * any longer, so use pci device directly
+				 */
+				dev_err(&pci->dev, "%s: initialization error\n",
+					__func__);
+			}
 		}
 	} else {
 		dev_info(chip->card->dev, "%s via vga_switcheroo\n",
-- 
2.55.0

