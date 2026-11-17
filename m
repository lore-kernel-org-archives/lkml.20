Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908260;
	b=r+28T/IjHJ+Q4+PR1qbp6ioszoSCRvw8iRy6Wh2BxCYE93jAYw/5C2PuAPMKdEbiZkMs
	 BNHWWQKwEXuxxNkHgGd/ohvOk9R39K5Adc2ag3hxtAWOeWU4yBsXxRf2yWbVRlPke81ne
	 UyS21FxqpR5oF8RYsEtv0F45anooVBMYZgEY/a9EAdOeqGVqGIvoiXOpXfUVwp8ew8q7X
	 pdMtHbbj+PTg0XozX+s7SIRXDPrn7Uj6Ebbk4hzf6VmZKdK+TJqxCDIcuVAXttgl18dAh
	 p63E4vK4OybWOAROGvAEfI/+SQqIg8fTnXaZepshA4NMtSThUpeLjtMeQvg6M1jQIuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908260;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sYsejNEMULh2lKIx2yILKbg2OeJOUfENCYPm27432Lc=;
	b=a75brt9ZnWsz/S+cGheL3rKHDU6ZVfnqMHQqIjHGZshbAe3spNEXvAMyw4ex94H9t7hE
	 e9NImTAdSp+6knbNFHVTROMJ5azJq+UyM76Y6oIEqpfeHJbyaNAnB5DWvXFPMHd6MjJ8z
	 JjmO0RhBu3f7nNAT3x00vjNL2swF2zP6T6orsFBuEdV6Bki9wbQCvgiWicjpKYU8UJVvz
	 lo44Ey10LoZuAPrrG0AKvr6iNhgvd5J9gNgsluEbFKuAtWBW9ce+GS46uW+Wia4HXmxRu
	 5mn6LCZkxQ1161YCjAPAVmltAcBie7ssHt0ALxkO81p3bGAO19AslAvqEluUgA7Pl+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UoDIexIJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E400606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UoDIexIJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF501F000C6;
	Tue, 17 Nov 2026 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794908259;
	bh=sYsejNEMULh2lKIx2yILKbg2OeJOUfENCYPm27432Lc=;
	h=From:To:Cc:Subject:Date;
	b=UoDIexIJG7Z2g8JHrBHM+uRE8Gf/5jJcgqP38JNGPYK29sH3Hjg2iKmhucMs3l/uu
	 /d5wYg0Uz3lP6hz+hajg2qDPFXiinsuMha+dUwyEu1Hr7BUOdla1a/RhzlZTQ+SAEw
	 Ol6Mkm03OIC//7RYZBZtExrp40PPt5L62Hlpw1lG4Y3Kb18+G9ChdiwN2GoXek9xza
	 vdZLbxVwOHMV0Q4vQNIOA5SzMX9Zd9/L6WnO3JHykfYpoDtAv/jK04hiSFxTSrpQp3
	 fl07tz3V2adVX/sIE0tKwCbDJI+rTT5jyTC8d5OLFFOGu7YkqMZdxpWAQJvWwRPWRL
	 j4ED0Y7MOraaw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
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
Subject: [PATCH] drm/sched: Extend locking in drm_sched_entity_select_rq()
Date: Tue, 17 Nov 2026 10:37:09 +0100
Message-ID: <20261117093708.647488-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_entity_select_rq() evaluates entity->sched_list locklessly,
which is elsewhere always lock-protected. Another lockless check regards
spsc_queue_count(). spsc_queue is evaluated under lock protection at
many places already and the plan is to replace it with fully locked
infrastructure anyways.

Move the spin_lock() in drm_sched_entity_select_rq() upwards.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 03e68b4102d5..3856d5e507d7 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -577,22 +577,21 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
 
+	spin_lock(&entity->lock);
+
 	/* single possible engine and already selected */
 	if (!entity->sched_list)
-		return;
+		goto unlock;
 
 	/* queue non-empty, stay on the same engine */
 	if (spsc_queue_count(&entity->job_queue))
-		return;
+		goto unlock;
 
-	spin_lock(&entity->lock);
 	fence = entity->last_scheduled;
 
 	/* stay on the same engine if the previous job hasn't finished */
-	if (fence && !dma_fence_is_signaled(fence)) {
-		spin_unlock(&entity->lock);
-		return;
-	}
+	if (fence && !dma_fence_is_signaled(fence))
+		goto unlock;
 
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
 	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
@@ -604,6 +603,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	if (entity->num_sched_list == 1)
 		entity->sched_list = NULL;
 
+unlock:
 	spin_unlock(&entity->lock);
 }
 
-- 
2.56.0

