Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533429;
	b=TiFfIjF38afLK1GbRc6ftceHPF9gt/MG5kQFzaPH3J88K+5A4sX42LqNRBPTO7xoP+3x
	 xXSAwW29A6r81ZeZqYtWGczsvYJrn0DDFQhOdGYw2x7Chn01xYtgFPvSaBuC9X21WmJb1
	 ldGWzT11ZSansg7RQKtbBFqGJIyJ5inQu8Publ4p5ZUm92h8jEOS9+D7S3qrduKFq3bmQ
	 5yANTIb8R/hG8ll0+bFERGindb6VEvLm+YYL9hUz2YlFdGBH6pQVUBpiRofGY2SlxXPiN
	 XBz/tiS2pe8tWxjBdOIXeE9tVDPmFPmtm3GENhBQOm4kL5rGvUGiBshPAPo9J+bGxoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533429;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AS9muhDYnZHOtbwjC8JKp2TWwsyVXpxqw5ZoLXpivRo=;
	b=EQZ6B8OviO8vEMKuCm2IJq0diK/47KT8PF/vYyfW5BZ4QbJ9oxZBXrt/5RBV0Hxo40rk
	 9I/BnQ2TBqYGlbiuyohMfrO5VRcdLopjOkGrTRJ3OSNpaz8A88xMogvbG2aemy+WFNr45
	 vANnFN8ex3uAAoWzSvGcaxzhjiqkmr+UadwedMysH9lMQoK1nd8hwtxmrSRKtNP7eR+Iq
	 VRFOQllH0gdoF/qXNxC7whW/+KU2YX/iDSwVjFXY89TbFB54iaH4JrE752RpFvlKBkns1
	 HWWptJHzooOYPcDClhkrJib/KLzNWAYnJOPXR3D/nA/ByWUM9l2a87GS14jkDZbVo7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZwQW361v;
	arc=none smtp.remote-ip=91.218.175.99
Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6903C606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6903C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZwQW361v
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=I3nEklVMLciatcIAMqfjYSff5CMSkV1dEqnENef8/mQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793533426; v=1; x=1794138226;
 b=ZwQW361v8CwS+vdwWefGTNJRqLus4rGel1UUz5AuV/wBOtTPcXJs10b2vYZ2c/e8jGhzZllm
 +b7znmrLcAlbiTgxi9iJfw0Z+MG+2tv92TGHQOFoGn5hV4/0tPI+kBlLxysRonaEduR8u0WYwWR
 ot4jIlA1CbXr/4bdWx0BqMiY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0861155884114fc8;
	Sun, 01 Nov 2026 11:43:46 +0000
X-Mizu-Trace-ID: 0861155884114fc8
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
Subject: [RFC PATCH -v4 10/22] cpuset: introduce local_partition_enable()
Date: Sun,  1 Nov 2026 19:41:54 +0800
Message-Id: <20261101114206.2434398-11-ridong.chen@linux.dev>
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
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit

From: Chen Ridong <chenridong@huawei.com>

The partition_enable() function introduced in the previous patch can be
reused to enable local partitions.

The local_partition_enable() function is introduced, which factors out the
local partition enablement logic from update_parent_effective_cpumask().
After passing local partition validation checks, it delegates to
partition_enable() to complete the partition setup.

This refactoring creates a clear separation between local and remote
partition operations while maintaining code reuse through the shared
partition_enable() infrastructure.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 78 ++++++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 25 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index ef162935ba5a..847713110738 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1998,6 +1998,57 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 	remote_partition_disable(cs, tmp);
 }
 
+/**
+ * local_partition_enable - Enable local partition for a cpuset
+ * @cs: Target cpuset to become a local partition root
+ * @new_prs: New partition root state to apply
+ * @tmp: Temporary masks for CPU calculations
+ *
+ * Return: 0 on success, error code on failure
+ */
+static int local_partition_enable(struct cpuset *cs,
+				  int new_prs, struct tmpmasks *tmp)
+{
+	struct cpuset *parent = parent_cs(cs);
+	enum prs_errcode err;
+
+	lockdep_assert_cpuset_lock_held();
+	WARN_ON_ONCE(is_remote_partition(cs));	/* For local partition only */
+
+	/*
+	 * The parent must be a partition root.
+	 * The new cpumask, if present, or the current cpus_allowed must
+	 * not be empty.
+	 */
+	if (!is_partition_valid(parent)) {
+		return is_partition_invalid(parent)
+		       ? PERR_INVPARENT : PERR_NOTPART;
+	}
+
+	compute_excpus(cs, tmp->new_cpus);
+	err = validate_partition(cs, parent, new_prs, tmp->new_cpus, NULL);
+	if (err)
+		return err;
+
+	/*
+	 * This function will only be called when all the preliminary
+	 * checks have passed. At this point, the following condition
+	 * should hold.
+	 *
+	 * (cs->effective_xcpus & cpu_active_mask) ⊆ parent->effective_cpus
+	 *
+	 * Warn if it is not the case.
+	 */
+	cpumask_and(tmp->addmask, tmp->new_cpus, cpu_active_mask);
+	WARN_ON_ONCE(!cpumask_subset(tmp->addmask, parent->effective_cpus));
+
+	partition_enable(cs, parent, new_prs, tmp->new_cpus);
+
+	cpuset_update_tasks_cpumask(parent, tmp->addmask);
+	update_sibling_cpumasks(parent, cs, tmp);
+	return 0;
+}
+
 /**
  * update_parent_effective_cpumask - update effective_cpus mask of parent cpuset
  * @cs:      The cpuset that requests change in partition root state
@@ -2096,27 +2147,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		nocpu = tasks_nocpu_error(parent, cs, tmp->delmask);
 	}
 
-	if ((cmd == partcmd_enable) || (cmd == partcmd_enablei)) {
-		new_prs = (cmd == partcmd_enable) ? PRS_ROOT : PRS_ISOLATED;
-
-		part_error = validate_partition(cs, parent, new_prs,
-						tmp->delmask, NULL);
-		if (part_error)
-			return part_error;
-
-		/*
-		 * This function will only be called when all the preliminary
-		 * checks have passed. At this point, the following condition
-		 * should hold.
-		 *
-		 * (cs->effective_xcpus & cpu_active_mask) ⊆ parent->effective_cpus
-		 *
-		 * Warn if it is not the case.
-		 */
-		cpumask_and(tmp->new_cpus, tmp->delmask, cpu_active_mask);
-		WARN_ON_ONCE(!cpumask_subset(tmp->new_cpus, parent->effective_cpus));
-		deleting = true;
-	} else if (cmd == partcmd_disable) {
+	if (cmd == partcmd_disable) {
 		/*
 		 * May need to add cpus back to parent's effective_cpus
 		 * (and maybe removed from subpartitions_cpus/isolated_cpus)
@@ -3085,9 +3116,6 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 		 * Otherwise, enable a remote partition.
 		 */
 		if (is_partition_valid(parent)) {
-			enum partition_cmd cmd = (new_prs == PRS_ROOT)
-					       ? partcmd_enable : partcmd_enablei;
-
 			/*
 			 * It is not allowed to create a root partition under
 			 * an isolated parent partition.
@@ -3096,7 +3124,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 				err = PERR_ISOPARENT;
 				goto out;
 			}
-			err = update_parent_effective_cpumask(cs, cmd, NULL, &tmpmask);
+			err = local_partition_enable(cs, new_prs, &tmpmask);
 		} else {
 			err = remote_partition_enable(cs, new_prs, &tmpmask);
 		}
-- 
2.34.1

