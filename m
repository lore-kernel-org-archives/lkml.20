Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A248376A17;
	Mon, 28 Sep 2026 03:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565328; cv=fail; b=tkMSjOE9jYN6epIdyJAxyZ6AIWbRHTyP4TCXftmZdS08X0X1ZcutoxbCuxjgfG0cx7WMWovnSfs6wu8fIbV7TcPyywB8FIsIDb7lznCSfDdC+imDBZJj2n3vVAtah1/2xbJ6ka2i2hOGvg+26XmW11oL4/++8x1j2fWzvKzxuXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565328; c=relaxed/simple;
	bh=GE1B81fct+9rksQaxQ0qr1Ye+5wS3POHVeAA29eI0hY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FvmRk3YSE/f2mcUF1bVt5G7Ntb9NIc9WYjbIxWtql1DGWFzkoCkIraVCPsX/xVACQqppQxeR+9v8PZF9YcqZTjkCswbTM0ZOVsTKZDGOCiW/PlqLOj7yLc/JzFUYEjb9KPVWg2Qz8XnDszr1TfVutkcAS3EX8ny2eWm7zmY1Xbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IpshdLqV; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CF5Nlvh2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="IpshdLqV";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CF5Nlvh2"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S05DEn3708738;
	Sun, 27 Sep 2026 22:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=aO05jnDXhd+yG
	avEnusttvLF3V4kxJ/OMNjiT6StG3k=; b=IpshdLqV49l/DNB7NJg/xwS804Utq
	wL2lZ+BoqB8lF41Sr7XZclsIi2azTtwvqv7GP6vA1po9KKIFeQSkTTqbbCL2Z1U2
	sB98JMHEZxNEAq0V8f5NfCYcQdTRCc3fyvJYFfTFDB6dlOZ9MPw+reYbad43doqY
	ZVnS6d5GpA6KyE9gVUTp4HGztIbbswTgPuddRHDb13mvF5X1VLtyjWJRl7lIc624
	4QlwSQjQbl8hvAr0XXxksvKQckpMixT8rT2ipQl3WTUl21p4B36Z0WMfeUSFCWzq
	UR7Bb4VecrIZZW/tyMOn0n/n74qhqJLMCuhsfiSvuUzYv/Y+qODKYGFhQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011038.outbound.protection.outlook.com [52.101.52.38])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nb3wv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:15:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biPnIKAU52aIMxecLB++put6lqprYAltt25thZkgWb7ZFhCU9KUF8MfbWhCqslDEmkCrWxt2v0ZN+WXcgQjA8rVDshpFwlTIiz4Ga6m5HVvDF9Kx8Um/G3HlS3GeE7qtHFRlQwEPkN3MTFPs4w6Dhq0UbUPP/SV6hjlJlZd42m+IO5uQd64nSFnDnAI11NXjPgngY287nI1SCBh1xxeT+eqnBfhY2QOZ9vTE9cghE9t9iSdVw0owL8TCVQco9ZaPaOFVNW7oyEGWYpZW63iuqNG4Y8S0rdmZXcA/ymvE3SOugOMWUy3U0k8C384/MjKfUINFlsfJnrqAW782k22Zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aO05jnDXhd+yGavEnusttvLF3V4kxJ/OMNjiT6StG3k=;
 b=w1Hz+knFesPrnJhZ/G57sFlVfQbnDMwV5bTQKaK7Et7iWM/p0IAS4gJYACcTMDnOmeP4EpjaY8sKX6pwQGJfZiZ4b7tpeHc51XeHNlmT7bbeesfO2haOwlyxnMfi4Bx2pqprB05Di5/sok3XnTgk3TUHLtKG8SnXYkz9Kt7vdPoM2KrtY3KpRM5LE1YtV2ylRNjsAXFwPB5QY/GRRAzSUOEm/1ENY8O7+1Eg/3GFqz1R0q9iXYTnFdxaAFMdZBmuL0ZQiM3okSG3w0a2DeucyM58KbR4VM8TT1pHSSUtQs9MQPvMe5Uq8BCU03MPQkiwScQ52rmpryiVAyfYBgp5OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO05jnDXhd+yGavEnusttvLF3V4kxJ/OMNjiT6StG3k=;
 b=CF5Nlvh2ru12EA7JP2/sPc8oglTKeW00zDuhHq7uODgFXDJjCm+jN1UGwdQx75TV/ZAmtaCsaP6b3e18ePSDYr8nZdWJXamrJ1kk/MW3zst1bx2BsTeB5lpyUiHtPM5KOJcwdrzAZwC0BwcK77M0lk5uQ+fKhcjFcmNmkyTT1B8=
