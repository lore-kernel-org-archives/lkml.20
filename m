Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D70E4F3931;
	Mon, 21 Sep 2026 18:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790013947; cv=fail; b=kmei7Mb76UXBlr9EqHgqAkcWmdsU//FEGNE2g+HZqYA3Eolu2ordsKtDGjR4UHfooYDsQJ4EvA/ruNRzk/stqbzRkbB4rxi+kXZwZeEh0k9HgsJ4gcNMlnVvtKsvp/W9V061Ekoraqyjeuam70VFtdaACRvFiHR3IgP5f0gEOQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790013947; c=relaxed/simple;
	bh=K4hOEkRBDhmykNMrpDLrMju6Q58VDTKYWzb9j3XjN+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gUDimGwa/7SJd3+wGtfglC48rWiPXciqvrIVzrMFVFNaWdpJ3VIibXhESjmR28dMumSZv8TL2DYnQqEIiSg+xdj+W0H83rCsVFYkxbXSGR3MfGOS6zsb1Nw3I9f0+R7AETcikkE1FYnvZ6Jeehz23UmgConiU3bhPB9L0ymxmjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ZR2YoBPF; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=n1v8SjiH; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ZR2YoBPF";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n1v8SjiH"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68LHrZka1479777;
	Mon, 21 Sep 2026 13:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AKF68a1HkS8VVHAyZvUVG+3EZ+K5enxxsyCHFEr3K
	D4=; b=ZR2YoBPFbNSZiJ0U6wyaowxVfZUD51jQDqPdPFm4Qe5u7p6x6wcRFKfRt
	R6D1Z6bWSmFrPwDGcatlj7roenuAK1MHfT1yfrQ5/X1QCvR4e848KWbkMwsGT/55
	Y/SSVbSS1w/1IIjuj3GRxC9dGvEeoHPfjWdWwMv+557ahh/NVQesmw6lmArtoj8p
	djCOOqdMMvrbLNiYTtf5Gfnnzf2iiuRVOdksKpLW/z2clpfneBlyOB8iokKh4mdB
	9LiKOFBNwZ/Dxc6lUUn0QtLIK6CkQbal4H3W0biQQM+GaIAwVxwvqKIsRfVX6BZp
	89TJ8cq4WwKVzS2U+ktAbaa0Jsysw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gu9cq02fy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 13:05:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MudFfToP8WPawh52zfBaq9+0XsBZmnbXCEavBtCp528+DMlaTtCLcOFJTkPjmGMKKWqEnN6scn9wrlDqw/kLzgctHe+8i3P8fsd+OSIS7avsiewo29Wm7VPRdmTHqx0hpl+gB+4S1ifMQ02kyATumw1b45HOdgIji0KhRtLqDWRVHgq8pxBkmwNryLkIfmHLNyjwBxeq3niNmJxzwkNWqFvOLJs5qhWKEYVGd/4sAfeAnyHfKpJhcO50Rk10fYhuxI9tPjEFgWKlO2i1Qs3EwXuDkogYaWc0jtPJIB0FN0b4UpNJgrqBp07Lx+/eZZVpuZ8Yrq2p3DVWl8dU6AHMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKF68a1HkS8VVHAyZvUVG+3EZ+K5enxxsyCHFEr3KD4=;
 b=yr5xwxwiE8ZdQ5s1ZdhCpNtMNVWZEd4/QjashYbzgV8IVO+DEbAvRSSRiKzLgx78XEouifABNAfeJl2Bh9QZOdUjpfezURJy9JyOmftNxEZa5Xa1kqpQz01FBEusiIwpxDLxVYjcox0VFmhIbUL6g+e7AhTzvSNaf7Z+tzPQlz/ooG1F7H1/iKnNMHlWqTFJvy8INO0SvpJ4DjagqRtgNh2wxb7Kd2ctCevYMowAQaTKG1LbJWE34Q1Nr1t01TR0xFdLYz3h2ND585/l04IUklV3o2kc1/JvykFn0Hmo+Pt3mWeKCDa4x0C5RieZiTXoe62jeSsxNDI58Dh9dzHHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKF68a1HkS8VVHAyZvUVG+3EZ+K5enxxsyCHFEr3KD4=;
 b=n1v8SjiH1vbYgwOHRGyM4NBpR2WSOiv2sVWD6EN83O/06b+uL0vyroy7K0T0cgToSQFuMyMWzuzg2dQOwQZogvFF3s7oGnTUFGMVCBVIvr3QHRDopvWM2L8jZKxoT+win1Saw1q+13KxUxRhWwwyPa9Vxzjj0iEyygEiqBRan94=
