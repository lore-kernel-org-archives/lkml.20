Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC4377AB6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789836622; cv=none; b=Pp4w6m4URSWaHyPBAQOfPtgNSMBS1/YV80XVcDQMQollgR4RcOaAQnkqAojuEXVtj7bCj9GomW04IJTq4cJPf84p3K1gd7EqUYF0aj8qd5oTHJjz8TbwnWz7LOmKVrZkVfq8emSYm/7Iop2E9EI3CPj+FrqEE0QyQymjmg+PI8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789836622; c=relaxed/simple;
	bh=U3KvteiTBgxplePmG9IA5u9PBaWnZ6XxDfC1Or78v5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7IkYrS/k9vkUzum6wASPcoMiCIU5Kmvla3gmXEmqL6QXdB/BAlpAUWcYp5TTghXhqV8msBGMfX7L4biPuVrdLN9vxR7IcXCb1iE46Jsbj6xRhX2rZIj+A/MNRVf8dZpkiZ4qT3watu+pn/sYWuap4Boj7ICpLAOlpP8XqM6imU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bl8xFDuF; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bl8xFDuF"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba91so1206480a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789836618; x=1790441418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+4Qqo2m5lZfr3OAGZ6npJ+URqdVjHxYgzHywKwbEg8A=;
        b=bl8xFDuFYaaaqdqu0Nc8yIPYj1/HImMitzzjMm97TIOARLX2TAf9wga5tKzlzfZrTu
         NdDsgjoTIEkuSHjCEi2fhKVhxI83qhx4CnlaIFV2+UuiVKddDE5n6zkI0USKcilzYYgs
         JUBOnorm8Qo+5+Ne0rovvZPf3jInzrHGMT36hanSDdRtBQlQAFijzv9GY+nbtyrXhRkB
         VAK4+BUoudv19ObaMK1pPGvwf6hb2HUqWpFaBrMzbozG5WjheHWm7yvogFdVyYZijRJ9
         YHlEZMI+mmpDHdPuiKavWvnL0DjEj5+GXoBIzLudHASlH3ZXzO7ssTa3TVUHwzmCiJYI
         +15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789836618; x=1790441418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4Qqo2m5lZfr3OAGZ6npJ+URqdVjHxYgzHywKwbEg8A=;
        b=qwD9nHe4Hmwd+YgEvQMALlOTh2hawiCSR/Bll2jGLipXYB4sW5DKmCDIoJSoKAHXID
         3HJVLrKIDPYlZLHxzdmLZCSoJwJQjYM57/X5GvtfEyujP7DZt7tK2zOcZjIdIwR/+/to
         I0zM6NjPNAfrHm7CdE12aZpvaO/cQoTl3v4zCJvIXfKDApLHQJzAlO8fcLCdIqtp5aTx
         72n2oQ9r74paUHu94Xs4n4McFH8jrAi1TdOMFhmx+vZnPT4jN4VUNpdEa/7FYhAcGgia
         CsIZkpgsv4Vsg1nW6036nXu+Gz2oE8TGY99eaZDH2HUpuBc8andT8unM7DofxAbHhrlf
         hPmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3KmfrwTDTUF5g4Pj+UUaV9Ugn3WshG0vCerqjph1ItogG+66r8m3eIe97gybi1HpMh4iJH7psxDVh1mk=@vger.kernel.org
X-Gm-Message-State: AFuF++meV5E6h/VvU5ywo/caFTDKZIOIMC2KiF15kOlWDFZa8Zeb4RY+
	ciyOJsLf2f4GMDUXEIX2NoRhRMCQeY0pKPfS34liUjE7qWcx0mNYIn95
X-Gm-Gg: AYBFou10E7IRp6BJUfk8qeS/RQMATuW/CniMtHHOOmLytSjR5Z8dP7lYLk8riwD173j
	S83iCt51WqhIKFwAFQQTZFNDeiYvJfcMFiLG5hRmehKdPKZguGI+DkwHd/qoham2lOHsjV+tX0C
	+XSFwE+rLqSY+m0lW5uCK9U2fVS+t20l7C9/uKt/1MJTCYkZGsio9AQCOTp2dfhAEF+fY16HzmH
	JbTDzgRibZpOinzqzrF44kLltDD35d5oC/2XBYnM8pxdyJI/h44RCusajdhBZEIlbz11EuS/76U
	CNUKi8HJ9d2U/DD4SqpgZC7M88kvW68Tf0YiIdGTyxNZPNsAOT85QNHgZV66j2MDgkJF7mB8xb8
	e754vy0TRIN8FtF7/CnkBy2EN//bL+5IsnRxxdM0kp/+Du57F6Hid6XX7DiErZBgiOH27Fnmbbd
	p7J7bMrSZnVkQR8AbKYb+Q+3jLBthRyYl/CJ3zv/fthEOF/XF5mI1vbrgKX0W/WVT4BDtF8qKMA
	w==
