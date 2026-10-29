Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252645;
	b=K7lXsLGh8MtiyOtqbjNYJX6KYFQz2ol1XvkN47qi1zUUkhbQxd1NqwUujC1C5MBaQAR+
	 Jpy5U4YzbN0uFsuJ3k2ud2gbM0jM63KM2DUr21/6+vovGZTaG7lq3IUWtFRMS+dfRxE0G
	 nC6IIq41TZbvayFj7jMIOs2sOENSnEfPTWWflok1A8YNP2GH7LjLu1qyDGZHqu1js+vlQ
	 ejJZVehr5lAwfljaqfhZMxQUILzLbTwyi/guDY2R8+gRp/c9bxXvYUZqiIxeY5UWds5jO
	 ybUTIKFwaE/rl+RTpDYC7LotQUZsoQiCYpqSz/In6w+JkXwoLANFK1KJVXy7iusymKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kgp/0IKbbzTkFGoA+p+0MZbAmeWaaCFVonzMq0pKQfk=;
	b=rbJ9PgfentH8cDTzFV1gNKPcqNkqMEL49hSFbvt2gpDvwfqKOg2s+p0S+RH7wpU0p++e
	 8caBhI4MFcPyhoSdCm5Iago3F7mW/bXNy3w6WDbdB9AEVgAVriVGXHTOGLmjjR+2xb2Ne
	 luQaoC9MdLh3S4GigssLin58fLjWl2P4KY4kCRjl71OvPRhYQ60Oi1+Castu1Quly8HGi
	 5FYqmeKWkotfBcb20UpJd/5R1KjCSUMxAOi8HGSJnoIGeXd1fHevxgra/dIMGLjaEHx96
	 HWJJiz6h1I70PAzgpViAB/F8rFvn+PNIQTlGwtsF0SANxwoZ9ZFINyeMiDSAZxroYWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUiAT+p3;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F81606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F81606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUiAT+p3
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so913521a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252645; x=1793857445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kgp/0IKbbzTkFGoA+p+0MZbAmeWaaCFVonzMq0pKQfk=;
        b=NUiAT+p3vew3dvCFUIFB3TQ9suA1ZcTgZdKitD1bCw68LxSEV4NHT1ejzYx1LzQR0H
         Ltsm7SgPqyFvmRK9/d+KWPVsL/gCY6c4xHiJAuTxE9TeXMnJYLTiav2++JK8qOsBoTYS
         zmIKAD9cOVx9pxRwC7rp+pTnL9z3C76PjhzsdZmwzflWzU6sYsrU3muuRnm0pPAck5Vj
         q5Y2jk7LShtO3A4w4BVuc7q2OKXL8r/4pBgwKiN7RgoPURpOuS9hw5BTkWyuSkyHzuu1
         gBzv8v143lgaNW2mqohG6MSOfViGY9PtTUZPNpQejWp7ah1BctRX78C+D7IsXhVpbFUP
         iX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252645; x=1793857445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kgp/0IKbbzTkFGoA+p+0MZbAmeWaaCFVonzMq0pKQfk=;
        b=Hmf4+Uvj4hN8KlgeOKSQjGRM/Qv+7qv8qda9IzLEbYsfZiTefKB1k100W/0qeNVA7o
         uqIH38wq8yIK99Sq251xNCxZ1XENiC4+f647H+CMqgTf/9XTpaKFV+pf6RCemdS23yAU
         1vIaP72Q4WPGElQl/nSb8d9xZ3/W2BiSBpDwt7NdpwS/dXbwFvuthg0QILHsw2WErNtM
         LXG28FTSCnBXt7LhUF4gvqIaVsRg7Qn42AOT0sEP+gKL4Atwjp3v11S7kzGCLUd3bfIx
         t5AYmQAV+JfQze3IXlgIL2P9LK3WYNt8M66aOSajKmLNqYoSNosSSYe1SLz8/sU/gRRQ
         bX/g==
X-Forwarded-Encrypted: i=1; AKwUvBxV8kGcNhWcDi6lJbv8s7u+jil8Uy1qvFz0NE1XjurhDEey0advWqkmYyNbvEVaHSz5GV3+ORDr10QCjfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlJyaovWcFdpgaE433MUGINeWy0DNDzP+J+vkKJaVS2JYlb4Wn
	gDZQRVGis2VFrcMZsGY120xIIOnklbSjvzzzX1IgDhp5fn3Jzib9ZiMX
