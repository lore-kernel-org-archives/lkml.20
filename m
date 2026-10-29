Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252664;
	b=Tl3p4dKjM7BHu3aEUQQ2rL+o1hBakI1S+8V955b67pHQm69TmtTRIqk4vt9py3g4rHkN
	 H+SzzZNjEUnkYkiaWwt9epYU/G8SFogVKch2HR466xW4zV3N207DWeW3gpTfhf2cDg5mc
	 dZ5x9/U2xdEBIbGZrPhcscuVaivtGTp3hcCPlfZCI+GlxvxYxbdj7jk9pmXYk9fimiKZL
	 ai5sqK9ppa093e7g3Uj7FtKOjtjbUZjbIXogyRtxSh9oysmCDREaN/Ai0PgCi5DD9NOcD
	 SmDEVqRIdeMc5GUJFP5D5BePT4mhYc4VW8ASLG3IkWZWrGzxwNgf6DG8SKeJnPT9hNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F5Cda1iTEohKGqJz5gtxJbapFh8jTgiZxocpRrDCK1w=;
	b=DjxcGEf0VyOhphWrLLzW6dyXzAhHphPrshD2zpQdIe42hmS43FfablGaOsqyvq9P4v85
	 M355ymioPgWyfp2ZcvSThLAXeZUIc+D81RsYjTTaHpqN3579nkGDOF03ze3xyGnyfq8E0
	 wgdqfyQdstY81/F8wf79kNDpC1RBjQLreZ0WUl9pF2O9SEz39Z58u/43kNJlya9CTH7NQ
	 ykpjizxk9eyeJHS3bkw/1lLM4dCgu8Fhh+DiK5jVWusYyyhE2OE9ec92jDPzAhSHnYHgu
	 8TuC12W/CeaPDSHnfQ2uRO3jeL/ZYOk2tGai6wnRFHiqF8vR3DrKqrG1L/KOuojXRHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+uDPZoN;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9125B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+uDPZoN
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1534409a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252664; x=1793857464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5Cda1iTEohKGqJz5gtxJbapFh8jTgiZxocpRrDCK1w=;
        b=h+uDPZoNulg1nGEEyP6wT/3jB+xLA453W61UTEusvi6ID01P4Y+OqREwSAQtuOiSGK
         FOLZPTqtwD4GcVLIJgRmWUcHYVmRbvqy/HUSBK3CJ1FkVq1IThSmsG5efZtXrTjZA346
         FvkEOdsKwYHKP9w+TKHb9ZWvWcngFmcC5boy5J2ftExRuF/7cO8mECbnUbWly0oYDusS
         2r6EAKVIOTLHSszgosQYSuAaFJJzkighPfmnLUG8UfeOWhF0txOLcDzrJ3l/GF0iZSrQ
         ek5xWSiPKT15ZDmVxWzFw1gSAmXImNU370CqpJRhcLlHBNyfW9BOMbX1OMm4/oX4BvIB
         byMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252664; x=1793857464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5Cda1iTEohKGqJz5gtxJbapFh8jTgiZxocpRrDCK1w=;
        b=BvwU/1FhN/lxvWz9nvFYinKAMzPbugw1qmpbPkdWXEtt5rCf46YfSw7mGJshkiGiMm
         ShT9g+JIvSAE1dKyQDioIoq1sGTP/LR/V0hauwFDtWWyoO153348uheF3AGWl6R4GASe
         L7Ts+gUKdWRR5WvQq3OOLONT+/nRpTqnil6fpLEGR/jloqZNmUu90z70TTCVG8OpcstD
         RSjOMoocxfTX2hNHF+hDN1WTWw4jVsmIQceBgXONvELn7O1SqfZOc7n20kq/5OH2gURW
         36sVBPXUY7m8/FXrG6ry0Py6vFJXJf3cgZuVmfPtf81kSLeQ/etPRPmQLiJ2TRKkbVyD
         pESg==
X-Forwarded-Encrypted: i=1; AKwUvBz5Rfa+uMDlZU2xA7ZUBrcfiov1qjylJPUOE6NxxWjJtidV3lYhgmL4NIa5rLDvF27Y/8Olc2tJYfXI9jQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBd21IQiXg+tuERiX8yLI4+5md3pWFgalXvVAW0BUvy136xW4p
	nAynzXxxhr1u9Fj0gALeDF85Hqam7Z1J66PGcvlTS3wOm/SibZIcoUt+
X-Gm-Gg: AYBFou2lqz/P/YLhDwGg5z2P7kvR0+a+QDm+ZvSFLBeTULzbpaa81ijR48K51qvh9v+
	C68ygwwI3Gl7NO5zgKjy5+8ixFdtYbUD4QK8+6HoMELRzZfqJOhyF8bwa9SyIpQ54KIJQPtJmX9
	OejZZXPb/nnwVdtC86xjGm/ayyJKc86A2NOQsaNLf0C/pTlysS/2Bid8+HmNfDAxGL3oXFkbHtY
	bwZQxT7GAfvdS0v/eSsQUGJgk6KjihYGO8rBYG1jnwv+FH6wyWUVilK48PDxwfWDt329WQdH/OJ
	X88Tc2aYOV+vdwwo2d3Qjv+Yf0S3Euh1ZNqpGDSBNIfalgY42CTRkjzxs7IkVR0J6t5X7vj5s7b
	YdepYblJcNfU+F4D6/kHuGUaIk9Ko7lUEuypI2YD4uPsfnWpfiHO6O1HwwsdGxp0rVwYuNht3QJ
	20EzXuzirbMg2QzAol4y9nAGtuN1jAIh/kz1CKH9SVSLO9wRbmovgrKAOJUG3KQSsRzrMYwcx++
	k8Ksq7XyAtn1T9SS7oMa5lX04k+RKYIR3Yr5jbFg4ytRN3Tt3xtlGRzpSs1yK1SKvrRGDlT5MDO
	xynDfrodF4GQOLANjHIdsyRrFjkjX4LlW2Zi/+8h62Y52VCUFttV1qs4NKAsljOprra4ymQw6zg
	RrMcTg4QAfmDjsFXj4lV8pmny7XQWHSzMGmfbTFLkzSlqlzg=
X-Received: by 2002:a17:90b:2745:b0:3ae:5525:dc25 with SMTP id 98e67ed59e1d1-3ae5830a184mr3504844a91.51.1793252664007;
        Wed, 28 Oct 2026 22:44:24 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:23 -0700 (PDT)
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
Subject: [PATCH v8 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 29 Oct 2026 14:43:46 +0900
Message-ID: <20261029054354.2931-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

