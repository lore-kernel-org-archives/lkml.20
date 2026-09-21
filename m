Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A11E2ED848
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789966278; cv=fail; b=PtDDZ+VtEUwy/khhvonLcuk4JT8iZxGvT6rdwXVeJraG6UrSg9YybE14+fWwfw9zgpFZdUGN8LLaTLzvLhS2Rq36deJNukFLitbH6QWMoOoBosEbq1x5ThXVCya3tuc0IZwBob+SQRyz2NsDlYku9XZRm2HdjLJSsl2WqSgfvqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789966278; c=relaxed/simple;
	bh=Iw6HaeH3Dxd/yx2gm59B96yAriZgt4Kse4Dm37aAGOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c8pjuHkJCrvXlbht8Z4265F4JMX6qwVPg1KAJVTt1I9T/MRR1Pa3FT1Sh8Lem64rvGfyy5oCpmKWrfffPzLHwMHNKvgp6Sdz4r/VByhAFHTBhOa0MSIESPlxlbSC22dujHCL6zznJHlQuDEYx/dLgKgxn0ysrJZU02kOdD1Bfns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TxER6S3k; arc=fail smtp.client-ip=52.101.52.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TxER6S3k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMcFUl2hsEdQUEuBOtJrr7ZydgjyL1HK6Puu4Sfb0/reRlITDfPNrYw5tTRayrFUctjPGdIwbZf+U0UOLKhbW7yYSDBxIWI8bsKmVbtxaKcge6ILAxmRfDC8K00vCp+CG4lV1xqznfV+EqWvLWa8Qa6ZtnuyRGeB9lQr5LbbFqtp6sjAgyxRtZWQY7omgGwOM5eN2Y9dzkurv/tqyQOz+9rJqWF4vWhUV1cRS7ODxvkuQJsWqsmoA1hldVOkcFkTgkTP5mkaEahweZSZ5Ikc4RiUoYCAEjoSo+NIBZ7d1ULc6B+XgxgsZllxpzvmYe70ZJ6Xp3vs/L1ttVuNIBSMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7U8c7M/4k98GT2z4ozwlmBFVSuSIcVOg+5lXdqugAc=;
 b=FYFdVWkrk0/hvet+WTMlt1pv5UmdVZmwIUGZa4E9+izNSbN9OvJQck1cTQcRsCLywIuP+KL7c60JjVa6tlCkVXugHUUPAPA0nxD1PCWqNxnTH5v8MhUMjUrW/Bv6nGjHqNATEdyfZlyEAfzGPYwTzKiICoSXfPjn40QBwYtTykJq9YaaoSfz0SsjQwx2uN/Rrx7CoeNzNM1A63q2Sfu1yXp0Bg0ZDrxwIGi3GxPZ41KL1N5HQuJpuL7VIBwvza0QXfoZlh6Vsi1th6SorOF+QlNqHGcdn20aGU4S8noJvHOwQHclypAnuqNboXKjmh/PEle4eoBPThGOFpdw4tXoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7U8c7M/4k98GT2z4ozwlmBFVSuSIcVOg+5lXdqugAc=;
 b=TxER6S3kcgrRvi96lF9VhIb8PRgM0/q2NbN9bbUWpNCepSi1Zt1e0f+y5n6Wuc0SvfvWR5ac2dujrHks1k0UfhwqJ31OeHphT2YamxlL+zm3i1T+AAIG+GzpMpthNHU1t4q9Fr54uAvZnFsVE/rX4pbBmQH/apIDcbyXF0L17nQ=
