Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563473;
	b=fUDABzHwsS5wvgE0MC6WxQHvKHU54k7aO08evnD0sHzyhz2gIuwT5qxAX0uWRX8nN1Pa
	 2UO8h/T2k5zqbRuoMjxnL0QzNHn46xrPu6/CswEhQDxxiRaynNuP0XjehDJiR3PJyUzfj
	 59WRThuVnMwvCslgM9QlGjfPcaA3kDoPX76D7asrG/vnUTcadxDsOyPooDEuFS60aG3T/
	 M++qsUHLMiV6q5/FHEM0YBxQG2vJ3suOjdUuuwJDD6SXzR2GACUw5vnTettcYFCrBzDl1
	 dkoTkCZIjQNk1ItCvgrx5xRReo5veFPSG3zcfIwB01+o1NU3IRrXckPwn5oQzWmdbQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EADMVsLqtl7UawIMCnC7ocVxqfEpyyxisoL1Jal/32g=;
	b=yB/CWcsQWQm5aCqpK/CoQTs8+EFV9k14otOkyZeYr2rmvnH11+jhCfetAWl9Ok9Psn1s
	 Ds+cBHiJ0qBLYEIqvpsInvTtOBmYCsSYOlc4qYJtvy2ujmE4+7s2l46URXnoO3kVmlVQx
	 rUHlS5oYqrjGiyozyWQx4XVDIx1y/OVsWoZq4rTkfSiQAG7tpKJRcPi3Dn+CAy/f7httW
	 pyC0yECj4A+kgPr0TiQWb1QZD62WWLS+9tF6z5N+uiA3Mben6CtGAEL2NHe5HBhBikisN
	 fCbVcFiYBTytLep4EDGlQ+tD5O1ELzbgI6G/At/fuaXqY8dTE1fJlqGqTHI+UVd6hdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keqaWim8;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D97606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D97606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keqaWim8
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so4369487eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563472; x=1794168272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EADMVsLqtl7UawIMCnC7ocVxqfEpyyxisoL1Jal/32g=;
        b=keqaWim8Z+plEZRczNczH3dBEsZWWAvymJHfCJOLq/iPBAquMhNqrlZY+CNJOtxfPr
         743LFjt3d2Ip9mSUFxSLL7GN8NyTiCcFqBDZuMLKsBcu2IyYDMDu61md08pgYkLjVA0L
         jXSe9HsLLy9rOuMR02+YxZ5iGlL9VvHR1MLnoN3UIaQEl+VrCF3FQIbRcDDZENa2NDiy
         HnvDlqnY28G+H0h+KijN3RE2PJkxL/4rX2CCNCig59JWVtIA6oQE/kPVhje0mF9aiZ2e
         ic3Kegw7gsSPHF1AwF5lxU9Ys/IxjzDOxRkzLJO4qaBJrFahzO9X+d0BOowgUBGFC9W0
         5Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563472; x=1794168272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EADMVsLqtl7UawIMCnC7ocVxqfEpyyxisoL1Jal/32g=;
        b=2q/w0O67Pb6k/LAmobmREbRGY/IcA1TUDVPW/NIq8anv1UHXqMR3GKTdM8HiOTdRPM
         O3JLSMfQ/3xOrnxeceOl+4MCKb7cqMS6fwKAIEb8aPugVoyvb+/D7HeftlBzRol1lAdx
         XE3DQhrrlc//3xA8GfP0R3hpd88ZSDmADztk7uaePIJVs9OTrv4PYPayGWUMIRxtF6g/
         4QMLbKFCX0bTBONhkAuVerHLgNoUi7tfb5LYV6q1tVUjmpYWSzseAi9N8JlQXnfxGfjC
         mQn3PDnVyqMo240PzY3b1S12AWsH5Ci4/RpQ7TY5wsuoCSgur/Gz6MKe4vzpAxw5R8KE
         0/iA==
X-Forwarded-Encrypted: i=1; AKwUvBwuPe38hJiPxMGfy3xxKinCbUbv428oHZm9fP3s/AJNEX/U9nlWLlzMCeAB73LrIppEd/W74UZMDthfc7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cOQmkgwu5Mx1RDdl4jC8y5+h1oi3eo1mfH3opOYMj5B7UHxRb
	JcXthuRLl4MjweFd/k53Di6ZP6hQ6JhLaC367ABjIJapPeE3D8Ay7Sm4
