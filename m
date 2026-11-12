Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466217;
	b=eWuztlh9jIyRO8GIKp7eyC1V1uUEB6LVQiWz3b7Tbs7lIG3zfF0q1chBFesEvKwaOBa/
	 vVyOMh5BPClPm5ZclOlbdricxdfLuzMIQ1EyT4fgzfDfSxoKLwR1fAEfQr8sWYtSrtI9v
	 h3OgzwsNvOGLjhT9l2wLHjmbGPGGJkVUOXQYdRuBvLD3YGuIGpZatVfdFX7HMJpKRp3aB
	 qiJhu+34pUxfKylSMBT1fGAwE3M51pvKfNIn4aRbJMKNV70U0GqaoL1tE7eGcsKLPrPZX
	 9PxEOhSC0Xx1B2Jq9qaUMtc+awqLNkUoIT8ShblOlyUzRT/Mvf6fRKbV+mMngfMT2lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=weLrynUS1EB0/fGe0/7TUaL8Q85Gc7NkfmfRyr0zZsInCO1d41TPKd5081Zng5ioG1ph
	 vqYAqBEm9UNYJkpKYHVuQzBV/kqfQu/w1NrMsCrvMzxUJ/el5eBxj9lurb3PzakSSvKDr
	 5ZkN+RMT9qomVXM7V/wkHVI1qLyvHEnjscmFqqwV5PSVCeqY4GZn2jCROAdWSkLYD14x3
	 YG4Q6vo25hp6WHlkerTUu/gl1JWXuW8d/VZ2tCcCHP2Bab4p8VZ2mQQl+ERSMgmatddYx
	 vhsQ7FclBArjBDKdRDF+LRhl23JiImBmX71ajf8Pm1RYgyAawzi26cKfOPxz+Mi9wFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w0r+u9n/";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B85606B4A3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B85606B4A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w0r+u9n/
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058315c79so2057177b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466217; x=1795071017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=w0r+u9n/nXqBnBO0088THP7NFvNt9K9elbwIPUULtxNIDauvumpIasT+FjyPnZ0H9k
         Xs7fFmqzyTufNEwup2WZbqSCn8dq+1uBUOjI4bmWziZUDSRgiQTqihSneXsYS5XFxPpX
         bSbu+lxsgh+kFpq5nDoE6JATXSInr7Uywv+wdTkjb/YxS4+xurd3bBC2yG0bV3VmEUBj
         63oVxQWRBBtoJZr21zkRY+u/WWsPW6/Pn1Xo5Z0uxr+xZ+bkzdEVX4CcjK4DgbwPeKxH
         g0lJMcDcXEaNxVoA5DhCza1WOPk+o4CNLHWLFP9xxHMO514ZYZcPFw+jGcZbvgxFLteK
         iCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466217; x=1795071017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=nfU+VVV14T3IROjIT9vcIigII/oVPR6qZnZaxMpBR4zc9T2DUZst9awpostBYT8Nyc
         k7Ufd+7OAO/CKTcXUjmiSfktb2wT8gp3XLg4pnghSFyjjLmtiChhkOYk7x98qFSiiMzE
         /+Q0W23gfx5oY9cOUe82IM0XIwg+SIHEgdQTbK9SHHSO6OD30McV2KFLO2mriJ3eojNP
         Xri6oyISlV0DFJOePvLbmgAHkq//7+b9cNEc/lD3HoTIDDHe7cvFPPEU7DyP6x1jDxRT
         t0kiPu31Hfl58zK3VvSQicgMwrbL3/WjezR1JzJBq0gaWrTbOeS0fdpCz4RsDnbyBaX8
         3Zig==
X-Forwarded-Encrypted: i=1; AL+hErG6thox4LlrRPa46uAZB30uT3EeazYJpbPH1gFcw9IHRQgsNqAAdP1f+KkfMd38gg4s8KHVJsVElUIGUbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XWIw6jIQUgFWvpBiRBxpVNnkEaXj0vPK8SRkIe9S6Tra1+GyX
	b/X45C9EPbisAz9G3Kcy30IVYo2iCPE8JjFSPjrNWyc/mIVgS/6AKl9n
X-Gm-Gg: AYBFou1OSJH8URyj7QsVVElHD/O+dSfmjx8+Xcp1iRmp3zIYPdTsn2F2i4lD+aBaXyU
	DwUISPZpFYksIlU5oQJJ66fefujHCz6lqslVtzdtiXjD0nl+PFAR94+SRgyyo5nRHgFJLX4py/e
	v8OrBtdj23eIGClrYlYshSHDR0bM4LC9bxmiR6p3Upguj33oh/4d7/S/JUme+YEw4kCkbWDtkPY
	53PY5ph1OJnivTw01SZakrK+7RdzAUI7N3k1cW5C0jiB5niyfMst9My2FvJRvjYdyxsKImpwgll
	liMr23EjEJJkZxbPSdv3YlyeBk/mc1M/47D7VmKg1ndBes8Sz3gr235okxKMfCsnVIYNiamcL8H
	7ntNo1iqRQdO3rzxTrUNCMUJ129WcvdnN5bKRUWKRickH16mU9Tnf+u07aFH2dFuMW3HWPhFatU
	88eNIPHCvMtNx2RC5XVTz8m97u8zAJoARqnfimIljG5ymThyIthGaJbd8D6hjcJuHVd7tT1TToi
	uEFoz86foQdHuSjWMs8Y2yHMPcMRBtb1guTajIu3mnGwjDcnXDZb2kaivQJOeAso/kRDePhLHRo
	P6mbz31V6gAp0I0h7PhbMuOykEDngbVvDIsZLX7qdu5sZDNOcggbwW88bLK21SL4y30i1keb/yW
	wSBzU8JSvxygEGB2f2iIlg4lnE6Wib1N47VGl7eIpXGwZJF4=
X-Received: by 2002:a05:6a00:4187:b0:87d:dc3c:1b5e with SMTP id d2e1a72fcca58-8bc1ca72e47mr4389657b3a.26.1794466216316;
        Wed, 11 Nov 2026 22:50:16 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:15 -0800 (PST)
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
Subject: [PATCH v31 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 15:49:23 +0900
Message-ID: <20261112064929.11211-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
