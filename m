Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579217;
	b=x5raLK0mCJxF3ei05FRSkzaN0Qb04OxhSXIoHfuUDAslqjtSTQ2FSDV6qJSdx085FdVa
	 qfBrs3KkEapTZcPYUPMvob5CRySxxUXWgAuyaEBhRLdtV18l34rYtDIEjIgSXGlgQkAJ5
	 SG2LnuVXwmxhQeZGNF4kiitTNYBXcvzPIypm6SHojAzGegOKC1LpQ6g85RiSqyOcKMCs4
	 lvQIz16k+8pqiusE6txSsXkbqkdzX+sH9HTgK4G18OQhHkqiaZ+WZgF+e67NzXt/LVcst
	 nUAR8EK6hlkOzAVVKeN+mh4pBxxJmIfeBnT8po6+cpDizcDcr55FM/Qu425f1saVl/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579217;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=cLYpj1nGHZ8oQSZmagMtUFxGnq3+G+4K1oQpL50UX54=;
	b=qhqf90LyoCjYhzEaKM/M7t7v0B9pyjtsXKoddY+vzjKbbGg3RufMvLr3/WbPZ5lyacy5
	 9etILdsmMsdrnCeY3aK9Smnj7GAgYouCObyo/nHRRDaLGy93cMKqg/RZuBWcUVyo1tMmH
	 IFJqt39cSp+5pVi/TQDpRZrqwTpmkskFPy+D+6Ey3tdRxegk977BfNVcLSf0kdm8oxwFI
	 ZkSj+yiJ02XW7ihiChVoBmvyoIR/6Yv9SctR8pdo5W9zzjV4HI5wN2kgNcZuzetXw4jRR
	 Pa1mYAHY6hrQm3Y7JrvcLkPWH3qmWY8KQCqNf+hEI3mYImTt8kvMlZg3LrPR/3L9uUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.137
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022137.outbound.protection.outlook.com [40.107.75.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C491606A32E;
	Fri, 13 Nov 2026 14:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C491606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6kAm44Atd7RuH5+QVXEktyfbrGVE7WEJcd40o41BgmxkJ5PUcCCtwD+DXTjhAWGCzLBs0PViEWaL8NJqIiZTCKHmQdASgsk/8FKCPEFg+O5dE7YcBD0tg5XDw+7r+vYZSYyeaj6BM1T4WSPeW7H/nWxEH6r7rg9pkXkkax+MwXjWYd8jz1X2Lstj1+g/XLsOHguXqINnFTGCvkVYgr9skoe/NDa9ujtimXTuKF+Qi/i+fLs0rrkxsZF9unKJ1uFhZV9tMJN8V3JAoCgSVXuOGQSmhJ5Krr6vzQRm/0d8A6M8MtLh4sflyWBd5kKLbcBOHEaFUi7oM2gSOmRHEi9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLYpj1nGHZ8oQSZmagMtUFxGnq3+G+4K1oQpL50UX54=;
 b=FCcAUjyaiU97Y5LypREqPL1PEEJeG2AjRZ7uDRDJ4xHZl33ZSOzxtd+8IJciSsMRk3JtXkT+RLaCgraI/vC30DbSxyGnsHnEIqeOAQPBnlNCXP3pXc51NRclNnWod0PS/igrXDG7OCn6riu4B6bloijmpPsOsP7wMAfhdvzkMvEjE71knkNmWJj41lx+cKMA9gJPB5ZxDhOq221LjO7LAVFp2LqmZ10w/SeFzdaoy8X4PdroyYIPETC31XPLjts+StVennPLr9xtuyix5csljHpvAQ5dc4zcv90ZKBz4ASbvKXlb6Nu2mjKDekPMVyARvls10rlWKZvWVX3JCJehJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) by JH0PR06MB6835.apcprd06.prod.outlook.com
 (2603:1096:990:4d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.6; Fri, 13 Nov
 2026 14:13:31 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:296:cafe::d) by SI3PR01CA0006.outlook.office365.com
 (2603:1096:4:296::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 14:13:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 14:13:28 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 51AD05077DEE;
	Fri, 13 Nov 2026 20:53:04 +0800 (CST)
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
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 0/2] usb: typec: add CIX Type-C PD controller driver
Date: Fri, 13 Nov 2026 20:53:02 +0800
Message-ID: <20261113125304.1693911-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|JH0PR06MB6835:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f1528d9-3ff9-4eab-e807-08df41904b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|18002099003|6133799003|56012099006|261028144727099003|261102123227099003|261022105027099003|261026121527099003|261022075727099003|261021121427099003|261021123027099003|261026140227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	QGwLY0kMZGh0urLxf4pWWxR5AyZfBjGB1UbH7HeSpdaib9H8wjCs4ROQLv3/sZ7KwfrMvfqFojiGGnCZo03OI//7AX2zLACpWvPTJ4CChSM6d9pcEmobPLHJBTnRyiI0eu94exlGv3mrH+4fZ65qRDqfG+91p0xzLkVd45W69+5Qx9Qw6YW3v7fwYQDwmmzM6Y9kq1Liooz9lP8tRxtfkzBlLarwGfe7LIpC9g52pM7AvyLDZHhWjtvPiUbZJBYK7kzmfO0ObjwwbQFF2uJbJJxKw2+YB1sOLRf5hXNCmzx39U+zg6bAKWKWYFjNBPdNXc8fwd/w7qJOhajiNUuZQGX+Zjm5VttD0fxl1ev29lFek6iJVn8mr4cdm0DZ/OdnlE8GHMxrrJsZneetR/2OuoJHNn4wHxYjS+XNd59c+GkDU4znAl5mZiPvCXdOgKj/GiZcNgdJ4pnIGZ6OHF8rM2c4DFEH4VUk0oJsb4RjbaaebTabk4kWiAAFNZW7jzPg4TIx36ivXdarkKsxiZ8825qbTcitda1lm2uxtxlV41o7NObIF1F54iTEZC6I1BQ7+hJcG1FmgjLTntiy5aVOLKh7/6dCyo4Ksw65IS/+pEMOY86L4nS33ItBvhSQosy4UXyDWoeJTOI/hzB2xlnYK4Gag1AtTSgxsbzMA2NzoBioWpFdn/6RXBJq1Jfu5tjdijond2eXdCYz5HpFHQDWnA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(18002099003)(6133799003)(56012099006)(261028144727099003)(261102123227099003)(261022105027099003)(261026121527099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026140227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xk1PXn8L+9G+RDvcIj60a2XXTg4h9DvSzDCitVmyQQSCnIAHP0+XjeEOjbai2svBmnT7YfjUlqHddi1chPhSXogwTd2k9bEN39hnKBjcI/s/lpxo7vF8HTXjPJizK49iKdd9reoi530bdsQw8BZLYurAprVfeladi2xyhAj4JToTp4oa95+T8qCvb+qO5z+eGqpa+Om5/KolH18QXnXf2OoMdc7jEifrRhJq0gxebmFMoxKNS0JiKfn8XtEhs1vqOovLL7L52NKG2Z3ahJpf/5cSLPibON3xB5WMW+cOtpT6LxeKBSdb3s97FsHGMhB9RbC0DcgGASEhSHROIHNI9zRffv1eqsPqU/PFlRBi5TiNa/3mK6MaE3/9TXuvFBTKceRYN3DongOsQ6u8JTb5xhjySfMX5Du+mZcB4JE3Qf09UJJWB7AEocg7iursBnRN
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:13:28.5234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1528d9-3ff9-4eab-e807-08df41904b31
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6835

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
 drivers/usb/typec/cix_pd.c                    | 768 ++++++++++++++++++
 5 files changed, 859 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
 create mode 100644 drivers/usb/typec/cix_pd.c

