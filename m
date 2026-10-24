Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842093;
	b=XVvhNY4Ce3iQ/wSOQe5feHHRoJAm3+FuCinfq2g1BKmBfNTiurbprnNddpTHOjrRMVz9
	 0IcQGtOm4HZ4ajia81V1NZovnsj2xhKbVu1BGEnSkoHmbd1AmcbTFCFPimwirp+mlVPKX
	 Srj5LrHy170YNGVA81yw/ORdhPx9rJGTneQQ9exdGs+o4//SB5/THIcWTCVhOMVmXesKy
	 mFE0KSfdrReQmylZvEiuEqf6hyZf9zLpton6Raiebe+BcGr7veLo+NYKoFo+xwFChWUHk
	 U2krwMfJkAlIbrR2tTY3otSB1iXUOyHCkfImvvI6eL6bPiu9w2cpP/AVvjZOX9Hm3PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tnedoe/gFzpi2ROqHZcGBD/7JdKGXf+n+5ulPMXSXwk=;
	b=UWIKCqzK2YWLOqIMzpse3wG3lsB8oAz/rv6OQxe+Dcf4yH6lE2rtQ3KLP5uy2srQYlmy
	 JoNIqDSTKSCcceFDFus/Uqa2fEWMuGjIYHbzIQyabQe/1kUrRZ//O8QG+OIfiLKdXwb5e
	 1mPx+lSwg540+27RZHzR2PjCYg9AUCUmEFlueCaF2oe2999yayZrkiL4yC/uvdjQZZMFh
	 UPtfKKWz3OkutU4MBDS5k3cfhLwSdRRrAI8BCcH1uq72chVwppmfd+qsTcaCAzasHKcb5
	 Tp0qKlC10ZIYxiJjTGa1cF56V6i5g1w/Jp4NrWA1Yd1QDgMIYylBrj9bQkGDr6MtdyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Q6k/zVM6";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26DA606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F26DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q6k/zVM6
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9d7791b00so8469155ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842092; x=1793446892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnedoe/gFzpi2ROqHZcGBD/7JdKGXf+n+5ulPMXSXwk=;
        b=Q6k/zVM6D66RE3FA0X3wcrNy57oxJpYmiLfOnkAJZdBPr2D1O12m/JQH+JfX35zQgV
         LnkGSRF6CHEsSwixLaQNk8DDNEic/f/vJN8SMj0QaX9wMhLfpbl2aadQlnjL6fyeEcyv
         TM/1c7TpCX27axPwdH1eSbi0kNsiCPMDIp0hrk2zQF8dkPGcbrEk2AU4ENxJ8i3NNJXO
         uARRcnhBXnhe5WQ0RTXs9YGHucvBWZMTcR4j5N3qCcZznZ2y6hXC6d30PSCtYv3kXeRD
         NMye9B4woEzJAwbLdiK84cUPN53YsPzm7XWrQx9OW9RJwjsllrZPrztxwR2HfAF/4h2T
         2FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842092; x=1793446892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnedoe/gFzpi2ROqHZcGBD/7JdKGXf+n+5ulPMXSXwk=;
        b=dLBkfOSwxsJZsj+Xtm5rACIeTIR3oSuVIvHK7mBTPskYaYTlHTw9lSu7Zebfy8iNO/
         XNL/xDx3jkbhkXTkzmZ2FinLjpq7J20/JlQvWtWCerBCpeyq159N7JbjKAf3Tp/Y3G2h
         bMilS5s22IxuatRaqCdMinclRjuQ1No44JmGyq11bdvgNnlvg/IZEvT/et5vxTrYEPY+
         Xd9XqleLzv5lZy1wnjQfqmOQqd8LYwIxh6lSwYRCD31XFCDV8689FDvq3qzCq0h+F36q
         y81YnJlQVFN5hFK5SYZBjHPA2qPf4DYfyyXqRvdwvsYtwJMZOWNFJQ0IW3ISPYCpkibC
         9EuA==
X-Forwarded-Encrypted: i=1; AKwUvBwEyePfGAUPQco2BXG/dRM9KmpkRgrwmxfJGLv4w1qgp6Yn4x9jMNVXBS6ZjSHUIei20aqhFrejc92uIlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr6CZ+4bmNnSBiUx0yJAIY/ROqYzdCK3fiz1PqmfGGIVIqQiXl
	pMO7HVRsBhz97/qPvgQ2FnuhxZKeFZWQ1vwAcp4x3HpqpSxax+KVJAE7
X-Gm-Gg: AYBFou2H7+GF12c45tXSnkpoxSFLAItS61lAfvI9/n/2VIaIRmmicRyONOB8x2wKUJN
	jXsjDdc+CwU38/yKv8Xx6nr0FNEXNruNqpr+zOwl+q5IoGEDJLqTiA1j8BMAxvIqBdIvmPWONL2
	ikCGhzQ2paM4Wm0rJYTLKRaycCpdtKeJES2FOeqt1o3HcEk5l8CSMEfA+pra94/KYRmigMXN9xD
	0wtVM/3KA5BcClLPdffOELSSiuABMhOCRL9eLRXjuWjVZ47dzImmlgtBIboQg+HjLlE0d3a5ccx
	fIp4KM9X+Hhoxy009+fdY7zfWFpSQHXNHx0vujA4cnnM6Qf5e7ooLQkhW1U8+Dvk6pPnAdEOyE5
	14mFjAi20sNGpw8BPJRKjjMNmTqMIPpPsTv8XjZe8ECY62lLDu5MqR+KnFG/z17eQcbqpgvDXCh
	bAbZhmJqjpX+PThe6D4AIMGugBeIdo61AZ/mf51A7+yC2DEPb8mfsuL1Vp9DDZ7SNMWGkvuHujB
	6TJihJIh6neQJ/gY5tIg6VUN5h/tQzPK6ObCHRMpW179SID+Ys=
