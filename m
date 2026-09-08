Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96015A5150
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788898164; cv=fail; b=dAKOJIFZGgJbD24eyp8hGdBm4XwV4A8qwlkVt3qR9/Hg/C3BLOvrqOYQ91an5pwA+8TQplC4Syi6YJMOYeE/y5rIFFe89hCgxHNFCMk0mRjtUZqOb8YnCAVKKofDuj9WHGevKZH/giY/uozassqm+m3d1J5EjLLVYdyQYhCbcag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788898164; c=relaxed/simple;
	bh=5N+LSF9Zno3plYhk33E1btpSZKuDOz7mb/R0BKpNhW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WQbxDdWq+lqCLD3JpLAS6I/urxkAM+3qLofpzapNXQNrou0FLlqg+1gm+TLi5ZDvT8ksG2viLXW/YyfXiBjtPMrlJ1nfmJnFjP9Shqw0ew1tgA0Xi140MvF7eYbDtmslG+98CzTRvRgmARSmEEKoKpqzj0EvTREVX7AzBuRKsoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=08VZqFgb; arc=fail smtp.client-ip=52.101.46.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="08VZqFgb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QY7JXnFH2G0DCKJkoAKCN5rY4VPa3vnhxWqBi2l5B/RJfIe6NrV3AsAAKy6d+rNeTiylYqOcIANxm6LmKCnfz64RRVNoRghlyrUMba+pcsZ1eEfB5eFQAuMgEx8eleUvqZk9RhX8Nw6bSUjXd36szee8pM9Jp44OgcALKxym2d83fHI/2ZXqgDEjgeC9IGkOAPcqaXuE3Nih7fNl5vSSksKx+3dLiZQEtXPB3KPNUrDUaavGo5r74VLu1lEZNKhQloPdXjYaXDhiQlsAka3dzvgQilfG/LYKbxnxubTQfFuseeLSsqb8WA9MNGvyb1Pio/aqvjpw9S0DdQOoOCck1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw50zLLgfzK0DhLBEYQyVAO8zl3n/t1zccuw2hwU5ZE=;
 b=n4JzKOPAnAUMSDPH3oW1C6wCwpqGDJaqDVwoXyASA/igfusDK1w53zJGJPQWy6SBtwH/6CywEsbHENGak4WXt7/Cjd7dbaxcRJ7TdNyI77LcZLLswZCdCl9s0SXBlA1b5pg3y6kq4NfNy31YZfVSM7gkm+4EZaUWrvmzzR0LYDxtPIWbXe5sVkvWmrsNSi2AjigUbLv8sLkdRVdRTFMu1RJVOBtcqOpEbARrLzHJYoxJZESb2kzccgLIouAfPCuHzXfj18vi9nESeLuV3lUGLijiL4abKjDO2T3QJ8gfAksF2cfAzk57RU5Rsdz1wInluDI6zAnd+SfbT2pQ7EidcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw50zLLgfzK0DhLBEYQyVAO8zl3n/t1zccuw2hwU5ZE=;
 b=08VZqFgbDk6KQ7Th9YroeXo4x3Ro2UR03A7IXNK/hMdc4W11tcrv0BfQN4sIiWOyP4GOp0mM6pVorfCtIf3Q97MiSd4kTD+qambcIuAZyRp8WV2Lgv7cDFOJ8Uriy25x5HZCJRbru9lvSQFYHftU0NEFb9GUGo5lbC1toa7z3lc=
