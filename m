Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842089;
	b=AK4OhEzwavhK7KLw6KffFOnW7iiRxC8PCi4F/b0GJkYvls1Yrb9AV5sE1mw9Axn8rGDl
	 P9qszxeWSnk0U2Xv5dlTUoaMDeTkPh2f9EqhPTG11Cz1ZW6uqgpZYqpSblwtJ4glpLrFL
	 ukj1NY0PlSuljmyc3zTx+7ZR/usCp2ZMdXuf+ct5vE/kxXg7Jb8UVyRen5nby0jt6QfoK
	 TGO8OOe491lfGPFRRBha60VRU4KGxVEpIsVvzUzcW0k6el1moBEE7iHwOvkJxjQUDNHuF
	 f2UK899/xEnFeZXhKJKS7nXUNokrd5wBK13/87gkdaDs9jip9Cbcm9QHvsMvn7j0fZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u+Zxi5HHYWwOsq0kbcP9QgLrzMzDG1UW1G+Z+4fNxWQ=;
	b=muqNOESRaN1k0P0Guc+K8VYcnY6CWvpnfHngh6QMEqDgv6NbTridlc0OfZDiAoj8R2xi
	 mLlLNZjfkt5PK7LYLZJYFUwcMt6NH1EcfSEK8S959zXqAtgO/lv1ShB9AZOESCMkmsBxl
	 Nx2ZVglYFQQPEQmVKixcKnoVfiUYLKtxjoNJ1/Q8ZLX7AO8CFPj9K7eNA6oke6uR2SO2z
	 2W4XwDMcDU+BFHygr89inwwq4RwvpDWA0gQA+EZCFrNW/YdvKDbKONFhW+axy+m0mT6yF
	 iawkSi9d6F1FJm3Pm9R+2Ps9+n1bxdKuLJLq0xYQ9THuJImlPWEfJN0uDGnLvqBlTCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Fh/3LC+N";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F50606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F50606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fh/3LC+N
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8fe8e343fso9006985ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842088; x=1793446888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+Zxi5HHYWwOsq0kbcP9QgLrzMzDG1UW1G+Z+4fNxWQ=;
        b=Fh/3LC+Nq/hnkEqAcqOPueRSloqraLPDEok5T41+axD5sC5jiMpahTHXQWqXH28o5M
         bm6+KKvN1lkaeLI7egvw91GHczfxm1fAJ8LRWV1npPhjTI60vq84pIGgrVGodwcty43o
         ElVllB8CpfzKTT2WYGlIyck12PcPIkVI2BtO3sTZ7WBdLGUO4/0yHKiwfbQgOp+HxZpM
         G53U+etdOIJbcvT8UViWZU3aQQoQJf6Z3Or9qy8j4Ef+wGH1aKaczI/zrl5WMYqg1QIY
         Q6q8DcLmozQqJaAy5fvHF0Nt+zzFSl8x3WkSrdfh3PYkjWOdg/8sBLxEO1EqMg4un6BM
         eulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842088; x=1793446888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+Zxi5HHYWwOsq0kbcP9QgLrzMzDG1UW1G+Z+4fNxWQ=;
        b=k6jRdg7RU1FLZOQCIAs2oq/zXTwQSk39qmIZf0HtmOpUL/FJ0CWFEXoRrvtJf5S/M6
         zmdcrf1AA2iLIU3FLK1/mCBLTgvbLbtH68Ky0NJjImlOU5/LeLr0F4qxD0/gi7f9lI52
         e0hxKU0LMVBf42c7Mqasf1GN5Q3qve6373cHlXLr05fOrFOVJpP8tzrRtPb+AC4zyKXS
         OTzPfHY97UKZ2vCAHeW0uAq4HzgjUnp5SQciJQN7Q8hlRJ1oO0FNz5rS5+Vm/RcPqxOa
         RCIOW1vj0Hr8rTGR6tIms0s9wBboywOlwJnKOdafjd+5bs2ESBimt5J0N8nc7MyoU3LW
         l1QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwciAe6zkfwEdQnu11yMigF+0Q6rWYR5WCWOy4fj/vrY3tEVN2PPvOPBdkC/IsmFRJnovN6RXwEm7Sf7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMgKP8gEe8iiaunRFspvEVALllE0E4lYp3v680Pgg0fcGKu9OG
	JSOcqoNR+e3yGR4aY/oca6nHhNM3UFIrRxCoSSmEYTB0JEXJAlvAQk6X8e5rjkmeitFjlA==
