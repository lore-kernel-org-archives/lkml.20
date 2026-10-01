Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA804B4872;
	Thu,  1 Oct 2026 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894200; cv=fail; b=OB4bJ5hxG6L0HrKcgcI4EGCguna20GWS/zjMAYy/R0hlMHGBy8WT1xZYONW6YjEU0/8hw9QKns3d3lCtjlRgenuOO+Dobwe5nSeNLJQsi/aO/GVINYfm3dzyYhjm8l9Df/GUYfqHROGix2soMrRkwra5rdskzmuJkPlJn7Wochs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894200; c=relaxed/simple;
	bh=295wkumRwxAaQFvU4mpi22NEPijfo78PCPJ3U3qnwTU=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=YIqOI29OM9YVmcAoaHz23FcZJSS8mu8zlhtN9COJTli//myCeehnWD2m/KXbqzseLm8ramMHlRxYQE3NPds8sRCu53x84AsLDlaMiEu6ngQwATL1XHUePHRvuzYWu1KbAr+ZG0nyt8GQyb52GU7wbMMJ42IgVjD63CiONzn8gCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=p4FMS+/M; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="p4FMS+/M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhLNzl3kW0YLPAxfxQZg4kNQF6qGJvN3DafCq+6TBSGbQuG8+IY7FWr57bMwR/DLHzuamuwyxIwxVFtQg1kz0Bkriog3/lJiZC4rs5jaSpiPGTB2RXu00ki1FeMuapZk1vjYnoAQLZ3TYXAYEDDdnhSMK9XEuXVkgCepHOzqv2A3GfDHV3JQOrjrWe67VzAbvOoxX+dldSnGJ27fkmX8wZzhl9/RbvK/ScfoCFCGfs/5SSo33Cpz4txplHWFt/foYmAWvZDFiIWpMsJYHVVBBKSvShv+yq155H7tBf+NUv6mYnzdi5bEVWnlFxjbEmfpYL8swQjdr+LJqOw67GtNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3Is3SvNS24QdVBMh1p7ItnnnzkhFXf7zCvAzmYi1+A=;
 b=ZQhVYHkjoG8ShaVvdj8spvu3Ic5f8u042ZmibfYgjLm0y6UnbMAIwhiOymRvPslj+NUWbTOwDVwMJIqPmfpQC/P1cG6JhnlsLr0WlU9GlM0oT+1kpGPHddJWv/shpwCb0bcue4AIK13K1tDA7w+ObWbEt3AK112V0glCoSVu13e+onHIo4RpF5IVaLHHEycanCLkWPnjQLeS8/aabtIqewTo6lp2RNhJjkycV1So+xHcSancU/EQYl9lcxVw0HwISzw50VDn33C11BqdwonrZQPETTCxJLa1dCj/yuqu+aF3moaUE5N3XrSyy8rameebubtAF3AH8TEvjaWrsMQvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3Is3SvNS24QdVBMh1p7ItnnnzkhFXf7zCvAzmYi1+A=;
 b=p4FMS+/M3fZaWOxYfNBSR+lSh1OArnAZZZT3KQ/foMzPs+CpQRObfMPLOzU0t4WzztoPxcNh43EX2ZflGyil3l5OLaqyCnTBYncc2WpnfapmCSGaDwHE1ApIIvQtbeKM8eHXtWVhO0hbvV9B3CxiYpalp+LUn3AlirT4bHvTLcM=
Received: from DUZPR01CA0316.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::14) by MRWPR02MB11727.eurprd02.prod.outlook.com
 (2603:10a6:501:8a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:32 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::84) by DUZPR01CA0316.outlook.office365.com
 (2603:10a6:10:4ba::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:32 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:31 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 01/38] arm: dts: qcom: pm8226: Add newline between subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <34fed5048be259dbfd389acce205461d21dac6bd.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:31 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|MRWPR02MB11727:EE_
