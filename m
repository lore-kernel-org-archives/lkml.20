Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBDC52845C;
	Wed, 23 Sep 2026 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170942; cv=fail; b=sRrV66Z8K1dOqesoNa62NMBWKniFfq82XJNajLLmBujQQo1GDBTCGcrn+wtNSQ+B/NGKpLVwBLnij4fiaTFDQElx0V+4Nuet60aFshq73CaT0UV6xypBn2MOmS+SDbWV2S9vd31l7hSpoOGKJgJF2tfdg78TnEEqMXcdKNnU+98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170942; c=relaxed/simple;
	bh=hMXj05qUgN+ZqWbNm+V1XM3PWt+o/m188+eJDDvWMcs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqXwKbQyXK/uQOYgBTLFusqHGLF1SMGmKdvqFCSn+G8sCq762TH1PuwEREIpcinb1qxWIQpOSUQdEx0oDy0CaR0MZ18DsKB9NpSjc8VLBIBMy51jU3rMsYYI0FYlbtB75D6PmATmy8PEi0R8hVly5vCuux2wF4wsJbCIDXGpb3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=hEWZ0OMz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DIBMZV2Q; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="hEWZ0OMz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DIBMZV2Q"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68NDKlvZ1611704;
	Wed, 23 Sep 2026 08:42:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=s9BUONjto3QsKXt
	GkCoFOk1Pv3+nKZ7/Ij9YSjC0xLo=; b=hEWZ0OMzLWgHDM/8eBgcfgRYY3wDNWF
	/RRnkl1SyONTQmTB9N/1ItprIIg4qI5v7WvPPp06bMiMvrE+lzVnBDR4c/dnCL7s
	u+I+VbXbllKFrEposn7D8b7DLLMo3MORy0qepWwBbOXZRXxSLWC/jFpHXCcu0iqM
	1+fhaI7d7hiS5Y+4MGzyYZGUS7jjIPScSxY3KxYmZ0HZ/yP8h1vCC1pILekCThZy
	eUdcq/eDEF9WLZx5Ka3qupVvHznv1V5d1n697XzV89r+vmgawNwU2FPehcFmuNC8
	RthndJlx3vNq54XYCrWhz3H7lP+ntX4OZlI+hHIX7+aqHgUyqCwGkdg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77st49-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:42:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGpb8y1/ie6eohKnm6jJMoZyCnpX1JlX6+AHF/ugrGaEhtByc99Yk8A6NGEaD0UYq93odEW97/9RjCCzI+hUvMG+FtyWpUmOa/uXWarnzvW+kJ0IDfKdjlT6HE/HicrGXXlLWTS6VtywqnN8GrTh837qXiB2wiUCUn98904mNsg3uWRXAbfDJfhO0q/iGeqXP8iImEPOXJSRekbZhcXXkbm6+ebDr9yHdurhCAJiMspVhPt/uV7MzpftRbD3LifKI4HL1OmZmd+cdS99RjW6x6L/HU1LTx9Rutr/nhFzFKPY9SpoJddOQISlMgRcQ27LZLhMQ+DZk9gP20bMw+917Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9BUONjto3QsKXtGkCoFOk1Pv3+nKZ7/Ij9YSjC0xLo=;
 b=VAOYMzIEXTYm9m69sjpf2H1DT6ZgeETs9etYLaboUIhZNpfXdz5UZUQNGfmdG4OIfobiZBYZyxW/LgxuuajxvkmNGCAhTLK1IuPjzeR0nxB5axqJOzgw9GaY4g+AnvTU13fDDWgV0bRjPqW+Nrgi91rwldfVKZ4nO7M1jlWbBrA6zWQBTkJfSuTuMMxFlSEdltsuMJmsl29MXvxHrMbEbmTK/6dVWotFk4QQULys4MTFS6aig/zKg5HC2zL6jNzK7zxPl1Y+DdJYSEvAHTbCstU8jOUC0qMJ7YQlXfvmOUlr5VVowZ3ZhsJYtVsERRqK/y4f7/L6PX+v8N576Pk17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9BUONjto3QsKXtGkCoFOk1Pv3+nKZ7/Ij9YSjC0xLo=;
 b=DIBMZV2QRSEMU5qoqQC87FdE6vePweH0+8DVfjMn5OrAmaLH8N+N2zBWgAUw26ccbJdRbH3jrbUiNO+hVxDIwI4VYbxq0OirMLnBpKv5nKNhmGt4PUnoiwP/gWFXFPSih+m9LzSKDW3CW9500aViwn+2+RWpF/NcPzgyXXk+9xA=
