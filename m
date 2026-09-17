Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA04ED1BC;
	Thu, 17 Sep 2026 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660570; cv=fail; b=l14iRuxk4bJYXKwuyjwTxInyRX12NRvd+SCkGRYQaFWSypnJYeqGpav6BFutOp5m+/VPlLR6AIK8xy+8cQ1+kKbmHHuJu8xTOOzbzGGzY5qnN8iEtzhH8lZrx8Wpb0g8fwJ4ljxCAVk9/QU9WTcOc7h6sBK3nf4TR+smeohHnbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660570; c=relaxed/simple;
	bh=t4aYBq53rO5ilUmiDAnN55w1q+tQEn9H4wX8IownKfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O3jStkHgqrDBcem+nhoP5dc/em37X9rchBRqEVoZf4XcAb3OdHXekkmbfyo9lMQUi3agFiqLWxktocMpdm3DzkTkA4598KaLMUgvNMFnppqZJw0D13UdiFq2P3At8iHGd2cf29oYsc8t5g6J1jw4i52fTTLmJimrqALVC85ZA00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Wp146gob; arc=fail smtp.client-ip=40.93.195.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Wp146gob"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzBkLd9MIrWv1seMPLOWo443kr3hnmL2YLnamWs/+nX9cT/ur94tJnkWJ7M0v/8CS83YeRiCb+bb/NPjDzHufqhgCd4C7NI2cuY/mS0iOTPRsUX2DXNsFXGbFOFkTxnBKhUe50s82NMygOn32zBs/GBdzOKTAiydBC1KlxBGmVxXHsKMsEUvhmW5gp1A9YK3u7ue4gXwVShMoNzFfvcBbat97fbEGm5z2dOqDW8Ysz5bOhHJpUnxajaCOAfa7nHDZQKRMaDSZ1pioakNmuEKSJ+d/oN0MUaAzbit8cfn1wJx8DhAvF8yk5Euri+TrhYloOKMoM5yWw14aJpiykPaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG3wzH2Ax5AIIOmJ3lnlgiqe41RWmocOi1Y3S5HayKY=;
 b=rnhBkjbZ93DXXlNO9hem7e0kNW/LnBe5o2jnyMuGXXBvjCEYo+0oNSrl2QzK3MWxqbvkJP0P9iKpiADWbEwUSNl4Cc+pUCRLHcmiQtERMbOJqwyLy5wqNfQM72XlQFNH20TmUlxF1L0Lja2/o+F374npG9QBC1lCp+F4mVX3b1bbc2G3MIH+JMw0ZKBXlKC1X288LXowOzZZrA7rgSTfeLmCX5coCdnDVzkHRN9aXJxgKQFl5bTqwCnddWbLQG2Lr+tFBUW2rsrVUF36LMcp7fAuEzGzAe4BJOClrXC3IFTp9a3XAK0Tw9+osDOVfL0GGT4CPwO0CbRAvFDXK9BiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kaitmazov.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QG3wzH2Ax5AIIOmJ3lnlgiqe41RWmocOi1Y3S5HayKY=;
 b=Wp146gobHYzLjjin0tgiYGXY/CTO9XJYFrTDFsW704yY+DxZMDzvOsEmVCVxh8p74sXjUmP9ZuKuwsZt15wqVIX/bCeLEAo4c7Tlg9Z4ER00nUHrMbKuHI+1ST+NRfPXIhrFYykHdH7jqDEDGrXRh/RkqR4bPGv11Lkyi4wNJRY=
