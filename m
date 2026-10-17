Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D22264AB;
	Sat, 17 Oct 2026 07:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792220783; cv=fail; b=McRMGHM+76+QHzzeGhKB5FBYX5zy5DhKnGS4Rrc/HCOwqkhbfbMNy8sex3IWYk/8KoyzthdqTlbgq4oesrOhrXGaJa50aLw9X2kHbAu6qC4V4a9E+WCnA1Yw3Cp3axFKAv37QyjoTLshXq90h42A3AlOp01eN2vT8jNto5A9EUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792220783; c=relaxed/simple;
	bh=t33hCKA5NHudmrg5SpG39zmDz0Spv1SgrD0LnGtpEA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U5bguNVnKNTTYvlB2XfHZG04EhR8M0lB9Jh78BPqM7RC60/OJKQH4NvBthRxH8DsA4rJAvMVGc2gGAeNzOOdcQhYsaOCW88D4dlmnjbcG6q8bF3ZzOkH84yX+NChnj04fiXVcvZ9o3iZcDUGIMkAleE+vCM3qYaAWiGOp1+tWfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aUKktkU4; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ZoPx4Z4+; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aUKktkU4";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ZoPx4Z4+"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69H6meNs1727892;
	Sat, 17 Oct 2026 02:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/7mkX/hQtZFJWfhK1hpS9CmffxcOYU1H5Yj8uvhwN
	lg=; b=aUKktkU4XIeEbN6OAuK7CCBAFoefiQBCjwP7s5FEdvbdxgZlZObunZZfX
	T6e+xSPdRwli+d8WpPJ/4iqOYCatEI07ge/S+b46gwnneWLVHgyT84PFNHRckRlW
	c2oxQBhZWUCXdyHDQGF6upA05mFxi7RqjfzuYjkLResR4hyA3kCAZkrhSEixowLv
	mjZgGmVla8a5FAtHmAC3kJzUACbr56jOrnbtSh2R0b7k2Cnf77WmbgwmUmvuIm7c
	bcKzyjNr01+YinUJpWkCzDgCaZALiS5EuRUx5slkZ/tmmGGkl3Oha0wgygCf8YZO
	+triNiO6CT/ILT1vROdACM2bdSZ7Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011027.outbound.protection.outlook.com [40.107.208.27])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hbn503wfp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 Oct 2026 02:06:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUhHbXiij03uGCelVetsaKKw7SUZOmcDlCpezK3NiyAUxgpWxJ3FriqquxESSIhbKmY0iu8Uvbsjvod5LQgtbZBQ+9NZuQ+bbpDj903+kK2n46SSXqc4rc1xQYNM45UnfzV49UNfPWjVP3k71VofzWSR/qFJ/ddpAjbr+F61sSIBS47PxciMthW/uTxs/98AZCbnIBQ0AVpZFB3J3M5ICC5pVlbUdmlm3HeujsufMEUl7tjyY1m/w7OpaRXjXkg2wE7GQjaIQDx7/wYoSaXibxTFZFgnpRx80BPkRhiCmIaDy+NkCJ/CHT+EwAyP84oZPS7qgqO/lCk+ucvO2ayXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7mkX/hQtZFJWfhK1hpS9CmffxcOYU1H5Yj8uvhwNlg=;
 b=n3UuWd5y/YPSqwJ8G0VcPTFIEeXQVupPg4ahIsesNWS3pwIBUq6RRshLgpqiLvLuf0j2q544cQVeEXwK1FoJa286LSH0PXJFYbbZjNBZbKBDtJ5rlY7PkgXqpPfLOkvNvNV2keWDppn4PN4JfCyr8S2C6JGeG04+caG28arkyC2iZ4r8JvT9ZSG7LUz0gyP9uEUAENoKeGnJFiLYJN17OCgr8rmsD8PdB2KcX/wybjMcRodQoU42stgGOsWL6sifZ4PW9YCcvjeM5bm2XWGAy77M0xalwOi5S1IUVZVqtrnfxhKLu7x4jbgzG3lEvxqrnGGGpqoxXA+8AYdbrnFLJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7mkX/hQtZFJWfhK1hpS9CmffxcOYU1H5Yj8uvhwNlg=;
 b=ZoPx4Z4+/LlnaG1y2tav1e4u5GYHowfUOqTedRJrdeiGbYtV6LUiU+l/6WWqx4PSm0ToyLfAZk90GWZVlQoR7obQOUVLXBTU9f9LHwqn+SEZD5dDraHgFxLTxElCBamhmZvu6TXN6+45+EAtharJ3+d6DCPz1ccvCcS5+aaZ7Po=
