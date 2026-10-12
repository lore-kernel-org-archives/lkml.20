Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7037C4908D8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810006; cv=none; b=QPj+/2rawVaOrzw+DVIhi5HVHAHJLwaMW5/18yU43h5dn3JtGWF1YQJ5zeEf482XirkmOXgT+R2JOvV1o4kxM15OJtAhOLG6ZxYNOWvp2jTB6pHZG3NzTxrI99zKrrKvJBWOBvoLY5NdxUw3MTnOSVwnO2A+Zriic2BoLk9nqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810006; c=relaxed/simple;
	bh=9enrEPFJ+JnpIuEEirm/WBq2OU1xHo4Kxb3uUZfBUQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Soix/0WqAyO4CLSe66Qsq6QsLet5BcGpXa1X5GuEbEKlgf/+4xKHo3uZ+Vc8/gMyoNew3Uua23F7bsRyIBOIrbOyzNcL2UlOuc57wTvrScNuR8t4mLzx8u0hCtRAu36iJOINQ+entVO8AHQn+Fgtcq63SI41S7Dr8E6C+FhqLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XAmD+7Ux; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XAmD+7Ux"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F23AB22F8;
	Mon, 12 Oct 2026 05:59:56 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5D583F66F;
	Mon, 12 Oct 2026 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791810000; bh=9enrEPFJ+JnpIuEEirm/WBq2OU1xHo4Kxb3uUZfBUQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XAmD+7Ux+TPApVHSSOq08AH2Hy+vByAbVcuRuAUe+4L0fP4ZK3FciS3S39wJERK03
	 JdFz6PZ2QYltAuA0athHdptvfp4mEuBTmmW81LUJGk0V3xCdwFC2eqMXQ3bX0cbmhI
	 cJdA3evMZdTyLIddWjeG6M6La5iu079E1tInsr18=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Florent Tomasin <florent.tomasin@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH v4 02/12] drm/panthor: Minor scheduler refactoring
Date: Mon, 12 Oct 2026 14:59:30 +0200
Message-ID: <20261012125940.3291951-3-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012125940.3291951-1-ketil.johnsen@arm.com>
References: <20261012125940.3291951-1-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florent Tomasin <florent.tomasin@arm.com>

Refactor parts of the group scheduling logic into new helper functions.
This will simplify addition of the protected mode feature.

Remove redundant assignments of csg_slot.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v4:
- Handle error from csg_slot_prog_locked()

v3:
- Use panthor_fw_csg_endpoint_req_update() (was rebase mistake)
- Function rename to tick_ctx_update_group_prio()

v2:
- Moved option to ding only the CSG doorbell to later patch
---
 drivers/gpu/drm/panthor/panthor_sched.c | 135 +++++++++++++++---------
 1 file changed, 83 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a343c5180e01e..023abaf41890c 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2345,12 +2345,85 @@ tick_ctx_cleanup(struct panthor_scheduler *sched,
 	}
 }
 
