Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA65D2D77F7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364849; cv=none; b=nHwuSIHVnD2gNqhqny3ti1D2PXt8dt3I1BUba4VKyLRJ8fuyxg1Agm9t994tsdHh97m3Ip2gXwbBVM7AW3N4vvyTFF/NjgLmC/rcvvf1OEPijTOxgPo/6c4ZOjej0U5SRXNfWnM1RbXjxDu/J/tCZk7x8jGxETTy8hIzI4Xij/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364849; c=relaxed/simple;
	bh=PrnwU4dWvlOP8E7Oir3Lhk5vB7TscLONP60k/9Hak6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aV3t2vDUlG5CDUos6X9U2vGwwTKzdfJQkW7+mVRHiu8ZeAFu5l3p0ZntgXy80cmTNnLCpeCoTrxok9S3KJh8RmXRwKbe3f/GV+g46Sk6qdE6OnBzTmtJF85pjTPSOJupO2/9Y1oXHGJ5cDPH/rzpfiRjBSjBvRHr9zWkBbgPwvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqvOk7Yl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqvOk7Yl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48702adb1c9so151208f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364846; x=1789969646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjb+OYWz+/bKaY6AiNvmi3TeWvwlpKbGSDH/yB8xs0k=;
        b=HqvOk7YlUj8p4S4e+q0FAHNyyIE0RkILY6oxS32WHfRKy93xUGYroVut0onMNmcUXp
         52j6C904u2uDED0WK6qU+uwdfAY9j/6/ryxT0mhw2Dj7sL3s8zLqHolTYD1VTwSQ0yeB
         iVf2dkzgY2s9tSRdBrUXuo82JhJVwRlv9qOVWIT+NaacixPcF9dwdfWqFC7c1vgcar2I
         vPPzhPWzh2jF9hp5NLCWup1Kv7s97QaRZqxJ2BwZnaBFPEZ/lokJp6mDJ0AHnK3tynwf
         95k7S654YsUregm+Uw1L22e8yaWM6W4ttJBJyPwjnZYN3LpUIHobd3eobl/kX6AqL8xY
         RBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364846; x=1789969646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjb+OYWz+/bKaY6AiNvmi3TeWvwlpKbGSDH/yB8xs0k=;
        b=Ll5MMq6i+T9wtvQ6BbcZWOiX1mlqW9GPynIS/+UPz+M3XBCFio+B2LA7kNM+bKnVrR
         luo7krMgfhjPnvAIRZLGPDKpa5VBeiKs/syUlhsWUTQASR9kfGsWRky5Xa10vLkKW9/W
         50HpJhGXiKH5aNPo7CXT0wjdB+Fsu+Ch1c8Ma2m0t/gzGG8jrHrSbJrBmCGwr75fhDOT
         cOZP8Q/SwFeYqmiceBEbNI+uves6I4HUx6odtK8fSN+kwJtYuy1Dsy8BeA8+hxE0IIvc
         9RFUFndq74WSjHxiCq7Z5jdq0O1+2SrKLIeVwirlJUjbAid218Lu+Y7nuZw4NHhwdEKF
         q/Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzBhWftnpRsu0qos33wKUSZnlYmVepngr4yeqqY9BtX8J+f8676vYH5hWPfdictSPJx7JbizQiKLtIF6d0=@vger.kernel.org
X-Gm-Message-State: AFuF++mCTfxLPcxaZV1XH5h9x3/cmLUwxyLmvLYYZb2z4vQ/i9Yw+52u
	6yqWa3Qu9NfYG9NZnS984MKvC8gkg0Mi0dl3Gu0U/y3H1njiYzHuS2KE
X-Gm-Gg: AYBFou2SZEZk3kxp//s/CNOrv0JAO6Fwik0PhV6gLwFPCoL4TLdNjV+KidhGX3T8RLv
	tknvFq12ZIAv6f10eOXCuKFTBesMqBkb2mJ7KaMwOTwSdmqEXaPj2t82OY2NUemLeIhm1exQxmB
	HvmSBqPodrzS6EalWPQbs+cL7IQxZt1gTmRkd5VgIdxy8KgJc4pDdfqL+KTKovu8UbJrpfiV+c3
	lqf6AJg8ONOjUxkixHo45WDfn2E5fIsywM5a0GMKccfUJRV97dGfZGb6QYf047JOrFDOISwbNPT
	D3VTRescjTvbg3inn5NV6heRlA/+xXDUXg6g9p42DeASnnGmbzO2f10pripPGzuUry+uaEpZdcP
	HvySmckSvrD5MMsQeyeAV6+WonqoenGvtUNKAQvES3kymzr6kxgBCaV9DbrYyBFQHXkdZwWORDd
	fYjmveuXBNlBz25j2FExCj3tWuHvyqm6O6VCsYAShHYe5dzZ8QzimH6VN7rxsbid7Tg9S4oHtrQ
	HmYRpvPN+uh+GsTerPyThc/DOD0bS3rvLMqpP0l0tgmUTlnsFrWrtnF4ipzt5jvhXFJn6Yk2vax
	Oz4u9EInHHFWxydlgunHToe5mtyeT3w=
X-Received: by 2002:a05:6000:288e:b0:485:8c16:5efc with SMTP id ffacd0b85a97d-48702b31ab6mr934116f8f.54.1789364845667;
        Sun, 13 Sep 2026 22:47:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm22609515f8f.10.2026.09.13.22.47.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 22:47:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mukul Joshi <mukul.joshi@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Initialize UALink handle uniqueness state
Date: Mon, 14 Sep 2026 07:46:04 +0200
Message-Id: <20260914054604.12850-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amdgpu_generate_ualink_handle() continues when handle_lo is zero. For
accelerator ID 0, the random value can become zero after the low 10 bits
are cleared. This path reaches while (!unique) without assigning unique.

Clang's -Wconditional-uninitialized reports the read. A reduced
MemorySanitizer test reports use-of-uninitialized-value at the loop
condition.

If the uninitialized value ends the loop, handle 0 is inserted into
exp_xa while robj->ualink_handle_lo still says that the BO has no handle.
A later export can create another entry for the same BO.

Initialize unique to false so the zero-handle path repeats the loop.

Fixes: c67cb19811ec ("drm/amdgpu: Implement UALink handle export")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index ab56420..c6b7122 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -1819,7 +1819,7 @@ static void amdgpu_ualink_npa_mm_fini(struct amdgpu_device *adev)
 static void amdgpu_generate_ualink_handle(struct amdgpu_device *adev,
 				   struct amdgpu_ualink_handle *handle)
 {
-	bool unique;
+	bool unique = false;
 
 	do {
 		handle->handle_lo = get_random_u64();
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
-- 
2.53.0