Received: from SA0PR12CA0010.namprd12.prod.outlook.com (2603:10b6:806:6f::15)
 by PH8PR12MB999319.namprd12.prod.outlook.com (2603:10b6:510:40f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 20:09:19 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::67) by SA0PR12CA0010.outlook.office365.com
 (2603:10b6:806:6f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 20:09:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 20:09:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 15:09:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 15:09:18 -0500
Received: from [192.168.0.226] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 15:09:13 -0500
Message-ID: <ef19ea63-a4bc-407a-bca2-40a2818a3671@amd.com>
Date: Wed, 9 Sep 2026 01:39:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	"Vincent Guittot" <vincent.guittot@linaro.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Mark Rutland
	<mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, "Breno
 Leitao" <leitao@debian.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <20260908082345.103087-2-arighi@nvidia.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260908082345.103087-2-arighi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|PH8PR12MB999319:EE_
X-MS-Office365-Filtering-Correlation-Id: 862ddb7a-e6e6-4e7a-f60a-08df0de510b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|7416014|56012099006|11063799006|5023799004|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oNFIjLlN1qTdzLmRZSYpcOli+UrdAcpeeZswkXvk4e91MD0EjE9efRF5UW4zvzGoX0vg2HFZ6DkElRBPtSghzfQujHORv1OWbHxzWNGmRfeQYak2tWYnBLR7SlTqNUe0wCJ1FnPAB3Jm9CJpEXU1B0rZ6oa3Q/ve8UsPUSpxrtdapTjOFFzmq8fCHv+4cESjvlfIdDhtwJAra6o4jF1T1x+lLY4Xn2hvZR362eho1v1gYOteZ9XiXlzLgzrOZksvn5iLCYjCkA28EbzrWBCzvAMLhN76hPLoQoiw/uk1NFylbH/pP8CZorZqo8cgjLhfR5C/X9wJhTm+/6rS5a9LzY7NOcfy3v48J3jGorRnXweovRU6C2dK+bdkxNhXzH+A/uwP0eucpEBm87AuEtGlipqLqNxWk0KPmELnT0nKcBFTnxF4RrXtmBQ4HBGLnvXDht+hg5JSZwhSZVILNfCIgj3yZZeetHCdVCezm9jasDIXtFRA/nD4+wX8IZJVAsnWgk91Enb9eggzcMvxisnjI6+d71hXNS4qCe4ABzyZ66c0fVDwvJg19xMRW+VKNEOjaNBN0AtLaXq8kMCjmb8JL/qR8XbfdpCZEGKE8t9DF5zRRanc2LPl+0rhAX/DaQxB32S4edmQaySeCrDluIKKZdwzId9taQtcVNBi8Hilxa1C2Fjgwyuti53sV0AHxz1HSlQoiRUdEj1LduFp6yz+uw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(7416014)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GW5ihL3g+b4tl9a3rfcNoVCdnshoeQ73xkE3Xib9pfzrVd5SxvgstaL1QGYFiivY5t7Q2xqGIYl67QCv1E753icSksTNzLqArb/2AUYTJGjAADNL/ZE801SmzugstJyWaO8APlEbEYwPmCLKOT5Ya1b31rf3AGghkM4vXZ09R+QoF7c8LOuBE7NVCBeQ0XzFQsDqWIBI05JhyIKIGw5AA3XGCiYjwCP5wHoaS+0vlb9+1hVtwIS9llKWPhfrvNkN/rMqCAkad+8TUnaeWylrbikcWSwiBsrxg4Wa3JBV2FnG7Uxx+C+aFp8v/aR2JmK9Iwo3EW1G1AIfNvBnJonpRx63+TTR6THYIAeGUB/VcLW3B5Ix2ocRATNnJWRESmHdOvZFPCyEr5bVNV17LYnlwBP2GOtp3N1ITBW0/rpGj+XaQOiWphJlN6qRNtwphhV2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 20:09:18.8125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 862ddb7a-e6e6-4e7a-f60a-08df0de510b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999319

Hello Andrea,

On 9/8/2026 1:53 PM, Andrea Righi wrote:
> NVIDIA Olympus implements spatial SMT with symmetric steady-state PE
> capacity but two different resource modes. One-Thread Active mode gives
> one PE the full core, while waking the other PE restores Two-Thread
> Active mode and partitions decode, issue, cache, TLB, and vector
> resources. Returning to full-resource mode requires the sibling to
> remain in WFI for 10 Ki cycles.
> 
> Measurements show that pinned workloads perform equally on either PE,
> but freely migratable workloads lose substantial throughput when they
> alternate between PE identities. Consistently selecting PE0 keeps PE1
> idle, avoids repeated SMT repartitioning, and restores
> one-thread-per-core performance.
> 
> Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
> identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This
> is independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal
> capacity, while physical cores with different maximum frequencies are
> handled by a higher scheduling domain.
> 
> Firmware currently provides no interface for describing the preferred
> SMT sibling. Detect Olympus by MIDR until such an interface is
> available.
> 
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

Just one nit below ...
> +/*
> + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> + * two-thread active mode, with resources partitioned between the PEs.
> + *
> + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> + * mode. Firmware does not currently describe this preference, so detect
> + * Olympus by MIDR until a firmware interface is available.
> + */
> +static bool olympus_prefer_pe0 __ro_after_init;

nit. What is the purpose of "olympus_prefer_pe0"?

> +
> +#ifdef CONFIG_SCHED_SMT
> +static int arm64_smt_flags(void)
> +{
> +	int flags = cpu_smt_flags();
> +
> +	if (olympus_prefer_pe0)
> +		flags |= SD_ASYM_PACKING;

If this flag function is being used, olympus_prefer_pe0 is always true,
and the scheduler will never call into arch_asym_cpu_priority() without
SD_ASYM_PACKING being set so olympus_prefer_pe0 is always true there
too.

Seems redundant unless you were planning to do set_sched_topology()
unconditionally for whole of arm64.

> +
> +	return flags;
> +}

-- 
Thanks and Regards,
Prateek

