Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022130.outbound.protection.outlook.com [52.101.101.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2C361962
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869102; cv=fail; b=IQFhHQ3aJfTge4npOTluCafl6uNjGPAFzK4e0WraBU6Wwg4RvOPPzWdF5RcB3nf7M0F7Tc7WBVU6Sv5CcoJkN70P72lWt2PJVgdDZDX0U5RLHpfQ8EYfQ0t9QFpIbrED1i8JBfzwcEXRBvsH+bfnwa2zyN2fal1AtoYNhKYtiug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869102; c=relaxed/simple;
	bh=+XkfxlbpQKgMEeXYx5zk8rSq2o9H67LqImXVv43uosE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cTZVzTcRlocbxfk5TLAJPb/vTavUy8Wlj+6Y/hQdqDSTWbIuHc81MWgooJqCH6klMVUWT1zi7w5hMeGHxeJDwrRmXFX9kJuC9pggNSQQ5lt8WnYiExI2aBhaNyOD8Z1fwCWkh2d+8N+Ipi8JNKc0LhgxVs2apsj0ueLTZtmqD9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaU1/vrZMHTCYEO+DkjA0KN79lLlT4PGq5PkKEwcKceDUAi3+rYZpucJZJV85FowBBhEoGdNystzNqhpEDNdGf4haEGeErjHHzbbzr9j8cR+FGzZnjzxmjrW5DfaARlS/tTkKXHNntIyG55EWRn456zP2/5xHdo3OlLcrFYFlRcaZGIJQocf4SulUUjAKUmqkhHy2Q7iwEa21PHlBDz51/idLeVnP0uMMMDW8Mr52z1eM6592hE1z8J8wWCTfS6NILZF0qnw+/JwUMm34iRESVd0mm7nMPbIlZehlzWzUsHYgglOBgG98cJkPARyfNw56D+xkWzwdVxeJL60nM904A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=UYwraUWxnT9P+Xj2zx8xXWpCIPcqPzZxozbnwcWDgKA=;
 b=wuKA55pwj7sh60etfJmM7SK5qdu1zHBIajsV/gsn/dfgSJnpvezsnUJ3YhX4DypPrQCSFWgKjROjnyW3hyzq/GBXo3+KgoNex1hlCrWc8KlcFwqAeijqWoCZveE7XJuD6+8a4IY01s69mkvY98YCuOyLycF6G0y2F+lYeiQZ9y3+tLmngTG72gnlCS/86tAhVydvQ4JI1tjpNEMd8YEY/2mYv+u9+HNWAn2Sbij6PM+KrzTv0zOtdk8OdHpqO0N53OEXiFuRPNmkvMFjGUQibisTfS4xHT0g/1o+wcfYSlC3+C27jND/JZt/kyPJ6m3v5PdgzpYSNUkJG86YzD/m7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB7095.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 22:18:14 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 22:18:13 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: paulmck@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	zhanxusheng1024@gmail.com,
	neelx@suse.com,
	atomlin@atomlin.com,
	chjohnst@mail.com,
	mproche@mail.com,
	sean@ashe.io,
	steve@abita.co,
	rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/6] sched/debug: Protect lockless rq->rd access in print_dl_rq()
