Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C052535DA65
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789836927; cv=none; b=scnk8r2TNLpJv71CP8hKm12g5dUU5E67NHAQAvD3eJkHdVgZUQNGsWU1V/FTpBN5EeBajBs7EDVvtmP0/Dj+TS1fESmMTJlAAsKb8aLUqOU6LziXu0T2J3J+mKZ/CHKmEJ08BbHCwcEq3yVzH/9PGolgO6j+DAA7hzHyrTfrWkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789836927; c=relaxed/simple;
	bh=xkhZfDkK6VRidko0r0H9StU1vVH7V4JFcEMzWeWmPj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M3X/ULQ9/VfcPs0EiJnJPkUAAkhUMrkx3hY1UZf3paW+t+3Xp5nuR2I9oZx3AwSUfvFWscQTtt7nrZDpBCQe0ggxHSajeCcRzvb7vLI5wqdCIXcmtaEcZbQYZWA70qgrL395ufXZlXG92LNngEmnRIJ0Cu9U+eemp7ivI9rKipE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/8gmUSZ; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/8gmUSZ"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso2198353b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789836925; x=1790441725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBON69wGqa+UQkdsinIc8KziB78dqC2CQ1FksjSvMsE=;
        b=k/8gmUSZGzzGh/wlFKYBNVaI1ntiyI1pBsUmRqqSdHDnn88XQqhxwVlwdAapBeWNIw
         a+8F/FsNj5TqxgaRQMLJImwbPXwM9r0c0f/mbTJTrB59bJ03xQXhUzguUzEJQ7V2vnGQ
         ywlKi7/ctZOHc/c7QGrz30F4YXphzol6QElcwugeiOtdG95W7dYMEX7pz4OtIQV/N+25
         da+tjqZRoDm4AcSjFxb8I5YTv3gyuPP1TsZXRfVl5yB49JImhDHDsLYDXDqJcjBZNVay
         Bhv5tq1Nm98Fz7p/Ys3oT3B1uy35LgiCdfavUovMqUQ7W7+4qdq3+UWTr2Q5GXlzkPH/
         PeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789836925; x=1790441725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBON69wGqa+UQkdsinIc8KziB78dqC2CQ1FksjSvMsE=;
        b=LEjHyEbb8soHGTzV3Oc8hzZVnOFoWSPRpNYLoIGqCQcEaBQSrmGKHvbi0s1b4/vz5L
         rXGkqZb+29oa3GE+T0HBXaVe3Ft1JZ+cBq34FzZuvNCOTPkE/okXbbSvkJlssWeMqPIZ
         N2jQIdBnjyf9w8IaVrJ0808GWNo9v52unwBPqg8rIkk/7ZdYsAaEn1OMta8Sxrymb1bW
         /FPjZC2Ths28oBb40xNm3OewEPvWBGCdsX6F0pgxTurIeo/DtkdPYvjJaj0Vw1kOSvKG
         ELaFMijDToFNqfINrrbrlz6PDGnKEVixqYSA75CKdf4zPwihVV7sfqjljItnLcquA3bo
         D6ig==
X-Forwarded-Encrypted: i=1; AKwUvBxzD1YyuImQ0GuOhoOC7T/D6HGrAFbcwvSmOK7rdgMYvHr8DPrTQKAMFyQX4Y2Hu3EhJhhr0BHj7/noJpE=@vger.kernel.org
X-Gm-Message-State: AFuF++n9I+5tKL3f2y+Ei/6l3UzLY1/0qEMuXn2OzRzZK3+7Ppa040qf
	svrQoq8CwOTtn8cX987QvRcoRz9dEaAenVs+52JHZGAnGcSSRMOwI/WD
X-Gm-Gg: AYBFou2oC1znEjglO9JReNjv62g9hH2PfPtsDKqkyAr6YbBCl7IOL+ad7Bkh56yokT1
	NzIqnl+92lv39cPiZ2ERlaiRrIaV5N/fOmOhM/1hTi4wJvo4+khQYZurV8EcU/IPFcVFqwrnQ9N
	aHTTGTIDI/rJYqWRH4KgPwVQdPYnmq9iljglEwtm/eQyQ9EZejnjInB1s5WgqhPUnqQXnHP/aM0
	mjwx4M2h12vbeOLxcH32pkAvOTPmji/VPte3zWvkx1e87Fv1geFqLP5jFqSqT1oLJ6+u0C5qb/z
	VbPwtH8RztdY7THmLISRH+1rWY1JkFa+Bp2narVsBvnSQsxBFFxhxD1ULVoXQuyui/Fs4ekIjgz
	R0F59/t2r4XNvdur7iumR3IaW7DxgWWOapREZxYSFSKDF4AkFMhegC5t91PT4NKQnn9QKj5jidg
	mYoAoccjuCFF0FZRb03CmYjx0e4jmnHTiMrhxzz2aBuR8HkjHw0fFe9g==
X-Received: by 2002:a05:6a00:2d1e:b0:878:34d7:6a34 with SMTP id d2e1a72fcca58-87834d76ed2mr2182854b3a.40.1789836924948;
        Sat, 19 Sep 2026 09:55:24 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm1146617b3a.21.2026.09.19.09.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:55:24 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Likun Gao <Likun.Gao@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Tim Huang <tim.huang@amd.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix IP instance memory leak on kobject add failure
Date: Sun, 20 Sep 2026 00:55:11 +0800
Message-ID: <20260919165511.3687822-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amdgpu_discovery_sysfs_ips() allocates ip_hw_instance with
kzalloc_flex() and initializes its embedded kobject before calling
kobject_add().

If kobject_add() fails, the return value is ignored and execution
continues without dropping the initial kobject reference. The failed
kobject is not retained in the kset list, so the normal sysfs teardown
path cannot find it. As a result, ip_hw_instance_release() is never
called and the ip_hw_instance allocation is leaked.

Call kobject_put() when kobject_add() fails so the initial reference is
dropped and ip_hw_instance_release() can free the allocation. Keep the
existing best-effort sysfs behavior by continuing with the remaining IP
entries after the failed registration.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index a404d8aa13ee..4b1ad1c0a10b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1314,6 +1314,8 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
 			ip_hw_instance->kobj.kset = &ip_hw_id->hw_id_kset;
 			res = kobject_add(&ip_hw_instance->kobj, NULL,
 					  "%d", ip_hw_instance->num_instance);
+			if (res)
+				kobject_put(&ip_hw_instance->kobj);
 next_ip:
 			if (reg_base_64)
 				ip_offset += struct_size(ip, base_address_64,
-- 
2.43.0

