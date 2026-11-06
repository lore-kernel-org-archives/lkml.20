Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996330;
	b=wiqcDhAaL1WmssPd1v8Jx/zWgyfRB8aNz7Cd3eTGq26jjHbqzRr/qq8Jm+1bZWtwIE//
	 85Csarm6Pb3D0BRfl6hjYfl0+scELio29ekE+SKUrbwmMBYvS2sdkzWtO4/iTF6Mzvh/j
	 D0sawFihOPlrGDzhIWCJZm57zZeHczEVpxp9ybLUi6AN2jRjBkfqN5Ip01V21voQBBqOh
	 2aoD+tKXnTTAIXKEU9jKdpiGEcC0M6aGsd6AXVoy3jio2SVUfigCyDGyBbEtx77QryvU8
	 FUya8iKCldaj44HYiCvNfrTTngQv0N3I1HZatH+IEnlNls4r6zlFBfK5jvJk1ohf4sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996330;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yvGijX104BETM0CdrVmMlSs43ja1unrM31QId/X2X6M=;
	b=L71uneRKfvgBiFYDUwnzenohiOUQJ6D0W7c+sNWt1XCKFo9ZGh+aVUNX665piahucfpk
	 B4OlaiS7nbnMUCUJTSz3cOBQt2uhAe8iMtyr8/i8yiiDudslf1bDVTTCNn/EHIhxgnnBC
	 R4saktTuawOtc8yPa0S5a9pE/kABPHVnicPJjAjtL6pyB2BQUitOR2+mWWNJZDiprKk8y
	 InDvpa6XDfrksIOgmBn92ocWsFZMG8IJtdnd13J7/8D0sIdgXrTY4J0C1YKLP0aUpSMnz
	 n03/pk1s7HfLmFoD4ITCKZmkGPyvpXHW3lAKKLdaUAhiDynpR7Jkxs8CE9Xm/8FiNhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jLEhCmgB;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E55606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E55606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jLEhCmgB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793996328;
	bh=BVsbCP7VqTFCT6SRxxFnhfIQzfF14Yh2kgAKnHLQtg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jLEhCmgBPR/s938BKJcGd8KJUbiznoxxmrXL4a+z5hu/kpzgG/bOo4KZG1rYkx4vn
	 Fut4ynUn5ispg67nOVUXaK/zZs36/qkmT2E49oROyo1/bQn/z0cy/X1AAx5IrvlvrP
	 sEIAWBZI5WhszfzBkMS1KmgYnFQ2xeh4yNtwJWRW7LWQ5vVxRv7f1xDzuynCQGrLug
	 yv6dzHrR4j21fgUTI6SX17ovIPE/kQkTp09vuPe4Hm/Sh+vPKBVC8LK39ngOAXnjsE
	 uBJY49tfdbVuUeZQu2SItkclwntLwwbbC3A2TjPx6xxJ/v805aNAdVfnOWFqNYDz9O
	 RaF+BnfTLJYFQ==
Received: from archlinux (unknown [100.64.1.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: leandrohrb)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FBBD17E0885;
	Fri, 06 Nov 2026 21:18:43 +0100 (CET)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	alex.hung@amd.com,
	daniel@fooishbar.org,
	hamohammed.sa@gmail.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	melissa.srw@gmail.com,
	mripard@kernel.org,
	pekka.paalanen@collabora.com,
	robert.mader@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 02/12] vkms: properly compute gamma LUT size in vkms_atomic_check()
Date: Fri,  6 Nov 2026 17:18:03 -0300
Message-ID: <20261106201813.129911-3-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
References: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
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

Gamma LUT size is being computed wrongly, dividing blob size by
sizeof(struct drm_color_lut *). But the blob is an array of struct
drm_color_lut.

Replace sizeof(struct drm_color_lut *) with sizeof(struct
drm_color_lut), properly validating the userspace gamma LUT size.

Issue caught by Sashiko bot:
https://sashiko.dev/#/patchset/20260804203351.148521-1-leandro.ribeiro@collabora.com?part=1

Reported-by: Sashiko <sashiko-bot@kernel.org>
Reviewed-by: Robert Mader <robert.mader@collabora.com>
Tested-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 86a8a95694fd..28b99511f186 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -112,7 +112,7 @@ static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_commit *s
 		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
 			continue;
 
-		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
+		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut)
 		    > VKMS_GAMMA_LUT_SIZE)
 			return -EINVAL;
 	}
-- 
2.56.0

