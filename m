Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.78
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793324315;
	b=DucNiWix4nioJ+HzAoWkhnclq0HmRlh81mt8DM/gtoHLXFHVSYowDAv0IrbN+tM3GbrP
	 U5F1W/FrhkYilJxKl2cUrSuikVQOYismePneKv/AfGRA1g9XmN0aUPnV6AQ2pXRDQWi7m
	 vgNfKe3MauV0BnKyI3gXfZ9BBolyVUCjTnRd1RvmcLNrpMW0GIvqHTfqovbci5s0zF1IC
	 FRRdw7Ljgfd8atLCCtDRA9dsk0v0h4uhM+QvKABX+CjFmaEa9TEbJM4WzBA4JowWE0nVj
	 PyGCtpLf+Jp6t2cXmBh5AdM2w35ED4izB8+AJzuft07htSE9+lAIfSdbqiSRIB8jWxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324315;
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
	b=Ja4zvlstr7oa4lLuiyImRQujub+/GourYg0FF+1wahENRlObPqB+Pc0o2ZSIue3cuHCn
	 iD6WWpo+wBS+RZiAk7AOFL3PBMaOSmBlw3SaKGGlM1MIc4fjSl9wgt3O6tJa4EYLInJBa
	 D1JMdE9U/Yw/3sdrcyePFQxbSuDj5Lar+92I/MzlXej/q6aDfj1o8TC98OO7BQdixwG9k
	 IculG+5b3qhxXF37K5Kx24ux+ElujfKUquQ8DrGJN7RDQ3ahogcgNF/T5rje/WwBWamJF
	 6vieMONPFklUaWn1n8XbK5m+9maPjdlj+3DyyIpvWhCIa4SyDcdJq07Wx+Ei+ZRMiCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.78
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020078.outbound.protection.outlook.com [52.101.196.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83455606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83455606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Adv9H6/nndsLqfM+oXxKgyiGrqBhbgItL/vhXemPuvKK7mRwvmvr9mcOjv/Io09JZAzuTD7dlnfQxecLEVM85MSBi+sfun+O9fJ4AfgaJhhe5XnE/5s9fr7KaqY+yej36OyUguLN1B0FGwyC3gsgj1miBv6rlxk39ImKgrO2qp4LxdpxTew8ukHPGvj8Z9gDc+5u6oRqRP2swQIh6/mFt+EcFlehSYQHkzpCAA7UhION8f2BHC/fHE92kIiV77fhDJx0Xmrh/LuKf03HLjkzwEUIyOA8C2tzoacCVVBzH4WJ/GSlTVstXXL+5pB5NC+L9OIBUQkio/caovFF8FfMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=iY3nlyRKS+8HJoPlIzzBqQeD2/NJ3c+dEhFMzgBBQ/M=;
 b=ep7WOm7SsiSshB0tOOlKanJs08jyp3YcL3eAPueEmXGF7o26t70wUjEklhtO41bK4JBuHbwQ+YBrIunYivgokCX6+PmLDIFtlQ5XLzavMuwXkT0wfW4nMAqfQjL63JAcdgYVU5fMGvB1HIOdEcDbCRFvQdOG5kERwQhiruO/HQ8dO0RoCfKGWGz2eHYG9mxGAauVdpeCF1cqDDC25xRP5dyR66BHsZ2vLmr7ZqOe4WvANw5EHoAh779iouoQs2HReCrgkN6Y0eUpAyW+Zf/pdi/kCIcmyUmoY89SYcAU067jOYT0yWIlHe6pz6mICqXZF6cp09xw4iD7v9mnmS6KkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6323.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 01:38:32 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 01:38:32 +0000
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
Subject: [PATCH v10 tip/sched/core 3/6] sched/debug: Protect lockless rq->curr access in print_cpu()
Date: Thu, 29 Oct 2026 21:38:14 -0400
Message-ID: <20261030013817.753804-4-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030013817.753804-1-atomlin@atomlin.com>
References: <20261030013817.753804-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0978.namprd03.prod.outlook.com
 (2603:10b6:408:109::23) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: c5f412c4-3105-4d6d-c51e-08df362681c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KUI8A9gRaGDVMMRuSW2ONOlZ24NIHiYeMWcbDTCZxJsgb62CYlop+E3EdOZvb9mJ9+QBddvravTLLcEYOOueAxVI/HcBjOkHFesAVKov/MMcBEruobETo0TNdgULt1aLmmQYFZfyqMAAxrWb5hePLwiC0nsqC+M776S7BpGPksaoCqTMfGTrg4oLE2mlynEKyBZ+tXVCYjT0Pb/w4LKoG80NGlP0r/bTXCmI7nRhkJ9XcLnyE8sT8zJpiG9tHbkyx8/XoQc+pOAuDJKf6lW4dWGpjdNW3M4covBff9nNx8j89JZ8jj9hm7hbiLs3pbVwVlrqRa4ucUEmwlne0tenWza1kmt2ExAii7oqhXK38WWXG6YTENrWJl74alFXXS9MdLEvBOIshBuLdztg++GVGitlaQdUPhy6AEPyDMCeu6iTf+GYqtXYUL6/55sRW3FRQirZQXokNoMB7DmrBXzMS1mVfU0/RRV9OpG/njuFBulqja2LT+TQYXgXg3XcTjWbXaQBjATJrU++x0agIDQ8v5BkOLcgLQ+IQnu/3FJmVDjCVpAM6mYhRrRqCSlEH8GgCNDCuAhqidsmt7ybxQamJEjv+GG0E23O0zQMP/2fv/srNKLePnDJQk5pX+7BJ9BKQheK49idBG2C+2pzrvC24038nCBMKK++7rIyDkpDZ8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HEsCqGC9nYmUXIwz9iDBpeSdfYiT4XlhAdG/LiqwfCWYby9dtnbPrY/O95ql?=
 =?us-ascii?Q?B9+8dUrWjHZZJD6JC28p57fdSoZ2T1DbLA9ftCBo/ors+UFVb4/KJUll+1RM?=
 =?us-ascii?Q?2cvgD86He7qNmheU+1HILVi/Okpf53ucWMgvcs95VaQAKmeL0e6VKBas5/3F?=
 =?us-ascii?Q?uxwChwr/VpzzdsSKA5vFFxVn9lGMc5+qP7xQG4RCEVNPMVP+RmpXjwg44Z/f?=
 =?us-ascii?Q?O4wh7Pa4tICrvVEv7ss91fkieBVfH8qug1Df7TM7eosDqfNyfkrnDGzTHYbj?=
 =?us-ascii?Q?8bM8DPGwkh2fKJEL0vQik5JfcBj9D2OjctD14ck/QoEdFfUkQoNihqk06S1y?=
 =?us-ascii?Q?RZnPQ70sjMuwHPGXsH3JGwLXZIM4xw5nfC7JaoNMd942ZFM7Tr2q1n3t3vjj?=
 =?us-ascii?Q?vt6QDZe/ap1iMwkQSGI8UP/9XlXdqxGQLqCDNKupprM6l3auX+N76zP21bOb?=
 =?us-ascii?Q?ITMmc4ZGXT8aQIi5c8/Iu5EmboKDlELSjLP+nE/t0ATkE4u66aybTnh9lgTm?=
 =?us-ascii?Q?EMKsDMGwQrCD1dZjQwsUgCyl7wU5HaS++baSpZPn6BTG2ZZeOBY47r0wh7bI?=
 =?us-ascii?Q?ahztybpjfi2R6cb79uxUPZLIbt0G6if2Ss7W1T2C6INIk0oS54Q9M+To6erp?=
 =?us-ascii?Q?Hqihc0rsTodGLrPIsLXkqDnVfwzsH7lNg2euE6YY3NIcvmKZMaxraZA4FiJQ?=
 =?us-ascii?Q?MVlDJ/vrP5y4dYD+bMaEoI/mpG8lHZpFCvjieoiLp78jtlJSf7XSFWdD75ry?=
 =?us-ascii?Q?GfoZcj2YcPFPkuHOKudJqt6HZFWFPfJLTqlcL0MLX/gRY+l59inr+DdmnSer?=
 =?us-ascii?Q?d/NtfOw5EuC6cRKfgcciG2FQBAgLn776r2rzFMxCFWBfgSoiXvNWRmUx5tIh?=
 =?us-ascii?Q?Ze9ETLKcJVA9E6CKKLYDY4v5KzYpgYPkRtdVfYAA77n8jEIO+fSN0XYMr4UR?=
 =?us-ascii?Q?ZGXvx26SSOKaftHnoGW4h0ajxZCRPeG4KLkJzo2mE14lpOCKgvsEF+OuGTVf?=
 =?us-ascii?Q?QweuGcFIqPEdFSypHtuMM3DdOHH9qcElnsme8bNvUDun4gjHucsosQAMA62d?=
 =?us-ascii?Q?4NTYEnvVe2tAdTncQHkk63gCcXt9vR34xNUIEIeBlhdEORKU1U03TSAgEWYA?=
 =?us-ascii?Q?DmvsoDu7I2Q3TdD/xfJOd6afiKoGVzZyXmMcHjgozbIEoPZTCdUsJ7ys6t1J?=
 =?us-ascii?Q?/SIecVdlUBcrn881GCcWN1lDPmDhf7chcej5Ry4Y0lBvcIHSfDIONfYFD6pJ?=
 =?us-ascii?Q?aQE2fg3hqurUlaAbX4+KIqb7wLyTR6hBKybXIjBLA8oxqIY9RD2Giqs+i8fk?=
 =?us-ascii?Q?ZVnADoULKb6ft4+5VxFvOCIHmBDFGDQbVt4exVCAzzK9OUi3oQBg7WLYKzbj?=
 =?us-ascii?Q?49rkXeAclvKFBrJp+hoRY0MiwhmI3Q+xxt4r9ur5tT6su7Ll4CcWNpFzeAn+?=
 =?us-ascii?Q?z9GK6wfaeIGenPzViu46AorfycwljjCmvgVy1+riADDhX1G2/wIoNQmlLMa3?=
 =?us-ascii?Q?R/jIx6A2ei52XwwcHAwBEOvTBd9pmQGo+RxxHVxaiHErVTBgA0ri92QIxFWJ?=
 =?us-ascii?Q?HNrl4kmwcBRhOmRySV8zlh9Px17bs3p4b5VXNeSsccg7tcQzXHRZlHgTZCv0?=
 =?us-ascii?Q?uEZuY3cK1+hW1IzFPNRfpKZBGkqTHDtw/DOkpVkRVu8/tTbTj05USntpzTt8?=
 =?us-ascii?Q?nZX6gsbDvOyWbuJNDbN51WnoUJoT0icehhs881fAH5QZkOSjmnPa9WkviJsV?=
 =?us-ascii?Q?Lo9SeK/cQw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f412c4-3105-4d6d-c51e-08df362681c8
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 01:38:32.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMRQ/Dtm9m1OXzxdLWcXsCW9Mrf9kKKeO7q/C9q2AQpaqO6kLdZUE8SCXkto9uxnZvGJV/zW7pa+FC9IBXIIUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6323

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

