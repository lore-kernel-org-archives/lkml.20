Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF03CF207;
	Sun,  6 Sep 2026 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703385; cv=fail; b=cQwb9zsB3r/DIdeLD+CUGqxtoUWnd6zzJqOlZwuOQidIklUwN1kZ8Hp/0JFm6HeMhmiqMnFxXCsxlsS348JIaNz6po0EiY25PiMhLy90G/bhFLhYueUXFkpxNXf02srJpQPH+59RhONKioS4h7Cj1URSwbflLd/6cNEF4UibRzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703385; c=relaxed/simple;
	bh=THTV4Sfm2B9CakTDhgHZsFWIuDFn6XTOrHDL2sh3qrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IZeGwv6rBxFqLcXhdoIE76fKqXyCi/qW8lGZJkndW59OhMyZvrzt39+1rR7b9ALF+VF1/KkZN9vM2KPoePTDfGgBrsAucVjaf6X8WULXfrXn8VOMJpe0xKavSf5YaQptt2KDLX67xFDsvA3bC0NMqdc/vEjzSJgMn3d4kfa6c4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XKpr8HkR; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D/gjSt+3; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="XKpr8HkR";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D/gjSt+3"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6867lweu063635;
	Sun, 6 Sep 2026 09:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XZQS3PcGD+GChLmWGganXsWu1I1c9YJS8g4iOxe9I
	Tw=; b=XKpr8HkRQC8e480xROTF+9NHHM1GFOSEWGECaXnUxPS3w84KiQp9Ch5BY
	+0bgCi0pn5QI6MaocQhBg2Waji64TUtudP3CyFB65ATROYRvMNtVRuiIjk3RTDsr
	NPEATH0QRDhPyQdjepuI8q52ixfW3lGuldRrYqoF5mFkdekbC5wIwwkrdD/l8RSP
	RctA7Tn0dGNMZBi5uLzmX168knREWbWw4cRDYYgLEUpqcQ5I9L1rjJHAzoLqozep
	ToE5O419ALSblt5zoS8v7jUqe1l5AC3/7N01J2jnQ9dL+XagthhKl7ei8p6ZxagH
	W7uT83p5MhCB7t8q47iRe7qeJCc3A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gh43n0u27-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 09:02:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSTPsAYp3uIkhBDa8hEJYH5f/wb0LBSBiSRztS6Rpr5i20/g6LNj4TPkycxzfllKiXLRwUAYY4JtLS6bznC33fEqOygFSKKrSBkamjIC7bcQd0VxQVIBApA/QMZTjCTZCLCsl81nG5f70dyWFUasBQzSUO/zPiMzAOzjTkHc4vxOQLxQ3OBuhYR5Wy8rmtPMrdLf+bzXM3jHEsmUFtvrFbtAyMVvGWooTwGFs0tVd9V4+DxNAmYW4bgdsByQAB31B5wqyTbEEM3dlWqOKVn3PTdifadLXHGTDp8t9ILlDcPj++HH+Wt6Bj8CGr4DsIHHGfSk0myPYe37+52snAXnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZQS3PcGD+GChLmWGganXsWu1I1c9YJS8g4iOxe9ITw=;
 b=DrIT2OBVnH3nlQBSoIfIKBDuu4b50ig7OyNms8g4hAacdsqDdN6ehlav+rfjAqhEcNDewFn4R513lwsZabA6E257ALibw3Vf6sbUZU6Ry4cPDr1BDhAJ9tRXfogSDP6L2dmE8rOy5HYehSw2kuI8F0VPeTnDahEAfyG0wQt8JHV8Hb8Y2y7GDj5A9YDmWZQuG1/BKU/ejoSNGZsHyiusg110ttzcg1wEIpLcFPJyy3L/HWBZp3U6S47PAVHxyPD0lcSq86yccne9Nd5RoVLRrhASbeKSP5c/tGz2K3rHDijsn83HpQ44l4v5q2i0TbXNg8LG1fgr/x2No8hZ2VUeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZQS3PcGD+GChLmWGganXsWu1I1c9YJS8g4iOxe9ITw=;
 b=D/gjSt+3ox486ilFUHAzvUJAAPYBKfWU2ldcOjXA4CcSk8lzyOHB9/GMmjb0MOuNrqUyatz6fv6CBDUKX5tQ1zXLhzPVPkuuwP2C2haSzkzcZMDfi8Z+Pxadc5sYwxwBntg+TnQit5t+oIYgq0U3XuyYAnrPOMnBb0BfMgb1FOg=
