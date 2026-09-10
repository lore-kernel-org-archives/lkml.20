Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858FD3EE1DB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027218; cv=none; b=guEXtpkOWQiaXXaeMYUbP3Hi1pNTlCV2ggT8fj9UikB30CignM7d8fkGcROCBetHENvMATrE17SoDOVfWNtSodAOYMX7cxkPCCvHewpoiFBCRXmo3+MYc7nFU28zxYooOOkpjnTqzGxAKWoaszJPzd6EThFcraTKO5xHBDEtDJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027218; c=relaxed/simple;
	bh=0SHZKeyaf1jZPQQID7WL+3tITkxUEHLAYf7ROaOI3TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/Bz08CMVpP61FAdOVpKmbCZR28lTTunTMghIyj16mJJqCc104g+KbqzrEvChfF8o3D9EZIx8cGRgXRsUT2jApGRFFXPOUlsU22JHr4S4NS6526SaMgFmoMtIPWjQK/18bVsdgErTy/nbc0HJYXrSDB8RILmP2EWLImqQUu2Fxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLHRmmRs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLHRmmRs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BA71F00893;
	Thu, 10 Sep 2026 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789027217;
	bh=A6O/FnKx9HiwEimzvzr069CdeenRxC9yV4dsMOzY6xY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QLHRmmRs7nmt7R0AYD2tJKkCSfOQuqIOIHZN/F0T/Pq/sP5NboYNwOXvTcDet9arh
	 1kWjRoM11ODu6f7jnOGJldrYs+TOaRYi81XhKIG8zHkWRFBl0FZfipt124lRbhtmkv
	 jWRxFjckGcoehZ66Gg0Foy28PPEEvGeg9Ji5I+0JMxFJhuqX+hU9U7p5SCWM6+sBAC
	 T14tRl7ZtrsbO2Hs8DzB2w736zeoZFbr5FRokvDYLm3gwSo51pUaS6oP4pUwgQ3yD7
	 09pHluAHbXVAclJ8LGP4IXLSJBhF6BdWpjb5ZObPEpm7JECaQ4gKTjLiVJi2xQidgW
	 1mM3/frbinVmw==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] drm/sched: Lock drm_sched_rq_pop_entity() externally
Date: Thu, 10 Sep 2026 09:59:41 +0200
Message-ID: <20260910075942.2000338-3-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910075942.2000338-2-phasta@kernel.org>
References: <20260910075942.2000338-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to protect entity->last_scheduled with a spinlock, adding
locking to drm_sched_entity_pop_job() is necessary. This would lead to a
slightly suboptimal lock-unlock-relock pattern with
drm_sched_rq_pop_entity().

As a preparational step for adding the locking, lock
drm_sched_rq_pop_entity() externally.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 2 ++
 drivers/gpu/drm/scheduler/sched_rq.c     | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index bf97508a45b9..274d7a702298 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -565,7 +565,9 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
 	spsc_queue_pop(&entity->job_queue);
 
+	spin_lock(&entity->lock);
 	drm_sched_rq_pop_entity(entity);
+	spin_unlock(&entity->lock);
 
 	/* Jobs and entities might have different lifecycles. Since we're
 	 * removing the job from the entities queue, set the jobs entity pointer
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 0464d324d98d..696792a18708 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -346,11 +346,12 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 	struct drm_sched_job *next_job;
 	struct drm_sched_rq *rq;
 
+	lockdep_assert_held(&entity->lock);
+
 	/*
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	spin_lock(&entity->lock);
 	rq = entity->rq;
 	spin_lock(&rq->lock);
 	next_job = drm_sched_entity_queue_peek(entity);
@@ -376,7 +377,6 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 		}
 	}
 	spin_unlock(&rq->lock);
-	spin_unlock(&entity->lock);
 }
 
 /**
-- 
2.55.0

