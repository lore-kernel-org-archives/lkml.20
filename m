Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6D43CFF79;
	Thu,  8 Oct 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487568; cv=none; b=olygD//NL6IK/j0Y1OWxtVlm9Ic//sL93ubaQB8konXqxPqkpBDEd6DkDlJT8kdrzV4OECRh2cw2kmgn9QTwOp5PRn5v+840ofgY58llcXQje6UvSLyBvUgpuDqlQajyMjW1krjCif2K/j/6i9/6GOW9Zo9C1aS8KvBhiUGcsts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487568; c=relaxed/simple;
	bh=388uMB8CeGkMRHhnE5itUhwANLXneUM4gqslykRUaa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhhmMuO/F6UV0ZaHzafsNuJYl7q90T7JQA/lobhcXvLSogjiitSRjgpnDTzs/Rmf3NWx+oZpeWwmaYavuiZBnb/hpTuTb7DVcpYbLkLY4gtkC6u/DQK6qGekY+NSgJLxQj0npN4tDuQN/6VjAr6JjjDmMngyuMoasKNXxo5YERg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B9E6521C3D;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73F4313967;
	Thu,  8 Oct 2026 19:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] ALSA: hda: Disable unsol event handling at error and shutdown paths
Date: Thu,  8 Oct 2026 21:25:42 +0200
Message-ID: <20261008192553.300025-3-tiwai@suse.de>
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
X-Spam-Score: 0.00
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00]

When the HD-audio controller driver probe fails, it still leaves the
unsolicited event handling and jackpoll work active, hence if they are
pending, they might fire up later after the resource gets released,
which may lead to a UAF.  A similar problem may be seen at shutdown,
too.

Add the recently added helper to disable unsol events and the cancel
of jackpoll_work at the appropriate places.

Fixes: c3ec8ac82105 ("ASoC: hdac_hda: fix memleak on module unload")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/bind.c  | 2 ++
 sound/hda/common/codec.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index 4772ca154a29..f2a498c78891 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -147,6 +147,8 @@ static int hda_codec_driver_probe(struct device *dev)
 	module_put(owner);
 
  error:
+	snd_hdac_device_disable_unsol(&codec->core);
+	cancel_delayed_work_sync(&codec->jackpoll_work);
 	snd_hda_codec_cleanup_for_unbind(codec);
 	codec->preset = NULL;
 	return err;
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index c99fe61c29db..94da4f3a21ed 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -3039,6 +3039,7 @@ void snd_hda_codec_shutdown(struct hda_codec *codec)
 
 	codec->jackpoll_interval = 0; /* don't poll any longer */
 	cancel_delayed_work_sync(&codec->jackpoll_work);
+	snd_hdac_device_disable_unsol(&codec->core);
 	list_for_each_entry(cpcm, &codec->pcm_list_head, list)
 		snd_pcm_suspend_all(cpcm->pcm);
 
-- 
2.55.0

