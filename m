Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82822499F1D;
	Thu,  1 Oct 2026 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894221; cv=fail; b=f1A18TXs3ZUc7JRRfqO371rlAzkCTQtAYgneZ2MAmBWIOklOOLkJauRdVHEp3dto79E3xHK9Y6s8FoHCBuCyJoY+1xtoKFGGudZVssiZ6WlY+JPtilh1O5dM2SyNNKNyAe/HjyVvl9iBxjVmk7LqXcPsKQ0vyKq0SqUKn0gjZ34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894221; c=relaxed/simple;
	bh=CIvTAmkhQxG2R70iPE3Cm6rB4IJkYO/9XbjgHlxkyzQ=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=YJKTCg4kakAw8+ajkX2bpxRitAYM3zsAWn+ruM0nBDxsWmM9KRWkFd4AwdhLjEQSX0ZiKVEPcS56iJs6P6e1xTCOos1ZvqcvrI110z9nSmS/XMuadmD/Oaz7jWkj8756FdYhzU9zL4xeoU9/RKxF2oDDUpg2KOIB9eFh1mPY6Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=kPRcoyl4; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="kPRcoyl4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYpp4RKND4GU75VYYo2M5OKNc4DFnGI11wsjBAfjHbZI2kbgpcUPS7CnhiSYUaSrSaRNPgtUpHpdbsvNFo+gfGxrqy/8CyY3Nr2BbDi9YoptRbf/W4FeLDsVWtZH0FzONURmYF/jpFfexqk68IKgTSsTdRKoXE0VDByy4UWOjpQn0QJHa7HYCxMEz+/hSImJJ/kc9P+FEmjr250f9AynumTZmmXa95FdaMFi1FiZhRQ3QkalVqGFULALNibnjS/9T/kIpZNrd+R10qXq3uqmDwQAnUKawPiLEwVfgSfWmJcr98Tas2qJO2qgdZ7EZ9+/9j3+XZMp0Jd05PslHeiNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Pmu814rXq8MfONRoyUOmGISC1aipuPcE7NAIG3kFr0=;
 b=NT+uBoTp7yuUnK0QzJ+sFIXFQRZUVjbuiVjh+btYkq5kWIx+Wzqav4aCYQV37/87iwyt2p6N25krem23w7Rsqmbq6dsnvnC98erkYj4bZ+arYILObMkxbP+3fbscsbdIhJ17mvOUfjYyzchYOqyRVoXHp3yRSnyr18zMry7rFRSUL/ksE5SUHsRBJ/DF06q75aK6UZ8GQ2/E5aK/97ZgC+o8rXXKuJ5pSyA8QMXUOiAfz3C9GEC4xordoH1uZtehDxSV6Y8Pu/wB92rP6xazN1ruyCjCN76eQgObTAsIlbcecVQn0cAnoXihBJWEx3pzz26CUZOkRA3irSu5R4cJ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Pmu814rXq8MfONRoyUOmGISC1aipuPcE7NAIG3kFr0=;
 b=kPRcoyl4x9+ohiIYMfTYvW598HLAAOQJFQa6dxeMbADOGsaISxFkSODtszC8BtN0YzsJMk6WekJtQ+odJCk35BOPamoiBCFL7MGPVSQ+uTmoqJ6xlP4jckI89QeknjNfPQ+lenRxxEkR1khC/svEywofpfFGlLtwOFGP1Lkqq7s=
Received: from DU2PR04CA0285.eurprd04.prod.outlook.com (2603:10a6:10:28c::20)
 by GVXPR02MB10763.eurprd02.prod.outlook.com (2603:10a6:150:150::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 22:36:53 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::3a) by DU2PR04CA0285.outlook.office365.com
 (2603:10a6:10:28c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 22:36:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:53 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:43 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 22/38] arm: dts: qcom: ipq8064: Break long property array data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|GVXPR02MB10763:EE_
X-MS-Office365-Filtering-Correlation-Id: 6630c6c0-f313-49ba-5241-08df200c7db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Umrzjnyo7RI2P7BZG43stod/0pPT0eyk64hKCmuohmV8bZHoLrwwZRjR3CnRIWf8OGmeHu1Jr1YKSCEaX/VTDkhbciQoeVpTaWDej7QMZHfw5KOPIMmHIFzjr+3TF+uprdbzj8mUDqL9W4REP4SqN7tTeX56a7hJ/Ca+hYy7bPhQRjfV0qkvrSCRCo14dvfrC3/FSglNfkQeyDq0jMIXQjPcavMntnJr82Srf+BRkfiihbHf2d7PUVuUGXz7Gi4jTzUJz4eG/f+LLapcP8tYkF5FmS7nyi/MwzLT7qJ44d5gWL/KJT8xJHe2Fi7ZvatD9QW2ZcL4RSFqxCE3H6ItFd29LvoYtvdovd8T/tyDCM3cbzr3i6WF1eADa4HfsyeRmkNvM0IVEBNveYWr0zRzjukYli6QIp7rjW48YdUOfvolwwYZUdHHjUODQxU7omKTKRJKRduNtuW5st6r4SCq7a9qgfYUwv0nCtkQ4hyeuHGf058a7fCJ4zwxHWmXhZD26p8VXhbTPs6xTCH0Jvl4qWQkeebz25+GTww/w0+UGFOC0MJSFXiJnhr6T9szeq5xwsW2zYgxa75cbPiar8aWIFrPJrqu7v8xRPODEUmrYvHVPdUDPYhEMdjACmXT8RonY7VNMzf6SgSOcvLDxx9+6BOIx5uC49AId57mOL3uaODmDOdQr2ZhF/anjwSGQ7U0TaxIPvTH6TzK/zkpGd1q1w==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FnFVvgaWRGTCGpUardtFYk3nvOFKxnFInYNZCZTZkbX09JHYHnFC2MKfjTZDx0f0n3GFuOfk/THPi5y7z0PcQpBjknCx+vwiCSDa/wldkZHI/YCt6I11zUXQmLUmy2Va/P6WcU14STSgA2iTCLlwIhA8YSlhbOaSAdCKcgTYgJ/ztVslnNgAOvEzSixU96eplgH17ZhZdXHYz4WvaaHdyqUsMoRAdROsVZoFwNzEW8pK7S3lhF0wITcDPQNVFRtooZZckgyogEHLh7jtLRLkyFhJfs5F3juK5e9qaCArGJOdPg/q1jUzvfEY8uLDKFx2q24KHbuXr0Oza2nR0DmnOh4W5lsuKMuPOmcCVERoLiTOwu4eQh1UViJl3r0j92Lu3VZsSeB5/tlbSycQ5lhPL8QXlTbd2ozzJDrMA1e8DMMAVr0pEBEhgBeJTSzOcWi5
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:53.0021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6630c6c0-f313-49ba-5241-08df200c7db3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10763

There is an awkward line break at the last elements expression. Put all
elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 24632af28d52e..d2b576a37c47d 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -278,8 +278,9 @@ memory {
 
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
-		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
-					  IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <
+			GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
+		>;
 	};
 
 	reserved-memory {
-- 
2.43.0

