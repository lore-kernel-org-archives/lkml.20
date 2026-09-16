Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683FA286D4D;
	Wed, 16 Sep 2026 04:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534217; cv=fail; b=WXrmCFd76elkb21WWm73bY47sSBljO4MYHu2sn73T6F58bxlyOvAMhOhVvRn+yIokyIK1XYRkdBG04BY7LLO3+gZSyPucIs2m4ArkuJE4LZEJUIitr7rfftAA6dgeqq3BBiqIQ7qXjJ7L2wk5dNpto3Q/MWI8LOwnAxNmoAidbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534217; c=relaxed/simple;
	bh=JDz9bsS7C5cCsQPfVFwqJ07iemq5uCpbY9pccUHwuFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XLVKFJ155cur4xlmDJCoiNXuWlRnoTgbLqll108jfOqVdxsylN1cAiRqfA1DT9EtF6ylya+XRN7hDB/sl4VOEFOtZRSAGIr9ILrGw+8itXikvC/sg3Kh88V7iVr6LkJPINBbOCfWO+iHIOL1Mjb7y6XhisIle6/940N4Tgblsig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Mn60CKdn; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FpGzqllO; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Mn60CKdn";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FpGzqllO"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68G3Z1461112373;
	Tue, 15 Sep 2026 23:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=knWlAwiT6xoWQi3zSHr+UD6wIkdEUuI9u1qs7Gm3u
	c4=; b=Mn60CKdnwtFrSAKNnI2fAebxe+ND5wSdqfYokCp5d34+wwWnhYSy/Zyxz
	d4VrOFNoL+6/XFx6cXsnO/OS7taHQOS0cb5ed66wlM0ixBiaV/62Gn6dNx7dRYn2
	ZKEVvWL7dZMNq4jb78cEUGaAQRoSnyixzMLD8fqMt1DwlwFXF8356EQLBEvArVEi
	tdfpTqarmZUmt4+xj3OdCIfjcW/FwsyB7ViT/a4qwimRGSEohQtaVZD6ePDXVw+Q
	Hx38oEB7opKoya6C2iEjGaRwWgkPGaxiTDe/9ydNaU8ffjALvVDW+tx5Zi0y9//D
	SLHD3cq3+oOA+iVHheT3rISMIUz7A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gq58jp39t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 23:49:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yddTX9A8786ZCyfoa0yS38tgZjGss3dVl/s0NpXmyoREoB/OgcDgV4NlVArSrwVR2JPTgPSzUdcj2sZZmRDu83ab1KJjwabE6JO0mhCqrNozSbYoDT6kaRlLzofxath7CP2seUa5BUB2UagwfwoJiqvmrdXvQXiBdtP7D+IGVQAO6yjQBSqzVu7WnNsSYxT+OdApGaw/MirFN2rQTrjM67rOPEpvZ8R4XXVkmay8t3NK/ZOP7JfDbVU8vy9c6olv95P8xkYLoV6sXzu90VScuiSTbggwPbS8Usph+EXGvc4XFqHfJ5Ptglktlgi4ebSZLMVfCGwxrxWZCCkfZl2mzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knWlAwiT6xoWQi3zSHr+UD6wIkdEUuI9u1qs7Gm3uc4=;
 b=w8afGlCMy6f6uHUB0I/ONiCIykOonZg+1j7ztn3MOLqDmQT1BrBys01q017wVC2gwQjaod0dAHpbjEcXmVp2e5nL4xl/BZ+zPsY7ExHQg3UxTY0HvIm6kl1/kWpjF7uZyLph3lflPOtj3lnJogJ2uhOawdFOjxG6AC5iZCiWU2+OyUfN4mUWMoEY7iwfGWpGSjva2wQf2zu3VM7Rogiwgm1gARgqgeYaCKk1gh/yNFTpc6KbJ20z24ZtizopJHoL3qzEgiRpCDdUjjEGYLw83x/hvvhX4FM+JiiqUfX+WPUZzlyCmb3wZvIeIsV4V8VuDpyau0svKOLe96jCYgUvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knWlAwiT6xoWQi3zSHr+UD6wIkdEUuI9u1qs7Gm3uc4=;
 b=FpGzqllO4vNmypvro4HBMyuC+oDhQgH78YkTDCZq0M7UnB376weLRP4pDhv84UYPst0REgCj6mqa8BHHT7jnBo8v+L/DliEs7WqEh0xhgDjHqnRrmaiugol8PnblWsL4tE5VnwEQb2w+mfRFGS/7rqxw1F3za1edvu/t1q/Xypc=