Received: from YT4PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:fe::16)
 by IA3PR10MB8275.namprd10.prod.outlook.com (2603:10b6:208:577::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Mon, 21 Sep
 2026 18:05:33 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:b01:fe:cafe::2b) by YT4PR01CA0034.outlook.office365.com
 (2603:10b6:b01:fe::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 18:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 18:05:32 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:04:52 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:04:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 13:04:52 -0500
Received: from [10.249.36.64] ([10.249.36.64])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LI4pis3463236;
	Mon, 21 Sep 2026 13:04:52 -0500
Message-ID: <ee744a6c-1ecf-4b37-97de-f25d7cb4c769@ti.com>
Date: Mon, 21 Sep 2026 13:04:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Assign SRAM to VPU nodes
To: Nishanth Menon <nm@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <afd@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
 <20260810205206.685971-5-b-brnich@ti.com>
 <b5dc14b2-9b8b-4da5-b48c-274bdf6581a3@ti.com>
 <01ff0252-1580-4934-af34-6ef70d874f10@ti.com>
 <20260921172746.jge67yswqjeolwz3@impulse>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20260921172746.jge67yswqjeolwz3@impulse>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|IA3PR10MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ad9aa2-90f3-4664-e893-08df180aedd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pM1/ezJ1/YhAUSc73ZyPE+sNeWYThBj31UoTXJTbiIlP6TA6b61L752siYGoGTZCuDepSCZn+lQ1U+Sk8NX5/Dhx5ak5YPoMqB7s5rCnf6+qLBilhaxyPzPOU7NhtLVIpOKH9MKDWyxb41XHUzXQgyUTJ14SUlt2BBqyAIuXx+hlX7/3qy0+bXsT1yu/MHxnKdS2Fy9BzFj07CnGCjPP21OOzRbqUhx6jgoQH+l6O6Xy2q+2r5cQEIytiWEYgM1XxQjJC4DY4F2q6yPheNgIVVigFWi4IbFX8LScB9gBIZCk+jmXUBli5flPmRH3cmG/E+4j43s+k19OKTwKpGM10OResnS4ANRAafHpTJXPdzPH7x69nx6SFELkmdv8PXYaK5OXo2lRl1CxC5oCSRjkaxnxpMMGMrHh2vy+bdyHHQPJsdGfmOuHI/DJKle3ggvkFGzSZ4DTJkWYufZtH38NtDmiNMftvO88tbYkM3z0epIX3pasIt6YEnBblJFqUJy3s+8V9C7PNi78KlJpqftAlPfjySswIcwjJUqWNACghdf1TUgVE5aNZBpLQ+bDpYFXB5hoVagv+ra5F7rNnntvuKWCG+FUglZI9lqrlOrS1zA648DqgIP1DgUjAOuvRvtDhaai3LE+q7b0q8GgrrmVJdpLePQxHAdtOiqyjNWziDXS3OUBhUVALeAGcKCT7aYZdt1b7a4yKNZZrQEJNSs/pw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JP2X8hOTcGMniWWk1MewegSkEljixzB8IwvFht19lw4bNMqUHd4Q/zK0BcFE14gAn8GOcjkzCOsP8OtdYAlwWfxBnJwnrKuPHqYHosDZIQNL2nshdIWSBmNRi+2JfBqVf5PggSnG+N4vswBTQO4PBnHn+f7TYNvUFFEqolR1ITVNxlIW+SQt98CMN+YdCqi1sls4LrqupujIHd/iaqaY2iSYq3BynaqRbjCtOndYIyPmy2B+fcpfp2vl2YM9QRGpaICNZlaxt5WRk4gyFH42YYcssM3RDbLfpogjOA9XAf7NTldrIj+3ezcivMCyY3/0/s4vEFAguUBbUgdoRAkarIXUbnfGC3ZvTC3T9+HmIbi43vRNH+0l9lhzO72lwhdrfDKovlNRcVR+jdGSCpMYa9qBUXw+42Ci51pjIbj3UP2eXCNU1TSzS2jK76752V0P
X-Exchange-RoutingPolicyChecked:
	v6GKzXjOpv+7ZQ2JV3qpG/VWLT35jys5qcZbpS+N3vqbIwdg4lKXKjP19FjRsU+i2Yvi25bc3WHh4dMEX0w9rha3dLStDLbl5n88xNOPAKTn2OZUwvt9nBbt2BxBcqfAJpTFeFrw6tpAU5/onAE5KBaJArzEMU+eYzVmJCi+avvmZsH13p9F+Uxrq7jOXHoos+0M/3qtIPtTs+aewEvVN/rpcGoIY9C7U12kgKK2IApaVpD8tW1XK+dAROolFm8tVJEUFBfqMxvDNcL51A/eoHwEQv4SOyq6kOBjxeQmVyaXFVKPpF6Tlt+t4Hfa6OkT1+/HZAg64/mIWRowfwuV9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:05:32.7590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ad9aa2-90f3-4664-e893-08df180aedd3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8275
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI2NCBTYWx0ZWRfX73iTG6xC7jwj
 XXAb0QXxZ/jCnvZH/L3e2BMsZLwac+K8RUNmpx1lMsWj8KbzX2M2XqCfZFgMvNoaWeNb1ZG3OBh
 0G5jnDqws7b5o/RFASWRJw/RLJp8f+s=
X-Proofpoint-GUID: 1qlJsPTXIDAzH8D74HRRA8RUeW1S2C2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI2NCBTYWx0ZWRfX8MGqyC7mIoE/
 5ySafmQ8LWjPLK2s05kMtX4rkaHXplktCT3a/czw+zC6UHmBuVTAxMjfOjTpFJBnpCMd/163Vot
 4i2MJGDiZNkwh5+kxYlRo1Xq21J6LcDzxkTg7jDbc9oP7jvdStBr46JFco5LKl8cEccAKxLnJoq
 zjZ3V7JVN7QhVIc+EuKzM4A80We9DiS/c711CGg3CwDd960Bnq9vagRkQ352sXSHGK2+TG9s1GY
 3cS/VyENoTeuKqTJu8T5ga5NJeTINgTwz1fcHSb/GUdKeJPqNOx1SIs0vAULzSeOQDagxhMDLS8
 w/6qO6GunMfB560IHd33OaacCj9ldFNCzEuZIvKEXl01cBrDZr0nWy3i14t34j9ESQ3tJyRqcFG
 +wN2h8ZrpdJs566Xh65J+yi1WBF6LpO6g8FdisfumSgum1YGbSbXdn+u0O/PvDLb9iojmy8rEms
 0hcfZdbZAMRseOPZ0VA==
X-Proofpoint-ORIG-GUID: 1qlJsPTXIDAzH8D74HRRA8RUeW1S2C2I
X-Authority-Analysis: v=2.4 cv=X+PHu2Te c=1 sm=1 tr=0 ts=6ab171f4 cx=c_pps
 a=cN7CqoUBHbDFA2NMQtMNyA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=Wh9QbJz-4ZGQyCDOewEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210264

Hi Nishanth,

On 9/21/26 12:27 PM, Nishanth Menon wrote:
> On 10:31-20260921, Brandon Brnich wrote:
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>>>> index e836f0f42e30d..21ec9f207ff63 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>>>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>>>> @@ -1002,6 +1002,7 @@ vpu0: video-codec@4210000 {
>>>>    		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
>>>>    		clocks = <&k3_clks 241 2>;
>>>>    		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
>>>> +		sram = <&main_navss_sram>;
>>>>    	};
>>>>    	vpu1: video-codec@4220000 {
>>>> @@ -1010,6 +1011,7 @@ vpu1: video-codec@4220000 {
>>>>    		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
>>>>    		clocks = <&k3_clks 242 2>;
>>>>    		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
>>>> +		sram = <&main_navss_sram>;
>>>>    	};
>>>
>>> Hello Brandon,
>>> Could you check, how two instances of hardware can share same sram ?
>>
>> If both instances are used in parallel, then only 1 would get the benefits
>> of b/w savings with this current patch. These VPU instances are in a race to
>> see who gets the pool depending on which instance allocates the first
>> stream. Current Wave5 driver will take the entire 64 KB pool once a stream
>> is opened. The pool is not released until all associated streams with that
>> instance are freed.
>>
>> I will look to see if the driver can be modified at all here. If it can't,
>> then I will find another node of available SRAM that I can hook up to 2nd
>> instance. For now, we can drop this patch and associated patch adding
>> main_navss_sram to J784s4 in this series.
> 
> OK - What do i translate this as? We may need to change SRAM / need
> more SRAM? Since this is a pool, I'd rather have the driver use SRAM
> optimally before pulling in more SoC SRAM - if we really need it, lets
> send an update explaining the usecase where more SRAM was needed.
> 
> Am I correct?

Yes, you are correct.

Driver should use the pool more efficiently so that if both instances 
are pointing at same pool, they could at least do lower resolution 
streams without hogging all 64KB. This would also help in case of other 
IPs using this pool. VPU could take what it needs and allow other IPs to 
still allocate from here.

However, if both instances are doing 4K60 encode and decode, then each 
will need 64KB to get full benefits of b/w savings.

If allocating for max case (which driver plans for) is the path that 
should be taken, then carving out a 2nd 64KB pool and attaching it to 
vpu1 is the correct approach.

Best,
Brandon

