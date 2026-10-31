Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412544;
	b=mamkhKYcYiUdJN0no1kG35kHfN+1pU1DaW+JwPFyyNda9X6ZGhXuCfZ3EFnCdZCjiWs4
	 cv/MJFRRF7j2VLTvBSAknxTv6w3122eemfo5BIdl2MfNbcYajpOEZza+3mE/KA9ejI+Qi
	 GbyAhYAgpHAjKXwq7TCZ1yCo7VPJ7r8JOi3wk6u2KOfo1PsMs63+2gHvun4McoEx8rCYK
	 5zezn5ANa1qh1XC1gC+KaYPgqOgSoBQk+iqoz+pH6pI/Qx7QTyvXeVd8syyHYRN/geX7x
	 JVwZgNIfRzBt3dE1crcI//R153lb5Xl17LUrx1h+BnFa3TxdsGC2wXgd8JwJlJ7AuWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=lSxC4Fhu3k8JAhDiQMEBDSQridkR4ozqNEsJtoh8ptonAFWUZ9JBi1g71WSM/wqCqJOo
	 j7jAaFCnBiDfqW3T6uSr8UeiynKCzr6aSsR9dq+3dpFqCz1Xo0tajkeGsE5AcoGNnSLmD
	 zrpQkZdsveYhyVvUYrLGrQpobS7Gwb+9As0YA6+hZY/sIvuCk6CnYkWqOW0awdmjvKJYH
	 MtdsAQRgHcaYtXFw6nt5Wgnr2V3+4hGISTEnH21C1cjFEupBCTVYD80RWj+jb4J5N3O82
	 EOtcZXDWrUxPMfuD4od8WZq2U4sa1ea3/4XwIbh8m769cENRZzRTGkrD4NTO7D+Y+dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uc2ZJn81;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6E4606A326
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uc2ZJn81
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so2011991eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412543; x=1794017343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=Uc2ZJn812SiqhnAC5EPY3/hZex2gjPxTL32N5cMnYTmqo0vnC6k72HM1rKvGMx2tBL
         MHPXCmwEREhL9w9kdWVWnhvPYkxFzkiJBOVvjWXtHDxkDVUWBrgwQVYd/H7BzNFptjk4
         nFAwWvGueYase697O8Mp5UteUTPBqhNzb8F8oggKSJ8sCALKDJ1F7E7OKbG6UmABrX6t
         erL6G4zxx1HIeBl3GmR+22uEASLsW/R/tLt7yqoO7mSw3vkvmoUdY8kok4t6S/oyahnT
         /nuTx4Q7AlJvQ334NwLxglkxOEMWEkyDW24RASRIHrz6XE0rfAxRoagLaPAw3iNmGX7l
         mrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412543; x=1794017343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=nWNoRRlQeuwlSlJ83YmLRzT6xFwHVFSA/SGva12TKRuxWMVXihhuDp3y77wv80XRo1
         SDD275vLTGlizcrr12WH0OS+4fTtGiOyAf9Ye0/8RWBG/zhr3/1VzKwj6Rrnf5eZZDoh
         9x3es+h4ClxwZA85zQid0TJeDAarrjklJPAJK2bQcrhghjVWJHEOz9Mb4AYXIt/3Its/
         HzvmHEzyIFp1fZ9ICY9zYhAS/puqAJhMp8hQ6n7yJXIfMIfMYfypwHcF99Xs4e+EdTSm
         NuWFDa+puFw83Gj7DcNg3T42eiAe/C6PDhXjkJgdHjrHdgd3Uxm7l5T8JVR//g04qLVV
         qtAw==
X-Forwarded-Encrypted: i=1; AKwUvBzdmYlLdd7ZDO94SFxFKQfOhJaoZ8tHUR2GjICuIgLruPTiRIFXQxAP5yH8VIKaO+KgsPgUdCftpXr3QwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ6j4WjOXTTZRq5ulpeGvG5j/6PCwmx28uCbI894Esb1wcB9N8
	vRuWRI3bicWvDFnpbHxPPSXVWhedixdmXxt7v+qXtBwvXZlv+Gec76r6
X-Gm-Gg: AYBFou2GMLutVC2lO1g/l9bgmDnFtNfpPK5iHPZElJZax5wgK6hg0eMK7vGKmVtmToj
	8rW37Lj0zNIzu22lm0M8d5l9m69KFICesOuRKHQ3/vF7qSemDMNOOhAnvP8HsQyqYUfX+UQDBxk
	1KEYDwE5T5aEkQEJR6Fw6ydLjbZzLL4grDrZFXufbUdJU42h4/cwD8JWQAMUquEM4U66yoVV73T
	MxLAGj06muqmi9ptO3l0wLbRAcruv5z17cgFzEEsHH7lEdXIk4iuA/1vgi9858g9XM7/pL9/ydF
	LAw+kWCtM3qpdo7gxN4wDm+IrHDOsJ9QTa9kX89uK6cI4De8QKAipFwHrouAauuh+3sU8Ja/cKl
	0hqxtndFGeDdH+Y8N3fBGSYr0nlgKR7fvkQyPqHvXdtasxjlOLSe622+qYcqU6SpSqhlUk2AQiL
	cpihI/U4y/ggCOKpyUP9/gb/McfQSXDkWest0crKmOYxKfl2nQhn+RP8KV3a37ZHDiCbSXcA9C3
	99JI2Y5xi4eaAf9gHPQjIEyo1p97WGbnlUWm+BhcVkxdTt+K+qMGn9WJQI31/mVmtJqWKwQlkDy
	kN00GqWTVeFCbgy12oE/H8W0HM8pyAlZBVthv5He8/TAhXJkrdkg6PLQuo6a2D9O9leAFG9WqEv
	2RMitWXwbgDGG6RLH4Vqee79FvF0zyE58w0SzyVm8RbG80ks=
X-Received: by 2002:a05:7300:ce08:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a42401de6mr5091501eec.9.1793412543022;
        Fri, 30 Oct 2026 19:09:03 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:02 -0700 (PDT)
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
Subject: [PATCH v11 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Sat, 31 Oct 2026 11:08:42 +0900
Message-ID: <20261031020855.2402-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
