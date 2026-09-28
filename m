Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641D1E260C;
	Mon, 28 Sep 2026 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790627636; cv=fail; b=aFVlfMododw1vxxAunvxk9AdHTq2Zlq4SQmGJ/tQiCmQpDaSNnPmigqPK1BuZF3XZSwuzUd7acp8J3gnzjQbq0y34tIxTvONpdt1JpufzN9nYToh+tmZD4mm7qd5kcYAzYOTDhWSkhsjCYdFWgPllKhEFHokT6qEAqAcRjpfhIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790627636; c=relaxed/simple;
	bh=wohc0AfnLRaKR3Sj6ST7h77A8mmuoO/MIgH7a/86VkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=lIEgG3nEiayt7Ji/T+pr+RFI0vOUAibR6KelszsBGsWnKo68FFYf+bgnyoCh0bbi3xg5NNwCKWYAPARMgqaubRi9P3KVxuKHslqCMvmftXUP3MJpYrx0jBMDDKhtCZceyW4wBAYfuUaex57u8NrPKHPAUUtMmg/PZCblrHBr8V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=TSLPuS5E; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=IRGRSfvQ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="TSLPuS5E";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="IRGRSfvQ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SJq8FL2844922;
	Mon, 28 Sep 2026 15:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=bICb/K6TSnRng
	mGiic+tpZoZU6edlC/ZhmPWqSKD/uE=; b=TSLPuS5Eyc3xwU9yoHTrJcnJ6GYL0
	/XJu2N4L/bZqTcccRulXXBzfdhAk7GKTh7PYR9pPvNelGZY54nytVHDYb9YYlqe2
	0wd7wNufnNdivPBrEsJD/bzon2U04XYlc+4J6Y9XY9ZCM0y/NyCTzCRqE0nSE7aQ
	IOY0QdfoRsHiWoCzS6dwsqo+qvAS0OPkVOe0BzDg+AQPwNvSn3sEJBN+SI2o16xJ
	zyP/HtPxonNlsnqks4a5ax1At1PIxV31+1pbTehBgo6EZ3uRUnHlyhV1Lw58k+Mj
	4ssHf9f57ZtRJQ9yr4K+0hbC4zvKNT1e9fiiD3sAxP+11FZ2CVjf3kW3g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013049.outbound.protection.outlook.com [40.107.201.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5ru5w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 15:33:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l610xd/zxV38xm6DtV4pLw09Q/2lLJIHZdxq9B9UhgYamdZ41Fh56YwOaXR5zfcFGI3Ug6XfaeZaE504MjLOFca2NEnGNh76YaFm6Y1UZL6A8Fnw/sEqkLUlnzipAtzYzj2vka4B+BTD5uJih34h6BJlUteXuZ0nZNvGuJVKUu9fFB0XcuKUJ6d9lH9+SRgne7blmpRdOs4gZ7xEtO1nXOxjP52sszudVzD7ZoR2tbesb2CdfYnpzpHpzp86R/PPBtDlzvC1i2u9mXMbH4EIeSlQUG01gXj5zTvMEOTyd6Kyvz8NzGgraIhM0S4lmOpKcNJ9NXShyzKpEfsR6xkPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bICb/K6TSnRngmGiic+tpZoZU6edlC/ZhmPWqSKD/uE=;
 b=mvWeP5F3Ui7IhKR4m+hXfp1R9pcMiBMrc6IsAs5mr1IcCIHzn64YPvDMZc5JpIvX3mZN7Bg+7wiZGp+6xEbboql748hRpUYU/jiq594yGN4r5OK7HLx4q4wBSlDT+l9hNzlXKg9qIcEgQ70nNRKDM/xIFLn3/8uoFK6IeTvN+5a3JovIb2VC/DtA0hepoEugdixgLmMsIjdrIkuv9hUosFBa5lCspIDmaELOcPibP1SMT6Se3d0r3Nn0dBbfHvyFG2ThfqHIbBgOXE3vEnAuLGeyfJhH4XE4U+spMNW6baBtlRjqCYb0AFW9/JOf2fhDM6y+gpIxHOhRJplqa65g3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bICb/K6TSnRngmGiic+tpZoZU6edlC/ZhmPWqSKD/uE=;
 b=IRGRSfvQwmsntF+ABVzlUN11E7Sgptp6Zded+dQjZ75a7satEGQLmQ3B76ShoktMK0VpOcMCmgLYHOpJQSvocaYuMN7j+BEY6zDDo52X8IbtjswVWqPrYAg6GBR/VWfy48DE1ErnHRIp+9C217ZUdiM9dsvhM6jZCbB44jTEl5s=
Received: from BN1PR13CA0002.namprd13.prod.outlook.com (2603:10b6:408:e2::7)
 by CH3PR10MB6833.namprd10.prod.outlook.com (2603:10b6:610:150::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 20:33:39 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:e2:cafe::49) by BN1PR13CA0002.outlook.office365.com
 (2603:10b6:408:e2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Mon,
 28 Sep 2026 20:33:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 20:33:37 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 15:33:03 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 15:33:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 15:33:03 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SKX3hA3832939;
	Mon, 28 Sep 2026 15:33:03 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Mon, 28 Sep 2026 15:33:03 -0500
Subject: [PATCH] ARM: dts: microchip: at91-kizbox3-hs: consolidate
 gpio-keys pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-gpio-dt-binding-fix-v1-1-552e4b324a36@ti.com>
X-B4-Tracking: v=1; b=H4sIAP7OumoC/x2MQQqAMAzAviI9W5gVxPkV8eBsnb1ssokIsr87P
 CaQvJAlqWSYmheS3Jo1hgpd28B2rMELKlcGMjQYSyP6UyPyhU4Da/C464OWLQn1Io4N1PJMUvV
 /nZdSPs2F6GhlAAAA
X-Change-ID: 20260928-gpio-dt-binding-fix-9d92e23eebd0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790627583; l=1834;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=wohc0AfnLRaKR3Sj6ST7h77A8mmuoO/MIgH7a/86VkU=;
 b=930AtfSkstd6p2QiAfEF57xSIgOxatp1c8lDbe8I4NQ4YUVmOmCpyMCFo1EatHSYBeilrGeBs
 5y/o1CRaXDEAlfYG3CZStmyHnpriThp9DavcDeLghwtAPexF6nOQcAL
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|CH3PR10MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a25c753-d624-417a-b8f6-08df1d9fc671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U/8Sm+xqgFx3vE+EtzhIbh/uF7q4+pBMB0yShk9gv0vBPKTsB1Ft7NUMzBcdoqC0aKU8fP1CrvWmK9AeuyvA3DNlc0q+RMFauTljArAio02S+21FAsxYULbez3z2ck6TzxVFHPC994Nern3MplyhHJTDLfMxdfAMh6lDLUcps2qi5Oz6kS2ft7DJngxuOh6CU272SXje5rBM0IkLz04Is7EJKJXiY4Np1uIT8gGAHg4mlcM2zJIAl8zbFwMwIEyhODGd+ZkllNDYnrDuAFxvcH9r41mtPqTYUoF3B3r0pPBsNtcKbXUMuVUs6lu1T15J7Ty6HwEDDMrAPXAsSoMCdIwD3bfxLWnj8Gda6WIgJji4Ef+fOg15ChVGjrhkGzKYCAqu29euT0IwRGW3msqtEwhSnMMCp8rfLn7Dp99CUUxw0sBbezzO2uzLWrKESajJ33oIJseISd1edOLX1s/GhclpXxwuUgLIXQKYJ/rkW4AC9ELx0JmXfiUx7ZgfVyvb64TvxHHks5Q8CAVBK1RTVte9CG1H4za6Kn+vHZJhDv4krOFF8rOtgIBZdY3iZ6Yd2ye3YZPlLjuJrHWB1ZaBUVOqRSOTc45Kr0Jy9enxt1t0y64BQphSZerXicL0mxh9p74JOS34mRHKIXG2XX8qjIrP3uQBEAKJgg9BFKJWrE+T8kY1JayIl7EXcJdTCcOnxL3crOtHOIPGU4IcOFF6/A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IvbBvDj7i+xYW5KZgEABDXSeN+CHkeI6uv8JoSaBSh5q+EFvnR56ylh3bH1bGDoyY4pbGP61FVn5aVkFuBPJg+lKdtQXeRO0jYKXon3WlDiwhQqcDbpfD0ti35kVpy/dCS464AMht1+83B2Q6Rs1yi32EJojF/i5dOAWcdaCzMBfoLVNviFUWGU8m+LAhiUCHT8RDrdBmWq0qj+okYj+pGFcRQJ6Luxs7uSwv8OixglOn3t/XI6NXoXPrjuodCpd5n1njTjoECb4OLMhODCRgo8zTrVS99JmUcTBhZd94y1Gj+xsiLJmj5qdHSO/HlSiVw0KxGPBkstWfvr9sa/m7HSPLlx7U1FJarwniXPdeztYMonNDnlxrg7qIbAa/b5e2LNZirX3+SXqJSDH7Oil532+Ww6IzAAFBoml0AVegXTt6FHKqmJ1SzhERK/cWFZC
X-Exchange-RoutingPolicyChecked:
	LtLi48Ue//F6qDJPw4PoHSqzH6GvnWG2zTLhfvfYSGuGsEB9O4PUBmnptoMZ0Le8j1oP2Xkh7P4NLqdWgTV63Fy48PyimsL0G8q8bUmRmvqZjq7/WcKp4iWarekDi4gx7YLaEJGrSEp90D9YdmCDm80Q44TNBzynNEBB+BSGIyiLpfMFVlGB+cLdwByCj0qpkEaUq/KIeXDgsmTRMuFjKqZ5odrpqszsOxMtQMyljSs1diV79Mj8U2XYlkgAm+HOEc5UhZRpb+6+0Xptj/BWUwLOa9jJ/AxoxbOV99qJ73sOC5csIT+Asbk+XyYXlWM4S33mM8DG2chUeRgm/Q5eQA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 20:33:37.4967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a25c753-d624-417a-b8f6-08df1d9fc671
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6833
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6abacf29 cx=c_pps
 a=Yfwwr8Yczqb7c+94X7Exug==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=Vv26XpkUteEjZrrwIqsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4MSBTYWx0ZWRfX0eAWe+yJEIWM
 pSMQvB+ao3B/UqzuL0/1CrNjxPYt0/oVn94F+ltmJhIKMWS62Z6B2B9B2A1fUEyy3+2PSNBKIoX
 pe0fQ6labh84aGQbDR9eqrmNMZwuUhfcR2HHFhCvLY/4W7OD4G8ffVFRLXzxsuYr2XWkQwGZiwX
 0Ly454APZFnrbt/QP5Oz1uknrOz2Bfi2NodllHneJ8x2ZGciDscW8j8o+21cglwLQR+IzCTaagO
 l9nRH6+eNe8JDA56rZWiMNMKmJmjeLKMS2yKv9KO3trvktOBzJQqKoUEwx1vUgYkb7IZ2wmEFzM
 /3R3m4VGQ4eN46BfP5iz03hBpfsWHqyHP8fe2NV9mOGhmGxHfuG3CtMy/tYbYU5NBHnusPNdvGd
 SuqNrytHon3asbplr3CVdmT/DAMBqerN7xEwRjDVgAIkHJzhO7j8zLkJgaqrZbTvyc4bKt54IZp
 7Y3Ltv4CbgKkPgyUmsA==
X-Proofpoint-ORIG-GUID: PYYgRhoNoBiDDS-va89InjVir4Gn3HUv
X-Proofpoint-GUID: PYYgRhoNoBiDDS-va89InjVir4Gn3HUv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4MSBTYWx0ZWRfX5bmYWewRRWHM
 O9yMGZFPkodh3160LIQDkdZKO2/q5RnPn5IszunASYNKnAv9u2dQCKiSJadmKBSEMl3Vukp0+yL
 I2JKHfE25SvjMEwjDmrPXNV8/3/5yOM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280081

The gpio-keys node had five pinctrl entries (pinctrl-0 through pinctrl-4)
all mapped to the same state name "default". Merge all phandles into a
single pinctrl-0 property with one "default" state name. This causes no
functional change, but is inline with the current kernel style of one
pinctrl entry per state.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
index 19a286dcc8a51fcce3e8119c2531198bcdb4db93..6156cb8e54b3e092f7bc4e30fb7604f08e181b25 100644
--- a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
+++ b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
@@ -57,16 +57,16 @@ led-6 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		pinctrl-names = "default" , "default", "default",
-				"default", "default";
-		pinctrl-0 = <&pinctrl_key_gpio_default>;
-		pinctrl-1 = <&pinctrl_pio_rf &pinctrl_pio_wifi>;
-		pinctrl-2 = <&pinctrl_pio_io_boot
-			     &pinctrl_pio_io_reset
-			     &pinctrl_pio_io_test_radio>;
-		pinctrl-3 = <&pinctrl_pio_zbe_test_radio
-			     &pinctrl_pio_zbe_rst>;
-		pinctrl-4 = <&pinctrl_pio_input>;
+		pinctrl-0 = <&pinctrl_key_gpio_default
+			    &pinctrl_pio_rf
+			    &pinctrl_pio_wifi
+			    &pinctrl_pio_io_boot
+			    &pinctrl_pio_io_reset
+			    &pinctrl_pio_io_test_radio
+			    &pinctrl_pio_zbe_test_radio
+			    &pinctrl_pio_zbe_rst
+			    &pinctrl_pio_input>;
+		pinctrl-names = "default";
 
 		switch-1 {
 			label = "SW1";

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260928-gpio-dt-binding-fix-9d92e23eebd0

Best regards,
-- 
Kendall Willis <k-willis@ti.com>

