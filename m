Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280344;
	b=qRlkZzTVRaFIKcu2OTJfDqvA6CoZ1OdFwJO+zdg2sk83vkkA7GbU+XZQXJwZoSAtrre5
	 OEq8IQ7oziCBE8xIDu46TJeQ/H+I/SUILdb09FTIqD9l+6uHKqVj4ZjvvMoNKwRupaiZm
	 eca9s09LmwkbZuoM7u81pBXAdOSqwq7YzKinG/wHD80X+1JPBuoi8HydwyBCvqRHDXeF4
	 JAsQxMCdutygaIwBE5LS/RZFEhMX0TjINImAiXESK20O53KurVse+w6VziuxhOjK2uRBi
	 AZHJBzq6N2WCiAY5nKxAeC9Z1/W+K8trNy7T3hrja5qZvwL1WdB1wIeOL0e65adXiLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280344;
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
	bh=PDWB6dtYFyXrR7UbvsYg0vGRic8gwbOXc3tbw4F5zEE=;
	b=uJMDWGlb30OM9KR1E8j659m6E2rTRRDO4qON8fCXGSilnUhUQ0pyVILRKqInZwFhrTqG
	 N33wgj50L99tLLzFUwxoHhzch4DxdID4GD7ib+OLmSRdNAQDSvvQazuzlbW/GqCa8x1jt
	 W9Xqtlo65cN7xwbfmFxq0BJnkwL3y19u+Ruwb1FZSxScclGka8wnJFjMxLLXqrBZ2N1nQ
	 lAVT24lWIKeVUaQCvuFyPYbDrv57S3ajzazo+LKGmSyi67tS90f0z91f7Ph+bRaT9v/wr
	 f9GHkt9q8kmFaizlXrrgUI8o9nFoBGyhctdFH/5RCFrStMEoLOS6+lZ5k12kCgktEWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.86
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021086.outbound.protection.outlook.com [52.101.95.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E75A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E75A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cj4b0qvg2tg/rTY9Kv2AMg8OBgGaOo3i9XX8YgcnhKO7S+nYIzOyP26QvAoyS9FenfoNJY6M2gKCmXn3Ye7eq59UVOpGgUBf9eDanNBayexdOJLI++Lt0+ZT2NVg274r47KtpyTHMvZPLHOK12v7+Ib0jLNH0qSBc5K+57sNEfRjQRJ/e54uolZyPPKaUktIdvb3f8NJ1WaPK4w7fZO5qXhw7C6v9paPc6juD3zbRzdMaoKu+SyulEh+OUPpuzjn5TUo33s+0arKnIeo/Awd4iq5csZqbQ1bpy3kAbU+nObhRKxvZLhQbiWqWjyoIcmfzGBmLhZV0h/5n/t/UJ0JuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=PDWB6dtYFyXrR7UbvsYg0vGRic8gwbOXc3tbw4F5zEE=;
 b=kITGXj6M+Rv7DFmt+twM57M81fYOJh2cNBrP3+kgmgOfKhdJEwo6ZCKEpQRmWZPzS+dxioFhmmnT31QdtOAHKXJyokUgiciv75unIbiooufv04oWqZdTOMd3diNFHSfV62+Axx9iuwm6iHgtkfwLHsHAIZ+SYxVyzl1mUyEzsu7b0ztkQjWL8nLauzseoIwVXyr7GJLNEEk2H2D5Q9det9xBhKQ9MWoDF1IEECfBVZOeYVHu6fkZ+sYkfDF8mjW+XHk3GZxTEVbj6hOSxQzexd+2iHGuzBlS6F9OhbpF/fXzLcQCfZgQUxerJc2Esxk3CxrYLF3hBlA3oigBeTpNrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO8P123MB7811.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:25:37 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:25:37 +0000
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
Subject: [RESEND PATCH v9 tip/sched/core 2/6] sched/debug: Protect lockless rq->rd access in print_dl_rq()
Date: Thu, 29 Oct 2026 09:25:07 -0400
Message-ID: <20261029132511.712391-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029132511.712391-1-atomlin@atomlin.com>
References: <20261029132511.712391-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::10) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO8P123MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 775a3c9b-2865-4d8f-8185-08df35c01ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|56012099006|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|10067099003|261021121427099003|261022105027099003|261021123027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	B/nSqOTM6LvddgrmBEnr+dkva2Bga2tYe0sUaVoSD17UiLLWYwMaUTNI0QnocpW/4RL252guzvVuCepqU8/8gLNSqctQTqtrweAHXPUzxwWFL5G691wy4hFJ48yIMStbAce3eUdSLvNSAncfxe1FFxqPX4GeLxuOZ12Xp935nx6A+NcdCX+FxPAQqalNdqYpCujM7ntNyf0AC2aDOeqH+wKFQ9kTvLsDYF6nQltcd/TroNq8jgdyO+gsNTUzb6BhsYuJuyDKBVzjXAOxetro56QUpa4sNNiohlOyye4Le/XdLYdWqFGMHhrYBlULeyYauzawG+IkwsNksZPOO5caa23y3HSGkQik4DGxfirpJ7VxcT8Ljsp1EDxPhgS1vns4wzjGwlcbnTqLQGqXyrzpLi/YzXKaMwyplxxlOkM3k5mY9gUhip6W3J2E/D9jRpk8/nDFUPoktTAJLwTwKMCvOwlklhcOunsZKLRJXBDzslzi16q8Ohd43igSHPWl1/JyV/MkAsFxc3GfQi5HFHsxUj3cERfRdT9AFzyRIQWrmUoZwicnqnWOK/zyfDLk8bfTdtMRKscLiW2m/jIeJeDX7yVv6vQDu/OqFdlL8OAvH5dGc2iKBAvguvAJfLW215fi/qDTnj9OMu5V/DJynF5E6iS4o4QR8tdojI/TvTFcOCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(261021121427099003)(261022105027099003)(261021123027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?taYnQFmX+yn5ZuwczULkNJS1/VMYJW7EDKPGrgXYWZ9CH39barr+20EDz6MQ?=
 =?us-ascii?Q?B9rOBC8zEkalLHsvVXgtzupcVVSYv1ECSmMJLsWshQFWb/zSkcmoTek45m3M?=
 =?us-ascii?Q?c0Z/uW9CW2BoZXMhbp+OxvR7CqyFZ4gFJOeKgt339ILoRiyuoTBYx1FisSaq?=
 =?us-ascii?Q?IxR2ogL+DUgEZJaIDRqNwxYlBxt/umlX5PeN1NCXxrLmACcPvq9j0Pn/kyJv?=
 =?us-ascii?Q?oXcm/aJR7330nLpSKViWwGzq2bLdo9DSKs2T/l6cKLmyYOHQLgLDTIvIiADr?=
 =?us-ascii?Q?wbK0IPSgm5pQdl/eO4ALWaXDvtsjdysZ1EDbNN4lDWn0GuzWYkkdaHaquzzO?=
 =?us-ascii?Q?/7V42I0IBpSPLahBnStLMG3oXInmZs1M5zfHzPTPpS/em493uHk3svrha8C+?=
 =?us-ascii?Q?nFNgY8oYTMDyqT8Ayn2H/wZOVLc3I7atjY3DZOGksQ0A4j06vVZkK724KO8X?=
 =?us-ascii?Q?/tQF7jfNpRGSgAmHHMMQdzmS2Ohpzf4StChxR/ZttrL+qaZtDd4Mk5gFjalZ?=
 =?us-ascii?Q?Zy5RYgoH5k5JH5VuT3EdossHOsBmu1ljHh9MnV1oSOVtOLibCTC3tEh258uJ?=
 =?us-ascii?Q?9txSwVpJBZdsDL9GhPuqP6LSKuVzJFVq8qbQ8QtRMS+nX+288Ef5EP3Uf37G?=
 =?us-ascii?Q?tKCBqYmerPFtRUf2V2yqGejB3wUD/0tozRr9e7R9ZzSPNa0ICFaul1ArLLg+?=
 =?us-ascii?Q?uTelUYqkEtWkG1NY8GXnl6E8iaV6aA0ygxw58AB1J0/yhh2R6oj2jZ0gceZT?=
 =?us-ascii?Q?FzZ6ONqyvZDY8KuSAKSD/l/KJN44WQXZgcDsDzPjrmvLbMyv/h8TO3tIyFQX?=
 =?us-ascii?Q?7xOhZ//4eGtKAnTOWc5VBLcdajGLkf6l1AP2f7r7G/Oy/p+xLT6xhl507QK9?=
 =?us-ascii?Q?R2yJCkr8MNTPZ6rzSdBIev4KPcTuLzhWBl1zTro73vwnP/DWcrrecwEBbt+j?=
 =?us-ascii?Q?eOyV30AvcPIYhuz2wpDnzT75Co0sdZVR4ipYdPpSlCKeRgim2wvwiHkHOZTM?=
 =?us-ascii?Q?qhEoRpBAjdorwDhKkcwrbZccAjI4dFKNBdlCyCBYoNk/hzogoouxyB7Qe5vJ?=
 =?us-ascii?Q?b7Zf17ME2dKIK/dAvW4b9GB7SkPCksUjegquGqbtGTTgo+vwCH0Jsiy76WId?=
 =?us-ascii?Q?Anwiap7/OeEa9FJ1OsvkzD8yc/C+P7Flbj9nPmlzACwJlqds/kIjVpC3LFnL?=
 =?us-ascii?Q?XhX1EEcH7BnzzFjn70VI/1iZ6OJVGyeuMx1ppohEc/Y70PIjIna51F5FKUnh?=
 =?us-ascii?Q?VHgnK2GkMIWgzv/MwzlnSZsoFwn61egDQUeyST9WGBBctuMPjh2+KF7+wUdR?=
 =?us-ascii?Q?n/wbugBmpwWoU0WF4JcsRxQrf0L+7+LZVRF0PCnrAauaGdAv7nnGwRqRVZmM?=
 =?us-ascii?Q?10N2/PZFsryTDOucLFVluw6yK2gNGLR+OFJr2pEqn3jPSIZZUx4PZxWeAxvA?=
 =?us-ascii?Q?YtjZffbue9p7XszgiWJdC36QrgAX6sxJ5onFv6RzYwRK5TVXBr5mxpA0vDm/?=
 =?us-ascii?Q?mp+u7q1WhiFeT/hbMoWkUneFd4iLkHXp00nO4kOYr6Zn9f6qxkA2xynf6INi?=
 =?us-ascii?Q?VgnjqOWXDSkrp8NQ3KYMm4tBWLHEp1A76CTN+rvQqBbvPUOhMMriYu4o1nyD?=
 =?us-ascii?Q?NUroSyUUWEdBaj6/tzzQVFivKenA4rQXv/cYpp/OsZhDpghym8DtaDUGb3h5?=
 =?us-ascii?Q?ZDeoQB1SEM8Q/ubm5FnHaQmDXxXEjIdnsKko7XrWDHqLw05WGsXgNjJmUvFO?=
 =?us-ascii?Q?t270PP4tgg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775a3c9b-2865-4d8f-8185-08df35c01ec1
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:25:37.7715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuJBwZmzmWxdgV9mvmuFAaG0XO7bujclYG0yuy1yDONRR9V/JKL38RFt4uE5m4fslSYtrkA8aNIS/+wmy1q7Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7811

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
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 98a65d127e46..2db05acf12aa 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -509,7 +509,7 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 	}
 
 	atomic_inc(&rd->refcount);
-	rq->rd = rd;
+	rcu_assign_pointer(rq->rd, rd);
 
 	cpumask_set_cpu(rq->cpu, rd->span);
 	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
-- 
2.55.0

