Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794109255;
	b=Sq8sOynIrumiAkJq9pBhXFGkGlq+knqBE3ErTlD8WmuQoKVr/Js8Ez7CL1f6SiK/+yIc
	 VbLduZhzqUbBVthHamvXDaO2p6bRpw9LchHLEb+Ybq/0MK6+6r94FZ3KDEQLpi/0wLE+e
	 sR+Ng1jJ34S2RfPpvG2ODGrkYaPJZmCmX2ppfiQQBcdd4cdOnzIqFjciAkekJvfvYW3Ma
	 Pbl0a1o3SlmKpq3k7/5D+zGpgUZFdWH/z5thoPxr+P5fdNmWfvJVG14Vz5PLwfrVEJIzc
	 PZS54fk+CVddoCJqSlYafNxY+ACIa422H+yBoDG83JSfgF/qNiXsT3ZNC32U5bEhnIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794109255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=ZXPOl0YSd6S/HY373Pp8Ndi01/j4+eSRlC/6LdJKdNo=;
	b=aqcL9cYg6xVk7ihrEtXcnHXgcPoGdxAAzHrNo+8qoxTyVl+LPamJoVLYtPvGnYtB40jy
	 Upw/QyIHpo9oGz46blCF/yEN5KdEjCgEV91OW4tjFqCVJufKKKBYr1vW4uoNzNXa2+ZoB
	 SMHp4PrtxbiI8bPzV/QnaOCObH8/Ka+zhqKi71xoSXFp76Gi03tOtGANOHyrbDAENRot5
	 Rv/H2hP4ci1OkSXT+AexrUqJcwckdpavMFXsO40mGenqPfeUtNuAHgyFklH2r1WAvVeP7
	 05N9vxA1E+uXaHwM9oJQM79alvP8wO1F1wiEdYqST6faK3okvn3KhSphaOn5FjFpnPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ssV0Ow6m;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD1F606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ssV0Ow6m
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so30896a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 19:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794109254; x=1794714054; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXPOl0YSd6S/HY373Pp8Ndi01/j4+eSRlC/6LdJKdNo=;
        b=ssV0Ow6mgW7f5vWoB5Rm9hkU/P9UCskCMT0YZ1fcy3WfqJu2hl4Rj5Qnru/7scCM2/
         P+W62xx+jEA59fRFnG+o4efOP5Do9D9E1giXvA6mVrNl93JK2k9jy+ps8heTQgdZfQhO
         W+J/6T+71fAMKiKyA7L73pVBucx6LdgQ8O9s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794109254; x=1794714054;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZXPOl0YSd6S/HY373Pp8Ndi01/j4+eSRlC/6LdJKdNo=;
        b=jpU4Gfojwr6zmQE5NOxIHwY41XQoRgdQAVNauZkkwPwGJ+KyU8L+dFvLkUR2RD7PDT
         lr2HmsRYv6uTcCwdVCZjOW2EgrE88qO0TWDjYmKJ62jPcCQPIC8vWuwR5FIaAPmWjU8g
         9WI3CwtHITzVuak6rVce2wjcpAF58XUMlb8x3Bw0Bps+uLDFUIkJ279Ua39ulBVlM3mj
         Ja2iU1tXMvKkOWlX4BxETh//Zj2a8QuW681dW2Fy72PZpWCtVZh2kzSzX+QvtQ9ofQsg
         3p4YKKgm1K7GrDO6mD3wmU6NvCmo7waVP3WisVhzWv0Yw9SusnXZqjN8kcLya3WGQiZo
         M0iQ==
X-Forwarded-Encrypted: i=1; AL+hErFW0l21gNFwjHXwBwMOHOKToY6wnyPIVIp2n4B9RzcvWHVp129FfLEDALcrzokxxF4OSv50P4Fk2yUFfjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uDulLMabkA6YQ+kAZ8jfs2GY4c3AI1jPT0yl9RhgapeA//LJG
	QUyJM6Ed5lfd8zPo0K3pEWQgcswgGVDrmOxoFx2dLnnGarCiZ583AiQI/2kxg1dJdD4=
