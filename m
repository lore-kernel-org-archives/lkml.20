Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021140.outbound.protection.outlook.com [52.101.100.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95591D63F3;
	Thu,  3 Sep 2026 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399585; cv=fail; b=eBRHdKbum/fRkD+wBaYCt4wddNL8XHIl3eVK3ZHfTzuhqnRYLIms3uoQD5BcJ30U0TjJ1iqOhacrlb5XTHq5Zvzaj17FvkYLqMmsQg2wwT/p4L9271CHqArBiNWq0qyZiY/pgOnZ5lJ9zN0yj8aYhsL1Kbgjav1seUEgjQeC/Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399585; c=relaxed/simple;
	bh=ezFZDn+nK4eT6xnu4pbaxxWnX6V0BhOXHsCclREqiRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jqJ870qHlDHFdSZho+M/8xuT4ZRp1+Wjfx8IhOA1EqX9nlxlgHQQ0cgwG2cSR0YRv8HGmaTggBlO7B9qnR9qicfnpR2g8KJ5SOvFY+sOa5VRPCh+qngiR/qYhIzF+KZjMNa3Lg3XmRTyOYag9mcPLCo3/pCA5hG80pQ2aEYPTlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ob8+lj/4vNYYeYVebxat/+rBVQvUI7YyNw5CK32YGXSd6wM65xbOMsbQ2vZUYS3UgQlXgG/npOr6Mh7UrXbo48YhxsjQncFfXxgk8RXDGPsNbgCWD2l7T1BfO0qlFeotjupLkHre/w2yaw4PCLubV59P/ApL2Xoo28zMNMlhOmQk2bhF2J8QiTiEYADESg1HPT1+RhD+D5+tKmFMNabjUI7SPrT91C6gwkFWNHxBKHDZ+jGQfk32qsrYh+/o7rSWn2ySVXJV3CaKo/X6P6vugcukffSedDvhBPcyKkibAap2NrmgnOVn1pl7e1ap6jep0Tpl+oWkC+fxnCDOZB8wQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=1nHxhrK5XASI/i8SjDEdO/bffHrIEYRR+FQg8rh1rpg=;
 b=mWXrjJ1cgrNQ+dV/PfNmv0F1x/urf9MBBicRwIEbUkx/D3Q/D5nBX6hynK4JdJXjsX3rMkpLFOWtX+ZUcKuG8re/chddoOPTRvLPZWDMcCkGGft3Trzulx/f/4ixWIH+ZeYbr+yGA3cj73WDmfRHbpG6FAVc4bRsV1ybm+lOE5tduMz2OdaP1Uo4yLP+EZ0HutSdcKvkGvIvBAaRARJC0poLtPy0AHDnV+W0zjGBizNG0JZD6kwA0C8LIgKeRQfSS9L9jenysKfd4mCTahZX4Wj/9774eurgm/Uiz5aHI+d7pD1f0JPaa5ZT/3nzpJQmB7Anx4gnIMpguE8b95kkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6532.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2aa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 01:39:40 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:39:40 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	frederic@kernel.org,
	marco.crivellari@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	mproche@gmail.com,
	nick.lange@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] x86/mce: Do not reinitialise mce_timer structure on CPU restart
