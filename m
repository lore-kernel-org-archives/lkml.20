Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011030.outbound.protection.outlook.com [52.101.57.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4422261B9E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048783; cv=fail; b=qpPzdhXtPuFU2Lj/kMcZfMvvF5RD8LX1RRMvHtV1V9xP1JniG9eBwaRu91OIoal38OnhIPWsnvEP8PXCXMnVjU/EX63ITUdMs9w//Bs1HahAGK/N+ZwcLPt+7D6f9kipnB4He5N20EwUyN7Rp5XTkYy2cdQ0wBzJrQqY2SPfjV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048783; c=relaxed/simple;
	bh=LuHF0IMmMQGmqLHrNaFCxRydEG9af4pnmnWybMNabQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ckTTQqqyegZHVcoVgBht32f3H929ubgZuYhp+8KMtwqEyWSuYvrPzzMncg+JXjsKy9a6qB0Kb1nlDmoRlxKtu/YTg8qeYacZYR0bkQFj+zGTA8ISqXDsPyJASpdJi/xkaRzcPfRMYcRYCC6OfgajbELpup03Xuv2NERuVKaxAes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n3GWAgoK; arc=fail smtp.client-ip=52.101.57.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n3GWAgoK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U17UcMsDUAT3PD+cSf6Dk6DKJQgLynkKYXOlkVkSI5BetBQeean0jD1m+trOACdnqh5Z241lmbbdmKRWb/nvn6t2ppRyrhcAETYKRoTdc8w0eV07UfNhn/jNw9HjqgswwM5DtkyNUnTZtN/pfCDiSmty8lXT563KVBqlChBxYJoPSal/E0amh+MPs4tAaVAfIwNGy4BtuVJxMQf90GUyy7LqrCpOw4WsAntbtth+c+5lF4FhBsYJXl8jj0EhmGwDv+4Vie5K08t2y2/tkVw2P+WEps4O3br360wDJlLryUEdxAO4ecnWfFlZOZgIEo2Ln0c6MBT6akCXyY8wStptQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OHF+7Jx9tKknZdqz1Q94GfaXdL+Z3YZBDAlGwJQBz8=;
 b=JilZD42rQPvlPaXzvGVlGa0B+HjtFgi10y/d0ebKey/kjqoJw8lQj/guRW9/q1zZVYw0GSYJn+XGo7O7+Oxhp61T3hdO40iiXvtbYW4qPI4KAAw3rrSuuaYScwABubtR3gM6iX3OWr56uyzRkDquzJ+6YXTxDb/vWezQg0oTFi63IrGimJKR5i6n/vp6K/bFMS+ck100MNaqy4yOlMcGpRMar8UqZXGYrOg9X44tjCbIYAQRc+4AgPjsW9RN1uTve6Ym6AEz3L7MGB/GRqagYmnuMKbG3+rkVxrBxWTGKhRnqM31j8aDuXZ6yKrLKCsNkIDFg3Eaan1iMCSIrBD8dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OHF+7Jx9tKknZdqz1Q94GfaXdL+Z3YZBDAlGwJQBz8=;
 b=n3GWAgoKRVnZqi0Mk5xz9UPoKR43HSvWLCWiDqtH+jTro836el45U8S/PO013DATBuJPerh4N4wTYRH2MJT4cp+i1oOmZwYI/THZd1ZAqV7X4bT9x5BQB98txUvrwIckM7PmpXIKfh5vb9AxYfU8022VTlftxqO3cwC6AZaFr4s=
Received: from DS1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::12) by
 IA1PR12MB8494.namprd12.prod.outlook.com (2603:10b6:208:44c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 07:19:27 +0000
Received: from DM3PEPF000265BA.namprd04.prod.outlook.com
 (2603:10b6:8:455:cafe::20) by DS1P220CA0012.outlook.office365.com
 (2603:10b6:8:455::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 07:19:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM3PEPF000265BA.mail.protection.outlook.com (10.167.23.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 07:19:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 15 Oct
 2026 02:19:20 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 15 Oct
 2026 02:19:20 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 15 Oct 2026 02:19:17 -0500
Message-ID: <96aa144f-3de7-4326-b574-f7a2cb150424@amd.com>
Date: Thu, 15 Oct 2026 12:49:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/idle: Destroy on-stack hrtimer in
 play_idle_precise()
To: Hui Su <sh_def@163.com>, <mingo@redhat.com>, <peterz@infradead.org>,
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20261015025029.3356060-1-sh_def@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261015025029.3356060-1-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BA:EE_|IA1PR12MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 70243f93-d445-4300-8d0e-08df2a8ca57b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Aj1686Lhn9XH8+VlMQwstN1XFJFr82BWZ2/XLRw07R4DaEcdBNFTRJZwUt+IQEPeZz76C4+T+Llexf4qqbIgmIYQq5m9fY/L6DVoDaB24RFJUNws2ZhXd2T0gRzMNvzxdBCcsANk/5H1Q6PurHP/QLY6COoPbrG/nMj+ZQCvSnj+a7cHzVMbPs8QWn3w10cCEfeFddRCGosHMJo6rbHLUV/AiZNayJTbMIEFnzFk2Cze26fGWCh91X78m3Rzu4beie8muQvIrJAQ61S3epkDj9TOPdKea4xZggwUEWBwEJa5oL1uRjbsUJIkEYiDFuqPIvatJodNh9r5ex1ZtkRXi08y0LvQK+STlRWiHab/3/2r9YIGM3Vek+cuWMpxqLb7j6pAz8EPvkFutvLs4/9goPySIzgxCi2tOk87VM6IVFA3gpmq2VOfZjpQ5HjbOq5FyROyQDOCyaqk8LSJNcMuVrSqWTlZobp8zjMaFnhAzaYNgNJ9/l3EL2mef5nl3CT+A+lpA2mHLG5eGpI8BmaNuk45IIgdwpKm3WXI/UrKuHmNdu1P0lcw/xGL4QsHt+w+Wl3ymHm4rLr3tj0I1qCH4ihXQv1kRxsigvx6T//H6iHQUrQJhvjif1PtWTPYgYE3FRxluZ5ugtE33cVUc6EzK9v38LM9X0pB39wOJ03vin11pxiZSNTyhKXAgIRzf4UIKZYaPTHn3XcPz82x1nevnA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0ziBEHyhtq5WrBYnYMIgDSNgHntbkExQnk4J5uWztiQdHatN+ucUL654fI+2z4o067bXSJih9ruc8Iwjyq9kl+GyvPw9MVp+hZPJ+qti3AtsZIEUfgGwfuIn6rRuDs4n+ansiBgYtBahDApgjwxUSk8Ow7ZlsbL3WtYqkoRlSLDqoBpAkLmcdMZLN0x8WNPdyahhZHumD5zhm6I/qqKVTMd9c4fmvb1wd48LQL9todHBlc+hAITNSb1Bqd2YTlOG5qH4W38GN1Dvw8BRLYbUKiLgntRc41dRz4miwsBZH8rdub4Y2Z5MdYBN+0lcj4R4398iJ9s6+BQhpNE5vyQXR7VaChvWMeiq6QbKJdY+/DJWTwtw/A6HwoB+amZ0puMcI3eXftXFLESl1c5maGRxOM1ELNY9IBmHBn43kmgOtzZHPKnlLcPmNR3Mi4PFGqiM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 07:19:26.9237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70243f93-d445-4300-8d0e-08df2a8ca57b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8494

Hello Hui,

On 10/15/2026 8:20 AM, Hui Su wrote:
> play_idle_precise() initializes it.timer with hrtimer_setup_on_stack(),
> but does not call destroy_hrtimer_on_stack() before the stack object
> goes out of scope.
> 
> With CONFIG_DEBUG_OBJECTS_TIMERS, hrtimer_setup_on_stack() registers the
> timer as an on-stack debug object. Such objects must be removed before
> leaving the function which allocated them.
> 
> Call destroy_hrtimer_on_stack() after the expiry loop to balance the
> on-stack timer lifetime.
> 
> Fixes: c1de45ca831a ("sched/idle: Add support for tasks that inject idle")
> Signed-off-by: Hui Su <sh_def@163.com>

Feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

> ---
> Tested on x86_64 combined candidate tree:
> 
> - hrtimer setup/free oracle: PASS (127/127 and 129/129)
> 
> - bzImage and modules build: PASS
> 
> - Branch-specific validation after split: NOT RUN
> 
>  kernel/sched/idle.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index eb73b65ce6c4..96adec3f0a6d 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -436,6 +436,7 @@ void play_idle_precise(u64 duration_ns, u64 latency_ns)
>  
>  	while (!READ_ONCE(it.done))
>  		do_idle();

nit. I would rather have that newline before destroy_hrtimer_on_stack()
than after but that is just me :-)

No need to resend for that nit.

> +	destroy_hrtimer_on_stack(&it.timer);
>  
>  	cpuidle_use_deepest_state(0);
>  	current->flags &= ~PF_IDLE;
> 
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> 

-- 
Thanks and Regards,
Prateek

