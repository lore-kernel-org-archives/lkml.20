Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC703254BD
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792244211; cv=fail; b=CVQRDXNvvTjbUGIYe1r7Dv3D69k0IVNOpDnVTXdu0ubA8Gqu0qBPgQONrS/7LxdwwQapFKEXH35cHpAkLOkNDPwFAifPismxf3iWsc46f5oCJVmphKnDC+TUrWyKxvbg6OaRQhaEy4QQWY7H9As548hmpzBkzSk6PC0fj/vHxNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792244211; c=relaxed/simple;
	bh=igXR8OYHNEzfGExJnFQS/D4cpto3PalycRiY0ewdrPc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKm7UWvdLdL171kpompFjxbmCz9zUfJikk6CfgK6cOKqYy6kvNz+OuLHxzu43oRoFtqu4wWG4L0EfVrbPPBwmw+I60LxpcznyProxx90a3NhjGlTMTxkoZNNQ3gHh09BxLACHikYQJUMQwM9R5yarYU6159CNcQm2XwEbrDE/Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jb4iGXkG; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=IV5WG4xb; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jb4iGXkG";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="IV5WG4xb"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69HDCkJM3323571;
	Sat, 17 Oct 2026 08:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=Y7loVVcIZzuhdDT
	/3C+PIZwH0lgEkugGqSp/ncUeY3c=; b=jb4iGXkG8qJwrGH7Aefn2/vHigaLGIL
	QsRz2tRUqAf1FNvM7vUFp5Ug8P2KQ688t+iCxwxR5DpnQYJN0qgd8khgLu9c+ygk
	ArqTKfkKQ4IfFtPdV5Zsc5rd1KigVwG9LC6DxRzNjjQ+y7I2m1OIb7aqK1jpbGA1
	gCWqcm6J+gZ8/salNSmggnnayKqDXxuvgrgaLWC/+6E2CaJwR9NRcMsrkDMeoOX4
	sO6aFo1nUur94S8wysA0oWI50CTjq7aa7Nnzpk443Vj13K8lFvkdpzLEK+kyLyMu
	C2IVSIS6uW16HRFbR/A1jxgs7U1JhwBgik2Es8hxPVH8P/s+qE3siTg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011062.outbound.protection.outlook.com [52.101.57.62])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hc81grbmq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 Oct 2026 08:36:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4jvB//0vGf5hyLDlzNeoj5p7k5xhVLqR/HGH4Jn2qWkOgvEf6Y/jg5StWWwUMiu2/cyDHiMQqmKwp2KPWS6iV8S5E5sgDPLBzu9KqaZgoV99moyLlOJq1PA1LQWQo16g7Kxx79Vh9kA7Si6TdWk49CHuzL81sAZl+Ax4PaCuRffoYQWtFceOrZF/QhOniL+xLkuRvCt08A9r9J1Y6aT6XqFfJPh4Gg5sOmQetErhR8eQUbM94uiFXBFSJgx5a2DqGvRMEUW64I5N8YFxSxnh9HHDqGzn3Z+OPO/SIbDGxfEIT35fnOMVGTA+zswbZo2C67anJkpkesnHEG+NgoZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7loVVcIZzuhdDT/3C+PIZwH0lgEkugGqSp/ncUeY3c=;
 b=HL9rj/yHwkrLElClWU86OmXmmZqentudKVys/acrNoTapdMFHeCsSumW2rDN/0y5jWPy0jh/3q9ZXr/Hu/aAnymKQ+PvVVPe/ybEUU+ahEYBGPrg9LGyQ9IsoIzI6sHCYQ2C6PJ2iQxjnfD5vqHg7kY4e3i04cvwYN5mX86l0lHgy6OBz9VnLHU4fyntlqigrgQ4gLrZMPPqzp88t3fhqd111/qra9CpvRn21mZwRVAaWdIPb/HuE+KnQh2mU0sTwA2yZ669/MpXPZ53FKAZAVemHTwVBSwfn7qCgnRZLkFaC4XTmpYwp16/Ub35jTX+ieVQaV56uLVOmaHhsWj14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7loVVcIZzuhdDT/3C+PIZwH0lgEkugGqSp/ncUeY3c=;
 b=IV5WG4xbkXilmGGIbHAm6dXU8BmrLrAC2O/fqJL+spdYRu6qB1/B4elp002a2WZc5shZm4cGG5qK/jmvniqectlGp+LI5XiTFq78vCzrWxExJlNkUcyNGkHv7bQNhRWS4J4JkrDIDnCIi4Jl1iuEP3cXeYjQhaH2B9OCsXHJufQ=
