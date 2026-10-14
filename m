Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5DE3859EB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965745; cv=none; b=EqFAAQihs3PthRvbLdhJJ6gUIk8RxfwUzQiYl8mbfUHNOHI9a0T+G08Byd5rj/PGGDzeMB/fCWzrNAOW8WRxKLTTPI4Tb1zN/nILgq3ff9IvtIyJo6hAal7Pw1KrPkD3BB+ai6QpUtDu0xES3JmrlZRc44PTRqcBdrt8T7VZUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965745; c=relaxed/simple;
	bh=OFqdtS1oJTHFvjngsO4Nq8qXONJKrjQgc65t4eunTXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVqy/ZysIN3Wom/WxYK7T6pJQA7rGLQI0ImeANxvanYWIbZ8rYOqGdavRFpwWvOU86w+Y6C3iy+PhiyW1RB2ALnipGCykizDqSOvek2PPVUAkBqm6jki1+hjmcOw7maBmURufzeRhIrpIpOdK49h18i4FmBhBCt7itDn/zAqpqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnLALEoB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnLALEoB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e86dce4510so19262015ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791965738; x=1792570538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=qnLALEoBE9FCIEmoFxOEEq6XrTm2jpAZwAOj3TRAMXzST6bWep2h75nUE7hjoPz1qX
         Ecd4k5m5HpqCVPN+zPaDPKreTaINIEKAbxhKz24aHxEQdDADvApbgwhtNrrS2ONGloDe
         2gge24KT6Fg2EO4eCZX/lx5aQ67t3SA0GzEGKW0MbvCcPJBXXPUtyCXh9yQis/aSRnuW
         wI1FLir2dYPGJRphvoX5jXh+dzPdXxKL/3GbCW7PchcAQ7HdpoewfN1i8AprqLrNfp0w
         1qN3wLviIVrJuKoKL3S2jWMwtvBNmScWPJ9ncTQRHJ1biSOawVS3hZ6pBYc3Of3j1GGg
         wxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965738; x=1792570538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=PJDlk/olAm+YSck24By2qefPXWPKLPhZa+Nxp3yPRfnrnk5wamQsSs6CkxACOD3Sez
         K9XaFZ2iQrJ1n3Dp4pL90s76XaWNNmigl5bdJglPVtHTYZ8Z+z+UKMYy6HLU/njOYpvC
         bHst/cyp09usIfwv4Q4/r7DPkNMEFslBIINLPzBJGwp18R8IogVxucZMgyDur8tIMVhP
         zWEh/vPRwQI3/T4vTO4+cEfRv1F02cg5L7dVjwf8tWFzKyLj5lAhhfNlOXhHmO/v2rDe
         EGoFCvrHkrcy0wknRmB9w8mfARygpcl7eMrRa9uygBzRASuBDwRfV5slXZv0IhWwDGUf
         LXuA==
X-Forwarded-Encrypted: i=1; AKwUvBx7MI0N6UOVdWU7pic5DwJzfPURdUIiO1gHicTABZJakWesleIYICEYBa9pU6WYD0J1xFW0BpP5ex3hHQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ4tNsyMzFe1BTkV11df5W2y1sPeiva2HZO5bDE/ncOrsoH5CW
	X655ybSAzmUuIZyQ76E5acjAHVUtPcel7FwKf/3yH4eyVBH3+iimzMbN
X-Gm-Gg: AYBFou3VJ+bhJkavcHfnGVnGA2J7cVa8sY9lQzNRRPvQYxnH+g84AWTl5ryRQ5B1Dlq
	LrI/mJ2pQijqvY5tGYq/FMmFMR/uuRvA76pLKdSv7MNzyhMID9nAeFtv9zgmQiGHRKO8zU3ggH1
	INQg2HlhwOaP5nsvkwbBfMDGsSSPxXSE+wSOMrgHS4GT2EvRlPCMCdML7DPdYoJ/t6Mp9jn4IB2
	YUnUqfJv2hp1ezvsxV+/7gU9sS5lsAP4dkU/H80pNqKpDOyFDAd76CFNvq7NwvGsYM3IQ9/EbMi
	cAdrPMEU1K/LaqZ8rniOypPano/Em2MNTVZLCYCRm8zOhnBUlffLjuIsIQALWXana78OFA/iQjJ
	2io4k5/7Hepug2u152yF8cZAIuEZokmGEb5aZ/qQhZ0LvOVliLR5a7ttV97GLgLL4L3/Sg1/QeL
	gCi9Dr9AmuRu04Kq6JkzxxENUSVqwrOvL4jO6bOZJ4nUTTeIblfWqeZ4XDrwAuvID0bR1oZirUz
	WGH6QU3FRyPtXmCK1G8cXyvN0jmkONnGOLBEAFregFZ+TJLkPYEWnkCQ4IIAxzY5dnazXihjDxH
	H26D/DFOm3YrIelh
X-Received: by 2002:a17:902:f550:b0:2e8:4bb0:21ff with SMTP id d9443c01a7336-2e84bb02397mr126394125ad.68.1791965737876;
        Wed, 14 Oct 2026 01:15:37 -0700 (PDT)
Received: from localhost.localdomain ([121.137.86.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a0002csm67533115ad.3.2026.10.14.01.15.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 01:15:37 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/1] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 14 Oct 2026 17:15:32 +0900
Message-ID: <rfc-v2-generic-control-wait-1.2eddd58a796e497f@gmail.com>
In-Reply-To: <rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com>
References: <rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
