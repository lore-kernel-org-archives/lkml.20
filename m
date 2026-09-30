Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB42F6565;
	Wed, 30 Sep 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779300; cv=fail; b=jfBTAMfCY/CuWSdE43nZkyAl9Cc03QbIzcvK4vfPJFYl4E7xTpqSzWz0nifFJn/VFAEffwQ0Dif6Vl3IiDy3T5iBaWZgZq10tMxI1jYtSJcJkPS6URka26clnMILwT9NlmAa3hl3SHb1fNkEdzwNKf9w+m9NTe8UF/ImLvaqLl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779300; c=relaxed/simple;
	bh=+RCgcOq2bEwm+3EMj3oPM1hhLsSkHoRzsWpSpBk6FAU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrC0EML5+zLCV+n8OBnuD9gUD3g5WHs+fJVjMUY99ir1ofrh6YGjikDQpPVj2igI9XbYWmMXvGcEB74mmfMxL2KaBDy3pDQxa2PPqFsyj8ZfzO9uxNqA2Dtoceab7OOldhDcX/K8McqpHlrTFULMr9UL0xQm8YHaq1GNNNtUZHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CuixQ78O; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=d6FKlyur; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CuixQ78O";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="d6FKlyur"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Idq3333409;
	Wed, 30 Sep 2026 09:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=YbbO3wuIQQLv6dz
	lsrCB3GRruQWU0IG0Dc4t/cfxck0=; b=CuixQ78OPheix7yYl+dUUzvuwvAUQlp
	PXdOrI0IApkTD9wzeULREXqvLeNBuKuVoZbkiucwbU+Xq2SwTfKFOM2/v+vxIObX
	YD51PTLpstYCSoV3gKxIi6FMBiYbQ7zhZNe5ABTc/oN6zCIL1ueXveZAwz/hKZlL
	zedE4rR7qoKwev8bA6j2kokm3On/32Y2PTVHROfop+4RbtKyO7AiX9wMqwhtFbdl
	r3c/51p3VMu6dtii7VLjcQtgyLPQJ/mA92J0UzQ2/tWKGrk2ekMdzefYsYM26Ioo
	qjPmFTWqJ2WXHMP7YLr8w5l5ICVs+faeWdgxdHBjrqJLpqicTE0F2bw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1sckq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 09:41:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZ2iLQzihDjyS7zAlIv5+26L4efgKxiaVY248/zL9bjJDK8U/NaMglimYPmoy94/htUiXdZnGoSm0aV6pgALHrT10PbIJeERnm1y2n/WSk+/Y8ZofDPAuABPJO5EPfUMP8TtBIIxVwD2hQw+fZDQkO0V1ChjK7at3SoB0an478rUqVMatlcasuBotq+VJNpbPjGfBl3Oz3R73b5T2D7BOk2DXnuXy54knj3EGq/eTLcO92gtqJEINg44R6DzICnSUNvJ+ifKybnnrmf7rRxcA5bYwT+kRk4nROuOtky8UdmkDlJycCW/AHCnOBAYpbIug9piI9AUQt4n9qXDH3gDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbbO3wuIQQLv6dzlsrCB3GRruQWU0IG0Dc4t/cfxck0=;
 b=Ye98tU5PwF9eUq7hJkPCALJtI7C1DTFEDwHq+4nlVqjBnDCEJUY6JyJ0Gqhnpg0dhzhjDAOjQ+z93ABJxNfkT902QkVqNARAHM73rn9W67MbQ4FKz4opynSXLOlE3VehNJmM9tF9LecUTeltiSAlnH4DUxvV2FL8gEk5WFnZeDXioIKqgNjz3cIbEHX5oIByjtjD+KJ30QuZDmxJJpMvqGjXtsoRme8RBK63f4fG0x9+CPr1NXOFpA9KKkMZHyhM+tJ+zeCj3LE1v89KRk2ou0g7+DoHnd/+WdbSRebMZPRO8O9uKCwQAJZzEYX2nDjmCVSfWAeR2IxJKILK6Z2mPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbbO3wuIQQLv6dzlsrCB3GRruQWU0IG0Dc4t/cfxck0=;
 b=d6FKlyurCicBLZDltiKg9KUuIXw0zpmLS+kq1jtjlZY9G9j2nSljzaQGFqI6mBak1P9SYEj/zOKp0V4iwKuXgB5ANtMu8hIH0MFqns40I4RwAQZ7myJHftLKkDJWSH+QePwJHPT8g+t6BJuWzwi3Ho9YIS+7kWS6CJ4HCvlPJV8=
