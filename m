Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793487559;
	b=jQzTcSCKkNHzQYMw2+eMCZMqTeQC36UuRXX6aQ5/jBvsGLW/fy2l9kSG/auQPSQRZaOQ
	 4OecnoPJYh5DOu9ttOs4pnVQ8r5mEu+U5Su+ceZYaQGVpX5pPdxSH8zJk5aTyLAhxDAqR
	 dHxIT5VkdhNFzU0DGpivcVMSEPJ80BdOEfUP6xzxjwYR+Qqc8FfZ8PD/OJIRJUhTzkqNW
	 h6vvG0EULtsbF5AgqggG2nd8kLRQdOJWHIhmrCsa12bpMyJCnRHmYa0drAwhCq6EXTCB+
	 So60omwAoLg4tzWlvBi2yOnDH6niM9vV/9LWbZPmu6sVML8Nlq1rM7YumgPdESVFWqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793487559;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=v8ieTUMljOJ7qpikwY+C9+nNipul/W3dfq2M+DvQXoA=;
	b=KNgKZ6FddVUwqcnRWXxjMClJPse9OpGBCWEbWYcA7cIkuizR8/KJ2CCR/jWRhfFJhavu
	 2hxhJ1PYs/QXDSv73addzBFm4JdEbjUr27aqkyK77K8U2Ds80YHBa6ZMlLsVY9WWoOiqo
	 ABPfegEyP7q03/Ggnw6ULVb1viA60kIpu+XX+qn0jObp76MeRjtGErjcGjBlMET7uuyth
	 A+9+WFYJ45ViF+iXhm8F8knh7PtmI8iN1jw+V2bvbGkivss6VqdS3He6rigj5z3vPcBmN
	 MS5ZORkCEaWL3aX74R9Lqf8/OizP2MY/1PS90MSUriDHfPuotwmEFm2xyolPG4vRH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MW8BT4FC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W6ltdRX0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE89606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE89606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MW8BT4FC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W6ltdRX0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793487558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8ieTUMljOJ7qpikwY+C9+nNipul/W3dfq2M+DvQXoA=;
	b=MW8BT4FC+t7aYQi8S/4tec8Qil6wNTz8CqBJ8vzZKiI08H/9HZLiwONyo4ucpu7p4QFwHk
	G1rXgdieWpM31yZ3n0Swgl4AqS2YuBceimM660QWHnMx2ah27h5Xy7T3F2J/yEmhDagJrU
	aQCvYSea7UHLbMSzcV26+wH3M8X2kCw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-oRjFylkkMT6wFmgqhQJZsg-1; Sat, 31 Oct 2026 18:59:16 -0400
X-MC-Unique: oRjFylkkMT6wFmgqhQJZsg-1
X-Mimecast-MFC-AGG-ID: oRjFylkkMT6wFmgqhQJZsg_1793487555
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a4654add56so15103465e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793487555; x=1794092355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8ieTUMljOJ7qpikwY+C9+nNipul/W3dfq2M+DvQXoA=;
        b=W6ltdRX0mniN0fXze4habzUxscF21GcoSpJwMaem4wH+C8RrliH9HlV6wTOcTc9OIT
         P0DAq3P2NDYeb7p/paQP8ibyJstN3toRLFtxPFw3m/y9WC7v+tNfzpRNHNpao1NJeN2n
         ZVXLOMi7sJAXgFlmEiaoxxQ25krfkWh9nXoG1zpL/fTl0+7BwfoO9sXttuJGAzP+HwTW
         FojKYy5s+dAIwJwSCL5h49XYEL9JAKWWJZz7Kb0AGlY+7vN3AjVTeV33bDHTmsEpXI9T
         qkoDW11IUo6sbvv/CxJDH3VXDuw7nEwavw80KkEOmJ5heYEuFepIVqmMd9PZl0X8SAq9
         gk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793487555; x=1794092355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v8ieTUMljOJ7qpikwY+C9+nNipul/W3dfq2M+DvQXoA=;
        b=Y80wpARygNuiY047vfCO03gBitl0qCowLD0TZkue7WeYKNZ8RcDTguPfp1fGfdbfIx
         BC7mE5lvDhGNqa9FF6uIvw6v2StIbLYiu8NvpBak/6nQWw9jsXge3FDEB6g60W5+TK5r
         HSQ+hIpWb5IXKrRe8ymGw31kzai7Xi3ttkozGHt19cq4JrFf83/A9XOLhiFZuzn9Lua7
         sJ5QuOVc4wl/Ag10ibs4CGT2Tv22tRCMG4h/bCqUsP3GBxDEjuNBdoWgUdIqunPwcioh
         Fhb1i9H9WVyeZG8pYRy9IBxaVQAhj2azoQQU7h86AsOrX8Fiw/sMDbKko0q+EVXKKdof
         SwIQ==
