Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92D2DA749
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845293; cv=none; b=Cql+GtvEpmmMBYJEG8vK4a5nAIu8E7a+kIPP1VZTtMlR4ZRi4sIFasp2yc38G5seTsJ/Esd0LSRFLh88M+dUx5WuXyY5HbJrZHuhzZsY8HzVHHYuHhAXSq2u9EJOvIR4ReV7CsJpRkCoDTyuQtyryavG7WDB8jSL16kbqbqHXbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845293; c=relaxed/simple;
	bh=S93x5lRbBHs3Jz5fgHUjioUkgHAUFDpBhn8VahZYgYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bbru3wFcZQjw3uAa/cjQ2E5RLOKlJIi2oa05C3Gy3DHtVrky7nKdIDxGEcE5UtLkFZ0hg8zFg2EKSkdA6MAU5an017JXjNtFAyTD4QqXwGJ5/QUJysjHdDlZzGx93/9QcXvEgITggDKikbOa/DgfiY5nAgUqEfx3j+cgTnZoMdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHkiyqpO; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHkiyqpO"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso2263431b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845291; x=1790450091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAqeDikABbbTxXlk49pMk54KvpCy8asTCN/omRY6bwY=;
        b=mHkiyqpOBa712/RntifQWD329IsWCjVsRmJvnW/0pNekWavIYl2o16c8mwi4GECEtu
         Ukr8sppjEw01w1moAK+W4RfI5N6lATcClOl+yJuN/wV+7OqaUKlXuREE5Q2wZF1D4py1
         tGLQPtRtXI10NgEJK1WIXMjvpJo5JUhRXd4SEbLU8m6+Nez0girLxErKpLv0WVR/3D2/
         E5ui0+zBo21zpyrJxiEXfetjG8Yl4IBz+KS3BGOqlJA74CJ1Ryku/TXdMpHF1hktiLZU
         lctZt+UL9mTx4D6x7KKIkG4uoUb6IDAAu2YLDlFExWa5KE2cwW1GolGnkUNJ11O/BOJC
         Ji6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845291; x=1790450091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAqeDikABbbTxXlk49pMk54KvpCy8asTCN/omRY6bwY=;
        b=Uew/IkEX3sTPv++EhS7Pi3gIH2Bqw2g2VBgNC79anCgOLBhxM0pM//C6LjATCZBah6
         5LRCza0he4ykxx3MmFaM60CA2vZNvShK4MKayR2Ku69jrtTXwLldOAog5xWg84ZKeu9j
         m2bf+CSoVem8XfWehQ872Q53n8BAeUK4ELTkclbGosqNhfJevugR7uqjeZyQmZyzyX4U
         q+fOg20BmFETx1Bsev2w9pjMpWTm7lB+RAcZ7jaKGjui2bZsQKwunVeIFVb5NaCf3ZRo
         e4G/MleSE2YO+Do1fIqihiA+bcxUYKKx/qQ8fBuSHQag1NRGnyNbUxVOFPoauAdU2ft9
         e3Hw==
X-Forwarded-Encrypted: i=1; AKwUvBx1Aaj3SfDEcAHCABuSnRJu4groxsYE/EVbBcvagzyvzWxTzq+/MVLmqVbvU/bs5afzM9u2owhU8cEvmQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++liBCT0tMuygGq7Rfd+GYoeMttB4yK7zla559nI/J7kjTnUeSF5
	c4HKlFDr4PJcYuvPVl3aE41XkaVIFAKTcocrm+rG7ibDxAP+4wlTi9UaewqmoUIx01Q=
X-Gm-Gg: AYBFou0gPaTaWFHEPtqvzVlWqo4ppvvHAa5oWdT0zHtyBYpMHbh4xXhcGn8/9WRTkrM
	fVmle1DyzhTmuVznMk1u4PkMHDvyZBH72YJDXToZGJGpVqfMQ1zTQupKokIhRPRmARVFRTxZx+p
	mScpijBPzEG31KaTVaSuXWTPTYaziow7/5tEic5Knh/6vpYCRAD/vAbteh0rUeTUEHWmfil7JVv
	9rmNrlyWK8wAnmfrKda5vNSPBREGSvIwoLNRrCmmNneV72I1jliwV2ZdtPaPfcesIuJ4zZ2Q4XK
	sLdumzyd38LfdDNw36kEE6xrmjScLMwqymaVwkXM7la/m3lpzClAPRmuy5L4aTGAYRMjENkRFzR
	TmCC93yyzfKouobA8Su80hXk1kEBRW/plGnwAQaLfhUoNd+iNIEqz7y34T6IbCnTb/h0gCQfV2E
	wCqctrRf1YLTdxZBYKxiwrP6wUZlI52stDaGVTIgZDxfrGrh6kD24Oqxja7JnyBUPcCpzdj+Ni
