Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156023;
	b=IRJKYEfeFkhR6lnhOYayTtamoaEkS8J3A59GBSAPrOCJw9SoldhBUK7wYU6uwtf5hDjE
	 nT+BdMm0l6UOrKD+4whx0YeStNkvmJhwjTkzLyyXz7yrMRSPV/InatCXouisWI5KzV0fI
	 R4s3cZymCNK6FuZGjd38mPREJ/q1AJSbWayUPQ840c0ZBVwl8HJ9zokb1iqLmSUAw8IBx
	 T+DRkvLbL6PP0PkBHCYKeADjefDpvYbkQJTxEm7NpVGrGM38ctxZPEt+hHzqQ81KybZtB
	 b85Cvc4GDCFUfVS11IDgqQv3gNK5CU+tvD/lM+TNxCyNRv8Feiv266WLyai9WRLQNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
	b=iU6w543U+lZMN0JWuaWqJrqSfZVB1JzeuH1WMgsP4T8M/W7eHg2iMjaEPy4wZtsmH5ad
	 p3GGBIucsE8VPe14aoL4Ap3BBspF7mmGVbVLfEEf2DTCLOZXokgEU+uP/gb/EtHu40s5H
	 J8b6+Vm+NJzWWfkMj+ddH2p+Tf/f5zi2IcoLRq9EmhwN29a8H3TVKVVD5okGm7DYgcIrM
	 dtmIRJ/1eP82orHsOMVcGqC/QCsiVNY3WyKC9BVKVeadlr4YysC7N7ARxVuzmqY3obOq/
	 nFZNE4rjlZ5OY63OQaEfXM3eEK5N1YcVUgAMWEPdtV1KE7tkeHAhgp3aK83dvkfdxoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCIW0JxQ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00260A261E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC00260A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCIW0JxQ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so985340eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156022; x=1793760822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=sCIW0JxQupG1G0xdyWEWEm2lrNOPf4/+dB4oaUSL4wL2QUbgv5w6oVzYYr6H5Myg7j
         4c6e84hcIFdCN2UmV+GJQQcjztEJcMXQm7z19o6hJ7jqca0Pf4KO5ZymbPDrcIVFFwrH
         WBdrtbPh0uR5DuTMN1DSJ/+F0Zr19G76ws4R8J3P3xaEgRoelyH+uWndzr6qQQrERhqh
         y22KCkL2lgddUAAYxFpLu3qkxvESN11eX2pslooVoqXO0B3ZFnG0xZ2z//RhvenKND4G
         L8V6xnbagJ/ebZKBkWY6w6LBtCB7DgLgsDnITwfvQIcoOYgzh88kDqaI6FxSaNhiQxfj
         +nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156022; x=1793760822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=pnudW3Z2lN3E8Fo9gbbtBh3XPqbPUKnKgwzFZNe14wHlyH6P6SB37dElc4h4i3HwGd
         J79clz2/9MuJNWRTTgIEijPobm9+1MTTPB6xteNut8wDipFQWlA/PqTZbY0mbryl6a8s
         o1sVGe1jAcbxPvW6JPdI9SyuOiCe5WV+4d5TPlPDCb2u7yn3K+aDaIud6qMS5/BWMKpz
         gog8R42KfutJYT73yAswNtIfbV2E45SRrzYBZ/w1LL/1WY0kjDX67OqZxuhDDLxffLDq
         bb9UM+Ww9ViT8gomdEQGB1VYi+skIgyIwEXAQ9hMnZHAxKr4l98R3bEWlSKTIK5DAmp/
         jamA==
X-Forwarded-Encrypted: i=1; AKwUvBxac+WBpyX/SaMLP+SYW8bWKFoTLXosg16mJS1OlWDX9U0ABmzZAbn2LxIoU+Xp7+Qz4PeVeOvxC0vAg1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxR1lATwjYOWlbPgm58+t5FMjLpcaab9XvcGE1HexbfdyVlLl9
	4wKW2SdXx27atT/78GVMBSf3mp0N+17q4KlnmbxDJ0Z3QXFGb8Suzyrz
X-Gm-Gg: AYBFou14xMCLFo6mO/YQXU2y2GVOxAeTyaFDj/zxZB1OgBDRxNfEO789NfdeInhPt8p
	DrflQF93PV2ovXrTiS0CZs/mfAYxiNSQvZexx0FzGZoZ+9OJpxGwW6lETJZOF3Dhb94rIPaSCOR
	dzeImikdsDKNyWjenb9hF+jJpfGQ57td++drr4Av2Hq1SEwfWhdZgsF303/l+w0y86lDCF3UF5L
	cCXvRtV2CVxgUhe4zCRHRe8XOYxb2uZFgzswLRLIxgZljhr0+EX4spuJDge6muPRhzXLTzwl948
	JGQlbFns19RokLVYQLP1/ZsXyUzJiH09T09L4pFM2jpWdECArSw8HXSjWB5uDPVW9XBDoheYZ0u
	T+GzsFEjAPwPkkoPagkGggaOrPzV/k31hua5Gpn3i3Um27MMda2h1595wvC2bKFgzNwo8Qjc70q
	gadqrn4oKgGIf22pMfp8C0JRwc1qjtAYaYZ9WuGEhhN15GO27ZlvpnTJ+dU412/jy60BKNSJd+y
	MVe/F2WBUc+G4bAVcOFcVltg7G2fwdO/RD6J9+9j+GWGdItmpHhmsOgSu8nZ5pfGZRWk9xW8NbB
	gQ/L+VjXgPhsrERgbj2RyBGvmFbzDhEAY98iR0Djknt+GkwAejNTne4DEhuhWtPb8Mm4rMq3L4J
	VlmUsztlpG4BcyfhM+gjPti6di/0uPafZsFUdRDDMvt6txVw=
X-Received: by 2002:a05:7300:a95:b0:34d:7ae5:8d78 with SMTP id 5a478bee46e88-36a200febf0mr1531973eec.31.1793156021726;
        Tue, 27 Oct 2026 19:53:41 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:41 -0700 (PDT)
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
Subject: [PATCH v6 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 28 Oct 2026 11:53:09 +0900
Message-ID: <20261028025317.92450-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request is
still pending. A later teardown may then submit another RELEASE before the
first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels the
pending request and wakes the waiter.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_ctl_msg.c | 15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 2e0ff15e729d..e50e6c7f3b8d 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -314,7 +314,20 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
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
index f867b9b9233d..d84f0740fcb0 100644
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
