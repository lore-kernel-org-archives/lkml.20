Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05664BCABD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862004; cv=none; b=SllJX93eGCK1mmhRYz4uKWZqhlyJjmRYpxM2ljWDC7VDjamsYd+UhsfIAkEuh+i1UgS88ZZk81cDJlO/4euv9pWb30c1JtlnSTe4fW1MOnLMLnJldSQRztesGi+FaIWZkdjvbnBuxNpk97bWTaJMmppTBXWlcAaNN16UJhnLpes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862004; c=relaxed/simple;
	bh=BSYX37XlJh7PzKSxq2/KGTAnZ2Hi81YSz/GnM54jNvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NE3leEfc53sUKFfTq4vpX64XI7BfqsgzcgNbyEJjoGuolvx0r13jgtZ9GEaGwi3VdfE65dm7G2z+/y8dqEo2fYEy2tfg142NF4DOlnflJUBHxqy7MwFpUmnONyUmvZa3G0e2tZ4+DeTOWx51ZRBm8IpLQ351IhkHgg2sQPQG15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuOZ8VWn; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuOZ8VWn"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso3763111a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790862002; x=1791466802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36wHVkYrC+tsJPWWup994ozux9gG08Y2bixz1oomwOE=;
        b=fuOZ8VWnnsbmWNrJ3YgbBpMoMRDMR5oZzT6KXTlCX4fycwQ5JGLzP3UvCoOuY1Z+nw
         3soy4CJI5VKjUl9Xb0bH0Ei2DhfCeo3oVV8tOy4zAgVraL7DzkrYuehUUywrfNf90J5/
         htdDaDGhc+LVmgVRXuYV0/+N5kQ1taRPk8JENgBCA3lXaKksUj8f+gx5Z6bdVcqqL9aM
         1mnJ0tl0ZrtbPDlaceERf8utWg+tgTSE5driQoFemDkzUNkUVDvYxTCM6peryMuyZ2L6
         hOB1SplSDgdt9pd5R3R0lcZ/RIL/DaaYGUwGFzQwzBXqBpB7wGPs6CWEdFGlP0Zwc7/D
         0HxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862002; x=1791466802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36wHVkYrC+tsJPWWup994ozux9gG08Y2bixz1oomwOE=;
        b=DkUx2i7BRTtRyOVLFy6iNw9786u0cpRHb9FY2U92NaSA94WKvUR+8Ex2hoxLRPIvvI
         tG0gOI/yfUeVChPUqz5wlltU/tRXqZODtRn3MMhOrD9l8l8prM3/TTorUUqy17I6W/tJ
         DBcWrA1Ik48yaPTkiR6QbUcesc8iUfkVJwOVSx5tYh/8qN2LkuAf/LcDx+OXjJxFy6qF
         iLPo/dcR1yUa/NEsTsN+psrj4OtcoTd/DOP1Ap2OL81BlBiJdN6G62biQ1kep47JQLGq
         am7AHQ9xTE2GG/jBZZdxWB3RZ1r2c+MXZayaY2DAP/2IkAfKv2I+flhrs2cx6jN7ZYmy
         9nrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbY1ksGV/yYbPzJ/VxF5P+OOveilXWSmYYK5C4mdH3c1UH/Q3Yjqs6Kk4oLZ1O7V5x+Za4wPtD6EyUbGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDCWPZkqhEXlHbrq6HiKNQaS42Gjs/S2xxLShMEixHn6w22L1s
	YJ32k1uHqC95GGlPvXBlJuwZBQF3fy8YZYIS4ZVFEr+HVVklK9IxQy/q