X-Received: by 2002:a05:6a20:72a1:b0:3dd:85aa:4530 with SMTP id adf61e73a8af0-3dd8c5c8675mr11309860637.34.1789845291233;
        Sat, 19 Sep 2026 12:14:51 -0700 (PDT)
Received: from G15-5520 ([103.206.144.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm8440128eec.8.2026.09.19.12.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:14:50 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] drm/amdgpu: replace kcalloc() with kzalloc_objs()
Date: Sat, 19 Sep 2026 19:14:30 +0000
Message-ID: <20260919191432.99342-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kzalloc_objs() instead of kcalloc() to simplify object allocations.

No functional change.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c   | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c     | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c      | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c      | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c      | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c      | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c       | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c     | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c    | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c       | 2 +-
 18 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 132d054900b5..3ffb0f5f7574 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -420,7 +420,7 @@ static ssize_t amdgpu_debugfs_gprwave_read(struct file *f, char __user *buf, siz
 		return r;
 	}
 
-	data = kcalloc(1024, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_objs(*data, 1024);
 	if (!data) {
 		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		amdgpu_virt_disable_access_debugfs(adev);
@@ -1267,7 +1267,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 	thread = (*pos & GENMASK_ULL(59, 52)) >> 52;
 	bank = (*pos & GENMASK_ULL(61, 60)) >> 60;
 
-	data = kcalloc(1024, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_objs(*data, 1024);
 	if (!data)
 		return -ENOMEM;
 
@@ -2035,7 +2035,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 		return -EBUSY;
 
 	length = ring->fence_drv.num_fences_mask + 1;
-	fences = kcalloc(length, sizeof(void *), GFP_KERNEL);
+	fences = kzalloc_objs(*fences, length);
 	if (!fences)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 3043ad041bb4..017638dd5491 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -460,8 +460,8 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring)
 
 	ring->fence_drv.num_fences_mask = ring->num_hw_submission * 2 - 1;
 	spin_lock_init(&ring->fence_drv.lock);
-	ring->fence_drv.fences = kcalloc(ring->num_hw_submission * 2, sizeof(void *),
-					 GFP_KERNEL);
+	ring->fence_drv.fences = kzalloc_objs(*ring->fence_drv.fences,
+					      ring->num_hw_submission * 2);
 
 	if (!ring->fence_drv.fences)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 363b99168478..94e39c486128 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -465,8 +465,8 @@ void amdgpu_jpeg_sysfs_reset_mask_fini(struct amdgpu_device *adev)
 int amdgpu_jpeg_reg_dump_init(struct amdgpu_device *adev,
 			       const struct amdgpu_hwip_reg_entry *reg, u32 count)
 {
-	adev->jpeg.ip_dump = kcalloc(adev->jpeg.num_jpeg_inst * count,
-				     sizeof(uint32_t), GFP_KERNEL);
+	adev->jpeg.ip_dump = kzalloc_objs(*adev->jpeg.ip_dump,
+					  adev->jpeg.num_jpeg_inst * count);
 	if (!adev->jpeg.ip_dump) {
 		dev_err(adev->dev,
 			"Failed to allocate memory for JPEG IP Dump\n");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 1a86a47406b1..f257df1c39c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -252,8 +252,8 @@ int amdgpu_mes_init(struct amdgpu_device *adev)
 		}
 
 		adev->gfx.mec.mes_hung_db_array =
-			kcalloc(amdgpu_mes_get_hung_queue_db_array_size(adev),
-				sizeof(u32), GFP_KERNEL);
+			kzalloc_objs(*adev->gfx.mec.mes_hung_db_array,
+				     amdgpu_mes_get_hung_queue_db_array_size(adev));
 
 		if (!adev->gfx.mec.mes_hung_db_array) {
 			r = -ENOMEM;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 00798d80479f..6e8a0cf23d6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4716,7 +4716,7 @@ static void gfx_v10_0_alloc_ip_dump(struct amdgpu_device *adev)
 	uint32_t *ptr;
 	uint32_t inst;
 
-	ptr = kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX IP Dump\n");
 		adev->gfx.ip_dump_core = NULL;
@@ -4729,7 +4729,7 @@ static void gfx_v10_0_alloc_ip_dump(struct amdgpu_device *adev)
 	inst = adev->gfx.mec.num_mec * adev->gfx.mec.num_pipe_per_mec *
 		adev->gfx.mec.num_queue_per_pipe;
 
-	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * inst);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for Compute Queues IP Dump\n");
 		adev->gfx.ip_dump_compute_queues = NULL;
@@ -4742,7 +4742,7 @@ static void gfx_v10_0_alloc_ip_dump(struct amdgpu_device *adev)
 	inst = adev->gfx.me.num_me * adev->gfx.me.num_pipe_per_me *
 		adev->gfx.me.num_queue_per_pipe;
 
-	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * inst);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX Queues IP Dump\n");
 		adev->gfx.ip_dump_gfx_queues = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 0ff5a80aa918..92ff34e38e74 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1568,7 +1568,7 @@ static void gfx_v11_0_alloc_ip_dump(struct amdgpu_device *adev)
 	uint32_t *ptr;
 	uint32_t inst;
 
-	ptr = kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX IP Dump\n");
 		adev->gfx.ip_dump_core = NULL;
@@ -1581,7 +1581,7 @@ static void gfx_v11_0_alloc_ip_dump(struct amdgpu_device *adev)
 	inst = adev->gfx.mec.num_mec * adev->gfx.mec.num_pipe_per_mec *
 		adev->gfx.mec.num_queue_per_pipe;
 
-	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * inst);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for Compute Queues IP Dump\n");
 		adev->gfx.ip_dump_compute_queues = NULL;
@@ -1594,7 +1594,7 @@ static void gfx_v11_0_alloc_ip_dump(struct amdgpu_device *adev)
 	inst = adev->gfx.me.num_me * adev->gfx.me.num_pipe_per_me *
 		adev->gfx.me.num_queue_per_pipe;
 
-	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * inst);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX Queues IP Dump\n");
 		adev->gfx.ip_dump_gfx_queues = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index e2a81a55c63b..59b99dd37c58 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -1367,7 +1367,7 @@ static void gfx_v12_0_alloc_ip_dump(struct amdgpu_device *adev)
 	uint32_t *ptr;
 	uint32_t inst;
 
-	ptr = kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX IP Dump\n");
 		adev->gfx.ip_dump_core = NULL;
@@ -1380,7 +1380,7 @@ static void gfx_v12_0_alloc_ip_dump(struct amdgpu_device *adev)
 	inst = adev->gfx.mec.num_mec * adev->gfx.mec.num_pipe_per_mec *
 		adev->gfx.mec.num_queue_per_pipe;
 
-	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * inst);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for Compute Queues IP Dump\n");
 		adev->gfx.ip_dump_compute_queues = NULL;