+static void
+tick_ctx_evict_group(struct panthor_scheduler *sched,
+		     struct panthor_csg_slots_upd_ctx *upd_ctx,
+		     struct panthor_group *group)
+{
+	struct panthor_device *ptdev = sched->ptdev;
+
+	if (drm_WARN_ON(&ptdev->base, group->csg_id < 0))
+		return;
+
+	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, group->csg_id,
+				group_can_run(group) ?
+				CSG_STATE_SUSPEND : CSG_STATE_TERMINATE,
+				CSG_STATE_MASK);
+}
+
+static void
+tick_ctx_update_group_prio(struct panthor_scheduler *sched,
+			   struct panthor_csg_slots_upd_ctx *upd_ctx,
+			   struct panthor_group *group,
+			   int new_csg_prio)
+{
+	struct panthor_device *ptdev = sched->ptdev;
+	struct panthor_fw_csg_iface *csg_iface;
+	struct panthor_csg_slot *csg_slot;
+
+	if (group->csg_id < 0)
+		return;
+
+	csg_iface = panthor_fw_get_csg_iface(ptdev, group->csg_id);
+	csg_slot = &sched->csg_slots[group->csg_id];
+
+	if (csg_slot->priority != new_csg_prio) {
+		panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
+						   CSG_EP_REQ_PRIORITY(new_csg_prio),
+						   CSG_EP_REQ_PRIORITY_MASK);
+		csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, group->csg_id,
+					csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
+					CSG_ENDPOINT_CONFIG);
+	}
+}
+
+static int
+tick_ctx_schedule_group(struct panthor_scheduler *sched,
+			struct panthor_csg_slots_upd_ctx *upd_ctx,
+			struct panthor_group *group,
+			int csg_id, int csg_prio)
+{
+	struct panthor_device *ptdev = sched->ptdev;
+	struct panthor_fw_csg_iface *csg_iface =
+		panthor_fw_get_csg_iface(ptdev, csg_id);
+	int ret;
+
+	ret = group_bind_locked(group, csg_id);
+	if (ret)
+		return ret;
+
+	csg_slot_prog_locked(ptdev, csg_id, csg_prio);
+	if (ret) {
+		group_unbind_locked(group);
+		return ret;
+	}
+
+	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
+				group->state == PANTHOR_CS_GROUP_SUSPENDED ?
+					CSG_STATE_RESUME : CSG_STATE_START,
+				CSG_STATE_MASK);
+	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
+				csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
+				CSG_ENDPOINT_CONFIG);
+
+	return 0;
+}
+
 static void
 tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *ctx)
 {
 	struct panthor_group *group, *tmp;
 	struct panthor_device *ptdev = sched->ptdev;
-	struct panthor_csg_slot *csg_slot;
 	int prio, new_csg_prio = MAX_CSG_PRIO, i;
 	u32 free_csg_slots = 0;
 	struct panthor_csg_slots_upd_ctx upd_ctx;
@@ -2360,44 +2433,13 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 
 	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
 		/* Suspend or terminate evicted groups. */
-		list_for_each_entry(group, &ctx->old_groups[prio], run_node) {
-			bool term = !group_can_run(group);
-			int csg_id = group->csg_id;
-
-			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
-				continue;
-
-			csg_slot = &sched->csg_slots[csg_id];
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						term ? CSG_STATE_TERMINATE : CSG_STATE_SUSPEND,
-						CSG_STATE_MASK);
-		}
+		list_for_each_entry(group, &ctx->old_groups[prio], run_node)
+			tick_ctx_evict_group(sched, &upd_ctx, group);
 
 		/* Update priorities on already running groups. */
-		list_for_each_entry(group, &ctx->groups[prio], run_node) {
-			struct panthor_fw_csg_iface *csg_iface;
-			int csg_id = group->csg_id;
-
-			if (csg_id < 0) {
-				new_csg_prio--;
-				continue;
-			}
-
-			csg_slot = &sched->csg_slots[csg_id];
-			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-			if (csg_slot->priority == new_csg_prio) {
-				new_csg_prio--;
-				continue;
-			}
-
-			panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
-							   CSG_EP_REQ_PRIORITY(new_csg_prio),
-							   CSG_EP_REQ_PRIORITY_MASK);
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
-						CSG_ENDPOINT_CONFIG);
-			new_csg_prio--;
-		}
+		list_for_each_entry(group, &ctx->groups[prio], run_node)
+			tick_ctx_update_group_prio(sched, &upd_ctx, group,
+						   new_csg_prio--);
 	}
 
 	ret = csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
@@ -2425,34 +2467,23 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
 		list_for_each_entry(group, &ctx->groups[prio], run_node) {
 			int csg_id = group->csg_id;
-			struct panthor_fw_csg_iface *csg_iface;
+			int csg_prio = new_csg_prio--;
 
-			if (csg_id >= 0) {
-				new_csg_prio--;
+			if (csg_id >= 0)
 				continue;
-			}
 
 			csg_id = ffs(free_csg_slots) - 1;
 			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
 				break;
 
-			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-			csg_slot = &sched->csg_slots[csg_id];
-			ret = group_bind_locked(group, csg_id);
+			ret = tick_ctx_schedule_group(sched, &upd_ctx, group,
+						      csg_id, csg_prio);
 			if (ret) {
 				panthor_device_schedule_reset(ptdev);
 				ctx->csg_upd_failed_mask |= BIT(csg_id);
 				return;
 			}
 
-			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
-						CSG_STATE_RESUME : CSG_STATE_START,
-						CSG_STATE_MASK);
-			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
-						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
-						CSG_ENDPOINT_CONFIG);
 			free_csg_slots &= ~BIT(csg_id);
 		}
 	}
-- 
2.43.0

