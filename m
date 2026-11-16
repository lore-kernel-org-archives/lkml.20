Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794826534;
	b=fnc4f3vP5eW4BlJUikViTruitsiejFPDCWtVUZD6LJFPvC8F++MDt5cQBu0bzSEkbHlv
	 siWYb1lNWpfbAsGZsl3aAncVcvT+7PtAKrMtGn/u5ODJH9e/hq1eAiwdvV/S6AzI6lL0i
	 7iGv/0Bau6SHMqVaflWCuU/TXYD9KWwKx+QmNK5JOYkDrMVk30mp7pLag9Pq8bxortu7K
	 SlGrkGtkclaXX2gTh2awgxoeSLW/6aeY1ZlcT9J/hhcy0nODUauQeHXvYhoTYkEc6/E9M
	 wPuvtr0AM1JX+nm/Ylk7hRQsdr27mTxUiJXpRW5Vd5E8AYIHewYhmY0egUbloSKJs1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826534;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=+NW7jNn2z12LtFGxl4p5ejnSak6/3pgC36FJPzKecKs=;
	b=EEGCzGSRA9QhvmecXceDSUg9ue3qe2Yqe3FfI8M4aCkz4L1tUa/eeV5hJ9KNxxbMLvlm
	 vj2ezNHgs++8y5Tz6f9J+UC3HgfZ8iYbaQeQczHsxy6K20AjVlqAUtHPBPJsnGeY86c2s
	 oTblEfAdD3UrRUtON3NK0MBsrT2Dc2BQ3IgMXCgs1p0eo4jfkGPhrIzIIxpQ0MlfEJR9U
	 cduEtwdOKkSjhGbLPo6n2T2emn7KpeQss+hnB5Eqte0JZTVKxDQbvyJ/sjhNhXq4VqLtk
	 exV+c9dEb5hplH8uY0QQ+X/Rjj5GULhKlnPFTO2M28G6SCZyvSgXD/iqhQIngTUMBrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b="Ha69/s+C";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.128
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020128.outbound.protection.outlook.com [52.101.69.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9B3606A31C;
	Mon, 16 Nov 2026 10:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F9B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=Ha69/s+C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGmkwkXOIQCCm3TXnomNwejnxiPUme9XyRVqSJbXmDSL90y9Fmo3JNRrytUpXnAF+ZyWQ5bRZ4sbUesok8L/jMXHiYX3QJVp6BAE+Rp8xs9ziHs3tX4hFSQgeyZi4TBBJTlxQiax9nOXIqlpZOz9Lx3vZPfCbsl7AfPAcr0EX+mLA2YnaGaAfE9gyRBlUYQjQJZNobiZUE3hiOoNPnOhgp3JtpSjZekoX25fb2+qbIlHuaZu4fAIaaMccMVdXDZGlHueLr/h3dAxJ3W0PkF43weXqEuNIF1anuURK/ZbPCyCz7BcCcsasTaut6JJrEoCJrYer25x9n8g5X10alPZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NW7jNn2z12LtFGxl4p5ejnSak6/3pgC36FJPzKecKs=;
 b=R+etQQsXldxx+w1k1o9eyBrKjCg2/sXYb7aT3ALXSyQ6IUfmyvvZoBlS4YhQV6vrGLTH391BpG0f3ZPrlm9SHxsqkSwwQuLKy+CZ/wrtSjv5RclpgN9Z3K68Wy8YP83fIK+ph7kYMnq0rGVFkrV+FfBRCc/wGfMcVS2MxEjkjapZmPUsxjAvfPiiQ2Q3Rsqkd0j9toQE9Ry1QmX2rsmSUoFgQ9N73qIUKd6BbMY2DHyoRzHp5etIqQpWAg0smuFQJG85ws+kZLtQ0Oz0nqZ6UEzliwzRytsn6vT1vPakxCYJUYLIAebfMeqMRMAjacrMMJt06DqPofXs1yY+FhSfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NW7jNn2z12LtFGxl4p5ejnSak6/3pgC36FJPzKecKs=;
 b=Ha69/s+CjWOW8IIFa9am/WevYzJdICQKOURtaTkp3aszXYLP0V7PDYYvTQEK2TFK84uVXWMVmUlbWupw8jKYc+0S/FAR1jAWdxvzH50XVndEq16q0ubTe9P1YVCN4K9Zr8tcjJ9TOC6HSn/USQXFWGCHhZNHoVcMtauMEW0PPngQoG9zQ8O+RzbdORFk9vB/XsalWQZwPJkYgiYjZIKt64otxr8ZHpgp5wJT30GNM4X/dN9E/kBdx78y/7unipwPBposgX6t8ZzNhCu0nYznwf+ZWO/tKGnzRXGNBQNG7K/jKBaKfMv2W+MpesnwBXEbIPbDdlzo6A4DtpHsOTmjjg==
Received: from DUZPR01CA0235.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::19) by VI0P195MB3207.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2ec::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:55:28 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::6c) by DUZPR01CA0235.outlook.office365.com
 (2603:10a6:10:4b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:55:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:55:27 +0000
Received: from [192.168.2.225] (172.25.39.168) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 16 Nov
 2026 11:55:27 +0100
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH 0/5] arm64: add new phyFLEX-Libra i.MX 8M Plus FPSC
 hardware.
Date: Mon, 16 Nov 2026 11:54:39 +0100
Message-ID: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
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
X-B4-Tracking: v=1; b=H4sIAO/g+moC/x3MQQqAIBBA0avErBMmibKuEi2iZnIgTRTCiO6et
 HyL/x9IFIUSjNUDkS5JcvqCpq5gtYvfSclWDBp1h1qjEpeNCyrYmw/KqmXCjRkHgz2UKERiyf9
 wmt/3A8YgOcFgAAAA
