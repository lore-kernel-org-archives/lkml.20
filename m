Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533383;
	b=QFt62xdxK7copYpaCv6wLKfvu2D6LaO32ov4cdha2RU2sulfYvNeMrQY/LNgMCFF/E99
	 +HDaML49Fxc0pIPTcc4XV8ld7s6JRzwuvYf8sovlLsRcL6mPgSxINT5zY1/UdOGBS48kx
	 E8lrQ4Hi/kFlgWZZPh6SkAXtp03ZllAcmRAmve47lr/nMdfSU++6ePJPEs9kqAaadu/DC
	 i7Uei86DA7YP3zJgR4sFFPJpvaJUfjCSaDtDA0RRlP4Ndxlcl7/ST3qoSTJAkYm/Eyut3
	 XtFVWgFOlAWajmZKLRJHkQTKBaAzCu3B/wLvshDE2eSH7+76r8vkd6uZ4B85354PL3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533383;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LHF6GJPfrpZOo50VAQ6HTdgf2/QRvXqe/Z9PnbiTmr8=;
	b=Q3GbdSHMxZ+zjDakahRoPbsDO+OKEmjMdpJSIbtYTzIgd747AbNGhrxzFShBmdqXU1L1
	 12jeR10CAg5C3nJhYI2ODnYYu/7EWFKabMSwapQ/owtLNvRoV0wk6QyL9g+mWqdprzaJ8
	 dR8E0uXcTbgQbyPZz/Z1pZcQqPhjdR9KlCf/qIB7qEbOIHhEXgpajZ1ffkq36AqX3K2JO
	 aScHlZWyeNHdcaeAQQpYIYkgkZrGaLGOLPOk2cMyWwQWChLnNJs7dSjEvbZlccTZHkNrT
	 Ucd7PzzD47gMdGgZaTj7OcqT1TCyxDv1gtUnvJdF86henxE50jV99yfOBUKk9ckzNHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OTuFkBuU;
	arc=none smtp.remote-ip=91.218.175.68
Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699A3606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 699A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OTuFkBuU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=k/sdtO2/T8aAWFwwSFh+qz3+snC3R29hU6R0lxFG6Ek=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793533380; v=1; x=1794138180;
 b=OTuFkBuU9sZN/X76hfuk+axOUafijnVLVvbJb7KuOsi+8xON2awSJ5D1lokFIuh2yxvDSmCs
 7PFv/t5reV6MxZB8ZzNRROZjO2Guiai5MylqKilOrFwuBAdgzGvKM9q8OkxmU7oRhx5LSw/EpKn
 zynBaVIYodE4wa1nKiSsqiaQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b8a8a0cd6a8e99fa;
	Sun, 01 Nov 2026 11:43:00 +0000
X-Mizu-Trace-ID: b8a8a0cd6a8e99fa
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
Subject: [RFC PATCH -v4 04/22] cpuset: introduce partition_enable()
Date: Sun,  1 Nov 2026 19:41:48 +0800
Message-Id: <20261101114206.2434398-5-ridong.chen@linux.dev>
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

Add partition_enable() to consolidate updates to key cpuset structures
during partition enablement, including:
1. remote_partition
2. effective_xcpus
3. partition_root_state
4. prs_err

Key operations performed:
1. Invokes partition_xcpus_add() to assign exclusive CPUs
2. Maintains remote partition flag
3. Syncs the effective_xcpus mask
4. Updates partition_root_state and prs_err
5. Triggers scheduler domain rebuilds
6. Sends partition change notifications

This helper also handles the transition between root and isolated
states of a valid partition. In that case the cpumasks are unchanged
and only isolated_cpus is updated.

A partition_state_update() helper is added to set partition_root_state
and prs_err, and to reset the partition data when the new state is not
a valid partition.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index df52f6e5e99f..052a131731dd 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1716,6 +1716,57 @@ static void compute_effective_nodemask(nodemask_t *new_mems,
 		nodes_copy(*new_mems, parent->effective_mems);
 }
 
+static void partition_state_update(struct cpuset *cs, int new_prs,
+				   enum prs_errcode prs_err)
+{
+	lockdep_assert_held(&callback_lock);
+
+	cs->partition_root_state = new_prs;
+	WRITE_ONCE(cs->prs_err, prs_err);
+	if (!is_partition_valid(cs))
+		reset_partition_data(cs);
+}
+
+/**
+ * partition_enable - Transitions a cpuset to a partition root
+ * @cs: The cpuset to enable partition for
+ * @parent: Parent cpuset of @cs, NULL for remote parent
+ * @new_prs: New partition state to set
+ * @new_excpus: New effective exclusive CPUs mask for the partition
+ *
+ * Transitions a cpuset to a partition root, only for v2.
+ * It also supports the transition between root and isolated partition.
+ */
+static void partition_enable(struct cpuset *cs, struct cpuset *parent,
+			     int new_prs, struct cpumask *new_excpus)
+{
+	int old_prs = cs->partition_root_state;
+
+	lockdep_assert_cpuset_lock_held();
+	WARN_ON_ONCE(new_prs <= 0);
+	WARN_ON_ONCE(!cpuset_v2());
+
+	if (old_prs == new_prs)
+		return;
+
+	spin_lock_irq(&callback_lock);
+	if (old_prs > 0) {
+		/* Switch between root and isolated, cpumasks are unchanged */
+		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
+	} else {
+		/* enable partition should only add exclusive cpus */
+		partition_xcpus_add(new_prs, parent, new_excpus);
+		/* enable remote partition */
+		if (!parent)
+			cs->remote_partition = true;
+		cpumask_copy(cs->effective_xcpus, new_excpus);
+	}
+	partition_state_update(cs, new_prs, PERR_NONE);
+	spin_unlock_irq(&callback_lock);
+	cpuset_force_rebuild();
+	notify_partition_change(cs, old_prs);
+}
+
 /*
  * remote_partition_enable - Enable current cpuset as a remote partition root
  * @cs: the cpuset to update
-- 
2.34.1

