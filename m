Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444469;
	b=iV1QGEIQk3dIC6SEjWomkjoyfUdd93gvmKo8SLmbu2O2+Ap53r+WVMoqqu95HPmDOtn9
	 rZij89t+rvDf2gc7+9iYbIJfJKKrjyjk63K7bdxRTXqjEtrAn0R9eQV5FrV8ODpIUDOa4
	 KQHyO7cZ+QpFV7ovVrdr2yCHH/qjpVKxgVaWi235uWaBAAQCCr6mniKL5a6JG+k/qi1Kf
	 fbfEubWe2946aOSf7cDaLlcgJt9S28cB6PXeMCjR0MlwTorscs/A0yyhFVOlA2QHDXTHF
	 5dpySbnh3i8m3A2r7UxGQCOdl8nMfw/6G1SAVO8kNzOpXjsNQ9ueuhYhaS1m2Q2iCUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=ncLZqmzQhsO3pFIxB04cw/5YEHNzOpT9I/AKDtu7rXIvfnpHN5R0o5X9Z9l6fzXnRraA
	 9yJgn/9Gpy3bG/XtN8Y9I/4NMKuJ6JAGtLWbr9h/3b3jyhRT7fRVxFalnlzvbEt4tMW5L
	 fhuCFHb5itp9Y8bKjrn48ALLpbsVQIlI314xn/l28Gwvlbbc1pRQakdwGRBXwfGxXUAkM
	 8dfTiuHsSdhBQ+GCOzqo1evo66Mh84/Truo4UCW39emUMHTsg2IVZXpDLTxZTt4a5+i+F
	 AL0VqQgYPDW5GmkujrCpiwWt9WVmTKVSG4KSXH8htkYVsejD0nhqvhx1BVw9f+fnH8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TWAmWQF/";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0A606EE3D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D0A606EE3D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TWAmWQF/
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37628596783so3350775eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444469; x=1795049269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=TWAmWQF/8aVnX9KRr3yk9s4sS7z47XvDJLd0luE+eON527O4KHqJLTbjLFPeFZVrkK
         wQ06Pga3D2bIhgXWh1KC+iqkwcASMhJIlxSNC9wTfI5nlyKKWjodlIhMsD1LaVEthPQp
         hN4y/wKcbrXv7Sz7M6wqx5wQ+JGnJi3fmJ2/pJAd4qlJOr0/Vs0pJNi165iYk7vOpThP
         PP3cS+v276IgzDxrxXRsRDu6jkmsiMJGduLplmjcy9B0BAwa8+VEt1P/YadyaGWTkWq1
         gUIjNWKAiRMrR1MBOPNk2YT4YE0KXHB1+rs5slDgH5bzqPovcDIdOISIOd8eoD9MvKKk
         gjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444469; x=1795049269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=I53coFqb+/pqzgz/4WrTEylhjMWgSAZ1fMZkFNY4+VrVy6rreIf2Eryi4zEp4bOPSb
         VKIHeRg6rQVSF6sL+ExOFHmT/KFoen/mQiQgsS2sbeYz7U2e9RSff2OFPGIwOv1QHvbv
         9L2d4Gs5DbMrU8cV+X6cp52MkExaXPxjj3OkH08GEFaDMXlN4NI1nocaqfZ7+Zdx04OL
         bZshtkdSucX1fq5VbvfO89CAbjG5HRGJirZCJL+EG8BZbGY9WQPD1+NB26l46ztEkHWh
         HU4KEmxAJkcoEECV0uM3MqQkx5nz5L/FMVhYsOegSjkEmK1XgHhGw+6SL33JpD3LC+Zb
         YBIw==
X-Forwarded-Encrypted: i=1; AL+hErHMoB5G5kqKzNWVr4ZsNuIa1j8ZAp5hDMt++8Y86TTHSUdhVnrTg8fVqIqWuxxqU70aoTUdMqU/hI2XuB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kqwmtpcTlLnAONX/jmEO2dRHhBgFp0NgADF94xc7btgWZg1R0
	RMkglAFIkZylCiCm2JcU0jRpeyhj7kfNMu65XUnbtW4reFqPfuPQ7tPn
