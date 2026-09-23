Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3481553E308
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175398; cv=none; b=YPVaL5OOavJH9lD7E7jIH/WQQ+1Lovv56m+e3IatcgQzyqEbpycvyl/VbS7Jl8szNZ3qMEC9XeZkUN7Euhci4+3/1d/wv9R9ztF8g2R7u0/6/tzVGXkgK/cYADxFN6Ua7KEnKSPAFzCK87pyCxBfaai/s8Ytd8bf0VZShIzAHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175398; c=relaxed/simple;
	bh=Irzn3KoZz2CPFbn4S9qLAfiWXivutTrsLSXE8ABhv5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HuK83c3B+OWSrkCs1ae5ds4eeKaQU4s0iHHRusNcFAMgoZFB0IoiTD3LqaYWJo9AcoT3UKgJ4HlEwCEmh3Cb5DFysEM4hY00gneLAesHqbmA/E9hpJXY+f0jX/VtUjVbRcS0WlZPWRjM5+/HtpBtvXsGFStwigvgQ4EDfrZo6Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+0urAzz; arc=none smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+0urAzz"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3a49e7d0b4eso5847401fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175394; x=1790780194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYj8DR6tUMAlSBOX53pzMRuQvG2jVj6PU8CNMEIk8m4=;
        b=d+0urAzzbMjIOM0mSI1IJlYf0kfC9V1rm9ThGmLqQJmNTfd94/c+94w+UhBv0ecFO8
         9YVLRQmsfLjEbRlEwdhv8fqEbgLNRVWcD/4zqVz2cWI9BNqd4Nc4TIEyKiA/BJZnzAcl
         PwQM6nixf12HFWox/Uncipe4UcYkPWmV68CfpBIW0DK3DSlHgx0irmdPoMsfQMd0ONm8
         mY4QaFgS5jjBGkniWJAg2hczkHCBX5xdjV7xn1nCvjbsg0Htz0YZoZPc+KBw8YeriuXh
         /GHT2Yr7a6BnRVoaGMHolE/KBMHerH49cAKpiAa6mB122MI4s7IKIMzv9yKr3Yv96GDy
         m7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175394; x=1790780194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYj8DR6tUMAlSBOX53pzMRuQvG2jVj6PU8CNMEIk8m4=;
        b=WYW4qohxORZGB/Q+bNFT0qCMS72a2UjLSZsY62aUz4N6XJGk3etReFlhj+9+BCBGqG
         E3HJaoy2qREyfON6+FOfa/DQcj9Tov8Oj0W1qK/5OApGhbzHiWpTydIif3bI/9C5NjvA
         zXXmAZTmGRSC1U+O3T1LZJPYwxIMq02a9LtO8cyYkgDV2PQnr4siQeSIG4p8uaoKqf7z
         LZDoW7AOHzjzBnkh+KNIBbu+v2M/xKOQ300HY3yQCJDgSDE8t0Y/QZznjfngH73OFazy
         CefUWp+ZQMkpx19aLDw/LPXSQdhzSzB//ooWKvo2exydmYdatZf8MUg/xuT2RYOUdVsp
         KFlg==
X-Forwarded-Encrypted: i=1; AKwUvBxrQFnm23AA4RW4W5sdjGfogE3h+2Dl1x4CS7bFLrKVi9a8j6K994qmYUvSa4gDysyJdYpAeoZxfnMgmHg=@vger.kernel.org
X-Gm-Message-State: AFuF++k6EGGfAGcjBKmBSAinQQIW6SSjq7mC03AJBQ79KDehbgPV6buc
	2loRN2kC6a3kII9vSS+zfd2m104eRT2qlLzThxRjd5qAmMVY5HgZv/qX
