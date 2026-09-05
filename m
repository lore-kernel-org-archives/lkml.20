Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012027.outbound.protection.outlook.com [40.107.200.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D0A5478D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788579425; cv=fail; b=CwSTmj3nVTH7gPwa5i50AK64n7CtSIdbPx/uAGDs17n+hBmakizVr+T5Uohcex+38pFwGOBW41PKK4bNioVwWcrZZxJdfowc5R1CfYkgBMoNvh+JsvdssFpSeT2cJ3ENtk4MZOTSlCL+vrXQkgQjD/XlNBYqQmyMapx8jpxnOY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788579425; c=relaxed/simple;
	bh=prYY1jPtmiokWHsGC9lDo07eaNtDs8+OdwnCFQZXYq4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=azaXqu5UTqWBxLJ4OhwU0vw0VtwRgGQ10cgEmQ6l6lURXPQRoG8KM+pcrvp3owZakLMGD0kyyQFFKEf99QDN1Vp6PHc1wt0RbW1+HnsSlZSNJn8oCfgapnrVSL/KJ0thItCTBntdPB6gP0djs9A6vOHLFOPK9f+/vd+HNm+LHrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gaDa1fhy; arc=fail smtp.client-ip=40.107.200.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gaDa1fhy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHgJnP+PqTFFIzTPcXADEdx2PrfeX9C7mmXcd1GRrANQG13HaKMZDBJ4AZxk1Kr7tBhDbaXf3NNXOI3XpQ+eeRPeNEIe382FRtCfqyu+bde/VzhFGjAgr8tRF+/qOZlJYCieDU5+Bw75laexlG3Ruth7XbMNlA6cDapi+YJpapsCLdzaEdB3j736uK62nKLNk4TglokyTBHOHSteBt/coJtwyAdz1gyQxY1h1Z2sOuCXolXNv1mfRAuc8jUPxweI6lva5s5VINHVp2cEnsSn6uo8GvgcRWjJ3nCBXNe0e/ELPoRAG+t10BFQt9JYBG3cBDb4CYEDiweEl+R2B7JYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYMt+ieTaraffETzkd9+FwfWZ0eWSbPIAb8ih62+wpc=;
 b=YRDrJkb8elYuuQzVh5IL5wrKo3/ZYKl0KZmYz10SFJbB9LB1jWi81rrotLsHBjekxL9GZ+kfq5ls0T5V5ZD/76HF2skYK3VwqjUss2+WWYA8nm/iIxFCNgkl9Ub+6rRT/2EbjMEYiSdJMeSGxYt5OojAGQJM/aMQHl3qu/BFt9DinoH0/4V9Gm/NdjGXNfXH9tP2cdH/2U/shm8CPhLPzF9+tAvQ19IPp8SIPcOpyJ8d4SVtgm1ZPNjwYYIpWpwtMguWW7I4oSGHyWfRwPz1z1/wWTk1SRA1JraUwtpFwLO2v1U9sDnPqu2gi37I7XQpN953M/phKIfgVqTncbMRZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYMt+ieTaraffETzkd9+FwfWZ0eWSbPIAb8ih62+wpc=;
 b=gaDa1fhyynVL9H7AtU//CTvkrgnZmhyyF8FI/+VAP+0O5XoKK4CcOzibNbqrcaEgrWkuGd+Tmp9KgyOxU0XFAgoInbS8iit3MjlNkvwSI84S6Z8j30U2FvRuzdFgwOK1Fw2m6L6k5gybwiA/N6PZ+dAsHLDTTZiFibKPlU7rA9NZ3NZe2ohK6X8qUEILSLx9oO3aKgqZkhbkNvQ4qrQHyn6KpIZVMQjg0YY8cckkhRuCGOoJbbGnR/GhSxphCzDLnMbtztHamCX5tVXDzMwPD0ZTEzYl52ijPHmSd4g+PfO7PXK511CkFrBwd15g6ap0I2j51Qrd3WppseD8grnykQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by MW3PR12MB4442.namprd12.prod.outlook.com (2603:10b6:303:55::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 03:36:59 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 03:36:59 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH] sched/core: Make fallback CPU selection NUMA-aware
Date: Fri,  4 Sep 2026 23:36:56 -0400
Message-ID: <20260905033656.311477-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:208:32a::12) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|MW3PR12MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3e3814-bb25-4e56-6e3b-08df0afef0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|11063799006|921020|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9pCtuQI7Gowc3HwpBjrx/EiG4r0kmr5NUxYPLZHLUYhrDI/3HvXDPbcsPuDP3Nz8bng76BRav13pLXRX2MZ3RVUUPCxkQGj9gxMCaiUh9ngreCXkdtzB4f08GP/wOUyAdD6KvnAIidf9oiXAndGbYe+i25m6mGO3hQaVfQwAqzj1r9yVAV06c4+8K+ELkUB6BVHZHwY8vcrhQ06zTdMNSrws0Bkvz2cigCqhArtP9nYZaVqVcbO6aIXvk1T7/IpGcVmdCVLvWZV07FqT9BSvYRmvIgo0gcvm+B5pWFSUp2ezYRsHvrfU5fBB25b4luNS+Sn78Jioaqsy6TxI1+tGzNiG0YQIwLo6qz16h6RYdphLo9TJ+Txh3mqjjylvp9wAyb+8hBu1Xiq7BOtL9Atcej4UthJBVUtUJ8GHa6mJPtTqCwUJEYjJ2r2DUY9HviErkCuVpPR0siFI0onT6No/QAz3gyb+rfR544Jdtk/6lOumFyn3oDYNup8FlZeaVPlw8IhYdIbOCcV13vh6r1EToIJfSXuGvbQPPDQRILos8LPXcKl2QwzA+i6nrxT6ILs4Ig1Ez2iBoN1bUgERHWYaCACKK6YDZQbA10LNY6LxTTJ3dp+9GjR3DCdaObUxcVYlez7wD2L9yCE0CkU+RnHbtciqHz2J5X2oXGbyL7xLN14YKAaAiAHdxLOlrOgUEB8NXF+O2qH84VhkaGjE/J483Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(11063799006)(921020)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RX5DP7Ox9/XYg2Hojb8xFPiUUwb6zTFMVqVkEDyWrB2jcd4n/Lr26Ng21Hz2?=
 =?us-ascii?Q?v68g15wH2wdugYmLfQkZqAxnHe7iNQQhVsBRoLvy6kLiUS6tyP8LbSAimjVt?=
 =?us-ascii?Q?7A2T/jt/X8o2pL4bOOZoPE04DKGdmvpHG6ru4KUCXCD+lOh7g7uHXfdZoOIw?=
 =?us-ascii?Q?b9EEDRX8rblNR7St87GcGmWAXvmCVR1jKz715hz7KGN+BCFEZQm//BtKCsMX?=
 =?us-ascii?Q?hTx4Fll6Y0MIM8BQTtUyqee/xXrBnarb7eCIFc5+M4btyM4uNzxe24jJOzZu?=
 =?us-ascii?Q?ZLpUn5MHRKh33i71XxlJCCy+e85AhS0WrGWfqWkvAz9FCoBuZg/qQaYM9/Sx?=
 =?us-ascii?Q?gMADTZI+rtkVjhH+eAJCcvIYNeRtGTof8v1gBcoHRkGoIqUoFgGbkyr/3mps?=
 =?us-ascii?Q?QCrlDzTxMIPDBlOLiF4h9/Zjwcn1eGJbMr5Ca2F2YUdobFwGr6pAhfZ4IYvb?=
 =?us-ascii?Q?ep6RwK0xwYHQw3TeLfB0v04yYwTDHhF+laHiMi3+RhHXpR0YiE0BpXkPG4SJ?=
 =?us-ascii?Q?7bCkkYlIsps6FvasaJnkU02ZUGcVGhSN0K05V728qQCcvcu4tn9NRlYozcGm?=
 =?us-ascii?Q?iT3NujcmuuMVkzednD2QHW/lwoAcFh8jQXf6CW81nAxPjivIJihBOZ0kDO78?=
 =?us-ascii?Q?kDOzHZod/BtqAeXThGjTVSD8lJ2vIC8qriWTRUQg2Il2O22jxT0VhsyhFMIB?=
 =?us-ascii?Q?gy+Vldp3aCHKtZKdrgVL04kjhapZr8kCIf2j5EbAu/+C1LJHqFtniTijPkcK?=
 =?us-ascii?Q?n9z/foPJCTTEalupwcmePsJjgsXMPqTYCHpkgW8izo2vG9QgaAEhZOeVd3/s?=
 =?us-ascii?Q?ZILLJ5CSy59gMjj+rLMNUs2ljDyudJAfQeGki1sde8liuMvw3m/VtCLq9XUL?=
 =?us-ascii?Q?dUmB7ZIoSSfDWp4VYRYqqGFWA7HIl6Bt0/SOrbggU2/Z8kEi0Nofrbj88tfW?=
 =?us-ascii?Q?FAXvsivu3vEIycmzuNNUctywyAiEpe+UG0HBn8ix/w4rUT5AS5Bo7KXxp11c?=
 =?us-ascii?Q?mOlMYmkvEYdVGnodkhxF5k3iie/hSGSxKD3XuF+QkD5DtCxzt4i6Kt6kur0g?=
 =?us-ascii?Q?jYpHWtE0WZoGnq8zkFOxohaQJiDE+pMX50F6fBIDy4mK5L3EWbIcOOCSZfYo?=
 =?us-ascii?Q?MRYBF8uYbuOnvukVpblWf9ZKNGbBg2lNpKuzQBZmCGyTh5ODxEryT0pKCDyi?=
 =?us-ascii?Q?kfR35XIJvxO698tejPwr4c9qeZpiQNPkKGMN/8jzbWRjon3nFRL6XmkvRXp7?=
 =?us-ascii?Q?ovhXIdnk1A3xaYBogi45SWHmf2ZRUW+yLeVn7h6oP0UKu/rFyGkci60ifl+O?=
 =?us-ascii?Q?FKb6utHIqYh7KiB7pI0AUudDqC0NsgyQIp6/qhhYQZ8JRQuMYSJybycp9Vi5?=
 =?us-ascii?Q?MlAq16K3IL69rBhSAT1o4hkmih0kZYYGuFzi2g23D3gRs9wtVzhhdnsEsAOA?=
 =?us-ascii?Q?Tpg86k74WAvVfl4Gsp7wQ64hXwQH5Pnen5v6MZb3XZxV9MCjRlUXSwye0nFh?=
 =?us-ascii?Q?Y63ZRED9M12Tk4Bc1svIqlxVG4LZfVqgaDnIt9pKtCgEnD8AAu5IJD5F6E4G?=
 =?us-ascii?Q?qeWRwCjvLcRpe8dtf805B6XCe63BLh3TJj80YilSi3L7Gv4vMnLyNK9FatFJ?=
 =?us-ascii?Q?BQL3jqIBKEm6fMeCBe85a0gvH//1+xv8aYMGRyVGUvxg6Am4br5BkwrPbVV/?=
 =?us-ascii?Q?NoMDkis23N1luntVhjhmUE3LpZKsnAAJXWFojewh+6oAxOp9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3e3814-bb25-4e56-6e3b-08df0afef0cd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 03:36:58.9199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amOGPXQ2EW3gppqlVHH8l6U+DgGNF3QMtg0D8BHlI0PkJ4HdN8P2k2++LU13bKnMHXNunQSXaM63uhSWzuzvRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442

