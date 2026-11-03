Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744132;
	b=wqDXMNveG+917DlfqoIheKedcK0UbLLH0YNVu3D/2lfOhOvQcdhsevj6Xpt7mmFR+0X3
	 c+zyYI+2Z7GZHcJBJxIG4qV50Tc5ls58mHhFEzJgeCHtTC9tX8N+cu8zk5k4RJ1EIxsJe
	 W0lW4eNvse7jGnFrb0qykhR/RG6qlxVgDqRmlipgwWv2mJ4DI/QnsrR80DMBVy/6rY1WD
	 SGJ16dVAYwjpZLZO5bgiqpRN5sfMMJdGjmc/5+lM7DTS+5ro89vu8JlHVnrlJ5Qny5aYe
	 EqTUAjx06/CT/DlBrPbufgJF47BOkLrqwWKm46S7H9rZvteM6e2j6LCcu8UjwRKUtbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J2v88Y67fGvqGhiKg//IWeUpnVROIgGcFJFgELfIJIY=;
	b=Han6S11LP/4HgfB7+N6TSycp8Kb0tB7eIjjAgHXF+BkbFOvtgx6KKAem3lQ8Xl4nLHdH
	 wRy557Yn5/WoC/prbzhf5h+/NzhwyaxSlRXMQTrOCg5bqWF0Hnfi3HGV9XltSIHVQKsAX
	 BIIt/EanKGn5a1P5+qbBNsK+0HQH8cimjV2JYldymakiFqb5kHW9sXk9EjufZj9o5DtNe
	 mIZi81SCj0ZPIZGBqi8O2IhrEaY9bAheDm8xxb+9NFwTzK6M+afJ12IjrUufacwaczyUt
	 P4GhzXZPZ5N9arwTtqVneX+cS5HENjdBffeQzJ/c1L0IIRXQQrIR2fRD2BxyUb2SFcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srlxoXD0;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C66606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C66606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srlxoXD0
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06210b29fso55195b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744131; x=1794348931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J2v88Y67fGvqGhiKg//IWeUpnVROIgGcFJFgELfIJIY=;
        b=srlxoXD0vp9x/INrS9hiI8fPcDyxidqntq33lCrKhULtP83cHj6woXutaymvqpsGZz
         drLJQ1EV26GhPSAaqLVjqgsu/GPM8bqxh6mkwljmewbRJyg75GHkBJFi2GYYW9lHOMqO
         D9n01jic/8cPItPBQ+UT97hxXkic4QUQnCOnK+QWXPWfxHrIW6bbeeqGx1/ou1hPTbIE
         I2TjsLn3P92Jl0ZdcLWY0K2CwCwGM9KTHrWQ9SH/bWhluncQ810NNLpU7nGuDvKHwZjy
         zeCtlobcyfQrKdHof6naZ/cZXbBH+DAN8V7jvk76QrVl/VS1wURB6Be0OqeyfnCTwd3A
         xZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744131; x=1794348931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J2v88Y67fGvqGhiKg//IWeUpnVROIgGcFJFgELfIJIY=;
        b=2rSjIFtYaF03bMNreMJKuqqcAXpJMXu2Ih+moZc6BhM2D2LK1ftg+wyW7mD+2BOPZI
         CXiqyAKTgktpf7J/DU1YRrz4mX0fVW45FpuICmyRGp13M8tXUpd3hlSTTgtA4CocqX8I
         WN0iSLeBvF4OLk8QPfmSOnZ+aTlu/QmSgPprwRgWiX9G3TrXnxedOGrtl4Soa7lAhJh5
         +LDRYZZdaSfg4Ga63FE3hXbsNQe2Ps9RuFGTb1ixvC6t/16HUi7Eyf8BGMzGFBdB/WeB
         8UIgQyyobD4NOVBGmQ9xlIO0gzJgbmtErfkIbOScmgNJpqPdJcL7ebKtusnoAlPUVgUt
         y2Vw==
X-Forwarded-Encrypted: i=1; AKwUvByi5o6dIrX0PPaqdxXVcV9Gp+1lbYSb8BCdJHt7/1HvyjCRUDb6e8cKwGVndJKp/FVw0hkjfnSn+HtMkpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UFPevqYd+9m2FBLWm81A/UxHhd7AIeJvuSDZsTgFH1p/Z1xRS
	hCN7qFTDC+6cvIZCDA0ArUox1227cDP21/wWKq9PZ9zBQuUKAxkfcWTZ
