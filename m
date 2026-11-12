Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794489502;
	b=07qnK0x+7DJZNuPwYwZ7EIB6bLe5CB+iOufVQpcslsoP1YLvI91yfB9i3psnhftuWkKM
	 6S8HNuXrT00mQyjpk2MC0+CWknM0ZPmXaqIgHFNJafxzdR7a7MPqUi4FTwSVsmD+BFOHn
	 M2y1fzxVea1IpxCvnjuVqUS3n1pc4PyYPo1LOY2Pa894/UcGwTl6PSq0oCur7gru29sIb
	 ZbCTuEcxFEWib5nnQWD9jDhFY0C9t1V2AQ7oiIkjU/eM5JChyJyl8QXVg29nPHOuImm/H
	 K+G24nMGYtc7oYo8iFI14neIr7VG26GRN5EifI5MwIcrp6HFHtvIvAJD7s+vx4jZcHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489502;
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
	bh=P+K90cZSRrlNsW4lVxe7sdjaDJizKYMoKpvz2cTLl2M=;
	b=aff2DF11S3+/sN9fpjGLlhbms8GHzqP6KRbJ9lks94TUaWl0nhFI0q4gfwmEiDjE69RR
	 rIYu2IZsF5dc6wbXHJtl4RetnU49GBg8OdqOPneuQLJ6/104AHyXabMf+QXdoYpKPDQWj
	 m2/MguGPSPRsmJAN3B4fDb/Xee2JY3a8JUPdK/nDmKpsFdNxXCoMmhzvWeUSsJU6baWDW
	 RjrDlxO9/Txt8YoO6OmbUkMwce8hQ/6lW/3LEoFmDjvMLi79hsHoU6etXYQRWEaBLVREf
	 T9gnZfR5V7H/x0Ph6spp/AR18w8TzCG5RJIxhCyz/rZaP2FNVGITJxdlt8O+QogoOCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fZBueeLp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.13
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010013.outbound.protection.outlook.com [52.101.61.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A85A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fZBueeLp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oket75ZXgxSvf5bD5N7yt2d+09rE5srriOk1xA9bgEuOVueAmxRQZOzTeUqgIHDTPCVCEmMHT78Dl35EPBdNEZ12zWb1JZjskd1pDtLt5eKOS2d1z5fuvZGENo+SPyVqzuS2uG4tUzNIhRNNU6rEHybOo/KnM4zMw33NWdT03oqRATPKmEqrmIMcihIrEuktz0wNITrAYRhEOrWKJk9itVXTs3PCE0mYZN66nfbPEfqs8DsyUgs1NaxAKkwN7YOYc9FseLM7mqyGSGybAnIXSN/l+cVeLta3MON4/FequpIsJf2BH26d0BSoTY0n1JKkz0Qxhzi3Stp/jy2XY2D75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+K90cZSRrlNsW4lVxe7sdjaDJizKYMoKpvz2cTLl2M=;
 b=iT4dcXTRXgz7sKz4o3QPrjt1/oQrdjtyvsfWiAhsH2oMMRxQ4sM18VMflX/h7m3UZ8Fcwr1PbZOVueWaCSPVLsuGDF2iVOHDycycY90QwBhcJ0zA/F6iDJhpNWwpKFT791EH90b3IkWtZwjJwvzNU+dy5qAlSLs5rp4VRlHievmg+PoIZzUL0A14lgy1qVvak+W81JhK8C5XQAgcfNRBiu/DQal8Y2hj1zG03Z90D9a4FFiBrI/PxziHfvJ0dZYiVw6N9kEoKs6Z+rUZ7MLhXuSPxRBb5uT/9CE9uyy7e0gOWm2bQD67odMwoqLAGKevZjzgIuW9zyWG7J5oUb5BOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+K90cZSRrlNsW4lVxe7sdjaDJizKYMoKpvz2cTLl2M=;
 b=fZBueeLpy6UtR8znXqokn/vyjZ5Wz1EoZGTEvaEg5yA1WoJ2vwNzlbe1glIfK+MdHyNSKrXBIR79qqj1j/PYhqiideUOOtFFt19MeElslS3iVqo1zM4mRnR5gboQIqDDWdI4tfpt1yoa0ERcitBvgbnEMumlmsk4dUpxIvNrkIcCFASWE9woaUqMSTarEF7gGxkC7pO5+uGN8F/mcKvzHzsU6oUgPD5racJHbYW9Leeec4kq7KipoJqnHYq4zXX91jvCkpxxmhiCI54gUrLOc/dPkRXQwWXhfOe6sO2m3q87rGrujOaFDlU6/d01/1yOdFVPptnDYDn5Y0QZZtpNOQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19)
 by BN7PPFDE2ACDA69.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 13:17:54 +0000
