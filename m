Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792837420;
	b=M4uVYBWZt9ok2gGHugMJgBOM55e/dxZ1V9S90+9nT6S2S+tignTZL8MkfZ0+RHFqMijV
	 zK5DrKj+cpsnYkWQJaJja5oguEXKRiuMr2tpy4CSwI96yl2UKur6CmWaXAyif01T4PF3B
	 EG9lEpcL2NWOrvtV+RkIBpXa8kLgGb9kQ4JO0gQcEvRCvN5w2H3NjyU5h13urv2AYB5Rs
	 Y7K2+V1bGkpGCII4zBq2aJI0cYy9/1JlrQIyAg3FdPgsi9lepmvNkZeGNil+ruqT5hfTl
	 N3VlajdCyDGR2FooCelYH+F9aYbAE9rw3bWVUn6c/GR+LvhnBTwN2yUPV3uBRK8P/Dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837420;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TbCEow2O8VGFNHD5Y/GZ2GktLmezYxf1GhNtTR4aPrY=;
	b=kWSjUPaTz9yoYk6eQz4rA9b8idUIvBCe/2kqc22iEZHyIKFEtLP8WPmcxn7YjCsiatgm
	 +vSYNg0ajFIpYQpFvmy1t0McUxhYOS04u792b/dQVu25gQw9Sm3B2PQ+AL+NZmg586dkc
	 Bngii1d4HT7N20jHrFsu5R5A2L0qlWyXReS9c1wCesHr2GRjhgfehnZZwgb/frQheitvC
	 yrN8WskG4XgV3QaAT9DkMX8TJfHqpgEyKk0DBd/cVgEDv4nhTA17TyJmXX5jmbTbaqfc+
	 rPjELsHHekaDthQaNWh4Rnnrwir6aAqfKPEoIHcui2mX6ajtQoN5cYmOOUw3hzDPNcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.co.uk;
	spf=pass smtp.mailfrom=hotmail.co.uk;
	dkim=pass header.d=HOTMAIL.CO.UK header.i=@HOTMAIL.CO.UK header.a=rsa-sha256 header.s=selector1 header.b=IGPV0P0C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.22
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010022.outbound.protection.outlook.com [52.103.32.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F5C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F5C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=HOTMAIL.CO.UK header.i=@HOTMAIL.CO.UK header.a=rsa-sha256 header.s=selector1 header.b=IGPV0P0C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIUgNDAG9Hce/t9niESbWeBSrmiAXo+k1/Vv2w15xPFQ08zo8J5GMSt6JQV/VtSYmXjVNMpnpGnh1TI22TksbxJDOsc+MYWjMZYrPzC0krkQ0XpGY+xhZYeX7fyog7le82vy9MWwIitilCY/puPIuLEubzHo1b7W/BlJjpIvvC7Vtm+obhNJGE12A/uDIYFYjEVUL0ijDP0fJHrp/d14lL3XffvZVzEr4WNsy9wKFqokLXAyWNv4wVbYcRZ7YSxgCmIO6SZD6s94ZQUU1nugWICHfSSl+HlK+aDB1pFdipNVyhngh9DDeJG7+Wk2p+OSvDzIV3anRnHCYeBSD35x1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbCEow2O8VGFNHD5Y/GZ2GktLmezYxf1GhNtTR4aPrY=;
 b=WCXFZgnKwYkG4ZdnvMvXc0Q/zncXvbly2elbUenixXqAUwQIGqjywbbI6t0JRYF8/K30xxardUIdrqyWJXyK7VyNFRAXBBoswt/5vWCxP9N+ZWaYvDNj++NZ/C21eUCDf3n3Nh/T0g2biekvHo+xEqMg5ObvuzEZeAjaBZSv9+bofV92rT3PkjT0QY4XFK0pfQIDsGI4FqkN5hk5yju5PmgehmnILsABL066GE3C3uqQn0sqZKXNjt6J1CihGDDOlb1yBbap+JCz2xr6X1V4lF2SCg/sh/CZmC/ekbJo2TQVhCdKVehs5x8rwg9PbX+S19FW+jIwyzcxTS5YxdZ/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HOTMAIL.CO.UK;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbCEow2O8VGFNHD5Y/GZ2GktLmezYxf1GhNtTR4aPrY=;
 b=IGPV0P0Cb09i3y/jXeqZXRmA2lHoi5/+xVppHcxPIt3EoTgJPQrvTbupeNzsLQPeh8D26RKn+FDlc3x1x8hejzZBnIQ/+Co2xg8uG53SOWrBmzLsZTZWT1DRvBKD0x8onKUAPa7UN/DNFfObF/xRga8xS5Eqs4tiZTn5vRJyium50f6/Yh5EPcuXdV+as9MbD5BmyG+rAIhykFWLZaAC6q/YS69YdiWhlfz+Cd1OUhXs7Ew32qTAUQhG3p0+WHsx95NsmogNxndA1jDXNahq5YpwtYjz4k1acNVOxfCXd1Vf7W+mdJOhFA7pcUWkxX1lJfn8kZ/LYJlmdvDXH3AfxA==
Received: from AS8P251MB0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:344::22)
 by AM7PPF8E10BE15B.EURP251.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::862) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Sat, 24 Oct
 2026 10:23:38 +0000
