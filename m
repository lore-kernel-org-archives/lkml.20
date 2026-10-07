Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9638E126;
	Wed,  7 Oct 2026 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410220; cv=none; b=eTiDLZjOUPlULjL2gA4aXb/k6jZwS3wrG4RUDdvGjXUx+rfQIkgmua1qSttUbvJVjVNbHk92oFUiHUh7QlZJspi0rNHUULZ4nr2t8oi7D66wKtxE+TKD1PMhJFHBHJSgDjOZrOoBydFYz5Wgs81Bs3kBP3+l7nf3OOJyPERmeis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410220; c=relaxed/simple;
	bh=bqugijLAxdsJerIU9GNfAb7vFNr3/a56u7Wf+kiD3t8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmhUbcTq7LFG2pIGBkTLRRkvsGYgaPcKP67N9AwfdcwxugMgamXe+wyuddAoFJ6w8FSuTACKW4yx80DbH9OuDpBxhgCxjUL5rhMEjGptVaT7+/K1hidv3TM2nwcDGMyvIIACnvW4u0uGDlY7q0IFOvkLO+ED4kBehqj/dU52ZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YhMhF8SV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jHUvyOV3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YhMhF8SV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jHUvyOV3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YhMhF8SV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jHUvyOV3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YhMhF8SV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jHUvyOV3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1911F1F770;
	Wed,  7 Oct 2026 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791410217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JID/mAX16d8cYgKMskpE7TGUzO7ocozJb3tkpjqp8Y=;
	b=YhMhF8SV/yrVKrCwWkG7PfDv+507RsyDLvYvR4P9lMNtwdHvKBip0QRQeQ7c3bp7WdN1QX
	CHywo5+BugPmiQS/2EKgsvlMgDjnLgOTePXYKyH0x/FIU9tM+ejVuyNfINwy2DorA8DHwp
	rMVvL+qa7PwIjN8AYw4IcO3uYIeO+yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791410217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JID/mAX16d8cYgKMskpE7TGUzO7ocozJb3tkpjqp8Y=;
	b=jHUvyOV3y4mXpwYJbffU+aH1xB0YCnM+idSFgw6evYtidFbM9hPmsZjkhjBy4syLOVLisp
	jZYScoCfcdXMOUCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YhMhF8SV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jHUvyOV3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791410217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JID/mAX16d8cYgKMskpE7TGUzO7ocozJb3tkpjqp8Y=;
	b=YhMhF8SV/yrVKrCwWkG7PfDv+507RsyDLvYvR4P9lMNtwdHvKBip0QRQeQ7c3bp7WdN1QX
	CHywo5+BugPmiQS/2EKgsvlMgDjnLgOTePXYKyH0x/FIU9tM+ejVuyNfINwy2DorA8DHwp
	rMVvL+qa7PwIjN8AYw4IcO3uYIeO+yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791410217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JID/mAX16d8cYgKMskpE7TGUzO7ocozJb3tkpjqp8Y=;
	b=jHUvyOV3y4mXpwYJbffU+aH1xB0YCnM+idSFgw6evYtidFbM9hPmsZjkhjBy4syLOVLisp
	jZYScoCfcdXMOUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2A01139AC;
	Wed,  7 Oct 2026 21:56:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DGVtGSjAxmr0JwAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 21:56:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ALSA: hda: Stop unsol events and jack polling before codec unbind
Date: Wed,  7 Oct 2026 23:56:46 +0200
Message-ID: <20261007215650.159871-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007215650.159871-1-tiwai@suse.de>
References: <20261007215650.159871-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1911F1F770
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

At unbinding a codec driver, hda_codec_driver_remove() calls the
codec's remove callback that releases the driver resources, followed
by snd_hda_codec_cleanup_for_unbind().  Meanwhile, the unsolicited
events are processed asynchronously in bus->unsol_work, and
snd_hdac_bus_process_unsol_events() checks only codec->registered flag
before calling the driver's unsol_event callback without the lock.
Since codec->registered is cleared only in
snd_hda_codec_cleanup_for_unbind(), and there is no flush of the unsol
work at unbinding, the unsol event handler may run concurrently during
the running remove callback, which may lead to a UAF.  The same
problem applies to the jack polling work, which is canceled only after
the remove callback.

