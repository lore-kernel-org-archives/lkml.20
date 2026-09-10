Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EEC320A04
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002361; cv=none; b=jDS4HWDVAsfVuelqDRLtDb0duUa7NU676ErlH6OmI4NdzNnfXr0/vk5klva9OC/IwsDOBQF3+gkwiNzJgRgGF8DP1qRifE3PAXpQXYtJgYPFXt2Sw4hmrgNPtW0EOWRQre5fSlCa/nRtpbp81gVJM+xrwK8SjZT+ZqWrUIFSGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002361; c=relaxed/simple;
	bh=nlsjJx7rR4JBmgesXy3F5yqfVQCsDw9hw5rlOkqOObI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qGxUBwI5du+ugOptQU9Z1TJSqAbvQpg6J4KLgv601pVIWsXrYfp6nMbvvSjg3sQ///5Ujm9UotDmF6QsDbUkozTg2GiOz/LE3+SXB7m9R3008IavKoSvyvZKhR6gS9uwLrcAGhLwAgUyKDhsABzhs/oYGsMLbWjVqC6m1KQg2mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O15mu4I6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O15mu4I6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398b3d66515so6649191a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789002359; x=1789607159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3KZVybWmfPUW8DJx5y+rAR9UZPpXnS8RWCoLGg5ZjQ=;
        b=O15mu4I616K1i5r0fP6q8I/IGdRvcNQyZAp2DUP3XuAN61rGfH3vQAgkBOVQtVNKzP
         Bz+2QXN7WOCPCONVmw+IaehB4yvLLADwxZQpB+NjAiObRQkH9pIBogUXK7UAFCtkjAW8
         WQIKh3HLpF5jg2kXMJl/CYjafOw+DRoxvbmod2jehCSpZdtOhdNNRuXigVL0z0FXcu13
         O85o/BD49Bgt8AmKuPkXpi6W11nQGcu4d8W3qgFhl1JdjokB00zsHcGjbaYcTogh38ZD
         DBS/k9w1qrav8fXQHHSEucMF3vrXlFJOm2Xb5uN9bWOfWJQlGNGmh5cYvIwqTYqHKq5u
         Zt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789002359; x=1789607159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3KZVybWmfPUW8DJx5y+rAR9UZPpXnS8RWCoLGg5ZjQ=;
        b=LsJjKlBVlAxxi2Y0uZNXWlQiV0e3ewxyfW3AQQAKtHcMjLsMIT4rDdF53eiYZVDPGT
         SCL8gF/9Hrult+R7YnS0d6P6jevlI9x76TqpSkGukw2RuaTnd/+qa22eS0KgWULPgK72
         SdaWXQ0bqNWYAKEUhwgtxD9zuaEPJXUvO8zckDItoe0iMKXewhEcfA7REsx9kHTxfsN/
         jp+ANfO2L+OtWq2CaPhneMsWptrEadf0HES82qn+G+Id14hwu9s7nHOAy0JNEWI29XtK
         3EkDpWik/uUZIzOXnzvAzJ7K69exmF6Mb0G27VqghZgObewQBOhh0CDcXREE7VuD/+Ww
         LdHA==
X-Forwarded-Encrypted: i=1; AKwUvByH7C8lXoWZtbeSogXSvgemu0hN7K5GNgAdmDwGJ1wlVewY9QDmNiQ4f8Lig8kkYh/2zV3cJn1tUYPsxXo=@vger.kernel.org
X-Gm-Message-State: AFuF++kGw9t3SBokCayXTzQD8RAo8T3Rf7obwhSRDoOw2k21uaq04jxo
	KQF4SLMsDf/x/bY8lyHea/HadB3qLuTqF0JXx661V6roUHsUFBwn2Yo=
X-Gm-Gg: AYBFou0JQixLuO0+rKrC0TVonzA+kqIw+pf4q3KL+vuniOd0N6WXdlF56JSCf6d58t9
	Hn+S5HLXNLV5/iR6Lz6Ln+CREbWdHL7ras2W3jwYF8yP74sYufSGYlzoAzyetav6MCehfratZ7n
	Po2UgsXJRsa8BORi4UMOUU6r8pF+bWwzq1sU40eSVwtWPWiPy+hSe3Ersw1hBWQmEElooixhMfu
	SVAdQKwvMAmqpTVtH+FTGfxgy1fImuiz13Ey7bj/Ua2dfjvHLG8cK94At2efvcm0BbqGRMj7PCG
	1cB/gSZ7zlrF+nY90rM7V/5YM+ya9/nt2ir8BVTNeXmM+h0syD7ov3Jdugl8o4xJ7tXdSEglbFv
	LBM/NimFS07FoJ4qCPTcbPxtWj1pAjda255kWUB8UZHhalHlxVoruXmZ5SBuCqhj1kcfXrhyJPL
	Ab3bivlpv2NbQb41OgZHOf1zN9Ox+xRxwwHsWSeqWZ3hR8eAHSSJZKGksHrxQqes7uA2xOWmKUP
	p2ZbjkTXjYxq2Ly3RpmsSTHDw==
X-Received: by 2002:a17:90b:35d2:b0:396:d28e:bd8 with SMTP id 98e67ed59e1d1-39b260fe242mr59283556a91.3.1789002358576;
        Wed, 09 Sep 2026 18:05:58 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77608fb4sm2231505a91.15.2026.09.09.18.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:05:58 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v2] drm/sched: Drop the unused entity argument from drm_sched_fence_alloc()
Date: Thu, 10 Sep 2026 10:05:53 +0900
Message-ID: <20260910010553.531847-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit dbe48d030b28 ("drm/sched: Split drm_sched_job_init") the only
use of the entity argument of drm_sched_fence_alloc(), fence->sched =
entity->rq->sched, moved into drm_sched_fence_init(), and the now unused
argument was left behind.

Drop the argument. The sole caller still passes the entity to
drm_sched_fence_init() at arm time, so behavior is unchanged. This also
removes the parameter-name mismatch between the declaration (s_entity)
and the definition (entity).

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
Targets drm-misc-next. No functional change; compile-tested with W=1.

v2: trim the first paragraph, which read as if the patch addressed a bug
    when it only removes an unused argument (Philipp Stanner). Capitalize
    the subject to match the subtree.
Link to v1: https://lore.kernel.org/dri-devel/20260909005112.278538-1-donggeunyoo.kernel@gmail.com/

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

