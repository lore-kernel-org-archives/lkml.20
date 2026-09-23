Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4415D47CA90;
	Wed, 23 Sep 2026 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156316; cv=fail; b=dQqlLcyLDFZY2kcGNLYdnT5XVlhRH36vc+jEOS7cVCqJjf3F240PcneB480u/vq2LV4uAdlQBB5r7L7dGMAmpKUNwRGhqPjkEZjg1BPOogh4ODMPwQV8f0m+HEgHcLAkLoNPZzxgpfAjYkZx5GDdUjBaESQ2Fbkt0s+HSAnlsbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156316; c=relaxed/simple;
	bh=KZbW4XYDGiGXCVX92Ja6FEKs1C7cUp0BpUSLmRAcr/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Re+0sIULVlNy8QCEIcP1JV92K6ruOyZxaVtqrReWE3rk1+nQKZKwbCHAasQFLwQZxgvzgDov/7l01NLCJ31zbF4Amyjm/bMjskhcN0WMCKTlLBrg4vrKgiVrO4eJbnRBSAO9bUcoDPyWx30T6usVjxHC0S4QRtqhg0SQu/HHTg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=c3uiqx7i; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RaYPZitY; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="c3uiqx7i";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RaYPZitY"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8JQGd461505;
	Wed, 23 Sep 2026 04:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=JfmOkdMnh0itDCx7uOfj6sXCADoW3TMVh8eZdwdX6
	a0=; b=c3uiqx7iqYyw5I+4vNKoKSGuoRZVxcuqGEVrS+Y+7hjE89l4HJ//Ly1s1
	6jOaYCgzHIBl88V+uGj3ddO/G1KSmOPnE9P9QrBQrwJhdRixv284qnUBdb0OFNrW
	YPOiuly5Ju0ZcBk0mM0slhATGB0lruZNR9ZfG3LdqXRhNgIGEDJ/CG4lNUyZo24g
	GFJrRM2Vyg2rm4CgfC+atKMbJQx0sPpWiRVGHzBL7drgjOQH3cRbyIs1A8faA7/i
	kRVs6bISUJuIA28ZYleJ0vJbJyNGnejyHV5LRr3sQPf8pNUbVXv2SISb/CrN2RKN
	WPNmt8ojMFhD3+6kM4LeWTzN2tV2g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013041.outbound.protection.outlook.com [40.93.201.41])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gv3tsavvp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:38:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBazCDolR6ZJsiG6wuc96dX71BdLgjhTr7hMTCfZAbrFr12bUthEMrLc2ml6u2ToHmdkks79VEHXlgefeB+AsvpuDqwbQ2YiUwZRQJMWCuRYtKYQFXLGe7LtBnyiZDmWCosMlFDm14m3aFiS90/vyv01uaH9mVeuae0EbzOljoTZYQ72+e/JJXeEcTuSAP+tuhrkNQYRhNwoVu28oW8IRqC9oCLN7P/8Mr6oUPH3JH6641fOr/E1rz0l824I8QHyTU1fxNfpR/h/1WjT4DUdsl14mQmGMvEJqEc2wuAjFjxPfbDdgwLLDC7OgpFypz3ce5WbqPbC+PU/WlLs0LZF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfmOkdMnh0itDCx7uOfj6sXCADoW3TMVh8eZdwdX6a0=;
 b=gqc/KZYr66PFDezGmIHE0aWFsRWNdKr5VF4Aqfay+poGRqbqVmK0heYFf2DL+HX3SLd9hfjrw3lUfE0aDxgjCFHL4FdV8G25fniHBP0WLXGxpS3L/2wNAqBqeJ4R5HJSLOEK/zMyHRmd6Pmu2q18FIY1mxLy3gbm+sFUK2gG6vbn43wTyaAk81LjfAlPLqd3PmoIKLAhhZXaHx2fjKnT+Yjy4tfLYo1FCeo3RisbrWgRMvIIOMFv3Iz80PL3f0hfhAvSLbRhpNn9oY1CDD24936vcsuZFCbSYUVQTgWSbvq+OHUumOWMKryDMXUrqAENo3Dq5k2bHpf6T2CApm+tVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfmOkdMnh0itDCx7uOfj6sXCADoW3TMVh8eZdwdX6a0=;
 b=RaYPZitYfIIZxynZ4ZVLc70Kt3LS/cBCg/JAUv2IuQbBfaUl6SenR0PN2/KQKUlU2U5cbKTrrl9Hbc8AO8DvzAWPTBCyUh/qvMqwUK+zAA8z9p38qyuCY/NzYrx697mIODZqHzMVXPMXdI83HpSM8KgRQTKqCvda2NmW2ucbl2E=
