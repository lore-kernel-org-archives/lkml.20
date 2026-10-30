Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.78
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793324314;
	b=CV8kzsGnBKc6YATbl98fFHP6gDEVaC6dqsWFEXh8z0+9PMWA3EH0WdeZBoQQOmshNkfZ
	 EZrYMTsA/kCLyvAes5xIIeAA/+Qczh4t9/eRU+5AlLKOjyiGo4lKfS8G8r9rZ60Hr9Yfo
	 mRRkOurr1Z1y4xaXdy55XxcKdv5fQXA8GRN6S3EKjakLdSZK3VISW0nVkmDJkVEEcQCQI
	 0GGyzl3eHhieglM1dpuvgdHrgXn4FlybLxBT5xZXCy+fugHdcxPo62wXO0Qu/1hJD6TjS
	 Dj3PSy6HLa4ex+z1sW8Uk9aaUUzbE9lbMM+A3haWbYnCGqXW83pWN4n9hgeupwwkmFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324314;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tfmtiNTJiNvlXI3I8cx7WIcEbcTolYIPf/mdeKO7qlg=;
	b=4c+aBsuB/ADdVn8QLkTp8pSNQighL3yN12VgwxvHiLhYdqcgJsBdyfkWdr/HfgvTmx6T
	 M5CBSUrUHFUYRtBMKPCCvRybBpfvWV89JEjpqXwUv6R8khMG0QG66O4LZD7k+Lbl3SKpD
	 AcVwziuJlXKiDvUOmONBlVSoV53urAt3f4h1v8E72KJtGoYe8LmeD6XtGgoVA/YCOPiq/
	 3XgJi6zIRf0wN3nTOHZVcLfH1eONFWv0uqHq8Hl8TM5eUhYPSJb/cYqrqVNf49HhqZGVn
	 JBFNX58sD+yI401mo86sdRNpzniXsQJxW7A6CEGAgXR1xJYUfDj4MjQC3v2nM7lUkYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.78
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020078.outbound.protection.outlook.com [52.101.196.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1D5606A330
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQDJ11n4wnCfeVpId0ijMfKH7adjHZ4hOoGKDgWttwSc/RWXexKZkmX7dsyxh11cw9At1NQIdbRA2xWaFsvR3bHPeZYwSPAv+YfRqLTopjyGXWh731+xrz906LegLdTCTTJZZdatNNqkmJi1zcyRjASyPg7LqeSPsNZ70e/8mAL2Yu+wUPFrYAcNo2f3GzOelkKzrR4NAU79ab+qjViSPvfTTa2rEw9idtqzxuB8TGYTAVzx64nV24A2WOE2LI/JJhMUJqfkm4kMOzrHui2jEThPs2W04WZw0cO6GS0TQ59ienBjceL4AiGo9Gut7AxQ5BYvPw27N2IuiLUhZhhAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=tfmtiNTJiNvlXI3I8cx7WIcEbcTolYIPf/mdeKO7qlg=;
 b=MAeECMnp3jBW1dFJd6vZ1FCJCy09Fy/pZBGjRtaTAKI68q35bphV9tGv9lE+7s/poz8j7EAO011Te4SFtCTcKcUeR385faKXHtz1n9XDOqFyws5ThAqbw7W2hQOhfKWfuoYsprd5H/CJlEqkB9/Vm6/e1A//OHVK1Gd6KAJSdAjs+pZY3PS3HKQVoJztp7yHVO4Pq8rwE4Dryon+DFdXFMtkwt/x+H+MQW5HzMY/Z3Oui1JTyliOjZfRsz8QB0pLe+MHmdk6YrzPbWirO/kKKYoBhYmRXH520WG6kPiY08vWDuRgFtDP0QXA6AzzKW9w9Siy+PgHMPmMmMfjAeCciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6323.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 01:38:28 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 01:38:28 +0000
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
Subject: [PATCH v10 tip/sched/core 2/6] sched/debug: Protect lockless rq->rd access in print_dl_rq()
Date: Thu, 29 Oct 2026 21:38:13 -0400
Message-ID: <20261030013817.753804-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030013817.753804-1-atomlin@atomlin.com>
References: <20261030013817.753804-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0930.namprd03.prod.outlook.com
 (2603:10b6:408:107::35) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: af75d3d3-a272-4098-46cd-08df36267f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LodFVAd1pnkEi3zOcsQpDv0aCLqdWAcFO97vI8/A9GaZsbnp6JDsz4nJryBjom3n4izOb4sr3j86nzzF+R8vEXeSZtC6b879ErA6bkU7XTxX2S+C9fWR8anPM6G5Yiqhi+A2DgOFHL728mWfXrHP2+lRmbWhofKGFXEDw+LXYbZvoG/9Dk3sRa6fXd53kdjc0pyDrXnPJMeBQZzUbEpF/cW3Y2CnkLvhyGRIg3VF9jZ8Dvux/TWbprvOulXtp7+qlyKnZjDYTni52+LRQFU5b8CRigP+cxNukc0LUvgFlS56Ugb/fLl1JGoA6VHvqyZrteON1p31JV9HPKRG9xKqNSJYOP0UeQuy4jzoa6AVH4CVBuivUAJLezTddH/mIluAHWN74vrCbJuZAElrVHmnCaHAWSVIoKGpkplbe6Xhk/0d19QWjEKWa30GqIoo6T7fccWNZOYUzzyUeKK1b/iSTTy7VNMoo3TTelFyH4lc08xmZzc7R53s0WUkcgzn5T0xVIt1EOJBH+G/Vg70bUXPsfYHdu8YA9/okctyquIcb8OPTIjaQ+31BvklQ8uDw2qpXMA8YcC32WpCDlawAOTifOrUmdtZtA9maXlQ19A0kqh1Wm8ejL2sX/gPH8hwoJ92Yr2XLEDYGeT95UDW6Ako6YrgfRqFKHxvmQi+6kpbV6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tneK+p2QHcRlMXy6qNylQo261kYqnMcD5gf3yKDQIcxoMPo++fEf5pw3ZAuV?=
 =?us-ascii?Q?IaJj2YbwaieA17O7qJcrFTTcMUYk2CnuU4HggRUZ8vAEtfi9mvRddsolRNvt?=
 =?us-ascii?Q?KXUP9KqLjnYfAfzEpMwwVOrOWh3r0UIF5YOQTXJ4xt4VSPWUINPivQq7Wcmh?=
 =?us-ascii?Q?U7r7mzazrKt3Frdm2ZfVBhkJzxx3nlUUs2ynjL3JmCJIKmo47eFm8AlrbREV?=
 =?us-ascii?Q?OeW1HcvouhRfFsCShVmT6JSYbShzXlUlqefotztAQ8N4P3x2MyCUKNq+YkR8?=
 =?us-ascii?Q?Dw2BLVUOye8dg1Yw9gGVJ9CZgWPBuYVvzn1l6TdFjeWmBSX2hHyvsDXpHlN/?=
 =?us-ascii?Q?bBTnW3ojOi/p6o1Vm26XRdQNk//9/y/nxqB9KPQ9YwNQJEXBCRMDzwMevUyn?=
 =?us-ascii?Q?Wi1WM93MVVEbyD9X0ToxUjiL+vFnRLhIwOVoboepHugUdVsGqgYWqv9HF/UC?=
 =?us-ascii?Q?98mhL5pai1OqG3nogfzZWMDqTFikgbcWeDgSu88xoQA6GY/Xp/6Lr34+h82P?=
 =?us-ascii?Q?3YFnXkigkURwAE/83fIqk5ubnv2G+yutXbhEQOWYXjmahIED0aBECOXak88r?=
 =?us-ascii?Q?aNlXem9XL0mAR+6xe/CHdoQmg6hB1GA3Qz11D0OQKERNTRblyT0mnazdZ5Bm?=
 =?us-ascii?Q?Op1yOPj2aITnyw7FsI7rg5eJKUOeL3LI0ma5sfiWCJu8kMxLm4RozsleDtGN?=
 =?us-ascii?Q?Rr/h3Fk20hzhY/zB6fAwA2NjdzlGvwN030qJ2sMJst3D6S4RvcLVMfOdSv6R?=
 =?us-ascii?Q?49ctsJFh5cEmjBrfg6cPiQBhfVhGzJFYDROzaTsIsF+/h6gjwfgVDjBMPwkF?=
 =?us-ascii?Q?O2TAgdiYGkhFyXrOU6Zj4Myebhw9v+JcPREDTxG5s5Rx8lZDIr8syUL4XAA+?=
 =?us-ascii?Q?wXM95C96yQ3Ob/Keep8OmgOWeNEojtcDicDz+35YX9pc5KMo4rG5UpjGf8MN?=
 =?us-ascii?Q?TPZmSovhEXhBVVgwsuRGKtTBqPH99/m+frwuDOuCFooNAAO3AISaTTkdkw+4?=
 =?us-ascii?Q?vZgP/z2CL4W2iSxFsqLc3XIvEK/KQcwu9nr4tlVlt8+AIIZ8B+KHccZA4noQ?=
 =?us-ascii?Q?/vGWHgunE/YYWM3FbUQvmi0rE7v/ySdhhqyUh/TVZwYudh8Lf7lTj8ASCtHo?=
 =?us-ascii?Q?t3USACtiJ2T85kQxNGgZ0fEeeecRVjtvJmPc7fS2Pd+edJQ0OYzNp7aOtDKI?=
 =?us-ascii?Q?0ZI2wSOv0lIeZTzpWfsm9TSgp5P+ViWmzZPnQppIS6UHOW7IyPyzUmDHUYsW?=
 =?us-ascii?Q?JmahqGHLg6xtAKAK/4/MpbA/YItRGdDwAFcjpel77r51JOj82cqI5y4ZwZUQ?=
 =?us-ascii?Q?Vy5CIDWyrrHX+Mp/D0hfhzYuc1LPRTOfu9J8MpGsoSx+wsirC0WW2LNgYklm?=
 =?us-ascii?Q?dGy3mLGVFn+xrbLzr5OTspEcBXk+ENIVA4kU90qCRzGTUw7VWdv3pR7IVdmn?=
 =?us-ascii?Q?96/wTtOsRwtw8vnCDkhGtUTDB0JCdEPAC8PVKSG249Qx+zaxoPQ70Nsj51QB?=
 =?us-ascii?Q?SqdzvaaQ/yHgVHO55Fdn4LoYnluEJ5ojzar+lkMGPKq2Npoi10937ix6SVaQ?=
 =?us-ascii?Q?OVJV/pNZcTtr28FuIg/UbjA/XNfHEn4h4XtNu9NvnQ2syC7DOcoaFC4Y+s0e?=
 =?us-ascii?Q?QGuKq9RiXW0pxUSscMko6yvYD9o8kDvXf5pNwoKJlGZVux1ppL2Vv2caW0LG?=
 =?us-ascii?Q?igkN7tQtTNyX0sE9LZAS7APds7SM2BF7BoRetsq9L8gD3wnop9f1rXVsEak6?=
 =?us-ascii?Q?H+2sSRR9Iw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af75d3d3-a272-4098-46cd-08df36267f85
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 01:38:28.6970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDYNQrkzxULmgS+ExDFkxJCT9k0FtrD65AYgxTmE3PI706qwyngbxfaz7ApL//+0fgIhGZe5+0aNJRsZ3/IBcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6323

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
 kernel/sched/debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index e6a3b516c703..439e59bc1fe4 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1166,7 +1166,8 @@ void print_dl_rq(struct seq_file *m, int cpu, struct dl_rq *dl_rq)
 	SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(dl_rq->x))
 
 	PU(dl_nr_running);
-	dl_bw = &cpu_rq(cpu)->rd->dl_bw;
+	guard(rcu)();
+	dl_bw = &rcu_dereference_root_domain(cpu_rq(cpu)->rd)->dl_bw;
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->bw", dl_bw->bw);
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->total_bw", dl_bw->total_bw);
 
-- 
2.55.0