X-Gm-Gg: AYBFou3dfv8vv+33fq9qCxcSfJ/VUZB4+mVVs2Pr3t9VrN5LQJAoL4GmWPU4tnB6ZaY
	qOQz/VLE5V8hFsRb/aYtKZld9Esiu1RIlu7/4Y/tiBntanwypmM8JKUfuuq2AocjxH2SdQg2OMM
	HNRCwpc62fo3HPiGlz6lWJY2cMJTfOBiElk5gufXFSxpDt7eslsIudJtZ+8Xdp1K9SstIXEtYb5
	qs0MNAnREa8fRzrg0+UjLhXt94/zU6Rm9qUQzo3YWDjIGe42qNp+3X4X02TRgXBZLXoM44dNTvp
	PaEyNPUdrjAwjt+rbBhE7/5QcZMoogxag/UWRzEslSXpossIaGGLXIT1OXnHiawJT38fTpTpv+A
	+Xu6YXQlzIFdYiPcMfC5piulkK7cfK8UrpTcjX/DrYGd7PQKCYzX7XJIZuxidL0BjKoF53D+qsU
	PwkLbE0JDjv5s5jOKo8jUjY9gBgN27Nsbo+bC5X86D2F96TMD7pXHTdLoMdLF1f34ymGlrKINm3
	Hg2IDqM9StDhl83jnFNN/RX04XCibHlKunyUn+fweOhcotbuA0OWfJYiNkXPR+iOUp3rbEIl/fn
	YU73vFfekj2eq/IL/hz0oYH7ROfxGmKIH4rGvKFyYEdbKSepquD/1ZhjCz1bOGFx2UZccesnWML
	Al8BKJFIBwznjgnNwy90K/3bE9HTKDib+U1sDmlzopcFOgj4=
X-Received: by 2002:a17:90b:5242:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ae58100ac6mr2908685a91.26.1793252644765;
        Wed, 28 Oct 2026 22:44:04 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:04 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v8 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Thu, 29 Oct 2026 14:43:41 +0900
Message-ID: <20261029054354.2931-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

virtsnd_pcm_msg_send() can fail while queueing a transfer. Restore the
failed message's length and notify the device about earlier messages
queued by the same call, so they do not remain stranded.

Propagate that failure through the indirect PCM transfer callback instead
of discarding it. Commit the updated indirect state only after successful
submission and stop further transfers when a send fails. Return an XRUN
error to ALSA so the stream can recover.

Keep the polling feature path unchanged.

Fixes: fe981e67568c ("ALSA: virtio: use ack callback")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 72103f606716..5371f4985fd0 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -260,6 +260,18 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 				dev_err(&vdev->dev,
 					"SID %u: failed to send I/O message\n",
 					vss->sid);
+				msg->length -= n;
+
+				/*
+				 * Do not leave earlier messages queued without notifying
+				 * the device when a later message could not be added.
+				 */
+				if (msg_count != vss->msg_count &&
+				    !(vss->features &
+				      (1U << VIRTIO_SND_PCM_F_MSG_POLLING)) &&
+				    virtqueue_kick_prepare(vqueue))
+					virtqueue_notify(vqueue);
+
 				return rc;
 			}
 
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 1091100a4c98..a40ea394bf17 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -466,36 +466,100 @@ virtsnd_pcm_cp_pointer(struct snd_pcm_substream *substream)
 		vss->hw_ptr);
 }
 
+struct virtsnd_pcm_transfer {
+	struct snd_pcm_indirect indirect;
+	int error;
+};
+
 static void virtsnd_pcm_trans_copy(struct snd_pcm_substream *substream,
 				   struct snd_pcm_indirect *rec, size_t bytes)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtsnd_pcm_transfer *transfer =
+		container_of(rec, struct virtsnd_pcm_transfer, indirect);
+
+	if (transfer->error)
+		return;
 
-	virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+	transfer->error = virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+}
+
+/* Caller holds vss->lock. */
+static void virtsnd_pcm_transfer_failed(struct virtio_pcm_substream *vss)
+{
+	vss->xfer_enabled = false;
+	vss->stopped = true;
+	vss->substream->runtime->stop_operating = true;
 }
 
 static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
+		transfer.indirect = vss->pcm_indirect;
+		if (vss->stopped) {
+			rc = -EPIPE;
+		} else {
+			rc = snd_pcm_indirect_playback_transfer(substream,
+								&transfer.indirect,
+								virtsnd_pcm_trans_copy);
+		}
+		if (!rc)
+			rc = transfer.error;
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: playback ACK transfer failed: %d\n",
+			vss->sid, rc);
+		/* ALSA treats -EPIPE as an XRUN in ACK and pointer paths. */
+		return -EPIPE;
+	}
 
-	return snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
-						  virtsnd_pcm_trans_copy);
+	return 0;
 }
 
 static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
+		transfer.indirect = vss->pcm_indirect;
+		if (vss->stopped) {
+			rc = -EPIPE;
+		} else {
+			rc = snd_pcm_indirect_capture_transfer(substream,
+							       &transfer.indirect,
+							       virtsnd_pcm_trans_copy);
+		}
+		if (!rc)
+			rc = transfer.error;
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: capture ACK transfer failed: %d\n",
+			vss->sid, rc);
+		/* ALSA treats -EPIPE as an XRUN in ACK and pointer paths. */
+		return -EPIPE;
+	}
 
-	return snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
-						 virtsnd_pcm_trans_copy);
+	return 0;
 }
 
 /* PCM substream operators map. */
