Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FED86DCE1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792253080; cv=none; b=q7Pl658sdWjDOtiP6YVQ0tmikYGl5QGWZzpgRdlaFQkY5y/DK93a0FifV/uJNp2csDgQsfilhT+VDP+iqhPg9pVvoqvJMC0qkF1KPnkkBDp6M/hXIrzCzwLZuIblT91RLUoPH90u5JP3s6axovYJxMe4Yt0EQZL5SDsEECns2y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792253080; c=relaxed/simple;
	bh=q5GwUydFJGngM47C47iSjnYFjCrPgo6jRNKeTUJSwQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QynLgz7FFPHsmmub++0QIh9scvg34VbI4dFlruRXMXsfm7xI9yYEI9elDAxHcWWhwtlG6DwL3qF6sAEqTPyMS4pzB/I1BMqZ4kO9/WIWHt2H2x/m6H/t2S432zoZwKRMWxYS6V4eBm1VA+773U/vb/ehDbYSMNUhl0XspWnAJ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkBE1bch; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkBE1bch"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9cf928dc9so180245ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792253077; x=1792857877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3QwA5vW0f4s8qEaJOYzG5jC8EAnnYyjXtd9OHFplOi8=;
        b=fkBE1bchDK5c7fi+t30FVQoXhMElkpMPuRS1bmk9jXwVhEqcOlsn9mmyJdhHa8oRWM
         ps4zkD3z037V4/qmaM8PPWcS6ThIGzCYV6gCKFuXC69ZOgkV8BA5zet9NcYGlyU2lT98
         tUJ2jiVqIryc1beKE/f4LXDRTcNRgzv1RDg17AJuMAIuxW5MSwz7QAxy8cXqcp2RwuIN
         QE6PGvDXsHicAQ1Qp+A9y3JuZ1QKYhTVtYDUn6O/aDJgdk3Wr+CKWZgRjAVt3BSF38iH
         0rvvNPe9EOeGCaJunAR1V275sRJnns7dY6tJ+p24G+/ny+y+AXWEpeSStUoSAPaCTx0E
         7tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792253077; x=1792857877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QwA5vW0f4s8qEaJOYzG5jC8EAnnYyjXtd9OHFplOi8=;
        b=n9qPxM6M8vSOyKp4ygXwnv3BDRRbBZXo1eg/5Yvdoxhplo1p6om6WoK00ZklFCRWh5
         FksLX381io/iC0SCBtkSUVMtxdpu3tre7ZsNAnR+woDYodpUA6Zgc73PXhEOKA6WQa22
         dyX8rALfAHlBxPR2yFChVo22km0QHIQEDy40yFFTpCmFDVHZzt0b5N7dMCQM3gg7IMkt
         CzSiPnbMw3i1a6PMc7QU/C7TikKextNL7Gv7/TYlo2xKEqGIq/juv2cqKoV6SkFIJkve
         T9kXr1RhxQIZQW6sA1k3rhdATvsL/A/pPClfodoQMe7mne2C9gMbNY7KmPnoSyeRT1XQ
         1twg==
X-Forwarded-Encrypted: i=1; AKwUvBwr1TqUrhueIHLZtfKopRmmkg4yfOAi56GVDs4u0GAPSBMZOYxySRWWt5LRHjEUETlguXImcEfxDJ4Aq5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLlcnw1Rnz1onGFqFq3FvJgdoToS0TzIUvoteUS6btHdOORCnn
	vDKn7BsIWiBm5ubBJ9eOzsBQbrf3z1jEcvNaPZs8725pI3a0icH5tEEf
X-Gm-Gg: AYBFou0D6bSZ60xNxSb8r207DUgsrGDXm0sC3pj5anWACIioGbbaGZuSGFcVMprcYqY
	5o3z8Yvak/3iIYfHGQgl/GrcRjZotAXBWDEHATAcJAY7tsvdAstqpjmbvsFCr9vCwOG6mz1olyJ
	4WNdw9GJuITx6Suu4NnhdcTwUYRGhx2YpHV8TH60Vq2RnZbRUu32oFpz4WOtREIP1nE7d9U99Cc
	h5eP1tviOjpc8hhNkMFzWqJw18+JuUZF4DTsyWlh85YSN0pZ8B0PJHT6tzG7xTbhHygb4RrMYn6
	YJo7uhECgpnQbAMvTDLKaURFb48GB2TErhmm3uxEO5fRdCGALc9UJOZjIZIFelLRAHC5W9tCBUR
	ToY/mr3vYudU6TwDKDzqSkB38sgqJMrN/Af6RFj0gjQt+DIJ4NOh8/0jQZRqlV2Js/dZsaVeLye
	t8f3Ji+MZfd+gW0NarGYXR/S0GpuC3fOWpurV/M8R28d+8YCptghitfRsAefgYPkby+aA=
X-Received: by 2002:a17:903:2a87:b0:2e6:2023:29fb with SMTP id d9443c01a7336-2e977569c8emr43336385ad.29.1792253077263;
        Sat, 17 Oct 2026 09:04:37 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e835063sm22296545ad.33.2026.10.17.09.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:04:36 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] ALSA: oss: Keep emulation modules loaded until object teardown