Received: from BN9PR03CA0581.namprd03.prod.outlook.com (2603:10b6:408:10d::16)
 by DS3PR10MB997727.namprd10.prod.outlook.com (2603:10b6:8:348::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 03:15:19 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::14) by BN9PR03CA0581.outlook.office365.com
 (2603:10b6:408:10d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:15:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:15:17 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:14:58 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:14:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:14:57 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3ErDj2281678;
	Sun, 27 Sep 2026 22:14:54 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 0/2] k3-am62a: Add MCU SRAM node
Date: Mon, 28 Sep 2026 08:44:24 +0530
Message-ID: <20260928031440.1067076-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|DS3PR10MB997727:EE_
X-MS-Office365-Filtering-Correlation-Id: ab824fc9-7e59-49b5-c27c-08df1d0eb8ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|921020|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ehBI5i1fGckwDNVBYIkDrRl2sYpG8mW3rvEk7gJwThJhEh9jYRWyKSa5Zn2y1FzQ6h8pqASTJUzKfbZpIxFRyJDkvKFbJ12RcXNBEytxWWfsHr2HyboQ8jGQh209dcCK4XNlBVUoJJddVZYOEMi3xsxzLkMSg1re3ZVKPYM01gf2we7glHn1EwZQjBZN8Pa43N7z78HDMFyGMDuze94kmi446uG6pLbttn9EwPGV3c6A0L0E48kiDTSggfhr4BfIw66dcyo9LhDOn1LCadwXDlWBNO9gelPFIaArFLz7Dt1vkdekjTywpAeACSWw7qft63npOlSvMelMfMW/PA1575jdXD9GEzYBptH+Nx22UNLiuC3EW5plv2T0xE0+MFeJQMYGXjN0+98pMU53ai7FmRouUWbZP0Px6ayezXkfl9UoDwio3CzHAPDc2mn6/J+/f7Ol/Cl41uYzhM6D1+XWg+H8icQSnLZiS0PmTFKMufpw718QfoTKOtXuJr3878nVHQlaZWwKYe3Atc/nP/H/Puooa4IXjK2mNDkIlX0L5Z3YWNbZsYk7VMENy4DWY+iUhlfBnPEl2VQ9D4LNAklts23Jyxv18zUbdYZM2WAMcUfLi+AxktgfXA/Ufn+a5zsngwblqPtFR+Xz9QFMwF1RPSvgxApW+7iqumEdS7h1zk/qo51qvE1pE4jw1TG57cwS3IIVXeG8Sp8jVQZ96Qus1nfG2sIIXTEpGzUPvSo3uaGtGLw6UpO0poRFfuV1IYgS
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(921020)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2IA/QqoY69ryUhkbVYwIu1cfdSOOjQI/b4cxcIBSd0+9Vg4BcmMyG42GQ2vP/+DWd0WZrtqJ6RjMsF5Gf1uyxoz9XDkO1T2L6RIFFb7oHb14R0vdgGaxh7JQypUb4IrzMmREMUnYzBaAFjAYXz7roY6UKhoOhQanabDF0Uq8u7PNH1Gr2QZmJS79YCOqxNsCgzNgJ+hyFwRavntFheZJRBMKwkqQ4SsE7LAjNUsHR1pbm/dMF68a6X0/YuZZai8CLBj0OJcRBpBjp0uV86OaP3ysxiyJtLd6eD0Ezy+XYyCIdyf/8tzDdSw4zN4qxqaaPXwHxKFYcyheT1fS+1bmxWFDU9sIrRnLJr5E8aopaidwt3jDA23f+95jAQ9mjeLvWgHTaLK+G+OspHj+BSTsutzrX9VB4H4w0EMVpAwwjAVEv7/XDc+qtRxgoDMK9WZ4
X-Exchange-RoutingPolicyChecked:
	C7Tp4I/7UREdJp3iPNbE9OmSCJUArA1XFoiWoXblxxMEr3O6ZQC1W++tIO63iiG0kOOHpCLTtBdL5nHfOyMliPVxbtTTi6ue5iWL7+oPH743v0gjCiSRmEV6P71JDinDv2jMzt0uqWXRC0fTyiRLDwSWXM0Degb5bbj77dRQXzCrVPSpKBdS6YgXugQwtTUoYR5cr1DuyL6R4mv9P9jGaEN5JnzPaLDdgEPXtP1AgtPGPpNfu/cEhHsFQhBU7H0OFnz6vs0GIjHpWy2J7TkdvWRTKSDKskrSUgSvUL4R8cUbp5bwoLGpH/U85kb+VBISRhkCIiawiGjWpaFN8UUElw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:15:17.9269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab824fc9-7e59-49b5-c27c-08df1d0eb8ff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997727
