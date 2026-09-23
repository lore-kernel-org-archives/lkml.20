Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EA343F8A7;
	Wed, 23 Sep 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156163; cv=fail; b=aUOydTuVS6DpFqFELwhBb/euB8xqVbnNbGOAMUMrsPCLxvRp0wMDeoTbrP7CSRmUIiNIl+ex1LXkgT/+DoegFsGUHpOw9nmN2sNiug8m9JaSuBHeyMN2GAuGMfsa9MXKwh4SGotJblzIg+Q/btjDYqUJ8jrW+YMEErcY0DsIEGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156163; c=relaxed/simple;
	bh=hXI5sTCAjcSOqmP24E5oPoK26EvSgtInVsfsL7TEb4U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PTi1Cc6Sdn1aUPzPqZup6U00+HmFfNPuj9XwiByNdMMVMiwbLaY7L4iQ5+kE5b+c3Ajz8vR8Lb9EEuEaYSzB/bv0tVhBBk6BDgULZNd4GaR7wiBRJtNX/8DvzB3gamZEi6/qPEkzqXTGs6RzAYo41znoVOBP3757Lhb5Qwqznkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=H/qKRjbD; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MiygARRk; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="H/qKRjbD";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MiygARRk"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JCN5775594;
	Wed, 23 Sep 2026 04:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=aoEsTTOZ1buZG
	/6gQ8Y6aKuF1l92vTo/SLxEKOz3Wj8=; b=H/qKRjbDtYMr4pOpQz7Z1yx0FYPfp
	Nr6uJgmHMtn9K6ICUSlJkwtKy8KHmUNKXemFfLy3NG4085BXsYYwkxpXO4o2M1Ua
	rLlrgmucuA1uZeu9kWDqU7byIf4uR/M16RUYDRKTUiwPn1N4KldLtCBojr8WxBt0
	lT6dFpRnVHByaGNfi00jIMY4QGKsKCQVONZY5C+rm9ug7hF8RQ2lutDMcmcfKm7T
	B82SQOERsYqJtZOPlBaQHThS1mQIw9VFN/qpZ7amjMHKu4Yd3/zmp4tkpjfObVjL
	2H62g4W3HQfkocAnHESMqJRVK2OnMOKbUkV/xqoWwiA3fSyF3Xz2WIWKw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010022.outbound.protection.outlook.com [52.101.56.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycu2by-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:35:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsOak9gVCBvWSH+XphVrDhDSdRVJiTPBDlifFnvhBEAcvQ01j/2IJ94mPumGvAprwqaW92B0oCD6laH3+8DozVpoOJUX8BZhiPu8OIDsUSv+8B3M64sufZaWLyUoKWBlUtXJaTTBnSbptt+T5c26Dyv88TMLFH1sRXsgls3LUfNmYnKpeLr+fUTVmFbSxHH2A2s1xZriYS+SkP3YUSf1M+QmXXoR2nUZY4vtLeT5zz/4+FeNdIvRe8N99Z6ghsGI0pgN642FMwAJhjQpcBNgTndrc7IVamFVd/MRqdx5pZmIiaJ5uzMtgRwTEwQ8bO2plI8RqVP11oHiwkVlSiehZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoEsTTOZ1buZG/6gQ8Y6aKuF1l92vTo/SLxEKOz3Wj8=;
 b=MyQpPomo8v+U9Rra5sl/UmHmnQX6KG6QQWQAIhTI9YmlwkKSWjALxbUbS0QE1274RHuHMiIrTiinWz15nhZbt0mCabPQf8G3Y9odvGl7w8YgK8JBuFUh/mcoctLyKho5g2YVxyGVe0kwHdfF4Aqj7y33LNVxTL1VVD+5YrX0SJRDhgQYFBJX536NlFk7YjPC+zmJyKv77Yu/rCC7vSLvWUuYn0HiPL3kBhcGEvapCtYQufs6jukGWKMI6+KXr4PW5LPPnQKJOoUs+4wMM8Twws4tHP/5FtojgZTkL3CzcyP7Ld8FWyjHrSUmVe+G7lKCDhMKZlWeQPTY0R12AYqufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoEsTTOZ1buZG/6gQ8Y6aKuF1l92vTo/SLxEKOz3Wj8=;
 b=MiygARRksuTXxwRzlHFT0mqBItp+DQpLCBRpOHbperCMBQMce+mYFokgn4ekchnFdWL1AcG1oaqpJA6m6Agcm3t0OHuaU00jPgAeFozxMKdBVvzzS6vbBhbpSb6HLIGVKmv8Vmff53QQ1W8z0//MnHkDU3fbbNV6fo9WWwZzPsk=
Received: from PH8PR21CA0007.namprd21.prod.outlook.com (2603:10b6:510:2ce::13)
 by IA3PR10MB8662.namprd10.prod.outlook.com (2603:10b6:208:570::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 09:35:26 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::ae) by PH8PR21CA0007.outlook.office365.com
 (2603:10b6:510:2ce::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.15 via Frontend Transport; Wed,
 23 Sep 2026 09:35:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 09:35:25 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:10 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:35:10 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WO1760658;
	Wed, 23 Sep 2026 04:35:04 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v3 00/18] Add DT support for CSI2RX multi-stream
Date: Wed, 23 Sep 2026 15:04:41 +0530
Message-ID: <20260923093459.28125-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|IA3PR10MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: f12ecac9-f8b9-4b8b-270e-08df1955ff48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|376014|1800799024|10067099003|3023799007|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	W06WVSBPAwFdsukGgOwvuqfohZ/ka9JaOGLIEEDRmrFRxsrY65Wo6Yq5SWymc7ISLVts+BwNIiP1ykwWeQzGSU/ipvxQYCYtCmA/aQ242eHrB8e62l6gdH7fGQqG60dj7SL+iCM64MXGMHnl46TUMJ5EvfYOO9bThoQ12jiWKU6e7Xr9KpSy5JsQOASzgAL4i5NhoRkYdKv4EnYSiJPGtnVGXB4nwZ3xHVib5jweGtA0Ec2JWdC2ycSI1/bYItcGpIiLh/JCNW2zRCWqRBJh7Uo4ejMdn+JMMrJz4xjX+2ISfW2zuZ1KZsihIUzAFhinb+D5hqUAxK4RQRkPlmaJ5OEw9+cRkz8eKvD7kImqULgUlTp8Pb4sYSVGXb7QVUZbdxVH6lATDkg7Z+gmc/twzQGVfUUSqBw9KIhpbKuGsDwtXqqN+HhtEx8vRIs7qLgX4VDy7hW4UQFEAhXaPHmJgvYq/1Tu0JoYsTlVFWVEPtKHvevbzbcodL4/W4zpn2TUF9Ss7P8CS+0xjfXV1cIhlNX9Ej+sHFFQ83xPmOs8giS2Njd/Ct/w2LL0M0Zf2x9chCYR4nUVHT2VVvPhBlRD8qRAstgxoEKng9n/rbkYlvx90D7wHb88wv4+N98uEV5xB1TpOxQrp7GFN8Imrf9uGNQsNTRt+0y4BIV6sYmIBMWuXpY3sOU+6KRO5actWVp3S0D/gh9xFVMK4NhOQV3FJw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1grKHlrXFNPmI3JhQikxpEmUArHQAFXkJlDBDRI77YSQDpVpvDibsqV7t79QsrriTzN2h7db2Gyk/5amsfh/mhfN0xxl0hy1HQ4F8lXHArDlDzygizLB2kejzvT00RhGj3GCOMeiMVS79XGIYU2+JETHIF7RumhisG9sUe7f4NShT6MOEcFlQmmM0hrBW142SBckJ2zrN56ZD/vMLhe1ei3K5feALCYEZpFpAGbmISfckoirbd2F3mzBAfEjakaCMf+ea8EEF89igvrL8vJHA8i+mYh1oKIqzzZtqYDzv8cdKZ/JE551chiNWuuWUo9g0eU82zbaXjDAm32ipuXFp6S3RBgwOlb+Ykj2/uW9GjiuFwdHSdqTA/1Al0hwpVlC/nAfoxP2qguvJZVw9QwklOPjEsbTSPde0FEMFlwmC2OkwI2TV+fVG0zf+iy9TgNA
X-Exchange-RoutingPolicyChecked:
	CNPBQdLBfPFoQZREwq3tu7//Xhtz2+fjVmuavrjjN9KStEbaDoIa/f0I0gKMxJYMlhBPJb9tU3I+JMiuJUBGt6neGK68LPZmGoNPRgqj8FiqGZLfbpExNIzdaZ4ks4efI7TgK1LM4o2WAX8z7Gr8+XojMNQ6wTVW0ECasQIlxOjNGvuX7Z/S27BcjQf5NLZlrd8nmjEr13Fw9e02RHXE+5GGylD/vQfO21fEjSdR1ovLmBiZEK054UA6vDSxtUaxFsS3G7Nhhbw0hLPXG06BRFEe+NTRIrBVO6FkUQSXcUKAh9Jvj2ZekCLHSqQjDiCEaris+fQtXXB6Kz0cR0bj0A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:35:25.4983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12ecac9-f8b9-4b8b-270e-08df1955ff48
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8662
X-Proofpoint-GUID: T5rKv8nV-h-s2XXwiFSqN0JMPxSgs3Jm
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab39d67 cx=c_pps
 a=wVrytDogCwW2gNy9sPioUw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=ahRiOtByQLOieAtbN_QA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX0sMjhGFxBKp4
 2uX65w+4X+IwS3zEh4Nqdm3xH8wB4cCtsopPv32pz1QIN85IXxrFh6jPXVAIDn7FuwApWTnLAzA
 KKPfEicJ2mG2rV6JiH8qG6YBoKCYWjZBp4qZ1cxlPdSIvsxEZzO5+6e5pkeDkJ7zhJKVjoSxFqG
 zEUJ+l5eV9vdszqEAx8ZpTHOPbXASisBgaoOcDdW+wZow47MqVqSp5DiZveGyC6vc5wNkVPM7vt
 nhj1J0hhVFVUJDTdYA3MiU+cN2vYzcEPYvsrx7pie1Npk5YRmKQyS2S9Rl84eXQSB30OFSZxcSl
 WU/PiF9+uZpWpxGUadgZQTrNzTl2n8R3SjVDA0TuO8j4mEJ3Bk7TiEP38+khqC9f+gOSWxDsUTF
 iUd9Trp0vI5q5AJ2AnUm7lW2MLpo9G/a1gcH7px3itTri1gNJMwzum+/IbvibWQzKd+Ee5OaHKV
 NvvWH8+AWheJWTFfoxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXzqhb3/J4o1hF
 QNjRA6CKIfUw6bxncr/q2IyIu/QnPQFGn77JEYfT+5z+DV2rE9ztI4ktjP/IGiyIbJSIptVdph7
 qM73XA5/NCoq8cBZbHFU3MNWtDh9qjk=
X-Proofpoint-ORIG-GUID: T5rKv8nV-h-s2XXwiFSqN0JMPxSgs3Jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230038

Support for multi-stream in j721e-csi2rx.c driver was merged recently [0].
Therefore this series adds the corresponding device tree support.

Patch 1 is a cleanup fixing indentation in the existing CSI2RX nodes.

The next few patches i.e. (Patch 2 to Patch 6) add the additional DMA
channels required for CSI2RX multi-stream capture.

Multi-stream capture uses a SERDES pair based on the FPD-Link or
V3Link protocol. The serializer takes the input from a camera sensor
and converts it to the FPD-Link standard, while the deserializer
aggregates streams from multiple serializers and sends them over the
CSI-2 RX interface. Each CSI2RX instance therefore indirectly receives
input from multiple sensors.

The remaining patches add overlays for various deserializer boards,
and for the UB953 serializer with the IMX219 sensor. Finally, patch 18
enables the DS90UB960 deserializer and DS90UB953 serializer drivers
in the arm64 defconfig.

Changes in v3:
- Rename fixed-clock nodes to the generic clock-<frequency> form (Krzysztof)
- Also rename fixed-clock labels to lowercase
- Reword defconfig commit message to explicitly mention the target vendor
  and upstream boards using these drivers (Krzysztof)
- Override CSI2RX ports using &csiN_port0 labels instead of the full
  &cdns_csi2rxN node path, and drop duplicated properties (Krzysztof)
- Drop underscores from regulator node names to follow upstream dts style (Krzysztof)
- Fix minor DTS coding style issues in overlays (Sashiko and Krzysztof)
- Use GPL-2.0-only OR MIT license in all overlays for consistency
- Update copyright year to 2026 in all overlays (Udit)
- Use board names such as J721E-EVM and J721S2-EVM instead of J721E, J721S2
  in commit messages (Udit)
- Collect Reviewed-by tags from Udit (Patches 01, 17) and Rishikesh
- Rebase on next-20260918

Link to v2: https://lore.kernel.org/all/20260713113423.2310443-1-y-abhilashchandra@ti.com/

Testlogs:
J721E-EVM + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/61597b1106a9dd42a94fa5c2e682f37f
J721S2-EVM + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/46f79a6ef97fa44ceb988344047bf6f7
J784S4-EVM + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/1b3b9a974f57f762aa3491dc3f9d461b
AM68-SK + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/e79ed27e4af8eadcdc7494d8bdbafaf7

J721E + DS90UB954-Q1EVM: https://gist.github.com/Yemike-Abhilash-Chandra/b3207c78de752dae26861a30e94d2f7a
J721S2 + DS90UB954-Q1EVM: https://gist.github.com/Yemike-Abhilash-Chandra/b53e0760303f8c749ec75cd24670b4e0

J784S4 + J7EXPA01EVM Fusion2: https://gist.github.com/Yemike-Abhilash-Chandra/680ea528e5f73e3ba3987b6ca1705d16

AM68 + Arducam V3link: https://gist.github.com/Yemike-Abhilash-Chandra/14d4cc7dd00857ca55f7f888ac89decb
J722S + Arducam V3link: https://gist.github.com/Yemike-Abhilash-Chandra/da498ef321b13ac6f9331de0bd0d9185

(grep for "ds90ub960" for the deserializer logs and "ds90ub953" for the serializer.
 grep for "running tests" to see the actual test pattern generation capture logs from
 the sensor over the SERDES)

dtbs_check: make CONFIG_OF_ALL_DTBS=y dtstree=arch/arm64/boot/dts/ti dtbs_check W=1
No new warnings or errors are introduced by this series.

Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/CSI_MT_DT_AC_V3

[0]: https://lore.kernel.org/all/20260520120022.539913-1-r-donadkar@ti.com/

Jianzhong Xu (1):
  arm64: dts: ti: k3-v3link: Add overlay for IMX219+UB953 serializer

Vaishnav Achath (13):
  arm64: dts: ti: k3-{j721e/j721s2}-main: Fix indentation in CSI2RX node
  arm64: dts: ti: k3-j721e-main: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j721s2-main: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Add multiple channels
    for CSI2RX DMA
  arm64: dts: ti: k3-am62p-j722s: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j722s-main: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j721e: Add overlay for fusion application daughter
    board
  arm64: dts: ti: k3-j721s2: Add overlay for fusion application daughter
    board
  arm64: dts: ti: k3-j721e-sk: Add overlay for fusion application
    daughter board
  arm64: dts: ti: k3-j722s-evm: Add overlay for fusion application
    daughter board
  arm64: dts: ti: k3-am68-sk: Add overlay for dual Arducam V3link fusion
  arm64: dts: ti: k3-j722s-evm: Add overlay for dual Arducam V3link
    fusion
  arm64: dts: ti: k3-j784s4-evm: Add overlay for J7EXPA01EVM Fusion2

Yemike Abhilash Chandra (4):
  arm64: dts: ti: k3-j722s-evm: Add overlay for J7EXPA01EVM Fusion2
  arm64: dts: ti: k3-j721s2: Add overlay for DS90UB954-Q1EVM
  arm64: dts: ti: k3-j721e: Add overlay for DS90UB954-Q1EVM
  arm64: defconfig: Enable DS90UB960 deserializer and DS90UB953
    serializer

 arch/arm64/boot/dts/ti/Makefile               |  83 ++++++
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    |   6 +-
 .../boot/dts/ti/k3-am68-sk-v3link-fusion.dtso | 184 ++++++++++++
 .../boot/dts/ti/k3-j721e-evm-fusion.dtso      | 172 +++++++++++
 .../arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso |  83 ++++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |  24 +-
 .../dts/ti/k3-j721e-sk-fpdlink-fusion.dtso    | 172 +++++++++++
 .../boot/dts/ti/k3-j721s2-evm-fusion.dtso     | 172 +++++++++++
 .../boot/dts/ti/k3-j721s2-evm-ub954.dtso      |  83 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  22 +-
 .../dts/ti/k3-j722s-evm-fpdlink-fusion.dtso   | 179 ++++++++++++
 .../ti/k3-j722s-evm-fpdlink-iv-fusion.dtso    | 275 ++++++++++++++++++
 .../dts/ti/k3-j722s-evm-v3link-fusion.dtso    | 197 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     |  15 +-
 .../ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso   | 257 ++++++++++++++++
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  21 +-
 .../boot/dts/ti/k3-v3link-imx219-0-0.dtso     | 128 ++++++++
 arch/arm64/configs/defconfig                  |   2 +
 18 files changed, 2047 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso

-- 
2.34.1