Date: Sun, 18 Oct 2026 00:04:28 +0800
Message-Id: <pm-pmb-26d66390a25fec9fad6c-v4-a7d8a5d3db28c5bca90a@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OSS proc entries and notifier callbacks can remain in use without an
open OSS device file. Unloading snd-pcm-oss on a live card can remove a
PCM's OSS proc entry while a repeated snd_card_register() walks the same
entry tree:

  OSS PCM module unload                 Card registration
  ---------------------                 -----------------
  snd_pcm_oss_proc_done()
    snd_info_free_entry(entry)
      proc_remove(entry->p)
      clear entry->p
                                        snd_info_card_register()
                                          snd_info_register()
                                            republish entry
      unlink and free entry

The new proc node then retains a pointer to freed storage. Mixer OSS
also allows module exit to free an adapter while a card notification
still uses it.

Following Takashi's suggestion, hold an OSS PCM module reference for
each PCM registered with its notifier, and a mixer OSS module reference
for each card adapter. Release them at final unregister or FREE, after
the corresponding proc entries and adapter have been removed. Normal
module unload can no longer initiate that removal on a live object.

Keep the PCM pin independent of oss.reg: disconnect clears that field,
and unmapped PCMs also participate in notifier dispatch. Record whether
a reference was acquired so BUILD-state and creation-error cleanup do
not issue an unmatched module_put().

Protect the final PCM notifier traversal with register_mutex, matching
notifier removal. For mixer OSS, serialize callback publication,
withdrawal and dispatch in the core under a lifecycle mutex. Module exit
then waits for a callback which dropped the last reference
to return before withdrawing the callback and releasing module text.

Ignore duplicate mixer REGISTER notifications: module loading can find
a card whose DISCONNECT has already withdrawn the mixer minor while
retaining the adapter. Replacing it would leak the old adapter and pin.
Keep existing card enumeration in the OSS module and drop its card
references after the core dispatch helper returns, outside the mutex.
The new locking is confined to lifecycle notifications.

Partial HDA codec teardown can still remove a PCM while its card stays
registered; that object-lifetime problem requires separate treatment.

Fixes: 2471b6c80a70 ("ALSA: info: Register proc entries recursively, too")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM
---
Changes in v2:
- Follow Takashi's suggestion to pin OSS modules until object teardown.
- Track successful PCM pins across disconnect and unregistered cleanup.
- Protect final PCM notifier traversal and mixer callback withdrawal across
  the last module reference drop.
- Keep card enumeration in the OSS module and prevent duplicate mixer
  REGISTER notifications from replacing a disconnected adapter.
- Leave partial HDA codec teardown for a separate fix.

Link to v1: https://lore.kernel.org/r/pm-pmb-26d66390a25fec9fad6c-v2-743c9b89c0f0d761eda1@gmail.com

 include/sound/core.h       |  3 ++-
 include/sound/pcm_oss.h    |  1 +
 sound/core/init.c          | 29 +++++++++++++++++++++--------
 sound/core/oss/mixer_oss.c | 36 ++++++++++++++++++++----------------
 sound/core/oss/pcm_oss.c   | 12 ++++++++++++
 sound/core/pcm.c           |  6 ++++--
 6 files changed, 60 insertions(+), 27 deletions(-)

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
index c96f23c7755b..fa78d7e3a3ee 100644
--- a/include/sound/pcm_oss.h
+++ b/include/sound/pcm_oss.h
@@ -70,6 +70,7 @@ struct snd_pcm_oss_stream {
 struct snd_pcm_oss {
 	int reg;
 	unsigned int reg_mask;
+	bool module_ref;
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
index bd19328dca9e..cc239929dfca 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -3151,6 +3151,12 @@ static void register_oss_dsp(struct snd_pcm *pcm, int index)
 
 static int snd_pcm_oss_register_minor(struct snd_pcm *pcm)
 {
+	if (pcm->oss.module_ref)
+		return 0;
+	if (!try_module_get(THIS_MODULE))
+		return -ENODEV;
+	pcm->oss.module_ref = true;
+
 	pcm->oss.reg = 0;
 	if (dsp_map[pcm->card->number] == (int)pcm->device) {
 		char name[128];
@@ -3205,8 +3211,14 @@ static int snd_pcm_oss_disconnect_minor(struct snd_pcm *pcm)
 
 static int snd_pcm_oss_unregister_minor(struct snd_pcm *pcm)
 {
+	/* BUILD-state and creation-error cleanup need not have registered us. */
+	if (!pcm->oss.module_ref)
+		return 0;
+
 	snd_pcm_oss_disconnect_minor(pcm);
 	snd_pcm_oss_proc_done(pcm);
+	pcm->oss.module_ref = false;
+	module_put(THIS_MODULE);
 	return 0;
 }
 
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index c133f23418fe..35ece386d1a2 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -853,8 +853,10 @@ static int snd_pcm_free(struct snd_pcm *pcm)
 {
 	if (!pcm)
 		return 0;
-	if (!pcm->internal)
-		pcm_call_notify(pcm, n_unregister);
+	if (!pcm->internal) {
+		scoped_guard(mutex, &register_mutex)
+			pcm_call_notify(pcm, n_unregister);
+	}
 	if (pcm->private_free)
 		pcm->private_free(pcm);
 	snd_pcm_lib_preallocate_free_for_all(pcm);

base-commit: 2533eecf592c2d7434170bf9669a4270fd594ae2
-- 
2.43.0

