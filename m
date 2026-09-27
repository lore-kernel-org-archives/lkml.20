Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3AD3CEBA6
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790497651; cv=none; b=fWnv0w0gz14t3iWD5O6HoLv5z5Kd7Ojz+BVVdZMTb7qXJpjTYxx0H8qs+4xfap0POjvolRnXwqDlVFdXBD2MX8J2OXHn5TTRTycrbpgN+v3MONeKJK2apNVPmGFCUsS7oCI09PrYO7VGYQKof6ojZmcFG2wlnunqfqdyGNVTeXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790497651; c=relaxed/simple;
	bh=HrwOmXS5hrcCRGhdUP4omU8kw29MDnsjLNA6PwRxsOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pq4KMGhldfDpMt0FH5difAz/lFNStZ+yGBc6+cTp5sLnBGOwwrp8eOAhkj5DpebG+bDmFOCJ3o4un3TRKtesJwuyMfkJOIwdoYOU65UOorkBJjuvRAXXvjPeeeqE2YvsdEwtoGdkZn6/9Y/ECtJEsP8J14Jj6vR2Atjynd14VWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpmtGSn5; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpmtGSn5"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso1713981a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790497647; x=1791102447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4U13ItbJ0ZD2xH3wybFDs4byUeHHQl2NVsga6UTsOc=;
        b=EpmtGSn58hKh57C0mUa3UVKCwaBulu5q9PygPaGBTFgw5kD4PMzJOlTTQNCmjFu/NG
         +Bw25tn6STOG6g0aMkXj4lZKbe+2L23r8gzfMfkWc4iN1GKNCKv5uITpyVooDmObIlf1
         3T9E3un7s9b9I0xc3sO8hLph4Unr+wnsVmslZUug7UBz/sbg2NI1CV3TeTwlJjMYQ4ZA
         XIpGWSiWFuLiQWhDNzOMH0MFcv5UZdHvNUFG2y8SkoecGamIzXJAc0BZ6JS2tKHm8tNX
         swW2t8dMJOQgjdv2G7zecC8QtiZqXrispShKso7BuRpEXQo+HEmG/ylLgzUrwxhtUgvL
         BwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790497647; x=1791102447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4U13ItbJ0ZD2xH3wybFDs4byUeHHQl2NVsga6UTsOc=;
        b=bmY4Uu51Ds6oxxBYKyhuXgZy342nUkvrZa7S7l1oBmykjj2N8ZzTgyjSeI//Bpuh/D
         o/3JyL11F24H1S2bkttpCUGI5fqri/wFXHRhrFQOxepXSuf4cUvoLjtO6x4MepiIL5xI
         MzhXRS9P8RUIgX4C8tW9gpt7RWq2f6TKbZoJ2IAPync9AfAaTiZcuSvxgBDrv6Yv4WAW
         970wqrEZRiPzsk/XZCd+ZGCTtvblycaGaLkdWvMga+1y15DEUA7Q2IRT+vHUn7Hp9iC3
         u31NZ5vOZzTZ9tXJvVAjRQW71jH8u88CpGzOW5W1oNZt/TuL99PT89LXnrmQFHZIERjY
         9TQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEAakuJNLTe6UJqBKMBVB6YaDBzlP2qE2fW9STX83KFzgEr7pfXDOsFxpyU+msGq4KP5bbjDD5E2fmHAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYaAXOcm1VsteepOiyAo2HO1MnYMXjOncmYDAHjRK+O3Hsbkb9
	SUbSCYUEnmPlidUw+Bh8+bzbtuYlIIoXEKSgq71iUuj5a/+Y+qkYn4eX
X-Gm-Gg: AYBFou23lzyKw/z2bqYJNMrslebgbkjatKasRJ2aucJSMOkAzFi4KbOTEATclYvxb6D
	m+340bRQZeuzoUb8owCOOGpfb9CI1IE8+okWQmLe+iHoIntihCueipEJlE72BZTV7q2XCa0APh0
	IGZThar/e+/zH6F1JRCvDDMY/jo3LiFjDbeTI22X0Zk4fsP3+9X1rVeVgPqRqwKDX8XsymeMXs/
	btxQcbxLNMUyetPU6Elnh0a9lfW/V8E8yUMnggUGr1HyKw2jVPavfRvvHCAw4e7PyKJGyEbehRA
	cXFNohVob3CSEAF7CFFXvo8ZWPiwi20zxSud+Gm+qYPD3HqUmsO5E7CUKA3IxI0Bj9Lj07nQ9Uu
	mmlbvx+sMX87o4uYTMbhlQuTrKAl9vioTOV5BBxPvOQCruPmG8+9oFmDEkE1XR0Grt4IrH8EJLZ
	ty4GWgOQy9NOkzAk80Mrb8rY8ZAU2ZCJM/iYUiwKpPSQH7jwwdif3PabpKqKwRP5E=
X-Received: by 2002:a17:90b:39a7:b0:3a0:bbd8:5b9b with SMTP id 98e67ed59e1d1-3a0bbd8792cmr5620700a91.66.1790497647218;
        Sun, 27 Sep 2026 01:27:27 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a2b1e4d5basm1921496a91.9.2026.09.27.01.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:27:26 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 27 Sep 2026 17:25:55 +0900
Subject: [PATCH 3/3] drm/imagination: Size page table preallocation by
 device address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-pvr-fixes-a-v1-3-7f5b18ab989a@gmail.com>
References: <20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com>
In-Reply-To: <20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

