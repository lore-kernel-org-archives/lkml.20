Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574202;
	b=Fa6dcbtu5ytwAtSTSje7EQLmIsl6vO9eiosYNEl8fohAGErOJydomI91HlJYAZEK+0XH
	 7iLa7qullPQQmiT59iaRhyqFgEFVrb+VY9skcPR96uuz1wJ/JSyu1fRmGj0P6zMU++GOY
	 WwXDWT5FMvNPpzYYDocIc9Q+FEvQGI0vkqBZ/S3NpylFVaaAQcnP41QvoS4kIf1ne9LeX
	 NO+DPqxVw+EK53bstb7DmvKd7JMXsVbImsxco4wQwnvx3dzGmIt3Z4pUbZLOlQ4e8iHtu
	 EvqJvlhqOixes2CI8bwCUSpaAaPtwuh+xUqmYzdb7Ilpc00yCemAhqsa1R27GpFw++Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574202;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=fhh23ipf5Kr3XGEeq5FPZ0EvQcPlo0jj5NBS9X47opQ=;
	b=N/ZUeG5/1C3Aeeirns/A4CpTYuPmfgz+1j1UWK/g7Aerk+yrhxvDo1vrk6EG7Qo0e/CI
	 VUzooBuoy9fFmHmib7WNokULWbpS0dQOTQ9FhDedSrDvyPHSxA/PDnIJzi/71ztkMEKtF
	 ESLlS8peACwe5C/BHPM/vzgbuKB3l8lT/8i7rKbBFMe/KIoRep1F5jC3RUUTUAixCuB4Y
	 pf1R7UrQvB3WT4ccQPzMyJQ88tnXVPO217rSZMeneGr0o+arIWkzRYCtAyFl4VYgrVOHY
	 s0zcHRD969Igl2wU+bsD0CPf6awpMG1fIqc8oKw/FSxeHfK5ae2l7q7m0uhLPkZXrJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XgpV3UGW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.61
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC8C60A6F44;
	Fri, 13 Nov 2026 12:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC8C60A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XgpV3UGW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZTxLM/H4r07esyx8ump2WD5OvBI9xHW3j/GEkvI53P4agt+WxeOijV+Lri5bsBJBFwNPh+xCKaoaX1PHdxrDUbA7Q2zNUSPZWtNnpMM2OqD9R+joh2RFG+qpq6cUuyCJTQwvbjHpTt/oXH+ouSiwp9zwDOWS05pbfshggv9e0opBkoZWq+I3tzVdum1WvUZ86ND+cm6Rc3XIkr5UTeFREDKlemYzc7uJ53Yky8YGxK96J8xyGoI358QjpUhA4zSyofov9BweJKCuiOsbM6BKLHB6mveEjwrb4MhijDtzBXnopiXJycPmN1MX5aYIQ68SOc4inBS/QoOmY4ot5eiwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhh23ipf5Kr3XGEeq5FPZ0EvQcPlo0jj5NBS9X47opQ=;
 b=mibxZ247k1WnQ8lKnD33O/tC3oodplf6QA67WCmYRnKDpAVtn7eCJqCzCWqAiRmeWa9UuLmncn7Fg3aDer0i5PuhLX1yhiSHWijH6ize1DTq4hR04wZhutobiL0deLkIxuedJ9yaG7CSgoLlnYwGnZPvpe+Xy2KR1Z1TUkTGASNaJZFQGQ9T3Om+rZBJR6nqWqOwZSkbEuvaHRKHI49G37srmHiY75+6Ked3PiRRjOTSu2yOGq10yAZ+/E1+jyk8JEJWgCos3sK3s73mydeqafcsuW8v4FHpbiQS8itvOROAmZ9aFtt6SDgBmJGLP9i/Rn7m3ZbAuuDuoCZOdLd1ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhh23ipf5Kr3XGEeq5FPZ0EvQcPlo0jj5NBS9X47opQ=;
 b=XgpV3UGWDa1GIpNlAcQegl0xs+wb/fJMENuPmJxGh7PsHSs/b7KlLzOYf0HWs5638zb24fhmXQ4pumvCjTnLSc5D/1DNm/n0e22OSLseMQMxrwX4iFggTC3Cpg7E/OfGfIP3w8s6G7aqBztYBqLnMo/g6L4Uuv679S1cSbbJJWs=
