Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183502;
	b=n9nwy56qRV2nb5CUhRZHiB/vFtqBQ/VnIGFRdPg6Wxbg4tWyMknEc77HcuRyXsiP2dLJ
	 agFU1JXNQRQYiMQe8qQ3rWkIp1VC6s2jTqhN4vor0Higpi6XUCTgtc07GnwR/srvD78Cb
	 a0x4jU4lUgZcQxlyB5B7Txv3INbDsbMTjqdcscXe/Ic7VB245myhOim4zHmA8NERFZF4j
	 mXbRuUapYNaqUdFHFoRLa1kaJFIBs9ZEXhi6vwPCYtu1CSQtHGuAMMAklMRYi9YaTe03K
	 1/LYjpxvj3GFKz9q5jqrQYw7G05bbGG6IegDQhOBmjnhSThseMVSzZLZ+10u2/5Im9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183502;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PfEI1YUa/HhHcLyCA1iZ77nrn1ZFqkyErvh1cXMHDSs=;
	b=02+V28doLTNa+gf8jkIRjqjvogINqgTaatBzY0bUJ4NEtIg8kT/SmeHAFSOhqm73WQWz
	 ZgVSPgbzeay91h/Z9tPrdow2AIE2ehwJEL/O1hLtmk1/F35OHNVxcOhZ1vjGey4Rn5Yu7
	 fS00udrAJUXVdjtNzSXZ14miN7UnDGgdLqYRDoxC0guuOM7DZyBNAu980mXEiNeC+YY2F
	 N068r0eC7wDPgfulKcts1lDceJ2l61MXWY//l1IGLZcL6rFx3JvBEDupgJbP3PVIf7T4i
	 6Prd6LAYoA/+RHEbzJDWXJpaPdI5DvDbxgGZd8fSi/9ouAKdsyYh8UWhOW0shp9SnYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MY8Bz2nL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C5606A31A;
	Wed, 28 Oct 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MY8Bz2nL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8751F01828;
	Wed, 28 Oct 2026 10:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793183501;
	bh=PfEI1YUa/HhHcLyCA1iZ77nrn1ZFqkyErvh1cXMHDSs=;
	h=From:To:Cc:Subject:Date;
	b=MY8Bz2nL+PTd899FTbwG4Iy8SvwsF4kA8O4XR35dIlvoxnDhGB6PtSq5MXfdjNsEi
	 JVkPv97O0vBR06J+Rv1kaowstEbGljr7XhCjORwOtYfUd9la54cosiY8NWbfPeW0AY
	 xygn4yLlSnIdBP/ftYfrNemp6xcRdJQ/Wbdpaa8vdK7k6wN2AJjt654yqcMXmkwOwz
	 o3V1bYMQeYoL03D2vpS2TICjHzDSa/zRI5Yv2hT6ETvW6cTyzlzy6XRcCIZKkQCf0i
	 Si/Fi0gcHq31Rqe0lE92gnC3xSuX804jh3A4TqkVAP54u6Iv3pnsFOt/XDwi4/Yadn
	 cJ/uMcMiduZ1Q==
From: Philipp Stanner <phasta@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 1/2] drm/etnaviv: etnaviv_fence: Put base class first
Date: Wed, 28 Oct 2026 11:31:29 +0100
Message-ID: <20261028103129.1036380-2-phasta@kernel.org>
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

struct etnaviv_fence contains a struct dma_fence, which is its base
class. The base class should always be the first member of a class.

This allows for removing a deprecated callback in a subsequent patch.

Make struct dma_fence base the first member of struct etnaviv_fence.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 5c23182f4d33..e51a310c8d70 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1148,8 +1148,8 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 /* fence object management */
 struct etnaviv_fence {
-	struct etnaviv_gpu *gpu;
 	struct dma_fence base;
+	struct etnaviv_gpu *gpu;
 };
 
 static inline struct etnaviv_fence *to_etnaviv_fence(struct dma_fence *fence)

base-commit: 731ba09867520c047c7de53f92e384808e0b638e
-- 
2.56.0

