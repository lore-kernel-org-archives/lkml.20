Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355593;
	b=KoVkJRg7qQ5XoGFOsxHVCqftHh0aGLsqH/MPTZuiivMz4pei0tIt2b8JtGRm0ZtzYRw7
	 ehiPQ00+mVZ/IiC5mQRoCgpujaIubyWVPeZwSG3a74n924R8KaObbWtpENu3DZAzxuHAA
	 BN6X+tkiTr4gHjpsiXhVKuN764QS2pmo6ihqxGGPsvm4NwJKAWoqrZ+JcIzzs8Q4wyVIb
	 xpWQeFCB2zEnJBU7QIFSTeAnq4k2cVxnRIJOuz/DZuG1Vb68X6SNLfERwv/1+zJc0FNtJ
	 DXTPKdQqpnNV8el3WZ2BnPSfnxzVR2auBRryqw4HA9uP+UBoaxxcGZ9Zzvpn+fzYkow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
	b=ydZXLw3QG9w0yn9KSQJZ/sI3W/jTfn4W64QBwK/NEZxh9vKFWyWBI+A16TqQB6CA1UIv
	 +XyazIDpNsqhdv8DqTPzqMjebLTkXv5OJzFN4Py2DYgGfqHHYZ/NLPD480cuiL1/KcZwY
	 RXPdKZNph8vpH9kdIA16sy1FAHWz8orQxYVtS+WgDIjm+eAeb2jfDFqFoNGdcjPkIDsIz
	 sTMmRRiaH/FudrscMKFQHeN72B+HHBU4fRSlbmHR+fhgDA9X708+l7jwjd+Lv1z8RY7kU
	 ejEORFID6p8GtrBLERWvEA0FkYfN/hFUrdLrUE8Qsg29WkIKyxIrR4VAkkOe7VlwsPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuf1A8D1;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9860A5BEA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E9860A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuf1A8D1
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso1085321a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355592; x=1794960392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
        b=kuf1A8D1SwA9MM8sr+La69yWKRuIgLtVUHjkKyT2+cFWtDzZgl8ZVd7hDDl+dtV8YB
         TWt9iUE5/TVqT/ImRwcmRfmdUCY2WBU/3Nunj+ZVpkn9l9JLhe0psXOrqkW8uL9VqKZn
         kL1/36MpnRhRuFPRfY6rPEEE1eIewggON4Glz7rTpSyB8GP/9vS7xS3ZMulniZcl7Fzn
         0f6ZzzDEPVVPcC6xgr1oZjd/7VptI+P2ns/YW2FiErN0lyiSTNiXMLPgSQ5lxKtR8Dc8
         X4foUiztFz9EmqXg835PJfgIcVX5/vSZUDY6y5BW3YCTW3SeRVoppnmtKIcT2BD5ycFr
         mXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355592; x=1794960392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
        b=J4NwDFwsWWhm+JRzGyamzBtfy1r/gJ9ARpXeiBsMtVU5yB/Zaxb5kK9BpOUb8hqFsq
         i8D1TZd/FMcT9zvGLj7Gdu19FazxBQaFQGCwboTPy2KDirUp9tfE4iyeZsd/5ljrasS7
         k4/bzMxVOvZOyMDwgtbdGS4vHz4SFZ11ZjE2zJb0voSjzaVyUUh6GOkgf5gaWUMoo4ZT
         eLT1YEToBuNe/6U4PFpVesxVW8MZGkFbHQxBMhtP8xGrCPvParbs4cpl6hkVOm3icqgC
         eIpxfIwukwoSmlDvNry9y/XBGdgEwuzjTZgcj7qnbJURi6FAJYwjklmuoYhHq3n/ckV3
         U9bw==
X-Forwarded-Encrypted: i=1; AL+hErFNC3UdJDiAiO0TryTh5OlOVP0pov7zn6056cLIEjxPN5YHC2/E8FMm4YpF6kPZOvrE2DtHrA8VKmm7VN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MDhtweAse9AKC/ysxaAwfFRAdTdxPVnCGwvgdOztWDAEKF+CX
	LG1v+bUQRLhrGhXnyRzN4qaGqAZTu356GrI3L9zE6Z9q78WSe9fX3Cje
X-Gm-Gg: AYBFou1zY1N4NkZDwP31W6y10mQnWfgTAl8tx5eAeXF0lcsdQ/vvnblDjGUwJL09Q03
	5jGWt6eeGheJswyM70hTOGRcgY8MBYFbxjC21EKp53J66ewOiys//sK2Yvv3D9lau1decmoDQgz
	OXWR+LcRDhLcTAcpVGPhLXc74GlH7DJhv+WQLN/teJZjhplu5sTKwYIhSL70vXPMrtA/GrisSIO
	6tphSh8CrDp2bHIOg6SwuPwasFZyZ5zD5703BSQajy2M4rBpDFzfcpueL2A3rqaaAYygV/Z0BR0
	JuAoxq8ZbfYN9s6eKnk+lN9rv0edNUH0J6po/M8gnNN2x9dym9/PhZrQOBQEMhQLXJFjmrGqeHM
	207DYhqm5xY4yZsEJAFlXrz/CAXD3ZLb8k0kcZIHDIPrqR4ggd+gFJXOgY/YmUtC+i5u9JS9uwU
	lrt7JsJjPjsROtQD5CLKC2H0uHdtwqoLMzNK1Cc+0nb+Bk/WpRR/1b+Kzx/tR35qwdC+fBmGTeU
	n9pq1X+Ry9bObXspc1NgY+aoBD9QMQ7iVfpxKZsib7ostg6aT7M3zHuYSxcMd2CgTo2zIdLoWan
	H0dHWIWPD8sstyRpwQqJGZpjsQA92zRRjdwvjRGF8KUtbs4zx/PcfITwEwrwcARRIjfTF5CLzFm
	cCk8s6gEfWljUDeNN6cRDAh1/DjTqgPvPtbiYPyc0wqFJw3g=
X-Received: by 2002:a17:90b:4c07:b0:3ad:5c64:c7ae with SMTP id 98e67ed59e1d1-3b18300b741mr646865a91.57.1794355592274;
        Tue, 10 Nov 2026 16:06:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:31 -0800 (PST)
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
Subject: [PATCH v24 11/16] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 11 Nov 2026 09:05:38 +0900
Message-ID: <20261111000543.28550-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
