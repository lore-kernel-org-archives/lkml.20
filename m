Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180522;
	b=i+wGbDPvLYinvbarpj2Dz7HnEE80x/kwINTrJV1LFKn+07mycg7NnTXXSyyS6b/uOI4n
	 uQSsrKV9YEnA+NvAmp8DlJ90SfW6GAvuz1m1erftUI+uwDZQU8IooGBoNSYOW49B4SLtu
	 1X4SP91VQ5mAk0ik1sCpt1CjApbbsbE39Np854wzTlyuvnC2ivEmptpziQUSNdxYZFW3G
	 e/veYwDx9/ZkinEPLIy6kgl3gRbokaDLKWk57tn1ctr4HU2WrxNyhvR1/NyybAaklpxBi
	 EIZSTwL2SLSW4Q4NY1GQAyN+6b4w/0y2BpdSui5EfG/4kt04dOdkUg8suWFOmnFxLRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
	b=lFssc5htnfjyZc20Vu30WWS1clAqRT41Xfejf+PuD4K3Ul0/J/3n0GWMlqH0aX0Bij9Z
	 hyJmmdcGuNOZ3bmEfNnC2X0lVEiuwbUJRODli+y+7JCoQKFo9hVMjl3UUchg3GaBipnK9
	 FXk81s6VD7FtpWGwhLhBLlRsbSJEsFJDXa2gAAcz34us+4acIk5IbGIwGhQGhbv0r5euM
	 txMThHtaNkkdl8g0CKmpEZVA+WT8PvEzVAW2gl9uvAqMYL+fMA3mtvBoJdnSQjdz6o2uw
	 zxiyQ38WcdRDG1wWTeTS7qZJtg9CDRN9gMprAEoPmLw2SqRBJBV8wLmFjkc6TGwDKCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOC1+36r;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C9260A2612
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C9260A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOC1+36r
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so621694a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180522; x=1793785322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=YOC1+36rLFXWQFrgkKLVR4jlr7TSIxKvYgHs5ks7+5SfPdxLWveh0kPrL70Y6G74uh
         tuCBHFUDBEhEcPY8MA4TVpDn48sFxRCwbTgiNEptJ+0xpqhmWIffllbO3BQXPT/kfjdV
         CzXbgEF1RK6AkVs99JZiyegORsNjCFTpR3qFUuFbDRg28Wic83Z/HHzzlbv9JcMlxM21
         QAvDVz8tllJO8soY5MfmtphfTmkuYO6FrZgyYAmfjldFw/nFVIp1prUNoKktPMXMzlBa
         3r8kolQwsKgabFFd7Q3cAhXGrxrCJrCMSHbpKVLfX7AgI+MlRDBYEeE4dDJvcs4tLweR
         5Ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180522; x=1793785322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=lU+klo7Wc0pJadUnFFRjoi3WK+k/qvHBTbZXg5oV9jY+fGp0nGUQHUP9m6+mdNR7gl
         RYAUG29/PIbpYyCPLnHs1zp5qbmhh+HRcs5q01KlYJNNRva0qTtQigsWCBd0voXUhiaP
         gqLjsWK4A2cMsGoLBIHw+9BxVo4c61NX6Aj/jUVItPCv1VxaKZuJgdt6ZrzV5KuyLi5f
         snUkdg93GVJQU1ca2fbDKbUCyrBn/d6dGZ5tH4J9MqhkMty3N0kU4g5pC5qpsi2SIfHc
         oUFf+yiqWPe/lzzerP7l8LeQAyJqUDlBatHpa0AuGWzReZ7yMCOyF9ESVjqnd1koR2ca
         B5RA==
X-Forwarded-Encrypted: i=1; AKwUvByyDq2ijAAuXHwEGLF24cj2LDG10SA/eVcd1+GePbNAY8LfQIcg7cJk7QHGhuyjLqbXhq0uLt4fXFBmIpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq5Yt+wo1VcC0SBXUu6p2ELb3UVDWHfVmB3gEKwvw307pJcblr
	HS919qRO2fT+I/WV/QaCXZXnMuqGHQWrculiqHSZQ085jF6bT+CcGjLA
X-Gm-Gg: AYBFou3G2m352OU1dho0wUR9BvMeRg3oH/5U9sgFhO4YJy0cu9SbTUHJFQxDdtGvPoY
	kZFkBZFNf8hHY+OrMgwvyPvR5HaTbauL4i9u36KfvPuLVXOuzhcMI5zzG7G/y6LKdtSaDnS9OLr
	dkNLpcYuKzlV5Gt0JNArr+GT/gYnp8vSbcfykAYnmdNpOucL/q1xjz8j5IpD5pqm6sNgr4HQKd1
	928WxXWpeMc9ehj3dyFP8Jrdv029Xnxj37S2sJyKbtnNKnpZw5MBmNOqO8nwDq0Ea8zpzE62Sjz
	cwd/sggF581FF6BKwMtLJLZelpzopFCCrxn1m6GhBiVuNrsgG8+phkWiZ6RfB/RcnoBJEHOfnmn
	ziPlKv+qNQqOZ+72X/EPFoCqjfm+u7jEctTox6tt4ZXLwqO+GoNE2MdXSc7k64Pbs18I17Ll5+R
	3Q5qTkxGjIp9Sckus0f70SPIkxA3+JX/bNdIQMeez3iRqpS9axlHMB+DIss4XDtso/f/M7iFFiv
	vK+HhZU7VlOJxDE8cqhutnWo/xhKgRNNkQZh+zrS+m6sdu8iGGmph9SHb5JyMpg4o8q65iU3t/I
	RoqI0USYAmNrOyztnzJ/RPgtKykqP4i16beMJ9QIqhlRXVl8jyYXP92wgnl24D5oMZl3DDRasTF
	6UgKjwwfjFnjU433HWd8pHHvoJidkZiCTbBZf54hvMQhXkRc=
X-Received: by 2002:a17:90b:2587:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ae5c86a185mr502672a91.23.1793180521633;
        Wed, 28 Oct 2026 02:42:01 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.41.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:01 -0700 (PDT)
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
Subject: [PATCH v7 06/16] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 28 Oct 2026 18:41:22 +0900
Message-ID: <20261028094132.20364-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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
