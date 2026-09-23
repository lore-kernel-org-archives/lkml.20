Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF6443C0A;
	Wed, 23 Sep 2026 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156249; cv=fail; b=fKflXV08qCP9uEkPUBmfd8w2N9St2ief/z9UpEAmov9C/MSALnxFKYuMni5ZGVXWEER0njoU4z1j3lTQhZ1dhG7m9lqi0i1WY2uNharZE6YgDetVeqUJbwDr6xxgh8db7kLWcuZCwqfnnD6W8JzN0suuG2DjaC6M94/ZPeiKwgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156249; c=relaxed/simple;
	bh=Q4FUuYEKPCTqnh5CivFmN0I532PFGNKYbNs1GTU3OOU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qx5bxIi9REHbAwlEsALeJiXhD3qL/8XwrGg9zexaamQSruRrK9pempn4M4upsdkZPjHazAsPyJnfVqwYEdOTHX4kWDcYI9gvPF45Ae2PthKwF8nRcZ68BBOoNGBxGqkWPB3DgkuWc0Ru/tl8Zg7g4uovipAIiVaJmzNL4nqt7UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=I0/adyOJ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s0kWZNNZ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="I0/adyOJ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s0kWZNNZ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JFVe775670;
	Wed, 23 Sep 2026 04:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1jDkwwfsqI1TcqzoFyc3NPG4kMapNsl/NFqba6JQc
	g8=; b=I0/adyOJg9R1SE1e2hZTa2h9gCI0sT+8Ti/TaimO+ZtSM6D+INzzAnCe0
	zl3b2RmgeP/5SZCvVzUTJ9/jL9bukm+68P+woiwCRkSPH4bu5gfN6iJr5D1W+IWF
	def5nndsz9ANQzlMAVyHIDiNJZvlhwrjBokEV48Juvkgnd78Sf4/+zS6Vkp5AtxH
	pl5clmXpRL6jZWNRzAuoqxp65qrEVevYK4AM1ekZje9HobqeSnJF8Rgdu6xNxCFM
	yg3HMGIPJNDIbGDy3oeknhGX4F86OIjdVQcSte/95EoQXufs3LdnE5wC3AeWIWWi
	xD3EkXFtKlSo/IJ8Ou+0K317kIgKw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycu2mr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:37:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMxT270sByc4oi6GQWfAve3teZago/fGpcixEVFWnW8vcLttB4eGVUb8Pqd56mRwE45NM4bs+O2J0sqfkUMzKu/O08f+ea7gDCCFF4BaoxIDkSjWKyAiROYl7tNCwT2XxyGysMqj+ky4ArxrGGQ7kGJW4KDq+21HOPOzeYbqyTLdDbF7WAH4Ag/c2/UvnuWPEXcQeMcVajdGyHjEzhPvX0Iz+HOtmP4cNFQQCYx9384tfBkVA2eN2k66mwsr4gTyVvYtazNwRTOFfxP67AQvEpDFaZ/L5q7V84XJeRGHPc1vmGcIRLk+DkJPKfwYUbSh0Wp/oQR+G7h0hWPPVrHFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jDkwwfsqI1TcqzoFyc3NPG4kMapNsl/NFqba6JQcg8=;
 b=nFycrbmd93HrhbcyMHsEcs2n58jKxMDmd8CybfRsIZgMXPWi1uBSBPVJL6aJQ9SkEmheR6TX4GDRW0LL4NUNT5bBY6GgTsJrtMRB7kltdK0hy4U4Y2Bd7eOHA7Vc7oy3C57baWa3Jq6gGnQiXa9U9EKwK9UvK0XZzmGPPUZU+DTf6GH+pyQhjuiVshfOY1ptxVAJohgBlvY7n4YoN0d3N/3GhUjURhPXaPy25fgCUHGI8Gttrdd9pL5zZCeHFzj/App6bgfJMgnxS/5LCEZ8MdlKlWRHIbw1v99vOpypcn4IRnCxOP8T+ySfPpMb3dmlax51phY9peqLTAHqbMpujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jDkwwfsqI1TcqzoFyc3NPG4kMapNsl/NFqba6JQcg8=;
 b=s0kWZNNZIACW1OwgI/+gkq7Zhet2oU9lF6BvDMPW7nSJm/FNbCb8dVa7Nzxl85mHF7TLSqPrJypiWAxjlse78ImMSloS4YGm/YHqxoNjuxKoWG0vqpTTY05gSMamafhFEpFb+LbUzde+/dDvmmSK1DHzk1pHSu2DnZuvpiBAWqc=
