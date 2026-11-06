Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.98
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793944261;
	b=UnbFxrkaTBXnGgnatP4Mz7HWHfa7YFOpY6cHfG2GQdH4ra89rVmN7CwXc2GpIMf7tuKM
	 1T30DfcEp6gjOTo3bAO/dut5xzPMiR5bqHfuk+4N6jriryhxT3hGFWVkf1X+5sS9VkUcY
	 LIbhMX+ij1my2OctSAxuCSB3Gf6sSDcDubAgMfX5YeINX6HSJYSPMtsMAzztl1DnXh8La
	 wHsCYB/MHmEcHiwWBOoB01TbkkbnX5OZZysmYAI4vSLTzqXCmJl5nOF6Uigj2OKw1Y+uO
	 naeTevxxtvTXS39Uoc7EP/hfHWHIvK8Zar5z+OqTZDmS/9UDx58mR9352dGfmGOoAMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944261;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=peiBO3mcYtGW45Ah9PFl2F/gmH/tsnHCFL1wRh/s6oo=;
	b=NdiAsx6ICt/rEka4WEIUn0rO8KUTGwsQnoPGil4J4RsV3r0/yyE2FPT7oBz490gfuiBP
	 7KqUzDMhx91Q4ELPcWKYriSzCXbFM0PcQKzXga4CAbYJVGF2cz9LpA5CMnF8cad2qoBqg
	 PvN6xgLXoW6vl8MpG3loy2ob/p2KjGEwoAOCC3PpX5yOoYG6psTKbHHYnIKOOHWEWIyUY
	 RFqSDRcbqvSCHhJdXzZlA0yDNrFIL7/1PvrcfXcgobqYU8wgLygN1xHy3v9nHJ0ah0ICl
	 Phsk5LkjSgKa3YXH+8Wf+pZ/m2PMBwXFJ3ME4X/vGfkhpqse8nzaAAj62S7h0lPYkJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.98
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023098.outbound.protection.outlook.com [40.107.44.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4A2606A33B;
	Fri,  6 Nov 2026 05:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4A2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWoA2RJyzUnZ/PP+4qcVXD4mTKmyuQXgYXmMKc8ltyllfx+KWfGVtohvD5xOdYThypA9KdxV/IGFFP7+ZuOlknOztSGH6kkpXMrUypis8sHDr+6FTFGBrLykTVlYgXZMV35rca50cm8tOV7/9m/GIjyqX0FJaUPv5FtMopPkUZ9KhnYclEboRR/sKeCLdfKBLFenYEq+bbRpafYt+S+7sRCDueU5Z7cmAvGe38zEmk/Grad5Th4D8XD9FjzI/1YkmFURFZmNQGQ55wRpsNliZb1v9+ii/yjlrcAvPhc1qfdeDX614QGUai6DIYxN8fAsP1scJzH4w14xZ2QftqnfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peiBO3mcYtGW45Ah9PFl2F/gmH/tsnHCFL1wRh/s6oo=;
 b=T5z3nHuDsamqO7vmWyGyFUuCGvN40zJ4i5PkkbdiHhEDbhP6t4ZN5ppWFOfAvdrHSw0tlowsNGJZYvj3i8oi/9kzN1FfgWCw9gW/lbwCOr+S97CIF5+aoj+th2OmtWUQV1eKVIJUgEDxFaHEhbDOn2E3/G5SlWEYZSGT4px80y5OahNMD3gAT9J9Q5mMA5QyWwZJ9OhifOFjbt9eai+3lyk9pvLpMeC/6wH0OLcMnsi86JLhBdeCWWNokRMB5E+wI6E+yS0tAEQp07vxxFSLjLekdz67FGdmDJFPaZMgpiGeKhBR5bcJSKS0ZWkkhN3sWopP6Os9e4pFyaKWpFhQqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCPR01CA0180.jpnprd01.prod.outlook.com (2603:1096:400:2b2::20)
 by JH0PR06MB7178.apcprd06.prod.outlook.com (2603:1096:990:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 05:50:55 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:400:2b2:cafe::2c) by TYCPR01CA0180.outlook.office365.com
 (2603:1096:400:2b2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 05:50:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 05:50:53 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 63A8E4102E6A;
	Fri,  6 Nov 2026 13:50:51 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Fri,  6 Nov 2026 13:50:50 +0800
Message-ID: <20261106055050.948470-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <4d075b70-f2af-4aad-a1d7-cd8ea26387ca@kernel.org>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com> <4d075b70-f2af-4aad-a1d7-cd8ea26387ca@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|JH0PR06MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 40017b92-fad2-4bad-a223-08df3bc9ebc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|5023799004|4143699003|261026140227099003|56012099006|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	LUmcU9NlTiFd9fB7+hnD4ThOtwlm7FNacv9VqBKuik0HPXtMe+tSGwwDq9TM2hQwmy+JShmX3M6lM2KKaTz381v0OospHIeaRXM62VEsTGCHICfu35YX8uEg9vmAFpXZKPBWTQv5XQvCZtvBjOdrSOzMhJJtNst/jV9QeZtJc1r8Y+6Sc52r1TzrqAK22TAWRQ/qVNil+s8LdT9Un2IWXiqnjCmLC4ZfkO/VOstjQQcTm8kwgZs5sxOEV3jpN2jlPGwkYcA/9imqxL25BxNNA+JWNZwh/L5TWNHOE+iKXef0IX6c7IqRlD3ndVVRauwm+Of5UFC4lIMxm4XKM6gIA2rz2g/GV9qJxU0HzUcdw/t7Guum5Z/c6gaF8H5uUz33BKFK6N6tIGT2P/HD+v3L65Jt1yD0Xbyl+s9UmUWN2PXF6y/PWvhw7WuQpHujlemA/8f1Vr5OfnOhYrY807iNih5PrrQpw28z+fAYYSJdfsnSePPpm7i2mvjWjsqVqSN2YHua2t6ZSJYZwLDNtyDbZRYtvq322Tgd1yHnfyiGc5M3VH3tFV0ioiBixjGrIMuUx7PUwJCbcTukaNur4vgUh0wioMt6GVKuC8TloLzEJeh3I0s3new7XPVka1bmoEBb5sw9M6gKuUFr2PHMSjP8ZGpa+wlZ/kH/tOrOeQ3H5YJvl/PkE9pffuMSMKJEBb2jKAnWGtUFPIGD0VYXP2F7dQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(5023799004)(4143699003)(261026140227099003)(56012099006)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R9K44TTQL9e4/lF9cVA347j/DUss09thCMPR4WfTy3c1krO6m3GWsKHG+GKJBzDHbbmiKWpfeajl8zZRUQ9Q7C4Gtp9s84oB6hLIMfHq/kxX5zXD4ORTauNP9n8JOcfB5y2JjgqoPXaZHks/+lsM1ecUvpjkp4FhH9c0GvhGg6pQtnbw2UzTnEEfCda4PisnoXaC6Excbyt2IlwE1WRQbVlOiexiMdHkfHLcrU6WeUq82HWewY34ek0t0+dO1EWtlZG7o3Py0gFxQjJe4Bf2g+ekl+QSNYXCag5ljGAlgJbA0Tx0njYkXuf/y/JReIt0gwks3JMbbuGNFFmT5gyWNNWqXuudbelgkJ2ZP7nz26NbRisDKOVoUFptopw5VY9wg+0C1+p6fIQ0gHtDqCP8VpHDgt8HP4ldef2GmqIekDkvDKtXaBW+KpnbUM+ojsTQ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 05:50:53.4801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40017b92-fad2-4bad-a223-08df3bc9ebc8
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7178

On Thu, Nov 05, 2026 at 08:49:05AM +0100, Krzysztof Kozlowski wrote:
> NAK, you did not respond, did not implement feedback or part of the
> feedback.

You are right, and I owe you a proper answer instead of another version.
I replied to the cover letter of v5 and to nothing else, so the per-patch
comments on v5 (b28d5657) and on v4 (a5586b54) were never answered.
Answering a cover letter is not answering a review. Below is the
point-by-point answer, including what I got wrong and what I have not
implemented.

1) "No MMIO here? ... If you have here MMIO for some glue over IP block,
   then it is unlikely to be a syscon." (v4, 7c52bcf5)

We do have MMIO. Each controller owns registers in the USB30 Type-A
DRD0/1 RCSU block at 0x091c0000. "What is the actual memory map there?"
(791fe5ba) - this is the block:

  offset   register        contents                                  belongs to
  0x0300   STRAP_PIN0      stream ID (SID/SSID), controller 0        USB4
  0x0304   STRAP_PIN1      stream ID (SID/SSID), controller 1        USB5
  0x030c   STRAP_PIN3      clock enables, controllers and PHYs       USB4, USB5
  0x0314   STRAP_PIN5      awcache[3:0], arcache[7:4], controller 0  USB4
  0x0324   STRAP_PIN9      awcache[3:0], arcache[7:4], controller 1  USB5
  0x0328   STRAP_PIN10     USB2 PLL controls, controller 0           USB4
  0x0400   STRAP_STATUS0   AXI clock en/valid/req, controller 0      USB4
  0x0410   STRAP_STATUS4   AXI clock en/valid/req, controller 1      USB5

Controller 0 of the block is used by USB4, controller 1 is used by USB5.
The driver writes the AXI cache attributes of its own controller and
polls its own AXI clock valid bit. By the rule you stated, this is a
device with MMIO, so a device node, not a syscon, and the
cix,sky1-usbss-rcsu syscon binding from v4 is gone.

2) "Individual registers are not a device." (791fe5ba)
   "You need to describe the address ranges, hierarchy, not the
   registers." (291fc3be)