X-Gm-Gg: AYBFou0hTNEgSme/MtnwkqJiHkv40SccLuwt3UbBjec/Pnp0pqrMfoYeRFR+Rh2FXrZ
	kvbylsaRilhD3+EL1CL/wiE37EwAa29QonLRsc1kq51uuOIytnKpbp8rOB3E7ReCD6Zvi/zBYD9
	56fZjuJjU/2Zwg0XTyqiZvZlL3WbIdfP7CHl+XHXAaUS+bmnLOutM0QCQkdvaS9RbvZEM/PGvgv
	tTNiMBd2jMZ63/H07oeAHxEKkBEVEhsshn87gB1ZAS/3fk35LMuLAxSpJ5/sn/2JAqThBT/T93D
	g+kBQVykwTeYwPAIyZMy1oDTSHPiLqJPjiAPsYb8ClIRJFNuWPo4QZZXz25pkBy7ut/4ppdERig
	T+kAfPNK8O6LEL10sxvbzAh16joeZ/t6szdpiUw+dxnf8SXRrbL/EmpjQvJu0N65xVZyym0asGZ
	mW8wQRbzwq/tjNZCUTuXQF7hv3Ezgn7C5Gi2IISQ8h0NvwtSqwtmetkMRzulpFaV6LENy9+Mdqs
	FdwoQ4tiopwBIf3tl6iGBwAiBVeXOZ90dJeqc6qSjNYxvega3Wxcvz7fkDc0p4K6x+kVXedvQlO
	3nvX6iHXIiy3a/yzXEJLTtPtkmItMbCkfDYRbkOPuj1LNtoQwx+HlmxRYGVE2ddk2wq5NabhXaP
	Djrez7Q0aj1a6pKvKOZfZTACv7dxwdcFHOROXqPkhhKiHrI/OzMLjxkOETPpfRlu2p8GmxpN9Ss
	9LcA==
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr16145992eec.11.1793563471296;
        Sun, 01 Nov 2026 12:04:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm29251211eec.28.2026.11.01.12.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:04:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: nouveau@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ben Skeggs <bskeggs@redhat.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/nouveau/nvkm: clear use.enabled when subdev init fails
Date: Sun,  1 Nov 2026 12:04:28 -0800
Message-ID: <20261101200428.16959-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On Kepler boards without the video decode falcon firmware installed
(msvld/mspdec/msppp), every other VA-API decode attempt binds to an
engine with no ucode loaded. The submitted work never completes, which
leads to a context switch timeout, a channel recovery that cannot reset
the engine, and eviction waits on fences that never signal. The process
ends up stuck in D state, or killed by SIGBUS when it touches a buffer
evicted after the wait times out:

  msvld: unable to load firmware data
  msvld: init failed, -19
  fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
  vo[5444]: channel 14 killed!
  WARNING: drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:117 at nvkm_runl_rc+0x2a4/0x3b0 [nouveau]
  [TTM] Buffer eviction failed
  WARNING: drivers/gpu/drm/nouveau/nouveau_bo.c:1092 at nouveau_bo_move_ntfy.part.0+0x9b/0x100 [nouveau]

Tracing nvkm_subdev_ref() and nvkm_subdev_init_() shows the pattern:
a reference taken with enabled=0 runs nvkm_falcon_init(), which
returns -ENODEV; the next reference sees enabled=1 and succeeds
without running it.

Clear use.enabled when init() fails, so that every later reference
retries init and fails cleanly.  The other readers of use.enabled are
fini() handlers that use it to skip teardown, which they now also do
after a failed init().

On a GK107 (Quadro K1100M) without video firmware, playing H.264 with
mpv --hwdec=auto: without this patch the GPU channel is killed within a
minute and mpv hangs; with it, VA-API decoder creation fails, mpv falls
back to software decoding, and no faults are logged.

Fixes: 8478cd5a740a ("drm/nouveau/nvkm: add locking to subdev/engine init paths")
Cc: stable@vger.kernel.org
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
index aab5a73f467a..ff6858f5e5d3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
@@ -157,6 +157,7 @@ nvkm_subdev_init_(struct nvkm_subdev *subdev)
 		ret = subdev->func->init(subdev);
 		if (ret) {
 			nvkm_error(subdev, "init failed, %d\n", ret);
+			subdev->use.enabled = false;
 			return ret;
 		}
 	}
-- 
2.56.0