Date: Thu, 27 Aug 2026 18:18:04 -0400
Message-ID: <20260827221809.988394-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827221809.988394-1-atomlin@atomlin.com>
References: <20260827221809.988394-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0041.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::19) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: d44f42f8-953d-4e31-dea0-08df0489161d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZGkjyqdnhLltzwyiKCLSDRb6DZCSj8BkMEg2VQ9guqBY1ZryehavTkzUj9ilYUiMQhdsewTIUu+V+JxTXG9oqh1fqi17BZ0TqKueGg8JdWHlWvL/yHc4hFWPVRpNSg5v60Wr4/9ISTX+g6e7ufSXjwrcEgCc/8Bv3ujMbcn/PW2jcr0iB+Trn0qWVkGu4ls9lwaD58wZ3al50wljQf9IAYbyUdCe3JAvTljZQe8Ib0d4OuugMarIHTXECvN0l4zv+9Hf8fY9rb6LNhlMpxhpPnrM0p8yWvV/Jrq9P268Yz7+y+jyHDzqx4squsp9DCZ77ykfwsiMeSqMWvOcDqU3UPv0zSaxA/tiXzJr5ufFd5u+GDldRo8ZKjoSA7oLLyEMIAdZpyPpJ8fjvlFIMS57g/4rsawRFVlkhKE1Hw3BuN0Gu2vEFDougv7Bek03HZ1UVWJtBN4zAmyz0tg7TmwXfQRbflqEBTvI1qQA/g/YWy+KtkQvwavfSXocKdi7TbQgNq7ChKk9pml7LSOUGl4kFO5tvK29L8mTpCwdSUsbesD2K4BQ8pzJlp7MLlwBXG1KmSHKDF04AveVhy12hlboVEgajHMSt8IhYbhzOwWAi2NnF1qTj3zi6DZUP0jiBbtWxIPmY8pQkz9PL+nQ2rh5Cwv7vFfrcuFxM9lbbfwxo9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bDJ6H2iRj3uWTMlvM0og69OanrgXXtI8ehuXt9lbZjzjIUHUo7pW4Q5ykiEJ?=
 =?us-ascii?Q?B+tLqimgo/6UYzQQvjTrPWjV4UoOsA73AMH29Z2/D2w7C5ZJ+x3UsLwLotHX?=
 =?us-ascii?Q?ZnPXhqKahgf5Y5UmqElracajeGRcQVp7f931Pa/26/MaPzZYxW/P+K8r8V6y?=
 =?us-ascii?Q?vRnfIupuYsy50x1mHwK64Iaoj2o4hQO084JJ3x3MUyxXAkW8FpSFa2EMEF8Y?=
 =?us-ascii?Q?1t85vV4er6onU3eSp1wmfXE8MlH4fbBGntMA0EmMuHbVbaQL9L7TzpH31IVD?=
 =?us-ascii?Q?FVehKEIjhtFa8JOcV4RNN99F6KIfOfdS3KngXbUUYLEcNVozNU3cGZrWSJn3?=
 =?us-ascii?Q?/NLUF0I811lEhkFLM07Y8BfdgqDbYHYjSPSasekb7QFVB+rCHswSruzBy6WI?=
 =?us-ascii?Q?dunNjtBfrgcmXK5NBGcrZaO98bWc2JChqDoCoX98hv1aKTaTDpeMS67Xq6vX?=
 =?us-ascii?Q?9iMUwn3iId8ye4Ih8zeGnLwGLTnqD/zaQNZVUhQE8HVDdChE35YloteI9chA?=
 =?us-ascii?Q?MAccH4SEmMDY8XgatdvqK7nANtq1mzN/85sg3R83jtw48A+F7oDdaD0hV7Ob?=
 =?us-ascii?Q?rNuBcJm28N+e0VoH6lXWUGqs848lhrsPoY8QBQxgw5s9kha4lgyfDDOdpC7P?=
 =?us-ascii?Q?x4B/iVAaZ4oqQUVZmBQpGza3y3ZeuB+fCemTphGgQrt7jS6BlxxRuZm9hol6?=
 =?us-ascii?Q?yMM81qigJqp+g5IwNLvWDzaGOklI3sewAMAp7D3bP/JC0/ObO3dipfXL9ANu?=
 =?us-ascii?Q?Nb6IWWuna+ALJTk94qMdfBr4jAfcSjZyuuspzT1bsc95FecmYOAcSiexv7FB?=
 =?us-ascii?Q?RrTLaFPurUjRTCUgTskmJWkMoIk+SGjZGIpIONGk3Z5/Mj51hRr2w7BVtL5M?=
 =?us-ascii?Q?rb0ghPclXAVlbEnj8wugjoYSW7OrexHL+a3UGbLnafNW61Fzj5CcUrH8Z2+E?=
 =?us-ascii?Q?SvxJ2l1kWMssYy+bU8vc+3ExgWH3an28WQyTiyaXhcbvtWFbGu1hYdE0MDbn?=
 =?us-ascii?Q?/akLAVtQtZBTrjCY3d4FsumHIIj6V9+Ij8gvYg3bO20BygOX7TSV1iSIlIXE?=
 =?us-ascii?Q?GGwCvxdbrxhe9Ehb3Y9itvvG+YjJypGX7/2tkZq42xhaQG90YmE/5mhHfpGq?=
 =?us-ascii?Q?+pEB/9Pcsck8vTGuIegj67flhPVEE0CMov5hMjf6E8A7b30pC17Unnqueg8D?=
 =?us-ascii?Q?+r6ipnPiejZ4AJpJ7YTApN/R2nkb324Orwovsu/uyZH+GV3cNzfPivG2K8uZ?=
 =?us-ascii?Q?RM80CDcMDI345zQdSVEPtUHaTpiok+laeUI/SUjNf+zEPTjY7nCt214yDI+/?=
 =?us-ascii?Q?PqY6gk7BIf0+pjkBSRQ7b5zqoQvTSEJfC8ZyoiUOFMuwATL7QLuEwl88mMSP?=
 =?us-ascii?Q?7LgUAbXrLOPTK2M+dwRs8KioyeszBNtja2hDRdzq/pgKXd/eegLZYPRfqRv7?=
 =?us-ascii?Q?Tdm7A3ChraqEYvNV5O1HMFEqpA7vYNNmPJJMP+77hOWmaMFX7Y9rYm4A9iHr?=
 =?us-ascii?Q?ob7k3/CxMFeGWbD7yia30ef4jy76xDR5awT9GBbaR+dPFK9jCuhj51eDCMwU?=
 =?us-ascii?Q?RFE+nBHAoI1ssMywa5G0nSkeTqCbswF/41j5CdBwceQOYjd86yN2wA/XSBME?=
 =?us-ascii?Q?xjBCkFAgRImCfFra/ZAqGWYUCH13CYpXKGPwkzEo3pq3Fr9SVlgSe65QnKj5?=
 =?us-ascii?Q?LMSIit+3V0LmWdk+mHt+DsDczLxLWj9+onVhfm3gkqAjc3tH?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44f42f8-953d-4e31-dea0-08df0489161d
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 22:18:13.8722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8AuIgurTdGaV3KyQjjLjrHyqyGEsY+xjph+yoHjSwTjpY0UArEKOic6vY4WQUaqDmB75d0VFonPPZooh8Of5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7095

