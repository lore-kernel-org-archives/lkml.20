Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022114.outbound.protection.outlook.com [52.101.96.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D251D3B8959
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198617; cv=fail; b=cf4YSCQvF3iQ17UlnBPqi8ux0VorqEnVrhSYI9hApF2bzM6+wSujCjtlZ+y69vAeYWxRSbkT+45Ujz295ZBfFZ8WUYzR89tQt5BX6Lnxrfy9VPiRtpVAKfKPpFSOWEe2ZIF47kgZ+9pYXkBG84e0qPcQnitfKRkbStOL+r1uKWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198617; c=relaxed/simple;
	bh=BOy3CFbaGIdO1mFfR+a96LYhj8wJknxnq2s2Ky/KbQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VasjKcnzVAEb0D6RET5JWCu4U9m0R3m1GieepPdc5+BgKU8wsD4dwt4G3+6ZP+WVmC9Bnd2BKBjHtDBI3oYUgLggzosWGTg9p9RM/JRVZ5FGhtFlCsndV4ZZMpSiLrBfOF1iWSqGXbMu1MeY2LAjawaozsThL2CmAxp1cxn858I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X29e3Z413XqLwffKvET/XTPOktk7VwECkJz5K9QcnCB6lsFAW7CKiMFjzTPGb0euJyS86hFMZC0H//QroJi81Mb4N9ROcydCGrMNIHJoqG7lqfumQgHDElDanLc+2iC7DD4TNtNXjOxpoEnczo+pCoaW1RfCA4ExRHQ/oCsxYttD4GCtZdAlhcHuXGc5OzXAyFA5/HsOotJys6dOZLNd1HkuQz48G1A/8ZXxG8E8OtPza+9fx7mE2AxAjWCz9/zHMLUUs+3Myu45PPdw8ndZ8NzkTf7L60kg4G3xW45MZ2EL8v35le1AZ/gjWe1iIZbpVph6hESl5qFZg2Khf9Alyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=MI8f5X0cheqUfvGtw+pisFJ4hiXZ9L7q4Jktj2y9xIg=;
 b=J5qSEz9vbqVmzgUCGCGvSJqZ3npHXINqNM2yTwj3ngnh+O933S+zIXpM0/vmkLXApXQGD0PUx80k532tqBD9XuQSSC3LaV7/YN8W6CxsfnuZ58Li7EfF0wVTxETkuesat8a6rj8irygmvNtX4sjdGeuPeDBUHBSKfTdBCgx8w9TWCvYrMJv5AxezzLf1EPsuuog1LKjNs7m9c+P+J/D3SKHceE+glu6rouvvdHS8lCRb2403asbv5bR6K9BNVGJJUme2bmMZVUTfprsSbGi47go54WHIOfaWfDlHQo/yxKBc18DG+zptm/qrEVER1HaehmyJqnoZnw8I6vYneDVF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO2P123MB6969.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 23 Sep
 2026 21:23:30 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 21:23:29 +0000
Date: Wed, 23 Sep 2026 17:23:19 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	feng.tang@linux.alibaba.com, pmladek@suse.com, neelx@suse.com, kprateek.nayak@amd.com, 
	rishil1999@outlook.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/debug, sys_info: Introduce
 SYS_INFO_CPU_RUNQUEUES
Message-ID: <2cp35jnfu4oejjupkymqzuobfmaf2dkaaylc5bw3nk3lu2ccy3@fvf2sywawm5t>
References: <20260912013240.545742-1-atomlin@atomlin.com>
 <20260922144027.GT776954@noisy.programming.kicks-ass.net>
 <rqph2yaqdxyu4dmwddmdcakiacmyumjh7adxdl2a6ibjc6wwi4@55oxsrrgjuaw>
 <20260923083753.GB4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923083753.GB4121339@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: BN9PR03CA0682.namprd03.prod.outlook.com
 (2603:10b6:408:10e::27) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO2P123MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 3204ec11-f4d2-476d-3ee6-08df19b8e989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|56012099006|4143699003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pBnkhzVm69eWRkDkckzo4qEKSoa0WJWUwodSXxlB0/vgqbfvHcaA4openWznKOfTfxA5hnpDTF28zRudDLzq42Xr25YJGoY/tMSYPLTzaV65KN45iOwjSToqB8cMKc6et6kvQD7/L38oWohRUvu57NI2Z0JHhpX8Q0mVYZ9pHXRP4AaUN3t+rvqcroRjhmpl2e4ua8eOCc7vTYhpm//1++6Qenk1C442RFz1YhHQwf9qj6njtMUmMwjb5yuAqJz52ublfaE7Fs2AUzrdmmQZ+LasNZxuhg1+m6W5hvb1DxPpsObq5w+a1AIlQAF1THM8V5yi1+94NqSWcL81mc0h6X9GC3wWsAeuc0GPa3OE5NhwgZjfZdgy9pf+b9p7ZLNNEJpyPxZjJ89Bp/cCPZWDodE6qxL/4e8HEUOClvitZU08dKm1TUwlUnILQXJ1BVnRmnYOMOOFeqA0yeLyEYIv4CXne0ZfeUHp+CJaA7bqa9oDoilMudrKQjZuydt0PpgB6dqSZJEbigFT8Qp3YplF0GBAUJdEZkeEDAbHxCrXXUhFkxxbdYmQq1q1SfygEgcGrmz5Pe04qm+fCGbpeWzAGGUvrT7jPS1sCaWmK8JT1LychSOPPcUsgy6IQJNYbPeIjH6JqOFyq57EP1bvfMYrA+pIdiWq5g+7AGldDxPP7s0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXowR0FGZXdrdGZjTUJoU0w4QzdqZjVDQkxYS0tqcDFacGZVVUJCUG1SOWZv?=
 =?utf-8?B?YjhpcDhRd2tWOEFEd0d4eTN1VlBrM29Fd0huU3lSVFhxRmR3cE1EZStJUzZx?=
 =?utf-8?B?ZitqemdPSE1pTG00ZkxrMXFFOWJ4dnlEcEszOWpzRU1Scm5MaE02YldNVVZU?=
 =?utf-8?B?YnJKdFAvenVxR1RsUmQ3WDVSWlZhdkt4cWlUSnowWTZNemJGeTcyUWZObHV2?=
 =?utf-8?B?OHU0RU5ZdnZWWVlObVIvdFlURlR6SEg5RkdsMU1SVjZzM3FuN1ZXY0JXYVlR?=
 =?utf-8?B?NStMdkREVC9LTlFwbSs2VGVlYXNpU0lDRzBRRngwZitHTHJJK0l6TUJOaUVP?=
 =?utf-8?B?TytaNHBXNWZtL3NlZmYzRUdNcy9XdDcwMmxRK0wvdFdJR1R6UnNJRm1ObE1F?=
 =?utf-8?B?cDVBLzRFRWdXMy9DaFQ5Zk9jVjJxZC9ES0xZWGFpTitBYTFrdFpNcGtmQnl4?=
 =?utf-8?B?czNVQnpoWXJ4WE9iRkRlSEtCV1pCV1M5cVFvV2g4c2ExdGtnNWRzRnd4RDRU?=
 =?utf-8?B?V0dVVGpCOTczZEgyMW52N090NDF0Y3ZnNFgxQUwwb0xHeG9WUEtuY2NmUXBw?=
 =?utf-8?B?aDRmYnVFS3lUZ3A3VzVYclRmcjRmVmxqRGEwYTQ0Zlk0QzFHMzhMaWpGV0JV?=
 =?utf-8?B?MnBaS2J4bmExdWdOQjdhYStHenBMcG1aa2FhRTFyaGx3dDZuR0JtTXlRd0V4?=
 =?utf-8?B?R3oxTUNGTVFoaUtVQU5NcGtnbm5oOTRCZGI1VmtqcXFzSTMwSWY0ZFB4UkVR?=
 =?utf-8?B?cWh1MGlRVWtnUUxIMHRXSXhzcnEzY0ZCRGwrUS9GWGkyOHBoTVdDbnhZc1NS?=
 =?utf-8?B?eExXMVNrN3FRMTlTZGtBNXBrOXhqOFN3SkhXTmxYQ3lSandSMDQ2bnZDYjZJ?=
 =?utf-8?B?UlB6OXkrWGtGZVF0alFpZ0p5emdkQkkzbFc0ZW9OaWIzWDRwZkFpNzc2cjZv?=
 =?utf-8?B?OERBdUczeUZmNThDbEFHR1puM2g5V0hPUnhKaVZleHhhZkVSWnp6cXlmTE9R?=
 =?utf-8?B?OHJGNDlLS1JJSEJTajVlUzYvTmZzTVpjMU4xZVR0RTJQM0hkaHd0M0pLaGk1?=
 =?utf-8?B?T3A5V2tVZVZnS1NNeW10Ym52VVpqQlh6WWR6TUFCYk4xMmN1dCs3K3pvYlFy?=
 =?utf-8?B?eFVjS21wY2FJNGEzZFMrTzVsbGVmUGNtckdLN0p6YjlVbm14VlFXZXczaVZV?=
 =?utf-8?B?LzB0ZWFEQmRHR1NlOU5UVjY5YnJHd2tzRVgraVNCZnhXRkQxYjNmMFBpVjJi?=
 =?utf-8?B?RzRBSUxvVzFRdHptVXRiME0vZlI2TUN5TGhjUFhYMkNHVWp5am1XZ1FON2lz?=
 =?utf-8?B?akZCdFBtRTdzcHdhOE5FNnYzNUxHem1MbFJhZ01DeWdWQXE1clNwbGRLbWUx?=
 =?utf-8?B?Tzd2c0hPc3ArQjdTWGdjSEVzc0ZNVmswamdzQTY2QVA0N00vY29vYUF5a2ZH?=
 =?utf-8?B?RTJSR0JxYUZ3RG5TbXlWUGp5a3hSb2RxMGtEdTJiekZncUpJZFl2LzhrMlVu?=
 =?utf-8?B?ajdFQmw3MXJpT0YrM3VkSm9lSWZja1VCZG5HUWV0bGV5d1VPcSt0allDckg5?=
 =?utf-8?B?SlA1Z3BDcGlzYjBIWFVoUFBYRDl1ZGVmOEt3SVF1OGhBVjRLT2daZ2JxKy9z?=
 =?utf-8?B?QW1zSGdPTGJxQmpQZkk0SkdiZ1g1N3NsbFVVQmZJck1aM3VjM0FmcGxnTms5?=
 =?utf-8?B?NXpOWU94bjZWMWlzUDB6RXF3eFFLdGN3R3RSSGNSb0hNay83ckRlY01BRUpG?=
 =?utf-8?B?dmJ3SG5jZ1cvTERVdFprZDUzcXh4V3RWeGV2c2Zicmc3VlczVnR2RDZOZnZ4?=
 =?utf-8?B?c0pQL093VFR0OUNvYU1CVHZHNDBjZzdlaWY2ZkZEcDBTNDFlL1dzbFZ0aUhB?=
 =?utf-8?B?VnUvR1BuN0kyRFJaNm92VzFNb1pRZThCS1cxbzFReGVDZndDTEttVjZ6OWlS?=
 =?utf-8?B?VjcxYVBOUVZTZ0ZobE5pa2szenoyb052bWRXeGMxdVhKOVZkNDE5NFVoRjdv?=
 =?utf-8?B?eWxqcEJwN3FFTU1IWlE0a2d3dHhTbnZiSGV0N3QrUlFLV0JrSWJYZzhqc0s3?=
 =?utf-8?B?S1NmMzU2Q1NoallFclAvNjBFSi9UbUt3Y1IyMVF2OFM4cVdVUTUyN09TV1BT?=
 =?utf-8?B?LzhvVms1UWNuR3p2Skd2ZzEwV3JLS3VKeUV2b3BXS3cyNDZqN2RJUWZvVXNF?=
 =?utf-8?B?OGV6V2RTdGV1MkIrNVdIUHpoOUxFVXNRNGxhYXJWNlU5ejZsSmpJejNTMlN1?=
 =?utf-8?B?WHM3RTlKZ0dYZ2VuMVNKTFg4cXkwazZRWVFURG1oVnhwdG80K3NXakNTNVRL?=
 =?utf-8?B?bmlsUEhPOUljeXFLSURab09oNUFvMHpaQlRlTGFxZXU3bWtXcTJNZz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3204ec11-f4d2-476d-3ee6-08df19b8e989
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 21:23:29.4871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EIgdu5uLjy3Rorzz7WQ+bw73nevKP7NFyQISZly7E4zRrEBypJ7hutGta7PBbFus1219OCxLGYRxnQme61SCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB6969

On Wed, Sep 23, 2026 at 10:37:53AM +0200, Peter Zijlstra wrote:
> > Yes, fair point. The intention here is to preserve this state directly
> > within the kernel log buffer, particularly for scenarios where kdump is not
> > configured, the vmcore was truncated or fails to complete.
> > In such circumstances, dmesg, whether captured via pstore or serial, is
> > frequently the sole surviving diagnostic artefact.
> 
> Ok. So not crash-dump then ;-)

