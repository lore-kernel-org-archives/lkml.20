Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013007.outbound.protection.outlook.com [52.101.72.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0097387375;
	Mon, 14 Sep 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369805; cv=fail; b=WCzfa1g50eZMl/2wRuAhOam41aAJ4GVwXYPEca2uCaIU4806kD3VoftriYIiZpbr5yGLWDkDoNEY4W38lkJFpliP0C65vnb/rmDn8yfYYX4PktZ4tv5MkL3ng/FZE2s/Ddm6NfUMdNwNVlGZD8fAWVlg+iGZXf5ADqMPVaIO2aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369805; c=relaxed/simple;
	bh=Eo3jb6MUOe73gAvFAyVBJGsWGu8CZ1os4tSHOAnoC3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EsHZAVpHRsS46TcvUtiyYkYqABo2e38i0WqB7EXNFnlXNv8Y2wvqH1T45EPz2aViyQ95nJmV7vvnFSrh9VcZRiwWrvv8bOlHoOllSUbLjnH0IrWr+21zOKkLrLxtQS/8wltiA8duRfoJ9ehDQgf7lDrG4NOLiAXcCz5lyomVE0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SnUuHQnG; arc=fail smtp.client-ip=52.101.72.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SnUuHQnG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4BVAGqfw1QnOOBXQIu/zY4P+873DB4+wdE3RTtY3P70B1u7lo2Otn0LXjeHTMNc4bHDXWa7/V565Z1NikJvIjIXWyYNEQhM8az/0EUHyte4fGPqUR7ByQmwPmQCRWeDkXSX7VYwxv3ruMV05jLyVJUM0v8biN892AZwhD+yDFpDI/bsPrd/ZQu4Jq+WWDcEtJP+S6LD+xXokvuJwI9q33t/hYKNPEp5sprML0lOShpNQxoodUBTTMBk8I1lcQlsWMkBSsnnQCNNo7uk3pnITzaBIOekDpa5ruGBE+5Chas9NG2gGCWbZc9EoN/ZcMO+f7957CtwHYbLhlyQCvvI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2h07wzKZv1sTA/1Xqh163zBzFBLk6Oy2KhmzdSvpvGc=;
 b=MAOnGeKrwu9DWo8x3pg9zpOU1UvTa9/wSjC23Jh8WivvOIbDlUrm//CySivo0ZiNxFFyLy4XaXJ4lh9gfsg0vH9OZRM2bE2wo6Lr14dpmu+GKN7a3WPOxPv9GiHIQad3OCzJL5Q0czLJGiq78tiawyD37Fedcq0zD+fNkJSUgFnbuu4GNs6S9ZagTF6uPhq+kFKlvxoZWusIzRMluOtehRGFkAfDTL1LgE/e9o1L452kTRZT6iFoMTzrxG+kX/IAUCpjxBocqX31hrDjEA4XZV/VNqr68ttwn5xb09EJl2F84z9Ow0Cmb6DDMd+zeKLaCx8VoyXJhUXM3klyjWNtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2h07wzKZv1sTA/1Xqh163zBzFBLk6Oy2KhmzdSvpvGc=;
 b=SnUuHQnGXYIcDVxCiyWtG6fSKQsVX2a+7JiAP9kHHY4I6FgNR7M9qQkuO/hF0RaX7uWUoDmD64MNoAOSJCqKUsOEEKk4H+Fo1rrreUd7Gmn7s3k/KttbTcj8Ft2A6BnbuTt41IK06NsZ/vEr0yHiYJGnAA/MSzX3iFOdJ6Uc9jm7fg8LjgbpidNujgWzbsxwC6gvTQTbVSO7FZhsADSKTYLmBLdYKHXqngHkYbhwA/jCEqKgbfLl5kq6T7CcAS8DXJFYFBBUd4DbFbEr2rl3Gn19ILzh7XxhYGaRWTPbrBA3bM+Srz+oIu9RY/pc3tbZ5RKJzogCfWJDJB6QS/FEJg==
Received: from AS9P194CA0015.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::14)
 by VE1PR10MB3854.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:09:59 +0000
