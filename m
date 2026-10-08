Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF564AD7E0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466004; cv=none; b=C8PfBUvzjiNH5aXo7qqcx4VO1rM3InrvCt4oY705twQ1V3Bxd3SSjfJjdt5CxHlZZs0+Wp/EYb+dV81H9swmnEfayjBkhLgQh+ApZsS98TIqcIRD4CFDrMGIAxy+2XuRfGj74k+wYCD59wzM14j/rj8vcRaR/135hDc5l9dxy+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466004; c=relaxed/simple;
	bh=183lZqK7AlcMj7TDOKxk6sm7VLyBaPE6J7QRDHQ57uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eeVL6xxpVH5v64BGg8onVhWYlphn0rPr5RXMfO7dkvdEB4pzl7Bm5/Y1bkIS6GpThofsf+a1/6Hn+MrXIMeEO10R02BruQbuX9QAsUjNiD3iTCt1SRXOVkrcH09Cn/PR+dGSHykRNNhUX5d57Ivh5TdWQ9dJ57gJcr5b3+p0954=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oVpCkpIQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oVpCkpIQ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab10550338so217425a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791466001; x=1792070801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOoFEhXuHZdW5MAtSuq/bUAgSdA+zzbddsI9RY58210=;
        b=oVpCkpIQlUv9dToPOQweF0AtxY/avs1q+4EIWIvwbYNGi5sNWCzsI1HzmgxiClAvGr
         u9Cuy19KGDS1rBtU0UCSNrPR4dizBBn5dtPnRaQkXxkTd78jkVEGAzcK0LGZnUxugAbx
         31R0T3Gh2L+1Tx/ny9QF0p6GpCUnIc1SfCarAXOrekH/DlJEb8rzujezZu+ITsoEEU6Z
         V2zm49khti47zZ6j2px2dDreg2emtyU2Rj0pnlWG/Nk3Sz9JjhOnBO48H5F3yQvA04Y7
         mNULhOJ0l85OoUMbke4URgv7MenUqBOtymo182Up5ydci5jDQ0xe/NSOWFMKlGBQmHmr
         IUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466001; x=1792070801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOoFEhXuHZdW5MAtSuq/bUAgSdA+zzbddsI9RY58210=;
        b=ydLULJKO3BMJABW5/9p0mVkl3PMedqPSY+hGM0X/jw5xOphZiNazLH1HtCmC/C9Sz7
         Rmi4R350IZBBmIlLFeELXz69FD5TltEZvAYOg6oUVYSwBfMMjh6yP0G8ck7LrAPxtYWf
         yk/pLAeo+XBiHk5R2W/X4SFZX1IXkiZmKjET5yZ3slnKipQ+khPX/RkfuOYLjzl8jDoa
         kxHOEqcDwPggj2jUgRuTESmO2ZDuZj8p0Sx03DZP9DRIERO+miYCaMfhU4qU/N6NbiEQ
         xfJbZYr2VSk46Yx2r1Fks7NPKvmN/KMzu1R3v6VxdqYPOzjmW3GWQaa3+KDNh8QIysvV
         12hw==
X-Forwarded-Encrypted: i=1; AKwUvBxU/XfxESP3ushtcwcgIOYHB9KfBQn99P1eW9YlqzAbv/bgxDGJ6JxiCSW1En5/1KFTGiROVwJccYhCvTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL37WjSFJbKpFBVo/do9yWjfoTajplPVhOyIZJgSXV13+FgqI+c
	kPEM27ike7JbkWS1pvig72ZTD0DzcoN7Q8qgsVJLf/TjRnyYgfI6/ihE
X-Gm-Gg: AYBFou1mbSWrAbM0AjHNtbXSQEuUefIE2hrMdJ5e9CdLGAp0QWkHwk5VsTP6hUMmZfI
	Plg3Xm5WxpcH5vcjSs7aYVSX48eSCHG1dgqtloEggsjbO/vEgmKIb4GayzdcRQL0Q2bkwaW/1F4
	9vrWjl60aQezOsNIaCBoFEhkpFA6vqzHHuQpqNFrqyQSbCKj181bZFIEuTCtvoYfSlHiF/KD/s3
	RAXp4pl7v5VAARs+vK6GJ5MepoOahdRPqD/r5c/ZCXqSRXffQ9cV10cG0vRjs+c8duBkNrB08Yq
	wg6VVGWDwi5AYdtzxlTtXx7v7oha6yssPEF36sv5bIeLl+pJt86ziZYBtpbxc0YoIrsmIaIDZpi
	Ry8CMbBvGKdXLgaGRSRyEIYdgNtpc+hGR+LYu+oD4ul304LUrlSt3d/5O+5Ry0FtJybXRY/Nmr7
	DVLfPhvrlVAXPje7KLNG8Pbx5oiKg5bRP4Pcl48hAzHwiziFaWQSHESSWRklS29ujwpoDPMDEhy
	VCZuXw9
X-Received: by 2002:a17:90b:4b0f:b0:3ab:1786:102f with SMTP id 98e67ed59e1d1-3ab1786119fmr808158a91.49.1791466000912;
        Thu, 08 Oct 2026 06:26:40 -0700 (PDT)
Received: from localhost.localdomain ([2a05:dfc1:8bc4:feda::11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab1e8b7d4csm476312a91.16.2026.10.08.06.26.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 06:26:40 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Jemmy Wong <jemmywong512@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] sched/core: Check CFS bandwidth against the donor for NOHZ
Date: Thu,  8 Oct 2026 21:26:04 +0800
Message-ID: <20261008132604.98242-4-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008132604.98242-1-jemmywong512@gmail.com>
References: <20261008132604.98242-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sched_can_stop_tick() tests rq->curr, the execution context, for CFS
bandwidth. Quota is consumed by the donor, the scheduling context:
account_cfs_rq_runtime() charges rq->donor's cfs_rq, and
sched_fair_update_stop_tick() already passes the donor picked in
set_next_task_fair() to cfs_task_bw_constrained().

Test rq->donor in sched_can_stop_tick() as well, so both callers name
the task whose quota is consumed. The tick decision is unchanged:
both paths return before the bandwidth test unless nr_running == 1,
and proxy execution keeps the donor and the lock holder (curr) queued.
Without CONFIG_SCHED_PROXY_EXEC, curr and donor are a union and
therefore the same task.

No functional change.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
Assisted-by: LLM
---
 kernel/sched/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b2005fafae59..7eddbc14ddcb 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1477,9 +1477,11 @@ bool sched_can_stop_tick(struct rq *rq)
 	 * This check prevents clearing the bit if a newly enqueued task here is
 	 * dequeued by migrating while the constrained task continues to run.
 	 * E.g. going from 2->1 without going through pick_next_task().
+	 *
+	 * Test the donor, as sched_fair_update_stop_tick() does.
 	 */
-	if (__need_bw_check(rq, rq->curr)) {
-		if (cfs_task_bw_constrained(rq->curr))
+	if (__need_bw_check(rq, rq->donor)) {
+		if (cfs_task_bw_constrained(rq->donor))
 			return false;
 	}
 
-- 
2.54.0 (Apple Git-157)