For addressing those races, introduce a new flag unsol_disabled to
hdac_device, to be checked it in the unsol event worker, while a new
helper snd_hdac_device_disable_unsol() sets this flag and flushes the
pending unsol work.  The helper is called at hda_codec_driver_remove()
together with the cancel of jackpoll_work to assure that no
asynchronous jack handling can run.  The flag is cleared again at
probing the codec driver, while the events are still blocked by the
registered flag until the codec gets registered.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Assisted-by: LLM
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h |  2 ++
 sound/hda/common/bind.c |  7 +++++++
 sound/hda/core/bus.c    | 21 ++++++++++++++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 4cbbb1744740..285f7c4d262d 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -97,6 +97,7 @@ struct hdac_device {
 	bool caps_overwriting:1; /* caps overwrite being in process */
 	bool cache_coef:1;	/* cache COEF read/write too */
 	unsigned int registered:1; /* codec was registered */
+	bool unsol_disabled;	/* unsol events blocked; protected by bus->reg_lock */
 };
 
 /* device/driver type used for matching */
@@ -123,6 +124,7 @@ int snd_hdac_device_init(struct hdac_device *dev, struct hdac_bus *bus,
 			 const char *name, unsigned int addr);
 void snd_hdac_device_exit(struct hdac_device *dev);
 int snd_hdac_device_register(struct hdac_device *codec);
+void snd_hdac_device_disable_unsol(struct hdac_device *codec);
 void snd_hdac_device_unregister(struct hdac_device *codec);
 int snd_hdac_device_set_chip_name(struct hdac_device *codec, const char *name);
 int snd_hdac_codec_modalias(const struct hdac_device *hdac, char *buf, size_t size);
diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index 6a728a773556..4772ca154a29 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -100,6 +100,9 @@ static int hda_codec_driver_probe(struct device *dev)
 	if (WARN_ON(!codec->preset))
 		return -EINVAL;
 
+	/* unsol events are still blocked until registered */
+	codec->core.unsol_disabled = false;
+
 	err = snd_hda_codec_set_name(codec, codec->preset->name);
 	if (err < 0)
 		goto error;
@@ -160,6 +163,10 @@ static int hda_codec_driver_remove(struct device *dev)
 		return codec->bus->core.ext_ops->hdev_detach(&codec->core);
 	}
 
+	/* stop asynchronous jack handling before freeing driver resources */
+	snd_hdac_device_disable_unsol(&codec->core);
+	cancel_delayed_work_sync(&codec->jackpoll_work);
+
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
 	snd_refcount_sync(&codec->pcm_ref);
diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index 20fe1c4a2977..8d4ed9834aaa 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -180,7 +180,7 @@ static void snd_hdac_bus_process_unsol_events(struct work_struct *work)
 		if (!(caddr & (1 << 4))) /* no unsolicited event? */
 			continue;
 		codec = bus->caddr_tbl[caddr & 0x0f];
-		if (!codec || !codec->registered)
+		if (!codec || !codec->registered || codec->unsol_disabled)
 			continue;
 		spin_unlock_irq(&bus->reg_lock);
 		drv = drv_to_hdac_driver(codec->dev.driver);
@@ -191,6 +191,25 @@ static void snd_hdac_bus_process_unsol_events(struct work_struct *work)
 	spin_unlock_irq(&bus->reg_lock);
 }
 
+/**
+ * snd_hdac_device_disable_unsol - block and flush unsol events for the codec
+ * @codec: the HDA core device
+ *
+ * Stop dispatching the unsolicited events to the given codec, and wait for
+ * the pending unsol event handler to finish.  Called at unbinding the codec
+ * driver before releasing the driver resources.
+ */
+void snd_hdac_device_disable_unsol(struct hdac_device *codec)
+{
+	struct hdac_bus *bus = codec->bus;
+
+	spin_lock_irq(&bus->reg_lock);
+	codec->unsol_disabled = true;
+	spin_unlock_irq(&bus->reg_lock);
+	flush_work(&bus->unsol_work);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_device_disable_unsol);
+
 /**
  * snd_hdac_bus_add_device - Add a codec to bus
  * @bus: HDA core bus
-- 
2.55.0

