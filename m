Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BF945DF77
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247587; cv=none; b=fzYODlop6tWXMc7qlQ+9jNyKqTeXi6dHGPYrJ2nbL8CN1xOAlwTdkw8WdsPa2nxwdH03FP8pRBf7fORaBlaBLr2rZ6NtJYw/5phMKLRiLLhLP4uJBp4kcyqkkTrj5N1lyS9aK1OqpGPtcBVm0hbgHUBp+B5mCd6pdIKKemxQ/3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247587; c=relaxed/simple;
	bh=Q9NpqitOB0AwZoaXs/OGhHMvAXRyfQioIv8p/aObWTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fi1uoL0ak0kG31w8wfHh5tZgNcM+af8xKVvFdHLuW7i9OdQdb9jrackO9726Oew5Ph5M0oKjqONC54OCWhMTcSOMjJaKfbGVlX9sTE5V7PcYsyRhYQZx7Dv2TuqDLGTZNqvBPJxapOHRG3jC9JSYg4k10I/xWICB81ABRbWe4p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sq0yIZnM; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sq0yIZnM"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso495497a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788247584; x=1788852384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0EL/pf1f3ThtoFU4Hf1cFodrWTG5punvyNZKF7Nskc=;
        b=Sq0yIZnMSYfG5w49c+j2am/Hsj2LYuM/Tj4DT60hIIx3OGPQswbUWkEjxkF+qEw1R0
         VWLfSJmua3mdOJjfNKfiCvF41Raa9dlJeWW4wCjQuBDiWsFsQEKgkZDKS//U+qZsA8iY
         o2Aky3cRhaChPTH+lkTm2J6WpthXHkqINi7Rq8vwZ400OsAqDe/2t/BwFcCxN2ZvtHk6
         FrpL3y1GTS8tIvWiWwADfkLGQJTiiEh7P+pKnwsd8mTiZU+VhaNU6Zx1AWFgOEzLfWPx
         t44SfhWlPcXWD/+pFhWMOrh2pTTjm92SV6/ptjRmX/oiogCmwiclR7KzVNHt31A/S0ig
         d1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247584; x=1788852384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0EL/pf1f3ThtoFU4Hf1cFodrWTG5punvyNZKF7Nskc=;
        b=HzlovxXFnYX+zRXChV67+iw+/sMFAGvKErfFW1zZDOibTgH4D6mphGm+lr/v5rD4q6
         P3Okg05MWOH3WwpjIgHNMlBb+SL80TCAryKX9eUBkhUJ3Q29SVp7izWZp48YIouefRQ5
         IlDuVoIj4AyWCud9Ngr+XnzBGSrQeq+ZCuCEyyI7pCfQXoq54efHUCmdC8DMjWuAWmVd
         IHi+be1qJBzyYOUsSq/h5o3Yy/KHh42FR1imXPLH4WUOTLKkTl1P6b3k+UZ/0Bq+t7rC
         kA3tJ8zqyCNgO+SprJ+eDFwumfc9E0TW+WeiOQuMJhb89GAdawUjlJ3bWeaJmk/RyqUv
         hsFA==
X-Forwarded-Encrypted: i=1; AKwUvByX9x5iXx7aRe3YFCW6OZ2pFi3vzJvTw86Qi2hXEfUsUHlj8ttCBm3O7N6/T4+KymDmcFmz83Q3Hzeamyo=@vger.kernel.org
X-Gm-Message-State: AFuF++koOjIkQGt7xc+0PixB6GtMMEUJ2m/b6/K/PJojrIh/gJAYLnIw
	FuZzBeMTOxpb5CBLD5WoHhmejGACIUf7TiEMqLbH83UxlmFAsTlFYQjS
X-Gm-Gg: AYBFou1wEVHowLhdtYqTxESv4EyLQuDPSRoRh82GpzrBGf28O1Lxl3ioCyDXkbw2Rh7
	uQ1uZKOnTJ1AkZ1+RxSIfPjgl92s9dUfc1kwLDukYGJzvS22tnSWoDH76D0juAM45r/zs5R4JTf
	X8i9YN7Wy8e7J+mNbX//aNY7Ur+Kk+FPetG53ZUaBl5fHN0cAgjYaZPTAdqTi8OqvKxZ9zWZxCF
	OBmM8h91VljXri9unHL6XG7smIAURwkU7dm8a7XHR8NMKCxyQael5TDXmrpKTnIWhvv8VUxWDVZ
	fHgSDoPS/sbD1fN/OtdeFdOLcS5T8d3E3GyRoVjtk2Ea27A+8n7Bv4yafqowQPXxIMcgxzQCgMU
	54GGT4Stdtq4DewphjLN8OEImBrvv35e1Ge/kEZ9D3ApQzAZl/nFbJ9uX+5GDC9wvzqqFreYHiB
	DYoJ3xF8Ty34MIRYwcF0AJ0y4+8j7TAqb4ifWvZEN03KPSmwcWPmkFOf8Q9IYa7kBTNLLB
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr51476456a91.8.1788247583735;
        Tue, 01 Sep 2026 00:26:23 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc898dsm32895480c88.9.2026.09.01.00.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:26:23 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] drm/amdkfd: use kzalloc_objs() instead of kzalloc() with multiply
Date: Tue,  1 Sep 2026 12:56:14 +0530
Message-ID: <20260901072615.522925-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dqm->detect_hang_info, dqm->hung_db_array and dqm->hqd_info are all
allocated with a hand-computed count * sizeof(TYPE) size. If count
were ever attacker- or firmware-influenced and large enough, the
multiply could wrap size_t and produce a too-small allocation that
the code then writes count-many elements into.

kzalloc_objs() computes the same size via size_mul(), which saturates
to SIZE_MAX on overflow instead of wrapping, so the allocation itself
fails cleanly (already handled here via the existing NULL checks)
rather than silently succeeding undersized.

dqm->detect_hang_info_size is left as-is since it is also used later
for a memset() call; only the allocation itself is converted.

No functional change in the non-overflowing case.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 67137679a901..5aa42fd5bb49 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -2013,17 +2013,15 @@ static int start_cpsch(struct device_queue_manager *dqm)
 			      NUM_XCC(dqm->dev->xcc_mask);
 
 	dqm->detect_hang_info_size = num_hw_queue_slots * sizeof(struct dqm_detect_hang_info);
-	dqm->detect_hang_info = kzalloc(dqm->detect_hang_info_size, GFP_KERNEL);
+	dqm->detect_hang_info = kzalloc_objs(*dqm->detect_hang_info, num_hw_queue_slots);
 
 	if (!dqm->detect_hang_info) {
 		retval = -ENOMEM;
 		goto fail_detect_hang_buffer;
 	}
 
-	dqm->hung_db_array = kzalloc(hung_array_size * sizeof(u32), GFP_KERNEL);
-	dqm->hqd_info = kzalloc(
-		hqd_info_size * sizeof(struct amdgpu_mes_hung_queue_hqd_info),
-		GFP_KERNEL);
+	dqm->hung_db_array = kzalloc_objs(*dqm->hung_db_array, hung_array_size);
+	dqm->hqd_info = kzalloc_objs(*dqm->hqd_info, hqd_info_size);
 
 	dqm_unlock(dqm);
 
