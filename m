Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533397;
	b=nAlswb/Ba1EKEdpXDXI3xobZjGpsNPEZa8X+YqpHWGY3jRpSdzX5fvo6ki4Bzq03H5AE
	 zMSaHp1q42mrttqWaqghr5Jm1dbk1fEmndM0ooDW/GdMaIUbDZpnUPHjWZC6q0Qo6o+ow
	 pkLvxbdqw1mhTCeU2blJ731OJlnxWBeaESoVU3Uikb+NPUuk8MBi1D7l+/+jcFWuKPZ54
	 +o/cJoFsgUbrl1tCYTI21p/K2vjjPlReCwem58jH+AOJDIDhvW0hdY4eoC3VqCEhv+OlD
	 zx0NaWune9tLGiEr0DhfcpNz5CzzCENeg5bBZ3GRm3CU+wxCG2gx3tIQNauNyGT2irw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533397;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=egcDD7StWm2KzdxIHCTD2Wz1mW0J5nsYOleDz5MV2Lk=;
	b=yvNGVZb5JEWzVnZD5GxGmQvZfLP5PLCwTS+JRj9CrRn/PhXwFpsTreQvoS9FTpFZNJMF
	 ZDuDnRcJPrgO6CTTAScEbfJhjn7G08iyuTjC9kF2kvBa3H5w06x+P/SK7bMz8EeNp9DeQ
	 p3VSYBQ5atUhRongb88iThr4RNsRGrl+oe5k9c7wX8Pn5S/slaQy8fyhcOvo0ULHxBxa2
	 7ltW9K/f5oDHNnJhMameypeU7rPR6RUSyrdIWYX8Jfx2vytJaCzHSqOhny/jYaLux7LvS
	 gXUD4iN2fJL+hy80BXOKfZgtmX/nbLjukPlcIQDB4qOwh1aTPqUJ5/dLBdwPqbHemAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YTbKu2iT;
	arc=none smtp.remote-ip=91.218.175.77
Received: from mta0.migadu.com (out-77.mta0.migadu.com [91.218.175.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6B606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D6B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YTbKu2iT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IAIH0sUB6ZXvBp6EwjjsX/8m+Idapnbxreekm81rNgE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793533395; v=1; x=1794138195;
 b=YTbKu2iTs7gB6eC8lZjXt8b4+Ea0sku+vWVfs41klTDt3SZlWPvCxes5HFXN/RBAL+sSvwmt
 uwRo4LBktaB8mXEZS2nlAendQ6QzeJ2uwM13ZNJPCnbiIFwDIkMMs9649+XKsUYN1O7QRP3FKNb
 XaVRTgHVPv2VOxUn7qQl+MvM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 45a4f65045edd856;
	Sun, 01 Nov 2026 11:43:15 +0000
X-Mizu-Trace-ID: 45a4f65045edd856
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
Subject: [RFC PATCH -v4 06/22] cpuset: introduce partition_update()
Date: Sun,  1 Nov 2026 19:41:50 +0800
Message-Id: <20261101114206.2434398-7-ridong.chen@linux.dev>
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

Signed-off-by: Chen Ridong <chenridong@huawei.com>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index c0d6dd7297f1..23ae548c3994 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1806,6 +1806,57 @@ static void partition_disable(struct cpuset *cs, struct cpuset *parent,
 	notify_partition_change(cs, old_prs);
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
+static void partition_update(struct cpuset *cs, int prs, struct cpumask *xcpus,
+			     struct cpumask *excpus, struct tmpmasks *tmp)
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
+	 * update_sibling_cpumasks() below may iterate back to the same cs.
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