Hi Peter,

Yes. Any data emitted by sys_info() that appears on the serial console will
also be captured in vmcore-dmesg.txt, even if the resulting vmcore dump to
disk is truncated due to insufficient storage.

> Right you are. Clearly I got my wires crossed when looking through that.
> 
> > With sched_show_runqueues(), it specifically avoids print_cpu() and only
> > calls print_rq(NULL, rq, cpu, false, true). Inside print_rq(), it merely
> > iterates threads under rcu_read_lock() and calls print_task(), neither of
> > which acquires rq->lock. Hence, rq->lock is never taken again, and the
> > non-blocking guarantee of the trylock remains intact throughout the entire
> > dump.
> 
> OK. So perhaps add a few comments / annotations that these paths should
> stay clear of rq-lock. It is too easy for it to get added.

Understood, will do.

> > > > +	if (si_mask & SYS_INFO_CPU_RUNQUEUES)
> > > > +		sched_show_runqueues();
> > > >  }
> > > 
> > > I really don't know if this is worth the trouble. I have *never* needed
> > > this.
> > 
> > I understand. However, the requirement primarily arises in production
> > support. In environments where kdump is not configured or the resulting
> > vmcore is truncated, dmesg is frequently the sole surviving diagnostic
> > artefact.
> > 
> > During an NMI-induced panic, capturing per-CPU runqueue depth in the log is
> > invaluable for identifying CPU starvation, etc. As with the remainder of
> > sys_info, this functionality is strictly opt-in and disabled by default,
> > imposing no overhead on systems that do not require it while providing
> > vital visibility where full memory dumps are unavailable.
> 
> What is the main thing holding 'you' back from enabling kdump
> everywhere? AFAIU crash dump can be configured to only dump kernel data
> structures, which is a lot more economical than a complete memory dump.
> 
> Mostly I just worry about death by a thousand cuts and all that. I don't
> have a very strong objection to this, just wondering if we really need
> it.

Indeed, filtering via makedumpfile (e.g. -d 31) certainly mitigates dump
file size. However, even with kdump configured, our primary motivation is
added flexibility, ensuring visibility when a usable vmcore cannot be
saved.

Unfortunately, we have encountered a dump target that run out of storage,
when prior unpurged vmcores have accumulated. When this occurs, writing
/proc/vmcore fails or gets truncated, rendering the dump too incomplete to
extract dmesg.

Crucially, kdump extract vmcore-dmesg.txt first. Because it requires only a
few megabytes, it routinely succeeds. Capturing SYS_INFO_CPU_RUNQUEUES
ensures that runnable task demand and per-CPU runqueue depth remain
preserved in vmcore-dmesg.txt (or e.g. serial console) as the sole
surviving diagnostic artefact.

Kind regards,
-- 
Aaron Tomlin