Received: from SJ0PR03CA0299.namprd03.prod.outlook.com (2603:10b6:a03:39e::34)
 by SN7PR10MB6641.namprd10.prod.outlook.com (2603:10b6:806:2ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Wed, 16 Sep
 2026 04:49:28 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::af) by SJ0PR03CA0299.outlook.office365.com
 (2603:10b6:a03:39e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Wed, 16
 Sep 2026 04:49:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 16 Sep 2026 04:49:27 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 23:49:27 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 23:49:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 23:49:27 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68G4nMFg1306935;
	Tue, 15 Sep 2026 23:49:23 -0500
Message-ID: <3a427f3f-c3ef-4100-8aeb-e08343ebe136@ti.com>
Date: Wed, 16 Sep 2026 10:19:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] MMC pinmux configuration fixes
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260909214743.899477-1-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|SN7PR10MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: abd686f3-d589-49f2-2c1a-08df13ade3b3
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|23010399003|36860700016|22082099003|18002099003|13003099007|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	WN5wiOk/D1HaHsyKZo0sFXzrSwVJ6iZjm1M08GAhKpKzFxq215lebVgh0eoPOh4yds6gvFKDl22iBVaZcx0WojqsZ6CJhscco98SYn1jL6dhwLRDvlnsxo0EXGkXDRciN3kqw79vF1IVoshE0so1oTYpOj/Z3kaGg8xVxPyOgmQHc9HB0umpCoSrowX4MhkrewVJCDCLVGqGc7JLeOe3GrPaS3FOVZJ/k3zqcYRTOIBwnvCXeM55pZRDtJxLbOYyT1ySOGtPkeDOedp0IjtobyAFQ3Inc1x5gA5cjSxgkAsYQl20rV3Z/+xJJLSwnzkJQnqImQjSSARnnfv8+rRq0j3//qhXi6Cl4y/UBFOtoqpIpwxrRr+7hvTDkHv8OeINyoMZtTin4uYdin9PRlFw3dohlOREjedoMFdwysUGWfE8j2C5cglk0d9WkRee6DttX0q04t2HKICMk7gn1Znd2AO01R4jCEXU6U285GJtCN1x9qTqcABzN6omCKTan7R0NkiOw97tsZ0AAJZekYWkDBom5NePaa53AfO32B/nNL3BqoWdoPuAm5Ne2jl4CA0eXksbrBUw1Xs9h1xFIEmF5d8BcaLnEh9L5/ha4CUpR8KsEfFWwS78DscYFy2a/U/wL7zCYDAKv04ya+3RyAVHZH5TLDVxeRb+//lbRrt0DxD/W7KjAkE1Cl5ax9DAx/QXYidP3Yo1sEPX89qLytzMWw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(13003099007)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3ry1ALt/Zdl80tw3IFb0as3HAhB5LZMNnwE+odYM8Wc4QAY1twnW69ZvIpMDkCm7mVMj/iyR148c1ujTOQPecLbg7NV+3hPhcR/DUI0SvgpQ8UdBL5y0dPDm350NSr2Ek2iGmGJkTb0baxWBsTdYmSKCiA5ZNTZV4NPKMwSKL+bGxIapbszdZExkmhnlm+46NqSBc6PfxfOI+q3AhjjzfeWbXn6XpAl5dNfriqtiEjHOZ7N0e89CPz8XCw79AXxXN7oEuFhursjDRm6CwYCcxPh3I8VgN/tt2JOE5V0heH1vWCVD7dUQb8mq4IRsLwIyq0FlfTSW8DVuNnol30BBRtUkX+AqisZySeFcjG7KKUkY/XaZzXZMpQ5yzS/Z7NjAvEEW4yZ7ttsoypBoHgX+GBjAvBQ0gvLmPYol1ddI3JxVvAa7RYYOyd/LhLzY/N4X
X-Exchange-RoutingPolicyChecked:
	Gqx796pvYERm1MKPEkYvUH+Ojb3VQqGUqAFvE5/pbf7iXdek9tVn2413LSogYaC/hOeT9kcxrQbJ46ajGcvaa76pffF+DHbTln82rTPzVUk/iIFI0KGifl2k6YCCXz9Bi9fK6hd+2NHgMSO458bSl3E5bqM+rSQ+VUHF9dQ4YIJ1eSOZIwXFnEO51aoPGbJJjmdWhlDdswhgcmI8y02v9SJZVGQmPAZG5Ztq/QodoSKY6wn2KjFimiLnOzP+zqbJiSrtTC2vCRiXL3nuNqdbPxzDwvxu+G0yRaKEYIwA3XCkbPe76Ar/Z2EoyGeRr56bpgBdq3hKF/R1cYbVJwNTyg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 04:49:27.8942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd686f3-d589-49f2-2c1a-08df13ade3b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6641
