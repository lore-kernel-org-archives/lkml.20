Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012062.outbound.protection.outlook.com [40.107.200.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8937E5C5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629587; cv=fail; b=M9hgetMPFMhpy2OQsMOEH0FNLx4w1G8B5nq4Z1bD1qtgKa5oc9s60hMPPi5i3UtPbx/W4oweW0tKXlpebBkr0VFDqLkjcNKBG5DZNNA1Ft6Jt7xHhSHRNAqjI0Cm6YFaVhyfegRA9NhFo4s4scBisTmkSbL2Jxo3j5N5YZSoWWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629587; c=relaxed/simple;
	bh=/EAfzxm0JBmCsneu3waBJN+JAHIPfUgejLY6z7WoLs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u91/1oYW1nfnLOBkRFofqKb7iJGsSGy6jXR3Ff2cpmoYX7HDC7EhR4CtbrhHphAX1DSzPnBQeN1g0fS0zhsqhL/bcE+3myFGHA0JBmt5VltjM9YhKYbvKKFDj8cDBs1TAmXiM5gBmXdmr7LUhf3FPEv7qFSjADIGus3cQ4SnSYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DXJ18O4l; arc=fail smtp.client-ip=40.107.200.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DXJ18O4l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZpxrUM+8M21+6WMlDtKgvvCi9W2xc+YFjlSroxOVoR+a8wMRQRWaa2kCP9IOCtCKTQzWV37PNt1o0+AptBFNofv5soBQRDSO//JSegItvh2TSuMYnf2C9QXng5TXGDP7nrgv6tTMhn/mamROcX4NlCr7OqFXeqlKaCVn3ervZUuAUVhalGRUbeizx0W7zCB+BSSHCjiJrJiVTI253PneSA6frWKKyZnmDqaVXHip1QdVi+TSj5cL3xbih3ZPyBd+BOwnFD2tm0xYjrPTfm1iuwSK2TpjWo2bXF98aLdGSXXP6rv+te1QiK0Qm2e3psUcTGAQqi3a5SaJWGvrQq4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+aGxl0OO6IV7leY0OvR9PRpkTMqGNcYq1ZULnED4MQ=;
 b=JfduAIs3kr+7+BA2pGgTxYYkw20FbFveSAnrOl+g1vymkMU3ikTYDyqttVd6C5QtDChg92iKZ6Ve/78QgtVO3aIfh4aKh2/hrK1gCxnC/Rh2cjVvszaekY825C/GHpGokuIGihUAwSX5jkeecjs6IzMR1boFCXUkQLAvKqN9DlRv3IIi20MtCLWzkRjsW/8axekLmwtQqEGYJ6elLnKLPUnYFPbEGQ4JcxgnpBWZyvaWVF3ATmfU8MA9GBdx/OaCm6S+4kbbthIBiiaNDMVCTTdT9Xf4+AGYTS1lRjes/Tci+lajQlk7izg1SHg7Rw9t6sBoyPttwJZ+MtaLqaDobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+aGxl0OO6IV7leY0OvR9PRpkTMqGNcYq1ZULnED4MQ=;
 b=DXJ18O4lAETTHupuF7xCbwGre67JW5xddiwdGB00NEPUvmOKiOoI304misnCzrcE5Mv/cvv6Jm16d2QVr9cuUbd2AqVS8qYL2z239IAOoysGmn2r5N6sleFhAydlaMgYBo+4xmSiKTKBEkW4YLdxqVoGgopv24+A048o7ngGqD0=
Received: from BN9PR03CA0750.namprd03.prod.outlook.com (2603:10b6:408:110::35)
 by DS0PR12MB7852.namprd12.prod.outlook.com (2603:10b6:8:147::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 21:06:22 +0000
Received: from LV8PEPF0000006B.namprd03.prod.outlook.com
 (2603:10b6:408:110:cafe::5b) by BN9PR03CA0750.outlook.office365.com
 (2603:10b6:408:110::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Mon,
 28 Sep 2026 21:06:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 LV8PEPF0000006B.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 21:06:22 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 16:06:21 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 16:06:20 -0500
Message-ID: <c5da23b0-1552-b601-78e9-602e4140297d@amd.com>
Date: Mon, 28 Sep 2026 14:06:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V0 14/21] accel/amdxdna: Fix fence timeline name and
 context allocation
Content-Language: en-US
To: David Zhang <yidong.zhang@amd.com>, <quic_jhugo@quicinc.com>,
	<karol.wachowski@linux.intel.com>, <max.zhen@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <yidong.zhang@amd.com>
 <20260926013448.3840921-1-yidong.zhang@amd.com>
 <20260926013448.3840921-15-yidong.zhang@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260926013448.3840921-15-yidong.zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006B:EE_|DS0PR12MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e03f478-2da2-4faa-5bce-08df1da45975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|11063799006|3023799007|18002099003|56012099006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KN9x1uq26IEvcoofahLnSxVRq0D+bRxy+ipwZnOgQ7RY1NzRV4k8sh5hozR98KLRg6GSwK1LGfPhYp5kvTzDgclNmERDHdAa9zKIG+1PnHItknbv+sLnFPGBaTX+jVaWzaoJdkcF/BgKeSLy3DVAzeWbowWEjwej6knCrsE3c1gGAVcV/hUhuIhM8DiA45whGwyhcMrKldmYAYjoOqgY/laQWaAFPl9DIb6NoV9mHrgQft2b3FAMuAnO/J33xFZByih7Dxm78krrBEmWSnRV64F3oslsyuCm0yUbYTqmuZv7DvIorm+XA1lX6nHwCvIlXtiHJAEnpyxSGCLSES9ajNodoY8EE7wP/PN5w2erGLfy1YCQyMV/r41uck6PMpr5Ti4jgK6jpK+50bKNfWOR/0274gDmHHbO0IrhgB67EakxiXi/ZGz8PDXFXyrd3dsACF0/u/lzYh/wCKpOfd7rqUfeAQqJmxRDr9frNcGQBtmYzJUoyqxM+Kr2HDDnYXowVezS2sLdgbEQw+4hMHY6ecz41PKKyatPuBkG2Lk4/SR8oEH1VR/5pkpapSG7e8chhLEEC6dz/UGHneQT6UJevj+XJv0fC4DQlPuK/tdfFD+Jeqz/1QiC7hRk5evTCHZD917antRxozXyHDsSixO4trd174DpgIbhCvOal7vNgjq657Sv6KvHrJkDrhxHrVbThkGhylvbCQc7jYvnKUWqPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(11063799006)(3023799007)(18002099003)(56012099006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k+ZTmBYfnfUlCzO0zYffInUdM26G0TjoPv8vzpzu13mdYCxPiB5ojgNAuuqnSg5gtrhC7Fme7DZ7wnExEQUf45iEA+lTGtd8Td/1vXtRmHY+HBxqFgaQEU3gdmHYOwPzg82Kweqb4y6NyQfaJ5INBxJkk41wOwto1PWhtpNEB3CcT4vtt4HFjmkIFohDbKO7PbZ5AoosgleslGcyPDkeHGWvGwDJSGjdnsez6FoBIODXfzV7YMp3KoZ1YckpgNzZpoMVLA6CfCrC9BSf0VosRWGJT/iRtEHzJ8v6YSU0nh/9xz1K+6EFLkMli4BETLflcCcL855k96X1Pls0Io0euuvBqOXBdD8HFkI7c6JdwOnrvAALSMEgCHFLuJVD5BoyEsZ1Icc1mKqNR3yKj4CCn0JflmlJAipQ5+y6udpp8cqMHRjkNsrXpfpneqx8+URH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 21:06:22.2180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e03f478-2da2-4faa-5bce-08df1da45975
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000006B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7852


On 9/25/26 18:34, David Zhang wrote:
> This is part of the fix to align BO reservation locking and fence
> management with aie2.
>
> Fences published into BO reservation objects via dma_resv_add_fence()
> can outlive the hardware context (e.g. when a BO is exported as a
> dma-buf and imported by another process). Using hwctx->name for the fence
> timeline name risks a use-after-free once the hwctx is destroyed.
> Switch timeline name to dev_name() which is backed by the device that
> outlives any individual context.
>
> Additionally, allocate a unique fence context via
> dma_fence_context_alloc(1) for each job fence so that dma_resv_add_fence()
> does not evict a prior in-flight job's fence from a shared BO's
> reservation object when multiple jobs touch the same BO. Also guard
> hwctx_fini call in amdxdna_hwctx_destroy_rcu() against NULL ops.

Is this aie4 kernel submission specific? aie2 does not publish this fence.

If it does not fix any existing issue, please describe it clearly.

>
> The corresponding AIE4 command submission BO locking and fence
> attachment logic is implemented in a subsequent patch ("accel/amdxdna:
> Implement AIE4 command packet building and submission").
>
> Co-developed-by: Max Zhen <max.zhen@amd.com>
> Signed-off-by: Max Zhen <max.zhen@amd.com>
> Signed-off-by: David Zhang <yidong.zhang@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_ctx.c | 29 ++++++++++++++++++++++-------
>   1 file changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index 888e857ec558..6ca7774150d5 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -25,7 +25,7 @@
>   struct amdxdna_fence {
>   	struct dma_fence	base;
>   	spinlock_t		lock; /* for base */
> -	struct amdxdna_hwctx	*hwctx;
> +	struct device		*dev;
>   };
>   
>   static const char *amdxdna_fence_get_driver_name(struct dma_fence *fence)
> @@ -39,7 +39,14 @@ static const char *amdxdna_fence_get_timeline_name(struct dma_fence *fence)
>   
>   	xdna_fence = container_of(fence, struct amdxdna_fence, base);
>   
> -	return xdna_fence->hwctx->name;
> +	/*
> +	 * Use device name rather than hwctx name: the fence is published into
> +	 * BO reservation objects via dma_resv_add_fence() and can outlive the
> +	 * hwctx (e.g. when a BO is exported as a dma-buf and imported by
> +	 * another process). The device outlives any individual context, so
> +	 * dev_name() is safe to call at any point during the fence's lifetime.
> +	 */
> +	return dev_name(xdna_fence->dev);
>   }
>   
>   static const struct dma_fence_ops fence_ops = {
> @@ -55,9 +62,17 @@ static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
>   	if (!fence)
>   		return NULL;
>   
> -	fence->hwctx = hwctx;
> +	fence->dev = hwctx->client->xdna->ddev.dev;
>   	spin_lock_init(&fence->lock);
> -	dma_fence_init(&fence->base, &fence_ops, &fence->lock, hwctx->id, 0);
> +	/*
> +	 * Part of the fix to align BO reservation locking and fence
> +	 * management with AIE2: each job fence needs a unique context so
> +	 * dma_resv_add_fence() does not evict a prior job's fence from a
> +	 * shared BO's reservation object when two in-flight jobs touch
> +	 * the same BO. The corresponding AIE4 command submission locking
> +	 * and fence attachment is implemented in aie4_cmd_submit().
> +	 */
> +	dma_fence_init(&fence->base, &fence_ops, &fence->lock, dma_fence_context_alloc(1), 0);
>   	return &fence->base;
>   }
>   
> @@ -81,13 +96,13 @@ static void amdxdna_hwctx_release_expanded_heap(struct amdxdna_hwctx *hwctx)
>   static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
>   				      struct srcu_struct *ss)
>   {
> -	struct amdxdna_client *client = hwctx->client;
> -	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
>   
>   	synchronize_srcu(ss);
>   
>   	/* At this point, user is not able to submit new commands */
> -	xdna->dev_info->ops->hwctx_fini(hwctx);
> +	if (xdna->dev_info->ops->hwctx_fini)
> +		xdna->dev_info->ops->hwctx_fini(hwctx);

This seems unrelated. Please remove from the patch.

Lizhi

>   
>   	amdxdna_hwctx_release_expanded_heap(hwctx);
>   	kfree(hwctx->name);
