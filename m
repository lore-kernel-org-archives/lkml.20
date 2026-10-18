Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5B94CA789
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332466; cv=none; b=t55QIfUTJOUHoLcDmFzxrfRow+Qx1na2k3Mm9b7XqZB0KNricL956Y0DxFKfrA7vaxmjFWJuNFYjGkCNkmwR6Gv5TUsRwbS/x/qxom5T62WXLbd21qGGiM7qtVzs+TQbanSZwnSfnCx5wlGv9Z5UJWyti/EIHJ0VmU0fZfO1O/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332466; c=relaxed/simple;
	bh=p8Q+YvHA5l+KC7uZqNRrp3ANlZkycAEPX67XTlWOCWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NS4Cf8En1O7AtErGDMkF24VdEXJbrx+tn3WxQUrYrPU7SUo9IdkGatlo1Nv3lUA5mdm3ZYn5SFL5oLF/mOx/FNWjMNh3faSTI/JDt9uBRcZbUcP1SK5q8JV4lAgzV1RS6AAxZHCE+FTmbUcSDBn2bEHDe/80HaUmqggsSYOxJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLydtikd; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLydtikd"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso755785a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332464; x=1792937264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZaRbcZLoBitZ2CxnLKfN67K5LpUB95jwZMvoruu/g4=;
        b=aLydtikdF77LvMG1duGSeKhZRcEVAUBtYWFRNJFfBBUPco8U48XjoC0Cq2drjj6hAy
         zQf4JWhPnk4VQnGiVpPLJMp2gNfhPgfb3qeHuUQQS/uouGvG1/QMQm8BFCS1Tu25eRco
         5JGjDizokqKBsRBkgrE7x08TmIOrKPG93aNbBOPryNdyU23y/nDe6xOSY+ABhsLYN6uI
         zrmLTi6wiYuQpwq4O8XlU0VFi0mLpbK7+8VGr7eaqjvqNsrL4d7mv61Nl5RPKLJcxu41
         ctK1RSGiIAVFeD7s5hUZhg4Qs7g+B0IKlnwabXpPUvWQDhiHg7YyDb7qyhnaLOdnijwp
         Oo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332464; x=1792937264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ZaRbcZLoBitZ2CxnLKfN67K5LpUB95jwZMvoruu/g4=;
        b=EUNFq3JzCM61HzxGfZ+/MvnTS9Orw6EnP7MsRZs54dRCa2DtsMR6euRD07uSYOjc7K
         YUMIDuRHODpNog3t/bkAbfoluyOmAsH75Rn/f1JMmQZUZvQa+i+ZgoMFPi+UQPrpquIN
         WMmPpqnd/0s1kiYwNYGiWESPuJYu7z8BITuZiWSq3DjwmpRkPVZcZLzQFetlbTg2RnqD
         +Td+hhzliogOg1VS6SxUhYePC2Q+k79WxPiowSwBsNoqAdi2CLww/5+1EASkualIjaqX
         xNFY+fxFebPijGSjtrAC/qV0/x9OtBWFqmsVNm5uxvs9iFgJRZkvDVwYR65sAiEXYBLD
         SziQ==
X-Forwarded-Encrypted: i=1; AKwUvBwssrhyRRqLcbyv4MnAuaZI/hBaHLiVjOBh+IDtv9V8soGTK31Lu47kzNKTSc7qB5k10d1cKycF6joCzeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAHDq4EsGuAeaLXdN67IlCoJ/04cI1IxXzxPSRXZF4wiD8BecB
	Tcc4PMeoq/HDXwAt4JD3n2DZZXD1URQ5ol2F/J7LK3948qdBMOtDZ8be
X-Gm-Gg: AYBFou3ivQix0qTdWheozvvCZ3oSR74rBN4PBh66vowxC0UiAIbFVw3/wRzhnVuOBrB
	WftP+FuryaYFowj+DJPHQUFrbSBjiJlvyxodyOt9Tgk867ypf0sOflN2wlxxSmPu6D+4u5uiB45
	6NWnsqexifTC84mF8K1WGjH4Rp351CJ5bpV36A9+gAE4RSllFeh0Bo/Quw/c+p8B9NbHBxwjpSa
	rcD/ng+2eK/sSmR/97HP4e2YOeR+EunxJXJNrsCWppypLLIteM5cUwnYxRp5djXYswH7/4nN3ca
	kEyfWWXfCghI5Kk949ZkFw9rjKQmSQGQyw6Fh0MaD7bmCivwFdHKq3CipDMwKv87pRYysjhoX/i
	QSTi3BtJQVmr5HqjeEShzsNvVKUhewj1lrPriO2iQ40uOiwSJZzBWwJV0hp2qRRvQJC+JTGER2Y
	4iBtBuwqJLJkRLyJTHL6yplZSr70V3OtBQ/7zDJh8nsaUtzTJ4p2N/HqD7V5tCLLPMNw==
