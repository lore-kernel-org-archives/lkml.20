Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981954;
	b=JkfXwgw8ZbuVObxsyUnigJgIrJKwYG7JBikeQE5R/oiClDA+dPPOiVX6TlUlAoCKJp9S
	 5CNkRFLb1hAhM2WSPSLb9DQa98toObXhw20GgdO4AjwMMHhavKT4fPTLlCPKfqozkiaUN
	 Lp8PhhvZtXxAYvxCp0LUGnFqqXRxAsdwoDxJOXdD2880QkCT6vPlfoaVNZOsI7JLLYU+x
	 Y7ScXpveba4/WswEaOnHQqbV3URcC6dTZ+qyLpuQmIcC5SubQ0D5/Z0tHAbj8iOVvewe7
	 tYivSplui1IafybjEFmFLfZ1V6EO1crDj8AMxYyAN0424MaNK6YxLVbnZOelpaLsZwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=bdx39uHJzNEsyZl9QJM56bxzc3GuFh3cGV/dPkdw0HI/4d3AdJHuwGPlIZOn8LN/TQzq
	 IBH4nfGFfOk/noeJENA0kg0yfXz8ND/5bkKC16lBZppJo3ee5+QrqRq13FqvLDdnHJHiu
	 Fmm0w42De2fN8LLbDxigkOSNXnyRR/IM9159KuQkEQXHCrImqWG4Vp3fLNFyeT62hn/YW
	 vWg+OdPDuk6mz4p0x7Coiibn6pAB0I/4dc9h7zVjR+F0SoE8jtzTgrC3c/ZFrwn2cSM4r
	 MC9CKZkRCAUQfKDrT+255tE1PDBPFRSmmW/fHV/vmP/LwUo0kGlx7h02VHmxMw7TTbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+aig4mo;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AF9606D82F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AF9606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+aig4mo
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-170135e43c7so1486270c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981953; x=1794586753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=v+aig4moJcdIx7gDTwAhrxMwazrjkxVHCyv+1D631KGVqEJOBnq163hvsMMehOLr8G
         h+Qcgr0+CxRmVkfNxIevdEjAzrTVSco+NLyYvQC8FaRxbDQGqD8Xk14prTmoaF5USwFE
         Kj6Y0Y9sJzbx5jUYaxJ/e5KBYD0OtcGBquXkkFxup/wO7DmUVXPhEM1VltHPdTB7xKDO
         M6FpgXsP8RjWMHf2r+TpW9b96qm1qfK8xPigz+oHbb+rKmBVsCiPyhF4lkFWJU0f+g0L
         gzrrlfl5wbQcj1qCuaK+stG/35m2W4w4oSVgElZzFK2HsUmXkes2g0TWSgdmjgfowuRR
         QaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981953; x=1794586753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=jdgs9pfj0Sg53DUCku6KaJOS/7pTKQEWcw52x1BDo8KjDsRsGXF5fC/UdKx/OLhRxw
         KtCR8TAjHCqNqfYKXD2UNTEtXBtXj0+cgWFeAC22jKbvDH0IMnTPRClPdqs98cN/gmlZ
         K0DWKC/mdgFm1hEXqiV68nUU79ON9Ca3ygrI5xSZ6GR2jQHuLywP8yysWoAFWwt3VpOh
         Yzc+kmlkdInZ/r6uYH6V4l3SQtSD1ej+rRKgtT7KC8AhiyRkgHwMyFGXVFrmvM5iulrE
         bfNzPF3aU7fQmPazqEbtbDZW3MwONBRhx+Bxz7XloGMChyrzb7tv04j/gMww7MxfEGq2
         ttyA==
X-Forwarded-Encrypted: i=1; AKwUvBy9bZKmDrNvcdGr2LZwtlL346zvxna/HnFtyZDlOMG8Tj2EYzRCaK3UAjo24VKPi2b80jAfL8TGh/HD/Mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dpLixjoiz+MAQA66PJR5v6Lavhu8HJ3WPyuPk9mKmDz2Oc6cR
	HJJjwoSfb5Lx7e5HVJpN1LqN+dJfxYjKhw78jaKur8U+WdwusCjXok9s
X-Gm-Gg: AYBFou3ZAql7vaeV6C6NRpV0T7v/XEjAlZ8R/oHODrkIXSrvOxgoWJ7bjGryF9vZ9M7
	yBlYM/SMcKtPLc2bHgC6JqDx8IqEO9+7Gq9+v9d6OW9RftPC+UndyNrlTj5or9Jf8T3hC9mQI3l
	5A6KQvMleVpqGKcg08AXpSUCZewVLyuvopYIGjbCpwvdIAtbUD9g1sL+VjNSXiLVh9zyFmKO+0m
	6yUbc7beuJsebcWCsHxgD+R50cAwqH5RTnFIbPxq2dQuYJx+rIJ7emVaEkbddKuIfsXIfta1Pn0
	/nT4uDDUe2ZiqmdDz5a57E943v2FbHXESEpg4C5OghbFLnmAK0oo/dSNThaRNq3uIWig4rO3GNf
	Pa+zvW0mSA+gfcxHAZSVlx6AfglrSesro2dD9g8hRCx7tJxN/e5B0oskhyCmnB6FSmgiITTxH9V
	3corlgW1YX+qkTC/7/jMvooyetxC/zBieQ8MztVBej8yZVlqiqhFVWmz79FNHYzN59mLDO7gljB
	wg66Z5h9qnuR6AbosjJDR7mxWjyxzQruqlGU46mJXlQc9D5HkAF+yhLqAAlxJ0rdwBStlFINkth
	dB7S99QEGu7XgRvBPJjQ2LTN6mTs5E15vYRqaqrMK+lxksnqzl9YYYTbPtMQpweVeFhghmu9nFE
	4zKQbJAgjCQIqzLmMO8uHZHpzUynIUJl5DN2Y0SrB/Re4JA==
X-Received: by 2002:a05:7022:ef07:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b25d29407bmr4211846c88.2.1793981952881;
        Fri, 06 Nov 2026 08:19:12 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.19.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:19:12 -0800 (PST)
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
Subject: [PATCH v19 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Sat,  7 Nov 2026 01:18:35 +0900
Message-ID: <20261106161838.94308-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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

Keep timeout and wait results in the types returned by the kernel wait APIs.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

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
