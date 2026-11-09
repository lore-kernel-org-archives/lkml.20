Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267699;
	b=TQlzg8+8NXtI5xtm8zpHNIki5A4rX8AzUjBjMXsCMtJE9jwCW8jk29YBd9GImzO7tEXW
	 Cbu91OLwXhZzdZoKjZUE1woKCC7I4lctIADFKAY7t9qPdJ/02iNnstvtHm3ce4RHgPXZd
	 PxJ9xRx9IsYXyOfVHvoIyiUHE0PZj7iwOa/Iju5pDL1wXJujvjIeiTG9qKOsRTywXBTm/
	 ulk1oPdl9eB2nts4zBTHwwldiPOEI+5hx6PNPIT1Cd3JkYTuG+mvBtuHYVGkjjy5Fb7dk
	 hcaJGfnEWioGvNIAWW7jU7oHmBrSLRdvGDqqdt5KKR0B3UuFiC5GmIOK9jn+1DvATsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
	b=Pr7SNKGx7DJvdjpAtArt/uV6aXqGeIoFm2A4Um4oJdisc315uQA9xPtTHTol2YzyJ+cz
	 vRIpxWpIHcISfG9IU/+e9E16B3qyIVlMi1ZqT9HN4xAiDaoiO71hXNzOASiMYGpbfZ6GG
	 c4LFLH03InhrMwVUeJmRvZv7u6UEwWE4rFCOHHDDOPGeRCg2rLfrtpneWWfUhqiBqK3T0
	 fezskOjYEhTF/nIAsZh9tcLHXkqLwEQbLJ++b3Hln0OUC6r4XssFBwTZFSLJpnqtCPEor
	 MW/kujxi8A2vs4uaY+1vu/2STCa3JEr5QAj04GWZlBSdUABemh1G6gttg/f7cqCSEBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOXyq+cS;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8162460A2612
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8162460A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOXyq+cS
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3704d30b84fso1820500eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267698; x=1794872498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=fOXyq+cSXf2AlvOAXFEdxNXljERxklqhGVDeNzLAQgY3isaWq4Em/VJBlhnJSZxZcl
         PE8g0gRDmy5rNm4Ud4FHIuklDcKDQ/QXOVNv7xpqhjINNeHNSOwdm7PhW8/wR4hreUhy
         4dftch3sFcEXjvtv5pn0CIfwdkim4i2PqcGa0jJZD3Ut5/LpmKwxi2bJISrXl0ZEQ7zm
         jEFS3T8EovVvtnqHOGdh4eWC4nmXHuX7vj4QzN30xKCisUwrwm/FPiwFijGKYFA2BdW9
         T38ErkoLFesub2KMAeGRt6TBJvjqnjNEamtaRV4q+0b89AoE5e2qs4I9buYdqBRoqSlu
         AtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267698; x=1794872498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=VvehJNk0/hpFuunnPONbyDPHB5M5gl5URdY173zZJzrpqo/Bp2asGET5xRY1w/lPYw
         kl6tHVTCJg0z0r0T0iSeN/gEV5MZPQEeKwtS13iFUk+yVvadmFkWSLg/uluQ9/kx0Jne
         TflGCVqBHhpXgpT4tKI+6hYxW2YBJIiO5RBpfXPlKQ8dJcqiRyIhCtulYRPGkM7Y+PWf
         Bu67kVCN0izPbWLx4Boi2ueeUhsOVwyOpIbX4f3BGLSrVF4GrZ/PGhXJOGm1QITKE47e
         eibzME+iYDrItwwjkEfadPdDGdh/IezlICVQt4+fzdsxQasW4Zd+2Msrwx7VXWUX/L1j
         aw9w==
X-Forwarded-Encrypted: i=1; AL+hErHfdIX6SnOrYkgovA1Oys2xiIRlKOYEto3nAYZ9HY4HxL9hD3vcjGK3/uib2ZHbberl8SlauAj6LCJQ2RI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UCIG/JJdNOjDqjiW1/UvdHH9pNTNv27+pnb3ZaQtivIrIVVAi
	LELLrujqLVUhMH64Rb8FVORkbWeJXSCW06xCo8tKhotNLlT68S9BTOzT
X-Gm-Gg: AYBFou0lySJ/PlfZ31XfPB3xI6AttSS8G0k9uJHoYn+Z6efxU0S1xSUQPptdnOLHJ2e
	ws2PULowNLgkZZ++01w12iCsk1v+urSjPfCMNa4elx4sl+eYiB72hbUj3WzggPUHfwxx+bvf4MU
	70BN0NCFrdticbEJvtPASvOCY+RbWtJwQwT6KpV0UdHxYOb0RQ7Fje5GLcaZsg3JBABvAEj5bkF
	0h5klO/KqmUGgd8rw5j/2aPUzKw6DRqLKKZoZ5CapsxFTTCb8T0KrI32sAVuiMbhfTiMM2DvuJF
	6bVGkWjGYRT3IP23pAg1Qxv4gglNa1truXwFfs5jS4uvjY/7mp+7Ke3G+e/mcADFJ6LtaED+WQb
	NXksl9NzQZwD1ZugQmzP+qU346V660+akrXqVEK09gbXc9ZW3WRFReAUYFDOJhW4owLvaB0W8j1
	QpfXTfn7YJButPoM58FNDVshy+nk3JBPzjMifY8XXckKPS4ZP/zgZFExnCc2Dcq7VEnmwNHoaaT
	Lxt110tWw4mhRNpIBhB0fI3dG03qSU/8a3gJOP3LZZMQzulZIp8hQgC0xFwJF2XA0dBit+oOIjL
	SNqCUfWjY3+dUX63I2Zv5fSd5J1CKBxZe3MlNalNh/lGgNthscRefuq95fHVE0kdkMDr7O75qmu
	Iv09BTBZ0q9tx0VjX2cVr+9oMUYWhxqmmmWYc5UYIqErkX3kw
X-Received: by 2002:a05:693c:41c2:20b0:36a:4ea9:19ad with SMTP id 5a478bee46e88-3751eb8db6amr975022eec.9.1794267697349;
        Mon, 09 Nov 2026 15:41:37 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:36 -0800 (PST)
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
Subject: [PATCH v23 13/14] ALSA: virtio: prioritize staged capture period work
Date: Tue, 10 Nov 2026 08:40:48 +0900
Message-ID: <20261109234049.79534-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -168,6 +168,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
