Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533436;
	b=UOX25fC9P3JA/qJ22pWXASRbgl1GlXcOdRPM3UmAXUDQZHgCoYeu50pVSvTCVkVhOkik
	 /Zr61ik61khfQcgq8Ojp6Del6Tio6C71i2mQAAJnIXJ/IBD4dqcj1GxJ4DlwaMuYlUx+8
	 Fl21h55KA1UAAWYrvoAECJ6xfc5YXvPZNE1AVD9Clb3Y18wbKvxqbfk5JJpq2Rh/iQoBF
	 Szar6jcf/+Kk7M5OOfqRwqrnLpcQgr7x95gF0jGTJqmWjRDSCdcKOPlCOhZJ+xmAxELCd
	 pvkjAc8yW/kng7GBxij7hAnKFx97WlyIodpdFrATWqbEONZ2GNHw825lvWkij2OATOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533436;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GwoudFnAHrc6QCPwo5XRSFEUNrvvo9Ldwa1PyC2n554=;
	b=OKRvnpUQ30AB17AgKfyfXYoiI/FM6gISOImJ34wjR8msGhqO3HEhPO6QZNJbiIt2oZCV
	 YdmgzO44YnnoQjf0UWj/ZYXbU/C1QV/VKGa8l0WKfzSlV+eLhtwswWd1wIjvLNLglhKoH
	 YkQ/tz7eK3qhkiblolH1cwySNEdxNTv4c1b8U+yrZptViMUkB6yMus+Wx//bJ/XC5/1oO
	 8hCwXovAehRE2lUWuPePzuB9lN0xWzqgzV9JvamyuNEJDDZDdwdPL/Drdhm3sDJJr40Zv
	 X2ufzRkcUMRmUaP925M4espsEoHg9ZvuPsgx+1z/HXB1TzONECNsSizvz4K4M99SwyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y6SOIvt+;
	arc=none smtp.remote-ip=95.215.58.150
Received: from mta1.migadu.com (out-150.mta1.migadu.com [95.215.58.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BD9606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BD9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y6SOIvt+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MVyrXGffKFh5UkbRuwnrnFz9o5/mBQuQXxBsvS7AMFE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793533433; v=1; x=1794138233;
 b=Y6SOIvt+yjg0A5SzmW8oNs+JsZomDr2I6D11NX7Xd4DLMV2Dw5FbhVaLfWvcmx4qF589xOqv
 pLpGNy3SEWIEOA0IfNKRwy3VV/OZzs+xfN6m6ZBybeU2eyMoV5LpJcPxBr5tr8Ze+weuIXSg2n1
 uiZq3pf6juLe9to79NCcNfOg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2413de377ae1957;
	Sun, 01 Nov 2026 11:43:53 +0000
X-Mizu-Trace-ID: e2413de377ae1957
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Michal Koutn?" <mkoutny@suse.com>
Cc: Guopeng Zhang <guopeng.zhang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ridong <chenridong@huawei.com>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [RFC PATCH -v4 11/22] cpuset: introduce local_partition_disable()
Date: Sun,  1 Nov 2026 19:41:55 +0800
Message-Id: <20261101114206.2434398-12-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101114206.2434398-1-ridong.chen@linux.dev>
References: <20261101114206.2434398-1-ridong.chen@linux.dev>
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

From: Chen Ridong <chenridong@huawei.com>

The partition_disable() function introduced earlier can be extended to
handle local partition disablement.

The local_partition_disable() function is introduced, which extracts the
local partition disable logic from update_parent_effective_cpumask(). It
calls partition_disable() to complete the disablement process.

This refactoring establishes a clear separation between local and remote
partition operations while promoting code reuse through the shared
partition_disable() infrastructure.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 847713110738..3d6ad6cd634a 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2049,6 +2049,31 @@ static int local_partition_enable(struct cpuset *cs,
 	return 0;
 }
 
+/**
+ * local_partition_disable - Disable a local partition
+ * @cs: Target cpuset (local partition root) to disable
+ * @part_error: partition error when @cs is disabled
+ * @tmp: Temporary masks for CPU calculations
+ */
+static void local_partition_disable(struct cpuset *cs, enum prs_errcode part_error,
+				    struct tmpmasks *tmp)
+{
+	struct cpuset *parent = parent_cs(cs);
+	int new_prs;
+
+	lockdep_assert_cpuset_lock_held();
+	WARN_ON_ONCE(is_remote_partition(cs));	/* For local partition only */
+
+	if (!is_partition_valid(cs))
+		return;
+
+	new_prs = part_error ? -cs->partition_root_state : PRS_MEMBER;
+	partition_disable(cs, parent, new_prs, part_error);
+
+	cpuset_update_tasks_cpumask(parent, tmp->addmask);
+	update_sibling_cpumasks(parent, cs, tmp);
+}
+
 /**
  * update_parent_effective_cpumask - update effective_cpus mask of parent cpuset
  * @cs:      The cpuset that requests change in partition root state
@@ -2147,18 +2172,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		nocpu = tasks_nocpu_error(parent, cs, tmp->delmask);
 	}
 
-	if (cmd == partcmd_disable) {
-		/*
-		 * May need to add cpus back to parent's effective_cpus
-		 * (and maybe removed from subpartitions_cpus/isolated_cpus)
-		 * for valid partition root.
-		 */
-		if (is_partition_valid(cs)) {
-			cpumask_copy(tmp->addmask, cs->effective_xcpus);
-			adding = true;
-		}
-		new_prs = PRS_MEMBER;
-	} else if (newmask) {
+	if (newmask) {
 		/*
 		 * Empty cpumask is not allowed
 		 */
@@ -3158,9 +3172,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 		if (is_remote_partition(cs))
 			remote_partition_disable(cs, &tmpmask);
 		else
-			update_parent_effective_cpumask(cs, partcmd_disable,
-							NULL, &tmpmask);
-
+			local_partition_disable(cs, PERR_NONE, &tmpmask);
 		/*
 		 * Invalidation of child partitions will be done in
 		 * update_cpumasks_hier() below.
-- 
2.34.1

