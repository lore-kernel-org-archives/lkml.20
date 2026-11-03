Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664254;
	b=NhMt8wWc1mcAu1kGUpelG6Ry+Ha89EYvpV6kG1IxhpSRSlFL+3FBZ6d23S8xTo8Z9rDW
	 51M+AQ8qok0JY6IAHxUJu94iMvPqtBelEND68BTl6aeXiuh1JHkLMRPAtPJ/bwLgaH5Bl
	 wDNkTe2yRX5B6mMK8mOdSqXuKWpuMqQU2qb+6MolSIFpOGNDTM/xm8ZBUHlboNDOnoZwz
	 pIGDry9o1vSBj0/IuwY2sgMNl7lJgJVfU9CNjladrNajw5jT64mwqajlxkdqm7FT0+qFi
	 bDW5ddeUH1piJJQP1EIsQfX2zsfDMYpSo+eQru0SXqjTlYRZbL/eG5OmaSN5jkBqxxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=HKa8bmO/yXiiOEYBrgKF2opOVUXM83WEBRXBeDSVgmetiYvSVvaBq+s+O2pp+6l9zjaH
	 kns6sJmFeVPJCnBRSpJIzfLvaxrL20WygVYTX6EIS5EO8QZHHDQeTnKldJZm+6NxrO+H6
	 XxfiCiw6UVwJok1+iyca3b04PC+XEgKI2JcgiAScQyWeNMxKkBL0IBkRySc2Ffoms/ck9
	 PbQpl1fZXcGVHAt3v56VD+QU9XCY8eGhntF2GUtNq/E9L/2sx3nzWQkS+uy6GwRQlZowa
	 L+x9e4Maykdrp4tBuT05NIF7k7HZE9fVW3jWuJfxvW1vWAY1YahExds/mKwDQ2ORgPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hvLtR5j/";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6711B606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6711B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvLtR5j/
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3016559a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664253; x=1794269053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=hvLtR5j/7+P+cVBrxYbQPwWVmTnGoaaaH9aINayHPktqIof+EX04hpYqRJy51dqN+T
         QrQpMf3cKpJHacFg8dhDIKyiANgeg5udhBosu4w+bOAieR79yj5zIH8jWD85zarMYWz1
         C9GE5xmyLr6xYgnDZ2cvF1gWBvq7bva41e3OfeotqYviN/lmB1mAriuyA2jFDYdmYyWs
         4zBtsh0oE82UU+AtjnC0HnGtPV8UuIgMkin2Ly/Z9+i0YGBcBOqP1whmFMEq9qJgJE+B
         uRr/+/dDZ9pZ0WqKl2XjGYtgc0XAluuDAN12lzqej839D+87XPtNwUUzEZgtwoScoFco
         BQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664253; x=1794269053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=BP3feqMSVLfaYH4SUiuAsstPHwoClVKiKdEvCjl/7JBKrkcYSEv0Qb2iA+BNWKDNph
         eq9Arc4+GsE+DqE4Df7DqkQ4V5mc0LGNEbBqgmGQvTPaOHs6UaxjnMyO0QPtZgnPMhlz
         wyQdoCpo9o7oBmF9xN8z94VTDpPVZgMH2I//S/rL13AX9/qkIPqM0xHKdM0Fntt/633K
         gF7s/Uldr9+fzi5M3UqfQDpuKds8jsm3l3WxzPhiQF9nMG24R1N90cHPXp492anZN9ll
         8pvnqDy539QcA6D2sSUylny2M5+s+jnQKnjpWSpo9edzSrUy0BwbKIpAmZtgqXne39K/
         b9Qw==
X-Forwarded-Encrypted: i=1; AKwUvBwV2PcHji0Rik6GKa0gC2vsQN63IxTpTwMx+TNoHwPdzkrd7P1/mnsktUfapryXWWnmO3jYcrr9keMB13M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EbZWOGgLnAYb8MBSxAP3wqlw9gGIbKZjPkqr1iLKyXZPKCh36
	Oe1286XrSJjzIYni+SZuCzrFvL1qrPVs5Lgdkqg9UwSuEGTd0l7XlPu+
X-Gm-Gg: AYBFou1VCL1a+GfkGYRZqMEi2H0H0DqF4HxQYWWfL089Ga7aOm+wAeLL9k4wHwgOjPu
	DvSlxzZDE31zsZHOcllRK4BhTWomd22QNUlYefL7VoaemLVQ09RwctNX1xMLmxm2oz4Q/N6VsFo
	tIJQHzlfgrtr2UOaaEnu86xicPARkVuMGr7qXgKvNaMQMZQEVx72InFd8ym4T4nOBGixfeZayka
	riW37RMZUw+DPBu3KUDqcAurWz3T0f0DdwcfT+wCMVkmGiL8PTYhhpW+/Zduiy8n/ziRawTQL6q
	kLwM+INuGz+bhYlMSCeQt7iUpfqNCD3yY/TXdcMW6y5P/9MTmJYneVOc5r7KRiDopD5qs/BtSNA
	uIekBfFYpPuEkVmNH4tS/pu8st4rz3YKjtiVZfB1KHi4KKElQeQOCQ3Dy/DLpA/bUoZdqOfcexi
	PvxRHtqO3xcWz9fNhUCKd6oNtMKQnvGrUcqAuRfheD68bL0Hm49x8eS65ZueQRIzSuSWMm9VLCv
	e77uCqPe52eKvspmsdOkEcpmK1vEYZiSs+mX1G/tZXliWNeTnEbVmRlTZhmGtmDRWqCoF0ZwzNd
	stS7ad041J2g+K9MpSoarn3aU5QAloMeN6uleKfI0gB0XwzhDA/isnFUm3mRSxZp/W5OkG61CM7
	nj7B7rIPKXTEGJbDxKKc7QAJNxbESPgSlqeBKyKX/TpxQmQQ=
X-Received: by 2002:a17:90b:1b02:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ae89847b50mr8986443a91.45.1793664252625;
        Mon, 02 Nov 2026 16:04:12 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:12 -0800 (PST)
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
Subject: [PATCH v12 01/12] ALSA: virtio: Propagate PCM send failures through ACK
Date: Tue,  3 Nov 2026 09:03:52 +0900
Message-ID: <20261103000403.67106-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