X-Received: by 2002:a17:90b:184d:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3acef6300c9mr4079993a91.61.1792332463947;
        Sun, 18 Oct 2026 07:07:43 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acddc37958sm10149338a91.14.2026.10.18.07.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:07:43 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 2/2] ALSA: oss: Keep emulation modules loaded until object teardown
Date: Sun, 18 Oct 2026 22:07:27 +0800
Message-Id: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-0@gmail.com>
References: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OSS proc entries and notifier callbacks can remain in use without an
open OSS device file. Normal snd-pcm-oss removal can therefore delete
an existing PCM's OSS proc entry while late HDA codec binding repeats
snd_card_register() on the same live card:

  OSS PCM module unload                 Card registration
  ---------------------                 -----------------
  snd_info_free_entry(entry)
    proc_remove(entry->p)
    clear entry->p
                                        snd_info_card_register()
                                          republish linked entry
    unlink and free entry

The new proc node retains a pointer to freed storage. Mixer OSS removal
can likewise release an adapter while a card notification still uses it.

Hold a snd-pcm-oss module reference for each PCM registered with its
notifier and a snd-mixer-oss reference for each card adapter. Release
them at final unregister or FREE, after proc and adapter cleanup. Normal
module unload can no longer initiate removal while these objects exist.

Track PCM OSS registration with a separate bool registered. Unlike
oss.reg, this state also covers unmapped PCMs and remains set across
DISCONNECT until final unregister. BUILD-state and creation-error cleanup
must not drop a reference when registration never acquired one. The PCM
notifier's register_mutex serialization keeps the final put ahead of
notifier removal and module teardown until dispatch has finished.

For mixer OSS, serialize callback publication, dispatch and withdrawal
in the core so module exit waits for callbacks, including one dropping
the last reference, to return. Keep card enumeration in the OSS module,
with card references released after dispatch drops the mutex. Ignore
duplicate REGISTER notifications so a delayed registration cannot
replace an adapter retained across DISCONNECT and leak its module pin.

Partial HDA codec teardown can still remove an individual PCM while the
card remains registered; its object-lifetime handling is separate.

Fixes: 2471b6c80a70 ("ALSA: info: Register proc entries recursively, too")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/core.h       |  3 ++-
 include/sound/pcm_oss.h    |  1 +
 sound/core/init.c          | 29 +++++++++++++++++++++--------
 sound/core/oss/mixer_oss.c | 36 ++++++++++++++++++++----------------
 sound/core/oss/pcm_oss.c   | 12 ++++++++++++
 5 files changed, 56 insertions(+), 25 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 657b12e1e95b..d6584967fd49 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -301,7 +301,8 @@ int snd_card_locked(int card);
 #define SND_MIXER_OSS_NOTIFY_REGISTER	0
 #define SND_MIXER_OSS_NOTIFY_DISCONNECT	1
 #define SND_MIXER_OSS_NOTIFY_FREE	2
-extern int (*snd_mixer_oss_notify_callback)(struct snd_card *card, int cmd);
+void snd_mixer_oss_set_notify(int (*callback)(struct snd_card *card, int cmd));
+void snd_mixer_oss_notify(struct snd_card *card, int cmd);
 #endif
 
 int snd_card_new(struct device *parent, int idx, const char *xid,
diff --git a/include/sound/pcm_oss.h b/include/sound/pcm_oss.h
index c96f23c7755b..43f765300031 100644
--- a/include/sound/pcm_oss.h
+++ b/include/sound/pcm_oss.h
@@ -70,6 +70,7 @@ struct snd_pcm_oss_stream {
 struct snd_pcm_oss {
 	int reg;
 	unsigned int reg_mask;
+	bool registered;
 };
 
 #endif /* __SOUND_PCM_OSS_H */
diff --git a/sound/core/init.c b/sound/core/init.c
index 9deb5e920d0d..d518cb838777 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -82,8 +82,24 @@ static int module_slot_match(struct module *module, int idx)
 }
 
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
-int (*snd_mixer_oss_notify_callback)(struct snd_card *card, int free_flag);
-EXPORT_SYMBOL(snd_mixer_oss_notify_callback);
+static DEFINE_MUTEX(mixer_oss_notify_mutex);
+static int (*mixer_oss_notify_callback)(struct snd_card *card, int cmd);
+
+void snd_mixer_oss_notify(struct snd_card *card, int cmd)
+{
+	guard(mutex)(&mixer_oss_notify_mutex);
+	if (mixer_oss_notify_callback)
+		mixer_oss_notify_callback(card, cmd);
+}
+EXPORT_SYMBOL(snd_mixer_oss_notify);
+
+void snd_mixer_oss_set_notify(int (*callback)(struct snd_card *, int))
+{
+	/* Wait for callbacks, including a final module_put(), to return. */
+	guard(mutex)(&mixer_oss_notify_mutex);
+	mixer_oss_notify_callback = callback;
+}
+EXPORT_SYMBOL(snd_mixer_oss_set_notify);
 #endif
 
 static int check_empty_slot(struct module *module, int slot)
@@ -508,8 +524,7 @@ void snd_card_disconnect(struct snd_card *card)
 	/* at this point, they cannot respond to any calls except release() */
 
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
-	if (snd_mixer_oss_notify_callback)
-		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_DISCONNECT);
+	snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_DISCONNECT);
 #endif
 
 	/* notify all devices that we are disconnected */