@@ -1393,7 +1393,7 @@ static void gfx_v12_0_alloc_ip_dump(struct amdgpu_device *adev)
 	inst = adev->gfx.me.num_me * adev->gfx.me.num_pipe_per_me *
 		adev->gfx.me.num_queue_per_pipe;
 
-	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * inst);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX Queues IP Dump\n");
 		adev->gfx.ip_dump_gfx_queues = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c
index e49d8a79045c..db6b8d18bfab 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c
@@ -1278,7 +1278,7 @@ static void gfx_v12_1_alloc_ip_dump(struct amdgpu_device *adev)
 
 	num_xcc = NUM_XCC(adev->gfx.xcc_mask);
 
-	ptr = kcalloc(reg_count * num_xcc, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * num_xcc);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX IP Dump\n");
 		adev->gfx.ip_dump_core = NULL;
@@ -1291,7 +1291,7 @@ static void gfx_v12_1_alloc_ip_dump(struct amdgpu_device *adev)
 	inst = adev->gfx.mec.num_mec * adev->gfx.mec.num_pipe_per_mec *
 		adev->gfx.mec.num_queue_per_pipe;
 
-	ptr = kcalloc(reg_count * inst * num_xcc, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * inst * num_xcc);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for Compute Queues IP Dump\n");
 		adev->gfx.ip_dump_compute_queues = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index c3322058720f..2accca6552e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2190,7 +2190,7 @@ static void gfx_v9_0_alloc_ip_dump(struct amdgpu_device *adev)
 	uint32_t *ptr;
 	uint32_t inst;
 
-	ptr = kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX IP Dump\n");
 		adev->gfx.ip_dump_core = NULL;
@@ -2203,7 +2203,7 @@ static void gfx_v9_0_alloc_ip_dump(struct amdgpu_device *adev)
 	inst = adev->gfx.mec.num_mec * adev->gfx.mec.num_pipe_per_mec *
 		adev->gfx.mec.num_queue_per_pipe;
 
