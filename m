Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazhn15013060.outbound.protection.outlook.com [52.102.174.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26414529417;
	Thu, 15 Oct 2026 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.174.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079334; cv=fail; b=cFDc0FNMfSgTIUJspVD/LLdFAwnwKS78YqBGqtuWkkvdbqhk5JmZc7a8XJdib5yz35wviP20e51jO7JiyWg33LgOiexdaaAjbPa6RK3UTMiEFElpihaUNUN6n9GAzQcVB/SnhB1eOGQ1k4mbdVNDW5/g5fsX5nG7x7KO88/Ksf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079334; c=relaxed/simple;
	bh=OHQApY6lj4DGh3jkQMBG0/7NNrynUIJsdoKyjI8YiQA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CxS78HzpUYP0wGw8T7fxLfKQLw0uzXgpDmLHgtF55cpEtaZ1ar5SbuPpLlE3lbqujNRakbPVdOQuByPJgjvkR2ZHk7wLreOO6B1PelY08PQnbXMgx1WK1oJlRq/ze/i6DJYVzBd+mhPVLZvK6pgnLGAKuR/0KgbALsBHjTXSc54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=FeQD93Oz; arc=fail smtp.client-ip=52.102.174.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="FeQD93Oz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nu50Z7YvHY7HsydZvegPv7OPX1NVd6fIfRLEXf/M2REkO3+458XFh9vu+Lob1fFBOzg4LG8gLgDY+6faemKzFAyXb5i3KYHzS7ouEUj69zApoEEAEw86OjMBg79IsBByQMA7R1JNQhcd8VP1je0SVNM0MNW1ghm6sCRIGm0EaiJxM7FajtPFV/Rbs2wcGCVqBI6qFHdNMazFGPizhPTOhia88js8OHsWk0jmOuhnsr0nYxC7YDy4qoQ0NrB6c2yCKDdN+5ACNZijXoOk/wSIoBFsOKXnerAhYu6Yh71nZ3vT9f48oaW11+dONYQMs6u7bkv6sY7uSJ0GYHMgGJtvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW7i3VMv6X3fE7YsM/6qtchCWcRku46q7bDuz3n+Xbs=;
 b=Db6DI3Ti0m+mFp/qaYn02eOLPRfhXuAtw0LPhRbYKFH0c/BYLL0LZcmGCkWqy4dDznEeMBmM8UX0dakicIbpXnFctZ0QMNv1RHLbdBm6uGZwYziX5KEdz97eIG8lI/v1wyCA3rg7yd0+hOl5KL6V3/KYNxYBi5TSiBas9Ih/Inh3gmCiuUMhgOHAsnGVFI1WYl0AMqsVVrvA2wQe0j0+n9oy5yGelD5IsfkidjECrK7eqFPweEoUUKRQbyfDlnXl514naRWgUz5Gwzj0kUIaAjcFvffcGx3VPHdtaYhm/3jkZdgxd0g6S4toXmXWmU6ngUPgFjWdJi2JctL+CMZXtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW7i3VMv6X3fE7YsM/6qtchCWcRku46q7bDuz3n+Xbs=;
 b=FeQD93OziRZqwFANOnBmYOxo+nK43sFODNlrFVxME5CA1jzM/jDWb5zm2+rKXuqPfPWJploKJyxaqFacuMEE6uoiEu0+520RblVz6Zh10N0TSeDLEkVmMn5fgGlSnVjLHjSP2BcdJTohKxGnG8p4P5jb98gFZVHQycmcjuhV8wPzdBbKE4SFULGGDxbOjqmqlae2dFmqrnKTWSzb7TlRv3Iq5vJXv1T6ehP0YfstfWyBLfu/5Lvcm8r4K/g1zW4VgUlpFnLAtt6+jpbWfmQ8HreI99tPQPiCo+1YGOx+bd5m+HPVVpTa57nfFTloEFpGihd+TjGvglIxVFdSu2S5yg==
Received: from VIVP296CA0120.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:358::8)
 by DU0PR10MB7051.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:422::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Thu, 15 Oct
 2026 15:48:31 +0000