pvr_mmu_op_context_create() preallocates the page tables a mapping
needs. How many is set by the device-virtual address being mapped, not
by the offset into the object's pages, which it used instead.

Size the preallocation from the device address instead.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_mmu.c | 27 ++++++++++++++-------------
 drivers/gpu/drm/imagination/pvr_mmu.h |  3 ++-
 drivers/gpu/drm/imagination/pvr_vm.c  |  5 +++--
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 3e494bfa936..dd5f6d32864 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -2335,7 +2335,8 @@ void pvr_mmu_op_context_destroy(struct pvr_mmu_op_context *op_ctx)
  * pvr_mmu_op_context_create() - Create an MMU op context.
  * @ctx: MMU context associated with owning VM context.
  * @sgt: Scatter gather table containing pages pinned for use by this context.
- * @sgt_offset: Start offset of the requested device-virtual memory mapping.
+ * @sgt_offset: Offset into @sgt of the start of the requested mapping.
+ * @device_addr: Device-virtual address at the start of the requested mapping.
  * @size: Size in bytes of the requested device-virtual memory mapping. For an
  * unmapping, this should be zero so that no page tables are allocated.
  *
@@ -2346,7 +2347,7 @@ void pvr_mmu_op_context_destroy(struct pvr_mmu_op_context *op_ctx)
  */
 struct pvr_mmu_op_context *
 pvr_mmu_op_context_create(struct pvr_mmu_context *ctx, struct sg_table *sgt,
-			  u64 sgt_offset, u64 size)
+			  u64 sgt_offset, u64 device_addr, u64 size)
 {
 	int err;
 
@@ -2362,18 +2363,18 @@ pvr_mmu_op_context_create(struct pvr_mmu_context *ctx, struct sg_table *sgt,
 
 	if (size) {
 		/*
-		 * The number of page table objects we need to prealloc is
-		 * indicated by the mapping size, start offset and the sizes
-		 * of the areas mapped per PT or PD. The range calculation is
-		 * identical to that for the index into a table for a device
-		 * address, so we reuse those functions here.
+		 * The page tables needed are set by the device-virtual range
+		 * being mapped: one level 1 table per 1GiB region and one
+		 * level 0 table per 2MiB region the range touches. Tables that
+		 * already exist are not consumed, so this is an upper bound.
 		 */
-		const u32 l1_start_idx = pvr_page_table_l2_idx(sgt_offset);
-		const u32 l1_end_idx = pvr_page_table_l2_idx(sgt_offset + size);
-		const u32 l1_count = l1_end_idx - l1_start_idx + 1;
-		const u32 l0_start_idx = pvr_page_table_l1_idx(sgt_offset);
-		const u32 l0_end_idx = pvr_page_table_l1_idx(sgt_offset + size);
-		const u32 l0_count = l0_end_idx - l0_start_idx + 1;
+		const u64 last_addr = device_addr + size - 1;
+		const u64 l1_count =
+			(last_addr >> ROGUE_MMUCTRL_VADDR_PC_INDEX_SHIFT) -
+			(device_addr >> ROGUE_MMUCTRL_VADDR_PC_INDEX_SHIFT) + 1;
+		const u64 l0_count =
+			(last_addr >> ROGUE_MMUCTRL_VADDR_PD_INDEX_SHIFT) -
+			(device_addr >> ROGUE_MMUCTRL_VADDR_PD_INDEX_SHIFT) + 1;
 
 		/*
 		 * Alloc and push page table entries until we have enough of
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.h b/drivers/gpu/drm/imagination/pvr_mmu.h
index a8ecd460168..7088f80805e 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.h
+++ b/drivers/gpu/drm/imagination/pvr_mmu.h
@@ -99,7 +99,8 @@ dma_addr_t pvr_mmu_get_root_table_dma_addr(struct pvr_mmu_context *ctx);
 void pvr_mmu_op_context_destroy(struct pvr_mmu_op_context *op_ctx);
 struct pvr_mmu_op_context *
 pvr_mmu_op_context_create(struct pvr_mmu_context *ctx,
-			  struct sg_table *sgt, u64 sgt_offset, u64 size);
+			  struct sg_table *sgt, u64 sgt_offset,
+			  u64 device_addr, u64 size);
 
 int pvr_mmu_map(struct pvr_mmu_op_context *op_ctx, u64 size, u64 flags,
 		u64 device_addr);
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index c5ae0b79fe6..7bb58ca14e4 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -276,7 +276,8 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 		goto err_bind_op_fini;
 
 	bind_op->mmu_op_ctx =
-		pvr_mmu_op_context_create(vm_ctx->mmu_ctx, sgt, offset, size);
+		pvr_mmu_op_context_create(vm_ctx->mmu_ctx, sgt, offset,
+					  device_addr, size);
 	err = PTR_ERR_OR_ZERO(bind_op->mmu_op_ctx);
 	if (err) {
 		bind_op->mmu_op_ctx = NULL;
@@ -318,7 +319,7 @@ pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
 	}
 
 	bind_op->mmu_op_ctx =
-		pvr_mmu_op_context_create(vm_ctx->mmu_ctx, NULL, 0, 0);
+		pvr_mmu_op_context_create(vm_ctx->mmu_ctx, NULL, 0, 0, 0);
 	err = PTR_ERR_OR_ZERO(bind_op->mmu_op_ctx);
 	if (err) {
 		bind_op->mmu_op_ctx = NULL;

-- 
2.43.0

