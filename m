Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825101;
	b=2dfkmuedYmCPGYVseq0IRCbc/5hCiSnL33o4ngK/408OKQhI7Bv0zSmwa3qqq+HcFbZF
	 H9bQUtMzOKUhD857PkAOg9xvmXu2RxetXHf58XAHiw2eMvRJlTF0Z35IfRLeZA05y2i9E
	 j8ts9iFuCKL4CRvaZNJW1+RUYrH5a/8WqsY+XSZk3wSr8CosjW+X0sggqiRkgOOakIoM1
	 hzEMGOnsBjVa2CY+07MYRkGImEtnavZqqa1/FGBkhch0ixbEgteQaj16Y7oszFoJXpE7n
	 IP1pNlQ5IYaSazTbE/17/XBUuRV0f/CE/LGjb0HhAMqkSozTDxDyFX7JeF9uOHDUVYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825101;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mJ9CAZF4pvCa3i3Bk4YdzHrnSRWqOdwYi39SFp9d5lI=;
	b=FO0sKj8SAjNPZ8WvHlL/3TniybKOujMkgRE5/nmob9U4qWKbuLJY19WNUeSNCGL71xmc
	 TS5Su7FYF2NuHGcKOFtJEpra1C0WXLFpY2TYyKxDcH0TrRiPvwYi8l8jcwpM5P449t9/h
	 Ex0+TGzp83d+5HAN++CWwOOeG3yu8dV7DU4jFoorE0rAdtRT8LiTJjvzMMuVBmeHdHJlj
	 I4555ilga++MKHiu9JIpTp4U0IdlLhEZvNOJk3rfaHfzHTgNROZ0OlRr3r84YqHe6ATYB
	 D0+Z6Qr5YqU1cC4ckgpEY0UDCFG2lBeJruKzwP9VD86x1n0dv3n9k6aRwWoMETgcKvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=gs7DSZ1c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.35
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E35606A884;
	Mon, 16 Nov 2026 10:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E35606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=gs7DSZ1c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWDsLuortzgkqMKhxR2ohJG3mGqnPiEvfmC/kPNQT9lyl7vGSbnWxPaNAPs+3S3TZo90uMJkZQqbCiKPnOwLCqdfKi9QiN+ni6uGtw8bXC9br05/wr3eGtuxhkmyeURhrdD3H4pqUuq4/KyYPXcM2UYx5pNpsgDn8H8Z8kdBIVY13Yj9hg2H3ktTSy6Ak6fVOwcGwRg78f/NlwPu47PNR/0c0xf/Vt9kZvZ+Nw1bVXucjw1+QYPZMc5D33saVfa4oBJ4BDwEpkCZckPbO1WijwEENcDxINuwGXgn0RNnLx5aK+K/lCZDrjt4LEVmNtiE0IVVgeyJu+rqLJ+mCOD2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ9CAZF4pvCa3i3Bk4YdzHrnSRWqOdwYi39SFp9d5lI=;
 b=UZyrKMa8sS4dIRInMpxcK7GQ5UNpo8GA7Nuysx+YEPy3j/gVDtdhI+c4DK+KwL4hEGowC5bc7PCKXZ5T7pIKPGLS+DcALLXexxJeUwV7eSCMy0skGBP+cNr/yIFPXAX+a5O3kRLwrJNjO2ALUOZgzartxbNejco6SgAqdx5MjV/ikMjkdvIgNmCyU3qNZF2RK90PUrdKqRiGNlb/Pj/xuQkU5BwDGL2J3Jp0r7lYa5VYR9SIvDLnViBRZolJ9PG6kPQca/EfxXqrzFp8CdbC+2pMaDEns7wKG3a/WxThBwX3ok9A+nJs6mp7LIJKRbCGVrEw8VdjBDfS907gqu0Z4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ9CAZF4pvCa3i3Bk4YdzHrnSRWqOdwYi39SFp9d5lI=;
 b=gs7DSZ1cepvUpJyi7mATtoCZObp86SOLZUMc5tbw3LTIL7bytOQkd1+7R3weZAqvwzgPj1fIW0kXbG6OYYHXIosDdD5AR9h7ApVPgSZiFWGqsedDeYs4zzA7IUDqVsFH1P/aBXwqbH7yiIXlb+Y5anqa7SCOnk45PLi0lvek3c7HyLWv5ndTQAu+G/dFDdRFLcihyYwyc5Qk5mdHAEhelf7rMmNECZijR33clUCE4UJXpK+JVYMgXq/F0Gdf/RDtSNE8RSeca3boHXr2J+WBOshHlrVZF1SaQHg3CnkG57sCSVAIAA+Ap5K/FKd0kaq2DA+2C3DPmPhYpVUhxeH6Yg==
