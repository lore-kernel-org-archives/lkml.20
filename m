Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645142;
	b=JhxoI8wpqcM7Y0X11dD5qEzsCH3yBzwMMcLh5D62jRsh63REO8oE29L7E3l5HmJNoeod
	 zUMNDvYmHs3/4FrUGhlhXbsXhN4ta3cpclmbA158uJsdoarolmmc6t5A68OH5RJxM7d1+
	 9TyKVXPbvuQaqayL3Syw2oUGtaW5F5skRnsfny35jDV2fUNdK0ls8Zhg2r86ezeZS3Yyn
	 /MAhntHrxDkW9XttALvELL4UejB2d0Yf0/33FJT8j0hf3waXvWSPvQatJ1ger+DSD/sLa
	 EqxWHnQzAuPB+G69lsOMTfu4KJqCuoA8QQl5upYr5iiEa0Cyrb8qPTEPsr18iZq5+fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645142;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L1umxRyRoXwUeNpafvwSTQRZEbfVnmhSvjJxXohuh3c=;
	b=dsIqmzQq6/sTLfSbPwd0CtiTRfFl39MMe0Qfyk0p1Z8HnBooUSlR4vM4jwkEuhRU9UJ4
	 l/Piyvuo4ykT2mkwNdTUswB/z1a6fMwacbORdkoDvYnS8BSn4EmtBTdndEB4TqiOZrC46
	 MmL8Dvm/4OtvLfShmiu25SXFuWXM0CuRFiVHrjzCbrHrK3vT4FLNAg3pSaJ8Atkc5F+EI
	 X6XHiBoDkuxocP69a1QP14NX4tilBx8AEYZV+BcAZOohNDBzPpxN1W7OOZrPHnezfeOxk
	 U2GZX3r3OVMwuIPnnvu13vzptWhJ11RWihJCF/G9gbK6xkKfeIa8ozEPW0atOXnNVpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TmWAexNB;
	arc=none smtp.remote-ip=95.215.58.77
Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D3606A339
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4D3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TmWAexNB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xa88qIitODRtDylhQXVikQeOMebLhmwp2SiYtZs4rcY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794645139; v=1; x=1795249939;
 b=TmWAexNBS1BWppba+GcOt8JrLvsstYtlpTuDAudL3Kg1a4q/RcwBaNuonMam/wf0pb6QtPdW
 iFNQmKL8cKVEmkS8ozoXjyQdLX/F9/FznWyf3RnK/THo2BtgILiWcRRDhRQ+bD0tsI5A8tWDF49
 I0uMHbmEKetFpI/yMhH03tZo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 46f17e74be95fa39;
	Sat, 14 Nov 2026 08:32:19 +0000
X-Mizu-Trace-ID: 46f17e74be95fa39
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Ridong Chen <ridong.chen@linux.dev>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH v5 09/12] cpuset: use partition_disable() for local partition disablement
Date: Sat, 14 Nov 2026 16:31:21 +0800
Message-Id: <20261114083124.1340140-10-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261114083124.1340140-1-ridong.chen@linux.dev>
References: <20261114083124.1340140-1-ridong.chen@linux.dev>
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

From: Ridong Chen <chenridong@xiaomi.com>

Replace the partcmd_disable handling of update_parent_effective_cpumask()
with partition_disable(), the same as for remote partition disablement.
partition_disable() gives the CPUs of a valid partition back to its
parent and propagates the change of the parent's effective_cpus to
the tasks and the other children of the parent.

An invalid partition has already given back its CPUs, so
update_prstate() only calls partition_disable() for a valid partition
and keeps setting the state of an invalid one itself.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 45605c6ab6a2..211567c61e95 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2182,18 +2182,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
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
@@ -3225,12 +3214,8 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 	}
 
 	if (disable_partition) {
-		if (is_remote_partition(cs))
+		if (is_partition_valid(cs))
 			partition_disable(cs, PRS_MEMBER, PERR_NONE, &tmpmask);
-		else
-			update_parent_effective_cpumask(cs, partcmd_disable,
-							NULL, &tmpmask);
-
 		/*
 		 * Invalidation of child partitions will be done in
 		 * update_cpumasks_hier() below.
-- 
2.34.1

