Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE2628E0F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379997; cv=none; b=aXgazf4z6JPOjYi5NzHmS040qGV25BRtyJr4sj6FwIwLOZIDZ/m6+LSN4f3LjImR0U1ea1sYcqKI3vbbi+bcH+LPDr3IV2EHPK7V7u6Lb2LCZ7LpK0fbtPV0IOND5X6wQVq3w+Dq+rZTcjdzmCwbdITqEWZWUyslBqBEuaJhMPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379997; c=relaxed/simple;
	bh=mKB4PEK+utWwRsA4INvr4RWhGUU8W4ZGbkGGmTIlL6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=opotg9E7jxwiEJq0po6293Qa2dln+ALp9yvMZ+Z0R6Z4TkULK+REEBpWg/+zMaN+/xoEdLSsEsEorjjqAuXZ/xUE6ERlhhuejBx5gcBeocZQS/WaZniSzts0uiU/1CRimdsWXjFauWA/o9ynTJklSJxt/BT7YrvyRBWKSVUDBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFj39vcI; arc=none smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFj39vcI"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-3a772511049so25309871fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791379979; x=1791984779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXzba+xG1WBG1R2U3C2ihk+Wr/g1fNt8Yr32nUgb40w=;
        b=OFj39vcI0skhEGDdCjRwir4DFHLkwnPCqRjAaStfgoSK8RVgW8EbxLeIoqrvQt5MgF
         EBsZjuCUN4tW6OfaLqoS+hGG/In5QOqRPH7wgj5Yss5XrSgN/WfBhzTik/tdMtezv5H4
         tQ7jv4f5k7B7+S21oXsDerAFqblZzogO7GfcHzOz6M1LYKJnm81qWcahhaB4650Gor0O
         tfwbmZIiZCefq+xlN2SCpgz42YeJR+6Ruuyw4F1upiwD4xMcyuIev7+tlijLVL86zvqR
         MZIlcjsFvVD1HBQAicmYfzit8s6Dc6j6dtX6PgKqbByIdPggYPWANJK0uHfwJzW/7eHh
         tBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379979; x=1791984779;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXzba+xG1WBG1R2U3C2ihk+Wr/g1fNt8Yr32nUgb40w=;
        b=VmRJ1wEOU8Vvg6UZ1W0tpAmAHwKJ0KvBDgdImFztEIA3F2xo7NDCdM3sdbANu8Viww
         cFjZHo2CDVmhFvHWeNT1jh9MnNkehPBzIGFsueA+PPzR/Ajg8k3sRtgqHzTxLIMRe/Ni
         Vf7LfwKi+286VJQNphx/c040XqMO4NAuX9xDW+17f8UmyachlrsOiOg0xH4beVaa7N66
         1Hj8279ATsG92/51z47qsDXwzwfquR9326j6yX2qc3mBRsLXq84kncfgEWtDrKNul8k3
         kzMosT07mC0Ku0zpuEWaxdC8nH12xf37nmraBmRo2c3t0TO1VJ0WWaDYEsUn8Y1J9o9B
         y3sA==
X-Forwarded-Encrypted: i=1; AKwUvBzCyNIwZuNJlFb9h2LHgBDQ47o6RJn0rXLdoCmA34tyOA6+c45G2fUxGyIo/p6vDenu568HKfRxW+dVD98=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA8gabcvB4hqSP1eOaAafVCnt0PH0ufDMvTAB/pa9bKWf4Nbab
	hrkB3sL/ZHI1+rFgVykcI47S1KHuwcV5iXF0GJKlazCkkdOGmPO1dCS1
X-Gm-Gg: AYBFou2B7GAF/u1GoOTugFdd/4QOsOVrKvm4QAJUq58jQ4l9Rx8LkzZZkCi/DAvovYr
	l8n+qlZwT2mqAJQELWUI4flaT6jqqNJE0Vvrc75GhKb/JKXUIGwLdGKuTdVA1oVRlyo+JUhrGWM
	6uqhpQnyXJ/hIgBOT20/lF/+jl8oghgnn1SkjJZZXXeJGuQU3l/q0RPXFnJK1kbW1xWxQ3g5e2k
	GnQKTFZ2vs/0hzU2wRIQrzIJ2aczlr0MVlp+X2Ks2dvJEBuHcTHNc0OD1MFIpkDsLT7VWXJjJU9
	4R6doc2yVKiTsZpKaapluiSZmm+CpRfAsaPSJzffYz9rI51FLWyBTGxhkZnS8xrUka+o33t0hou
	uo97JwcJh3LHgbQFJOZqbE8m6Z/rGWJjBN63db6dOv/KpjqlFtZNAvMhVwW0goPHWdoVlmeov3G
	MxbUqi8IR+rpOZtO7i3j6Fy6/0Wz0gAKRqt6fe9D7FQldGYvzkzyEs4w0L3DW4kmM4v0k0EA5Tz
	2vb3kh8E9UsK572
X-Received: by 2002:a05:6512:68c:b0:5bb:7b2a:5b2d with SMTP id 2adb3069b0e04-5bcd0708cd9mr821802e87.35.1791379979145;
        Wed, 07 Oct 2026 06:32:59 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30a474csm33636e87.80.2026.10.07.06.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:32:57 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Leo Liu <leo.liu@amd.com>,
	James Zhu <James.Zhu@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Yinjie Yao <yinjie.yao@amd.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10/5.15/6.1] drm/amdgpu/jpeg: set no_user_fence for JPEG v3.0 ring
Date: Wed,  7 Oct 2026 16:32:43 +0300
Message-ID: <20261007133244.121787-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yinjie Yao <yinjie.yao@amd.com>

commit a2baf12eec41f246689e6a3f8619af1200031576 upstream.

JPEG rings do not support 64-bit user fence writes, reject CS
submissions with user fences.

Fixes: dfd57dbf44dd ("drm/amdgpu: add JPEG3.0 support for Sienna_Cichlid")
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 4d7d774f100efb5089c86a1fb8c5bf47c63fc9ef)
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-63846

 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 323d68b2124f..f1957d4fa7a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -560,6 +560,7 @@ static const struct amd_ip_funcs jpeg_v3_0_ip_funcs = {
 static const struct amdgpu_ring_funcs jpeg_v3_0_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_JPEG,
 	.align_mask = 0xf,
+	.no_user_fence = true,
 	.vmhub = AMDGPU_MMHUB_0,
 	.get_rptr = jpeg_v3_0_dec_ring_get_rptr,
 	.get_wptr = jpeg_v3_0_dec_ring_get_wptr,
-- 
2.53.0

