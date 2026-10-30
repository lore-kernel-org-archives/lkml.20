Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373206;
	b=Ob8oo6Dtg1DH0E1Hf2JFwHiF4ItKEY0N+eTxHdjJeBcc7eeDl9BOi0uwgkfLCHmZHumG
	 P4wHSejaO5BW0RFZLtnaaIN+zdPboqmUiwXqhStUeEaqGmw0mxC8Ygqu79sYgTzOOtPuz
	 +3Q6I+7pi4bdkW+LCJjokYjbc57xyglbjZwsDGzIHxvigVgnjcwbeDQZJt/lCjo84nlkT
	 e05kjc2lsMMcbxZCDSpbX6+lm/QXVXrFDv5NlBXmY31S1IoH0WxMMXvtM1xAjnSw8SRVL
	 UkyIc4LMb7AhpM45Bjs4kjDOcvbkFe5mNfQhJMMp9V2osa5rN+6idl++Ba0S7SkD+WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373206;
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
	b=0qD64sZA5DzxdqlVKH10QtFVvxcTp4FrFjG4lQsOZ9cnc+N6PhLlfYISwEm2lPPf9t8k
	 +XwT40L/8nAXvWXP7afv9BR8d6bb1FhgPhjfO+0McWXhCzH3iIEnh2cPncvXJnPGxfkeA
	 vmb6+Q9LLVsFv0ummPeYaNEQrIPtI12ZvyQpfhdXoUxZD3H67cWCOYS30LmLXLMCv3pFI
	 d44VP5+/sDxTRx8uoxmO+FVHFzxQAeiY4cslMOUE/b05RvRsFMPtTBXN1DRJ6V6LlcGLK
	 RgafxhuGkEr/AgSWqJJgev2pF5BfDzoBzQn26oEJswhfgmQzBlobnod14bf2SwJ2F9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.97
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020097.outbound.protection.outlook.com [52.101.195.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA1606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CA1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTdRwectfagXmzw4/sT6CrqXz35bdrUrbVsSSzZIkIIhVpaKQQMIs3Pw3Ju74niqEDfrOi3LmaZA40BPPUDecsjlgU62t4RUD93O8FPDDS7wHTgrQ1aWS8s3pwJP3YUeROln8wbbIiD+R3cTFT6fq5apWdyeApR7pmlsRl3Rv+wTbONd/oH+ABx0VQ2VPGfDmwtdy7kKUa57uBSDSSf4adXwQwPeM55N55sYycsKBsjJ0HiMCKEPA3xMHpr9UPMyKasGhi7k32iOjrnRQIEkMkH5zk4Cl2vet3ADenagm4f8RtOmsJ8sGibzP4pqL1XLfGC+KyWMpwZQ9dJ2K+/C4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=iY3nlyRKS+8HJoPlIzzBqQeD2/NJ3c+dEhFMzgBBQ/M=;
 b=XS8vl0y/5sECHq8LU1Ch9mgRcipezhzq9Hfe/Ob95VIa65wzmjXeiDpqIhq8Yma8cVr9Sr1bUMmmHuNRYjtGdhLaDompZsyi1aPJeZJWjMcb6HmSBKaxm8aBWZxlyXXoAuYOSu+Dz31QyUskIi34Z8ZwipC6DHOw1bPZdOO03b8rFtB2wfT3ZLTOMHXF4SAC7Q8DxV+XwcZVORoxWfwGAjf7S8LG3mrA32hFJdOMPeMCzm65je3t5UTboiTxIDHbhW+J90C2ewLW7eLYljbWjolPmqNSQjvnQPoNnDLXCp2Wdaqh4/Bxjlhl824wnsZLl2jF4o66dyqS6WPy819Yxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6488.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 15:13:23 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 15:13:23 +0000
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
Subject: [PATCH v11 tip/sched/core 3/6] sched/debug: Protect lockless rq->curr access in print_cpu()
Date: Fri, 30 Oct 2026 11:13:04 -0400
Message-ID: <20261030151307.768523-4-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030151307.768523-1-atomlin@atomlin.com>
References: <20261030151307.768523-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0296.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::31) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 6f3165a1-b29c-4a8c-b6b3-08df3698573a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	c5egmfUGw+I8+9LExAdWv2PNIfYYnw0QIlQNA0czjta1WVDAbzYpdAnG6n91lL9A8OcDvYHfWXbWqrEeKoU2Ly4iyqDnPRYlBAoL7gucXDEoY6hfLqEDuiqhRlqAIGwISDTHvC8HfNqRZU0g5piWgeBj4aryuLFlLWRuJaE9TyY3QnMvASSqLtU8WwgXQwqzAD4b4u/pV9kwGrc2dXlEQuNy8I6DWIP8JJk0ZmbHk6wGxduhKx/5oEXKSqW/F3Gt2KgW1fjd6SSth/KXXgtTzbC1+fwovoBw8molywuAnGYw0DckYfuYfeV9F5hKQJJkNSlm+LOo5pDSjqqAscLABA2VT7yF7kLGLa5rZd+RwyOx8VUFORgLH6dBIllrwuJf9B5ACIek0Rx7FR/DByz9rjEqLrUuM3Yc46gQKhvxthAeKevr5TfOw4gWFWp/P8PL9M800muU3b2fId8Aymm9xjKJKX0nJ5BHtjGrMDYLzoLXOlliFYI/tvkR4OseWKTiB6hZJh6LWzVKOlIR24EeLytuJCnjhT7Ncw+UInqw0+BJ6silPE0vgUvOQS1/Ht/myIKPFBUKA+NiM6f2vmcx514+z6jACIPKhPrqkyvPLpS5Hh5o05b4eWJyTwmDqXXwui2YgPMeATCKHaFdsCJqS92K7TgV0g5ZAJlpVpCgHUM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0v4MSL8L9rXP9u4dWqDEF/s62Cg5K9OJ8kI1g4CvpRuYZnKhWL0ia7PgNLcy?=
 =?us-ascii?Q?DUwAz91LoLvIikAd1Zo0PvX21aBq9QoREoGAqM9pcAr9Dm5VYoyzl/s507/V?=
 =?us-ascii?Q?YdYq0FZtgDsJrrV3TrFhmbOzOCqtD/UOOchgBu3bb76hh0tdg+dbXwrdF4vb?=
 =?us-ascii?Q?3PWpkLVmNEnvc4bWgTQ8HwG4/APqLOIfPgoFSlTWewsISyguebmRcZN1H/E7?=
 =?us-ascii?Q?XBTjSO/0/fSLs+eBTE4QWDABSlyPpvPhADTPSeYpPgN1VqBawoWI/U8zIoZH?=
 =?us-ascii?Q?PN3xarRpKLRT8vQTBxPaF9p9HnuARg6ecJbE9hMW3/pIlTBVme9XblDemBCK?=
 =?us-ascii?Q?18VeRx0++jYDXae9q2JxpR7br0FJzEuQutYwF3VEB4oiNgoQIDmcJrNBkb8K?=
 =?us-ascii?Q?zvtBcJEi0e8nHKd5WOj3yhM6LuQTuak7h+CVJHVd0wCUxRmK2W0nbtL0RgLZ?=
 =?us-ascii?Q?kk0LxqEfrd965hc9DKLVH7pnkhzzqtyfHO2/7I2zVLHoYLBh9AHKBZCojE6Y?=
 =?us-ascii?Q?Mm+5FHhcZgopfvzrMoPBgSKzUyS+uFpwf8o3+Yn5I1XFV1wzyIWJ/geBJeZf?=
 =?us-ascii?Q?zCk+jCDzbHhfl24abG0hTkblzeSlxZl3Ivy51MQCwGPEcZruOtWo7w/H8iyO?=
 =?us-ascii?Q?R+QY/LSD+233oX0vJmZ8U8A0uhg7N9fRu+XF5ZNUkNH/95XfRwpEmUIncQMe?=
 =?us-ascii?Q?9Onffwclp+aaZSme7sFBVKx3ZeBrW+DYVMy33013iw+zqjELI7TaLzg1Tf4n?=
 =?us-ascii?Q?G4BGWLWbESY3hg97jctmvAp1avePFdOlPa3oNFqDdLVlndwdvXaBMRe6xbn7?=
 =?us-ascii?Q?5mdDQQ5T2q3WlNF44P5RNFEo56bA/QNhlZUmwunt/ddgMTZrngd1IV/FkHYk?=
 =?us-ascii?Q?mDYClL6hdXN1C9O8z2Dk1gFi5sMLdOb1m8AVt8/rrXsYt7xCgkPi5afndsYM?=
 =?us-ascii?Q?LZTQWyvs3nVJh4hZ7A58ZLTmtQKxUC0ccRJhDdyW1j9tctL4XgZHJd9CcJne?=
 =?us-ascii?Q?VXctzDUDXcuyTfMv95edKV0BBdo94Wrr2UJvuuOSi4xLgq7RhKX+H0Mrr/V/?=
 =?us-ascii?Q?a+Edn4qjRegyAvGVlR7k+cO4a5Tj6qM0SeysR3qbck7WWvfLah+qwO0jHGi1?=
 =?us-ascii?Q?pkwmDDkcESQkiHmkOIZPFMQFEYg6346vfU1Gv7gNToZOpy0w4f7CPDn2BlO9?=
 =?us-ascii?Q?guVrDez78z/d23Jl7KxhXMFtHtddmBf1j6e1EPteLK7RgeOn5Y3ugodipxn0?=
 =?us-ascii?Q?vbI/AI5C+HzpR8VbS7FgnDEzrjBktTXD7xcUU28UR2M2tWGYC7LTeNEx2ggV?=
 =?us-ascii?Q?33CDgIyiuDWRY8/eCPcur4tGt43N1AEy7v1iIc1lz3TjtYenE8RC432pBMTy?=
 =?us-ascii?Q?djVgCeg8mKz77twGL8Ux048e9W6xl3RwLPWlVli867feA8pIoOtROXj3zGdS?=
 =?us-ascii?Q?xSz+4cc3VJyvMoSvC5nrWjt3F/F9IvtP0RpzM+TWSQIkPHt36KQySUfc/l0F?=
 =?us-ascii?Q?5dc+3Ql/quSu4JSn6QiWq0Frh0qlwZXXF0YH4s622O0VlZzG7bTJhs3qneBr?=
 =?us-ascii?Q?cVOpn6U6d4zwwqDZMVtXqpHSNLZdry2iVkTxa5PJtckLc35AzZrDxzmYD3rJ?=
 =?us-ascii?Q?tuuiOj1ARhaq4lwmXT13Q5oEl4ziYpmu8YxZhkYLDMei3rCJTeqD/rkkbQLG?=
 =?us-ascii?Q?taMb6sneyM1ECnM7/bdpQMc2WCDQf64orXKUKimUbwynL76GMEGfoZRs7YTL?=
 =?us-ascii?Q?7/FfG2M2jQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3165a1-b29c-4a8c-b6b3-08df3698573a
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:13:23.7284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBKO7Csu7WcwwSphctn81EhBqlcRpmJtrwcHdeTlJsot4cv+agaByvJBbaz3+67DrIQ00fgIX9w5qFxDGHwZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6488

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

