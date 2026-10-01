Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C3C4FDA40;
	Thu,  1 Oct 2026 22:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894223; cv=fail; b=IRWzEi94F7V+7rPoAobzN8fy0+q4p1zqC4cSfDiknmKJ7lG1AG6eIuzfU0C6i372+io94L6wmA6Wh8UcDWedbYPUbisxLcJaWxL0sBCRBRgmgICVxYmk4VzU1XfQgcL5QrIQESfPRfEsg3XhozTHJnAYaOZhR4CKQL+3PtAKZpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894223; c=relaxed/simple;
	bh=oh5oMNhGi8HlzKLS+FCbEYi5rZ+mVNoP9jiUJocniDo=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=tHXag40bba9HdejmrwFBgOTUCH6trQZyv8/xSlmzqgLZgkOZN3IUQc1f7LbqBADDsvblVarjfYq1VHifB3g4grpwVdUi2tdLKntloXyzG3oljJD2Zse+SNetYMxyqCqXqh+Cc6Ax/M45FTzCsgivgAUoR5TV98fIEelxf31VwyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=qUveOaBW; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="qUveOaBW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeLubNBpu4YKDsa6JxcTn1qV8vhfB3R/RwwQHYVLo1zS0BZVniPDP1HHtceIGDNLnPFwWzeyiWIS2Jnu9WguvldVUR5K41gBEn+8evXYLHz6F+jj4dkNB6SznBJ0XiewsGkjN6CuJEBKUzhTI2Bg0B6Tqw8LqtgVvdTQPYHUAtK7zReeTbyAuIvcVDOjgzR0Kae1rmKBXEMYD5kvGBJWFXnLfTNEu/9j97pHoYwM0CkbIXvQRealxzpX/0+xEVREiGOYCFphIU9lq/3p2Uq+Et6i6kLiPplDkKsDb5Ib5CLXHdGQXRaLtKAaOLvVuO1m/UlaLbVFgE3VCnDtrKKyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voy+f6K83hkKMs2F9zAvq6OWgZSq+ZAbOiVVIlWOLI0=;
 b=xVWGXZmhzeff3BCQDzrT439KK0kRC4J+47d4+ci3a0OTdRzyUQ5MCgiiLB85CsrWXoJdr6+3hgHESf3RpXIhhd0aouoX+KilbHFIzRITPuqLuofaNtHIfhdgWXIpYPksWkQnoWG7whAG5zqfkg/wgJsMmDlbFx3UYzbcsGDcOj9pbWW2/lMP7szn14wmk2TaGapnOn7p53ua/Sus2w9IcBsv9KLqJP0HFfS+ZGGQJ2pt7EdEsnArR7EkkBo+BVRJD1nsCfIfmH8RdYrYt+M6XjN1NOprx0AsvWiOyg69kvVicYlBqFsqdjEaGpLkuytkjE0xOvnqwJza7M4vIrRejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voy+f6K83hkKMs2F9zAvq6OWgZSq+ZAbOiVVIlWOLI0=;
 b=qUveOaBWxiN/5+qeCBGWuJOBi2DQAEvw/ajD8N0DcpoInnZscJu/Zzz2LFcffRDhex9nJsNPiviOIP3VVb5rvWU18tgobL5XrYvH8KIcqu8NG8t9pb/BcuA8/9Ti5HXMk0x/1dCccqKPEeMyxV+cq9ytIreSNowOtdG4A5176KU=
Received: from DU2PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:10:234::11)
 by DB4PR02MB8749.eurprd02.prod.outlook.com (2603:10a6:10:382::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 22:36:56 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::42) by DU2PR04CA0036.outlook.office365.com
 (2603:10a6:10:234::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:56 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:47 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 29/38] arm: dts: qcom: msm8660: Align closing array bracket
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <0b1bea1463ef62cd786c8c7ad150e723f6bef8cd.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:47 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|DB4PR02MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: 227df1a7-9982-4095-317c-08df200c7fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	w4PWcstrX7dOLUkVbfFLITUXTJIBHIgs6AFX3Yt63Fmd9IYGT3bJ3CTtkm6VrgEvKzQWlIGLWl0rri8fTNZ6VPqEdpUHfXEc4LnQhIDgs2C0fC1Ge9iD1Q9uXt0zGzMNk9MHTgXtyC03khC+oyslrOowKB+jkiP3XN9CKDvsOB5dUoNg5cbWCFe6uxX4Nr4krHKNrvqIGTxUcB3xifIjkWdTKXNz6JUAqkFuOB+ZDayDPtCuIPrPOvTOd933ZZdX3X/6hRLI6Oyiyc5TV/Y+N7hrBBvqZBP4vZDTmpcMHweRTYS3ZO535Z5ZF5r/9JZQU6XeQcCxoe1NB/2hx9yBc6gvmLruGELEH79JVGJlmLaQtIl7FSPq326bnfiDIP8AuYL3I0D3vZ7FpqeItwCPopOj2QmfkifmN+2kWM/eM8zBqU3IIudTWMLYOzHoYmeJstPAX5/IS9ODt12NYSo3jK+jTXTyfSg/Ry2UFi1bqIFunw65IhBu7sqIMS7ceLrF0GeknvWGEwKAsEM8hjxsuEk7FLNAcPuBjb/CDJVu0449TeBt5gcWEUfnprVlbhtI01oyoDkwsTTqpWmL0vz+8w9mox4Api+lnQ9Lm8kyPDLWEYvYYJbIOhNyfH2o9gapG7kkVpDn64O/583hT8QeFV3vcJ+RUIn7/H1x4bXFczhLmz4BWbNCZ1fTt+W5JgTrnMGKR/700QhC4YS/YKKRlA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZeXUdBqwgtdxfBPmQS5R+N3pZNdWSe96XlipcAF2xMSLBaih9dMk935p24dEUP7lyF1S1340nxugQnx0JCpbHvsEp7tu7mmclqJHwzj55sG6tquF0DtyCQvGhAPZrKp+4IM7dhwj04l+NUZf0dbOTsn3uDsRRyQ7eW2qL4y2rQCPkmuQrRnYk40/J6HWmFmp9NEx1HsXtscyfoOG6XZ6ql5bPdosUPfB/zMBWsn45bllEdB1YpY0hpgin6oXPSH/DCgxP4lzOuLBEvenFarXUGx3mqDA+XWc2YAuF/geRsLB9L7nqghUrXv7VzKEYHkvl12NUWmVoc6bVT46naq1c4bdm36+EUwd4FD1xUP/1UfAL7Bem+hDoVWwiTkZafI6yCfxG+TEICJqaIYKVstMXnpWZZCoes7SZEmWfN6YMDsI3+58m5Hx25t85D9IabX4
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:56.5521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 227df1a7-9982-4095-317c-08df200c7fd1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8749

Closing angle bracket of an array should be indented like property name.
Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
index 69fe651f564d2..c58d5ffdc678c 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
@@ -60,7 +60,7 @@ MATRIX_KEY(5, 1, KEY_RIGHT)
 		MATRIX_KEY(5, 2, KEY_DOWN)
 		MATRIX_KEY(5, 3, KEY_BACK)
 		MATRIX_KEY(5, 4, KEY_MENU)
-		>;
+	>;
 	keypad,num-rows = <6>;
 	keypad,num-columns = <5>;
 };
-- 
2.43.0