X-Gm-Gg: AYBFou22IIj9eQT7ck9MQ9FhwA956HUC8jh6Si++cVfvCFxdxMU/KUEccVkCr9K7yj3
	M+D3HHh5B5zrJWZct4PMJg1boeyPju6q0WdoGH9w/m204iDC9uBdskM0rMpGoJSajAa3ZhZpUr3
	ufbY002sX0Cv2Av/4Wn208xADojpDzSRy8CpVsqvYXlD3zwksAcS0PVqIar/Xs8j4AZ2XX8JXpg
	o0CwulKocSsRfs6IfMFd7NaNLRZideT1whUB4U9qSsmG/iCtJ7pdhGWlaywN0ESBI6GOyEBlkuz
	3x5BQain6KPnm8jF9NIEaGDx4kXeDCfeEWKlUVaAhUF3iM79TWT+ez5pZIvFpQqn2xS3qqabJ4N
	h3zmaY4meOw8T/nimgvhmtGcU8Q3u/jCHjAKhVyLzI+wWv3B5T6BjDsmjx5T0Pmcnjqj812Ma9E
	JrO8z3NjfquH7NM76k9FYZoQbh5p9KTgUz5bq3Phj2yUNwjDfz4HwqIjgzU2Zxlr5+jOnA3IUQg
	UlPoc7fPUEP/7B+JgH8xIobB7H/4xAFH2VQ0ssBmbBEr8B45j75mc0wOqaL4G6ez7H8TarF
X-Received: by 2002:a17:902:fc43:b0:2dd:c0ff:e72e with SMTP id d9443c01a7336-2ea9c91f1dfmr12219905ad.64.1792842087808;
        Sat, 24 Oct 2026 04:41:27 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14c774sm4738515ad.38.2026.10.24.04.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:41:27 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 1/3] ALSA: pcm: Retain components across native minor lookups
Date: Sat, 24 Oct 2026 19:41:14 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The card reference acquired by snd_lookup_minor_data() does not retain a
PCM component that its owner explicitly frees on a live card. A native
open can obtain the PCM and be delayed before substream attachment or
the driver open callback acquires its own usage reference.

For example, writing a codec name to its HDA driver's sysfs unbind
attribute disconnects and frees that codec's PCMs while the card remains
registered. The codec PCM usage count does not cover an opener that has
not yet entered azx_pcm_open():

  Native PCM open                       HDA codec unbind
  ---------------                       ----------------
  look up minor, retain card
  retain raw PCM pointer
                                        snd_hda_codec_disconnect_pcms()
                                          disconnect PCM
                                        wait for codec PCM references
                                        codec_release_pcms()
                                          snd_device_free()
                                            snd_pcm_free()
  use PCM in substream attachment

Acquire a PCM usage reference while still holding register_mutex across
minor lookup. Transfer it to the file on successful open and release it
after substream cleanup, before dropping the file's card reference.
Mappings also keep this reference through the file they retain. Balance
the temporary references used for PCM file checks and failed opens.

Keep proc rundown in the existing component disconnect path, after
open_mutex has been dropped. The PCM usage wait belongs in final free,
with no registration or open mutex held while users finish.

Close lookup admission and reject new substream attachments on component
disconnect. Final free closes admission even for BUILD-state cleanup,
wakes waiting openers and waits for existing PCM users without holding
register_mutex or open_mutex.

