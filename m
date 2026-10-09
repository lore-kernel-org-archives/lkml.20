Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB51A2545;
	Fri,  9 Oct 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552827; cv=none; b=DnjwTcRoWBJ+0gb4fDTpWpydQcxsoJvgaShBWl3G+MhQCPlVh6nOzljERN7RTwXAWTGCY6qHXeVu+1pFbol7K3LeTUKG1A8z17PqPu9R8xQGZzP0sa3dVhTUIsmzHphLYqV5auSD79UoKXXldieVYbwa/R78ng1Vy8gPga5+XwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552827; c=relaxed/simple;
	bh=NSLh8+CswEMT66G8hcF3EXpUdFukgxV3VD9JFjCFN/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usDZbciAnVttIL7Kl8PKTFpNRPNJ+fl8R/KLa6NN5oAw5+PXRQFwrF0uRbJezDOEFlIeV+sSj7m/TjZZROSqZSSHpEI9UP9Gqa0z5ZhliMClC1b6nbjnkGuy2HvHF+KbXUVu7RIfV4dFsqutwJx1hY4gAsrHSmKVzBVpS+IuYjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 986F71F7D1;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6030D136D9;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oxVDIjbtyGr4ZgAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Fri, 09 Oct 2026 13:33:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] ALSA: hda: Add lock around codec->registered flag manipulations
Date: Fri,  9 Oct 2026 15:33:37 +0200
Message-ID: <20261009133341.440917-4-tiwai@suse.de>
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

Currently the places setting or clearing codec->registered flag have
no locking, while its reference in the unsol handling work
snd_hdac_bus_process_unsol_events() takes the bus->reg_lock lock.
Let's add the same bus->reg_lock at the places where codec->registered
is set and cleared for avoiding the races.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: fix build error

 sound/hda/common/codec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 94da4f3a21ed..18838a45e6f7 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -757,11 +757,15 @@ static void codec_release_pcms(struct hda_codec *codec)
  */
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 {
+	struct hda_bus *bus = codec->bus;
+
 	if (codec->core.registered) {
 		/* pm_runtime_put() is called in snd_hdac_device_exit() */
 		pm_runtime_get_noresume(hda_codec_dev(codec));
 		pm_runtime_disable(hda_codec_dev(codec));
+		spin_lock_irq(&bus->core.reg_lock);
 		codec->core.registered = false;
+		spin_unlock_irq(&bus->core.reg_lock);
 	}
 
 	snd_hda_codec_disconnect_pcms(codec);
@@ -808,6 +812,8 @@ void snd_hda_codec_display_power(struct hda_codec *codec, bool enable)
  */
 void snd_hda_codec_register(struct hda_codec *codec)
 {
+	struct hda_bus *bus = codec->bus;
+
 	if (codec->core.registered)
 		return;
 	if (device_is_registered(hda_codec_dev(codec))) {
@@ -815,7 +821,9 @@ void snd_hda_codec_register(struct hda_codec *codec)
 		pm_runtime_enable(hda_codec_dev(codec));
 		/* it was powered up in snd_hda_codec_new(), now all done */
 		snd_hda_power_down(codec);
+		spin_lock_irq(&bus->core.reg_lock);
 		codec->core.registered = true;
+		spin_unlock_irq(&bus->core.reg_lock);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_register);
-- 
2.55.0

