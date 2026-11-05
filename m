Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845926;
	b=CrjO6Q2OW5Ufo+nY3/fjVCwkxnv2Gvav2QbK5q6u5bCrJ0GSVdODkVP/ur3yCzwRQrf3
	 Lz4ccNvBaHqwNtTEMt+tE2IRhX02nMfHJPRB3HQeyOTO+MeHNNzrBJrbXI5nivnhp0rWC
	 3KOZsDfpenHzO/7SY9Pk3RE1vR+dV6a4wRWZUikYhkr9HGUzhlduvMmib5AwhsjQr3xea
	 aIfJOVCAsjn1wZ/5YM6TLouPf+SRPHn1oadIa1yXMXvTCCywLvypjp2dkQo8OIpjnZBsi
	 yzgfquItVJRA6BmzNhjjUnRUhbLDddK3OoaB+BbtdtjbRBNt91OwSD6aYvJzv7bdI/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2ncasJwCW/aoSrC8F4UjbFCWtDNg2LhwMiWB4wH+wk=;
	b=pZjP4Z8+QF81ItnfJ9YwnU2DgjncZIffJFPFMJMl22eoIO98fPS8/76V8LmK2NvNoGN/
	 wZ4yIIXGwaJPoZOnRjJWiFn9r0SJ8OE2pGFjrhUTuxJfiT6rt/K6RcFlSi6GeDr5qjHhr
	 CeledenTyFjDUCGMSDsOHjtP+PVWUCI36jwDEsHB8UoQuFPc/mvT2GLhsUFXdqovPXJSu
	 C7aFQTwZKWq/m1Fcmtp6Oj995CdXFUs2sC+m3CZMwTfxkVIzdEzU+fTT817Duw99SoLp+
	 79vCxOpo09QhGJ97K0wALt93lFoi6YVQf622qg6Lhucq+XBUnzzq6Xw/uOLdVVLabzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bUfwofwy;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83019606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83019606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bUfwofwy
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so952387a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845926; x=1794450726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2ncasJwCW/aoSrC8F4UjbFCWtDNg2LhwMiWB4wH+wk=;
        b=bUfwofwyZ0Nt7dXLxkceyupNBPu23hnfDEPaAeZ1h4UIVqAkFcKRwCiAXMnzqhc5mn
         OGAEAiGRcXLYWBRMS3sKIxTjNM/j2MrpcUG7imGWAIBRtpZAYueAmjHNVCMfAnz+F86K
         7uTHsxox6UX1d+ZPcFvVeGbqVp+TCDIiD71qJTICtTXNK1a93tLiz3LOtWD/Hp+65QZq
         Y4mesBdUA+6Ls+j5U6+187uV2hHHIHrueORCE1V9XisXAEp5Ia7S2oEeO1Mg1VxUPoxf
         eMl2rmdhG/RINxTpscD/85ILNuDwbP+shOt6C1nl19XbdBJ7FB/MI+NmcCdDRl53OyH+
         O9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845926; x=1794450726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2ncasJwCW/aoSrC8F4UjbFCWtDNg2LhwMiWB4wH+wk=;
        b=WwCZyONVLRNgFKm2+NEREPDuBQftwmhfBK8FD09OSl/7ywGxCHotTecFMc8e2r5jx1
         RpEIYREeN2/AK/2ct1JT/WtABQrzhZ/beEnGSFoQvIhO0cTBnuGyuWIOxUTCtQGkt5SV
         CKdMNa7VKWXlWtjcquxyY8MchAB8hndX8uvUQsX992DzggR/vsOz/F2X9KH+dIIwMoAd
         azFXhyTfIPPFX/ZSA5uG4pUq6klYIrd39kvKR/CthH2US5Rqj/9hzhPOvYLNd5tpGLWK
         Otpd5+wizxnch/FTjCBmnx3cDqvQ0RGWmzSFVtxLKB80OpYJNFANT+ybFfHSKTheXDbY
         0ljw==