Keep registration under the same lookup gate and roll back earlier
direction minors if a later registration fails. Otherwise a failed
BUILD-state component can leave a minor pointing at freed storage.
Initialize PCM timers only after both direction registrations succeed,
so a failed registration leaves no partially initialized timers to
replace on retry.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/pcm.h     |  9 +++++++
 sound/core/pcm.c        | 59 ++++++++++++++++++++++++++++++++++++++---
 sound/core/pcm_native.c | 44 ++++++++++++++++++++----------
 3 files changed, 95 insertions(+), 17 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 1cf511f8d880..8fdb07f2f542 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -543,11 +543,13 @@ struct snd_pcm {
 	struct snd_pcm_str streams[2];
 	struct mutex open_mutex;
 	wait_queue_head_t open_wait;
+	struct snd_refcount users; /* minor lookups and open files */
 	void *private_data;
 	void (*private_free) (struct snd_pcm *pcm);
 	bool internal; /* pcm is for internal use only */
 	bool nonatomic; /* whole PCM operations are in non-atomic context */
 	bool no_device_suspend; /* don't invoke device PM suspend */
+	bool disconnected; /* no new substream may be attached */
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	struct snd_pcm_oss oss;
 #endif
@@ -559,6 +561,13 @@ struct snd_pcm {
 
 extern const struct file_operations snd_pcm_f_ops[2];
 
+struct snd_pcm *snd_pcm_get_by_minor(unsigned int minor, int type);
+
+static inline void snd_pcm_put(struct snd_pcm *pcm)
+{
+	snd_refcount_put(&pcm->users);
+}
+
 int snd_pcm_new(struct snd_card *card, const char *id, int device,
 		int playback_count, int capture_count,
 		struct snd_pcm **rpcm);
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 064df4cd3b50..17cd60e8825d 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -725,6 +725,7 @@ static int _snd_pcm_new(struct snd_card *card, const char *id, int device,
 	pcm->internal = internal;
 	mutex_init(&pcm->open_mutex);
 	init_waitqueue_head(&pcm->open_wait);
+	snd_refcount_init(&pcm->users);
 	INIT_LIST_HEAD(&pcm->list);
 	if (id)
 		strscpy(pcm->id, id, sizeof(pcm->id));
@@ -862,6 +863,14 @@ static int snd_pcm_free(struct snd_pcm *pcm)
 	if (!pcm)
 		return 0;
 	if (!pcm->internal) {
+		/* Also close lookup admission for BUILD-state cleanup. */
+		scoped_guard(mutex, &register_mutex) {
+			scoped_guard(mutex, &pcm->open_mutex) {
+				pcm->disconnected = true;
+				wake_up(&pcm->open_wait);
+			}
+		}
+		snd_refcount_sync(&pcm->users);
 		scoped_guard(mutex, &register_mutex)
 			pcm_call_notify(pcm, n_unregister);
 	}
@@ -897,6 +906,8 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 		       stream != SNDRV_PCM_STREAM_CAPTURE))
 		return -EINVAL;
 	*rsubstream = NULL;
+	if (pcm->disconnected)
+		return -ENODEV;
 	pstr = &pcm->streams[stream];
 	if (pstr->substream == NULL || pstr->substream_count == 0)
 		return -ENODEV;
@@ -1015,6 +1026,44 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 	substream->pstr->substream_opened--;
 }
 
+static struct snd_pcm *pcm_get_from_minor(unsigned int minor, int type,
+					  void *(*lookup)(unsigned int, int))
+{
+	struct snd_pcm *pcm;
+	struct snd_card *card;
+
+	scoped_guard(mutex, &register_mutex) {
+		pcm = lookup(minor, type);
+		if (!pcm)
+			return NULL;
+		if (!pcm->disconnected) {
+			snd_refcount_get(&pcm->users);
+			return pcm;
+		}
+		card = pcm->card;
+	}
+	snd_card_unref(card);
+	return NULL;
+}
+
+/**
+ * snd_pcm_get_by_minor - look up and retain a native PCM component
+ * @minor: native ALSA minor number
+ * @type: playback or capture PCM device type
+ *
+ * The lookup holds the PCM registration mutex through reference acquisition.
+ * The caller must release both the PCM reference with snd_pcm_put() and the
+ * card reference with snd_card_unref(). An open file retains its PCM reference
+ * until release, including any mappings that keep the file alive.
+ *
+ * Return: A referenced PCM, or NULL if the minor is absent or disconnected.
+ */
+struct snd_pcm *snd_pcm_get_by_minor(unsigned int minor, int type)
+{
+	return pcm_get_from_minor(minor, type, snd_lookup_minor_data);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_get_by_minor);
+
 static ssize_t pcm_class_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
@@ -1081,14 +1130,17 @@ static int snd_pcm_dev_register(struct snd_device *device)
 					  &snd_pcm_f_ops[cidx], pcm,
 					  pcm->streams[cidx].dev);
 		if (err < 0) {
+			while (--cidx >= 0)
+				if (pcm->streams[cidx].substream)
+					snd_unregister_device(pcm->streams[cidx].dev);
 			list_del_init(&pcm->list);
 			return err;
 		}
-
-		for (substream = pcm->streams[cidx].substream; substream; substream = substream->next)
-			snd_pcm_timer_init(substream);
 	}
 
