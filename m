Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EFC21CC5A;
	Fri, 18 Sep 2026 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723117; cv=fail; b=jZYuO3d2PU9dy94J3x7s7LaIsEt3dW/rUNQFsm+TLlRW/GHfThAUtGoHp/d0m5T8EAw7laEnkklIccasgZUvCAFjA9UppOew8i+wTCIUkE6COtYvXWYYd9A6OQ3LdU5J5etoAaqRvfKcA003Zja2p1TuX0vQWewe34Cf0GgsuxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723117; c=relaxed/simple;
	bh=QjJHuIRrw7DJv9PllX9gsfRVls/2eEWMB+W6A+JrOQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d+BaPbCd3X7pxDmOfdY5Dyx/BUxngx6tIJd2DUUXIBPbJWb1nTGfwen6DaygmgaGIWmQIIDVuy+v/tZRbS67EDg1vjR7LacpvHP6HASWERcmxVNj7NXlwsUCflWftTqCULHoPBzjgwL60G2TmESZLqRbNkrPwRxAKw9mVAi0h6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EGIbumi1; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Pm+ClUML; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EGIbumi1";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Pm+ClUML"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68I6cw6t885069;
	Fri, 18 Sep 2026 04:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3CqGTmpgqALBqCx/elFkdCi8Pallx7VgjYo5pbWoE
	9I=; b=EGIbumi11/wW926KoEJqqG0XXLTTjlWgxmW9s6hCXPIEYfwOOLmH0pzm4
	Y3sbSyNeNAV+dQdAMlVOOYATu0kGqgl45zkK71Qq6p6cdWB5P1M3PjW/zeU1uKxS
	owh5lRKsJyTPvqTt8Ym/RDbD9C/UXEdKwxdudAQ2BfHbzO3PPJPmMTU4Q7dyUfYA
	O+UJ4kc6AxO29DMitWhpJ6EFsPwKBEYgsdRThGWqqfwGlhneyUfwPWQLM95pCdA+
	S2zrvje0KN/I1t2W3T+AmGk4qrEWqgnNAGGR2YUeFippSiNAPW6v4v1J2Xm8qjK3
	6j/oEjCu9sjAGIEU+eTC4zbkMuQ1A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by m0384305.ppops.net (PPS) with ESMTPS id 4grr9hbu3t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 04:18:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YY6HGVS/2KizY5Sgv9NyKoN26WShWtlwgjff5PwB7xWBp8caa4UTzptDgx9zwNUU/ZyR1bh75bpHPqvsuFC15tSaEWnX1SCoBQbb9U26KsQZFC78kpoofdpqM3H2nSEVirL92gA8k6kTLMbEKS6BazKZ7j4w3TR+s/xXrxSMwy8RTLERrVQkYJro2SZ634/2RRSCYj1raVN5BbOi80KSPL0SMnqqedk/axTS/q6iR9mVQx2r7RZnqvfOJ9WP1REzpgSjHybLtRnAzfX8fTShluNhlNsR1siklQQ0smtzD0Tq/Kb7wz+Sb2KUg1sjl30QUXO7hgevalAEgTT0WQuUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CqGTmpgqALBqCx/elFkdCi8Pallx7VgjYo5pbWoE9I=;
 b=uI1LfxsAB4e95fMLWOAhl7BZ5F8au9rro5zw1C1JCmFgUpPqvJAoGxKlV6FuH6UpZfAo2u8khiUA8/NWcHD5P/KzG9lgMHCYF0tVgVCK5MXs0fTBKYf6FVzy8FHb8OLTmNGAn00175akjXysqU3j/rE6P8xje3Yth5/e1EqsyOwK7JC3hH8b1Motfw099EiJp7KJC9Jkv/yY/YSash+/aJUtS/ThwCj66s52cqLSK9VjS9b09NF79v9wpBheYoQiLD2F/ZE6gbpfz6QTarUzqmcBo9CH9Mv53ELKK5WYMv1AXE7VpYuVzy4mJa7qfkuHLobXXhB1B9NwtU1hTIhHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CqGTmpgqALBqCx/elFkdCi8Pallx7VgjYo5pbWoE9I=;
 b=Pm+ClUMLjI/zvr1zWdBEqeL0mR5KyNa40hUw7FaattAfLkW1v8iUc9c2JIDkFwaCOiF5a3Ie+RtMzppPoI2xlPTOdNGXc2PZB+7DVRfKAW1Ksvgy8MR068r90rHQxN0OYUiy0+RqTttfljJz2Vy0l+JCnHzqvK/texmwqvSki7M=
