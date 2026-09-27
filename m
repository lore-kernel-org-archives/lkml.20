Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB6547064
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526938; cv=none; b=Hsw/RIN1VRMhH/Q3F19/r/5kY/2BpMxPEMoHUgGRkY1QBTjwOMpjMPwW0IIqRd9UTg44DEhpH6w5ddBcAKENhvT528pk+pP2ePwN3+bCNOiKgU7AHM86cInM9vDJNkJ9m1WfkhWawCwspAuRknpekP+FcVuuqpQ4fFPxw/b34gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526938; c=relaxed/simple;
	bh=UtlM9bcM1dvwalsJgJ3cqzDrO/uTqo4TcKkSof2x81M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ML6dGAV7Vv0chunNziWgK4UT2uYEIKT0wSMa1zwzfw4Nag6KvDxfktno7xrvTGUf7zJcYIy6qPa+n0prDfFderT6FcRn0SMq5iNXFcgcSIZQ7j8JaaLGoe0gvmP2muWitjG4K15aKrrF+HBJvFG3UiBsheEDBr6O+OF1nCQGUlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AtG1+sYB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AtG1+sYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790526935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mraiSnZk6IQGMN5G7GboSUGP55GtudD9bzkvemI8zvA=;
	b=AtG1+sYB4JX140pWq0yhEbq65f+FnEi1yrrO7EydACAvk3jdU86RbPJQuXltkGV/FnZBx+
	cW5Pi//Al8YlKFtT1fuPAa9aQhe5iAtcKk7kX3f0SnYPzAoU0NAGFgAy8jGsrRlU2fQ4Vh
	BSdNP5G3uZR2rPQrjRZBiro3N87nlMY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-cmks5g1UNGCe7toRWEz4PA-1; Sun,
 27 Sep 2026 12:35:32 -0400
X-MC-Unique: cmks5g1UNGCe7toRWEz4PA-1
X-Mimecast-MFC-AGG-ID: cmks5g1UNGCe7toRWEz4PA_1790526931
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1D181955F1A;
	Sun, 27 Sep 2026 16:35:30 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5CD6D418;
	Sun, 27 Sep 2026 16:35:28 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next 1/2] cgroup/cpuset: Run SCHED_DEADLINE shrink test on valid partition root only
