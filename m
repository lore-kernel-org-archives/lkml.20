Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49E5371D1E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788410283; cv=fail; b=sDWkyq72ktEmL2KuQFLGLsRtUavTk19mz8oajsRRG77X15xeNhWxZFea7k8530q4BLODfBJSpM4kH9vTfeFR7mj1+bNASQg2wrVUdmSPq+hvWl2+fldjvPcvKsdsg6/z9e/UY67rLFGX8IuzKv/GzmzKe6DfmI0ZIW+e6gb7IoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788410283; c=relaxed/simple;
	bh=qMUmyo1UKsIX9P8YBRTHUWQJBdxA5zQ5LLaFwHTtKAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TZTyJ95hcfFNjMUFfj0WYluPSK6wyK0psBEbAtXNZMUcikVXNbR54hUU198de+ogdRUf7G/8lyzKP95d59E4KzckwC4Qu5LHwYHMJnCy0uNZrdj37hz+ch1P6uthM+WP9UDuqu0WeTjsWVRM91uqlCX0s5yosKtS8TIaaq0CeKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Df8eKvSW; arc=fail smtp.client-ip=52.101.46.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Df8eKvSW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaKBQG7BqGzIAz8VUr+wLZahmaDI7RI8fuat2udm6wJPpKH4R3XY8Nmlc7+qpXR1xMzl01zg2yoCoBPqjNfq5uSnbIiQKUY6jbdg/krH4/+mKOQ3Z9xtQSBc5jkI/twnaAF+EPR3S+iXs1xgLDf+6qh+b3+NvRM6vGQFXzVFPSzJlmOEorkaft0rAHew0YQgqiXeLS0YMSGhUhQosMERe8gpmD8wGI+FFH5O4jzQabPAYmjwRe2mhZJjYuBPzssfv+zdyTyTUZtSj4swWNtOBBmkCYTfMCyxFU/VxvtBIy3RWj4e9VtQstqlTmxXkK4vS+Mrt4LIwSrfVq+JPaBRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfWo8A1JTkTUjuJpJOlD8RUOEABkmhEiYpGBI04sv+Q=;
 b=A8gAEVOdd7jY2rVVJYvJOirjDFLWiHMYdJmF+TEPauE2BAPMU8JkDABnayc5HnEPEtJB45GQd9dmEe8/cq4CezDMQ7QNSeLRM8cANsmdt8i8wpYlRyIGXTasLnsWBo6B1fg12Yv5vgduBKZ5jixthMDPNYkuqoSwzpEMnOABKl0CcOez/uvc1ReVU28oohs6/HvfKXEqvw2/UgVDVHL219CZiPDlZsdHuHg9bRbOJk15bFmBwousCOziawQK7AqP8EtLj2wua7NxVdBWvdfiCs8XeSZUHJxU8P/ts+H/di+hPbM7lLFLwdSQnZmjacUV2fVpmULYmgu9yf2xNqVMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfWo8A1JTkTUjuJpJOlD8RUOEABkmhEiYpGBI04sv+Q=;
 b=Df8eKvSWUEANEzclxc13q7iT3UZsEMS0hU/yEDTAjJ7DTR1IRoTZpXdAahmjffO1+ug4RzJW//6QWWPhpU/YEONBtcQEeGdA4+3i3HHV6USGz3Y8MpB/CnhOS4q6DY+bRQrNaxSw01MZ55FTvwUkgxyubq/X7RvsBLt39rZ76Dg=
Received: from BLAPR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:36e::17)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 04:37:53 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::84) by BLAPR05CA0021.outlook.office365.com
 (2603:10b6:208:36e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 04:37:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 04:37:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 23:37:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 23:37:52 -0500
Received: from [10.85.40.73] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 23:37:49 -0500
Message-ID: <2bd1be66-25c6-455f-94d7-a44a147dba9a@amd.com>
Date: Thu, 3 Sep 2026 10:07:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] sched/cache: Drive cache task tick from execution
 context
