Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347443;
	b=N7wWfkaMBqoUdO2yTaBT7uFgKh9inauHnACjYGbq0qaHgK1URcSlSD4kDMf5EKn0G9mT
	 3unwp/bopV7kiQiQ/AjhFgDDESNaX8RpAul1ZQ+cx3/45orH58e7bwluUszPL33BXShgI
	 oxk9w7LdMTJCKEpTt4lvBipVJTOCKFwOuLcKa6TuLi9qIm0iG4b5D9+/bxF0qXAlu5bLB
	 zrVrVL7Ir5LroaZ9/do9fo/d1COTWFfq3Y4/19E5wN0dLF0aA8ewrgXU8CHaJ8fguHKZe
	 QFlvXEH1MjhZQFrVecZn7fzETm3iGSs/1DbHqCULRk+NdyIV5v1l05QlD1otLZyUx5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LFgGmpp8gd7H3GyjBY3/eSFS06JgJbzV8ZW5JhjT65U=;
	b=X1XGWJLRBX/exmkuvg9Di+ikzmOLwqhKQ7UUwQAJ2zQ15Mz1Euh0To3sFC1SaiY77cxc
	 br4B9rwlPyO+4LiB7gQ2tkWwOJEjUecvZ2YNtmg1PmzXffsnV4/bDDN/2ats0oXLLu56A
	 V8puGSnVI7VOEWZjDcgQouofFTegA5SrQKj8IdI9f75EFSZFcvwFgguM9aJ588md7wOWW
	 zDAwymTHUFbZwIcGTrrx6NPSQXZ6FRAKtC/+Etk8gilQmLaRevdMFFHnvpOKTz4+e/zDh
	 KJMABNLl0p8ChTIQVdu3/sBC9tTO2IQfinlqSo++2OWiUZ/zx+4w/Dxo/sy4JL45hEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTKjskP1;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA389606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA389606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTKjskP1
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so230052a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347442; x=1793952242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFgGmpp8gd7H3GyjBY3/eSFS06JgJbzV8ZW5JhjT65U=;
        b=eTKjskP1yKldmIxYqTo6SF1jY2vCuO/r9e89RVH1m1uwu2hK18wGnRB/+OuocCSqs+
         pSyfQKj9kte4Rf8uzbMRVjZ/58AJLfrk3Be/0a3XbmTlnzYUp6dDEDo1eBMyNP8kSGlS
         r7jJMB7mZdPXr0IL+RDqVzCf7Kne7hBFfBI8kza7RwWIQcx2fSVQBLnWoZsXX6jn9F0w
         J/wxmZKMHlPZehKUTM2C07mvdoVITffvLX1lOq9HaXAizxZxF1VLdpmXbu/Xr3DCZJjO
         hJ13BMmzNRLzVVc5lTetPPwQ5H2NIcz12N4nDRMUqK7QNlymAZYbpqqLuYeoEQTVnaNB
         juEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347442; x=1793952242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFgGmpp8gd7H3GyjBY3/eSFS06JgJbzV8ZW5JhjT65U=;
        b=wi9J7fAbwdrSkH2U38JYSuonm05VaMP3htaVFjP7NfE/DUHgyotxlgM09EccnHm51/
         hXyd106sZ1SQjHmitkg2SUv2saR8EPmlilamINlglZiPFf0hh6Kz2R0N+HxPvYSYWtlN
         W+U8tRjmjQt+CnJkXJIMXeHEn+q+EY3AXO9CgjZGYjpxNgIzMSlmpAphqNKgHrJ6FqcV
         ERttbxTvwyvGAS2MngNipLRzJLFpW9/yOnTQq5zLpuQKLy+UV60rp0Rdt7Bqx7UUtmss
         APdLAIJx2zI2Frq1iSNqB6KfbE76BnPAqbp5hpVzP9qnlMApBw9qtHNG+oeTe14CMsmP
         MJ6A==
X-Forwarded-Encrypted: i=1; AKwUvByRhrrRfDyqvR9SuZusT0MF6fXapGI3eF4QCjHSw07DbrlyI2IwQwDtEfh++oI634Vj5Mkdo7ewuFg2lyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdP98m84aeAQ9K6n32EJ8KzfRyMJ09kO/1tlR0e4jKvIj+aIuE
	OGOPphWNuqPwP2aTN9CHAxPOGF4q+vzfa354Gz5wyCfTMWRIjn/6fv7Y
X-Gm-Gg: AYBFou1U7dfNJX8orjRoK+y3zRqGZJmg8WYsSZEw5NOGLcoeSMb/boU8RKPtf/5Nkns
	oaO/V+biU6WVKcUba7E9X6PiW768pgm5CLUseB107x5TVcwIIT23cNh7zhjVkQwVrSiQMbSEujQ
	pVNWsPxIBujne9QUof8sBa43PkhZCjNDec2ExBXvOU/saSYmSiOSGShIwC2buVV3Tb9hTMb1ybF
	NM/E7dpBI6LBEKDeOO7ilOVB7NdZkWLNxZqVUdtiF2HyP3leLlAjzbMwsG4RILslDZhZ1qodkIu
	K1e4Lsu0uHdijENNvGEvqTEeo/Q9XCAtEzcbIwZxcw+pS0GT9Yj25Z/L9wLmd7W3ZNsl0BIut+Z
	raoGuT1NOCSdfRCi2zdKqJA75Xr2anXoNyUAyTbYhYPNQf04Eau7NuEv8TdlCKvRDAF+GRS49O7
	jgNzaM/q0kvmPvBqqN8FzzQFGekK1KYrIdhzogSdPytaN+IQx7xTBiZZFI1NfWOLnrP6tqZWz+x
	E0APKuX8Ppy15EqW5n6pnwgt2KhCAuAIxYHnC90Z93CA9F4mbpJkEE95UgONJ7sRQblwHt1K6TJ
	d2TmAYXKY0auszO5RNdTgniM
X-Received: by 2002:a17:90b:574e:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ae897c94f6mr1099490a91.20.1793347442212;
        Fri, 30 Oct 2026 01:04:02 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:04:01 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 3/5] ALSA: pcm: Add the file to the card while looking up the minor
Date: Fri, 30 Oct 2026 16:03:41 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
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
 
-- 
2.43.0


