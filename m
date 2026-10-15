Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D709475
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023853; cv=none; b=Fn2ZY6tMta9maTbiyeaDpyE7+hZ9TYtrIHNBl15KDKwJlqBKncZDFz5hLx9MiWcchaVcgmNFbSx8eUN51f6pxixyBsTd1HgzmJFkFKsRd6mJt2PJulWAhosTYuEQ1jQ5ilN//3LKh6pHI9CkwM1dYnj4Fkeo+WnBNA5GPB1wsXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023853; c=relaxed/simple;
	bh=1LmviWDsE5UZxD2POuUOSIstW2Vo0o819tiyBUYk/tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFpW8n3yinH40+VPMaUGEmDmeKnPARz8k0LJHX0kvLAPJJS41HovpIEl4XARDrP4udN7/O55S/88Kx6hs2gfVxquEDFm3di0wUdAET/QxDIP6lZ80mFL7CZqo/+5Wv/s8fmnzl34iJZlQZPwITBI6E+OVTozook6yAmvyU9JNKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qY28J1+J; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qY28J1+J"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-98c6e050c5dso504119241.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792023851; x=1792628651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRi2ZkH0cqeF76lnycKi5TJ2g+qZsmxD4so7+Rdq55w=;
        b=qY28J1+JnxqPRyuJjofnQSRhRL6Pxqnh/JvdIkSoYVmxUHsJl23x3QUcOy1+mWs3L+
         iQCzHWezFRzzMgntTrSFsm8QveNu/L0Z3/h3Pt9JB+cu2DK7fRXjSRfpAKqBG1bu3a/G
         pIPqljfWKvIiAoySWbqeW/uPLODGELDkCgTzLZbVDuLPWMvkRx0XTjWnTxUnALnld0BA
         Tll/NOmPLuoGUthJmb1edJqs6DRp6w/l0PtsUyZxQ20Twox+FBGqsDFRsIYwnYPiMBdr
         kIAjWFN8rUA3W7QVE2TmG5m6ZEBcdgQSrgJgl2E+CRMB6IcIj+gsUIluH4ZPB03RR17W
         AXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023851; x=1792628651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRi2ZkH0cqeF76lnycKi5TJ2g+qZsmxD4so7+Rdq55w=;
        b=YZGuBshCXyy4pgt9fFqUeBgrZiFsfKI9I8CTjmkrr509/lEJOPQsgX+QvkwKiUhZ6E
         kjKJ8CGkD1MPkj5jugljaXN+6T/wZ1eHn98ZA9oF+PEIgjFMBZ7IulXeUMKoF3pW9Suw
         nF0DcJECPAXyIXdNHoXGG+pq9HYMUZcym4IumvRlcdXPkgeuxHEF4AeM6jPTIGM/nOlK
         s6IaRpMO5bQe91RqKI0wVrTlYIWu0bV4fLu3ZCIsjp9pc3+qkt1cl2y0pxhw56dHamfG
         yOlPoVfcnnRF48sOGX+GBAocKnRk6APZXr9jAQpnbpCJ+uPOuBJxi7pYbrej3hLlcMv+
         k7uw==
X-Forwarded-Encrypted: i=1; AKwUvBzqPWTnvjcjuIOkAkvaU1Xg9TA0HX6MbSD7+WGjDQJbbLm0TyEx8mTxfNu//oMsT8hOFITeNs0T03eWkqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCfQvdCvQD6pHeNf5THaLUlU+kpiVlyRIJB0z46xSvtAwzXoV/
	TI4TlyufsDVQHgxbFOyLjOIdY52DN2lYHnT4hhBtr2aQTu4hFBPpWvxn
