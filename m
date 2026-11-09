Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201417;
	b=zvVCIerGgy4pEWsQzTcoIpA7He4RaS7iNRWZZWCTL3GwPnlYeVO90VL2yzm+B3TU2Rg6
	 x5hAwgQpNRDigoAUO9dFG1xGspA09Kex1nrvFIB3h/iQaD3V1kJKm8TX0eRvZDq5hpNiA
	 sssZsop+zK8Z1tF+F71h4BroFwE6wH2mj0foCY7Vfo9dBCKtIox/ahH9BbCdr54p9RFii
	 4XWBlCs5htvYjOTKF92puPzE4sjqSiYIBCM8I3nrL3xnwxdGuykc/kJTVLLi7or7BDdlv
	 /o61oWTOP1i2gb0DZDMD9zFJgDLdFqN7FfsAA6/0CmiJT7irq01gD/Qq+sK6ZYEtqlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wxebC5D/9DcGBbKajYZQRzTUBj4jQz6fe23p0qiGvhA=;
	b=lBn0wS0/ShvAJ9LS3KN27z6Xxusv58DMDfpgW35PptkS0UIdl+sbUXKi/O4m7SFHa8iP
	 IBQIciPsrdtAANngP1mG0y/dqelfVFe1PVOOBA5t3Ub3Nwe1BO9afPElP9Sol1jOuIzzc
	 ZoJCNwPLtQvBAeHBhHV/0Nw+CJM4Mph+Pdmj91RMq87I3RuwDqCnvsQ9PDFX0wJFVA5QO
	 vh22E7FwPJ855vXayt4B7IIPE3v62zcOkRzSqcXNWoTNKygZ+hWVFcYJFGzxKZAJ4KuaH
	 +ak+oqJXfvgeyVASeus58SwiKH96jw6mfQ6ZNZDRWSGnKDtvn7LbDZah6dI3c+v2a/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QmlIWKE/";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87F606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE87F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmlIWKE/
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so543249c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201416; x=1794806216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxebC5D/9DcGBbKajYZQRzTUBj4jQz6fe23p0qiGvhA=;
        b=QmlIWKE/KiOoO4VxE6U+/XATGisTdRR/q/GHzwnMuIH5egNt5M4foLdye/4jF4e8+g
         6kB1p137nCTsnyMJSOmMO8j6YqqIGTYPBFnHhYR3q+ptLfG8yTU6xxD+Jh1gDR4Rfbqe
         pllqITACdCPYwLx4KpHUty/l4wjiWrB1i/csA+KyJDqz4NY16XtIRXMr/vb+EqEcxDzp
         O5PALlbRW7UJy6n8rKY9fIMNQ1lJ6eo7ogsDgCmt3QcdshZxa1wCvN1+YSsrmQQ9Hm6q
         FWwMwS0Ax/VPqTyCrpNBIv6ItkGwQxxB33H5N8IKOp26LxTddOwv8TsEQGou3vshrczE
         3+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201416; x=1794806216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxebC5D/9DcGBbKajYZQRzTUBj4jQz6fe23p0qiGvhA=;
        b=K5PB7OByxIzg8ro3+I9Fpa1bWKomre23KV6yOa8ERzll0BZYs7yutSYnZyZMhVUd4E
         Kci3N3aMi6TnAOJ6GUAFy3/mepVUbUcvlkbmvZTa7G6KVLVFHqxkacSSX4V2hd+K0sBQ
         HkdZDqCss7qF3Pl8/brIQi5AH0OD4JsZSYiwS96VMWe1gF6qDqZQ/2QP64r9H2CAj3gw
         eywc9VfpwogdvHrCtnbNHR1mToX39V/z0jrnXR73UYKB93XUx47iHIhZP52i/ClEQ//5
         I2byMZr5gUF0wm9KKl9SoNhPXmpeQ6oIxfImPtB4kznGCClCgwI+JVeJ357EV9cgpDui
         9NPQ==
X-Forwarded-Encrypted: i=1; AL+hErF35cyM4L/YHLJmUuZXvS7H9Oh7aTr0slmNN7MCHLdBfpPOZrmHPrKoxmLU7h1UhRc1UNWUN81m6QUch7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dUWeSyCqRCHCrXL1PnmGill++0/8ve+6/M51vZI6/EPfrH1wR
	H2VChN9I8FGF80+BkQsAmzCnoPKj4zsOJOQeTVtRN4Ohk8lQL2B8miGH
X-Gm-Gg: AYBFou14G0DfM7Wm18vi9+AXczkvKjCpuS744qLSR7B10c9SWcEfgdRqvCYCb8JRT/t
	LLEbfwYdOiHfQoX1SzGBDpJLoxrufQvCliWVdWmpdGugbr3k1hMqxOzw1rUsdKxhyemRbKb8kP8
	GVpt7C74XYkkDxwiDQ3b1Rs9Hri+umhLGL1GkLiha4I7Bjuzc4TWP9e1CggCfYhyS6knmEmK2mA
	d9Obnv3rWjY+8ahl1l8JS5wEU0hYlJQZSGybUGp8oYmJ3k/PLnOhsRY77NM8X+M8ZMsXaDqvwcA
	tjVDpSiM0Lzq5iBDZToOmwxrevBBj31A6H4pM0PvNTRewDnLBfPxCfSXrv/P84Y5CWXMJtHCo6n
	WITtA6T53axyiZ26dBEXdZJy0+CO0j3o0NI3wXROE0qspsuFDbb30+G/Vq1h3pj96/PSv5OK6kS
	UZbhN5Swi8Tae+PGUTrfx+QIe/ybR2yR+6HahihpVgjZxnBmJ5OMIXWnhw7CVh1TghnP/dlsFNx
	fLTXbrazD9/UpzF2vOMOkvoJByXiTEJ9Blb8ZFm42tj/JEH3crt2KiTNkD7sU2yOaOVkdhe/LVF
	fgQj/fupMtJRdyj5VxBES/aLJQp+f1dhD3fD8g62ADAtEtEwF9fFCJiNKV3UfE5mUhbfEXvHr2v
	BoHvP0qYDKg5v+A3YiXKGMb1izYX/2ld4e9oYLhlwhHU5PNMOtsZiyA1KMDGGKwBs0TpK
X-Received: by 2002:a05:7022:ec17:b0:19a:ace1:793b with SMTP id a92af1059eb24-1b39fed0700mr6138711c88.18.1794201416127;
        Sun, 08 Nov 2026 21:16:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:55 -0800 (PST)
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
Subject: [PATCH v22 10/13] ALSA: virtio: wait through signals for PCM teardown
Date: Mon,  9 Nov 2026 14:16:15 +0900
Message-ID: <20261109051618.22506-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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
