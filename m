Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AAA3CFF4C;
	Wed,  9 Sep 2026 21:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990529; cv=fail; b=eoGbj+E0sjXgefEQzPUv/LfkRPmGBfE5uQ3tS476TKCE2mC9hK8EemcwtLp9+qU5fPoW5hC3EeRCxvQDVgRC7IyAiqdpWuJ+YvGQhoLr2FwlPqEFbAEHr8LENGsDPm5DSJZrpKU6W2EyIwdXOkaAHaPjaqzVZe2eDzzkyngpKt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990529; c=relaxed/simple;
	bh=ii24g8gIqIfrKEEy+x5J6na8uFelUlGTCo2iF1PnqIs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pBrF3fzeT8DdPRTpoBdgSgsjIXVXMZdF/nQBMEO+H8+QcZRW8ouOCkiGMI8cwmpZIq5G6lSdsZcPtNQN3dOQMfjbNwloPyba7UkAs1TvZ8aC8Drc8nmaAnq6rMZsXnyRDi+bfrRk3i/bphpcBu8y77E4jvEEKrSVUfMs39aV+V0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=M/u0JuSM; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=II0Qsto+; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="M/u0JuSM";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="II0Qsto+"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JG0M63382315;
	Wed, 9 Sep 2026 16:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HPcZtrSeOF9I3NHwdYR+r5rEmKLgJoadEleyhTnT+
	gU=; b=M/u0JuSMRpE2KrUuZyrNw59dY/YcjO/UM8C0v7DSPStlyykTrJEGKZnNF
	dmc54KqTuucFKR3M0RO9LifrkGFlJ11i5fw5K4XYvNoDMqQ+wDNkpE3vv0TTsrJm
	t3FYRB5WCxB2G6WZK0I0bbrmO+BlivEVe/WDWkg5lCPJRkKTOwzuUWQib+HW4nNz
	xOfjHkiZ/vkQG4646CdLI54FMsb1fJqOMiiu0Vahr+6HQ4HEUxonT6daTXIbeD0w
	3wmjGHF5SLyvUx6q5wV3IzshSr/6ifCHubk7+wfFD9DG4ThaMpdMepjwTj3ZFkHz
	gBQzAXTLqBCw3EWt8TCcXp5ep+1GA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013071.outbound.protection.outlook.com [40.107.201.71])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg92tb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0qtlVWyj+2R1bIkKkgAvW2SqrEDhEog4kiQ/uRkASYNNt4IrA8A4HeVmmF6xFY1XuR/lcrH3Rrt+sLWD3ETMA0RJfrhnBiAujh13NYRN+zlNXoktUMrQfugAhptgnBCT8xMuTU5r9+G0gLFAbZDasEzRqKfd6jUKa/Rj7bOmjqTqOY+Ph7WwEGQFefhMdLMysiXUawYUokglTU7fRxO48cMM8LvUQTHfHuBECloxTrhNwXWNRvv4aClhZFoz9/jCBsvI+/736w5kAEhClQB4hvJ9aRJcgMXEYhcLNpQti+XU1SgkGTqGzBKohVv11Ay/Eupyf31Y6WwsQGHp/Pc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPcZtrSeOF9I3NHwdYR+r5rEmKLgJoadEleyhTnT+gU=;
 b=EC3iR5O6Qpzdqe+Qe9EcLpwGpQwjNrjmmOo8XXSw7iR8gChvxoCDZK/A2Hk0zNSGocyzD9qden9gl9llerSjq+dVQMoFSYkJDK7zI/rGhfShCixGDn+antT5cXzlWxciqz1G+o13vhVb7DZWlQ+XJx2vgmRpZNGVVvovoEm5V1pS+rdY01LqK5u/LS+QasEcgInJf6tgh8Jjvu3I7kpwusrw+XooJmJXpRpDw4jfQ5lICtsxSjvm5XzgHGSmJ7WTemzv/4nG7V6XB1oH2hnu1iI5SJVsMkqoeDtLyN+OsZ1vf222JYBjGUVUTh1xjZ9o+Ff8aV5n4Lxh88VGUz7EHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPcZtrSeOF9I3NHwdYR+r5rEmKLgJoadEleyhTnT+gU=;
 b=II0Qsto+i1pGQE1PZEvEY76yW88tzHaQQT8X8UMrhqYS8BA/74OyS791DQR+BRUqGluT1e486xS8KiNYmjUkkiHQYbcggr0oMk29rI8qmixDeS9fwmx5idgZwEtzmZKGwHpZwKCNa4rcRHBB//oGrcD6k3047ZxOjiKAYaFTWpg=
