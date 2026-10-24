Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792830830;
	b=atRIw9tk96o3pjhjKw+64LqonoZaTIbMTRj994tzFGU5qD3Rv2CEOtPAGrUPOH3rGNY7
	 pMfbR5DK+InLX5/sIFTxTc72Bx5STTpdwL0G+l5O/dyz3Cpop402C5JwWxj9HJJTSQWW9
	 0m9UtQyVzpSPnUU7pfo6/0g+BYZXSfjwb2FlrFgUM8yZYAq81G35na+pHCQ0rgnIWd+uP
	 GQ0/4rPxX+2lhoVsf8tBHf1/UF4hQxAuWI4zemWjYj149jezaLrejvmpwoi1Q5w7ckmJf
	 cefqw3YLTmoBYQ+wzyG7fKtgd34ssfpOYGjZlEiW62RWx7gdZeDbGutFamFir9YEfiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830830;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=VMhEZGtaU1E/oGNZwB1WyMZwfeo3BAXIfSf5ynxALdc=;
	b=uWnZN+/nnklA01pPqfGJSe3M8APBzYG0iYODEPu8PAWksN3LInzd6tN1IPfMCCTGPtSZ
	 MRpo59xGTUb5e3xyJEryGoiBlKTL5MT74Vj/RsNjt228TTzfu9FVggoWo/Xk8d02xJu6D
	 25h20NYjw3ekoGwz3V7ZJnhj+1lFR6MHYnTlhc8qnezUFSrDky1M+8ilDjhw4ifS6Vj0H
	 dAfZyrnTIA0qIsMnk2S0FQRCUup8UPyRjLAsnjdJyf5aVz2Ptq8Da15aTmCEblPq92l8N
	 XaeGgz8wsgcLHAvS033URVwcpJjxyTbp3PrERsfofmmhI43duFRkEZWCi22iFCfCk9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JWzB77U9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.71
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C7D606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JWzB77U9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao5s6PfTb7XuU0/3dMHXXf8f6Ppzo+/8KywHnV7wZfxc3s9sFS+a3N++WsbKP/LDpAkSjC0HwE2FrzNpk7+o9ZJaiwqJMDbAaF4JGf8AZt55nNGeWs4XCkf4GLv5g6awF+xvX6O36OdRF2iAa2JFB0++R2V341NdTFG6jUO0HuJiIbY/3DfKhrg/VxdrsXSlcG4YETFAoLLVjcJTfZHyx+tvpL1P7xBykJvOHm7b2RBtwfIS2K5ONjtkO/DDqriv2odOnrTdD9Y5C86regTKz3VHLyJb1Bfj+B2aGxzCWWso6bTD9cSsdVo02EDrKFiXJjt9EF9gIWODyLekCXMg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMhEZGtaU1E/oGNZwB1WyMZwfeo3BAXIfSf5ynxALdc=;
 b=S3PZ8OxbNABV0XiJ5qioTDG0l5uoyUPHuI8OyyWvGxJyS9JlofjXW8O0NMbdzd3Rw/BtpI7V4hVk5KI2a4gX0fCTO0IDEyi2pCHsDk5x6w1dbsLLDHB269voVgfJ92xs5eowDDb9W4BsjJbI6QDTprm8XeYHNDiHeA/yGLEElehupM4hLU4hOUY2hSkdh+uapCI3/EWcGD8brTepRMFrBqOeUIcIfs/MLVmOq1N1Eb01gQsZjbaVthYPcr9QZvVqKg1uWPfLKcnx+NoRjleTAY1AuG/N7aVChTNd1ZzL33GBcOFJj79MLKSC32mH+W2fY6o7B/Q/sGNG3i3FHsFsiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMhEZGtaU1E/oGNZwB1WyMZwfeo3BAXIfSf5ynxALdc=;
 b=JWzB77U9nfgrp3UXbSgowUPC2PEI6gjINVpBwwzv27QMaCeBorEZkl7baEaOuUhVrsKhYVg6wx2sT7aquWQ1fddmsct0CM+LI0YJsN5KSJZT/weXbcmuhJ2dcb80xAHfEPubydhizqlqmMKBHfqolQR0OLrDlcUMW1Sc/Ml2LA9SLIISE1Ry+OPtxXFoIl/0fV06eTPtQiWd0uv7BXMLu8NG8q/LOubeIxoES1xUvs1PUBgE2MvhSGngJJ3w8nuMFe+zcVAPbxkNBh/UOqs5jWBesJM0G876qZUTXh16lOXWRef+eDVD7PdCHpdG4Z9TaNWFADdBDc2zekWmSsl5Qg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19)
 by DS2PR12MB9799.namprd12.prod.outlook.com (2603:10b6:8:270::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Sat, 24 Oct
 2026 08:33:42 +0000
Received: from BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9]) by BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9%6]) with mapi id 15.21.0546.017; Sat, 24 Oct 2026
 08:33:41 +0000
