Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645116;
	b=DptbCLIkuITRTDtCoICcwxC7UioIg+v9kiF++AuRKooT6ctg8xp44qiHmGpM5/IjVlhK
	 TvJPBevSbfpTbhMga2TbAdB3VVksMfnPVmQ1iZnYR57AB7bIp4Y7ttBdNP4FR2brrq2T9
	 IEs6p/DRArFfyPvkCF8zaY0loYbSNWwjzex3vrIh7Ynma55VWC+hkQd+WmuPqpq3JvcYI
	 ed+tyi2eSXkLjNaucsjsYoY4NjfR9zAFfXA7eFWAaW682UA3FsflwQzHWQTQkh3WUqR6v
	 Z01iaHzKCG5wnqBYL3omVNC+hVq3nsCN3cM7Y+0jbCcszRPOUlQtiZXGOOacbgQdDvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645116;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YFOdMd/J01XlqZYSe8xeaay8k9R5byGJcqsRWQ6eqv4=;
	b=dXOX/CU0Q1NqrozOUOICjp8l1jpWxrQCgWjZzXu/aaaEJHnoyoFG6TcKeUb2S24LzLxU
	 ma7Uh098LhDLpHo9QofVgDLf1iNPiPGXBMWM0hQIxmfWECvvWf9H0MDXnQmN0SBOo2BPj
	 UYIfnI94DG6s8QLzgoo/CFSC9IHoufOWyuRGFRZkK0JdlnfM/ZNs5fQ7oAIzkoeMVeU23
	 wXY2Fa1jeZ06eDjW56Ke6uPM3VbqcNhVv+JZQP01jFjU9cNEQIj39Er/QFyYruX79bdof
	 J+ddAldVFiq6WAO3FZtir3R6DsUTYVJ8IvYEFsvcXLDdBAsN0klyExFn0cqH888vH/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LDvtEWRT;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2188A606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2188A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LDvtEWRT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U7dNpqjKPhZeLSgiBAToEG4igpaj3/eBtsAQDcqWHA4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794645113; v=1; x=1795249913;
 b=LDvtEWRT2ohg5SXGbbd2/9E4DuUxG/oggDpuaqjpjru3J3VejZxyrZjMoIou3guGGRCWcfI1
 fQ/jPrz7Y38CP3aUIU16atXgldvJAQ1aM9MwHPD72/RuDgQ00FYeQVT9qTfbFvfMSZ0SuKch3bT
 i5hqPfPbye2QjnPjIQcLFI0Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0e026ad38468d293;
	Sat, 14 Nov 2026 08:31:53 +0000
X-Mizu-Trace-ID: 0e026ad38468d293
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
Subject: [PATCH v5 03/12] cpuset: introduce partition_update()
Date: Sat, 14 Nov 2026 16:31:15 +0800
Message-Id: <20261114083124.1340140-4-ridong.chen@linux.dev>
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

Introduce partition_update() to centralize updates to key cpuset structures
during a partition update, including:
1. effective_xcpus
2. exclusive_cpus

Key operations performed:
1. Adding and removing exclusive CPUs via partition_xcpus_add()/del()
2. Synchronizing the effective exclusive CPUs mask
3. Updating the exclusive CPUs mask when modification is required
4. Triggering scheduler domain rebuilds

For a local partition, the CPUs to be added or deleted are restricted to
those in the parent's effective_xcpus, as the parent may have shrunk.
The function returns early if nothing is to be changed.

The partition root state is unchanged by this function, so no partition
change notification is sent.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 12bdcaeb8ae5..c66864faab32 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1824,6 +1824,58 @@ static void __maybe_unused partition_disable(struct cpuset *cs, int new_prs,
 	update_sibling_cpumasks(parent, cs, tmp);
 }
 
+/**
+ * partition_update - Update an existing partition configuration
+ * @cs: The cpuset to update
+ * @prs: Partition root state (must be positive)
+ * @xcpus: New exclusive CPUs mask for the partition (NULL to keep current)
+ * @excpus: New effective exclusive CPUs mask
+ * @tmp: Temporary masks
+ *
+ * Updates partition-related fields. The tmp->addmask is the CPU mask that
+ * will be added to the subpartitions_cpus and removed from parent's
+ * effective_cpus, and the tmp->delmask vice versa.
+ */
+static void __maybe_unused partition_update(struct cpuset *cs, int prs, struct cpumask *xcpus,
+					    struct cpumask *excpus, struct tmpmasks *tmp)
+{
+	struct cpuset *parent;
+
+	lockdep_assert_cpuset_lock_held();
+	WARN_ON_ONCE(!cpuset_v2());
+	WARN_ON_ONCE(prs <= 0);
+
+	parent = is_remote_partition(cs) ? NULL : parent_cs(cs);
+
+	/*
+	 * Only CPUs owned by the parent can be taken from or given back to
+	 * it, the parent may have shrunk. A remote partition gets its CPUs
+	 * from top_cpuset which owns all the CPUs.
+	 */
+	if (parent) {
+		cpumask_and(tmp->addmask, tmp->addmask, parent->effective_xcpus);
+		cpumask_and(tmp->delmask, tmp->delmask, parent->effective_xcpus);
+	}
+	if (cpumask_empty(tmp->addmask) &&
+	    cpumask_empty(tmp->delmask) &&
+	    cpumask_equal(cs->effective_xcpus, excpus))
+		return;
+
+	spin_lock_irq(&callback_lock);
+	partition_xcpus_add(prs, parent, tmp->addmask);
+	partition_xcpus_del(prs, parent, tmp->delmask);
+	/*
+	 * Need to update effective_xcpus and exclusive_cpus now as
+	 * update_sibling_cpumasks() called by the callers afterwards may
+	 * iterate back to the same cs.
+	 */
+	cpumask_copy(cs->effective_xcpus, excpus);
+	if (xcpus)
+		cpumask_copy(cs->exclusive_cpus, xcpus);
+	spin_unlock_irq(&callback_lock);
+	cpuset_force_rebuild();
+}
+
 /*
  * remote_partition_enable - Enable current cpuset as a remote partition root
  * @cs: the cpuset to update
-- 
2.34.1