In print_dl_rq(), cpu_rq(cpu)->rd is dereferenced locklessly to display
deadline bandwidth statistics.

During CPU hot-unplug or cgroup cpuset repartitioning events,
partition_sched_domains() calls cpu_attach_domain(), which executes
rq_attach_root() to detach the CPU from its root_domain. When the
reference count of the detached root_domain drops to zero,
rq_attach_root() calls call_rcu(&old_rd->rcu, free_rootdomain) to
schedule memory teardown after an RCU grace period.

However, rq_attach_root() previously updated rq->rd using a plain C store
without an RCU publication barrier (i.e., rcu_assign_pointer()). Without a
release memory barrier on the writer side, CPU or compiler reordering could
allow the new rq->rd pointer store to become visible to other CPUs before
the initialization writes to rd->dl_bw are committed.

Furthermore, because print_dl_rq() did not hold an RCU read lock while
dereferencing cpu_rq(cpu)->rd, an RCU grace period could elapse
concurrently while debugfs is reading the file, allowing
free_rootdomain() to execute kfree(old_rd) and causing a use-after-free
race condition when print_dl_rq() reads dl_bw->bw.

Resolve this by using rcu_assign_pointer(rq->rd, rd) in rq_attach_root() to
guarantee a release memory barrier when publishing a root_domain.
Finally, fetch rq->rd using guard(rcu)() and rcu_dereference() in print_dl_rq().

Fixes: 02968ccf7b80 ("sched: add /proc/sched_debug file")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c    | 3 ++-
 kernel/sched/topology.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 72236db67983..61932ef7ec4f 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1172,7 +1172,8 @@ void print_dl_rq(struct seq_file *m, int cpu, struct dl_rq *dl_rq)
 	SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(dl_rq->x))
 
 	PU(dl_nr_running);
-	dl_bw = &cpu_rq(cpu)->rd->dl_bw;
+	guard(rcu)();
+	dl_bw = &rcu_dereference_root_domain(cpu_rq(cpu)->rd)->dl_bw;
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->bw", dl_bw->bw);
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->total_bw", dl_bw->total_bw);
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index bf83ceee23e9..58913dc3a8f2 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -495,7 +495,7 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 	}
 
 	atomic_inc(&rd->refcount);
-	rq->rd = rd;
+	rcu_assign_pointer(rq->rd, rd);
 
 	cpumask_set_cpu(rq->cpu, rd->span);
 	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
-- 
2.55.0

