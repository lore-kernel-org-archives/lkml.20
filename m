Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737000;
	b=JjXxpNaWFw5q6OjGQEDun7XyClAykT+wizzlBJSY8TQKiVwzhzaa9j2jrNYeNLnaS34B
	 sLTJFO0sg5I2grul91uc/V64IXeQBh14FNDw/LnbXruMCBPLJMZQK9ZEHg9rRxS9C/mDS
	 hIbqXCh9Rr3H5+oT20apPhv2R8P/FBSO7iU1jGCIkDOVm34KNME1njH09Tu8ePioVS7fl
	 c/x5GlH0OSE0DMezOeQUslGCubn3G3uPHCZ+k4UZK+AMnkg71+al9IJxh4sZqsPq8mhXy
	 WuuZRRuSHKMOim1NZWhrzNuSAlpeSeUdXTob9uknpvNmUnwYy4J8h+aq6dlgNENBE6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737000;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+38xTMUbScO8gWRvhs9QF0jyRyfIaNLPCh2pt7tONFY=;
	b=S8oOyex77MyTfUmuf8yUZeJtnRVtxbY5yMyc1nKeHZ7H4ped3PGYzpmcU+a5BrQvSOaT
	 sn7XU7vxyOBHAFITecelfL/h+hUp/ZHueQdX+j+gIp/JzJOlwIKTIQFhIGI1h0o4nrOEa
	 HazF/X6PF07zQFNQA8HhbygGZSEVRoOB4RCr/ieIgFfsOOHadeOXjIuXbsHbOHYvMUc+9
	 C1THb2E40Imkk46gXbOguWB4QsOw7XcT3PryX52vLU+Py9iOaXDVyyztClBTtKy/AcA18
	 ZapnlDEntEyv1HnN/Eehgqy5tXguihrGsGXY42+D4NdU8+kmL9lMds9VGMeC8NuDgBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=WqeRG5q3;
	arc=none smtp.remote-ip=43.163.128.48
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CDB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CDB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=WqeRG5q3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1792736990;
	bh=+38xTMUbScO8gWRvhs9QF0jyRyfIaNLPCh2pt7tONFY=;
	h=From:To:Cc:Subject:Date;
	b=WqeRG5q3Sn4Z1+IxLYc9YCipa4XE0QVLgorC8u64kj0vLKtlBOpkCVBsUiVTm1aL+
	 eKBuyTlyDLjwx1m28y7/DafYRFW2lOxFsFIHNnG1wmC+pDvCg8szBisN6ad37j4vsn
	 kH+WuBXWRtjnAeXQ6FOHDBiuQPZQQukn3x1GTW08=
Received: from localhost.localdomain ([223.167.143.209])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 7660D803; Fri, 23 Oct 2026 14:29:38 +0800
X-QQ-mid: xmsmtpt1792736978twp733mdd
Message-ID: <tencent_3A95EEAE75A6E08A5DB20A9A6610AA4B0B09@qq.com>
X-QQ-XMAILINFO: MzNwb/pqyJTkuaF9zQBHNNglqyyECVA3owNhI/+z27lTxwN6lZ7wX5G2zXKhmI
	 tL0YrkWC4ca4YzIF/xdQR+aoOTwitjtFvJM9Nl4k4Cyw68Y1fttP/9wXHbBikWNf932tbGkHvXKd
	 myolg2fkrM3SO62IjN4CmIFSN5UlWMJpbJt4fGsZ38LJk0pwnI4Yrc4hMpaWNUP55qsOHPRugV+E
	 B2C5iOOlqKgQgPuWtFgc/56Eiy3DvAlcUIq/qMBNCqhJmrsqSh3UiBGyLKwcYvrwr7G/AAtg5jsR
	 avhycuobJvYhdd4OBO7wMUqYZOskxiQHaRIyeYBLNYWhyMnw0uPXImJg31roevVcgo96tG9vnzeo
	 jZ7Dup9Hyo41O4Z3arrietO6gcA6le3erH7qxM/gR7fr7ZMUgzjK11apwMgSfpD4Ap6nct0WmXTp
	 k2gUsdYF8Mrv4kTypiaRpQ5sMNY03Zi5xkEkaMOuqvMLTvmcUBzuguf8fa7MmANfTfweTU2cg3E2
	 wlKwxUKQ6O5bI8ALaPfCEZdCgQDCDWpZCj9BpGxex9s31uuD+k5/8sqzNw7l+emndDTjPIW7e1ym
	 KYvJr2yw7fI82G6BkJyJLdX7VJJ/HiWIO/QS7Xyk8p5lisM4RNlA+arbvxBVvy4pmDTtRJ3diPu3
	 RSZtUc4+B6xzLlrJsa9NMdW3Wzep9ba55Y07FoEmi1Cs0yrQWfquPjVXGd6h7MdLOjoh4tH4GhSp
	 /ZeZ8cRfkZ3aaJtx6S0vbw/+yys8FQJJ8byHQFG88ayWLBoKnkjtPeFWZ3n13X/ROxBcMcj4J2h3
	 E6MWslUy+FbwVPhvHK0uetTFkt+TlqWGBDvOTpN4d8wd1Xj4OqJ0xbgBUgqlz6w4Mssi2vpfxQqd
	 V+YtmEhtzUjfn8kfCWkGMV6yrlBURJfy/Ipe9v4XRvw+7tppsddmz25l3g6OCezXoqmVc3o3nygr
	 lEAYvX0kZoTrB7fa0OT06O7PC/qK/yXBuIUIJ6cSVfkbLdico/P10gs9RMjNDDVriJ+h8C44V+L+
	 tj+qcOC8MtWTJxg2CfWoyC74d2x/N3KGnGu2eQvkVH+bqtWhewVY0rnyC4z1rPz8jPZ/mS5w==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: "Fengyu Wang(Hygon)" <fengyuwangsjtu@foxmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Mel Gorman <mgorman@suse.de>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	wujianyong@hygon.cn,
	wangfengyu@hygon.cn,
	huangsj@hygon.cn,
	zhongyuan@hygon.cn
