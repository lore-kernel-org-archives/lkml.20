Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794181642;
	b=amctGED0MmhI92eqskRSUvacOwXiDkK3T4g7U26atFpRbrUL8GVmMqOdPSsurwsJvv0X
	 tAXAbRVex2aiAhOVguXHu21WLjPRC+nHcKNmjsrvzHDyRJ1R99+4C1sPXwO1fSzwzt4+L
	 doCKRzSTZ0u4Ev8zlHs726aWtvkcByaflxtgJMR6fctbnFr4/CDQe/C80oki5G3Kk2TKQ
	 wAYYNAsYVLYB2RDKtXaIOTCKmWk7dvmpfKHOW5qqFYFF4UDgPN69wqfIhTlKl+r8VwqOW
	 x4HxIpFmjvPp6Ch347KtIDT9KWHxB0f0O6DOWFNI6FmvAiB4NY7Xs5POXt/IckOxGKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181642;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5SMC8PZ5hKLr+SImlMZWd0cbahZPA7ZAOUzZmRuax+o=;
	b=jrgvT8Fud0NFRNeiJG5tZqSaPCmTiOMMy/8zePUBzoWbur9k0iWohudgW5zSETw/2Es+
	 bBcAXyaUocV5lU3I0+T3wE+L+yMmVeOvBd99fkmzrqcEQSsDrEpAZFNACy6YV8TBYuEUc
	 nruR5SHiERBcnCscrRMG9sEFbDu4EswwL3TN7oq/qu68nICXCHM3esODiDkE9c0aNIJkQ
	 3unwfZ+TkxKSczeocW4M+LKp/bQYW25d4qe4PgAdUINELJD3jsEKJyXOhofg82rtTPXU7
	 tY22l+f16swXpS7ssnuEeE7EkCney1bi/9myMj1gH/dZ6J+KPUlBms8QIkaa1v4zzmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A16rwuhM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.21
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF02606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF02606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A16rwuhM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFnN9Y8pwUywfELHdilU5RxdwLMfQjdL1hGXAwW7HpCd+HONXwPyrPsMuyBplzpb/34YUjMFNW6K+xKZA/s57PtaBKJAYCOklI2GkPpqmn56zMr+moShVkSjy2qNAMHoVyQiOTcyOm+dguVMKYOEWoIPDpqUaeH1/mCMXHj6QCGJahXgZv7OTPHq0TRyD0vcA9EeYTBjpCpvhKTyM/lfrxvB1ShZOP3PLaV9ieNAriqm6Mhb3ooaDI3sBt51XHK0oEXGSOAyX/SKa6VDGjWHhW9VdgOyp/zEApMEiEWWt93kOzxfMBV5jSEplWhwgOK5ILDkE2p5Rud63KgY7vbnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SMC8PZ5hKLr+SImlMZWd0cbahZPA7ZAOUzZmRuax+o=;
 b=NrvlxXzEOsB1UqE89CqbU2JGxc2+OKLBsXg/bis3pkRgy8O67En3xyPbkuky21yL9iTlIZpXTP0IvzMY7jNnQlP8RTnjMm2n7K246IWIP7aNgxVMhsnmDhqtC/La4XzFMePLnslfuozX6U0nSWxloqkoFDEIILHmBB8OEbu4YUD9/GOmuV0ASkx2OQwqtiOJjoaw45sgZpAPgjkmothUZ/BPdftjS0G1MQEw46jbzRTxjwu+BneBhzpfIa4anNykzV9YKJ9Wu5K4+xu6FaInN0UcHrKxuGgB1ZNzOaqw5x7abp/g3NF6/zfInE9gKjyHiqv4daeGRSOhJ9AHo8T0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SMC8PZ5hKLr+SImlMZWd0cbahZPA7ZAOUzZmRuax+o=;
 b=A16rwuhMHq9dMjM4hjr56GCF1fiNKRpoLEQlOmMxUUCSHZSmhCsqnPojIJWqFs4fhet6TWMxsYquUEGIfN8dWOV91xGGOJQdWEYTws6qcm1Jky1GqvPVm+tZ9C6tCwp0dTAFlAQc6GbC0U7y02cLYhrXtAwvWdzpsH+hL7+8VwDGYDZkODeE/g/tXUOVA2SmeI8OYqJUYZQRcJF+uhQGbA3flQgnrykLt1vpDWlPuh9hge9yA+li5s7JG+Jt03odw1UTbwP1an4TrJG4EarauLjqVEvvsPE7HV7wXPsIJeuty4v/iQp+A8FCsqbK8Y9U8o/vJbva2JyiwPG0OWgOXA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Sun, 8 Nov 2026
 23:47:19 +0000
Received: from DM4PR12MB7742.namprd12.prod.outlook.com
 ([fe80::8df:c519:298a:94f6]) by DM4PR12MB7742.namprd12.prod.outlook.com
 ([fe80::8df:c519:298a:94f6%6]) with mapi id 15.21.0592.010; Sun, 8 Nov 2026
 23:47:19 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH 2/4] scftorture: Reject empty workloads before starting helpers
