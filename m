Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3C744C678;
	Fri, 16 Oct 2026 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137683; cv=none; b=WhmosCX/CBcqIF1rSW6x1yrDQnMfi+oJnjoGOmLixhTVi3saRc2aHbGO+zA4z7ETJWxakIdzL9Zy8Xb/9FACGY4eaCaGa5E8GyaBZy9V4hm0CGvTF39KCIg3ACXPyD2Siv++mKQw/Cfw3C+PKLXHSI4OAGxWmSHSeVJW3l6w+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137683; c=relaxed/simple;
	bh=TCopl8N3UM+GloEBsVFsOqTBKshRmc3XXaAqJfH1SrE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Mpbu41qG7LMIB1mqP4bPoNnXgRAqVOxS31KmWDEemAs+KrpBWHtLqHYiKHqKbVBAiWHBmEpjmr5To441RlUWMWeBQ+4idaa2FiwUKhJAcfcQaMTlhxTHTod5WnajRUS+gYdVC7ufROLS0vAGFBQixnM/Pkxbc9kWrVM5ZyQHQwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0ZNlHhl5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QvCg7R7M; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0ZNlHhl5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QvCg7R7M"
Date: Fri, 16 Oct 2026 08:01:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792137677;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cXeL9o1uOY1tEE0UKGNj0pdMuOxSWDhK9wm5jo01Bs=;
	b=0ZNlHhl5qHxnoNNjcpykz6ulu5epCwsJVUdOm4NTOIUVJf9yPaNW3dlpABlejxeuZAuyMq
	ROyPtCInQk/HKqUODYBwLeNKVBpfFdBkpXHnijW1CtBb4/QcuDy3VYXWGkEVseyVHDm5DR
	70rs1PGRsX/H8tYjRluZKWqbI+0J59stzJ7YBmFIaJW3D+RuQGyzUWnCTqWmxVOdAtPZax
	XXvaiRloGLyCmZ42MjvpJJZqR27f1DOL8kjHsKGIFr/Di6xdILIzZRCQyCz6Lv8W9XFT9Q
	OCZtNTKQzsd0rGu73HhSPnXO68nATuPQF9X1dxWa8NU0/6PfGPgmsYtWIxVI3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792137677;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cXeL9o1uOY1tEE0UKGNj0pdMuOxSWDhK9wm5jo01Bs=;
	b=QvCg7R7MynNitVgrN5RgDiPeWBFR6/GgJ+PR3jveUjgZSD/y+kjX6RCdKOYIglzwbHYfXQ
	RD791/ExL6SF7RCg==
From: "tip-bot2 for Jemmy Wong" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/cache: Avoid publishing partial LLC utilization
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
 Tim Chen <tim.c.chen@linux.intel.com>, Jemmy Wong <jemmywong512@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261013084338.55100-1-jemmywong512@gmail.com>
References: <20261013084338.55100-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179213767625.2666988.4719847157551221636.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     fcceb7da94659695d6cba97190e18e87d9cce82c
Gitweb:        https://git.kernel.org/tip/fcceb7da94659695d6cba97190e18e87d9c=
ce82c
Author:        Jemmy Wong <jemmywong512@gmail.com>
AuthorDate:    Tue, 13 Oct 2026 16:43:38 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 16 Oct 2026 09:49:04 +02:00

sched/cache: Avoid publishing partial LLC utilization

update_sg_lb_stats() sums utilization over the CPUs in both
sched_group_span(group) and env->cpus, but takes capacity from
group->sgc->capacity for the whole group. record_sg_llc_stats()
publishes both.

Rejecting an all-affinity-pinned source runqueue removes that CPU from
env->cpus and retries group selection. The retry can publish the
partial utilization with the full capacity.

can_migrate_llc() then treats a busy preferred LLC as having spare
capacity. More tasks can aggregate into it, migrations out can be
blocked, and two busy LLCs may not fall back to generic balancing.
This increases CPU contention and task latency. Found by inspection.

Skip publication on affinity retries using LBF_ALL_PINNED, retaining
the first-pass snapshots and avoiding repeated cpumask checks. On the
first pass, publish either shared LLC statistic only when env->cpus
covers the whole group. Load balancing still uses the affinity-filtered
statistics.

The same window exists during CPU hotplug. env->cpus drops a CPU at
set_cpu_active(false), but the group span and sgc->capacity still
include it until cpuset_cpu_inactive() rebuilds the domains. Keeping
the previous snapshot avoids the mismatched publish. After the rebuild,
the next periodic balance records both statistics again.

Fixes: f025ef275388 ("sched/cache: Record per LLC utilization to guide cache =
aware scheduling decisions")
Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261013084338.55100-1-jemmywong512@gmail.com
---
 kernel/sched/fair.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7bf3193..a90e48d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12084,6 +12084,14 @@ static void record_sg_llc_stats(struct lb_env *env,
 		return;
=20
 	/*
+	 * A redo repeats stats published on the first pass. Hotplug can
+	 * still leave env->cpus partial, so util would not match capacity.
+	 */
+	if ((env->flags & LBF_ALL_PINNED) ||
+	    !cpumask_subset(sched_group_span(group), env->cpus))
+		return;
+
+	/*
 	 * At this point we know this group spans a LLC domain.
 	 * Record the statistic of this group in its corresponding
 	 * shared LLC domain.
