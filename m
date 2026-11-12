Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458160;
	b=gZe0K7UW90wc7CZgsNENtX6CaE4FvgDlrsZUYjNZ0BzI4sFUY/oh8Mi/2ST/lePxXhGX
	 P0kSiGYZ84LSVtbfIzcAl0Zgalz59Wj0YpCUodlIf2hSJTogNb2hH5mT8sZuAztLxyLEa
	 Xmwr/pqIgk56UxaeRSr7BPzOdlitbm05cjHZP9szXGIT8S+l9pTqjbeG4rMUUff2e86u5
	 D5+6QzYiap8iQRJ7bE80O87BHIpFuANkWZMce+n8qh2LFdQg2w8WXilKNpudLzWdLa4c5
	 Z5bbyvjsY5VnPBF2v5NBsCQuE/7cvag8TVD+WMFA95qNSI3eHRm0DD7PAKoBtRUrTnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=4+sCz5ewtpnpOlBz29NaHYz/sYGeRzq7YfSVjPP9SPzMh+P29XZ9/ym/XayJhU1mENS7
	 34OrS1UxDN0+lH6C0BMMagYf6twzudAp/E0nmErw92jc7ng1v5JRSpTjGGNeHpZxm53Iz
	 BhbQlaLvsY/Nxvl0XRpaaxZDgbSC04B5LtsGyZjMCNTN1NZ5p69IczWXpEfDYV3k8JLdm
	 t/2+egimDO/9Mi/M2/vhg8N/rRMUJ1dcSk3YYTlwGFwoTjjZIUaieLkCe7qmUNK5E5XIN
	 yzQr2jdHBRc+XWyPA+xhGFDDbmUn0DkW6dXHc1L2sJ1eJZxPev+uuhkDIjCQMldvByg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTkeMJXG;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585560A5BCE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6585560A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTkeMJXG
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1469071a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458160; x=1795062960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=JTkeMJXG1EUIuRAwJuZAmcCoanMWGO2nwXFIuOVhmc5stMLi9t2b4WV64aeWIOiAVH
         OcWRKOsP2mHWHViF1REm6HItaAYr4JiFE3zEzcM1EZ/yBoSmdqzwI37Wbrp5uk//V6Qm
         WuA8IuIlHYnJdu4GR4R5RsZ6TKBd89kdJIaiKos11R00a95tVzhCaNusd5CvTSacWc3F
         VhrlCvDvtvF7Ln9zaBORWuvgGeEx8/A6eoIOyu+NzvSy0WqDwi+I6Eg4+hflGYNvWF69
         G2YO0GUqFPIO96xR7vIHX2Y0Jsi0qbgRtNhCx+Rbml+UqYhjA636FWLPjhGtdqJL80Zt
         kclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458160; x=1795062960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=emNY9vf6CRMIv/ysR+NAXztawOrVmmT0WGv0foX6BX/EUeO/G6S/RrzCGvQT+2PJL5
         Fla+KwFu4YVYPn4mgMGtMkOU8faPZBCtkek9jAsBrvpR4l1ZJRO1A0273C0grB5ASJsd
         3mGMgFi4/FsPsnP2CVDsOd9ukg39FrInCXuC27WexvD7fOok71FJITmsom1F8pqK0bT3
         mclE7+iQuieUkswtBJASHa4f8eg/xQOIkwyKcHK5U9bosnlYVVXeGZElhUBJHzte5doq
         V4cVe/g45NU3kyofo6dd5ukfLDHsiiMT+p2iVkzyLeynbYRBWsBoD0ipwnuZGy+YdZcK
         wG4A==
X-Forwarded-Encrypted: i=1; AL+hErHdWlT1qODusdDpfX3cg/eDSYHF7yJgQ6eN2ggyV3hdE6ZiWstto6bs6fgR5pld8agtHZtMHl1VWjbqBDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hJQolFRvjUjqCQ7zHf5V2jblEGwYsYwSbDs6puZVYKt5SuAbZ
	uFzFm66PWlJ5pfWHPgnhDjfhdysUUZIQlfSG9t7d/+86i22qGt4XOdOT0Nm+kg==
X-Gm-Gg: AYBFou18yrMCCMpQSLQAhwsGMYFsC5na6BbHkzzzD9IDne9JLMI4sVGL7cyszVQmkzb
	PxISqzNsiCsgG84kYhoX0AFTgd3ADe5ELXMG5cZv6LL8PVOLxG8YHZfpXyJzIcQ+cgrDh6RRVJX
	ns8x9D6dYEIqeUfQomuOu8/zwBeEFLDsMpvK4QVVczpz7WKcwVTev6fv7wau9XCBjf2wrXido84
	Cs7o6zC9NoPXteRPwKklawGG7XVYY39NsS9V7/VWsW/ti3APqb3i6cFwvMyuKnFUQRAXOjsIU93
	W4uMs4GekkZRenQ7YQQNcuZtrzY9bHB2ZdylHoqAGxzRLxnnkQ4pnr6DRq0XGVBXWY9TllwIudi
	QnzQYE0UmDG5F0s/FIAf9bfOg2JLJJwgOguUPznAUgCWcejOBJuaGoHVNZDpI2YRNPXPivMNyYM
	FPLnh8W0f0ZIYMj8o6qLBOv7RaqYuBA3YvXSTHa+wYMybQesxAqy4VX+ybSRTNDdTyHI/ILdsSk
	eti99gxQNWFnmLh4d3AtISzOpYWbFk1+rPBbJrFjCtWGl36gzwm7ToWaqLQ9mTPX5cRPkileoF5
	BNiO2AgZlruvfaxFBRaFjgyzp3nfhAlTaT5VQtMhm0+wiiZz0gjSW0Z/66RsZPdJae2iRFBYtjW
	nnNExkz5L3FIx4rWDsoD7jkj9X5OBhwgI//Nol6gwYlgCXigS
X-Received: by 2002:a17:90b:691:b0:3b1:8300:f48f with SMTP id 98e67ed59e1d1-3b18300f503mr3347378a91.51.1794458159800;
        Wed, 11 Nov 2026 20:35:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:59 -0800 (PST)
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
Subject: [PATCH v28 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 13:35:10 +0900
Message-ID: <20261112043516.37010-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
