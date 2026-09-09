Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D741D223;
	Wed,  9 Sep 2026 21:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990547; cv=fail; b=p8a0DgoEgIftaXGV9tRwfwMTDKagtjKw1nnWH7N9gyLOJfR+PsgLK9G+GN7N1mBnKlNpvqTQSw0FiIl1s/maHowcOXlRraJBKRwM96qNNKGOV4Gygz5bi4M+Ro+AMIXeXDf37JPFOGboLTB4SSOxWeKGhjiNZ8ixhQQhSDsdWcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990547; c=relaxed/simple;
	bh=RmgT9QoJ+uEblgTG4yJx40tY3l+1wv4R8C4DeQYbXVE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TSYN/SLRwgAtahVm9+LU8MpsevFgpydKepDyuAskkVaFZBlviVAS1YQ9s0OmosQDDdHp4Ic6mphxyUND9Vj+1niCEGABEpUDGksEEyEWWCFvCnXKlV7EdK1a1y2XPMpa8i7GuQ3Z0mndL00v2cLtnUjnxx34GwODHI4dHjk3HV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UCdXwt1Q; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oeuti072; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UCdXwt1Q";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oeuti072"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JG7uq1158970;
	Wed, 9 Sep 2026 16:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oWy/g+2rUr1rw7ZxluckOLCIXvPeXJWQQn2btBIQZ
	B0=; b=UCdXwt1QSoTNzbZXqPeV3TNI87ovfORp8PGRrjXgpAizWElEjdss5vWaW
	Hh6vw9DpNNgxGyxgTUV90Pbu3tb6ICMiI+LR9IjZN78I4hZCFTWOszhjZJjn+KzC
	YDIY1yCEe2Cl+ervRlI/Zsruit2FgrXwjlZVoKn+harDGmIt1w2BMypNEPDLllDD
	p79yfne2561GzScR2AB73+S+65EMKHlt+bxE4R1QaotsHCMkzKNQQIaHhIy4SCIl
	VrcXIiZD1G8b8Vfw5CdPWlKH9gb+f9AijfWC1qgbj+Tqowt3YvXb5fHdjvV6idoa
	NYrb8BlGfL2CxAN2LEp2WTr/xm2VA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxes30t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9DnA41oCmDFZru5T8/KmLraa/Ip/oU0jSvu6wwM84/wmsDwE/g0wg8xzdbDoehYJmuTNwSHwkMEJhHhfY6N0jbeUEdePaZm6ydmq12ZUVrd0cM0wcusGARhLGwiuLOmxJzr2iKqiMed2RlWU1EugdbIPZXP8ksQZ4riDVW0Ir/4mUz0Ecr3k6WpZbGtcV9hM+DzkfmRy+xVj1Czt4Whdb+Xpem6PGTuO9gchCbqxi7yZG0eVYBuwbxBDQjvShr5Ujw+JU1p+bnuCCNFKbtt9ZWE5EPyJ6jvbKeHfRyMn4Mt0F8QKA07bn03l8EvkgTiyj/hcrAwRspn0EVwIQIZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWy/g+2rUr1rw7ZxluckOLCIXvPeXJWQQn2btBIQZB0=;
 b=M4EQjecppXFVBs8UNg5rJWRS85IOxqxxmvge39Uhu0S58irvVQ5LWiiMv8gr9ljsO8ToPcxCcAQgWrXgEtu9mieAN11B335nxlVwvQTDojE1ZjzVzNRtrfS4SL37B+QPhW/Z+YAGxN1KITfxUMaswoSZtjMmWnDEKAZCQwOc2GIkNprM65079IMFutUcW0135kMBlz2hpOUMyDQPo3p8VLi4yCFFTGUrmqVk+L73afnIooA6T7bEJEPLjbh4Q2HImhetHONFKsAxX7N1wph38aeXm5q2BZVriECHV28jygvapA+L5xb9IMDlFeNTj7zs7RCdulhNLsIExwd/fgu7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWy/g+2rUr1rw7ZxluckOLCIXvPeXJWQQn2btBIQZB0=;
 b=oeuti072FKZGGDoCG5LJES5hE79s/y/rLO90MtzeThKVdZ7xnrCEPvq9j3jgTX4KiOm3V0Mvi/Cl52TZP//KTHdBx9LXegDSMhFb3YH6SvWfWIA0srVXXGzbK42zW448+M0wQVSJOiy5pfpVa+W2e0nof0Y1irLNf59jP9cgdAU=
Received: from BY3PR05CA0002.namprd05.prod.outlook.com (2603:10b6:a03:254::7)
 by PH3PPFE6F9E2E1D.namprd10.prod.outlook.com (2603:10b6:518:1::7d4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 21:48:13 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::9a) by BY3PR05CA0002.outlook.office365.com
 (2603:10b6:a03:254::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.4 via Frontend Transport; Wed, 9
 Sep 2026 21:48:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Wed, 9 Sep 2026 21:48:12 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0M1072162;
	Wed, 9 Sep 2026 16:47:44 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v4 09/15] arm64: dts: ti: k3-am62x-sk-common: Set SD clock pin as OUTPUT
