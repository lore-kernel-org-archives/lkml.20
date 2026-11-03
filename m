Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693312;
	b=JormymsKi2RUqxKrktSexI37QhTJ/TWP1GCzBniNAExXKQHPbmfdJsW32uXqwxbuhFAs
	 IMi9ygF80H8xl/xSN36zMBC2Prdqw/s5x/xNRwBUfokgfrHo6/YET+JShKBXJqsxZ262l
	 lp5blLp8AhqdRC1ZLWPZMaQ6IruatODwfS6pDU4gtt+tZxD7GJiSssejBYaA73dqYt/ln
	 GFxfCwuqfmHzEkl0ZzimBzCzKJFLCl/2k6q714l8KAOEhbDzjHet8LdkIDCG9tOXDt6Y1
	 FVeCglsnaiAdA2be90hdlrtQI8XnNUbkKnCLkY3tlBabmITFyTNQI0Gp/2lnV0OOIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NjXyF+97NpD7QlpoyoVDNxXHmgR7PkO0NBUnxo8wzt8=;
	b=XGsBwQovpGID9AxZSg1Ze9giZ/+8DL6ruX17oz1+zHxhCNPkWnGer6UkMLahCPjJKXhG
	 OL3/XkzvVR1CoB9vh1jQne0Zf8GdyRDpX3zu+pB7C3UXcEPBX58ZNBkMbtdtX0zcLVgyi
	 1lPKnrbf+KBdBi/v1mfhIQxGGI1L6HICM0yrxrkakhyZAsC6ipH+n13tQ/G1eavl7SSal
	 R3cGoh9igJJ6Ws0Jtnnm6vfz8DDMY3XfwhnXLIk2WT9m/jVW8JUm0dlJKbded8FKoLZsI
	 A+mzx7k56dF+aYkI+Vb0Gxbg1JUMq+JlZmCRjLHD+BF2UyqooPzurJZj+hKZSD7b2NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtNNxwl7;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ECB606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9ECB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtNNxwl7
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36661f953e4so5954860eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693311; x=1794298111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjXyF+97NpD7QlpoyoVDNxXHmgR7PkO0NBUnxo8wzt8=;
        b=XtNNxwl7yDKSQdV8KK6dmDiqZI0aw+fRf9vpzUVclax+52liidVsQ97DCalH2AS2us
         37SfJtaSxPrN+pEjVAn5Y0AAttJaquGVyQtNlvLOkLTH96x9wyzGhbOHtg1795I4CJgo
         SCubOcpnfpgm8MElLIwBN8fHd7ZI/gwz/hSVfPJFqk8MdFzCQmzL8yRWky341m2uqVf3
         alMey82Q3MpMTfp9rhWkyv0Jo2MH7cxT0o9C5R/5rVTqWjeR3AYsMLTgXW8VxiBA3UIL
         tjNWcv1JO5Qpr3c+L4rtOSXrHpF9emVrpCL62PQOHlX4qyQ8gkSh+DKH7Quyc5BIplsL
         UgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693311; x=1794298111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjXyF+97NpD7QlpoyoVDNxXHmgR7PkO0NBUnxo8wzt8=;
        b=JIMHmEa+mpQ5QvzYCXMwhKxbWcnpFPjuGTX6oNPyRNW6KcSbGoIKiZC46hu0MpHIqD
         QzY+dLKRjirAyyJrPNfKjra9uLQjR9TCNleMTX1wyhOlv1pOfOyPT3ZU+UeMFrQ3rvX9
         1Lwk/aceL90A25+PM1EdlTB+4ZWA2SOriPNEHorHTsPo99V//WARmKL/ozze0RUBO4vK
         5RB1wr13qN2TuHcOeoQDyFibWc16HTGTFqqGHBg4cw6IOmJh0PrPpFIJtusV6zmX9z3Y
         3OVYJ+gUaKDShZHnF29i4eJ4/AIN2vMpTV3QLsoNzH5kqMZLPLKhe4rtE9taYkgMpS6R
         IA3w==
