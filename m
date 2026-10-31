Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423695;
	b=xdsiL3FkZMted6Qe1FBkOJQWKtqBtOkcu1UqW3bApf9PxQWeUT+bLgUbjvEb8i2dzWUE
	 03QkWqAsBUdDcrMpm2evZJ9tKOJH7rZ1Mc+n18MI6mpdo8aBpfamsu691vsWGnkOKwvGl
	 PN3n1TBojBzdECvtDichQPIeIj1rtjnGJw2xHnTKliwvjqGpOuUQIR0ecI5XRFMnlXsUY
	 r8Wo4TrrrbOJmy+2RFxBt59GcQG00zZaZrTb/mn/KoxJ7y0h1o1DwJfR5DRbQmTWWGCF7
	 SmF11UMzmTCEtgMh8/RxTRZVVPU2Trkw45k3gQmce52YX8LvfbSM5vv8bQQaMtd/VJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I5kdRbiDo1ouYiMDtlQm4jSpPGK0rwxskw2Zi5YRXSM=;
	b=ZepAEtb13t0Y1qmVOXQVc/S+G9nWrmw7xRoc2Hig6aoHfff6tjMyXy4Qh/hV9nOiy8X7
	 28V9rJRTd2TqbzZsUoJWgabUD7RAd+wNCf4tByJzdGcpRs88dzDcRLXqpTlhuif4Haq43
	 tuBLT3sXbsIXCupXEIWzR9fqLX6nW3l0AjoQatqWbG4S4kVvcu/AqY2daYGiTTIip8kYf
	 WgOzkLsQKDQgjtm7gbducMrnuHhFfC5gmAV0+C2WMPLurYAjFG7BD0HWVjloLIaNyqY8d
	 wyvG7T+iPD3M+QR/v94zagbtcAplE+OEci+uMpc/7wCLCQiFvGFtNJa06a0ddQXrVfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9YhxxVe;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C482B606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C482B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9YhxxVe
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso611055a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423694; x=1794028494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5kdRbiDo1ouYiMDtlQm4jSpPGK0rwxskw2Zi5YRXSM=;
        b=i9YhxxVeB9sF9KlUzxAtC5Ddp+SDRQ06IwJy7Zy2CgsbJQhz2zGMjw2c1sVmZEHN3j
         ojho9wNIP54IhVNObPaf/nDig/snZgd2ZNr4EaqBoCfeQoOtBAV/HNU4H7aCjQrvR703
         CYVkBdGP1fxfZDmHbDkDmtVfwduMTyVX62zl+PJX+Nvo9A5rYDJp/VaYW0B5lCbQUmVr
         AyJeggsX4G4y6veKYlhx3YDDLBkNO7trs/2MrTefuYIq1VONP7sQIhW1amxCd8CZsGbu
         I2pPOblLFWcOH+jpYNFvlAOqJjuFDKoate2maqB3TOxxrhoIFI6k8WQToEk28eDoYyRN
         TyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423694; x=1794028494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5kdRbiDo1ouYiMDtlQm4jSpPGK0rwxskw2Zi5YRXSM=;
        b=RtMPUqJDQeJlksLhZ+S5px2kXKde8h5w9fqsd9fQsvxXzsY8qTHbYGwIWvIchP7BSs
         SAVIZG/Zh/2OWdjUiLWhJuYKUMJnWol9oks0rdesc22+BrxKJKMi+tRkv0o5d/gcXuWy
         lVBwQkAH8B1f9Qx+iBWWXJmqLOpwC5qhsLC/mHTEl5l0BncHuFZXJBqfZesWjZ8GR/Yr
         aW7N7cV6MNJjtcFIzi9d/aR1A35X1K3mvwvJ2JjeDweOUoxkba/eCZ85UmmFyL0hN6Jo
         9LRO4G3e6xbVn/bHDaGCPdE0/f2U69Sdu5ZonefZ+1nWdTUlO8y/NG780Rc4LQXJNhPx
         LaNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdd4tmElGb2Iqt67rZ4aJjRDdGIhNVewNkg8lkZ4POMrD5U4zHa7IYBxrAEx6QfjK1as/12Ad6lBolT7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl6plEnhIf1DQi1sl24xLVo01Tzjd1E/m8hfyUJHeaPStM3cC9
	kuMnMFjPxIrWsM3aaGHB66OOwryWg85vk20v7+taOVoQc7+EwON5BfH/q07PEuk+aMrSpw==