Received: from MW4P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::20)
 by DM3PR10MB7911.namprd10.prod.outlook.com (2603:10b6:0:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 13:42:06 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::2b) by MW4P221CA0015.outlook.office365.com
 (2603:10b6:303:8b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 13:42:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 13:42:04 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 08:41:08 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 08:41:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 08:41:08 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NDf8Ti2127827;
	Wed, 23 Sep 2026 08:41:08 -0500
Date: Wed, 23 Sep 2026 08:41:08 -0500
From: Nishanth Menon <nm@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        "H.
 Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the ti tree
Message-ID: <20260923134108.uu3hrqznlvfuyexu@recollect>
References: <arPVObYK7l38CvdP@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <arPVObYK7l38CvdP@sirena.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|DM3PR10MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 198f1bb8-706f-4ff8-e446-08df1978745d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	U6In4lLFseN3+hiyRqYobSFgamjIFLtEuShl9h0MS47VqrunFVHguaLoeAJeQ2SlX5bAvOMGlti1lTblY1fb3p91alMC043Sk5FfXK32HjXTgZdyYhWCe3c/YX9YTt4mNB6egknprvGfds6YqA5gC2nkV6ic1up/nNRYRqIIXx7G9JlIwn5Q1Ky/h+WvpbNS/ZAG/nm3NQnp6ZTc2c5u9P91kO+jFtz4EFmKA2r79d1/sTDvSCdKlxziVU90Nd97r0VtpJhvDR7U090RwXDrXkCEzba5YAbWJs+h9IzW3V4ulXUTSyatlSUz6gRFDDJUu/CGNpQlDvLGRYljyBFxMjIyhP2G7fOSgXRTmSoXF/SpCpOJ1VjhRxCHcmID+u8fXUcnRqORzjvgA1jVevB8Gwx/GTdib8JkFvPugzjtFh7q03L/UnlgfJs5Yku9XuqBdEDtgaL9S+91hwg2pCpUXSj7khfKsD5mPjmQWfjRbbBMYN9Y3CsGDiR4CribrmICpMHlxkBVUJfWMkWTqjp2yQu7WI7bbOPw5aaj/8k5VquqLD64TDPsat7gvvAif+/GCcbg1BBPLVjvDGneDQrhmtmjnGCVtJBi6EF+torQJ1wM29hM+TxioEUbQhXrCrp3On5uymPnR6xKSQIS2TbukuvtAojY9O/Z5fAR1brCarq7KcSastHT3hAHoVIMkK/7mioSOp3QeHvyoQeq7TYcQA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6BAyDMBs3S8/KwN9cqsouNJZ8GAQ32ww8xwcCHEzKSwRxfxWmhawm43jBV9qY2uRTzDfE5pB2aeB/vh1I2MCv58fxM9166fPbbWDl4gsKP9pL7XyzzqX/28ToAcBIvKoJXPhqTUoY5NcyzmQounkXWVpKID/AHKKxMa1MxXD1nz7ne6GFIRPJDr8urNbstbOw2KkORF3fURg8lr80UxzBK2aprbR9d6g7qfIO9C2wlaeQdZ4Rfqp9LkEWDFqj+FjCsdLCkyW+fCoN+RMW8lna/wGopUQ37nkcGpfD49xb6iXvxBuMVC7VPxoaVBq7T8QnW1LyR+7MgknOxVLrQvQA5AOw8Q72TNxE/eR3U3RTLyh6GFNldiQhjyau3MU42nqCW48RlOeCLv6/XH8IqtAAfsnEqe1F6zAYWMRv3sTwdeBcQwV3wcAXxWJQL7+BwDV
X-Exchange-RoutingPolicyChecked:
	qC88LV5Kix1EhiLKBQnQUIEr5xliGLboDlAu1Uo/St27Q+vZzrxKfdYl5VgGIc5Nnd1qqdJqSRJO5qm2heXB5o3xTM5Iw2hpLMdcVJiKNrOpPWmpNH75kctuoKFN4QVI7DhQCFmV/TOND5Ma6k2ZRPk6l81l07Pup7p1kCw/s6LPHEb9jRfRd0PeiAA3t6Aa8sBQ/1NA61YW6Z/N0j3F0CQiODcZdDQ7k/OOcRoEtxJ4zTvqN3zWdPmEDSztjDygDMP4/AZCZc5vsssyhlNemaDcA/ugVSQPFII76z3X5gcpIvMchs08mMGOBJTQiPJo6s33Q5/6FyQq8tnD30DLBA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 13:42:04.7701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 198f1bb8-706f-4ff8-e446-08df1978745d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7911
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfXzBi8MF1BJTAQ
 YjW68h9VVacjX5eiJvI42qZYS4j1wa8UIHimcINRwC9BDVA/6plWHPz/DYyYUfukb8Ei9eeEffa
 eSxllJZB7SbHSNFHJjIfmSE30uWs99QUaDZ/sgHgo8MNUhu9/+yzK2VwWnSAlvRSsSK6xaUZbzV
 F1LJJEExplGLn3E8L8tuixsP/p8HI/ffHDsV+Cm9SNjZhw3HAWFpXSl2q0vDNkSv2w0eRurRlKH
 UXqFyaviFBIL6F9z7WXriy7MJwuInrbNYHuftfNbbxFCTs44RyImxWSWVT5krczeFNURAmNdLmF
 MzZkvbI9jyM9TxIG+Z2CYZbDL2QS/bClP5zBcZ5ZyHm/paWCJl29Q5tR0wQbNPoJlOrgBkzqcXQ
 ou0zM1h1VBS02jewjPsUQQPZh1tE2Hs/fcmG5bqSXRd3g+7nbcaNABOnqniy5wsasFSvYs3jhed
 Tl9XVww/9uibwCjKHWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX7hRxwIjQLJ9r
 Qmb3k73Uam81IOzA582czO/49f+FqdzSrVCF/EYVJlX97t6xKhuEKy/MaqFzEgoC4pp48mjBlpK
 KIbtUYEIMjBi5lwo+PZlCRZRGB4dsek=
X-Proofpoint-GUID: PYplpMshu8S624CekL-dMf-P_sjdu8Jr
X-Proofpoint-ORIG-GUID: PYplpMshu8S624CekL-dMf-P_sjdu8Jr
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab3d731 cx=c_pps
 a=os0lWWs/UWv4pnmIIs5naA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Afzco79QGDkjn3Az:21 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=BgX4tdDlTDV7mCOSmXIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054

On 15:33-20260923, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/arm64/configs/defconfig
> 
> between commit:
> 
>   e557da9b756db ("arm64: configs: defconfig: Convert TISCI to modules")
> 
> from the ti tree and commit:
> 
>   bd94bea7165be ("arm64: defconfig: Drop redundant Qualcomm irqchip entries")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Yep, thanks for handling this, i had expected this conflict and will let
the SoC maintainers know when I send the PR.

> 
> diff --cc arch/arm64/configs/defconfig
> index c41e5d5dbc81a,978e00891dca8..0000000000000
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@@ -1753,10 -1743,8 +1753,8 @@@ CONFIG_PWM_VISCONTI=
>   CONFIG_PWM_XILINX=m
>   CONFIG_SL28CPLD_INTC=y
>   CONFIG_XILINX_INTC=y
> - CONFIG_QCOM_PDC=y
> - CONFIG_QCOM_MPM=y
>  -CONFIG_TI_SCI_INTR_IRQCHIP=y
>  -CONFIG_TI_SCI_INTA_IRQCHIP=y
>  +CONFIG_TI_SCI_INTR_IRQCHIP=m
>  +CONFIG_TI_SCI_INTA_IRQCHIP=m
>   CONFIG_RESET_GPIO=m
>   CONFIG_RESET_IMX7=y
>   CONFIG_RESET_QCOM_AOSS=y



-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
