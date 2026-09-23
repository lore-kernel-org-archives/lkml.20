Received: from mail-lr2-f0.google.com (mail-lr2-f0.google.com [74.125.230.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4253F6A3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175401; cv=none; b=bCApi6UQpm5QX3dTs4LN9/rAXC9qnEvTS2tc82BiOubCGIitnHluPkuF/JQHvfXQHEvKaZVX8j5NihGoTq8R9+7XHmZfd69cYBNsP3BtPWPWic0Fuf44AuW4JNvELRsN4g4/Sa0caxrn84FhEZRBG+HtIWHXPUOIVGYw7ZPBASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175401; c=relaxed/simple;
	bh=OH8uQ9VNAZOQyUECZ3dFzXsuD/WJGTQjmmIL/oLjcgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A7bNixwEw0wV8LaQfHez5h3UYnD0IrsvWm/GAKlZgFDC14haENHih1ERroCzCYkeedODojn2QuLY1Hk0XPcIXQoTNp9gZPOOg2rQ41ilTLXAcuSnnUaoijx4K0Rt6NTwacsVyxFybo01tgoVOl9FHISxRb3D8RmNDF2Q+ClbStg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzRnqFv6; arc=none smtp.client-ip=74.125.230.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzRnqFv6"
Received: by mail-lr2-f0.google.com with SMTP id 38308e7fff4ca-3a5e5207dcdso6394361fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175398; x=1790780198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLyY5MHaKq4xCUtb5Tr0mqR1G0KiRq9dtEBuRM3TfU0=;
        b=gzRnqFv6c+rxPvqLkGG47yxdiMfxAmQQHwmNwXVKXUNyRxCTuEBzM7lbDQEZdB3iIn
         LxCdox+tgkbcRI18L4XQ4AWNPdynQhywn63l419Y5yZbuZoRpfdp3bMQO5PkgNtHjosN
         qh4EwAVINOtHm5Nz5kUd02gBXAxwRwd+On/ELg6wmgl01Zee9nwNVUmKdQeRRL2vs4Eb
         dryEYQD4ql+sXd2Ha0EbyjG6QBk5DVyMml123z5+hYcNdbzVyJwRB0lhicnA1g0kbbFr
         9gB+L0IaPg53JBetwHVusHBJfUiBUSUXV2ArX7AAP+jm7KsjUtRyJggXXZMREJjP/wYN
         kc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175398; x=1790780198;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLyY5MHaKq4xCUtb5Tr0mqR1G0KiRq9dtEBuRM3TfU0=;
        b=AOpegrUrkeC5t3VBdV7IezHP3413yb1hXHQorQiPp3yPOsoU+2/Q3I8vPC3K6c+BIJ
         cWaWXI95FO8JxS5yO7a8XmsA6XH+Jn3ZWetDS6e/YfI5xO3bEceFmamA6ngl7Kx6bXKp
         ueME9/uDBOVCnqGk+Mqxv5S6st/WphMtQtKVWkedARRZI4WBpQMr4rzTKqiZfrQhDLTW
         2wJcy8yhjzyh4II9CqmUeyb4Rd/cc/O16xd+u3YK2z1tXEiBI6rANVwCLvjyi39sbkZP
         vV6Kq++qIWOV7pz8vAtnZiLkhZGFeYdrABSNY6ZWazRs1qlRDalm1bPXzlvXYr0Dcbg4
         bI5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyKlPYlhinuoVx2gwV31QoaKtn7EichvZd5OVI0FUC0918Gt74+4eguV128Oi1AlgLXCgxObNN94z0VWk=@vger.kernel.org
X-Gm-Message-State: AFuF++kyDvFt7l7vPrFZKo7Z7KUiyZ4H7uou5p6liNaAYJw8ZyLIFJb0
	xWZRh8RL+k14mhb46bUsPfZKjdDZnqshzaZw6YGQNpWTafetIkxdoEoI
X-Gm-Gg: AYBFou1//Cl6jfclNkrdukoIwUGmLJoHNTNVTWF250OsKAsio0dSQrxiu/HF7zLSJUF
	IjRAzEBvYl3yEBB1PUuQqN3QQIZUvHnmSIKTLbpqhlTgXnjVXF7gOz8ZJfTm9zKakT6yglhy+J0
	Vr3lXjmK5zbWVkxxZEU4f72M1D2N+/athKZq7jP5agl76BZmzZXuTAQCUgcJSCWksJFvLSZl9mm
	b5XJailqTpJxZ+PCts7JgNiJXMSaE1H2Bj0TrUI3nbWXBXzABKDL0m03ipYInGTLjR1+vPikXpl
	9jA1ObLXgBKjQV9sdsXl+8mgX+4nDPtBzQYRl2wfqINwOwwFBiteixFRVGDCe6EIPVCSQnECoYh
	H+F54u6zSqaHxEeIjHqjKWifoCyfXiqc69soP6RQM9SW97ptToAhZ7XqgMEdz7oCWHX/LVFdZpl
	6ZY1v8dTtOOiU/2XHKzZ5GTEX7mWbvelLMlcW9cFXtkQMhdI3DPwGSO0gvDPgparOIOBIGEVj9/
	j/XpL7nO7JiR0mL
X-Received: by 2002:a05:651c:551:b0:3a5:3b80:8f58 with SMTP id 38308e7fff4ca-3a63056a748mr6382501fa.6.1790175397496;
        Wed, 23 Sep 2026 07:56:37 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f53b4efsm7512171fa.39.2026.09.23.07.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:56:36 -0700 (PDT)
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
	Jesse Zhang <jesse.zhang@amd.com>,
	Fang Wang <32840572@qq.com>
Subject: [PATCH 5.10 3/3] drm/amdgpu: Limit BO list entry count to prevent resource exhaustion
Date: Wed, 23 Sep 2026 17:56:20 +0300
Message-ID: <20260923145622.76242-3-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923145622.76242-1-roman.demidov.nn@gmail.com>
References: <20260923145622.76242-1-roman.demidov.nn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Jesse.Zhang" <Jesse.Zhang@amd.com>

commit 6270b1a5dab94665d7adce3dc78bc9066ed28bdd upstream.

Userspace can pass an arbitrary number of BO list entries via the
bo_number field. Although the previous multiplication overflow check
prevents out-of-bounds allocation, a large number of entries could still
cause excessive memory allocation (up to potentially gigabytes) and
unnecessarily long list processing times.

Introduce a hard limit of 128k entries per BO list, which is more than
sufficient for any realistic use case (e.g., a single list containing all
buffers in a large scene). This prevents memory exhaustion attacks and
ensures predictable performance.

Return -EINVAL if the requested entry count exceeds the limit

Reviewed-by: Christian König <christian.koenig@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 688b87d39e0aa8135105b40dc167d74b5ada5332)
Cc: stable@vger.kernel.org
Signed-off-by: Fang Wang <32840572@qq.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-23468

 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 22d7b7c504db..ca0d82be5c9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -35,6 +35,7 @@
 
 #define AMDGPU_BO_LIST_MAX_PRIORITY	32u
 #define AMDGPU_BO_LIST_NUM_BUCKETS	(AMDGPU_BO_LIST_MAX_PRIORITY + 1)
+#define AMDGPU_BO_LIST_MAX_ENTRIES	(128 * 1024)
 
 static void amdgpu_bo_list_free_rcu(struct rcu_head *rcu)
 {
@@ -230,6 +231,9 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 	const uint32_t bo_number = in->bo_number;
 	struct drm_amdgpu_bo_list_entry *info;
 
+	if (bo_number > AMDGPU_BO_LIST_MAX_ENTRIES)
+		return -EINVAL;
+
 	/* copy the handle array from userspace to a kernel buffer */
 	if (likely(info_size == bo_info_size)) {
 		info = vmemdup_array_user(uptr, bo_number, info_size);
-- 
2.53.0

