Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021095.outbound.protection.outlook.com [52.101.95.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7760748665E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784173; cv=fail; b=lpvAI0EeN/WowZg0ZoDM+xjUAkFotF5zaRHLtv5Y9YgmrysAw41KS0ATvYrB52NuhL6XyZ6pJty5aNIq12sNeQU4XQsqzEbGCQd3lToxJ1G7EYmt3uMzfk5xiLrJ7Jnaz1Zw8PQEwnve0+0GgGsYTid7EYhpvSb1ljiLzwehA2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784173; c=relaxed/simple;
	bh=pOVjgZBI1z8zyimcPx4zMQ72mVP1m6ofs9ETwo4CIiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s5r9tST8fC7+4TFFm7/78C20RQT8I7XPPew7wMikMdvYdobwqnt9T7m3b6NmL8QkqPsYOmG6S547KtOThsf2IBhtwx1dQwgNXECFRH/N5UmoLV64P7VX5uWR8tycqLv6LosKe+pNX3LjW/26pa9m4q8V7bWj8vpHLeld5lXS7as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+yMrgU8kpozZtbVPOrZoTsJKXA+Uz2BQHifgf7fBU07aIjo0sh7+w8QP3tJh9ZtfcWRuGgeTUxfXsQVDgeRpyunq/1RwK6NuPR8WFPDiFm2ir7HqnW9sqpJWkiZ74BY8Tz92z4unclWO+mp/MKAwbuZ3Arxz5HC0WySqpN6VrJzpRYHu4OU2uuAxtc3VbYD/PqwHdyNY408I56Mb8OYS3pLrVTBGlFMbuGhbq3QUO+I9VKvWNPdnV5D7keuEfFVqtjVxss6zpz5J/DkKxyTDo4Cu6CeVZM1mnJs/2uIieBkD/m7IpbGL8/x/OzPAfk61scJBfswEI5YXiq8F11ZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=INdQEcvl0W6reZMGjAQCYepzHjWHXFCBp/QRt0ISEl8=;
 b=l+j9ghIhn0ZsCjnPxjXNRwowhWVQux+NC3lp9rgyzsCjcKpoS5Jm91QAhz1YeXgC5Zxil8ovUmHjWx/HDEHJqvEWAdExNVBgyIY51kYx9OitX29T7sIyFbvj1DDdV6z79leXBADWefZMAzTTh/GZzpx2UA2qzVp7J/GtsvBvSLtn2oOc6IXm4amNwfKtd0mxFRKE/sknfkMTFddFCYQF6sVnhMW2TzkBvkrqm3kCNO4mCzoNki16OAatv1rTSDbMf46TO/Iv/rWlPmIBNUdG+T38p07CWzD6azCdgWEE1nsQe6Mcb2kO41wfkdG5SVo0/iHBUt0YNJdWjIJf/lOvIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOYP123MB2896.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 22:42:43 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 22:42:43 +0000
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
Subject: [PATCH v7 2/6] sched/debug: Protect lockless rq->rd access in print_dl_rq()
Date: Wed, 26 Aug 2026 18:42:34 -0400
Message-ID: <20260826224238.936456-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826224238.936456-1-atomlin@atomlin.com>
References: <20260826224238.936456-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0195.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::20) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOYP123MB2896:EE_
X-MS-Office365-Filtering-Correlation-Id: 61664f65-06ae-41a9-cfe7-08df03c3576f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XJeijT6GPykQ8o6/RMmWahIe44FpY+2Rg/NiiCBYZQPhmVdUV6PvHcnNuFI5q58gCszl16HOi2Hs2M7k0TQjpW1t9hPQ9yj3PI0NSpvppHrwEi+4F9ikm8BFV4uL7q3v2uOCMg681ZImaU6KZBO/yFfuZthMjYhI1thRC9zeqc8SnHFgM9X3sKeBgaNV8uaPVScXFkN4TffY5UKzzdtda4PVgumBC1uZtpi21PZZwzpX2iEGabIq0uNdtIyT6stJEut+WeLiyxbFWjUVj1Jw1tzw7tlG7fpZ9Guev+6aLWkCfY3ao8KJmYnMdc/MN/ncuIonqsN9cxX3ZAPrHtuVLfxP3sb6wvaqiHsAHorUzHfyN6hlVYFvrd4vcLBvUSrokuwM/mCkAos1qbeijf9YvEEd25F8soW0wa0+CM2Os96kYq33P/Cp90b1dHMswhzSfc5uvMYfS1CXDbzDGFkdNqap37m11Tl8u5rKGvL71vQUAM9GNWgfvrl6iA7sZoRccyyMfilPyDDPOO2P9TQvWkxPXoJ4OqmcP5vY2f2UyDn7NPpRhlnkKc9nfB4wbWoxwjHvXLM7aQKE6dgXMW1hvR2xYdGcCkuqNVVLGDRdiodiDKaXlK9yBNGqd5vo+rhQXuLytnmXGuatcDVkZ0kx0vHDv4/dFBUANk+sdljP2yo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SzqSrcB6QHoWVl40rD2AXvGOIVJ/3GO9DFIigb/6+H1CQlAWkImeerG+/Cau?=
 =?us-ascii?Q?d40tdNm3wLrNRZTjN2ZWf6Oi+tTwrrEXwUosKUkJF4m5mIsyPXdN82jw0RJD?=
 =?us-ascii?Q?FXDaRRMsNJ+41j9kILFHo++VBrXhBMy10chbrHGbj/l7aJ0V+sLNRpeuDAPI?=
 =?us-ascii?Q?iFcp+M+GtAfFWtxEVFmN49uvABrGOW9Uz6UgqZj0CRpOW0S3srTVg46ByKLP?=
 =?us-ascii?Q?JE0X6XCY9FZSp2xnkljPs1Bfq41GVIK8UWXoMm7xuYtNTVd5fnDE3V5CcSKh?=
 =?us-ascii?Q?80lPXUeiU1/oJH6DVZR47n3bBH/WvxIppmdOBBB7SBRgK9U3ta/C80om1mli?=
 =?us-ascii?Q?D+DQSHYj1e4s+K0gVPn76iHiZa554pDIsNThwfugf0C2FRRWmRHChJlNowix?=
 =?us-ascii?Q?Nyagt8TFrYMkOF6J7xAGxynMdzZlYoYBvPwCAajsyLhMHiHlVigwwIstcW6P?=
 =?us-ascii?Q?EOB8GXAm2oM4PPw8Tp3HnG36obOZaXBw447rd7Cwdimhi6fq4mYnpJvn6HAI?=
 =?us-ascii?Q?SZ6LWHAk6BScDzlKWItHmEsZKHy+aRZfttX/Zm5vnVTZSkCuA4e33wF0j+6z?=
 =?us-ascii?Q?WUnrn4hhD/ss4kICrWoaGzkhHkqkBL1DBRx0FA5DImwP2A1piqIHg08tLmgt?=
 =?us-ascii?Q?8raVYG5IQlD3B12OBJai3VaxOdzb2XFLXMaGqNy/lO7rNXMnFnrV5m9996rm?=
 =?us-ascii?Q?RRQHW4zg5jn7sKN7mNJ/q3Mn8h8gLI/eEtDGPPIwdyXcaF1D4NgLHU6RAQI9?=
 =?us-ascii?Q?qJdd1No90Tm3yoKGwjItPd0P7kD5c8vYy0u+yO7/+BoTrwMCGvoamGgCw4R/?=
 =?us-ascii?Q?00VCJdEvkC39ArOMfbpgoJ+/H0qO9EzqGpaHG7ceBVHPGXtmXtqG/WFn1Hmb?=
 =?us-ascii?Q?y0eqiPFPIme3IFp2Ls7l+EJylYddmMZIZ8wDEKffrxviSiJ1zQwTPLERRZBF?=
 =?us-ascii?Q?bGIDtzcEgAy03n/JQBNChXcscZ0HSlFu9sQCQGkVdwQ974HOAPVIPmJWCmiL?=
 =?us-ascii?Q?Qq8jq5LVZIoxXWvUEtgQhMN+c/H6iWbSJ7AWttCO8igPuOYfTzMlv0BSEAb5?=
 =?us-ascii?Q?h+0cWOZX45yuFdj+mxJbpjPNmBFv2y93Ia6D/YX1mXx9ucjpAFfiFoWKOhQY?=
 =?us-ascii?Q?lmv76nVC55V93nIQBWHmSIz+60vpzImGEZrshWvOExI0h8aCZMzfVUYCFyBY?=
 =?us-ascii?Q?jAuhd5qwkRDjhpTTJfhEham+4gsCj8Lp4AuOW1Z0qMAbojTo+GFHWq4O/ZNO?=
 =?us-ascii?Q?fE0Wz5TAJwNma9AJ//9tzVuGYbmJMqDAEeueR9IhvJPlwxFfUdH9M1eSH4TV?=
 =?us-ascii?Q?U5BUMEbC2vO9KFxcVrkHt2MQWWSyHA2Pgc4BdUzCXA79cdZ2BCfOBtSulQl2?=
 =?us-ascii?Q?Q78af+1wdtE9JVSYriGEIKFmg429HAhyzorU2bx7HmGwG1OjpnzRq2NEsVO2?=
 =?us-ascii?Q?4Q6t/Go/PUpK++nvXt1VrS2taWzw+Bwp346s3P/2JuI95YJSE2/gyhUsi63U?=
 =?us-ascii?Q?IYeehOcK0YJU3bhC0ymk8zqWo2Mc1MMUbfYaZalp9phGXCl1uOw6XdAilumQ?=
 =?us-ascii?Q?W5hUZJKPFYGT9ttC8iK5wuCwvAGdFkV5FkfUPoeSIIethBoO2ASwn9hHHSyz?=
 =?us-ascii?Q?Q6iAv1FKi0R1HuLxiDjocVlwENJ4dDFZNOOhqhqGyXt9ZKxYO2Fdc/r5cQnP?=
 =?us-ascii?Q?d0tn7bv54YNVfitjHD7Gt0PL3UaXP+kTtV0xAuf2GysYJNYg?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61664f65-06ae-41a9-cfe7-08df03c3576f
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 22:42:43.1289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+fpsMwgraBSEQLHX92j5rf5uGL8ba0zEV350eUG/IiY3v9T97TL5IDDHjSq/PLuL2B7iAkfZMycpSAavwuUXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2896

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
index 72236db67983..b8be86bf8849 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1172,7 +1172,8 @@ void print_dl_rq(struct seq_file *m, int cpu, struct dl_rq *dl_rq)
 	SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(dl_rq->x))
 
 	PU(dl_nr_running);
-	dl_bw = &cpu_rq(cpu)->rd->dl_bw;
+	guard(rcu)();
+	dl_bw = &rcu_dereference(cpu_rq(cpu)->rd)->dl_bw;
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->bw", dl_bw->bw);
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->total_bw", dl_bw->total_bw);
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index e6038effdf12..e9307b475cb5 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -496,7 +496,7 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 	}
 
 	atomic_inc(&rd->refcount);
-	rq->rd = rd;
+	rcu_assign_pointer(rq->rd, rd);
 
 	cpumask_set_cpu(rq->cpu, rd->span);
 	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
-- 
2.55.0

