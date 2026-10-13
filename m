Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162188632B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864632; cv=fail; b=HYjxUXIVgqFMVsjYDqzge0MHXzCOb5s2ud1Sec84UamnYEXOymvPl6IpYCM2Q/TDd0k5ceVbZp4+WfnPNSdeGBvqt+duV/+s8Lw2MuMN2BBY0/ZXTaVPJDaFx9ozBYFiPItf4GzgSTc5co4Xdqzivcg5hrfVEuQbdi+SDzp0cIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864632; c=relaxed/simple;
	bh=uOh/uAp1xvC9B0yyw3dJu1VyVIM2JP46JZR/fKsbQv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UL+vvM0ldR+jyQCX1f8V28tMiuFmQvPF1ClojpxaUlOtWNpehme7PlhJkkGER0JDWEvPIj3gAkXs0IhqET9vCTXgFVSbQRj/w2/Z0qlaDG60430smK6R91zxmnVJ89BhGS5p1nqjdwCfRK7soeuHQufh3HYzXrALK+vtmMeMeW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g/LOYpD+; arc=fail smtp.client-ip=40.93.194.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g/LOYpD+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PA9CgeTFYsk0K1yzzHkLx6Zk++KA0H6FBbXg86S8mFAvBwPGOafD3dhIzn7cn8OlsYw7EDzdpg6Ku8zB3ypa6PROS++H+RohQ0vSx+MDMQoMUMDYwGPE6GNg4ZVRrEY3gxElb0vjCsnZUpbIg4kAoQMHCr9uOzeCQEJeLlI8BKXl5KYwnMq2rv05Cqldykvv2FaMuFmXj0JXmEhwJvowY0cSTDI0oiPytlqR4zv2LFbWFYX+emd8BctdtZ6NDiFs3oFM58RgSFCS/HSqrOpkce2n7GCbNHa5D4T94DHOREayHBAA+YuNN6fuLyp1ZTz8jotNnIS/SgSzlX7EPUOENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+nfHRF1jZra03RiUTJD7epk1GM0uUgLOcZRZZV3JAQ=;
 b=ooBEzGemJlff3rtNmKOuXzLu1Jc3wHFS5QXuFe0LtsxNMO4VUyf3Qbrh9y7bqS/P3Nd7WYIuAC/bvEVHtPYLVgDL+Bw9KeToTcIybq49pqjqnsFLfSPuX3m2oBz7TFSofHNHzkAv5jSP4BUccCZ15OYu2vjZZg5RSZEhcP9hzWfg5ixWFI5FcWIkQAZUVJmKGZsChTZw+bESoNib4DpsbRTTnfA3AXzniyO2LI9C0MvYiT54PmmRnCEtF1sqAWM7bUwWVUwMGiKa1Eu+0KSBXtpV59vgpFSLVyszWbZDwBBuPKadSRcyVGGxbmwmaPY6jNNJuap/AxjlU6iDiQmiog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+nfHRF1jZra03RiUTJD7epk1GM0uUgLOcZRZZV3JAQ=;
 b=g/LOYpD+KTkElZtDRHeNwpn2ZCzHu0u22cBK//UKnsN8QSpV5BKc5XZrRc6WoUjhjGhxDUllxypeApm/aSq875aNkoiAdxiRTfCVxIiHydPapod7O8Dezwy/SfJ5/flD7O7De8nzn64gpH00eoZTtTyvkYdDAeRNh5m86g3N1gw=