Received: from AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
 ([fe80::2952:d4d0:4ba:8352]) by AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
 ([fe80::2952:d4d0:4ba:8352%3]) with mapi id 15.21.0546.021; Sat, 24 Oct 2026
 10:23:37 +0000
From: Aamir Ahmed <elb12345@hotmail.co.uk>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: rostedt@goodmis.org,
	dietmar.eggemann@arm.com,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	mkoutny@suse.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/rt: Fix NULL pointer dereference in task_is_throttled_rt()
Date: Sat, 24 Oct 2026 11:23:36 +0100
Message-ID:
 <AS8P251MB000128A749C33C6B0758F934C8632@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::9) To AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:344::22)
X-Microsoft-Original-Message-ID:
 <20261024102336.10984-1-elb12345@hotmail.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P251MB0001:EE_|AM7PPF8E10BE15B:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ac137e-307d-4e23-e8c4-08df31b8ddde
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|39105399006|260925184616899003|4140399003|25010399006|5062599005|12121999013|37011999003|25031999004|8060799015|19110799012|5072599009|15080799012|23021999003|24021099003|55001999006|40105399003|41105399003|18071099003|3412199025|440099028|26104999009;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q0iLtk2HQ0HzoYJjocuGZEg98veemPiXil/tv1vTfJp1b7YQLj2k38oT8sYt?=
 =?us-ascii?Q?vPoiwHd/VbwktS6YMf85E3OIlz3eQzulIRvzZJff6kx/7MmPgySkPvm+Voqy?=
 =?us-ascii?Q?54UZZ9g6hkrfLYZzXItSKqAmivFVHHfsAXdRkRWS+LYUcfRp7fAf5W0fMJTL?=
 =?us-ascii?Q?T78lTvhge7E3CJXgE9qRlcZ9DFBTlG+hth9MjUnwqiXuNoFjwPzvWA8GENJL?=
 =?us-ascii?Q?4K9L4eelteXAcvU+XpWz87EDZd6j3W+j/Nma71qMeMCuXvzaTxfQ8CS1UdEK?=
 =?us-ascii?Q?DflQc0Z3TOIwMh/J1LjjRAM07vwF3XHcXl3vwDPbmqx0xu1iiuQC544BGBDq?=
 =?us-ascii?Q?2OR7hKiLKKnbFaEsZm8f10RJ6SM1Xl/jGoQp5cCYxzbKRI3h/dJwu6uG7UIt?=
 =?us-ascii?Q?oL0x35UMOgGFolnC/IZjRR5CWRhmsOWt8iZpDihy39yIF9HJNN4MqnddaTIZ?=
 =?us-ascii?Q?6ggKQAlbS/Ika3O75CbUtwln9sbuYVE1oihi+X4r3zpPPmK44dtweN6mYtFA?=
 =?us-ascii?Q?eHIEjy5z7Dq0Ar+IvKiGyYWSg3tAEX1nwrB+Zbwx169Z7/R5vSJe5mDcjE0h?=
 =?us-ascii?Q?dystiZraujYPcXcWZYqNM3WhpB90bXHf4hORTygzEFt5HAOIDlilW3nGQHDy?=
 =?us-ascii?Q?J6au5ZFGt7//TvEij5r0KzOYv1DLXTtpdBulMLkWFE0O1szclPP6VtyRnbnO?=
 =?us-ascii?Q?L3XVry1xI4kDudwAtdw4VJrdslPXGgqSsxC57kSOt8Pt+zEJrWkDI8iOvVyE?=
 =?us-ascii?Q?pGAJHFT8/x1xlFPzFrM5744xQQunbekGxsUkSFFu63n3PaL4CJckOfB4NGpS?=
 =?us-ascii?Q?Nkr1TR7l4LPwO2YyzG9BtCjK660y+Om5cc2IZ5ErfudZJXAVp5fZpx3FAlhN?=
 =?us-ascii?Q?4vdyzUCynLogH8zmy7DzGwbP2aHoKd3ux0jtY7d/EwVU/c7WrH+2EFuZ2aAW?=
 =?us-ascii?Q?doEET67av4Jfb0MKA06lVmGotww/GpNDIDUKNseskYgyQGTCL7DKm6b4IL4k?=
 =?us-ascii?Q?QWAmvDtSCvwIRRleD2krOz9rm+g0FQ++wnqaziiaPHotmTb7+w+CuuO4MOtK?=
 =?us-ascii?Q?Evv1Q92djWv0ocdJtVSmAD06c82DxLAOlwCeLnC/ONoZF6W8K8GH14xhVhup?=
 =?us-ascii?Q?DtNWCC1Ru7Nf6n22Pd4UWpRydd2ErQkhzg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TTcRWct6OUxDPcuXr++g7yQ39O5Z2XtmqmOA3kSoVnzPeGqKyGYrl7nQypwc?=
 =?us-ascii?Q?9XEfSKD7atBawNfzUwimiwoOznQQPN3c6Bhs6H6TGjcRF6cyh9gP+yvC2phK?=
 =?us-ascii?Q?pKIOPcuxVchi/51SMi/9z28RV5FQhj/lY1HTes7C3dwXagYaRFXygptujYEw?=
 =?us-ascii?Q?wmkh6tEM3BGQsYTfHETJdseknHk6UVJD6ooRuRlYngDE/Ms/x3bWHPRFyXhA?=
 =?us-ascii?Q?amnQxSDg0cl1lzw95JvVxRLUYmaaJMOnqw5qZKu2iFmP7Wwxtp2dwcjXeWaB?=
 =?us-ascii?Q?FMsbuk/LRJZeTCleFvua+kRV+ALoqWeFKbGN/5gOT2+pX6Pip1yBJEkOE2MD?=
 =?us-ascii?Q?bZ4RIId+FdeK94I7E1EUYCC5HPhrCRZ1ZAlhfgrgat82N7zbUpO2OgBiDWDO?=
 =?us-ascii?Q?DJoQX1Pampr1K64ia79uWEaQ5uw1JnQMrud1/ZT+N/CnXjukPr+8/wAmoYFo?=
 =?us-ascii?Q?5BXq9ICPdzgIhc4AwEY/PUXcIKwMgxKZ8C8FAQKypLy6ld69j6/P8Vu4eOwa?=
 =?us-ascii?Q?dDw3QO7H43QQe+V2565+7XcSCtA6hPFPrH5U6rHCNGjYLf09R3szbDoFXywo?=
 =?us-ascii?Q?utGbnoYlMiufB5zBN4P3y66XswGVQurWxXWVUCL/FUKOVP1EHnbZT/a0GwwA?=
 =?us-ascii?Q?oIwly2DwMmiCpfmFPUOZyKSstudlwNuGn2QJeg6c/ttaU1dP88Y23P2AHwxA?=
 =?us-ascii?Q?/1nHpYqO+tY+FPFk2kUWfLL716awWhwGU0TIVLX4dwT88WCvGuLZXrlR1pT3?=
 =?us-ascii?Q?GWCfsGiVNHwxgP6uCmmUBK1z5LFg8T+0spXfALIpIQhH3RT5SPbgcgpmAv/R?=
 =?us-ascii?Q?ZJQHdOG1V8a8qgRRuSb6E4WLtfRMGTXc2XpTpTurBHmjwV4/tE0q5lkURrMM?=
 =?us-ascii?Q?y44CGh9WSNUxNk8FQSBi7UQ+XRJtL6NuPCFSygn6wZUjqdOXraluYySMC0kT?=
 =?us-ascii?Q?WQqa/Z2eseEsdmO0UwoYPWB6Ot3ef6JDeqeAN+JGpGUia0YCVVMRlmZIFRC8?=
 =?us-ascii?Q?NnVGK7ozZgEbw5MtWRwD1WaBdTB1FVHUT1uPTfF7+bhVtVYq4E9Tz+XrSHMm?=
 =?us-ascii?Q?7B6AiqLU1PW2nSeRCJxvO2mX7Vz33H3Sl76OThTzr1eU+nq2ecrjGq8c8i2a?=
 =?us-ascii?Q?VTYupq4kWGokVFZQbeXshUERG8tZhdp//Bp5CvO3fX1TnMHp6rhl/tx+Gc+t?=
 =?us-ascii?Q?TLlPFIVCj41fBTkL5kjRDe9ogYXjdAR94xQVWcG20/ONVz7+naQ1f9Zqr6Fl?=
 =?us-ascii?Q?IqGn7FWUossbGLYy27M4dbMT8j53S6yP00gNFQhIaxEFLugiQRMl/5S39JIQ?=
 =?us-ascii?Q?qY6dD3m7sgGMzIQarHaSY59es3Ad40uo/bIF8zJ9gQHiaO5+IPkd3l/9tXeg?=
 =?us-ascii?Q?DaMICChZhU67/Y2e5848qN4HjgXdjE7Tsbp402B+5kj2EDiBsAozcCz/45n6?=
 =?us-ascii?Q?E+jaaEL7wKCL3KJk8AiR3v9e02WqbHw+?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-fe3f5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ac137e-307d-4e23-e8c4-08df31b8ddde
