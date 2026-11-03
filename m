Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696502;
	b=2v8X5KS8ub1xclYDJNf2y4yMoLpjlxtateTSzZFSItnAXYI46W9N93yG9Fwyeb76D/8s
	 2bfQ8hzwHpgkZNCqnabJGHXIwXKv8TWUIzWtG/JLST3oySVVzC7Tk6eUNnnYZhCkxrZrc
	 E9XmgaFLfv04lwG6sSEwNPxbDBaxwTYkrvgaolLKAVbRcBKIJV/oHRn/0tfTdLARibj7n
	 GZ+W65S4xh8ypYB+3OXjSGvr9jL27nfB+L1Iq/BLUJgAdGfVxrlC8WYDWpPMuUy1ZUZL7
	 Lb8Ox9KQs2RkuGSaqSJ7BN8VnaFmu8EQlbo7n3s3rHvDtKDJlBf8BoH1svdKQWT3DSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696502;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:From:Subject:Cc:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=AAvT4oaR+HyN+G7lEV1yPMDfRG3OafQ1aTdZbcSjPog=;
	b=HyPnlXAy3k4i97qk+ZoIEpDgurBtD0q07SeloN3KknsvDEAlTXwuCBjwNNG7kgI2aHNj
	 kv/3x/PDyROQ6YvZFw0Nqs0DcF9/NfFTxJ++mPg/w7kpoGNmULQiZ5lIzQyNiOKRt2JPl
	 DP64zffljlKB8TixdDOhshYnYvmPc//jPqBi3i+7lbL10XkfUgoCGgIQn28jdhE3VkUCl
	 s7Q0SfdiIYkQKJ+ATa7agQJO9Sn88EMuU7jf9yOS7vmFIQyIbxDMeU64peHsyz8O1NlnL
	 NdnBAk/GRMTAe47vpGg6+gQYQ4lkSwb6GYRHpUylQsZESoAIazqzJEZv1gijjhaYOCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hdu.edu.cn;
	spf=pass smtp.mailfrom=hdu.edu.cn;
	dkim=pass header.d=hdu.edu.cn header.i=@hdu.edu.cn header.a=rsa-sha256 header.s=default header.b=KT1j+fa1;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCA7606D805
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCA7606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hdu.edu.cn header.i=@hdu.edu.cn header.a=rsa-sha256 header.s=default header.b=KT1j+fa1
Received: from [10.25.10.139] (adaptive-ssl-xc-proxy3-entmail-virt125.gy.ntes [39.170.111.5])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5350805c8;
	Tue, 3 Nov 2026 17:01:26 +0800 (GMT+08:00)
Message-ID: <064da7ba-58ca-4027-88a9-12fb41e8b7d4@hdu.edu.cn>
Date: Tue, 3 Nov 2026 17:01:41 +0800
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
To: ack.rusin@broadcom.com
From: =?UTF-8?B?5r2Y54Wc5p2t?= <242270054@hdu.edu.cn>
Subject: [PATCH v2] drm/vmwgfx: unpin BOs without revalidating placement
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1a0a4549e03a2kunm95a19b8011cb1a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU9DVhlDSB0fSBoeTB9JS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlIQlVKTEtVSkpKVU5ZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
DKIM-Signature: a=rsa-sha256;
	b=KT1j+fa1v4x30RLRI9lyHgJnG6ysskUGLpJLz7rJk0ItRg8pijnJZxdijNFTFibbDPodQahxvlt+vaFktlYTsJKUQaurS2bsN1wzITC+dXKMC31QE9vq7hOm56dZGqumLhiFIMDNY/JO0wtnyj0cVbmorSl7YKyH4zvRrk4lxJI=; s=default; c=relaxed/relaxed; d=hdu.edu.cn; v=1;
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