X-Forwarded-Encrypted: i=1; AKwUvByKm3zc7U04yakC7LebhyOh2WwC3hE8i45ogInRdsYLxWiJ4I+uyzWcyzXvHzdJFl1D0TLwBb3dyAYg9G4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5pZoUyuq04g0lpzlxetSVnA9qIJtHN115iTgRxaFbutW4gOcA
	ZQxtsq1R6emzTvPDl7wPQf7JqeQRIV0P0UrAxc/rb1lFgVVmyElimfmoQP6RspjF9xp3YTuH5BZ
	5QjgSej9K1FKZ8VZapdMZieFX6B+wiQBbolR2XO3dLTbgpJQRtNykmhyS97Ho3Qnd2A==
X-Gm-Gg: AYBFou2DvTY/DmsKTkbombYyG4j9bx7VV5ybGPOyMqI8VuaUlzaOaNwlCIwASwbGTJZ
	ubCsXzp25CXtfyxnRig11Ya6udMTxbIr8P7WK4mbJhRNo21+I1UerSkUSJ2EFCOEFurdI6Pba5L
	Y3KmHP45NEZQzC3nF1r5SQMC09HYo8eJJKqlzGYgBgIx1InopSctjmo6h5YEQ1CJ9AwsdWhV1tJ
	tPQbjU7QzAEn1riMb+6DIFeE3FXHNB3fIVb8kdGSB8zS14q2DGe69yIE2adEsyMEaPoulgt9jfr
	SjJ9ECR6ekioDSYe632hg2Eu5mvuTK+t/DHtJuDH0KH5AuPjRml76J0z0iXTXeR3MCW8zIdwJLc
	+c0QfjB6OJbteC2KqYIe6eDrQivA+vn2KN0THTXy1J9ChdFAQSztb0iY5g/T8xGBf3ppwZfAX4e
	i4z4yx3SRfhRoE//etO1DNFyeneqM3YFKl8a7O1pOpT/9yQ3yL1w==
X-Received: by 2002:a05:600c:3b8f:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ac16acfdd5mr143439675e9.11.1793487555498;
        Sat, 31 Oct 2026 15:59:15 -0700 (PDT)
X-Received: by 2002:a05:600c:3b8f:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ac16acfdd5mr143439425e9.11.1793487555156;
        Sat, 31 Oct 2026 15:59:15 -0700 (PDT)
Received: from toolbx.fritz.box (p200300c1df20b900aff65c27eee3dd92.dip0.t-ipconnect.de. [2003:c1:df20:b900:aff6:5c27:eee3:dd92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm204535345e9.12.2026.10.31.15.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 15:59:14 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Subject: [PATCH 2/2] drm/vkms: Use drm_dev_unplug() for ConfigFS device removal
Date: Sat, 31 Oct 2026 23:58:59 +0100
Message-ID: <20261031225901.3200167-2-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031225901.3200167-1-sebastian.wick@redhat.com>
References: <20261031225901.3200167-1-sebastian.wick@redhat.com>
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

VKMS ConfigFS devices can be disabled while userspace still holds open
file descriptors. Using drm_dev_unregister() leaves the device in a
state where ioctls are still accepted but internal locks can contend
with the teardown path. Specifically, drmModeGetConnector() triggers
fill_modes which acquires mode_config locks that contend with
drm_atomic_helper_shutdown().

Use drm_dev_unplug() instead, which marks the device as unplugged so
the ioctl layer rejects subsequent calls with -ENODEV. The previous
commit added drm_dev_enter()/drm_dev_exit() guards to vkms callbacks,
so synchronize_srcu() in drm_dev_unplug() properly waits for any
in-flight operations before the teardown proceeds.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5a640b531d88..716f9c966c21 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -259,7 +259,7 @@ void vkms_destroy(struct vkms_config *config)
 
 	fdev = config->dev->faux_dev;
 
-	drm_dev_unregister(&config->dev->drm);
+	drm_dev_unplug(&config->dev->drm);
 	drm_atomic_helper_shutdown(&config->dev->drm);
 	devres_release_group(&fdev->dev, NULL);
 	faux_device_destroy(fdev);
-- 
2.56.0

