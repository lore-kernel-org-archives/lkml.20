Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC491472521;
	Wed,  7 Oct 2026 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367670; cv=fail; b=I82+Z5uL+IVAqTYu9/yRKYGyQv2UUumKhAlyEPXip/MEOcs4v12ZeOmJ4fIlCer1DqzH9jNu6YV7XDt5IIlwABVj+w7z4o/yKMLelL7Qhuh1FjZMK6xyjI2CrwkA9/qvQlmdU53lwHMx8508ULuSQbT2pDPuSx4OYtK+XxZRICM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367670; c=relaxed/simple;
	bh=TYlXB50Yu0dtQ7ZYc6BJ2WvrRI3hfPmTce+SGzFpnB0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMFyUtQUdIaTAFYE/DURrIScM6sWkx6U9hp4/AjtFzClsoOECtMOk8qtdllgKrPP3M3PSfrKqcBojTbRDR4LQ/8HWuuThcAjL3gJL4VcBOtFwQHyOVQDpD5cj3ord7N987jqTtpRIjBxHfstk5HyUK2LsTfHRNfZiboo0XckB1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RdDUG8qR; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=m7O+oxgX; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="RdDUG8qR";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="m7O+oxgX"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6977ji9f557665;
	Wed, 7 Oct 2026 05:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=i7F7Kq2Nhkfckbmtp7x4VQ8B9iQUhIerk80mLMGWh
	ys=; b=RdDUG8qR7Uno0L+YIrIoXdssJ1HWTWFRLhh2ObL4HXAw2ulABgfkC3JYC
	nXbPyGmXvTV8fLIUG05M8wvvr5NiOPC94hfOHXew7NL5zbm5OW63TcEqcjACgYRP
	HEP4ddkrof2+qT0UMNEn3XvorCL6LuwM0q/yJdsHjhltX2UEfrq8q6Dx82zEqG+L
	raKvmx58hMeFwW5Tat7OxNs1YSuDWZNE0CRRMW82J3c0AXH+63ZzVxXdFeqCbKIy
	u9PY4E5xWBGBq8/m5RG07GGRNawvLjPa3wAt7kzBptbz9lb1tsiqqFFuNgtTu8Pm
	mLlxtD9wzcCyF0kyqgQtAb1DipGSA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h54a6vysh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:07:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyXjCOtFYlnb6GGaxxold4W7z9KKpfoToTnLx8y3RF1qDYfW9XwydU7TaI5jskuF6LhFCOPRnXF+l13575iCT0L3R7jsWfAlyHLRMlkn8NOIyDjIlLKoMpvGDt/ju771GTyG/RQ+XULVENjuDBsarCEDOFosV8xdvzylmjmYo7eyKsr8VGSRZVsZmYsk5ZJYuwcsjwtxYFtk+Q9qMNxPBLSZgJtBTWUoNMu8zLM9eEGCPYMPVDGBCPPf2eHW3Vneyz/zvXGc4Bi8iWS03ciRCK8rArBfJuBiA0tHpPfIdwx0efHBoSJRinwINmjcadtiIeeywaOcfgwyprrhclmL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7F7Kq2Nhkfckbmtp7x4VQ8B9iQUhIerk80mLMGWhys=;
 b=E95BEM+W7Vfg1eOpAopWXfWnLMUvWfJ75F19buQ2M6PfDqDFM0TJLkju9L/9WTZUaXHinlUumyG1raxavU0bbigmm9gmwvm1272HBYRd8V7NCuwWb0ci/zcp9ygLrcSybGjBnIKBJRYepQV4tfr37treSaZsdtGes1ICxbGhlQdB7nhFffia9olrI+Ft7l+8uuTAyMhzkv5GkXUWEsENuB3uDYBaBuGzzPuGZX0MhmSZgUPAcfx218uzuG4XrAvLwqbDEY56dcejeARuFI1dTqm1wv7/s2Pv6TbHWdWXJryyYhFlkBPLhzdU/cCOWPeULc8i6dtgJ2Hhkoi3wSgF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7F7Kq2Nhkfckbmtp7x4VQ8B9iQUhIerk80mLMGWhys=;
 b=m7O+oxgXzqD+H2WK/D7EPQ493v+K8qEl609YhuNEPUyZMUdz3vamtqsapO1w3EMzrWjC1xXBSlhUFeh0i3qp5CjwXyNT2mC8yZW/pXfIi5xl/FC6XSlraTTk/fUwSXnHv/BIhjYKMzjgQcPmQH5o9gei/gGMljjALGhnZpWAI1Q=
