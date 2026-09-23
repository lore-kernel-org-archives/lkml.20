Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571BA47AF67;
	Wed, 23 Sep 2026 09:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156286; cv=fail; b=WyLgEhq7arefgDqbMWmnLQofoGNfv+yX/N+pvmch87vX84qvEaP1JIi/86amcty89/r4H+oC7cOtqqTKVCH+uSFUEwc05Wgc/Fnsm6PwORxv94AzLghZSF3lh4VUZEr8ZHVprHXHcwMQl9EE9hFzB9sQJ4Alh4qJscdTcLBnyrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156286; c=relaxed/simple;
	bh=QoUzGN6knr8VI6g97QuCJWK/yO4Qz3h+gFFBqcjeHLg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KgOLs63VX5fFXZpBWP8m/jBGusCwHBJo723OYW/qZPHseY389zxHk0/RraCLmW6Wx46Zx7HqzDcTC+ZK7/t1z0s7I4wnVaHdcux9lewSsUamMThWcxJiRPT1AxMlJ8JZubZ6pURLSsk0YAFOBF3vk1PVqPbYLIjEWx0WFKK5ocY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KEH8b8/s; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xBE8EYT8; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KEH8b8/s";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xBE8EYT8"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8N9AU1611704;
	Wed, 23 Sep 2026 04:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FHgFCrEBclxrYOXsDNwvJQN40NDrn9gm6aCdVFS4h
	zg=; b=KEH8b8/swxV6nCIqGKprMolHNagcDehcuIMWsvCCpwfvlQd4gq5HUyCtT
	BazOMSZU4rAko2CxseF0cMb9uKdvLBAFo/rzM6jLc5wMPYslqo+2R1Ht5N2f7tZF
	reH3io/Rvlsm+a8+4KZZkG4YtuidL2pGP53QG+dPZ+31Z54wVyIzAHlqLAAcVKUf
	GeGxiHwdmPGxqcPLIcNUUNw1+czazdj7RAJ3dL/NVM+vSx/Mev5MCNzb2lfhcARG
	Iv+/HZj9yoZI5w7q1TiYsNK7asvod9iePtkEMfMzHZaLjuWrA0ERJ+O+QSLGLqyc
	/j0qXWpLtT+r0lA8SqWccIDXmHHAg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77rddt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:37:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsjcMwuw8Y0ScgvMPAAFAunlCM+JBpPT2kZeAuqhTCxV9C+xQa4Ph/D8FYLZEWQ47LUmBbAgPs2c0XzC+kVSs4J3XPKjhKC1UMTddRhZ8OQOpbH07QiYZw9BpqkQC01WL9mvKtL12aQhMjUtooIixM5mg20QypTGQC7hmVtuN3hI7uAf2BpkvbdpsIVgm5X/LoAZek2x8pSTf23v4XxlDRhfjw56JrjmnTocaQ4ljnkHYiNsIdhagL0bVOtpo6JFBpnrLBwG62VYTPmsG7tbugqUVkoG3usnlTbttUfasBa7Ay8eli4djELRpWWbhDDj9wgpX5OUQpXGBKSRHCZbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHgFCrEBclxrYOXsDNwvJQN40NDrn9gm6aCdVFS4hzg=;
 b=uDETtd62luL0pVay84xpfxb2AqkMO6ErwbIbBhoMOV4fUrjtj5b8cD9CFYYDxXNXdgu/0D/rPnxUkcXRRZ/To95tOIjvuuXgyuYGU3URx2TbMKOl/4aPiYdPjRM6CTwt5bRMSUqcALyiBoGnq/Sxf8I5V/qQVuQzSjE3lrqHITHRZbQTRl1CKspl2nBzj7a02YNMmwoa69aVV6dgkCV67c9tqrg1eyfcSdjoLk/5qmdOaZC3ELZ7ol6om6kKnH9zsZHD240ub7ChfUXS9wxMw3aNg5PhsIxo+Q0Q2Vbdt9ifAzqJuJO0nY5QIegpfcfh0/xnZrWABxu8P35LO/y0TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHgFCrEBclxrYOXsDNwvJQN40NDrn9gm6aCdVFS4hzg=;
 b=xBE8EYT8ekyM2jFgRaCpITESzUDlncv6c9s3kN2nQ2vFRRYvFVNFOmNX+A5vYpceufWKYhdph07DFL2E763zx3/ZfFZpUEVfPciHJs2qbVRH18YFLhuBH8nZpV3jGqcnG5v8IkMhdL3Vh0H37WKVuHPTsfiQZeyQyVBRVjJGxjg=
