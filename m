Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846498;
	b=RqlQaWy6ZA3BCz2B3sLac0pb7zIPNfTmvZwZoHfP/IEPQmVtYQeoVJZdqnP/rP1Fxy0Q
	 N4sDnmBuX3eD50rG4Qzn+hkLYBhQb2i0sFnxuG2yobjE7uHQrw4STxgKh/a9Js6p6awSE
	 +dddde8tE1GuLYgEg2snss8YEGG2fS6EMxTjAPVDO1LisiykyXVeT2nUftsHfW7rNLLxj
	 82WKIVL6a8iZtciCJrd/MVxfI/OQRTOxxXpcfdntzIXcMTrLf19VdymIQtcsqYf1tWBWO
	 WOx/ACm3ekualnTGURD45ElV/WLoBrYVyAjVFBRFnJruW2nFLE1fY+KaKmhsG3OQzQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846498;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=8K6IsdmJNISdrwx341yGj2Us2dqjc+r5wspgPkn0I9M=;
	b=3v8Plb3skSDmS4TT9KG6W2v0KTLm4wH8yoF+20vzT0fPjI72aljS0LmhrznZC5puxhoG
	 k+pjjlS5T4G9jiOpthmW5OEk2/kYKLnffYwmsHLSHDMQ0KV1CqSxiUkc9qkSbxqsHz1s8
	 mE2ZOv9F4ua+LGbhjMRGPqgfjUyEyahGqrY1tZ28F08jSf90j33fxkjxPc36Ka+U0Tqrz
	 EtMhPKg3qoh70fusSPA10322IcqnHo5k/JoTl44xuTJ2fVX0kIdnonAZxHDCVV5X0p6bZ
	 ZXT43s4JaSCke+tFV1/EYBYf71AV/eDG+QWSLRf623KnyLooHYRkZ4wzpQbvWZNZuFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=dX3BE7LI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.17
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D8D606A328;
	Thu,  5 Nov 2026 02:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D8D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=dX3BE7LI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGusmVb4guHkR/jaE2lHdVOZfki26mWYqgDSupSLlB6jyor+c1p9p5KyAfVcRXlfhurBgA+NrSxsOuHFtgyswNBoKhnuHB36x7vDglGvVmpZoeSsjU6mmI2eD+19vHKNl/ZqsK1LPhWhdktpYObQXZL7f9811NBZZcJkrWo+JspM/rN5XoFswtSfDa/aPfVOmByCt/bRFHU2ziM6iPlK6y4cjGqlaEJl2LLHdf/lAmUIXuQiP0PCY4JrvlBX9feFjw2onsyfGd379ENKWPiPLyLNVx2+5nybwci/IjRcmqa88hi7Erq7vAHrNzdlbvHDxVmahRhZlRE+gF8NjOMtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K6IsdmJNISdrwx341yGj2Us2dqjc+r5wspgPkn0I9M=;
 b=tBHJP1yHefW9Bosc29fz9BGAw0N7bYEQcjcYdsuw0SKNmnvfdnPlmT49qDGRKjsryvL8nAEFK8yjOqdYCnSn5mrRsqhwOc9RYnqWnxywz6t1J/VeVgznmWFyoIJqSSN4d/BPLDJjV0LeiJIKqGhGRvw4V9gcRtJUI+1rrvrOahmF/yNVjIqT99FLMB/fyoeql0ToPiN8EuBhBBtQbxcJBEjxgHQ50r0FuVi+nfVcwr5QG2ko7cGTOFUIEOJTJhTj2cgBgCgTva/farkkHORQm8j2iiiSaTEorwEpSCZXjjcYlsGwVK8F4lV8JTNC9hAKrN6zoupNi83uQkzYQFU0Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K6IsdmJNISdrwx341yGj2Us2dqjc+r5wspgPkn0I9M=;
 b=dX3BE7LIpYARvU20gzOHWshbID+xd6RIj/Y+OhQhyAkmSW7gNk9RFySKD+OY0UDZJNr+uTE7YcwaMy8BZohx+c0qP5Tc986KRl0LwP4+aQnuCSyb/bMgSyHU5sdVxV5AysLf4t4GnmOG+WZtUtGPjzJxd0lM2i6R/2dJZTYEGnIE77x0vzEfSh+CduhGH13V8KFeMFZSNEmTK6y4b99C6ABtnmYpNRGI0po2Jb7H3GsrbuPFrzbFzoX+LS5nvMZSN4Iuqjk9MvtsjHqTYMKM//wEd7FPlXS48ZqLnBCVkxxVfbce40KeaMhbWvgy2pu1Gz/9PSRpSDLkxgBW0ZwEfw==