X-Gm-Gg: AYBFou3Mv1D6Rq0TYHsk4p5p0WFWB82Eke7N2CApDyU4Yt/kODHXexEEeciaBUUFwbo
	IkcdKBzkf1/6I3k+qNET7H41C24cpt3y06XovDWBtMN0DQW/VWbb3tEhBwo4hUCChVzslvUa6l1
	czPhJEzLKWdRicTmRvFc0fojeKwGNUbnu971nn5N9xps+T7QcOWhC4ECpv9oO3gEjilWEJnoPcp
	V6WlgjfsSQGTm7dlsLK7t58VAqNMSnuM0XpKdG13RWBKTBEA//Nb874gZLwvxDuzECv7set7pxe
	kn8kBYnMC7V2QPUhXcsblRAdhR9gZcpEDqPywzNWKhzzm42lcz9YcE47bGSuE9RiGTk0s+F07MD
	lF07SqG9pJwxOxEYzCQ8j4znVNPezPwHZUEVDgD8U6EPMUMYBPa/5BW+pRRoRYulkChxXriB6gg
	1CWv+ZhDMKmb0Q2kyA3yTDWcG1i7nX6jEIjr5eK4BgDOVlQ6m7Dt/x7tnp1r4vHjij6vt5M9FEW
	VI49ZiSpKJ0pvJJX5M0Ph1Qr7yzTBdWIPyjT7A92DS6JBAWaSR+lE7lFwOSfQACMbhMQIfGp2Pf
	aJuCl2CvoZm0KueeirPExPOKBAoVCBWtfjzoRWY/9drIZNhF5lhD9jNmRV90I42rvXMhtrfVeH+
	ZBfDYaKwkSBGy99Nw5cRk2NVDKQ6+T/V+nHgX2BakqIFU7YQ=
X-Received: by 2002:a05:7022:b058:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b3c137c87emr3424050c88.29.1794444468572;
        Wed, 11 Nov 2026 16:47:48 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:48 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v27 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 09:46:58 +0900
Message-ID: <20261112004704.49758-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request
is still pending. A later teardown may then submit another RELEASE
before the first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels
the pending request and wakes the waiter.

Keep timeout and wait results in the types returned by the kernel wait
APIs.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 sound/virtio/virtio_pcm_ops.c |   10 +++++-----
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -265,7 +265,7 @@
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
-	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	unsigned long js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
 	struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
 	struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
 	unsigned int nouts = 0;
@@ -273,7 +273,7 @@
 	struct scatterlist *psgs[4];
 	bool notify = false;
 	unsigned long flags;
-	int rc;
+	long rc;
 
 	virtsnd_ctl_msg_ref(msg);
 	/* This reference stays with the queue until completion or teardown. */
@@ -314,7 +314,20 @@
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -20,11 +20,11 @@
  *   (RELEASE command in the ops->sync_stop()) and the ops->hw_free() has been
  *   called.
  *
- *   When the substream stops, the ops->sync_stop() waits until the device has
- *   completed all pending messages. This wait can be interrupted either by a
- *   signal or due to a timeout. In this case, the device can still access
- *   messages even after calling ops->hw_free(). It can also issue an interrupt,
- *   and the interrupt handler will also try to access message structures.
+ *   When the substream stops, ops->sync_stop() stops and releases the device
+ *   as required, then waits for pending messages. A failed control request or
+ *   timed-out flush can leave the device able to access messages after
+ *   ops->hw_free(). It can also issue an interrupt, and the interrupt handler
+ *   will also try to access message structures.
  *   The messages retain references to the PCM buffer pages until they are
  *   freed, so late DMA does not target pages released by ALSA.
  *