Date: Sun,  8 Nov 2026 18:47:10 -0500
Message-ID: <20261108234714.3713501-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108234714.3713501-1-joelagnelf@nvidia.com>
References: <20261108234714.3713501-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::33) To DM4PR12MB7742.namprd12.prod.outlook.com
 (2603:10b6:8:102::18)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB7742:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 144ad64d-2a81-465e-bbc0-08df3df2a084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261021121427099003|56012099006|261022075727099003|261022105027099003|11063799006|261028144727099003|261009223027099003|261026140227099003|5023799004|261102123227099003|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+iCjCj0DOUbOjr4qwCE6JhDFPONnijT4BN+TEFqMLit9P//Gy3t8Cs+EEQ4aryeeACBl3kE9D0vc+0Nu5v7rVq8PgI72ieeIx/jySmSsmqVKIdPhkI09frvsDZJ5g6x95oWHIxQ19N8QhNlVIoPEzYqxBMpuhSBifZ7F3XPl+gLA2V3TpYzcz722VIH5HAfYfKTcDiT0CKwsE1rag9S6bWyjbq6H7sNy9GMWfMrq+hffVIfs+06+BYMEEDRksD7jOJ+whuF1EHFn3C1o3vuvPKPv+2dTaSp+tHYN4nPKUD7GhM/uHDCRKXRVlw0pgTXKwDTJ2YbMkR+kTP9OSP1pYGsgTpLQcfMUh8YeuqqjBw8mf+iQ9P/btf0CJuzNtnq3+iV0bZrv8Qb4BlcuId5M9WxQAHZzHKZH4gqxLsIjsfH308FFTLPhKh9LnfTKq69tjxTbS4mfr840sgUJ5DDy/hjnT4ZckGenv3vxkzb4eZwGwA4geNoxldt6r0WxyrKd9uBRnVIDp6lNS/Knx+JFLZXqk60CgVB7dWVyQbdUiBe9J4um4ejqJSRI++l7kOATRc44iexEvZWZBcRagU3AN85u6SNEYUgVceAjlDOsxDeeas1cySDSyPC7srtXJVQkyXffAoH0Gna2PMScbrI+kYXcrYxe5KqvFkzN7UwQHws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB7742.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261021121427099003)(56012099006)(261022075727099003)(261022105027099003)(11063799006)(261028144727099003)(261009223027099003)(261026140227099003)(5023799004)(261102123227099003)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mnNo5y4y9Rbc0tiBmMzPc5oUeiJEdAbXzXp56+nLFHwaaHthoKgO2ampSp4U?=
 =?us-ascii?Q?HBdUrR1r4elOpp3la3g1hbXaMGYIjXBVHE3DZgE+J1g6WrGjXwkQQNWEH/Zf?=
 =?us-ascii?Q?jYk3ref+/YUKveMCLEVnsf7oyHRxesnQenONY/ZsLl0f92Zd0BVeL2BBmF1R?=
 =?us-ascii?Q?SBo3eBf+rYkCVzSZHtWckq6RcZM+KhzSDYgvwHWoE1ecX0viavhRb0vdlpDi?=
 =?us-ascii?Q?l9aS+TEcgS1teTkRLvcYipetitW9Ga6RFxhAAHsUcg+iyOo9Q8RY6fEY1Isq?=
 =?us-ascii?Q?Myu4kDvQZqXvwO+U8RTimNRi174RszBukahOa4amSWA1X2CzlSyew1l1xJQr?=
 =?us-ascii?Q?ilxVkl2XcQXoD6ymh0lQLTOwmDqoe6Uog5Up7riXZTz6F5gE26GxWOPhbgRA?=
 =?us-ascii?Q?ccz42xZY+TDfEgjcO+yc72Tw9AppI6LXjvSib1MnuJ+VXYoH7naOKT3XdWG2?=
 =?us-ascii?Q?4KIGynMPNjS5v06pKH0PwZGvLs+1B7hr5PZlP2Vd7ejW/hRCV8oxQ1TLcqXc?=
 =?us-ascii?Q?xpr6JrFhDl6NI+ogC34NJ3THX+dJpaelHrgEPFZC3AhbRTYKcSbMv7EYJ+X2?=
 =?us-ascii?Q?g4EH5BjdhanSb88Fl/EbNIv+4EoB1mX81DWbm2eDKuo8Wcks9Nq87To9q95y?=
 =?us-ascii?Q?7lpCtQOAfo09SUsE0tjbsqsXMwcxzAHEig90A8ldq4z9z1RiQI4AiM3ZcqeI?=
 =?us-ascii?Q?n+H5q3a5WAKNJBJf0OBCt1VEk92CsCPAZKwiVJUaBVYrag0Dn5nM9EMszBoY?=
 =?us-ascii?Q?vLYRQlAaH7QjBbFYdC63t53HmnXy1eUibygy0f0Kug+rsH4NkzfvORCHVgbG?=
 =?us-ascii?Q?4TlLtP91AohSCukm1gAjXEeKZlRXKQ9mfud6ALYETmqKXtE+OVmNmvqIQ7LN?=
 =?us-ascii?Q?h9EBWMAdImm34ztybemDqdRgcizgFg59P4HBf6H7b88YZ54RjtvuG3Q9QodP?=
 =?us-ascii?Q?zV2TDNw83a4CVBGApeFdph3ODr1c/jPysCRKAGIfDC6Z+20Y2FAmkmStxapH?=
 =?us-ascii?Q?yR77oJyRZLz+tETMG8PeXW3usafykvfIdDNXbvG9NOteJex02RSpp4AmnEWG?=
 =?us-ascii?Q?Q/m25oiTNEIsgGzVOetDHp1PwH8IiYQEHuRCNJ/Ki6yyyUl9SOY04zcOYg0Q?=
 =?us-ascii?Q?QsX0ka+x/lZ17x+AlUz19JRjbaXbDRn82gQzOElH+dak97mHKD23sbAETAAL?=
 =?us-ascii?Q?7iamNzZbeN6U9DpQzJ/BauT6ldTJApBbLc4qy6gJWxJ+LQuNoAiWAfk6AS9I?=
 =?us-ascii?Q?OkrYZv/+rn1wms5EfJIX3lybeMhZ5D0w9tFywjcgnobVZpqkmairic+u03k7?=
 =?us-ascii?Q?mdnp+gXhUZSpNBJRp4wH+hpu9NKrAAGTEuet5yeUIzI7U/MKmgXE6m9GiRVI?=
 =?us-ascii?Q?eX7rSiZhv3tzJ2e0sBRMFvgnsIF/WDazyW/KUyAhXDr4AS/u5DyKiYOHGBwJ?=
 =?us-ascii?Q?wrFVPaZBKqqPCwe3rWWsB8eT3ES97bGBZXeFkYDwIRNtDoPPnQwsmzMlIYbj?=
 =?us-ascii?Q?2pF6ooCWt7RWgvXmJ5B7PA/5gMVW7tK8tBwVkCGOYrHJWC7yEERsFjFlyT8Z?=
 =?us-ascii?Q?dXXvxHs0rVk9FIEuFkwprBXS8b3UmqhSFIsUEteWEnxtHVOvSuBp7zsPNyqK?=
 =?us-ascii?Q?/iICkijMbEAoNoOf7zfKxkgWEMKc+2CFJhQkNtfvJ1zO12VG9hhwg49N06Ns?=
 =?us-ascii?Q?UquKFU+ICvtX+JaOW8wM/E53u3U1i4IN8m5D43prpPw+7nT6KhvROUDZoROT?=
 =?us-ascii?Q?Y44GNR6miA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144ad64d-2a81-465e-bbc0-08df3df2a084
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB7742.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 23:47:19.5012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBPXN/qp1GDhfypyFXlU9r3IeEUDd8Uz+EKvqDI4jNTfrlZs6HXwEeBFHGGzqPeh7pIJTY7DayUskuq3hnavhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579

