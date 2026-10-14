Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E9B41CB20
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959864; cv=fail; b=kZw5rEqcrA0allIlfPuSH9CykYbYRQYRZQum13KAkiwO9orRTIdJTh/Zlr1N8YdiLCHHvRYPhzqtThD9TnPeuBjA3dd4Zbzslr3A3wUn+mWpYgfLwPZZ/Odc3qMZL4e0+4haIvXhr8ID+2atvxcS/dSaykGx4lVV2pVpjnfswJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959864; c=relaxed/simple;
	bh=eZWkDcmMr6FDSEXBs+9KadW9GbfouHtZgvGtpdaUxzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BGFGRUspgYXgwLvIF0zpYUt9U4CphcLBRLDVzva5481/aZCL+pg45HlYBDVBHJkbd2BuLkYdp8oyFMmD4wCkTywd3AUNDayqLGe6AyjnToF+IGJDVvgDZy3eEKSRPJlfSotxSQ2WBiX4kvsi6dc9HK87v4iyrZrok9jQTZ76nMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1JixjNDK; arc=fail smtp.client-ip=52.101.48.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1JixjNDK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEcg1xJUds6FAUtigxhAQPBReVaVPSOiHdcBE4iDUXUwMZDzr2L7wZRhdYWtQZpFPH6UZ8xz1dyJuQcBgJLGrKSqyFM3EGrvLLxxoni6dCceldJ/02JN0QRgMBLBL128QU9XxjU08/pfmmqTV+qoFjhGhct9nQ8rysATIVB76qO+Ee9pYHlwNsqu5JIzMi78awvIrKjAGees3tYr717hAyrlJ1g1GBQa6sCTnpmsMGtNtOckgNByA5+ToEz976T5SNPr1WC6zf+apVzjIs3qV+w3uoZ1JNNWH9kgwe0hW4pJfGIUfdgPgwQsLKNxzR0WA4VExWw+c2bATT8ebJ3n7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNeiNxF6gsApoJYv5WS2LCl7qvUYd+87LVGjEnkGzYo=;
 b=PqZKViZD+/q6DJycWMah/Q/HkThFBM5G1teDxhwv415j386ZEIplp1jGJGUkLN2VuHgAYqeBKcG0dpVf7IqblG0auaGvwDOybCAJV7NRje+zA1ziYphw9jACA2J05OoRGAr9JvVf+PsUtRFDXt5HyKhnn8UbfNm4drOoaeFkpoJbbUYI6jl5rzkHl1m+n1ICt/FCkqDl0jnoSZD6kRui4WM2RaGZds5rgimL5Hb34FWfj8/YshS5Qtqu6n5agu1Pqh0OpsWmAPA20oXVv1Lcgw+R8mQMh5LMGD1zjimNT1MAmEHEHpUYLYpVZbjKAXoeVA/c0/iG/8hpZDtf0e646Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNeiNxF6gsApoJYv5WS2LCl7qvUYd+87LVGjEnkGzYo=;
 b=1JixjNDKmR2xFKXNnqJu9g97w0IQJ0mu3435HKdO927IRoRxAWnCyHj0LnNl42geUhPvc1RsZLm6Cf55XmAMRkfeXHE9e5nUc8hAW3858LZb/nxpuuGnF6tIAkXK2W05ANK6KU7uBlJB+NDzp+gmxkfV7jryuwkDtrHdwxwR7+w=