Received: from BN9PR03CA0241.namprd03.prod.outlook.com (2603:10b6:408:ff::6)
 by IA0PR12MB8325.namprd12.prod.outlook.com (2603:10b6:208:407::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Tue, 13 Oct
 2026 04:10:23 +0000
Received: from BN3PEPF00022BCA.namprd03.prod.outlook.com
 (2603:10b6:408:ff:cafe::48) by BN9PR03CA0241.outlook.office365.com
 (2603:10b6:408:ff::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 04:10:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCA.mail.protection.outlook.com (10.167.248.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 04:10:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 23:10:16 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 23:10:16 -0500
Received: from [192.168.0.235] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 12 Oct 2026 23:10:15 -0500
Message-ID: <7a29937c-b591-40fc-95cf-021799ea52a7@amd.com>
Date: Mon, 12 Oct 2026 21:10:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Serialize HMM range faults on one umap
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
	<mario.limonciello@amd.com>, <karol.wachowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>
References: <20261012203139.2573687-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Max Zhen <max.zhen@amd.com>
In-Reply-To: <20261012203139.2573687-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCA:EE_|IA0PR12MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: c50979ca-12d9-40c8-d841-08df28dfe70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|56012099006|11063799006|18002099003|10067099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	A8YqY89d6EKNfXyjnqb7xq/P01X2m2ujfJk7iovqh3ajx5aaXyjARvit7xLpjXjM43YvEBjXwELak1ynNP+etwDzrPVwBoGI/KXs7WH7dKtWHD6i6dT6LV9N9mBhnd8M9vFct+x2SnleJd2H9/xjskD0M6NBjr9RI1YcYlR7QpDYl/Zppwt17M9qzwunHvaE+ptliZbSMkO5ii6J6CZXXpOOKKmJKLsOHBHB3TwU4pJnLWPA3SF0Qckn0n+HwK361y2nX0IM8eD66TdKNTOCwpWXCM4kkMjPar0WFHSiB2l1eBgCHGQWIBlCbTMzdmmTzi52AZtRzB+Y4eM+ex15ydYgtxLIL/dXTKGQ+894Hx0vcLVXIhQWiwA225oZXpe479xZl/kbvpySuKrWgkMr+W1KycoHJIWO5y9rqjkNqGnIHnTA2MPW4IVSaOPABI7LGvo5ckWyWVqnrzGRakgGkYSz5J2Debq97AbGB/nzfl47+6wcyy+siCBtFtAiyxrDrLKQQUY4cUEIShz5/b+Yvr+ILKbi+y38sTsJZgkeKmJ2ovZLkP6z7Iwm+p7qtWZCvrEuTStGhSIEKX1EIkIUmP/pFd4MzfCuoMn9QhlHs9CE2vlO4FiImEx8c+mBsVRQ6RY/GkGSz3fj6HLBDXYjvTU0yPZL1/FwBmVyD/Lx1jw1+dFeAhTtyYXLxLq7SZnW3pIkjWz9TYxiK3brjhN80w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(56012099006)(11063799006)(18002099003)(10067099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mDaDZp2UtGMoYlbX9AwEmtcsT2Cx+fQDGUz4EXsE98/YHRhgDX3NcYsH8CIVIwJque2HlEn5v7IvFofF8sJ6+eiBXSSPtwpB6AR45/irggOx0JMjtl++VkzXNXjbsRdyMqzJw1UcfvbywaP2VO8DIBhA4cy9W0fbVp+PQuEVFogflxbdRqcC9HM6AGslb/lzCgeAGrhLqr/xKLIT5Zc2tAUJxBpLvgkP/xISZBkaLy9NvhcP88d/RFk4KAgkL983gbwNqOSEvSAEWiyuJs0Bz+PHoAl5f3CLwGMpZ5RDP0yjOOD18Dn8qN1NqCbtyG7XaDiDQ69GIngn3+JAOlkChI/7vgXZ92X1lfcxz4WY39LQe1rCtrOgPa4SNphk/8PdVORncPrqIZfEpOF9Hbo8tHrKvoxdRElLMsj9teIw1f2i0U7M4bsMlhJumpqzs7f7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 04:10:22.5611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c50979ca-12d9-40c8-d841-08df28dfe70c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8325



On 10/12/2026 Mon 13:31, Lizhi Hou wrote:
> Two hardware contexts can submit jobs that use the same GEM object while
> a user mapping is invalid. aie2_cmd_submit() drops the reservation and
> notifier_lock before aie2_populate_range(), and that function takes a
> reference on the first invalid umap without clearing invalid until the
> fault returns. Both submissions then call
> hmm_range_fault_unlocked_timeout() on the same struct hmm_range. That
> structure is not safe for concurrent callers. The calls write
> notifier_seq and hmm_pfns[] at the same time, so mmu_interval_read_retry()
> can see the other call's sequence, miss an invalidation, and clear
> invalid. The job is then pushed while the pages may already be gone.
> Give each umap its own mutex and hold it from the fault through the retry
> check and the store that clears invalid. notifier_lock is dropped before
> this mutex is taken, and the fault drops mmap_lock before notifier_lock
> is taken again.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Max Zhen <max.zhen@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c    | 7 ++++++-
>   drivers/accel/amdxdna/amdxdna_gem.c | 2 ++
>   drivers/accel/amdxdna/amdxdna_gem.h | 1 +
>   3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index d927c8c9d557..4db67a789c34 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -1155,19 +1155,24 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
>   		return -EFAULT;
>   	}
>   
> +	mutex_lock(&mapp->lock);
>   	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
> -	if (ret)
> +	if (ret) {
> +		mutex_unlock(&mapp->lock);
>   		goto put_mm;
> +	}
>   
>   	down_write(&xdna->notifier_lock);
>   	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
>   		up_write(&xdna->notifier_lock);
> +		mutex_unlock(&mapp->lock);
>   		amdxdna_umap_put(mapp);
>   		mmput(mm);
>   		goto again;
>   	}
>   	mapp->invalid = false;
>   	up_write(&xdna->notifier_lock);
> +	mutex_unlock(&mapp->lock);
>   	amdxdna_umap_put(mapp);
>   	mmput(mm);
>   	goto again;
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index f14484bc31ec..37bfa5058095 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -318,6 +318,7 @@ static void amdxdna_umap_release(struct kref *ref)
>   	struct amdxdna_umap *mapp = container_of(ref, struct amdxdna_umap, refcnt);
>   
>   	mmu_interval_notifier_remove(&mapp->notifier);
> +	mutex_destroy(&mapp->lock);
>   	kvfree(mapp->range.hmm_pfns);
>   	kfree(mapp);
>   }
> @@ -402,6 +403,7 @@ static int amdxdna_hmm_register(struct amdxdna_gem_obj *abo,
>   		goto free_pfns;
>   	}
>   
> +	mutex_init(&mapp->lock);
>   	down_write(&xdna->notifier_lock);
>   	if (list_empty(&abo->mem.umap_list))
>   		abo->mem.uva = addr;
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
> index 9b4aa21a37c9..456a537eb68c 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.h
> +++ b/drivers/accel/amdxdna/amdxdna_gem.h
> @@ -19,6 +19,7 @@ struct amdxdna_umap {
>   	struct kref			refcnt;
>   	bool				invalid;
>   	bool				unmapped;
> +	struct mutex			lock; /* protect range */
>   };
>   
>   struct amdxdna_mem {

