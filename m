Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74E4D954E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775003; cv=none; b=Uztjdz1FtAdO946qtu6VLA/0hoyPJwhaXDV2BcsT08/QtrZ4JSMxiD2KvamDcsxwnVR2h3WqH9AWUJyyg1CcI9fSoz+rOUutMzpqZ6ydKPG5gFjHSBGa9R3b99g0HgkqprYur5EeI288V2llQyQC7kIC2Gm7WN7sKvKXZ81+7OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775003; c=relaxed/simple;
	bh=6Vs6O8PONoMOrR7ZONa21JMLdmlfVfP+AU3ZmYHeqoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AmvU/borqOByyhsmzhbEfV0ECL4Dv/xGMqn+jkbA7ZpmrBUqWvaGOfsPHqr8i2w2zPMyjpkjHSiZLBl9WqVtmO4YsuySrsT9FiQLJJ9BgTqcKW6VLbhDJpajU0laGuCJCWVuizJbLJbvLKSbs84zU0oPs9AYfMF+sbhNvQBdQW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gJ4lrp6l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M3ZeoE6A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gJ4lrp6l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M3ZeoE6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790774992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WYoWKwmmFmUn/iLrFWt5ayLZVBeiXg5SrFLIxovOK5Y=;
	b=gJ4lrp6lGOkiGvgn4XTYAH9ct+kKw9bAKIbDKXqypjCVthSjzgmkvNb0iZgMGr1fLP2VbG
	904xbVYV3qBkK9/MCboX9r6jpoEMEtMmsEuhTUn/T1s6fj4SxuRhPOxAY4HhonRvXK1GSn
	BrqQbiXn9nWRBVyTYlcYXt3/cR3g5rI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-I79ogtgLMPuTb6yYuU7qRg-1; Wed, 30 Sep 2026 09:29:51 -0400
X-MC-Unique: I79ogtgLMPuTb6yYuU7qRg-1
X-Mimecast-MFC-AGG-ID: I79ogtgLMPuTb6yYuU7qRg_1790774990
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e7631c43aso51524845e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790774990; x=1791379790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WYoWKwmmFmUn/iLrFWt5ayLZVBeiXg5SrFLIxovOK5Y=;
        b=M3ZeoE6A+9enK+NdDox15lJKo+762xtVZH0h3bO22JZF4XI52+mLFbnWRWCroHze+w
         SE47ujlNeStfyslyt1Wfggdtb39PgT8pEv8jOqEA7NZZt8sWsWLABCBxcrnmX30quPYz
         NcYmh6EWnfLTixGeKB+v9EMZvrkZjuosD1N6u5ksTCdwd9fKNComyfJEuY3p76UJBbtV
         RF7LENZCBp7N453pFk+g2QEt20kZUpAyGOzDDSRmVsog1pkZaMKS0CMkradrZQv6IEPH
         bDodbcGC5FJ5u6qeP6Ek+e+2iC/n+Tf+MoQWL7wDUDuMX2tnUa/0yBeCrMQOJdfADFot
         1Xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774990; x=1791379790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYoWKwmmFmUn/iLrFWt5ayLZVBeiXg5SrFLIxovOK5Y=;
        b=DPEbboYAV5+GDY5yo49MgjypiKfX7cDpAHx5q9B0IcsPglfvGUczcieb1k/AVC3Tyz
         7y1m0BYRvJskTx/4um6eFivTDi64rkb6LP2cuYMziOZinoKAJIAGUu8I1hwvZIsnm3KB
         S+jbnRjes3gUHQI3lJxdxWdhAp+ZjQCdSEarYFac/HjQyQOuNt8dZRmPzZbQxIT21qFZ
         Q1K2LhyMjGUAzhV8yeZil5g83QhjF1HcQAD0skehnJ3TP9p8pbukE8DM3iynnZ++mF5z
         d30058t1er9oEkbb1oavo7m/TPeQNP4xjVnmxN8RCqaAUjxPmmaD2oaTNiQxjUV646HN
         d/Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxsbFfCqmEXUXPtQEGVCk3wLRbByuTDHIEXpD02EeshfqZCUUXb43gBCD5o/DqSGvCELpPF5wB2mPf39+o=@vger.kernel.org