X-Forwarded-Encrypted: i=1; AKwUvBzKWpYQquvBOuQ/pXSfyBj3ffMfzxHa7gTPyEFx3+k+QGqRvNGQPbtyk4YOMrHwvPAnPjGLy/tofqS+yRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KeOS8dQwYmhHLP27uu0lbpQUXR4YrdbueWa/xXaSJJmJ7W1LW
	mh+xeRGJnSb/mRn/JpNPyYpGJKwKQ+MEzWApOI8CQA8aZzyuCIjPGw5p
X-Gm-Gg: AYBFou067HQXeXaMSlhAv1cmqZo+yinZNNFY2u6ULlUC39/L9tnO5vKb2IKpZnWSf2M
	w+aTOmi5CV9dwiCz/IvxJyJQ5QY1vXWMqJbANf/YTwmXtYLanIKiyyDr17HXIWQyuDApE1wfGeY
	6ro05wuD5XSvqs0bGaC3o10RC7CQH9K5C/BBINGiC4td+Vovd8cz4wXhDRrb7QYr6LCtHESY+h2
	S4PNBPontdtquptl84sA2vRasK1GsJiTBm9o2j0um5Dzh9ANa0rpA+2cx8/c935n1fJ2cUK+nG/
	lAGVrNxQk6XXii57G8Zv7dJKuXEuaP0x8NjKC5plEhcD0nDyH0FXrmFZeE1eqaH7Zmyh/lSkYE2
	hvsnPS+9B4JLEwhfPfl5s5IUZ2y0zRckpjO/9jrGSxV/Hvpi5HWe8/J4PIYDud4q9aOqrpPEgRU
	EWRsV8gDNJraa98DjITSUYDNB8MdGj5JPXbDzX8829Jryc6MkcuhScfeBoyvuBwAiL/e5ODPifL
	a8KB1vKdazDsv4NuIOf42XUMxHbWJdPUPLO0+GL4FKgpAXWKkCpou8GevlOcvuJWbwHAVQaRLNP
	76YnhkAsV80bDvyiDAWS7DXZ5Oc/TQY4IGzJv5hOidr5pQsSqazh8BwwcgeQ7KzBnbX5kKe9D7P
	/ugFQ+hLgtlOv0wpn48otd5d6xt0NMV2Xf468JMwBLSh/vo8BB7ChZJ3MSfEZYCMyoabitQ==
X-Received: by 2002:a17:90b:224d:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3ae897eb33emr15008437a91.21.1793845925764;
        Wed, 04 Nov 2026 18:32:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:04 -0800 (PST)
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
Subject: [PATCH v16 05/12] ALSA: virtio: Recover PCM state after a failed start
Date: Thu,  5 Nov 2026 11:31:33 +0900
Message-ID: <20261105023140.18373-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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

Capture trigger queues I/O messages before PCM_START. If the START
message cannot be allocated or sent, transfers may remain queued, and
ALSA does not invoke the action undo callback for the failed trigger.

Mark the stream stopped and disable transfers for every failed START
path. Arm runtime->stop_operating so sync_stop releases pending I/O and
prevents prepare, hw_params, or START retries until release succeeds.

The stopped flag is shared with ACK callbacks that can run without the
ALSA stream lock. Protect every stopped access with vss->lock. Read the
pending message count under the same lock in open and hw_params. In
sync_stop, decide whether RELEASE is needed and mark the stream stopped
in one locked transition; leave it stopped when release or draining
fails.

Always cancel elapsed-period work in sync_stop, even when no RELEASE is
needed.

Record the RELEASE obligation after successful PREPARE and clear it as
soon as RELEASE succeeds. If the subsequent RX wait fails, retry that
wait without submitting RELEASE again.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    6 ++
 sound/virtio/virtio_pcm_ops.c |  107 +++++++++++++++++++++++++++++++----------
 2 files changed, 85 insertions(+), 28 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -26,13 +26,13 @@
  * @hw: Kernel ALSA substream hardware descriptor.
  * @elapsed_period: Kernel work to handle the elapsed period state.
  * @lock: Spinlock that protects fields shared by interrupt handlers and