Received: from AMS1EPF00000097.eurprd02.prod.outlook.com
 (2603:10a6:20b:46d:cafe::13) by AS9P194CA0015.outlook.office365.com
 (2603:10a6:20b:46d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:09:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000097.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:09:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 09:15:28 +0200
Received: from localhost (10.252.27.156) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 09:09:58 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 14 Sep 2026 09:09:30 +0200
Subject: [PATCH 1/2] arm64: dts: st: add dcmi node on stm32mp25x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260914-stm32mp2x-dcmi-v1-1-c594e081d21b@foss.st.com>
References: <20260914-stm32mp2x-dcmi-v1-0-c594e081d21b@foss.st.com>
In-Reply-To: <20260914-stm32mp2x-dcmi-v1-0-c594e081d21b@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000097:EE_|VE1PR10MB3854:EE_
X-MS-Office365-Filtering-Correlation-Id: a0eeb513-f696-4e03-30d4-08df122f3068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	d4v1cXZLFS9xOlSJhGssg68EWrMKjPURNiI+0LFWUokSZ9uEwqW9TElBqjgiDjHk9DHD3w3EeCl3mOkAQT1Yjte+xFaUx8ekJ99ceD8jAdCOiqY7K2OQIjjsILjkTJHvxFAs22fowfG/4ScjwMDU8oni6HMC/Y9bxI0ni+YmDVMp0F26DCRv4kIzR1kUdjVtIQIQElGy4bVeiUw7MGuY9Q5RDzF+tE7vhwzXcjF2PKwYJ7xHxaVp9zQnXBr9SUjpBKvD1L4Ur+6X5/EBT7CbmRGnR5GSIjDVQcIWcICjIcX0f4clpSJSM91eriJS/QBZRikAk6AOsqk6uWbKmJdt1I7wEef60Ehz7JvforCpalGxKxYo2rA9zj7f9He+pSjaTTFAURqNaKEJzzQ7oOK3cGxOUpoYTkXVGNu5xKJA3OLwoxVHaRUjoZoqKGfWVPZyqUwckK+oUPc+sM/4A/WFv9pED5nK4/v2wZ9IPUlhpJmc/l4rX/yG7w4Ek5XZ/oUV1xM6xGijkgQZXDkmbTu7D3mKOAi2dxG8Vx1YMs04AgEtpDbRdsk2VlOvP0gkyD9HjbJu2egxEgsqs5g4ds6FBYhq5SY6vAqhbELetVi1jrUTNg62n8W41Qp6GzgLt/S3Gk4ayW4fWea15Ly76djYRTGE9JIXjKxVr0DkDqoIvl0/F3JaVe87a3dsybt3/0MHJ4QmGw1C1VVG4oanwJrs0w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6BMSMsLOAR/zRRzvlEaulW35CYQJx+HX0YQ41PdYpa9hLaEQcNkM8TqtdH6eZUC0YIEgV3TCPdYgktmemuD12ta7PJh71KsF738bfJg1acX/Jp4hq20erRftSrKHQhwfuZ9gmWquaegd7CesoR7xY8mhy7elAj8s/lrVqyHN1FSm/4iaR0TS75y6ETcSwL8jRnz7ZzrFLryAkaKD7HWuTzaelaYiHHYoJTfcblm/3IPI2vTTNv+DXZaSwozarhYysS2iq3PPlIKWKaA+lZlSlK5SAFcwi9hY1WUGJDhYRg3yKSTxjqtN4cwsgTZTmR4GhsvKqAFqsj4sAoJzNXrVaJ3UiFS05GkamzKrvo7V8gFNsI3SYTqzybAtV5CC4SD0JDeZf5jzhsKfL5wwjhLLrbntmHt1Cs6GjD5zJ0OS7wZRVEJfYzpzg6H1lWbNIUJK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:09:59.3941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0eeb513-f696-4e03-30d4-08df122f3068
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000097.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3854

Add the node for the DCMI controller in stm32mp251.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 44938c036e30..4987ebcd8556 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1450,6 +1450,20 @@ uart8: serial@40380000 {
 				status = "disabled";
 			};
 
+			dcmi: dcmi@404a0000 {
+				compatible = "st,stm32-dcmi";
+				reg = <0x404a0000 0x400>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc CCI_R>;
+				clocks = <&rcc CK_BUS_CCI>;
+				clock-names = "mclk";
+				dmas = <&hpdma 137 0x60 0x00003012>;
+				dma-names = "tx";
+				access-controllers = <&rifsc 88>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			rng: rng@42020000 {
 				compatible = "st,stm32mp25-rng";
 				reg = <0x42020000 0x400>;

-- 
2.34.1

