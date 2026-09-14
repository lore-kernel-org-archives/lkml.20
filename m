Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17545388E76;
	Mon, 14 Sep 2026 07:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369811; cv=fail; b=YqjH6bEQyDu590hrzbxnsgYGIP1fYY+uveoCtW7ACVx1uWWgDx1HQ7fDPgEskhYc3fDVCwEtTqR9qSfzJnxxEPAN1o328h1B9CcQ+RlCYz8/imb8tz0WHA/1NLuhf2E6lcQAyQqLyl8Z/czkoyiyt48r04ZqtvLXsVF9JGYWttY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369811; c=relaxed/simple;
	bh=p4fJm/DbwjwkB6sA2SIBBBef+dtBw+duOuJ7FUZG0qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t2UkNSseEB9CGe7NzPSvjgIX7lQJ5gtEjFGx110R1msax3g9FWkkxm4UneqR7nemlGNYkgTgseiHY4ng0VG/YHnTTbD+2f0OGlOihxpyk1EX766zSc3tH3pFhrgXHJlHI8EKJ//LFbndyT0F2FjIPMqXAD+v3MeeqD7YQtTV3P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NrSYhujt; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NrSYhujt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJWMz9QyUEEsyUVPiHD1W8QpaH4Lfc1oE05g+nw3U56Jp+IAqNbouw/F/0Xcq+RXsazqk9c1VPTT8vyrFjpigXIfht6zMdH363zWoDxTh3JeqpJ+/gYqJVZ1Tkk/412WdT3I0Bly4JnU80xu/Ywi58VKvAEkPUpgpv/vm/+I2CeG0T/BD8xQeNUliI8u3v+ObcGhvywUnO/1ATKpdrC981D901e5AdNtd8wDUze0UNWii36EDxrZUGjJk9NXOovq9rK/VlfmFcaO/qa2mY/Gkwrdt5OtEGjU7ZqDbVORlhKKNGcVWTv4BtSuQYek/3A0Z6m30SjiCp+l8RbOu9GxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzdTBWcRdHLlxwJAr3wbgHZnJDTe+pNNHMhkTpZv34o=;
 b=OtK2JRsI2Wheb7jv8dZME/skVp1y33hGZzP0hyI8i5/WHQLX6qUCeTpszW7rJ8WrvgVs+jahBuBrjibqymgXM7EqI+o0TS3+j7ozNgVlGK6nv1hFs0Hk4V5FBKL61vGj/OprqNhtcO+YMoTH5bRbRyfGZd3Ww3Vl2XGRArq7ZD12oktpaHv0woBWuucpR9JnwFCIaYwtLWZ4loGJsQKgJEEZ2jZsFAZ4LDBC0b1uAADSF9Z5Bk6S/wITivlxEGoYMQIPO7wahZf0oJMO0vn3GRFVflB/rJIT58+qp2mF8fgOgxjbCMgN50exOaSIc0T8VJd8pvPnRT6rHIWOP33qAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzdTBWcRdHLlxwJAr3wbgHZnJDTe+pNNHMhkTpZv34o=;
 b=NrSYhujtV4xH4sfL3Sdum0YxK5gkSsu/jNKpy+BJRswKLrw3NsGAh3dMZ8zPyTnIAnoxmBo99luC4NHtFy+uO72dUVnjnRlXTmqnyr5jR9TblnysWmvbgq2LwFyD9EnEGo6CjbtPty0m+M2U4GoGvpJ8NANPQiyQDjrJ/hP5wo2NrSf36wh2eOjgCajFFQT4cQRYy+lj1m6I9iKOV6HPhd2Up1pdQpHaj4oeamI/ncV71w7bcgMvQnaTMZbpIWI1Pkjcsn353hSTcoWwGiRo25F+5qN9LxLe4E27+OjAeJltj1WNqnaIAzhaVohzpos9vXNp/NHYsHits4H/IRVNCA==
Received: from DU7P189CA0024.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::11)
 by GV1PR10MB9159.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:10:01 +0000
