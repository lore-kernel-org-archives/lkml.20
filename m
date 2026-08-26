Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE143F412D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765690; cv=fail; b=oxtysU2SeJcntKH7axk2Mah4sRRj/o3m1JWMxUnECENrMeIwUS7QWFzKf9xVxz23/NLegYXY0Tfq9x19ZLSXmmlrY7cX8lwXLgZY2zFFSEjbEewyAHGoRe1nMKjCktO6btigAffPtceJpa6gXcAr07HK4zOFx6Bx8f2j55p7xSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765690; c=relaxed/simple;
	bh=dY8o3as2iQJN+mObStOkjYzs9hh/2MJxHMifAgxTgjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sFljD8ytT3Jq2XCoKASuA9vDSgbx7G9PQZv6pgmDnpBS6Kdn+erfcbz4hb0Kpe2DvFa9RQb5WF9z5vZCgJksDWSw4RD6ALxHUsgpbBGm4A+fali2nJaCKjzzrfFJEU03kuSGFC25qF+J0wQMzEd8Mo74E9Y5F2QuHTOwl4A1OSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qIASH4L5; arc=fail smtp.client-ip=40.93.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qIASH4L5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=js2q88fEK+Z+iJTovqHbKSlYuSN+zp5kOxFN02boXKyfeJ0vU+G7bxwH/cXiqt8w3lj0K4nq8ox4hKCPl6knKV6GosXbunDg9d74cc9b5Rlu4NIKOHJ8+A/6RQdxn5Qe7ktkbZeNUyyAbORjEO/FgSx/q45R3Hj/9npiyA8j0Oahct8nSjdTNnnSNKvs9t54cIwBcyaGdUlC/c7GNlSbKhjw5y1LfDTtMx7cTQchMt68aH7eCtsFoQWONkt1N0seu1LzkISea1kNAEOqN4ZESR9TEmfxJRNkAuiA1mtiaNZzHd4rBW9QlElNhVj3Gd2Zl0R+2EyLR/Hb20DQjCJr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiAY0RvshW/eJyupEgZTrYcisCtAqISHboXEMdhANIY=;
 b=PbHx+X0vQ7cfIMlLovFhbLZLrUA+F/ExkVIQXS7dclALJ8Uvwf1WOyap4nrdhuytncAImE1mOanZnNOd3TiXEA8A1NKpe75okX6rnHJCCCl8Xm6QHBD6A8UTCMiwxoB5OgSRlZNQC6YKpkrpyTxBC/5vkm/TgDuZmwnAwKMjqAV55q3XMC4wYEMbB5L3MLC9khN47WYIgc1Qvu3Zz+9ednKWZ6/LtT088Pce5aOWawRp8JF5Spni8m80UKsnmRdVR5K6tv1/4lHLJk6FDcEcpjAr38Ll7xjiUOtA4SmHti20k4DA2S3mXnSJ3PJisyfTIcnsnlh9wD4lCJgRpVPo/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=kaitmazov.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiAY0RvshW/eJyupEgZTrYcisCtAqISHboXEMdhANIY=;
 b=qIASH4L5Eie8xxQNmEnIcoYXk57xiRAnYkqYzKTlVA2uMIOvHCLOW0ZjC4R8Ea+C3sbQTWYeOBII2bAWPzeIEFIp18hMUNUGplXDS+mqvHoKyMVVeu42fM/cuit+IQK6LNCUh9oESq9qHxnSkTnhKg6MIZL/syQJZiL8llwaPXI=