Received: from PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::7)
 by BY5PR10MB4164.namprd10.prod.outlook.com (2603:10b6:a03:210::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.13; Sat, 17 Oct
 2026 13:36:41 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::31) by PH5P222CA0004.outlook.office365.com
 (2603:10b6:510:34b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Sat,
 17 Oct 2026 13:36:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 13:36:40 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 17 Oct
 2026 08:36:25 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 17 Oct
 2026 08:36:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 17 Oct 2026 08:36:25 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69HDaPFY221162;
	Sat, 17 Oct 2026 08:36:25 -0500
Date: Sat, 17 Oct 2026 08:36:25 -0500
From: Kendall Willis <k-willis@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 15/22] firmware: ti_sci: Use pmops fxn pointers in
 suspend/resume hooks
Message-ID: <20261017133625.l2h3i2n6dvbrqy75@uda0506412>
References: <20260929201746.4078803-1-b-padhi@ti.com>
 <20260929201746.4078803-16-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260929201746.4078803-16-b-padhi@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|BY5PR10MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: 357fc2dc-14ff-426c-8282-08df2c53acb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|56012099006|5023799004|261009223027099003|261009221227099003|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qaO5Xq6rUEQizNSbsZ3AziZ7U97p1hQ70ylVCQGYJWomthAciYgiL0N0rIc4URYwxDSF7zhtDVeYbDdgAplZ42FwdSW/djEnQugWkRjg+cG6UrvKSIFy0JEPAocAi6QY23HrS7xjlnl+Lgq3o3CLqWV3NLwpW5zLcfcW6yGhDtRGbpQtrXsmtqJnP3CRqW6BHDigSJMlSmObVmUlWQZH8j5ZVosesKYspeU7XFynN1DeM6dFFylGcVqc8Dwquq5nTpn+BQDNr7U78QhV0l/CH/AaqkQ3TDr7faK56H/8h6JVK5uau8btvb452x3JA+a6wEiJVxHdM0FlfECCfPy5oDcSlyQEP3rQHy44EAqP41hAFM7Iw2xexxDH1gqZ6h0J4+ZR2SuyLJk9Px97ianRJcR9rpJXXXoRybifagbz6/OXYBNixa+aeh4QRyTfpsuGQvkcBq0x4S8suuAo+5nV/Mc/o4vsgHBszU+S3T0wOV35VdDfyg4NuiE9mAQz70+1UZEegTnGWUJbfw0eQNPnMV9PYoZ+gDp/JhdbN+gjfxJ/PSABdZ9hrO81BIScYgCI4bqouOjFiSAn86WfXjy1FwHeaf5+ZTa4W9ea+fTJFCEDeUkbpWjeNYa4wChwBYdh+cR/Zm3c4pG83FoVjhPvMf00fb0KZNFKDj+Q7DBFDAL7vQOD0ded/dvDWoq8imEtwCqpyYXohdu58+WyQIbOjw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(56012099006)(5023799004)(261009223027099003)(261009221227099003)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gcAE2bf+ZxN1o2TU2jmIy3LmN/OOW8NlEzfd0GJlvKKL9+5wVTlthA6QGnykkM0TsUTWyj34xo8XWNEbqWUiCM0nbGnBU0rqQYAQvrzbp8S6M4HuB2C4cDrHI+3GNKh8ZPYUb2ve+9Hy6o6qpdEbjh73C1wjLd+dEvGibIqh4e+aevuQP8o3dR4spluDjh321Ykbla9DQLKALgYu4vV0Octpk9FzXk+m0aRgbZ2/pyHpOjs1CwvDJV0NUKIwJGt5T5v6eDhW4XJoiVmYBlxP7qQJCokIt9nTfU42uBvj9cD98V28ThUDmBmbmY+1NmLZSs4cA7k8Ot4T59PEwrarpMgVU+xF1LMsoGoDEUW+8bufsn11RQXDZVDkY6jLYwiDF5O63sU70yzP3/419SpK0z40HbhLUBOQsefIol6Cx35/ivwpMk0HdDGJ94oExrM3
X-Exchange-RoutingPolicyChecked:
	PDf/i5tPalgfCQpmwpugeEXVyC3OMdc9tKbR3/zjq0Z4OEq+kFIgnmg/UuiPSAGfEh6f/Fhpxg1VCBIxP07Pp7a9drNFYkwW5Ib5mpWhCLMz8LCb554DIbxKnw2DarOuihEilGyxoETVBnD3COyEeQSaNZONJ4aKwo/Y6LbVr/t1avRDQ29mEpdum9rIXw8+A/1i2RwbjQMYlPoBfyz0vEmSFa7TgkrSOfE03umTyBG0ZKpouGwSM4Gl9zlRTVSeJH+fx/B3ovIvtJxMJy0LuXVAAocEYaW/QZ5qn47G9N9QqLfr+d0y3CpV6vmRhX+lrUFY2U/b/snHn7LkiAxLCQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 13:36:40.0015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 357fc2dc-14ff-426c-8282-08df2c53acb4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4164
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA1MyBTYWx0ZWRfX3KT6nk8W3mCA
 33wQyWogyHs4rS6inLbtzVuDrucmkF/xEz/ovOwHWfN2X89HCk4MQacpcjEnOHMIYRyWK3/HV0A
 i5PlbaSBLZ9RyikzVsb+HP8BcruPG/oSg827ZtC+YDS0nz6lisgr9gSLYrZmNQwMM8xAB+M+/1H
 USotVK064IWxczt4rBlsF7o6jTkxNvO4YZ1pTVf1Oy8ZQ/Zf9wpfB907nZvOKRK10XDwr/lvZq2
 mABfRYN4g9hsMBjx7v3efqBRsyDP5/yjBicDxjGcwJaB8iziU5/y2qJVRWKpd0Hta0StMRdNPcb
 1GTEftTlp49wW43+URKIaUmGFGhVSRWLC2VRbIRfFK+WYgSTeunvOBOrfG0XRmGPUxQZkTTb72n
 /sxR/CS2jYQVMj0w9qt0wdmPxG8i/U5LR4p/FkxrAp/ORRWNZ953uONCwIsScuLn13k2ToF0ig2
 LEDSZA1t2HlouuSgDMw==