X-Gm-Gg: AYBFou1jHMwGA1VByesdVlE0S9rAWwcxFY6FuyQpOcm/wJvU3nFCu7Pyc1XgMBBtwfB
	HRwAJrgEGmjFUdklfbMBwjGgCP4mtLcP80ULqWxy/bynACEFMIjVfwa2Hgq8rUqaZ4coCUiLvv4
	M1EOv/x0V+BeEsSP0LuVrK+7KpgFHc58kwzXDXbHUiq6alWsEjTafohUt/6wC9X4QZmm9CkrVPa
	pn+m3yVCT4cnv7oi8yW0G9IOs6TcTGPqNEmhoZKPbzWAimNVFAUzlV9rngd35C8Q7HaOhm0uDjd
	qwCIxd9oC8y+KwGbd9LDx8a/DNB/kKWAmW9dri7ikE4Zxg6lrEkYAAQRmFLbsqKSf5dXwE8PE52
	iInfCN3I2Adjwx75uChWH+4Sx+LWIkRAYHHyivcwZhicgQUV46B8aRV8WGpIzn6wvo/6PpDddTi
	oaE11XaofND0sRlBOF/noan8LmKdvxi7hqwJt+Cz5cQ3K8plC1ClOC5/PTtxHbWF4/yVVDJcwYv
	wUT1NkTFEZvmhOF7Hv3hcZ0jL2k+Zww8wx6Y50C
X-Received: by 2002:a05:6102:f9f:b0:7bb:a70:4708 with SMTP id ada2fe7eead31-7cb372f5c52mr5241177137.17.1792023850833;
        Wed, 14 Oct 2026 17:24:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:5698:10de:1f00:932f:8780:96fa:a0f5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cbbd178e4csm6445671137.2.2026.10.14.17.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:24:10 -0700 (PDT)
From: Willian Oliveira <williandossantosdeoliveira287@gmail.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Willian Oliveira <williandossantosdeoliveira287@gmail.com>
Subject: [PATCH v2] drm/amdgpu/gfx7,8: remove redundant RLC cleanup
Date: Wed, 14 Oct 2026 21:23:44 -0300
Message-ID: <20261015002344.98683-1-williandossantosdeoliveira287@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CADnq5_O=kVgSZoqe_ZVQDmVTWNb+OZ2XhmVx=0CPQQfCaf2idg@mail.gmail.com>
References: <CADnq5_O=kVgSZoqe_ZVQDmVTWNb+OZ2XhmVx=0CPQQfCaf2idg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gfx_v7_0_sw_fini() and gfx_v8_0_sw_fini() already call
amdgpu_gfx_rlc_fini(), which releases the RLC objects used by these
IP blocks.

Remove the duplicated explicit frees of clear_state_obj and
cp_table_obj.

Signed-off-by: Willian Oliveira <williandossantosdeoliveira287@gmail.com>
---
v2:
- Keep amdgpu_gfx_rlc_fini() and remove the explicit RLC object frees
  as suggested by Alex Deucher.
- Apply the same cleanup to gfx7.

 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 8 --------
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 9 ---------
 2 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 5fc19fefca81..7c56e36665c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -4454,14 +4454,6 @@ static int gfx_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	amdgpu_gfx_mqd_sw_fini(adev, 0);
 	amdgpu_gfx_rlc_fini(adev);
 	gfx_v7_0_mec_fini(adev);
-	amdgpu_bo_free_kernel(&adev->gfx.rlc.clear_state_obj,
-				&adev->gfx.rlc.clear_state_gpu_addr,
-				(void **)&adev->gfx.rlc.cs_ptr);
-	if (adev->gfx.rlc.cp_table_size) {
-		amdgpu_bo_free_kernel(&adev->gfx.rlc.cp_table_obj,
-				&adev->gfx.rlc.cp_table_gpu_addr,
-				(void **)&adev->gfx.rlc.cp_table_ptr);
-	}
 	gfx_v7_0_free_microcode(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 7f91186ef1d1..27fbb5b59645 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -2060,15 +2060,6 @@ static int gfx_v8_0_sw_fini(struct amdgpu_ip_block *ip_block)
 
 	gfx_v8_0_mec_fini(adev);
 	amdgpu_gfx_rlc_fini(adev);
-	amdgpu_bo_free_kernel(&adev->gfx.rlc.clear_state_obj,
-				&adev->gfx.rlc.clear_state_gpu_addr,
-				(void **)&adev->gfx.rlc.cs_ptr);
-	if ((adev->asic_type == CHIP_CARRIZO) ||
-	    (adev->asic_type == CHIP_STONEY)) {
-		amdgpu_bo_free_kernel(&adev->gfx.rlc.cp_table_obj,
-				&adev->gfx.rlc.cp_table_gpu_addr,
-				(void **)&adev->gfx.rlc.cp_table_ptr);
-	}
 	gfx_v8_0_free_microcode(adev);
 
 	return 0;
-- 
2.47.3