Received: from SJ0PR03CA0202.namprd03.prod.outlook.com (2603:10b6:a03:2ef::27)
 by SJ5PPFA634C6E92.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7be) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 09:18:20 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::46) by SJ0PR03CA0202.outlook.office365.com
 (2603:10b6:a03:2ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 09:18:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Fri, 18 Sep 2026 09:18:20 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 04:17:56 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 04:17:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 04:17:56 -0500
Received: from [10.249.141.59] ([10.249.141.59])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68I9HoOw513120;
	Fri, 18 Sep 2026 04:17:51 -0500
Message-ID: <31a2b4f6-f95f-446d-ba6c-e79ecae9adbd@ti.com>
Date: Fri, 18 Sep 2026 14:47:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260811130822.2324438-1-s-jain1@ti.com>
 <20260811130822.2324438-3-s-jain1@ti.com>
 <d2c7a82f-0121-4f30-abad-dd8032fc5106@ti.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <d2c7a82f-0121-4f30-abad-dd8032fc5106@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SJ5PPFA634C6E92:EE_
X-MS-Office365-Filtering-Correlation-Id: 113d93db-735a-476d-1a4a-08df1565c854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|6133799003|3023799007|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7lXQ55I0RKTTYetgMzBmmsj+R/Jnhq1FQLmo36+6jWt7O1xAeWN0qQQ/i29CRUdHpuCYMkhw2AHwiQ7lrfzoSZ/JOTPQt2U7BDYnfYg+ZD78Nrh84fWmx7bhnFxVcpZgGLqbQSWLAT7VRPguuo8WU5g6zEyaVSUO0+nvvmDCOg035qwxvEUGbhBEjkwtwFTsAp+l3y5nyqS/v4w+MnyYqSpocqIAT3gSPuOSwP4EfZl9rkspXZ5cTXo6o/u/2TTNHdgcNVr3l6eF/TB9G/aASTaZ1VjyoISmtsQewGgVMyfgoozN+Jg5kH0DvZp6qo1A6lc44TTv3Tzu2yb94UQ2tp+3CPNwMXeGoY0bCyaBUFGAWdhusbNVjEkRPFFjE5Mb/F0ZUzbLmFibLhQYpqYGHkQpmx6D0UmR3xnEjZBxNpoqe0DwV03vpNBWw4+Or7kD2Z27oj/pRJWCjZ1khCWWT8Sf9vrop1LBwiXdrW5PQNOKkmyiUIRJbDYoQXTl1HnoUJSwSQroB1vtaXaYwiS4enlA2mGttNt0ZP6IVV+OO8i8hen84z2fp7RVguwfH4EXdXNNgun+neJqfLdUSVTCXdNtVwuyVDC64Fgwkkptp+mL10hL47Fqq/NPAicg4p8+9HT3S0E8wb9TmscuV77TFsD1JA41B6Vd5+VLn4m/iK4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dgFepNwgh5yiFkLVdgP25IeO7qPJKpq7PUfvhdlk3XcvK3OmpBJR0n5tIxxt+pV/zu+qidv/RcAMFIif+lMQxnydvVH0NuQOkGXqLnvh6rSWPO2n+ys1cnhN+Etg/qviV18llgf6++Fy6zr3jBNKh2fu/rRjcZWxZfvN2TtZF0YW2SyLY04Z5ADCNHTTiyofZu0RaRa03kfWXwGR3x/iIm3KA88ZMbTXOtVGXsF8GVRFQ3Y6JdVFVh41q/nQPlGxQyc8g6FouagCDV3fVITCh4tke1/rfAYePBVMgEs3LPpUIVbKnOC8cABzZCjWH2X8OtmjyZKKkDt55zElkfudyLzhuQ29c2AH3kdpqx7pvlLVHIDGc3vuU9i3ynwWxCFSxm9+Qo+PVxLyhMp7xtgMor5ManfRHdhK4nONat3iZeSu+4UNwJoawwWpBLqW3FuM
X-Exchange-RoutingPolicyChecked:
	q3dWfFlxqQRXTjPTSXqoUgxh3v+YliD94ZwmDze7rMLe9C2zt3/NvxvO1kitynRndU7jqvNXqKcgwoUIDbu4GuANNtPVdn/GEpvmuoJzzWCdE8fmWG4EhNMdilJNfPCtXwj+QuaEiCO3ImpTWfxf3PxRGPJqH0mt6AHhI4HG86SdRb7WDUM0Y7TLktnKBdd/GX8E4TTU5ylnlvgVJZv/pFIfMNLr/PNhcvjMYdB1rv1m5ENyz98m7AqJgspqTJT8AMUjU9tHpxXYI6TVh+cagGLx+4o4rYxH4hi8bWP0/xUkTmeg5Flkec6g117eSZbYaJMIB0npyD2lHS0AGOeg3Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 09:18:20.5377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113d93db-735a-476d-1a4a-08df1565c854
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA634C6E92
X-Proofpoint-ORIG-GUID: w8IKgzhs_ou7QPG0sE-VtUd4Ho1TASBz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEyOCBTYWx0ZWRfXzRixVbHP3XO9
 6+UK2X+sajB2JDj8HF4CFjmprcRNB0QUr4GECqwaTSHMJM0doRJWoHHEAxlCFyCVSUiR8j/rAj1
 jqWi1D2s8m2J0iya3dpYxqKqYK4uS4FJ68/OG6lLEoF9K3I4McwiYySpHYB7qmzvqTo1h7k8yto
 Yaa2H2xdyoQBPh1snmIIbAHED4fpyWVT7rlxRyXxIjH3zGDSV1xk7ym9QdqvR1V7KFZKXdmq845
 oHhNsI+p//L29Vvs48MWY+IcIdbdROt/EtECzswfrBtgR0zl5H4yDey9tRDnhgCrJDbGFKeMZ/X
 /Z6l+01yKEVXpHaUJbPXvyQxMm/sIrKM+TLoAp5q1Z++BTOqJHuItAkLdXyK6TMqU1Rg4rgk1A9
 zQg2TuUZ/CQXDwCyqiEj2ba7GzHF31rIwX9OsDFFol0wBmnxK4WhKOpCxgqQKtmTr6qUzAVyAmq
 nIryP17e0hjBbt99y0Q==
X-Proofpoint-GUID: w8IKgzhs_ou7QPG0sE-VtUd4Ho1TASBz
X-Authority-Analysis: v=2.4 cv=eeCo7LEH c=1 sm=1 tr=0 ts=6aad01e2 cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=P-IC7800AAAA:8
 a=sozttTNsAAAA:8 a=pmKx_B4UK3XH6nTqaz8A:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEyOCBTYWx0ZWRfX+VmvvFTy9Ol5
 hV5C0fzX7WtuNFEdCAhnWfQI9gA+Kc1l0EZAQGsKJUBe+R9Yhaq8nlzyqIdtJhUeX08jSOdt65i
 KuJ74zsJVHSHoKaUOxO5BE+m1sCOyS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180128



On 06-09-2026 19:14, Kumar, Udit wrote:
> 
> 
> On 8/11/2026 6:38 PM, Swamil Jain wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
>> DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
>> and hook up its DPI output port to the SII9022 bridge input, and the
>> bridge output to the HDMI connector.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 95 ++++++++++++++++++++++++
>>   1 file changed, 95 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> index 84a0cfaaf196..477de9de07e8 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> @@ -44,6 +44,18 @@ usr: button-usr {
>>   		};
>>   	};
>>   
>> +	hdmi0: connector-hdmi {
>> +		compatible = "hdmi-connector";
>> +		label = "hdmi";
>> +		type = "a";
>> +
>> +		port {
>> +			hdmi_connector_in: endpoint {
>> +				remote-endpoint = <&sii9022_out>;
>> +			};
>> +		};
>> +	};
>> +
>>   	leds {
>>   		compatible = "gpio-leds";
>>   		pinctrl-names = "default";
>> @@ -192,6 +204,38 @@ exp2: gpio@23 {
>>   		bootph-all;
>>   	};
>>   
>> +	sii9022: bridge-hdmi@3b {
>> +		compatible = "sil,sii9022";
>> +		reg = <0x3b>;
>> +		interrupt-parent = <&exp1>;
>> +		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
>> +		#sound-dai-cells = <0>;
>> +		sil,i2s-data-lanes = < 0 >;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&dpi_pins_default>;
> 
> I think, dss is right place for pin mux, similar to
> https://elixir.bootlin.com/linux/v7.2.2/source/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso#L153

We need DPI output out-of-box to enable HDMI, will add the configuration 
to dss node to the evm dts and re-spin the series.

Regards,
Swamil.

> 
> 
>> +		bootph-all;
>> +
> [..]