@@ -567,8 +582,7 @@ static int snd_card_do_free(struct snd_card *card)
 
 	card->releasing = true;
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
-	if (snd_mixer_oss_notify_callback)
-		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_FREE);
+	snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_FREE);
 #endif
 	snd_device_free_all(card);
 	kfree(card->components);
@@ -912,8 +926,7 @@ int snd_card_register(struct snd_card *card)
 		return err;
 
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
-	if (snd_mixer_oss_notify_callback)
-		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_REGISTER);
+	snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_REGISTER);
 #endif
 	return 0;
 }
diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index f1fa42e634fc..a51bc68473e6 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -1309,13 +1309,22 @@ static int snd_mixer_oss_free1(void *private)
 static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
 {
 	struct snd_mixer_oss *mixer;
+	int err;
 
 	if (cmd == SND_MIXER_OSS_NOTIFY_REGISTER) {
-		int idx, err;
+		int idx;
+
+		/* Module loading and card registration can both notify us. */
+		if (card->mixer_oss)
+			return 0;
 
 		mixer = kzalloc_objs(*mixer, 2);
 		if (mixer == NULL)
 			return -ENOMEM;
+		if (!try_module_get(THIS_MODULE)) {
+			kfree(mixer);
+			return -ENODEV;
+		}
 		mutex_init(&mixer->reg_mutex);
 		err = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_MIXER,
 					      card, 0,
@@ -1325,6 +1334,7 @@ static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
 				"unable to register OSS mixer device %i:%i\n",
 				card->number, 0);
 			kfree(mixer);
+			module_put(THIS_MODULE);
 			return err;
 		}
 		mixer->oss_dev_alloc = 1;
@@ -1358,7 +1368,10 @@ static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
 		if (cmd == SND_MIXER_OSS_NOTIFY_DISCONNECT)
 			return 0;
 		snd_mixer_oss_proc_done(mixer);
-		return snd_mixer_oss_free1(mixer);
+		err = snd_mixer_oss_free1(mixer);
+		if (!err)
+			module_put(THIS_MODULE);
+		return err;
 	}
 	return 0;
 }
@@ -1367,12 +1380,12 @@ static int __init alsa_mixer_oss_init(void)
 {
 	struct snd_card *card;
 	int idx;
-	
-	snd_mixer_oss_notify_callback = snd_mixer_oss_notify_handler;
+
+	snd_mixer_oss_set_notify(snd_mixer_oss_notify_handler);
 	for (idx = 0; idx < SNDRV_CARDS; idx++) {
 		card = snd_card_ref(idx);
 		if (card) {
-			snd_mixer_oss_notify_handler(card, SND_MIXER_OSS_NOTIFY_REGISTER);
+			snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_REGISTER);
 			snd_card_unref(card);
 		}
 	}
@@ -1381,17 +1394,8 @@ static int __init alsa_mixer_oss_init(void)
 
 static void __exit alsa_mixer_oss_exit(void)
 {
-	struct snd_card *card;
-	int idx;
-
-	snd_mixer_oss_notify_callback = NULL;
-	for (idx = 0; idx < SNDRV_CARDS; idx++) {
-		card = snd_card_ref(idx);
-		if (card) {
-			snd_mixer_oss_notify_handler(card, SND_MIXER_OSS_NOTIFY_FREE);
-			snd_card_unref(card);
-		}
-	}
+	/* Live adapters hold module references and prevent normal unload. */
+	snd_mixer_oss_set_notify(NULL);
 }
 
 module_init(alsa_mixer_oss_init)
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index bd19328dca9e..e8df27d09b97 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -3151,6 +3151,12 @@ static void register_oss_dsp(struct snd_pcm *pcm, int index)
 
 static int snd_pcm_oss_register_minor(struct snd_pcm *pcm)
 {
+	if (pcm->oss.registered)
+		return 0;
+	if (!try_module_get(THIS_MODULE))
+		return -ENODEV;
+	pcm->oss.registered = true;
+
 	pcm->oss.reg = 0;
 	if (dsp_map[pcm->card->number] == (int)pcm->device) {
 		char name[128];
@@ -3205,8 +3211,14 @@ static int snd_pcm_oss_disconnect_minor(struct snd_pcm *pcm)
 
 static int snd_pcm_oss_unregister_minor(struct snd_pcm *pcm)
 {
+	/* BUILD-state and creation-error cleanup need not have registered us. */
+	if (!pcm->oss.registered)
+		return 0;
+
 	snd_pcm_oss_disconnect_minor(pcm);
 	snd_pcm_oss_proc_done(pcm);
+	pcm->oss.registered = false;
+	module_put(THIS_MODULE);
 	return 0;
 }
 
-- 
2.43.0

