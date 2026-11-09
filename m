Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254028;
	b=5YP2uC58NNp5a902+onrbzkGlgkdRnYDjz6HtHL4oV2yxU39ATW8/oAgEOaUOimA5u0F
	 oDAboSPKNG566OLjYpwPJhgYXQtZz+YCzpy9FZiQoPDOhlCim5O8RFTSLJZ8Ub0rBTLXZ
	 r9QjRIEb94MsoPFrDPAfvHG+oCKqHfo+Je4ZLoRURTHPg7DeL989b+GfxLUL1WkQNBq96
	 HYFiIbqct4lXcyPRVkuEvRrI50ZpS2vw5roSHVIdyBT3cWE8N8bgsZYcMGm1B1dCwK803
	 eTeNn7wuRnSX5DCJ64irbN/OJb++U3grj3OZ2vUA17kSyTpfxMpHCmBALmIFBiynseQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254028;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:CC:References:From:In-Reply-To:Content-Type:
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
	bh=gsPMbVHOrEm1CS2Xal74/esdWLmDC7mjAWytz7rASQ8=;
	b=MsEa/55sNAoEELgnG2RBLBr0UFps4MjV702SLSFRFe0V/JiA4YM+FbzXVFjZFdPgdAEy
	 qafoI8QtmhESDOWWAq+HQQSbAVzabhdg286FQ4NCuL0C/29tNk9185/mTBpqdMqxmhL8H
	 qW0GgYreXPEO+KEdDFbM6o5NIbmwTrMGvFTsOhOQUAAxxH0AIM+ho86JTsfZTUG4P35x0
	 udczc+lKAWOxc7iiJo//TSUIGVlZrlMKP1SYblEs0H2E5dKHwy5Wntufm8RMH+Xo/CXh4
	 CFTca5Ca3p6ZaAjJtZQEA8a/jDE6Wa+QPBA4DjrkAB2j/IyKrcmRicO3GZBo0hQGdFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xWQrDm7d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.5
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011005.outbound.protection.outlook.com [52.101.57.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249760A3824
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4249760A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xWQrDm7d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGCCom1QoYoHhv8/IqEX4Js7lP2jQzl3CnMT4CNKYTDBVKwc2XBf58oHgbKtm6kf8q9EtNz3EzFWmASpoTohroKeW6RUOnP0lKztdfEkH8s4TBQ9/VAdoPOqMdLmpVlZtHp5ztItGMQ2xjtsXAreyUdJZpVkB1gIt/evZ9j+R1YgA8mb0bl7+FjXCUw14aRI/KAeNlHDw1eBLduB4iHO+nmzmWdHat3pYawV5KZvaMtrPhY+pkQVjS47+FxjlLDG75ZlCM1CcPTcWwabiy5+n/Ak1RGihKvEtG/ieZnh3RJcSWkMU6ki8YEAwaCjb/OSAnNGTYvz2LkbMcJQh0CWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsPMbVHOrEm1CS2Xal74/esdWLmDC7mjAWytz7rASQ8=;
 b=XljvJRrQV0urRD1ukoL5Ep4J9VHc2PyMBZCx8MFYnWIE6yFO/BT5K8qm4wU5FIW8H6YuACIN/U8rN/i8xrEM49eHyV25YmtjJSs0kCyH6R+/Aum5QvhyI5ZOAbDo6QUEZTKteDASURtMUCXdb7BB6l5e+FcnghxL+y1/PbaLC6zGW7b/qrCgHJSW6KpsrCd9TSelEetCE96Xo0eNPKHpumLj8DYQ2tTfYQYhNvK9P5gmyWy067gbAWe/C2dzm/uAO6mvoKcjPLaLcG/kHhR+GQjmXIRGT/rNCIyeuB9v9YyLKQjDa3XIoZb7c5TubLPe5q9hCA6ROGQ6CyB7+bHUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsPMbVHOrEm1CS2Xal74/esdWLmDC7mjAWytz7rASQ8=;
 b=xWQrDm7dpwdWxjjnwOE7T79aQ9TWRjWNyNfr87VJlfApIuYmq6jJMZk3+Pgaswwj6SWx9HtcM4mVe8hrhT8VkdlvcnSc9GhpYuhHt0vhY7KTXKBg+pkZvqI5OZ0dWOc+CKj3sjOlAmZ/KsBMVUdjIe4R8POnOXLOtqyRf0Uc4cA=
Received: from CH0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:610:b0::22)
 by DS7PR12MB5957.namprd12.prod.outlook.com (2603:10b6:8:7c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 19:53:40 +0000
Received: from BL2PEPF000352D9.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::5f) by CH0PR03CA0017.outlook.office365.com
 (2603:10b6:610:b0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Mon, 9
 Nov 2026 19:53:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL2PEPF000352D9.mail.protection.outlook.com (10.167.254.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 19:53:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 13:53:39 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 13:53:39 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 13:53:37 -0600
Message-ID: <283f184b-eefd-2402-3ed7-a08a96dce382@amd.com>
Date: Mon, 9 Nov 2026 11:53:37 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1 1/2] drm/gpusvm: add drm_gpusvm_pages unmapped and
 retry helpers
Content-Language: en-US
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>, Matthew Brost
	<matthew.brost@intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Santan,
 Sonal" <sonal.santan@amd.com>, "ogabbay@kernel.org" <ogabbay@kernel.org>,
	"quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>,
	"karol.wachowski@linux.intel.com" <karol.wachowski@linux.intel.com>, "Zhen,
 Max" <Max.Zhen@amd.com>, "thomas.hellstrom@linux.intel.com"
	<thomas.hellstrom@linux.intel.com>, "himal.prasad.ghimiray@intel.com"
	<himal.prasad.ghimiray@intel.com>
References: <20261106184217.2720718-1-lizhi.hou@amd.com>
 <CY8PR12MB71707223ED3F56E5894FF353D9732@CY8PR12MB7170.namprd12.prod.outlook.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CY8PR12MB71707223ED3F56E5894FF353D9732@CY8PR12MB7170.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D9:EE_|DS7PR12MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b9286a-2e63-4e79-172d-08df3e9b26be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|10067099003|11063799006|4143699003|261102123227099003|261021121427099003|56012099006|261022105027099003|261026140227099003|261021123027099003|261009221227099003|261028144727099003|261026121527099003|261009223027099003|261102130727099003;
X-Microsoft-Antispam-Message-Info:
	K0mfp6c3K3gQ6mLQC4bQEfvAd9PdgsIFZ64j3Q8H4m+G5Ib9L2tKMOBVDdfeF8C+mKQ0ziqq0ckFMXH9RsXQQA6CknrhgOwo37OXShXUDFE8lZNKnfkH2K65AHkTeIb0s2cNq3SSi1iW15C9oDdAZZ1B8U7Iewu5Vx+KLjsUB3a+K9GQSK4JZbZvP6v9nKHKnBo+z2HHaoiTMSUPcROIz19Tk8ougR2XJh8JOqcb7/pGf9CGysRtiDtGCvkthDwMcqU5lh1c8wPJXOLpx/9IZkSGB2UHSjHOQEhnxavH9cqYHmXr2vL+O4QmbjX1DQf7MENCnd2MXztsomtuQ3Thewn8MdkRlaAvuISgmkwaCfX06+1+0ekTyhOz4dat8RWwRsIH7pmus27/UsTtkgVn0Pwb5WyK0jpWfZY+fhLd1WKsmzY/N5Fe95ibr/EhW7KEcMBveZQP+Q/p2FzVyZSuAZr1b2eT3ubWtcBG/zinHIbd+LtOKiTlEi37n8lQrJlFcsjENwCo1i9n9NeVFQ18agSk1Gt8giU19Egkiar9d6bSepLXzVP5OXuC5yxPff+ca4O0Fkne+x+ZWzben9Va4PVgMvZhURb065lvaEJq+mMgKI+mvwanxvcYzMXtBrM0qOHxhSC0AA7uL9SiFQGkWnNWosn38W9PQk8vXpiMmceFMSbNMNWl+20+ccpbLDhuSx+EVp7/FBqA6OA27V9qzQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(261102123227099003)(261021121427099003)(56012099006)(261022105027099003)(261026140227099003)(261021123027099003)(261009221227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261102130727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MnygK/wNjhIdCSkQjiWAvtbL1JzI1M5LjGW0zEvQbRGNbR0UYs9ed4sbC6J64b7qBTmDZCrg8xFn82EoqmaBRJK6PoTxBZaEnIuNYZCZD49K2KjMf101KsI8EshOzdFEGA0m0+PCWlTQOIyhQlW5nb8gmiiZkrT5eO01V8RxMByKRBAy0lSElqeQZmAiLaBCZpQhFIG1J37+mbQrFauKKJt28wDG7Repb1JfTOZoG6+z0E5n4ud12DKZ6T+BUiCCrBQ/hAcW0AJDzGpvTnrSVXX1PJpTuqz2ViFYbMjyKBJOMCjsF5MhInknKMy0oMh9bB4F27Aevhjh+MFp3o85tlwogfIIK1Xo4ENS/BoRCLZh/Xc0AtPIizJsrdGV/+M9rhfkzM/X1lPUzvCjA9kjNQO2752aLxrmSHo8EBa2H2eW4TGb1vweX+VwoRMA8I8p
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 19:53:40.0297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b9286a-2e63-4e79-172d-08df3e9b26be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5957

Hi Matthew,


How do we converge on this?  Both 2 patches are reviewed, is it good to 
merge them to drm-misc-next?

Honglei, Thanks a lot for reviewing the code.


Lizhi

On 11/9/26 00:56, Huang, Honglei1 wrote:
> AMD General
>
> Reviewed-by: Honglei Huang <honghuan@amd.com>
>
> -----Original Message-----
> From: Lizhi Hou <lizhi.hou@amd.com>
> Sent: Saturday, November 7, 2026 2:42 AM
> To: ogabbay@kernel.org; quic_jhugo@quicinc.com; dri-devel@lists.freedesktop.org; Limonciello, Mario <Mario.Limonciello@amd.com>; karol.wachowski@linux.intel.com; Zhen, Max <Max.Zhen@amd.com>; thomas.hellstrom@linux.intel.com; himal.prasad.ghimiray@intel.com; Huang, Honglei1 <Honglei1.Huang@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>; linux-kernel@vger.kernel.org; Santan, Sonal <sonal.santan@amd.com>; Hou, Lizhi <lizhi.hou@amd.com>
> Subject: [PATCH V1 1/2] drm/gpusvm: add drm_gpusvm_pages unmapped and retry helpers
>
> From: Matthew Brost <matthew.brost@intel.com>
>
> Drivers which only use the drm_gpusvm_pages API (no drm_gpusvm_range) have no way to mark pages unmapped from their MMU notifier, as
> drm_gpusvm_range_set_unmapped() requires a range. They also have to open code the mmu_interval_read_retry() check on the recorded notifier_seq to commit pages faulted with &drm_gpusvm_ctx.no_dma_map.
>
> Split the pages part of drm_gpusvm_range_set_unmapped() into drm_gpusvm_pages_set_unmapped(), and add drm_gpusvm_pages_read_retry() which performs the commit side check with a lockdep assert on the notifier lock.
>
> Assisted-by: LLM
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/gpu/drm/drm_gpusvm.c | 49 +++++++++++++++++++++++++-----------
>   include/drm/drm_gpusvm.h     | 29 +++++++++++++++++++++
>   2 files changed, 64 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c index 03dbe304e4b8f..63a26919f59db 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1761,9 +1761,8 @@ static int drm_gpusvm_dma_map_pages(struct drm_gpusvm *gpusvm,
>    *
>    * With &drm_gpusvm_ctx.no_dma_map no mapping state is recorded, so
>    * drm_gpusvm_pages_valid() never returns true and success is only a snapshot:
> - * the caller must recheck mmu_interval_read_retry() against the recorded
> - * &drm_gpusvm_pages.notifier_seq under the notifier lock, and hold it until
> - * its work is visible to invalidation.
> + * the caller must recheck drm_gpusvm_pages_read_retry() under the
> + notifier
> + * lock, and hold it until its work is visible to invalidation.
>    *
>    * Return: 0 on success, negative error code on failure.
>    */
> @@ -2021,6 +2020,38 @@ bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,  }  EXPORT_SYMBOL_GPL(drm_gpusvm_has_mapping);
>
> +/**
> + * drm_gpusvm_pages_set_unmapped() - Mark GPU SVM pages as unmapped
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @pages: Pointer to the GPU SVM pages structure(s).
> + * @pages_count: Number of GPU SVM pages structure(s) passed in.
> + *
> + * Mark @pages as unmapped, after which drm_gpusvm_get_pages() fails
> +with
> + * -EFAULT for them. Intended to be called from the driver's MMU
> +notifier on
> + * MMU_NOTIFY_UNMAP, and usable without a &drm_gpusvm_range by drivers
> +that
> + * only use the drm_gpusvm_pages API. The caller must hold the notifier
> +lock
> + * in write mode.
> + */
> +void drm_gpusvm_pages_set_unmapped(struct drm_gpusvm *gpusvm,
> +                                  struct drm_gpusvm_pages *pages,
> +                                  unsigned int pages_count)
> +{
> +       unsigned int i;
> +
> +       lockdep_assert_held_write(&gpusvm->notifier_lock);
> +
> +       for (i = 0; i < pages_count; ++i) {
> +               struct drm_gpusvm_pages_flags flags = {
> +                       .__flags = pages[i].flags.__flags,
> +               };
> +
> +               flags.unmapped = true;
> +               /* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
> +               WRITE_ONCE(pages[i].flags.__flags, flags.__flags);
> +       }
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_pages_set_unmapped);
> +
>   /**
>    * drm_gpusvm_range_set_unmapped() - Mark a GPU SVM range as unmapped
>    * @range: Pointer to the GPU SVM range structure.
> @@ -2039,20 +2070,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>          struct drm_gpusvm_range_flags range_flags = {
>                  .__flags = range->flags.__flags,
>          };
> -       unsigned int i;
>
> -       lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> +       drm_gpusvm_pages_set_unmapped(range->gpusvm, pages, pages_count);
>
>          range_flags.unmapped = true;
> -       for (i = 0; i < pages_count; ++i) {
> -               struct drm_gpusvm_pages_flags flags = {
> -                       .__flags = pages[i].flags.__flags,
> -               };
> -
> -               flags.unmapped = true;
> -               /* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
> -               WRITE_ONCE(pages[i].flags.__flags, flags.__flags);
> -       }
>          if (drm_gpusvm_range_start(range) < mmu_range->start ||
>              drm_gpusvm_range_end(range) > mmu_range->end)
>                  range_flags.partial_unmap = true;
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h index 4d31c6bba7455..b43432af56377 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -349,6 +349,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>                                     unsigned int pages_count,
>                                     const struct mmu_notifier_range *mmu_range);
>
> +void drm_gpusvm_pages_set_unmapped(struct drm_gpusvm *gpusvm,
> +                                  struct drm_gpusvm_pages *pages,
> +                                  unsigned int pages_count);
> +
>   int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>                           struct drm_gpusvm_pages *svm_pages,
>                           unsigned int num_pages,
> @@ -383,6 +387,31 @@ static inline void drm_gpusvm_init_pages(struct drm_gpusvm_pages *svm_pages,
>          svm_pages->notifier_seq = LONG_MAX;
>   }
>
> +/**
> + * drm_gpusvm_pages_read_retry() - Check whether GPU SVM pages went
> +stale
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @svm_pages: Pointer to the drm_gpusvm_pages.
> + * @notifier: The notifier passed to drm_gpusvm_get_pages() for @svm_pages.
> + *
> + * Check whether @notifier was invalidated since the last successful
> + * drm_gpusvm_get_pages() for @svm_pages. This is the commit side check
> +for
> + * pages faulted with &drm_gpusvm_ctx.no_dma_map, where no mapping
> +state is
> + * tracked. Pages that were never faulted always report as stale. The
> +caller
> + * must hold the notifier lock and keep holding it until its use of the
> +pages
> + * is visible to the invalidation path.
> + *
> + * Return: True if the pages must be faulted again, false otherwise.
> + */
> +static inline bool
> +drm_gpusvm_pages_read_retry(struct drm_gpusvm *gpusvm,
> +                           struct drm_gpusvm_pages *svm_pages,
> +                           struct mmu_interval_notifier *notifier) {
> +       lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +       return mmu_interval_read_retry(notifier, svm_pages->notifier_seq); }
> +
>   /**
>    * drm_gpusvm_pages_first_dma() - Resolve the device address array
>    * @svm_pages: Pointer to the drm_gpusvm_pages.
>
> base-commit: d2a8cee91bfa8616f713c7c8f539a81e8e3554ea
> --
> 2.34.1
>
