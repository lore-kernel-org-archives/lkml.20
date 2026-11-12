Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794465979;
	b=R7I3J+WinmX9kbkZJrMUO0pR+aZxTTq+vXdpk7heI2DjqwPGQSIRNMVqYvpafPOzIKyL
	 y/uPbaxb/4Qf2aI1bxGrqnKFIDq31GJKvsVpR5sZbC8vsriw4ODIs593r0NjCuGD40Jkg
	 3Dw1jdhGyCdfbRZqrobbfr69ntSOr4+WxfoV48RWBC57IBOGQ0LJFhnNjaOXMjr3CG1X2
	 jEt7Rk2evP7r3enwNrP6YPPKgTeSgfoGeKR/rgn2H+Fxpy3nJw9LSmcM3ghfxOU4rPWMq
	 9jveZshjhL1xEvn5MUuqKRJTCQoUotuLfqIXZg3eohNmiUGTWOWl0azaJQhEMX3CDbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465979;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0RHYum4XXi3iigEiDvEIslV/xiPgeLN7rqvxK5MbDUY=;
	b=WwZR32DMwHRIKXUv5D/pNtPyeLqkTxuxrj8HPnz1WXxI2Hsf1c9dyEisZOPmOytk82D4
	 wrXeGqaSNU50r0slSSQYh/anQgqV/PEhuTJmso+t2Qc0L9JSPcd7ZVTK+PSJw4PLIJ+ou
	 PktCYaFuTWdQ8Zs16+UdNB9uuuqFodOBYotdve2I1pmptdgEOH7qHa4oRgUIamYh9osfq
	 vf7TmGXpqtf0wdF3AmbVZf5GS9eohmR2wE+IbHNK4O9nu0Ji8opPi8HPH2G+xVVECA1Nc
	 j3JlGP1dde13KtODl332gDBrvH4iM/mRemYSeJ7UsHNSsjGrXgvN4pBOk5DLlyzMoYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SWPPh8XZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.25
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8666D606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8666D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SWPPh8XZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0RgTkdIxPrAvYkR+SAHrpkJruEGPBwfps51+59SwwzAu9ccckm20ypoUaEzKCdJBVkv0y50xoFwRcW1CXY0D/Y0fsRlWTP1fbrMqF9fEhSfHRfp6MMfrDOKP2WpOyAwDy0pwNque0LFPlftRt+LLziJ2JWanaARDn2q/IsyN12Vx9ZY9p4vV7FnroQ7G4jvFTj5ZP5lCt1Uismn2A8+Et+Hgqm8GvITC4XZjdAkQIZa5dre7sSiA7wpumfK14NYW4QoVaT0FdblRtJA2UlYzbrQNkE7Khk5HBtKGYCR7DeOEFha4JOqBpgH1K8Qy9vzFeWQELHtd/28h4UX6KTMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RHYum4XXi3iigEiDvEIslV/xiPgeLN7rqvxK5MbDUY=;
 b=sSU6RXw/gp/BW7PAqafuW3zRc7wPthCA/j4/WbpUod4NvO8etZJwWRlWHCgjdpnvo1FuUQIxlHYIleqy4FqNmeTS1/RewolePiDK+27ag5uoNC1nBrRLvkw4fnAbtfaN52o/zLYKc1QigwcNhTw2fIj9A4y6hbIY0sBiJXivCo5u6tZxBGT54mPIINO9KJReycS3rOSMViTO2KE+OK8LGd6sae5yKxeI/rmurBkz2/L1V50UknV/HV9GDqHcofggip+koVAARfC2BoErydcu5nqSWKKDJj+mAsn6pCM0w+1WO8a45Erp9p8dMxX9OqgJ754vcdskZejXGnxnfkpQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RHYum4XXi3iigEiDvEIslV/xiPgeLN7rqvxK5MbDUY=;
 b=SWPPh8XZhCge2UwlthcArpTIcTH3/Dnw6KQuPc9YWo5wTR1lJIdAJOFPO0UDkgOk7x5V7Qr7a7IskHzabHqqfVaWFRf8hMdFnBnG+jkLoiSMfUHiR/cHGugcXbOPJj44W1tvC2mR4CjI4mR4Q/xnZn82qT+2EgxZkgQ//zS1/84=
