Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338000;
	b=BqThiBodNIvLzTYaDU027XqPpeixNffSwopCBzxDFLVvnFy/wUBpMXudIaIjHPVEL8z3
	 iK32taK0CO8a6s8dzSyjKW8Hh5gISY5uiNDOIqpbJYIKQNr9K2TDjf/0ra/MxBSyzWW40
	 i4gegiG4Rd6JYqyZXAkNdgwfebPKPbTJDa2NQDIyTw9Fu4whOsJnMu8F57UI4mvOpYxtP
	 Ed044uTPxjSKJ0A1eYfkdVHdhwkXH0NWqIhGypKmkOgTmBlJ9CPD986qaJLtmbTnYmgt6
	 WKTdY/H5fC99tu3Dj0bT12UsQm78rmHT9OoAzFHmhEYtdn+yUUyjqO+ZQzKmLqBSQjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=YqsAgag9KXkDsSFQfMLVgoQarlzjbT0fcqfg86H22Vbr/GTSjWNXgbv0JZCh/1MdhUTE
	 kuDD7eTRAMB6MpWvNIhwpkGqANHbl0HYdfNeAfLpfLTFTwfc4f1rq9Eb/mEGV4YQhQj7r
	 NsOqJG2gOgzlQBRPpRkF8VPKcv1c1CbH8o7StWlgG5N83nmsB40I7kor57pO8Td1d6kEZ
	 yPJb78NIXSw/Q9V+9faiG38IKm30AA46eeOh1nHeIVZDeQDzFVbdfwP45PassZcpz2VTV
	 3lbkHi9jLF+blXi3FpGLi38Cn4tP0m8LB7d1bzMjEOzx35rsFxU9ySyOkr1oWljWrQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5QEHG1;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6736606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6736606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5QEHG1
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso173731a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793337999; x=1793942799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=KX5QEHG1Dp7kPb9yx6aJaUcw4AhAv6i81M1bW9IA44xDcJiH2eIq+jqdtL2CSKqIOL
         N2Tegl6j+6yb3agLimvdwV6wC+VmNzELBJOmzi9ilOLpZby9Zk5yATBRD9hnItpzdl75
         98uSHo3buGPuXJ0FEqTLeRMNaeJYlwKuoWpQRFmwuZ+EYh//a70pO4jOQYZ4c7BRPXo3
         qjdfjvxQHJjZz2PbfKQ7edMA9bSjhcceFkvpBXEzVxw8hxxg1KDtzTSGF28DjiuAhcD/
         hPP+YVvRarWMJeGqTy2BpC9muFqE6vXNP/XjQ0hUDl3l8T2a2gW1y7SV4eGl4WkNzkDx
         ZqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337999; x=1793942799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=cDQBWv+ClYkKcVmthfx887UPWrODPmA97PUzkIOx5fgCTZF90E6v/AtoI31qQaR9oD
         h6RbQbzNyA21RacFyjPPqCdmnuB8XibDFP6xNMqvwkH88BfEAIMkmnBFCThC/HILlgUT
         xJ9mnnp4GPaDp2DVdjWw/juCbcbKumwrEvAgVWQftGAhUsoNltQK1xVK/xz0eNH99itp
         QENvNWVfxeggaip63lFpj67DY4Q3eckznPZq8zERcPAd8nRdJgLdO5uqLC5kZnR8gDQ2
         JC+2UZr32hOa49/AM12nIgTskzOoO01YHaQ8KrC88sA8T0l2lxOvrAsx3g8NTGe/HUkq
         wwnA==
X-Forwarded-Encrypted: i=1; AKwUvBx87EinLmRCRtiupECqitZQdVDQB3z6EKkZhvVoO8DO1sDIGQ/3FMHnqZXGO/7ZIReVCNrfXfTTpwetPOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmnAOCSneKIztU5XwIqQOyMISDPX/IWYGQCqA6TshPcv4c3YVf
	GaaBO/HMl3NnL70oZltINkZiRZTAN5jAHBd+wuzNaqr4BygjEWaZBhlgwsDGJA==
X-Gm-Gg: AYBFou3JJake8gRUx1yUiRNSalReZAoClwxDqmb7tgvm6zY91RI2WGisEh91FSfLiQi
	M2v2bzTJYvqooqJcQpvwd+I0is0+u6EvJlRdMFGcClqTdOlkIU3vdQCR41YNaDrriWbBoWq+n9o
	bQ7U4q3fAyhY+VUnt8tSc4Bs/qNEJP+oJCxbLnYCUJ1wxkW80abjdjxhmcQ7EeE/AiO2eBbB5mL
	P6KR+ib0v1NmwpEIgI47fVlmSgVemRkJkg4/Ds0FOk1gJ8sXugx/OYVLp2CQGoy2KClJXzZXBOL
	WfidN1FtaTgQuufk6diLtKMc2CPzybarnW9XpMr8lRyrdQ7/7m2ixJZNn3DuV0214fDqMg2N52T
	e/vttHKthvPqcRDnT/26MNdpod1YRxNCcX74tQY3jAckljQBfhvZRAp2/y4k6HqkXz14tIUrhCu
	SOouj1uLV08D4sbCJxI3F0qQqjb37Ji5kDIX6tQaSGpUDGSL+fq+a/BLbW175Cd3WOC5pJcVF/X
	w0SzzbiFo2Sz4vXwxxHf3DlwPpSL2tQ1Df0XfQrJRGVKmcTll35LLfk/HTL68VtRpiUgR+IVWek
	Yh9c7H/rNllQoK3ICrCTBnNcnwKA/wxWeTgzWfOdAwMNwIuHWXWa+qjfjTTjylnjXWDa4MEk4H1
	GNo0stlpYlms0AvTYwrROFsqWgDTBhkxWhPREYaeUpatQfUg=
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr1077089a91.31.1793337999008;
        Thu, 29 Oct 2026 22:26:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:38 -0700 (PDT)
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
Subject: [PATCH v10 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Fri, 30 Oct 2026 14:26:16 +0900
Message-ID: <20261030052629.27742-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
