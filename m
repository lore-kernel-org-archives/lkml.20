Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326D53A0E80
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791957941; cv=none; b=KNMlOPEiqhoPJNgtO/qtx+xol90roCkp/KoQSFpOQF+D3tqElut6/I3RtiKrwT+96tbFcpAp4H3OXHzfjIPZ6DksIF5wB3q/r2wa/oz7DvISsed7/N8uyBoK66XJdhgJMg2JIUpOtRJ9TKELlCK6MWdi/4g6Zrh1b0fpEwHgWAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791957941; c=relaxed/simple;
	bh=FZjtCgPWScpO3udRUYo7ssr4rKWpgkU5u7FB3K0+eMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K/DF8AIs3EZSs1Rxla6IwgvTWmwLvTCtybRV0cYohWHw+MdurKTfnsQaXCujbv46xTMNCY6PFVQgKW5ZgpACO/uhKQ8DNXrTyKvA5tNtbRyCnswca9uNirJZ6EZNAku3UTFSK1GzF1UC3dMPhQgLGOhtpjKrbatYLsb/UR82W1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZksIM1fi; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZksIM1fi"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso336563e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791957938; x=1792562738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKHQJZbsU0Ua86VI1CZpz7LRBcGg7w/QDW/s3ZvmOOs=;
        b=ZksIM1fiG+I08mDUe9bhBsgWifHaO2suZZgotPdLUnfezrPNf4b124D5H031+hVR5l
         MViwpkEmCIX3k2IuULohpQR4/MFlWv7SC4qYkbI7u9QA7QV7TZA4xyWA3VjuyVq3zGrs
         9kOxbIEYhjgcu/uzm2ccxPx3InbxLpQqhwhs60b8i9h+/yot/C6T8s/XiAVMbOQb2O/R
         4JMZInSYGQNSMfwCGnJ9PRKdYVYAcOiaalLKKy0+x40VKOKkUNrjGvyWr3qTSHbMi6jb
         F91p8Bvkkqz7LMYqVFypMR66q+gWlk56ya4feuQb+SwbbqKCVlat08++rvFROTQhEOzS
         0U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791957938; x=1792562738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKHQJZbsU0Ua86VI1CZpz7LRBcGg7w/QDW/s3ZvmOOs=;
        b=RFoYXSVXS7L/un2xXo6KCF0if46rNRyFaAf3Hhh6Cht3DdBtV7l5zkkcbgemLMZuMl
         HQYGsd/YUNDn40Lep5I1akCOOYygg0ZoSbY12NJvOAVgQYRagL8sL5cr0AUhVCsj4xmk
         FZor4yUyXlpNDWS6Vrv5Pj9N9DgLPkVGv8pNaTiIb9lKfAb7ckmbnTyYcRML4H5Uuh/D
         7PwRVv4V/hG6YHfV4HkxaBx7Q4CJ3DnzIdRkfPzep52HUlRSc9HpVgfKcPUA/8n7645V
         bvbYLVboe7SRy6OdW1iQkzrZKpfXiOuFBCA4FNUR3NOE5A2Gtzg4nxGdACqKW69sVh2T
         yHRQ==
X-Forwarded-Encrypted: i=1; AKwUvByfH/52mRXg4qGXv3i0EfUpFWToZdZnNXl9rSWmAv3nYFFXcfD009VsiJW/nGNLyDmi20t9aF79n9H/r2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG0wzHpQSYdyCJ7bSIRrK6yl+s+B9+1IvMcn0mCyLcaLAjKo+t
	rXQKt0Zuek4xaaWoDT9wC0fAXMCmLItHFELhc+4oc08Q1DOqDzyBndHT
X-Gm-Gg: AYBFou0XJV1EiWDdWlMiGyyWFCBQINJEnBPYdjS0fA7IJi/IMfuwHbnLZbHq2pYQM3y
	F9t3s9Lr6MXFznjCRgHwUoiJCuEczqPnBbq0ko6EzVnyUY3/fEonm5P9WObmtGRX/zgwh58zZRd
	rZqc/CS+zr1iyN8D0l0lXyyox6HAuzJ9U/qXciG2eFZAiiirTQAI1KoQbqiNRtBf0scUI/nX8ZE
	LDRpUZmf5Xe39/VGviKirfLS5XRjSHZbPnhceZCfwv8LSJdUG7XATaCeqkET/shfmLI7A0X/X5N
	KR/kAca0H9xbS6BAReKSCogNzCGNACvLMVtTcX7f/I7Oo1ggB1iBdEgLN0+FM5+uLywLGQk6Tnt
	WtFieU/AMDOG6RjsJFUTmPQnBUBHpBCHjBGFFI7dGYmPcGPtwfIM4jXMg1OxMXxpzu/WQ0+mJ9l
	hz55A7TbnjuJkje1IvX6oHxr6vchkK1mN5F4gc55qoofEA2olu9UCO3yx4GBzLvVw9L3NxV1E4f
	m6W74OAMnLa/mTV
X-Received: by 2002:a05:6512:3f08:b0:5bc:cbe1:571d with SMTP id 2adb3069b0e04-5bcdd559e1emr4705089e87.44.1791957937938;
        Tue, 13 Oct 2026 23:05:37 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be34c726casm235360e87.46.2026.10.13.23.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:05:37 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
	Alexandre Demers <alexandre.f.demers@gmail.com>,
	Boyuan Zhang <boyuan.zhang@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Benjamin Cheng <benjamin.cheng@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10/5.15] drm/amdgpu/vce: Prevent partial address patches
Date: Wed, 14 Oct 2026 09:05:19 +0300
Message-ID: <20261014060523.4685-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benjamin Cheng <benjamin.cheng@amd.com>

commit de2a02cc28d6d5d37db07d00a9a684c754a5fd74 upstream.

In the case that only one of lo/hi is valid, the patching could result
in a bad address written to in FW.

Signed-off-by: Benjamin Cheng <benjamin.cheng@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[ Roman: In 5.10/5.15, amdgpu_vce_cs_reloc() does not take a struct
amdgpu_ib *ib argument. The conversion was carried out by commit
cdc7893fc93f ("drm/amdgpu: use job and ib structures directly in CS
parsers"). Instead, the IB is obtained via p->job->ibs[ib_idx] ]
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-53375

 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 0a28daa14fb1..9b0efddd145b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -634,11 +634,15 @@ static int amdgpu_vce_validate_bo(struct amdgpu_cs_parser *p, uint32_t ib_idx,
 static int amdgpu_vce_cs_reloc(struct amdgpu_cs_parser *p, uint32_t ib_idx,
 			       int lo, int hi, unsigned size, uint32_t index)
 {
+	struct amdgpu_ib *ib = &p->job->ibs[ib_idx];
 	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_bo *bo;
 	uint64_t addr;
 	int r;
 
+	if (lo >= ib->length_dw || hi >= ib->length_dw)
+		return -EINVAL;
+
 	if (index == 0xffffffff)
 		index = 0;
 
-- 
2.53.0