Received: from DS7P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::11) by
 CH1PR12MB9717.namprd12.prod.outlook.com (2603:10b6:610:2b2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Thu, 12 Nov 2026 06:46:13 +0000
Received: from CY5PEPF00000E77.namprd02.prod.outlook.com
 (2603:10b6:8:2e:cafe::2d) by DS7P222CA0009.outlook.office365.com
 (2603:10b6:8:2e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 12
 Nov 2026 06:46:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E77.mail.protection.outlook.com (10.167.247.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 06:46:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 00:46:11 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 00:46:11 -0600
Received: from [10.136.34.22] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 12 Nov 2026 00:46:07 -0600
Message-ID: <56e1d372-c938-468a-950b-4f984ad6bde1@amd.com>
Date: Thu, 12 Nov 2026 12:16:06 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
To: Peter Zijlstra <peterz@infradead.org>, <mingo@kernel.org>
CC: <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<tj@kernel.org>, <ziqianlu@bytedance.com>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261107120208.153536827@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E77:EE_|CH1PR12MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 511339c0-10be-4b21-9f24-08df4088a43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|7416014|6133799003|18002099003|10067099003|22082099003|261102123227099003|261026121527099003|261022105027099003|56012099006|261028144727099003|11063799006|4143699003|261021123027099003|261022075727099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	y9d4IzqZxCuY45SqKPWlukMtWsaytqOmrAh135j4ZNBc4MeKJfhsomRzD0v5dOJgcd3WULWsxPlWwCXhyRMRL01x4cWScUV4WJ7e6PiQs/+hj0CAVFHQhmMqygj70AwKfKpZiW8i45C3rJyvHm19prPDuCy0z/Ws+uXRkZLh1xyZf5ItbW1A7s1bTGGIb0OJfdPuEC4kOgs5Fi4bHtJjIBNDHXfsVbvl0zMweFvE4juxbQY5RQIv/wA2+hbjaOXQSnip7Tw8jTAkslQV088DICbjSR/zO9C3vhN31izAc73ehHRxvcgPizgtmYnUXqgwvxfeM3Ir1tBwyamj990smGNZnHRkoFwqobxb47UPC5hLLiG1qfLhox23gbcbk1d7SoCDsRRWIEW2L46/3zubP9XixjRpNM0BPWy1YCMeeR6KUtQAOsiBuaB5Z52FCuJcUtkgJOP/R7FuprDHUpF6UMoZDTJpTQkwhyh8xWMz0T1de7dvayZvZkqyXtao+ZAtfXpj/nqVzvcbphgVU0UECf64NJQJwDOCryqMgscHJuc/iQAxvsGmi2BVx2z1UK9WkwYG71Zw4jp4XJFdE2O8WuCPIsl8IGDO2+gLFNHHzAFHuJbknOZHoyGMvCcm+nih+QNGWLDu9Yk+tw4VbvcJhKDJLmvPURpRC/MUVouS3GPyJKoCeKRTXoxFfW7fKiN1QyNDJPsLNpXPyeIzrBclWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(7416014)(6133799003)(18002099003)(10067099003)(22082099003)(261102123227099003)(261026121527099003)(261022105027099003)(56012099006)(261028144727099003)(11063799006)(4143699003)(261021123027099003)(261022075727099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QoYgnR3p+L7VG38zVoViYYoWIQ0Y21fuaw+1SZ4tZ8PWHgDeR6ahRtfNrHNLLIRYd/n4av2LDUk9m4XSbzUnGG19o6/gm8hyBFVYt3AQCW2o/x8dHROQlAB1Y8VsAktqO83HYt32BGxCBexZ8lxOdYOz2uj8ga6Qy1ZqFf+0W5G7c1b5jJwzZ9IZiKf7bs0c4a6Q5gGEQUVf2Bd+P4ptNOBJBPr0aUTuCOqOJFlGabVAmt4SzW4WosDW0ITKzur2D5fzzEok0bObQ4sHSgkLOMSMKxrb9+vY5CFa9SpAo6fVZnYMBayL47Rseo6Ag2SE41LhR073DGFzc8o49KcbT0IClkHuA5NEbpQ2ADkcCMARnZ3Iw33Dh/Q19l8fbx6QtnKpoNVP2cin9hoQfxCUHhgO7Rk9Tx/hYrtgV8ilm1oBKvvevCYO65lx612FsooD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 06:46:12.4359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 511339c0-10be-4b21-9f24-08df4088a43f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9717

Hello Peter,

On 11/7/2026 5:29 PM, Peter Zijlstra wrote:
> Ever since commit 50653216e4ff ("sched: Add support to pick functions to take
> rf"), we have the unfortunate situation that both sched_class::balance() and
> sched_class::pick_task() have overlapping functionality in that they drop
> rq->lock and balance tasks.
> 
> Additionally, prev_balance() is only called for a single RQ in the core-sched
> case, resulting in 'missed' balance opportunities in this case.

So I have a fundamental question - looking at the deadline and rt balance
callbacks, the balance is only done if rq->donor was taken off of rq
(blocked / throttled) and we need to pull a waiting task that might be of
higher priority.

Now, if the balance (say for RT) failed, and later, a different class' (fair's)
balance callback dropped the lock during which a RT task was woken up on the
CPU, I believe the wakeup path would have already done the balance while
considering this CPU for wakeup right?

In that case, why should RETRY_TASK want to try balance again for the old
"rq->donor" for which we have already ran balanced for? Shouldn't it simply
pick the task then? Am I missing something?

> Just like pick_task(), prev_balance() would iterate the classes and stop when
> there is a runnable task found. The only difference is that pick_task() starts
> from the top class, while prev_balance() would start from prev->class.
> 
> This means that if prev was an RT task, we'd get an extra visit to balance_dl()
> -- and similary, if prev is fair, we'd visit balance_{dl,rt}() both. However,
> this is not a problem, because both need_pull_{dl,rt}_task() will DTRT.

Balance still sees old donor and it can still try a pull if the newly
woken task is on a lower priority than the rq->donor. Is that desirable?

> Therefore, move balance_{rt,dl}() into pick_task_{rt,dl}() and remove
> sched_class::balance().

Until commit 50653216e4f ("sched: Add support to pick functions to take rf")
that was how pick worked and we should perhaps stick to that. commit 67692435c41
("sched: Rework pick_next_task() slow-path"), made it such that none of the picks
could actually return RETRY_TASK and we are actually moving back to the same
state as 67692435c41~1 with these changes.

IMO, we should re-introduce balance_fair() for newidle_balance, and drain all
the delayed task if !h_nr_runnable && h_nr_queued to avoid pick hitting the idle
label altogether.

Doing newidle balance for every idle rq's core pick seems too aggressive. I
think we should let idle balance / balance callback handle those movements after
rq->core_cookie is stable.

This also allows for us to now do rq->next_class->pick_task() and that should
always return a runnable task and we don't have to ever juggle rq_lock between
picks which has already led to a bunch of issues.

-- 
Thanks and Regards,
Prateek