Received: from SJ0PR03CA0299.namprd03.prod.outlook.com (2603:10b6:a03:39e::34)
 by SJ0PR10MB998058.namprd10.prod.outlook.com (2603:10b6:a03:404::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.12; Sat, 17 Oct
 2026 07:06:02 +0000
Received: from MWH0EPF000D8950.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::37) by SJ0PR03CA0299.outlook.office365.com
 (2603:10b6:a03:39e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Sat,
 17 Oct 2026 07:06:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000D8950.mail.protection.outlook.com (10.167.249.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 07:06:00 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 17 Oct
 2026 02:05:35 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 17 Oct
 2026 02:05:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 17 Oct 2026 02:05:35 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69H75UWZ3958134;
	Sat, 17 Oct 2026 02:05:30 -0500
Message-ID: <702b80bc-23b1-4057-b613-aa5aef2c8c7a@ti.com>
Date: Sat, 17 Oct 2026 12:35:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Reserve
 memory for LPM metadata
To: "Richard Genoud (TI)" <richard.genoud@bootlin.com>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Abhash
 Kumar" <a-kumar2@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>,
        Thomas Richard
	<thomas.richard@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <prao@ti.com>
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
 <20260921145325.300025-6-richard.genoud@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260921145325.300025-6-richard.genoud@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D8950:EE_|SJ0PR10MB998058:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d2980b-26d8-4b2f-345d-08df2c1d19e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|7416014|376014|36860700016|6133799003|18002099003|22082099003|10067099003|13003099007|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CfpWD/DixXsByFyYfGlucET/E0WiCWuEulAiMhSwVHbLLYjYXQpFO1V3i8rXTw6LBgUhEwXyFnwd/FIqj6vgyzwOyU2BZIoJrWb7cZscQ79ipEs/K96sU0j+lkXhhsuvlyZ+UTZfvF4FYoGq9hVNI278uYVxABn/0U5oPWweB8qDIN+loIMu+W4gGRBCOa8TNFFaRiLPqsCBvllljfcBvG09fQTT4TNtR2zOb1kIudXfKE0/pj6YbCm/xZI94E3n91O87cxAJOn+UPQy/EuK0pB5kg3wsBnXtvElcefAyFfD+RLMMPRS3baeoMLOxO4y+b9n3PE/gqs4wvhe58ejXwRW+1HE3AiKy75McgFJHhWnT3wNbMlBRp0p8vOHmKLA4qHsz9awtIbNLVxLpqHjIyoiSRvAPITPZcaYn8pS8yj4BkApg8ngrhMPXeP+pwrqAqml9QZEhZQyDMw72LrLbylsWDU2707bN66nPTEnOMazwIbE6h7NIf43BOW+TKu+gBn6/POHiWs+407eQuXF9ELFqAf4Ynr7V5kghSLIJpS7y35Nf+aFXXn5wfEQsJgHL/C4earsRF9wTnpdS6RmRZJj9Nq06I0awJa6C7/jbR++Vy7GK7IuHq7/1+gVk75iKJUIoo13phSDlz4iH9/5Hw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(7416014)(376014)(36860700016)(6133799003)(18002099003)(22082099003)(10067099003)(13003099007)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yUVHNC2Qrv2yXNC/aip7tELgZWsX2gZ7Mid4eu0ChOMxzyu4Lu7kYCRYHbQsr8Z4VXr3SgSvB+rng+9DCY/VEeFLrNsa/ySKw60fwdfugVNtEmWr8VP+mNh4E8OfuOy0Hl21PBZXqvxK12g+di6dJzSodZ/mE/BIpTAZanTUZuWLou2maRJL+oxl5nnxiGm7GzvXHu/y9608eD4qd6EbIZw9sBNXR3ses9d+iYbJat7xeNb5/c5P0rLrP/8MSe/S4d+/snbyOrjS0xS2e0oGijcq5W3X7KyOxIvDatO4QpCJ3j/jfivZgB/xajf0a1lt/E2/vUbckY6mCLHJawkc+rOhlKMlZwX6bEjRb07o8ewxZG8F1g4RdMaaVwuB3xvBzeH5YcFBE4ZS284XBq772NdIwfF8SO6XnWl/oi3gyJk4ikaZb4yKRHjOzUTkkvtQ
X-Exchange-RoutingPolicyChecked:
	TD2Q/PB3Cn3hmtJfNQlechxgtSZvaRlrDjk6YW6xkTRaNSvISTWSlTgguPgC/zwWFZy2gQvuP9VIhr7IBZXcinRPiUcNEN4ZOVC4DqGqRIdHmzOMS3IFflOS+EjND+BP9WXWlzWBFYLLhR20eEU12/zWRummGWba06Y6FRnjgAXhpbhn49Z27h3Cb9Gh7X3Jtg79hqzXh+i2G4BMZFoXXnC+Uhoi07D9bhZw/j14u8dsgQ1CYdVqUF84tHeNo9CAutE9TEGDidTPmLJnJG63Cf0p8vhej8vMz1Hy/xygBxoJ+ApAs6Pxowwub8hHNmfNej2fs2JrOTTNVTy9I1BUXw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 07:06:00.8942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d2980b-26d8-4b2f-345d-08df2c1d19e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000D8950.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB998058
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAyNiBTYWx0ZWRfX3eDpmkYLbKYu
 1q6cJE+ma2z0lkWHiXOfkitmTFaIiAWpo0DdpsT/Tsjcj8RW6oHawK9KaKdNnIi/P1oKy+4QYpW
 MhTQI5ZmhMlamiPyaTRXiiLexYJtAYY=
X-Proofpoint-ORIG-GUID: 3MCL3hVOS2LfhXBL-ICHnGN5bnRnRy93
X-Proofpoint-GUID: 3MCL3hVOS2LfhXBL-ICHnGN5bnRnRy93
X-Authority-Analysis: v=2.4 cv=IuOL47/g c=1 sm=1 tr=0 ts=6ad31e5f cx=c_pps
 a=iNm6N7YJuWyXLwPauF+ZSw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=P-IC7800AAAA:8
 a=Xnnt4wKtx2F-ehOQiZQA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAyNiBTYWx0ZWRfXzHgk0V+VwW0w
 jIPXIas5hzulpOuyUKUA9ha1Qd4QTuSU4y+wz++hVuM2s3drOnASvwqwZj+Z1BlqedNlRwVXbZV
 aQL24fdzdJ2EqyosdmP5716LKynSbK0UkkGpg/o5xWYFMiSUix6KLbRP6nE38o38b8RquCBi5XY
 /a6HICz3SPy/HtM63hMSxJeCyMEpKU0fK93wo+3+qQbTttZyqdhy/83DXZUdKRoc7fafyR/f0HN
 5JkRG/aifBBJ8TZYtk3wZkwKncnH6AIIbIohUYyL6wHMjF4sSUBTqpZd9kCw/jgrgw83O4aJPZb
 msU4NmC2ExzqQp2ye9EdIsXSj0as49UEHvU9nDm2WV0gcuNCFBMg0PYpFGVm+/vqtPf2khGBYew
 vYl0gc50YDUGRPxToKdk7hyY/KsEmW2NwzDEoYYJ5WKVsig5nxwBWPQWX6u4roKbE/yCQW2VYtU
 pACW+cyU3FCCzIbiQeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170026



On 9/21/2026 8:23 PM, Richard Genoud (TI) wrote:
> Declare a carveout memory region to store LPM metadata on J784S4.
> 
> For Jacinto devices, this memory region is needed for saving ATF context
> and the certificate information of ATF and OPTEE and DM image. This LPM
> metadata area is firewalled to be accessed only by TIFS.
> 
> U-Boot R5 SPL/TIFS will use this area to save and restore:
> - ATF context
> - ATF certificate information
> - OPTEE certificate information
> - DM image (which has been copied in memory at boot time by U-Boot
>   R5-SPL)
> 
> At resume, U-Boot R5 SPL is executed and detects that the board is
> resuming (with a flag set in the PMIC), then it:
> - brings out of retention the DDR
> - retrieves the LPM memory region from DTS
> - authenticates certificates from LPM memory region and applies firewalls
> - asks TIFS to restore TFA and its own minimal context
> - starts TFA on remote proc
> - loads back DM image from memory and jumps to DM
> 
> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
> 
> As this is used by U-Boot SPL, bootph-pre-ram is added and the device is
> enabled.
> 
> NB: This memory region is not part of DM memory (which is not retained
> at suspend)
> 
> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
> ---
>  .../boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
> index 81b508b9b05e..1c0c1533f0a3 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
> @@ -17,6 +17,12 @@ c71_3_memory_region: memory@ab100000 {
>  		reg = <0x00 0xab100000 0x00 0xf00000>;
>  		no-map;
>  	};
> +
> +	lpm_memory_region: memory@ac000000 {
> +		reg = <0x00 0xac000000 0x00 0x00300000>;
> +		no-map;
> +		bootph-pre-ram;
> +	};

Could you move this carveout near to optee
0x9E500000 to 0x9E800000 as LPM memory,

Since 0xa***_**** is used by firmware and this is just place-holder for
lpm meta data.

Also better to move this k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
file as these two SOCs are same and uses same map

Thanks
Udit


>  };
>  
>  &mailbox0_cluster5 {
> @@ -27,6 +33,15 @@ mbox_c71_3: mbox-c71-3 {
>  	};
>  };
>  
> +&mcu_r5fss0_core0 {
> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>,
> +			<&lpm_memory_region>;
> +	memory-region-names = "dma", "firmware", "lpm-metadata";
> +	bootph-pre-ram;
> +	status = "okay";
> +};
> +
>  &c71_3 {
>  	mboxes = <&mailbox0_cluster5 &mbox_c71_3>;
>  	memory-region = <&c71_3_dma_memory_region>,