Subject: [RFC PATCH] sched/topology: Avoid overlapping NUMA groups when possible
Date: Fri, 23 Oct 2026 14:29:33 +0800
X-OQ-MSGID: <20261023062933.4118916-1-fengyuwangsjtu@foxmail.com>
X-Mailer: git-send-email 2.48.1
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

A four-node ring illustrates overlapping NUMA sched groups:

node distances:
node   0   1   2   3
  0:  10  20  30  20
  1:  20  10  20  30
  2:  30  20  10  20
  3:  20  30  20  10

At distance 30, a CPU on node 0 sees these groups, using node IDs to
abbreviate their CPU masks:

  local:  {0,1,3}
  remote: {1,2,3}

Summing group load and capacity counts nodes 1 and 3 twice, but nodes
0 and 2 only once. Dividing by the summed capacity does not cancel this
unequal weighting, so the domain average can be biased.

With equal node capacities, the shared load on nodes 1 and 3 cancels
out of the group load difference, leaving the difference between nodes
0 and 2. However, source-rq selection can pull from nodes 1 or 3 instead
of node 2, changing placement inside the local group without directly
reducing the load on node 2.

Keep the local child span and descend overlapping remote candidates to
smaller NUMA child domains. Accept a candidate when its child is disjoint
from the CPUs already covered, without descending into node-internal
levels. Here, the groups become {0,1,3} and {2}, so each CPU contributes
once and the remote source group excludes shared CPUs.

Preserve valid, non-overlapping candidates and the existing out-of-domain
fixup. Retain the original grouping where shrinking would lose coverage
or no disjoint candidate can be found within NUMA levels.

Tested by building an x86_64 kernel and booting it under QEMU/KVM
with NUMA nodes and distance tables supplied through -numa node and
-numa dist. Parse the sched_verbose boot output to check that group
masks cover each domain without overlap, and compare domain spans and
local groups against the unpatched kernel.

The six symmetric fixtures cover a 12-node topology and an 8-node
EPYC-style topology, each with one CPU per node and two interleaved
CPUs per node, plus a four-node ring and an unequal-depth topology.
All 350 domains pass; EPYC group masks are unchanged. A seventh boot
with an asymmetric SLIT verifies complete coverage and preservation of
the baseline groups for CPUs 0 and 2.

A userspace harness compiles the extracted topology C functions with
UBSan and exercises malformed cross-node SMT, checking that the original
groups and nonempty balance masks are retained. This is not an arm64
boot test. Workload performance and fork-placement effects have not
been measured.

Assisted-by: LLM
Signed-off-by: Fengyu Wang(Hygon) <fengyuwangsjtu@foxmail.com>
---
 kernel/sched/topology.c | 50 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a..9cb87b49aa00 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1119,7 +1119,7 @@ int group_balance_cpu(struct sched_group *sg)
  * For the above NUMA topology that gives 3 levels:
  *
  * NUMA-2	0-3		0-3		0-3		0-3
