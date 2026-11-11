Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355610;
	b=AkMayV7NmWpuTO51J36XJn315A0qUJun7LGBTjHVdCF7VrYHeaWKr/hL+uM3adz4fOrq
	 0pSkVY3yVlcWiYGcCxnCf4cydLLWLSnfczIQXa0Xly+jAWEXkVc6TGchvs6cvtz5FgC/k
	 yMQ8Ex9tPVKnnA54+BjGHWzzUt8SwP4tlAAr/T+jA7o9/D8l6UW8eR7nsAVxTUtoLQKgZ
	 lD0S9tAj5IuHkptYdSQmFoXrcB3wO0lWqfD/hSr6h1o0d/UIEfGu9mJ1n6QjoAsiUayUC
	 1Ntb4iLDaaXr2ApQVl8LmWXqLmbEjqY/E5s0VifLWZKio+jCY3/CVLnNJB5cn/0PGog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
	b=TYrOpSquD8Vkd21ht/1rP22d5DFD5dNZn3lT2TtSyNTVPvkCIB7vJ9phkdN0+vSoVBxU
	 lDStTktB9s+mSuCkJsRu8bz66FaZMFO7Cbyf4/gRLHFadBxQzZzvSp4KeafcjbNEBRv0H
	 OH7luyOFnc7gb090KKv3tMbyfjiSFPu09rG74PUZvgbCqZnZXInCJ+7ErfYcFXlFBJ+Q/
	 KPAzkIjNTe8QwdM4ujCZXKvIdzRN036tXYWZCX4YBTK3VqvQsk28KFSg+9qeoT5X4ocUh
	 LVl32nixsyT00id52FNVrdeA+d1qUR4wnVx+YRz+tji1KkMngvZ2ph8sxgqH2p9+EKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgBwT6Y7;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29E960A3813
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B29E960A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgBwT6Y7
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b179528d56so388072a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355609; x=1794960409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=DgBwT6Y7RSxD3MuIEU5idrNj5eE6RclS7sUg8ysyijUcYKa1H7xJmOlRr7DTmY2RIh
         iJBpR/a+E06l1j4Yk4YQ4U3B2dl6Sji3vUzn5VNAMXlQR89d4XeEENLk2zvdv4Y8pB7d
         Ug20KYcNFWAk14yCmVTv18STHeh2klrXOnkEftwG78XN2Duh2s+16JM9rvc66JY16K5M
         zdPGTp6FXZMU3HmWfnjwu0qmknxAMbYrLxiRFAJraNFSJ9wB3PcpcO2IBxXE9ixtsSmW
         JzFqCJgPtYySOUy+t6Ral8cDCUZF4I8K66mgpQl0sUsysXhxwQTM6SpY0aEZ7pCLj9uF
         dazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355609; x=1794960409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=jgQVnfHwv+NIU9fT/kKPsDGJhtTSq1RQQneCmUhvKlTzTFhx1lyPpvHKjJXgbpqapG
         Ky6vcD5eeDi6YCuLvCYJHJB8lTbzIqBEhPW/5djPaxCep6Vf0p4qZC9YU17Y/kQE1Vsm
         7RGKuqlq2aq7hD5i3j3XuNBNROj3o9iLMmy1UE1TdUF0LRZrLwvrOD2IRV6iSlLKdWzn
         1Po3GgKbqcblAauPmquiWSc9LYX/9PZSmv1q90ldhVu0OexYQUcw+/3Uf0dhxjnXu3s6
         tdlwu7beT0D1ZcIQBUPHZWMFXLxRnAp0JIv73aIrz+3A0OPY4Opba3CBRkNXCU3hfA+k
         cVow==
X-Forwarded-Encrypted: i=1; AL+hErFBSSAqM16P8pgd9rs+XFJ+6Tjqgf4M4ykYIIWdUB8GYS6tKdVcQMoeRIDH8WvaMokn8FIQn2aI8arZkcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WRByAKXDRGVCsquNJbSxBrjrpgL2gCFB9ycMaL7/dH3rrZZBD
	qabLzxmDHEqSeX8jQaHDm3jeKn7YZpv28TrIx6Y648U2L4VcetpsFF5j
X-Gm-Gg: AYBFou1iF0KVlPVWle64VPid63hzAGctx/p7VRmqAiY2G30+iM3CULOCQy+Q5h9uHY9
	XWCb4II3rxF3bZw3q1lAjQy6bJRxlogBMJCIaHgGV0OeDEx+DNt2sLtQaYBuWeTpq12Dw4D14GV
	St63c9Xcc2uaSXFFkXSZQw6Uy2ieyLEh74/pZDirNbOoww6OdgdlKMiQ3FPe9hv7XmquWIGhyMg
	urjYqXg8ykOojPnsXWB+k9FRV4hOq6eMVRayQyC4mky5w8vNSeDCJpThRTvc7lvQ2jo+jNT3ZMM
	HmiA9YWq3i6+jV96jNsd5iykeLgJs4MsvdP/L7UxsrCa9KT/oeUsXQOmdIrQhpmO5s08eSCxHGG
	YvNVLNLM1XLyEh/Mqzy8m9MN18HgdA8at+Z425MrG4CTb51ERpwz4Bzk41+K2clyK/rH4c1gdi0
	RzWyV81+QhV/mN1EERuN53X5S+ngA5U57fD0ElFAb7P1ONEUflVIELfqn7aBuPo5sZH3f0Wce/H
	fDDdFxTTOD3ndL/TvccUPQrUEJbPZqcS+9njAmFbva81G8S4l3Q/48ShcSKBy41xzRxfZmnlEbB
	igZ50fkkc0Qm9fzGT5ObfJNJtoLLMpktSlmrpyCxbYwr/oYmmHEwTa5/oOkwxW2VZ0vJbyboUa2
	2WYHw4nqlVOeeW2jhv/SUXQQHL7g1htjzPW/yFepU3vT+T9Q=
X-Received: by 2002:a17:90b:4c4c:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b182eebe65mr643070a91.16.1794355609114;
        Tue, 10 Nov 2026 16:06:49 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:48 -0800 (PST)
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
Subject: [PATCH v24 15/16] ALSA: virtio: reject invalid playback completions
Date: Wed, 11 Nov 2026 09:05:42 +0900
Message-ID: <20261111000543.28550-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -980,6 +980,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
