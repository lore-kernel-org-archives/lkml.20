Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE794534AD
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756194; cv=none; b=h+khgengurgs9i8h3rfd4LBnrY5gYkBOsP06aD9eUYqKH5a8Neu5ZafH7AA9AgW0oMkb5pEqmMRrx3/oYjhhPHXX0UfwylULHQuGg/ZwkNdCCvsq/GiVjW/J2xp6Cik47oNAQybBvHbPFXOlYHXu51FYNRSR7pa9kPw4DwmqR48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756194; c=relaxed/simple;
	bh=g1g2Eh8e5qRJuRxfpEGcfzGSOVKBJazFaiDw4Ch0y48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPViu7dYi1L1StmzbqvR8hDumFf0hEsKwY/qFMyjOd50KcAaLDhxKoROYnGf8SGgSsnT5qWInUG/y07DseVTHb5c1pd+c8ACdYJqYQ18dC14sRwXHZOkYsx3oPy1spqPs5zxOFKfiGEBXYNirhL8yt5Lk0Mfux9wt9KVBgn+Vds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WAxujBBT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WAxujBBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787756189;
	bh=g1g2Eh8e5qRJuRxfpEGcfzGSOVKBJazFaiDw4Ch0y48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WAxujBBTZp596N1gLjvm82GGOtFsc7Yxz3Wv8rvM+DaeKeOHJ79BwA9XEl/57fVC6
	 HuBjplXFfI29VitXxIHi5E9xfL0/WlMo43Q6Js7jRKTEtPajcuHv1D2eWeiCCnchC0
	 sBtmx8vLmO/FD5Y7CUDfSeKdmKCINw3sChlgXmsOG6HNXlxazdO7bchZnLZrWX2PZN
	 FC6pTng+PIth76oXuAzMmcAHvNOZCVguxsyphRgwEkxWLpsAwmNS75dOcsmiZ/BzBg
	 /d7uKwfjr8iQRJw6GrOeuSKLHbco6rRTYqdXjtMqD4VIAY42pdYz0QCtLrWi/ZUQZw
	 ibTQgPQRIGiNw==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DC5617E035F;
	Wed, 26 Aug 2026 16:56:28 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 26 Aug 2026 16:56:15 +0200
Subject: [PATCH v4 16/18] drm/panthor: Track user owned groups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-panthor-unplug-fixes-v4-16-982cc8f4234b@collabora.com>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
In-Reply-To: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787756178; l=5097;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=g1g2Eh8e5qRJuRxfpEGcfzGSOVKBJazFaiDw4Ch0y48=;
 b=DMGm++4n5DaahqU51NzXiPUoDU27uYqrVp4QOvPhz7IVjVh81dBHu1s9vw3IJkJb+xmugkF/o
 ik389KAr212BJ5WZW2dHHGGt2aQU8iMl2AitfJjf39UBAggTGbZgZO5
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

A group can outlive its user handle because of internal refs. In order
to fix the unplug logic, we need to keep track of groups that have a
valid user handle so we can release the references that were owned by
the user processes in the unplug path.

This is the prep work to keep track of user owned groups. Note that
the destroyed attribute is dropped because it's equivalent to checking
whether the group is inserted in the user_owned list now.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 43 ++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 4ea16b40d6b9..bd5dcf4cb580 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -235,6 +235,15 @@ struct panthor_scheduler {
 		 * This list is evaluated in the @sync_upd_work work.
 		 */
 		struct list_head waiting;
+
+		/**
+		 * @user_owned: List of groups that have a valid user handle.
+		 *
+		 * All groups are inserted in this list at creation time through their
+		 * panthor_group;:user_node, and evicted from this list when
+		 * panthor_group_destroy() is called.
+		 */
+		struct list_head user_owned;
 	} groups;
 
 	/**
@@ -586,15 +595,6 @@ struct panthor_group {
 	 */
 	int csg_id;
 
