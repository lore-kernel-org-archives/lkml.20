Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC94AA57A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379231; cv=none; b=H0wjGnxDXod9rALXZC8D07cPoW2aC2kF0oR/ZVYx2iyvMFKa1llhwdh+Yc1VYZt6v+3XECGSgF/yBNfzojJ/7tmPHo578oPSwMExOXAuInINw3xlfrqDfZWXJFJnSYlRSNIX2uMSR67NLCa8YocBGU8plR989Mym9ZCYJ56otOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379231; c=relaxed/simple;
	bh=dt+iyPLWpcF360xLAM30G1ETFTnzVRW86LsgH6o0f5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HfNT9v6mOvTCv82mwBqif3Y4Kx5Nb5es4N+9gGQX3Plyim/Wu8d4Sv+S5PEYADheJfy/yTXOFbDLH38vylctvNf7STm5nJ+57FZHflMOFQpWxmJKKwmDTlyTW2BudGsG0tzbmCDfkKwlLX+AS41VNXY92x2XTEXs3CGRkci/hbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIvKpJpb; arc=none smtp.client-ip=74.125.230.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIvKpJpb"
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3a777133146so24683531fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791379214; x=1791984014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPdX/wtfrIoJuU3T/PjxExDIh/LQdp4FgVNwlqulZuM=;
        b=EIvKpJpbbLYq6BqGe9TlyJ+taarNEtMHAdIMHLWtjhNe1uh5WzqQKMGSt/x3aknKY7
         aXWaKwaCtQb797mDCgfg1pMiGpf+C2+qPN5c5zpr4clHJ0gthIAqNBnIPQIbzU5fQkWx
         GjCf/dJWHJwi4Xn/mu6t8ldQvwSMNv5hTAohsD0Eoz5SR+JqYfXVWS5bp2FDrwBBEd4V
         Koi+uvwei7YTABYL0sXUE8u7uGiR0wHyvwAzqj/wDaDTMWpa2fJhZwE3P3Ftw4XjTnCA
         g1NUCCWRwyn7AZwEleKhKTkobM+oZVv+JlK861ZjiFsifL94d8RO3CbBOm2xm6VySSWz
         52rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379214; x=1791984014;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FPdX/wtfrIoJuU3T/PjxExDIh/LQdp4FgVNwlqulZuM=;
        b=tu3F0w6dCkBhUbYpyJEIccELGeA5lnUtaSqOYyLFvWzA2+0E8dsr0Zz4lSPyO2/UZl
         nrPFa99kBW3fwVDKdFDMh9QKkuPBA4Kj0GmNdsizZGmU8hihXIYsB5ioFbFtZLWxN14S
         US0kC2dz3S6HB9YFMbonIFUFol5QhBG7DPXTK80bP7Zqcd4oyQHlTRrzRm1RjDcBsFGv
         fdHEGpaMU2O4uBK2ewVCBf3p48kzAFhQav5Djo5bSt2vzftcAu+Xoh/SZknvVoH3WwR/
         Cu64Q+tMzFByE3f8WuMITjsdvtA/B5CpNOpo1ySEKjTibBJhy6kNrpsufV7jkX9tfbR0
         kEBg==
X-Forwarded-Encrypted: i=1; AKwUvBzM663/eGw+djrLD6DZUcL6R8FbWJF2Trr/HBn0hOmLAKbfOzonju5rDUQi1C0xbhFqbqCiluZ8hzA9a4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYL205Cc1WEdajHR9fT6SKxQBJbqOOWBp7SOhfxeds54IC9ovMls
	6ZDThXn2pv/UrUxnu8l9//BKtPMVAJepVdG4x8iJk7wAcqfCQvuJDBq4
X-Gm-Gg: AYBFou1nUyo1Ev4vF+Q2zEQyxqfF3+PXI0tllvHqQJIpbxNCIdV1LQUEJfzm/qLbE4T
	FY8F6/bPQC6QT93zQyslhpQUrRt54t9e7Dd9WSpYjR9VzX2/1uQgP51yibBVcaP9rytSRCQ5Ke7
	xwgEHQzg//Ee1tfpVZFDmc4dlMtDfgilycTd0mZhwHeDKV4l2b9Qcr64dQP2FGnHD7NqZV0LG7p
	DxKdQfVHEDlDT+R+nThtxc3PWtYdYOthXEgQETlQMU6yRmyOV3VchpeSvWb9/XWqGUzJIP6rXmb
	bRQfPqGYBGkZORcd8wlWtBjEsv187s9Hmmhho/zCLBXg+RK6j3vWVrQN0LGzAgrAPS2o7dE9KSF
	SWrsEUiWdCW/16CtaSEaNun5E8VBB3mXpgF4qMvJPSk6eRKY4psdXBry217F8IeeBdtWISDRYQQ
	CyMboFcd+MMMeikhkwmrqcfzR+Bmt8cg/aWg9a8TAN+MSqtxdFk9T8eGd1eF/5Fx8/290dL37HI
	wo2cRXA5wCR4SWPbA==
X-Received: by 2002:a05:651c:553:b0:3a2:f233:5c6e with SMTP id 38308e7fff4ca-3a9a2c65959mr5044541fa.6.1791379213808;
        Wed, 07 Oct 2026 06:20:13 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1a9c423sm6097951fa.0.2026.10.07.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:20:06 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Leo Liu <leo.liu@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Yinjie Yao <yinjie.yao@amd.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10/5.15/6.1] drm/amdgpu/jpeg: set no_user_fence for JPEG v2.0 ring
Date: Wed,  7 Oct 2026 16:19:36 +0300
Message-ID: <20261007131939.120898-1-roman.demidov.nn@gmail.com>
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

commit e5f612dc91650561fe2b5b76dd6d2898ec9ad480 upstream.

JPEG rings do not support 64-bit user fence writes, reject CS
submissions with user fences.

Fixes: 6ac27241106b ("drm/amdgpu: add JPEG v2.0 function supports")
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 96179da0c6b059eb31706a0abe8dd6381c533143)
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-63848

 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index 3301ad980f28..af8f244e9c94 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -762,6 +762,7 @@ static const struct amd_ip_funcs jpeg_v2_0_ip_funcs = {
 static const struct amdgpu_ring_funcs jpeg_v2_0_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_JPEG,
 	.align_mask = 0xf,
+	.no_user_fence = true,
 	.vmhub = AMDGPU_MMHUB_0,
 	.get_rptr = jpeg_v2_0_dec_ring_get_rptr,
 	.get_wptr = jpeg_v2_0_dec_ring_get_wptr,
-- 
2.53.0