Received: from CH2PR20CA0018.namprd20.prod.outlook.com (2603:10b6:610:58::28)
 by DS0PR12MB8563.namprd12.prod.outlook.com (2603:10b6:8:165::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 17:34:22 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:610:58:cafe::19) by CH2PR20CA0018.outlook.office365.com
 (2603:10b6:610:58::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 17:34:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 17:34:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 12:34:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 12:34:21 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 12:34:20 -0500
Message-ID: <b7e8caf7-18de-fcbb-ee42-1b49b67b5eef@amd.com>
Date: Wed, 26 Aug 2026 10:34:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: make the debug BO command wait
 interruptible
Content-Language: en-US
To: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>, Min Ma <mamin506@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260826150726.126296-1-taimuraz@kaitmazov.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260826150726.126296-1-taimuraz@kaitmazov.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|DS0PR12MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9595b1-0bfe-457a-ef4d-08df039843c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	dZ4N/SwsRvTk3bdmtBtlyOgSS0h/lyT6lUcU+NTSYjGbx28wRfRhuZZwCaY/6XN13QuHIS8jS6ufsE/RDxSEdRdYMhf7/nUA9MltRb0Ggbx5TXeRSMsHENI2H2RQMSLAh/LW7+BDBicAD5JmvrlOUYBHuK/hH6Taa/bb4j+jfpnetBOddd6eEQpGn1n7Oefb28pb1Hi5BGxn3J5h3ws/PNela2d3kyWcpzBkbgo7ZvZ91xxC6lN39AZdtfgm2njBQX1G94WyWP2ohJt8SpJDAEyVwEumzvQW5e3oPfnessxn1UkuJYpHpzZrOMnRI+EnztRtM4jXl9qt9RocoXNWqCIvjH8TsE9mePHagcU1nr7ylQRf6miqFl7RnpZS/1sryqYzGA4UNrq+55hRvR7pzlkSkZ75WxRsS2jGaKKhnJDPoXidLiMGjlcvpaOsXIGeifB5VC2NdnCIggEljqiYu6dw2uvqFT/5HqiNrDI2FdNwxJNRSBABOcJtdu2r511EZNj35STvhW320pb+JLGS9Vc8eSlNG/n7RUAKjd08y2gaAp4xYMKSsgVrExIuft2rLLZkm4er49z5CK2klBhh+kIQadjzDeh6c08zhEEuS+OG1i+SCQcWqwvZZfUey329gzncBEQnzeMkXfFpDaUXJGpYDdcZZv7aqqEsLpLWleW4QlSJc24l89LPXvtaftXHorxiFysDrC6OazwZmDhq6w==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SfxnXddqTpO4R4zNh/KqbRkfDECt08wyU/AS4dgt/5Y7C4wYSFnl3ANYgR7B9sp0OWC5iahvCI99cspS7aY+Zv+tIlI1pJS5Eyo+1wyPQfXN1dGgc3+TdiU3xXYs8mYbW2uh0pnulVU3W/4AHpV8c6gofrKzC9ptpNWpMD5peml2j4EIMs887gcovC7POOEy5zu2Mi/ExZiP4vccIUuWoVTYqjb5OCc6sgKWRxfDMU593CxscSBsnWIbUkZ7huuESPd9L9G4d++S2ahxJgD+fb+a3nPHFhZKky9SlTl3GfeP5XVL9cjIZOcFL83dWLyelOgEI35X3/ia3o6Mh/LcHJnQSNXuauUqdLJHLCbm6PNRDxTAHzqGGNvYeahEu6JIWS8vJZ4jW6qbhx8F8OZKd7KBwM7jKXdFhiRUnPgfwEl4eerpLzy1fhTX5OoB5AH/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 17:34:21.5125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9595b1-0bfe-457a-ef4d-08df039843c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8563

On 8/26/26 08:07, Taimuraz Kaitmazov wrote:
> aie2_cmd_wait() waits with dma_fence_wait_timeout(..., false,
> MAX_SCHEDULE_TIMEOUT): uninterruptible and unbounded. Both callers reach
> it from an ioctl holding xdna->dev_lock, and the only thing that can
> signal the fence when firmware does not answer is
> aie2_sched_job_timedout(), which takes that same lock. A debug BO command
> that never completes therefore blocks the ioctl forever, leaves the task
> unkillable, and stalls every other ioctl on the device behind dev_lock.
>
> Wait interruptibly and propagate the result. This does not remove the
> lock dependency, it makes it survivable.

This is fixed by 
https://lore.kernel.org/all/20260707055732.479103-1-lizhi.hou@amd.com/

could you sync to drm-misc-fixes or the latest upstream kernel?

Thanks,

Lizhi

> Signed-off-by: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 54486960cbf5..1f910ee4941c 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -897,17 +897,20 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
>   	return ret;
>   }
>   
> -static void aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq)
> +static int aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq)
>   {
>   	struct dma_fence *out_fence = aie2_cmd_get_out_fence(hwctx, seq);
> +	long ret;
>   
>   	if (!out_fence) {
>   		XDNA_ERR(hwctx->client->xdna, "Failed to get fence");
> -		return;
> +		return -EINVAL;
>   	}
>   
> -	dma_fence_wait_timeout(out_fence, false, MAX_SCHEDULE_TIMEOUT);
> +	ret = dma_fence_wait_timeout(out_fence, true, MAX_SCHEDULE_TIMEOUT);
>   	dma_fence_put(out_fence);
> +
> +	return ret < 0 ? ret : 0;
>   }
>   
>   static int aie2_hwctx_cfg_debug_bo(struct amdxdna_hwctx *hwctx, u32 bo_hdl,
> @@ -954,7 +957,10 @@ static int aie2_hwctx_cfg_debug_bo(struct amdxdna_hwctx *hwctx, u32 bo_hdl,
>   		goto put_cmd;
>   	}
>   
> -	aie2_cmd_wait(hwctx, seq);
> +	ret = aie2_cmd_wait(hwctx, seq);
> +	if (ret)
> +		goto put_cmd;
> +
>   	if (cmd->result) {
>   		XDNA_ERR(xdna, "Response failure 0x%x", cmd->result);
>   		ret = -EINVAL;
> @@ -1014,7 +1020,10 @@ int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl)
>   		goto put_cmd;
>   	}
>   
> -	aie2_cmd_wait(hwctx, seq);
> +	ret = aie2_cmd_wait(hwctx, seq);
> +	if (ret)
> +		goto put_cmd;
> +
>   	if (cmd->result) {
>   		XDNA_ERR(xdna, "Response failure 0x%x", cmd->result);
>   		ret = -EINVAL;
