Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263845;
	b=GY5IBDRJY/iaQPY4PaV7f9v4q0BJzA9Fi6+y3ranK9qGVI/tGPBn0YsDNMloGaOZCed6
	 cyUuN7v8GAtcDL7LEQpZwIkbmpRxVT+o0qC4HU29FEr6GPx5dMU17HaYHUhKAv9ALCXqI
	 vDcV3tutKlc4dHy+wFiwySfFwh5BVCno4v3uzudL5s53QyNNdJeiEKsqKwQ4z39PZnPgA
	 OeKUe0bD49veAChSJPLtwy3QjxQvv3ULH5xaY2RNU7ohjMZDM5RararfRtMBSziV+ROqU
	 rPTKCcxCLC2FOw1bpRRwAt1O5X54VxOv8V1x4PplXfj8AYWPn0STCmXSUqGRqwcJMMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=QSMPM4UATCpdf+eeIutcIq0frBx0yjhahH0EAbl9sqS5+7IywvHQMmhsLORai04FPJ4K
	 BfuHNWGEYn85CTIQbjlXmr6lG7AiMg4DL6OH8AzA8njoo1/19958hxEeWXlJtLFg3N1jp
	 nx+GP5uoXL56BThbt/adNNMUa2Ldf+qd1MADi95bvMRwZxaJU12iWaTDNc+PF/0SCswDc
	 DL21d4AKZ7l2480TKNBj7+oQ607rtp+M6wUMOuuS1/WKDij6WwoyI/8r4DTymDM7ocGOT
	 T4WoOtqjbjSIe5wuhAFvVfT8WiZ2etzAxpgnvlwHK9nB0SrjnilKCDxN7qLOB8XRwLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDf97nYJ;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94958606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94958606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDf97nYJ
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8b20a899fso13088845ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263844; x=1793868644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=fDf97nYJsM+l8W2HoLcXALuU3OhZZ18vxeZy1z42+xZqnOIYL0fyGQBj5NDqFGXbiB
         6QWFcojFGjLFzIkN7OdmvGh9/DDP9p9o2QOQGl+dghNsSQktLyaLLH0qlay2joz6hJel
         2VfyTRFE/HZnMdl7U+1HImD1aSRx1cGC3HfnuEHQapnoobNKE4g8H1pqiC5BJGoXV/pl
         cf5pxSXolNtJHH/ssCZM6Xc48LDb7kTrguYzejX0HTNopLl0Wgc0UHVy8sejosA2BFYQ
         JfkebsdgB++1judA+8jqXpiyeYl2XNLoKuBvgLXt4x0Gnz5qA70u1+a81aW/g9+qtMsu
         kTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263844; x=1793868644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=Ao58vF3RwfwvsMKkUdiwlbecIHZuJCqNaF9LMjMgIjjp0oN3V0+bMisYuYepx7idvH
         uhC/nk0amLC9egRjzRONWBcz3MBcvkbch4y3FmbvJ8aRHk/WILK9R31enKH7NFVyKpda
         LrKs8fqX/iq0ZAYvAH+t5Yo18+P4SVVuwEkE9uxf3p7k/Gza/Zq8vcw7L44LDW9vCx/0
         eg4/6gGySl4gPmqjhHSnGuqDpgeQzruKLcCkFBdwNph+goB1ci1wfJv7/KIkfVa7HUJi
         euSAOSwE4ndRz1X8Heymon/1inYXncUUoyqrPaWI/LkRm0SvyvTtT1UxnjYjfHEQU2dh
         pJgw==
X-Forwarded-Encrypted: i=1; AKwUvBwLl/LWYxwAak/UHqbfbq0PxUPrSvdmzdQoSWpie+f0RcRR3fLR5LG5Is9TX7HGAID7z+EBryXyyPfsm4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhHYNiKwPbMXbd0CKPWYoA+yatTizQe/WSIa8kDqNQP65rfaqv
	EvLL6oEEC2ghnhmBwjSLEK6u7uo5xXIKaqdno/OmMb2rNOBdeuUiNfE0
X-Gm-Gg: AYBFou1eGfwfo3GDMNln4gQixmulhq3c6z1COXsF6sTjMRCDywGipzzX94P8hC4gpz3
	pbP/vz6gb0BqVtpVxW0PiyzPvvN13JkaVhcZqM8jFZNV7khmQXouRQeKcLaqOiA59xrHshnceOB
	GY9QfEgSQSiicVGauwIunZ4Uag/9c5nMyUW1HE6+zqMUKowN13o2M1MHUZBrKC1GcHenlwZD4EE
	L7MWlHQK5p/CK+Aoeb+HFfSbFtuoqQa1sGGNKsu56cT+qLaiVDkZAplFMj9TSr3y0rmmqM+8gbQ
	2jPuA+SofmHAaJyfia3yaHNBVBuGHaih2DsdGNQhWAmnLxhSn3PSxfqVJE5N3bbEWxGDK6R5c4c
	8Dff73xAQ8ALMrgZLX/6MPex18d1f97A1z9sZb6CA29cLcVxfE1FacFyj9FURaUs1Y41m8uNiZZ
	qUpkLR4pa/a4bx157iSGUAbDWbU2WKWBnv8zx5FZRHrdw/EjN6s7wp7ETFWfm1emxLCnitR1ZL0
	sYujbYmQmLiNQScflTLQX8oHyjOnBDPlYNGu9pdIEzf/j+NRG86c5ccS//aSYjuXsOxlu9ceSh9
	aRN8yJuSJoAY1LyPP0BxzS79VuKTYs6ORUHCu4/pF33EctJtK7Xayq142clyLo3VQjTY+xNUSgT
	+l0VVrh4ja8F0/pBjCEvTuHBX1Rmqk5VHc+R7HH0KVsZlFNUajqV5I9OkzRUTGbo=
X-Received: by 2002:a17:902:cf4c:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2eb004f2a79mr44003435ad.10.1793263843827;
        Thu, 29 Oct 2026 01:50:43 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.50.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:50:42 -0700 (PDT)
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
Subject: [PATCH v9 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Thu, 29 Oct 2026 17:50:19 +0900
Message-ID: <20261029085032.70689-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -260,6 +260,18 @@
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
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -466,36 +466,100 @@
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
-
-	virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+	struct virtsnd_pcm_transfer *transfer =
+		container_of(rec, struct virtsnd_pcm_transfer, indirect);
+
+	if (transfer->error)
+		return;
+
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
-
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
-
-	return snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
-						  virtsnd_pcm_trans_copy);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
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
+
+	return 0;
 }
 
 static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
-
-	return snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
-						 virtsnd_pcm_trans_copy);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
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
+
+	return 0;
 }
 
 /* PCM substream operators map. */
