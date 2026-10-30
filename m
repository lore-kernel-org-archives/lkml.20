Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373203;
	b=HceWyWr8OA1yBC+0zvITSstvJOTg+iv1iOvdzkF+zXLSFvdD3JIXc5NQEZ3uY+u3QnRW
	 oZepQaU4/YQXKNnIaQ1Z6ZokqCpyKqea+tQ/wnQ0EQx5yo2gQetKhkPRnThA1h6gpm6uY
	 bEeMZk/g4DhsplHvQ1ILrd+cqyqyJ/6A/BNQib3K9H/CZf1SjG5RBApEsq7kdkvciuHYO
	 x2lfg6u02bwVLWLwiRdIsasqw8PMNzpfV7SBtCmxkZbf5hw6olwTSn84PUR/g5yAOejhG
	 5p4OxgRl07uhoyVrCZl2KXS7tBwxk+Ccc34z5icRFCeUqXm/Q1lOQlBS5hm3W1zv10A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373203;
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
	b=Ii2e/as54cVndyU+HrMaA7E0bBfgo4qlbaJpX+oU4zo/0xwWLA3bYJN+FB2ZYrwHPsRq
	 1i8ewM7ft9deNHmMCSvVw8bH7SSlMllhMto8Akz3Uc3rUbJukU3wkR2Ol5Yh11smKVz0U
	 5UOHTnVrRZxtdH2KslGnNWJkZq4mb2/n9sbovK4R5tlNZqAmGZiU2D/hMLvpOtouyMPo9
	 k67GXtoGP5/HBs5byRwCOnluZWcywj6RggQ+d1HaAuUizk8wUc5dTY9TE5sYYtYXRxcjy
	 w50Q8HUpSanDNQL9NYPvhdLjR6Kg5LhgYto5il6qmH/K+L2CQdA71Bkv66uEvLo27uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.103
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020103.outbound.protection.outlook.com [52.101.195.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78245606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78245606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fs8qA87q4hcvaLTYPPQfmATrXSUKRqIeyD2fMowNAbNObv4hICQp/R2jzgJuHa5Nhs9NYmrjPxNIMMFz1p+7/usdmdQ7YVLitphk7XN2zW48/a3/76K3g8/YfbC1uCD5jZ0riQgTjHB1wd4cJfMOQXHo2+IkX6Vmm7Pt6ErzbbYlBRb32L2Y1cf9UbFJjyYm7ruorHbleXiLwAJ6Cip8QbtBOislcYLAdOea9aDh/qK7JchgPiefyFCqRzG8SZ20J8zLNRggni14ERegYTMeWI+Dmfzjpwm8Btydjx2QTMG529CLo9jkAvyuOu7h6XtC+4F894OOcUVC8vBmuAZ74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=tfmtiNTJiNvlXI3I8cx7WIcEbcTolYIPf/mdeKO7qlg=;
 b=qVQW8n7uvWA2ZlyWke8lFwod9Mg4deojZLVtihZH40P4qU6IOkujKSCTBcSFluL8WrKpeOQECgPczyxeILgYnWKVqDN2PFZ54APpBIiiS27EXh/ZLXMW09yB28H+Lsx/AEUdGb8pCV+eg1VAdhTgZ+xtbiMcvbv7uE40aCm+FBp6XjiKExexVnbRb85DpZVeZ6TpQYrwt3F6yIOwIrFnJG5QX88Ea43l+lAymvvj+s0UQdITWmxdkcd1b0x6HADgkrRxVUv38B3hCSYrZcekK0JhcZyRMuF7Sp8taQ5NnDdJ+efNARGx1bh0PGYWIXrXwkwY/5SY69B982RIns4MQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6488.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 15:13:20 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 15:13:20 +0000
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
Subject: [PATCH v11 tip/sched/core 2/6] sched/debug: Protect lockless rq->rd access in print_dl_rq()
Date: Fri, 30 Oct 2026 11:13:03 -0400
Message-ID: <20261030151307.768523-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030151307.768523-1-atomlin@atomlin.com>
References: <20261030151307.768523-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:408:141::33) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6186f8-a6fe-4ee7-23aa-08df36985506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|10067099003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3ZrmBKLHfHuYD0VFE1B8QNguUMlkdsf7/QF7vw63NrNLTM4aORPJl3tibBCip/K/8aLIakPRg9mOAFrJvFU9NBblfuxkpfuizWu0A/JtYzlQCQaxP/Sjhnl0g2hSsiWF1G6AynXa9TNrZbRzcbJ1p3clU9pAPfcNHtXzTCobOdKPV6+9b4eo9Lh7D458fwRK6Voymj1cF3D1COPM7rtioljCcg0sPtVVX3pLu5mF4VtZv4lBONM8auAcgWKPItMtoxAYuEfQmsBmeb8mhzR2grfuuD/RY2D8fq1z20WlnF8ZTA0n9u53P4p5o9CRpQ8sqIvPbHJrUzzuCt5TZkoGA9ECreybNsdvYxEZy8KpdD5K9yfKWwpUcb/fgn3K5Z6U3UH7apyA3hxyHthVH1aCHwWeHAF++5BI9nGJkOHmgg13vi8e6183Pi4g99BsILGtAhPpeTlIhqJbU/optQGyG05m0/Vpdv2+E3nYnTRPJetAKfDmiz6kE2+YvdjNl4p6hKkUh2eMKmPS9ffFJv6HQtf4ITJ88tRSxY1Jj+MTDeunsNybzbrIebL+nQioVtqv/dofZittY4CdUgQ8wEE9PYdpfJ01u8E4QIB7Q/E3vw4g7awjsEsYfUzCimzvbwR2SIIDO61c62/5iza2AlD7oOsKTn838s6bgK7nnx98hzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ajfhi9TnPP31nGpEPZFnIpiHcdXz/VpLBOvh4H3iJChTlASrMTMrIACMWdTy?=
 =?us-ascii?Q?TiIliwO+NTTVt5dToXA5LT6lFGAdatG8UoV9ZbDlYB85hFWf6lGgXJpgE+jG?=
 =?us-ascii?Q?Yys1Msj9GGVufm7ZsYI0M+0vaWECt/veErUAxXZcBq65YUGMqjGJqmn70bMv?=
 =?us-ascii?Q?+T3tqdGudCfXO7oyCw9V+S0NnTq6L9E5Iy7ZPNx3KCh9CKcENEHbn2RCmnxV?=
 =?us-ascii?Q?C0B4X8GtBnTxUfMvgdClIJ1GiVjZDCIMZ8cfdxvcVc6rL8bbUXDjlhER9eK3?=
 =?us-ascii?Q?AFm6EX5UDSXc+JxXS3MAqUHuULf4OFqVBz2slfdNMfcoN6OjVKSF2/bJihsb?=
 =?us-ascii?Q?HAbjYQedrjLhR+aHUdXEaVuuzPs1+4k/CZuD07nbExhUChCzSnaH/j7oJscQ?=
 =?us-ascii?Q?qH9VAPGBLqHj5+HO7OK7zx/R0YND6G1OHNPCnH+oR3GPy1FHxMR/A6ydajDm?=
 =?us-ascii?Q?5yCwgqJTcBNy4/iMetw0bo/ioy9j7hQPK++1RilK8HsUG10uRr8lffb3OEv3?=
 =?us-ascii?Q?LQdAExi8tmN4+KvBdom4R+LgHHF80fQW3NAexGNzHD4tEMdGBkG+0zfQkMKt?=
 =?us-ascii?Q?hlpKNGvz3TrExYb3Klg8wMuWw+a0GC3felNpDdz6r/ZaBjzf+IdQv6d1YSJa?=
 =?us-ascii?Q?UE0zp8K2akRdrlxFjj0+gAib7cxcMlzphta+63jn37Rg+RphZOMw2V72cj2E?=
 =?us-ascii?Q?wmCJQ3dt4GI4ptE9NkFiaf8OGf//lVIVl8G5TBPrO0m4VQ6LrfUjFBqwnECf?=
 =?us-ascii?Q?kulpo3/Q5iVKwL16/dw1O6Ry3eX87sVVBN8BFvAmmJZxIDOuCwv0Ti7WRpgB?=
 =?us-ascii?Q?pB/vsVMxxtV9b/Hn9dDz4oQGfRsBRmoPEq0nt1WbzSSlkiCNHAsM93rGVPci?=
 =?us-ascii?Q?wZvuccAf9OACiz44AtOViFQcNb/3ntOPgGqpqfj0NCu9fz44bPiusrkZX3RK?=
 =?us-ascii?Q?6IFKUQvgiMMTCP6Is+wjNJ/pMsGD0+I4ry/QtFeCn97xNYAKLli0y2cy6GjR?=
 =?us-ascii?Q?higLKv5RIwsM7tQ+X+OcNrqnMNaW5TteoXoH/+BfQeBpDeCr7Rup4gFfBbaE?=
 =?us-ascii?Q?AQyhxI+uj134Dv7Mr0eYn/co1lkrSGeRxmfNoX5NCiOdDb+mPcxLvUluw01w?=
 =?us-ascii?Q?Zh983CmX0iUDkiYQD8YpnjAyA6YwxD+QoJa2YPl8RSLltofBWADOdcYq7clg?=
 =?us-ascii?Q?zp6COcHdEYO25L7oDAc2Su8uRfIhlvaQtYshzKRJ0dfDFpqO86PlhevfpmAp?=
 =?us-ascii?Q?LNTfFgK9rudgA28MGNDM5zGFAxkhvUVX73QaaWgJQQoa1XWOyuEtXlU+0r70?=
 =?us-ascii?Q?ocgvuQS5zQLZBT9AbEnJBDiACggjuUprZYa6wIqfdyXbJ7nVR5CMoDqvvN/1?=
 =?us-ascii?Q?F26EAcheOWqXnJ2dnXT+v0H0PL8IrIjhUPCh31aDCyhUyUhwAaAfVBrqiKu8?=
 =?us-ascii?Q?rSp/MjLT8dRqlqAePCEnCO8F5FmAiH1z00+C+8vssDFQ83l7azA3M95QCtum?=
 =?us-ascii?Q?Ejpf0PJ/XfAW8Z2AvivaUmyeWnv1mn3trifco1i3DYjO55Mg7jnPY7Wr5i7M?=
 =?us-ascii?Q?DMmMJDFM71JVIFtaH8GEDJSpULyuj8wZEgNRClKZpbg1jcxiYfn5W5uvwLYp?=
 =?us-ascii?Q?AcbXTSXEwQ7fHZgzHm/RpGQ+DE97P7B/VBebLO4DapHo4sOugPMxOP3huZ0h?=
 =?us-ascii?Q?NjWPKPE2JVFsNNLHm1QbzpPfGb/hBeS84RPyO8y+l35OXuancuzUUlG9vaRc?=
 =?us-ascii?Q?0dck7hNnQw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6186f8-a6fe-4ee7-23aa-08df36985506
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:13:20.0381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQod9pG9kh1SPdfw4L0pjcpQudkPKOGQSF7WLrBV2NegYhneEqz8J7mJ1MAMN8zpoXooT7XEW4bIf+m7PgNbgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6488

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