X-Gm-Gg: AYBFou0xeQ8NwXIPANGzReIjocYdggTY5W5ZrAPGXnHb+e9nxNi8hKxTHWVP0zsYvOL
	ef53NkYvSb4YvzsGRDfEnQsnNAhUdLqi1hdy1+tUyCbLABMdoxSJ4yGguxJ35XmHC+tYPuq+hp/
	bOvARxzCCLMZJSPvHdStqhX8I5yIA1Ub4PF+EblKmLchckE4bUg5hf/UGpE8kt+6zSxRxT906xk
	Wvzq+9WWkix2BOu1p1qN1Q801TOzeSy3QIjmD45IUOVL6nbezQtFik8oOdxfORnMAbcU1fnQMXT
	wdNGV3sZXznvwadI2ZvPMhsmspQ/43K8T55ug8PZtJi43vZmuals0Hkt/ZTcbeRMuDGqxqGe1Ki
	DCdKapgy1A9pGQHxRrhoKwgA5XDJjHwuTlPsyfcmf0joGWbSILZbyicdCvn7e3r+Sz1/Y+bjwV8
	NxEmC2jMGPVEgYDKe0tpvfGzNmtpCRZNPJORK+99lqmDepfi4IuQnl9/aZdun368CtIIEOAxc76
	PWjszR69I3aoR2ptcXIS66P5fvX1QO/uY+XV5wsbASFTF9/Mr+KhgmKEH1J8jViFTGCd4qTl7c3
	7xYpNJarQzf8S7cU7sAP1jP2
X-Received: by 2002:a17:90a:dfc5:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3ae897dd47amr3669742a91.67.1793423694168;
        Fri, 30 Oct 2026 22:14:54 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:14:53 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 3/5] ALSA: pcm: Add the file to the card while looking up the minor
Date: Sat, 31 Oct 2026 13:14:28 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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

Use snd_lookup_minor_data_file() and snd_lookup_oss_minor_data_file() in
the native and OSS PCM opens, so that the file is on the card before the
PCM minor can be unregistered. The opens then no longer need the extra
card reference from the lookup.

Without that reference, a failed open also no longer reads pcm->card
after it has removed its file, which would race with a remove that waits
for the files before freeing the PCM.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/core/oss/pcm_oss.c | 19 ++++++-------------
 sound/core/pcm_native.c  | 37 +++++++++++++++----------------------
 2 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index e8df27d09b97..2d99df900f76 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2497,15 +2497,12 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_oss_minor_data(iminor(inode),
-					SNDRV_OSS_DEVICE_TYPE_PCM);
-	if (pcm == NULL) {
-		err = -ENODEV;
-		goto __error1;
-	}
-	err = snd_card_file_add(pcm->card, file);
-	if (err < 0)
-		goto __error1;
+	pcm = snd_lookup_oss_minor_data_file(iminor(inode),
+					     SNDRV_OSS_DEVICE_TYPE_PCM, file);
+	if (IS_ERR(pcm))
+		return PTR_ERR(pcm);
+	if (!pcm)
+		return -ENODEV;
 	if (!try_module_get(pcm->card->module)) {
 		err = -ENODEV;
 		goto __error2;
@@ -2558,16 +2555,12 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 	mutex_unlock(&pcm->open_mutex);
 	if (err < 0)
 		goto __error;
-	snd_card_unref(pcm->card);
 	return err;
 
       __error:
      	module_put(pcm->card->module);
       __error2:
       	snd_card_file_remove(pcm->card, file);
-      __error1:
-	if (pcm)
-		snd_card_unref(pcm->card);
 	return err;
 }
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 35152fae74ca..89bfe1f358ee 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2938,45 +2938,39 @@ static int snd_pcm_open_file(struct file *file,
 static int snd_pcm_playback_open(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
-	int err;
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_minor_data(iminor(inode),
-				    SNDRV_DEVICE_TYPE_PCM_PLAYBACK);
-	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_PLAYBACK);
-	if (pcm)
-		snd_card_unref(pcm->card);
-	return err;
+	pcm = snd_lookup_minor_data_file(iminor(inode),
+					 SNDRV_DEVICE_TYPE_PCM_PLAYBACK, file);
+	if (IS_ERR(pcm))
+		return PTR_ERR(pcm);
+	if (!pcm)
+		return -ENODEV;
+	return snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_PLAYBACK);
 }
 
 static int snd_pcm_capture_open(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
-	int err;
 
 	nonseekable_open(inode, file);
 
-	pcm = snd_lookup_minor_data(iminor(inode),
-				    SNDRV_DEVICE_TYPE_PCM_CAPTURE);
-	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_CAPTURE);
-	if (pcm)
-		snd_card_unref(pcm->card);
-	return err;
+	pcm = snd_lookup_minor_data_file(iminor(inode),
+					 SNDRV_DEVICE_TYPE_PCM_CAPTURE, file);
+	if (IS_ERR(pcm))
+		return PTR_ERR(pcm);
+	if (!pcm)
+		return -ENODEV;
+	return snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_CAPTURE);
 }
 
+/* called with the file added to the card by snd_lookup_minor_data_file() */
 static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 {
 	int err;
 	wait_queue_entry_t wait;
 
-	if (pcm == NULL) {
-		err = -ENODEV;
-		goto __error1;
-	}
-	err = snd_card_file_add(pcm->card, file);
-	if (err < 0)
-		goto __error1;
 	if (!try_module_get(pcm->card->module)) {
 		err = -ENODEV;
 		goto __error2;
@@ -3018,7 +3012,6 @@ static int snd_pcm_open(struct file *file, struct snd_pcm *pcm, int stream)
 	module_put(pcm->card->module);
       __error2:
       	snd_card_file_remove(pcm->card, file);
-      __error1:
       	return err;
 }
 
