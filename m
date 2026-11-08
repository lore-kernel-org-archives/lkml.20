Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182166;
	b=W67tORWhM/KKUNH80G0QGp05Iefy+L3obvAb/W7RWI/loqGKf7Sqk3UWIrxKn0PfvaKS
	 sY7MKTkTAPpwHK0ecC7nNbISy11TcPu0SVcvLnAniOXqQCZCOxxn1Su6eHOb/ud+mNiWv
	 w3XnjmhkLUN8bC7Ya34wRTvn0asy2eZb+7UUaGHye9a0caE5dPdcROpRAdnrOm8kw7lBR
	 Q6Rsds/F+c+2boeerVMswXI/2f1B+cZPFSWn6TVgjVDF1C2m7dS8Enc+IVbuV2M+2rYGM
	 N74/N00BrJnhwv14va0HEW11vlrXGME2SAbtSokBxGgjbnwVz1mxrqK1JX+fGTsjYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=gGGhKsxJjbRJKCyQgzkKtnaf+4FuST+6/WW2FUWcTicOdEvS0TkeDu89V8qedPqysF0n
	 lJsjVcgQjfPxOGT7+1FglgcJ8pcugHEpjQM5Uyvdwt4R7TSguwp/DgMi6xv367TSR73YB
	 Lv88Xuwy8iV7yckbhOwkWfLHv5+jkMG17wyi4VYrJtCucf6Dz5q3JIEmEIi+MbEyPUdGo
	 /DxBJFOzsUifrHVjKY4Mmybq4yX1KaQajyoNsBYI/ByVUcCtMHpIY34E9fJTq0IGuZTKL
	 2Y6cJapd2OnfzsWZJr+XMVLckOjyLHkeYNhXpeSCK5v30pE7EculwUVGLbbnlJ1lKNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfAXwHEp;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758C4606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 758C4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfAXwHEp
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e985106c0cso2346125ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182165; x=1794786965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=FfAXwHEpWz+7F0rrHdash2jTSoSQ/VDYiaYZGkeI4+fqILu3imbBO7P75zDlqnvBj2
         nB5OawEZC6CclFl8E1FYRHx60lCtuHBpNgs1D8Ier9+o2xN5Bj8qhIc9MnETY8vhz33Z
         P1vZjCDnqH9L8nrptg59oxzD8NR8DZ4Grt2aVnEkywGOKVc+xNrLfF3wnji0fERUAr/m
         d4QwOctjZCnEy5vDtqyoD8h5TXlRkoAKsr3UfrhEtRlGvF0iOqg0v4MevbttXMAyJ7fY
         H+e+VVYmnj6fmFC4hZZc3YCswqzSP17AIB3BC77XmzIzOtQpcNWgkgdL6khvkR/wp8dG
         Oq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182165; x=1794786965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=bpmhkyP1hjH0zPdUVPvj6Db9WW+pFhMWWPzGijXt+dMOJN8zsGoYoa7XCyXhgkAex1
         l7Jhmu5GA/OJxY+zxbgoqZau9z8QpIrpDH6EcyhohaQeAc5LGhLKuJ3K/BM6wIR3gd8h
         hZQZypbXct0WmO4RHnQdBrEa8XMrB75nwYY68eMj2JlQpnZ0+kQaQ9yjt4DPLgsTNeDR
         oi3xnO5B5x0RHyAJFxViMfI2uw8odRNoen5e5WmpUT+/g1w6zomZRDkyxTyhydeHHNbz
         SgoaTs/SLTC9s6Q9b1ZsEskjHmxb/BTJxQMf6aO23PuYfmM14eK8VwZEQ9N+vGWuDswQ
         poWg==
X-Forwarded-Encrypted: i=1; AL+hErHzyAhXJm17k+mOGMT4OrmE68t5w5MShiMR8fagTSnqs9YTVe6Xhqk4xHqSKaMCyL1j3wPVryjv6/6I5NU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iLMcLsLRgNSxtNvNxnOiJ+WAF3ZRBE69BrTDHz7QMii2KwU8Q
	6OQAn6fipK8xXLuAQqoUtpIynCcB4yDOmky3p+ihVTIi4730lK+rvQjG
X-Gm-Gg: AYBFou06cFh8SgBA9q7PHdDNFGPeDLYsnNE6DKcLTCxJ/EVs2+p74pPjn9Ib8YoQ6Y1
	rHnP5/Oz0scBHbaeBvf0648/yFZPnDpJ048Y127dLSRLOZ/YKLGq8aAdEH/ryDL7Sc0tq5wIdbc
	lQOwKhLRQPEYPwgpcMTzqFAYU1zCB5hzOQciYdGVJsM05TciJWHM7BdrjG5mNecieVOkkvPeTuE
	0dGNCXcl+byOJyH5rU0nEKg1bVxOm5fwwWAjzVxuvLFgXLnRsP7JU4w/1IrWYyYfXOCbCnyKB04
	QQhMl/OynlW/GsieWascHAF5YYrnhPk30G0GBsKpcgRybo2MJPLcRbDKhdhDq1rVGDjPVbwJ89J
	BoLVKKsmCenbWMUIETSkmgBNq+WvFc0oGryqwFvKfN9VUv7RxP/yAv9F+fPghiOodOrc9GtrRhv
	ZirjtGRiTVEz7Txqdz5Ufy3n3bDhAsCvWH65OQhLYnVdw/kIDDalGgtXe/FXRYD/WMyc6fo8Wox
	005tvy0/LLvAAhyTeNmNmmQXOW4bbuYyHJDDTAxeNz7PxHQOBCfvxU9PlFH2t7Ol2ZtjqkpKIcy
	MIkxbKfo5u2UhwSgoaOMFXu4w5pBgsGKVVbWjZzo2Df+djqpPAbvXPY/OQMn+m0GJOvOXdQsi7x
	EXs7H0HbiId6xIKC0fXOkYSOgPFhoseNN7JiBI4XxPu5lN3Y=
X-Received: by 2002:a17:902:ec85:b0:2eb:4a05:4b4b with SMTP id d9443c01a7336-2ed837a9da8mr24182705ad.49.1794182164926;
        Sun, 08 Nov 2026 15:56:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:56:03 -0800 (PST)
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
Subject: [PATCH v21 11/12] ALSA: virtio: prioritize staged capture period work
Date: Mon,  9 Nov 2026 08:54:56 +0900
Message-ID: <20261108235457.12688-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
 