X-MS-Office365-Filtering-Correlation-Id: 5866b070-288f-47ba-a828-08df200c7151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	D7pvJUEycOYbhJ7mvOYTHZSZ69eEcj8+5f51uJ4J3NZCIQEMs/mynHfJM7MyPjM5yFCB57lm9h3KlHnUDddUPXbC5z7Ak1VpYPyt03tp9I/lw+kNzCL2RFua6FOmxb82DqB9qJQ/xgy2Hs1w80oiUYhBQuuKeWQek3okbSAEQhvKiYSv2E28RtYDn5C30U+oN2dUcWV6OzGTlx1svO0dTIHd1qZUCzcm2yT5u5ELIkB9qODu2Ark7sxugbsPOeBjW2l0Ny0FxDT6q1y61yPNxbChCFRUCyyOJC/5sBniCW5cL2TkFbUxYzH6MPesrRdN/nw6IMajtKb9eNodf0m7Swc+mWe4DFeVVioD5vi2op69comtYjvt4pJA/WPbwyI2jHbSjfsXqaiH6Nxkt7idCXMor7b6kp3WD7i4r6gFSIckBrKWbnTZd8ROS9V3iTEav7jU/2kyrwN6DRm0lj9biZ3TjabWBtKPc0Np8DOmVdsUT443/S0l55LgGVYscLVMNCAdPHp2j7EPm0t5NuGKGoAwVPl3svvJXuM9/OQ9X8mODzUxEkjRyk1AvHyqzWO7QBncShYzbUzKDdvDNqHSOkA+xwtOAc7O3be9gfV8uejyM/r4IV5Oodf84ad5WnGdwUmlbP8XvEdtkw/vWUlrCK3c2jF/WrruIbnzyVJiLZoidAeNE/bZ4DzLfFLpbHPIe7J+Vk533lsVM8c9U+RB7Q==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hDTdXp0DMCIlDrPh0wblvPb2pJAG0ITQmC29Q3ptNtuulxLOwSCTKDlLaFlsjwuRtx00ePNutVPapFof+WhZAM7Ax/UBNKB40X7oI/8jT1QRn6fNpjQ2UA3eZRIorSLuLEitJuN+1MEaXwve/bxtYSFvKQczvO74FbOH1lWjC/pjMhEe61TIikQpyd27c7roQeJOYCyWweFWfbHvwe3uZcfcMZtO0TkeMdRyEVimAIGV6Wnpp+Ix46wchn92B9W19bEDK5NItm/T9PLwYdQDJthkHaMPBknTsG5nm8E9DluEd8P+oz72MiJiTGRmS8bnLu42mHxfZaX3KFV7iAsjgsRIvUf+RkIr3fQw4LTC5tr3cCgLUVSKbpNpSD88ySRNx+JYjfz/ipYXPatmlydKjSVLbnNIt7896Cun2eoyg8fsbbU66N3D5sTRGDCpuWqa
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:32.2295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5866b070-288f-47ba-a828-08df200c7151
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR02MB11727

There should be a newline between subnodes. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/pm8226.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8226.dtsi b/arch/arm/boot/dts/qcom/pm8226.dtsi
index 2fd4f135ed84c..abab3c6e253c2 100644
--- a/arch/arm/boot/dts/qcom/pm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8226.dtsi
@@ -109,21 +109,26 @@ channel@7 {
 				qcom,pre-scaling = <1 3>;
 				label = "vph_pwr";
 			};
+
 			channel@8 {
 				reg = <VADC_DIE_TEMP>;
 				label = "die_temp";
 			};
+
 			channel@9 {
 				reg = <VADC_REF_625MV>;
 				label = "ref_625mv";
 			};
+
 			channel@a {
 				reg = <VADC_REF_1250MV>;
 				label = "ref_1250mv";
 			};
+
 			channel@e {
 				reg = <VADC_GND_REF>;
 			};
+
 			channel@f {
 				reg = <VADC_VDD_VADC>;
 			};
-- 
2.43.0