- *        substream operators.
+ *        substream operators, including @stopped.
  * @buffer_bytes: Current buffer size in bytes.
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
  * @xfer_enabled: Data transfer state (0 - off, 1 - on).
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
- *           side.
+ *           side; protected by @lock.
  * @prepared: True after device PREPARE and the core pointer reset succeed;
  *            protected by @lock.
  * @preparing: ACK gate through teardown and prepare's core reset;
@@ -62,6 +62,8 @@
 	bool stopped;
 	bool prepared;
 	bool preparing;
+	/* Successful PREPARE still needs RELEASE; protected by lock. */
+	bool release_required;
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -116,6 +116,15 @@
 	}
 }
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+}
+
 /* Keep completed RX data valid while RELEASE drains the device queue. */
 static void virtsnd_pcm_block_ack(struct snd_pcm_substream *substream)
 {
@@ -148,7 +157,7 @@
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
 	scoped_guard(spinlock_irqsave, &vss->lock)
-		vss->stopped = !!vss->msg_count;
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -250,13 +259,26 @@
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
+	unsigned int msg_count;
+	bool stopped;
 	int rc;
 
 	virtsnd_pcm_close_ack(substream, false);
 
-	if (virtsnd_pcm_msg_pending_num(vss)) {
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		msg_count = vss->msg_count;
+		stopped = vss->stopped;
+	}
+	if (msg_count) {
 		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
 			vss->sid);
+		return -EBADFD;
+	}
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 		return -EBADFD;
 	}
 
@@ -310,7 +332,18 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
 	int rc;
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		stopped = vss->stopped;
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
@@ -353,6 +386,7 @@
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		vss->xfer_xrun = false;
+		vss->release_required = true;
 	}
 	return 0;
 }
@@ -395,33 +429,40 @@
 			guard(spinlock)(&vss->lock);
 			if (vss->preparing || !vss->prepared)
 				return -EBADFD;
+			if (vss->stopped) {
+				substream->runtime->stop_operating = true;
+				return -EBADFD;
+			}
 			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
 				rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
-			if (rc)
+			if (rc) {
+				vss->stopped = true;
+				substream->runtime->stop_operating = true;
 				return rc;
+			}
 			vss->xfer_enabled = true;
 		}
 
 		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
 						GFP_KERNEL);
 		if (!msg) {
-			guard(spinlock_irqsave)(&vss->lock);
-			vss->xfer_enabled = false;
-
+			virtsnd_pcm_start_failed(vss);
 			return -ENOMEM;
 		}
 
-		return virtsnd_ctl_msg_send_sync(snd, msg);
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc)
+			virtsnd_pcm_start_failed(vss);
+
+		return rc;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		scoped_guard(spinlock_irqsave, &vss->lock)
-			vss->suspended = true;
+		vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		scoped_guard(spinlock_irqsave, &vss->lock)
-			vss->stopped = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		scoped_guard(spinlock_irqsave, &vss->lock) {
+			if (command != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+				vss->stopped = true;
 			vss->xfer_enabled = false;
 		}
 
@@ -452,26 +493,38 @@
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
-	bool stopped;
+	bool need_release;
 	int rc;
 
 	virtsnd_pcm_block_ack(substream);
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->release_required;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
 
-	scoped_guard(spinlock_irqsave, &vss->lock)
-		stopped = vss->stopped;
-	if (!stopped)
-		return 0;
-
-	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
-					GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-
-	rc = virtsnd_ctl_msg_send_sync(snd, msg);
-	if (rc)
-		return rc;
+	if (need_release) {
+		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
+						GFP_KERNEL);
+		if (!msg) {
+			scoped_guard(pcm_stream_lock_irqsave, substream)
+				substream->runtime->stop_operating = true;
+			return -ENOMEM;
+		}
+
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc) {
+			scoped_guard(pcm_stream_lock_irqsave, substream)
+				substream->runtime->stop_operating = true;
+			return rc;
+		}
+
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->release_required = false;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -485,6 +538,8 @@
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
