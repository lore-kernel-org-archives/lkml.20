Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433446;
	b=H0j338NJa2BO4PgZD5hJhwaUl+4lwWQngRI4/U4Qv9bdD+gtCOOIcMjT+OZuHSv3d5nM
	 Sr2ljzdCRUutZgMSwecBSfETcgchIHtl//4il252PvowglXuOZT+FGWgoZEGbKo3jLSSI
	 r/UiDP9srQbAV0FBtV+5L+45T5ptswQ8KYDcHKJ4jVQJlBXxr1ZT/H7YKngGyUKK2vKoV
	 4dYCK3fjK/uyDItkEgy435YBbKWUipV976yfcu+BLAUkIJAyYpeZb0TbqSkId+b+lRzm9
	 GYVIgMzHguKUxQa311c+vN9A6Kkb5S6/nuKsF1b1A4ic6HbPg3eOkbhm6dMW31UV8vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433446;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=gLoXtoFID+C+duFwciW0DZX3CO8BvPtJUEkOavqWtlo=;
	b=Lr7TshkfC3PnKcf8wGkTQdhCUTSNPFN04yMAbPMQ6GFUOoolvGOoRRncZrEiiZ0WjMyl
	 223+dkd53yPniZX+LEOQKWSLtImNRVyCmrWF/Cv21qxkf2wIw3lzxBF2zEEznPQZ7kKQQ
	 zNOXjANwTCPjr7te3H7FkKUvoZqrjls3V6qFc966fYRFlZ8kEQDxXpGqpVCway+9jOwJP
	 9va2t2bpntMQCwJgm0WCu87SBtpb9eDq0o1M+y2VTM+TdUaB8IWvss/UdarPmiNcU6TNW
	 kto0Olcq7zPqfMNwlJJYF+Uvq05Gw6c3R16Hf1kD+/ylK/013yHHTuc8BEmSwi/X0GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XOr9g60U;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D5606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E2D5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XOr9g60U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792433444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gLoXtoFID+C+duFwciW0DZX3CO8BvPtJUEkOavqWtlo=;
	b=XOr9g60URoSn1henthyOy0Sm5AmC7+7TiKwDZYxsTe4fmycSVe/sNCU5U/jkzsYsy/haft
	n3xnBIUIpvkUGiLE0SKrj+XxTCpf/0sZdrzjv7lOXf0y/3SIxdziKIQZaC8vZCES8D7COL
	2hRfsxDsyOz36Q1z44QyUK0xzDiYRZQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-aEIaBNH0NV6WAtkjGQDjGw-1; Mon,
 19 Oct 2026 18:10:37 +0000
X-MC-Unique: aEIaBNH0NV6WAtkjGQDjGw-1
X-Mimecast-MFC-AGG-ID: aEIaBNH0NV6WAtkjGQDjGw_1792433435
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E6121956043;
	Mon, 19 Oct 2026 18:10:35 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E45141B;
	Mon, 19 Oct 2026 18:10:32 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next v4 1/9] cgroup/cpuset: Fix a missing isolated_cpus update in update_cpumasks_hier()
Date: Mon, 19 Oct 2026 14:10:12 -0400
Message-ID: <20261019181020.1069325-2-longman@redhat.com>
In-Reply-To: <20261019181020.1069325-1-longman@redhat.com>
References: <20261019181020.1069325-1-longman@redhat.com>
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

It is found that when a local isolated partition is being invalidated
because its parent partition is no longer valid, the isolated_cpus
cpumask may not be properly updated. Those isolated CPUs may or may
not needed to be removed from isolated_cpus depending on if there is
a local isolated partition ancestor that will now own those isolated
CPUs instead.

Fix that by calling a new ancestor_partition() helper to return the
closeset valid partition root ancestor. If that ancestor is PRS_ROOT,
the isolated CPUs will have to be removed from isolated_cpus. For
a PRS_ISOLATED ancestor, the isolated CPUs are checked against
the ancestor's ones to see if any of them should be removed as it is
possible that the invalidation of the parent may be caused by change in
the effective xcpus of that ancestor. If any of the isolated CPUs should
be removed, isolated_cpus_update() will be called under callback_lock.

An existing test case in test_cpuset_prs.sh is modifed and a new one
added to test that.

