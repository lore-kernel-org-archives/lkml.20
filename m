Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528464E01F2;
	Fri,  9 Oct 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552826; cv=none; b=oDuCdK3+Oxk9FdIl+mnCBKiBF5lQv7M/jKr3hAumEmig2V6AesSGyaJVljCbGnFMoCUh5W+vp8y6RmXazRazurVlmwn0u3DnZJw8CabFYOi6q5pKVT11uz+oKpfNaypP46HOb7T9wuKzVMoD7kWqFRmMNgn99kRwIVRwBA8vZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552826; c=relaxed/simple;
	bh=Qi/LWFchgS0y1bhgpBlJkcEvuanE2zZpdetsACLHgFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6VfCXGdOivpY3cFUj64L1I4PQcqNpMqGC9pdYggglQO0XW4cEPdhUf+/NVJpkU0VNgPZosdlJOF57C2S+q+5JsSkB+NwihlIzv9Xg/QwgFrHYRSiNY906CHpo8kvvFT15n++gJ3ofFuxgn+FPbeeD70wCaRbxaC6BMB8Y7fYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7770621A8E;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3857B1326D;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oxVDIjbtyGr4ZgAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Fri, 09 Oct 2026 13:33:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] ALSA: hda: Disable unsol event handling at error and shutdown paths
Date: Fri,  9 Oct 2026 15:33:36 +0200
Message-ID: <20261009133341.440917-3-tiwai@suse.de>
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
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00]
X-Spam-Score: 0.00

When the HD-audio controller driver probe fails, it still leaves the
unsolicited event handling and jackpoll work active, hence if they are
pending, they might fire up later after the resource gets released,
which may lead to a UAF.  A similar problem may be seen at shutdown,
too.

Add the recently added helper to disable unsol events and the cancel
of jackpoll_work at the appropriate places.  We need the workaround in
the error path before driver->ops->remove, too.  As unsol events and
jack polling may have been already enabled during the probe callback,
the driver->ops->remove call is done (more) conditionally now.

Fixes: c3ec8ac82105 ("ASoC: hdac_hda: fix memleak on module unload")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: apply the workaround in the wider error path

 sound/hda/common/bind.c  | 8 ++++++--
 sound/hda/common/codec.c | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index 4772ca154a29..d12359970e74 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -89,6 +89,7 @@ static int hda_codec_driver_probe(struct device *dev)
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 	struct module *owner = dev->driver->owner;
 	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
+	bool probed = false;
 	int err;
 
 	if (codec->bus->core.ext_ops) {
@@ -122,7 +123,8 @@ static int hda_codec_driver_probe(struct device *dev)
 
 	err = driver->ops->probe(codec, codec->preset);
 	if (err < 0)
-		goto error_module_put;
+		goto error_module;
+	probed = true;
 	err = snd_hda_codec_build_pcms(codec);
 	if (err < 0)
 		goto error_module;
@@ -141,7 +143,9 @@ static int hda_codec_driver_probe(struct device *dev)
 	return 0;
 
  error_module:
-	if (driver->ops->remove)
+	snd_hdac_device_disable_unsol(&codec->core);
+	cancel_delayed_work_sync(&codec->jackpoll_work);
+	if (probed && driver->ops->remove)
 		driver->ops->remove(codec);
  error_module_put:
 	module_put(owner);
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

