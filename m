Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219623D7FB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788915079; cv=none; b=PZqKvFwpzde9iDUllHiJgsz35lVUnI5Cp0NU1fAbrKd2NRaSKvqAkmzJP7frGoq6awVl0fQAe/iLCNPrjpwuaRK2Qac3J1ltnUhQchtt5itvXVqkZCFE+NpMS4S1moEUfn0AMiZ0tpQbsx22dJ1KLh8zZenuMnpOytB4pc6fLVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788915079; c=relaxed/simple;
	bh=+ik8cZiPqcNSwaDFXiSC4ObuaQ6oDEisoSRIBnXGQ7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y1aelAxleVszUOZR2c0dF8eb8VZ3Yy88mL/qz3AwxJpdwrile0XV/nuDQuPpZSUJJsQsweo4q0vdJRVoM31J844kimfJGBxLaErpQOpxTmZzxrOoxQ0S8+DrTnN8TK+OEW2tg3ehzSZC/3auDJxC1rA/S5xWlCm6dpjXHY0mgG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbw0rEWm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbw0rEWm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d9201076b3so57986535ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788915078; x=1789519878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=baACqoR6L3JYv00TizDf2hVxbGGX7jA9LTlR9p/Nxp0=;
        b=sbw0rEWmiHzkuR3NTYR+M5j5noGh15y+U2V+wOoG4kxQAHOVxBO8vn5QwaVtnHi+HK
         zXymzbBBTCtMBL9CTqakSFFs/73kjrjZ4I/zFgfRtStRvkDIK1ImS+QfTiwBAxXMHIEj
         t4sNXMv1+qpvhD+wQAIvMXuzPsQAjoeeB89o3wk87ooPdlXt40rPd6Zvf53yM8Gm3pF4
         gFduS9c9V3uEos4qV2eNmdIw4oTJb7Vf5ehLQEmvpI4bWcyFhPQK7zYJo77tonjFa4ah
         LGO8W2xhZrHEju0yQguDINexOaLZELBKGj2bCt3uIZI2HTy/ZJ7gwES+aVq2NEZvp6Zv
         1pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788915078; x=1789519878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baACqoR6L3JYv00TizDf2hVxbGGX7jA9LTlR9p/Nxp0=;
        b=Bv8DpJm3wh5L6CVWFoW2GB+wzkq662h4NqJQuG6MwAthIDiREFJpOd5LSrSgnb83De
         tw9emkWo1lMXczi/NhXpJkqzQ4zs2Lp5uAFSlVHmfk+kib0TJQkw8z/2IY9N2oOtsfQP
         5hWK5v4Ew6mlA0juaTOi9FldLYoso7w72agNok+qlM1Kfbh7B6pA6JhEts5uc3uKiqkH
         YevWl3Ejk3vClISDNjPwiWeglSA/1a5ibpLngLcOO64GFLZ7YhgFXOC5Tx7k4N5drLQF
         2arXFL5D++diYDv1DX1Zio4hSZzdLWbf+bk9qFswuQDbwbFveSYowmi/dJuUrMuYVp+F
         VBEA==
X-Forwarded-Encrypted: i=1; AKwUvBy0nt4mcnnokrtwCr94IUQ965Lx20t5jwM2CW0E8lmhWHBSGZ3kg59UNfWb8BAQTFP+QtLs/UNoDVHR0aI=@vger.kernel.org
X-Gm-Message-State: AFuF++nF2TgoEuG62mM4E05oG0woSm/fO5S/KAj45TM4TbQxaMR/es6l
	F3ecBkQ1kvVIeYD58i4Oylgvr7CUSZrkjL7qlBhEttIRhysP4u3D4CzS0UfiJU8=