X-Change-ID: 20260220-imx8mp-phyflex-4fe0dff09807
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Benjamin Hahn <b.hahn@phytec.de>, Christian Hemp <C.Hemp@phytec.de>, "Jan
 Remmet" <j.remmet@phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Yannic
 Moog" <y.moog@phytec.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794826527; l=1726;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=6x4VYTBknYXKTYFzIWisNybqIZ1TfyDKo0Ff3611zJw=;
 b=2x3vb1WNSQ3faGsPKCU0drTPeYqnpfRjtIwafHuTS2K1xN6mrv8xb/faP2cFQzeFchnUDPJp6
 G6LuPh83nSlB12Ez9BCuwyoozdyI7klrAvw82PGB0KytJ7J7yEMn9oD
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|VI0P195MB3207:EE_
X-MS-Office365-Filtering-Correlation-Id: f855f8b3-9fd6-4310-3816-08df43d02003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021135927099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261022075727099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kfq5thE+m6C/8/LlVZzN5913AyiUSKasup/rMLNrXfAPCFzJ2zSIbzKhjDMx1m/Wv+XoQBwjpGQQ0WJs54bm7135HnFm5OZ3gFUNtzNcamy19IXPrcXJDZBH5WPSfI0Jkj8cTWh4GQdJYU9rxvCdN00OxO5RlT0OBqTASXJEWMiIPCnqkQ3sexASyA0wfiYG3+Vh7qVTZK2KbSIkQ8sY/y5Bhii0DKaGoZR6AP/d6ixVBxL+/u9D+TV7xUMsJVFSbMlFbVvk1bNpFqCLdatj+BXSNDXCxN7IL+L/O3ccTFinJSNkmAcsSkp6pxsXFQWXqm0QBudIVwdUBI6cfJPEmJBCO2kONGxuzl3CJYBcDy56ab+pGRZLxpDEIC/pKKv0DCrkwgZs6dp5K72jihV0QbNYdw0k016iMzn4NV86EpsoBzjrAjI+xJJ6SdI2dHjvPeW98Xfa/meNnq+CTdXK6ztu8wOwq5h2UAYHnlK3Fa1aUzPRzIbD8a1b7kOzx2h6SI/evrV4WjrgcsdBdPVxjRuoiEPOMnPEFNecKlwoDfULKqeSkxQVkD0HCSaCQLDnZl0HUexvoNcDKykxKbbeHBWj+3i7wruM8fW+SHiahOlRy48bmHr65IYc1EtAlHR/f27vA5/IM3WUYmeMUf9iaKRdpkDqnzchoaLPMB6p+zSpyf67bF6SkWjZzgyb4D92pVOK62M6JDJWkq9pKArivw==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021135927099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261022075727099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	STeQBLJzGiINnmeI5+sVCSnHWQe8HrwDeU9VCrorwkRf5ACSwq6HlR6iVrQHsBqFPqHOmwJkZFu4vOyYGBp1WcM+pKIqBiGQSqM10eXHdxqr12pPj9CSWzeruKEo7SFJ5Dox7UxxyGbTF/GMuQqYov9+JL8PPCTuPB4mfghcwC6bPhOWH/U4N6XkJOdqZ7l1/X60J1M9RffvMNiGE0n31WOucXcJZD4Fx9H2bU5b4qKAIaThISo4aL28aEE1JDo0D40B+rTCmFUe9fOPalbVnVnTYIaT7f29F3czUWpblsv+9xcFCl4QTO7B9K/ASK4Vjkb4Kj9mC3XiO+upPKCAeAJ8+G9XsfAzihThBrq7tS/lyZuyZOXUp2++V+FaVP4UtXxI6pMRzZ/eo7epYk/2t/PbLXkIDa1zzsApWMvSPXdPrQNAFBS32YPnulLXpIGK
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:55:27.8574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f855f8b3-9fd6-4310-3816-08df43d02003
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB3207

This series replaces the existing phyCORE-i.MX 8M Plus FPSC with a newer
revision. With the new hardware revision also comes a new product name
(phyFLEX i.MX 8M Plus FPSC).
The SoM hardware description largely stays untouched, exception being
new name. Most of the changes are in the carrier board due to a
redesign. To separate both the changes, this series introduces the
phyFLEX-Libra variant as a new binding and set of device trees and then
removes the "old" phyCORE based bindings as well as device trees.
There has only been prototype hardware of the early "phyCORE" revision.

---
Yannic Moog (5):
      dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus FPSC
      arm64: dts: Add phyFLEX-Libra i.MX 8M Plus FPSC
      arm64: dts: imx8mp-phyflex-libra: add display overlays
      arm64: dts: remove Libra phyCORE-i.MX 8M Plus FPSC
      dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC

 Documentation/devicetree/bindings/arm/fsl.yaml     |  13 +-
 arch/arm64/boot/dts/freescale/Makefile             |  20 +-
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 290 ----------
 ...re-fpsc.dtsi => imx8mp-phyflex-fpsc-g-som.dtsi} | 256 +++++----
 ...phyflex-libra-rdk-lvds-ph128800t006-zhc01.dtso} |   6 +-
 ...-phyflex-libra-rdk-peb-av-10-ph128800t006.dtso} |  25 +-
 ...tsi => imx8mp-phyflex-libra-rdk-peb-av-10.dtsi} |  88 +--
 ...tso => imx8mp-phyflex-libra-rdk-peb-av-10.dtso} |   2 +-
 .../dts/freescale/imx8mp-phyflex-libra-rdk.dts     | 604 +++++++++++++++++++++
 9 files changed, 819 insertions(+), 485 deletions(-)
---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20260220-imx8mp-phyflex-4fe0dff09807

Best regards,
--  
Yannic Moog <y.moog@phytec.de>

