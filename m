Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461733;
	b=N5rrIuj71d8ASqBVYzmvSGFiqA1hxrSIk4Xl3Fzrtv6nHy0ZXezA7jk5jfEGVnARf21C
	 YFpgqUUL9H9sa3D/ZTgdVdP5jrD2xK9MDx1L2n77k3EMxLyU5+yUysGbGYtpVjX6CUuR5
	 b3c6riYblT+J9lhF8+doVGr2wUNkORhVcVeNHDAEAMjyms5nvvkaTXFQdt3TJ4qvkgXyp
	 RkFSGqRX7ZxvNlH5sDmVjgEY06E4GCDt5qMU/nOZlIqIJg+uMuMrHl14fK7v+RrXJZWeR
	 SmSDPpByt4knXRckz1/GJszyDGHhts3+GMebLqa6WECqlAUxWJG3beT3IX3TZIxfr9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=d27BiS9//X/fM1vT2zuCubT6Cz2SvpOC5Z73JlJx24GP9Pu5QbCa9QPHFjOfUdNNWkSD
	 zK7TKn8yHiDftMvZo1iuuMmAUaJFFJIUvRsq2ECoQUMGpKTYR2SjCrnEGanNkahqoOpfz
	 ouJfqJY5micivImIzXd2T53oqQ2s9dGy3z6+xb/GGPub2RbVEdtaWNuXudsQ0lQvAw8AK
	 wOX9xyPxshpOvYHIM44zqAqG1UdgehFAZ3gS8FaLqHF64bCMl4X/Y1ShYi+csQ3DBqMrG
	 WJNwHKwh6Quz4oMN3r5YyI3cX5B5jyGCG5lr9sbRtpZ36K63RvqG98cmTUrSaTdSdyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Pvk/VmPv";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02260A3827
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A02260A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pvk/VmPv
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so5942254c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461732; x=1795066532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=Pvk/VmPv9yl0xG02W/PtSlGQwlX3PtGEC/LGrNSbXDH0MnXsAqYxwt/uUNZ6eBp2BW
         LUPcE9vlpfjiEIGqFuQBz9moMaiAVxjFgyj/aRCOdFUc8hw0a5HmZmFwqxE8OZ+zEE19
         KciE/RWGeLQohHdknFQyWVCTLW33Ozafmw7fogmZ6VPMhiad+kooGFaLXsZwGs/PRsXV
         gXpNeYX5DSkEW+A5I8PRcCb8tHCInH2as8gDZEofE1MAUpD4fV8PWsteBhATUW/yefhV
         +0FYkR4LB0uLWN+j/noV/7GIsjSJVjxoYA6RnoM6sgMT35pBjjCU+9XXyyw8hqQbR04E
         kfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461732; x=1795066532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=abLDc0KH6ZEtDy5xpm+GvTsKYi47cLIYtnS5NR1auwu+vajfplYs0omLOKMQZbTihk
         GOc13cLH7KHMZs7kIKIjAaAzYgx/MOaamNCECAvzig9TWeu8KUIakWorxXfDK7W2LxJ1
         eY/FttQZtZOhbk6hPTibZltUKru2kFSttCMrqBgNh0x/52qgwDJhkPNM31TmXSwcZBr3
         ldYT0jbz7/OFUxxenr3zW7juUjBpKzs3a1nzWvaC5otmdByl8JFWY/G32iPqP9FHFZCu
         RcnJQXFIANqfoweojcowIN3Wn8b//aKZZ6kvlWgGOPrrmJ8N1bUDoOcuihxUOHyeHn9l
         +klQ==
X-Forwarded-Encrypted: i=1; AL+hErGXUpxwsM9l3PLjCGd73Ka7ChhI4fPgPbGFdhJMG/U4cFK71GY2xN383VdxonNZjM+wdeLThegbk9PzWNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/3kQ2FQuY4QQun9W0k1UBpUBNjpD6G3N6NxirLyMxjD1gNKkG
	6z7erk8OeDvfds8roopChfp0MXbvzXBe8QU5Cn3K2RF7wJIA1Ao4JVXv
X-Gm-Gg: AYBFou10IDX6RNz2akpHTuChiUki/z6shvbCIVOC+uug1RWJQWMIV7JA48F/UuA50FT
	dZR1FAvpaBURM+9DbeGYob733lhwLv8SLjbfP3EfGwatk+iJy8uKYMvOfo8ce6FFV4Ujc+Ox65f
	NhoOBWByXWdmxv5Fpvf0+/yqwTa2zHvR1VM/mBKBb7vR95DnpKyRVsMmeTVPwqX15zmTuIxJ50u
	DophYTn+PMV67s+Umq8kM/bdLBifKv/Uy8724mVyusX+KTxOB9c3xpAV/Ib/lnq+U/RlrP7tyMZ
	iOhUUa4hy8ICN2ZdgmZqF0qvZ3E4remFScCOUYMiDSDAdyRMHhbCdYCp604jOiUf3fXrJm8Ozkz
	VgXljEr0LhDiYGmVgYuyu4Agx9eKoF856kDwwOPOw+Ai5ccRlsegw+Knhl6NzMj9WDMnjqqs0QD
	dWQSG1RrBQFkBOnJ3osZRdRSizOtUnZ6iA19+YEJxoDoDosdgstZ6+bXHPPRvUT/p9ceh0rHCXl
	Igpp/H63p+2GPmUYVDk5HZldd9GhCjDesOw5HpX/xgSxrFzAjBwvGXoEF1vVwm+e3fEQLSmPE4q
	iQvuyJHW573nkk6PlLEirxsUsbmAZhn5Y5JUgRnUr0fQ0x9vUmX3UhVoOjyhClZf9yky6tCZs+6
	U1GAEoJzaj//GBbFfrdlCtY/0m7gh6n32kKFHptvK9LLQYHs=
X-Received: by 2002:a05:7022:2204:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b3c0242211mr5541040c88.1.1794461731568;
        Wed, 11 Nov 2026 21:35:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:30 -0800 (PST)
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
Subject: [PATCH v29 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 14:34:40 +0900
Message-ID: <20261112053446.73504-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
