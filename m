Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104733;
	b=YpgI4tDpIBbmW+faJcDVpBx4mdRh/hyI3p3jXvXl70MFw5QTZbe8J1NOJBzewhahQIOV
	 OlSCKOBqocUJyFfm43kLaC13hhNXxniERtObCGOBdeuZU4QJrjbmgZFp4WkNCelKz0kKv
	 ersQni60WhiIE08Nx0PfP0S2L2IXtDWP9mkZN1wGudVv7yjMG4WVCqOQi90gX8RSdUjaL
	 5e7auWCmg6W6fglPQS63Q+Nc/TpchdQd8DJ0TNfurvf3BtFTe4DzRv5/0XTHM/Dh16B08
	 sGKq2M467MuNbaIbo+r2N/Dp/2gu+giTe7ef3qHEWIrw9ToN2Tf0Wgh4oyXO2G9N0QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104733;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zQRlKbdi45Fb4to1TV3mDMDiTTP8xbQo1lX9AeY86T4=;
	b=Zugyvpqa4riYLcjDR9chXGGOFvAW4GN+lEyaGRB4hJlY0UB7nv5N/FOvl5hVw88PDp6r
	 ESFokOCVcVKiXwJFguBEbbhRbshRHq4UXFHbOsxr7f58DL/CVFdIyirbrE9bMVAqYBVHG
	 oFQYfcpp/QMMJHvXI7MaCgvRRLdzSidTEOXOqjoJfff7vmcEacw1GhGDPjH1igSVWV4/b
	 cp8Uv/8ouYpmr7z7RoR4DwUwXFZcAvaAutAKUm7hEjRnY7Jt2DI99LEdA1eAePGG+gWjt
	 3OgSgV/9cS2RP1TJcm0E7hFJKocIlS2Qi9DfRbeAvQUGmI3ZSTFNs9Pis0znsz5XMTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TmpcqLM9;
	arc=none smtp.remote-ip=91.218.175.89
Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A97606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A97606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TmpcqLM9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=H5/6cghSYjlUdBX/4hU2ACkhZSzFOjZAQQW0OApn7GA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793104730; v=1; x=1793709530;
 b=TmpcqLM9fPDvgmSkt2jl8vLQ4yeldWK8WHxbmhJPgPGVSN2eONf7WqefPme6rcxjkv4GiIjs
 OsO0k2ajo4sIg1411ztVmIl7ev6qV8bjRxWX9Ic/F18YT4k8NgI3ggmlviUAOpBeSkeK0cYu1ua
 /9wsus3HR8nnWPbNscnOyEsc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1ab54019d47de0d5;
	Tue, 27 Oct 2026 12:38:50 +0000
X-Mizu-Trace-ID: 1ab54019d47de0d5
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com
Cc: ridong.chen@linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH] cgroup/cpuset: Fix missing effective_xcpus accounting of child partitions
Date: Tue, 27 Oct 2026 20:38:37 +0800
Message-ID: <20261027123837.100909-1-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
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

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

When a partition root expands its exclusive CPUs, a valid child
partition will be able to claim more CPUs from its parent. As
update_cpumasks_hier() always updates a cpuset before its descendants,
the parent has already been committed when the child partition is
reached. Its effective_cpus is computed with the child's old
effective_xcpus subtracted and no further adjustment is made
after the child commits its new effective_xcpus.

The additional CPUs are thus granted to both the parent and the child
partitions. generate_sched_domains() then emits the warning below
about the overlapping sched domains:

  WARNING: kernel/cgroup/cpuset.c:919 at rebuild_sched_domains_locked+0x1ec/0x2e0, CPU#21: bash/1225

Fix that by taking the CPUs newly added to a valid child partition
away from its parent at the commit point of update_cpumasks_hier()
right before the new effective_xcpus is committed. The tasks in the
parent cpuset as well as its other children will be updated if its
effective_cpus is changed.

A new test case is added to test_cpuset_prs.sh to test this patch.

Fixes: e2ffe502ba45 ("cgroup/cpuset: Add cpuset.cpus.exclusive for v2")
Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 kernel/cgroup/cpuset.c                        | 25 +++++++++++++++++++
 .../selftests/cgroup/test_cpuset_prs.sh       |  4 +++
 2 files changed, 29 insertions(+)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3219f927c35e..ec0ef3ad0726 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2241,6 +2241,7 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
 		struct cpuset *parent = parent_cs(cp);
 		bool remote = is_remote_partition(cp);
 		bool update_parent = false;
+		bool xcpus_added = false;
 
 		old_prs = new_prs = cp->partition_root_state;
 
@@ -2356,6 +2357,19 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
 		}
 
 		spin_lock_irq(&callback_lock);
+		/*
+		 * A child partition may claim more CPUs when its parent expands
+		 * the exclusive CPUs. Take the newly granted CPUs away from the
+		 * parent which was committed earlier in this walk.
+		 */
+		if (!remote && new_prs > 0) {
+			compute_excpus(cp, tmp->addmask);
+			if (cpumask_andnot(tmp->delmask, tmp->addmask,
+					   cp->effective_xcpus)) {
+				partition_xcpus_add(new_prs, parent, tmp->delmask);
+				xcpus_added = true;
+			}
+		}
 		cpumask_copy(cp->effective_cpus, tmp->new_cpus);
 		cp->partition_root_state = new_prs;
 		/*
@@ -2375,6 +2389,17 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
 
 		cpuset_update_tasks_cpumask(cp, tmp->new_cpus);
 
+		/*
+		 * The parent's effective_cpus may have been changed by
+		 * partition_xcpus_add() above. Update the tasks in the parent
+		 * cpuset and its other children, if necessary.
+		 */
+		if (xcpus_added) {
+			cpumask_copy(tmp->addmask, parent->effective_cpus);
+			cpuset_update_tasks_cpumask(parent, tmp->addmask);
+			update_sibling_cpumasks(parent, cp, tmp);
+		}
+
 		/*
 		 * On default hierarchy, inherit the CS_SCHED_LOAD_BALANCE
 		 * from parent if current cpuset isn't a valid partition root
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index 83ef6c781af3..09e430570815 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -437,6 +437,10 @@ TEST_MATRIX=(
 	" CX1-4:P1 CX3-4:P1 .     .     X1-2     .      .      .     0 A1:1-2|A2:1-2|XA2: A1:P1|A2:P-1"
 	" CX1-4:P1 CX3-4:P1 .     .  X1-2:X1-4   .      .      .     0 A1:1-2|A2:3-4|XA2:3-4 A1:P1|A2:P1"
 
+	# The extra CPUs gained by a child partition when its parent expands the
+	# exclusive CPUs have to be taken away from the parent.
+	" C2-6:X2-5:P1 C3-6:X3-6:P1 .      .      X2-6     .      .      .     0 A1:2|A2:3-6|XA2:3-6 A1:P1|A2:P1 ."
+
 	# Taking away all CPUs from parent or itself if there are tasks
 	# will make the partition invalid.
 	"  C2-3:P1   C3:P1  .      .      T     C2-3    .      .     0 A1:2-3|A2:2-3 A1:P1|A2:P-1"
-- 
2.43.0

