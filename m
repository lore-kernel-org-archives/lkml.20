Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9892F531B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 17:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234018; cv=none; b=QpKj6gCCZxRncazP6Baoa4CaYNRuv4+D8ky176l8hyGJXCuAnVr62/S9rAAteMALwkrk1OLJKrERN4SckLi+Eld7CsjyPV23Z3PTlEwgxONo8xTBb0UEEWs116fVUclkAovriJlu3Ya0Mkt5L54+/ILMknK1l4lAOoS+EaHmJ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234018; c=relaxed/simple;
	bh=rlJh0u0B5uXaLSRb3Je2heQLBIx1OTDyKuGrvNW7S74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sTZgvfGh2r6MEQ82eIL5strVN/ayW/daHPi6727dpRAcURm8vXSZpy80B5n2cfVHu94bhwKvAYXAQ7VNFb4C6n7ewc8Lzm4jtcDVNoui9o6FsrGVsMz06FL4uPREPK3SWK82BSg+u+M/ECl93M6S+mdNo+hWU511hqAE9nqKP/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ1114Wy; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ1114Wy"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so769462a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789234010; x=1789838810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7izVhFPU5f2Mxv3Dnub39YzR+1KtOurbwyZEjfxW9ME=;
        b=LJ1114WyKjN4OLoNKor/EtXD6ncwNKDmBtfbrA8vvgAQvGEM7U4abKvGv1Tq0kETwE
         ctSzvBgou4B5LM0X24hNsfJ4eKIGW64e7retWYks2B0d2P32DoR84J3GzKZXbU2M1xND
         eTl425Ir9ZhiMoQ+nPFIw/xaz6RMkvokE8QDV3eIcni7QHCqR8TIu4UiON+P0Oj5La8P
         zTdyVUyvs/yM2iVzK+5Cm2NxfMakx5o8o7fcPjJy3TqdpKWAsY4K7si6rHWS+MUc7cSV
         DIgSTFrNYiMgP1xuhm9V4V/IxwzePNv38AUcRy8lYzqXO2tTgTiNB9wLCEGmnkcF9hvp
         BJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789234010; x=1789838810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7izVhFPU5f2Mxv3Dnub39YzR+1KtOurbwyZEjfxW9ME=;
        b=axtYvE3imdnbN27H7Hue+3IWZU8JlNp76fQQzz6cua6QabrKQKATk8mbQY1YNc+e6b
         CAMO0mQobEADddfgY5eQMaH+2MXKMXLAKTUbDurqqiPmVOulr2yd8mHGZpjSkURafklh
         LuZiqvuWuxLTvIei+dFBW+lW5AaNyzP4rEC8PquBSY1o69tqY/5W/83frIJTw1qVGkFX
         dxKsYvJIzERJXEtgaWDVFBqGLQ9fIQdFAbNY647QBZZU2ow85ZvzT3HIRlVU2h4n/w2u
         pQrchtoShFNCj1HYMVMFPgdBVxwVQElzuFhnya1+GV5U2nh1p2jZDBP7JZOBGBuEUM+r
         2Xuw==
X-Forwarded-Encrypted: i=1; AKwUvBx7xDbJWnhb9k6H9ThQxat6NMDdIe79trff4wS/J7SOr9bc9l9hV0UhN1VeStn1na8wZ1kl44tdoIh4XEs=@vger.kernel.org
X-Gm-Message-State: AFuF++mVpB+YtSnUCTTdtyKDB1DDpIBC7HM5/4+X1rPkeVyKe66iP4sd
	qLnjrtui4B1JRrMTd3AvvY+Jdtk8QyM4BIIhx6rElOTPtBaSrdMoQcs0
X-Gm-Gg: AYBFou26KVOOtXh5+TYNGWzBJK0D6U40uj/dmbcXvj8Idqpu7ayB6o2Nz0U40aDBKV3
	EqvZ0dsqyj0RMdYkNac2eoYdEPiepXPqDYnJ/c/5MDTg4HfS6DE1SjbObX2qAnwNM0/Y+f9OyAl
	COrbfryES6FGD7X2nXVNqBklFjN23UIAi2kf1yeQe4EcwcCaaPGVgnM+n+8IS5Wf9GbOPvM3Usx
	1u5rJC4VgGUIqoecTsN88gUXAue4MIN0wGjbS3nCTHs25/VvlR3hzIR5WQbohh4JX8AGPi5SKag
	H5CVYv2P9uyM0BzT861t3NkCKKYmsG7xt20HmyoG0eI7YAcbNICNqDoskau9fU71yCImdSOhMLA
	Jp9F+XeFTCP61u3LKV8hlYIqU/In0ijlOuTUKHsWE+ONGF1DNj1ifvCXOvEJQu76FL52smVovxS
	CdJopXdPj8lI+51DMjJe13zg09x3pHyrLRiQF/q9FlcS87AMblg4KHVmpS270YQCb0Et8BmUNc9
	NRf/PnPMJ0=
X-Received: by 2002:a17:90b:2741:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39d9bdbb0e4mr16432141a91.6.1789234010571;
        Sat, 12 Sep 2026 10:26:50 -0700 (PDT)
Received: from G15-5520 ([103.206.144.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm14279263c88.0.2026.09.12.10.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 10:26:50 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] drm/amdgpu: replace kmalloc_array with kmalloc_objs
Date: Sat, 12 Sep 2026 17:25:52 +0000
Message-ID: <20260912172552.70502-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining kmalloc_array instances with kmalloc_objs.

No functional changes.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c     | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c         | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 9 +++------
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 132d054900b5..f2427bf07905 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -986,7 +986,7 @@ static ssize_t amdgpu_debugfs_gca_config_read(struct file *f, char __user *buf,
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
-	config = kmalloc_array(256, sizeof(*config), GFP_KERNEL);
+	config = kmalloc_objs(*config, 256);
 	if (!config)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 242c48e85912..f67caa255327 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -900,8 +900,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		if (info->read_mmr_reg.count > 128)
 			return -EINVAL;
 
-		regs = kmalloc_array(info->read_mmr_reg.count, sizeof(*regs),
-				     GFP_KERNEL);
+		regs = kmalloc_objs(*regs, info->read_mmr_reg.count);
 		if (!regs)
 			return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 743b41db5b7c..cbdbd8196eb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -486,8 +486,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(syncobj_handles))
 		return PTR_ERR(syncobj_handles);
 
-	syncobj = kmalloc_array(num_syncobj_handles, sizeof(*syncobj),
-				GFP_KERNEL);
+	syncobj = kmalloc_objs(*syncobj, num_syncobj_handles);
 	if (!syncobj) {
 		r = -ENOMEM;
 		goto free_syncobj_handles;
@@ -726,13 +725,11 @@ amdgpu_userq_wait_return_fence_info(struct drm_device *dev, struct drm_file *fil
 	struct drm_exec exec;
 	int i, cnt, r;
 
-	fence_info = kmalloc_array(wait_info->num_fences, sizeof(*fence_info),
-				   GFP_KERNEL);
+	fence_info = kmalloc_objs(*fence_info, wait_info->num_fences);
 	if (!fence_info)
 		return -ENOMEM;
 
-	fences = kmalloc_array(wait_info->num_fences, sizeof(*fences),
-			       GFP_KERNEL);
+	fences = kmalloc_objs(*fences, wait_info->num_fences);
 	if (!fences) {
 		r = -ENOMEM;
 		goto free_fence_info;
-- 
2.53.0

