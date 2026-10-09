Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EEB4A5EAC;
	Fri,  9 Oct 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552827; cv=none; b=tsyVYdDA1F3E6OhVCLGtSeiqa0KBjyf0rGI/xt5+JKPfJcN18MzksEKCqa2wCHIxk/HQr7rgI6i/iRi8jtONIte941y6qYNyyPJTqghs8dnmILz+hpzTiGjX7suuffdPQ4ForQvIGojYSUidaZHnL6FZdp1fKSORLbR9HJ2q77Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552827; c=relaxed/simple;
	bh=nyK1FDL5RJp8U+EeHojJqB0unExIBWRdMj3ympaV+B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bagOxwSM9z7ChO4OWRDW2Bofsjmyji+0Qay8odbsIw7uqPbXAupb22S83NPQ52nAxhFJYzhtjwie6ecvQdoYUDfOOwxFIBfHX4qFSuOd1PmNBpLxCbSFn+/RLAO2EufjudUI4vFEJ0xvYGTr1RCuefxMath1up/j+hUGRSCKs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA31B21BFF;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF8DA136D9;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oxVDIjbtyGr4ZgAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Fri, 09 Oct 2026 13:33:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] ALSA: hda: Add NULL check for the driver pointer at unsol event work
Date: Fri,  9 Oct 2026 15:33:39 +0200
Message-ID: <20261009133341.440917-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009133341.440917-1-tiwai@suse.de>
References: <20261009133341.440917-1-tiwai@suse.de>
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
X-Spam-Score: 0.00
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00]

snd_hdac_bus_process_unsol_events() assumes that the codec driver is
always set when it's accessible from the codec table.  It's true in
general, but in a sheer timing, it might have been already NULLified
at the driver unbinding.

Although the codec removal should have been done properly by the
previous fixes, just for more safety, let's add a NULL check before
dereferencing and calling the driver's unsol_event callback.

Fixes: e7255c00b10e ("ALSA: hda: Skip event processing for unregistered codecs")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: fix bogus NULL check to a more correct one, mention it's just to be sure

 sound/hda/core/bus.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index 8d4ed9834aaa..21af4b7c870d 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -182,10 +182,13 @@ static void snd_hdac_bus_process_unsol_events(struct work_struct *work)
 		codec = bus->caddr_tbl[caddr & 0x0f];
 		if (!codec || !codec->registered || codec->unsol_disabled)
 			continue;
-		spin_unlock_irq(&bus->reg_lock);
+		if (!codec->dev.driver)
+			continue;
 		drv = drv_to_hdac_driver(codec->dev.driver);
-		if (drv->unsol_event)
-			drv->unsol_event(codec, res);
+		if (!drv->unsol_event)
+			continue;
+		spin_unlock_irq(&bus->reg_lock);
+		drv->unsol_event(codec, res);
 		spin_lock_irq(&bus->reg_lock);
 	}
 	spin_unlock_irq(&bus->reg_lock);
-- 
2.55.0