Received: from DS7P220CA0064.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::19) by
 SJ0PR10MB6325.namprd10.prod.outlook.com (2603:10b6:a03:44a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 09:38:00 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:8:224:cafe::3c) by DS7P220CA0064.outlook.office365.com
 (2603:10b6:8:224::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 09:37:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Wed, 23 Sep 2026 09:37:58 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:25 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:37:25 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3Wf1760658;
	Wed, 23 Sep 2026 04:37:19 -0500
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
Subject: [PATCH v3 17/18] arm64: dts: ti: k3-v3link: Add overlay for IMX219+UB953 serializer
Date: Wed, 23 Sep 2026 15:04:58 +0530
Message-ID: <20260923093459.28125-18-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923093459.28125-1-y-abhilashchandra@ti.com>
References: <20260923093459.28125-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|SJ0PR10MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: e071b761-f4f8-4481-d941-08df19565a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700016|23010399003|1800799024|376014|3023799007|10067099003|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	yGgmIgb9BygZ3JkndfmkY1DhyJjbbKCULzvZnI2eo284qjFrm+IZZlXpVkHqPvptD9BKy48/T5ueB46YXgwOK68+g/SRJQhsQlobRAId6MkJ788IWXUTx16+KFR3a3rlHXcumHHMRsqW4BQa15/Boy80ZLnSAv32v4hkKqlaFluz9MT8+qD6/fBiRhLaSnJWlziPbkBkwVUwmqSd4FWAayfUnpZF/NysNMQDj9Q3LXjU02vkgaVB8UNY3DZFg5pNJTDUQlOS7s+kk+98H5qXXNKg3VEKA/XFsaALRrBpupag7cdkF+ZSsijJyilm3XW/qZedWbkDDs+BIJn5BA572Spwp5QVakngPCUtBXW2Axw6kmVfUCZiOdxNtDfBDyClW13VDOKb426603k3cLp7ekaKRip6leS/9J/FUc4/IQcfGjNH9XfUDIY29HdLW0nGyoNANd3IQ2E14jo1KUpeVmJwh8tuGqXMjC4gEFX5sYWuzRLlYiP2lR5dA98zIVVyXak5nGfRgdcRsRWJHEaZD2gcxYjx6gEuaj9LgHBgNlbzKywZElDnGczpbtZEYacTEp/41D7P8ec5tkYw8gl+aAMYHGVgPHmjumXrWn0OVtdLpjKnKQg1PEcilW2sDinSRcM4VW0XKJALFYnpm7THQw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	30M1CsNeGO/WfTCmbAnwVerhvhHOoj/xCbvH8naa58J9vz24WcfzqREEzKiah3j0rw1Y9HWwCFuBWKcFgDixV4sqLT8fkrne/WrReteKb8gaYHJQmRA3dGhWz6Ne1JuUXwcqSXetkN8V7fbNZbZ/3rlKL7B6FCnPDLyf/52Hrq9ka6lDl9AuFpS/yg9iGsWxTqSYrkpb5u3s9cPrm+Qf0M24SvzUc/wrBzOt57L1DD8EyrOf5C8upuulY69967optRvlBAt2OZ+kCnBZaOSJityYgF8L7/413cri7+vjk+yNkCrxrzs8BJqbbHC9SHxPTPWOKzSqIDtVSPZUFEhANmYRFS5Wvpe2rU+XEFY8uxmQcn4B8kzR/Vgec7TPMC0dvktXIday2HfomPAIpSswTaXohOlrbpekXYHhkEBTjARgR1l8VXaLqPQAlpFEC5lx
X-Exchange-RoutingPolicyChecked:
	FYf/RPZl/NJro1BeiO3GXx/ZYnqyk80nHlELte8fYbT+yqQzWxPuHgBTUsK9hkpApwVCp2nGnyxf6mqYvNpdnG8FUis8LpsCPdlgkVvsEvNsNrSXJlQMCGTgMm6rfrRiM2K/uyswMGwcbWLKCjaBVWkbRrzQMDk/7ivZtuNCl+ILcIY1IgtFoTwo1Sr4/YSgzZw517RiXJjXKSQ580m7u68YeCOT3neuc27TUA/x0uuFLPyUJQiH7wGzMzuFqS9N7iZg2yD2UoQo/iTAvF6G9mppFDw/IKOou5XEg1rk/Gqa/cpXK+LQtXGpZE0kOq3wTMiWerHZiYxld1oLgyGj0w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:37:58.3760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e071b761-f4f8-4481-d941-08df19565a69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6325
X-Authority-Analysis: v=2.4 cv=INaXmQvG c=1 sm=1 tr=0 ts=6ab39dfc cx=c_pps
 a=7YeuQJ2t1o+NR7xo1DCA9A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8 a=zOxIcUUqBP0-Tl0XkjcA:9
 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-ORIG-GUID: Iwd0FVdoC2-imaPSzA3i-WAIQ6U4sDVZ
X-Proofpoint-GUID: Iwd0FVdoC2-imaPSzA3i-WAIQ6U4sDVZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX0Mkj5KVjzWaW
 SrbHPPWqvvPre+yC1BdP0qTOqh/kozoiX1+c9L53LK+gieVleAmbZrIGYOSpXM7M+IAykIX7YnV
 IkU+gOUkNTSJc1zfEIMhRSm21NkLwwEuKHoOUe+f7WL1PRrl6IN2zn5PMwrA9kqY8CGfXUUAcU4
 quUwFkdsyL/VJ8pAEeISRxMODFlIRdmotPp2TXJd5+Y3B64HOsdzBFF/TzRwKfJzZP5hOv9kNwV
 RuDdqd8GILtTJw60YSZ52vPBix4gCKjKjm9SIuPdDWPVWmMQrcyQ0xDUsbolyhNbHMD9qDlROXY
 XzsjoEiQqGr8PwOCfYJE2bNIQDl5aCvpTBy+pag+ykewbS3kZahhf1Sw98uELYif7h+uySRM8yx
 u3Q9+UJ5O6a+eeJnuE1zIXvnwlLK+om8+IaAodVuHUHdw0I70d+2kvr/eR4jR7AWLi8f/6BvnR+
 KcGJVBpINIDNc1PvshQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX38h+ahkIKUFG
 sMgsCzxC8ggVhI3Wu1jidWEI+PreiC+58LLXDPaks3z8PXYtr9As1EtSElsRmZBSzh9a71VlVVE
 a2grXQDbajkoHJj49HU0rn5VYvsxZic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

From: Jianzhong Xu <xuj@ti.com>

Arducam V3Link camera solution is shipped with an UB953 serializer
and an IMX219 sensor [1]. Add an overlay for interfacing the UB953
serializer and IMX219 sensor with the RX0 port on the UB960 deserializer.

This overlay can be used to interface an IMX219 sensor on any platform
that supports the V3Link fusion board.

[1]: https://docs.arducam.com/V3Link-Camera-Solution/V3Link-Camera-Solution-on-TI-Platform/Introduction/

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Jianzhong Xu <xuj@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changes in v3:
- Rename fixed-clock node to the generic clock-<frequency> form
  (Krzysztof)
- Also rename fixed-clock label to lowercase
- Drop underscores from regulator node names to follow upstream dts
  style (Krzysztof)
- Use GPL-2.0-only OR MIT license for consistency
- Update copyright year to 2026 (Udit)

 arch/arm64/boot/dts/ti/Makefile               |  19 +++
 .../boot/dts/ti/k3-v3link-imx219-0-0.dtso     | 128 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 9d3ab69267a6..54a1db39869e 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -250,6 +250,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 # Boards with J742S2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
 
+# IMX219 FPDLink Sensors
+dtb-$(CONFIG_ARCH_K3) += k3-v3link-imx219-0-0.dtbo
+
 # Build time test only, enabled by CONFIG_OF_ALL_DTBS
 k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-ov5640.dtbo
@@ -385,6 +388,9 @@ k3-am68-sk-fpdlink-fusion-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am68-sk-v3link-fusion-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-v3link-fusion.dtbo
+k3-am68-sk-v3link-fusion-imx219-dtbs := k3-am68-sk-base-board.dtb \
+	k3-am68-sk-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-am69-aquila-clover-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am69-aquila-clover.dtb \
 	k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
@@ -416,6 +422,9 @@ k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
 	k3-am69-sk-pcie0-ep.dtbo
 k3-am69-sk-v3link-fusion-dtbs := k3-am69-sk.dtb \
 	k3-am68-sk-v3link-fusion.dtbo
+k3-am69-sk-v3link-fusion-imx219-dtbs := k3-am69-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
@@ -434,6 +443,9 @@ k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-j721e-sk-v3link-fusion-dtbs := k3-j721e-sk.dtb \
 	k3-am68-sk-v3link-fusion.dtbo
+k3-j721e-sk-v3link-fusion-imx219-dtbs := k3-j721e-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -452,6 +464,9 @@ k3-j722s-evm-fpdlink-iv-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-iv-fusion.dtbo
 k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-v3link-fusion.dtbo
+k3-j722s-evm-v3link-fusion-imx219-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j742s2-evm-ub954-dtbs := k3-j742s2-evm.dtb \
@@ -538,6 +553,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am68-sk-fpdlink-fusion.dtb \
 	k3-am68-sk-v3link-fusion.dtb \
+	k3-am68-sk-v3link-fusion-imx219.dtb \
 	k3-am69-aquila-clover-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
@@ -549,6 +565,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-am69-sk-v3link-fusion.dtb \
+	k3-am69-sk-v3link-fusion-imx219.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
 	k3-j721e-evm-fpdlink-fusion.dtb \
@@ -558,6 +575,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtb \
 	k3-j721e-sk-v3link-fusion.dtb \
+	k3-j721e-sk-v3link-fusion-imx219.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-ub954.dtb \
@@ -567,6 +585,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtb \
 	k3-j722s-evm-fpdlink-iv-fusion.dtb \
 	k3-j722s-evm-v3link-fusion.dtb \
+	k3-j722s-evm-v3link-fusion-imx219.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-ub954.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso b/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso
new file mode 100644
index 000000000000..3ec24d5ff2b6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * IMX219 Camera Module for V3-Link d-ch Adapter Board
+ * https://docs.arducam.com/V3Link-Camera-Solution/V3Link-Camera-Solution-on-TI-Platform/Introduction/
+ *
+ * Copyright (c) 2026 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_imx219_24mhz: clock-24000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_1p2v_00: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
+	reg_1p8v_00: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_2p8v_00: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+};
+
+&deserializer_0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* FPDLink RX 0 */
+	port@0 {
+		reg = <0>;
+		status = "okay";
+
+		ub960_fpd3_1_in: endpoint {
+			remote-endpoint = <&ub953_1_out>;
+		};
+	};
+};
+
+&deserializer_0_links {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	link@0 {
+		reg = <0>;
+		i2c-alias = <0x44>;
+
+		ti,rx-mode = <3>;
+
+		serializer: serializer {
+			compatible = "ti,ds90ub953-q1";
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			#clock-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ub953_1_in: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2>;
+						remote-endpoint = <&sensor_1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ub953_1_out: endpoint {
+						remote-endpoint = <&ub960_fpd3_1_in>;
+					};
+				};
+			};
+
+			i2c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sensor@10 {
+					compatible = "sony,imx219";
+					reg = <0x10>;
+
+					clocks = <&clk_imx219_24mhz>;
+
+					VANA-supply = <&reg_2p8v_00>;
+					VDIG-supply = <&reg_1p8v_00>;
+					VDDL-supply = <&reg_1p2v_00>;
+
+					reset-gpios = <&serializer 1 GPIO_ACTIVE_HIGH>;
+
+					port {
+						sensor_1_out: endpoint {
+							remote-endpoint = <&ub953_1_in>;
+							link-frequencies = /bits/ 64 <456000000>;
+							clock-lanes = <0>;
+							data-lanes = <1 2>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
-- 
2.34.1