X-Proofpoint-GUID: CrGutirw9Rfh3bNoMggwQrQRNEk4yI7L
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6ab9dbca cx=c_pps
 a=Lazl6XkH4A3N9SONPos2PQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=ctwZnMIfLaT8aCYuRI0A:9
X-Proofpoint-ORIG-GUID: CrGutirw9Rfh3bNoMggwQrQRNEk4yI7L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMiBTYWx0ZWRfX7ntVh772OZEg
 LRkgBi3Xr+V2Vqy90em/kx7n10D5pBA3dC0npV3MkN11tQgAVBjqGuypvC2PxbgXoTSXTVH+PB4
 u4w3SiFXIGlVaCmB1775AdPUC4D4zEI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMiBTYWx0ZWRfXyhrJCwGeeLF/
 xVmIfhvJpVVvY/xz+tyAxU4hypDk13v9bpHWDP0/G9SiDKAdMgIBBE1tvINXyn+by5v9BSuVBXN
 Cwt0AuRNk4R+LU/kt/HPI7CvH4+o7ZMVPQsNOthIjNGeV11ABjUWwe6fb9PDgBW25/s5bYNNWhH
 D5iKid/EKKuMiWyZWtnLuHelRJCb7XQLlIX7zxZKNiX/StkMT7lyA0taxQfxkjOliW7tbHmuUvV
 f8pnm6j80bBk4n4Fo56XX/adyX4VM4v4e19y35QOw5vwlULg1w+PZY9h6XvaWgvMBrLsVRybTTJ
 dZiaustCp7mKi/q35WRyrmKWDTL/k2DWo6d4e5DfXjF1SdwuEIPOXSNUf5FV6zzVvYPdS/3NMhl
 O5BIdRLwqFiLz1dNop1ZBK4eiM5ywDl3Hwrdckg5P1iQa0Gc+xO0HCJMiCqFxg88WAcwprVKH+q
 WPHqatnWw0CmGX8Ik1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280012

The first patch adds MCU SRAM node to the device tree. The second
patch makes the MCU SRAM accessible to R5 remote proc driver for
image loading.

Hari Nagalla (2):
  arm64: dts: ti: k3-am62a: Add MCU SRAM node
  arm64: dts: ti: k3-am62a-ti-ipc-firmware: MCU SRAM

 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi             | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi |  1 +
 2 files changed, 13 insertions(+)

-- 
2.54.0