-	/**
-	 * @destroyed: True when the group has been destroyed.
-	 *
-	 * If a group is destroyed it becomes useless: no further jobs can be submitted
-	 * to its queues. We simply wait for all references to be dropped so we can
-	 * release the group object.
-	 */
-	bool destroyed;
-
 	/**
 	 * @timedout: True when a timeout occurred on any of the queues owned by
 	 * this group.
@@ -707,6 +707,17 @@ struct panthor_group {
 	 * panthor_group::groups::waiting list.
 	 */
 	struct list_head wait_node;
+
+	/**
+	 * @user_node: Used to insert the group in the panthor_scheduler::groups::user_owned list.
+	 *
+	 * When the group is created, it's inserted in panthor_scheduler::groups::user_owned,
+	 * and when panthor_group_destroy, the group is remove from this list.
+	 *
+	 * When the device is unplugged, all groups that remain in this list must have an extra
+	 * put_group() called on them to release the reference owned by the per-file group pool.
+	 */
+	struct list_head user_node;
 };
 
 struct panthor_job_profiling_data {
@@ -969,6 +980,7 @@ static void group_release(struct kref *kref)
 	struct panthor_device *ptdev = group->ptdev;
 
 	drm_WARN_ON(&ptdev->base, group->csg_id >= 0);
+	drm_WARN_ON(&ptdev->base, !list_empty(&group->user_node));
 	drm_WARN_ON(&ptdev->base, !list_empty(&group->run_node));
 	drm_WARN_ON(&ptdev->base, !list_empty(&group->wait_node));
 
@@ -1003,7 +1015,7 @@ group_can_run(struct panthor_group *group)
 {
 	return group->state != PANTHOR_CS_GROUP_TERMINATED &&
 	       group->state != PANTHOR_CS_GROUP_UNKNOWN_STATE &&
-	       !group->destroyed &&
+	       !list_empty(&group->user_node) &&
 	       !atomic_read(&group->fatal_queues) &&
 	       !atomic_read(&group->timedout);
 }
@@ -2472,7 +2484,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 			 * re-evaluate as soon as possible and get rid of
 			 * this dangling group.
 			 */
-			if (group->destroyed)
+			if (list_empty(&group->user_node))
 				ctx->immediate_tick = true;
 			group_put(group);
 		}
@@ -3667,6 +3679,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	group->tiler_core_mask = group_args->tiler_core_mask;
 	group->priority = group_args->priority;
 
+	INIT_LIST_HEAD(&group->user_node);
 	INIT_LIST_HEAD(&group->wait_node);
 	INIT_LIST_HEAD(&group->run_node);
 	INIT_WORK(&group->term_work, group_term_work);
@@ -3735,8 +3748,13 @@ int panthor_group_create(struct panthor_file *pfile,
 	mutex_lock(&sched->reset.lock);
 	if (atomic_read(&sched->reset.in_progress)) {
 		panthor_group_stop(group);
+
+		mutex_lock(&sched->lock);
+		list_add_tail(&group->user_node, &sched->groups.user_owned);
+		mutex_unlock(&sched->lock);
 	} else {
 		mutex_lock(&sched->lock);
+		list_add_tail(&group->user_node, &sched->groups.user_owned);
 		list_add_tail(&group->run_node,
 			      &sched->groups.idle[group->priority]);
 		mutex_unlock(&sched->lock);
@@ -3776,7 +3794,7 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 
 	mutex_lock(&sched->reset.lock);
 	mutex_lock(&sched->lock);
-	group->destroyed = true;
+	list_del_init(&group->user_node);
 	if (group->csg_id >= 0) {
 		sched_queue_delayed_work(sched, tick, 0);
 	} else if (!atomic_read(&sched->reset.in_progress)) {
@@ -4143,6 +4161,7 @@ int panthor_sched_init(struct panthor_device *ptdev)
 		INIT_LIST_HEAD(&sched->groups.idle[prio]);
 	}
 	INIT_LIST_HEAD(&sched->groups.waiting);
+	INIT_LIST_HEAD(&sched->groups.user_owned);
 
 	ret = drmm_mutex_init(&ptdev->base, &sched->reset.lock);
 	if (ret)

-- 
2.55.0

