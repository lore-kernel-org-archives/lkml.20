Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2C2363097;
	Mon, 21 Sep 2026 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015770; cv=fail; b=q/yef2iB1tpjITWDeOb4QSRJmYqranmlaFU8GoUyWfxFCWsLqSlNOqfyStP3ii7AJFJk1Ge6tRP1M3qpqpiIyD8xxaiRrtKx/WcpfbWF0YCzWOB5XLw1P3MVsclJbnNZ40UuWfrS5n2S/Ywd5l/vYKa09GXYbFpeEvepkGOP5iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015770; c=relaxed/simple;
	bh=YcYFa3CN64cTwYi7Mc2D4Dz87BHrurmLFO8SOHbz6ys=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=LA120328XmUoEfXP/EXxnZPUJpF00UNbz2vkFI2H+buYB9TY6bHE8rLctEgI7m4DYYvrw0+i0Y4omD4hfmZ0cs6k5R/p0NLZYaFUXZBQThWJaHOIM7NFhly+ZN2watwQoOO6Li8MJFVcNM8y55Vg2lQche/o829uPmwTwt+cf7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cIv2TXbx; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pcZQCVkC; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cIv2TXbx";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pcZQCVkC"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LIUF8j605301;
	Mon, 21 Sep 2026 13:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=J8UGfyCmHkFMOfknoRE3h382qGo3pyATpd/poUOhC
	ew=; b=cIv2TXbxba3ITyq2UN2UO12bBX+bw9UwqbLzH2n4kCk16md31ASg8ihP5
	8wtH676MELVUTe9I7AVASjQMuHYyo+f0X7EzCb5kH1YG0ofxW0uAvmSrwCF6mA1l
	HhQdzeYmbv78hMlo8QO2AD4Jqcx+cFWFPxokQYX+baZzTjsft+zdcmYgfcg209dp
	mPAlVPsG+BlZIo6T2hXrymKWSq7pW+b/yiVALQyqQauiHd5I5SemA+xC58UvLnk1
	dYTLLQWdg5E5GtSpFt+NjsnhqDO3WkaGv8QT5LuZl0prurWQjBGdlfP681iy1PJc
	Xf4XQq9/Uayi3aAQWiMRIucX3nx8w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010044.outbound.protection.outlook.com [40.93.198.44])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gt9s5s1gj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 13:36:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQza6UWYtSK47yrsLpJpUBIpJNBRCJlINXTzH0hAstaNP/IcWId7ZBwMp/uVkVvXdXuxDLR9vw/Q+G1OqVHf4yGQfy+edf/o8xmAwzw9WADNBb3ffJulvCYkG2eOtTvFhHyVjhPz0ncYBWesnteE13Gh4rwXGe0ij26mZ2IQgqNil+0Aq7UZiqwAyUbynON7Y2f39IyYTMwSyKdfm4wkFe1xGM4l2HiBOWilB/qnVc6w4cuZlHVoc/8S/bDb6djXBP2vrNqI626BgspJZ3TmHPWPKsLg+BYsf7AUvUINlfES9BEnltzFbyZcR02NIIF6WhtaBb23wW25bV230mDsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8UGfyCmHkFMOfknoRE3h382qGo3pyATpd/poUOhCew=;
 b=CpGCJCXd94lPyyfCqGU9n2hdqC8569SVekoJL8dx/MFJWKVLDP032pMNLTgBzT4NlTGkS8x2zfVdTrjtrZiKicGqgzyDZVRpSgApjKarFPSBqX0Oobo4ghzQcVYJj+dIDg4Rot/gDTYPglFTvcLipa4h9WfgxH4JHa32bqC3fUkgJP5AQySISXwgD31IZ2hjTcy5Xb0yCXu7roFzr6Wx9kfchnz4A+jYdzv7P8t7X1KgJFOXqzVq1BTBS9YSP9VdKhpOr8SIgg9vuvtkE6A4F3VVyIHw3+88F96pUmJXfnABhrjvua9Z060TEkk/XEwcF4CjBJkgpOGdchRvjUBLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8UGfyCmHkFMOfknoRE3h382qGo3pyATpd/poUOhCew=;
 b=pcZQCVkCIvXbnefGKfv/Vn+bEBzLV93FN5+JuNXlAF4zhtXxp19RQKKTT/2DGW2jZSi1tG/Lg/Ry8usg+NHqQTztZiE9uVodfQRtRXTksj+lk3ecvjpbtZm4CABwQaHkbqdib0fHl13PEpZDh7ycVxO5Q/O+iO3/2dJ/bZpDysk=