Date: Wed,  2 Sep 2026 21:39:32 -0400
Message-ID: <20260903013933.172063-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903013933.172063-1-atomlin@atomlin.com>
References: <20260903013933.172063-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:408:fd::11) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 449b39c3-e82a-41cd-b8a1-08df095c3884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|366016|6133799003|56012099006|5023799004|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e41gM0BPwWeFxV44gn6tczeodcSJznKsAP6ho5iXXUgYvV6YQQWzEjMOlQsSjEK3O/TwxqoovR2NeQD97Rl1REcGcoNlDejVwjPPLUBaTRA03ap58a3QW3WIH4Or39w0G4316e0u60N7bk/l1pdTOxgo6IF32EuyVzA5KRrhdkFdTrgP1ecZDk1eDr72w/3WuuKPDtxeZ4z+wnXGmzovkA5+TmIa5hVwVflpjFwbIkKf4NUusmeDEteJaDHCx4bPvmgSB8oHhvSXfD+SZE0UfD78XeONriYwDFVeQ0ZeDH+VHF0jzC4kIjtba7OlluBe/dqueo5+c6NSzFRthl3VJ5gHGJIxP3AtiXyLUNHIW7vS/ye/rFeH4ItiWpFV1/HIFcjoGeM19lweE3juBa6mmgAwXZJGD8kKjDM3bM9nWcGQ+zxvwHLFgcy3kmmddVkmKyAfD9QpVVtU7B1sdEEUcNpFel0t5P5t5T4WLc0q9mv2G2sY6+wN36YcDMV5RuG+0xkWJH/QOEn2sA293jctGyQ5eVHYcFE7k3+8D3G44lHhMv9a8Ch8hPPNuooQ2GHLs/HRzAXRQlwrdCtws85l4eXcWTXDvya8HLeJ7FUesK+hT5XmynmSOgvcRMBQFR78bVnOl+0F47NvXOZMQ73xSTGWkZWSglpNxNSE+GKag3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(5023799004)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b1dmx4IFs1ls99tX2/Sh1V+e2Vesgle5FDR2etO3Ip7OFwMzpwC2p2KDsVOl?=
 =?us-ascii?Q?9iJAEZeys4WkMJZzt9D3g/h2G1PgUDkfoqY21UC4S8OwSb5YIkFgS9OEYLyA?=
 =?us-ascii?Q?1bVtulr7DXYdRyzBcP9S3E8an4ei+pFTpj5Ofh9/kOaaQGBIgCVKCZV6vt3K?=
 =?us-ascii?Q?+zENySMDdgmYOtuS+JzDX2HgQxt7WHN+NwWvG6ybMt6/Ozza/onWUY3+IK0n?=
 =?us-ascii?Q?DfvuQFN9l0IyM706CLbIJ1wD0IVv29q8AKHhCs8ORL/ocSIQszaXzH3Us5gL?=
 =?us-ascii?Q?hnyrCpMQ5fOpjxlqfdd4dUCuR/OE/7ioVrVzc7p8o5hHnKxoK+yZT1lvfgF5?=
 =?us-ascii?Q?J9Ov6IirGwOhlKcAZ/KsAuAIZMuunAK/XQXyIyI8Ufbrct7XEvbuapNwgxMQ?=
 =?us-ascii?Q?f9h/LrZ6vuA+ZuU14IhslV+OWVmSuOX0lh5HMAezKMSPMPjgRs9U3SHd869Y?=
 =?us-ascii?Q?RQW6ezkNUebFgGDt/CXf9A4EmBWHW1Z/+zZ3orhezvmSqo9EB6ORxATGS/Bc?=
 =?us-ascii?Q?8nyQO/rLLNcqUfWzHQvFI8ttvr0lg6J968JcXGA28wsXjAWTbMgFOJqmea/l?=
 =?us-ascii?Q?U/sKZ51FfBA7D9gLigVz4CLEzkJrtZoCrsFiTfBV8NMdgYwZIfQ+By12Dh0X?=
 =?us-ascii?Q?3AT36biV4gmmzI8CnBTp+2xH+sbMRkmQRjJ09tpwzugJOQz7Fr3r4eXbhfvb?=
 =?us-ascii?Q?0VWtxD2YwjH1R2BziADJe7jPGsTvr2v6cQl8LrKoPlo4ef1X/5ha/OMcE0dI?=
 =?us-ascii?Q?8zPo5VGk7qon6RQ948tr/aCLHxHIoupUci8QzidC5b4lxLRNdTS/fDAw++2D?=
 =?us-ascii?Q?epV9vGYtL8V7RFp2SlbXaJaGRpglImyBg7yhZy2y5Fnqn11EtpQcbA54g7rv?=
 =?us-ascii?Q?aoUYefGdGeif5TyZg1gE03TXiqR1V19YAiBjxjsFPuB/GkOsY+XQ6G1vRqCj?=
 =?us-ascii?Q?jkrO3ldDuXgRItBtA2L47N4zmj5O910opQLv5RD1tybL8WwZbcgys5liNhe3?=
 =?us-ascii?Q?sD46Zs9f5L+bIVfwlIRXpqGBTeOElVcXIv9uHCEJWipRD7VXomKJV4oO30u+?=
 =?us-ascii?Q?2RH0+qSqwOoidvt2JrFlJEF3ahV843iR9kPE9369h7FYxRwpPC44G9uQOKDN?=
 =?us-ascii?Q?GwVpx5jCJLEK++M8DqFBtvCJF7X/58+9jjAj/zJUZazQvrnUjPCIFYSl43P2?=
 =?us-ascii?Q?9gS8SCQrjMDbCnMS98e0OVt6QhX8eBbgfQspj7Mf1EoX2JRJ6WaB1CGcORMR?=
 =?us-ascii?Q?4gFFFGD9mjCkuYIYd47VAHV+RrNsWZMNa8UOh1yphGvAbcYgVr3IY5CRcXVY?=
 =?us-ascii?Q?vaS5sjlWH0du41rfoHThcN8PQW9LC5AqbnIdbRkreKqv3b45Ypep/w0qOvKK?=
 =?us-ascii?Q?bBv0uS7ieGsVqk06rMY2oXUy38JbOb4q5HLX+t+nu+wwM/gSy7pM2lxPI+lV?=
 =?us-ascii?Q?bZx9h3tCSa6ThveVtG05fUB/ZDV3nN6stp6CLDSBFdp7U5IqD7NkGmwFkbd8?=
 =?us-ascii?Q?VfUx4wsiTjCg1GCGTjzgV7RqlVi9i0deNPUWj1l1u8GjmtzwljnAW5DuBn9V?=
 =?us-ascii?Q?VzUqimykaEafZx+PvgGS8aeK6xoqU7pkoF0/vYCh03npjDNJXPL0J6aDOP4H?=
 =?us-ascii?Q?un/1wh8JSxGxY5ShUtpzNSmWMlITVkQuNP9chPVSmhUVXvxstJGY5CiwdvNT?=
 =?us-ascii?Q?1prMuq2TPPMAJwAMQYRFFEEaMEMndyfQPdpdXgntZq7mopGkv66/p3C11/0d?=
 =?us-ascii?Q?TEXVh6qImQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449b39c3-e82a-41cd-b8a1-08df095c3884
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:39:40.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3TAjEquQM7BpU0FFiS3ys4PAuBTyXBdvsSZyfe1iIEfQEhVnZhftyCtefkxWaa5Rh08AyuwbXGzcOmUYdEPLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6532