Received: from AS4PR09CA0030.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::20)
 by AS8PR10MB6336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:522::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 10:31:35 +0000
Received: from CPH1EPF0000051D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::81) by AS4PR09CA0030.outlook.office365.com
 (2603:10a6:20b:5d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:31:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 CPH1EPF0000051D.mail.protection.outlook.com (10.167.241.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:31:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:32:35 +0100
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 11:31:34 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 16 Nov 2026 11:31:14 +0100
Subject: [PATCH 3/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp235f-dk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-stm32mp-imx335-fix-v1-3-01f538260f00@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
In-Reply-To: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051D:EE_|AS8PR10MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 823cbc63-c066-4f9d-a439-08df43ccca18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|11063799006|56012099006|261022075727099003|261022105027099003|261028144727099003|261026140227099003|10067099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EMoPWdUResjdgsWEPuBKWi8HI262FsF65n+p6YTWzHXANdwmWJ2Jd9762HhiK1APNJkvqEU0sFm1/F46xbgwGXh2o6tgigDdjrZkv6wBjoDgjC8pdh18pmlU4lldL/I+ktKoyFYuW8k/JYjvYePG8VHAmv0UgYhITO9Yp3ReMvB3GRPARB3OD1w0Z9wFxaPXA41CMUSKPULWwsblGq05P/hOqKeC2OZzRyqMmDn67fmpkhOyKGBlXlPJ+gOsuYe/jud1WOEJVimx0x2bCTR8jqbDSiCf5OJEA0Y0ILKjcly2yH5KSY/EQML12KCyu1moKqEf0qhau4mtQZnqTtqHrLX5+v2vVQBHMW7lbo9EvuFXHLcKdOEZb1tz2eNjf4yilabiWci4HXRzWRC33gye6yBX5eUMx0LbAeYydsjhSthxmmkIdlhjUUpslNWx1Jt+uFIH/kR/575YiBPkpFym0N09TJ8TSYwCBhS/F9WK3V6VQXhb7yNXDI3ufWXFvAMVLXq9ciCLHkfJgHB7uUeDeR56iX3B8JDyjMS0EXlwsz+SCCNqve8xiSlTQlfoFcHo3ii4fSUNHGwGPLw22nJ6UjCHEuc4FUTqbW11Pz66kcao/ts9dgb4ZwnXBm9weeRCmdYEgNPqvob8mj4T4CHZA+EWvNC9wYH7hK2SDYsZK6z/8EMhigzeuWUMqoGaAWxOBPg5PPWvBzVyxVL0ZNBxJg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261028144727099003)(261026140227099003)(10067099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aEXDryZu+rpn/4bke+H/CtAYRW0de5NXGgAjVOtBA9wtHwvSX9sgwZpH/WsygrXVPbJidZcUF1IVop/zi5LTtjhUP8Cc8HCkYDePLhwrGL8blB0MkwT8OAfD0RBmv7Pjrv/DTwXsLRGet3zBQvvQVDs8qpBMWKAOY8dhZ8yP/VYhLi+qGdG2eUFwKRktdrAGuYyBa3ZQV+4pB8AWGZeMP13EdxGYm5esld9eJCQ1DA+GCKOU7ZFwA7FPVXR/DNHVhIAlZp17plFtCOJKcwpdBZOE0XBRoO492UwkkBrhsGDCv+RQSpLabBg72EfiPCCzauyFsIUlAfXZF43ZkHUi3zaVry/1B9t63sxM+m28TskgWqsbO+jUZDQegs3fCBrlCS2Wmw5eg0ofnlziUC/mUhDR7t7X2K3A9WJOskmn24QnZdtrBxOsIQ8q47Dxb5dJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:31:35.1944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823cbc63-c066-4f9d-a439-08df43ccca18
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6336

The imx335 reset gpio is connected to the sensor reset via an RC hence
a delay is needed in order to take into account the time needed to
reach the level for which the sensor sees the correct level.
This prevent having imx335 power-on issues due to the fact that the
driver is trying to access to the sensor while the reset hasn't been
yet properly handled.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index f06b334dc9ce..137bed62b2ad 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -74,6 +74,13 @@ led-orange {
 		};
 	};
 
+	imx335_reset_delay: imx335-reset-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&gpiob 1 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
@@ -227,7 +234,7 @@ imx335: camera@1a {
 		avdd-supply = <&scmi_v3v3>;
 		ovdd-supply = <&scmi_v3v3>;
 		dvdd-supply = <&scmi_v3v3>;
-		reset-gpios = <&gpiob 1 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+		reset-gpios = <&imx335_reset_delay 0 1000 1000>;
 		status = "okay";
 
 		port {

-- 
2.34.1

