Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182154;
	b=nOLMKwP/F3nDBcPsMh+BTTvDBkk/UTY3uUr1KUMH+FF6cgt3Nryg5LmH0JT0Z6ZME3LL
	 x+PJbHp1gVlYUZRc+qEVaxqDArH3o8dEXUNiyXRy31ZS5MLguuV369Gd5AhnAqCiukX4X
	 yuLlCo/7HHvuUDUapOycYb0Wi1Xas+C0NRIRIbeRrqiai61Q8L3nLXgjjXistNquYZNHY
	 BzktzHAbO+t3/M6MyvVYUJ3QOBuY/wB3CLJ4nobg10Nd2GorSWnsI2XxOYUwj71F4w93X
	 INuDKq+JDGnXamR27s5N3WJs8yhM1zo44nEDVlDxKh6Y9oU+J/Fb91wU3i84VwTD3WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=yerldTS1DyI+b5+lJ+jGbGd2CiULwD1GPMgRCmCTuSlSsrWN5PhO/VovdLsdyDcFGblt
	 7a75cBneDx7QYFQqJIy9YBVpF4PM2t1TUroDKwaU425gZFtMq4iGaN12SFwtHbyyUuNAw
	 l11WV/YHNloLmoO78fO7erF0dTWL2Zj2V4eNajOvg9JhsiDT4E/qeKRmEJ/ur+FdaAi6f
	 u+iMzja1kjv0K32Ah9MGZhZ8vH8H8AWyPTqnAYaJdLkLamP+ckOyD+lbnqZb0XlGMgZlS
	 RYThwh7whUvurKx+XbAiXizK0mWjx6F6NwQ5x6olSy3qcPNk6Fv1rULyrsLdk3QYQ6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2p80ylO;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48F0606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E48F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2p80ylO
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eb0f1b592bso976495ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182153; x=1794786953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=w2p80ylOEaBMw434BJFvCPDMg98dd4/DQ5426B3pgyCPzrvJCZZq5XfDM4D1EYm3AO
         Yo8ypKw1nDDQVYS/0mzyr9P3iBtcowSaFo0ph/NssdcIsf0Q2+bsDEuqpaJrTPkU75L3
         u0eYIy2k/xzAxbpXtLfUqj3nO8pxOtWGlJDcuY95UaqyMMJPlQx4mQW4qqJWKOs0t5q7
         fQl/1BlWN/Ek3tEAp+TQA1trWYOyU1UAyjQZbeZpw6DZDJcRwCn2dPayTdp2tYpZOoTR
         lg6Ptt1F8lQWS2GOonuYyQMPKAOpYexpjuNn6o9Zd66pOXaM9Zr8PYIW/0EvbpOpjruN
         aNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182153; x=1794786953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=H+/BFX8cAhXIGRaoBPfguaSdRHuDgrt8/3HIKiOPxKeb/yEP4ZzNsn3zRbrjTIdhNk
         EZ+InfFzfaVpuE0hgzWEb8/miHrZHnnhCcdDY1KFKBOQfNWoczwMBKiGgllpImZay61Y
         oLXEA+E/5Njkw4LUpT7B6y4vzceuQ/QKjK3D2vsDj5STcOOWoAmlLAYSMI0eGSWyYGnM
         4aO0R1qCimRuOfSlaJLu5JYfRYuAn4nbkns1IqFkRBtoyYzECIVFxpELUpQR2gS6rtGb
         3xenUr0THE7UdIynroPLA+Bd7FYo8VuiCIEsHZ28N44e7WdBQ6nEL+xbPEqzpvTf3Zkg
         BPew==
X-Forwarded-Encrypted: i=1; AL+hErEcvV6/jU4bA8M9KfMTsbDaaioNaj2JoDG4AfvBTkxPb4N28Em4YiWxwHtepEgQ5xPa0lNgNjXodXATzo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z91eIES6voPAtpeCeY2F1rWs9POx2G9ZaF5twoREjdtSbSQ1qih
	Zpon2VMvZmBVOlg3iUILlw5pi4zGd8yqTFOaQ1bJuZZlVuKbYkL6sILF
X-Gm-Gg: AYBFou10zUSqORy/HAzgGW5DRF0DGyhsPKQiA2BuX95Ivd6XlwpjSObWG4S8AKWT+66
	bmNR+EqPYzj4W4Xvo7dB5Pqc3jSATd1sp+1DC8wAHxiCk1An+WsV4j97k4h6YJDl1hC0TU0y2bH
	P1dW0R3zxLoUCThdUgZjJWkNUW00SESo15+mZcn4HicanwEz073y3zXYa92z1VtnYeGjLSxPZz2
	jc7luimnc7oGsuaMaoW20Fc/vXKtJclHE5TelsGutzjpW4CcvKcQTQVmcoNOK6/qMdPddxJjcoS
	TpaWawDhW5VmJ9MauJoOiF5mC0aC3Fq3GxJpC0HuZuBuVW8Ac5H+MkGiFZLQw+jpPKBzWiXiwqo
	gnRVwsC4eY5e+Svzl8uUePAyDUumT8/FND7uN5eNMGPy20kALp0KjkD9hoEfqBsrc7iVWB+D7tT
	zbxcgi9xj+90+i7hA1NWRutkGGmgNnbR3fU8xfFYBIb1YntGW/G/vrshKCqmxNymwZXz5LljHqX
	w/vomhZgQziftb5lQL1cnTcrq0+jV6W5SkrlhVchdPT7GQm/h1aZ0nd1tst4n4m5i7SJRlko/ng
	pUNC0wATdzdtsaHXwZ3My8wwdypT0azla2QfzraiGk1/q0dxXtyAFe9swakTE4uKujX/Vkqrdd4
	pMf9zkhp7Sn55Xcme9gpGHd19Jd5JtbBKoDTCZoQbFJOTc54=
X-Received: by 2002:a17:903:1b07:b0:2e9:79db:449c with SMTP id d9443c01a7336-2ed83784c99mr24187015ad.47.1794182153315;
        Sun, 08 Nov 2026 15:55:53 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:52 -0800 (PST)
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
Subject: [PATCH v21 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Mon,  9 Nov 2026 08:54:54 +0900
Message-ID: <20261108235457.12688-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