X-Received: by 2002:a17:902:e948:b0:2e9:6972:54d7 with SMTP id d9443c01a7336-2ea9c7c9d0amr13791805ad.52.1792842092272;
        Sat, 24 Oct 2026 04:41:32 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14c774sm4738515ad.38.2026.10.24.04.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:41:31 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 2/3] ALSA: pcm: oss: Retain the PCM from minor lookup through release
Date: Sat, 24 Oct 2026 19:41:15 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-2@gmail.com>
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

An OSS open uses the PCM before acquiring open_mutex and before the HDA
driver's open callback takes a codec PCM reference. In particular,
snd_pcm_oss_look_for_setup() walks the stream's setup list during this
interval. The lookup's card reference does not retain a PCM component
removed by codec-only unbind on a registered card:

  OSS open                             HDA codec unbind
  --------                             ----------------
  lookup OSS minor
  retain card reference
  snd_pcm_oss_look_for_setup()
                                       disconnect PCM
                                       wait for codec PCM references
                                       snd_device_free()
                                         snd_pcm_free()
  use setup list or PCM in open

The OSS module pin retains its code, and proc disconnect drains proc
callbacks; neither retains the PCM for this early OSS open.

Use the PCM core's lookup-and-retain helper for the OSS minor. Hold the
PCM reference through the early setup lookup and transfer it to the file
on success. Drop it on every open failure or after substream release,
before the last card reference can invoke final card destruction.

The final PCM free now waits for that early opener before removing OSS
setup lists. A pending opener which resumes after disconnect is rejected
before entering the driver, and a waiting OSS opener observes the PCM's
component disconnection as well as whole-card shutdown.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/pcm.h      |  2 ++
 sound/core/oss/pcm_oss.c | 20 +++++++++++++-------
 sound/core/pcm.c         | 15 +++++++++++++++
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 8fdb07f2f542..12559c2144cf 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -577,6 +577,8 @@ int snd_pcm_new_internal(struct snd_card *card, const char *id, int device,
 int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count);
 
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
+struct snd_pcm *snd_pcm_get_by_oss_minor(unsigned int minor);
+
 struct snd_pcm_notify {
 	int (*n_register) (struct snd_pcm * pcm);
 	int (*n_disconnect) (struct snd_pcm * pcm);
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index e8df27d09b97..9f0dae051ecf 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2497,8 +2497,7 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_oss_minor_data(iminor(inode),
-					SNDRV_OSS_DEVICE_TYPE_PCM);
+	pcm = snd_pcm_get_by_oss_minor(iminor(inode));
 	if (pcm == NULL) {
 		err = -ENODEV;
 		goto __error1;
@@ -2545,7 +2544,7 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 		mutex_unlock(&pcm->open_mutex);
 		schedule();
 		mutex_lock(&pcm->open_mutex);
-		if (pcm->card->shutdown) {
+		if (pcm->card->shutdown || pcm->disconnected) {
 			err = -ENODEV;
 			break;
 		}
@@ -2566,14 +2565,19 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
       __error2:
       	snd_card_file_remove(pcm->card, file);
       __error1:
-	if (pcm)
-		snd_card_unref(pcm->card);
+	if (pcm) {
+		struct snd_card *card = pcm->card;
+
+		snd_pcm_put(pcm);
+		snd_card_unref(card);
+	}
 	return err;
 }
 
 static int snd_pcm_oss_release(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
+	struct snd_card *card;
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_oss_file *pcm_oss_file;
 
@@ -2584,14 +2588,16 @@ static int snd_pcm_oss_release(struct inode *inode, struct file *file)
 	if (snd_BUG_ON(!substream))
 		return -ENXIO;
 	pcm = substream->pcm;
+	card = pcm->card;
 	if (!pcm->card->shutdown)
 		snd_pcm_oss_sync(pcm_oss_file);
 	mutex_lock(&pcm->open_mutex);
 	snd_pcm_oss_release_file(pcm_oss_file);
 	mutex_unlock(&pcm->open_mutex);
 	wake_up(&pcm->open_wait);
-	module_put(pcm->card->module);
-	snd_card_file_remove(pcm->card, file);
+	module_put(card->module);
+	snd_pcm_put(pcm);
+	snd_card_file_remove(card, file);
 	return 0;
 }
 
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 17cd60e8825d..380ce0781342 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -1064,6 +1064,21 @@ struct snd_pcm *snd_pcm_get_by_minor(unsigned int minor, int type)
 }
 EXPORT_SYMBOL_GPL(snd_pcm_get_by_minor);
 
+#if IS_ENABLED(CONFIG_SND_PCM_OSS)
+/**
+ * snd_pcm_get_by_oss_minor - look up and retain an OSS PCM component
+ * @minor: OSS minor number
+ *
+ * Returns the same PCM and card references as snd_pcm_get_by_minor().
+ */
+struct snd_pcm *snd_pcm_get_by_oss_minor(unsigned int minor)
+{
+	return pcm_get_from_minor(minor, SNDRV_OSS_DEVICE_TYPE_PCM,
+				  snd_lookup_oss_minor_data);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_get_by_oss_minor);
+#endif
+
 static ssize_t pcm_class_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-- 
2.43.0

