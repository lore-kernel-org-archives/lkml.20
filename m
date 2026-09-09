Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3233D4E4;
	Wed,  9 Sep 2026 03:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924818; cv=fail; b=aHvOQbQQ5Fany6l5oN0Izq5mkVJ5DfxK8mq4xGVM9anJw1mScXQlNSmhZLZt/You57swYFB3k1zyLWZZWFVXw+X9Hmw0TxFcF8AUxYymaLQOaS8FktDzbjy3bgtl+kKwXRq3Fenpx1tFQtsxccrY4FRgSacavI7UJSK/TPGe8l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924818; c=relaxed/simple;
	bh=4BiNy1z+YlFeUwZTZ6eajvK7SDPj0bb5fsf4F5bNejk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JdwQ3aFsuPB2ZX5S6PmT3zIdOy23u9+9TTg/q8oJVEVratY2tP7lXovz5YEO5IrR7bkFQmpOvgRGFf3fecXOZx+rHSeOAGwxqu4pdHd17yim37qX4bY1dzpA6YNAqfTjIqpBQ1KmBbijXdOG7HTEIZVqIwtvIx+Qk3K+sJSBv8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=YvXnA3Wk; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fEU5l7gX; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="YvXnA3Wk";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fEU5l7gX"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 688Mdnru1066371;
	Tue, 8 Sep 2026 22:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Xn6q/SeFcoCr/3kAw0RJfM1gJ31SfWtn+gaxi/eHY
	+w=; b=YvXnA3WkyhDy4hgi4cM+mp9N/Agxe5tRNj4Sgy3r3m17U8BlV6VB14erI
	SBjRLGZenHaHzU4is5zHNdZDTHaU/oHbKdrAFUPRz8UKhhCEjOfTwS+eR8tmWOfR
	qf9xiTQwx4IElwkXK0+FJmjWp1PGJs3dFLOHACHIR4Co0kkdMTOnB97YqWLxjWcA
	eVXg0+UcbNzeIMEaP75Bt2E9jiZ3GgnXT3jf30MZucnJ7MEzwUhXA21Of1qBGYCK
	dBDZTsawa/mYSdtSz11jBEcqtKNeQuY8Mc80rCZoQVxkVpZXEouIUMG5kD3YeCwW
	GDjnm/QHRrKgKp5f0OIsUY475lTsA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gjkdmvxhb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 22:33:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FopkZZ02qdoLMXPk/57EjveaL304DAS4KCeaZI3uNu14JlknKBf918ygMEZWmtINAh98eFfmDNVSgpBtoXMa5A8tFyGPl+IPeIAQyTbzHsspd86r0bjf30jLdE1CHjbQE2pRAdK2+CJ0arCCO9Fr5qs40HL4NDF8qQqd4ohyWQIpF2N4zcTq6+gDPFqix3ivcxh/8tczPU5WkQS5KHH2EKDUIGtQvgnxvYQ18W3R4CUYC6KGGvsnUcrKi5ec1LTw1AG+HtQA+VKu8HxphjzoIokFtDs6FwlbgvqBbYRTHe655nTaE7Kn7Y0oGuwY1nAzJpTB8HqCFuvKedvYK3ckkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xn6q/SeFcoCr/3kAw0RJfM1gJ31SfWtn+gaxi/eHY+w=;
 b=ftW6IsHM1ASrTag5wAHajoo206NUXLfeY2hZH4PfxKMDMIWW/bsPUQ96wI0yqzlTlRvMNishX7SK2JkkHFkLO1r9H/5pJaS0771PboFkjbr8harutl+Tc7kHxntRs5Rub5Rmqj6Ie6hq/ZJJDOOTxceyM2dxuccD2ZzMbIreU3b5d0qHSMYr93xqKKW2AGW9MDBo+eSWxwyC5reK59R/8xYQc3xP3k09cb8o2+nsXygMncW9/9HgDOLyQBQmLyyjrnbJsYAVf7zlnRxghRAhgF9GyXTcwm8xEHx5PQPz2Qycs9Sa0EqBDqoue4HY9GoNYPjzAKpQWQcqQ62BrvhXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xn6q/SeFcoCr/3kAw0RJfM1gJ31SfWtn+gaxi/eHY+w=;
 b=fEU5l7gXgSFKfY2HTu/sfWfk1WANEm6sAsqk6GcsGy9aqOhjgaUB7H5hdvfiz0j/R9flZaXssQVQ0pcSW4cGL92dC6VvTH4bq2K1XamDSUd9uHcdY0V/azln2hRdt2pa5s4I0rmtJxY93OfQOYcPEnal+qTankh+rh7nsPbrS5U=