Received: from CH0PR03CA0333.namprd03.prod.outlook.com (2603:10b6:610:11a::7)
 by PH0PR10MB4597.namprd10.prod.outlook.com (2603:10b6:510:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 09:36:20 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:11a:cafe::69) by CH0PR03CA0333.outlook.office365.com
 (2603:10b6:610:11a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 09:36:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 23 Sep 2026 09:36:18 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:44 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:35:44 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WS1760658;
	Wed, 23 Sep 2026 04:35:38 -0500
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
Subject: [PATCH v3 04/18] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add multiple channels for CSI2RX DMA
Date: Wed, 23 Sep 2026 15:04:45 +0530
Message-ID: <20260923093459.28125-5-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|PH0PR10MB4597:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c4333f-6791-4d32-2469-08df19561ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oOhhFyKZo3YnGtvjOwW/ptThfV0HbdYXcygr7UtlRKT3iFIxcNigmsPXRDq247rD3EKD0GUZJXt/JyxNq8Fl+pFx+41BY+uCNcUIfQ7GN3uzD0JqFXVsRiZ1fxLK6ar7h4bBBsh7UH89u9qBzAeM6L3bBBW7XU/Ug44cxxLUkv4CAcH2AdOeLq9YEyfTRCpYmVAe27/myPom5lLWUljWJjCiu3lVfmO8GEHvIFfCtTNZ+wczbUf1pzF39sumIOgKdkmBRI1J68utB1tWniynjmkqoZ1HfjUnGlQfGuZQJgxD8WGOiApZaXM87Yy2s1y/oDrL3E6+HyrT5hCI9dkGVj235end0FNDTu8oh5wBfxvPaOVFVYXWjTpkcX+qsDGGpBsHq4S4cKkIHOONVkiIBf3Iv28qQ6Y1+rNJr7ISKpp+9INd6qlipmwW23SAKudmZzapsnhGboAwvm1rf4+3UdrnPuHhQ9XyF2HJuNYu1Ac+K/raD5vkuDMJj6X/1N9t5Er7LrOQ2p4Zk2u+BRE8npwIyt4pJTVDUSc7LdBl8UsJEjcslO8u8UjAaYK4qH5K1LqkpPUKHunR2SRjxLhbYnZdQ+cprP09tyMcicF6wrBmIayiLdM/Utv4sl+PvttroG8Zjf3K+LtYyoj7lGnwthwETNFLc67XpoVI/R6zombPIINqzgvS/P2wpWHkkZOyJC6UF6yqSCdpKsIu6NSxsQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hjfvN8W/a0Ockk9kGDSIJnQCE1C33Wnal0V5lRE3UmgqhBEHM8yh/LU9xhraW0rYG+dl7ASt3gpAwwIqUEjciDytrOMq/nUe6HqgVgT5BkgDcF+X15XYxUh5QFpE5yd4L44hI+ImiSIN1Hx+54KkzKecXyrmMCCgbHQj5/0Ut8V84x85+EVgfJdfgNIovosulpsp7qXBNdBvgQrZL3AqO170MtyaEwT39PtYASyxD5ijJEqWAXsUBKwFx6Pes071KCd8mXGstRTT+S27VbIoYlgG//h6Y4mnYS11Zz6RLhl/Lp/WvIX1aXyRX+WDRUbTEqp5ORkzCUaNBkaEjRUlMGjQ2spVOvDnr2YCgaST/TtdLQBAHqqRUs77Z3LXqkwe/p/DUUaw20nf7mzEejy5uYZFS42NYh25AHPpB/VIl0w80hwrAj+vg8uGUdoRY4wv
X-Exchange-RoutingPolicyChecked:
	d49oSbkcugkTxNZKLfVFR8CZ1mcnsbBY/MA2djqf/lGcT2hzZvHHuIW0UvrkQVQxF/zjFdIOLpBkiAbx320wbsNFR8P36AQNRVVx1LhZqvsbHOniqJyGhfSrW0m8MFG4/1aqvUqLz0Koxomz332SfWgwNMBGHcIjTRoL54KzVZX2195/NLTI5lxpMBSYRdmVQ/2j9H++SE8Gw0gqilFcVz1kKKC9ly/2d4yrfyA12avddq+mulsyuPuq2hgIKc/BYJ7sbRT1IerpbYbF4RbkSgRwWm9v8RtI/umJVR9X5rmJnHRWCoJYSUDI4DjYpyZMXdQQg4qgGuP7aCD4huRNQg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:36:18.6564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c4333f-6791-4d32-2469-08df19561ef9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4597
X-Proofpoint-GUID: Fl0XKVA3F35OLMjdgNigY_swAwqGQTPQ
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab39dbd cx=c_pps
 a=k+Wq2vL5ZRQmlAOTCyP+eQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=slwZH6uN_nfNMSXhCksA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX/+g1E2Ef2+Rw
 xiAbLBhsSFXGWVCPtQAOfJtJ0eSfyLJGuP4sAfmsgWcy5qSlRgI/sjldIcrn8Xcg37FC7WPE2PA
 TY1+ZajPsDBEQKOl+9XG/xrKql2CkWCJdTIxMYxNOL0it/L0wXN1lv0PAv71GWn9xZ4teoGlchs
 /BkIQPvSx41eDcgfcjehqv8IEYa+JcsdoTZcTLVqIt/j0vgtBTirWSzubU4mudJnGVYotdVXqry
 40tlxxwpleOiI+32dGzAuHHu+C4dtLBlBw3t96230up9+p8fNh6gftzrjozDEkk4Qw+pcatRp3I
 xb95lzZmD7n+3BG+07RjE795vvYboCxOejb8DwMHYuj/Tpxdbj4CoAr+l+NIBtvfBdX6lOoLyp9
 w9wX7GomM8p+oc0y13dmV/8yQbxXQnEsZ2R2atICdY7CbrulEcyVYXhicoxBypRHGNVvRTRho4T
 zEXnlmGQSiZd0tKPi9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX3lk9+jBHoKOV
 8gJos3hm9jj4zFlK+mxTZusEd2ymQY2rn7j15qsz91qHwRN5d7vl+Ip0WXc0GKDvZnk4/3ko6fK
 IR8xK0B6ieke4ptRtwD+RLOkNSyq2R0=
X-Proofpoint-ORIG-GUID: Fl0XKVA3F35OLMjdgNigY_swAwqGQTPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts.
Add additional DMA channels to enable multistream support for CSI2RX.

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index c2636e624f18..4b4545a5af19 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -811,8 +811,11 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4940 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4940 0>, <&main_bcdma_csi 0 0x4941 0>,
+		       <&main_bcdma_csi 0 0x4942 0>, <&main_bcdma_csi 0 0x4943 0>,
+		       <&main_bcdma_csi 0 0x4944 0>, <&main_bcdma_csi 0 0x4945 0>,
+		       <&main_bcdma_csi 0 0x4946 0>, <&main_bcdma_csi 0 0x4947 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 72 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -867,8 +870,11 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4960 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4960 0>, <&main_bcdma_csi 0 0x4961 0>,
+		       <&main_bcdma_csi 0 0x4962 0>, <&main_bcdma_csi 0 0x4963 0>,
+		       <&main_bcdma_csi 0 0x4964 0>, <&main_bcdma_csi 0 0x4965 0>,
+		       <&main_bcdma_csi 0 0x4966 0>, <&main_bcdma_csi 0 0x4967 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 73 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -922,8 +928,11 @@ ti_csi2rx2: ticsi2rx@4520000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4980 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4980 0>, <&main_bcdma_csi 0 0x4981 0>,
+		       <&main_bcdma_csi 0 0x4982 0>, <&main_bcdma_csi 0 0x4983 0>,
+		       <&main_bcdma_csi 0 0x4984 0>, <&main_bcdma_csi 0 0x4985 0>,
+		       <&main_bcdma_csi 0 0x4986 0>, <&main_bcdma_csi 0 0x4987 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 74 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

