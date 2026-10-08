Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87A3D093E;
	Thu,  8 Oct 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487569; cv=none; b=g6qWjmQRCCtfwzM8wWAN2yznZkpgKP+LHjXNIvEzgtOdjc4wdWkB7UrfYzWRVDqLvJd2uq7oZz+zasZRQJ1G194cHH1Koh0qdt81VL7cgXefHo6P1eEXXfqidzBRXNZnok1kOQ6QpHoMZJ3n6561F0OOM+y+2oRWHpGBB8Pch+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487569; c=relaxed/simple;
	bh=oNI8x6y+xD1kcgsVTYfnKefSsADpyuCrVMxn6P5HOwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZCyFJrb1yQ5EomGW1Omtcwm2Q96grxY5u9Yfm2mOc38oDdDm56fRiUe+CN29OrIyabjhrLDgrF2iTOWsDCMzKd+YTKaOLhXOfUUskL+cvyf1+dx0LAcI2AuaxnLBLch/XAnZg/AkH44TLnYwogAuu+bmfDFjDG58zBf1WcRL5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB1ED1F44E;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 989581339F;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] ALSA: hda: Add lock around codec->registered flag manipulations
Date: Thu,  8 Oct 2026 21:25:43 +0200
Message-ID: <20261008192553.300025-4-tiwai@suse.de>
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
X-Rspamd-Queue-Id: DB1ED1F44E
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.00 / 50.00]

Currently the places setting or clearing codec->registered flag have
no locking, while its reference in the unsol handling work
snd_hdac_bus_process_unsol_events() takes the bus->reg_lock lock.
Let's add the same bus->reg_lock at the places where codec->registered
is set and cleared for avoiding the races.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/codec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 94da4f3a21ed..7fbced571282 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -761,7 +761,9 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 		/* pm_runtime_put() is called in snd_hdac_device_exit() */
 		pm_runtime_get_noresume(hda_codec_dev(codec));
 		pm_runtime_disable(hda_codec_dev(codec));
+		spin_lock_irq(&bus->reg_lock);
 		codec->core.registered = false;
+		spin_unlock_irq(&bus->reg_lock);
 	}
 
 	snd_hda_codec_disconnect_pcms(codec);
@@ -815,7 +817,9 @@ void snd_hda_codec_register(struct hda_codec *codec)
 		pm_runtime_enable(hda_codec_dev(codec));
 		/* it was powered up in snd_hda_codec_new(), now all done */
 		snd_hda_power_down(codec);
+		spin_lock_irq(&bus->reg_lock);
 		codec->core.registered = true;
+		spin_unlock_irq(&bus->reg_lock);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_register);
-- 
2.55.0

