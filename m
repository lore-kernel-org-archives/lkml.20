Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023110.outbound.protection.outlook.com [52.101.127.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B073D34BB;
	Mon, 31 Aug 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164599; cv=fail; b=bI21or1mrviYKf7w38j/Cy/KxCcHHcXYiwcOD8eHS47ml/4Po81rZkN1f7+6g7R/HWMmjDufwSkZi8dQ9Mq1zxltiGnWCa7PJQDg2/JHaK7O9uQ60iYaktEBNB4ZGF3HVYvQ1tniW2z0DJhXEFCA3uz5/o0xjrDnwCllC5Yqmw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164599; c=relaxed/simple;
	bh=yBa6MAoFxvkpp3H98ftdDyxTihkSRcxRYHecOESRZLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fMq8HtVjpQ0aX/EAawq1wU/w8IHChXVnx/VrnvbMFOK9dWd9X16Z5ZYV86y33XzO5nYJ6ZJjtetiEi1bOxvmFUK7kSX30q2yYMCVezn7zD48ZxlrA6wliY+pQQkORm30UG+Me4mB0XTownDEW1tzzZ4kotEaYrMVJxYFtdr4v2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmC8puW/JfYBLPObnet/qZF+jags219p0VEOTP/I7JUInr3go0QIpsJnkrQ8ixCPEmfFnbbp579hTguwAPXPINUDmZYPBf8PYynfmywepe6JiKNKgLVM1UBqtCHhWYw13zD2hgnqfB6Tdi9Lf+7rXXJyZ5HyyYS91IMRAilR42HO1TJaCZF2Pwex+jl+XxjI7BazZqdGtleWJ8V+Q/fimamy1rIV4Gfo0ttBFfOZEawvUqXc1wgDVJX27NXpUGSmXG+Vji6YKiKJta106wFkvTB6kziDvHpQVUwBDsBFex3DJssZoqtIpTKjz+qkdnmvcKZeajLy+f8VmnLch2fCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f15CQ+mxjdjEHSCbKIISZHUTpdx5KtqbUP9sBQrU00I=;
 b=d0kPqDbN8yNYVbnx1N1GTgxca6KDsDSifDRCY+3n7eHkeDBcsKJAWCyGgofFgdmDoPeXMxESuImIL9IkIlPTRHP9Xjhtiy1Z2MDFI+c784LGABtj93q34w/pysj0D+wt4SD20h3qRROqXQrjZlN2y4sHyBquOXyQUMHmhcWOX8CrRCSg8n3u0EMBhlSQXONh4yq0QyOc6ogx1Evpe3ep4fmDBS988NHUh5E99g4hlpuskxSlmPy8RpviFFkcxYGgsNzTdaayybeq9Aw2Bydu+GxnAUrCc1PElW3vCoiad9SJW7ASyA6Mo+XMY7qHf0vmpe2iuxhvI6f3ohy7XTrXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0206.apcprd04.prod.outlook.com (2603:1096:4:187::21)
 by SG2PR06MB5240.apcprd06.prod.outlook.com (2603:1096:4:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 08:23:12 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:187:cafe::24) by SG2PR04CA0206.outlook.office365.com
 (2603:1096:4:187::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 08:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 08:23:10 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 91EB84092108;
	Mon, 31 Aug 2026 16:23:09 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	pawell@cadence.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org,
	rogerq@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	fugang.duan@cixtech.com,
	cix-kernel-upstream@cixtech.com,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v1 0/4] Add CIX Sky1 USB3/USBSSP support
Date: Mon, 31 Aug 2026 16:23:04 +0800
Message-ID: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|SG2PR06MB5240:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fc47fbed-bbcf-4079-0bac-08df07391849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|7416014|82310400026|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hctm7wrzbAGQ0h/iNJJpJ0oC3FCpkeSvR4WQX/ImcyLtavpfzP+p5H6eW9QYoSzFQBbV4SksLnEBxw6l4kIn5mFYnNKslTFpRFaJReQEk7AEwkaQtD/+/k7+HZJaRnfTv7l9klCjpK2pDc+PQiwhYMtn3Yu6G92Oyx3xK/dDyblEc32WCi456lJu27Tq5AvJBw1v/e9GymzsWTI+Dujyv5TTl3qhz66i/73LrTJB3JVjwmoamqNx+i2pSMMCmtm0Qj2OyEoR5YtSVl+mRn7T6YLrvwR7d4UFtoVJz8cwT2gSYIU6gAOZnXSd3mFr7rca5wxEjI311PxS7oOaBs2lDjlMDyoYU5fYHZ4ff638mOBetLZXpoXnfmQhIVRHV9m70ekKCv9LJi9vT9agZE3CHnrjj+dYeZYuvcZ8mpQ5LrRHCF4zA5e2SBR5fKSmOI7G1jdti5zcGi+oOQHJnHQiGnqRoRIzAL6dnalz0pYQBt/2XrXumKOe3k6UBMIz955bTK1BMLH5umyJkRqT1mjXL/QqCOxGre9Tc+49ZJMa3iqlEnDKW+jJ+WK0NzvK3KSIY/BDdf+EfBKAl4lMM+xFG3rz2eueYViYbJthdutGKNUpCYL4Uymi5x9Ls3XGWhXnQn0HvGey0dW53l1npXR5e64VwYiQ5komQ5oDXvU4cd+U9ysSUlbbOKAGSNsvYb95G6GiiwfWgcldWBEF0Zfgbw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(7416014)(82310400026)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jkqjEbYZPxZmVJ0QW8Uarp+zI+QYVbsemqF6V5EsbzC7+rhqr9zLF0R+vfM3gFXxn7cI3jbU+52KWbsBLEaRLLUxRVQuI34pte73Roqr2RokW1WqrxJDUvvppIZe0Y/hFgbdjjCFkX3Gz2iSYIuLmmABRKCtPMD6NZWToe3ZmxWk0HFmRQ4DGI+sDt4WPJKFC97HwPRB1yEySwOVlK3aeMvPv1gXQ7Z93mw0RamrlHZ1I2O2EySIxDfhTvJEbIZNosLVEuzj64aN6h5Ub4pB8UoWcw0/CKaVOrK4biuXqFlje0MV1AlouSHVshlYEJbHNdBnLse7s8Y2d5Gahnm0endNp/PaYNXFtTH1A7QC5ci9E+i+KJsAUCd7P2hjZEQWCxl3WQ+kWN+PvwOEs/kzNwcOrs6+AFuxDGqFQQTv8fzq9zfIyR91EO4nKqIX8Tgx
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:23:10.9476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc47fbed-bbcf-4079-0bac-08df07391849
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5240

Add USB3 PHY driver, Cadence USBSSP glue driver, and USB4/USB5
device tree nodes for the CIX Sky1 SoC.

This series adds support for the USB4 and USB5 controllers (based on
Cadence USBSSP DRD) found on the CIX Sky1 SoC, along with their
associated multi-port USB3 PHY.

Hongliang Yang (4):
  dt-bindings: Add CIX Sky1 USB bindings
  phy: cix: Add CIX Sky1 USB3 PHY driver
  usb: cdns3: Add CIX Sky1 glue driver
  arm64: dts: cix: Add USB4/USB5 nodes for Sky1

 .../bindings/phy/cix,sky1-usb3-phy.yaml       | 109 +++
 .../bindings/usb/cix,sky1-usbssp.yaml         | 153 ++++
 MAINTAINERS                                   |   3 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  36 +
 arch/arm64/boot/dts/cix/sky1.dtsi             | 133 ++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  20 +
 drivers/phy/cix/Makefile                      |   6 +
 drivers/phy/cix/phy-cix-usb3.c                | 410 +++++++++++
 drivers/phy/cix/phy-cix-usbdp.h               | 310 ++++++++
 drivers/usb/cdns3/Kconfig                     |  13 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c                | 682 ++++++++++++++++++
 drivers/usb/cdns3/cdnsp-sky1.h                | 127 ++++
 15 files changed, 2005 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usb3.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0