Received: from BN0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:408:e6::21)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 12:49:36 +0000
Received: from BL6PEPF0006C3DB.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::1c) by BN0PR03CA0016.outlook.office365.com
 (2603:10b6:408:e6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 12:49:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3DB.mail.protection.outlook.com (10.167.249.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 12:49:35 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 06:49:03 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53 via Frontend
 Transport; Fri, 13 Nov 2026 06:49:02 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: zynqmp: Disable DP for Kria SOM
Date: Fri, 13 Nov 2026 13:48:53 +0100
Message-ID: <ef31d389e963485d19ea5837d442ab0b1ac39b6a.1794574131.git.michal.simek@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=785; i=michal.simek@amd.com; h=from:subject:message-id; bh=Uw4/VEXAmEGOP8UvlS1CsYf7lCvDJCa2ephJAQA+Xx8=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWR9Z7dh/Cg3p+3j0ej8C/9MrKu4N/3xyD156L+DYG/f4 q0tUa8fd5SyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEMoMY/nCdaLAsPiJsdec6 259PIp8TXyV5TumIjokX9Nk0n1Nt+hmGv4LS9Wc6zItn8Ni6nshRZlzoYW8v5qV4M5dVmYE7ga2 dDQA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DB:EE_|MN2PR12MB4405:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0195fc-ece4-47dc-f59f-08df4184924d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|261009223027099003|3023799007|56012099006|10067099003|261021123027099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	wvih0UIvfNzNux8iO46LxbxhHVafiLw8yegYjxwp26kNJJeNuf9zlODIhRzj6xOfD1he9EiZfewd38RSr+FsalwqevByZz044LHHtThdNRJjf2cB7Q7DQPK9mf0O1sh8FYWenqaEslC7Ujnz+2vanpIpTm0xYBfJYD3t+lUpz4HgV6YOMUJ+enUDaNEOch6LkPXuAeLxzVjeQCF1W/n95EhELXNw52aBI/miZKFd5iDjvjLAqqzqwKqa9VbyYaTMBfVKVfkmv429aVGqn5v+bB66aE+zjD2kmmy/jg25PdOHhlJpaKO8lE+auaSR4b+nNSYQHFrUK5xyE3kviJl+fcyWSe6QGvsn/ZydrVw62oAoDnLbjoPsJvYGd225mriwK0grryCazEJDwqqkuB4gmMYzbv8vLIXWp252IFQepV0t9i2+IpGcJOwtG0MDOc2uRMsm9F9UygznvJ9zh7f2xJ4Sk515SCqd9AG6MBgiil3bzfi4K7SjCzCYNmask7+LVpnnzwVFzVEjo9Wzt3WL5Xdv3ZgCXwspmn0WoUHqeFB9Bu2VQPR7PT3FyPyAXgbTnwtQhdVsoSAm+b/jsIgtzzAzgl4aJVaJ1yzJNCrrhtwB3M7E14I7FgRlfdfMFkI/OQDkHdCBV+ZI812k/Np13jkItL+QPIFIMloG37khB5aNN7P4HzhHQ+eBObYkAmYoaFXjdIT4FvUxF+6lu/6FxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(261009223027099003)(3023799007)(56012099006)(10067099003)(261021123027099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	51CyLgdmcIQevLvoCCKEsD1w9DouKcaFgo6XzmvXvCo4wRmahuymRRHzFc8UTx3a8QR1hiNZRPodWH3UZa6odSAtmHisV53oRirbi2HrhHkIQyVLavYowZoSGSKippWi6mGZew3A0SPVvCHnGc4/jWo8dRl2lBv3qAkwiY4U+wP4dE8Rxt4SScVa0sZ4sqawNDs5htmNAiRuM7794aixYwwTtvlFF1TOGjDfgiQzYeU2/IhYLqZLsIABB2YVwbtHfJvQAGPKjXjqKsVp6WnS4ml62K9BOZ+LEN4r62GPXfFzaOP83ozt+H3Nza+b5E+HV8f/78uSsTeerYUw2/K6tQNIXnxJDHJQFmURCaolOc/iH3UEiuGWdfgfMjr+FL+F13OFJVGpBV+28wGQ2P/e8yoa4xhgiwp4ErIjdi5wBGUcX3HKIm0E7JQoouXpKGWk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 12:49:35.5545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0195fc-ece4-47dc-f59f-08df4184924d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405

DP is enabled via DT overlays and there is no need to have it enabled for
SOM only. Schema validation also reports that phys/phy-names are required
property which is not valid for SOM only DTs.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
index 500af1d2232f..a81e61a4f4d4 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
@@ -363,10 +363,6 @@ &ams_pl {
 	status = "okay";
 };
 
-&zynqmp_dpsub {
-	status = "okay";
-};
-
 &rtc {
 	status = "okay";
 };
---

-- 
2.43.0