X-Gm-Gg: AYBFou3k9hoKA30u8jjwb3iyIzleasSQxFyPKYo6eupDx3SCRoFJFzuRp/Gag3Yyz8h
	Cb76mJNTeKV6Ruv1MmbBbVdBq1MZrn4Wk9nUwFKVW8PJZB5i5eaTyL/bjhOLgRBKnbAmJXqbTrk
	JypAXIW2GVCU++KcPGUz7C/gEm1fZk/SP/e67to54nn3Hvv3JWCDW0JoQIPTFXGfWVS3qnCskYl
	g3WUTnEkjLWsS0Lkk9WW298SjHgv0T+E556CfYq6aZ2ep2wlJJ9hsjGoxJY+Q+W8n5bGi1Pbv59
	iICurghmhkDK4GRB8xZi9drqa4ZxQHV852WfdQiiy6db90C3Xzg8Wn4b+vmimJZarDU4Hr4Ak+A
	8pjxY3h6XM4ieaTRlBzxA2ovIjCAPNUO7zQCVR0dUbNRaUbtwBPnflRVlcqdFaBep9knr1bYfGt
	mgIS8d23+aYbE9qJsboSYsGsV6SLdtcDp+Al2SFeNRKOrzwEoqcAt6H3t+HAbzgG405XBsfqDXA
	5jqx6QZhqHQR+Nyl481pEVU/eldeVSyzW7uHU8zx9debH236vaFLeYGY8lDew5iRxPFcAOjsise
	gcJ7GabpBtU+DDHq/T3v5ZyCCtORdAYMVjLpGLpdlI3RPf9vn4EmBJxT93Cq18ERai10XaKNQ8n
	5OxvFNtigtHfAYrG/TtNerCM/bdHYJsAL6v8snipKDNIzjqz3QDeqiIZ7Jqh8fj8d46vwXxB3Fp
	sGiw==
X-Received: by 2002:a05:6a00:4395:b0:89d:a947:9d58 with SMTP id d2e1a72fcca58-8a9beb64f99mr10595946b3a.25.1793744131486;
        Tue, 03 Nov 2026 14:15:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fe1076sm143036b3a.3.2026.11.03.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:15:30 -0800 (PST)
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
Subject: [PATCH] drm/nouveau/fifo: map Kepler video engine contexts non-privileged
Date: Tue,  3 Nov 2026 14:15:29 -0800
Message-ID: <20261103221529.585436-1-rosenp@gmail.com>
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

Since the engine context rework, gk104_ectx_ctor() maps every engine
context into the channel's VMM as a privileged page.  The MSVLD,
MSPDEC and MSPPP falcons on Kepler fetch their context with
non-privileged requests, so the first method sent to any of them
faults and the channel is killed:

  fifo: fault 00 [READ] at 0000000001050000 engine 10 [MSVLD] client 0d [HUB/MSVLD] reason 05 [PRIV_VIOLATION] on channel 9
  fifo: fault 00 [READ] at 0000000001051000 engine 14 [MSPDEC] client 0b [HUB/MSPDEC] reason 05 [PRIV_VIOLATION] on channel 10
  fifo: fault 00 [READ] at 0000000001052000 engine 11 [MSPPP] client 0c [HUB/MSPPP] reason 05 [PRIV_VIOLATION] on channel 11

Before the rework, gk104_fifo_gpfifo_engine_ctor() mapped engine
contexts without the privileged bit.  Restore that for the three video
engines, and keep the privileged mapping for everything else.

Fixes: 8ab849d6dd4c ("drm/nouveau/fifo: add new engine context handling")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
index 5655eda52a7b..912eb6c3a13d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -180,6 +180,19 @@ gk104_ectx_ctor(struct nvkm_engn *engn, struct nvkm_vctx *vctx)
 	struct gf100_vmm_map_v0 args = { .priv = 1 };
 	int ret;
 
+	/* The video falcons access their context with non-privileged
+	 * requests, and fault with PRIV_VIOLATION on a privileged mapping.
+	 */
+	switch (engn->engine->subdev.type) {
+	case NVKM_ENGINE_MSVLD:
+	case NVKM_ENGINE_MSPDEC:
+	case NVKM_ENGINE_MSPPP:
+		args.priv = 0;
+		break;
+	default:
+		break;
+	}
+
 	ret = nvkm_vmm_get(vctx->vmm, 12, vctx->inst->size, &vctx->vma);
 	if (ret)
 		return ret;
-- 
2.56.0