Agreed, and v6 still got this wrong: two reg entries of 0x10 bytes each
are just a register with padding. What I intend to send as v7 is one
range per controller, starting at its AXI cache attribute register and
covering the register file up to its status register:

  usb@91c0314  reg = <0x0 0x91c0314 0x0 0x100>   /* USB4, controller 0 */
  usb@91c0324  reg = <0x0 0x91c0324 0x0 0x100>   /* USB5, controller 1 */

0x100 is the same size as the glue window of ti,j721e-usb in
Documentation/devicetree/bindings/usb/cdns3-ti.yaml, so the range is
comparable to what the other Cadence users describe for glue registers.

I want to be explicit about the hardware rather than let the DT imply
otherwise: the strap and status registers of the two controllers are
interleaved in this one block, and 0x0328 inside controller 1's range
belongs to controller 0. There is no per-controller contiguous range
that contains only that controller's registers, so the two ranges
overlap, and the binding will say so. That is also why the driver maps
the range with devm_ioremap() and not devm_platform_ioremap_resource():
request_mem_region() would make one of the two controllers fail with
-EBUSY for registers the hardware shares.

To be clear that this is the controller's register file and not an
arbitrary register: the same register set exists as a dedicated block per
controller on the four Type-C instances of this SoC, at 0x09000000,
0x09070000, 0x090e0000 and 0x09150000. There the block is not shared, and
the cache attribute register is at 0x310 instead of 0x314 - which is why
the status offset comes from per-compatible driver data. Only the two
Type-A controllers share one block.