Received: from CH0PR03CA0205.namprd03.prod.outlook.com (2603:10b6:610:e4::30)
 by MW5PR10MB5692.namprd10.prod.outlook.com (2603:10b6:303:1a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:07:17 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::4b) by CH0PR03CA0205.outlook.office365.com
 (2603:10b6:610:e4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 10:07:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:07:17 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:07:16 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:07:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:07:16 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697A77rJ4171897;
	Wed, 7 Oct 2026 05:07:12 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <sebin.francis@ti.com>, <praneeth@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <s-jain1@ti.com>
Subject: [PATCH v6 1/2] arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
Date: Wed, 7 Oct 2026 15:37:06 +0530
Message-ID: <20261007100707.1065564-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007100707.1065564-1-s-jain1@ti.com>
References: <20261007100707.1065564-1-s-jain1@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|MW5PR10MB5692:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f85f1a-6aab-4fc9-a1b2-08df245ac491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|3023799007|56012099006|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	cCJhNGHkWvBZGdEeNuWBD+PeyfE0hc9BaVbWzbKdl752cbb1ALbVzdBisAN6C3/tkvUa4ygSKlUdxhaP2b8UuWRuPoJ7JMYAGPNdj9NAkiwTuEAOk87G9YxxGWyKbpF51JM5R+jkFq70OzHsx5xkUkHwIpZ9vT+sP/wk3EAhvoVTF8g3PuTBOcLpA0JNHTu+IXAD5/oGu+qk0pUp3qtmVUnR+F6HZQpkSjf/QNl4DTYtjgGzsa34YF/vdDAlkoFsA5DOCJpCgDVzbBzlzTJYw3Rm3aA3XaPpd+20Kw+oOXYFqovBGUWW6euMFETfCGOjIeRZVV0qve/zCi8MhINETjZlARC2yRJCi9x7ONpyRKBKc9haocCmJ/CYQDO3jssmBeVdLg7fzr2ybcWYRUb80e5zFTg+jkQWbeRRWkYoCzCHmrbUw7tSEeNn8AUK88eo3KvICHJzK2k79JJvRPeuWXLMebByjPENCOUMxDoxUMG37MaH1+AG3innYtGai8JdJUfqELJMskd57spoJ2Zw78phBBn086lE2xBmErA1rlLxYHnldsPhAhsMjMLfGpxS0mPzrp3V+J6mOOGi4wBkFT+B0uAbY+sbmP2Y+FUCA86l/z7KabRuqrICEMIif7yDQ4/SAUm6MEM1Ion6j/IHjg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(3023799007)(56012099006)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/KXoZVuS6iGvMdS9+t4SQKORij8Kt6/iFJppknVfr5F3jYzRRHkk4prIIxY4dgix3kZ/ObvKz6ObooSLOyCI7E1FiPY7dA7Nu/nBgZAwz0E2dFLZ5+JlEQWJFHj9IF4IPqV/aS8dhXWpvqS1aJjwRZ05sniMwFNXEClxxbd8VSRUiDfRPTKlFmhMhYcy5U2fbHBAANKvY+EineXF8uZRyM7JUKFeu5qGBN+7rCtyeWHdfeXeB2+0TzJ8b+5v4IvtjpvbYPU8mZmpKnTIfKAXkOF6ChGtZDcQjq8U4VIz/xs0I2i3XeDrFoAq7IY5E0mRa/GPyCt3y5EFzk54jPF5ak6a/E3PKtKlMs1E0pBIzjloGqQzhxLCsTMlyN1eFY/LL/SKn0CwfYSL4JY1ALM5PdtEsWidG/5ZSG1HUxF8OAFLP/FfWd/0cBHUOtrgYYvn
X-Exchange-RoutingPolicyChecked:
	iZxZVP8lqtOLowHwgeImKdx9oa89J32eQwOjKV1qkLXwB9CZtO0e6RX8tR5IIEbaC3IPAH1XrrymGWsZMroQ8co6ewCBYnvToyG6+aPimXvgqnENoLSfOBqXcoI+N1H7EwszD64eMGOfYIf6rMtnVMLEmbc5EuZXZYHN3/8NXIoW3Crd86nqf0+DGleWPxGunbsdLALiEAlKKd9QdUDFBnUAwIEtEGvhoKQYrED3biMh4nQAnZ4UjqCmqcHjTbWQqpUXO3pxtAhvrCsCnAKiMhbYleI6KU/IzonLjAiDCIdwp8Kp2N6FTInO+5GV8PPeaQCsAIuMRJBuzt9Ws9Ptvw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:07:17.2522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f85f1a-6aab-4fc9-a1b2-08df245ac491
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5692
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXxUA5eUZTE0ZM
 343LwNJzmsA8iyiJEZ3dPZC0W6Rp7fV+w7AV8Dm+4pbWydkrQV/RAAy1E5OaZFp+6I65QECCUhJ
 sJBKgxrm6efd1/aHJfloaErqz0vbj/Zorm7nwCYYRVjK5E5YWmlPFakaCr+LrV5tm45tmd+RZZj
 iU3zlZFdunwGD3UjrVy9nakYcPcR+yIXXCrytzOGqmIBZ1cTc4IBXY29ut9mF64C0KFi/qqrVpO
 L21VIlxgDm4L1sCD4/xzRlljn2+vWeUevTCFJiQZ6j6JWpGN2vPKU6urCBlFqyygWFt3LkKuqpq
 5gWdugakkDEVUB+POI1FLTBe5mh+c8Jn1RgWlzRmxNdoe68mngFMXzY/uafloRhXcPFW0Oz/mqf
 Fn5Rj2WA0H9I9OemcHzhsV3eMADgk8yhYR2MXTCVUk1oz/1lCZQUMALU/lisJmeK64E+Chi6LAF
 wcfk+yoxHvKzxyiqx2w==
X-Proofpoint-ORIG-GUID: laYLVPt22-qfYfa-hi89UGp1kOTRuFRh
X-Authority-Analysis: v=2.4 cv=U88Hnuru c=1 sm=1 tr=0 ts=6ac619dc cx=c_pps
 a=BPguv+Q8Nj9xbNSzergmQw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8
 a=FLfJYUKuRQtBdiMmcTAA:9 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: laYLVPt22-qfYfa-hi89UGp1kOTRuFRh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX6gQN4wSIev/l
 KJvn+RVRADjXMMg51oQWS90R1QhEggSjCMxExZTu1amH0h3IKRbNAJpfHLMzja5wNH/GIVvbR7u
 OVWYsYGdRlxq2MWOb9Nf9TJDy8tQi6c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039

From: Devarsh Thakkar <devarsht@ti.com>

Add DSS, DSI and DPHY nodes to add base display support on AM62L[1].
AM62L shares a single video port for DPI and DSI output.

[1]: https://www.ti.com/product/AM62L

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
index 80615ca1e01a..a3199a2455c3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -544,6 +544,66 @@ elm0: ecc@25010000 {
 		status = "disabled";
 	};
 
+	dphy_tx0: phy@301c0000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x301c0000 0x00 0x1000>;
+		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&scmi_pds 86>;
+		assigned-clocks = <&scmi_clk 343>;
+		assigned-clock-parents = <&scmi_clk 341>;
+		assigned-clock-rates = <25000000>;
+		status = "disabled";
+	};
+
+	dss: dss@30200000 {
+		compatible = "ti,am62l-dss";
+		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
+		power-domains = <&scmi_pds 39>;
+		clocks = <&scmi_clk 162>,
+			 <&scmi_clk 161>;
+		clock-names = "fck", "vp1";
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+
+		dss_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	dsi0: dsi@30500000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x30500000 0x00 0x100000>,
+		      <0x00 0x30270000 0x00 0x100>;
+		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&scmi_pds 38>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	gpmc0: memory-controller@3b000000 {
 		compatible = "ti,am64-gpmc";
 		power-domains = <&scmi_pds 37>;