Received: from BY5PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:1e0::38)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 15:55:55 +0000
Received: from SJ1PEPF000037AC.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::1f) by BY5PR03CA0028.outlook.office365.com
 (2603:10b6:a03:1e0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Thu,
 17 Sep 2026 15:55:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037AC.mail.protection.outlook.com (10.167.244.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 15:55:55 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 10:55:54 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 10:55:53 -0500
Message-ID: <99a26a5a-a42a-f0b1-eaca-041629a7c103@amd.com>
Date: Thu, 17 Sep 2026 08:55:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 3/5] accel/amdxdna: do not warn when a sync request is
 rejected
Content-Language: en-US
To: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>, Min Ma <mamin506@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>
CC: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Alex Deucher <alexdeucher@gmail.com>, Max Zhen
	<max.zhen@amd.com>, Sonal Santan <sonal.santan@amd.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20260819224458.257346-1-taimuraz@kaitmazov.com>
 <20260819224458.257346-4-taimuraz@kaitmazov.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260819224458.257346-4-taimuraz@kaitmazov.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AC:EE_|CH2PR12MB4101:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ed6dec-7b00-41ee-e1de-08df14d4283e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|11063799006|22082099003|18002099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pfha53YZqROxLA2WPITXmDDA3b0FRsGWyvbUaNXqG55mY7n0xyAiMWMEVZFru1S+YTzAYPbOIPH3h6baO/vgTYVmereYYnN5KaHvB2JEDf/5rBP4VHRgUdUf1tBFkMP6gwPWMbeqjKvrWudlblny5mq+yIE9n9TRB5yEfdB442LdHhoRvr+Sc7hkzZMrFK0FJwJe+O/j21NHfmYNEgqjWSxzRqyjuGJRRxrDueWgwlJ2nFxpEutPkAvkSKd3iy38snucG+oKNkuWDaGh1NAJ4ZFF1TX6rZelnnmNvaMIin4M2ppklUMNMKa002rMcLS7/HfKzPxZDx/jddKsZpgTDEmp0tPs5CuqGEQhCam6SV/FR/Xyae7HLs+BxF7aN9thbujhQiw/n/MBs/RY8uF4ayEr4dIvF7JmaRkUz+WBA+Jv9h7JOTBlQfLTWSShT+GoHruim0z650phMhyZrFtpZ/s+cUC2C8hQ0hOQWGn4IdMzv3AY5jc6mdljBdztZK6+yl2aUd5wT3NIM8ceGFQu5GjL03cFvCRxsyxKmx5MlDRTnHs5PMyJCZWsKjGAXWCUk6FCIOrarlM4d2SFVuEUvCv74ZxOCjlI8A0tmiRGuroEIt2ngU02CaOi7nHHHb4vbwXIEc5GBHd76O7Uw9pD1R+UahuB3p6HqhF3o0UutlGV3vo0GOdHLphclNqFacZcCMCmGK85+lPk9GHUAqNa1A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(11063799006)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FeUUNqV+CfGhKFRe9iBbmr8K0gtEF8W/3YAg/SzzOLiK1BR+qPM7TSiXIGfPof2ShcnUt3YjbrvU53blvox9WLcw31HwLtdIokpr/1f6sIjcYfyboe7D7TyibrnKC/vCAIbdBWsoKeQl8I+NPNH6M9w+ZPbU5pkgHsQmxphfgPq0Quc9jYckTKDmyIw3IrwMmQeRPwD/uxpX6BqLiO+MQlZxVbd0cm1e6hAYtcoJ3J3EvDC0H8d4R5MDrElQIgWSDPL4Cn69pxh/RwdCU4Kzn0o7fXFSkkA9Nw1pCKxW3vdEOEQGAqNgCfwpHTX77mqKXI8FjxM7gx5gokK6k9w0BLBfiskHGSOYwQtcuCsrPzC0dKGaF8vHvJnR/H6PQwwLMvMZsm6/szjSXasT/GTKnycpfbx1sSC8OrNc84vJgj1UCKHobLyZvakYp88QefIg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:55:55.0091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ed6dec-7b00-41ee-e1de-08df14d4283e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101


On 8/19/26 15:44, Taimuraz Kaitmazov wrote:
> amdxdna_drm_sync_bo_ioctl() answers a failed amdxdna_flush_bo() with
> drm_WARN(). Both of that function's error returns are decided by the
> ioctl's arguments, so SYNC_BO with an offset past the end of the BO
> splats and taints the kernel from an unprivileged caller.
>
> Log it at debug level, since the same caller can repeat it.
>
> Signed-off-by: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
> ---
>   drivers/accel/amdxdna/amdxdna_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index 77a9493cd7ba..0e0f844526ca 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -1310,7 +1310,7 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
>   		amdxdna_gem_unpin(abo);
>   
>   		if (ret) {
> -			drm_WARN(&xdna->ddev, 1, "Can not get flush memory");
> +			XDNA_DBG(xdna, "Flush BO %d failed, ret %d", args->handle, ret);
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   			goto put_obj;
>   		}
>   	}