Fixes: 11e5f407b64a ("cgroup/cpuset: Keep track of CPUs in isolated partitions")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c                        | 57 +++++++++++++++++--
 .../selftests/cgroup/test_cpuset_prs.sh       |  6 +-
 2 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 0ebba2d646c3..e032ee1efeb7 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2137,6 +2137,25 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
 	rcu_read_unlock();
 }
 
+/*
+ * ancestor_partition - Find and return the closest valid partition root ancestor
+ * @cs: the current cpuset
+ *
+ * Return: The closet partition root ancestor cpuset
+ */
+static struct cpuset *ancestor_partition(struct cpuset *cs)
+{
+	struct cpuset *ancestor = parent_cs(cs);
+
+	/*
+	 * The top_cpuset is always a valid partition root which will stop
+	 * the loop if it is reached.
+	 */
+	while (!is_partition_valid(ancestor))
+		ancestor = parent_cs(ancestor);
+	return ancestor;
+}
+
 /*
  * update_cpumasks_hier - Update effective cpumasks and tasks in the subtree
  * @cs:  the cpuset to consider
@@ -2229,7 +2248,10 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
 		 * cpuset if the parent's effective_cpus changes.
 		 */
 		if ((cp != cs) && old_prs) {
-			switch (parent->partition_root_state) {
+			int parent_prs = parent->partition_root_state;
+			struct cpumask *del_cpus = NULL;
+
+			switch (parent_prs) {
 			case PRS_ROOT:
 			case PRS_ISOLATED:
 				update_parent = true;
@@ -2237,12 +2259,37 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
 
 			default:
 				/*
-				 * When parent is not a partition root or is
-				 * invalid, child partition roots become
-				 * invalid too.
+				 * When parent is not a valid partition root,
+				 * child partition roots become invalid too.
+				 *
+				 * For a to be invalidated isolated partition,
+				 * its isolated CPUs may or may not need to be
+				 * removed from isolated_cpus depending on if
+				 * its closest partition root ancestor is a root
+				 * or isolated partition. With a PRS_ISOLATED
+				 * ancestor, the CPUs are checked against its
+				 * effective xcpus to see if any of them needed
+				 * to be removed.
 				 */
 				if (is_partition_valid(cp))
-					new_prs = -cp->partition_root_state;
+					new_prs = -old_prs;
+
+				if (old_prs == PRS_ISOLATED) {
+					struct cpuset *ancestor = ancestor_partition(cp);
+
+					if (ancestor->partition_root_state == PRS_ROOT)
+						del_cpus = cp->effective_xcpus;
+					else if (cpumask_andnot(tmp->delmask,
+								cp->effective_xcpus,
+								ancestor->effective_xcpus))
+						del_cpus = tmp->delmask;
+
+					if (del_cpus) {
+						spin_lock_irq(&callback_lock);
+						isolated_cpus_update(old_prs, new_prs, del_cpus);
+						spin_unlock_irq(&callback_lock);
+					}
+				}
 				WRITE_ONCE(cp->prs_err,
 					   is_partition_invalid(parent)
 					   ? PERR_INVPARENT : PERR_NOTPART);
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index 7efd5e645767..f1dda27b1394 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -292,9 +292,9 @@ TEST_MATRIX=(
 								       A1:P0|A2:P2|A3:P1 2-4|2-3"
 	"   C0-4    C1-4  C2-4     .    X2-4  X2-4:P2 X3-4:P1   .    0 A1:0-1|A2:2|A3:3-4 \
 								       A1:P0|A2:P2|A3:P1 2"
-	" C0-4:X2-4 C1-4:X2-4:P2 C2-4:X4:P1 \
-				   .      .      X5      .      .    0 A1:0-4|A2:1-4|A3:2-4 \
-								       A1:P0|A2:P-2|A3:P-1 ."
+	" C1-4:X2-4 C2-4:X3-4:P1 C3-4:X4:P2 \
+				   .      .      X5      .      .    0 A1:1-4|A2:2-4|A3:3-4 \
+								       A1:P0|A2:P-1|A3:P-2 ."
 	" C0-4:X2-4 C1-4:X2-4:P2 C2-4:X4:P1 \
 				   .      .      .      X1      .    0 A1:0-1|A2:2-4|A3:2-4 \
 								       A1:P0|A2:P2|A3:P-1 2-4"
-- 
2.55.0

