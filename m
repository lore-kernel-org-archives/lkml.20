Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696955;
	b=VZNtIaIJV/ex1YKQIAbN6LfkMpgILj/+m/wyaiH+WKKsy2a+nk19lRpoAua+aPY5AE6i
	 DvnbD3qbYceRPJJuGKR43hRiBK8KVnOwRzOkwbuGpIDuv/LB5y0gLMCjlm2nHESvQkadZ
	 oItQmGLeWPoTvbBPwh56j44R/m3NoLxbkb/g2a+avTeyNRXPR2fY6RAU/mtQ7QN9RIDOr
	 TFpwO+SWLSuNk3KYiXyAokYd042+FggIBWaIKWlu5pyVbi2EU3cfqtzltkXKJcNJOTkRM
	 VqksAv/fZ86jlgR0pblDrv4pE7umYPtrw1kmEg3U8iFBEGj7m8aKWNKPazJpVH6RnqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696955;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=AAvT4oaR+HyN+G7lEV1yPMDfRG3OafQ1aTdZbcSjPog=;
	b=nnfaCGwvNsKAzrETbDD+dm51QsaW6v6QcG9uIWzrXaKZd5vYot4v9lwI4Iug/Cu113Vi
	 7Z6/diUkwLhHeZkXTogEKpHXBnkI80lSVOF018DhLhaYBV6bX0L9/Eb+l+P4bMfw12Ed8
	 z/I55LJG5yzXEg9uh/Atr6whhOonsGpdUpHtok9GCnv4IbpgmgpehOhgzBUinesE9khZc
	 IDQn//vdsj8h0Wy0KhV1lHVWuS4BDPM+SSpqifawg0CGim+NQnwvEpNZG3fauspfwH3qb
	 Op1y0XNK8uLb6WIioE/sGghLPcTHq7BWqrJFJi4asjW8RMRYt7UP583KsrN4ThcRu5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hdu.edu.cn;
	spf=pass smtp.mailfrom=hdu.edu.cn;
	dkim=pass header.d=hdu.edu.cn header.i=@hdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Ej2YrPe5;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DF6606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DF6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hdu.edu.cn header.i=@hdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Ej2YrPe5
Received: from [10.25.10.139] (adaptive-ssl-xc-proxy0-entmail-virt174.gy.ntes [60.191.122.35])
	by smtp.qiye.163.com (Hmail) with ESMTP id 535158c75;
	Tue, 3 Nov 2026 17:08:56 +0800 (GMT+08:00)
Message-ID: <93888c18-7ce4-4341-b387-a80a29847d3e@hdu.edu.cn>
Date: Tue, 3 Nov 2026 17:09:05 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: =?UTF-8?B?5r2Y54Wc5p2t?= <242270054@hdu.edu.cn>
Subject: [PATCH v2] drm/vmwgfx: unpin BOs without revalidating placement
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1a0ab2e8903a2kunmaa12480911d197
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGkkZVh1CSkxKTkpMSBkYQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlNS1VKQkpVSklJVUhOWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ej2YrPe5hrR1wG06R1BVSTu2S3HpXAiHo0rutQEUOqosX+G6LnP02aus4mzS8rLyDjeEJI2tMZ33Dx5i+OXubeNgVVRkqRb6hmCzx70/PquVwKHm27nuYf/69IsGdmPKJFoVICbp9/iBwP+XerZU2rvLgaicPlqg2pu7svK0dU4=; s=default; c=relaxed/relaxed; d=hdu.edu.cn; v=1;
	bh=AAvT4oaR+HyN+G7lEV1yPMDfRG3OafQ1aTdZbcSjPog=;
	h=date:mime-version:subject:message-id:from;

Hello,

I apologize for the repeated mistakes in my previous messages and patch
submissions. Thank you for your patience. This version includes the corrected
Fixes tag and an unwrapped patch diff.

Unpinning a buffer object does not change its placement. Avoid calling
ttm_bo_validate() on the unpin path, where a placement validation failure
currently triggers BUG_ON() and crashes the kernel during PRIME cleanup.

Keep validation on the pin path, where it is needed to establish the
requested placement before pinning.

During PRIME/GEM cleanup, vmw_gem_object_unpin() calls
vmw_bo_pin_reserved(vbo, false). The latter currently calls
ttm_bo_validate() for both pin and unpin operations. In the observed Linux
7.3 QEMU run, ttm_bo_validate() returned -EINVAL on the unpin path; the
following BUG_ON() caused a kernel BUG during process teardown.

The path is:

  exit_group()
    -> GEM/PRIME object cleanup
    -> vmw_gem_object_unpin()
    -> vmw_bo_pin_reserved(vbo, false)
    -> ttm_bo_validate() returns -EINVAL
    -> BUG_ON(ret != 0 || bo->resource->mem_type != old_mem_type)

Observed report excerpt:

  [BO_PIN_TRACE] before-validate pin=0 old_mem_type=0 target_mem_type=0 flags=0x10
  [BO_PIN_TRACE] after-validate ret=-22 old_mem_type=0 new_mem_type=0 ...
  kernel BUG at drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:342!
  RIP: vmw_bo_pin_reserved+0x36d/0x380

The change skips placement validation when unpinning and retains it on the
pin path.

Fixes: fbe86ca56791 ("drm/vmwgfx: switch over to the new pin interface v2")
Cc: stable@vger.kernel.org
Signed-off-by: Yuhang Pan <242270054@hdu.edu.cn>
---

Sorry, the previous submission was damaged by Thunderbird's line wrapping.
This v2 keeps the diff header on one physical line. I verified patch
applicability to the clean Linux 7.3 index after normalizing email CRLF line
endings; runtime verification of this exact patch is still pending.

 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9c7a73c..14d28e2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -308,6 +308,11 @@ void vmw_bo_pin_reserved(struct vmw_bo *vbo, bool pin)
 	if (pin == !!bo->pin_count)
 		return;
 
+	if (!pin) {
+		ttm_bo_unpin(bo);
+		return;
+	}
+
 	pl.fpfn = 0;
 	pl.lpfn = 0;
 	pl.mem_type = bo->resource->mem_type;
@@ -321,10 +326,7 @@ void vmw_bo_pin_reserved(struct vmw_bo *vbo, bool pin)
 
 	BUG_ON(ret != 0 || bo->resource->mem_type != old_mem_type);
 
-	if (pin)
-		ttm_bo_pin(bo);
-	else
-		ttm_bo_unpin(bo);
+	ttm_bo_pin(bo);
 }
 
 /**
-- 
2.43.0

Regards,
Yuhang Pan
242270054@hdu.edu.cn