Date: Sun, 27 Sep 2026 12:34:53 -0400
Message-ID: <20260927163454.345463-2-longman@redhat.com>
In-Reply-To: <20260927163454.345463-1-longman@redhat.com>
References: <20260927163454.345463-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Commit f82f80426f7a ("sched/deadline: Ensure that updates to exclusive
cpusets don't break AC") adds a check in validate_change() to make
sure that there is enough bandwidth for SCHED_DEADLINE tasks if we
shrink a v1 exclusive cpuset that has CS_CPU_EXCLUSIVE flag set.

With the introduction of cpuset partition in cgroup v2, we keep setting
the CS_CPU_EXCLUSIVE flag for a partition root so that the SCHED_DEADLINE
check will continue to work as intended. However it turns out that the
current code isn't perfect and there are cases where a cpuset isn't
a valid partition root, but the exclusive flag is still incorrectly
set. This can leads to SCHED_DEADLINE check being incorrectly triggered
when there are deadline tasks in the system. This can result in unexpected
-EBUSY failure when making changes to cpuset control files. Fix that
by checking for a valid partition root in the case of v2 and break out
the v1 specific check back into cpuset1_validate_change(). It is far
easier and less cumbersome than to make sure that the exclusive flag
is only set for valid partition roots.

The is_in_v2_mode() check guarding the call to cpuset1_validate_change()
is also moved to the appropriate place inside cpuset1_validate_change()
and a cpuset_v2() is now being used as a guard which should be more
accurate for the a v1 system with v2 mode enabled.

Even though commit a86ce68078b2 ("cgroup/cpuset: Extract out
CS_CPU_EXCLUSIVE & CS_SCHED_LOAD_BALANCE handling") is marked as a
commit to be fixed, the problem may exist before that.

Fixes: a86ce68078b2 ("cgroup/cpuset: Extract out CS_CPU_EXCLUSIVE & CS_SCHED_LOAD_BALANCE handling")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset-v1.c | 20 ++++++++++++++++++--
 kernel/cgroup/cpuset.c    | 17 +++++------------
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/kernel/cgroup/cpuset-v1.c b/kernel/cgroup/cpuset-v1.c
index 562ad35f00d0..c03ae8aac03a 100644
--- a/kernel/cgroup/cpuset-v1.c
+++ b/kernel/cgroup/cpuset-v1.c
@@ -61,6 +61,11 @@ struct cpuset_remove_tasks_struct {
 #define FM_MAXCNT 1000000	/* limit cnt to avoid overflow */
 #define FM_SCALE 1000		/* faux fixed point scale */
 
+static inline bool is_in_v2_mode(void)
+{
+	return cpuset_cgrp_subsys.root->flags & CGRP_ROOT_CPUSET_V2_MODE;
+}
+
 /* Initialize a frequency meter */
 static void fmeter_init(struct fmeter *fmp)
 {
@@ -357,10 +362,21 @@ int cpuset1_validate_change(struct cpuset *cur, struct cpuset *trial)
 		if (!is_cpuset_subset(c, trial))
 			goto out;
 
-	/* On legacy hierarchy, we must be a subset of our parent cpuset. */
+	/*
+	 * We can't shrink if we won't have enough room for SCHED_DEADLINE
+	 * tasks in a scheduling partition.
+	 */
+	if (is_cpu_exclusive(cur) && is_sched_load_balance(cur) &&
+	    !cpuset_cpumask_can_shrink(cur->cpus_allowed, trial->cpus_allowed))
+		goto out;
+
+	/*
+	 * On legacy hierarchy with v2 mode off, we must be a subset of our
+	 * parent cpuset.
+	 */
 	ret = -EACCES;
 	par = parent_cs(cur);
-	if (par && !is_cpuset_subset(trial, par))
+	if (par && !is_in_v2_mode() && !is_cpuset_subset(trial, par))
 		goto out;
 
 	/*
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 753aa65afcd7..5639c486c967 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -752,7 +752,7 @@ static int validate_change(struct cpuset *cur, struct cpuset *trial)
 
 	rcu_read_lock();
 
-	if (!is_in_v2_mode())
+	if (!cpuset_v2())
 		ret = cpuset1_validate_change(cur, trial);
 	if (ret)
 		goto out;
@@ -765,23 +765,16 @@ static int validate_change(struct cpuset *cur, struct cpuset *trial)
 
 	/*
 	 * We can't shrink if we won't have enough room for SCHED_DEADLINE
-	 * tasks. This check is not done when scheduling is disabled as the
-	 * users should know what they are doing.
-	 *
-	 * For v1, effective_cpus == cpus_allowed & user_xcpus() returns
-	 * cpus_allowed.
-	 *
-	 * For v2, is_cpu_exclusive() & is_sched_load_balance() are true only
-	 * for non-isolated partition root. At this point, the target
-	 * effective_cpus isn't computed yet. user_xcpus() is the best
-	 * approximation.
+	 * tasks. This check is only done on non-isolated partition root.
+	 * At this point, the target effective_cpus isn't computed yet.
+	 * user_xcpus() is the best approximation.
 	 *
 	 * TBD: May need to precompute the real effective_cpus here in case
 	 * incorrect scheduling of SCHED_DEADLINE tasks in a partition
 	 * becomes an issue.
 	 */
 	ret = -EBUSY;
-	if (is_cpu_exclusive(cur) && is_sched_load_balance(cur) &&
+	if (is_partition_valid(cur) && is_sched_load_balance(cur) &&
 	    !cpuset_cpumask_can_shrink(cur->effective_cpus, user_xcpus(trial)))
 		goto out;
 
-- 
2.55.0