X-Gm-Gg: AYBFou3gKnLP+U8p3CahcbvxKwZjd20EHvhozzmKPjU1DR9aGXN/YHW+hTn57wiPMDK
	zACxW8A/hnm5HfKgpTxyhOr1FijL5HEaoFbA+TblWKh0FCQDHpE+vaJ4v/VO6A5JBqCGImiwuaK
	z9yeMvjgxh+RvqsAq7i51XDjRcgpI9ComA+jHE9+4TtWYI396zM3hsy9aJuyUjED43m4yJbeujE
	0wqZJLa5jgEYIQ127CAn6hGf6tRZOsKaEz2+iN2ZTNb1jVG7Jc2t1N6Un+rOF8Gpl241M0hFub3
	Y9YFSBPiXdPULRPY0+szrfZXiispb3hBIIngXZ/vAQXoGITm67ndh1EByX/TZ+akFIphXhw1NSu
	Opk3su0G3Tclk54eJR5ocdRZz5ReJcxi4BpgJ0LTMTR+HeZEZvDoM/NKZ/GkO+Gpc52bAEfqnN8
	IEhLnmE+1SzlKLpig3S5Py7AmF0avqEypGwpLDoffcIWHm6jLSMS14mgRsXawGJepn+Eqg3ZETQ
	nG4RMvG3D+bmHxe
X-Received: by 2002:a17:902:d4ca:b0:2db:8019:847a with SMTP id d9443c01a7336-2db80198935mr80705225ad.9.1788915077702;
        Tue, 08 Sep 2026 17:51:17 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:f6ea:9d29:b387:9ed5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497e9e5sm63905685ad.38.2026.09.08.17.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:51:17 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] drm/sched: drop the unused entity argument from drm_sched_fence_alloc()
Date: Wed,  9 Sep 2026 09:51:12 +0900
Message-ID: <20260909005112.278538-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fence_alloc() takes a struct drm_sched_entity *entity but
never uses it. Its only use, fence->sched = entity->rq->sched, moved
into drm_sched_fence_init() by commit dbe48d030b28 ("drm/sched: Split
drm_sched_job_init"), which separated fence allocation in
drm_sched_job_init() from arming in drm_sched_job_arm(). The deref
belongs at arm: drm_sched_job_arm() selects the run-queue via
drm_sched_entity_select_rq(), so for an entity with more than one
scheduler, entity->rq need not yet point at the scheduler the job lands
on. Reading it at allocation time could bind the fence to the wrong
scheduler.

Drop the argument. The sole caller still passes the entity to
drm_sched_fence_init() at arm time, so behavior is unchanged. This also
removes the parameter-name mismatch between the declaration (s_entity)
and the definition (entity).

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
Targets drm-misc-next. No functional change; compile-tested with W=1.
---
 drivers/gpu/drm/scheduler/sched_fence.c    | 3 +--
 drivers/gpu/drm/scheduler/sched_internal.h | 3 +--
 drivers/gpu/drm/scheduler/sched_main.c     | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 096fe28aa9c9..b7a4cb921234 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -205,8 +205,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 }
 EXPORT_SYMBOL(to_drm_sched_fence);
 
-struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
-					      void *owner,
+struct drm_sched_fence *drm_sched_fence_alloc(void *owner,
 					      u64 drm_client_id)
 {
 	struct drm_sched_fence *fence = NULL;
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index a901801fce85..32d3ddb820be 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -58,8 +58,7 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
 void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
 
-struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *s_entity,
-					      void *owner, u64 drm_client_id);
+struct drm_sched_fence *drm_sched_fence_alloc(void *owner, u64 drm_client_id);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
 			  struct drm_sched_entity *entity);
 void drm_sched_fence_free(struct drm_sched_fence *fence);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6cb6f9546493..e4835b99ca60 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -612,7 +612,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 
 	job->entity = entity;
 	job->credits = credits;
-	job->s_fence = drm_sched_fence_alloc(entity, owner, drm_client_id);
+	job->s_fence = drm_sched_fence_alloc(owner, drm_client_id);
 	if (!job->s_fence)
 		return -ENOMEM;
 
-- 
2.53.0

