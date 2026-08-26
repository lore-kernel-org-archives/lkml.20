Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E43B6C16;
	Wed, 26 Aug 2026 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746611; cv=fail; b=slS87VVHWx8iDk3SaTLUVxbMTUiMnv6b9V9/MTiU3LyGx5nao8Yi+TRGLHQghBK4qfe7W127NXbH/8w/8EDK5IZPcWOV90jtGBp6DVVWVkY0CF1Wog31I8dIw24E4FGkI19hkjaG/fWHxWzs0NnKby1yDPSgQoILVNWAVgIeTjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746611; c=relaxed/simple;
	bh=6+ZkcAgBAmYYRd4bdQxx9gWOR3EKR7xMCoLsglkKw6s=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=NrEiUFuCr7nYA5kORvyXihEocfYcdVtqLGQdHxdK2DsFAymetrf/v8SpzXNqnEXo+/FVvfgqSyZ3nmIxHuRlrxIgOcZXh48ktyIueZsXhDxjZwbOPdih/59zIGEUAYYYtopNbnghnC67b+uBNRakFr1TP/JxIe4e/0KaC8c/DqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Cp5U79wL; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Cp5U79wL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Id/qt77MiOdTNaHGoJqPvqShwu5Gr3kHO+UybWicX8sR3LY0V0IkCybSMfOeqPHGlOJSM8U0HO7JcHs22hpB1X4DEgo/dVmmyUYS0UuCqQZVWGGx4o/OjosIfYID/XH7TOsaX/n2jJWAGq8EbIo+DFavOAs5qRdhBSb8ZcPNtX3LVSa4YklsmhF5wt06ehX6jyMeBSnJrfF60KiYfw4h5Mk71o89W2JhnewjG+/O3+Yc1EqxGsNg0/MWnIIcQ30UaXEIvpGyFWE6GWfOYxzn4qUQNb2TDTMAFuTgBNo0IYnhfy8gezmOwMVr4FgTtqXN6uxh77lpTRHoR93deMK/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlXrLnaMe1tk3dJAcyxMNi2ADlBwQ953TgCCYnLHsaA=;
 b=Abng1bV/pNIo3r0gl5r3OGR/x0bL7++Z4joFqtWDdIIfFeIix4O6avWH3AWZvMFuiVh5z3AY8xgwfsWI0CjjxMvq++kUmY2LmVDqYK8gmfmT5fwXPXWxNSvs2iK2dGKcZoMWdJ73c/zA2LbeXWh89QgMwV4wKLuDxBVYAqwhaFHyUWlKRky2TUKCAzToTuBz7ffHyqybjdtQjtI2TR+Cg32Z8DwaYatbfCC8fOByvQW6XikSTHPRFyWZ0l546S58zEQ4fMIgTqF7yd4xsjiOv6bNcIRxPviXyCGfNJnUUQmWJOBidIorA2vHb6NSn0PZBG7QuijpqS4Ytr9nGUxjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlXrLnaMe1tk3dJAcyxMNi2ADlBwQ953TgCCYnLHsaA=;
 b=Cp5U79wL3QpsZdq4bpKuVGMcyhmMkGkjfn6LtS6raJUL3fHcFlDOcFcwACpTJ1MqVdSd+UZt5KA7yYqZfLG+xpUPa813n+0liXq28eO0N5H/Aa49CIaGJsDGVzYRn1IwStT5xQBqIFaXVH/YGp9VAWPAT/B3M1jb+in7yUmx6+Y3HmR7ipxH7rQlywwDRwRpI5bI61aJD/VCJ4VhWSSG/0eb2FKpS64zRhMwgON64BdTkl0K5wyz9UBqmFq9K1xpLGIVvehLSspscvR/oLUDQQwSBL1kUCHzybdZd5jbPNAb9tctLJDHCHu32ISywSkZ5fkfwRxHpsVaz6yCDihCHQ==
Received: from VIUP296CA0010.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:34f::11)
 by PAWPR10MB7413.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 12:16:45 +0000
