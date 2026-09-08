Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011032.outbound.protection.outlook.com [52.101.57.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AFE3AEB5C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899876; cv=fail; b=EHBYie6eI2SN3YuMFPUCKjTzGhv/y9qrfLJ/aItZ+H4wweFjIfDKKtlOU4sxuGzk6X6SMO+6CqtUuc7PwA//DqnBJHZNKLvNqKxviHxcQvadvkwJKoRc/+e/k1qU7eAI2xg2QB+1Gm8xne1UAJ3EDWJSbu9pdlN/5tJE3mLRMvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899876; c=relaxed/simple;
	bh=JuNpLX7/CntUamzSDmVIn66URQzS7G26fctBqvbqWHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Hn9lcrdSMru6tPNvtAmeEzxHScWIAKO6VYyHW+QNjjKYxZ2E07lf2Z1tQ3v9E7mb0YHzwmPFVdSlWGNIFr7FCZnjQqRmTvwTx85/t3lfJJ97lYyMPxTC6PNIXmahw2PZMMUcW65i4wvNv5R9+sv6xdvlhx0OWjYAnx4Y5xzp2cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e9xQQKSp; arc=fail smtp.client-ip=52.101.57.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e9xQQKSp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdDa6R3F4SrvjV592Tfdo5stplIqmTqtJdN+CUHYygTKMYxhOZZ6gUP05cE7DcPsSy9jmcSf1C/SIttX4ajtD7YEg5mc0K5GXEI26wH8+b7kdyNhYTBnj4vg6vvXOWTHZETZ4VPMNNt/pnKAdq6weIEz02mWbCEzBR38LSjPXvZkNWYp9VEzuPPZdymjrRdBhs8TfQgBerZGwCRC9wLOqUeRSoaXt7J3UeTdjnHKfZMKrnVSvRxbD4GLlm207AzJobJ4jZx47jMvZ53l9NUCN5YCu/D61RJwGu2AHURkun/K6k8SaAIogs9xIarsubXX6Gzr/P4g4R2qa+7+I3FH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU4Vp9gJwkK9ps+QNdO7YHKkyu8JvhyWea9NFXYwGaY=;
 b=d6d0RKfjRnBRiqPzA5G1MuvfaK6a5tocsK6G8vtTYGp9gx1FgLHU1zJC6OUzq1ggbvdoNYHYvI5Mfo3Y7A2yjiOWvFlh9MRldZhW1HgypG79x/Bg7ZZh1VWCustEohN1JIHCBICYYWbsfLI2vJvkwgkcUzk9RiEXonCVM9zR++Zbg9HsQFsXFzm9egVmXNRQXKlEIEjVtfIK37F7SV3WlosnLEw4nxFKHeGExgBcYpIgnXzv8JSZub5057PGz2eSGTOtNAYpWAG5ltcWtv2VULx2F7wV5SAVt2W4X88HeEjvSQmeko4rMQAgrYyADxEXyL7SRPOFscMA+NoTtP1SAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU4Vp9gJwkK9ps+QNdO7YHKkyu8JvhyWea9NFXYwGaY=;
 b=e9xQQKSpdkFtWyri7ekGD9oAMDIj/5m5TQEUSOLg1cgCYLmiBSMyKsyLh8dP2UZoGSgDWmLVHVNiy4mhIlb8Xn7poqyRh7FBfWi5ZeJG7K8ILpXv1I5C/qGqNE5wo+XFO5zOwPCXKMmiVPxpxFOdY/i8j0kNFL83OEcIVIvDbi4=
Received: from CH0PR04CA0030.namprd04.prod.outlook.com (2603:10b6:610:76::35)
 by SJ1PR12MB6289.namprd12.prod.outlook.com (2603:10b6:a03:458::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 20:37:45 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::33) by CH0PR04CA0030.outlook.office365.com
 (2603:10b6:610:76::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 20:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 20:37:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 15:37:42 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 15:37:42 -0500
Received: from [192.168.0.226] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 15:37:39 -0500
Message-ID: <88404fc2-22e5-4792-9de3-ffce55e98055@amd.com>
Date: Wed, 9 Sep 2026 02:07:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/eevdf: fix rb augmented with multi fields
To: Vincent Guittot <vincent.guittot@linaro.org>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20260908135526.2783039-1-vincent.guittot@linaro.org>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260908135526.2783039-1-vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|SJ1PR12MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a1f192-a780-4ca5-29aa-08df0de90827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700016|376014|23010399003|13003099007|921020|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/X4C/9j3nXJ0KdA8IPhwUXxsHzwccOmcYoljF4vTdZqFQbVfzKysJnBsKRG6yzzqPfSQXEfBP49EN1QBxSHmbc/gODA2K1AezoX+RVKVYSrv4JUhgPL/U8lQsF6uwn+H4qHzkvSya52lrRHx+BQy4+P1Ftu6Rt+EWAALR0TIjWOkR2GbjmrgW0A/zmksh7+DKShDWZojQypd1zYcUsFwRNjWXJTQvaktwW5qOQy3rM/x6kWGWP4FLpFheCTvkgrxTvIXJVTfu5ED/3kPG5Bw8NS4NYatSp4mwx3+R/gK1XDQLyoRc1FG9yE9VaO0sRHpjcmIcwKAGTohvIbNJxCgi3n6+Jla8tZ38tpxg0ZbCkB2iNmgCHrVtn0yH/9i34kP/POH9O69kuU51aXCb5HgZHSwzpZDqEJTwN09VekhT5Y8PKF897JgoSYzofQ2FsSy5ir6GDhgs58v09Ol7QYD5OP9OM4xvpQzEht1h1koxQW7gQk4JTZDNFnUa3Q14GpTc7XVaZHSc1MiCv17KZb7Uuz4L+eOTJGPZgaQdQDTuGQY8XzwckKqVVrgtmWZfWjrJ+rvVBmbdBS/z1cpwQ+rcTIMWK9dLWr7Hd5HeYSdRV/oQF+WAIYdBJDaYhlzpQqrFCsGyOoaAC+en0PM6WbVYksnn/2mC3Lkrn9ZdqOUWTtMSIUkU6FLex1+q15tdftuguXd+mQboOUrp4Vj/4774GNNm2yw3z58M7CqfUCcTqPRFrddHlX7L0ZAyfSXTEot
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700016)(376014)(23010399003)(13003099007)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w+nYtcXNC0717UGdvLWWb5/zGVfuDQRB++RiwVLXADVD4BZZT+2D4fqVxXD/imYMBLWJsmiMMofF4uCE9l34vfHQYXxApvJ7JyiTjEwo+p3+DqpCvLKm2QkencJKlIcTU3ldBSJQo7lxnmoxl7E7lzbkvxEtvpfVtDo5fWtnEk1OiyC7KnavpuV9HZma1p1uG7kiDEbSE726Dppke8sG0yDEzofOn1lVuqco64qM5g2IByN+h7wDYlwVoIcYyZCSRCGlJHce4IBS87wtmbukKMJ+WLy5k6XU9paqPuF2sXLrQ394aPd2SsUwpBxiAH28S2sWyIMSbtNopz2s6Gl3dBraqfS9bmNGQYkzfw3XuTAbe9dn6jnxkMq7TWUINw/yoMZN0oW9swkiTBSKogaoW3kcI7SI5LT/656XaRuZkgyzXVNtGkQYOzaf6V6CKO6S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 20:37:42.4463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a1f192-a780-4ca5-29aa-08df0de90827
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6289

Hello Vincent,

On 9/8/2026 7:25 PM, Vincent Guittot wrote:
> The eevdf rb tree maintains 3 augmented fields but only one is currently
> copied when balancing the tree.
> 
> Add a more generic define that can be used when there are several augmented
> fields. In this case, we provide a function that takes care of copying all
> fields.
> 
> Fixes: aef6987d8954 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

I remember stumbling on this in
https://lore.kernel.org/lkml/20250220093257.9380-22-kprateek.nayak@amd.com/
but working around the problem in the scheduler layer instead.

Generic rb-tree layer extension makes more sense. Feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

[..snip.]
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index db5937d7e46e..019812c4fe32 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1037,6 +1037,16 @@ static inline void __max_slice_update(struct sched_entity *se, struct rb_node *n
>  	}
>  }
>  
> +/*
> + * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
> + */

nit. Do we need this comment? It doesn't really describe the copy
callback.

> +static inline void min_vruntime_copy(struct sched_entity *new, struct sched_entity *old)
> +{
> +	new->min_vruntime = old->min_vruntime;
> +	new->min_slice = old->min_slice;
> +	new->max_slice = old->max_slice;
> +}
> +
>  /*
>   * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
>   */

The one over here above min_vruntime_update() makes sense and should
suffice IMO.

> @@ -1064,8 +1074,9 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
>  	       se->max_slice == old_max_slice;
>  }
>  
> -RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
> -		     run_node, min_vruntime, min_vruntime_update);
> +
> +RB_DECLARE_CALLBACKS_MULTI(static, min_vruntime_cb, struct sched_entity,
> +		     run_node, min_vruntime_copy, min_vruntime_update);
>  
>  /*
>   * Enqueue an entity into the rb-tree:

-- 
Thanks and Regards,
Prateek