Received: from CH0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:610:b2::20)
 by DSWPR10MB997910.namprd10.prod.outlook.com (2603:10b6:8:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 09:37:31 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:b2:cafe::8d) by CH0PR13CA0045.outlook.office365.com
 (2603:10b6:610:b2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.11 via Frontend Transport; Wed,
 23 Sep 2026 09:37:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 23 Sep 2026 09:37:29 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:54 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:36:54 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3Wb1760658;
	Wed, 23 Sep 2026 04:36:48 -0500
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
Subject: [PATCH v3 13/18] arm64: dts: ti: k3-j784s4-evm: Add overlay for J7EXPA01EVM Fusion2
Date: Wed, 23 Sep 2026 15:04:54 +0530
Message-ID: <20260923093459.28125-14-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|DSWPR10MB997910:EE_
X-MS-Office365-Filtering-Correlation-Id: 9694fe71-52f0-4462-0f91-08df1956495a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|13003099007|3023799007|10067099003|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OgyZTyk6lEzYhqxZKUz8tlZC4vkeMk03OP0BwBFvFXRedJE03rzaZu3ZXei72A4lmG+OP+Sku6spSxs7SlFOjmpbMB0W7/CSV+YoOmBLeKJYPZr0tio3EpvMAtGmDEqgZdysI68V6m+k+3o/Uc6z3R/4s4lb/LEn0XBiqrc3LNsF9waszlIQDuhmWrxzvPwf6U1G3bK52D9x/B3g+8exdMIOBSIsTwruz8J+5+uuIQ4v9pliYE7Tdad/niwS6i3kC3JibS0ZuMWSK05Q4S96FUB8KkZ+Aajsp4lXzliDTQsoxWhIUScC8i+qhlzJ+bJOdQMpzxxJQPW1fxk677PnC5C4CFx8th+MKvwoTQPhbQvR+YIunBGVWTdFZw8UWMraUYVq6Egp9xh3Q9Jy1aM2tUM5W5znF7I+b+UHkDAwMbYGkelIXxy97VtjjT5z3CAQ78TEtMLIHyn8UkVvvBrGxuMgKGM/80aquxxJKKYt7hnsxzwsPriJAgmIFuXEWh/4U1hqRk0Msgzwll4MUeVrFHxuKYUeVIaxd6nZRRe90v/pMseqHlEMgdtmrL6HgoEigYx37bwJspZyE0rpN/jS8LB6kpP7SerJIop8/y5OvFdwzGJQOLKhG2A5uZorlATSSmD39DGOypQvnd5YUUh5Bg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(13003099007)(3023799007)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NDu3wBurSpqKScGwYd+CNaCAuy6Wkdjeg6ezb7QqSXT3VKnIz1QVJ+ZYmIwxw39CAA1l70GQcN7DsQ9iy3KoDjZ07q891hKgblhIuOq4mixBkEICdW5DXS8iUDXm1ttCUH1Pwiwa8BzTHcSUS3inD/mTxN7ASFcB5xQ6Ch6H2ItU/KHZQq33ZFshxoI16fl0Oipk+Ng9BHiqyn8qb0muS50CAq2u1lZesCk19MMisVtnvvK2m0cK6Kae5oHNQy3ItbqCLB0u07+Q8QjfcbduTedQlVrYoMKW3T7Nc7GZp1O0UL2jS6r2Uev2RkNRBnr04+jAFe9LK1z9PH88Y8wlkBcH0OyCkAk/lKKgfJnzD/UWuahsNWQdaJEIke7U2bWRGyVtWF4p97nNZysqNCZRFd6FiVvncIJAxssYAjGtI+OlqODoWzqV5OcpdEEuSKsc
X-Exchange-RoutingPolicyChecked:
	aKvL1GwDMc7x2+XPbDbltMpuN1z6nDdck8ZE9/LK8bkxVr/We9M7EfxZeUMg/iuRMMeMzxAa00AaQHfmAAnn16wfoYjzmfaqxVfXht5w1/MvgBmb0TaUrvorurNrol1U/yKapVgvsC0Bf4/pBIyFLOOZiBM279UsVT2Wwb3ndTd8Ui7d8Lo6ZJOAo96Ne7lhsgXnE9ejAGSchgLvfJwt5WnMZAMYRgkNswUoELNhsei9rs5ISXR0p1+6TZ5XKLCoO2jA0Nq1klZqX5lzdJTJ1aLJSRW6Or0CMEugTZ0eX+JOo7LVDA4oKaQ61tc1POQqHjXd+BU224UAoTb7hF1CAA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:37:29.7498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9694fe71-52f0-4462-0f91-08df1956495a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR10MB997910
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXyty6bbY6P/NI
 ckPKGi4O2cWc16/DEkLUgpdwFujAE1IG/Kmv7rNtIMQSoG4ysp5pI6pIbZMVOqT47/wN4+ykhGh
 8oA8gaYte5dKChiKeplB8R3IoezjCc7bWMAfpo2Oe4p5a62hut5x2GOoYMgRpJK/+NMA6GAjoTq
 jS5rirqaBajTx8josLOSwD6kR+mVzdHg27l6wVAjJXyHWZ1zypyXpI38g4xYOhNv1MdVpdiyGsQ
 mKDskK2PJj4eLuhunNFG3f5HhB+78/e5FrupOspTxjpfoPb3AWb3WDSUTYNyRDTcYTQrpDeovBb
 hA8ivQwjo7Nv8tcjdjA+UVkdwNNy8LNLDbvGNdYCLMtY2EStYhbUErindcYzoaMMBIYqjlw19dZ
 ITA9y6cF9VOdaitPSHe9uRaPIY6Dzum9OBdpvW/fx1eWl/pObK35x4bf1aJE47HDwc0MiflP+64
 xMI+1Jq9MEH5upMoKbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX4lKRi71zOtgH
 ya9Q3+g3khRqNMVlcnbifpOJJEsMinmokEhZs2ASVF6NCbUh1xHbHgzLFLDF8s25VXS4bzIkpb2
 jKvOD1Yx6S5+nfZAtFcpLOfBF9xOB/w=
X-Proofpoint-GUID: arkhHnTLSEfM-U1M-uvcnhDIMkaqaScl
X-Proofpoint-ORIG-GUID: arkhHnTLSEfM-U1M-uvcnhDIMkaqaScl
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab39dde cx=c_pps
 a=Getn/9gNXKMn2yU3BA3TiQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=I3gn05AaVm_Ch417H9oA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

J7EXPA01EVM Fusion2 serial capture expansion board features 3 UB9702
deserializers, each capable of aggregating data from up to 4x cameras
over the FPDLink-IV interface. Add support for the same on J784S4-EVM.

EVM schematics and design files: https://www.ti.com/tool/J7EXPA01EVM

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changes in v3:
- Rename fixed-clock node to the generic clock-<frequency> form
  (Krzysztof)
- Also rename fixed-clock label to lowercase
- Override CSI2RX ports using &csiN_port0 labels instead of the full
  &cdns_csi2rxN node path, and drop duplicated properties (Krzysztof)
- Fix minor DTS coding style issues (Sashiko)
- Update copyright year to 2026 (Udit)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso   | 257 ++++++++++++++++++
 2 files changed, 261 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index beb44ebe5277..ed8966694d63 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -238,6 +238,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-fpdlink-iv-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
@@ -448,6 +449,8 @@ k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
+k3-j784s4-evm-fpdlink-iv-fusion-dtbs := k3-j784s4-evm.dtb \
+	k3-j784s4-evm-fpdlink-iv-fusion.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -551,6 +554,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
+	k3-j784s4-evm-fpdlink-iv-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
new file mode 100644
index 000000000000..d0429bb58b31
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for FPDLink IV UB9702 Deserializer on J784S4 EVM
+ * https://www.ti.com/tool/J7EXPA01EVM
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_fusion_25mhz: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&exp5 {
+	p0-hog {
+		gpio-hog;
+		gpios = <0 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI2_EXP_RSTZ";
+	};
+};
+
+&main_i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub9702-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25mhz>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub970_0_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@30 {
+		compatible = "ti,ds90ub9702-q1";
+		reg = <0x30>;
+		clocks = <&clk_fusion_25mhz>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub970_1_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@32 {
+		compatible = "ti,ds90ub9702-q1";
+		reg = <0x32>;
+		clocks = <&clk_fusion_25mhz>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x6a 0x6b 0x6c 0x6d 0x6e 0x6f>;
+
+		deserializer_2_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub970_2_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy2>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_2_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2_phy0: endpoint {
+		remote-endpoint = <&ds90ub970_0_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&csi1_port0 {
+	status = "okay";
+
+	csi2_phy1: endpoint {
+		remote-endpoint = <&ds90ub970_1_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&csi2_port0 {
+	status = "okay";
+
+	csi2_phy2: endpoint {
+		remote-endpoint = <&ds90ub970_2_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&ti_csi2rx2 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
+
+&dphy2 {
+	status = "okay";
+};
-- 
2.34.1