X-Gm-Gg: AYBFou3zVlPOrtO1v525KCFVH5SsgtY2QBln0lIsyB1J2eKZdKGurfiODWWmQXcSnV3
	U+Qs7pBQVDjNaVk379g0ZGL+Zvivhnfca8E+aqg9bhHk63WzfcGrhJn7/uy22bAha0LXoC7MGmA
	bISqishRzJP5H6KyyjxM171EjFtPr9xTU1TkkhPYP0laMUwd+sz62HVWJEHg0FStDhC0nWRb24h
	J6KZLGFzjiOCE/RTwTbQj8m0L3xcI39n1z/cKFvNDY+RrhI5tC0QcKHEiVOLLn+hrpMQo8DiffF
	mPUlLl1yWBeGDCgfWk4E23nP/QQ9LxOnsMP8mLlR8aMu+la4zmUyj9SmJ7pyBSEbF74xBZ+PYRy
	Cbe1aob3erSO+GqFcOLappEqhnNAb/tXqwM09xM8jkk3Ig53Fux0rlge3ceY412b0wSA/qTvIoG
	zcpRj5se1ZTCPMgObgmhdjvuSHz2aLjVBz1Eahq+S5pueBssaiOQWvDfLXNEDb6IldVOYVNTDyw
	w==
X-Received: by 2002:a17:90b:2545:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a4d18cb4a1mr4364490a91.39.1790862002057;
        Thu, 01 Oct 2026 06:40:02 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cb357sm4673435a91.17.2026.10.01.06.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:40:01 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Thu, 01 Oct 2026 22:39:13 +0900
Subject: [PATCH v2 2/2] drm/imagination: Size page table preallocation by
 device address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-pvr-fixes-a-v2-2-f58254e5dfb8@gmail.com>
References: <20261001-pvr-fixes-a-v2-0-f58254e5dfb8@gmail.com>
In-Reply-To: <20261001-pvr-fixes-a-v2-0-f58254e5dfb8@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

Commit 0a8224058a58 ("drm/imagination: Fix page count for page table for
map() interface") passed the device address to
pvr_mmu_op_context_create(), but the preallocation is still sized from
device_addr + sgt_offset with an exclusive end. The offset into the
object's pages has no place in a device-virtual range, and the exclusive
end allocates one table too many when the range ends on a table
boundary.

Count the tables from device_addr and the inclusive end of the range.

Fixes: 0a8224058a58 ("drm/imagination: Fix page count for page table for map() interface")
Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_mmu.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 62eae7fcd5a..67e73d7d5d0 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -2337,7 +2337,7 @@ void pvr_mmu_op_context_destroy(struct pvr_mmu_op_context *op_ctx)
  * @ctx: MMU context associated with owning VM context.
  * @sgt: Scatter gather table containing pages pinned for use by this context.
  * @device_addr: Virtual device address at the start of the requested mapping.
- * @sgt_offset: Start offset of the requested device-virtual memory mapping.
+ * @sgt_offset: Offset into @sgt of the start of the requested mapping.
  * @size: Size in bytes of the requested device-virtual memory mapping. For an
  * unmapping, this should be zero so that no page tables are allocated.
  *
@@ -2350,7 +2350,6 @@ struct pvr_mmu_op_context *
 pvr_mmu_op_context_create(struct pvr_mmu_context *ctx, struct sg_table *sgt,
 			  u64 device_addr, u64 sgt_offset, u64 size)
 {
-	u64 start_addr = device_addr + sgt_offset;
 	int err;
 
 	struct pvr_mmu_op_context *op_ctx = kzalloc_obj(*op_ctx);
@@ -2365,18 +2364,18 @@ pvr_mmu_op_context_create(struct pvr_mmu_context *ctx, struct sg_table *sgt,
 
 	if (size) {
 		/*
-		 * The number of page table objects we need to prealloc is
-		 * indicated by the mapping size, start address and the sizes
-		 * of the areas mapped per PT or PD. The range calculation is
-		 * identical to that for the index into a table for a device
-		 * address, so we reuse those functions here.
+		 * The page tables needed are set by the device-virtual range
+		 * being mapped: one level 1 table per 1GiB region and one
+		 * level 0 table per 2MiB region the range touches. Tables that
+		 * already exist are not consumed, so this is an upper bound.
 		 */
-		const u32 l1_start_idx = pvr_page_table_l2_idx(start_addr);
-		const u32 l1_end_idx = pvr_page_table_l2_idx(start_addr + size);
-		const u32 l1_count = l1_end_idx - l1_start_idx + 1;
-		const u32 l0_start_idx = pvr_page_table_l1_idx(start_addr);
-		const u32 l0_end_idx = pvr_page_table_l1_idx(start_addr + size);
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

-- 
2.43.0