Received: from MW4PR04CA0130.namprd04.prod.outlook.com (2603:10b6:303:84::15)
 by LY0PR10MB351249.namprd10.prod.outlook.com (2603:10b6:404:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 18:35:59 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:303:84:cafe::57) by MW4PR04CA0130.outlook.office365.com
 (2603:10b6:303:84::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 18:35:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 18:35:58 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:35:14 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:35:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 13:35:13 -0500
Received: from [10.249.36.64] ([10.249.36.64])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LIZDaW2594407;
	Mon, 21 Sep 2026 13:35:13 -0500
Message-ID: <a760bb88-55af-4f5e-b040-783bf462e869@ti.com>
Date: Mon, 21 Sep 2026 13:35:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Assign SRAM to VPU nodes
From: Brandon Brnich <b-brnich@ti.com>
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
 <ee744a6c-1ecf-4b37-97de-f25d7cb4c769@ti.com>
Content-Language: en-US
In-Reply-To: <ee744a6c-1ecf-4b37-97de-f25d7cb4c769@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|LY0PR10MB351249:EE_
X-MS-Office365-Filtering-Correlation-Id: 175b828e-96ed-4df3-327e-08df180f2dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|22082099003|18002099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	KAnD5+e7n1R72koxpT6nDLYTC7QPHIe4VNwKFaEBL96sf/NZIxO0auYAFUPwpnYhYs1oQR2EtmFoFLh0WsW/TWYz04Vx2eTFhkSUvC9/cLmjuxB8LaLiIeRlLVeFE6jBxUjfO/Vup+e92Beq/n67YLTt1rtO5whqqw5miGgKCzONLwJW0FSvfIBAfWHwvs/FIyKtPUICDFBHg+v95QC4gJvnrvOIhu+BT3RFxi8n8Dqgzc4nwQwOZfYXwbvCvphTYtAvCgX+qC0ySzg1R8x0RBD4hwMf5wqupfo3H0ZHf+bKCxIIpKefB3z9mCzdl+AnVqecug2moX3TNLprTJfeWR/FvDeY/b1pRqgqHVMWuizqtzUuXYe9zwOhAgfFCC5tcnlOmmSQVxVY6AnqFpZuBpZV2NpvXCnPD7XaavNJlQmaWM1/kI/+RL59QgLiu1EypkGpJg7KbQJ6jv1PN858WtKYyO8bibX1ZzuLfvxh060mxcdngH/OkErza46ItmFA4zaAvptj8zsRaeMwgJizk3RlLqf+mzelMXuuKiKfaqMk7fEz8IbukuFOrfkKylxHE/Q+R8lGNfUP9+ozRYEmfKoFiw6f6y8Ki2oVAIRpY10d6uRKuyMDHGTDFRr4ykj7g8Go8745fOVqZBaa8aXJgJJveWvemPa1+1p7Y5DiixtMUwhBCn1VZi5VpYl8EDgWn9BZXYeNVnlr2/0hwrvmig==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BB1BEs3zQ6hsVSjeswLGOvWr/Obq4CYAHGycVUk7+m6VvY/5DYiT5SMlZW8iUfKRrPzXDYM6iTQ40VrnjgGTH+Z3XaCoXWGtwR3Gmc51k4nbIwfhTHSJFHcsbLlwIx5hZkHgPE1r5MkJc02JQ2KAqSx5FwvWH1ox4gKU6D6A3XDw4Bs/H0e0isox+XQsyg+HFQs5exlsjklL1Bx1E46R53duVozk4GDFx7k+UmUk6P2eHBymTNTNs4PjwcKgElGUgcUk2W2lw1oVbPsaQ2NbUSiBxwwoQlzwKaEetE8kCsS0NF2+OR26dneVqYY0J+GiqYt90eDWwCPsHCwg0B6IKfMIbgx2uYyFYQnxf/kBzyI5aatclvkCldS4l4l3AEp4d5Zldm1qkSLDv4t5l+1/QWScCxHtYmUYHSnp0RaId/jYv+s8BzJHCmKlUEqnnpuG
X-Exchange-RoutingPolicyChecked:
	Y/aXQ9jmtX90/FtNUPPd3KHbMAOzQtDWi17Vh4/1smJhZRMfMCCF58EGzsKhhqagIguLjek8z/wqdJ8DNFOiu3vjG+tArNpGfS8AgW/CNn6W1V6YujKgzEYqdfsYG4H/hATg85O54wR392390cr1hDEjf7nSfkLnGB7or+vcSuz6YbBQUvCnTlLxAix1eoegGpoxUoZHc4Z7k3MUGG3HaCKO7VN540ljz+EATV1Xp0rADr0N7ukNF8tmSQ5egg64dg0SMgcZFDNox9VgqPWfE3PT2xXSVIuVCQq1vSnxPCTOk/cFE0FycVVqdemdZbnIRUx+jtPe8D9jzEoRIskKQQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:35:58.1745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 175b828e-96ed-4df3-327e-08df180f2dde
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR10MB351249
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3MiBTYWx0ZWRfX++GrlWcx54hq
 rhO9uu8MDAlE4dK7Ao1N3k5qhJ34D9oLAT6CAATgoVGoBlcr0FjQwNv7VwtqPbCv5qb8bj/l3wK
 wsAmDS9eiE1S/nWCf22tb3GeurwIn86trdBBBt0dJCQICSgyPrvoWyC7vOho8qGUdGY6QsTgKk7
 pPQFVNMZO3gpVG3OxKjTQDEz3fn1k/zgF4Be7CvYbPIRA2HTFXeYNNxvsEwkatLOYt0oL0BBKRj
 n04GH2BicQjP/GWMbCe7C5SzLsC5Gc23s+clqfKsNzCRTlAFF63Yv065U1aEgQh8SiGYZkz8pEp
 Q4T4+IAsFKJVQKCmAutYHrzKfzGOCr1yduMINog1ad/KtMuFgeI6698lLiNIK/LlPk+DHtRtUcb
 VNe7vXaSYhrsvxl2D54o43dQesaypgGfcQz2P/2aezE9OFtWrqYkr//wl4xYGpp7Bl2wOSLwu1v
 M0vk+dT0Ok+E+k7VfLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3MiBTYWx0ZWRfX8w5N1ylQ9Z/J
 e3TDgpTarccEHMJ9sijJqDha6hGMsk5gQ7otipD/i2RPVVwIovRDtlfioZ2c5JTbm+EoAj3S+ac
 JKn8YKrs5Jc6twUwj9iKgDN5jNdrApE=
X-Proofpoint-GUID: _ZD2ZrDr9nzeKp6XXJZWOdUWV57rVxQA
X-Proofpoint-ORIG-GUID: _ZD2ZrDr9nzeKp6XXJZWOdUWV57rVxQA
X-Authority-Analysis: v=2.4 cv=X6rHu2Te c=1 sm=1 tr=0 ts=6ab17912 cx=c_pps
 a=K+v9EGn/BNkpiusdgAbxhA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=99ShNCIWsZELUvd1rC8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210272

On 9/21/26 1:04 PM, Brandon Brnich wrote:
> Hi Nishanth,
> 
> On 9/21/26 12:27 PM, Nishanth Menon wrote:
>> On 10:31-20260921, Brandon Brnich wrote:
>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main- 
>>>>> common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>>>>> index e836f0f42e30d..21ec9f207ff63 100644
>>>>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>>>>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>>>>> @@ -1002,6 +1002,7 @@ vpu0: video-codec@4210000 {
>>>>>            interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
>>>>>            clocks = <&k3_clks 241 2>;
>>>>>            power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
>>>>> +        sram = <&main_navss_sram>;
>>>>>        };
>>>>>        vpu1: video-codec@4220000 {
>>>>> @@ -1010,6 +1011,7 @@ vpu1: video-codec@4220000 {
>>>>>            interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
>>>>>            clocks = <&k3_clks 242 2>;
>>>>>            power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
>>>>> +        sram = <&main_navss_sram>;
>>>>>        };
>>>>
>>>> Hello Brandon,
>>>> Could you check, how two instances of hardware can share same sram ?
>>>
>>> If both instances are used in parallel, then only 1 would get the 
>>> benefits
>>> of b/w savings with this current patch. These VPU instances are in a 
>>> race to
>>> see who gets the pool depending on which instance allocates the first
>>> stream. Current Wave5 driver will take the entire 64 KB pool once a 
>>> stream
>>> is opened. The pool is not released until all associated streams with 
>>> that
>>> instance are freed.
>>>
>>> I will look to see if the driver can be modified at all here. If it 
>>> can't,
>>> then I will find another node of available SRAM that I can hook up to 
>>> 2nd
>>> instance. For now, we can drop this patch and associated patch adding
>>> main_navss_sram to J784s4 in this series.
>>
>> OK - What do i translate this as? We may need to change SRAM / need
>> more SRAM? Since this is a pool, I'd rather have the driver use SRAM
>> optimally before pulling in more SoC SRAM - if we really need it, lets
>> send an update explaining the usecase where more SRAM was needed.
>>
>> Am I correct?
> 
> Yes, you are correct.
> 
> Driver should use the pool more efficiently so that if both instances 
> are pointing at same pool, they could at least do lower resolution 
> streams without hogging all 64KB. This would also help in case of other 
> IPs using this pool. VPU could take what it needs and allow other IPs to 
> still allocate from here.
> 
> However, if both instances are doing 4K60 encode and decode, then each 
> will need 64KB to get full benefits of b/w savings.
> 
> If allocating for max case (which driver plans for) is the path that 
> should be taken, then carving out a 2nd 64KB pool and attaching it to 
> vpu1 is the correct approach.

I am going to send a v3 for now that drops 84s4 patches from the series 
while I find another SRAM node to give to the 2nd instance.

> 
> Best,
> Brandon

