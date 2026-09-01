Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8C4471D02
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260385; cv=none; b=C+NmtX1w31HKV2MUaGoOelPlLJMMaXgc9vIM1gnEM40TwVSwOzD8meCPQaZHCo96GUhnlRhwF8LD15+u0msi4FwkCqLFgMaYNUFPxnRBtAWWXexQwQMaMqaaHMjDYK9hJO9m78hxa61KO2ejjQkzBHE6KBps7NDeHcVpW2JpeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260385; c=relaxed/simple;
	bh=v3cXm9aO3Rd7JzKEU3sl/gy92NwMmpNDErCtcvlmbAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sq2pbWza2NOz2MRpCPDF6+QylUEceyX2VUg2Y409oveLafte6w1fmxMfMeaMaLOx4MeAgK3MocSP2qWA5CMQHrInQdeQf+Y3GZj5zqD9Jlhy0DSUkUUCfNIPUQ6pGF+GYDa9E2gT83zr6B0169+ZAoCGU2BgLh3leF4cFTmEr0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m57ZV8qQ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m57ZV8qQ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1039556a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788260384; x=1788865184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5kRAIEtptDuoDIWPjplgkKnNy7su8uVe41K8WELHNS0=;
        b=m57ZV8qQDJIlHzUXmd3vBOJibhmFwKeJSIoo7Oa4dKKPwLm390IFsJVzMn9aRv3zc2
         EKCoeqxmEazGOLRoxl/t4QZvBWzMusFpwUI/cfOAaaCU5pIHjoX1nVCxDPqGKwVLUIsY
         4YHvDk7EstsqXsXUjRRj7jdYAKe/AR39GXGeachC+OZqzd6eeT7mBsQMUVZhcMAjlZm2
         EBvQTWUp80Mj/aHkcYuaUjwfDATjk9upC7zFvu37BT2VA5oecEz4+/L25SY5UlUAbfQ7
         0y/HHuEHW7DIXBmSE0W+OjD0WO8+CKlg6m1RnAG5o/8obZjdYrCuMFtBwBih9kkNL+qY
         p3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260384; x=1788865184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kRAIEtptDuoDIWPjplgkKnNy7su8uVe41K8WELHNS0=;
        b=dVQPgDj0R1clIDmUDSWITrz2LheyDoLcNaF+UG+82YYwQve4QwfzGob4sCWLJJnWH4
         auclOzwuQ6ij3dBHbX6WcwSSSWyFatFSvf7qeyo2xrBgJ2JRKVx14pQ0aNVamGMbitBz
         mBa5OMWOeaa5+siQkhiYqcLO4SO1W14kuMJJSAlF33TkNbc4X1vwBTFYlq/ngIftCkE+
         sRIhfxGMZkWqG7MftvP5hWoUBgnXbgYEC8gvrT6z1OhJd8DgM9yfQOKIpomkYgYbAYUB
         nxPug2Arr4CpdRIaNUOOr6sVPb0JcypqMxIdjRkUGS4L+QBGKTYkUdPN2jDjh3c9C1Tc
         EADw==
X-Forwarded-Encrypted: i=1; AKwUvBxX+qJpS4ACTm9DCR6/mlaclLuhKgLvyMmHkfDXkQs2ebcUuKkzEyM2wXZdULtprYLtZHDGwHxja5Tak6k=@vger.kernel.org
X-Gm-Message-State: AFuF++kVQ5HP4w9GsfPEV5L55ax8wcL0YJ0O6DYLKBrJMHC2GDFdPAkl
	kiJM/Pb2XtC4zLjsNfFK3PcJ+jxMLDk0w7UMXTFRL/PfUN6J2ZVrz6tu
X-Gm-Gg: AYBFou0iS/LF+gdNIt4q93SdkAGkwyDMrfS8pbKUbZ2+pA89rJn4JCPXyP14OrRZxcF
	Z82R/FgSGCKmxi9u1WDpwuCuDkhvBK1ooMgzaCa1RdrgG6Pc+mJonErC/tyiFZeCG+jQTYDLzJO
	fy2iVDU7OdDTh+SZbTUxrkt9jkjFEl+2r9KqeOMVA6bnqwELBFKoS+5guWvXQdeiCi05PPpmf7i
	Ts+E18Gk6QmYl9K4+ru0pNwoLlbgCs/xJErMtuZ7KXrfKGevym/OP6li+KTmdb1bvxU2js9rnjh
	+G6DXiN0EOZjorBCf44Zc5HcBpMKjXa4mp85oSrw+wamu4CnHttavQsyQcv6QShsvHJ12k+uHKF
	KebpSy0Wvhsr/DmI+349GEKqV9a/Ko6NkAgUm4WgSbiiSd+VaymEQCi/+S+We953U1UwC65QjBN
	rIZv2QtLW1o2MkzNpzDENsaxgOmwkG6Xe8EQvYEn1hoLVOuQcUkzWGvvLMYJg2Ro3Q
X-Received: by 2002:a17:90b:4a01:b0:398:c6e8:3fc2 with SMTP id 98e67ed59e1d1-3990f772f5emr3422761a91.4.1788260383779;
        Tue, 01 Sep 2026 03:59:43 -0700 (PDT)
Received: from celestia ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d499811sm6303184a91.10.2026.09.01.03.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:59:43 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/damon/core: fix quota could not be set to zero
Date: Tue,  1 Sep 2026 18:59:51 +0800
Message-ID: <20260901105951.106246-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the temporal quota goal tuner determines that the goal has been
achieved (score >= 10000), it sets esz_bp to zero so that the effective
quota becomes error.  However, damos_set_effective_quota()
unconditionally clamps the quota to min_region_sz, preventing the quota
from ever reaching zero.

Fix this by skip the min_region_sz clamping when esz is already zero so
that the temporal tuner's intent is respected.

Fixes: 8bbde987c2b8 ("mm/damon/core: disallow time-quota setting zero esz")
Cc: <stable@vger.kernel.org> # v7.1.x
Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 mm/damon/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 53cf32f1d515..0258769b8727 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3114,7 +3114,8 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
 		else
 			throughput = PAGE_SIZE * 1024;
 		esz = min(throughput * quota->ms, esz);
-		esz = max(ctx->min_region_sz, esz);
+		if (esz)
+			esz = max(ctx->min_region_sz, esz);
 	}
 
 	if (quota->sz && quota->sz < esz)
-- 
2.55.0