A module loaded with nthreads=0 starts its statistics task, but cleanup
skips stopping that task. Unloading the module then leaves it executing
freed module text. Reject a zero thread count before starting helpers;
negative counts still select the online CPU count.

Also, when built as a module with reschedule-only, this leaves the
selector empty because resched_cpu() is unavailable to modules. It warns
while selecting an operation, invokes no callbacks, and can nevertheless
report SUCCESS.  Reject an empty effective selector after filtering
unsupported operations.

Both failures were reproduced in a guest without the patches.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/scftorture.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/scftorture.c b/kernel/scftorture.c
index 603b2dba1536..ff9a8271a464 100644
--- a/kernel/scftorture.c
+++ b/kernel/scftorture.c
@@ -588,6 +588,12 @@ static int __init scf_torture_init(void)
 
 	scftorture_print_module_parms("Start of test");
 
+	if (!nthreads) {
+		SCFTORTOUT_ERRSTRING("nthreads must be nonzero");
+		firsterr = -EINVAL;
+		goto unwind;
+	}
+
 	if (weight_resched <= 0 &&
 	    weight_single <= 0 && weight_single_rpc <= 0 && weight_single_wait <= 0 &&
 	    weight_many <= 0 && weight_many_wait <= 0 &&
@@ -636,6 +642,11 @@ static int __init scf_torture_init(void)
 	scf_sel_add(weight_many_wait1, SCF_PRIM_MANY, true);
 	scf_sel_add(weight_all1, SCF_PRIM_ALL, false);
 	scf_sel_add(weight_all_wait1, SCF_PRIM_ALL, true);
+	if (!scf_sel_array_len) {
+		SCFTORTOUT_ERRSTRING("no supported operations selected");
+		firsterr = -EINVAL;
+		goto unwind;
+	}
 	scf_sel_dump();
 
 	if (onoff_interval > 0) {
-- 
2.54.0

