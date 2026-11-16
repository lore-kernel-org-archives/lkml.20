Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794816964;
	b=YfTcT3TmZsg+lI4Xdl865DFatFuCSIJ1a916wk7eOwv72RKpdcPHnNsGOvsFdAzY/cTD
	 tIR2vrTU4o1BIF4Wg+b3ZXuOaOJJWxq1TIPc/wbxRVXJte957DCXTnbmxWU0uj82pYUU1
	 64+N+Y8IEYaccc504p/jRV+fanNgrmBIbf91CGIum8bMq2wKwWIBvfokyJIXYdwmTt+TB
	 LX8MFhZ3UdWJXVarHe9jUF9a8kaR/QH9Gvm/efCvP7BwT5+xKnBlfUVeScxIyk4qyRRsw
	 dxiMaUm4iBUUxV+O8u7PbKRTBLi/ronieVcjxKcW6DWsMji6zHo/QrF+RPYUHi4vuYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816964;
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
	bh=CeENGxhpCFS9S+ucq59xZdohIzGHKG9Pjp+vB4PhecE=;
	b=ajACcobcYNnVrgAuYngKyujkYbH7jxl4hHIub1C3bsIzN1elhfvRxl2WsqofQlygI7lN
	 HF43dDJaXGDfiS27neF015EdeT3vvGX/PA73s9l8l3NA3u4mzEUYzWTtQIh8Y095qsajF
	 JVAY1bd9DN47f2kPBUr1FIm1Zt4bkErtEBke4/qOKVyuaIiQmOUCbblSGxS6kO9nUeHGo
	 KALmDfMdhuqNEkvt7UGWG3U3eOLX0fIKlmuFn7BzM55BHV3Wxpt0PXZvftUOuUNV8Snv7
	 bNGHHyvWfQMDr6criDWdU1v8SyNKftckJ2yqeBK8WbHuJMVq0dFFZD+2LkXubi0u4+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.122
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022122.outbound.protection.outlook.com [40.107.75.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A52606A336;
	Mon, 16 Nov 2026 08:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A52606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1deYpqSXL5kw7vBbjDsd3noR67kXbwsFF/xeGRPxFUWtxiC0ZMwNFqz2TuvxDC/IDivMBjzkSdu4lPpCLzbvaL9adQ9c7m6cv6VUz34s7RQdicOHSnqCKKHM9gxJ3dhoeIzyj+ueNRWL2jpkredYhC0DybpP81MSmqkHyUK/c5qYus2JaNfSb/A9gHlugjauf3LAmZ13MX8EvanKvE1LPv1FrMc9dGnPeZXyFAarVY/oqxn96qzC2MDLbO1MtjiXiXrehQB3Rs/9KeIXIkrwJJAPYmpU8fQXxzu2Fh0OYeIN0mZ/jRSwwMU6wbgq9hEvbta3uAnqdBRKTLQPcmYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeENGxhpCFS9S+ucq59xZdohIzGHKG9Pjp+vB4PhecE=;
 b=qWDl/r6+s/ik3mO8Xhc7FqDX95JBSEMMpCZgYdaOXHv2ojkpdUYcWOZTzWvwNgLZW74QQWPKOcvgWz9fhpFfNKsZ/qpWARlgDJ6eV9dtUOzYGEj+9tXYYbOY8E2kJKrdePzu9NXPdJyglTBtUMwgk9/wnmlW4mXcpAmOdGiOHkKywfXSdK7Nm2YWUXjEHiP+bqmKS69K21nU19ODTZdnX3hav7tTKM60HgmuNn1JVsRtG71cWHZXNq5PL0S4mCHizL2TCpQo8oSB8iLQ8b4z7TdZ00kd1kHDQ8lIa/dD537pBUPzjD1AxPTsgsZJqgiGeQIEjcehXaG5G4YDDoShOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0032.apcprd02.prod.outlook.com (2603:1096:4:195::12)
 by TYZPR06MB6499.apcprd06.prod.outlook.com (2603:1096:400:462::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Mon, 16 Nov
 2026 08:15:59 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::56) by SI2PR02CA0032.outlook.office365.com
 (2603:1096:4:195::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 08:15:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 08:15:56 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7AEF7427EFD3;
	Mon, 16 Nov 2026 16:15:55 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: [PATCH v5 0/2] usb: typec: add CIX Type-C PD controller driver
Date: Mon, 16 Nov 2026 16:15:53 +0800
Message-ID: <20261116081555.2670878-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261113125304.1693911-1-gary.yang@cixtech.com>
References: <20261113125304.1693911-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|TYZPR06MB6499:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 56798033-f56c-4c88-e718-08df43b9d6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|22082099003|18002099003|6133799003|261009223027099003|56012099006|261102123227099003|10067099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	DtUGORkP2CtjtwqyxdFmauZ+PmXQlmGmEy3jgebfc80Wx44yu/wsIA0e1NS5eMh+pmnNtw+vhShwk0b0zJRnuo+JNEtVZodf2U8jqpbH1KaJxEHyqdr5i4sgS6QZbRSf1p71NcROUwvO296oSvzbrO0IUoK26CDF8a2VU6e6WB/rqviXwLrTxpBkKJp2Ra/sNzomSkkVtS2lJpisTO7zpJZtR/5ObfjKipJRf+rFVxTVGx/qXqrQlBnVQq/BTtdUOvJMg3R57ntis8vMwibf0F5pqomuaIOy3KUqjw5Mp3ka4mIKPyg5p4PFsX0jUeLPPrmY48klWYxnxS7CMjMVlCdFz1TXUSQuj3t9aSls5xGpT1Wo3SfmLLqTo07DUElAdz+lMfdXyI1sauvvNrapNRJglAbFdqFNXXKas1XmYiiPPeBoZmzIjwTZ7ltC5mG1Nhe5elTlPhkPx0vhW/10GxLu+drCy2i7etKZuNCIaaITxqVN0D2ROiMRgBV/5m+jS5SlKE3VmlvX+CRHGF9pZeFjQCvmnUseC4DZzWVM/IuazENbNuHNurgdyZ4jh+Ta9vM/PWCOemyYXop4C6jejdnZSdGWxsvBFhm9NRHG36+FRODcp3whPyX647O1PZBAlUgVjQ7p1Q910SJKsO0DYmDpWW4kgAr3VIo2SnMZJ9QSzbRAuy50WxmUDBMEoslgkbdONIl/5YrsXYbnnI7qRQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(261102123227099003)(10067099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	im51q21ytay1IEgQR85q7epZS7NZpJr4+Md8M/AKTPK+ZST7jcDGIcLdKanq41c0kVbGJZ2/WulLw5IsrY2icEBUDZEYlOpH71rvZhlIrVEfQDVQb+Q3OyaphQrec2N+zC8jto/fNq3hXsxH2pWf5/OtNyuk3IsYHw3XuVeW0BI3u0tQIdSDtLTsDvVi57YPs762d1KDQbByPK4RCcRrkEjpehWNPunr/jF+/5rXHySFF82e8m3iVegLlAYnQCMojR28yf8cDk9pI5C1DdET/REEVcHxTnMCfKAnhKS1jjIsDMX/nJ/D7D+nFITMXUahpT4eFi9VM8ov5BQzEEveYhOcCZERRGYLT4OCKPUelTbpXbOKUw2t+lLfWOOkZoT6vlPDno+MTdYNnvJqkz6pTWvFu+r8naaZ3Zy/3V9CCkTXiMSXALJnfw3cPaU0ngna
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:15:56.2151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56798033-f56c-4c88-e718-08df43b9d6fa
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6499

This series adds a Type-C PD controller driver for CIX platforms.

The first supported controller is the Realtek RTS5453H, a stand-alone
port controller: the CC and USB Power Delivery state machines run in
its firmware and are configured through vendor registers rather than
the TCPC register interface, so it cannot be driven by the tcpm
framework. The driver translates the controller status registers into
Type-C class notifications and drives the platform PHY's orientation
switch and mode mux.

The driver is named after the CIX platform integration rather than the
RTS5453H so that further register-compatible PD controllers can be
supported without renaming it.

Patch 1 adds the devicetree binding and patch 2 adds the driver and its
MAINTAINERS entry. The DTS patches from v1 are sent separately through
the SoC tree.

Changes in v5:
- Exclude HPD_IRQ from the status comparison and handle it as an event
  of its own. The bit stays set until the interrupt is acknowledged, so
  caching it in the previous status made a repeated HPD interrupt look
  unchanged, and an acknowledged event look like a status change on the
  next interrupt of a sibling port.
- Reprogram the port only when the decoded status changed or an HPD
  interrupt arrived, and skip the orientation write when the orientation
  did not change, so a shared interrupt aimed at a sibling port no
  longer re-reports unchanged state to the Type-C class. Invalidate the
  cached status when a port update fails, so the update is retried on
  the next interrupt instead of being lost with the acknowledged event.
- Take the alternate mode device lock around device_is_bound() and
  typec_altmode_update_active(), so activation cannot race driver
  unbind.
- Keep the shared interrupt line masked for the whole system sleep:
  ->suspend() disables the line and waits for an in-flight handler, and
  ->resume() reads the status back and acknowledges the controller
  before re-enabling it. An event during suspend can no longer loop on
  the level-triggered line. Wake-up through this line is not offered:
  the GPIO controller behind it has no irq_set_wake() callback.

Changes in v4:
- Keep the interrupt disabled across system sleep and re-enable it in
  ->resume() only, after the parent I2C adapter has resumed.
- Return IRQ_NONE when the port status did not change, so that the
  interrupt core can attribute the shared level-triggered line and
  disable a line that stays asserted.
- Mark the DisplayPort alternate mode active only after a driver is
  bound, so that the module reference taken by
  typec_altmode_update_active() stays balanced.
- binding: drop the nodes below the documented device from the
  example.
- Carry Reviewed-by from Krzysztof Kozlowski.

Changes in v3:
- Report the Type-C data role from the controller status for every
  connection, including DisplayPort-only configurations where no USB
  data role is available, instead of deriving it from the USB role
  switch.
- Pass the port alternate mode in the mux state, matching other
  firmware-driven port drivers.
- Force the USB role switch to be reprogrammed on system resume and
  check the enable_irq_wake() return value.
- Acknowledge a pending controller interrupt during probe so that a
  shared interrupt line is not left asserted.
- Do not drop the borrowed fwnode reference when parsing the connector
  properties fails.
- Treat all fwnode_usb_role_switch_get() errors as fatal; a connector
  without a role switch link returns NULL, not -ENODEV.
- Drop a redundant include.

Changes in v2:
- Drop the DTS patches from the series.
- binding: describe the single connector as a plain "connector" child
  node instead of an addressed node, and stop requiring
  "try-power-role", which only applies to dual-role ports.
- driver: add the missing USB_ROLE_SWITCH Kconfig dependency.
- driver: register the DisplayPort partner alternate mode only for
  actual DP connections, with a valid VDO, call
  typec_altmode_update_active() on attach/detach and set
  no_mode_control since the firmware drives mode entry.
- driver: never pass a NULL alternate mode to typec_mux_set(), and
  treat debug accessories as disconnected everywhere.
- driver: handle USB 2.0-only connections in orientation, role and
  mux state.
- driver: only cache the USB role after the role switch accepted it,
  and force a role refresh on resume.
- driver: use typec_get_fw_cap() instead of open-coding the connector
  properties.
- driver: acquire the mux and role switch before registering the
  port, use dev_err_probe() on probe failures and reset the mux to the
  safe state on teardown.
- driver: remove the undocumented disable_pd_interrupt sysfs attribute
  and the manual disable_irq()/IRQ_DISABLE_UNLAZY handling that could
  leak the shared IRQ's disable depth. This also fixes the build error
  reported by the kernel test robot on sparc64 and s390.
- driver: use a named i2c_device_id initializer and add the missing
  hibernation PM callbacks.

Tested on a Radxa Orion O6 (Sky1): attach/detach, USB-only and DP-only
alt modes, cable orientation detection and HPD reporting all work.

Gary Yang (2):
  dt-bindings: usb: add Realtek RTS5453H Type-C port controller
  usb: typec: add CIX Type-C PD controller driver

 .../bindings/usb/realtek,rts5453h.yaml        |  70 ++
 MAINTAINERS                                   |   7 +
 drivers/usb/typec/Kconfig                     |  13 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/cix_pd.c                    | 778 ++++++++++++++++++
 5 files changed, 869 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
 create mode 100644 drivers/usb/typec/cix_pd.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1