X-Authority-Analysis: v=2.4 cv=FMaOVOos c=1 sm=1 tr=0 ts=6aaa1fdf cx=c_pps
 a=J0oTDZHsw5jmD/+vARdUUA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=zX8asw4sMeqpCrwHbpgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA1OSBTYWx0ZWRfX965Y0o//aDoa
 iji7OmopqL4yTayVPApPdyHLvoVjItMDPGjLUA5yYTBTzSUvjwSBIiGuWA79yysCBgYlrr6MPsb
 sFItfMiShcVNqEFaYnSkY3DHm5eYOLQoHK2mt0/kCGUJyqfb89FKhMqyZ1RnDqKkoKfCNSoLM+x
 iYjJfDlJgU112aw0J6LbhmUiT5LHBI4UCw6cLQACSI9DxeYAsWRISqIc5HS8mTTbFoKGsO1QYF3
 +pu0dmmiLeN98pOXZuDbgBrcucE6pSj5Eh6YOpLnrHi3W2oSFYB2Ae2UG2FfgNxwm1fYVWsJ5+7
 WDQLbILv3EN39RHEOPDvXWmCmLC6/PVJLk/pTX8AuYWMueetczWL6EpHsx1xuRhF2QIubXQKjIQ
 Drbht27B7t512MyGp7f7hNrAAvhrDNTPCSNAgl0f18x3aqXKjPvIa41C6J4pzzUXUJc0KKu92XG
 Sn+dhniLt8Td3/oLv+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA1OSBTYWx0ZWRfX4ZtH8YxLOhP3
 mbvnEHoglbUD9uB2FonCHk+hqTwXnrRXYfn62i2/y2rLzfcuE509KNeuYJfQcqaHIwEjo2VLxSZ
 ulSkcQeCrH+oPpLsdEilIRlpItU3T8c=
X-Proofpoint-ORIG-GUID: 0FvZXPdqDhFEpepnk6KvkFFhCueBDVt3
X-Proofpoint-GUID: 0FvZXPdqDhFEpepnk6KvkFFhCueBDVt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160059

Hey Judith,
Thanks for the series.

On 10/09/26 03:17, Judith Mendez wrote:
> This series fixes MMC pin input/output and pullup/pulldown settings
> across AM62*, AM62AX, and AM62LX boards.
>
> All patches have been tested on their appropriate SK & EVM boards.
> BeaglePlay and Pocketbeagle boards have also been tested.
>
> Changes since v3:
> - Include PIN_OUTPUT fixes for missing third-party boards as per Sashiko
>    review [0]
> - Split out squashed patches into separate commits as per Nishanth's
>    review [1]
>
> [0] https://lore.kernel.org/linux-devicetree/20260805230256.41AA61F000E9@smtp.kernel.org/
>      & https://lore.kernel.org/linux-devicetree/20260805230614.521AC1F000E9@smtp.kernel.org/
> [1] https://lore.kernel.org/linux-devicetree/20260904151335.fi5mvjpvziw2g3r2@exemption/
>
> Link to v1:
> https://lore.kernel.org/linux-devicetree/20260729195958.671147-1-jm@ti.com/
> Link to v2:
> https://lore.kernel.org/linux-devicetree/20260805004821.416613-1-jm@ti.com/
> Link to v3:
> https://lore.kernel.org/linux-devicetree/20260805225438.464184-1-jm@ti.com/
>
> Judith Mendez (15):
>    arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
>    arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for
>      MMC0
>    arm64: dts: ti: k3-am62a7-sk: Set eMMC clock pin as OUTPUT
>    arm64: dts: ti: k3-am62a7-sk: Set SD clock pin as OUTPUT
>    arm64: dts: ti: k3-am62a-phycore-som: Set eMMC clock pin as OUTPUT
>    arm64: dts: ti: k3-am62-lp-sk: Set eMMC clock pins as OUTPUT
>    arm64: dts: ti: k3-am62-pocketbeagle2: Set SD clock pin as OUTPUT
>    arm64: dts: ti: k3-am625-beagleplay: Set MMC clock pins as OUTPUT
>    arm64: dts: ti: k3-am62x-sk-common: Set SD clock pin as OUTPUT
>    arm64: dts: ti: k3-am625-sk-common: Set eMMC clock pin as OUTPUT
>    arm64: dts: ti: k3-am62-phycore-som: Set eMMC clock pin as OUTPUT
>    arm64: dts: ti: k3-am625-tqma62xx: Set MMC clock pins as OUTPUT
>    arm64: dts: ti: k3-am625-var-som-symphony: Set SD clock pins as OUTPUT
>    arm64: dts: ti: k3-am625-var-som: Set MMC clock pins as OUTPUT
>    arm64: dts: ti: k3-am62x-phyboard-lyra: Set SD clock pin as OUTPUT
>
>   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts             | 2 +-
>   arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi      | 2 +-
>   arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts     | 2 +-
>   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts       | 6 +++---
>   arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi       | 2 +-
>   arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 4 ++--
>   arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi        | 2 +-
>   arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts | 2 +-
>   arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi         | 4 ++--
>   arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 2 +-
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 5 ++---
>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts             | 4 ++--
>   arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi   | 2 +-
>   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi       | 2 +-
>   14 files changed, 20 insertions(+), 21 deletions(-)


For the whole series:
Reviewed-by: Moteen Shah <m-shah@ti.com>

Regards,
Moteen