X-Proofpoint-ORIG-GUID: 3DrRS7O7i-Z8KCrY0G4y4TOXwAzZ82rY
X-Proofpoint-GUID: 3DrRS7O7i-Z8KCrY0G4y4TOXwAzZ82rY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA1MyBTYWx0ZWRfX99K14DDcpVjA
 XpGPQKcrZoVuPQNukfiElXPfaQaTsE/f4HWKGCeyfp6ANxNh9sphUh6y8pPPBxAXJqrq7hJw02F
 8UV8FUazIPSw0b8gjYaFA2nUif/4UcY=
X-Authority-Analysis: v=2.4 cv=Up/2pOwB c=1 sm=1 tr=0 ts=6ad379ec cx=c_pps
 a=YV/sJQ11QjtKmCmeYosiFQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=maJC2wlQRvkhB2iUsZQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170053

On 01:47-20260930, Beleswar Padhi wrote:
> The suspend/resume hooks invoke ti_sci_cmd_set_latency_constraint() and
> ti_sci_msg_cmd_lpm_wake_reason() functions directly. These functions are
> already exposed via pmops function pointers and pmops is available by
> the time suspend/resume hooks are executed. Therefore, switch to using
> the pmops function pointers instead of directly invoking the functions.
> This also helps in a cleanup later.
> 
> Since commit 60357991f6b9 ("firmware: ti_sci: Introduce Power Management
> Ops"), pmops->lpm_wake_reason is only populated when the firmware
> reports MSG_FLAG_CAPS_LPM_DM_MANAGED, but the resume hook bypassed that
> by calling ti_sci_msg_cmd_lpm_wake_reason() unconditionally. Guard the
> call with the same fw_caps check which should be the correct behaviour.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

LGTM,

Reviewed-by: Kendall Willis <k-willis@ti.com>

>  drivers/firmware/ti_sci.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index d22686f9346ea..5d3151571ac33 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3154,6 +3154,7 @@ static int ti_sci_suspend(struct device *dev)
>  {
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>  	struct device *cpu_dev, *cpu_dev_max = NULL;
> +	struct ti_sci_pm_ops *pmops = &info->handle.ops.pm_ops;
>  	s32 val, cpu_lat = 0;
>  	u16 cpu_lat_ms;
>  	int i, ret;
> @@ -3175,9 +3176,9 @@ static int ti_sci_suspend(struct device *dev)
>  			cpu_lat_ms = cpu_lat / USEC_PER_MSEC;
>  			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u ms\n", __func__,
>  				cpu_lat_ms);
> -			ret = ti_sci_cmd_set_latency_constraint(&info->handle,
> -								cpu_lat_ms,
> -								TISCI_MSG_CONSTRAINT_SET);
> +			ret = pmops->set_latency_constraint(&info->handle,
> +							    cpu_lat_ms,
> +							    TISCI_MSG_CONSTRAINT_SET);
>  			if (ret)
>  				return ret;
>  		}
> @@ -3209,6 +3210,7 @@ static int ti_sci_resume_noirq(struct device *dev)
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>  	struct ti_sci_msg_req_manage_irq *irq_desc;
>  	struct ti_sci_irq *irq;
> +	struct ti_sci_pm_ops *pmops = &info->handle.ops.pm_ops;
>  	struct hlist_node *tmp_node;
>  	int ret = 0, err = 0, i;
>  	u32 source;
> @@ -3262,11 +3264,14 @@ static int ti_sci_resume_noirq(struct device *dev)
>  		break;
>  	}
>  
> -	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
> -	/* Do not fail to resume on error as the wake reason is not critical */
> -	if (!ret)
> -		dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
> -			 source, pin, mode);
> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
> +		ret = pmops->lpm_wake_reason(&info->handle, &source, &time, &pin,
> +					     &mode);
> +		/* Do not fail to resume on error as the wake reason is not critical */
> +		if (!ret)
> +			dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
> +				 source, pin, mode);
> +	}
>  
>  	return err;
>  }
> -- 
> 2.34.1
> 
> 