Received: from BN0PR04CA0174.namprd04.prod.outlook.com (2603:10b6:408:eb::29)
 by SN4PR10MB5653.namprd10.prod.outlook.com (2603:10b6:806:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:48:03 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::57) by BN0PR04CA0174.outlook.office365.com
 (2603:10b6:408:eb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 21:48:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Wed, 9 Sep 2026 21:48:02 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0I1072162;
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
Subject: [PATCH v4 05/15] arm64: dts: ti: k3-am62a-phycore-som: Set eMMC clock pin as OUTPUT
Date: Wed, 9 Sep 2026 16:47:33 -0500
Message-ID: <20260909214743.899477-6-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SN4PR10MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ac1163-30e6-4452-1d9d-08df0ebc0608
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|3023799007|56012099006|10067099003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bZGhoQxkw8M4kd0ZJIjdSDAerpWpaE3OERJnfeSuFtjFt8PhBHrHyB2ZSbN0TcWskjOtSsXbIG5gEldIurkEh6mPbIpyq09V/ABhelE0WLPgC4uBdI0e3oFTD/l1bE1ZVh/cHDcxgWtwnh1XNXBL09XTsxsw9EurTUPAI8RIfF6sEH5KwGFpLqIge51Ib5Y+2L4MvTa5gREZEQfI71lO8RAFmLeORjXnrzhbw0Xxxglp/JTvdWUjNYYlyZpeQszLi3yvLlGQ0ehjhUIJ0guDwJysCvZaiWXXF9y/2IVkBHpJv8kV4n9UA7MAxSe8OgqSvGV0WiudNVp1ktH+tuR5D8GF4iyeDPMweEP2Q3ZE1KTUFRmsuOHGNC6s2TD9wTk67fPvkB5uzQK3O5dDL2i7iDJZR6fKULhwOKmvWCQ4lJ1Ny4n592NzyiT/GsU5zeEfBYfAI85i4J53zvSiIfQPzVwjBqng7PJmpAvSuSTfm325A4Yj/CjNu7hw0o/QG8IUy8eAvpb38UoTjN2orKHEpJ/P13CjYJ/dQQOdfJV2TpGFx472tqrGSo0sW3o+fuU6NOqIV8gU5WkSLU5vuJMmFxuVff2G78SE7NsNA/GMLJ/xmZH6VDYYzPhYjK2wCjlO+GEAlFVZ6l8p3NmyuyaR4W475CObBQmFobc3kHbPqVE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(3023799007)(56012099006)(10067099003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aXcgDusq11mzAoLEKvG5qC3/OaZMHSzn+B4A2PvwXQgKuXBdCxaNZdJjTijbjGGNjQCHwYF440hZWMcwVLBevesTGeXpllCqWFw2Ofha+LrAevGsiNkaqLCoc5tylztdTQMC2+LAoqOMIL3UInlwuC6mfB3P+SOWmoLVOHglUXEJg8pDTBMMxvXPogk12Hlkgj8pqdqJ/EJBJfeiKIpaQwEjfzGfdPlnoA0er/ucQVaWmaWNxbrF0wbfQNYgk5q/l9flQcY3qK6XbH+qFKzHH8tiY/4wvLsPBW0A2zq3Qjs+limxUR+P8J4qfL1kXKaGkMwm9ptFA1xMSD7qVDVi+zU6W3axkwGJMpjZZtRs4FiWHRoMioSl17xa3ojY5XPiG7LuxRZ2PJv8lFKeIebZCYZSVXE0tRfn1vl8DV+Jlm2pgimQIo2CuwWYF9eD6m1g
X-Exchange-RoutingPolicyChecked:
	x0JpwdyJi/Z7pSoFvIqRynHWwCuzLkTZyZZimThpaPiU0IT4FgqR43Up0DzMNXRptP4rUyTUo1Q4fk1arBscS1rx2yJa46gFJcqLboqRKr9bBPKnzJPhbBG2wmfUyaX169IJR8Rd/YCJyeam7PFOef+ixSd2jCgkE/8aKDuElxOSoHgFUm78xOLBolUNR4DjSdWb6mpQYOE0lryQ4oUWFs0/m39Rww18LCfb29A/DHRQSKl1+WkzxTSbaEnsxdSegz0TR9AAUBTkL0eVxzVgFRD4dnCqdbX75M5vaFvllmTC4L/b2es4BovxYW7fPs6ybhXK1gD5OaIIBq8ccaFwTQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:02.6493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ac1163-30e6-4452-1d9d-08df0ebc0608
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5653
X-Proofpoint-ORIG-GUID: UmvoBJag73GfFzbOfaRk0U0ckSkzm8IN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfXweVlWvhQ738V
 71Y7w98V8ruCDxmv3l4IXcoMROd1wJWtjv7CY7SZGH7V4BHKjgB5bg2XufIBAh69lFu0avoHLWQ
 wKqV/rNs0S/MKZTUXOy5Pzalp885gs4=
X-Proofpoint-GUID: UmvoBJag73GfFzbOfaRk0U0ckSkzm8IN
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa1d416 cx=c_pps
 a=eHfeAi0ej4loD7KcX6Y+qw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=tDJGxycmHyNoRUyowmEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX7S6J6YiuhVPz
 CGQXy6hhdRjSkLBEnzigvG4L10A/SHcB3Z5vfgABwobKDidPoDXKXtoIXCzUPml2itu16yrwFG9
 Kjmm2yJ21pZbA42EoiWV50L1BXUH+R4Pxz7TTO6ia3+HpQQaFf2Wf4yCq/QRIE++nkeS/2Wqlbs
 usAEj1ccCxtABFC8lFVajkkJSCLf+OoZx3Lj6ZFkmMwb7UYgu3mRgdsjxIEmi0IfrhwIfkqp+sA
 sDy+liZ2xYsEttnn0PXlOvU5UruL7bi/JnseMlvxmaRfntOB6zGgXdMCptNDQxYL9wZn7hjIo4l
 GyTDQ58mQWZutQP9Kayg8xc36FfyKnBi97ZCtGAkyEcKMUUGUijxg42fonMSSTvwZ5QJDKjTqNM
 M8vd++33ZduRaY//v9q7dq5bqTcdI9U0Xskmtp6utY1XZ0tb2kolIbgOStEhx5ATplDdW5CSuow
 oq/93BClQOSfCtgJfOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruj16 Rev. C: Table 12-257. MMCSDi I/O Signals

Fixes: d69383885576 ("arm64: dts: ti: Add basic support for phyBOARD-Lyra-AM62Ax")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564bc..5ad93be3d3363 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -120,7 +120,7 @@ AM62AX_IOPAD(0x15c, PIN_INPUT, 0) /* (V13) MDIO0_MDIO */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x220, PIN_INPUT_PULLUP, 0) /* (Y6) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB7) MMC0_CLK */
+			AM62AX_IOPAD(0x218, PIN_OUTPUT_PULLDOWN, 0) /* (AB7) MMC0_CLK */
 			AM62AX_IOPAD(0x214, PIN_INPUT_PULLUP, 0) /* (AA6) MMC0_DAT0 */
 			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AB6) MMC0_DAT1 */
 			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (Y7) MMC0_DAT2 */
-- 
2.34.1

