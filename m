Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010014.outbound.protection.outlook.com [40.93.198.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDECD30F95A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674228; cv=fail; b=Lzkpjfwt/JRMPzsR1TnZkTfB3iuBAVixADARDKrsCDTuPoagzjUaLBU22KDQ+dUqOWVHp1CusdZbsw5XV6HfrrOtBMSnv05x3JvsLqGsuxehnwxIgyM3J64KVA/1byzTn5AdYnPV7grJErGza2PYdgos6GrM6akHv+GyptgEzM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674228; c=relaxed/simple;
	bh=mu/R1/fkhWtqNbX50X5OexH3d2Lv0JslUo41cCAF2+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EY/ev8jRLqE3XoNRETecE0QAVeuBkQHmzdMbufyxC8xfDu+CIRBtpvb3qS2hKSRjKhVDDqlUkU0zYCPJRY4iYqdGflRlRgojBgTrnFq9Vdipj34dKMEs/RH57nxbnvxCj3ltaHZh8QJoJvkE8XYdshE/ngMm24bMVoZsKm6U1so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LwB8AA+B reason="signature verification failed"; arc=fail smtp.client-ip=40.93.198.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LwB8AA+B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNAQyY+oryokfgUqvnviLg2j48l11y3ZTTWT9BxAXDDGGrXRXUrTd+DZTSKdRFyOFReV7IYfQxhV0KwpPNb833JwSdP23E+mTXAEVhzeeqezGKPRYs9432jj4zrHQobgb5Un7yTT3SA7GFxzly8zbO5gOStf5XKItRXar6lgjAEhAohkeuFcOCCFWd7mqetzTEtQ9Cr6O1Crc8otUqZJ5QbuYi+oNq+boDeOcGAQbMJ4333mnTXd7G2BHvadKA9xlth70vnQSPgyK/cqPCfa+nM1y0EjYM0hEmABC7KPg5Yo93BvEAMBRokz66NqTMQG6jV+wO58V9ULJDHV5FHYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YObycJCeI1+3yZbs6FA8eBoiPieMWY7WrY52mvhHp8w=;
 b=AUwHRvgHmanPOZ03+pwKoDJ4VyNaPSixmQvBr5mi/Ec4XmBE5pFGZfmh9SgW3mkdCQVyY9Q//1dojCmMCJmwOLGZ9l4mVt5XA9Dhy7A5A21LQtqkiv70uTVV7Zix83Faijq47JdUSKw43vXHZsMZ+TtHK04XQqamS/Ir4AHstIbTm1pWnc3OkNnKlHsMCN8B+pgcJI7RvtO4q4nLBzaQg8LdFmYrFdAhPEvDl5tprRMhSKG/BWeEPnGoLAmeQDnqb6PUCfLEwu395v7Q3B9BkkRIRrL/eaulRrt0p4LKl2XqyZ3uWZHVQrqiqR/ByAD6ODbVBU1IsrfCSW7t0wf9rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YObycJCeI1+3yZbs6FA8eBoiPieMWY7WrY52mvhHp8w=;
 b=LwB8AA+BTzQyz6JMwuqnOCrqTVOFHA2q6C3hHwy7JtKGTe813jVXSvIOBxeTbm43QpqS1yppUQoqnrxIe36eoqtCdlju3wXbawibkByFTz0JjtUwDr4kFtdK/fV36uEoQJxa6pRDXteFzN0z3i68dRO2SbBzkECmho6giQJSFiKkAIF7VnFZPljO7Uk+vKVocWZD1L0ZNDbNmRmE/3MLr1jSGaviyF5lKIwGXks4sRgfh8EMGLO6kG4RE+meCyyzWDMmgKg9eFV1RF8q8e4NZHUYbNSEEnIvSpHcrm/nkKUzzc1OnjTIinQ94CrrP0X6G1Gey4mfaQRq+vVjMqkW2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH1PPF0316D269B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::604) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 29 Sep
 2026 09:30:20 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 09:30:20 +0000
Date: Tue, 29 Sep 2026 11:30:11 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Sechang Lim <rhkrqnwk98@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sched: set TIF_NEED_RESCHED before calling
 __trace_set_need_resched()
Message-ID: <aruFI9rG45Xtmxeo@gpd4>
References: <20260630084750.2792851-1-rhkrqnwk98@gmail.com>
 <arqhnt6lW8qiCo19@gpd4>
 <96b3b5d5ec0eae499f1a98845720776b6fab84d4.camel@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96b3b5d5ec0eae499f1a98845720776b6fab84d4.camel@redhat.com>