X-MS-Exchange-CrossTenant-AuthSource: AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 10:23:37.8895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF8E10BE15B

When CONFIG_RT_GROUP_SCHED=y but RT group scheduling is disabled at
runtime (rt_group_sched=0 or CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED=y),
alloc_rt_sched_group() returns early and leaves tg->rt_rq == NULL for
non-root task groups; all RT entities are queued on the root rt_rq
instead (see set_task_rq()).

task_is_throttled_rt() still dereferences task_group(p)->rt_rq[cpu]
unconditionally, and the following WARN_ON() dereferences the result
again. With CONFIG_SCHED_CORE=y it is called for cookie-matched tasks
from sched_core_find()/sched_core_next() (pick, balance and steal
paths), so an RT task with a core cookie in a non-root cpu cgroup
oopses with the rq lock held.

Use the root rt_rq when RT group scheduling is disabled, matching
set_task_rq() and the !CONFIG_RT_GROUP_SCHED case, and drop the
WARN_ON() as it no longer checks anything.

Fixes: d6809c2f606c ("sched: Do not construct nor expose RT_GROUP_SCHED structures if disabled")
Signed-off-by: Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: stable@vger.kernel.org # v6.16+
---
 kernel/sched/rt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ff..87ea11b9194f 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2592,8 +2592,14 @@ static int task_is_throttled_rt(struct task_struct *p, int cpu)
 	struct rt_rq *rt_rq;
 
 #ifdef CONFIG_RT_GROUP_SCHED // XXX maybe add task_rt_rq(), see also sched_rt_period_rt_rq
-	rt_rq = task_group(p)->rt_rq[cpu];
-	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
+	/*
+	 * With RT group scheduling disabled at runtime, non-root task
+	 * groups have no rt_rq; all RT tasks live on the root rt_rq.
+	 */
+	if (rt_group_sched_enabled())
+		rt_rq = task_group(p)->rt_rq[cpu];
+	else
+		rt_rq = &cpu_rq(cpu)->rt;
 #else
 	rt_rq = &cpu_rq(cpu)->rt;
 #endif
-- 
2.55.0