Received: from MW4PR04CA0082.namprd04.prod.outlook.com (2603:10b6:303:6b::27)
 by SA2PR10MB4780.namprd10.prod.outlook.com (2603:10b6:806:118::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 14:41:17 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::7) by MW4PR04CA0082.outlook.office365.com
 (2603:10b6:303:6b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 14:41:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:41:15 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:40:25 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:40:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:40:24 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEeOGl3307887;
	Wed, 30 Sep 2026 09:40:24 -0500
Date: Wed, 30 Sep 2026 09:40:24 -0500
From: Bryan Brattlof <bb@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hnagalla@ti.com>, <jm@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am62l: Add alias node
Message-ID: <20260930144024.7g7ttyokolvsc2to@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260928034115.1084840-1-s-adivi@ti.com>
 <20260928034115.1084840-2-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260928034115.1084840-2-s-adivi@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|SA2PR10MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: 688bcea6-a4bd-4fa1-5b8b-08df1f00e183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|18002099003|22082099003|3023799007|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pALiWnrSutx4d0lDb6ZjQE0ryCwMTwjp/hld4dsOM6NbIC6Hl5zFdWc18nsP2asV9noTH4Yj+UbQyspzZlXS+GHqPy9kDhyMaqUhXriD53NQpuu7SbccQCila6BAuJ+ZVjeqFibw2GogOyqOmE2uHj0tpB6kkldpkbSkPftuNYeTQvZi7sR4+sxDhT/SY1a6RIdabZK94Tmpa+o27t3UoWz8/yKiSe2iOXLDsI7uFVS5+XwWFCPOL0jpXyPSvrCnZ8efvMj+qxlFQr5omnauVlCcZzZJtWopGnENJg2xVX7dfheGOz4p4iZvIETShRkH/pwAWW3FeBkJIH/gbakmDqKTq+8MUM8sJw3Zb/WeRa8BDiec1vDL+fy+A2+Ctk9ITuHAiQ7A9MDzjjuOLmWgzeI4TfDNtb1LI9ayBBqjM4YGlFRrY0pTt1CuftFAPG8lTaVUS6pfice8QMm2vkhlszKEeaSltGNuZZaha8/0KeY/KkZ8eGHCon9ujzPwteTUYQkcplKcjbIXOk6brGXpwjyNIxlPOTIP0yr21JA1TPGxHtFtixoUQXVtK+sFrPYPML1ouVQtGLv+Qq//lhoHipKX5NmrvUJZb5jEEoKatxJUaV27JISIM31/Un3rYSIawsxN8TKOZQY+boC6+aliPf4OcYb0009HdsK8X+ea5Dt6ddo+fXA3ETOb5eHNZwGLfocQKOTMc24lXuaJfJ78Yg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(3023799007)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oNGsxrxkQvQ20ggkmYFogge15mkKeQDyK07i7MaCdlefQDmoOTGSl6+GGI3a1Dbb7sivjLxsQwfFau5NFp/FQITBQ4+qwls7FmN64/TYwQ/E69GwB4gNbgMI7oK8hzSak5KxBToHH6Bqc47ByDtfmvSyhdEtLzJZF8zKpNbmfV4MNL63Z11+YJOrl7/mWOAYu2B3+7Jd3swLhN6WMyARO03166L5sEnU+ieI0Ick8sfqk+Ob9U2dY+vx97vo1zrTEvBySLz03Xg/h6MyjPsG/bI2x+qxladiNCvmSpq5vB2cwpE7WeVvveM7tuwpAk1NqLZycJVSzUKKJsk7Vuso/DRL0Fwf4YWgNrswvL2G9KZfcP5ECgPbyY/1vbBmRnI1RJDOi2N0yni8gz3xMsIfgqaGjKSzkdpmBM29v+x1VkhIY1Ml4tzP5hOYhdUMMS/m
X-Exchange-RoutingPolicyChecked:
	2nciB2Eu0Jgq4mGB/YHZn0KclPs6AZvbjmODLuL/NT6kx04frz+R6Vy4S3u2dsMd9vs1yCXdbdk2nSsp56WMywCyoJgsT9JhGL76uIUxovTs5AmqXssStM5PUHYrSKIW87hN6wmUsPoJwtRqgiAdRIRzXOvCzcCrk53OTDndj43AgPrs/F2cL6u1X6elPhJVPioYBjmN785ixDd2d04okYptRHyakvAlfGHL/GZB7uYutd8tjD2AoSEsi8UXcQJ6E8bSrPY+3pO7VW/z4CgvsA2nx1coHwCbLzNRmHturf4luR07JvWFj36/uint7u6eFzKsGL4qFQchH7/qSqXCow==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:41:15.2547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 688bcea6-a4bd-4fa1-5b8b-08df1f00e183
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4780
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX19ZPuP7JXRmm
 YX1DhfhHwq5ICRfO/u/gN+Efcl601RMXMh8KinbaP5fFOex5Zthe7OL++Wf5t/igK0szC79Yy8I
 14+EHEklQxVwEJ4BhaBq0HdQp+Ec3xQ=
X-Proofpoint-ORIG-GUID: lxqOHcuWqEqIPYkdE7HYW59LijDb0CiK
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd1f91 cx=c_pps
 a=Av3Y+FYNlx8hu8JbWhmVwg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=B-FNFmHqKjW--QVp97wA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: lxqOHcuWqEqIPYkdE7HYW59LijDb0CiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfXzHC/vvGpyfDq
 Xvuq7FkwnZj9/DY7D+JbXiJa8KKg9Fzrv/w642BkMdIv5mfO7Q87J3gV5cH/SlBCbbE4iUIiU+T
 srJlQyLXZBzsBH7ODGGPdi9NxuyeN217zhbRcfcCN24AJQxaXtxfXADSCuL1+brG9NmsjKiOGPx
 Q4YZl+LLnfj0S3EJIst+ZXp/0HZwPoI45RvnfWP7WaYheOvi+aQybL7Rnk5STLN8WL6I1FSJN8w
 1hb6MaI5gybKk+BgrNQIUCvgBP3SCzHOlx0LpDc9Lb0v7hUMAD2pCKEAyfl4hFHJDND7IEfy88M
 F85gvneJ7t5Vapr4v3tdXwD7eLmm2CgOK71rxU11NkCLp62zWRCmPenyLCyvZ3a3aJE0Prr4AwO
 SJd1Tqxhm5263fHng/c7XXTg5lo7yBrBzWAuaddisdywIO40eWVyTaRh4qwlvS0swTAAlXVc45Z
 k+SjzwsMOvTK3bQUGPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300058

On September 28, 2026 thus sayeth Sai Sree Kartheek Adivi:
> From: Judith Mendez <jm@ti.com>
> 
> Add alias node for am62l3. This is mainly to link mmc0
> alias to eMMC and mmc1 alias to SD in u-boot.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> index 964387eb51788..f357dc56de1c7 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -21,6 +21,11 @@ / {
>  	compatible = "ti,am62l3-evm", "ti,am62l3";
>  	model = "Texas Instruments AM62L3 Evaluation Module";
>  
> +	aliases {
> +		mmc0 = &sdhci0;
> +		mmc1 = &sdhci1;

Why would we need to alias MMC nodes like this?

~Bryan
