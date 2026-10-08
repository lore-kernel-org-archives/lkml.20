Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA73D0C1D;
	Thu,  8 Oct 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487568; cv=none; b=GrY1aOi7HKQ2hskx4eKi33jaGMgxyz3ADnNx8/blMOcjbtZNtR6JvGEL/mZlWUNX+Dp0yujW/Y7STlP3JxoEXNqeCR2ieB12kt1Myku7s1yzEez4KK0olorBft07Ai4e8KAh3SPLJ/IvVoqvqrK4+kkh5u15utGM2IILWYGQPks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487568; c=relaxed/simple;
	bh=I+qDkqEtaVfFhfhO8hrRfRh/Fh8Yolrn+WMUPdswo00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VH98hX/00SyZvTHIpFkcxMbojzKuQUNxQaXWSERshAh0qyKqW6ySw28wDrwqtUUDF7HhDkXfM3zBTkk4kUE9FLJd5ga3+oyrKdBvU98G2uA2hTbXyTJx0wckR6zNxLv/hPMlJNKmQP6qTVNer33UvXR+sKZmOM9E3VRapDVibR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 08B5E21C3E;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C06D01395B;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] ALSA: hda: Add NULL check for the driver pointer at unsol event work
Date: Thu,  8 Oct 2026 21:25:44 +0200
Message-ID: <20261008192553.300025-5-tiwai@suse.de>
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
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 08B5E21C3E
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.00 / 50.00]

snd_hdac_bus_process_unsol_events() assumes that the codec driver is
always set when it's accessible from the codec table.  It's true in
general, but in a sheer timing, it might have been already NULLified
at the driver unbinding.

As a safety, let's add a NULL check before dereferencing and calling
the driver's unsol_event callback.

Fixes: c637fa151259 ("ALSA: hda: Fix potential race in unsol event handler")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/core/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index 8d4ed9834aaa..96fd9bd221c9 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -184,7 +184,7 @@ static void snd_hdac_bus_process_unsol_events(struct work_struct *work)
 			continue;
 		spin_unlock_irq(&bus->reg_lock);
 		drv = drv_to_hdac_driver(codec->dev.driver);
-		if (drv->unsol_event)
+		if (drv && drv->unsol_event)
 			drv->unsol_event(codec, res);
 		spin_lock_irq(&bus->reg_lock);
 	}
-- 
2.55.0