Received: from MW4PR04CA0051.namprd04.prod.outlook.com (2603:10b6:303:6a::26)
 by DS5PR12MB015052.namprd12.prod.outlook.com (2603:10b6:8:47d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 06:37:39 +0000
Received: from CO1PEPF00018869.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::a5) by MW4PR04CA0051.outlook.office365.com
 (2603:10b6:303:6a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 06:37:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018869.mail.protection.outlook.com (10.167.249.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 06:37:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 01:37:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 01:37:32 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 01:37:28 -0500
Message-ID: <03309616-80b8-4f7f-b6b7-79a8a14b80fa@amd.com>
Date: Wed, 14 Oct 2026 12:07:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/core: Call wakeup_preempt() for queued tasks during
 class change
To: "Paul E. McKenney" <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<kernel-team@meta.com>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <20261013152455.9039-1-kprateek.nayak@amd.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261013152455.9039-1-kprateek.nayak@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018869:EE_|DS5PR12MB015052:EE_
X-MS-Office365-Filtering-Correlation-Id: 240d54f0-2022-4ab3-24ba-08df29bda45b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iJeXwRFDcjeRcnZMNtI+DYX1F2SclhW1r2pYamiPYZJqLnpe0UWv6hccpHB0G10NU0VVjshY6pVr9Zkwiqwo2bl43ahT1rV7KSs0a1CRpncfx6hjvvOy4y0Xzw4ANy01wwNWJ6FpsNXJCSNDgqXIumw7IDRCSdTBpk/AtPIyV4bXFPJ0cyF72bDZEqf025WvxOBnGMNwIijsCYhfrWAtPUF/5w6KiLdwLq1UBy7qv0PhU2AJhj2wzurxwSse4v5+jXUa3CWoTW1EIW4z5HPDo6GgkJ7VBTFiL787ZysSIXp+CCM6OfY+A5iHgV3WKKC7f2bZsGB34HgLUOlxIAqdVZPP7R7KrMniOUnMkRuGPkYN9NUQegVWC6Ez/BY43x9HsRUt1OKvM/JVL1dgZvSeKJliWvMglIDWbrXnAlbVKdOGAv4xkb/ocarKwBckSnHR5BlfSImeCvS2zDHMVii3rUijk7x+3LKiAIi2xUWQksIvCwmp8drr0tYG4ELUfGnIOnnMqI4mRf2DVLKcnlSiy1Q8TyiqdKEA1NRqsY+I6X4u9w3vroZ36hO48f6vc5X3Ho4nyjaUWgmCp8nR0UI5nqGR8wvOf3HrlQfTKv+c1tjZfWcfBNYWZT26SBCD9URl1a5jx2PWTwmquxXkftggg/WQC5BnvpUnHMbWZlsP8/k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o2xAIHmcUOW3HuI8ZS+aDhKUEYcoQJ+/0QutgXZfq2rgh/0/1fK74EtpwNTmJ55SdhVzAw8SrXVZaVEeuqygryIXqHj8aeNcrVpUb2dfKNx22jN/CqNIa8R4h/HeJOvp02j7LaAoMAiXoH6m1iNi9bnXGfNaX9l+jl0bvPePo1u9TduMo0yYvHX2G0YVazGSkWngY4uYUKEiWIEniKa3RkXJ0C/mDanqOy0I1BfS4ewzES8tEjoCb6TdUOCh2J3MYGXodTCh05k0O+PWCoUboLzPRyBc7aLM7Umqz2ZuGjCy5QqPLMltI3Xwaaua82WyOfhev9OJJfZiRaXgPO4YFIz7cYC/dwmrtsAq+DPlmRJZ62GjduVKR1NVszTk+dZv3/pEhNCY54yOmw4haH6QrIcmO4o7aTtEnI6DnX6isELWfTUDMKCcur+oqa2T47P4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 06:37:39.2033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 240d54f0-2022-4ab3-24ba-08df29bda45b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018869.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR12MB015052

Hello folks,

On 10/13/2026 8:54 PM, K Prateek Nayak wrote:
> Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
> Closes: https://lore.kernel.org/lkml/8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop/
> Fixes: 1e900f415c60 ("sched: Detect per-class runqueue changes")

Small correction: The above Fixes should actually be:

Fixes: 704069649b5b ("sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()")

Until then "queue_mask" was being modified at enqueue and that would
have captured the class change. Commit 704069649b5b moved to using
next_class and used the wakeup_preempt() path to set it.

-- 
Thanks and Regards,
Prateek