X-Gm-Message-State: AFuF++n6CFtK3jRdCgguU0XlWxCY02FHugDQmj3l2Na3jg1XOY9uatDG
	Vjp1QlxZ05gK4OtdsT7iWwMl60EyZgsV5t0SO0VJrvqxAvIpgK5oi+BJ+WF4EpzHI+QgKKidPJO
	IzIodwbFhiyOWiREfwa4kv0wDjy+LwyT3c1TOBuqzx8jEiAl4sTGkA6IU4lujsw3h4A==
X-Gm-Gg: AYBFou2JPSNMJGLOqEJT34cjYoh8ZS1hzMihU9d9EwP+H1GSb1j/7KgOHV/ellLAapa
	P0q7yHuYk2TZT9HaykrPJhuchdw0aFzc9dPhXMFghe5gmEYrop9fMV48ZFy1ba0KJLkoKpCc57m
	IOCVRyWF+stgRUtqBI0LNPWdfrwpHixUv1GRaD9Ncg7I2I7l64hnisUEN06ArjIn8AVhpTAPVBu
	unuAp7fp9tLnB9RTjpuxsgS+/mioeWBwRl4cViQ4WOB5pGWXkUb8XrYLHyhV9zkVb+Scyf3Ec9z
	P9+QF83ZJRF+n5f89J5rjziKXGAIwdRgcIuYpWXjPNM5PueGA2N/i0y6Kj5UrsjiCu+mE5XKJT5
	8cd2xdTqVr0pABZaRaMvu0lGAlKjHnmU0JHl9Agu+l6QneRIGhAT4W5QC6lUZfwb7T1V5ghS/XE
	CgiDj7bBTzIps=
X-Received: by 2002:a05:600c:a10d:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a01c102ebamr14249045e9.27.1790774989729;
        Wed, 30 Sep 2026 06:29:49 -0700 (PDT)
X-Received: by 2002:a05:600c:a10d:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a01c102ebamr14248695e9.27.1790774989381;
        Wed, 30 Sep 2026 06:29:49 -0700 (PDT)
Received: from dbassey-thinkpadp16vgen1.tpbc.csb ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174e165fsm63564975e9.6.2026.09.30.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:29:41 -0700 (PDT)
From: Dorinda Bassey <dbassey@redhat.com>
To: dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev
Cc: kraxel@redhat.com,
	airlied@redhat.com,
	dmitry.osipenko@collabora.com,
	slp@redhat.com,
	mhrica@redhat.com,
	gurchetansingh@chromium.org,
	mripard@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	Dorinda Bassey <dbassey@redhat.com>
Subject: [PATCH] drm/virtio: add ARGB8888 support for primary planes
Date: Wed, 30 Sep 2026 15:27:07 +0200
Message-ID: <20260930132707.500748-1-dbassey@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DRM_FORMAT_HOST_ARGB8888 to the list of supported formats for
virtio-gpu primary planes. Without this, glmark2-drm fails at
startup because it selects ARGB visual configs by default, which
don't match the XRGB-only plane capabilities. This causes
drmModeSetCrtc to fail with EINVAL.

The virtio_gpu_translate_format() function already handles
ARGB8888 translation to VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM,
so this just exposes the existing capability to userspace.

Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index b422eba42a5f..5f0bc1b1931b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -37,6 +37,7 @@
 
 static const uint32_t virtio_gpu_formats[] = {
 	DRM_FORMAT_HOST_XRGB8888,
+	DRM_FORMAT_HOST_ARGB8888,
 };
 
 static const uint32_t virtio_gpu_cursor_formats[] = {
-- 
2.55.0