Received: from BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9]) by BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 13:17:54 +0000
Date: Thu, 12 Nov 2026 14:17:42 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, mingo@kernel.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	tj@kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
Message-ID: <avW8dhhssAucmErt@gpd4>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <56e1d372-c938-468a-950b-4f984ad6bde1@amd.com>
 <20261112093308.GI2668804@noisy.programming.kicks-ass.net>
 <87ed02f4-f510-47a7-b3fa-30ad7909cb24@amd.com>
 <20261112103428.GL2668804@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112103428.GL2668804@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: FR4P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::20) To BL1PR12MB5174.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BL1PR12MB5174:EE_|BN7PPFDE2ACDA69:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6a742a-5762-4e59-8210-08df40bf5c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|22082099003|18002099003|261009223027099003|4143699003|11063799006|56012099006|261028144727099003|261102123227099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	amCIltLUabqZ3s14fEiGiGX3iwRH+yHRWEensCIqEPFfw0XycEXIHkFq2S4lt5v7qGUWQoCqSiBkEaxeIGkUQXFEh3XTzzAiCCjwtX7G2ed5i1831szY9coj3pph/mJx3Shh4GEdibxfwfbKbc6e82ZNJHuddogDpBYcpeye0Y+Y6lsB7KsdC4YfmLZiBXsNuJ2IGx2fgqmuOSbBAsb+O6xvNhu0K4NYXhKvjL4XBNLAb1yicRYNKbCh9TBwTPaN5Y8lI7y9+CjwrnXOngySIDN03reLIYRBhUOrep6bJEnISvlJtOkXnpfLt5iBJhjrCzGRk6qLI70MF6Amso94KBZ10BX5OsEThinAQJh/z6kEj2d5RbLo5ICU1I3J49a/jBr6fMBNoqmkXHSYQMyOrhIt/ZVk2k8xLorZaIk+QB/3ZPbpHhDnoCUKCThUPAmSE7HlEsz0w/AP+g/fkrhanASi7ETMgrBe8m9JIQPExz6AyO+bUdYgd2spgpBYFSfKP4p/0Ts/wzNnP+E4KnSWYZgpiwWHhezUDk9pn5rDZjodjiOPFNgl2yyQmp1XbD7tzl9Dpfx/n0dzZLlTAu/kfC2p7gjCAPTpz8kF1BLFCt35fKN5sjvCWbjBqELtnptYscq8eFH/CIXock7r8mrPNnepH/qBWBNc2X5mAQh4x9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(261009223027099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D9mSYSyU21vxibxzc5zLv0Rems+0B0IytcesnCBoDThNiSScuk4+JRl6st3o?=
 =?us-ascii?Q?Jjb2zf1ui+2iN776N93oNpxhcnC4X9xFWUYOdPhlhA4pt++vSFGvU9sSxXbG?=
 =?us-ascii?Q?ekLm0vgYVATVJ39b2IPPrLMgaohy22JsFRp/GLWPleR6ZsBDWqZniRx1fxqo?=
 =?us-ascii?Q?hainoayxO3jPb96IkwzbB9ox8dHn4qRe9m1kBluc+cKNugeIcku+dd5ScYYx?=
 =?us-ascii?Q?3jJyQuo1pDO8Gn9MK6364OrvtYwdlxWhcfYtPOfzRXHBSxDvJurIworhnWsr?=
 =?us-ascii?Q?WxAIHgdKY4tUJFCNgVQ03WBGbLFy+4sSFfl4D7NHc35nY4TrBFkcliiU9J9v?=
 =?us-ascii?Q?nYm2MeMm7dWt7fWNb/C+RZcWviXFa6Y2cWSt08UmCUvGkcjEH8YCaHoWxHj1?=
 =?us-ascii?Q?Tae+MpryjmbDi3M4RTSP3NNsZaj3Hw3M4BruItK5cLib6fwQixaQdXLlk8M4?=
 =?us-ascii?Q?z1vzgEn0XCrpaYg/kunzQfAHDXTIFv/aS8e12Eodj1aC2y4JDvENBGBiEUbW?=
 =?us-ascii?Q?BI0Ztq66b/us0hqALpR/ORloz+mbZBnFXGjP9cLTUa4wCU+0zKq4lnMrm4v2?=
 =?us-ascii?Q?8gRnOoImlYxM0VOZhKkh+lr4sjDTVceTDMXuk4AS/1s5x6vjnDv75Mw/OgG9?=
 =?us-ascii?Q?k2++XHO9Fp62ku5/IECqJnnjFuMCF+zeRXUkOfcf/AAxghRbjWuO6gPO1TTl?=
 =?us-ascii?Q?7h91ZeeGhhRpesFw0MbN/z9HSLMbU9JXj6t+jSM3pf4bOTzIkfiPB8qjEw9c?=
 =?us-ascii?Q?bCIxCgrzlUHK/aTw8g/ULxFr7csdxgAAt+X1oSIh5tQOtSqspeSgjRsP8x6W?=
 =?us-ascii?Q?lKEVHI48jD3meWeivSE6SeTxVRypVc44YgbEqQ9jtFbyAiK0R4oFZHfSltKD?=
 =?us-ascii?Q?PzTSjfahGyH0ASk7EYiamBBpcLf+R2OgYgbmQ/LroVfNbthzCbS0sIbw7w9k?=
 =?us-ascii?Q?La7UjZgyfOoewOXL3VzASR4nJzCJBK9DJdmYBLNbAr1Q8LgL7OFguC9ixhA3?=
 =?us-ascii?Q?yrrPoCd4yjBTii3cFjcoqrKjuFBPl2tejJf3VCDV/7HjrRnThhzAgaGirxvQ?=
 =?us-ascii?Q?vggI+703Dxe1a/w01Kl6r6SvVRNC2yL4RG++zxV8NaVoUVU9PnHWrpNfTDHi?=
 =?us-ascii?Q?SFWJG5Xiza+QD4QCRrh99QbOoAjwZ+rhe9qV2x1OitmKU1MSY4NtGiM8rOa5?=
 =?us-ascii?Q?RK/Oc3Yw7skWUKab3msCxP+RLgPcVEsPHl4AWnAvVAOArUsETWLidPir5ZgL?=
 =?us-ascii?Q?mV5ebZhiwy4C3FPA6kZkmwXKGiafRJfKSLEXIQ9V8L5KOrqz7msz/fsrHFHj?=
 =?us-ascii?Q?CpPJYaZ0JLTgqFIf6M3mRtJZkH/QSXdQI5pqmi2sGaT5DVv36F0ZMGKFrI8C?=
 =?us-ascii?Q?w6fs+vr0ALUOK44H0eHqFh1zM+cXNhFJH8GiFDa8tWMh5ZOqOXnRI1MKpL/M?=
 =?us-ascii?Q?MHaQHEPkBQtgOGH3ea7luxwvBqcIkq20AlN1iPlHcFvPfKYn0eJAIFn0bliz?=
 =?us-ascii?Q?vR211GiD0NJJDp0tHchu3A/g4AYDG8TnhHtWBzTw5UuTyRDy6PUpQOtffvZX?=
 =?us-ascii?Q?c0/PoT+rh7E2YIs7dQSjFccPMBTAHswZ+lgXxtCyRSCBObek8qTgTI/3prb3?=
 =?us-ascii?Q?ctuEIh5BPFVpEWT7wr0heXEUrl22hb+e5SX7Y+UQuzs3iyUcwMPGDdErSAX/?=
 =?us-ascii?Q?dBHsT6a2Dytbwq8OZOGEypP2HZl/LeCokUPu1zkIlywucT+C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6a742a-5762-4e59-8210-08df40bf5c1c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 13:17:54.2608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiY4sh1bFaoV8B5BQkHLrgOaUaffZcTju8KVZxlk2/o32S4DHiLYSUQRmWmBpi/Jv5I9v5InkzhHzDK9llxODA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFDE2ACDA69

Hello,

On Thu, Nov 12, 2026 at 11:34:28AM +0100, Peter Zijlstra wrote:
> On Thu, Nov 12, 2026 at 03:47:00PM +0530, K Prateek Nayak wrote:
> 
> > >> In that case, why should RETRY_TASK want to try balance again for the old
> > >> "rq->donor" for which we have already ran balanced for? Shouldn't it simply
> > >> pick the task then? Am I missing something?
> > > 
> > > need_pull_dl_task() has '&& dl_task(prev)', so if prev was FAIR, then it
> > > will not be true and pick will not cause it to pull another task. And
> > > similar for RT, it checks if the current highest prio is less than the
> > > previous prio, and if prev is FAIR that won't be the case.
> > 
> > Ack, but assume:
> > 
> >   /* RT tasks blocks */
> >   pick_task_rt()
> >     balance_rt()
> >     /* Fails */
> > 
> >   pick_task_fair()
> >     sched_balance_newidle()
> >       raw_spin_rq_unlock()
> > 
> >       /* New RT task wakes up */
> >       
> >       raw_spin_rq_lock()
> >       if (rq_modified_above()) /* True */
> >         return -1
> >      return RETRY_TASK;
> > 
> > 
> >   pick_task_rt()
> >     balance_rt()
> >      need_pull_rt_task() / *Still true */
> >        /* Again: Probably unnecessary? */
> > 
> >     /* But it does find an RT task so loop ends */ 
> 
> Ah, yes, in this case we appear to have an unnecessary balance.
> 
> 
> > > So the problem is with ext :/ They need balance and pick to be one. If
> > > we have separate loops there is the possibility of doing a balance but
> > > then not picking it. In that case ext needs to undo the balance and we
> > > don't have anything for that.
> > > 
> > > Humm...
> > > 
> > > Ah! we now have consistent cross-class wakeup_preempt calls. If we have
> > > the following scenario:
> > > 
> > >   - only EXT tasks
> > >   - balance_ext(), moves task from global DSQ to local DSQ
> > >   - wakeup FAIR
> > >       wakeup_preempt
> > >         if (sched_class_above(p->sched_class, rq->next_class))
> > > 	  rq->next_class->wakeup_preempt(rq, p, flags)
> > > 	    // could move task back to global DSQ
> > 
> > This part I'm slightly confused about (on tip:sched/core):
> > 
> >   prev was RT
> > 
> >   pick_task_scx()
> >     do_pick_task_scx()
> > 
> >       rq_modified_begin(rq, &ext_sched_class);
> > 
> >       dispatch_pick()
> >         dispatch_one()
> >           ops.acquire() <-- CPU is back in control of ext
> > 
> >           /* Pulls a task to local DSQ */
> > 
> >           /* A new RT task wakes up */
> > 
> >       if (!force_scx && rq_modified_above(rq, &ext_sched_class)) /* True for normal pick */
> > 	return RETRY_TASK;
> > 
> >   ... goes and picks next RT task
> > 
> > 
> > The ops.release() is only called when put_prev_task_scx() sees next of
> > higher class which means the local dispatch from the pick stays that
> > way until it is picked to run.
> > 
> > So, the question is, should balance_ext() do anything more than what
> > pick is doing today to pull the task if local DSQ is empty? Am I
> > missing something?
> 
> Aah, wakeup_preempt_scx() already does what it needed here. See how it
> calls scx_schedule_reenq_local() when p's sched class isn't ext.

Right, keep in mind that ops.cpu_acquire()/cpu_release() are deprecated,
the balance-to-pick gap was one of the reasons for deprecating them in
a3f5d48222532 ("sched_ext: Allow scx_bpf_reenqueue_local() to be called
from anywhere").

Specifically, wakeup_preempt_scx() handles SCX_ENQ_IMMED tasks: tasks
that, once inserted into a local DSQ, they must either start running
immediately or be reenqueued back to the BPF scheduler through
ops.enqueue(). If the CPU is unavailable because a higher class takes
precedence, they must not remain waiting on that local DSQ. The
scx_schedule_reenq_local() schedules this deferred reenqueuing.

So, from a sched_ext perspective, we don't need an ops.cpu_release()
notification to handle this higher-class wakeup race, since the existing
IMMED reenqueue mechanism already covers it. Separating balance and pick
should be possible provided rq->next_class tracking and the existing
IMMED reenqueue checks are preserved.

Thanks,
-Andrea
