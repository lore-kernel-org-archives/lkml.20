Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202230;
	b=iLpzBNy+aqlmzjC3mUN/eTZQE0tAaZWsCaamzTl7C7xkIHI73ntVjeC3pS/bcld+ZLsa
	 /2Jt/JFcMWH5iJjz+TsgOpYJgqScxlFxJhDe17syn0iRsSnQt4i4narLKvyaFyWlrrdwZ
	 LXzGTCUiWZDH/dXaaSF/I/NGyiGZ56zuORhk4s+b2TdtL7e7fDE6iDGRZquVRE5XC06Vu
	 JIAlE4WuLbXmdl6NVb1Iunbv05eEhgY940AbOmHWbAj3jkP/Lpk2W1HUXQRWCXc/3ryOK
	 vREPyMDQ9G+eEQ+eLKX54ZnBxsHptckNfQzXQk5RPpY+i9vNoySdb8jDAsifSJmY6hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202230;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=dkAHxZUZjkA+Knijbb3lx/AYb4sMXiKS49q1g/tOHF0=;
	b=NtfpANBiCRyDu9gik2lvKXmcJab58pQwXnv4AvFW+bUGldxP5paMjM4D4Ua0xYO1XNEv
	 0LmmX0IjZG3oLvn1GH3ABsaD7xdh1cxE+wAaguEu+vvViWS3iIknd6FrX3zA9zaW7im66
	 upKDPnfsOQ69VXDe5OVdBOHsxDOihk+o9AD1aDsYXZ4lPjguUb/xjKsUaLvfeTYCtEnzk
	 HF/vLA/lxXsWfQzeMjNbYY0DZCSlv7OF3BU0EDNDXCq7h+ZXFRvF0IjpxGlCKRHOw40NV
	 NRTNOcKa/jlabh59aJdG900cUWVbf3CQlYHwBaQ8sHKN5yAk3r1M9TMXMOg4uxuW5sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="JbUFc/Ah";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.33
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A97F606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A97F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JbUFc/Ah
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGQ7mvVPTBzxpgQjZK0Gb0bc3gyOXBgV7fAMn/L0A3pkGAbXi9ZAsthd2VNLwDWLwe9M5W5Le3maSvyG4lsFh5lHH7bHOde7zmNA/XdaEZYpcaGctuGHhE0N8d8K6dvvZOah/88v0TFObDudfJBjhn0+8aDXn9/sxtBXY0+Dnlucgh4l+GjHNV8gJ0K640k75qdzWPiKiqGlsByZhNmu8uhluRT5HB71azd3HN7xN2zqhaf/k/fRGo/eczsIgr4mKYezLrDI083HO1EtMdlN91fRNRGm224z2hW+Pbw9Moc3gdj4UtILH+6sn7Lm07PId44HP1rHsti+wNkJkxbEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkAHxZUZjkA+Knijbb3lx/AYb4sMXiKS49q1g/tOHF0=;
 b=u1fjoampIQMfjq3mhRoKNJfXn1tknaQ/X4EXmb6D8IHnSQswK6A+RxQwEBtdN0lRi6HzcDpSlxHSxdf41qW4e759UbIfFIxfkqfWMWO+n3a0X40yJk+EmTC7f5GN6S3YlV1iEQvMZ6ljqpcRSFO+evk4ZAfhdoXEQL0KByBMH2iuEjkYMNDl4/0IkLk3vBOqgOU5lcNQBwJ2QlcRLEI6YjJRl+iQxS1aUBNDTLRVn5FnpG3SQoZXBIBA0PTel3zruZjR23Gv64EvmW46EKI+Fyge+nB5h2kGkfY3SZLE5bAx/hwR9w37frId1OoxXXEn0uA8KNzCDLhDSumK3sTdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkAHxZUZjkA+Knijbb3lx/AYb4sMXiKS49q1g/tOHF0=;
 b=JbUFc/AhWzpGBtREsauSedmIrUyiD3Dh5CuL2tykdT2RZ/ZHqgi81H/oDDF7uYblxhJNXKymsAil+sJiO/6xPPHSmLTzuNb3IevxiRmfIuOp+OlyxOt90mOjqK3AIhNZyo9KuRaSIjDTV94QtA3d2iVcwggbCb6LH5A9JQMI2db2fvYdfXtyA4X/Dlo2lsJBbOZ9cVoMaMlPm3qixm+k5zcAi0cKSDFuZypdyoyjB/RYxEYNJFk4IxNaFAFs3hTlm4CFbrcFCXcDuwMA0IzOH7YohEqpdlFBqLK1jWOysVyF8UKA7IITBOjT7J3q4Ut8do6aQ1BoRwg9kAHdi69vIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 15:43:41 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 15:43:39 +0000
