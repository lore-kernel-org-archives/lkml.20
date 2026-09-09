Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9333DEE6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935789; cv=fail; b=cXqK494ZmHw1JgwSWOJpF0h4GVrjOrNEabKskN4VeeKbP0IwsAqv0W74yI6rGk8hdjcGFNZypImBMWy2HwRlbnxIZuBySCf4qVPJDquCxsnyDbPrDKSbKcyWpoKHZdupqMfgM/hhgIzuhXz/FfPyuBmh9woGNwc53czZ8gDAnHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935789; c=relaxed/simple;
	bh=SOyjyd+aHPm0OckajGm+EtgtbTzIqrc7XSodKoqJYFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f+V0qKLdDrdwsVJrrnrfdzlehB5ZZMVZwuV8W+HlCp41+TfuwNrhNzy6d39q/dkvI9Fml4uMHjiTrav9ASiaK+KGS8aeUdr87ZvuLjCddA/GujCZfUVjiUx1SaVRp0ta6azRKTfOJoNplcjVgrhRlfIWC7MUpA1SPJVPvusgq6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2/uT6m3E; arc=fail smtp.client-ip=40.93.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2/uT6m3E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/rbbjOarF/VQOUnZSQ4QG/8fSy+YQW7EasNbs1eGERuTQn4SLTXRlKJXu7AmnbIOYnj9DXJTqn6Ybwt7TSvn0grPyvoAmN3pUk9TKWtr/mxKvHAS2ZTYgFBvxN6dxy+AsPIvmcFYgHE4WRHM/FVSxORl+CvY8NhItrCE1GNH4rNEnZq205Gwq+eL/o9f91HXo6Gn6wHGoOMrSZc85O0LmcJPW1gq4XLDmJs7KuBCf6TiZLo60MqbRqatDxOGkDw+YQ8CuO5hzb9yqonH66RmgzqmDFtSjMESurqFg9aw5V6SLn11KluiVGlFIrKdoN8bSIEvR/3yjSmriKdvErtAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ER0AKAXtQjkoU/cGM8bHrxUb9lj0MLvmM39NQex1+AE=;
 b=ql2iNaSl4de24Om8fGc9JYmd9Go7XcuVgz5LvO77YkUY4lFlG4d18HREq1VzkFIXgK7P2yV65UwS8lAxxvAUdAw2UdcbQBIrCGqE+2V4Ih2pDTns7rBV+gNxcL7SoE2hP9dwdrBBsfELZXp4YfNSjXZOnESWGs71YAodHgoe8MULuTjabcwE2mMaT3cRFi+8erx/o1ljFlWaCJMjb7hGxmmsXt8UJD7hK+RwTKjpc1A6ECtMEFg1Z78BU1vvEJ/GstEp0mZ9wy0LKw0Rk4JBbnAjvp+K3EXGq53GOK2ngHavteKa78LF27HZVhK+fmSgoH325ZWwVzJ2I6tbtv1qtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ER0AKAXtQjkoU/cGM8bHrxUb9lj0MLvmM39NQex1+AE=;
 b=2/uT6m3EXslCw+GaDeW+E0M04UBRDhD04b5p5EwRn2Y2WoTpayioiSRyn7uZmx4sjif0Pn8Ewk8w88tjCA3Chj3cdRJDV/bsDVm6OkG/C0Sha9bGrgpFa5r02LvkL0Olfx13WGWKCepLELiLnIhE9jktCScJWGJ8SyiVG2phyeU=
