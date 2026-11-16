Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856046;
	b=H/czGRgc9LTgiv2K/bsAhsgc7YMW9esprx82cf5EVLZ5nHqeb1E2KglHwqGenfg00Q4h
	 Xzo5hKYZwAA7P6EM6uQCqx5P/ySirhQFALsvfb6CqQqjgaTBNmztGE8hNi9HWEhcMG+cT
	 Bi7mDrAveYYJ06n+DM915IX6HOJk163cmwEYPXZAb96whO15ATOSSxiWmI5XQyYjhXv4a
	 2J9RxNLKBvPKtn/qNpXylBtPd3Dspb6jsB1S1OfG4G/jBH1pF43ltUt6onT7x0/rr2gNl
	 pBLMroztM5zdrrA6j5+6ZJp3SuUMU5vJB8idFKr/gA17c5/rtnt3etB/tjjovvdVC8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856046;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
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
	bh=TpKcILldCnaJJrXv9QaQpI+qG1L9bTGpXLBC2D7VCa8=;
	b=W6U1/HsfEtwFU/Kg/y9nL+SKgJ8ieCX0CVseaOZxIVZkNctuxAeRgwm7lJuX0mox/7Mr
	 SRzx3Ix0Z9dMaKhbvynZJ0wqlFo+ZAn4vVGHptmsfboZI8UwrKf5V1AX/IacaXK3PrCNi
	 l7tONodXSqOvXPEw4H3quykd1wpQJ2d3fWZA7iDePbXdGY0NfHPG57aHKWaWXt/lYYo2J
	 Zi5dELDPojgNh71HA9RBDGHwrGsTW++/yWg5s9SdSb9lmhdb5vd49DN2y5QPtZAEEoYhy
	 nc6iR8brBZ98L+/eP+aSUgw7HGR0UUTGx7fpfXlxWIQ/toUXNsGMEm3BAcRu6pMPv4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=fOYg1Orf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.97
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021097.outbound.protection.outlook.com [52.101.62.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903DC606D3D2;
	Mon, 16 Nov 2026 19:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 903DC606D3D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=fOYg1Orf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CocYrGqjYP0pY02ByfgGWPUN+QV9Rci6+PFqn9/wFpNELCpYKZ9glvVKpRd8j41lSdvQyOQJqPCL3VhjqlnAwsuACboBv9y40gribSek0h8PT5u0h39NMoQLnUhojOEthJMWWzi3Dgn0mcbF3fe4BZu1E+oR2kZtE8dtIla1pfnz5xItLkyN/URUgkkJ3/8m4Qh/UGqeeBEC0WP0KSFI/BQawLV8Nqj4ISZYngERsyFoU4sPW1q2Xj69htGa3w1xGVZTQn1m5QqqYNvpXtMNECdlPnNzW7Zydzr3edyQUsiuIxE2O0aq9Xm81zWmP7akCidbjlf6R9I0KSltQSXgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpKcILldCnaJJrXv9QaQpI+qG1L9bTGpXLBC2D7VCa8=;
 b=aHy1zFSeieaf/enLF/kmrynQ/BDpYcUyO5GI1pyLbnNfLw/R5zcchNObwdFM62mqwpjJSyteK0/ONCPPxS86l+6BVKu38B0S9UwQ6OPXwlqCBdc4RgSpnE80446XL4zwkuWuuRICz5SDhi6wi7v9IGiJfBiQCQ+9XidiFWf2G6Z0XScRpGO8Nd20LH6s9hYiMiie/x8j/xZLU5VjaqMJB9ubnA+pKKzKjp1oCb/UGJSORWYcjUSuuNhCJfPsnDggpyYwtIyVplaoyj3f5G3A+6+6lvgiE03r5Pm/3R1PZhUHVqOdR2G9xMA9xFV6Rlr42mhdbDh3RbdSl5DC8NSk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpKcILldCnaJJrXv9QaQpI+qG1L9bTGpXLBC2D7VCa8=;
 b=fOYg1Orfi7LncPRJEhfhObosXkebwiV5dayVxg6fYp9ed+igxCtt5nH2l44429m1X/hGwd/tS307krk3Ta3m2NVgSuPSe0S1ZSv3V9eF87HfI2PUBcIx3HlLzqVMrqmSaMz7AURNiS1iLvu4aIMyfIV8CHvj5rmO8e33EX6Ozw5xzrCrd/2mpIoi7eqbH9zSGMD3sEX4mKPbb7QCfRMTQPhGDkvZWBP1sMin1556ks3AO1mc5tKODGvNiobKKcjRmXn5qSJ4jbpN0gXGg2pFAj1/YaKnsCQPXQKeNDb39n7AbOCUR/uRJqNv0hzu0wHjTBBs5OROvy087ypTMI4FIQ==
Received: from PH8PR07CA0047.namprd07.prod.outlook.com (2603:10b6:510:2cf::10)
 by SN7PR18MB5261.namprd18.prod.outlook.com (2603:10b6:806:2eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 19:06:39 +0000
Received: from PH7PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::8a) by PH8PR07CA0047.outlook.office365.com
 (2603:10b6:510:2cf::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 19:06:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 PH7PEPF00000009.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 19:06:39 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id B8E5C4186B53;
	Mon, 16 Nov 2026 11:06:38 -0800 (PST)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH v5 0/6] Axiado AX3000 and AX3005 USB Device Controller
 (UDC)
Date: Mon, 16 Nov 2026 11:06:14 -0800
Message-Id: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
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
X-B4-Tracking: v=1; b=H4sIACZU+2oC/43Qz2oDIRAG8FcJnmsZHVdNT32PkIOrYyOka9F0S
 Qn77p0k0D/kshflE+b3DV5Ep1aoi5fNRTSaSy914jA8bUQ8hOmNZEmchQZtQWkvw7mEVPlCAJC
 ffZSJxyLJWKdTq8cjNakGmzArbyBuBUsfjXI531p2e86H0k+1fd1KZ3V9vft8rPJnJUGaIRIEP
 4Iy+fU+9Rzru7gWzPoX9cqtQzWjQBkQU4Jg/QOKP6jiVdehyCjyx1HMEcIWH1DzB8WVqGE0Dtq
 6EW1wzv1Dl2X5Bkgk+NXWAQAA
X-Change-ID: 20260128-axiado-ax3000-usb-device-controller-156d3f1840c9
To: Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>, 
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794855998; l=14722;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=q4qxY3kiFzCh6qxTETzOgdmAqb7h+3aVJmOp8Hh4awE=;
 b=sj4NL47O1UnlRkAAJwVwTuWPDTGBID4qqM+Zmo8KEh7ZkZzKD71ZdZF5+hUDCljKk7n+9FOag
 I45/l4XB7c6DD8D2UKIRBKWgPZhhi/TulhEAKt0LbYBeGQej0yta180
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF00000009:EE_|SN7PR18MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: 90378f9d-0a4b-408d-9171-08df4414be52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|10067099003|5023799004|56012099006|261102130727099003|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261009221227099003|261009220027099003|261009223327099003|261009223027099003|261009221727099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xcYJ2ljPV6nDi0dwoUYhRAVe9GGJBLjl83WWieELlKC0XMm9/xV3TAZep29F5q0bLIrek7zSClIIeT7do1A9U944M3WMNObQqk8POz5DdRCNUb0ZEp1FVSIbleyU+JVUwfC8eacXpHobRzEX2th7kgR3mBddhvdPNqshek3231DTReVBhFTbSMhZC+bsVJXkKp4thPyvCQgMQwURh7shPI8gnsPZp29jYVPURNlzDRXTTTkyE4AjCAWSrsXalhXZ4r3I5gud1E9773hKrC6M1JhJVAiA5nhvL/eguvM3KJSRAHby3VL5q4LsrTpZSNoZgMvBjx/bnuynjSAeyGwTFw1m0kR1IZKizhAcG9yOSgU/hzuYZihRjcbSkuWpha1U7J4E7UB+u6I0B8AYIu8heI3mYwa5sNApXrHm1Zx10gZ9F88SgC9NPGBwjBEe1bc2tR/DzCWjneIrVLZwSOwu8eQttXnUZIOBY9e1uZBzsCgsbzgOFwlpVskNnXymoNdOivAqM9YARYWPow5JtyVSKXvnR0B/4d38+cN47I29No0C6Yt74avHuwHG2x9LbM2nssmrq12PCLHNrxImjpDb+mo+2iClri0cE824vX4XLt8lySH1237XlBRgM+l5KEHlmyqIksy2PxpYin6X7XTy6A==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(5023799004)(56012099006)(261102130727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009221227099003)(261009220027099003)(261009223327099003)(261009223027099003)(261009221727099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U05P62wusk01Gukphqnxe6yaQOYDwDrWccQjjtRpBlcEx8v+9b5bILE/itnT07n9IEtVggPBOsHNK5COgMf4PAkEUvCLZ7YRzh33aosZdAJ+/C43G7mUnAH4t8hXZO2fqXU87ofA+AaDs/mdIER5fjjTIKDaY2vkt+e3rCOL0tXYIB+XcTswQFO0xCjyFif0+N7SHyJ/+84l1efyqZrIlsDVgNEuxOVQNhcyuvttWBnlAPES74SDMvWRUWHGQ3YriEZFOQGuCcwb9plx3mArnCKo4hvS5wFnjsQa16tsqRjYxz00vaNv4Lca/a2y7Ipw0101qI0eSM3VjxXXSCZna27ngLiJEoOXuL1AGULt6v+AYBJH91hJQZcwQJJGl3d22hbzEDGhrdCBrhB7vn1ROyMZ4DtbnY31y8+ApTLjVbG5k94354wLOVEnMEUFPmoN
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:06:39.1426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90378f9d-0a4b-408d-9171-08df4414be52
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB5261

Dear maintainers,

This series continues the work of adding support for the USB device
controller (UDC) integrated into the Axiado AX3000 and AX3005 SoCs.

The controller is based on the Corigine USB 3.1 IP core. The core
supports device and host roles, and this series adds support for device
mode on the Axiado AX3000 and AX3005 SoCs.

The controller uses MMIO registers for commands and TRB rings for
transfers and events. The driver manages the SETUP, DATA, and STATUS
stages of EP0 control transfers explicitly.

The driver follows the cdns2 source layout where applicable, with
separate files for core, gadget, EP0, and ring handling, and tracepoints
for controller and transfer events.

The devicetree binding also picks up one item left over from the v2
review: the description now notes the underlying core is dual-role
capable (device and host), used here in device role.

Tested on an Axiado AX3005 EVK with a mass-storage + composite HID
(keyboard/mouse) gadget, including repeated bind/unbind/rebind cycles
and host-driven bus resets.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
Changes in v5:
- Updated the CRG USB UDC maintainer list in MAINTAINERS.
- Fixed out-of-bounds TRB access, ring wrap handling, dequeue pointer
  updates, and transfer length calculations.
- Improved multi-TD request tracking and transfer-ring capacity
  management.
- Reworked endpoint dequeue, halt, and request completion handling.
- Added controller recovery for endpoint stop and disable timeouts,
  dequeue failures, and EP0 abort or reinitialization failures.
- Waited for the controller to halt before issuing a software reset and
  added an external reset fallback where available.
- Used private DMA bounce buffers for gadget requests and rejected
  pre-mapped requests. Retained the private DMA mappings when recovery
  could not confirm that the controller had stopped accessing them.
- Preallocated two transfer-ring banks per endpoint to avoid allocation
  in atomic context. Switched banks when rebuilding after a running
  session so late completions for the previous bank cannot match new
  requests.
- Fixed EP0 STALL, status-stage, and SETUP cancellation handling.
- Added controller recovery guards and generation checks to reject
  stale events and callbacks.
- Fixed port reset, disconnect, and reconnect handling. Separated
  controller recovery from gadget reset notification and deferred link
  restart until after the gadget reset callback.
- Improved synchronization between interrupts, resets, and endpoint
  operations. Fixed endpoint cleanup and resource release during
  teardown, and improved suspend and resume handling.
- Link to v4: https://patch.msgid.link/20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com

Changes in v4:

Ring and transfer management:
- Prevent stale event-ring dequeue updates after concurrent ring
  reinitialization by tracking ring generations.
- Continue scheduling pending requests while transfer-ring space is
  available.
- Avoid unsafe request-list iteration when completion callbacks drop
  udc_lock.
- Clear stale request bookkeeping before rebuilding cancelled transfer
  rings.
- Preserve transfer-ring cycle bits and Link TRBs when rewinding the
  ring.

Endpoint 0 handling:
- Prevent NULL dereferences and queue corruption when reusing the shared
  EP0 status request.
- Remove duplicate status-stage scheduling from GET_STATUS completion.
- Serialize shared status-request buffer access and completion
  callbacks.
- Correct SET_FEATURE and CLEAR_FEATURE validation, recipient handling,
  and function suspend options.
- Accept SET_ADDRESS(0) in the Default state and fix error handling.
- Correct SET_SEL payload parsing using struct usb_set_sel_req.
- Set the chain bit on non-final control data-stage TRBs.
- Stop EP0 and wait for hardware completion before cancelling requests
  and reinitializing its transfer ring.

Gadget and endpoint operations:
- Prevent TRB interleaving between requests, premature ZLP generation,
  and stalled transfers spanning multiple TDs.
- Fix transfer-ring allocation, resizing, and error cleanup to avoid
  dangling pointers and concurrent DMA buffer access.
- Synchronize reset work with gadget callback disabling and unbinding.
- Correct last_trb tracking across ring wraparound and multi-TD
  transfers.
- Use the correct dequeue cycle state when updating endpoint contexts.
- Wait for hardware endpoint disable and finalize endpoint state before
  completing pending requests.
- Correct High-Speed interrupt and isochronous endpoint maxburst
  handling.
- Fix port link-state resume handling and disconnect notifications.
- Revalidate endpoint state and EP0 setup identity after DMA mapping.
- Protect gadget start/stop state and register updates with udc_lock.

Core driver:
- Notify gadget drivers of disconnect before clearing endpoint state.
- Initialize endpoint structures, event rings, and EP0 before enabling
  IRQs.
- Move gadget removal ahead of controller state changes during teardown.
- Serialize shutdown register updates and cancel pending reset work.
- Fix 32-bit build compatibility when reconstructing 64-bit DMA
  addresses.
- Prevent overwriting pending controller commands while RUN is cleared.
- Replace SIMPLE_DEV_PM_OPS with DEFINE_SIMPLE_DEV_PM_OPS and
  pm_sleep_ptr().

- Link to v3: https://patch.msgid.link/20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com

Changes in v3:

Devicetree binding:
- Note that the underlying Corigine core is dual-role capable (device
  and host), used here in device role.
- Drop the explicit maximum-speed property declaration. Krzysztof noted
  in the v2 review that compatible already implies SuperSpeed
capability,
  and testing confirms the property is not required.
- Reference the generic usb.yaml schema and replace additionalProperties
  with unevaluatedProperties to permit standard USB properties while
  rejecting unsupported properties.
- Validated the updated binding with dt_binding_check.

Driver structure (matching drivers/usb/gadget/udc/cdns2):
- Split crg_udc.c/crg_udc.h into crg-udc-core.c, crg-udc-gadget.c,
  crg-udc-ep0.c, crg-udc-ring.c and crg-udc.h, one concern per file.
- Add ftrace tracepoint support (crg-udc-trace.h/.c) covering pullup,
  doorbell, TRB queueing, event processing, control requests, and
  request alloc/free/giveback, plus a decode-helper header
  (crg-udc-debug.h) for the PORTSC/completion-code/TRB-type strings
  used by the trace TP_printk()s.
- Make internal-only functions static and normalize the remaining
  exported ones to a consistent crg_udc_ prefix.
- Reorganize #include lists so each file pulls in only the headers it
  actually uses, instead of funneling every kernel header the driver
  needs through the shared crg-udc.h.
- Match the SPDX/license comment style used elsewhere in the tree:
  a line comment for the SPDX tag, block comment for the description
  and copyright.

Bug fixes:
- Restore the VBUS-detect vendor-register write on udc_start(),
  udc_stop(), remove() and shutdown(). Without it the controller never
  considers itself powered and enumeration is unreliable.
- Restore the DATA_STAGE_XFER/DATA_STAGE_RECV cases dropped from the
  EP0 status-stage completion handler. Without them, any control read
  (e.g. GET_DESCRIPTOR) never arms its STATUS stage and the host times
  out waiting for it.
- Fix the transfer-ring TRB-deferral check to defer building a TRB
  only when the ring is actually full, not merely because another
  request is already queued on the same endpoint. The stricter check
  silently broke back-to-back completions on one endpoint, such as
  mass storage's CSW immediately following its data stage.
- Restore the RUN-gated completion check in the hardware command
  helper, so a command issued after the controller has already been
  stopped (e.g. during udc_stop()) does not spin waiting on a
  completion the hardware will never post.
- Call usb_gadget_udc_reset() on a bus reset so the composite/function
  drivers correctly re-run set_alt() and re-enable their endpoints
  after a reset, instead of composite silently treating a repeated
  SET_CONFIGURATION as a no-op. This is deferred to a workqueue rather
  than called directly from the port-status interrupt path, since the
  synchronous call re-enters the function drivers and would otherwise
  require dropping the driver lock in the middle of event processing.
- Clear the generic usb_ep.enabled flag and endpoint descriptors during
  internal endpoint teardown and controller reset, preventing stale
  endpoint state across sessions and allowing endpoints to be correctly
  re-enabled after a new bind or reset.

Additional fixes from Sashiko review:
- Use dma_addr_t for DMA offset calculations and validate DMA address
  translation failures before programming hardware registers.
- Reserve transfer-ring capacity and publish multi-TRB descriptors
  only after all TRBs have been initialized.
- Track remaining TRBs and buffer length for requests spanning
  multiple transfer descriptors.
- Advance the hardware dequeue pointer before completing canceled
  requests, and restore the producer cycle state when rewinding rings.
- Detach pending requests before completing them during endpoint
  teardown, and complete requests that fail during deferred queueing.
- Reduce the hardware reset timeout from 500 ms to 10 ms and release
  the spinlock while polling for completion.
- Protect pullup register updates with the controller spinlock.
- Update the event-ring dequeue pointer before yielding the CPU.
- Unregister the interrupt handler before freeing DMA resources.

- Link to v2: https://patch.msgid.link/20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com

Changes in v2:
- Drop the dual (GPL-2.0+ OR MIT) license; the driver and header are now
  GPL-2.0+ only.
- Register via module_platform_driver() and add MODULE_AUTHOR/MODULE_ALIAS
  instead of the hand-written module_init/module_exit pair.
- Acquire clock, reset and PHY through the driver model
  (devm_clk_get_optional, devm_reset_control_get_optional_exclusive,
  devm_phy_optional_get), with teardown wired up via
  devm_add_action_or_reset.
- Switch to devm_request_irq() and drop the manual free_irq() paths.
- Support multiple instances using an IDA (DEFINE_IDA/ida_alloc/ida_free)
  instead of a file-static device counter.
- Read match data with device_get_match_data() and move the former
  compile-time feature switches to DT properties (dis-u1u2-entry-quirk,
  dis-u1u2-initiation-quirk, reinit-ep0-on-bus-reset).
- Set the DMA mask via dma_set_mask_and_coherent() with a 32-bit fallback,
  and convert PM to SIMPLE_DEV_PM_OPS.
- Fix endianness handling for TRBs, events and endpoint contexts using
  cpu_to_le32()/le32_to_cpu(), and decode setup packets without casting.
- Locking: pass the caller's IRQ flags through the completion paths so the
  interrupt state is correctly restored across the unlock/lock window around
  gadget callbacks.
- Properly free all coherent DMA allocations and add
  dma_mapping_error() checks after dma_map_single()
- Fix DMA directions on the GET_STATUS/SET_SEL control transfers.
- Replace open-coded register busy-wait loops with
  readl_poll_timeout_atomic() so they time out instead of spinning forever,
  and return proper errnos (-EBUSY/-ETIMEDOUT/-EIO) instead of -1.
- Replace the custom SETF_VAR/GETF/MAKEF_VAR shift-and-mask macros with
  FIELD_PREP/FIELD_GET (include linux/bitfield.h), and use BIT()/GENMASK()
  and dma_wmb()/dma_rmb().
- Use DMA_MAPPING_ERROR instead of a private DMA_ADDR_INVALID.
- Remove the U-Boot-derived VBUS cable-detect routine, the VBUS-detect
  kthread and its wait queue, dead defines and struct fields, the unused
  interrupt-register-array macros, the mdelay()-based reset delays and the
  bulk of the dev_dbg() tracing.
- Implement the pullup(is_on == 0) path and route suspend/shutdown through
  pullup(0); mark crg_udc_ep_ops const and return IRQ_NONE from the shared
  IRQ handler when the interrupt is not ours.
- Use dev_err_probe() with structured goto-based unwinding in probe.
- Reword the Kconfig help text for USB_CRG_UDC to name the crg_udc module.
- Link to v1: https://lore.kernel.org/r/20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com

To: Prasad Bolisetty <pbolisetty@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
To: Karthikeyan Mitran <kmitran@axiado.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Petar Stepanovic <pstepanovic@axiado.com>
To: Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Petar Stepanovic (6):
      dt-bindings: usb: gadget: udc: add Axiado AX3000 and AX3005 UDC
      usb: gadget: udc: crg: Add hardware definitions and structs
      usb: gadget: udc: crg: Add ring and transfer management
      usb: gadget: udc: crg: Add endpoint 0 handling
      usb: gadget: udc: crg: Add gadget and endpoint operations
      usb: gadget: udc: crg: Add core driver and build integration

 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml |   69 +
 MAINTAINERS                                        |    9 +
 drivers/usb/gadget/udc/Kconfig                     |    2 +
 drivers/usb/gadget/udc/Makefile                    |    1 +
 drivers/usb/gadget/udc/crg/Kconfig                 |   16 +
 drivers/usb/gadget/udc/crg/Makefile                |    9 +
 drivers/usb/gadget/udc/crg/crg-udc-core.c          | 1376 +++++++++
 drivers/usb/gadget/udc/crg/crg-udc-debug.h         |  143 +
 drivers/usb/gadget/udc/crg/crg-udc-ep0.c           | 1264 ++++++++
 drivers/usb/gadget/udc/crg/crg-udc-gadget.c        | 3255 ++++++++++++++++++++
 drivers/usb/gadget/udc/crg/crg-udc-ring.c          |  696 +++++
 drivers/usb/gadget/udc/crg/crg-udc-trace.c         |    9 +
 drivers/usb/gadget/udc/crg/crg-udc-trace.h         |  164 +
 drivers/usb/gadget/udc/crg/crg-udc.h               |  910 ++++++
 14 files changed, 7923 insertions(+)
---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20260128-axiado-ax3000-usb-device-controller-156d3f1840c9

Best regards,
--  
Petar Stepanovic <pstepanovic@axiado.com>