X-Received: by 2002:a17:90b:52cf:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39e54bd0941mr10914911a91.15.1789836618094;
        Sat, 19 Sep 2026 09:50:18 -0700 (PDT)
Received: from G15-5520 ([103.206.144.198])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55cef9bsm7531914c88.10.2026.09.19.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:50:17 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] drm/amdgpu: replace deprecated function strcpy() with strscpy()
Date: Sat, 19 Sep 2026 16:49:59 +0000
Message-ID: <20260919165000.36173-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer using strscpy() over the deprecated strcpy() function to
populate ras_block.ras_comm.name.

No functional change.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c   | 6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c  | 2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index a6f95ff47d24..8bd91314d0e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -1132,7 +1132,7 @@ int amdgpu_gfx_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "gfx");
+	strscpy(ras->ras_block.ras_comm.name, "gfx");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__GFX;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
 	adev->gfx.ras_if = &ras->ras_block.ras_comm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c
index 5a60d69a3e1f..3fa533d5b18c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c
@@ -39,7 +39,7 @@ int amdgpu_hdp_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "hdp");
+	strscpy(ras->ras_block.ras_comm.name, "hdp");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__HDP;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
 	adev->hdp.ras_if = &ras->ras_block.ras_comm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 363b99168478..969ebc9d5a69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -328,7 +328,7 @@ int amdgpu_jpeg_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "jpeg");
+	strscpy(ras->ras_block.ras_comm.name, "jpeg");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__JPEG;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__POISON;
 	adev->jpeg.ras_if = &ras->ras_block.ras_comm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
index 9a7f7d2b2767..42a05b5a2d30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
@@ -87,7 +87,7 @@ int amdgpu_mca_mp0_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "mca.mp0");
+	strscpy(ras->ras_block.ras_comm.name, "mca.mp0");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__MCA;
 	ras->ras_block.ras_comm.sub_block_index = AMDGPU_RAS_MCA_BLOCK__MP0;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
@@ -112,7 +112,7 @@ int amdgpu_mca_mp1_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "mca.mp1");
+	strscpy(ras->ras_block.ras_comm.name, "mca.mp1");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__MCA;
 	ras->ras_block.ras_comm.sub_block_index = AMDGPU_RAS_MCA_BLOCK__MP1;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
@@ -137,7 +137,7 @@ int amdgpu_mca_mpio_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "mca.mpio");
+	strscpy(ras->ras_block.ras_comm.name, "mca.mpio");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__MCA;
 	ras->ras_block.ras_comm.sub_block_index = AMDGPU_RAS_MCA_BLOCK__MPIO;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c
index 0f6b1021fef3..9796428e44e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c
@@ -36,7 +36,7 @@ int amdgpu_mmhub_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "mmhub");
+	strscpy(ras->ras_block.ras_comm.name, "mmhub");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__MMHUB;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
 	adev->mmhub.ras_if = &ras->ras_block.ras_comm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c
index e4c8e98725f0..785bf29d2c90 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c
@@ -37,7 +37,7 @@ int amdgpu_nbio_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "pcie_bif");
+	strscpy(ras->ras_block.ras_comm.name, "pcie_bif");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__PCIE_BIF;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
 	adev->nbio.ras_if = &ras->ras_block.ras_comm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index fbac732f3e01..4e520d16e550 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -327,7 +327,7 @@ int amdgpu_sdma_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "sdma");
+	strscpy(ras->ras_block.ras_comm.name, "sdma");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__SDMA;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
 	adev->sdma.ras_if = &ras->ras_block.ras_comm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
index 71d34fd09385..69fdd075e14a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -315,7 +315,7 @@ int amdgpu_umc_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(adev->umc.ras->ras_block.ras_comm.name, "umc");
+	strscpy(adev->umc.ras->ras_block.ras_comm.name, "umc");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__UMC;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
 	adev->umc.ras_if = &ras->ras_block.ras_comm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 17db7264269e..bc7b5733f581 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -1333,7 +1333,7 @@ int amdgpu_vcn_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "vcn");
+	strscpy(ras->ras_block.ras_comm.name, "vcn");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__VCN;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__POISON;
 	adev->vcn.ras_if = &ras->ras_block.ras_comm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 45e31b3daf06..5babcba1907e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -1341,7 +1341,7 @@ int amdgpu_xgmi_ras_sw_init(struct amdgpu_device *adev)
 		return err;
 	}
 
-	strcpy(ras->ras_block.ras_comm.name, "xgmi_wafl");
+	strscpy(ras->ras_block.ras_comm.name, "xgmi_wafl");
 	ras->ras_block.ras_comm.block = AMDGPU_RAS_BLOCK__XGMI_WAFL;
 	ras->ras_block.ras_comm.type = AMDGPU_RAS_ERROR__MULTI_UNCORRECTABLE;
 	adev->gmc.xgmi.ras_if = &ras->ras_block.ras_comm;
-- 
2.53.0

