Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793352585;
	b=iW8QSbT7f5VUOunC+E4muJsgTNcY6KNIW0X2TD49T4UPh4nHW2CawrcyZh7bltHNkgPE
	 U5URmJ/hLOdAnBqkerxyAhn52fyE8Q98ek44TaGmqddFdT6ydqjt7DzZDb18BY3SGKgU3
	 zi0ajr7LlJJWPSrCINpjRaRzfIOtI3t7bsgthAc5iGsFsPHHaoplCLwlOladU9MMq9UPe
	 UqwyxXKsB2vtUJMP0F7cq4CrFM74uLU0bV9LHUrwmQCoZ7llnIxhR1WzRJnxvvAae5so2
	 EOk9H/NCkDStr+hN/uUHS6H85YAuTP3UG3wKtJwNencAlL0h/eOIYDeHE496eCgO8VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352585;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wM7ECg+gKi0d0shXYBZ3JSOy8hyY2PzdMD+008BB85c=;
	b=Yvei5LCQ1vdMULces2q500oLI0JV0GvT22k850UVEeAvhY2yj0b/5qAdlo5WM+d6TVQW
	 YepiB0IyjmNOyuFK8auWAgacHBUPexp2KfRd+Dj/ZBK6UVk4gaLRyonsgjkVaRxa5S+c/
	 XdlsS2/OMMtBUnXKrka6r/Wz1Lg87Y6iz5pBBdguX7YWoGWdiO7jPobAQc8t59GXBF4Yi
	 BhXs620t7iK7FcGwT6mA0UWAqegkaIlItOb80fQIzeJImqPqgzcZrA2xUj7iFKLwijtT5
	 aN39WfnErbdEMxWedqkxMvdVbZTUVMD+qoeLm3GmKIFCsZm7phS6DB7arXMfhbIZCsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=MQZQkS3w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.70
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6CF606A325;
	Fri, 30 Oct 2026 09:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6CF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=MQZQkS3w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXEJq2/OWfgXsRD0hXDIWSdnUrpI4S7PVlYdqYsBwpYniSiXexqOE1tg8cM4Fr3b5tI1AdfHKgmloJW1Pae2L+h1tbwHFg4pH2ck5wOstFHRt93KmyZaFa7TG+Myfoqflpj1Zdh0EEwKxG5OTVBSvQ97SWbhjczpHowMPqUGAI+GTqwNORlCdaCk/zsEwssY5gNsNSbEe9oKQJ/jTA6oSxSqcsusTfhuSlXg5qLnnudZvKOcsckWF5jjHxkP46rmRjC89IxKAbkvDxI7zX95Hv4HXt/HnUaWkMJBFpQ9qK2dG1BQW34IZ1DQA+t10+rngL5ZG4InIapvn40h+59xxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM7ECg+gKi0d0shXYBZ3JSOy8hyY2PzdMD+008BB85c=;
 b=ROZN0nObGDleyjqlCRlowv1kRlrfzZp0FwR05WtqN95rpYXm0icr3y5hndDtiqLz/B3MO3dCHZanHQq8aX4mZ2x9kN7GWghFebjurh6Rkxl3lY9OP19j0erafNtVSlBZJGIhauWN1fVHV0RzOVEYwrZZlpgCAYPEK8KOTOayVAzndpItSgM//6Em174wJDn7pBRqb951U7aZeTzurtVOb0Ol9kc5O8oBAmd0NWXSh+zU4akQKVafhnj3P7EfuOJECVM+r92yu3VkK17g99BFApfKeaxvVNYW48PxCBD9abio1/hVHd+eAha49NFu/pelF0ilvm6rxzCHpbFFrGxt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM7ECg+gKi0d0shXYBZ3JSOy8hyY2PzdMD+008BB85c=;
 b=MQZQkS3wXqROJX51mTHhlorBIfXdilCWaAJ7HuL0afbGQQ9jH3eXNw93Mo52Z6qqluYvNqHmoRlW5nVBRlHUzyahDS1mDS58HF5TkZrVwNpX6uIeJqy3HtLGPK1WIOm4LhzpA8F8g8sVNMPPo+FtWs44Cty3NOJQGeOJvFqq2JkdqSmkDQq/EcgpPeYQK9crb7/WwzUFjVVmdCdX4lOhCwDHipYvlQtEz27WUWvhyEFEj/tpY+aRMVMJtF4y5Ah3roE2sRY/3oA4MyW6WPyh9cUZK8wlp3AlWruO8oDaKQXe2S+dOlakoZNaJSvXJv0Ak9pPZYmUAcI3tZCmssPJpg==
