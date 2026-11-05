Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837395;
	b=mlF06RgC9POgJcz4AQCQZeAKdxSob4cVx/VJjLBa32Qt6oiL1G7iXKPtvc17oDyUggZY
	 51q6xdfabo8Ah3nogm9cXgQ+jS45c6m+UJQAtZuVHxXMfPlxsDfjGDLDjYLggU1QbTdfp
	 DPl1Ws65Kgo7GYOtltUwXWkXj+Pamq7pNJp7JGvgjSs4Su1zP6Nb3smtfGJWzFJkIB/8Q
	 KVOV9WuGS36zAUhP9Nf9/ZxMc3q6Ghhg1btsgwmuTRUQJ4dzh3BRTUX+OlI43CBQwhujc
	 OhFJIQ/A0PCsfNdP3Z9Rg5XoMvjBzsSgNum1Q+eSanqlO3Ds9Dx9f//8Pdc95DtMIfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
	b=gEQGScKB3itKTVNbtWcB2pZ3DLJnrSSCpymclvTRsnwMhXxa1ZlW8xZGuWroW1p96+vz
	 63KBPvle9l3SvQfS/NK+awgEByEJi7/7ons4qwaKNoVcy/IsSvdPid/3IxP1wLt2WVqfx
	 yuaxz9DC2YXsdVPkPp0bj/0rpGwKjueM7xG4ePgasq+mV7OHwm6ItwrAgN8nFGTqR1z3f
	 VDnyf2luTu2lfZaNNOldz/8vvdUB7dz7HtWNvdHHb2JU2wo4v62sqqiBZqcdIDaCyeQOr
	 fFDSX900XzlV+NXGRX128hSczaKrZKavpF40ixSnq6y+vxZOdkM3no4FlfHmQcHwqWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jn+RAC2a;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E08606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jn+RAC2a
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso764993a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837394; x=1794442194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=jn+RAC2aFvaKWv/CHLd563ZuPUG4ifSHfCIbLG6CaNO18w+mIJYstP/byGNTNPK5Pt
         quRyHYVH1nz7kuvW0f9knNpy2IF52H8qvdrIqetP3wGlRnH3Y9UlAee68jLY30ALXGxw
         isik8PZy48NnXlMyu2JyYlNvFXBj+OMQqb4aci8kNh2hxryKMdkyhwXiBnelVBUEmVmN
         cYEhyRsAM0nPoT/aOVMeRRnXsNvJ/Aled0Bj7UeAM7Lj2lN97lNZsGAH6pc2vkHYAwJt
         xAQy1PUbluKm4bmBCuXttpT2DcFVRTuRI1k8buTqq2NNR1rkGVL3Fp4Rp49t1ghaeXr9
         3EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837394; x=1794442194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=BY/sfEW1mfmu0KAQJtGZD5Ib4GIMcDT8rVlOntNSUswwzjm0BPv7qxFu8zgmzQ8p+U
         IFcvUDEGNmBV/lDwyntJ0Pyb9AhDBiWKDxpFrRFU3QGXlgDHn5lxjfyExOOoUkbAK57k
         rvU1jGoR90Yekvj9WfdkNds2UQXEHH/eSEW7HBX03WGzd2pHGNWS5g8HiyWoUUF73aGU
         xjW7b5eZTK6TZB8C4DXUF0joazfIDbjQf6alJKyU6Lqm0HPolJt9GUb/wKWEWvixf/hu
         Ai+HYlpkq7irOE89+eCE1ACnyTj1El0ADQRQHfO+qXg+3++1IulYZjw6P1HNjI1NJ1xc
         Myiw==
X-Forwarded-Encrypted: i=1; AKwUvBx6yhcZIZ2vb5omGfjkC9DVualXJOOcFwsg322au9TaZj6POd4j9JUqpFIIWpkhIRAWUQyYaPujVWsvYFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j4c4oRC3BPaYpNabjXpF2Eams01r4Ge9DAyx+yM1xkwb7fmwO
	0NAuj/lfal2kTW+drau+5JHR+Ft4+AkAU5WAVZlI4dLeSAM+5b9JGm2a
X-Gm-Gg: AYBFou2RQmc6ipIcWazCNinYkgs0eb6UO+KkBvsBcGf5HDSlvRZijcS+E6t1ir+7/rk
	kPwfb/B4XHngkiWhmiyLECjd4ggfeydGRORv4O5jgMsgWy5rTjYOpaYk16b8MrnvRbCyH9tki8n
	qZG1dqCQmXjnp0fzelqZT7aUxji6W22KATNwqyeadZjdknZGRpKECcKwoaTLbU1OuzH2CrORr3P
	C+Cd8bcC2HOSTgqp5lV6DkwWp4XEaDN4R7Z6EiI1IfmnMCb/wM8FR6CdfTflbMOzdfJKVWkmmSH
	FSTn7imkgx5WejNUVq9JvmzEs1hSWDiaKnnOYtGoPXA6nCIj4Y4uAjQx6Yd03UeF82+wgLu8249
	FXH9ZzxfuAb/FWw5HPEuxslTL1PZ2jj++bV38Hdwn7beW3xclqjEJHygeKZiCo/MUrbFzTz0hJe
	/HbuXQQ1/tb+0D7YEBpzJcK629nHgThrZ0z4CYnYQSHFggjDFea/zaGS9XozQb8w9XxBOdCO2sE
	T7+etZ4OS61jmfUh/ckvKkvop2iNkSRfOJTuwcNUNeLwccqiFoDm3q+p+bXRoYwMNe0D/ey2u6Z
	WlQrBZW+8MPZELvtZWLSaqkwM4hM7vQ2ZNLQRCwObD7W8EjcmiACp8nUTxKj0/+X+6UdbGOEmS2
	4B2Ou5Hii3T1eGkeEM1KGPvF0M68POVHaRGSM+HhFzK+bSc2kpo6PHjV1kkzSVFj4lUkL
X-Received: by 2002:a17:90b:2751:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ae8984ec60mr14592568a91.51.1793837394483;
        Wed, 04 Nov 2026 16:09:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:53 -0800 (PST)
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
Subject: [PATCH v15 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Thu,  5 Nov 2026 09:09:12 +0900
Message-ID: <20261105000915.15177-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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