Received: from MI3PEPF00008489.eurprd02.prod.outlook.com
 (2603:10a6:800:34f:cafe::13) by VIUP296CA0010.outlook.office365.com
 (2603:10a6:800:34f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 12:16:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008489.mail.protection.outlook.com (10.167.240.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 12:16:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 14:22:39 +0200
Received: from localhost (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 14:16:44 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [PATCH v3 0/2] usb: gpio-sbu-mux: add FUSB340 and enable option
 for orientation
Date: Wed, 26 Aug 2026 14:16:34 +0200
Message-ID: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACPZjmoC/3XNTQrCMBAF4KuUrE3JX2PjynuIizRNbAQbybRBK
 b27Sd0oIgwDD958syCw0VtAh2pB0SYPPow58F2FzKDHi8W+zxkxwiRpWYNn6LDLiwuCE8WOSKI
 b14qeG5SP7tE6/9jA0/mdYe6u1kxFKY3BwxTic/uYaOn9xfMQzKiidK86IiU9ugBQw1SbcEOFT
 +wTkD8Ay4BSQhNulLai+QbWdX0BFSMQxQEBAAA=
X-Change-ID: 20260825-usb-fusb340-v1-f060a5f84d3c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley
	<conor.dooley@microchip.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008489:EE_|PAWPR10MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 953c8c8a-460b-4a32-730e-08df036be55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|23010399003|36860700016|1800799024|13003099007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	2zVwOlJlhS+3W9Rpe1lzyQ7hd0ur6Jpd8UjleZDjq8TZqZL9GAoHY2W7/Y6cvqYrdDjg1dQkYyaB2e9oDLSNfCLyXWYkJZ+mxjTl210YyA9sLUAmf+GV8DaVHKvo8RwNPPajGHravW+7/qhKnGihQG7mPD93SRxyt5kJ566xvvai8HLbiPtBumVq3vk3pr6FrLwMwNeCyXS+neKGafcAMnz7rSGT3D1fwJaP+4ij7/nxvm003pJDvqF3Q1L6op23Wx+6cFlDkoon89PNJAsEGNCDVvtWcACX/BMxx4WYY78qV/uwTj96tOJX1VIFdEjNn8Dg67OHJNmwbNr+NK5GVeNYzLZ4HgiUb+mjUKjLSWyW0ScAcMc6Lp8ZEiciSekVObAZDPtz0rZpZnxEoIDndyuBAPzUWl6rbZfWrEQjzo/PqN7smiLwuBlHzYmEFfeqDWJpSVk/CwP1FvYDR8TNNT1g4hniHkwKQoxzUhK8CkQWpXahGfvws90sDlSgZ0cdOJktUnmxB+3TrS/4uwqeSpS6R4WlbNhf6oU1sSk0qrVAE7Z4tkCSDHPeBg2bxAJMKICcslTxFY/SCmT4Ne+jSPFaDdabuA0XRdO+Efl5RGR0hDrXl0Z4HydeaOlRfLtvnTVDG2RtQacUzGmLgjDVFg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(13003099007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n1P46EORu7xtud4CEZ27MmqtEohsTNZ1cb/imneW+k93nsZmKpq/kZ9khObd5fel5qeTfGWcfudxIaBXocPIZyHKLpRq15F2Ihhu56YSyVSEDrNNFp0txQvz7UI9aTZ0jOyRiAiaz314hDgfFb/1nnO+Kr2tnkzlhRPtXmlQostIxyquXck/FALr16IB9/RQ9pX811R+MCLv9jBW43u/91vupNGwmUaAWTXsS/CsbNAJHLeNpJC2ezpmeedGraTPkeorbzJc5L+ePnvCmZpzum2fppMXjPmH2PDKk8mNUYdflz9nEGqmZGYRr0jmlrREduF5d/yyeRgR4Xh0Z1uvb3Isp0Ipw/9MsXiHuD4w/XyR0QpbMlcJN78TnhOjfC3GQDATTc5j6/Q6mDc/mXvlP5/ByabpKFFQaT8YFZWDcS5hQNHImliOknEQLVUC1GJK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 12:16:45.3792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953c8c8a-460b-4a32-730e-08df036be55f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008489.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7413

Add a new compatible for FUSB340. Also manage the enable GPIO, when used as
orientation-switch only.
It is used on STM32MP25 DK boards, as orientation-switch only for
USB SuperSpeed lines on the Type-C connector, the enable GPIO being
connected to the SoC.

- - - - SoC - - - - - - - - - - board - - - - -
                        |                 USB-C
+------+  +----------+  |                   +-+
|      |--|  USB2PHY |<-----------------HS->|*|
|      |--|    HS    |<-----------------HS->|*|
|      |  +----------+  |                   | |
|      |                |    ________       | |
+ dwc3 |  +----------+  |   /        |<-SS->|*|
|      |  |          |<--->/         |<-SS->|*|
|      |--| ComboPHY |<--->  FUSB340 |      | |
|      |  |    SS    |  |  \  __     |<-SS->|*|
+------+  +----------+  |   \_en__sw_|<-SS->|*|
                        |     ^   ^         | |
          +----------+  |     |   |         ...
          [   GPIO   ]--------+   |
          [   GPIO   ]------------+
          +----------+  |
- - - - - - - - - - - - - - - - - - - - - - --

This is a subset of STM32MP25 Type-C support [1].

[1] https://lore.kernel.org/all/20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com/

---
Changes in v3:
- Fix missed v2 update on probing mode-switch property.
- Link to v2: https://patch.msgid.link/20260826-usb-fusb340-v1-v2-0-994a03c9ae45@foss.st.com

Changes in v2:
- Added Conor's Acked-by
- Fix new driver issues introduced in v1 as reported by Sashiko, on
  a possible race during probe and a possible glitch upon enable.
- Link to v1: https://patch.msgid.link/20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Fabrice Gasnier (2):
      dt-bindings: usb: gpio-sbu-mux: Add compatible for FUSB340
      usb: typec: mux: gpio-sbu: enable when only used for orientation

 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml |  1 +
 drivers/usb/typec/mux/gpio-sbu-mux.c                    | 13 ++++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260825-usb-fusb340-v1-f060a5f84d3c

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>

