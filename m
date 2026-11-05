Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845940;
	b=LtkeMlTyq+/IRiLoxn3wvq7+qia1/c8R/WRjQfz7JU57u+QEbnUZ51TR61v8gFARiSHz
	 /FhPTiPTDxF0DgmXKBN3CVMsOqaifrdQCQHzQF4CTISiyD403pI8JCPpeE4ezE6vSWTSc
	 KGpaqCqHS5ttYmvYKN9zD2GHADra0Twa330wHHCf1IUepgvzRFGqpMgiCEC40jvODJMiG
	 ejuVNfNoQO7Rat2GPpSmLvkr7g9aGgZx08FvjhHYFkjJ0jK/YkKaqs+KKig/af4CP2oHS
	 iR8CoKEYtyq2gWdz8P8VfcPzh+3Vybtz1EeCRfWkk9R++CzOBFOIWBnW5fMqrjMCn2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+MrFgURXGVOlsfMgOcHhXpqYFBlUXyLFf4QG/xpHN8w=;
	b=x4ICInH5804ayZJKFv56FqT2FHwHbIFPq7SJoqzsFsDWNOlzFdP5nitJgCW7pUU8R8HX
	 ebqGgqtUI+C1LNAglVZlOmZt6k85UO6RrpUDAaRHHiLN8Y22DIOe2Hdrgf/h8R1NR6k1T
	 swSiGyyoseYo5XSuc52NjyYSD4fg/gbVZ1ZdC6wXUwAHGqokj4CnVemQhNWAyVjklUeRh
	 EPScWaoo846OnFuJ03n+ETggJhgmQJDu/MIi8Yl4CXN3fKp+0Ib4fJC0V8l77TwNphrbY
	 bet+chr/k9wryebUhG8r9UXCOefDSCVn2L4XofjO3evvWyI8ZKBvRB1YDW/5Q+JtY9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv9lVfIq;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6814C606EE90
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6814C606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv9lVfIq
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so3979705ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845940; x=1794450740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MrFgURXGVOlsfMgOcHhXpqYFBlUXyLFf4QG/xpHN8w=;
        b=Vv9lVfIq/uGJ92iz3/mvZUy3hIePG5UElXuauRlR+iqCnP1sx89GAXQrx8D/iWJip2
         kgeN5AR6Liz5URIgTLQAdRyX1C1KnS0LuPPef9+gy28JTiTIKb1MARzID0UUJHPtOi+v
         8oJGsVAedydWXl7xRsaokKjNL0+fAxnMU6+YRgLomvXnaFvwdMlRDCYrztExIUp5fUXB
         m/yyffdRUaxVA36XvGjx/gNHck3rnE7vj8e8CU+kIvJPZnuSsuCzP3vw8PIb9FdPhjMa
         Aw3dCk5rUz8ViMTwH2xCdMS6gRGCr7VhnelEvinwourcZhIdLf280N9xO0ZSzRTt9TEd
         WnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845940; x=1794450740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MrFgURXGVOlsfMgOcHhXpqYFBlUXyLFf4QG/xpHN8w=;
        b=Lp4/LAXAhmbcR0poKCi7xqepRf3R8LC5wVjNfhQKTZZ0TW4kFlbxS9+64oic6Hlm8u
         O26s3X8c5ZzApZT98lYkHAahr7P8Z86NaHjXH7TjTEYBu8ETUBru4cAKRPIGL2PIGKGk
         WYHEwgtUy7/nGudL/jC9zbCPVsn/WM+MT1GVVQecf+9va+VTh7+M82GPuWrgpxAayogi
         4BBcZ3r1DvNYnqXpY2DzluA6jG53obOc0GX25DVS1cBiGwnKN5VsfEjBxTYpromm5nSS
         sFGtDWuk1eEXplRjzbBsfGgqMJ37f9ICpZI4+Xn3Pfhy4zrcDyJ/J8Tq8WSzntGLTK8X
         Sl1w==
X-Forwarded-Encrypted: i=1; AKwUvByYWQEXhRRMq6IxXtTtDCYKabecqQwy05AMXimvwnK1+xjLmXKbeVFS5Jwuo4glJvqfsPYRvdh5+okZhuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8woNEtd1rOk1n9fWsuXFDqc3E02DPETUs11uL5m4Ot7pfIrCLa
	683Oi5I+3Lh2ZaDF1qZPreGGLjMYZCvS1cl5mfGFZL8MKGPc8ZpM+jYe
X-Gm-Gg: AYBFou18ljMrsNRUDI/btCtUdMIOrlIa5KKbRjP0Iuw2A0nvzUBAbc0BeCmf2wQiHv5
	P4BhVSfN88GSGuDcpFp7LUsIYyjPAFJXY1O0fGDqHqG8Un+x/auwLg3vDLj6A3nj7o+AbK2xMs9
	4wdh3zcCuwAjO2YN0cYF2LUxy8Qdv3L7t2ztI/FAwwqs23/0Y9BBGpebylKt9mB61kwv4Rl9YqJ
	2gr8RwHU7S2NUAwluggKYwOcoKEHvc8Z6mcEm/iMrWFbHW2h3AhXvK2iarA157aJ+/gz0jJ9Jf2
	kdwKXk1FpP4DGpPN6DUNrGpo6uF0hzlBjd6FbKFqLzoVtnoQ5wwPjhJwcqYVCbovNhjxKr1yjDb
	r++HdIQHwJztnPnT58CG4Xg8dX9cuip8zJ+AjYCi3DKvj+nMFnMaccRycpAhcirfkad1Vyjmaek
	ID95V0PrJvoE8Gu9ICV12vykPcveSfK0rE7iR4ESflidmoDXXz0dPVBM7FI8oEYC3IawPm9k2yU
	KBs3aI9lBSFHftBIPWM4u7+IJlcHVvCbl+ULGP4uOZrEI41YYRXKNUCul2fxUlIqtd8LVcrPm7P
	7z60qtAim7c42Al6BhCH/ETXl+bpLenfTncnFgDpUVYRxpThBzCWfgM727j3HbcHmliWlF2YVeo
	too3BMVgBg2awAeWWnqWVe7X0Q0TWZDFNQk8uJUZUE+mBe2cDKtSWJIt/CBRObtpYMbJq
X-Received: by 2002:a17:90b:35c8:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3ae897aa7aemr15044527a91.49.1793845939762;
        Wed, 04 Nov 2026 18:32:19 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:19 -0800 (PST)
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
Subject: [PATCH v16 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Thu,  5 Nov 2026 11:31:37 +0900
Message-ID: <20261105023140.18373-10-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request
is still pending. A later teardown may then submit another RELEASE
before the first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels
the pending request and wakes the waiter.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
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
