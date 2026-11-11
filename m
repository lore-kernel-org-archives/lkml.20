Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389314;
	b=065OSX3QcyHYtcpYs1bvSA5cDYTquHA9dwTq3hK42bF9VtaLxVaZne4nVfi7RZViBpV1
	 vOEdvZf7O92+FvwWk+YiuVMsaJM+t/mEdMKWiV6AJCd7VTwzjV8qv8bI6Q7jc9VXTKKsE
	 8ALEgPOTS8GWmPStOJlGE5eNaZWPtkjyVOrgzajCTwZQhw3X5MJTX3HSn5DtGVkKOha/n
	 QMNcD1jzpWEcxWvpNkFe8ik6uhmQYfCYwLttdFeUjW0wKXnpqYtXN1+6cOop4rdhxjo1X
	 o9fVt+/6tiaksZ7lwxhi0PK6i5ys1rC5zHJPwOGumSYE5cPJP1Us8RM4silg73fN3Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N38WL2cDED+BMLnVLZaB4uyQv9YUWfzkr2A9IsBZa0Q=;
	b=Vkhk5Mor9sAlSZZk+VkEqDHbkj1nUEqL5ZjPGl7HRNCWWLoGtQwetmRgAYVXXPRnWcaJ
	 4vQ8PlwfYwQBdwE4TDzie3ii9PilPyxBZ1RYN/2mHgP3gtqdyPpeVFYDzTg4A6Ye45oXU
	 MTZ5Ta0up79kcu7gCErtm3wzN8ZWCbYbdeco5DFxyUVQzMjeabtU15taIBP3WiQphZ4V+
	 VfJMeVD1dDCmCE+7CKlrLXHSHk48UB16Vl/iHukYMZ7OP4yMqbrVDvMfoZdwMViLOommC
	 fq/U9XoPvT3h1u+NN8CJLTSzDFAPUkpe+hVhzbomhXoEm57EALKVO6LVp3WCoumml7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=FDBY0Se0;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=aF0W7tMX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E64606A31C;
	Wed, 11 Nov 2026 09:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E64606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=FDBY0Se0;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=aF0W7tMX
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AB7HtY3941870;
	Wed, 11 Nov 2026 03:28:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=N38WL2cDED+BMLnVLZaB4uyQv9YUWfzkr2A9IsBZa
	0Q=; b=FDBY0Se069uSTQqVzdyJeTjsbBV0uzFc8wSRV0jUt8ss/QAExANXiZdii
	FFsnYCJ7Op6lRjIXZT5FsC14lftPBN0V1ANh4MYrJXe1Z02XdYsV3WpdmbagUnbU
	oCI8jSVmUjPs78Ga4XmbZsmo7RtqH43u3mlopIKSOFd5uOFZR6SryGQklxoJGEuu
	jn4ZDUdAifVdd54X3qRBPahxxUGZhvSZ3Vs94xz9peABqyknf+1EUal/zWWBz9lt
	Z3qc5yRbJkBIZfDC+G3h3QyJJkY3yui21PPEClAx+WKZ+Kq5zt9n9qQDIOy9R7gy
	fzgp6ZVtg4LRsbUdRbHI1UIU567IA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011036.outbound.protection.outlook.com [40.93.194.36])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hveygt6pu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 03:28:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww1XjvPC+J1/mbGXsdmkz2gLZfK4IEdWNdw0Q0jrpapR+T4PcOvr98DG/JbtXF48QWzlhw7Hsqls0pQLPeJBgvMTMGHHOqkLRIJeYDQhbhvFcnK53gBSFNphFPlSr/q5zeX0PC5xpOO3TYaGD86XtGHcpILyKo+PT3Sc1kINUgOQ23vB/61IxaGwPCrpP13gMMXfNr5wRYC13FMLSn1QIgCoRbp2e0rAxsZ6tGWS8rf21gfdCWCNYcGuN1M6yuLn5GZDoPQrtalYB3I4wc+Pfgy6Ug2jbMNf94AtC/IGgJLCiW2nJaXaCsBFolbEpTqAXU5+crjDY0fq8EXjeS1Qqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N38WL2cDED+BMLnVLZaB4uyQv9YUWfzkr2A9IsBZa0Q=;
 b=JpQ9hdj2r3XepPq9Fckxy49xqhIbatZAV0eqTB++Mra5DgFSWVCpBZXchAwMeo+SbMuKihQiX+rJO85vc5SSD7VGOWmxxf1c/dmNva9KWj5GWoSfqkyGFP07GgG6WAZ7e0norBr8nuvU3cyplHN5melLYwy274XrlMg9/hstjbK7eP6qyaqZ3E+VaevrSHWsf5xp6WPa1PyFLfVIx2kCsjdicCSpIy0ngn53c8b++ljhC9jFrJklvPXSVNcBZmHwmJ99sAbMdnBls4HCybHp735N9AAb1jT1gICAHzTkLDaWgLSMMiLa0EFWUXhaCHzLHfk1CJ+2aEEkJfagt+hEvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N38WL2cDED+BMLnVLZaB4uyQv9YUWfzkr2A9IsBZa0Q=;
 b=aF0W7tMXAz4Kun/ngQBHNq9jzW2hk0OZoKyJG3e+vaj6ppd7qoCw5wTtdD/ELDz/jgLE2AoPDehoNlIwYhnYFBcBg79JhMjcf1ydy/NTDoGK/jzfFMXQY40lsr/XllzNYpfy6ufxGr7/1F2L1QPPRP8rXjyLGm/JA1fStFz0X5M=
