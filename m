Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792248;
	b=VZYs1k9ZCUO8FGesjV8UWa7KhnRJiGP0cePkVuo1ZYHJBCn4mn34zLzq5HyQN8MhtQA5
	 CcIxfCtLYvmODCpyFYXlhaWPUMXKB41bsNjw9mKF3b2/Akd2P+Vnqo+R+CFW+YG1mqXC5
	 dKaExRGtVjloMAXGN49iYYdFbyfd5OvAwT+psMMZ3aQdGFtLFcHiSy3Xm6Prf7gVFYRQO
	 INA3Pf8WhQ5dTQxz8qTMvEtbLJfBUHi4P1B45j/g9WsreN3iBy0THi8UjXUHQDlCph+M9
	 SGzzpbMFuaMTiiupIm6/6lbGVzrgrx8s08OwBlua4/P76hY5EPx8Wj78OrsplULZ1Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792248;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=f+3J2KuUg5bF2JoYKwe2GtPkoMqzvcgoh+fiO3Be1ZQ=;
	b=Gc/FxImB7+nn3qNbrbYqMsImdRE6INiP5Bo3k+pLb03zdXz/UgNU4l9QkfWp00xKQ75D
	 8KCnJnN/QqvXpps3alDeCJDWbR8tTFnKiOeF5S5BHtVJarqYgdC9uyAyTmicmDHZGhgts
	 Z85uNT3lkSglLLk+55TPttJIKhj9YosE7KVAoa3rVeAFQs3hgdmfNc0CJpPOttVZrgsEL
	 xxyZiKkXV8//cqKz9c3Xkc4VVW0OzAbxmRLoVZENm1iSRJ1VFLv74LkUPn0/qOQturpil
	 QaIxdpmZsyQdbeZd0HVkdfPooD0Wzc8k+mDpo05E2dZfsIIPvLPD9p3TrkWBdJmSFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N0Z5v9YW;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF05606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF05606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N0Z5v9YW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794792247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f+3J2KuUg5bF2JoYKwe2GtPkoMqzvcgoh+fiO3Be1ZQ=;
	b=N0Z5v9YWAeedDBkaITJSX5DGXPTwa6OzeXgpgzATYDpSQomZL5MzfNF0jDCLbwZKtxwwZt
	dZGnNiSeiltK+CYHawmCaH2vP01fohStW420ILvKsYZGWY63TOYmcyuUi6LQAap2pwTh8w
	GxrbUo6p27SoHZ3V0afKmQcTfi02/g0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-73-LQU9NcdwOYm85cPi8eUCCw-1; Sun,
 15 Nov 2026 20:23:57 -0500
X-MC-Unique: LQU9NcdwOYm85cPi8eUCCw-1
X-Mimecast-MFC-AGG-ID: LQU9NcdwOYm85cPi8eUCCw_1794792236
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3776B19560BA;
	Mon, 16 Nov 2026 01:23:56 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3857C343;
	Mon, 16 Nov 2026 01:23:54 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH-next v4 3/6] cgroup/cpuset: Check remote partition underneath before making an invalid partition valid
Date: Sun, 15 Nov 2026 20:23:06 -0500
Message-ID: <20261116012330.2271010-4-longman@redhat.com>
In-Reply-To: <20261116012330.2271010-1-longman@redhat.com>
References: <20261116012330.2271010-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

When re-evaluating an invalid local partition via partcmd_update,
update_parent_effective_cpumask() does not check whether a descendant
remote partition is using its exclusive CPUs, promoting the cpuset to a
valid partition root over the remote partition. This condition should only
be possible if parent is the top_cpuset and exclusive_cpus isn't empty.

This leaves an active remote partition underneath a valid
local partition root with overlapping exclusive CPUs, breaking
scheduler domain partitioning and triggering warnings in
compute_partition_effective_cpumask() and generate_sched_domains().

Fix that by checking the effective_xcpus against subpartitions_cpus
when an underneath remote partition is possible to make sure that all
the exclusive CPUs are available before allowing the invalid partition
to be switched back to valid.

Also make sure that effective_xcpus is non-empty before swtiching an
invalid partition back to valid.

Add a test case in test_cpuset_prs.sh to verify that an invalid partition
with a remote partition underneath cannot be switched back to valid
with a hotplug event.

In the special case when the last active CPU in the top_cpuset partition
is offlined, the hotplug code will empty subpartitions_cpus and let the
existing local partition to compete for the exclusive CPUs again. If
there is an invalid local partition above a remote partition and that
invalid local partition is able to switch to a valid partition, the remote
partition below will now share some the of exclusive CPUs violating the
CPU exclusivity rule. This special case will be handled in a later patch.

