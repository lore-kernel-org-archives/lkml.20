Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280352;
	b=vLJgLNBTLHrm0hQFuk9x/CgutlwXviGjiRm9+08z/8HdJD41+ZHM4ILcx6yCL27qwjIH
	 fZVP9HZoS6EfCedtMgI1zZyqzoTJ8U0iHT9P3iybpTxe+xxi3u2+dQLEu4Yrjn3UOFvCd
	 4CT9gp0/YWZ/yYuG/+xQaRvYctQGI12OscpwkybXXYqE7q/RFDB9IHjV8DfTx8LSINliV
	 VWjfmGZdZYDtpBjJE7/T26BhJF6IVDM7GmyL1ZD4kV8wbHjMuITLZGnLoiHukSTRbWh77
	 1BuoyUnfNgrECR0dUoQ8NeHKHqlrG9SFvg2X69ZexRY9aRLKGdRlskWQ7O4DAigH1pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280352;
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
	bh=iY3nlyRKS+8HJoPlIzzBqQeD2/NJ3c+dEhFMzgBBQ/M=;
	b=LRg8z48lmLPChp8dABVmijAd3DauDsYXi2uK3p5XgDAzFyk+CXjlP8LUME/trxp6/EUD
	 LvGs/Nld64WB/YTAyTuISmuQWAjfq7jbF1K5E8mYolXopc5zwqkAh6/q7Vdj0LAmD88WS
	 RCRmq637w4XMZ6nULhMKLTwGZ05fkdfLhnP0VCxLYjOwlitMQTg1q9po1K9t6gdjg0BSj
	 urHL63UkiYzp+f0+OzXRcscUWKOW0Ptf3pb3NizSx8MH/oiDeB87BAEaNJWx+VoBBKRpI
	 p8QE5jcH9X/twzR14NBJfMP4vQ+buDYJAYmejVRp+KLvMiGbLNb6GjnlIbMRLrSkUjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.111
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022111.outbound.protection.outlook.com [52.101.96.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC34C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC34C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpFL8qp2m3mQsLGoQxLjY3OYBJVqsQmqDey7ZMR314/5ieToyVG+MAjy5nz3rl55D6gHWR+i5I1vRvoekcRGyPy9xBTWzeb1sW+Fg1A4R4vSbrZL94eJ8sgF+yI+D0ur9V6OCDOyR42FsPs+D5aveQZkNKiSZyVwZn09RKooJs9pc9GshqIrAcYsWAfQcZHlzbFquoctE7aJFQsPclh4I1X+xtyxGJm0qx744Q64rozjt1NITCMysY+FJwOCfrOIkAdLk6v2I3CQS5sIy2oJvwsLllZA0Gl9eWygvz+ZujPuZuhfeqdut5dImoqj789XVqvoIQECGjsQXrmIqsA85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=iY3nlyRKS+8HJoPlIzzBqQeD2/NJ3c+dEhFMzgBBQ/M=;
 b=wsujsDSW9xf8n5gvCnUyqHUgvbTdw1t0L71HZb8Oce0GJImUbHZKA1q3NabfrEjEDbKU5sMZMD4rzfwgCumj8+OgTZS6oTmvHLcacplhYZ2QpiX9upA/QpsaI0n80+EXH+Enh1uUjDitX5vHoYS2iU2WyKtPyOzgxqC1WXNu2DeKhMNwgNKbV3Q+13Q2Fh3iCRhq+Et3biC3bIvNQDg5nlpY3M7HVZVKSNtVfdueiJL+uSAsXxG0ryG7z3UrVVdz4rBDY9enbL7NoKimD7K2JRndRIzlIYFF5z3itOvnX8/5DXmMhk39iSNygvY6mywQ/x2I3nwuRNFEXVOwSBRhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO8P123MB7811.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:25:47 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:25:46 +0000
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
Subject: [RESEND PATCH v9 tip/sched/core 3/6] sched/debug: Protect lockless rq->curr access in print_cpu()
Date: Thu, 29 Oct 2026 09:25:08 -0400
Message-ID: <20261029132511.712391-4-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029132511.712391-1-atomlin@atomlin.com>
References: <20261029132511.712391-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ROAP284CA0104.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:41::7)
 To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
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
X-MS-Office365-Filtering-Correlation-Id: b53d8969-55ed-4075-9d7b-08df35c02441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|56012099006|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|10067099003|261021121427099003|261022105027099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qlC/RiqyXc839dwyGV5YZQjOdslzbW7RsA5NeRYGgW4xVvgADDN3osGVUA2KQpqITvhL5/EOUbRsIK+bONpOmqgGFunrO54pjBmrAe1kEbCXUWHyW4ld+AHNeOIQAUyZ/UIBPCH0qxnuRKC1T5tdHtdE6c0wynJ+TnCx0tcA+hp8nH/e6fxrX2DUk8WSGk/3/Lb7xX0tfn2KWZrKT8OXjacJYHssB5Zj6y4vvEro2y2HQjKvxlEyN/SO4m03Qe3V7+27jHEWiWtnq8XkhUMNtqqTfYMLplrlrBXkEIYdwLFFeW6woS0m7OLMBz+SOC/A9YW7atGiL6QWq56Nuj3YlSiZARyqwtqOPWVtHSw67apHwPLzOpYBtUQyTSKFvzshny6Le4RKatkW8r2ZRT3tOVpJaTfN1i4yJObO+2lqF2KLwCNi/ffSSgdEQ0g8OzLiwyYxXYqD5+uZNo0JcxDyg3M3bhU3rvfJjJvzsrZMUlrJ8ODfAy4KDIz8w5MneJ0dM5WvoJ42c58uzzQEjH+IRWBbxseKO4OUzHmj8krn9gQaBeGvNl/khd2JyDIB1WWb6yaSbWPryI8ltbqS0DxZ5jUssi1QZT0UNY8OIOlmwG5MB50EXDdxJHZHgVhxpTxUG1VUeGUW6a7/cuZNDx8UYL2kU4ieGf49iWbo9wZXlhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(261021121427099003)(261022105027099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MJHD4O1GGgmW9zuJIhkWJr25IitXvLdEzw1g0gh89MEaB2QwvOef9c2pl5fu?=
 =?us-ascii?Q?DAJrzQALQxWJZxR4vT0pbAhr8IekO1sgpGbYPHa4EIk3TpvRQl4tG89japaX?=
 =?us-ascii?Q?y08+zwlTzhc+4nqI99AhcuJmEpFwOlqQccwyn/2mSXiaRE4G3nvJtPptZY+G?=
 =?us-ascii?Q?t/Wn8RUkP96XOonfSphhy6v+76zZ3csnSSUDHpui4Dt0/8nxJPHMOsK9GoDZ?=
 =?us-ascii?Q?zkgr8a5eYC6emyv8UnhTq+WA7Brz4S84shWo0iRTfeJx/uJfHYOEb/GbLwUd?=
 =?us-ascii?Q?2ueUl+U30VHaUdpDB0sgRaU7H0R4GxLMKGpo6C18iqpb3owIeMjF53d9IhD5?=
 =?us-ascii?Q?LXEoW/CEeVyISbCW8NUJ2fP5F+mQmY07BXsUZR1xZ6KYYasCnff7BH1OQW9g?=
 =?us-ascii?Q?0ddyVXYa5DiUrE/B+yF//rDrZOcGDkqdLkSWwnS0oyRsPwyuWPPYV+0B8bWL?=
 =?us-ascii?Q?HBRg1xeBXSsPmHJomPKKHGv7OH8Iu/MJFQiexkzEbhRXWz/oalkmzBqAsK11?=
 =?us-ascii?Q?LNFyGwLQUfY4mBAs1MvbboF00vdHrhmXs6sO0dC03sJUTDwBzRQCR7CItL1F?=
 =?us-ascii?Q?XuOBlx9swNGMTCQ2sWqzIefR2+thrNDLlSUS0VXf1/Q7DlV9Q3OrXKR0ILoC?=
 =?us-ascii?Q?K48XzMvfRPEFiPnpmt71cYM6QOiHr0Ls/h298MScQYXKTaB1ncAYhfOklCdF?=
 =?us-ascii?Q?kABiZjRSB6rCCqPZ4vIiS8fKZEcpEI1IW9qrjWJV20sRnp0UTJd3yG28p8Vz?=
 =?us-ascii?Q?HII9K1QClHPexpESFcTN+I55XqrR9/OQBmbBmdvgBbLQoka3L6HsZEWkM9uN?=
 =?us-ascii?Q?QgOwUlQEoubA41zZtWmxQLkQgDQorTM5GWIKjS9aTOkQEtbRJdb3mbImzEdB?=
 =?us-ascii?Q?8n1CY0AHZyhMukFpbDDpHPzJ7yS9Y84M98L0pyYatqCtMQ8pAzPPnNqcVKnH?=
 =?us-ascii?Q?bmRaYf/r7+kb1MO0zA9dL3XkFULFrat2BUx5ErL/C5WNd8auRIEhhpsN/UQT?=
 =?us-ascii?Q?TNPHjMq5n/AFfnjpgbbD8Prq9ADs3Gd1ub7iJq1M7sOi8ZPvc7pB0n1AcTmD?=
 =?us-ascii?Q?ZYZYdodPz/EvkCPb4V4cih2+qDw8lj9XTuDxUbvWtOLI9Du6EYPyJ+SjBed8?=
 =?us-ascii?Q?3kQ/yimgbkDA4lLWcR8B0uRDs1MtDLihy1wInlghYkAUDupyvQfZC0xcOHiJ?=
 =?us-ascii?Q?0XAjj+L7H3052W+ipRFbpsg32un6o+GsnGtmEfiwZBoghJoxO80DnneWQIca?=
 =?us-ascii?Q?xl1JKxFeMyZcxjc52Vd0Eck+rtJb6xZb2VYoZEkgq6mqiBy+tjZwulEYq5QF?=
 =?us-ascii?Q?ZdECMd/AsuHL3LPt43j5gFZqWkO6xLcDMptfieoOEb/m6gJu70DyWpg5e8Pq?=
 =?us-ascii?Q?db4HldzV15wSTT8mxoGUNTDm0g39S7q4Cmvl5wYDRQioQbAzHzB8/YR3q8fA?=
 =?us-ascii?Q?koLDUoYKL/vhzYdPQspXPVli5/djJXRFdrkg1J22BWVlzlrH41o3Ae/y0ExB?=
 =?us-ascii?Q?0P83nhN0kE17HS6bES6y9sUpH195eZqKL5vEEwHgw6YeTlpthURoOJh0vNEW?=
 =?us-ascii?Q?i8O3t2zWaH3G61l7Oo6on/t3DLYU0ISRvUk1aomqFA0KebUMDYMk3bYUZy33?=
 =?us-ascii?Q?KHzGBezTNxinmF/7l+txMvGldE9M/B20kedgLjRxs1kiv3/nybm+JewLAK0O?=
 =?us-ascii?Q?6q13IASPfGXTuNR9ClL6OocmWhYRWR5KTBwQvtZrdoPMX2BdXCP/NrVTd9Lm?=
 =?us-ascii?Q?sVfRB+NPmg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53d8969-55ed-4075-9d7b-08df35c02441
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:25:46.9319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQn9+LPFPndhq7I8ZWZhuDRRE5S3R5AEmQI7Kg+rhIrFmLVcl9gcGgVKLee1VRRMxrc8bm64o999b6T60yHM6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7811

In print_cpu(), rq->curr is dereferenced locklessly to print the current
task's PID via task_pid_nr(rq->curr).

While accessing /sys/kernel/debug/sched/debug is inherently best-effort
only; rq->curr is indeed expected to change dynamically while
print_cpu() is executing. However, if the task currently running on the
CPU exits concurrently and its reference count drops to zero,
put_task_struct() calls call_rcu() to schedule
__put_task_struct_rcu_cb(). Because print_cpu() does not hold the RCU
read lock while dereferencing rq->curr, an RCU grace period can complete
concurrently and free the task structure via free_task(), creating a
potential use-after-free race condition.

Resolve this by reading rq->curr using rcu_dereference(rq->curr) inside an
RCU read-side critical section. Holding the RCU read lock delays the
invocation of __put_task_struct_rcu_cb() until after rcu_read_unlock(),
ensuring that the struct task_struct memory remains valid while being
accessed.

Fixes: 02968ccf7b80 ("sched: add /proc/sched_debug file")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 439e59bc1fe4..be886ede0a1d 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1204,7 +1204,10 @@ do {									\
 	P(nr_switches);
 	P(nr_uninterruptible);
 	PN(next_balance);
-	SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid", (long)(task_pid_nr(rq->curr)));
+	rcu_read_lock();
+	SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid",
+		   (long)(task_pid_nr(rcu_dereference(rq->curr))));
+	rcu_read_unlock();
 	PN(clock);
 	PN(clock_task);
 #undef P
-- 
2.55.0

