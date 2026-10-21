Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573975;
	b=WYpsdT/1MfjP6kSOJwE+ZrKFMapYQb5ZdoGxu2JS0sm9b6KIzTE6VLnLHuPdlfZdZuhq
	 GfEaIIinfMmJTJeIUdbDpkJgDX5bjsucPp5tStkW1AwIdDgjkLh9SKecSAO/0WY3g5W7P
	 28F46szebCM7qVI4iBVud799xnOqfV++RpwD0lm6o2kSFFqizx8IZZ5tnntYedv/x1Q/P
	 8XBIU9Lk2skIjXI+Z6XghX5tOcvMfgkxQxy47p6o8YzepyyexStsYYL7+3MMHYCuDuez6
	 EkDt9uG2eMhniYWAo5wMYNXHpzL2LSjbJnv0l3vrpMlgYzolU5opI688K0Cghh/+4IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573975;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=4kUy8pQDe8Y+ktdmnYJodtwCCgw7k+jPfy3QplRjOkU=;
	b=OoVGblCqD5KBxTCLHLWJBLeJfcg981b0oa/swUDJqjQKL+No/XUW3g7vnXeozkvfIDb8
	 LYtmA8+OkX220q7/6je+UJcticDRq/u3IVTYs422aM+rxOjZfQygfuRisEvViDg6rTzZF
	 GQmX1FunFrv2xJca2BMDN8ufqbURhmsU/c3m9RKT+5CjHv3+Nd3RqQmv+FjD1B7qYGqSt
	 Mz5niWIRgWnafjpw/1RdiYK13E0lFJS+Do4cR+sjZahKtYNsNVBDr+B0USuZFFHR0m0UM
	 PC+u5Pdc/j1Gcl6UdHIbyis55VjpqzdJE0LoYDHKOhJXDlsUvDZkw9o3k18ayMLZixg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Is8fbQV+;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12593606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12593606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Is8fbQV+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4k
	Uy8pQDe8Y+ktdmnYJodtwCCgw7k+jPfy3QplRjOkU=; b=Is8fbQV+uCShUhdgzs
	N4eVVCI5OGO7DrsYstffsnIOQ+x8195c/3KvSKxOarJPP3tUpAbQsoq+vmPFu2tF
	537ftS8KFrVr642jbE4eQFsA2x3syPyF1D6broiIZ9lKtU2hKHJdGEBrvJwg7k4u
	bhtdEpQ5b8mw2SNsX7Tq1I3ms=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3_3nugdhqzHqWBQ--.60434S2;
	Wed, 21 Oct 2026 17:12:15 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2] sched_ext: Reject oversized automatic CID shards
Date: Wed, 21 Oct 2026 18:12:14 +0900
Message-ID: <20261021091214.1713830-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
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
X-CM-TRANSID:_____wD3_3nugdhqzHqWBQ--.60434S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4kGw1UGrW7CFy8trWUArb_yoW8ur48pr
	ZFka9rKr40gayjyw4UG34I9r4UWan3Ca12qFyDGFs7Gw1UGryrtr1ayr4IgrnFgrWYgryI
	qr1v9asYqFyUA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRsmitUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6hFtzGrYgfEskQAA3l

Automatic topology packing starts a new shard before adding a core when
the current shard would exceed its target size. However, a first core is
always accepted so that cores remain indivisible. An indivisible core with
more than SCX_CID_SHARD_MAX_CPUS CPUs cannot be represented without
exceeding the hard shard limit.

Per-shard state uses fixed-size inline cmask storage sized for
SCX_CID_SHARD_MAX_CPUS. Passing an oversized shard to alloc_pshard() can
therefore make cmask initialization overwrite the following fields.

Reject an indivisible core larger than SCX_CID_SHARD_MAX_CPUS before adding
it to a shard. Existing non-empty shard splitting already keeps the total
within the hard cap, while an indivisible core may still exceed
cid_shard_size when it fits within the hard limit.

Report the oversized core and the hard limit with scx_error() so that the
rejection is diagnosable.

Fixes: e2c841b91bf9 ("sched_ext: Add CID sharding")
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Tested-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Hui Su <sh_def@163.com>
---
Changes in v2:
- Report the oversized core and the hard shard limit with scx_error(),
  as suggested by Andrea Righi.

v1: https://lore.kernel.org/lkml/20261021064946.1445728-1-sh_def@163.com/
---
 kernel/sched/ext/cid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/sched/ext/cid.c b/kernel/sched/ext/cid.c
index 4b08866d75f6..3d0687184b44 100644
--- a/kernel/sched/ext/cid.c
+++ b/kernel/sched/ext/cid.c
@@ -287,6 +287,12 @@ s32 scx_cid_init(struct scx_sched *sch)
 				 * empty shard.
 				 */
 				cids_in_core = cpumask_weight(core_scratch);
+				if (cids_in_core > SCX_CID_SHARD_MAX_CPUS) {
+					scx_error(sch, "core with %u cpus exceeds max shard size %d",
+						  cids_in_core, SCX_CID_SHARD_MAX_CPUS);
+					return -E2BIG;
+				}
+
 				max_cores = cores_per_shard + (shard_local < nr_large ? 1 : 0);
 				if (cores_in_shard &&
 				    (cores_in_shard >= max_cores ||

base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898