X-ClientProxiedBy: ZR2P278CA0023.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::18) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: acd23ce0-4f61-4c96-0950-08df1e0c4780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|11063799006|6133799003|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/+B2CpMPumEpxITc2t3htPOplpebHyGjgzzwBrZWDK5iltuPfbqG4gj8W92Se8kZZgpVr0jx+M+rWheUiu527JNWpSbko3x0BnFVLzT59jH93aLSiBTrBGZoAHICRfY0GP2ST3yYIK9i9pOnQ9nVbni2M48Sv0vcoIX8I0Bfn9F6dcuWt0eWlv0OMEkVC9iQVvFG0TX8UcyKRbwJpyg65KWgALp3YKdWW1ARYanNadh6z76Kv+OlFM0d3Iw5YOBXL8yzN0Rl2aFgIQcbGPeLmdYPslFeo9Z84XF3RCkgrla2XZFyv9VhmKEevK4pBFksKgYcl5cWXgXWxXmxv/S3Kg4uSe7rJzc9hX6lqsQ2VEnqQEeEN3gjScd9JmKiqJYMXMl7Mdtg91TsL+XaAZgPJIS+2jfNwAkgHqRnOH1L3IQi2hKbPsQ1091kDodjeSykNFNsG3RHsKMoPgv72kg6VP18NbscvUHfpXi5A3v8kwFovzxQCbKDW7lcmpqipRc8WjxLB4Hrxf6PORUvqUMgMn7HhXsqMqUYl2kdCenj1K4zdmrbOFM//wy4s5mqkSCgLuh2tRA5hyAgT98xjvYcxx1REM3Yqh5v2mCKnHDLmxWkKkUJUioRbu+EdqDTllXmUUD3e2IQGtHeHG/wJ1Z5pxc5TabJ8jhCd8HCh/sRKp8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(11063799006)(6133799003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2VyDGVRIDLhc1Bvp1KVa2KNqslcrkcsEviY+b3zWjzO42uBPhMTpR4Nu6t?=
 =?iso-8859-1?Q?xbcI1vp96mToixKYYB7mZCyOp12lsCz05EbRwifY9cAL1Q3R7bQeMYSi/w?=
 =?iso-8859-1?Q?EYdpy44xXWQiObl7Sh+FAOaBaElXdrfHbOCHG4nr9iUUvbxlZmn7+CXIP8?=
 =?iso-8859-1?Q?Ky8oxRhUGIbh4+n7UA5qY7DbxTNd7PZZOBdC/AfQW+heQwpm1Ke/rFqarN?=
 =?iso-8859-1?Q?ubItt/R7dGKTH4wsez47LAMf9370YCLZlxci+XqZeGWcW8wjeRzm7EFG7D?=
 =?iso-8859-1?Q?w4WJmOyLzo0VGKXBUpZQLzke9OeK14tkCrr4x+weIz3v6AYu2PT/7wkxW+?=
 =?iso-8859-1?Q?87h6Vqcim97XjuV/zk6meHmt3iascLoBjdAZggeGBuaxHfDJOXMmDbEqRq?=
 =?iso-8859-1?Q?ADTR6fIvv2qAEQD2Dj/NuEcKdU+IK48RM3Oicrcdf9PU+VA9CtAwSyIg+1?=
 =?iso-8859-1?Q?4mC3YbEnT4FHVO5LaevPAt5P0hY45OXKX3emJnm5w6MzA7GKCN7kQN9SO7?=
 =?iso-8859-1?Q?uYAoC3hLxcCdjK0sgLga05CIq2BvEG09brdaQrh5CUgicGzjUH8CAkOseF?=
 =?iso-8859-1?Q?FHm/L6ecx6cffd/YP1YEN7rMv1RTc9k2FiP73fPwtDFNMx3K9VI7j7Iafe?=
 =?iso-8859-1?Q?ET0vO9RUYSDNyPlQ+U0dy8n90epgjt/NdwGdYhdqKg7LxNaZRmCPDcdV12?=
 =?iso-8859-1?Q?C/xToBd8Cvvhquj1GhcOFogYdWji79sylzdC3iwFORPiwMGj7RbQ/OQRJL?=
 =?iso-8859-1?Q?PnfjDGxDNAs+iQyh3jw/7JQfubxGCSvn99lVxpOf9Y/XU7KhN6WKqFkfU4?=
 =?iso-8859-1?Q?QxNWHyrLlU4eDYQ5jKUfVf/S6alXISLI/WIWX3qGGRuQFWTRe6FsaL65VQ?=
 =?iso-8859-1?Q?B4yQ1zlPIiuxv5U3Vww1UG7QUU4G1oy3/RUUmD1YBZqrPpmPs01aOxEYsN?=
 =?iso-8859-1?Q?kRBHj3pmNI/A9B8TMSso3Rv1Ep7cfgtV0auhfPBaYvRL9YBOsDlq7lYYWB?=
 =?iso-8859-1?Q?P5RGDN3gx6Un7VYSGoXHtpfZzFTT6Gu7YD1sATEQqymS/l/z36YgnJ30Q+?=
 =?iso-8859-1?Q?jSD3amiYyrcRKZgBEutSeuWk1czALAw7aa/mJnj9MUy3yo1obRq7yWu+sW?=
 =?iso-8859-1?Q?Ugy1pCpsu3vwj6OPNW59qoqiJH6agVTDlrQPdAjW8tIXLAChrnhf1TwxQs?=
 =?iso-8859-1?Q?SUThZ+wq/PBu9J93lwrgl8v81iTo+PMJWj8SMulfDoof0EXSbP3JKkoRbf?=
 =?iso-8859-1?Q?2AvGva8m6ivhfv3xKbHNlyoCgj2IsBB1A3IH7Zfg5Eg4ag/wSUuV4hFkfV?=
 =?iso-8859-1?Q?qRZ3Hta6ZdZUzaQ2L1+rxhgsA9RRuZwK0cAt0NyBsaJhhN3gCR6JPyY4vH?=
 =?iso-8859-1?Q?+Qwg12DbPnfI62b2qE0bA8jwLNPMVGoapnpb/cIZSjlQHWJ3C7WXD1X3aF?=
 =?iso-8859-1?Q?6zVQTVxYfrkuTWypp6Yujm0M4zf953AAamQG9xiE5Y5/Y0DJbYoIBU+jRU?=
 =?iso-8859-1?Q?Mr4bsFzhTdaJWqA+Ib8k7RyR8zWz8Y86LQ7QJNbBeZoQOp6CQPtKaxKZyI?=
 =?iso-8859-1?Q?H/72x406HZ4S9vuhyTj10qMZPudO5bh1+43QEd7XwYrwfkM6DAr1f74OcY?=
 =?iso-8859-1?Q?plazkoUQmZzET3w3KazGzXHX7U07heiqaBFeGKAz+qs3lZV027LqInTemy?=
 =?iso-8859-1?Q?7Mrt9jZKXznj7t/AWVImRl+mGuR2mE3Ta5YtIVddc2SNrPZwfQG6ePGh9j?=
 =?iso-8859-1?Q?Anr1grnavVwwcURTPHJhW7ngXgCeYyxpKaPPQvTlpcjOe5AX4/Xns94Uvb?=
 =?iso-8859-1?Q?61Xe+zapCw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd23ce0-4f61-4c96-0950-08df1e0c4780
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:30:19.9504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1Q7BwOk4yHaxAzgcYvE/caSc5I3mou9ncQMDkB/9V8oE5gNjwsYtv9QJE3DvBZmg4lPVfns+oJgl+NltsosfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B

