Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062099;
	b=gNmJeALx7ozsYqOpMHHtpX1i1zWTg6jkVvL56jptPVjHvgJ7jqunIw3zcrA+LzmJq1ex
	 XdNdj1H6+1TpC/UjS54swS5qAqeMh/niNSwYyTO2mt3bmxh1Q3fxihv/uzYfKHnUZJZvc
	 b21jf80hnfod2Z5k8ew3wKorXTYRuj13lHSOPM6ixp9+ir3dHr4cAO14QCeHYQRKb7tRp
	 UKYekmpxet4uKsSPaaIkKPJn6ePX20fbujU2sujUsUJyFoo6TyzY2zU6c/nBB51T/TaPN
	 jknjvvn+vo371eTbW2xtLhGT36lL4Grmq0qlIxCzuVMa3eP4ytXw4fJ6YLXiZl+sKkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=NKUpoUqQFcnesZEoBW+ARq7LVV2FDog5Ceu7LE0P80u2bbl0v9+FGPxSjkPBSBcy00kE
	 gQndwqTp4UimeUzBKtky2VCu67FLoHT1BYEpMt3To7AY4GlVAqVeNLtgMAZeRFUmZGq8T
	 IXUYRYfGl+cKffA3eatWOpOSGK69blQP3RUXNOOJzPOkGatPUJ5jGS5sbtyeC18ZGKA0k
	 rFh1NQPfVSHPXNYvKNHycxAey/yXV78DY4ZbdkoCvWERTD8Ut+FG8jWlB2yvBPgy2l6u9
	 9IKRu5da8UuxthDafUViwJ2pM2x6jwtTWBN3a7n47/cUKS+nIeosYERUi3CBSfTe4gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0ChFYZb/";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389F60A2612
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8389F60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ChFYZb/
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37071c0f42aso2156332eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062099; x=1794666899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=0ChFYZb/ar2yjXHgRksBmagp3HbaVabr2QfVW9adIQnbO39hQg1kWHUAefGnan6qsh
         F0Qt/9pNqleGjL0mNL43iM+/IQ1IBAO73gDVyCsF+awUX+yRrtM4QH4ktzRyUAdtm+Ki
         wI3jZV4J0W2Fe5udlO5T+KC6heSjlaI9c3TBa4351BhrRk6Jo2x7sGqyw+4qNY01NtII
         vXQvJ/djxAjYHISKMqthnAtg569lEscKC1DpMlsPP0EIcvAV2BfB9lQZpUKDVSwDX0W6
         mNJXRUv6Pm3ltnkL00YPGjN6F8X5NX9BhjQmLCTB1pqhKqJrIgEBaPowbwvoTJ0Fh9nS
         oAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062099; x=1794666899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=NxWEci/6/qdp1dwyydlqxs7fADH9Mc5fmtWZkIha0hQqTrhaJsyxXZ3T2HKlzh7fqf
         Bj13IJWTXwDvuN1O7oHmpvKgvcZrsHWvg/Ti3qnK/k6B/fq8Jbu2f49Wdwm5xgNK0YqT
         ChEjLxSYpfkPsrakIlLlBeSG2t6hXC9n1dPuVjtW+qCrjyXd/FUgjvCTYd5GL/El9fRe
         SUlenjppPD7v6mdzdWomS9WpUdoNltWeWAL7klFvFfIw09fZn1YP3rO8Uf33mkS1qBSj
         a+H7Mg1uIt/uGcyi1JIbtEAh6CyTHd1HFhoyTjjk49dy2AevQsNnVoo8qPXbWWMJiy8D
         jtqw==
X-Forwarded-Encrypted: i=1; AKwUvBxlkazrZqURyy8tJisnmjx9jJPl/m/+trNdF76yevkICiZKMT4kz5VtbrSbMELSOOneChtUBM9RKy/hxpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9hXNElci7g7Bt6FY+aIBU1et30k/rEeUB75pDi0rIXQX/mvrz
	3LvRgZS+i9JF9VwcUEJGvGCRC5h0iHUNQLvumHM/zU0S6PnIqmDmsb6O
X-Gm-Gg: AYBFou3Q8q5dQhfunz9rzHLNb9Znc8QGm8T0qyP3QFxuCbAzQlSMRMP6p2z9bCLDE5J
	1vwgUKu0J/B6R/wDz8AabM7/nNTunGtt2X4unrnfPMxOrJLfvmcCnTmCam5U6X+Xw3l2/IaGAtm
	X66AaN7nXyh1kdOQ3Ps6I9wGivliPeuwWpitX1Rabq8EosUY4NEpK0V2WBAX/rJ/65uzLcE7vJR
	GFws4iCieXn9GI4gEv6DjNKDKvQhXfnunVGJuTKlxiAv+Oarkjarh0Xnu5QUgkKF+FDYOL3h+X2
	IyDC7ytXCDvOhHMTveA8VdjrzN1mr6qc75jFkrRtW1aACLDP8ABUIfuDQX7S5r3bgi4HCZ/Khq6
	bz1TXuIi9H2jVBYr+QIkeOKlBS0sZfDHI45N/EW30DBw4G0c3p2Df/rM8Ma0wW43qTGfnnZpaxq
	MAsKuTcFtwawv6fpL+TOQ7nHDPlWsAC8WUdeW0+KT2Ib+HlUg0rgNcuw6ovkYYwipLw16jWsmPx
	uYBH+64B8IbhtIYc6db0wrQ/54h33AR7wK+3I4J86AM1C/TXoDZbxyKpBzHdk0LEJcXiVEbpxYQ
	IHtTQBOsk3IMhtFmUGNqxozZMvlXXwHRkMMyHzwtCLshdqTtVPDzT7xgnes3wtsIXKeRPwU6/Vk
	03M9/Wbpns1v284j0wntLuSILbEYSXc8FKGtparUyXKntKA==
X-Received: by 2002:a05:7301:d808:b0:36c:9af3:2309 with SMTP id 5a478bee46e88-36f6f2a4632mr7502669eec.0.1794062098568;
        Sat, 07 Nov 2026 06:34:58 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:57 -0800 (PST)
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
Subject: [PATCH v20 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Sat,  7 Nov 2026 23:34:19 +0900
Message-ID: <20261107143422.29319-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