Fixes: 181c8e091aae ("cgroup/cpuset: Introduce remote partition")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-47715b89-d5fb-4731-b7c9-070773c6ff75
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c                        | 42 ++++++++++++-------
 .../selftests/cgroup/test_cpuset_prs.sh       |  4 ++
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 195d4e3a283c..81481fa62cfe 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2029,11 +2029,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		 * tasks_nocpu_error() with this very mask, and a failing
 		 * write is routed to partcmd_invalidate instead.
 		 */
-		if (is_partition_invalid(cs)) {
-			adding = false;
-			deleting = cpumask_and(tmp->delmask,
-					newmask, parent->effective_xcpus);
-		} else {
+		if (is_partition_valid(cs)) {
 			cpumask_andnot(tmp->addmask, cs->effective_xcpus, newmask);
 			adding = cpumask_and(tmp->addmask, tmp->addmask,
 					     parent->effective_xcpus);
@@ -2041,6 +2037,17 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 			cpumask_andnot(tmp->delmask, newmask, cs->effective_xcpus);
 			deleting = cpumask_and(tmp->delmask, tmp->delmask,
 					       parent->effective_xcpus);
+		} else {
+			deleting = cpumask_and(tmp->delmask,
+					newmask, parent->effective_xcpus);
+
+			/* Check if a remote partition may be underneath */
+			if ((parent == &top_cpuset) &&
+			    !cpumask_empty(cs->exclusive_cpus) &&
+			    cpumask_intersects(tmp->delmask, subpartitions_cpus)) {
+				part_error = PERR_REMOTE;
+				deleting = false;
+			}
 		}
 
 		/*
@@ -2107,34 +2114,37 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		} else if (is_partition_invalid(cs)) {
 			struct cgroup_subsys_state *css;
 			struct cpuset *child;
-			bool exclusive = true;
 
 			/*
 			 * Convert invalid partition to valid has to pass the
-			 * cpu exclusivity test when cpuset.cpus.exclusive is
-			 * empty as well as the housekeeping check.
+			 * following tests:
+			 * 1) housekeeping CPU conflict check
+			 * 2) cpu exclusivity test when cpuset.cpus.exclusive is
+			 *    empty.
+			 * 3) if parent is top_cpuset, none of the effective_xcpus
+			 *    (tmp->delmask) are in subpartitions_cpus, if not a
+			 *    remote partition may be underneath.
 			 */
 			if (prstate_housekeeping_conflict(cs->partition_root_state,
 							  parent_prs, tmp->delmask, NULL)) {
 				part_error = PERR_HKEEPING;
-				goto write_error;
-			}
-			if (cpumask_empty(cs->exclusive_cpus)) {
+			} else if (cpumask_empty(cs->exclusive_cpus)) {
 				rcu_read_lock();
 				cpuset_for_each_child(child, css, parent) {
 					if (child == cs)
 						continue;
 					if (!cpusets_are_exclusive(cs, child)) {
-						exclusive = false;
+						part_error = PERR_NOTEXCL;
 						break;
 					}
 				}
 				rcu_read_unlock();
+			} else if ((parent == &top_cpuset) &&
+				   cpumask_intersects(tmp->delmask, subpartitions_cpus)) {
+				part_error = PERR_REMOTE;
 			}
-			if (exclusive)
+			if (!part_error)
 				deleting = !cpumask_empty(tmp->delmask);
-			else
-				part_error = PERR_NOTEXCL;
 		}
 	}
 
@@ -2155,7 +2165,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 			break;
 		case PRS_INVALID_ROOT:
 		case PRS_INVALID_ISOLATED:
-			if (!part_error)
+			if (!part_error && deleting)
 				new_prs = -old_prs;
 			break;
 		}
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index 1397ec428c46..81f0eecaca80 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -563,6 +563,10 @@ TEST_MATRIX=(
 	" C1-6:P1 C3-6:P2 C5-6:P2  .       .    P1      .      .     0 A1:1-2|A2:3-4|A3:5-6 \
 								       A1:P1|A2:P1|A3:P2 5-6"
 
+	# A hotplug event will not incorrectly activate an invalid partition with
+	# a remote partition underneath.
+	"  CX1-4  C3-4:P1   .      .      P1   O1=0     .      .     0 A1:2|A2:3-4 A1:P-1|A2:P1"
+
 	#
 	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
 	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------
-- 
2.56.0