X-Gm-Gg: AYBFou1+uK+F7y3I8xHQqH7/5ZI6No2+cDt0tIcxaGNjEdIV5XYNXHaphBuS4XwXA+P
	wSOeKFLgBlFoMSqRe0tA4SUCKPafkpGzqxKbHLNV4TQ7LynaSoHt1aw/VD4P6nj/dvTRktHxNOm
	TlKJJS1DEzimShJt7fbhFJr+KQm3PmNTMd8l0p+7/sXPVhdc5EAnr98NPrAHrjmZNWnG8bSmh4h
	zSCDfb08nLdjn9orjENZYlBBZ0TuNidDNkvY9vx2vJHqDOtB2KmsjTvS+tkGYgHdXWwai1/vw5P
	GB6fokg08uj/Ez65kGFLuifoBhBW0CUyi7E23Zl5zaKqrD9610c6FR3kBwNs+sZsiBhMg1DogFE
	ZZkYDfLmwYoSHqijcnSFQs+ERGaPkvB9OIG1G9sZ/c7OZ0riqaiVNrSAVm8kyD7Bf3sTFPjjRTq
	8EKC2oJoKTv5XK0be4/LFbXVqueaKMUbGY4KTDmkgViFhdF28xSZk6+7HI5Yy8UYqWT3nMtPydm
	8sPhWm780UJ7OZalOKU5YDSNCdAhpfMrikvRK4sVy2DV+IKrQ0aCqdKuEIGVvCk5tQ0faGCgjSC
	wdQfDcOipXo1X8eQNbo/eBf4oEFtAsQdBgPckMoJHXsijLwGwSIRTWMEWgV30Uhavv2l6cQ6cGk
	UiMZWSzIGzA/V+EeHcWZC0M7CpNFt+YfFj0dweooZcKOq/zYjbhKOLi9wtqnlOJymXsZMWsolW8
	WEpHIbqdm0sS+T7GRAog0paQubEIwZmB5KNSf7er/Ra1pFvKBNSDxl
X-Received: by 2002:a17:90b:1e48:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b12d5933a0mr344498a91.49.1794109254287;
        Sat, 07 Nov 2026 19:40:54 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm5374560a91.15.2026.11.07.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 19:40:52 -0800 (PST)
Date: Sat, 7 Nov 2026 19:40:50 -0800
From: Chris Down <chris@chrisdown.name>
To: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org
Cc: graf@amazon.com, kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH] kho: Don't release incoming bootmem areas when kho_init()
 fails
Message-ID: <au_vQhHAcJbkryXN@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

kho_populate() adds the incoming bootmem areas without reserving
them. memblock_free_all() then hands the remainder to the buddy
allocator.

Unfortunately however, if kho_init() fails, err_free_bootmem
currently frees every area with free_reserved_area(). This can free
pages still backing early allocations or free buddy pages a second
time.

To fix this, let's only free the areas on a cold boot when
kho_reserve_bootmem() reserved them.

Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/liveupdate/kexec_handover.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3181..a566ad6634d8 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1899,11 +1899,13 @@ static __init int kho_init(void)
 	kho_radix_destroy_tree(tree);
 err_free_bootmem:
 	kho_out.fdt = NULL;
-	for (int i = 0; i < kho_bootmem_cnt; i++) {
-		void *start = __va(kho_bootmem[i].addr);
-		void *end = start + kho_bootmem[i].size;
+	if (!fdt) {
+		for (int i = 0; i < kho_bootmem_cnt; i++) {
+			void *start = __va(kho_bootmem[i].addr);
+			void *end = start + kho_bootmem[i].size;
 
-		free_reserved_area(start, end, -1, "");
+			free_reserved_area(start, end, -1, "");
+		}
 	}
 	kho_enable = false;
 	return err;

base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
-- 
2.54.0

