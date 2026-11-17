Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794904485;
	b=VeahIPxkA0RLZf7weMWwrbsl0qYlkGJIQGhKJphKWHw0j8brRL9LvS1nKD4wrsFOFhQS
	 u9tQdPQ5T/mIR21Vy2/GWc0BKndhJWNXXD+IDcWNPAZkONk6nuEfTJ39k8uF3DvBv4CR+
	 8F7TUzDZkEFR//H7+rPgUaCcHwiRC3EEDHhDilE0RRjwiYS1DMhWnM9xMJcmPopJC3CNp
	 WqXBbkQnZuFVqm8XnK1+LVWir2VzRv8vjdlzd0nVLNyPkyent2vKdhPHYSzIbSHdKgMeh
	 z45pbsa31W/iUMR08+h0oaL9w6ktN8KoeKTkAbw/tAYkU02F44aZqQtSRVDDrPZjYXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904485;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=OYHXilNLr+59YyoemEP0d8lj11G7PX/dPwxgBc3xdwU=;
	b=QQKFdZh2yvMoS6J+Zjz7BmsCsQObbcfkEGpIueBHfgun3kqeugrZk4la6KfK4Ry9nbOJ
	 4jqLsNLS7q37hnVQNtTOLy2/VugY+1VE9YuyLg/7UWpVGtr60Jx60P/EiSZYVUHa6NLFv
	 R8WdVFJvhSaWSWdJFxmBpCeoNkVSpGdupeEO8ld0g3mvZTPpk6MYS3i/8ETOCULDTesHn
	 MP6CdDsvpcebo/ZrDlnCBrd/r3rgQxJo1LI1ZrK9kap2fNWUMESWb/uHcEg5e9Hm9B7Ex
	 aLB3myPVWIwHdgKeWKGkYnpw+olAJCd/qGD4PIl9osFPn/brvvI7UJraUbC6VDo4vPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.73
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023073.outbound.protection.outlook.com [52.101.127.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0DB606A8A0;
	Tue, 17 Nov 2026 08:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0DB606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7/sxhP/GLfWMOMwK1Uxvtt9+ED0ZlaCinbuqEsPiVesYLOpbq72RXy2ZazdXSton3eLuU5I6IrmoZQ/BsN7bbXn7/hASczeJb1g7WrLoQ8xwIKP8eC6wxJvAfvPB7gVm0NV0YFCfpjqHehKeuJC+qpyLQCr6WlWDbrGC175UDNdBVk3JLRh3NfCjw7ULg+al35qT+7pRVor5rMa9pF+SlkETSiypmsb6AIXpazthLBMyW+GyTTS1RmRP/0qjYykC2PXJlodmrZEr9nlhPSU+UC/1chwuiCnfPLvokCnGBdsTkY7BO4SDiRe4FF3d8+IOapy7qQAKdsaTOxHpvP0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYHXilNLr+59YyoemEP0d8lj11G7PX/dPwxgBc3xdwU=;
 b=Y/i6eg8WAxCVeFC/iZGx+OMGpeRNJowXejqA+WK1ZvlB3MWq5XkC09ZSXtBBfz2OfMuVC4JfMGuPP/OCN+35f5WdMmt0a8rSNmpgfBnnPLIbKMeRKLV4wQhx7z8gKxUmAijLWB2WJpbvSBg0Iqd7wZ+Bet1A3pn/NV8718gKrAbrOM8Pletr1yZQsmviNhgZ+H76UxU0mlyU6hBQIOj1yxBpgjibQ/pf1gPj0EXuVSoW3pq6aBXW00srrRIJG+muLDEHFAl2omBgl9J+rQOZGG9RD5apE+UFfrYIeu9YpIbAubMsfPJO5k04GfG8hURF47JBYR+WlKePv5+pWNgmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) by TYQPR06MB837799.apcprd06.prod.outlook.com
 (2603:1096:405:1f5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 08:34:39 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:191:cafe::12) by SI2PR01CA0007.outlook.office365.com
 (2603:1096:4:191::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 08:34:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:34:35 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B4FF0427EFC5;
	Tue, 17 Nov 2026 16:34:34 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: Gary Yang <gary.yang@cixtech.com>,
	Luo Liu <Luo.Liu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: cix: add Sky1 USB/DP combo PHY support
Date: Tue, 17 Nov 2026 16:34:32 +0800
Message-ID: <20261117083434.3414417-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102082112.2306326-1-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|TYQPR06MB837799:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3ef8cce3-bda4-4da2-cd3c-08df44859c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|261102123227099003|10067099003|56012099006|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	lJxO6zmbDnU7TY3QaZ514XodMmbb2XWEjc5WCtYB5vMun9Nk/21WMBTQbF9L2icqhouj+s1Fpzduvxg36rk2KASwFxv9QwSyKHE8MwuIwLfj1xWOq0jjv1oQmUN8CTGKgWtluOf06vali2oPR4IEdiC946XxRj3XKWGcuQ+touAsgoY6Y9Zbc+AdrrVJ5TqdbTsZlQUb/DQE//FyTWb8j6yUfgJ0U3fIkas+FJIqyZdP7H7ckt0/NOiNYaLmfaTgrDwBhexv9v4dY3hv61RnUb74LaSlRgtb5WPyhlaXCFinIMIbJYuSwrbgpPobqrYe/mGUXkE9SW8UV6IrcLimUY7uDlWeE0skkTmx5aaeuqbTBCV1eyPLrENMpXjUQIU27/iWWSyzPbRa7Yq7pFWqST7XRPaRG6m/YFCqdJ0hHHOl5i3QeAecB0Lwb/GkA+1IpOKC7o6JoxgXjqTa4xbH1NpB2Qi9CV1qGsgWMyXpUBSCeQYH+6YjpRFVQYnKZmOKEcynfboS8hzvdyl1PwGQphnLlaKqjdXJfbBx8sGdoSw93cGwN2BoU5i7eC5WKHCZ8S7LhShrcVxj2xPHaPEvRVX+9yhmIBTbqcxD15hmNS+R8G1WlPU9a+uCobxgA72UTERqF73MLNWVE+ULW5UamA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(261102123227099003)(10067099003)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ASNjROd1uyLsVO9MckXdfF2lsmz+EGtrJD3aFH9ntcyZw6uDYoHrt1gf7wKovxES4R/QAHcN/ud4I0WTQKzPPWL9cv3+WRfgwggdNbJJs1O+NWvcQS1+kESGB4R8YLhbnsceeOgXEDlQqtXhD4cmmb63IwK+xAuR2CzligtBsNBcCDBbW2u0JQ/GJuctIkTpaP916Vo+/07uxwa9NYOSiYL0J+dV2eRe8Qbcd/Ow2uxLFfJEecbUUwQBhfOj3np3GTjMy+jVzIal+aDJGPHfaIzn3PHBidOqbcMYikUd2KG0owHEbZZWi39v8K/cLJQ1/0fVIDn1+jpQ94Uw4VEN70guk61E0v7Oq64KGV2qEkb5mSpd982R6fpsN7pHeZyOx/us80htGFEaKmS/NmO2lirzXfJzJBN2fnwN++/Udzy6uIgY+5Twkl3w9C1QGFVg
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:34:35.5415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef8cce3-bda4-4da2-cd3c-08df44859c89
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB837799

This series adds support for the USB/DP combo PHY of the CIX Sky1 SoC.
Each PHY instance drives one SuperSpeedPlus USB lane and up to four
DisplayPort lanes of a USB Type-C port. The USB and the DP controller get
their own PHY through the PHY_TYPE_USB3 and PHY_TYPE_DP cells. Plug
orientation and the USB/DP mode decision are taken by the Type-C connector
driver; the PHY consumes them through the Type-C switch and mux API.

The USB and the DisplayPort controllers and the Type-C connector are not
yet described in the CIX device trees. The graph links and the consumers
will be added together with them.

Patch 1 adds the binding and patch 2 the driver. The SoC and board nodes
are sent separately as a follow-up, since they go through the SoC tree.

Patch 2 builds on Luo Liu's "Add Sky1 DisplayPort PHY support" series:

https://lore.kernel.org/linux-phy/20261102030425.1957585-1-Luo.Liu@cixtech.com

That series creates drivers/phy/cix/ together with the PHY_CIX_DP Kconfig
symbol and the CIX SKY1 DISPLAYPORT PHY DRIVER MAINTAINERS entry. This
series adds the PHY_CIX_USBDP symbol and the new binding, and renames the
entry to CIX SKY1 PHY DRIVERS. It should be applied on top of Luo's series
to avoid conflicts in drivers/phy/cix/{Kconfig,Makefile} and MAINTAINERS.

Changes in v2:
- Replace the hand-written regmap backend over the PHY registers with
  direct writel()/readl() access.
- Take the DP link rate in Mb/s, as defined by struct
  phy_configure_opts_dp, and select the register table from the link
  configuration entry instead of repeating it per case.
- Protect the PHY state with guard(mutex) and drop the goto-based unlock
  paths.
- Use dev_err_probe() consistently in probe().
- Fix local variable ordering in probe() and sky1_udphy_init(), and
  drop the unused register read.
- Lowercase hex constants, fix overlong lines, add the missing copyright
  header and a missing newline before return.
- Move the driver out of ARM/CIX SOC SUPPORT into the CIX SKY1 PHY DRIVERS
  entry, and drop the commit message claim about the bootloader handing
  over an initialized port.
- Validate the DP link rate before the PLL is touched, so that an
  unsupported rate no longer leaves PLL1 disabled.
- Honour set_rate, set_lanes and set_voltages independently, and keep the
  negotiated lane count in the driver, so that a caller that only updates
  the voltage swing and pre-emphasis levels, as dw-dp does, works with an
  uninitialised lanes field. Validate all of the options before any of
  them is applied.
- Program the TX voltage swing and pre-emphasis levels per lane instead
  of applying the settings of lane 0 to all lanes.
- Add .init to the USB3 PHY ops and only touch the PHY registers while
  the PHY is powered.
- Track the active and the requested mode separately and reprogram the
  PHY on the next power-on only when the alt mode or the plug orientation
  has changed, instead of enabling the APB clock a second time.
- Reset the PHY when it is reprogrammed, and only reprogram it when the
  register table actually changes, so that an active USB link is left
  alone when the mode changes between USB and USB+DisplayPort.
- Handle the deprecated DisplayPort pin assignment F as a USB+DP state,
  like the other Type-C mux drivers do.
- Report the DisplayPort lane count only after the PHY has been powered
  on.
- Ignore Type-C mux states of alt modes other than DisplayPort, which
  used to be mistaken for a DisplayPort state because the state numbers
  overlap.
- Describe the two PHYs with #phy-cells = <1> instead of child nodes,
  reference the common USB switch binding, describe the Type-C graph
  connection, and drop the cix,default-conf property.
- Keep the binding example limited to the PHY node and its graph ports,
  and drop the stubbed USB and DisplayPort consumers.

Gary Yang (2):
  dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
  phy: cix: add Sky1 USB/DP combo PHY driver

 .../bindings/phy/cix,sky1-usbdp-phy.yaml      |  150 ++
 MAINTAINERS                                   |    4 +-
 drivers/phy/cix/Kconfig                       |   16 +
 drivers/phy/cix/Makefile                      |    1 +
 drivers/phy/cix/phy-cix-usbdp.c               | 1422 +++++++++++++++++
 drivers/phy/cix/phy-cix-usbdp.h               |  257 +++
 6 files changed, 1849 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h

--
2.50.1