Received: from BN9PR03CA0422.namprd03.prod.outlook.com (2603:10b6:408:113::7)
 by DS0PR10MB6173.namprd10.prod.outlook.com (2603:10b6:8:c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 09:28:10 +0000
Received: from BN3PEPF00022BD7.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::8e) by BN9PR03CA0422.outlook.office365.com
 (2603:10b6:408:113::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:28:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BD7.mail.protection.outlook.com (10.167.248.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:28:08 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 03:27:32 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 03:27:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 03:27:32 -0600
Received: from [172.24.21.188] (lt5cg60819vj.dhcp.ti.com [172.24.21.188])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AB9RRgL3630892;
	Wed, 11 Nov 2026 03:27:28 -0600
Message-ID: <bece7c70-dc20-4ccd-a7c0-9890ea535c07@ti.com>
Date: Wed, 11 Nov 2026 14:57:27 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: ti:
 k3-j784s4-j742s2-ti-ipc-firmware-common: Reserve memory for LPM metadata
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
        <linux-kernel@vger.kernel.org>, <prao@ti.com>, <u-kumar1@ti.com>
References: <20261021080947.3747284-1-richard.genoud@bootlin.com>
 <20261021080947.3747284-6-richard.genoud@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20261021080947.3747284-6-richard.genoud@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD7:EE_|DS0PR10MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fb6d59-f263-4c56-a005-08df3fd61940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|7416014|23010399003|18002099003|22082099003|6133799003|10067099003|4143699003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|56012099006|261009223027099003|261022115727099003|261022075727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	JNXUTCGo9LNbqDSs8PXrj0jYvnPn05liYiHdsRSrT/1WUA+tOjrnS+CdoImyc7omWw51xNj72Imxu8CdAwBVHH+Z7TnqFo3hKITd6+wM5LjD3lXcLkE5sf7BW1fB5DJ/w5GtZlSpkELx+CkpyJIRtilliLfjxL4e1dTlQKgI5U/7CKpxz3bTlhiQxfVyxazUA2BmRvqiZkwNjiwcu7/th5eYGNZa7UZTUfG+Fxj+amxc7f7dJCqSmgjo+AK4AtRbO9brq5Q9QBiQDt8WADd8CEpsMZFKEtgqDncSQ5QQbhPDe42nnN4cKBa0TFkqDVNOR2v8GTFcuWBtJ8twC5Q2BVbkt37iUTd2ueeP+uUCh/QHXuVVxGECMJOen5cr49eRtLJtKUJ0jh1JH+MOOzeO+9T+bqXUpWAdwdVOijWdFn3SX+ThEwrLC36HzFKekaGorqK7AihVwXjJOxJVcH8ToTPQEhEdVf+QB6m/ZCTiD+Ul/7FhkyowrisI9BM1demhyUhnR5YhMoiH6urLeJnNMfrDIdecSov9ry9qdRW9Fr/7+GMFj/TEg6oTtPoLhFSMnLTHHb94VhqN1GGE4+ExN9/LfSQvbAnYpmmiSn65Xi/3aioOpZFpoUCFRG8nA3M/gtFBwz3UuykVKzmFE/YLCDFM6gFOV0KJSicn0vEaLQVOxrMcPssVLbA5S3PSyVVOCTJhqLgbHR76WJmrXuTeuw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(7416014)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(4143699003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003)(261022115727099003)(261022075727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gKoHuGZ3z/L2TvAW1uGDDUsAoefCjSxvRDd9cq9S4T5Y2Jv9PR3ZwAxmtCh8Uex/VyL/cB3DhkdU3V5QBMJqWYiDV8lVu7pv4RqNoaGGEDijQ6b/ka2CV66TlqpmUnO46k4lHFGbsAmlstBYqPuxoHOD/YZ62ryyHZfPs6OCHFwCc5nBefwnzRYdQIs/USLxpbGRXgESxIjMhr19Tdb6w4GCHmYIBrgvCIb0Mf4rHBtMEFFJMs0U8blVQgnfo3QcB4243GrSH0tCH+s/KEYf+X12OQK7k+G7w+TLbP5b//0SuFv22ThN4UwktG6L8MMH2wCIoYi+j4C68Xw0O3J5ZD1Iw90vGH+LLfPo5RgbobjdX/mX+/TGGt+khQUXj1Bgn96YYQk8tuMCdY0BHVm2ld6zN/wKg6Cr7lzcnLwN1BXQnNLTEzxu8Am8OmmHr57a
X-Exchange-RoutingPolicyChecked:
	LJ7dEiison/KHhlWfuQ2GYZWhMMuVdVTgIxVbvYZuhKAldv+gvxMu5pptQNbRjE7g9sY222PWTyhpAem4G6p8VUKb2RaDcYB4cwbxkwtP+6KdDw6D1V7nwSu/RKL9c5Lbu7/WMhuyyxydvI5VghMTbhbn7lfD+iKD1OVjknvrIsBiT0VNa8QQQZk15iTEXEhkK+iSNgfit0Isukc/CqOBAUlwHUgEjnc1Rjio+cd9STkPZjUWzKq3hHy4mzgfEKw+hSmzLl9VargSWF8rMEIFjd8WQaNhnGjKg72nFMSExs2E+AAPSB2zmIslcq+sQ+b4CEDU1Yq4ruT9S1sO1s1dg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:28:08.7973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fb6d59-f263-4c56-a005-08df3fd61940
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6173
X-Proofpoint-GUID: EJ4PH45vO_V2HDkmdtsryZm-f4GHVLad
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNyBTYWx0ZWRfX+Ika8DfIAUse
 gTeaDatDYCO7J1UMBFZ+LGV5aM4VRelLE9xh+gEmfpJei4xLigywmJcU1xRL5m+CQw+aLIEgOZM
 wZtLIgmDWLIQLHUXjMHtYLFb15BcDc8=
X-Proofpoint-ORIG-GUID: EJ4PH45vO_V2HDkmdtsryZm-f4GHVLad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNyBTYWx0ZWRfXzpjaDeJIZREn
 1J2guRKh3dAX0eXO36Hx6fCvY9jLrqlqG3ErcuebMjHL5MSzvFEBtixflYwN9Dk0fQiTCFRgVsi
 uVGXLJpeywuo9P6LoK2pufrZBq2RmXoHOwsSUxe+ZC/Wp6egM0qNA3x3ZWLfvlVbPhOPcJWi1tg
 msoQGeVOWZs/tDaC8rT3LFYpZwgaBuNs0oQYzjV76QiptTPjCbClB1Rnddn9EfJDN+1RfRSnV3q
 Tst/oLcXqCH2WUcMB3H6P3Jk89LwwGTs3XHMvZh9FevNiGG4Qc8MoIQEtdWDxmrB8HM/dntrppy
 3oBuRHlPS/laNi2VCUJt99gb9u2Gd/I8tRO4JnvFYwDojwYcYIXzNiR4IndUOBCuAfAKA9y35rY
 UMn23op/Bl2TqMq7/ul0B0wbkALlI+xNbHvEyGB0UiTYrPHc6DExgWL5ubKPmiJPqzRCdhnp2Ow
 HJpXBqesL12gq1XuR1A==
X-Authority-Analysis: v=2.4 cv=FpaQbGrq c=1 sm=1 tr=0 ts=6af4352d cx=c_pps
 a=xjw7YmzweVlW3QpdpNkTiQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=P-IC7800AAAA:8
 a=JHe-A2_do4W1zIJIt20A:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110037



On 10/21/2026 1:39 PM, Richard Genoud (TI) wrote:
> Declare a carveout memory region to store LPM metadata on J784S4 and
> J742S2.
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
> As this is used by U-Boot SPL, bootph-pre-ram is added.
> 
> NB: This memory region is not part of DM memory (which is not retained
> at suspend)
> 
> Suggested-by: Udit Kumar <u-kumar1@ti.com>
> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
> ---
>  .../ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi  | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
> index d08fd3ff8a89..51b2d11ab5d6 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
> @@ -6,6 +6,12 @@
>   */
>  
>  &reserved_memory {
> +	lpm_memory_region: memory@9e500000 {
> +		reg = <0x00 0x9e500000 0x00 0x00300000>;
> +		no-map;
> +		bootph-pre-ram;
> +	};
> +
>  	mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
>  		compatible = "shared-dma-pool";
>  		reg = <0x00 0xa1000000 0x00 0x100000>;
> @@ -261,8 +267,10 @@ &mcu_r5fss0_core0 {
>  	status = "okay";
>  	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
>  	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> -			<&mcu_r5fss0_core0_memory_region>;
> -	memory-region-names = "dma", "firmware";
> +			<&mcu_r5fss0_core0_memory_region>,
> +			<&lpm_memory_region>;
> +	memory-region-names = "dma", "firmware", "lpm-metadata";
> +	bootph-pre-ram;


Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>  };
>  
>  &mcu_r5fss0_core1 {

