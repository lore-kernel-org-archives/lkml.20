Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338016;
	b=HLCyiXcNoXJmD9ZWF/y18ftMlOBEiSEh+B2s4UvKOp4n+HvNkhfe0Oig2JrW3mHsrJY+
	 QR3720LjUxXjLA8w3dgH1+eOx9VUKdvmw42YZeDuz2y1Z+mxyh/Ba85qCCqesbIlMdbiR
	 XvpRLneThcEhmNRkhwWvST9g74sM9LZD8wR3SI60uXRVL+4M65J+Yie7VQJYSD7+51mL7
	 mXKoKic4dINOnbe12MpS+rZfRw2LpIIN/0fFW3fvmHmv4dkILg47l9l7OY08knDf4PSxF
	 411tFQ0HF7t47M3lJppQ8iqFDZEcix6YyHyPf4baJvbxLgNQP60vM+qmrbNqWLZsI5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=mCFSsOPbdyhWgRey4pSeKVEYahrH765HolQpKv3qkC6N3BNXI8ZnGhUbhkZOWUsWibWX
	 plwHpM3G91wlZASAgbv7VAJNtTG/bJWsuweorgIZB1y01W8Pva1eBoLbziGpJlehFLY7B
	 Q0PxBBT1jUbOKxJ8jH8qhHCK2IPCwEu12WArHlfWE16qScceNyVL+ah2Zi7ITlsJr+Y+q
	 bcpzQl5AIe15Z2A0J0jYYgD6EDwCx2OdQcMu0HCoFVXKwdVT0vFd8TdcqK0GHUpZQAoTA
	 GEqoQjA/g4k+gbBbV0HypJRCcQnfvX8nnHigz0CUohJ87Ry+Pt8CLO3ANrvA36c/wow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+bxHsU+;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415EF606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 415EF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+bxHsU+
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso147950a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338015; x=1793942815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=d+bxHsU+DaLE5VVrgkliIB4ayMjVY+RpWtD7z/NIoM/o+TsvaUBRzUMgZhUdq6kRwd
         voWJcAcY6FoodTYsDMBAZk0oXXP7IIO+khO1dOARJu5PDmPa1szbHzpnswezgnnhcvaf
         reH7UMuhhcK0GTyQz5Dofti5nIYrEZyGYvMlbWQ/IN6NNANQJHbJ+fP3ygHyUueGzjVb
         QJPdLI9TQOIFxnjVCW2Xrd3wmj3UqDld/eS2yZEbjGDDQdZYl3RsLtLECskewmzhjywd
         xepQTfqij0cXM8dmK9OHZ0/TkSfQok8VT2viqG2iwEJmavJHzbdfuHPojpmkc1qDNaAk
         dCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338015; x=1793942815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=CMTEIsu+D/JZvrOJBguEwjSDHhz6gZi5jlrDY2tLZRHcFMxVPpo5r576+qcZstwbhm
         cxbMJL12blbcFWPXmY6yVE70gAidQdtZR2/6ss7ubcm2PV6mh8jU+PJTVRHLq4sGs4bl
         8Ruk2waJvDSnjP73V+xIQ3e/qLn6ij4FN42GfOfZb+ltz4HTnuzZAHYJoPB9Y90leT13
         i8JbZtUOcUctwfFgOEhVqRvTFiGcvsRWVxutPvPNw22tyo/71hwf7dZIn+3YoQyBUJNS
         GhYr2afLwM44povndZJh94wLDBiile7UnEZRTrCErCjYADWSUk4nR5a99MvZ8xlVtwXY
         Qk7g==
X-Forwarded-Encrypted: i=1; AKwUvByHdF/cT2NausEGT6m9+psEFmnaVxP8n/OnZxMb6kzW7RHb4TyvKeAsfiwAo/7TerrESUg7hhLeMDynSxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhdWYGBXhLHFj8k3ayNXP6gC15tToBFMhjw4sv7iewfvdpYvLZ
	fdi2of4eBEmMBvpOOT8geEWSHGP367HLlOqUK6iNbgkei74DU6dVRwHW
X-Gm-Gg: AYBFou2VzmEaKTKHmSgt32EQrltK72GX1ezlRyPFimGdYB4LoeJpS8mU+gHQrETL47j
	75RjoJ4jZXAaVxZ4Mye/qZgqzKtP6ytrMOhqYGIuVvpjSbXPHiOtEd0T91iuagN8m1uwf5X1ks+
	ORcYkqtIUYPFLWbDUFFltlcR8PCkBuV42zafzaRhhPopP92ZlWdhiMp688XOS6hR6UMMk7/dkII
	WbRazZZkMwxkRT1tDkOli8D7egkuEmg8A/MKDMmoSBz2ZQb1m2/WDEL59Bcj3RFXUgvA/0J0BXj
	9TkkZigW5Bl31FUU3cHD2LXZO1RKcHX1LWuZJ7JTuLtfUP3DI30uUjmFv1oc1oEgedwUK0y4h0F
	mufMv+nvpXhicWCB00sZ2/yij9HiJ/ms6pqPQm5mm8lVoyDcT49H/fL5xPpEzIziAg3gTohS7VC
	Z+/pBd6RVhC9wrZd6o8Y5xcasgiIkoD2W2D6dTYMqONF+mvknaEp73yv8UiNkOUN2qooHBAR4ld
	wew8XVUSj/MLEvzqFE1UoBLndrDsdYo8DSFkoKei3Qaq8wAyfUH/LKHmkojWQjZ4RLOxLi4YsgA
	vQlone8diCq1mDSJBXJhkmSPj3EvplAfRQN4sywioIqQx1Keo1LmjRiFUh/BuoZ/hRes8UKa5KS
	h7R19vpa0Zptibt4GWzu0tjFwpIqwUQW9HHPUXjoj7zbslB4=
X-Received: by 2002:a17:90b:57cb:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3ae89776ad0mr997346a91.35.1793338015580;
        Thu, 29 Oct 2026 22:26:55 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:55 -0700 (PDT)
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
Subject: [PATCH v10 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Fri, 30 Oct 2026 14:26:21 +0900
Message-ID: <20261030052629.27742-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
