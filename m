Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6983BCD05
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219874; cv=none; b=ouHNOg6yi8f9veXrwlRk6YV8MQy3YQopiwr+HJWPv8gDCltaLtdOoNDzTq8oFgPhmSC2bIcXCIZzTGmvpBWRRVAcdrjyPhDm67GGNKfby6dPpZE1IOs43rqaQmia58ISUDQoY/t7RAcBooKZrod/abWIVtFHRikKYFzQkKwlU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219874; c=relaxed/simple;
	bh=68BQmq9ZwOJ0Tom7O6R3smwqQ2k5GI89yu1c55XD3UI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QD9WvAnDY3UJmyTOLFzWNLB2CFdjOGoS6cGIffDs6OEU1GoyDretni874y+uFoO5M/blGHc6z6oN6/7DSJGexmSm/svbKtM6BMh128pLeRBX5a+7/JRTGYsnGY+cnUzkRbktLBfz30bvQ4TNJ2tqnPf9vcrbwUxbN3BRtDj3/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ReUh8Sg7; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ReUh8Sg7"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso4846952a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788219872; x=1788824672; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mDLxU8rCSMehNxTB2JsY1Ut5xWqdS5v5v0phXyAcsEU=;
        b=ReUh8Sg7dV1E1yvwEjuwuBkcStkxfoBBk9QJsByW2ANtt4+7KmZq6wzWVyBAHOrdyX
         WHi2oYdSWF5EMoaY38aclBGP1Kp3QWNxqbLt4IzY+A6Kj94z5Kvag8QgKb2futORk3l7
         cr6dpUq0MbVgRIy0aEVl1biR7jYqmyzQIbA9DoGhGghgtci/Y/xhni1x+/g+mmUK/D1v
         cZPVGjI5p2nN/LoCk8N58zjkpMF/X04yd39EMTWOG4vLB+pTlH7CzoL+qA3J2uOr2XiX
         HJq8LFnPYJzECJPAit0ksSOJnOK8vIgjeOZAWMPgZipy11hB9ASK82w0lx0IRiWklC3M
         Fp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219872; x=1788824672;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDLxU8rCSMehNxTB2JsY1Ut5xWqdS5v5v0phXyAcsEU=;
        b=bxNx6z4qRcZV2s3n0IXKNDeX/myzn/fkGzjDC5R9cdtMXo9OwPUernCIKS+/8h0P9m
         t28FqUb2COLigSVFKid4yZNnNyFqhtkqv5v8hdiW8ihb4sDlhqnwCczVIgX+QkfWsWg8
         h/P7xN4gC2+eZL19/5WRu45UgJzyRSErtdBjfgTejOb9nMMk22KMsLfmbrp8luFxLzwG
         Ogxk+CJMTvxYX81/hj6pSNJVhbmqN/urF5wOoAyUUuc6wq32k8raAgxwG1Q07Ezr3NTS
         STmfPP/lWId8Y+4EjLpPLVjr+9yxtwAPeaImnCTyB/su75Qlvv6C10ymDCIrdVpwoY0K
         WuHA==
X-Forwarded-Encrypted: i=1; AHgh+Rok/RNco3HB4vioMXGAAsO3iUU7HOtzOscnEkoieVVJ7duV8k9B+oCGZC5us/SacK8yO3OQyZtchYGlQME=@vger.kernel.org
X-Gm-Message-State: AFuF++ns18MKahBkQhLc9jgHkiIfxvdDgQHr5vPwotCISn9pobdcEKeE
	Ge7anUsvMm6GgR9+xBhe6CUM4xa8KeljCcrF71yZHwbAWwQ4Mtl5sVZH+9cNqqUFTMXEBelQsi6
	R1ZM00sN0hNFu1g==
X-Received: from dlbts8-n1.prod.google.com ([2002:a05:7022:b048:10b0:142:e77e:11fa])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3a87:b0:3d3:af86:fb94 with SMTP id adf61e73a8af0-3d3af87e902mr34342527637.26.1788219871732;
 Mon, 31 Aug 2026 16:44:31 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:43:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260831234339.280376-1-stevensd@google.com>
Subject: [PATCH] memcg: Don't call schedule_work when no spinning is allowed
From: David Stevens <stevensd@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"

Memcg charging can be done from any context, but calling schedule_work()
isn't safe from an NMI. If memory.high is breached from a context where
spinning isn't allowed, use irq_work to schedule the reclaim work.

Fixes: 3ac4638a734a ("memcg: make memcg_rstat_updated nmi safe")
Signed-off-by: David Stevens <stevensd@google.com>
---
 include/linux/memcontrol.h |  1 +
 mm/memcontrol.c            | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 8170bb8066a2..036d973ceca6 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -219,6 +219,7 @@ struct mem_cgroup {
 	spinlock_t	 peaks_lock;
 
 	/* Range enforcement for interrupt charges */
+	struct irq_work high_irq_work;
 	struct work_struct high_work;
 
 #ifdef CONFIG_ZSWAP
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 6dc4888a90f3..5e2f749067cb 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2360,6 +2360,11 @@ static void high_work_func(struct work_struct *work)
 	reclaim_high(memcg, MEMCG_CHARGE_BATCH, GFP_KERNEL);
 }
 
+static void high_irq_work_func(struct irq_work *work)
+{
+	schedule_work(&container_of(work, struct mem_cgroup, high_irq_work)->high_work);
+}
+
 /*
  * Clamp the maximum sleep time per allocation batch to 2 seconds. This is
  * enough to still cause a significant slowdown in most cases, while still
@@ -2752,7 +2757,10 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 		/* Don't bother a random interrupted task */
 		if (!in_task()) {
 			if (mem_high) {
-				schedule_work(&memcg->high_work);
+				if (allow_spinning)
+					schedule_work(&memcg->high_work);
+				else
+					irq_work_queue(&memcg->high_irq_work);
 				break;
 			}
 			continue;
@@ -4129,6 +4137,7 @@ static struct mem_cgroup *mem_cgroup_alloc(struct mem_cgroup *parent)
 		goto fail;
 
 	INIT_WORK(&memcg->high_work, high_work_func);
+	init_irq_work(&memcg->high_irq_work, high_irq_work_func);
 	vmpressure_init(&memcg->vmpressure);
 	INIT_LIST_HEAD(&memcg->memory_peaks);
 	INIT_LIST_HEAD(&memcg->swap_peaks);
@@ -4337,6 +4346,7 @@ static void mem_cgroup_css_free(struct cgroup_subsys_state *css)
 		static_branch_dec(&memcg_bpf_enabled_key);
 
 	vmpressure_cleanup(&memcg->vmpressure);
+	irq_work_sync(&memcg->high_irq_work);
 	cancel_work_sync(&memcg->high_work);
 	memcg1_remove_from_trees(memcg);
 	free_shrinker_info(memcg);

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.55.0.897.gb25b4bd76c-goog