To: Hui Su <sh_def@163.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>, John Stultz <jstultz@google.com>,
	Chen Yu <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>,
	<linux-kernel@vger.kernel.org>
References: <20260903041154.2479761-1-sh_def@163.com>
 <20260903041154.2479761-3-sh_def@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260903041154.2479761-3-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7ec5f6-8fdc-47b4-dcf0-08df09751de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|11063799006|4143699003|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ft00SDDOLG5Aks8pzIl/Ty7vyV9qtfilsm9nhgllmwU1RTNOGfo365QCxyvmuQN9d5oFSKPUaRL/n9Lq3MGNhA8f0PDuf4oQrz5oJ7052d9nGxX/FWnBKjvng/0att18pJNhCL7YodKo8IzDFarhEwDYNSIufS0GqIGWYlfEHVgWqSqMkEs4JSWcRTKswRiVJK5wkW/+rpFRv0s1DTzgIa5eSSLQx41Qll0FPnI7sGiy+H/E95+P7du7aGnbjy7Gi6ZMipyMTfTHavD11gkHDQFzsCF5BYgj7Uojnd9jd5ICOuMComgv30LPW0IrsxTHdU149CWBtsa6rDlfEoIcG6C3EdRYvRJeReQtmvG4T9FR9vyXPrqfWnMO4f4NoDG/+AV35TD6zuJRXBULlDDg7RlRXcHNIkx3S1xc7iZdikqyVHH6uadPvpCV91jgIj0tHgL0WVM0hi2vJmredZScJT3DBrI3EZBzNWBFrE8LbABkjmo79V+odBZhDjYWPajZLwkXxXzhB95v+nt60/ewS8dtNKGLJuPCkidlat6Pb31oqagcVGivkiLcyzJqXL/x6lvZBcERkfpBwnmvEEGVxvDSw+MC8HFkCqXvQRlN5pjda7TqbwGHUjVBcZulhzSN6RByPHRK1/9omk55Z8nasZnTB7qndqjRavxyVjS4oBfO/Sr8iDdjTSB7lAraJAMy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4pYCyiYIqUnsDfIdVNjILtEdsRwzp9rmKHF8BgwSOKsXBDNzP20CUasbrvASAJGrK6k460G6tE7+ms5Rz7+sLxLEi0NXbrsZMtOeFj/XbTj4FZAvJajq/+7pPUaEGLGgdjtiECcdDreMA8H8SepdphpWmBEtnMAVx8ZC4FwjadQhjGhkbrUmC/P7Up0DRMAbZCsN+m81qxNkJvu9Os0tBqOK5pS4N1yLxex4lwJkSTUerf9uOfmyrNJKNkoxxDlstIIRzZjFI/CbTB5sSwCi6T+abo2sDNKIa+O9QbuevoNplqBqa3zA5/RJA/ngF511b/V0iiMhfYn3Af26VRIfLPBuvOG2DYh1Fe7ERrytcl5EuOHoRfBiTPeXE4G09n5foi8irpYsKA/81qdXWiNzteDHUFv0rKysSiSoMp4Tbu0ha52D5neBc714eEn3BmSB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:37:52.6961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7ec5f6-8fdc-47b4-dcf0-08df09751de6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620

Hello Hui,

On 9/3/2026 9:41 AM, Hui Su wrote:
>  			curr->sched_class->task_tick(rq, curr, 0);
>  
> -			if (curr->sched_class == &fair_sched_class &&
> -			    static_branch_unlikely(&sched_numa_balancing))
> -				task_tick_numa(rq, curr);
> +			if (curr->sched_class == &fair_sched_class) {
> +				if (static_branch_unlikely(&sched_numa_balancing))
> +					task_tick_numa(rq, curr);
> +				task_tick_cache(rq, curr);
> +			}

nit.

Might be worthwhile to extract the above into a task_tick(rq, curr, donor)
helper instead of duplicating in two places.

-- 
Thanks and Regards,
Prateek