3) "Shared region is not a simple bus." / "Drop node. Not relevant."
   (b28d5657)

Done. usb-rcsu@91c0300 and its ranges translation are removed; v6 and
v7 use absolute addresses with nothing translated.

4) "So this is @14 / But this is at @91d0000 / You have completely fake
   representation of hardware." (b28d5657)

That was the v5 container: a node at a translated offset 0x14 with a
child at an absolute address. In v7 the unit address of each node is the
first address in its reg, so usb@91c0314 and usb@91c0324 are where those
registers actually are, and the Cadence core children usb@91d0000 and
usb@91e0000 are at their own addresses.

5) "Syscon is not a USB device. This is not supposed to be in USB."
   (f76cef66)

The RCSU binding is gone since v5. The only syscon reference left is
cix,usb-syscon, which points at the S5 system controller for the USB
mode strap at 0x424, bit 8 for USB4 and bit 10 for USB5. That register
is in the system control module, not in the USB controller.

6) "NAK, undocumented ABI. Drop entire alias and do not sneak such stuff
   in the future." (6029d402)

Done in v6: of_alias_get_id() and the "id" property are gone, the driver
no longer derives an index from DT. axi_bmax_value is no longer a DT
property either, it is a driver constant, which also answers Conor's
"Why is this not a fixed value per SoC?".