X-Gm-Gg: AYBFou1nnCN2W+eWZFBkyahqXF2gNTdAXNzxwijVvjFk4d81qbMCD0VsQvVmW6n5YGm
	7uwTyfuhjzr/n7tyk/X8t6PuYBJIro0+vLzQZEYWcW8FKPdZ8K2lycXXj/Tvf2e6MFQ3GYVtLMj
	dv/X5b6PUAYp3148Nt2GXTNeizFgyzYyi3e3IcOdcsOTMjYLhrvVuK0DwU3IchXslZ9qZIflwxH
	7jDCzH/cxW5xfIql7J0xXcTudb4PWt7fHbNR7GA8faUmBdLljB525cKt65r7Yigfo4nqIkKdIeH
	ex4gAurS4ZLkD7lWD4Cn7X8sAEiOuj0X75t2L7lxwTY6n3z8iLH5bl85h7Q7EmDDyWcarnqvyA9
	6CjDbuiXCoSo5dsdvFGqbVyUCOv7sRYyNbAdVuVzXXtcwPNxZ57rZof5Ki7YNfTRmcQ2ESYjyBz
	VpD/HRsubDSC+2/kULpXI3wubICEhFJpi0nDvai/upz2AzNpAYcu/tdR2cbAeSU8FtR0mpesDeO
	R1Lerqq+9/qalzn
X-Received: by 2002:a05:651c:a201:20b0:3a5:bb28:3324 with SMTP id 38308e7fff4ca-3a63067b2ffmr5677661fa.28.1790175393880;
        Wed, 23 Sep 2026 07:56:33 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f53b4efsm7512171fa.39.2026.09.23.07.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:56:33 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Fang Wang <32840572@qq.com>
Subject: [PATCH 5.10 2/3] drm/amdgpu: Use vmemdup_array_user in amdgpu_bo_create_list_entry_array
Date: Wed, 23 Sep 2026 17:56:19 +0300
Message-ID: <20260923145622.76242-2-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923145622.76242-1-roman.demidov.nn@gmail.com>
References: <20260923145622.76242-1-roman.demidov.nn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

commit c4ac100e9ae252b09986766ad23b1f83ca3a369d upstream.

Replace kvmalloc_array() + copy_from_user() with vmemdup_array_user() on
the fast path.

This shrinks the source code and improves separation between the kernel
and userspace slabs.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Fang Wang <32840572@qq.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Stable-dep-of: c833d6c7199c ("drm/amdgpu: Limit BO list entry count to prevent resource exhaustion")
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-23468

 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 41 +++++++++------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 9fb8012007e2..22d7b7c504db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -224,43 +224,36 @@ void amdgpu_bo_list_put(struct amdgpu_bo_list *list)
 int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 				      struct drm_amdgpu_bo_list_entry **info_param)
 {
-	const void __user *uptr = u64_to_user_ptr(in->bo_info_ptr);
 	const uint32_t info_size = sizeof(struct drm_amdgpu_bo_list_entry);
+	const void __user *uptr = u64_to_user_ptr(in->bo_info_ptr);
+	const uint32_t bo_info_size = in->bo_info_size;
+	const uint32_t bo_number = in->bo_number;
 	struct drm_amdgpu_bo_list_entry *info;
-	int r;
-
-	info = kvmalloc_array(in->bo_number, info_size, GFP_KERNEL);
-	if (!info)
-		return -ENOMEM;
 
 	/* copy the handle array from userspace to a kernel buffer */
-	r = -EFAULT;
-	if (likely(info_size == in->bo_info_size)) {
-		unsigned long bytes = in->bo_number *
-			in->bo_info_size;
-
-		if (copy_from_user(info, uptr, bytes))
-			goto error_free;
-
+	if (likely(info_size == bo_info_size)) {
+		info = vmemdup_array_user(uptr, bo_number, info_size);
+		if (IS_ERR(info))
+			return PTR_ERR(info);
 	} else {
-		unsigned long bytes = min(in->bo_info_size, info_size);
+		const uint32_t bytes = min(bo_info_size, info_size);
 		unsigned i;
 
-		memset(info, 0, in->bo_number * info_size);
-		for (i = 0; i < in->bo_number; ++i) {
-			if (copy_from_user(&info[i], uptr, bytes))
-				goto error_free;
+		info = kvmalloc_array(bo_number, info_size, GFP_KERNEL);
+		if (!info)
+			return -ENOMEM;
 
-			uptr += in->bo_info_size;
+		memset(info, 0, bo_number * info_size);
+		for (i = 0; i < bo_number; ++i, uptr += bo_info_size) {
+			if (copy_from_user(&info[i], uptr, bytes)) {
+				kvfree(info);
+				return -EFAULT;
+			}
 		}
 	}
 
 	*info_param = info;
 	return 0;
-
-error_free:
-	kvfree(info);
-	return r;
 }
 
 int amdgpu_bo_list_ioctl(struct drm_device *dev, void *data,
-- 
2.53.0

