Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144627;
	b=G6Rv8UctOC8U+CTkloQuDUkciIQr7xa1O4kngf4ba8ChgQ/5gLlV+Kt/XCVoU6AWDs70
	 m1zt2GROazu5PGDkjn0D8wfz0vclaDslgLd80yGKb6fLflj78Dxr//kegjs2ra13J+r45
	 mVzzLdYSDgIb6Fu89oM0/XHq+S7KJISWwZ9oaTT4t4aFdyqwH8hY4cb3u+oKYlWF9xscM
	 ptXqmaZJ2s7+38TpFtI1N5/YqUKJN+/2SxsLkzFhk1+0ENUDX/eONvxVFUeGoyY154/7Q
	 QsGPU3NtnLIEwGacfetE8AN/Q7V6OexQAe3lz/0x4NrJlMznYAaiwGn70XDRUaMHVIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
	b=4lKyCPQauuhG6z8lBZGU7IC8P6bw5IQjX5l85bD1U8URe66YcSeZF6KgCk4cx7x3S+qo
	 MtX9Di1ulUR0elbKjqiM+JyF9HyhEsTqAzYdbuXdiiG9mxCyE61bMtH5xcHEr/Q3mB2KX
	 EgmnAS/vHDm7yonQBnZsdSPSH+pmdPQKR5aF17MerM54Myy7QjqskCs6j4Ke3dNx8Ntu6
	 71Q8cljYWNXZotG2SHqAeFImI73S1Te0YkOvE/gMBqyIMGztdxPHNJBRAJT+HCRxYYQu+
	 LQt3KjhO3PTdZUn69mTdKY2sSaM2fj5GWrqXBR7U6Tlhz5sWiuwkRsswCw+InmEjeJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lcu5OxZl;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B10606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B10606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lcu5OxZl
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89ff475a152so191113b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144627; x=1793749427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=Lcu5OxZlrFfBSFPtKsmtCfiaKPbo7Z+zI05JQIxxcT3smUpxczJJKXLNGJIXdnNtxr
         v1jQ+fUDbFDotK/Gt/ONGr5wCMM2jX1lGHLArgNS/wPJZZOtrV9KeCLPL0B0XoedM7Lx
         LIG5I84qGnLP611NGKUAyh1RfvnwxlMmVJ2V0aHX2tWfeyZ5BmUsrY4hLXGaqKi/57py
         TZ0CiOOkcgdTGhSzLj55ysQZvgs8qrnP6XizD5DxHcwZpvrLtNslRWCia2TpXuWJBV4J
         2REhj3jom/oFedJzixk5OmkWIYzMv8ezDijE+OLFBwJhDj9fNHZnEeM7YOVLKHK3vHIB
         hETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144627; x=1793749427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=rDHQvSkt60Ps1xBwuNqC8gqCSHYxmjkfOWvNW57f2zY1mOraW010GsCR8pqdrbotiM
         ARKWY08FmtHYp9BHgmucDw1xT8+xNLNeyYGMAbLxArPtkUiknbGG8rO6XSMPUDhUPU8+
         NB5UkjLndt24nJqXn3Ou+vH+bsvDj4tvEwAsVJp0j+yeTBekNTsoQPKvs0nJgTmc3S76
         WbVSNmRbjRUvXyFKRDvjqPN91xKRfodhZQSw03HutvtcZNxvoFa0a7El3wVdoE9hVZZs
         VyOvng3bGmZYmH3mGecxagNe4BiITwz/virJeDO8kJmyTQ5tnpde8cZ9LPvFwNP2Xg84
         guKg==
X-Forwarded-Encrypted: i=1; AKwUvByME9UySy6VoGIdLKFjlei7Oe2z18xvewczI9G3xRLcYlHnOu9j6ignPPadhDJVGMmsJZcMlKtZSveOcPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7tSKZ+c+s7RJ1OyUF6DknOek0bIXfQk4LUTnmNtJt30iZ0ZIn
	HEOEjii/5yeRj52Q+ESBOAqOigHW7VVNiO5Tl9GghQCNA9+FUS59urkc
X-Gm-Gg: AYBFou2b32YSL8lx3vIVXHSGLhNots9ohqPKoMvEV+Y0XmaLNrydd6wFqEVbi9+BOPY
	qg6BveX/fvALbqVFDByJBLuJunl9CJOXfOjNfXFTrLjvbY0fz7P1XvSFRgVkjeYJ0Xtw5gQ6llL
	HJI30U3IV8e4rwfu99Nz0hrgWj2VD857DnNbH1HKsG5GQz5C0Gt3ZZyl3LvR2v09KVzX9pwETYZ
	bzEl0k40WeLe5CLyBwmuLiKv+bKbz9EBd+q0tpCifpYwlZ1z0GzPeuE1dd8LNhTfVOc4i+OHb9O
	CsHVyEuq9/5vXf/LkRoVlXzHhdwB/Cbru28b962vnxvJfyCLB8jlLSKEtHhaOgKTOl/zlMc9vzr
	pYI5M72SRpIaXB1nIC4izdq1FkehWHAnUncLjmTCZu4sLDnSMgGOW/IgGopQFjw8dy6MnjbqSgx
	zfeOz9s/duS38A8RQCc7gQFQVQ+Lte3Cpe3oLlAw4gppHPiUNmBfOZ2S7eoGgUT9NaH2afQZIWj
	NWuU9y+iHFw/mwSk7QtLpnmndi7FLONwTwzvpd7xrrMRY3jHrf6WlrlEQD2G+iqwPJjlG91jv7i
	fJQ3Cb5gl66PtD7JnZYz2erF5ATQce3ArpFeukEeXIlilEad6P35gB0Lzd5r+b31Ud0RFT9O8Po
	=
X-Received: by 2002:a05:6a00:92aa:b0:893:4941:4706 with SMTP id d2e1a72fcca58-8a6e7bc7575mr511399b3a.42.1793144626754;
        Tue, 27 Oct 2026 16:43:46 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.43.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:43:45 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v5 01/11] ALSA: virtio: Propagate PCM send failures through ACK
Date: Wed, 28 Oct 2026 08:43:24 +0900
Message-ID: <20261027234334.32551-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027234334.32551-1-mynameisjune111@gmail.com>
References: <20261027234334.32551-1-mynameisjune111@gmail.com>
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
Changes in v3:
- No code or commit-message changes from v2.

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