Date: Sat, 24 Oct 2026 10:33:29 +0200
From: Andrea Righi <arighi@nvidia.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Suleiman Souhlal <suleiman@google.com>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>,
	Hui Su <sh_def@163.com>,
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	kernel-team@android.com
Subject: Re: [PATCH v33 3/7] sched/core: Activate blocked donor when no owner
 is found
Message-ID: <atxtWdx0nqTRAAYw@gpd4>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-4-jstultz@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023220431.1106611-4-jstultz@google.com>
X-ClientProxiedBy: ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::14) To BL1PR12MB5174.namprd12.prod.outlook.com
 (2603:10b6:208:31c::19)
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
X-MS-TrafficTypeDiagnostic: BL1PR12MB5174:EE_|DS2PR12MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a42c14-5d6f-47b1-6cf8-08df31a981e8
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|261022105027099003|4143699003|11063799006|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 OhVIrX08DpinpLTsITetqwzVHxImypsnprAvjBa7nDMOwYlYNEsDxDZdvRbXGlEhfAsuv/kt9DIFjfGXdRLRMCaBNdFqNa+gCHONYXUVwj6ccz9SbDQHIwPvM2Si0DtBfea+1OFnzm8y/QvLKojDgp8kG2V2Y4hnO+86S/MEL6w3BRy6E9Zrz6SgHa5QSSWC8M+ZoubD4PhhKqgpojypUiBzREDBJBXzSQQXYNaqqqJq26UzB9MaJk5uObrEcZa5oXVlahnM8dxQhKJ4VAJRo8gKr9cFJN3vXTyCo6o1LDSTobgDaAvBSbNyZPIMfoMkLzfIMBbulZVpHnY1qa4KRWNwEW1JN6do1E+2D3Xe/KELJXdu1xrBtm+JCuvyARnun7KeUB2VocLlX98MGKQuagfe0bwljlRXyJrNKIH+anIUptXLaiEcQkIXz5wmcongq9Y4WGcqjlyrsdbFNFurIfXtLILuNDnx9LCPWBqtDH5RYTMZCLJN2NoYGBBSLcuGUq2ah/u/Ir0FzbiWByHh0S7Mlgw8G99BTJ2LTpUjl43rq+Q/C8KIPTl/dt01ESgmqu58TwPbL2ZxjBq/Z0ODS8C8yUF4Cv3KDACan4Py4Mt0LUyM6HbI3HAJaEJMBCz/BhlG+Q6W8g/EIHNDHF9ivqmlm5hLUjGjtr8+s+RRU5c=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(261022105027099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?o8yq4R980ux510YPHZbH9gDCHTr7iRwhgPvZkrSgOLHwxg+kj0J4fx4ItxlD?=
 =?us-ascii?Q?OwEYde8vDnScm1lulsqNOMkyqhx/mC+xDbkhbMjvpe0dH0f6XA/d7rutkrvj?=
 =?us-ascii?Q?trDvLvlZsvRi9PYLNNyFJsyeCNVP2ukC4SjZBE6UozPS0rLjC+AXME/irnzu?=
 =?us-ascii?Q?epSQuXEGpQbY9lvzPmuifDKP5Xl2JIvwQ81r9vWRc4y4Va+ySwe4NY9T29WB?=
 =?us-ascii?Q?kZ/28GLOYsP9N1WuckU1oyZ5kfdiWs1Zr6Sblh8Vam2b0eZYgGt+fuVza60F?=
 =?us-ascii?Q?na6qRsgyIcF6sIFKZwfMEcfZwgopFheMwh36MGb7JlcDpmwl4ZlmrI9araGX?=
 =?us-ascii?Q?L54IZ22nrsYtx7/l7NXhLqUuhvmZmXr13O9WSJF813nCd2AMgKtseAcFyLyy?=
 =?us-ascii?Q?iO8XUMz2ieiEVDcl3AvD2XLvjLyq0ojtfmlyZL5xAvu2xyKVSET2JZPZM/dQ?=
 =?us-ascii?Q?8nE8P9ZkvslRGI0dTeiss3OrBw5DiA859YWI+U106EWwKVLbmP1po5z6FwHw?=
 =?us-ascii?Q?LRQLIJXIpg4RuDI+Z1gMp82WZEpj5jluL9+pfhAF6aJovV5rxuFiEvteBtSy?=
 =?us-ascii?Q?2R7N9lztqiq6y/8HYbtDg+FJO9pWXB/dSjf66iw8R/9AZ2WHS0XZdJyCyPlr?=
 =?us-ascii?Q?/EbLhgEA6nHNX8wzheWTcEMVF0srdfpMw91DYgdTStEjvmYOZgdJ1YS4Aexn?=
 =?us-ascii?Q?vQmguYmKInf/CmfWY5NWP0mWvUQJPRzSH2jGig/VE3mBq880pq8lR/OTmwNH?=
 =?us-ascii?Q?vQtWKB8TPCr/orZ2TA3gjiX3IRGteMQtZi0eYdvxKi33P2/LjMfZH+7dt0Ez?=
 =?us-ascii?Q?yyyKdL5BfQdZJOv2JjXGIA1pWmDhvFvjUhhPzF4EOedgl4gL56UpZo7HqV4k?=
 =?us-ascii?Q?m+eyluhqb9kHfK3zqLxZirp0HoApZyQUOvsLUE9Itr+rbZ9Rj5QrgbzTQf3E?=
 =?us-ascii?Q?rGK0kgDFJHvpHCgwSaBSon9Q8FdYEN61iyjszgKDaXOyRS4IOzW6cGIFqVLA?=
 =?us-ascii?Q?mC7JfDvio2V69RC4pyeFA3NeN5fmwhdGeLXOY5wfh8shuzqp2x/PESfaKq5p?=
 =?us-ascii?Q?ckp9XEWNXrc5r5rcJyXNGc7NZkAMxHPHF7SVjleNIMRgKgI//9Auuq+RpeA8?=
 =?us-ascii?Q?Tn/H22v1oihzpDfDU1OQf5zvXiaWFiiA57ORvC1Coy/TzIDB4OfP/jWpC4IF?=
 =?us-ascii?Q?5oKeCd+/v+O9ePumFCc7N1q4tSNI4MeKTSNqnjI1k15ga9Mk8iaa2qI288Og?=
 =?us-ascii?Q?pzcj3RaHim9Xylts7JXvdsDxFk85qAeqvZD3lS8fWaISwXVPmlD3SactKdiq?=
 =?us-ascii?Q?uc+8400AWmvbE2EooTvs46vjqlfLpZLi5pO0xfo6wuvN8dWQzJyr5nPS0G0F?=
 =?us-ascii?Q?Dzu/MFZmbKZ7b2VyWqlGyuwbyev1gRt48s2dkwtAWVf3wdbYnddvKdBNzA4I?=
 =?us-ascii?Q?tPjUqOXVHy65OqOVtH/nORPd34uJzW+JBy7daB3nTtrBRnWUgDu8BLCZBbQ6?=
 =?us-ascii?Q?rhw9Drau3XWSyNUJkVpt5z5RHmp/0tSSA+xx7eCpRpdvWGUxxPNnGexfRW1A?=
 =?us-ascii?Q?4vzGEQrmJgobGBr4tnHQO8KXk4fVpF1134UcPOilYEhUpsqonuRvGzmIdE4D?=
 =?us-ascii?Q?L9xyEzbDNx15UcJVcOXtcO73uceHGQQ9SWS+zl52l4LeqP0yxjTu3DjTw2Cm?=
 =?us-ascii?Q?sHzet6ZmpK853VOPVbDI/j/Sc3PSyMuhvEmuAOg/jQJQkG+8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a42c14-5d6f-47b1-6cf8-08df31a981e8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 08:33:41.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbfNmjiAYDuKISO6UDUUHcO33ZO+RWJSvOuExR53c7FH0Ely9jj+oqsteFDrXVhE9uqz2AiKU88JXhoaM2AltQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9799

Hi John and Prateek,

On Fri, Oct 23, 2026 at 10:04:14PM +0000, John Stultz wrote:
> From: K Prateek Nayak <kprateek.nayak@amd.com>
> 
> mutex_unlock_slowpath() follows:
> 
>     if (owner & MUTEX_FLAG_HANDOFF)
>         break /* ... and do __mutex_handoff() */
> 
>     if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
>         if (owner & MUTEX_FLAG_WAITERS)
>             break; /* ... and wake up the forst waiter. */
> 
> MUTEX_FLAG_HANDOFF is only set by first-waiter after it has been woken
> up and in absence of MUTEX_FLAG_HANDOFF, the owner clears itself from
> the lock_word and wakes up the first waiter to try a
> __mutex_trylock_or_handoff().
> 
> MUTEX_FLAG_HANDOFF exists to prevent new optimistic spinners from
> trying to hijack the lock from waiter all the time and potentially
> starving them but it is not necessary for MUTEX_FLAG_HANDOFF to be
> always set in presence of a waiter.
> 
> If a blocked donor is deactivated when no owner is observed, it may not
> be woken up until it becomes the first waiter and is naturally woken up
> which breaks proxy in the interim.
> 
> Wake up the blocked donor and allow it to grab the lock when no owner is
> observed. If the task manages to grab the lock, the block chain will
> follow at the next proxy migration. If the task fails to grab the lock,
> same situation is restored and everyone migrated to the CPU of new
> owner.
> 
> Similarly, do the same for the NULL blocked_on/mutex pointer for
> consistency.
> 
> Fixes: f13beb010e4a ("sched: Have try_to_wake_up() handle return-migration for PROXY_WAKING case")
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: John Stultz <jstultz@google.com>
> ---

...

> @@ -7013,11 +7026,11 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  		struct mutex *mutex = p->blocked_on;
>  		if (!mutex) {
>  			clear_task_blocked_on(p, mutex);
> -			if (task_current(rq, p)) {
> +			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
>  				p->is_blocked = 0;
>  				return p;
>  			}
> -			goto deactivate;
> +			goto activate;
>  		}

IIUC, p here isn't necessarily the donor, after the first iteration it
can be an intermediate owner that is queued on this rq and blocked
itself. If its blocked_on was cleared by a handoff (or its mutex has no
owner, below), we now return it when p->wake_cpu == task_cpu(p),
skipping the sched_cpu_cookie_match() check at the end of the function.

So with CONFIG_SCHED_CORE enabled, are we running a task that was never
cookie-checked by the core-wide pick?

>  
>  		/*
> @@ -7046,14 +7059,15 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  			/*
>  			 * If there is no owner, either clear blocked_on
>  			 * and return p (if it is current and safe to
> -			 * just run on this rq), or return-migrate the task.
> +			 * just run on this rq), or wake the task to try
> +			 * and grab the lock it is blocked on.
>  			 */
>  			__clear_task_blocked_on(p, NULL);
> -			if (task_current(rq, p)) {
> +			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
>  				p->is_blocked = 0;
>  				return p;
>  			}
> -			goto deactivate;
> +			goto activate;
>  		}

Same here.

Thanks,
-Andrea