Date: Wed, 28 Oct 2026 11:43:38 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yury Norov <yury.norov@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: Fix lost icache flush requests in
 set_icache_stale_mask()
Message-ID: <auIYKkk_J0lskudq@yury>
References: <20261013171238.777119-1-nickolai@csail.mit.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013171238.777119-1-nickolai@csail.mit.edu>
X-ClientProxiedBy: MN0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:52c::17) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
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
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a21d19d-a169-4024-028b-08df350a3cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|23010399003|6133799003|22082099003|18002099003|3023799007|261028144727099003|11063799006|56012099006|261026140227099003|261021121427099003|261026121527099003|261021123027099003|261021135927099003|10067099003|261009223027099003|261022105027099003|261022075727099003|261022115727099003;
X-Microsoft-Antispam-Message-Info:
	g+ASfNbX4JvbKqSmhamGc0/tsMgmHck7BOxJ+D2tQtsc3MNtKydtPlpOLN2tJBCy3VJVSie5gS/1F+G0TBMLRuaZNON0TS404IJy34iLE1zohyY8IRwu69VJ7rEwxnL9PrjTVrT2nQzgLGSurjJqRXmmohi7SsegLKpK43YjM/zQRlntk/OhdKX+VD9Y6Ak7ik9vd5OTU4oXdCkDdsKNUztDyqZ8DH4ZnbmVr0vmwRxU0lGld9T7YNi0ikFDhIuXnCiy3/QhsWFca0Nwm0L8enaGp2XBMvJnNuAVfbfqn7d83M1O4LU0yXWlxHCAHWrismf/Gzza2nmX2TBRktx3LR8yAHyj9Ynlzobrey+jGgr7XLqm/SvRQKNWS6GVAPg0H1kD8nOPGV8QIHTGO05Y7TWICzUAVNooOfT7Bu2LJnZq+rqjGehfhsanXJMCqDwHTkBmC/wIxHU0/3+6ARYeRfFkmKPS/2DHu+vgZvLq9mDuU52JsOLhQp+gBBVAJUmbB0aeaqvAXHNyMufQnRKJEUkg5QLhhFAC/OFKu3eprsLtAzR/6rTsTsZTa/Vth9DsUWovRuQIiS+4FbF0VmpedZ+lnXKXaKY7P15HUYBDNIMCGzoW5Kt/mIXzpwCGfRxssdq/zzz0tn+cYU1dlxgLZXXe1Uy4rENXMV2xa7xs5j0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(261028144727099003)(11063799006)(56012099006)(261026140227099003)(261021121427099003)(261026121527099003)(261021123027099003)(261021135927099003)(10067099003)(261009223027099003)(261022105027099003)(261022075727099003)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l4hbOL/dMfUkHfWw6rtX0QsGYFo6Pg2WQQfEqrFXkUXId+h4toHa6AwBCiL9?=
 =?us-ascii?Q?KQGtoHvfvmKSA9Y0M4X/tGbWmDm0/B6YvSvF3lCLAObhXC6FteO8EdHmSNtl?=
 =?us-ascii?Q?gc2K44TRAfTddWOUfCX8JNpQdjnL3qzvFtuj+6NorMXnuO1pQeGXmzBX6AU5?=
 =?us-ascii?Q?3v5TuDiqNMZlpXyNP9pM/lPFH7ruc+Jq4BvaxW15qjlv16V3X3njH/CUnnSG?=
 =?us-ascii?Q?E8RcGneCyHX4boDOTq+uFEee3jZvQs4grJE9eNw4BrEMIBEuEDm6AqbuTpk/?=
 =?us-ascii?Q?iexHz4w/oMeGJLQQcvUMvamsCpxEaaZAioPAxxwO0sWSVIfKG+dK+wLLuebn?=
 =?us-ascii?Q?qh2eHi3j2r0RfR5uGBTgGzhSBeoM2yiPuLvB5/5Tv6ENubN9oXmHQ2/EXDe6?=
 =?us-ascii?Q?G5nHaboFLk7Q1W3Q36iPcaNJzFKTJynTHJx4+nuwXNlSzj2SYBT5YgihgbQN?=
 =?us-ascii?Q?82zYcdB+mcncU6yWY63o611NU4EFYMz2+8H6U+BNCk2m6FdPohuPxw3FpgA+?=
 =?us-ascii?Q?6HplO58C4wawC6i5jjRerH1eW7/SDjGSPwUYk4kcFEwKgmonzhzge+HdE2xK?=
 =?us-ascii?Q?9G+dDmiWYzTYJGMPvgukWqtOyVYDGAYWF0jVhSa0oGHgeR/TdNhEjIQlbq1b?=
 =?us-ascii?Q?96axc6atKbw0GNv6CHVNAUsmuOFb4Fvhb5Gy0tEB7S/uz0eqS2vex7757VJ1?=
 =?us-ascii?Q?A4udi9HKv8EyypzrxRW/xAEN7Ag05dIe3LN96DVVUQBvhrYgB7J3IGKXpAmR?=
 =?us-ascii?Q?5mZTvQDnzRgwaSaQRYqdhjfZCQr/x+9xI22q2dbEvLvLdapw9CYJycXqerbH?=
 =?us-ascii?Q?OUg9R96mPDVfuTLxQPOa6hT1tj5VF5P5Yzpg1migvIR70BIAFT/BnqHKcu/C?=
 =?us-ascii?Q?juMaGZMvbPcqXUMT681CC+UxxsEPCmSCzez7iMIyhgoZp6aO4HwrVcj6oNs/?=
 =?us-ascii?Q?CZ0bsHijg2s5QC8xCiN2nlhQOfMz9X6ZWVKcmeQgrQ4A5lb1T9YNnv+infH0?=
 =?us-ascii?Q?eXqoZs91NlD2HKm6XNbOKCaA/vkebhXxSfJCbgpu+OPtwdnm54/Y7fV2lfvO?=
 =?us-ascii?Q?g5uCVo57SGojP9jqwAxZ/pqLGECwRtOEgFi96LjSmytLJHpwWWwVgZlXnYV2?=
 =?us-ascii?Q?62gsvs7jP1VH6k4uERYuD64CbEes52O0/FCxqATzcXgDYt1RsLwOTh+nqfbA?=
 =?us-ascii?Q?XqRtdeDCioYJfqvdFDqCQRnHBfptIVZ5iq0GLLBuZ6nqymwwB5vAp+iHG3U1?=
 =?us-ascii?Q?iUGkX1VMke47yeb4gZGeYKM0kMEkuxEtr8s9BrB6u2lU+kZC2WhlZI/iK54V?=
 =?us-ascii?Q?1ILrCNLPFNfkHAZZqLdhzmCfv9H7twMp54noxwp5V7TgOwVKMr3Ou/BWtUsg?=
 =?us-ascii?Q?gqFvyPjnuHLbEr7eGjKbLweWRuCcB5V+EfhEURs0Z7aqUQl+xNOtjqCn9Yp2?=
 =?us-ascii?Q?HryBz3MR3SQfk1AXd+t8bbdQPn5tAZ5mFHdFaZffhr1LJuPn+dPNhk8L5+QS?=
 =?us-ascii?Q?eTXlQgW9HXt3GnoQ8L6RpMO2Ftk0jvo+KIvczzbc4NuakJa6/YxFVFeYt1IG?=
 =?us-ascii?Q?McRbRotZ8jIGmXhsZJbstZp49xZSERPkLMjGBBs/kCe03yPqb+4WQaNlKAAF?=
 =?us-ascii?Q?bBP7auOQ3BAfZNtx2RIfINkSGMetCRY97O0WmmK1wM2eYJDVX+HoUJKLUZD2?=
 =?us-ascii?Q?UnHTBdz/NU1Hnl2oYMttRdi4p93lwQ5dyuJbd9ozYBiZ3ObpJrVX4/bZw/Me?=
 =?us-ascii?Q?RgLdrzZqTIxc/EJqBibotKqvk3GkdMaCtZtK45dyB27rJEPSMweW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a21d19d-a169-4024-028b-08df350a3cb9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:43:39.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzSRi42PyAWf6Giu0imH3ch9KPLv+ROpDwThnxosxdFOXggx/j/o50UuRz5vmsKAO511kuR4Konj9qtDYZALTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324