Received: from CH2PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:59::18)
 by DS4PPF20A8CDC0B.namprd10.prod.outlook.com (2603:10b6:f:fc00::d10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Sun, 6 Sep 2026
 14:02:54 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::e) by CH2PR03CA0008.outlook.office365.com
 (2603:10b6:610:59::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 14:02:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 14:02:54 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 09:02:52 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 09:02:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 09:02:52 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 686E2e9G2948221;
	Sun, 6 Sep 2026 09:02:47 -0500
Message-ID: <04ef3762-86d5-4d61-93f4-202f0c120433@ti.com>
Date: Sun, 6 Sep 2026 19:32:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-beagleplay: Add boot phase tags
 for pmic
To: Anshul Dalal <anshuld@ti.com>, Hari Prasath G E <gehariprasath@ti.com>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20260813-beagleplay_pmic_boot_phase_fix-v1-1-4518e7cba940@ti.com>
 <3db98204-002c-4160-a055-d644c4559f33@ti.com>
 <DKWZL1J11SZE.2YIUN7M775UBM@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <DKWZL1J11SZE.2YIUN7M775UBM@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|DS4PPF20A8CDC0B:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cb5f8c-0d64-4057-e772-08df0c1f8c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|13003099007|6133799003|3023799007|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PPDOzZ9nL5cOHbNQ2ghxKXX8t0nJG3KtRcB00TZchf2BqHcFCpoLgjMgq6XEsPhz5D4XZH4rscc3nQ2uiMqENwrNEkthweHhcuLWimsbjd2INesoYDoderAQAZYTQ2wUXOieb67MjmKuAb7aVeON6NgOo10oUMtjd/vNV31S0LztmhfFDuQJGH0RiMQ4BClcxITS2NGobtCUVgfwqJyyWP4r0FZ48hfVfq7NfrbrcEyWdyO10WggSvWMxHLovKVAkly965idNJFNG3wvyVSTgq8Fj/tvUJ1xvmWrL9ed05P/yvVwlb7aMCJvILGYRYCz+fi8cMcacvAQ6sSfk3ZFRMA85bkhcb+E+sEq+FzF+UWFt5xLjaBIxzfldjRqmX/OYtfTi0/xF5OwnBSvM7D/zSZM4WhjyHX5CKm7B+nwoU62XzlvGP7KOsjL4vV7rq8Hhr/ETjHwayE4adUMRtwRhalH4jH9pogqHbm5N+HcH2oUqaHjv23DDrGv1LDItzfuS0ge3mObDa+pYvgiGcFCQOgeMMBVLhaEPZ4J3uQq+thypVBHHCbJMzu2P+yILD37KiEb+OP5QarCLpzUiEgjc+3WANjmq82qEhZuimys00wbD9gX691vPnlHu3ocEI8deYDv1Tq4cUvqLPuwJECElHyASYfKfH6sb/iTTKopBEE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(13003099007)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eL5Uzz8PynO3BVdqObNjwx9RQLs4nRO50psggZojv5DJeydlh1cGsp/FJSu8fd05LmVKs4f91TAh6oJoRLnrHm+x9BZp5X/i2oUEOGGuftc9IDL10wyBg1jE3CxaGZQeixj2PgW4Gx1NXuXjuxV7qHW/IdmsmzYqWyfVu45LY3FSgsUhSf53Izr3+dJTdQ3esYtMB/JVREdqeWlXRHcd0cr5SVx/iafV6yWJxWTflVxxJ4BHV8k0mufSGIk5d9IYJxSq9jj6Bc7S1NwJwfB5PC/tB/4MOg1pMtSZnARhuXlOhe9FRoyMceKj6igyYUUZSwdiG+viYZWPNpmqTzUtzm54b2Uv1Wf+1LW+uiXxBok2o8KqeMjlpXHb8bv828ONi+iCpiBLd6WOze1O3gQA5r53h5Ksq4d5IdQwhFH5rWEu0LxfqSBd0JdmzshLfrXA
X-Exchange-RoutingPolicyChecked:
	nwF00k7j+WRyxG9N9rgfm3yVskvcHP9446DdCbG9X4OZFND45ZfR4DCKlqSvWSRkxFa/Mp0NQIpfEx2mMAW6OUK4XZZW7NgJyywbw1DJ2pRhbkEVt10u74K0tpdobClSnKrxp20WMqSPdYphpaKPfZOFHstuljIzoPQCOtTFOMwRR02ytnhXI+G4/aHJIFICfJmiQvdcNWKQVxiUVvA2yiQ3yHtT4dRt4unp9y0v3FciFoXQJWmc2SdkvBP2Ji7UQxt0mmExGm7nJ5BTdUcKZM2wvljXEwFjGw6iiLy2jGGM4km5Kq0PjbPYIzgLf5ALfyFsljlQBGJ+AwP7wRLoHw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 14:02:54.1622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cb5f8c-0d64-4057-e772-08df0c1f8c07
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF20A8CDC0B
X-Proofpoint-GUID: e6bQWUBYmqHkpHLiUJKf1c1reofEN-Sb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1NiBTYWx0ZWRfX1fUJ5l+hAlDr
 ztb8aCaX0h+1t3945JV4J4XcnLejmsUUD/TJkOIA969mEhJsoKbnostJpD+ZnyWOhvClqBFbk5c
 Ik+KP/ZB3UuhRjdsE8qJ+zH/os8vXyLIxHpfre8SAtj00+Qv0NpjaM2otSirj7ZSsPW/MOrz7Gp
 JyGBREjmcYtIt30yAuDLcVVV/hq3U6VcifXZWSOganyfWrmMHWVSzA8WF+OLGq70+diU//oIM5T
 5S1V7dFCOCuQvzfsPTbNlaYYDpMk+Hx/PkzI0fJ8kbSsNk3zL5O6rvSavt6Oq932AOI3BtpJ9tF
 LyAN03/zn85GMGrnW/srwiuWjvPO3Gq2AQI4jzRo+ecJvRXb1t4+zTfeTsuQF+oaCjvudlpYQ3I
 LN/XCvmd1c6gZrHbMsnWSuS4/mf/EzcYXaBDDX1Q5KJfLjMIib6ovnMK9xtAiaz9Ryrnmn1pJAJ
 8E16QTckgKiuQY5tVDw==
X-Proofpoint-ORIG-GUID: e6bQWUBYmqHkpHLiUJKf1c1reofEN-Sb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1NiBTYWx0ZWRfXzdXV9SZDAjbA
 vXkus4aZcfKDfUYdg8tWAcJPvBvG8LzAsnc7PsLe3CAtU2QdI+9DACPzVd+Y/+GBUQbqRTQl/00
 OEJNoO5l6hT+dwCtW7DTPKxm5S4mYxg=
X-Authority-Analysis: v=2.4 cv=JdSMa0KV c=1 sm=1 tr=0 ts=6a9d7293 cx=c_pps
 a=3RjCkzAZQHL7PUncwJf+GQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=YG64nluAAAAA:20
 a=sozttTNsAAAA:8 a=IacmJFWz4xER7wdZOVIA:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060156

Hi Anshul,

On 8/24/2026 12:43 PM, Anshul Dalal wrote:
> On Thu Aug 13, 2026 at 11:14 PM IST, Hari Prasath G E wrote:
>> Hello Anshul,
>>
>> On 8/13/2026 1:58 PM, Anshul Dalal wrote:
>>> The PMIC regulators for beagleplay are required for booting, therefore
>>> this patch moves the corresponding 'bootph-all' tag from the parent
>>> tps65219 node to all the regulator sub-nodes.
>>>
>>
>> Was there any issue with this platform that is triggering this change 
>> now ? I think we need a fixes tag here below.
> 
> The bootph tags were missing from the start. If a fixes tag is warranted
> here, should it point to the initial patch adding the dts?
> 
>>
>>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>>> index c468b9c5fc09a..5f7265c426bbe 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>>> @@ -681,7 +681,6 @@ rtc: rtc@68 {
>>>   	};
>>>   
>>>   	tps65219: pmic@30 {
>>> -		bootph-all;
>>
>> Wouldn't removing this from here prevent the driver from binding at all 
>> in that phase ? I am not sure if the child tag below would also imply to 
>> the parent node here, pls check once.
> 
> U-Boot's binman tool propagates the bootph-all nodes to all the parents
> and thus the bootph-all for pmic node is redundant.

Could you check, once, which nodes regulator/ldo, are really needed in
u-boot stage.

Unless default power-on settings of PMIC is not working for this board
or you want to program something during SPL stage like AVS or so, then
only add boot-ph else you can consider to skip pmic at u-boot SPL stage.

> 
>>
>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/bootph.yaml
>>
>> Moreover, k3-am62-pocketbeagle2.dts seems to use the same PMIC. Isn't 
>> the same change required for this platform ?
>>
> 
> I will give it a try but pocketbeagle2 likely requires a similar fix.
> 
>> Regards,
>> Hari
>>
>>>   		compatible = "ti,tps65219";
>>>   		reg = <0x30>;
>>>   		buck1-supply = <&vsys_5v0>;
>>> @@ -709,6 +708,7 @@ buck1_reg: buck1 {
>>>   				regulator-max-microvolt = <850000>;
>>>   				regulator-boot-on;
>>>   				regulator-always-on;
>>> +				bootph-all;
>>>   			};
>>>   
>>>   			buck2_reg: buck2 {
>>> @@ -717,6 +717,7 @@ buck2_reg: buck2 {
>>>   				regulator-max-microvolt = <1800000>;
>>>   				regulator-boot-on;
>>>   				regulator-always-on;
>>> +				bootph-all;
>>>   			};
>>>   
>>>   			buck3_reg: buck3 {
>>> @@ -725,6 +726,7 @@ buck3_reg: buck3 {
>>>   				regulator-max-microvolt = <1200000>;
>>>   				regulator-boot-on;
>>>   				regulator-always-on;
>>> +				bootph-all;
>>>   			};
>>>   
>>>   			ldo1_reg: ldo1 {
>>> @@ -739,6 +741,7 @@ ldo1_reg: ldo1 {
>>>   				regulator-allow-bypass;
>>>   				regulator-boot-on;
>>>   				regulator-always-on;
>>> +				bootph-all;
>>>   			};
>>>   
>>>   			ldo2_reg: ldo2 {
>>> @@ -747,6 +750,7 @@ ldo2_reg: ldo2 {
>>>   				regulator-max-microvolt = <850000>;
>>>   				regulator-boot-on;
>>>   				regulator-always-on;
>>> +				bootph-all;
>>>   			};
>>>   
>>>   			ldo3_reg: ldo3 {
>>> @@ -755,6 +759,7 @@ ldo3_reg: ldo3 {
>>>   				regulator-max-microvolt = <1800000>;
>>>   				regulator-boot-on;
>>>   				regulator-always-on;
>>> +				bootph-all;
>>>   			};
>>>   
>>>   			ldo4_reg: ldo4 {
>>> @@ -763,6 +768,7 @@ ldo4_reg: ldo4 {
>>>   				regulator-max-microvolt = <2500000>;
>>>   				regulator-boot-on;
>>>   				regulator-always-on;
>>> +				bootph-all;
>>>   			};
>>>   		};
>>>   	};
>>>
>>> ---
>>> base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
>>> change-id: 20260813-beagleplay_pmic_boot_phase_fix-c04b7f55de63
>>>
>>> Best regards,
>>> --
>>> Anshul Dalal <anshuld@ti.com>
>>>
>>>
> 

