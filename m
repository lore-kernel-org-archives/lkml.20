Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664270;
	b=B9mOkV6IzR3XbbYqHamXhZ/essCRxyt7KUlPPB1y4iLyza5UQmKfyYZXet96Xqwcg9G6
	 2oo+W+YR5lFKW4SYGW6rSocCm7Zwi+Uyf1/MNvrlssjgVtPf2oQTEgCXLvTvQ0o7Mw3Cu
	 QZFUX79Hy45n24SRag+4AcTdKaYX+w4TuMlBc46UpD6yCunVB3ubC0woHqA9ATUNK+Dyr
	 h4r0hRqMMMxeXu2fZGqKFPbHfYzkyWq+OEpa//q1nqlJym2kPJnTVgRfLgPIs2zTv5tLo
	 FV7QZ5AX3CTnoX3Nd2/uAYXyB0i6IcjJfySIgQfARhvT/XraM9VRKjveoFxHfSR/uzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=v9mpGNb2ES9tOi5ALLxCeGUcxEenPTktJecU/jx0+IYPb9RT3jI84sN/qIyAXzWH5YV4
	 H2M0TWr4nWQqvacIhkc9gPS3aoccI/GL9lNjKyL/A8Kqo2NbL1rKQL1ncK+32wk/eW8kM
	 DdFvFoxfhuUz9vKvLjlBz0/s6dohGbx6cprrOnzh004y4yKtsN/mbedKsuevR9i0yiCJH
	 m0wr6uZWJtRjOc5IYtDeUtzi4neNj72zeTI1n+B/+H0jivnpZAdOuUcXekxrcTS3nFriD
	 hGnLApED0fsEXKHk7PHOFtxQVJDPLI2njWIA9BjBmJkOC9xFl8qXSjS3yyRt15mTWAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOeKq7m1;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AADE606EE87
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AADE606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOeKq7m1
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2156209a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664269; x=1794269069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=wOeKq7m1cbAxaY5QEufLB6DkHrsCdHAvNkLj5yF7gMkIpLHlSx/ziMJqqcvu7dxbJM
         Yib3p0Th43UH37324d2EN4Z8KO/1+ZRKtST0NFaxmf2yXYVtbGYvhO4961888jc8Akce
         ZxKclR/HRspBJidN+Yb9O1Sg4d7LjwdvrunsGvgyJ6+Wl2FASE7B0+h3uQJ0THHytn3O
         zH26Ub8GMy5VIcPgSXRIlI6mLV5x0tZBut20+q4MamqL4zzw32kKNW6Avdm6ukGCWc91
         VSLyX2kbKiXonuDlb4uDghjscQ9KhlABU8Zqs85cjRmq1b1iFy5A1ew2PKhT7Vihzcu0
         cTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664269; x=1794269069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=WeCdpLRL5uzsd4rivSRBTAGzAe8jfaNLSFZYSsoDrhHk4i1DFeN9yUKAgyWFuhww50
         iuuJqNURW4ODJbn2GTJsHbzp1b8/BoEQjrCyQBVsdmXPxsYmDTTORP2nR1kwPFHu0mn9
         9NWKFRons4ZxTZp/mD2k8M6GZr7cyYQC3wx3iQn2TXwV15uGDvpbL6aLVfLJwvkEGQAH
         HNzfKJ+GfGrQX3mkS1Ybn44DQf/D69yGUnPtittG6DyAtDq/PcL9ZnL6iVp+JanGBobG
         vNTbkvf4J81TndzP4aRlh7ZeYjmRl5dkf1DT422BrIGXgEIDC5BLgZMQqEzIt1RcV3hc
         8f0A==
X-Forwarded-Encrypted: i=1; AKwUvBxmTXEcUcwWyjDbOrEl9So6e4irp4ng8ftVwWdWl4tT9ltLEPhT8Rtqb9IVNnbxVBWHJ3KIM4DWxmHe3b8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MYbfKWYEGlhSMJLbhF5vcekiCOGvXporeZFxC/0yfe2dh0PcE
	UUPoma4II8rogqDSab9ouI9toKpjv6cmQNRy2VP6SEw2hxjYszt14Jmb
X-Gm-Gg: AYBFou08/YD1rk944j0gTT4ruXuB08OnhbY1dQ70U/x/32lLS8wlgE1xe06OxF9BWe3
	qFKgRUKiZj4bTAkO9lTO5ZtBEXBKW9A0M3hUBgIwvVsYDzaq+rWTqvCbq0oGV9Plnk/aVcgw0Tj
	i2Gv4G6yrLdmpaPzu5u93eSZSCE/QgJ4RjxlwGVhH7hi6xqWn57Xg2zKc9g0N+qfS3eCxJB0G/l
	qZ/B3FRGFtZqedSNfZpnB8IQpzhqq58BjnXaXfSr6XOH1QIWzPcUevYB8YnCbMoZDMjsY+A8wx0
	FFZKCPRcNBupfHIeZbaFExWzMOsTK4/DVsPlBoUQWAlyPbmw0APHhjB1KzgbLE278/p69uruETS
	2pCo5n7ieNcgCFsIp1FpJ6chLdW7qo4avl6ZOtCvVT33OLSbKB0o5gwISWgt/TmOhDWrGSckzle
	XP/Qg/vA46gVmCe/fxf0ROMmskfA5t9zioQPjCKeoyjFVt5lPJEJfuQEdsLD+TlcaGpdPg9RU6g
	4P2nVjGyavC+VvaZjZd7vP0al1smntvbqTlaWjv0ZavgxdPBtnd0WbZKJJw7w665Q3IiWJRG/Xr
	uHGmCQwKVkssUAjpKarf41Nwj4YB+v+hTBQAe27aNbJ82vKE2SsGgCvzROQ7LKstH1El5lxb+I9
	3GucbhXzWtYG+wBuar5bpV72t/UKwMK+dihvgLiOgtufJlNYs9NHTbEvQScvPCSvPY88u
X-Received: by 2002:a17:90b:2b47:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae897a5c58mr9348377a91.46.1793664269378;
        Mon, 02 Nov 2026 16:04:29 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:28 -0800 (PST)
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
Subject: [PATCH v12 06/12] ALSA: virtio: wait through signals for PCM teardown
Date: Tue,  3 Nov 2026 09:03:57 +0900
Message-ID: <20261103000403.67106-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