Date: Wed, 9 Sep 2026 16:47:37 -0500
Message-ID: <20260909214743.899477-10-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|PH3PPFE6F9E2E1D:EE_
X-MS-Office365-Filtering-Correlation-Id: b187459a-bd7f-408e-a096-08df0ebc0bc4
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|1800799024|13003099007|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6CBtXd+HY3VaRXCqO2hfj/Hz8pEhNGAPX2bd3yHsSyfEc/wNv9Fe/nZAUmNP5Cow/nAakKgfBOFD/qXC5CW+W/+oDZ+XyKPVMRzTs5hIWoBK0HnvBSCLcmAiISEUpz+bMLOhr4w1aBgD3wIkv8wQmk88SQtVEsYVrevE9D4AUB4xWUIrVpY4QNv15Pq30yxL9fi/2ppuyMPDl7Qvs4jUrOuLjyuxeJMg/P+8K0mqEGyHVvYw5DFENo8TKKCTbiT+I1peZNywI5Mtd76rC1NY4GUXEavo52wkI1xUt/DFic7cJK9F/rVi5vbLbgX+M/poGKm6ATWYtH9ImWWVuxPAU4ZJoh8Hq6vq70s/up2gSiMqMux8xhdeKbGg/hZYX51zJaYqp2uEGIYi2RBliwaIZXeF4x5unjetOrPeeaIf7sza6HK8bHkraqRRctW4Btc6eA9JaGyy8pURKJVE7kDu72gFAl1H6RwKzna6KMo6QpIb9Q1VG22h5uBojaCgvRpynl+2Axin1ZRl+b6fBmG5mLVKGWc9mTCiDaJMno1SJuAG5IBSUIqS6A/e/RSpFtI2Y5BeXSZUHDjvvAgGymc14A6PKP0IATh1uFHJ5jKGD2wW5eXc/hxdRdU30GuWNQD4AvxNmhkGCGHwBL+sa09XnhRyvfSUUEYo1/vBh/8kHg6HbmFEIveGmCJdPOrY2dNW9CLjXE2bN9ycBC9+JHP8FA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J19Mm61LXdPGltcXPDoUwL3H673JJuuiEycOx5IRd2m2piWFNQSefamMTs26C2Ebz0e6ee/qrTLfSY8VKdtKDU2yUPnjUQsil+6Gph35N8l1Pz3poI75+UkRxgI9mp1p8a3QIj7oaRCGjA4V2IFMBIU6W6IHn2Znn5PqYpwdTZsTiSI7Ii4oSDklUO9UuSqbq1mJpSUrEAnvG/Y0hUcmKZ2KdLLqF5rJx/a6rZpcuFlcb0ysWeU1Yply9dQ7t1AE2dbgHWPBfP0wTFiC+grbeT4xx9LSNhyHEsXQ2TdeYhwbSHOgXnpYIez6EJhvM2aZJ1AqAD5aYXdAbSoJKkyKeTx7cz7+KY6eX18hTkoES3K35z6iq5UP387mLgGb6e1Y2GmSaXm/o+cQUYEnwLywoE/1NhtVusIwV3oAQt/J9LI9/KhLmnZb7VGKDg4VvoqN
X-Exchange-RoutingPolicyChecked:
	NlxB+ibn5+DiqwMidqYlCBya1SLCQX1uJ6R2NcAgBtcUUSiE13qyuoeJiRWVmLmeVHkMSVpw5mOTOLZVRCAibyJSExe9GLaGqF0l25UZ+0yK01HkQmuzeTxP2AMgpbQIUneyJ2O8V/z2cQiDKktuKb9IylsM2gkROEF67jAhwgg20e8C6T4wJ771GapeDzfSmm6u9C9FjOr+LpQLfzE39nOgAA9qJkkPU7NrmqqsxSj9Jyd/fuzByWUffD0rk0ARMBGZu0f8dDN5q8p+433rbJge1UiFNWB6w6AAqwsYnzM3EWYIhrAPYLzEvmScMkd/Ln9aKGb+ZyW0LzM5mEOI8w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:12.2574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b187459a-bd7f-408e-a096-08df0ebc0bc4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE6F9E2E1D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX8x6KSNMXH3XQ
 8d2Xrpnsle56xSzlzWX05C/F+YIyQt9fWSmgCAPinYUyV3uFiv6F4LzFAp+irbV1i2lG3v3hDky
 GT6xRKZZzdBA36rwz25SnWXmsqrSik4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX1wDkqtu1fHxT
 YdemR7WAYTyrnBXCgAsc/4jO/tptx/5JzYd4Iot4NtDtHJIHaRpSdZ7/42Lehp2u5qDjU1aYeb9
 kUyKFrXITBzWit1CXqKaOiKqOqn2z3PAFyBbPqqAYX/XCdvgZ8UmU7tLh+IdLM7pztK6visCMDE
 KlwhVooHUGtHucaXn4FrXlJ+4JiQsadj05FkQc0Q6AY+5lxUx/ab28su5R3ZAfq8sqv6xgpTcov
 nB1D4Vq9jO0Z6booBzI2h9EwmhI5uHH6M4vEssxsEvR8LP6HZCid9WcjrgZl58CjCwkSHxY+CvN
 6EUzjvQTc0XfpDcvX7oD5WjW0Yv55O1mnYiVdDTqmH1bA5Gk8BlEUXFROH6B69BCPoPqyesiOnY
 AOe5EWnoVMkN/oTo2zwxtHuW4zL6KZYfCGaDT/vh3yCd3Vu2qFo0KV7kAdFI8F9Zp9kPYAkoSWK
 J9yHXEiJJ0LFRKehtog==
X-Proofpoint-GUID: JHompNyLkrc2mmv_9OT6WBCScRrvhOrC
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa1d420 cx=c_pps
 a=0XF06BAwF4INxAelKEegqA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=RRG0x_nvXIUYq33IBzYA:9
X-Proofpoint-ORIG-GUID: JHompNyLkrc2mmv_9OT6WBCScRrvhOrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Fixes: d19a66ae488a ("arm64: dts: ti: k3-am625-sk: Enable on board peripherals")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index ab9e58c2d225e..d2f41e2ed6239 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -194,7 +194,7 @@ main_mmc1_pins_default: main-mmc1-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22/A20) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
-- 
2.34.1

