Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412560;
	b=NsOjeNmuJ9XY/CR9qYo8bO4AoBN19QxwpzFWx+sx0gtSGe7eQ+80lx194IaIJkpEEw8d
	 qZkTqR5hleiVdBvZcwPuuBp7HtnPqhstp05tR3i3RKjNpIpErzDAycNMAr87qdvYDMMZK
	 90aBFbD/PLyzHbuFiph2f2hjCZl0lGD/CA/iBIwgIzTvGJKJOtvm6z92+P9nTAugTghTc
	 dB5mCWpN9qn+9sMD3IglqjSIBoM6jEaG+JSIE/6IqdFtvUcUBT2ibrIrARseUZ2xLFFx7
	 nda+WPr3GmQD51J+r8sPD7uBqmWzBZP3S6hZwz6LzDspMc1xieAs6eu45txL0Sy6qbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=FYTvzuJ0DV9bfA2Kh4TagPXC9G+2k1uPos4Qsx9OTIgahCNMDTmGqEQYzarCcakbVKVq
	 80ApC1yPTcMwa3zlasmZb4wab30XW5R/Y1bdqOBU6QR/mMZ9Bc3wC7VPoTAGoLwdC0clW
	 Vktu8e63qnRTNlHltSX5NPfKzTS3XhAwmFJxDlc4F/lUyZsg/RAkEb9f7UIgQBI6gbqRN
	 FR1dd0KFz/ol2KlrEhUCKxF7Z8F4chglw9Dz4S41AXE28h0Cp7tV6RDixSiKOzGMc5zuZ
	 vRAE0xD3xkbLWcvIISO3lhROyuPw/TyFaW3x5WwpA2CX7yfAwYYtZte0jbGSPlL92MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmTwQp7a;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B905F606A32F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B905F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmTwQp7a
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so2012280eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412559; x=1794017359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=dmTwQp7aiqyVd7bNSgrF+/uwK+P1zjMYPazTAa4kJCYS3k4gI/gRFwHSuLk8hCcNcD
         wSu70bJS0p2rRCcduRnTdrF4tp2QdiPhDny/RDfjIQ9x7ZP6BJ3SEGV5qqxttLKAuquH
         GQU4Wr3+DAQPNJmkxRkp/+AFenfMsAI8A4ZNxC98oda2XCQHfjtMO9QPVmFkFFA8xJCg
         Xgwjr3JnPms38N58bzty9R/uLeZsz1S5dCwEHbS+n+sJbkKNO0d0gBcqdo7Y+5T/ZSuF
         VI7AKHdwKIqovLGZMZIncKxrypk1Vy+8yA6bCcX1oQky3/0kVGMXLDfRQElFYXwBoA9D
         9u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412559; x=1794017359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=Q9J9LhmZXUq5Tr6RynEdl/D2p6pYRDCaX1pTWYNxqadvkAPzWW1P1bGFNPeElYnMPb
         yu6cIVvpvM7d144hCIZtLOJhknrFRCbXv1PWUzbD0YGWeeX75wbpYBSbU1fd6Ry9RFbL
         8eAZ4EFRwY6rRj+MpN/Ad2OriIfiP8dJxlTSdk3Bun5e2R2KHEYEnWmkHS+btFQQ0sox
         mbxb2xoax38LPS+9c6NMP3eVaQyNC6cuZ0/LhpoUAcPDBqbXYgdn0EkKHOOLEUzCylUs
         959tkmmIs8b5VfdSByiXtpflk5nzZwQYDpO8ITn8NEdEWrUv3+U66jZF64jFcop1RXYU
         hFzg==
X-Forwarded-Encrypted: i=1; AKwUvBxBDd9dMiXc9n4avEKPhi+xEyUIGQ+60mMY4qXH2UpXzCtf7c+xBfDEEHwvAnSifiwko1OOqunlmDYJUUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp9WX0KSNyVgTfx4B3tXbkzvKk8XkCIhnPkZGQ2EkrMYoXLfCt
	58fdDo6AKwCibKDfTNJWGBWw/rYmSmldUbQ8J0814SHkxIG+CUy+bl2B
X-Gm-Gg: AYBFou0UAYG8050UP8QOPaIYcVOuTCzc+zqmqEYPJcA2Uu2xn0I8EjvXIVgiLm67inB
	woBCdFNus+V/RfD35f6Q9AMXVEHvwiOgbiWDgptlSBWSsOw4/uwYKUZQovz+lWthiK72X8BBtqL
	d30Ggy+DoCfWWgNMXpvjpKOo0Znhxv6OCo1asguvbIM8knA0RkA4LtStYI2NSCiDIqaf3Q6z7BB
	B1Us6zquA86JbQbeyPgauaczc9yVaP73WhUXBpd8pg4D8LVTQcWGGbDj58K46XFbKPHdfEPHsoo
	eAbD3CsM7h0k7RgPShg087ccPlP7F2HFqy/HC2aJ6X+Icb5rAyHv8Kpo7yrySb7li2PhYJcjkYi
	5f1XV1TuBb2C/sjuCdVdGYkC1zd7yDIVaenTgDwgtRdfUcXS/EHDzxukV9IQ5UhPV1uNLh7fXHr
	vEdaWeO0F43/8MWQOh85vlSlI4rVHMF16ZvKUsRK/dnxC22mHmhrpoMTvmwkhQ7OiD19B9Wnn8o
	Jm9Psxf3SVwqF7yeycxOx8NgK55lhBUNYXs0vb0zxVCPtuCZj5C3j/utFfxd43CGm0yzPqv4mzc
	d0+wf3/DgQbyL7buX+TnopRtqmnWwbwuFrblzXecTsh3Yox8M6eclkGrbyfCCA2LfnRbFLpV8vo
	xrnsLVA5xSOPbM6Iin0WnQz6dMG2EUiPxSIs5X2xh0/6BSA==
X-Received: by 2002:a05:7300:6d22:b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a425e10f8mr8691655eec.36.1793412558707;
        Fri, 30 Oct 2026 19:09:18 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:18 -0700 (PDT)
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
Subject: [PATCH v11 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Sat, 31 Oct 2026 11:08:47 +0900
Message-ID: <20261031020855.2402-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
