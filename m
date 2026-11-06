Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923640;
	b=BS2e/fdMO7xMyBfFPZeUzLmc9sh9iP4/HLPvYfiDbqCaxiBXxFZI518ZzU4UCalMnhf0
	 0wECXsReq8hU2n9F8V98MhfCfRst0ZnooGMy26m6lIr/fhd51kr+Bep87juUAS4GwFChU
	 ++LuKRE6ZvfhZeeUdB9ZJ+0FZe98ssZymWN2YI2uIgrvhNe+rNuajmErgNnTg3GDisPcE
	 BXdLt4Mp6eX1ePCeKnlccMjcsOScaGVJx41sAftflqeSvgEWGwLLRTuCPuMI0uwCiSIfL
	 AYfWl0ShT89aWtRpnFK/DTSc2ouNrZqSmgGin/QOlrriONT8VMN9OeOhAUCJB49Wx4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=LuZipxu3pOOfDL0HG1pzhHzM5s//rCv38EXC4+AP/sesU46AADXPdYZvlaZy9OhcdbWY
	 vD2OHReodgL1MbJK6JZgi3+n5pchimKNOm3EH7lAqvKwdbB6hZszOtQ0gz8sv3XWyQFLh
	 ha7AzSHTk1Rwk8EEAOnvPUsjK1D9rvUQNUZ6/R5Q2/t0hqO3Cl6GKCMH7AVO+Q60aOam0
	 Da7yW4hy9OFjZSTqNrTFpDo8oj5tutEd3Ab1ltWfro1ggN/7FY/gQBy4zZxlTpxE6n4JI
	 43g+w0pjlnxLU1Sjt8s0jGR9DxYGaEWawT+dmIMDJAwJ5loBc3aBzJze2z+++VnBF1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRK9sY3D;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AC606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B6AC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRK9sY3D
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1931ff67a29so386573c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923639; x=1794528439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=sRK9sY3DSDgmEYhTYAcHjTmIoyRJNRfdhaKjdwt9pHcvS6j01bgZH17FFdULdq6jW5
         hg4HG0W0zcezriedl16bcdhogjI2hiO0Peh7ckuaSrORiayKlcHIV2X/0fqqE7EY3sl6
         pjB1m4wb7G82KnoDCKBuJS1mf6mdnXqho5gqT2RKVSFGpUH08mdzfE3vMM1WeEuwi8hx
         9VXCwQKFyEx7dkDGWvX9TzxH9dZbDngSpt7QEGdvV38ctMm4Yd7nMfvqakddDMesQs4G
         +w5RSNsMiVUqycUn0KF+l1QueLBsFntbUzYAtse8Ifkum7mJH4ljAzzz+eMV9/gsmOCZ
         Wo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923639; x=1794528439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=MfQLBWaYEvhmNu7aYGfI/sKo5Mj+cv6eLDFWKocU0YRhSOXa82skP8fK0iUtWGC1/C
         EIkVpP0xLQjM8kdEsSHNFNt5Gn92v4DDwfz+khT8TM1e2Gue4ALSri7raiRHPrUH/f83
         NYR6oVSvaNj3RVy/qZ4OHRwVAdx3TvN9cTk2J1H8fxhSnnNO+foHcD6Z1HQSrsoO8qQa
         rHWsYDfAF0tpnkICUjd3aoMC9rZhvwbnAmExqAE40umigG04EOxBzZUnjBVfOprNq27m
         Y8wEc2kPfg4jXOYOKxF6peFGGSgmU/WEMkPI+0hvq5ThOjHM+MPKkG/08ILY4xhDOjUH
         MNag==
X-Forwarded-Encrypted: i=1; AKwUvByxW17I3KQuSmj67iYEMe24Q2XhilhplcKvD9PmkNEWkckM9oHimjdFoDoZZj1vxdG8zmxLa0QoPtFe0DI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QoG3b/zTRAWgjhwfJKrqZPr5HmyPQQ8tjfkZa9OGWznbLWnHj
	4Idq8IqyGGBH0BjGZOobAWms9TRZdkWAXUXCnHLRR/IWXrHM9yhyDz0A
X-Gm-Gg: AYBFou2OnZSzELOel9HIBrmzBv0ap3K1N6MotQ+yTZsdkqyI+EjDPGrLpCwmt4Xlk1r
	6koQMlWjeOtFCY1IeE59VY2GGXfqk4kxpOM++lfRhhsCncwq35anj36b/BtlUzMKWuLgGFXyiez
	bs63ge7ZNle4WLVLd8G5y2JdK9uiR0NU5qa4A0OM6Nw4XgsitDv2NneYSjyVgfl41IzS9XOb/BM
	Ey7IIbwaItHW860Tm3BC/qUxw75UiisUHVj4OLh72BeM5XFEVlArkot489EM/n6Y6ZUV6Excq1A
	6jTPOPiRe9bqCpsMbpMyMzbecrPkoDbhdgxlPDv7Cl6pnceLZ5oPKD9k0daKM/NkSsOP0bkYVUc
	nqzHVKpgN5DO0CSopgjInLq2e14QxuBcYIUNh7AEhpQnhCb7pb3mujxHL7uMUg/UDKwTn5OY45i
	P+qKG82OQ9KMImwzZZffLlVvU6JVlKHF5Va3GM3qaNWkhhpJr8IkM6OEkq40VK7TEaBrSIL9lud
	ytrazp+Yx96wOCVtCr56tfHadweSHBUyre/yfrbrApZBL1mwPR0Zm3kl/+DAz+B6CywCQf/5wuM
	8F0KBMCTrvnw9YSqWYUiPqElN7g88xjfhtZeW7Gbg4E7sA+6syPP6R6dFLdcsdfZHni0GLT1j65
	ofS/norjWT/w+3WPemCXCpEmr6HR+mjWhp+3mLSjVHXsi+Ro=
X-Received: by 2002:a05:7022:6983:b0:14d:baf5:c415 with SMTP id a92af1059eb24-1b25d30ad8dmr1158836c88.7.1793923639260;
        Thu, 05 Nov 2026 16:07:19 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.07.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:07:18 -0800 (PST)
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
Subject: [PATCH v18 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Fri,  6 Nov 2026 09:06:41 +0900
Message-ID: <20261106000644.20460-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