During early CPU initialisation, mcheck_cpu_init() invokes
__mcheck_cpu_setup_timer(), which initialises the per-CPU mce_timer
descriptor via timer_setup(t, mce_timer_fn, TIMER_PINNED).

However, __mcheck_cpu_init_timer() is also called at runtime during
sysfs reconfiguration (via mce_cpu_restart() and mce_enable_ce()),
redundantly re-initialising mce_timer with timer_setup().

This introduces a race condition against asynchronous CMCI interrupts.
When mce_restart() runs, it invokes mce_timer_delete_all() before
broadcasting an IPI to execute mce_cpu_restart() on all CPUs. If a
hardware CMCI interrupt fires on another CPU before the IPI is serviced,
the CMCI handler triggers storm tracking and arms mce_timer via
mce_timer_kick(true), enqueuing it in the active timer wheel.

When mce_cpu_restart() runs subsequently in IPI context,
__mcheck_cpu_init_timer() calls timer_setup(), which invokes
__init_timer() on the already-queued timer. This clears the timer's
internal list pointers (entry.next and entry.pprev) whilst it remains
linked in the active timer wheel bucket, causing linked list corruption,
softirq lockups, or kernel panics during timer expiration.

Fix this by removing the redundant timer_setup() call from
__mcheck_cpu_init_timer(). The timer is already initialised once during
CPU setup; runtime restart paths only need to arm it via
mce_start_timer().

Fixes: 26c3c283c5b0 ("x86: mce: Split timer init")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab469605fc89..765e8103b0d2 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2091,7 +2091,6 @@ static void __mcheck_cpu_init_timer(void)
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
-	timer_setup(t, mce_timer_fn, TIMER_PINNED);
 	mce_start_timer(t);
 }
 
-- 
2.55.0

