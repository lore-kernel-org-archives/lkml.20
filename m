Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4DC443C21
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240195; cv=none; b=jOCbgQA+9dmQy0rZkVMRxjLM4rRT2x9a7O5oQjsODnsbZWuNV60Exji+HqCo+FKCjLKIwEM5xXiT1QmkpR6xVZcGD64WL0mFS7o+V3SGSboqa4xuXk6xW0qD0NfxaL+L7dVl7673FmMMg9oTgVY0KfVLTNT7AeyA6iIL255nKuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240195; c=relaxed/simple;
	bh=eLIV7GBDyUXW1GE0yyrhPOJcVmO1w3FP+tbKIHaKPxY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=li7s5W1GQjzyBg/i7SvgNNqHjFAdbW830Mg97Zk5hwFySXrkmlYp6TCbCpIAnj9gpd7hYbF69ks7cYWXhz+tj53YLkETpvczle63OXRINvEETHqTOR+m7mm0UsLyWXAuiY+aD8OVWgsUP9kMsy4tfjH14vyzM+xu7GvpuZc9KWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RwKFHK3f; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RwKFHK3f"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so26208765e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240191; x=1790844991; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hETdWP+28Kjop3TWViNya7dV2FwGxiafVK/A/I1RaCA=;
        b=RwKFHK3fuXEcbjCEJ4H/JPCxdxCyI9oFU8GGDXaPlkKzdP9ZtFBt8f+uKT9lbDWtch
         ZXi5fYPScsMQWEb1/fiOPDCCspkThLjBR83cRqsfbKTOPp5F8uf1NuID19AFiADyuwCx
         axjs4tFBQRpBxiYNNsOGjNod1EBDwOEHJFoUltEIZOmoPFgB/vm4N/WiiA8YDcNl8lnI
         xrBwg0Tw+v2tP+9XDUQi9MJBoilzglA5y9HJSaDJ6xHlfZ3UsWKHMWZDq6EF6H6qcsrQ
         te6lcs048De/2fq9fvH7pZgCMDynZi7Flv2PcmYivJrkTAsbiM+kAXvW53x29l9uEkkI
         L87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240191; x=1790844991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hETdWP+28Kjop3TWViNya7dV2FwGxiafVK/A/I1RaCA=;
        b=vIsOUTOsc7T4v8K9wgWrRUV33dKD19U3ybwgkSUO+xS5ChrE+6vxl8B4YTFqeNPwmw
         Unfm9eAkG8Vf6nLBHVC9500Lu/mbrqWqma2iinjf5dxTcf1SNfrK1Av/FHsTHdG/IYFP
         JwKv1+yxFFzYnn7enlVveRLC2Z6NiDhLpnvzFPzN1wRZpw1m3z5q9G+HoJNhNNqzXqxQ
         evy3AtvsUDcmGLqrbMM7FFJdzd3GFulYsfaYUza+pq4i2OyeURyWIjHUZ6hozFPLHoI4
         l4OYgcsCbU+nlOLg20CJ0tB6WbSg5zRCpeLTMlrKxuBZSwWUnyMpw5PWBd0dpUnShDrA
         arSA==
X-Gm-Message-State: AFuF++nYUlq3kW9yA+f0FJf69hp6AQ18GBNJV9pISOaK+UNKwUhWmPgV
	MFLUJyG2IEq4bHGoRb6McFfH1W2/zWCQNFgLf/AoGLGnmV9GAN+yvWUtBhRW7OUG1klnzsCIiTs
	47Y8VJgx08b5DQdamx+yhFmEvEIgYueiVwVJmsPWf8r0apUM1XNPWzxuyNqoZ5qWbdlobl/6hsI
	AvUjMZfdRPziWZ+6RZYbOU4MiL3HSSbsXc9QhR7EjBXRryFrBvGLfynGc=
X-Received: from wmjv7.prod.google.com ([2002:a7b:cb47:0:b0:49f:e95d:f21a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d99:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-49fe7b739f4mr19669965e9.15.1790240190846;
 Thu, 24 Sep 2026 01:56:30 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:16 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-6-smostafa@google.com>
Subject: [PATCH v2 5/5] iommu/arm-smmu-v3-test: Fix UBSAN error
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

struct arm_smmu_invs marks its flexible array member inv[] with the
__counted_by(max_invs).

arm_smmu_v3_invs_test() uses invs1 to invs5 which has num_invs = 3
but omit max_invs.

This causes the following UBSAN error:
[    2.333240] UBSAN: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1116:21
[    2.333604]     # arm_smmu_v3_invs_test: lib/ubsan.c:228: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
[    2.334129] index 1 is out of range for type 'struct arm_smmu_inv[] __counted_by(max_invs)' (aka 'struct arm_smmu_inv[]')
[    2.335375] CPU: 6 UID: 0 PID: 155 Comm: kunit_try_catch Tainted: G                 N  7.2.0-g8dcb331fbb72 #2 PREEMPT
[    2.335759] Tainted: [N]=TEST
[    2.335791] Hardware name: linux,dummy-virt (DT)
[    2.336254] Call trace:
[    2.336932]  show_stack+0x18/0x24 (C)
[    2.338443]  __dump_stack+0x28/0x38
[    2.338494]  dump_stack_lvl+0x54/0x6c
[    2.338518]  dump_stack+0x18/0x24
[    2.338541]  ubsan_epilogue+0x10/0x44
[    2.338565]  __ubsan_handle_out_of_bounds+0xb8/0xbc
[    2.338834]  arm_smmu_invs_merge+0x688/0x8ac
[    2.338862]  arm_smmu_v3_invs_test+0xd4/0x598
[    2.338890]  kunit_try_run_case+0x64/0x160
[    2.338914]  kunit_generic_run_threadfn_adapter+0x28/0x4c
[    2.338955]  kthread+0x10c/0x12c
[    2.338984]  ret_from_fork+0x10/0x20
[    2.339433] ---[ end trace ]---

Explicitly set max_invs = 3 on the test arrays to match the number of
elements.

Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 244cf34e5a0b..e52a7d95c919 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -654,6 +654,7 @@ static void arm_smmu_v3_invs_test_verify(struct kunit *test,
 }
 
 static struct arm_smmu_invs invs1 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, },
 		 { .type = INV_TYPE_S2_VMID_S1_CLEAR, .id = 1, },
@@ -661,6 +662,7 @@ static struct arm_smmu_invs invs1 = {
 };
 
 static struct arm_smmu_invs invs2 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
 		 { .type = INV_TYPE_ATS, .id = 4, },
@@ -668,6 +670,7 @@ static struct arm_smmu_invs invs2 = {
 };
 
 static struct arm_smmu_invs invs3 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
 		 { .type = INV_TYPE_ATS, .id = 5, }, /* recover a trash */
@@ -675,6 +678,7 @@ static struct arm_smmu_invs invs3 = {
 };
 
 static struct arm_smmu_invs invs4 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_ATS, .id = 10, .ssid = 1 },
 		 { .type = INV_TYPE_ATS, .id = 10, .ssid = 3 },
@@ -682,6 +686,7 @@ static struct arm_smmu_invs invs4 = {
 };
 
 static struct arm_smmu_invs invs5 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_ATS, .id = 10, .ssid = 2 },
 		 { .type = INV_TYPE_ATS, .id = 10, .ssid = 3 }, /* duplicate */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

