Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EED53D0D5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656003; cv=fail; b=K5v3RFUAIx4LH5iXiHBR4sHJLtq64jykzrIkTorS58Fib4cVV2LrxIf/xNO5MtjzoLpB5rtMRjWf6gB634GP2iUBU+x6THWRrHph8dlRlrn8sve6ggytGD77bUM+YATYyejPNhWzTK8+QFCw4QTValyii2sCUMt14OAcK25bBno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656003; c=relaxed/simple;
	bh=F3KREXenNaCwPpd/V8b+0apcbqsNM6zMK7Co9dxSsHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bQTqVod1680xnqKWJuhGPPhfaft8P2qxuVqTnc0BdU+R26ew98AvGoCiTLb339lFCmWs7KTaenN9JzfWPodrUVik6QKm5fGggXX36VmRDY+lOikCA7O8riKQsU+iy74cuavR722HkbWaB/YpSfx5290JyDiT8SsPwwt/mubyQMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MI0GJnTJ; arc=fail smtp.client-ip=40.93.196.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MI0GJnTJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQsj1LP8WgYQK64H/3DkUPNDNY3gSBPF/2vVmlF7WhqlbCDPxroxAw5MbQWDIf4nW/SUYlMdM/78eCQ4d6WWPIgcINh6Qc+0mGUYW5pmTxYL0/nzireU0pH9hOBHWyUDSZvgKmyCxt8DUa3ul4CKj73UIfdLpE7v5q28fwdJ7gYS0LYV8VBoFp+GVz8RwPTyW0QC+A0tQWnOfaxwxrcxetFtR/oH0JdKZg06Xr11fz4q4OxO3T2bK8+wQtsLxnApe5+Ppy+GgovDNwsMju/jUot7h2n9pIZ0+cYMsE/U6yy82fuWHwX9Y1IOX39htIDKEh9aVyHluHDPU/5A6d71/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C31QnPJsUp4ID5NnrV7J4waF2ljKwntV7BcDpxLRSfI=;
 b=ZJUK18ketiuKMMKsVcjg3d0Z+QxJ8yu6UxHqM2p5TIZjxKbxpN/3zhS07RzsKKbsam7UTwb3H42ny6MOuWo4WFBMjL51aeJozO3g06PP5ILL/7VGI0ksrwtillxpsHEiIaHiUBulUlV5jFq+XJDThid3LRQQm3eSTfElO8M+4f+LUvl+oNsbbHtI8X3ZxcNm0HFDD3SuUE3RfA0JAJG/lqBBBpZUaV2XMzprDDOGH0KGgjTPSv5F/eXG12y6IIY5Nq+cKCwe2HQS0clVuS7K2YIyCRgqHrhNgHrlstdbkWB2gtsam1zf/n0FM96Shf+C5ETKxyIO7DOFDecv5jo5Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C31QnPJsUp4ID5NnrV7J4waF2ljKwntV7BcDpxLRSfI=;
 b=MI0GJnTJ0om9dI49+0LLo2FDialvMpMqTOO9kp8ufiOlac14+BOQH7uDyD1UI8XFJodZrss+1W8OSFXa1ttefPT2CDUeVpX+WIrHDg9fN/nXV5Wxne1rqFvMW+CqGtFijuLgsaDGpW5/YJoljp7CyiIIgX0NrYTPJx8OmSRnuj8=
Received: from SJ0PR13CA0067.namprd13.prod.outlook.com (2603:10b6:a03:2c4::12)
 by CY3PR12MB9631.namprd12.prod.outlook.com (2603:10b6:930:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 14:39:42 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::2f) by SJ0PR13CA0067.outlook.office365.com
 (2603:10b6:a03:2c4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Thu, 17
 Sep 2026 14:39:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 14:39:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 09:39:41 -0500
Received: from [192.168.0.226] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 09:39:35 -0500
Message-ID: <8abf8b0f-38eb-4a25-a40a-57d5439e52e7@amd.com>
Date: Thu, 17 Sep 2026 20:09:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/12] futex: Make FUTEX_*_PING use Proxy Execution.
To: Jihan LIN <linjh22s@gmail.com>, <suleiman@google.com>
CC: <andrealmeid@igalia.com>, <bsegall@google.com>, <dave@stgolabs.net>,
	<dietmar.eggemann@arm.com>, <dvhart@infradead.org>, <jstultz@google.com>,
	<juri.lelli@redhat.com>, <linux-kernel@vger.kernel.org>, <mgorman@suse.de>,
	<mingo@redhat.com>, <peterz@infradead.org>, <qyousef@google.com>,
	<rostedt@goodmis.org>, <soolaugust@gmail.com>, <ssouhlal@FreeBSD.org>,
	<tglx@kernel.org>, <vincent.guittot@linaro.org>, <vschneid@redhat.com>