On Tue, Oct 13, 2026 at 01:12:37PM -0400, Nickolai Zeldovich wrote:
> set_icache_stale_mask() marks every other hart's icache as stale for the
> current mm by reading the current hart's bit, storing an all-ones mask and
> then writing the current hart's bit back as it was read:
> 
> 	stale_cpu = cpumask_test_cpu(cpu, mask);
> 	cpumask_setall(mask);
> 	__assign_cpu(cpu, mask, stale_cpu);
> 
> mm->context.icache_stale_mask is shared by all harts running the mm and
> is updated concurrently without a lock: flush_icache_mm() sets every bit
> with cpumask_setall() (a plain store) whenever a thread flushes the
> icache, prepare_sync_core_cmd() does the same for
> membarrier(MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE), and
> flush_icache_deferred() clears the current hart's bit with an atomic
> test-and-clear from switch_mm(). Those are safe with each other because
> each of them either only sets bits or atomically clears its own hart's
> bit, and a bit set one time too many only costs a redundant fence.i.
> set_icache_stale_mask() is the one writer that stores a value it read
> earlier: the current hart's bit as returned by cpumask_test_cpu(). If
> another hart sets that bit between the read and the write-back, the
> write-back erases it. The erased bit is a pending deferred icache flush
> for the current hart.
> 
> Consider a process with two threads on different harts:
> 
>   - Thread T1, on hart C, writes new instructions and calls
>     riscv_flush_icache(start, end, SYS_RISCV_FLUSH_ICACHE_LOCAL).
>     flush_icache_mm(mm, true) flushes hart C and only sets the other
>     harts' stale bits, without IPIs: hart A is to flush its icache the
>     next time it switches to this mm.
> 
>   - Thread T2, on hart A, calls prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX,
>     PR_RISCV_CTX_SW_FENCEI_OFF, PR_RISCV_SCOPE_PER_THREAD) at the same
>     time. set_icache_stale_mask() reads hart A's bit as clear, T1's
>     cpumask_setall() sets it, and __assign_cpu() clears it again.
> 
> Hart A then runs another process, and T1 migrates to hart A. switch_mm()
> finds hart A's bit clear and does not flush, so T1 executes the old
> instructions still in hart A's icache. For a JIT this is a wrong result
> or a crash on a mix of old and new code. The guarantee of
> membarrier(SYNC_CORE), which relies on the same bits, is lost the same
> way. The window is the handful of instructions between the load and the
> store, but a thread that calls the prctl while another thread of the
> process flushes its icache hits it often, see the numbers below.
> 
> Set the other harts' bits one at a time with cpumask_set_cpu(), which
> only ever sets a bit, and leave the current hart's bit alone: it already
> holds the value the old code tried to preserve. Commit 6b9391b581fd
> ("riscv: Include riscv_set_icache_flush_ctx prctl") kept the current
> hart's bit to cope with concurrent callers of this function; that is
> preserved. Commit e5bf9a4b68fa ("riscv: switch set_icache_stale_mask()
> to using non-atomic assign_cpu()") noted that the sequence is not atomic
> as a whole; it does not need to be, it only must never clear a bit.
> 
> Reproduced on a StarFive JH7110 (VisionFive 2, non-coherent icache) with
> a test program that runs the sequence above in a loop: T1 executes the
> code on hart A to fill its icache, moves to hart C, rewrites the code and
> flushes with SYS_RISCV_FLUSH_ICACHE_LOCAL while T2 hammers the prctl on
> hart A, lets another process run on hart A, moves back to hart A and
> executes the code again. A result computed from the old code is a stale
> fetch. Each line is 50000 iterations on a pair of harts (A, C):
> 
>   v7.3-rc7 unpatched:               13177 and 14362 stale
>   v7.3-rc7 + 100 us delay in the
>     read-modify-write window:       49993 and 47675 stale
>   v7.3-rc7 + this patch:                0 and     0 stale
>   v7.3-rc7 + this patch + delay:        0 and     0 stale
> 
> Control runs with T2 idle never read stale code on any kernel, so the
> deferred flush itself works; only its request gets lost.
> 
> Found while formally verifying set_icache_stale_mask() against the
> kernel binary.
> 
> Fixes: 6b9391b581fd ("riscv: Include riscv_set_icache_flush_ctx prctl")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
> 
> Notes:
>     The reproducer used for the numbers in the commit message is below (nolibc,
>     build with "make headers_install" done:
>     clang --target=riscv64-linux-gnu -Os -static -nostdlib -nostdinc
>       -I tools/include/nolibc -I usr/include -include nolibc.h
>       -o icache_stale_mask icache_stale_mask.c
>     and run as "icache_stale_mask <hartA> <hartC> 50000" for the race and with a
>     fifth argument for the control run). It needs hardware with a non-coherent
>     icache; QEMU TCG keeps translated code coherent and never shows the symptom.
>     
>     Build checks: riscv defconfig Image with clang, W=1 on cacheflush.o, and
>     allnoconfig (CONFIG_SMP=n, the function is not compiled), all clean.
>     checkpatch --strict reports only the missing Signed-off-by.
>     
>     /*
>      * icache_stale_mask.c: a thread's deferred icache flush is lost when
>      * prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_OFF, ...) on
>      * one hart races with riscv_flush_icache(SYS_RISCV_FLUSH_ICACHE_LOCAL) on
>      * another hart of the same process.
>      *
>      * Build with the kernel's nolibc (after "make headers_install"):
>      *   clang --target=riscv64-linux-gnu -Os -static -nostdlib -nostdinc \
>      *     -I tools/include/nolibc -I usr/include -include nolibc.h \
>      *     -o icache_stale_mask icache_stale_mask.c
>      * Usage: icache_stale_mask <hartA> <hartC> [iterations] [control]
>      *
>      * Three actors:
>      *   T1 (the main thread): writes new code at P from hart C and calls
>      *      riscv_flush_icache(P, P + 4096, SYS_RISCV_FLUSH_ICACHE_LOCAL), which
>      *      flushes hart C and marks every other hart's icache stale for this mm.
>      *   T2 (a thread of the same process, pinned to hart A): calls the prctl in
>      *      a loop while T1 flushes.  Its set_icache_stale_mask() reads hart A's
>      *      stale bit (clear), then stores the whole mask back with the bit as
>      *      read, erasing the bit T1 set in between.
>      *   Q  (another process, pinned to hart A): runs on hart A after T2 blocks,
>      *      so that T1's arrival on hart A is a switch_mm() into the process,
>      *      the point where the kernel performs the deferred flush iff the bit
>      *      is set.
>      * Each iteration: T1 runs the old code on hart A (hart A's icache now holds
>      * it), moves to hart C, writes new code, flushes LOCAL while T2 hammers the
>      * prctl, lets Q run on hart A, moves back to hart A and runs the code.  A
>      * result computed from the old code is a stale fetch.  With "control" T2
>      * never runs: every iteration must then read the new code.
>      */
>     #define N 1000	/* li a0,0; N x addi a0,a0,v; ret: returns N*v */
>     #define PAGE 4096
>     
>     #ifndef SYS_RISCV_FLUSH_ICACHE_LOCAL
>     #define SYS_RISCV_FLUSH_ICACHE_LOCAL 1
>     #endif
>     #ifndef __NR_riscv_flush_icache
>     #define __NR_riscv_flush_icache 259
>     #endif
>     #ifndef PR_RISCV_SET_ICACHE_FLUSH_CTX
>     #define PR_RISCV_SET_ICACHE_FLUSH_CTX 71
>     #define PR_RISCV_CTX_SW_FENCEI_ON 0
>     #define PR_RISCV_CTX_SW_FENCEI_OFF 1
>     #define PR_RISCV_SCOPE_PER_PROCESS 0
>     #define PR_RISCV_SCOPE_PER_THREAD 1
>     #endif
>     
>     static unsigned int *rw;	/* the code page, writable mapping */
>     static unsigned int *rx;	/* the same page, executable mapping */
>     static volatile int go;		/* T2 hammers the prctl while set */
>     static int t1_to_t2[2], t2_to_t1[2], t1_to_q[2], q_to_t1[2];
>     static int hart_a, hart_c;
>     static char t2_stack[65536] __attribute__((aligned(16)));
>     
>     /* clone a thread (shared mm) running fn(arg) on the given stack */
>     long __clone_thread(long flags, void *stack_top, int (*fn)(void *), void *arg);
>     asm(".text\n"
>         ".globl __clone_thread\n"
>         "__clone_thread:\n"
>         "	addi	a1, a1, -16\n"
>         "	sd	a2, 0(a1)\n"		/* fn  */
>         "	sd	a3, 8(a1)\n"		/* arg */
>         "	li	a2, 0\n"
>         "	li	a3, 0\n"
>         "	li	a4, 0\n"
>         "	li	a7, 220\n"		/* __NR_clone */
>         "	ecall\n"
>         "	bnez	a0, 1f\n"
>         "	ld	a2, 0(sp)\n"
>         "	ld	a0, 8(sp)\n"
>         "	jalr	a2\n"
>         "	li	a7, 93\n"		/* __NR_exit */
>         "	ecall\n"
>         "1:	ret\n");
>     
>     static void pin(int cpu)
>     {
>     	unsigned long mask = 1UL << cpu;
>     
>     	if (syscall(__NR_sched_setaffinity, 0, sizeof(mask), &mask))
>     		printf("sched_setaffinity(%d) failed\n", cpu);
>     }
>     
>     static void write_text(unsigned int v)
>     {
>     	int i;
>     
>     	rw[0] = 0x00000513;
>     	for (i = 1; i <= N; i++)
>     		rw[i] = 0x00050513 | (v << 20);
>     	rw[N + 1] = 0x00008067;
>     }
>     
>     static long run_text(void)
>     {
>     	return ((long (*)(void))rx)();
>     }
>     
>     static int t2_main(void *arg)
>     {
>     	char c;
>     	long r;
>     
>     	pin(hart_a);
>     	while (read(t1_to_t2[0], &c, 1) == 1) {
>     		write(t2_to_t1[1], "", 1);	/* about to hammer the prctl */
>     		while (go) {
>     			r = syscall(__NR_prctl, PR_RISCV_SET_ICACHE_FLUSH_CTX,
>     				    PR_RISCV_CTX_SW_FENCEI_OFF,
>     				    PR_RISCV_SCOPE_PER_THREAD, 0, 0);
>     			if (r) {
>     				printf("prctl failed: %ld\n", r);
>     				break;
>     			}
>     		}
>     		write(t2_to_t1[1], "", 1);
>     	}
>     	return 0;
>     }
>     
>     int main(int argc, char **argv)
>     {
>     	int iters = argc > 3 ? atoi(argv[3]) : 1000;
>     	int control = argc > 4;
>     	int i, fd, stale = 0, old_only = 0, bad = 0;
>     	long got;
>     	char c;
>     
>     	if (argc < 3) {
>     		printf("usage: %s <hartA> <hartC> [iterations] [control]\n", argv[0]);
>     		return 2;
>     	}
>     	hart_a = atoi(argv[1]);
>     	hart_c = atoi(argv[2]);
>     
>     	fd = memfd_create("text", 0);
>     	ftruncate(fd, PAGE);
>     	rw = mmap(NULL, PAGE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
>     	rx = mmap(NULL, PAGE, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
>     	pipe(t1_to_t2);
>     	pipe(t2_to_t1);
>     	pipe(t1_to_q);
>     	pipe(q_to_t1);
>     
>     	if (!fork()) {			/* Q: another mm, pinned to hart A */
>     		close(t1_to_q[1]);
>     		close(t1_to_t2[1]);
>     		pin(hart_a);
>     		while (read(t1_to_q[0], &c, 1) == 1)
>     			write(q_to_t1[1], "", 1);
>     		_exit(0);
>     	}
>     	__clone_thread(CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND |
>     		       CLONE_THREAD | CLONE_SYSVSEM,
>     		       t2_stack + sizeof(t2_stack), t2_main, NULL);
>     
>     	for (i = 0; i < iters; i++) {
>     		unsigned int old = 1 + (i & 1), new = 2 - (i & 1);
>     
>     		pin(hart_a);
>     		write_text(old);
>     		syscall(__NR_riscv_flush_icache, 0, 0, 0);	/* all harts */
>     		got = run_text();		/* hart A caches the old code */
>     		if (got != (long)N * old) {
>     			bad++;
>     			continue;
>     		}
>     
>     		pin(hart_c);
>     		if (!control) {
>     			go = 1;
>     			write(t1_to_t2[1], "", 1);	/* T2 hammers the prctl on A */
>     			read(t2_to_t1[0], &c, 1);	/* ... from now on */
>     		}
>     		write_text(new);
>     		/* flush hart C now, mark hart A's icache stale for this mm */
>     		syscall(__NR_riscv_flush_icache, rx, (char *)rx + PAGE,
>     			SYS_RISCV_FLUSH_ICACHE_LOCAL);
>     		if (!control) {
>     			go = 0;
>     			read(t2_to_t1[0], &c, 1);	/* T2 stops and blocks */
>     		}
>     		write(t1_to_q[1], "", 1);	/* Q runs on hart A: A leaves our mm */
>     		read(q_to_t1[0], &c, 1);
>     
>     		pin(hart_a);			/* switch_mm into our mm on hart A */
>     		got = run_text();
>     		if (got != (long)N * new) {
>     			stale++;
>     			if (got == (long)N * old)
>     				old_only++;
>     		}
>     	}
>     	close(t1_to_t2[1]);
>     	close(t1_to_q[1]);
>     	wait(NULL);
>     	printf("harts A=%d C=%d %s: %d of %d iterations ran stale code (%d entirely old, %d warm-up failures)\n",
>     	       hart_a, hart_c, control ? "control" : "race", stale, iters,
>     	       old_only, bad);
>     	return !!stale;
>     }
> 
>  arch/riscv/mm/cacheflush.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index f8ead7cb7c7d6..22d6520a05417 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -180,20 +180,19 @@ void __init riscv_init_cbo_blocksizes(void)
>  static void set_icache_stale_mask(void)
>  {
>  	int cpu = get_cpu();
> +	unsigned int other;
>  	cpumask_t *mask;
> -	bool stale_cpu;
>  
>  	/*
> -	 * Mark every other hart's icache as needing a flush for
> -	 * this MM. Maintain the previous value of the current
> -	 * cpu to handle the case when this function is called
> -	 * concurrently on different harts.
> +	 * Mark every other hart's icache as needing a flush for this MM.
> +	 * Set the bits one at a time: flush_icache_mm() and
> +	 * flush_icache_deferred() update this mask concurrently, and a
> +	 * read-modify-write of the whole mask would discard their updates.
>  	 */
>  	mask = &current->mm->context.icache_stale_mask;
> -	stale_cpu = cpumask_test_cpu(cpu, mask);
> -
> -	cpumask_setall(mask);
> -	__assign_cpu(cpu, mask, stale_cpu);
> +	for_each_possible_cpu(other)
> +		if (other != cpu)
> +			cpumask_set_cpu(other, mask);

Not judging the motivation, but the implementation should avoid the
for-loop:

        
	cpumask_setall(mask);
        __cpumask_clear_cpu(cpu);

Or I misunderstood your intention?

Thanks,
Yury

>  	put_cpu();
>  }
>  #endif
> 
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> -- 
> 2.56.0