-	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * inst);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for Compute Queues IP Dump\n");
 		adev->gfx.ip_dump_compute_queues = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 522981fa182d..edf36e5a3b9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -946,7 +946,7 @@ static void gfx_v9_4_3_alloc_ip_dump(struct amdgpu_device *adev)
 
 	num_xcc = NUM_XCC(adev->gfx.xcc_mask);
 
-	ptr = kcalloc(reg_count * num_xcc, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * num_xcc);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX IP Dump\n");
 		adev->gfx.ip_dump_core = NULL;
@@ -959,7 +959,7 @@ static void gfx_v9_4_3_alloc_ip_dump(struct amdgpu_device *adev)
 	inst = adev->gfx.mec.num_mec * adev->gfx.mec.num_pipe_per_mec *
 		adev->gfx.mec.num_queue_per_pipe;
 
-	ptr = kcalloc(reg_count * inst * num_xcc, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, reg_count * inst * num_xcc);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for Compute Queues IP Dump\n");
 		adev->gfx.ip_dump_compute_queues = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 20c8ebf0e159..0160e0b05bf7 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -1926,7 +1926,7 @@ static int sdma_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
 	}
 
 	/* Allocate memory for SDMA IP Dump buffer */
-	ptr = kcalloc(adev->sdma.num_instances * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, adev->sdma.num_instances * reg_count);
 	if (ptr)
 		adev->sdma.ip_dump = ptr;
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 6fe3d3d56c40..144280dc7583 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -1531,7 +1531,7 @@ static int sdma_v4_4_2_sw_init(struct amdgpu_ip_block *ip_block)
 	}
 
 	/* Allocate memory for SDMA IP Dump buffer */
-	ptr = kcalloc(adev->sdma.num_instances * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, adev->sdma.num_instances * reg_count);
 	if (ptr)
 		adev->sdma.ip_dump = ptr;
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 1ca0e7f65442..0a2acd7a5f2e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1434,7 +1434,7 @@ static int sdma_v5_0_sw_init(struct amdgpu_ip_block *ip_block)
 		adev->sdma.supported_reset |= AMDGPU_RESET_TYPE_PER_QUEUE;
 
 	/* Allocate memory for SDMA IP Dump buffer */
-	ptr = kcalloc(adev->sdma.num_instances * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, adev->sdma.num_instances * reg_count);
 	if (ptr)
 		adev->sdma.ip_dump = ptr;
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 81f1e9882177..43aab715a061 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1352,7 +1352,7 @@ static int sdma_v5_2_sw_init(struct amdgpu_ip_block *ip_block)
 		adev->sdma.supported_reset |= AMDGPU_RESET_TYPE_PER_QUEUE;
 
 	/* Allocate memory for SDMA IP Dump buffer */
-	ptr = kcalloc(adev->sdma.num_instances * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, adev->sdma.num_instances * reg_count);
 	if (ptr)
 		adev->sdma.ip_dump = ptr;
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index cf3d2997fff8..92f5243e4a7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1363,7 +1363,7 @@ static int sdma_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
 	}
 
 	/* Allocate memory for SDMA IP Dump buffer */
-	ptr = kcalloc(adev->sdma.num_instances * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, adev->sdma.num_instances * reg_count);
 	if (ptr)
 		adev->sdma.ip_dump = ptr;
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 69cb89298a3e..2bf783422ec2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1345,7 +1345,7 @@ static int sdma_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
 	if (r)
 		return r;
 	/* Allocate memory for SDMA IP Dump buffer */
-	ptr = kcalloc(adev->sdma.num_instances * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, adev->sdma.num_instances * reg_count);
 	if (ptr)
 		adev->sdma.ip_dump = ptr;
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
index 18366e16ef3f..2d97fc9e0d66 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
@@ -1333,7 +1333,7 @@ static int sdma_v7_1_sw_init(struct amdgpu_ip_block *ip_block)
 	if (r)
 		return r;
 	/* Allocate memory for SDMA IP Dump buffer */
-	ptr = kcalloc(adev->sdma.num_instances * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, adev->sdma.num_instances * reg_count);
 	if (ptr)
 		adev->sdma.ip_dump = ptr;
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index e9d790914761..393de1399328 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -202,7 +202,7 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
 	r = jpeg_v1_0_sw_init(ip_block);
 
 	/* Allocate memory for VCN IP Dump buffer */
-	ptr = kcalloc(adev->vcn.num_vcn_inst * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kzalloc_objs(*ptr, adev->vcn.num_vcn_inst * reg_count);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for VCN IP Dump\n");
 		adev->vcn.ip_dump = NULL;
-- 
2.53.0