select_fallback_rq() checks the local node first, but then scans the task's
affinity mask in a numerical order. On systems with more than two NUMA
nodes, that can select a CPU farther away than necessary.

Walk the scheduler's NUMA hop masks and consider each newly reached CPU
once, preserving locality across the full fallback search and after
affinity relaxation.

The NUMA masks can be unavailable or incomplete while topology is rebuilt.
Search any online CPUs not covered by the masks before relaxing affinity
so fallback selection remains reliable during that window.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 kernel/sched/core.c | 47 ++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..2155bad0e1ab 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3554,34 +3554,37 @@ EXPORT_SYMBOL_GPL(kick_process);
  */
 static int select_fallback_rq(int cpu, struct task_struct *p)
 {
-	int nid = cpu_to_node(cpu);
-	const struct cpumask *nodemask = NULL;
+	int nid = IS_ENABLED(CONFIG_NUMA) ? cpu_to_node(cpu) : NUMA_NO_NODE;
 	enum { cpuset, possible, fail } state = cpuset;
 	int dest_cpu;
 
-	/*
-	 * If the node that the CPU is on has been offlined, cpu_to_node()
-	 * will return -1. There is no CPU on the node, and we should
-	 * select the CPU on the other node.
-	 */
-	if (nid != -1) {
-		nodemask = cpumask_of_node(nid);
-
-		/* Look for allowed, online CPU in same node. */
-		for_each_cpu(dest_cpu, nodemask) {
-			if (is_cpu_allowed(p, dest_cpu))
-				return dest_cpu;
-		}
-	}
-
 	for (;;) {
-		/* Any allowed, online CPU? */
-		for_each_cpu(dest_cpu, p->cpus_ptr) {
-			if (!is_cpu_allowed(p, dest_cpu))
-				continue;
+		const struct cpumask *prev = cpu_none_mask, *cpus;
+
+		/* Look for the closest allowed, online CPU. */
+		rcu_read_lock();
+		for_each_numa_hop_mask(cpus, nid) {
+			for_each_cpu_andnot(dest_cpu, cpus, prev) {
+				if (is_cpu_allowed(p, dest_cpu)) {
+					rcu_read_unlock();
+					goto out;
+				}
+			}
+			prev = cpus;
+		}
 
-			goto out;
+		/*
+		 * NUMA masks may be unavailable or incomplete while the
+		 * topology is being rebuilt. Search CPUs not covered by them
+		 * before relaxing the task's affinity.
+		 */
+		for_each_cpu_andnot(dest_cpu, p->cpus_ptr, prev) {
+			if (is_cpu_allowed(p, dest_cpu)) {
+				rcu_read_unlock();
+				goto out;
+			}
 		}
+		rcu_read_unlock();
 
 		/* No more Mr. Nice Guy. */
 		switch (state) {
-- 
2.53.0

