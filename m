Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E2A1A6839;
	Fri, 25 Sep 2026 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343065; cv=fail; b=TQX6+Q0QPP0ASJ7Yt4osxFXSA2/3MnBPS1d/uCCHmKNt+PO63cR/M3tgeBnHO2Ds9k0atehs+YlsksS6c7lNvVHWwj2aZZkyc+hro9SvRs36y/TF2z5Wv78ayWnoGV1rbORX+H2ILVy+gN2HdW3Y8/j1RDhRPRuLEEpEhsDI680=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343065; c=relaxed/simple;
	bh=yXVvj1xDpks3af0ri9rJFR/ck+SzdyR7Ln59TH++0dk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ogVe11S5C2zD9NZM5dlcsm9X5UknmrfNUMYeSDtVh0e6Y+qTxmSwSm/+rtUVY7Hsq1YnhxJhmNWZrul6rJ/tjMNBSdnazi9UOF7JkrZcO+yOZAl5bQkhYJvDmtrs45/gHQ7T4vn9XbIh4FkbU9LgLfp5Ei/NWFnlt/5pj4TuUjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=k11L2616; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=La8GawpR; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="k11L2616";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="La8GawpR"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA5T6v1803458;
	Fri, 25 Sep 2026 08:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=pnYma+cHnjtrH
	oxQ+qQt99Dg67ARutPEY3tVRhNm3UM=; b=k11L2616uqA2Xy2GjFVNelFpZmQGb
	eETLw6ou+BUEhQtd7rJLZMkX3XPVegkQME2AwleARjJwN62B/ns8sWUJPt6ToG2Y
	CYOHtvWefF7oCvpU6W6KEUQyWLoMR2KyyxurEZMzkNG2RZiYICsUbpvorh9pBJka
	7mdsz8iP00NM03U4ow86RRhWrGWLXGAJmWfHWnsHvhGrsNsP5cmOhEHLbbJIfu5P
	m0mTyEMKSaU6SluWjWF3bThLYatz0IKsrKSY+cxHiVJrpKy/+61Ro+gFPMsO61iu
	9CiynpKhboNNK2o8+pe8FHz+8zwvvUdCM8U0FKaBW2HC43rJZ+yHJONvA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010004.outbound.protection.outlook.com [52.101.193.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gwpw7h05p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 08:30:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qu7tHIjelPif+I3hUWHHBdYpxDNrhskfsMDmHoE819sXQm0bDvRwchyqiOyUy7rhSoUmiS7q69/T89a9bVg3lQHTltiaSeJmZV+9Vfl07Ex6dDRYZDzULmSjhKkUyu/HVrEAHvEdasAPoiTMIJncjvb70ne8iy1t3FeHgUeGiDhFlekkD677Kisv8l/nx/OzLjCsB2sPdFqLeTLgtPtJKU1HaZkwA6c0yusXcfhJa+HSWYHPaKAk5wruTCZ+ZZn7ajOI9nmBV60lN+GArJLHN2S3Wcgooy5lAKYduUaM6OppuDxauWdK2F7bzCj8Xu8QKLmz4P/K/Fd7+0gWgbvxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnYma+cHnjtrHoxQ+qQt99Dg67ARutPEY3tVRhNm3UM=;
 b=QzkbGYglFqirUEuiQD4aUSF1v954bbHWVUjRqquwjpXubKt6/qe1DkUkf3DJYQW7FbMa5di2L4PvPtwhr5Hhh/GG0VeQ7R1WKrsZ/f6k/wMpXVSDLxJVa794blTM3v59QyQDT0QSbwJPlIdZYqEfCEqqEO3DWsjhdBeBKWodfg4z28Swt8wLrizzRR/IlOeD/8XHyxqSce6C0thUMejr4GyoEghlxgSY3XA+JpQVO60cecloL3GnWQWVF6Hjt2iu5GBTPBeWxQ/xcuIXgOp/8HBs4X2a7aThWEAcaOeuowP0Ir/MRFadt7DD9EvLQZAxUXqqSMl62ifd11ItjUq6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnYma+cHnjtrHoxQ+qQt99Dg67ARutPEY3tVRhNm3UM=;
 b=La8GawpRTRxQhtwqDG3ELsa4tAH/rrBFHUuiRu02qhXpyaowk0PVhPIKOl/vqlt+GHLp/jDJacGvgcbBQNJDn72bvIbvwhtjjrT2UlsGPbAAbU3E8SRZK0yZE+sx6hJc7DH2hcK1+jz6EOXxFOnQrf9TDJV9zyZ8ylqmjGccxCk=
Received: from SJ0PR13CA0184.namprd13.prod.outlook.com (2603:10b6:a03:2c3::9)
 by DS7PR10MB7278.namprd10.prod.outlook.com (2603:10b6:8:d8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.7; Fri, 25 Sep 2026 13:30:35 +0000
Received: from SJ1PEPF000037AC.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::75) by SJ0PR13CA0184.outlook.office365.com
 (2603:10b6:a03:2c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Fri,
 25 Sep 2026 13:30:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037AC.mail.protection.outlook.com (10.167.244.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 13:30:34 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:07 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 08:30:07 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PDU1n52840014;
	Fri, 25 Sep 2026 08:30:02 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <sakari.ailus@linux.intel.com>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 0/8] Add OmniVision OV2312 RGB-IR sensor driver
Date: Fri, 25 Sep 2026 18:59:53 +0530
Message-ID: <20260925133001.2780868-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AC:EE_|DS7PR10MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: ac296f5d-626e-4926-5f06-08df1b092df2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|23010399003|36860700016|13003099007|260925021311599003|260925021911599003|6133799003|3023799007|10067099003|56012099006|18002099003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	QYy3sDZn00aYWdgGpFGMa7xKseqi/BSKRNJ1q6Z6pxRdd7ePaZkpJ0JKmjvPlB3q5KEGLBlf5MAh6DHMLGUy7eioRtPDl09eYtq5G/lCYUjuw3tTWlPZfphFu71gMxOr67clVrvObvp/OiybC503+PL1b+HIMZyrUKCDSLEn1paOPFZUl0QvEju0LvmhgMLKw+7GIlHeJIzzkmmmsyt1hTEEBAgRye+R472LnYJrdcuRSnoiVYiVmVci+eH1httpYe/tl27TfXrk6pjzeH+jqpFx7TQfrkniAI+QMtKQPfAs6eoPaSVrBf0fqeRCRzEmouhcqFBsGigt9Akh1zVyFQaKLIXLMlpHi60AhGSd0zY2cTzDRYYEECrqXi11M9QCXazcsg1C7n+tOPT629coXG+vsxQ6DeICjW0z0HvzX2Mm4Q0lhvN+M1FeDL2LSCv2hfUQ15rREs2KE0hbASFeAP7xW3YpjOwI1x+Psoqvg1XEGCA8vCeBCyF7iusC3M3sDiKEo5Z1VtR2xsD4KTHiWGVvJNWKs0Q6FFrdOaqm38uaKOLupn2tNklKuG+cZbWYnES9GLEhWVDI2qBq3CYOY4evkURNG5Q2L1cGx+tmHWxpR6QeDzT1F2B79pcYaNluV9Y7hpBMleRfztxhhRVmZjq7kWnavf6pLd+u/2TmP+Q=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(23010399003)(36860700016)(13003099007)(260925021311599003)(260925021911599003)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XDU0rGOzUjEoZiB6S5kURP7sBbZwh3rF/gJrjKu3UkV7evtv8P5y9K+jCNlCLGcnxG15sVFnq75WhvJkBQHIGGTH4ZK7bMVHJhgcf0Lv9ZBLngxDCZDTH/ZrwKr3SOrrk+ez5ffbCB9JtWD1XECNT92NctLPubyR7msXMhelJ5VemLp6ZkC7wvnwGD0DJa6Tb3k0PGwBZbXUrhG9NbJbawVNZHuZBnzQp86o3Zgz+DBA7sUcjl0n71Xh4udgRWt11LVnct+fOUXLLqc7W6og7vapSvvaYP/KjKh/+4zw6sFKg/sIal3h9Vefrvk/fVndlqPVU+7J1LISqp809QwzrqsZVyOBCXhrYUz5EeyAQJz2P2YuAIhyQGm/zpU0Hp3QShVEb1QchiYrQQeyjeZ0KW5GhKKKd2FMHjfDfA3C/Ae8huK+QqngGAoi6R7+g35g
X-Exchange-RoutingPolicyChecked:
	HNIoF+zf70T7TRE08soZMoy+TbiTlZ/02z2tGeu2UfYL4W42dAQQzaCrv5/xqv2JzP7bef4aSMIb5lYmbg6k2apSAP/H2bl9MxOQHolxED7na4CO9QMhz4yDcW+gQo9xAxxZcAFNOc0Dg2uLvk6rwf1MTpnoV2uIVcZbvG/rmEiWJC3Z5yLhxgS7pKFjn8Cy/IgWuxsGX8qyWJC58SekOwxow+E2Lj/XRlhYgjdeb6CNkFMJouLqNp+DgJtTlEG8TZl7EwQMJgYyGDoeLRtzO2746pToDVHT09OyHr4UTK8QEmt5e/aWffCdnqgEBJnt9M9Ojc+vZOS6H0dr/6r1/g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:30:34.8033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac296f5d-626e-4926-5f06-08df1b092df2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7278
X-Proofpoint-GUID: EM6Nmyd5Xy05TMR6aRXn5FcBNqZmW9AQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX2wF/K80R2laD
 S3ldLrC4WT2fXQHJLx0C7WsCtl3vYrhRBNA5PcYTf31S+5C85U45OP7jhFxzhc8/h9sRqnTNLNR
 x8nos/6OtiGQbAeOXIbnebk83JAOpzr3X2nmK6zpMpBBHnLLLpX00hBIzNw/ZlqZQgrwa8dJRRL
 oyEg5kwOVFI3yw0PNda6vNsNJXIqzW04jH3l8WWJjYeHOHyN7qRNyOgluZmC90GhHZrXd2kQBYa
 dJp8x8WHpamEuLAalf7izNmujohOnotr1qLq2eJJcrdrQaMZrfDTGIsdbWsqUrAeTMvl11TeImm
 SNmQuEhgLH9TVeygLzrR3o2/KTmKA37ynOkMEUoyIZmO70kQD6Ar9CmcI8xaqgYjiwEiOwQoRcg
 KyXB7fddrocqcCLd5ORfJYNF07B3q9QieyZKKCX5iNUueiSRqAA5DiSAhPdFNJyvEC1ZuIJYnBL
 idoZwRUvm843T5E9Y9Q==
X-Authority-Analysis: v=2.4 cv=bIaDs/+Z c=1 sm=1 tr=0 ts=6ab6777f cx=c_pps
 a=Q+OuU4uwq9JOSoz6MpkFfA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=1pMUDDtvAAAA:20 a=CEMnJ-suPOT2-wkXZ-YA:9 a=ST-jHhOKWsTCqRlWije3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: EM6Nmyd5Xy05TMR6aRXn5FcBNqZmW9AQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX2Kto4Gwm7Fnb
 Il9zCHkED+HL9XbvtnuDIiwHg9QHfJhWZ0Y2vV4fCSXN1QvWFH1B//XvCbmG2UPTZYlwnzKDWrg
 DqLWOdRnY6trbPvR2y+CyDqHOZqKx+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250053

The OmniVision OV2312 is an RGB-IR camera sensor with a 1600x1300 active
array. It uses a 4x4 Bayer pattern that interleaves near-infrared (Ir)
pixels alongside R, G, and B pixels, enabling both RGB and IR capture
from a single sensor.

Every frame the sensor alternates its exposure and IR flash strobe
settings to produce two complementary images, streamed simultaneously with
two MIPI CSI-2 virtual channels:

  - VC0: IR-dominant frame
  - VC1: RGB-dominant frame
  
Because the OV2312 uses a 4x4 Bayer pattern with Ir pixels (RGBIr), the
existing 2x2 Bayer pixel formats are insufficient. This series adds eight
new 10-bit RGBIr media-bus and V4L2 pixel formats (one per valid phase of
the 4x4 pattern) and propagates them through the relevant drivers along
the capture path : DS90UB960 deserializer, Cadence CSI-2 RX
and TI J721E CSI-2 RX as seen in the `media-ctl --print-dot` output[1]

Two alternating frames are captured under different lighting
conditions - one optimised for RGB and one for IR - they require
independent exposure and gain settings. The standard V4L2 exposure and
gain controls (V4L2_CID_EXPOSURE, V4L2_CID_AGAIN, V4L2_CID_DGAIN) are
single-valued per subdevice, which makes it impossible to express
per-stream settings for a sensor like the OV2312 that produces two
distinct streams from a single I2C-controlled device. The new
V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI, and V4L2_CID_DGAIN_MULTI
controls introduced by Mirela Rabulea [2] solve this by defining each
control as a U32 array, one element per capture type. The OV2312 driver
uses a two-element array where index 0 carries the value for the
RGB-dominant frame and index 1 carries the value for the IR-dominant
frame, giving userspace independent control over both streams through a
single subdevice handle. The driver treats a zero value as a sentinel
meaning "no update for this capture type": the register patch for a given
stream is applied only when all three controls (exposure, analog gain, and
digital gain) carry a non-zero value for that index. This allows userspace
to update RGB settings alone by setting index 0 to the desired values and
leaving index 1 at zero, and vice versa.

Both streams run at 1600x1301 resolution, 30 fps each, where the image
data is 1600x1300 and one extra row carries embedded data. The driver
exposes these as separate v4l2 streams which a downstream CSI-RX DMA
driver can route to independent /dev/videoX nodes. Because the two virtual
channels are driven by alternating register groups with different exposure
and IR strobe settings, a pipeline misrouting (e.g., an RGB frame landing
on the IR channel) may not be obvious from the pixel data alone. 

Userspace can use the embedded line, which encodes per-frame sensor state
including strobe and exposure register values, to verify that each received
frame matches the expected capture type for that virtual channel.

[1] https://gist.github.com/RISHI27-dot/1876791cba10798412050e1142fa7899
[2] https://lore.kernel.org/all/20250818155809.469479-1-mirela.rabulea@nxp.com/

Testing Details:
===============

This series is tested on the Texas Instruments AM62A7-SK EVM with the
LI-OV2312-FPDLinkIII-110H camera module connected via the 
V3Link FPDLink-III daughter card using GStreamer

Testing branch (device-tree overlays and any patches
not yet upstream): 
https://github.com/RISHI27-dot/linux/commits/lpc/ov2312/

GStreamer pipeline:
https://gist.github.com/RISHI27-dot/87dc7dec1fdec5f20ead02ca7defb4a8

source code for tiovxisp gst plugin that does the ioctl to set array
controls and does the embedded data filtering:
https://github.com/RISHI27-dot/edgeai-gst-plugins/blob/lpc/ov2312/ext/tiovx/gsttiovxisp.c

Dependencies:
============

This series depends on the following patch series:
https://lore.kernel.org/all/20250818155809.469479-1-mirela.rabulea@nxp.com/


Jai Luthra (7):
  dt-bindings: media: Add bindings for Omnivision OV2312
  media: v4l: Add 10-bit RGBIr formats
  media: i2c: ds90ub960: Add 10-bit RGBIr formats
  media: cadence: csi2rx: Add RAW10 RGBIr formats
  media: ti: j721e-csi2rx: Add RAW10 RGBIr formats
  media: i2c: ov2312: add Omnivison OV2312 driver
  arm64: dts: ti: k3-am62a7: FPDLink overlays for LI OV2312

Rishikesh Donadkar (1):
  arm64: defconfig: Enable OV2312

 .../bindings/media/i2c/ovti,ov2312.yaml       |  79 ++
 arch/arm64/boot/dts/ti/Makefile               |   6 +
 .../boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso    |  89 ++
 .../boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso    |  89 ++
 .../boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso    |  89 ++
 .../boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso    |  89 ++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/media/i2c/Kconfig                     |  12 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ds90ub960.c                 |  18 +
 drivers/media/i2c/ov2312.c                    | 939 ++++++++++++++++++
 drivers/media/i2c/ov2312.h                    | 285 ++++++
 drivers/media/platform/cadence/cdns-csi2rx.c  |   8 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |  48 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   8 +
 include/uapi/linux/media-bus-format.h         |  10 +-
 include/uapi/linux/videodev2.h                |   9 +
 17 files changed, 1779 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
 create mode 100644 drivers/media/i2c/ov2312.c
 create mode 100644 drivers/media/i2c/ov2312.h

-- 
2.34.1