Received: from MI3PEPF0000847E.eurprd02.prod.outlook.com
 (2603:10a6:800:358:cafe::5f) by VIVP296CA0120.outlook.office365.com
 (2603:10a6:800:358::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 15:48:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000847E.mail.protection.outlook.com (10.167.240.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 15:48:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:44 +0200
Received: from localhost (10.48.86.45) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:28 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH v2 RESEND 0/3] ARM: dts: stm32: support secure watchdog on STM32MP1 platforms
Date: Thu, 15 Oct 2026 17:48:23 +0200
Message-ID: <20261015154826.1947492-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847E:EE_|DU0PR10MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: e51416d2-6719-49e3-82aa-08df2ad3c327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|34020700016|1800799024|36860700016|23010399003|11063799006|921020|56012099006|18002099003|261009223027099003|10067099003|13003099007|12100799066;
X-Microsoft-Antispam-Message-Info:
	KLMCamC4NQ0glx4hW23uxGox1VvJKbMVoDRoPuNhGyhxeOmQ8kc9w1lQBTg61isAQgvjpawzvO6J7C0xEvenlcoumYdzjnjZ02ViRN3lCwDY7hO3A6P4BuVUdz0RLgbW3AxL391zRxzmgb5B6Tu+tShOqtVzzYlY//mYiP87zre2KWM+m+S/JyYStzsoFuJTLxMGUMkHd78KEAwk0E9UPV7N5Rx4fHXD/tG1EfPmCZsYjJXFS4pOz69IdLluwSxPmvzphKz+Dgm+4Tyjl/p5pLXCFwTTARTRQp948xlNE0X+dRPjSYVupk0PSt0XRxSJ5WbmycSE2qkA7BdrbF3ceDobKqvJQO3yFNMk9CdXizp8uRSHaQ3za1YwHaBBFn5DwWiyXr/LAELfTDboSZkR3iXWyZXNPWA2hUWYO5MIacym/aU5X/Rdtuz8c8nPRhE6fjchs0EArv1Z0ZY2ihsChoyrlDNp3MO81HAiFaUMFpbO77nbgzq+14xxE7VN49s2/qKNGuElAm1wgbn31gBt52WIr3ZXIfQYosEkkB/GDCPWyEK6Uiq2bsgXYzu037HhydWG4q9r1CAeEHq8H0ReSuh33Y0MbG6RJylyvO7Xn7iO6tL5WOi3hQO746KNJHwsHlxiuoZ/6JXrbSyxTz1ePTDm+LfCB/f3ma7Wa4Lf8+gHbbMK7pVjVe9tVFoODG5J3RF8HEWrWHaBRTwW5lybCw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(1800799024)(36860700016)(23010399003)(11063799006)(921020)(56012099006)(18002099003)(261009223027099003)(10067099003)(13003099007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yQyzzIrkI13CSxrDrjNzkCLgOF5yoInW/sugKN1JFhMl04/ebiOyQdxy2o7lVtwtNSY6jZjA/lKtt4Fl6ZfcOLxKxqY8Oi2psYDZlmpHq+xO9v06IiMzJp546gXUVZ9pzeTI7GEptVwDL3cPJeV8m1XcvC2PjWF9CEOOJFGAarrgkyMbDqZ/Nz5fgpuPd8Wp6QReKV0uZnhKYk1ZXA9owSME++wnexiy/4rK5pykgc/kJSgVthqcYp4eTk2QVqmr+PthBM/2Cw5CxLhKBlOCOeOJFRkGBp1AieqYxC6XlCA71CGYkm3SBfH4slbaRE4sRts+BbntBtesuyot/nHwDaBXv+ABP0ehVVzQZXbQXSAX/C7exL8jbZcBJrC7/ukF+MYRrHx2L8W9EORU6IZwa9iedEgkGKToAzTMyi0bDIkFhkz4Fr6sMjJDRvkCUZ4G
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:48:31.0132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e51416d2-6719-49e3-82aa-08df2ad3c327
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000847E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7051

Recent versions of TF-A start the secure watchdog IWDG1 on all the boards
from STMicroelectronics based on STM32MP1 devices.
Since the ARM SMC watchdog driver is not enabled by default at compile time
and the DT node is not present in all the board DT, the boards get reset
when the watchdog expires.

This series enables the ARM SMC watchdog driver in the machine Kconfig and
adds the required DT nodes in the board files.

It would be nice to have such series merged asap, possibly in 7.4.

Regards,
Antonio


Changes in v2:
- Drop addition of iwdg1 DT node, not needed as OP-TEE keep the watchdog
  secure on all boards;
- Link to v1: https://lore.kernel.org/lkml/20261007151358.1166329-1-antonio.borneo@foss.st.com/


Amelie Delaunay (1):
  ARM: dts: stm32: enable ARM SMC watchdog on ST STM32MP15 boards

Antonio Borneo (2):
  ARM: dts: stm32: move ARM SMC watchdog to STM32MP151 SoC
  ARM: stm32: enable arm-smc watchdog on STM32MP1

 arch/arm/boot/dts/st/stm32mp151.dtsi           | 6 ++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts       | 5 +++++
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi | 7 -------
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi      | 5 +++++
 arch/arm/mach-stm32/Kconfig                    | 2 ++
 5 files changed, 18 insertions(+), 7 deletions(-)


base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1
-- 
2.34.1