7) "In the description you describe hardware, not binding." (f76cef66)

I extended the description because I did not know how else to answer
"What is the actual memory map there?" in the patch. In v7 the
description is back to what the block is and which registers it holds;
the map above lives in the commit message, where it belongs.

8) "No improvements, since v2." (7c35c198)

You were right about the register model, and that is what v7 changes.
The rest changed in v2..v6 but the changelog never said so - it only
ever listed the previous revision, and v5's text was a stale copy of
v2's. Complete one:

Changes in v7:
- Describe the RCSU registers of each controller as one address range
  starting at its AXI cache attribute register, instead of two 16-byte
  register slots.
- Map that range with devm_ioremap(); request_mem_region() cannot be
  used because the two Type-A controllers share the block and their
  ranges overlap.
- Take the offset of the AXI clock status register from per-compatible
  driver data (0xec on Type-A, 0xf0 on Type-C), instead of two
  reg-names.
- Dropped #syscon-cells from the S5 system controller binding: the
  property does not exist in the kernel, and the series no longer
  touches bindings/soc/cix.

Changes in v6:
- Dropped the simple-bus RCSU container; each node is placed at the
  address of its glue registers and the core is a child at its own
  address.
- Replaced the usbN aliases and the undocumented id property with the
  register offset and bit position arguments of cix,usb-syscon.
- Converted probe error paths to dev_err_probe().
- Removed the unused over-current GPIO handling and the unused dr_base
  and cdnsp_pdev fields.
- Fixed the 125us prescaler value: time * frequency - 1.
- Made the AXI halt writes read-modify-write so the preserved and RW1C
  bits of XEC_AXI_CAP keep their state.

Changes in v5:
- Dropped the cix,sky1-usbss-rcsu syscon binding and the cix,usb-rcsu
  phandle; the glue registers are described in the controller node.
- Added the MAINTAINERS entry for the glue driver.

Changes in v4:
- Split the combined PHY/USBSSP series into two independent series.
- Restructured the RCSU registers as a shared syscon region with offsets
  (reverted in v5).
- Fixed the indentation reported by checkpatch.

Changes in v3:
- Fixed the interrupt specifiers of the core nodes: the Sky1 GICv3 uses
  four cells, so every entry needs the fourth (empty) cell.
- PHY driver: assert the resets before registering the PHY provider,
  disable clocks in LIFO order, and fix the error unroll path so clocks
  that were never enabled are not disabled.

Changes in v2:
- Split the single binding into a PHY binding and a USBSSP binding.
- clock-names: apb/ref for the PHY, sof/axi/lpm/apb for the controller.
- reset-names: core/apb instead of reset/preset.
- Dropped axi_bmax_value from DT; it is a driver constant.
- Added the MAINTAINERS entries.

Changes in v1: initial version.

9) The one thing I am still unsure about is the wrapper. You wrote, for
   the case without MMIO, "you should have one node only, just like we
   did for DWC". We do have MMIO, so I kept the wrapper and the child
   core the way fsl,imx8mp-dwc3.yaml does it, because the glue and the
   core are driven by two separate drivers, and folding them into one
   node would need a single driver owning five reg ranges across two
   unrelated address regions. If you would rather have one node, one
   line is enough and I will restructure before posting.

I am implementing v7 now (the reg change, devm_ioremap(), the per-family
status offset, and the trimmed description) and will post it in the next
few days rather than ask you another question and wait. If the shape
above is still wrong, replying "no" to this mail is enough and I will not
send it.

Thanks,
Hongliang
