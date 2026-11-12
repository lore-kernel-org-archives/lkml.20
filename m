Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461741;
	b=Qwbu+3RkvkhLSq/Oklu5Xq2lbtFzMKEnPIBxTW/Z02cT2olNH+3a5sWUKZHN+uHSMxZg
	 oFNT9NOqoTqswkcO4ad8+ijp9Wx/m+qjQxMmMpnojj7z7BmKnpLcFvmMgkr3XuJdwc5jm
	 cPs1V3/9lpJpnTnDYeGZLmME6axCxD9MoDiaCG189SouU8v68kDm/6A5DwcFg31vvaicO
	 mJotPHy24Fk9IDZk+uH8JkNFheQzE0iWfrrygViwWMywhRnAu7tgZDm2Kg3PcgWeilfN7
	 pLR5LNaT9HHNQyTXOq79kFI4dImcpxihxwOwNZq1/rfn9VroHinH3G2BqMyKRFKbb7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=Vun8T3ONO5taY05E7Xs+ySr1ICHL1WDIEd6cwfiLIl2kDj9rFSCFwyW7gmFFreJvZRpm
	 rKvRPyn4xENZeWu1Ysak/AmsC225N9DOw8MTtAFs7EGA9kfQooBDhedeq2o5sVxNrIyFJ
	 wh4an1pkFwXGuCRRV4CyMatY478zHfC0tNeW12LmCD565BJn/JrjsQSkQVwV0OHaVLvGW
	 sXrasT7TmPR+AykVxvUeavHFg4cnPJOI6Cf/t6B6fz4CdqfS6y2x3XPWp/c/E3FMVSsPj
	 ZQJt4Mr8tnhjY/z3wvqfJBjUJBy2jwEv7TNMsKJOQrTgQVkl5Jy4/oLqD9W7GfhGuuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyQax+fQ;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60760A383B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A60760A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyQax+fQ
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so6474773c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461740; x=1795066540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=xyQax+fQOJnP9PcUgV7TweZR+NQ1LTxbH9Jk6V4hTaYIsxHg7amwm+QOcYew3gn1gN
         WqoyJqqQoCsh0McpRL/K/ZjI5FqunaH7jg2VXe8QUbN5pgT54rk4eewYMMmT4TZi90No
         b6iEQseCC6iFkj1ebcI3E1I61PZl1++DgwaEveBV17JvL+vqfMJoykhctIZGHjPtQtlP
         5EHKtl978/RkybW4lMs15UPREN48GCHQsNz6uZqvm+9IOa04sFtCr2Wqg8visqsw9uXY
         mjIaPQo/HB6WIjiTqz7IrLWucySGLLe9aefd8WBMQ8aDH7TOJ2ddmJ+AaWlTwwMh6eJP
         jpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461740; x=1795066540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=F2HxgM9jyXDaq0HbgVkhPD+Hz84eEViyx9Zq6fuV1HLXSx9U8TFs7R59XHUQfg07F7
         7MtGkJNmsfVa1AOETVaxSvBavPsq/CgyvF9Geg7KBhF6ZjySazqco/mzZXtWqbt93LA9
         YseGMNybtyu4P5cX6oiI1/TEpGbgVHEErjNwDdJDSkF4NL93NKitkgjZYzT+AMtgZxPo
         u/jLRrKzgokGtIFg5AaVow+YV9uOmA9wmeyAQ0b35k0F+RslVlTOmwQMSYZr6He5zVu1
         LgRMclQFVERBCIXeBqUYZdnHbb7PTbM6leaStsBYhJRnCHL2YKWLronTrl0VLVRWb9dt
         c8WQ==
X-Forwarded-Encrypted: i=1; AL+hErGh2x4LNg0dAZp2gEfNBgTEnplFuqnEYE1Yf/w4ssfb+KtnJdQWr4QXmN7EHbJMQPp8StWxofl3uzSCOgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uo07/9dRpDv5L2CS7pbS3pZ+Qfs1Gu3wVP9qk/TaDjrSNXZ5w
	RY5uxz5VZAb9+BJ/ESg7jA+pHox6KdRBQzyZSnqr5leM2JGZg3fgtrvUb32u5w==
X-Gm-Gg: AYBFou1nnFjUG6Q0p8Gh+1ReEX7vfmHvF0T6JIACsVCInuFuiExoWHwQt3MovR+gP2l
	Ys7ERjdRBKMRzuMnF26Bf2WR0v2dIabGpl7SXLcUigmMWxVTYJjNNlWta10x5BefPVFlVQCDpgk
	P6mAr7aZrqcscMPsI5Ac09rrcmfSRn5IM+r3IYO4G914DPaD3CqR0q/O9IzeE2QIeAj6/HU7d5r
	xq+FMJrxV12toFbGVTa/Nk9sL11rVF38ee0GGFw/tVVB8L7TFGh7HIOcj+X2IZuG4gKt8JcSNsV
	hjpTMD8sQhSursdnSxfGgbK6EElck7B6tFr8To5MV/ntOJFxytkyKyfb5QLe+la+1Vh78viVpV3
	nW0klRnmD3PiTRSNylMAJ5fbXw6zzpqvhWNjoLiFyj9E0pqxvrCwEPyquiYB0LuxiOvnsBpisGL
	tM3UOr7m6b7rhpH/qP8H/7YlSYWBYLvKNa9bR2JZMzGOzYGIKqez2lU9WQ/W0i9aRkrbmeq53ZW
	PND/TzTwEToH3lyuM0eTHuy9nev6geTaWib3Ax4Nko2qw3e4co/gF86Ss+8bG2zTwMVZwSIktpA
	x6n8qPilcPY7Ps8IAZXlm5YNmTc5g4p6gbLsEnkd3mw1BUNnG78WqoER7vOaoODiOM9F/hgNe8l
	Z5S1kPyH5apRxhUEt1lblWxkz28k6hQFThGZ+3FtG0uJwx7o=
X-Received: by 2002:a05:7023:a4c:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1b3c03767b7mr4301004c88.46.1794461740120;
        Wed, 11 Nov 2026 21:35:40 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:39 -0800 (PST)
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
Subject: [PATCH v29 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 14:34:42 +0900
Message-ID: <20261112053446.73504-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
