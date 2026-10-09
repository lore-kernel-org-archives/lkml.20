Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D35744F54F;
	Fri,  9 Oct 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552827; cv=none; b=ZXUpx/07ZVv0DSwcEBDFq5obJkehZntaHGyjUi35vqxYrRogn7hRZQfINZZi5OWCYTrED1zB0mdPv0omcc/praWjwMFh2YTjWm1ZFIgI80B2jxz9LZARur8YuNojAVKZ6V2sRSJZR8fiMKSHvR0qKCjcQ+zVu3d37RdylXzpiNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552827; c=relaxed/simple;
	bh=KGYEgNdDJamK3A8xevsHxpIVGl0Qt2S3tI7yZW1A92U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onFjUq2X4zHBB6/LDwrPmp+gNxIZmNPjtVaPM1tN8yTf9fVebzcypsr1LvieUKH3/1cZcf73zmQCafMVRoKIsHxEKQ/84QElSN/pI3b1lCjvW60EhuEticjTLIhL+KntdCIjhjp9ytxutfprTsdozWf2gukYBgx4bNogE2/JHOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C007B21BD4;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8AC8D1326D;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oxVDIjbtyGr4ZgAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Fri, 09 Oct 2026 13:33:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] ALSA: hda: Stop unsol event and jack polling at hda-ext device removal, too
Date: Fri,  9 Oct 2026 15:33:38 +0200
Message-ID: <20261009133341.440917-5-tiwai@suse.de>
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

In the recent commit f3607b6952ca ("ALSA: hda: Stop unsol events and
jack polling before codec unbind"), we applied the workaround to stop
pending works at the hda codec driver removal, but it was applied
after the bypass for hda-ext ops hdev_detach.  Basically the same
issue is seen for hda-ext stuff, so it's safer to apply the workaround
at the beginning of hda_codec_driver_remove().

Along with it, the clearance of unsol_disabled flag is moved to the
beginning of hda_codec_driver_probe(), too; otherwise hda-ext
hdev_attach() might miss the unsol event handling when the code gets
re-bound.

Fixes: f3607b6952ca ("ALSA: hda: Stop unsol events and jack polling before codec unbind")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/bind.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index d12359970e74..957feace0f58 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -92,6 +92,9 @@ static int hda_codec_driver_probe(struct device *dev)
 	bool probed = false;
 	int err;
 
+	/* unsol events are still blocked until registered */
+	codec->core.unsol_disabled = false;
+
 	if (codec->bus->core.ext_ops) {
 		if (WARN_ON(!codec->bus->core.ext_ops->hdev_attach))
 			return -EINVAL;
@@ -101,9 +104,6 @@ static int hda_codec_driver_probe(struct device *dev)
 	if (WARN_ON(!codec->preset))
 		return -EINVAL;
 
-	/* unsol events are still blocked until registered */
-	codec->core.unsol_disabled = false;
-
 	err = snd_hda_codec_set_name(codec, codec->preset->name);
 	if (err < 0)
 		goto error;
@@ -161,16 +161,16 @@ static int hda_codec_driver_remove(struct device *dev)
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 
+	/* stop asynchronous jack handling before freeing driver resources */
+	snd_hdac_device_disable_unsol(&codec->core);
+	cancel_delayed_work_sync(&codec->jackpoll_work);
+
 	if (codec->bus->core.ext_ops) {
 		if (WARN_ON(!codec->bus->core.ext_ops->hdev_detach))
 			return -EINVAL;
 		return codec->bus->core.ext_ops->hdev_detach(&codec->core);
 	}
 
-	/* stop asynchronous jack handling before freeing driver resources */
-	snd_hdac_device_disable_unsol(&codec->core);
-	cancel_delayed_work_sync(&codec->jackpoll_work);
-
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
 	snd_refcount_sync(&codec->pcm_ref);
-- 
2.55.0

