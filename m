Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758705;
	b=TIeSdU3cl0lYhQRobhy53XrqRLum59M1a10P7Qo8CsGp6wQLp49lSBzLyICToD9QTR70
	 iMlri5+lbejhDcIKU1MDKAkfOZ/5rPybcDSIWdmQAV8XyZqP+2SuGi3rcNTT47Ww5aEKr
	 rH9wp8CdRddySYVSeyb43N3ghSyQl2kohEAHjSpqSDiMt7UbXWzrrxnq89irGqCYBWRjW
	 eSE4HIK8F5tltGyokBP2eD+ljQ8CJkOIe4eCM2AZIMu5ops7wzGaTAu8/zjfGHmjLROA1
	 G0NNtR01h4OVN+tb7BrmLGaKPUHhrga9nwldq0h4oOlME+609mXftvAw2RGhL8aQGSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
	b=jHu9j7bTrK1uIERSNmx4ujm5kogUgwuDUcX9OR8/P4Yo7NNblujfayNy3grY6TrKdiay
	 S+IRAHhLrasY+dPcDguU/Z5Cn28UA8NsNZ4xIBWqE5u6OghA2Ir6ZRrerPwDFU6tnQAUd
	 FUqpQ6xOauyALPxW2SsF8Ez9AEqUpnbbeC1YlP2t4YsPi0H0FnZuprHUYK+RWlbeC7H/m
	 kL11iyxXNvQYdUARBsCkgcLAD39A6spvSXGPYlB7fcdnmmbn/CkGmt3mg1vK3Ev3WlMyp
	 xL7h+9HeykTHCifa/+iAOTOU6MskvHDK9dT0bQm9/jA2EbHUE33ocSxRfREjLksOqCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y3o/CCpf";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44415606D805
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44415606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3o/CCpf
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e987b4a710so7270245ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758704; x=1794363504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=Y3o/CCpfCiBQofPKM4Ywt8dc7DFmzbyUfKOWVrdCUW5tyOO41UUzmvQ+6Esg818GI0
         IuBUALQkirdwq5/BeanIktv80xC4d+A1y38PxF71Tg8yvD8jRU5GE6nzbysHTivnh7nB
         p5Hf8GDtgS4rsEyXCzRVf5zlCDasVYfrJXuvn7bui67frp9GBND/AfjuqA6NxIwDTAsu
         nAa2n17352M4IpomjHxS1w6vRYYIZu57gZbsnmLaFWtDs8CMWf4q+dFcNJFYrV797s4O
         jcNQjId8jP0VguTH7xjBsU7ReStMAJI1yJSwFc2KnP3CHdZv8Ykvf296TRluWTqbQ1tM
         9RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758704; x=1794363504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=Rjfs4u8B4I/ZA/bd4bkB+7bMAns94x9ZAn2ILhOCBw7t9YzvUw8gZ27m8FAlWbYPly
         Drd/bM49ZmUnXEy+4xY+kPbYyvdOQkf2wtZ/V4jg8mteQKuYOakcn5XVHdrf9fQduIIR
         fJIgPgdfS9FkU/zTqYN9UZtS31Ha9XpRA82cugivckpux2JxZ9QxpOoObekEfkIC5rAa
         UYQS6uBiVI5nSf9vY3fmJI/pqImej9FU1mbKUs0f3eiVC+fg2nOrcAsENM33z7l5RJL9
         fytW8pfxiBJd4b96T8BPoR73U4lqXT4QmexlPnCOOCNIm3H5fQcZIAAQA/yKyJpZ1Zds
         xbAQ==
X-Forwarded-Encrypted: i=1; AKwUvBws9lHpHyqpysfIx8unlLnWGgq4seFs75tQP5hJ0l3GlTIqoQDqvmGgOm5TDoZR7A3OJFnAj7zqIdnot/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ev5rmY+0oCXm5ebxgVjTBSz5Tp40LHJxom6mUkEId6yMktT+u
	unn8o5cLjv94vScwGu8Bc4JJPRD95nToOspSZ+vxkUF0LgHmIKKZKB2d
X-Gm-Gg: AYBFou0akPywMV6Ml1iNxsc/q25xJPXUD45VDEIyJQPXpuR7wwC+fNYJsIYgBtZLNI2
	vFYqgBcJNFS2zPlLr18n4UOySS/BPeLdceOETA1pAK+hdACQ9BQv3h8tCZFFP/WLjTLIrX4qlFr
	xH7/RseeF2VSF4TTZ5MrpJg7YkNbJbbsQQNSr+5jua+49IcUHpfezuSs/aNoUuLmyRC98Jr906A
	D9X4CRpIdFT1DUXdqmSFm+LiLgwQ6QPEKf1utzOUAdCII1wgLkHvZuRtFH2Tgndcqx0GCcg10JE
	TmawG9OPclX38aKL3SsZ3KIII0+naueZ8zN5fBzt1ucX5CWrFBNsshtU/8J0o/wuj7CyhqRhWbm
	gYLpDp4t32UpJXfNNbnTkiICd8k4Deqcly9RNgK1VAUxDmT9NkN0zahx5iFrhVZVKR9GuGvIBEV
	RzfGDCyUcXX4YAvT4+vKArcE3rIe0Zj7CzLyJo1qQiq0C4i2E6vjaCuFajJCscZE8bLhxv5cqpf
	FaFbOLBBVv9quveDvO82YBoWsfeYFR8YNXw0F4I1A42bPZmSuEz4t750jYYmUY0G7vHMzTcdFiP
	BaTHvAtSC95Cj9EHjvVIUiimvpsz3CNpEyseHb7uEW7sHGyI9f1w62XF0p+5m3K+1cgbNOunGBf
	ctACvHRX/gZQD2E0w3r2oTHRBzn+9FTDIy90oLHFYkNqGFLk=
X-Received: by 2002:a17:90b:3c08:b0:3a6:e159:a229 with SMTP id 98e67ed59e1d1-3ae6f0349b6mr11883081a91.49.1793758704355;
        Tue, 03 Nov 2026 18:18:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:23 -0800 (PST)
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
Subject: [PATCH v14 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Wed,  4 Nov 2026 11:17:42 +0900
Message-ID: <20261104021745.57733-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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
