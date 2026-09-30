Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4272C3BFE2A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758085; cv=none; b=pyXmQakTqLp+5u7deKJTPzjeM94fyxTCCrvftR8PZ+EARaWxcLRAqgPmXWu0m0ShKUPOCt6dOtgAxuMb1RkZpaHmQYnp+betW6DE1n8kbfxvE7CVA6BjmfzqOh2wc1bR14nzLz/+CEapVZ0zCxENEwuICIX+n1FjyNxg9l4/Ov8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758085; c=relaxed/simple;
	bh=ZUUIDF1CFnqVC/TU1N21QWrFEZz88fEevCUQh2OgRDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ei/B0TPimiCiiEX8xGxtkNmK2Iu+4m3ls9idK+LL6rQedUUipauyquwAyM2z37IwyaJljnhwqhWJJlgVQB/J8I3V6ffABQA9OfT+funbI55Keo0buPbO6+Pxpd3VM6l23Ky3PN9i2A1QFEnZepbvVVlreL4Gdq7/y1R/pyDBzyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jwtNFt31; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jwtNFt31"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D7EC153B;
	Wed, 30 Sep 2026 01:48:00 -0700 (PDT)
Received: from e127648.arm.com (unknown [10.57.52.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 064093F85F;
	Wed, 30 Sep 2026 01:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790758083; bh=ZUUIDF1CFnqVC/TU1N21QWrFEZz88fEevCUQh2OgRDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jwtNFt31yHDB5v1uz1pcp/mEfntyXVmsF1KosJZkqdVoCUUsALRrdhzjiZ/GPhRfL
	 sCvZmy8lKCK6CGnmWJ+d3N4zfisB8xgdwdKvFHlsCZu1YOpPLz8yIz57hdYVEOQm1b
	 kh15tNJ9zGa6xx2WKVWE2vRwhs/KfBCPRLG2/cD4=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH 2/2] sched/eevdf: Keep expired protection expired across reweighting
Date: Wed, 30 Sep 2026 09:47:38 +0100
Message-Id: <78ce8f8ceb4f5c7fda14216d3dff9d74e17f55ac.1790756779.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790756779.git.christian.loehle@arm.com>
References: <cover.1790756779.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reweight_eevdf() rescales live slice protection, but leaves an expired
vprot unchanged when moving vruntime. A reweight can move vruntime behind
the old vprot. For example, reducing the weight of an entity with positive
lag can do so:

    before reweight:       vprot <= vruntime
    after reweight:        vruntime < vprot

protect_slice() consequently becomes true again, even though no fresh
protection was granted.

This also happens from task_tick_fair() after a queued HRTICK has
requested a reschedule. A four-task rt-app workload with 100 us, 1 ms,
10 ms and 100 ms requests can then repick current despite a runnable,
eligible entity having an earlier deadline. The stale protection takes
precedence in pick_eevdf(). Cgroup weight changes also expose this with
HRTICK disabled.

Separating vprot from vlag allowed the expired absolute boundary to survive
the lag update and rescaling. Previously, those writes to vlag overwrote
the shared storage. Commit ff38424030f9 ("sched/eevdf: Update se->vprot in
reweight_entity()") subsequently handled live protection, but left the
expired case unchanged.

Keep an expired current entity's protection at its new vruntime:

    after reweight:        vprot = vruntime

This keeps protect_slice() false. Retain the existing rescaling for
protection that was still live and leave non-current entities alone.

Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/fair.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 868c3911337a..d10eeea75f13 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4951,6 +4951,9 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 		se->deadline += avruntime;
 		se->rel_deadline = 0;
 		se->vruntime = avruntime - se->vlag;
+		/* Reweighting must not revive expired slice protection. */
+		if (curr && !rel_vprot)
+			se->vprot = se->vruntime;
 
 		if (!curr)
 			__enqueue_entity(cfs_rq, se);
