Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792554963;
	b=pVKmO/F/MmJpj37ylPrFXqcNnIZyw9Dv8GR3xUcDucm4UCHgPhCZjAWBjlImdxC2yOwR
	 WOAPLV+Csu2hemUza3bT7qdUYDzHn0yEHi0YXVUmOPRH1g3iqNXmPY+OvY3dsnCaqHG61
	 ce9UWQlQPrrsPpekEjI8yTllR1sI6spN9TGknRQtabMgXyonggGFWZ4ENJd8JE0/DGU+t
	 TUrJycWIlE6mAxrRhSz++Vy13FVdwXO6R13/li61tcSTQmQECJnqZYX/7jneXntC+9RlS
	 mPbr13DB+VivhgxmUePQWaK2dRGbRcOFJne9EQee7InqHg07a6/Q5h40hWfaPo3ygHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554963;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=BJ/gyD12KEb7fT6/+z0cs0ZDChtwRmHzw7D3XjswVCU=;
	b=1EzIxGercqYeWEQokTbLtYswU5A4cvB7smU95B/N8VjAggsOkIa7+VSgMCRdNXENyF4V
	 3F5wpwIEr0En+7oWjFYMelXsETaX0YQd4CRUjFnHAxhsUDR/8EjJtL8AGHkk7j2GFwXF4
	 UklO4P7FmmHax8CM5pulNiYfb5lkLJY4nYyXNephpmBM8Ljj9Ppn4GZ3/8eV+kIxdkfFQ
	 vdefGkx34F8LyXFsyoqxCm7U0NssAtYo3Nz6xngXq6pERO2vY2y1bmVlqqwoERQY3VI0N
	 VY6thA1duUuxheA7TxOXlxJqvE6c5ZE56VPZCaBE9vlE09ycH/GEPYPypmcCEIFjBig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="WjnA/Hsm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.29
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011029.outbound.protection.outlook.com [52.101.57.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7643A606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7643A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WjnA/Hsm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNkxZUYRC777S3JCOWWS5Cid53PV3V+JUyRWvVp7P0sjhWFR4wMNKgeEwTn1IcNmD7Qb2DRkCf0rjS8btZUmpzH5jE5MIj7aatUz6oHhfRnnWvWVUs5niafuksWimC6NmYGdbL5XTy7LdyPOeQOd6Ka5pWsL2inXcRmaJ7driQfVWvKQu3VBapkUqyFMiaXRotdY/APvya4VuGJ5A446CEdNX2cF6MGFL589mZPL0fOIVI9bTJuO5lJtuW0+mc1nqqpOfXGdIkx0K0Pdz3J28cm+RmNOPFqetn8jj9T61EwhBxtbnoDg/xpJH7RYGxPAPkEPfoy67II59eu+TDeI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJ/gyD12KEb7fT6/+z0cs0ZDChtwRmHzw7D3XjswVCU=;
 b=Nud8/QcRLNsexubqAlZAb2ihGnXOi2Vd8ErIYTFd0lF6FXJxHDHh1WmQz9xWZ4/ihg+hpxYHu6Km7dMzvibvR3y3ePD/1PUIYOlZsSef1sReYtK9HWXq3i5LSwkUtXCLjUxjmmSvQj5TRmPMdByaf9lJaWf10uMvkAa/sHOomabtO1A1bKbBRCUAm2M5Q3xjbRIgJm9+6IDcKbOVdw9+0gNwZ8OAJCxdPrFSqMERnfX9HSiT6FR0XYk7qkYbT5EIV+EKGBPXt/dpyp//c6Mv+/0qXXD4Qq1bD5uIc178+9XqVrK8vICduyU/U02Xcfv/lXz7gelV0YxKNffoB1DA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ/gyD12KEb7fT6/+z0cs0ZDChtwRmHzw7D3XjswVCU=;
 b=WjnA/Hsm2H+yU8+gGJopdj1Esii3cVk7SEGCk4dz83gnBbXkLlaJaimK0GSqFHKAUuCIRrn98/H2OR1KkJ/Xsf+PagnsENGMYszIlFRVX5WGDYqsMs22rw8m10oWSe3GMOD0bD7Lec119XL5tL5QHhwAcz9hByv6Mgzy1vS8lfc=
Received: from SJ2PR07CA0001.namprd07.prod.outlook.com (2603:10b6:a03:505::11)
 by BN7PPF8FCE094C0.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 03:55:57 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::71) by SJ2PR07CA0001.outlook.office365.com
 (2603:10b6:a03:505::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.21 via Frontend Transport; Wed,
 21 Oct 2026 03:55:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 03:55:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 22:55:55 -0500
Received: from [10.136.41.43] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 20 Oct 2026 22:55:51 -0500
Message-ID: <62a7530f-ffe7-490e-8d0a-3bed170e24d3@amd.com>
Date: Wed, 21 Oct 2026 09:25:50 +0530
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
Subject: Re: [PATCH] sched/topology: Balance cluster static-key updates
To: Hui Su <sh_def@163.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Barry Song
	<baohua@kernel.org>, Tim Chen <tim.c.chen@linux.intel.com>, Chen Yu
	<yu.c.chen@intel.com>, Yicong Yang <yangyicong@hisilicon.com>,
	<linux-kernel@vger.kernel.org>
References: <20261021034314.864713-1-sh_def@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261021034314.864713-1-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|BN7PPF8FCE094C0:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5d6b41-3490-47cd-9c40-08df2f273659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|23010399003|1800799024|22082099003|18002099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	V0tB6TRq1j3Sx5rQFtTNBEv8j85jTtXlkijsLvkUT2CVzVYnMjjXLtd+DA0/CS0Fwc+J97yu11o8RnUCNVvJCsmnrmADJTyKpa+N8ptVHgZWB3ltc4Ee/hF8KxHqQ7bC7NI7X22twkoN/GM9Ep2bUs0Thfd3UAtIERaSegye55DjTUMeDgvrozd2fFRx/1UBH0CiEaZe66n2RwCfuxoHFEVqQ/42tKzTX/pM5ND/A62A1BMiHHxzAy/XkzUUWKnfPvGjq8jmrnHMOSK6iiTFv+v39TakR1LbWseZYtMv5qJ4ZXOI+dF8odTf+JNFTXDBitp1/vrdzZLoZmcWVuWaCqiZ6PT6RLsILAJ/iFxFSZ/fqD+ywoH1GNTEYP/t91Zynj3TAPa9SnZh8d3YTvGZsXE8WWjMf0Ewv9TqW9TIxysaZxtLk4jyyrLtAYO6k+2RXJqILTh20HCgn5qvVpA40BNG5J6Y4f0ifWXlzZsYJtCXEmB4NFSGxfJXg1ue8mkVS9/sqfRhWvn3ho8RvlKXvsOaCXNO7IqYQupmKspNZD+L891TcJTf4B4nGj6ISn8y1utXu92wUTiXqwaSrcWM2uEiQHJ+smkm11yXtM2Gu12xs2PWavlsVPK17OUSkA/k28YmKMdQtqvd6/1xb+Pp6LLRwjrogDYO7HMtQHCuExsMhAlCPn4SqdxCzuOz5qlt6sZHTr+4N+xLX1jJ/1iTCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DMQq/tUI7Mx1Fq7fpFCJoVzyoHBCQw+yQffKQK8DNViVvEsYKQnZsjTo8P48F5pcNbxxGKyqDrJB/P9jGX6J03qgN+KC6YZ4j5he7XcZkVkOeCpqMKwW3TrCSHEKyoU8ia2SsidkmthBsdKek6yK5+vPiY7eQAca8Fj2XobHCAN2F7Wh3bmQqbuiPil53kkk3acgzsRhe9P3PcqWHE3VT7L3eto5cdY+X+ZYpv3l/AYvjLFR8DwegDFU2FoKGCWZVlkx2KSLFRzjL1rDRHiX5cSthMwmUc3vozAMG2AWC2oZIVfMZNxTKRz/PblAKIZAyCwEWUc2h9ejuGMHAqwyoQvZ7++2BRC/he4d4Vu49PoZ+ZCooZT/Ni3+7zgUN8x9368SVeb0/94839dehLW6ZVy6suWEBuRQjMFFc13AADHl81a+Gnau7RD8y56myZ5P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 03:55:57.0697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5d6b41-3490-47cd-9c40-08df2f273659
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF8FCE094C0

Hello Hui,

On 10/21/2026 9:13 AM, Hui Su wrote:
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 3dab0253976fb..c9e10bfade6d0 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -3314,12 +3314,22 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
>  static void detach_destroy_domains(const struct cpumask *cpu_map)
>  {
>  	unsigned int cpu = cpumask_any(cpu_map);
> +	bool has_cluster = false;
>  	int i;
>  
>  	if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
>  		static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
>  
> -	if (static_branch_unlikely(&sched_cluster_active))
> +	rcu_read_lock();
> +	for_each_cpu(i, cpu_map) {
> +		if (lowest_flag_domain(i, SD_CLUSTER)) {
> +			has_cluster = true;
> +			break;
> +		}
> +	}
> +	rcu_read_unlock();

nit.

This should be done only when sched_cluster_active is enabled to
avoid the extra loop on systems that don't have any cluster domain.

Apart from that, feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>

> +
> +	if (has_cluster)
>  		static_branch_dec_cpuslocked(&sched_cluster_active);
>  
>  	rcu_read_lock();

-- 
Thanks and Regards,
Prateek