Received: from MAD0EPF000008B9.eurprd04.prod.outlook.com
 (2603:10a6:10:552:cafe::a4) by DU7P189CA0024.outlook.office365.com
 (2603:10a6:10:552::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B9.mail.protection.outlook.com (10.167.241.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:10:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 09:16:03 +0200
Received: from localhost (10.252.27.156) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 09:10:00 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 14 Sep 2026 09:09:31 +0200
Subject: [PATCH 2/2] arm64: dts: st: add dcmi node on stm32mp23x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260914-stm32mp2x-dcmi-v1-2-c594e081d21b@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B9:EE_|GV1PR10MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2f3766-a158-4674-5b50-08df122f3154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wvUGGcb1QqHBWO9lB+i/QD0gh99KCEjRp+Lr0tA+m0b2jv4Wn/f0tHI/L2FN4uibf9cUIfDw3h0WgOYLpzJd8nIBzLfvMk1FEP9cGVKSrqQbNTKlQzX0mzSvevzqxc+mnvU+YVO3kWXg+FI2ohe+DTI73rv/X8VCp1Fop3ZqJtjcbVab0nyf/BcIoKyqgmItNWIn826ZyFGomeVyWMQ+G0zL3vhk89YVu8g19PkT27Oh2uTuRNaL5WxYa45Dn2N+lq5YDqB/G+gyIlKyV1uDyZXn4Uj5SnjoYd+cl1T21ozFFrTo+ZUplr0uYOwTCsMAYKTEJhisz4/CaP88fYqHf5TyDn++ZWpevN3ob0nr0lWW9qKgPc+h1QqF0oEG6vF2HokLwPsm78lHp2Epy1brMGQqUp9WNl4R8hu5DkV+ZEjx+yTW92D6bFVuupGc0Iz5fOwFhfiRmoZpnOuBZGT3rahDr7o5lHJnwyeicy7A3PAR4NZhgPz4JPTmK2nnJ15HEIKvPyZXU1/3U69G+wS1tHjNz70IuRn8BX1jA4GAA/W5CgrS7sv+n77M+GoXQNCQi4bHYOx6+DSdm3jHJObObajaky4XFPDh1aKM5TNdLmTzZgwG1X4qwtEP9jDUtuvXIn2iFVW5EK2n8LKc6zcEenhSh8TJ9PkxY28amWNnlJDihOwrccF6TyAChBxQeFl4Pcpjy4bfBnYI1P2bm4Zb6A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n0G9utD4T7jY4HecbHqQmFmtFtM4WsQvfPCZJplr0QT0zqFVAOz+plzcmPKSUdVJcolCX6iO/ZkaWH5DxQyA2rPs4nnJ+JDqj1i55kMEUL0tD/PJAb5xqrVJLPIa9QqGD42DFnwWXICA7we7lvVq0/DrAAs263jS2s62rJi6ri8bUm/HQdVbyL0AnXodhvrz3XSKQBDSSlVk2MGkufS7Tax6IRVKUGoLkNNDKmzesQbjaEzj7PqEs3M3QXwM0ZOl6G+2uaKHBroq1y+Ij1jbSFjeLisT29xoLX2xzIGh4TS8038/5LRtt083OKxqP8YRXM6ZQ3NnhlB6Mprt68+xBSN7rjxuZKvylkmZreHASnZJQTy0+jwXq8B6zJZ0X+7iR8BtGrLb270JGxK8lqNMeZic5zYeunGYlhXp9swSgctCgm64zus8tjR/WmaREoY3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:10:00.9101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2f3766-a158-4674-5b50-08df122f3154
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B9.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9159

Add the node for the DCMI controller in stm32mp231.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 0feb8943efae..ad008049384b 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -646,6 +646,20 @@ uart7: serial@40370000 {
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
+				power-domains = <&cluster_pd>;
+				status = "disabled";
+			};
+
 			rng: rng@42020000 {
 				compatible = "st,stm32mp25-rng";
 				reg = <0x42020000 0x400>;

-- 
2.34.1