- *  groups:	{0-1,3},{1-3}	{0-2},{0,2-3}	{1-3},{0-1,3}	{0,2-3},{0-2}
+ *  groups:	{0-1,3},{2}	{0-2},{3}	{1-3},{0}	{0,2-3},{1}
  *
  * NUMA-1	0-1,3		0-2		1-3		0,2-3
  *  groups:	{0},{1},{3}	{0},{1},{2}	{1},{2},{3}	{0},{2},{3}
@@ -1133,18 +1133,27 @@ int group_balance_cpu(struct sched_group *sg)
  * the topology.
  *
  * In order to minimize this overlap, we only build enough groups to cover the
- * domain. For instance Node-0 NUMA-2 would only get groups: 0-1,3 and 1-3.
+ * domain, and descend remote groups to smaller NUMA child domains to avoid
+ * CPUs that are already covered. For instance Node-0 NUMA-2 would only get
+ * groups: 0-1,3 and 2.
  *
  * Because:
  *
  *  - the first group of each domain is its child domain; this
  *    gets us the first 0-1,3
- *  - the only uncovered node is 2, who's child domain is 1-3.
+ *  - the only uncovered node is 2, who's child domain is 1-3; that overlaps
+ *    0-1,3, so we descend to node 2's NODE domain and get 2.
  *
- * However, because of the overlap, computing a unique CPU for each group is
- * more complicated. Consider for instance the groups of NODE-1 NUMA-2, both
- * groups include the CPUs of Node-0, while those CPUs would not in fact ever
- * end up at those groups (they would end up in group: 0-1,3).
+ * Only NUMA child domains are descended; node-internal domains are not split
+ * further. If the node-sized child still overlaps, the original candidate is
+ * kept. The original groups are also kept when a CPU outside the local child
+ * has no domain at this level, since shrinking a remote group could otherwise
+ * leave that CPU uncovered.
+ *
+ * However, computing a unique CPU for each group is still more complicated.
+ * Consider for instance the first group of NODE-1 NUMA-2, 0-2: it includes
+ * the CPUs of Node-0, while those CPUs would not in fact ever end up at that
+ * group (they would end up in group: 0-1,3).
  *
  * To correct this we have to introduce the group balance mask. This mask
  * will contain those CPUs in the group that can reach this group given the
@@ -1180,7 +1189,7 @@ int group_balance_cpu(struct sched_group *sg)
  * not of the same number for each CPU. Consider:
  *
  * NUMA-2	0-3						0-3
- *  groups:	{0-2},{1-3}					{1-3},{0-2}
+ *  groups:	{0-2},{3}					{1-3},{0}
  *
  * NUMA-1	0-2		0-3		0-3		1-3
  *
@@ -1320,8 +1329,20 @@ build_overlap_sched_groups(struct sched_domain *sd, int cpu)
 	struct cpumask *covered = sched_domains_tmpmask;
 	struct sd_data *sdd = sd->private;
 	struct sched_domain *sibling;
+	bool shrink = !!sd->child;
 	int i;
 
+	/* Do not shrink groups needed to cover CPUs missing this level. */
+	if (shrink) {
+		for_each_cpu_andnot(i, span, sched_domain_span(sd->child)) {
+			sibling = *per_cpu_ptr(sdd->sd, i);
+			if (!cpumask_test_cpu(i, sched_domain_span(sibling))) {
+				shrink = false;
+				break;
+			}
+		}
+	}
+
 	cpumask_clear(covered);
 
 	for_each_cpu_wrap(i, span, cpu) {
@@ -1380,6 +1401,19 @@ build_overlap_sched_groups(struct sched_domain *sd, int cpu)
 		    !cpumask_subset(sched_domain_span(sibling->child), span))
 			sibling = find_descended_sibling(sd, sibling);
 
+		if (shrink) {
+			struct sched_domain *tmp;
+
+			for (tmp = sibling; tmp->child; tmp = tmp->child) {
+				if (!cpumask_intersects(sched_domain_span(tmp->child), covered)) {
+					sibling = tmp;
+					break;
+				}
+				if (!(tmp->child->flags & SD_NUMA))
+					break;
+			}
+		}
+
 		sg = build_group_from_child_sched_domain(sibling, cpu);
 		if (!sg)
 			goto fail;

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.48.1