X-Forwarded-Encrypted: i=1; AKwUvBzPrNuVvZ/hMWXD4fRqWjTy85iGl/rgt2SjSjFpoGbSbK1S684zk9ow0/iR5hUTXiMPh8nHW3wGMXyQQ3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ShLniGEnHkri93aWT45tTB5jGwChvMaa1LWMUIZxCzEhvI0Sx
	o/E+tITE6BJoVV3AlGw1Bcu5bvAA+MKD1M8MtPYtfDjArEtygf/apqQQ
X-Gm-Gg: AYBFou2dEatNQohhXI/hnlZgPY7cjR7S/m7YB/wzQITxoKj4BcPHL56JhCjUkI5zIgP
	Ut8JKedFqs1icWVQyuDxn5zftBrSCBvrAcqpJedcxaT1fGt7vIINEaCOjRRVCld+NW95P1I55ri
	1nnIl4Um8U7nnxsVu3VMUUWprBNn9yGxNHL2qE+SLCNGXvmq3ua+zBv+aguB4FJq8tTrNptOTOQ
	KOtbkk1aM/zQbNfo49Pv0rM3rVjuddJiV1fQjfyW3fmM4RjqQa9yxSn8D+qDmBY6vHwkhSFEytK
	3zW0qqduow3pvZUDVYUr3VNdYQJVaQZTtid9r/Eq7oU80WwLtZEwGluDYyRBWWjz7vNTmDxrtmS
	jgof2bM3cuElUXup0MuJVL+srnAdHey0/smQPCozIX25QKUPd3gBxXwVrBeRRAPUdZkSozEM90R
	6U9tO9AU5kOoRy0vIRBiIc0bVEu6JV6vWCzgo5OoTXbbsJQW/Z41KxSGxUMR/ulA9UiiocJBbXz
	Eq8O+SbffsfPFFaX3E+X5sg7dB8C4ExlyHfFXY9CIWW/VBe0bHM+EDzzGs4i+YuGDsNjegYciIN
	jd61uB9c8DUVSFbF2a/3uQtDJWSAZ3p05BjmSURP03hsnJ3r+9Xcnvd1d7kaDBV8PZ8J+pAA4Pm
	rs0hdhvQC8+H+Tl6cx5oCTyYajR/l5N9J0JvdbzgJu8wp+rA=
X-Received: by 2002:a05:7301:6189:20b0:358:ec5c:bef1 with SMTP id 5a478bee46e88-36a42425486mr17468088eec.39.1793693310608;
        Tue, 03 Nov 2026 00:08:30 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:30 -0800 (PST)
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
Subject: [PATCH v13 01/12] ALSA: virtio: Propagate PCM send failures through ACK
Date: Tue,  3 Nov 2026 17:08:10 +0900
Message-ID: <20261103080821.16983-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
Reject ACK from invalid PCM states under the stream lock before modifying
private transfer state. A concurrent DROP must keep SETUP and must not
re-arm stop_operating through the ACK error path.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/virtio/virtio_pcm_msg.c |   12 ++++
 sound/virtio/virtio_pcm_ops.c |  116 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 114 insertions(+), 14 deletions(-)

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
@@ -466,36 +466,124 @@
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
+}
+
+/* The caller holds the PCM lock, also used by DROP and state transitions. */
+static int virtsnd_pcm_ack_state(struct snd_pcm_substream *substream)
+{
+	switch (substream->runtime->state) {
+	case SNDRV_PCM_STATE_XRUN:
+		return -EPIPE;
+	case SNDRV_PCM_STATE_PREPARED:
+	case SNDRV_PCM_STATE_RUNNING:
+	case SNDRV_PCM_STATE_PAUSED:
+	case SNDRV_PCM_STATE_DRAINING:
+		return 0;
+	default:
+		return -EBADFD;
+	}
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
+	rc = virtsnd_pcm_ack_state(substream);
+	if (rc)
+		return rc;
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
+	rc = virtsnd_pcm_ack_state(substream);
+	if (rc)
+		return rc;
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