Received: from CYZPR11CA0004.namprd11.prod.outlook.com (2603:10b6:930:8d::15)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 06:36:19 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:8d:cafe::97) by CYZPR11CA0004.outlook.office365.com
 (2603:10b6:930:8d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 06:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 06:36:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 01:36:18 -0500
Received: from [10.136.42.177] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 01:36:12 -0500
Message-ID: <ed191145-d58e-4463-8f54-a7bb86cce646@amd.com>
Date: Wed, 9 Sep 2026 12:06:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Mark Rutland
	<mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, Breno
 Leitao <leitao@debian.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260909062649.469633-1-arighi@nvidia.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260909062649.469633-1-arighi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: e94822c9-0a72-4cc5-9bf1-08df0e3ca7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|13003099007|10067099003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	DqxMaK9Bo4TtqpiopVUvtcXbJu1Xqegd8vVHdGIzeD6z6EavOJp/FhE9eQXvvhGx3WVseumOwS8rV+x4KmxfoVyZfJcZ419Uy3dGQDWDu8VQ5FjPtgglrxz1Cg48M+BJH60MEnEzlO3WB2RfAjgzqOGefN/PJ9k+KpRQRNWMyhmG0WlWVKfv0ls6R8SIZy5WsNcoGMnUaFkaWO+aHnTuOJ2va1VKBMWiRn74bScJOwuyrukP/3+JKgUrIBlFb72j6P7V4k5vt8zDWdyRE24uhgM7YB7Vy618eXCfR1q9i7+f4CFmenWhu8vyI8ojOUFeJqf3dYTzuGNe4+2ewyrDPIXNHRzj1lzBWSQ8TYtUN+qH32XA7RfuD3onuQIHsDtg6Y+RgWD8jfUVg+dtRSAbQc5TBBlFAggj1LGX8oTvpFre66icRjUXpTPcxf+WqZbCfS72f4GLwrCZYbIVnkvskty5/b0w2Aaqw4BuWt4hYLl0nbZkhrcUoYi1y5ZWh8NEBwxcHrV8lOuqXl3hi8Ow444QpE64XkHV8utAzjaqXAbb3/5oWDxbMV8lAe7rPvObS+/uWgWvRBnRHECX+ftKcKGVmDgrH2pexhf+2b5v98CC72Gc4PlNjbTXyHJzW5TBZyDEuUqs37TIxK9RiHJH/Pex+FpQt8MV9IIbIF1I4kEqvqwLG2DKk3K7QJ9MbCV/fS1oKwp4brfmQkdx/L9+Kw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(13003099007)(10067099003)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YbzXZ6OYrS43p+bKHDnuePfErvrpPFZHbDg6cbQuAKrYhldxrR9vDtNbFIk7EKnWuEJGDIRmCyop1lT8ZwHBU4U0qdVq/gX/iXDFzw8hb5PC0LwAMFw+4CAzUUURuwoWRGbk+MBDdqWxpaKDadyBqU690xjGepGDmsVnDOIx/44zVpvutcgDjLc1vGytQ4wyKkQKXTXOWvbnXpOZ476YO7eiVkliozET+zSy909fyqND31dpFEtzC2Oek0TzYIAs19JdnXbUS3oexidg5FfItjnv1y12qN5hULEa7t52G6t46BE4xLtPtbGOSh+ZvAp7wtkIbvW5I5+OKKFoJY7KY437eOOGVHhe/Cj21wNhBfL8ij3DhaRdOKi+dfHVxiVQpmsAEP8HXa4WD4KHx9QmFyV/kmfSYsHYAF+17QEPxAZUsdHyD28b+qF50+IsPYfn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:36:18.5398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e94822c9-0a72-4cc5-9bf1-08df0e3ca7d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779

Hello Andrea,

On 9/9/2026 11:56 AM, Andrea Righi wrote:
> NVIDIA Olympus implements SMT with two symmetric processing elements (PEs).
> When only one PE is active, the core operates in single-thread mode and
> that PE can use the full core resources. When both PEs are active, the core
> operates in two-thread mode and the PEs share those resources. This
> behavior is common to SMT implementations, but Olympus is particularly
> sensitive to brief sibling activations because returning from two-thread
> mode to single-thread mode after a sibling becomes idle is not immediate.
> As described by commit 293f9611ae735 ("sched/fair: Prefer fully idle cores
> for NOHZ balancing"):
> 
>   Briefly activating an otherwise idle sibling can reduce the performance
>   available to the other sibling and this effect does not necessarily end
>   once the activated sibling becomes idle: after the ILB finishes and its
>   CPU enters WFI, full single-thread performance is restored only after the
>   sibling has remained idle for a qualification interval (10 Ki cycles on
>   the tested Vera system).
> 
> That change prevents the NOHZ idle load balancer from unnecessarily waking
> a sibling of a busy PE. However, ordinary task placement can still select
> either sibling of an idle core and repeated changes of the active PE can
> keep Olympus cores in two-thread mode despite little or no useful overlap
> between the siblings.
> 
> This series makes PE0 the preferred sibling of an Olympus core using
> SD_ASYM_PACKING and teaches the fair scheduler's idle-selection paths to
> honor asymmetric SMT priority. The scheduler first selects a candidate CPU
> and core according to its existing placement and capacity rules, then
> chooses the highest-priority available sibling within that core. The
> generic scheduler behavior is enabled only when an architecture supplies
> an SD_ASYM_PACKING SMT domain.
> 
> PE0 and PE1 have equal steady-state capacity, the preference does not
> identify a faster PE. PE0 is used only as a canonical choice when both
> siblings are available. Consistently selecting the same sibling avoids
> alternating the active PE across wakeups, lets PE1 remain idle for longer,
> and allows more cores to remain in, or return to, full-resource
> single-thread mode.
> 
> The series was tested on a two-node Vera system using an 88-thread
> single-precision GEMM on the 88 physical cores of NUMA node 0.
> 
> With the workload allowed to choose either sibling of every core, observed
> throughput improved from approximately 9.4 TFLOP/s on the baseline kernel
> to approximately 10.1 TFLOP/s with this series applied. Repeated runs also
> became more predictable because the workload consistently settled on PE0
> while PE1 remained quiet.
> 
> Changes in v5:
>  - Remove the redundant olympus_prefer_pe0 state (K Prateek Nayak)
>  - Link to v4: https://lore.kernel.org/r/20260908082345.103087-1-arighi@nvidia.com

My replies failed to keep up with your speed on iterations :-)

Since this is same as v4 and I had taken it for a spin on a
x86 and an ARM64 server, feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

-- 
Thanks and Regards,
Prateek