Received: from SJ0PR05CA0074.namprd05.prod.outlook.com (2603:10b6:a03:332::19)
 by DS7PR10MB7322.namprd10.prod.outlook.com (2603:10b6:8:e5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 03:33:25 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::95) by SJ0PR05CA0074.outlook.office365.com
 (2603:10b6:a03:332::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Wed, 9
 Sep 2026 03:33:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 03:33:25 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 22:33:13 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 22:33:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 22:33:12 -0500
Received: from [10.249.36.94] ([10.249.36.94])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6893XCma478304;
	Tue, 8 Sep 2026 22:33:12 -0500
Message-ID: <11653d4f-bc18-4525-a474-5c6bd7e14a38@ti.com>
Date: Tue, 8 Sep 2026 22:33:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: ti: k3-am62: Set MMC clock pins as
 OUTPUT
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
References: <20260805225438.464184-1-jm@ti.com>
 <20260805225438.464184-4-jm@ti.com>
 <20260904151335.fi5mvjpvziw2g3r2@exemption>
Content-Language: en-US
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20260904151335.fi5mvjpvziw2g3r2@exemption>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|DS7PR10MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 7624fc7c-d1f9-47ba-11d5-08df0e231b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|3023799007|56012099006|22082099003|4143699003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	C0XSrspYilywYC5CIpQsuYThBisSMZmPWSZ91o+psphZNHXQV4tBKW5yT42QT072lL5R6xYxAB7cl40+0ouyt2mwEGN/LjeDHnKkADKmGb0KlEd3CkWFZ3jsrVfqTXWbQDKD/EHn+1/twqGoU3hQ1aLy2ac7iVbadcwhkQp12xtNt/e8R4OiExI8cdws2+09j5kSB/ET7St32boIVCCTd2JGckl/Ntrk4zirphWawSOdXjiF5xK+Grdqy/RSSgdDBwZjNNwVI8Pn/79p3/ATIao5v/9gduM1UD6r4GJNxSAorv8JUI8rqs/Rx1IBFiRtx4Ws4xgKVU65Tu6r5wl+sy8VZ1S7V6dCdrZTq6JeIp55k1ad9aiir/84kvEZuv8Wlbmk3RrT+uC3jU2B9I+mznuhXuNSVqNUXRn+uVJclMrs/xzIoatHee2sfqUX06spvyRINSFNg731HgCi1ddW5gVWX2y4ySwuGBzMx1/nOcA4XyfT3nxtWFhBskSnHeIJUp49QZSc1YNyJVncPoYnNbONl9ZHrsAFGBwTRZm2fKu21Tc7mesuanvFQTYYM5qKhk/SJTxiQG7p15l/rt/GXGEn2Y1PcUlO46ZKmao2Pv8G8QnztZBLF97uPsCZevI0RzTCu5CbE0johrxR/Ye3fZrXFP/ZZvaHirMZqLT6PKQXZZ8gqT49Okxik8C2iuHgIDf2XT/64FmU22XS0pzoqg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(3023799007)(56012099006)(22082099003)(4143699003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fluvPjYzt0B/VfRN4cTc46cTXZHXBdE8ZoKVrhrP2bStAoFcGbC7i0lQkwLozbLLSb781Rp3MjWtSxXDWyIcUs7a75VIRW+Fq6wj8ctlK3fosqNFVvGQx8L6UYSvsWFdQXZ3Iapbx+nXfBVuDWnpkpZhGEUTPKHWIyJ5saFE83sGzmF0xWxwfEAUQJqeTcEt7GaRnF4u8wUxh+7q/dXLsUC/Up9TJaHbEo4JW8GKIm+CBeVtPBvCfW+U/swoO90MCI1QVBcu5M60qK47XlbMnJmyrICrZ+vHKAGKZ3DGdeVBGUp5uBC4amFKxngafN12utHZk/CBJyBpeXqAxEI23qOdZemwCaJ6Wl9B02oUi9/Nd/Le9LlQQWaIRJBwUSLzJ+ju2S5Rjjra0JDD3MBUoErxvgwNesKFUaiih5Xgu8RS3lmenzQi+efFevJfpyPD
X-Exchange-RoutingPolicyChecked:
	ZdLxXfFzWYqPySFNRbtv42Da8k3PjFv0BA8vC5V06CmbnIYxIIBu1EJnWKWEPm1EBgsa/K51yFYGWVltckUs8XjWcNURn9ZxPL15Gz5gWQ2X1qL3VW/ZaIn9ACObSI+vRB8UqjXg8QhYgAOyrIqlxdojwaHCdOKTUbSJ0/LUfjYwvi2K/anHu03ajXeBFrjGi6fZFN1ufZKkB73dvy5FuC8iHePV2xewJdUqwYnlTbC3jNr6FlreCld08wYi3+UYKq5vfAZFLR5LniBJc1fI5ScnH/XqqugkSerCY811JGqLcgON+75t/11IfkJ72v24dRmYWDSi5FGoA1f8GUjtfw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 03:33:25.6148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7624fc7c-d1f9-47ba-11d5-08df0e231b79
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7322
X-Proofpoint-ORIG-GUID: eCPnxQLq6G3XiIHv5aLGlW7glnd7QG6Q
X-Authority-Analysis: v=2.4 cv=KpZ9H2WN c=1 sm=1 tr=0 ts=6aa0d38a cx=c_pps
 a=6DSn5gaiYX6F7sdBrIJkYg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=KjBObAADiL_egZ91K3AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAzNSBTYWx0ZWRfXz6FP7ofu75Ah
 EohWDmJ+7I+Nmjlfo8xuKLGCsPYGLVaXlYWppMHJ1MDCahxHPQk2WOCXWHiQ8ZADERMpp/7v6s6
 vIJH8zmxKJ5flHapeNF8OW30ScvjpNI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAzNSBTYWx0ZWRfXzdsbSSct+J2Z
 XfcNHNkh9SNClBeIPVPPKUE65WLcKRZO0IRGb9WewrnQPMka6rLGXh9MNsOetYbzX1HLPBbEW24
 IIDfHsclIcG0gqipeIaLH/tFuRurnzlxO+6hPJ6+omMAgN6OFAXrIHM8N8XCMiPVlX2a9b2/1+v
 qsEUwd4BBxQpAr91Ih9jpEwbSjHhQIYN7ztckxvOFG7PN4Bh6p1bLKu5oD/49vNRLnFRLZu1IHX
 WDEPUuJmwQmacNWowFlclivXUK2yTc+YD6Sdi4u/+KuhaJXaQ4jbRCPHdPvcYNAKfTh+GRAjKXH
 yrcvEJUecO1S9YpYvn5VvuX9wvAHepAzyD0z1/MrLBi11rFnC1UaQja4SV4Gw5p5QUJ3bYIeWrD
 42jow13FJjybL1PZOVpRPJMjK/KEABPJOnuheeGRsgR7dz/z4xwOIKVt24JcZoq6uCfKLQ2+4AO
 yk641/8NXVw/qTA2A4w==
X-Proofpoint-GUID: eCPnxQLq6G3XiIHv5aLGlW7glnd7QG6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090035

Hi Nishanth,

On 9/4/2026 10:13 AM, Nishanth Menon wrote:
> On 17:54-20260805, Judith Mendez wrote:
>> MMC clock pins must be configured as OUTPUT-only per TRM [0] with
>> receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
>> PIN_INPUT to PIN_OUTPUT to match documentation.
>>
>> [0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals
>>
>> Fixes: a0b8da04153e ("arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file")
>> Fixes: 92d8c028aa92 ("arm64: dts: ti: Add k3-am62-pocketbeagle2")
>> Fixes: f5a731f0787f ("arm64: dts: ti: Add k3-am625-beagleplay")
>> Fixes: 2517e476b819 ("arm64: dts: ti: Add support for AM6254atl SiP SK")
>> Fixes: a841581451af ("arm64: dts: ti: Refractor AM625 SK dts")
> 
> This and previous patch, I see you have tried to squash patches that
> makes it harder to apply to various stable trees. Either split them up
> so that it can be applied to the appropriate stable trees OR use # to
> indicate the kernel to apply to -> see stable-rules.
Ok, I will see if I can split the patches. Thanks for your review.

~ Judith
