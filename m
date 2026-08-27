Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929A3DCDBF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873484; cv=none; b=h9BLUXI/rHLBgLfffbBPV8So8q2k6f9LhxQyDhPO5rvrku2Nphlq6NAS/j/KmpGPftO52s3jhP3Pvr8RHu+726rs03+lHY5gYJbsgC6mR5mVUnH3A50iAn5gKvkZjyMEJLZNQOPe/iNbAYI+adXefQDM8PwyqZXQl2N1zx7Ad18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873484; c=relaxed/simple;
	bh=/Etwo9DLyA1piEjryJIX/y39Y2LuaF2Cl5MFeAEYG5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AUYHFL8PfB8j0qi1y44eX06w/QETkcl2lyYwKb/3BBk9i55TauwFu9mVQW3xwIRkjUTP+t8JEsvVmJxr3zhdzZ0NO7p8OEcdjQrNFVd0RWGu0eyUFro6KtrjRqgbfMAenCGz6xT7x8QReaB/ETjG5sZiIfhrULmGK/0jQtq3xcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=INdbKFdq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="INdbKFdq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39686abd426so316512a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787873482; x=1788478282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyiy2y/avbYOe0BnQSrLgYOVHtwCGX72+qfVpLstJvk=;
        b=INdbKFdqr+oOKdIS6fNi1KjYeQqVP7cMehmHLqCakBHQCuVKkVloj2KQZX+2BIBR4j
         7kx7j83xIdi5cJsqnzr0XtbKYuBqmf408X3Y2EtY2kDHueyXTQtEKwB3USshpEn5cQ6j
         ZKzYw1PXgAO+eq+bNA4DiecxtFzsaUpDox3y9M2kDqOta08fYRDnNYrHFTK+Qq33zqfk
         nL1JjiXnDvLpc4ObbkYQ+ze1EVBS8YI4DK0Yce5R7v7HIgvbm9HHjqja43njYFTk5Ao6
         3UPFGS5I9z3BQjaZ8QOLOd+GeRtxV2+Ffi0kyySfLCN1+ojKAIh/CkIsCJeAWhFofz5a
         UytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873482; x=1788478282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyiy2y/avbYOe0BnQSrLgYOVHtwCGX72+qfVpLstJvk=;
        b=CI4LqmZ9bckP0bOv8Ogjcs8FebXoMtVx1VwLN10nqRfUIjSxMzN0aI9rUdz9SLBWF8
         QrDT9Rg/4WVHio4x8jsHViSqbflYocngdFrz5tiY3T1AJ6GkcIevB+7M7SghSNrjtoYT
         3zBR6PN6HUmBdCP6qV0AnP1gTZ6bAXtPWGZ82NYeUTJuvQqDugAZS2X3ppNW0pbLPQfG
         VR7bE3Y+dTRDtgdr0oTRK2HAOZUbiBVB00HJVw2z+k2xGxrLsFerNPL+ZnOsHMTVO4ip
         lBsqFVZtgOQymIKws2OnBJbs6qFLMoUOg/Anhbgl9/FmdljP+BZoXwHAj6V1wfh/mkh6
         Cc4g==
X-Gm-Message-State: AFuF++le9Ksn1oJJ+zEDpJicTuKAdOelsgoO+cIkTnZRExJnPoi/8cem
	bZZuJ/mJtBaPmvI1kCCqh/5LDJVprwnb43daUOQdPoawdciKd+9zYLpGnrmqf6xj3qpzZwUWJZG
	EB2V5kTw=
X-Gm-Gg: AR+sD13b+i6g3Z0J8LZzZ7AS+4Of1AniBMaIuC17V4Gf1yX8x/zPrkfhfLx81ZxaeJl
	lK/ZKTLNgpfOE+tfCg9MqvuZYudveAP90OWX2Mz7serkWdubVoUpvoXemOFcP5NUPZz5CerXFN0
	2o3BwXP3Hs3NZ9CVrupuDGDxDZJf8t68ONhRTJB35/q7Yqo9qSxpa32vPOHp1d/JZ5LQgnj+bQZ
	ZRVDwvR5MOdqpKO1RZhew24bNF1i6s2OICRDc/LtRetAPyn9FsAbmObQDU/t2shYYm/uR2T2spD
	emVl/SZjqS3/gNhecYCRx9vQF2gf8nVhkT+1JrhCK9GJZ2ouoMJ+X88Uef5f2PsPnmnqYjj1bPm
	w7XLvaFRGTxhd2OeBzIyJVgHzSeaHTWZYpH+zo58RP0NbItSoeUKZiafHtXP9oitFf05x4DLPhQ
	QtGB4yhl9tlAcnpKeMgBH4O18ciTIGLUvmIDnbxMrbNQ==
X-Received: by 2002:a17:90b:1c0a:b0:396:54ba:8932 with SMTP id 98e67ed59e1d1-396d104e722mr3685624a91.16.1787873481701;
        Thu, 27 Aug 2026 16:31:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4a::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1ab4e12sm4501710a91.16.2026.08.27.16.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:31:21 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: linux-kernel@vger.kernel.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Joe Damato <joe@dama.to>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org
Subject: [PATCH] mm: memcontrol: raise MEMCG_MAX for charges that fail without reclaiming
Date: Thu, 27 Aug 2026 16:31:18 -0700
Message-ID: <20260827233119.411152-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Charges that exceed memory.max and return through the nomem label can
raise no event and simply return -ENOMEM.

A non-blocking charge can hit the limit, get rejected, but is not
visible in memory.events.

This was noticed in a production setting where bpf_mem_alloc() attempted
to refill its per-cpu freelists, which triggered a non-blocking charge
while at the limit.

Move the event so that it is raised as soon as the charge is known not
to fit.

Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Joe Damato <joe@dama.to>
---
 mm/memcontrol.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1271d390b617..3904fe9a7b2e 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2683,6 +2683,11 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 		goto retry;
 	}
 
+	if (!raised_max_event) {
+		__memcg_memory_event(mem_over_limit, MEMCG_MAX, allow_spinning);
+		raised_max_event = true;
+	}
+
 	/*
 	 * Prevent unbounded recursion when reclaim operations need to
 	 * allocate memory. This might exceed the limits temporarily,
@@ -2711,9 +2716,6 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	    mm_flags_test(MMF_OOM_SKIP, current->signal->oom_mm))
 		goto nomem;
 
-	__memcg_memory_event(mem_over_limit, MEMCG_MAX, allow_spinning);
-	raised_max_event = true;
-
 	psi_memstall_enter(&pflags);
 	nr_reclaimed = try_to_free_mem_cgroup_pages(mem_over_limit, nr_pages,
 						    gfp_mask, reclaim_options, NULL);
@@ -2773,13 +2775,6 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	if (!(gfp_mask & (__GFP_NOFAIL | __GFP_HIGH)))
 		return -ENOMEM;
 force:
-	/*
-	 * If the allocation has to be enforced, don't forget to raise
-	 * a MEMCG_MAX event.
-	 */
-	if (!raised_max_event)
-		__memcg_memory_event(mem_over_limit, MEMCG_MAX, allow_spinning);
-
 	/*
 	 * The allocation either can't fail or will lead to more memory
 	 * being freed very soon.  Allow memory usage go over the limit

base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
-- 
2.53.0-Meta