+	for_each_pcm_substream(pcm, cidx, substream)
+		snd_pcm_timer_init(substream);
+
 	pcm_call_notify(pcm, n_register);
 	return err;
 }
@@ -1101,6 +1153,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 
 	guard(mutex)(&register_mutex);
 	scoped_guard(mutex, &pcm->open_mutex) {
+		pcm->disconnected = true;
 		wake_up(&pcm->open_wait);
 		list_del_init(&pcm->list);
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 35152fae74ca..ba544fb4bc6c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2355,17 +2355,20 @@ static bool is_pcm_file(struct file *file)
 {
 	struct inode *inode = file_inode(file);
 	struct snd_pcm *pcm;
+	struct snd_card *card;
 	unsigned int minor;
 
 	if (!S_ISCHR(inode->i_mode) || imajor(inode) != snd_major)
 		return false;
 	minor = iminor(inode);
-	pcm = snd_lookup_minor_data(minor, SNDRV_DEVICE_TYPE_PCM_PLAYBACK);
+	pcm = snd_pcm_get_by_minor(minor, SNDRV_DEVICE_TYPE_PCM_PLAYBACK);
 	if (!pcm)
-		pcm = snd_lookup_minor_data(minor, SNDRV_DEVICE_TYPE_PCM_CAPTURE);
+		pcm = snd_pcm_get_by_minor(minor, SNDRV_DEVICE_TYPE_PCM_CAPTURE);
 	if (!pcm)
 		return false;
-	snd_card_unref(pcm->card);
+	card = pcm->card;
+	snd_pcm_put(pcm);
+	snd_card_unref(card);
 	return true;
 }
 
@@ -2942,11 +2945,16 @@ static int snd_pcm_playback_open(struct inode *inode, struct file *file)
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_minor_data(iminor(inode),
-				    SNDRV_DEVICE_TYPE_PCM_PLAYBACK);
+	pcm = snd_pcm_get_by_minor(iminor(inode),
+				   SNDRV_DEVICE_TYPE_PCM_PLAYBACK);
 	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_PLAYBACK);
-	if (pcm)
-		snd_card_unref(pcm->card);
+	if (pcm) {
+		struct snd_card *card = pcm->card;
+
+		if (err < 0)
+			snd_pcm_put(pcm);
+		snd_card_unref(card);
+	}
 	return err;
 }
 
@@ -2957,11 +2965,16 @@ static int snd_pcm_capture_open(struct inode *inode, struct file *file)
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_minor_data(iminor(inode),
-				    SNDRV_DEVICE_TYPE_PCM_CAPTURE);
+	pcm = snd_pcm_get_by_minor(iminor(inode),
+				   SNDRV_DEVICE_TYPE_PCM_CAPTURE);
 	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_CAPTURE);
-	if (pcm)
-		snd_card_unref(pcm->card);
+	if (pcm) {
+		struct snd_card *card = pcm->card;
+
+		if (err < 0)
+			snd_pcm_put(pcm);
+		snd_card_unref(card);
+	}
 	return err;
 }
 
@@ -2999,7 +3012,7 @@ static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 		mutex_unlock(&pcm->open_mutex);
 		schedule();
 		mutex_lock(&pcm->open_mutex);
-		if (pcm->card->shutdown) {
+		if (pcm->card->shutdown || pcm->disconnected) {
 			err = -ENODEV;
 			break;
 		}
@@ -3025,6 +3038,7 @@ static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 static int snd_pcm_release(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
+	struct snd_card *card;
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_file *pcm_file;
 
@@ -3033,6 +3047,7 @@ static int snd_pcm_release(struct inode *inode, struct file *file)
 	if (snd_BUG_ON(!substream))
 		return -ENXIO;
 	pcm = substream->pcm;
+	card = pcm->card;
 
 	/* block until the device gets woken up as it may touch the hardware */
 	snd_power_wait(pcm->card);
@@ -3042,8 +3057,9 @@ static int snd_pcm_release(struct inode *inode, struct file *file)
 		kfree(pcm_file);
 	}
 	wake_up(&pcm->open_wait);
-	module_put(pcm->card->module);
-	snd_card_file_remove(pcm->card, file);
+	module_put(card->module);
+	snd_pcm_put(pcm);
+	snd_card_file_remove(card, file);
 	return 0;
 }
 
-- 
2.43.0