Received: from AM0PR02CA0134.eurprd02.prod.outlook.com (2603:10a6:20b:28c::31)
 by BESPR10MB9293.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 02:41:34 +0000
Received: from CPH1EPF0000051F.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::78) by AM0PR02CA0134.outlook.office365.com
 (2603:10a6:20b:28c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Thu, 5
 Nov 2026 02:41:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 CPH1EPF0000051F.mail.protection.outlook.com (10.167.241.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:41:33 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:41:33 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:41:28 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Subject: [PATCH v2 0/8] Update BSH SystemMaster device trees and add
 SMM-M2B support
Date: Thu, 5 Nov 2026 10:41:14 +0800
Message-ID: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMrs62oC/13MQQ6CMBCF4auQWTukHZWCK+9hWEA72C5KTccQD
 eHuVty5/F/yvhWEc2CBS7VC5iVISHMJOlRg/TDfGYMrDaSo0YoMDs7hKB4lRoyEZ9Nqcp013Bo
 op0fmKbx28NaX9kGeKb93f9Hf9UdpdfqnFo0Kj003qcEYVqSvdq7HJNbXNkXot237ACJP7/OvA
 AAA
X-Change-ID: 20261027-add-bsh-smm-m2-57812d9c7e87
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Michael Trimarchi
	<michael@amarulasolutions.com>, Leonhard Hesse <leonhard.hesse@bshg.com>,
	=?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, Qiu Guochang
	<guochang.qiu@cn.bosch.com>, Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Florian Ager <florian.ager@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=v7dBm6C+31tysDHRfgXYY/gXkIG7ZyS1OpfOIzJ4GXk=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7mx4oJyzBktpXCVZ/93iNicyjml0cql2WLiVP6tz
 Vo3oY6vo5SFQYyLQVZMkUU1wfus5NUA02kzq+HmsDKBDGHg4hSAiaxawvDPcvLMiHi2798tLUuf
 qHXaZG8Mcrty3+Gg6tvDSgalKveLGP5ZW1km7tQ44LT1sPn/iL++3qe6j7sd3xg4g3GtyqYt0r1
 sAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051F:EE_|BESPR10MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: ad40f575-e6f8-42ca-fa8a-08df3ae64e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|7416014|6133799003|18002099003|10067099003|13003099007|56012099006|11063799006|5023799004|261021123027099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261102123227099003|261021121427099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	897kOdDhJN8R+xajfoY91B4kE2MFuZYME3yifBVemU4O81xs+IUx4znRMeLKKqWZOXQpZj1BKPL/OY3fsETSztsO4bhV1NkREgAv85AIfwUvtb6YBai2rXDQ4kvBEENT5P8Ub2MIfO7TSaXChUZxMEPDaBtzAqhikD6ejZ7PnRWazx9jjVUw+dA1S9ekz/yDiFOfqZrakZEAm2XMo+KeRXgz7pRS4v8Pb5+8iuOREalyZ8l/TBuouIZbITO5PQOiL4E1Fqn4E0gTQOfGzts216jhVZQAXl9P9iAqGYCc4flet4pZc23+/R62AvVQDqvnBK3M7ICEUuAErFzwmXEWLBhSJ95UL+mVHRMBuf3GRqWVRNnqnXA/LBlaMMATo1Qm7S9zeFu95zXwsyBcsF8XZ7CnGiQVckuN2i/1cHnsaiLb2c0euWwvIbOWJXIU3fokynlaMb9vtChy4HeA1jWF3NMtZtxxgYVoCl6FshD9+Kcid/EBzOMoinPJQqw/uTJH/4e8tVXzQ3MX/b9+5OWd7dIPMo8gwoD6oN1kqi88Boz2suVpMTWxqwwLZqppnWVJVScpdRYoCMuTF9OP5naN/1oxKCZc10gp5bexuKTUBaRfCLFUNWtYZTGI/O/vUlmTkMqteA8mEsJ2yzCL7C/dTkN18wWhMBfM2v1ud9bJqRQ=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(7416014)(6133799003)(18002099003)(10067099003)(13003099007)(56012099006)(11063799006)(5023799004)(261021123027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jN7Qmy+WQemoDOedjZDhWEhyHzOk+UtT0OTkw0+JeK0AsaM3V2HFH3U3dIRH7ccNC057oNlFcHaDBZ+YLBy7bcdls396IhzkWeaf6VVNllmdQXyWalZLSSBfn4cBhNJ5ygutH1LPVaKZthZnKclsdnVjHFrU199VIK7mo4tvY5eTGythSskW0nQQ1FzgIe76857I62kSirW+oEp7dihVLala2On+rAIOAQPTb4dR7xMOtATJi3hd+sctmdpIbPUyjhY4aHU7zeyS2Y4ykd5pzzAg9rbiG3TIeeXF9TrelVF7CVFIxOUSYCB0Q7gO+EKXgpHZ7PgCak7DsrcOT+c8Pii8GuLSTJ+SWl7ZMay3YgLG0AAji1g/RYdhLV04NbCNKRakn/fI63YGLN5ekDhG6ulnp4nvBKv2DZ+tj0nLtBgxxzAzeUl+TiqU213D6yA9
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:41:33.9126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad40f575-e6f8-42ca-fa8a-08df3ae64e44
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB9293

Add basic device tree support for the BSH SMM-M2B SystemMaster,
a hardware variant of the BSH SMM-M2 equipped with an AIC Wi-Fi
and Bluetooth chip.

This series adds the SMM-M2B board compatible to the Freescale
device tree bindings.

Configure the NAND controllers on the BSH SMM-M2 and SMM-S2 to
use the minimum required ECC strength.

Adjust the Wi-Fi and Bluetooth enable pin settings, configure the
WLAN host wake pin with a pull-down, and remove the unused
cap-sdio-irq property.

Move the hardware definitions shared by the SMM-M2 variants into
a common device tree include file to reduce duplication.

Add the SMM-M2B board device tree and Makefile entry, reusing
the common hardware definitions.

Configure the UART2 pin multiplexing for the shared SMM-M2 hardware.

Enable USB OTG mode on the BSH SMM-M2 and SMM-S2 board variants.

Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
Changes in v2:
- Drop the redundant RNGB enablement patch.
- Keep the WLAN power sequence in the SMM-M2-specific DTS.
- Move the SPI display and touchscreen overlay out of this series.
- Link to v1: https://patch.msgid.link/20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com

---
Akhil Narayanan (1):
      ARM: dts: imx6ulz: Configure UART2 pins on BSH SMM-M2 variants

Florian Ager (1):
      dts: imx: Enable USB OTG mode on BSH SMM-M2 and SMM-S2

Haoning Cheng (1):
      dt-bindings: arm: fsl: Add BSH SMM-M2B board

Leonhard Hesse (1):
      ARM: dts: imx6ulz: Adjust BSH SMM-M2 Wi-Fi and Bluetooth pin settings

Michael Trimarchi (1):
      dts: imx: Use minimum NAND ECC strength on BSH boards

Qiu Guochang (2):
      ARM: dts: imx6ulz: Factor out BSH SMM-M2 common device tree
      ARM: dts: imx6ulz: Add BSH SMM-M2B board support

Roman Smrž (1):
      ARM: dts: imx6ulz: Fix BSH SMM-M2 WLAN host wake configuration

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile                 |  3 +-
 .../dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi     | 86 ++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   | 93 ++++------------------
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts  | 13 +++
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |  2 +-
 .../arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts |  1 +
 7 files changed, 119 insertions(+), 80 deletions(-)
---
base-commit: ec7b37c768d34107d06bd629d05cde0e2218ee9a
change-id: 20261027-add-bsh-smm-m2-57812d9c7e87

Best regards,
--  
Haoning Cheng <Haoning.CHENG@cn.bosch.com>

