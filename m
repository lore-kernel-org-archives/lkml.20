Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263886;
	b=w5QYhqVTMZpEilJkRASRfrPqAF1zlEDoq2f1cxID281arQI4PB2+w66C+L8FglvmhMVj
	 IYRmFdeK/O1rJB1zPNc4+zQeZS3LJRR3Fd9zm2a/GQx74tUri14cU807dp60G1Es1k/Ai
	 kY/curz07WLPOFOafh3btzt9GOv+u3vrXAYjfNpU6VT8fT1i8Sopuxj2m9cYr0FEb2dAA
	 wZt7LHye0uIYXtN0TFMSRed5VKmtxgcph6cnlh0e0CaC9lNxkG73luRmaeVvOHythKTzB
	 JvvKLNHltTrgO8/I7b/Mbx9OsFCRQiGJDQHvG6SQeEKh2qusdRk5o+ZjTrB+4dzd+eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
	b=OTES4H37M/KLX25Gpw1pI7cDcv06HpxiGGeoxZ4zSR8K+A4+MCguMbI6CJ+eW8uyS+ID
	 qTI3cMfvqiUFkr5aaa4yU2NsGx1BAUf+gQN9c7Ahoq2Z6QF8ZKl6yeSnwHMxnU0DRCgBc
	 isfawJa+dH2mOQItbUwKQN6Tl4vDztgURMaxglJwNb5cJWTm5WLcnANCGYUIlsKjy/kbu
	 ZGbaZ4ppfjGuvQ29ZjzsDZPa+9fXEVFTadcXhAWNfGZcLnda6SL4OXpW6Be1P1/3WFqyD
	 RPCTzzwsqK0leZuI8wUdvG+yM8R8s+rIm+w6gRdZODtZyzn7yUl1LtcZGgPlRjmBWpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwSdMdDx;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F9560A2604
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F9560A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwSdMdDx
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eac4877accso7028525ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263885; x=1793868685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=QwSdMdDxdAQT2ZVW4inzwIEgbDlf+xi7TJUzjvFmUlGnZi43i+k5ZM3vjXLcreVLDB
         BY7K+G6hoM7VVbACa5QyQk5mYd2K/atr21Z71jMUh4ITbUgqHXy2mK5jXbpFOCRvLE5u
         tqdx0X87XfigTw+YYgNmW15uPM0Gxl51qNylrRs9PytUCqj+wGwphQqDw4pkiIQfgp0M
         TzV4rgNnIAUyvxzd44JGLPjY3kM8Y5JxUaNDTniDHVxTH4V61C/8AXlSzBpvqApLzcHS
         LWLr0uE/oJ1sS/pHwXqm0lDwwQMlw5gDMjuCACJdqYp/KJ5QRcZFfVtSQKkbqF3Wh6NT
         Dk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263885; x=1793868685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=q4DxN5H5QG+s0ZL4X5hAubHlmIvVLJaaykivQjv6Qr3835yTmedKejkOiu2LweYF8d
         SAWVNByST769aovdAOpetwA0gM4UcyRvtBuywvTGOONEa3riMEEFmsbDkvl0Cs7vjDfG
         7ELYqfJcESaPGiJfKe8TQqJPIlaaNqfHnrG98XsT0u9tmoNXn9cEEeG9rt56TP1p9Ryt
         IF00XZsPffzjpBLRnda5L/e3OEybjTmWWOfx7Hpj9GKNq1ejfX5W9wz3xEITammaGiKh
         qVx3+8BlRZksEnDS0THEYvqfRabIp0CD3ENldYtFca1g1gAu85oFtTKjkOnW4cVWJU2z
         NavA==
X-Forwarded-Encrypted: i=1; AKwUvBzVqyV6ZDlMOTeB8hbyhRGPbwV9wGtZRyCwWq0FSiy0wqSvo8mRt575R+mHhJtwGh/igsUxH/wXuA0sqvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK3o+yuwW59xcdTp3Hv1H5QQZxF8vZWucTu8or6O4LgtAjeR9x
	HcsQS8X8uFYdKI6uCaCYEZT33OWsrsxkcbOmgmkiPbe87juXw5JAVeey
X-Gm-Gg: AYBFou05tIISW7fM6Px2GIhMqQarIP8aJSsfJyd0xcbojYon/3uQArpm+XqYZbRQohm
	rFs/dP5R51MMtcOl5ipZ/UVi5vYUTckGAA9LssgrTlx8aJKgTrJ1HT1pEjCqL57za/YozOq6HLA
	46ayhznjK8+idroqKbcR8lp/lwIURWjtlYw0Gb4We1QpKXRyG4TfkibHsDjQNIaK5A/EhI7hgei
	EL9mxKdsYGCAMbZYtJTCuJjN6M5C+kcDhixUWH2TxbsDOIxI9fGbD5gSxkF9M2RCCtf0JGeWed/
	5gzXahY14pIL4KsqQRoyYq+6cL5QecXWxc75IW3eZdKII6VPD9krfWhrrQT8IIhSJGPDsA8FqAr
	5U1TPahRZWM1QtG+p+Z+Dc6T10+fN2jzv4R8N6zl+QXH1vj4575mwUbcbDcwF6M5OqkyaCIhGHT
	a1BY/xdcMluT7Sw8N1MGT5cn5d8Nl/fNx5F24MXHTGlDuFRaja40pNH5rY44pL6FJQ0CTxD1lTO
	XY5o3oezpC+0Xa6MGNxReGKUnYUMLcjzmZZUV6Q0Ith0Rz/ID/Z1vv6re8j3rxlIxsr7N0/cYXT
	zxUbGyksvZXy0ZIXYwiDP5IMwLXAF4b5DSbmqJqNJs6DhUUzIt8NDYW40ehOx398DegVN0eeyQ5
	CZO9ouXNmlZsXsJH0esz6CaqrIEdPjVIqpHd7FfE8Iw==
X-Received: by 2002:a17:903:1a0b:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb0012b52bmr46327015ad.6.1793263885507;
        Thu, 29 Oct 2026 01:51:25 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:25 -0700 (PDT)
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
Subject: [PATCH v9 10/14] ALSA: virtio: prioritize staged capture period work
Date: Thu, 29 Oct 2026 17:50:28 +0900
Message-ID: <20261029085032.70689-11-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -159,6 +159,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
