Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645105;
	b=jZHSgtEMaN68suJGTcVgpQcVsp0XTciIDhxVbBAJTWgHtfel2pO1JkgdU8kfP0702i8L
	 Xi+ELl0Z+748tRwrMyQAGa4/Fjku0S3vlVQRoFaKLOpyfXeD2piQxkKD7bgyZphKCKlxA
	 MVAfBNJnPl03kC5l2X2aEslfp3f/dmoWRbEC+w/nQWMVDY/+4frt4+D8/I/c6npV85A1L
	 tVTdqEHz9Jp5JuYBWy+whh4t+a6l82nDizBTS9srR3cjcpFRkmMj1SBKI3loTAvbtuTfX
	 kBuAuqyXoA2lI1ykJWWpzrTMp8hH1ITFOo9STEV0U1XjOB2gS/+kXoUvlgbmp2p5mfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645105;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L8UJtdjEkfTKMqjJEKZq6f9gBuMKKQUnNV3OKyHSnVU=;
	b=w7Z0oJ89psyGAVnih0qjFDc0GEO9ryO0FWrM2EbSkY/UESKsaWfRWhMPWWivBHCWbMd2
	 2LXZcmisae70+8NwkCp5r0kARU4qJ4ueqFry4IyB6PsGKUE8q2RfWLhh5EQ6hNYFo/Ehp
	 xcxD174LCSSTIkdXsJRwH27Q8YIVoOwGxGnpdy7mZLuKZee6VV5FWdiqWD3y/PRHjB2NA
	 1fQSq1bqzzkyYf3RBFKNwwkxhOMJjxnClTd3VGVbdIr5cTdERSM0cjWv394Hu48n3u1ff
	 lOwulLPRH/Fjv9CRJNUMr45gZxUmNqEuxElZEhJjCj8G5Y3EOCkxXD3dcF4ZPynL5mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=emF2CCqS;
	arc=none smtp.remote-ip=91.218.175.251
Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3462B606A33F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3462B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=emF2CCqS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ETlm8ZAJilsh6ZrGScDHOd65SU4Ewh7RPJihwN66zRI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794645103; v=1; x=1795249903;
 b=emF2CCqSxXmygbelXMvLV2lksyulwF1niSb1CiHjxpnv9NS3v8iI5ffpIEBPqDnQqxDBDL/w
 KIe5LlgoUrkwlx1hg9uyFvM4xpGfhKxIFAOyZn/1pnDJw+1XHls/rqY+s0p55HuKFky3tUZdl8w
 dsR0IRORwln7cdHGyabbopWI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id adfa4001bef83b5f;
	Sat, 14 Nov 2026 08:31:42 +0000
X-Mizu-Trace-ID: adfa4001bef83b5f
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
Subject: [PATCH v5 01/12] cpuset: introduce partition_enable()
Date: Sat, 14 Nov 2026 16:31:13 +0800
Message-Id: <20261114083124.1340140-2-ridong.chen@linux.dev>
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
and only the isolation state of the CPUs in @new_excpus is updated. The
caller passes the CPUs used by the partition itself, as the CPUs of its
valid child partitions keep their own state.

A partition_state_update() helper is added to set partition_root_state
and prs_err, and to reset the partition data when the new state is not
a valid partition.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 56 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 7e374210c123..860cb7ea3efb 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1702,6 +1702,62 @@ static void compute_effective_nodemask(nodemask_t *new_mems,
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
+ * @new_excpus: New effective exclusive CPUs mask for the partition, or the
+ *              CPUs whose isolation state changes when switching between
+ *              root and isolated
+ *
+ * Transitions a cpuset to a partition root, only for v2.
+ * It also supports the transition between root and isolated partition.
+ */
+static void __maybe_unused partition_enable(struct cpuset *cs, struct cpuset *parent,
+					    int new_prs, struct cpumask *new_excpus)
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
+		/*
+		 * Switch between root and isolated, cpumasks are unchanged.
+		 * @new_excpus holds the CPUs whose isolation state changes.
+		 */
+		isolated_cpus_update(new_prs, new_excpus);
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