Received: from PR3P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::24)
 by PAWPR10MB7392.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.4; Fri, 30 Oct
 2026 09:29:38 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
 (2603:10a6:102:52:cafe::6) by PR3P189CA0019.outlook.office365.com
 (2603:10a6:102:52::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:29:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:29:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 30 Oct
 2026 10:30:16 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 30 Oct
 2026 10:29:33 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: st: mark STM32MP23 timer as stopping in suspend
Date: Fri, 30 Oct 2026 10:29:08 +0100
Message-ID: <20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AD:EE_|PAWPR10MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: e6db6022-ab89-40fc-d523-08df36685185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|261022075727099003|261021123027099003|261021121427099003|261009223027099003|56012099006|11063799006|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+OcaMHMgj3eY0RUDTEr6ezzvSMLHSsP9ZlRWXLTp7BijHBGhSWGMclNn2mLft7SfiDjTmJotlK6KnUXpphr8wvVE3r8LUy2uTGL9gqo9aGB2FwnW5W8dk1jIMDgLyPAhAGmgyPVOY7iQXEqbAEOshb61psTBIvMmDeCLkf8Ulnk+01HIneyE4zxBeH13IixI5Tab7kTkbJJ/GZFeGhIv1vjDwRbQlpf6CAXAcXliUD28abSMRvcbuOliqMXKM5m0uSiMaghokMf37qkqmDsSeLNfwU1hfBsf9LNf0iVbYGJYig8EL7FRSxS75AQS+iwsM5Uhi8gJiTk/RtSZBnW5r2E7g7+o4eIHpn3tc8TRLoPpfkw1l3SFl4gyQZm/Ei3JTctV3P8OCXxKYg++UBvblgPDrvDW4z63l9a/oPKoIBgrxSoGSyxQZjPRxE58MxijJGfUyWsdgvHbL6965k37WnYMSwrGMnNTcVywLx4a0tPnKTAoKarAzUK7gJEfVc3ETuBpQcd50Sq8Xro+z4WNebzFr6sc5TN+JTUTLOsG5NKfCw4mg+DkKqveJ9/SArCl1csvbicI0p02XSxkBN5oLIJrZMwQuFSE2TJPgJVSRe2IJkGm/7RnO8bZpvN8TZEpTti3Y17hBB+2yzguid/EKRjZYqI6xoPhrj9rkA8vcnCFKCB5leGURNPaIdbkpaSN1rZR+do9WgjSZcmQhE+DcA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T5SA6S7hpO0CC8FqMbqu5hWBqrZ52KRGteR8nIiNCcJqFd3tbSsP9hjacmplEDMmW6GTRX33QMBpZ4Obksmmb1ddVjHjeceen2PS7a0f/bHX9vE3EQMO/1ZfpJ2XWGdF84Pb9qOzs3MvbDCF5UOFmHumpSxaK6QfXmLy+vPmR9lM8CZhvbNsSejKSIyizdMeMq4VChztzNYza4J5Ptx9aC7cQo6GCRuJl2alM88w3JVdJmJmckVaXJqVHdcH0JFtBUIhOMxCNN5XEqd9n8CoYxTXMv9eVNid9QJUmg6/OfT7IVfU5nKkMl7KbnknV8FVae0EvLTlUn/MJbSnAz/TzygLqgdGTtvAZMMuvSoFIlC5DjTXJJCAzfjjoYpDI76aWWTdiSMt48mtcRQb9lyM0xfDc8u+3gZYw1SpK80n4LQue9IIdNrs4xPriy3v5duo
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:29:38.1762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6db6022-ab89-40fc-d523-08df36685185
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7392

The generic ARM timer, based on STGEN, stops ticking in low-power
states such as Stop1. Replace the always-on property with
arm,no-tick-in-suspend in the STM32MP23 timer node, matching the
STM32MP25 configuration.

Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..a7970fdebec7 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -143,7 +143,7 @@ timer {
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
-		always-on;
+		arm,no-tick-in-suspend;
 	};
 
 	soc@0 {
---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
branch: sdfsdfssfdfsd

-- 
2.43.0

