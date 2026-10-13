Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13D3A5422
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877442; cv=none; b=ogNca6cO4RhGmBUtG9aXlaJpoWmYiyHOsTLcRHviGEi8xU+5ZB9WHzafhK7JuK3cpLYzItXqkHR4eU4h3VKhKCMwD1QKRETdFku4NVPIpB4nzJbNi6bsa+bKc/2Op4H09QkeMeaqRoXHD5R8/XeJodSD7Y6RKPn0DcNgrNRn4AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877442; c=relaxed/simple;
	bh=pwNblbWrm5OD5TA5me6F3/LOLUd0mFmzYtucFfkbMXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWhoicKyoR0BKCtm/vLOlfoGi5RcN9bcifqhdIM8KG94Kz8mDrInFgh+QAJL9Agrp6yF1N87+d40D/Rq07mHX2WJQ+vk0DqnRQ82kq3q2ZlVJiXb6oj/pihlqv5E/bCTnceJWHUIAcvXVLza1R+MMn39RJQ69TRdGFjD7X7bqc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V48sbRFp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V48sbRFp"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1551316a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877439; x=1792482239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4Nga1IEEBSo5687TyetgrCo6afRO5bkl3ZzOjXmUS4=;
        b=V48sbRFpPRZn+HJJJrPQzfIOK+Wp/VzaXuja5xzlP0qoiUzi3XRGJ51rPjcVVM6LR3
         GZ/aASgQY4n5v+jIM+Nk5zJ/YMnzERz1gtipOmROQNlAEYHr5pBesYY0iwqjwGVqtxuw
         N71/eDdb2PytT3Xp4GV9uggeX43h26Pl+f/U72XV1DjLoGd7+JQ8GqI2Y6pwFLLBi9X/
         GVFChClYPwm1ms3muZv5erxoZVL0NpR0GVfVEEAh9j6Ow/oKSufEeEAzGFRTw9R77CL4
         PSNY5EmISXJCEM7KYYETQiLS3kjoJyN+49sycY76ShY0WMC+xs07zbfLA98A6gx6jOL+
         qVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877439; x=1792482239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4Nga1IEEBSo5687TyetgrCo6afRO5bkl3ZzOjXmUS4=;
        b=rdQteKfNnmuptY78mcDrHulprRfdMyO7Gwaz78cSIAGC6J+pM9nX5VWiM7afNUZgXh
         sQDwDlkL9ETc1bux84CPg7r/YtjRr1SUh2GdthLCcIy82rj+0zvKpIQ2fYNSaY2I+EcZ
         +iNOGa7K/uW9Zk6B2+kPITMOGARC7PKq5U73Hd1x+HNbr2RzEHXQeZtAxfAcGGvwaqUB
         UvL1aCgEFiH3HvgMrUpnXdugK8kApGEtK/vkYy+udRqkbkzlCrHB5UOJxKHFoLmSHQaV
         IAhzxEjmF/6ulBYW3uYEFHq9Tl1syXdXzvzH5k7W/yZ5BVbe45nw4IYV4bHdkoEH7OIR
         oslQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0+THseU8Pi8Kqqf7qBKVleAzWL1TsSEjO9O8zl9G2uWoPoSr5eKltlI5qc7ajjXmUHTcIfvFAxjWPf5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+bNtwGtTtWYWdf11bMWrs6Eef8MRmpCzc7Ppv+WDVGKwHAfGK
	zTt/RmkcPrGcv6J2Sa1eQZ55U74RWIbm1o4Dqf7PXEYV7tioQARhQJBE
X-Gm-Gg: AYBFou3gHfpwlHCvh3scABe5plw10Ys8g74WN2zcotMOkbY67cdJOwaVhNG/0HkZhju
	lNrf1OPIPvLsO/xA9QIjwddGa6l+PIvX5mjiWNmGTNTcwcqeM3BSBmt8qfI6USfgRN578d7VNKt
	sXPam4prfIpawhbD14U/b08Cq+guICEznHoDQB/IUJ2gAI8LbVUFERJgPS0zOGLehwuMuVckSIB
	WGKpDmXHOEfWRkcfxdD6y9cchPiNAnEl3vCFhfWIdP3hRzmPSXAjBc/RE1NQC+u+0VoPEtr/YIB
	2tyCsoFuNm6iMf16W/TXw0XARjBEm5EI44GZwTZaNnaxfQjq744gr8RdDe7NF8Z0VsvY0HsS47e
	5Fblnm3WO+OpzrRlHIPPbe8RpDRNeVJUX3aWgEhfCkwcuTs3OMPlpHsEdAMq/twmr95KUEDscFp
	TMQ/mDreK1wXqJzNkHRd7b/WViAiWe0X1xU7mJeDlgwV8bpT8A+GzjXamClSRSqO02t/UrOegke
	DwIcNqnjCh/7jZn/VmaiDcptKXky0a3WybbzUmN+YfMQuMFJf0OdbUcJVzYROp5xuiIOP5e8JMx
	2fnplGBbrG/E3jMPAw==
X-Received: by 2002:a17:90b:224e:b0:3a8:9db2:a4f with SMTP id 98e67ed59e1d1-3ab3af75ac1mr8829588a91.51.1791877439448;
        Tue, 13 Oct 2026 00:43:59 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm20552825a91.4.2026.10.13.00.43.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:43:59 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v2 1/5] ALSA: virtio: Propagate PCM send failures through ACK
Date: Tue, 13 Oct 2026 16:43:46 +0900
Message-ID: <d6c405ed4ac3412b376e5c2fee70cd66703f921c.1791877396.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791877396.git.mynameisjune111@gmail.com>
References: <cover.1791877396.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
Changes in v2:
- Propagate send errors through ACK, retain indirect state only on
  success, and stop the stream before an out-of-sync retry.

 sound/virtio/virtio_pcm_msg.c | 12 +++++
 sound/virtio/virtio_pcm_ops.c | 82 +++++++++++++++++++++++++++++++----
 2 files changed, 85 insertions(+), 9 deletions(-)

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
-- 
2.54.0 (Apple Git-157)