Hi Gabriele,

On Tue, Sep 29, 2026 at 10:50:48AM +0200, Gabriele Monaco wrote:
> Hi Andrea,
> 
> On Mon, 2026-09-28 at 19:19 +0200, Andrea Righi wrote:
> > This leaves the race Prateek described in the v2 discussion: a remote CPU sets
> > TIF_NEED_RESCHED under rq->lock, but the target CPU can emit sched_entry_tp()
> > before acquiring that lock, ahead of the need-resched tracepoint.
> > 
> > I reproduced it with this applied to tip/master. With the RV nrp monitor
> > enabled, 300 runs of "perf bench sched messaging -g 20 -l 100" produced:
> > 
> >   rv: monitor nrp does not allow event schedule_entry_preempt on state
> > any_thread_running
> > 
> > Applying the following on top fixed the ordering, the same 300-run test then
> > completed without an RV violation. If it makes sense, could you fold this
> > change into v4?
> > 
> > Thanks,
> > -Andrea
> 
> thanks for looking into this. Is this change required for anything else besides
> fixing the nrp monitor after changing the order with need_resched?

No, I was mainly trying to help get this fix upstream: a sched_ext kselftest I'm
working on hits that issue and I'm holding off on submitting the test until the
fix lands. Moving sched_entry was only my attempt to address the nrp warning I
saw while testing the fix.

> 
> I believe this would break the sts monitor which expects sched_entry before
> disabling interrupts.
> 
> Both monitors could be adapted to either case, but if your change is just for
> the sake of nrp, I think it's easier to just allow this race, since nrp is
> already allowing the race with interrupts.
> I haven't tested yet, but something like allowing a sched_entry_preempt without
> need_resched set but provided it's going to be set before sched_exit would
> probably do (it'd allow also independent need_resched there, but those will then
> need their own preemption too).
> 
> I'd say if you don't need to move sched_entry for other reasons we can wait to
> apply this change until I see what's better for the models.

That makes sense, we can ignore the sched_entry change for now. With that,
Sechang's fix looks good to me.

Reviewed-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea
