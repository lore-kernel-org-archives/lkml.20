Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263867;
	b=W7ej/qkUcZy30ZfcVkh6ABUOVSq1MMxOAEtlQtP+7VJV6C5K75moonYPGSSAMhOJdd+M
	 aG7ahiXsGvNgUGirHZUK20TEEgjWLyh3PL7kxvbZTb2mF6xqdnMRAsog5cDJ/VvwVdlTy
	 2YtRekqWq6s1OQrM4H8zwLkb92NMH69EUsiePiGvGv7sxHRgnd8I+AiP8TpK1/bj2QTcp
	 JMpC/3V7to2NxBx/PyxriWp2IPjbBzmo+rll445dxolvKz+KMMbJ6Uy1ur0qyoE4BOIIq
	 Nc6Y0gXfUbVolqinOPbSuGUu4DLbxixy7zejhH+zPvetPgnh8RaKDKTWy5gB7QWIJ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=i5ydoAwzYfkV9+FrzkOg2N45/L1uwoI1pz+tlh/ZNKl8Zol2nbPsKp3HeWmNWQ9r2oT5
	 ZPi6gNnAXpAEn/pyIzK5ssc3He+LOyAdYRv0OwLNaeieL4mBY4WNptGYL6AhGCNZUvoyN
	 vljy+zMIjTatEWgMOa7Bh/CsExYivpQeESrOk/tO/bqUty9uX5luWaTVZ3o2IZteSUK3A
	 LvU9/9zlElvCjR0T8XyNVd4mwllYCLhw1wHls+whiRgMwLdJXPpgCN/Ago97OILBdQYc6
	 RvEZ+kJvVqG/XKdP1tbbM1ebGWm1/KZbU/3Nz8TKnLwhmla7sXi0UfIPOqYqtsVS1NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoPtuCuV;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BDD606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BDD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoPtuCuV
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9ae391a05so3608405ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263867; x=1793868667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=EoPtuCuVkfVEiBcmunJ45fuIy4+1yyA1LEtvJifv2/kFEP8VQIvH3laK3v3A1m+Viw
         f/oDeJoJU3I1toYw1EmhQOHFwJkv09LhcX1hqcTvTso1fFfWIjONvGBQRgdXcLKmBKYL
         YVR8A2EZbAhSqC5WruSRkpC+o7Bp9b1uEDbV+JDCQKMiqQ9m7cRSNdfx8WJPg60zbI8f
         ZIFb1hzCj2szq0nC8QvpAEmHgqWWKVc+2BTYA7Z3qiw1n2fCIp7NzVj+wKy3uhKI69bU
         CVsY1U5x9ogqoUlH+I7eac644zJGH6jtXVNYhtF7zw+kJnPOvE8h1SbAv8VIlGqp+umh
         phpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263867; x=1793868667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=PAmiom//m1JP8ifFO0Nga/nNHOTYUQleiUoPenJeqyxjpyhj83ZE6lpKwZKwA1Beax
         wWyI/zuQyEtCFDl9iOr1q/wmZ7/e1RwNB9k9b29VHKg+uQxocadA2TaSyiop05whdG4y
         WF3vebgBFY+aYGGzQ9E8u13xVw71+53GMnGTm507R/kK4zpcx37OBivsaDGKjnPdRn1M
         P/5p2MoC8C4BFQlUva/qts09UXAXymdB4FpWPha2bao7/W+KoDOKbGpNJ6JCzmrFiwP/
         hL0pJayUx+vVRAC6KCbm6GJBlbf/4VsCuPgDYYz0zWNd9FJkjr/j+y9DgW3bBFIIxv6C
         Qrcg==
X-Forwarded-Encrypted: i=1; AKwUvBwhl6CnpSmcEGhcgE92M0kMk1CtUkHsXpdPJNtK/0TYmnDm11dMdIxfFtxVoKc2Wqk6/qhKBD0jiZrNXxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsJwLHT7/WwLjq+/MI12fjZ4lA1mI4iIxrUCfAs2aOeuqfWHVB
	88QgT/uPdi0CXxT1Pe15sIADAOn7Uhgytbssvrs5e1jbpmbyi7RsEXYB
X-Gm-Gg: AYBFou0rvAYNNdx/mvMLhUOzLTAVyI6lsJOxSjQXPSHvnU1KOQuVaxV+nh4FHtqUIAr
	x67lblVoi0Nqwou2Oq8KjVUeDtyWW5aD86PGBqzb8su6TKZcZuv27WRqZXee1Cl5yFvQ/h1lILr
	ymu5WaEWF5LpjInzVGVg5RXoLyOx9K2fDluMG5Y1NTy65o9CfXbuam8Sf4Vnd0G75ibp+9BC7AJ
	pzL3M2JJvOf1NFXCvfHK2Te6scbeMDIK4VVVnmJyQW76OJ9Xw1r7DH59vUHWbhr8T8n32WhNGpE
	xd7cCwuMYGT25bfT3YRfnotpJSlnNJArLFgNCR3Ch8km+scrrHLMY5Yl/6q3/Y0nuk5W/ezR/wm
	bTxV6rCPqkeMvLwH7Qhu8679rSzkhKjdSwxsphUQL3ritUieUVGBjcVhPHxgmVbOewqsPvLMq0M
	IeSQOwJO0iBG5Dg54h0bhs0kflLYInUDOC1WzrLn9iwrWS/yXC4SiQmAs0OKv4Sl397dXKmFYs2
	LB/vC1DcB5iS9nyVxENE1laGA010EaDpcp9yKoQx0bK2BNSypr0V5M518/5P0tDySFVQ3y0h1mC
	0yf4ASZ7h5I3ztUZoiEkwX2ZTlxENClp3Hwv0pfPwxSHmSWyl7togh3tvT/yzj0imnxZgVKgxAs
	fG0q5S52SjptvatW3lhPFJLm7j6pwu3cMcsYhILnVDA==
X-Received: by 2002:a17:902:dac7:b0:2e8:7a31:58f3 with SMTP id d9443c01a7336-2eb1ab12bd7mr13690405ad.19.1793263866673;
        Thu, 29 Oct 2026 01:51:06 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:06 -0700 (PDT)
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
Subject: [PATCH v9 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 29 Oct 2026 17:50:24 +0900
Message-ID: <20261029085032.70689-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
