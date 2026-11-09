Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267692;
	b=rxJhVcin7Squ9CI+ibaS5Km2VoZZXVTuecUeheEXHBp3gmS9724VKxTF03oyLYYsVpMo
	 95FW9oFdBuWZ2rEiFuSwn1ABzRKM5NLiiZUYwfLnLwXLJ0s4ky7pvlq2opwuETAhbJW/b
	 pNbnilDzG/cSRIdKLfKjgECMpVzqeEhDVKUneLqI82j2DVffxYZnXXQSww0XR7x7N5sIG
	 pA2W9X8hZ0MSu0NCBRsEat/ZC5GiaMKjEE3Oyn+KRYrRvE1nMkZwujLvy6VTyuDCLKUnD
	 nUZWZiWDOsuvyoeWEcFnhMD3AF+ZH3uEdjHs57zgphNlchdeZeDphzlQSX8bt0pP0Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
	b=YqcSTYZHsDiFGiC2lebRlXl5WNEuBgON62c1CDrhnBq/LMlJz/0RBk+zNsKP9z3uE3qf
	 xe9YCsSwpRU2wOel4xUYfz93K/kaK8oAkDVWxyXTSc6EFBtX6dAGNfK71U0QpQx+83s7X
	 ZwHDDZRW/Phw3woPMeUiUk3DRu9z8t9NrvGvWmPlxiJ1P/S3vogGlanBj1fYAtZyL0yaG
	 Juyb2hjuBaECzFQScnzJYoCrFEQqGCmrTW79KhC466Ri3c1yI9neWwnC74td2mN4fx/rF
	 uVZabqofrOMpla5asZ9iWmegxKQHlR2C+TM4U6eLCuJ1wZzeaExkrPOVV148cWkfVRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TGg3a/t6";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468A60A3828
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9468A60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGg3a/t6
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1931ff67a29so293839c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267691; x=1794872491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
        b=TGg3a/t6Pyhz5ZdX3BaHKb9bSxFcvLef7RTKBK5WmNyqmcJHu2YNsbdaSpD9Yr6Rr/
         MYENhkAUNPdIGssxSy313cz77KLqlbBQLLSLkdvX8fVXCeKqt1WZ7af4Fg+nKy4+XuP0
         pllkW7K6QZcgJ+YBm5aMdpRmT4SvDKJs4yjEvTxEeUN7FWJHtrPZczF+7yKuPu7W3yy+
         whezUw8lMFNZx2LZdiol841ZTGALZ3Q38DoFzbO8HZ3urHzFmQ74b/mg6VqvVUyXSzua
         0HWk7jWO/CeEfzjEFRQxopjIVbXdUXNzy6yZuaivbcZ6Xe/kEAnorn56GseXWpTYin1s
         qKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267691; x=1794872491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
        b=VS0EnR+ADx/NO+LS6hm5nnJUfRqGacJg/giQXGj6W5ughdO1gCI1mer14sqvHFhHxp
         TessyWPBzxIJ2uskYeZq+oW2WbCWUmTUBcZZWHixwvWPpbjoswaGH5Za4NCS9vMjfcNw
         RxQSq9HfmdxOaUEA8V2Fq9HgP1X3haZgOe/GVQr1N3LYUR79aXgaq2TAb+MWT1m/EdZI
         4SIuKlBIWUDpU60QFGW4u2vzlGnF0sPyIb1SnhSjZDbUDWJBjO8g09aztXevCSeiKW54
         rFusLFWsDmNpkVArBD/+2MunsMBVU6zV7nQUzyjhT4PvaUMlPyg7HA8R9y3He/x3lreZ
         XQQQ==
X-Forwarded-Encrypted: i=1; AL+hErHnZZLG5laRsKPEj9G0ybh3BgpfreA5eh+HySAoIjF5bglRZQOoPvy+6PAdt34Sss06in6+j3l+GBvUldw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yJCtmTL1P+8Alu2/FHkpwtOJgylzfFnSEhtTTnXjhZ+IelTYR
	v/4W01EttAxyWH5Kr3zgB1ImddjbRU6QcBdYzAQmUHWELq9a8fgprSpT
X-Gm-Gg: AYBFou38QXli2+9DPeLUeRNxJcOIERO58bwJZt3aXxwCQXiCfAvAvjt/aMOsY+N7r3I
	4o+yEvUVRnDuyGq3s51hpu5scX90qbaw8D2S3HzB5SHY73nrxSF5JCifDhadtnw/bP04AXVV4xB
	+a8xQdMy4koxxLZsGQ13hQZW+gNthWbG1vDJvQcpOvWLJb/qIQeKInPFF7Ap3LOkCPcA/mav89R
	JxxJZ3StXX4gwEXqwgNFYdTMq5iV2qUSSk+lORRIEOm5f9LGY8XnSMpS3BkyhMgVe3cW8khOMdT
	XBwApQ4RpQa2JbF/quITF4tmxJiRbFZg0gjGB5CuhwbIUhYIdujogrHjFqUfE5IMmyCsN884Hxz
	pQGsI2dUhXiENUm5V6QbLO2fFvXrphMpmhMJaUC5rYBSPzXWsu3PJmof1Z9/6BDA7z5YxRGUv2f
	AvbS0RuUDSTdIYO3gu2XLsUzz6JKzvkKkMzf4yQ2f1DX56KtZnb92DAPXugzTZnuWWzIvF7/bbr
	Blv1d8POU3eocIofwSORsESk3JeCWUFmmV33bnjUTUyl/c8HjX9FOIroyBpJHl3mUSYIWAJI3zi
	2E4zSV23LFNAgQyRHo5Wp3AFT0UeXWF3g5MowWDx8QZ+S4+hY5AhCp3QHY6tkYFynkcNp1RaQMd
	XwRqUXg8MUp64vXDnorjdOkceeBlNTTzgMMyyqUQ/PA5mMH4=
X-Received: by 2002:a05:7300:d195:b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3751f55f74fmr1066564eec.22.1794267690535;
        Mon, 09 Nov 2026 15:41:30 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:29 -0800 (PST)
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
Subject: [PATCH v23 11/14] ALSA: virtio: wait through signals for PCM teardown
Date: Tue, 10 Nov 2026 08:40:46 +0900
Message-ID: <20261109234049.79534-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