References: <20260917043339.2093426-8-suleiman@google.com>
 <887eff66-35f3-4703-8ff7-c0c959621b69@gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <887eff66-35f3-4703-8ff7-c0c959621b69@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|CY3PR12MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: b36ee8e9-6d99-426d-2962-08df14c98285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|13003099007|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zmBAudWtfW67AJQon7yP53G49SSdIbiry2xn+E3caVu603q+mH8upnVYPam8SRnKvjoKQGj0eJhCF6dPLifbV/KUtYqpUBjssUlxQAjDiXqW7xOQUYhNhcEdBoUTRm2Zi6C/ZyKKljnAgBKYnVG0M9DzWMxC61PUJo0RAsABJGuOJyrS5IwTKeG104ZexwrBlFCcqvevvIDl1y9r/bHcYqtllFd8bI69OgKiQmakSpd1aAfLWCu5jOSVmEKHpY67D1azaW3o95CZ8idrjkAhN01CTkESxgjVD0YmdNoHDQvUTA86t7sD1g4WQWcedgy8kG6nhH85qpYQkzd13YNJncjfI3k3RgxA3kfqGbNl5Gt4254GrpYFQnV5RFYX0/zgsq1sd3/tB6zvlkSgoqcaG3r/v3iz0uBVZ6JxNSnN0e1nprAZ8Dvpf1jDb/+w4IngLlrN+eJonUyPhohEX26qhkqcdjDUnigsHlg9tempRTi8mfygtU/yGj9Jqft2lq9gSrBCT0Pf7j64CMbxxo6Q+EkYKknqNVPp2jiYdXmPZRCmWAmHr9ZbWxN899MrYhJuZ8Zc5p+4jXLhOf92oialumgYpvQXxngzMxXPUuYkBZcCfZ/QhNw27+POjv7EdheoiFFUkvc9kMWWDDqNFCTyDY7SI0srDHDDEGQ0PCAcDOotrog3D3pUVb32sQtW1ikdG7Xom7/cW33JBD6ud76w2A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(13003099007)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D6CnNZG4A5ljqyp8EX6N76LmtLmC2FrTx1n3WlybtuGWFT0GlxWzNeBwa5q6lAhiMwEpBwFrswhF66OoJpJjDjC8r+cXpJcj/QrBAhOS24iKVQeDSINrGhql+a55YIAkcUB5zYFhXDyIX+0MwvNfsBX9jnodoLtywnkHkeFck2D5F/etl2HbIWmaJPQABXB4kA/ttplhyw4fIISDeG7AmXgivMAoX3HAleEwyp7egJMyRC6BmB++FZM7O5YpPZeyu/gFQSl/ZFpKEw9OEK9yYatm3UkS12YSD2sdfRiuP5s++KrShBTi+XNYFpwBoKyrENclcH0LljW/uT6gVgot03dZuYl0eYqG8VKR0/683+qFw8VWNVISRLsLqLnKdJvnkpzEIYCxCcpD4EYjGVgaUWvcSLVIKrz8JBVptJQi/GK1DgnCqjG+KI5+Q9vCEE8q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:39:41.9625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b36ee8e9-6d99-426d-2962-08df14c98285
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9631

On 9/17/2026 6:48 PM, Jihan LIN wrote:
> [You don't often get email from linjh22s@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Suleiman,
> 
> Thanks for your RFC series.
> 
>> diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
>> index ebcd3c4a7793..689f149f7150 100644
>> --- a/kernel/futex/ping.c
>> +++ b/kernel/futex/ping.c
>> @@ -370,6 +370,9 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
>>
>>               queued = false;
>>               while (1) {
>> +                     set_task_blocked_on(current, &q.ping_state->ping_mutex,
>> +                                         BO_T_PING_FUTEX);
>> +
>>                       set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
>>                       if (!queued) {
>>
> 
> A userspace deadlock seems to turn into a kernel lockup.
> Consider threads A and B on CPU0, unlocked PING futexes F1 and F2, with
> the following ordering:
> 
>   A: CAS(F1, gettid(A))
>   B: CAS(F2, gettid(B))
>   A: futex(&F2, FUTEX_LOCK_PING) <-- T1
>   B: futex(&F1, FUTEX_LOCK_PING) <-- T2
> 
> Since futex_lock_ping_atomic() only checks self-lock, both tasks end
> up blocked on each other after T2. And task_is_blocked() is true for both
> tasks, try_to_block_task() would keep them on runqueue with
> tsk->is_blocked set.  So if pick_next_task() picks A or B,
> find_proxy_task() will stuck walking on A -> B -> A -> ... with rq->lock.
> 
> Could we handle cycles in find_proxy_task(), or add a chain walk for
> deadlock detection for FUTEX_LOCK_PING like rtmutex?

https://lore.kernel.org/lkml/20260714152220.4046736-1-soolaugust@gmail.com/

-- 
Thanks and Regards,
Prateek