Received: from CH2PR14CA0051.namprd14.prod.outlook.com (2603:10b6:610:56::31)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Mon, 21 Sep
 2026 04:51:12 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::4e) by CH2PR14CA0051.outlook.office365.com
 (2603:10b6:610:56::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 04:51:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 04:51:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 23:51:10 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 23:51:09 -0500
Received: from [10.136.46.195] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Sun, 20 Sep 2026 23:51:05 -0500
Message-ID: <d7d00454-0789-486a-9439-1734a64f304f@amd.com>
Date: Mon, 21 Sep 2026 10:21:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/12] futex: Make FUTEX_*_PING use Proxy Execution.
To: Peter Zijlstra <peterz@infradead.org>
CC: Jihan LIN <linjh22s@gmail.com>, <suleiman@google.com>,
	<andrealmeid@igalia.com>, <bsegall@google.com>, <dave@stgolabs.net>,
	<dietmar.eggemann@arm.com>, <dvhart@infradead.org>, <jstultz@google.com>,
	<juri.lelli@redhat.com>, <linux-kernel@vger.kernel.org>, <mgorman@suse.de>,
	<mingo@redhat.com>, <qyousef@google.com>, <rostedt@goodmis.org>,
	<soolaugust@gmail.com>, <ssouhlal@freebsd.org>, <tglx@kernel.org>,
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>
References: <20260917043339.2093426-8-suleiman@google.com>
 <887eff66-35f3-4703-8ff7-c0c959621b69@gmail.com>
 <8abf8b0f-38eb-4a25-a40a-57d5439e52e7@amd.com>
 <20260917153649.GK4121339@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260917153649.GK4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 252fa664-0a68-4dbd-dc7c-08df179bf617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|23010399003|376014|1800799024|36860700016|13003099007|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fMT+rrApPutQv+2NVwVYvYHpHVS0D/pd+GbaR0y7ckmXFektVEPfk6e903tKny8o1flhe7gLvHpQQ21fyoyR7L3ulQAo2QY3FvZvGC9JH2zd7z+kUAs0YjrZZcfJbBW8CS3e9d2TNV4YTXBYZQ6nCw4nYSQlifalDt20/C2zyne7Fshxz3N98my3benEPxfuhtZuTK22umucFBaqOQ36YC1UYj/P+kciI3AYDBpjHFa9CbIBA+fyFkEur/oE871XLwCNG7cR2IusTnYtnD2wYQEifDf6LOCy3FTiBPouum7MizdArblNoaPTpYZbJ2yCgMFsXgXwvdSDigwdABMjXwzaiLnTZ7C44QOM7nCvSHd54MgIsVkl75UHTCuKlMbaeMs+oXA7pzof0GTZaMHPsW7hXMbCFV8ft1GLfV2GgbVXOVAp/09UO/FuxvdhAZreFrcGWWsLN3PvTTnvwlkic19q0NZfbDJMba1skfMpHVgsNiB2RHnYl+JCPPy8ztZ4xk99cRL4m1L2kc3YQ0hXaSF4Mq+96JWajia+WAMoByQTQWskYD6ZDTAiuCQ+//YRcVTvz4vjUFLUPo6P1PSiKYy75JV0O2EiI+GJ+eJZgG/uuXBVi4rx4iQtd8I0dDwqJzpF/356RnhwAOSkvdubGMnJjJYFt5Bh9gOafynY8SNkZ04E2UQhDknEHb9edIMMQvsHRBoksAykUeBhlcJv7A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(23010399003)(376014)(1800799024)(36860700016)(13003099007)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MmTqQj+8OkGPqxZAauuQq7kQzQpSL1iKGlGHyxX7Znz0rj3dcudbNGISStPU4nmz42tSp7xLX6mLvGrnQxJ7jO2S3WJ7+MtXa/eXvRwDvPibMOX7YYtVshGtaDQAPyg2iOJfFrimZB0tQBejr6sbqSWyKqN05FY0DsdBHCBu776r/+HR14lOPSIR8flY1yoUXls60WZrjofp/yHW5LlW9jzBv2MU72S1zbxLVtevX5bY2/PPBflEX4xzQdnmqQIyLjnHZ1VmhnSFWCpxwFItxkR/+ApYmx2J12/HQbcekkMuUDGaUPzssmklaN+ivZ/K3DEMKKuZ+/pMxEifqKwQtIng4QSarrcYXFSRt1d0xuNrHCJ1S21v6sMNQN5krLRP48fP2eXxb7qEmQMZjMadOd/5+6aFV+6WsrKu1yfsTSuKPsef6DFiUNzBog6BNl7C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 04:51:12.5482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 252fa664-0a68-4dbd-dc7c-08df179bf617
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958



On 9/17/2026 9:06 PM, Peter Zijlstra wrote:
>>> Could we handle cycles in find_proxy_task(), or add a chain walk for
>>> deadlock detection for FUTEX_LOCK_PING like rtmutex?
>>
>> https://lore.kernel.org/lkml/20260714152220.4046736-1-soolaugust@gmail.com/
> 
> Ah yes, that thing. I would suggest to still have a hard-coded limit,
> but perhaps in addition to the sequence mark.
> 
> Without a hard-coded limit, userspace is free to create chains of
> arbitrary length. This should be discouraged :-)
> 
> Also, we need to be able to return -EDEADLK to userspace.
>
> Ideally userspace gets to have an extra graph walk on block though, and
> not rely on pick time sanity checks.

Ack!

One way to do that is by setting the "p->blocked_on" to -1 when
find_proxy_task() detects a chain and then clear the "p->is_blocked"
making it runnable.

Once the task exits out of schedule_preempt_disabled() and grabs the
wait_lock, we can check the "p->blocked_on" to return -EDEADLK / stop
proxy and fully block the task.

Would that be acceptable?

-- 
Thanks and Regards,
Prateek

