Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792480747;
	b=X46fqwp26hesKwfFNr4WS+1QqufA7af2s3lOdFYQHRCbTRJoiTl5GoROe+DjJPvML6Ol
	 RaMNG3d9448Lul30SuZApNKx7jSKlaAxroYrvWjr3kNKG7561Jmw/647uBmOf15guxvYy
	 ma5434/TdGZO43+L2nVvptO3+rZG5uV7cifVWMaOtpECV/b/u4RXaUeu9CgdYJDKjjwG6
	 47uxvYlX61JE/Ne5QhInom64n7OY8uj6L3YZHJ480zBa6Cxc8YfCXsvFGAcj6WM4VLmot
	 VWjeKivMr0IizOqNgoPBN/2T8298+fez6nSvZnJ2dusTXqIvw/Vr7chhwwX/Sg5PJHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480747;
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
	bh=CRWNYhy4sBin3TMDb66I++HQYMx/Ja5ogTDlYSfeic8=;
	b=QWeOyVFCIxhlsoeTRz/bgCG+VhvmNTa9FAD56GJkBrA0rBBFSm0VejYg1lHTKIpr29El
	 pmeV+gCNwEpvNTjrEPru5mA7Wpk8aaoVdT2Wvp9P0SAwA3XBy0KREvUvpj1OnZss0RvMj
	 1QTcmcy8JLIbfVylWev0hUzqdxJAr9Sy0BZ/KuRrKQIPRg5fjH1L2RVIjw/dENbeytH85
	 qGWMD/1vKZXSvF1GzvIYBag6Xqhp6y0Nh1fzu6fdtAmhNzMILsB9Sd3nXDqG75egxEjZ5
	 RW+GFT3QnJkbFiIZKE1QG0GQJoKAzo4lJHt9C3NXGSnTAbcHj2uP217ZmPnS4Izxq7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=n62A+TzE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.136
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11022136.outbound.protection.outlook.com [52.101.48.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C722606A31B;
	Tue, 20 Oct 2026 07:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C722606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=n62A+TzE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3QC6nePTyHY6id/Li3i065i20rK5Gv5LvVmj+tO9UWTmZuVd6S7dB5ohhO0suoDlQJFyrzgb5GM5scjXuA5nch8FbtjGZccw8Neva4lFTn/9ZCVjuu5PAWykTZcjQEnFblKT1FEWSWKk2vrljLYDGDMIDt2J8txTMtywI9rouhjiban8Z3o1ej/AHVC+yBrZTEzOBDEC377+XihsuNg0MXnSlZ4D9Y70GkScT00cu5oiP51RW2bcNAZyW8MDVCA4rW3QFdYb22STN9WeI5CtUFz6g5cyN3chW6rm5/MRheokidOgodfoUlgDXWQBFwPr3/HA+emwYIODsM8EBmFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRWNYhy4sBin3TMDb66I++HQYMx/Ja5ogTDlYSfeic8=;
 b=H5RPMcp8fy/4cmdif17P71SGwKf3YeYvGHNQzpOlZrMo5UEEs2PCd2K0MSySiB8eG/JGVba6zRBV53xs0hkVuvQAnfqZbVt49foPq7YEpOb0xy50b1WVozxq5ajbNQ7b0oQFT1U4PBkE7sk2k0ATUr/69OP4oUurQIqzSk6JjA2rMeNEN9q3DroN11ouLljvV/hOHkpJwuPNu64scrN8zCBD2HmNm+QRw2tciwLp4IzEzhMegEimp+w6EQOAZuN73w9Ng0JOHvRLboeaX1vYNmbDE3Xb+lOJ1bonSnnxir+3Q9/JW2QWimvWuYlcVPnYG5H6/hctRPGMi/Z2UCw8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRWNYhy4sBin3TMDb66I++HQYMx/Ja5ogTDlYSfeic8=;
 b=n62A+TzETsTI5F4T4R3gd8JEVNEoi1+oTuRrkaKruOP0cVEmcEXVMaUidrZWnJ+SZ1X+YITYCgrF5/oQW+O3lou/b59F2p2zfVJ/WArUVhZ+Yd+6Io6ft84ePp7Vk6Y4cGvcfyZBiW7E6RsTYgj4ibgiH/0XI6FxOBRrMj3om78lZmK9pAJJWryh1v5StiBijfRAWBQB8X7gCOyZAyozkCKr9zd75jkchkHvZyQWESIRV7xzXQtmZkaDRscTVoZZnsMbCpddQundUYgkvAzF+nLUe/uxQr/m7l3rbKwp4hikgoTppHOa5XBl40GXzNheNo6AtYb9sYJzVlyof413tw==
Received: from CH0PR03CA0094.namprd03.prod.outlook.com (2603:10b6:610:cd::9)
 by PH3PPFF5A0A3DFC.namprd18.prod.outlook.com (2603:10b6:518:1::cd1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 07:19:01 +0000
Received: from CH7PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:cd:cafe::59) by CH0PR03CA0094.outlook.office365.com
 (2603:10b6:610:cd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 07:19:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH7PEPF00000016.mail.protection.outlook.com (10.167.244.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Tue, 20 Oct 2026 07:19:00 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id EDC2C4186B52;
	Tue, 20 Oct 2026 00:18:59 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH v3 0/6] Axiado AX3000 and AX3005 USB Device Controller
 (UDC)
Date: Tue, 20 Oct 2026 00:18:54 -0700
Message-Id: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
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
X-B4-Tracking: v=1; b=H4sIAN4V12oC/43NQQ6CMBAF0KuQrq2ZtoDVlfcwLko7lSZITYsNh
 nB3CyyMOzYz+ZPM+xOJGBxGcikmEjC56HyfgzgURLeqfyB1JmfCgdfAuKRqdMr4vAQA0HdsqMl
 vGqn2/RB812GgrKqNsEyWoM8kS6+A1o1ry+2ec+vi4MNnLU1suW5+Hrv8xCjQstIISjbASnvdv
 o7aP8lSkPgPley0D+UZBbQghDGgavmHzvP8BTz2YdMsAQAA
X-Change-ID: 20260128-axiado-ax3000-usb-device-controller-156d3f1840c9
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792480739; l=10812;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=pat6YYyYEaJGrbRDffVConvoER8b2xtyqeBt4O0PAec=;
 b=Fd27CWIua2hEYsKuE4InkyHcqikNpk21W/+uie7cFkHsyqE/C47ficW92vXRDaKJqZvM/u5o2
 28xUT00h9EkB9WF4wfTqkqiIZb0EW188/n3nuSugrTuujf4ExNLcomG
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000016:EE_|PH3PPFF5A0A3DFC:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bebe8e6-1c91-4ce9-ddc7-08df2e7a6a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|13003099007|5023799004|56012099006|261009223327099003|261009221727099003|261009220027099003|261009221227099003|261009223027099003|10067099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	j0plJBiwgPy1yYjZQW3wCReQFz1ENAXPmP6E4veviHVV+ETc5IRHREy/B+huEUdHrMdDZHEQsrR5MYYsOQuuSWq+GAc49RQLlH2+vMdggHjzRalzLFyk6+IaXEPManKnSOHox+xUrDt+2qWmJDP1qzRvr9NWSt3zkYVNFlu3oNYPicHl7w7tA13JphfruOufC3Q/J2PLwjiNrqyfsNjkxUxzOAfffuQBoVTG8Q2KvMdlQH2v6E/yEzaQ6Xkk5uf1asgZ6yn7hliWXqWqxx2J4FTAxOpYrGeMNnyu64vL79ZD7HUJdg1ssIyytvX5DGNV36eleiWT1VIj7qKlcGkui9HB0PhdXFC8DmLjO9tPk+Xw44UmNIpdmYO6EdcqT3oBywPx00OCITd9a9f6zW0MVlML+vPubXcWtzYw1JwD+JtlR2ESPrmuaXtap2p9mG23fddkxqFYLWenGeE7y7qhR/pvku8uMn0Ihug48fHaKp/KhCa54LoBlRi2sbKc/sCIA1GYoZZ0lrFi2GoVTmLMl0GorUcwMfpSx6cedFAh+2Nc7Whrs+eopycA50JPIzZBZIjLGM6E6y827cLsODGEgRJiiEbHfIxVBCpKa84OhzuJQRjknf0jSIGBVpr6AI1ZVnzoojuLdTA5oiV4lFviOQ==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(13003099007)(5023799004)(56012099006)(261009223327099003)(261009221727099003)(261009220027099003)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m3HqFS0Owqb2IJfcuAAJqUUP0CQuxwT6TSviyzIwUEdfA/PxFNr5OvR70oGO+hTUW3TN4VMF7WsBNk8E+JNvCgfSz4BpXCFLktpjiriAPJu9pylfC/otKpYFGogxp+ajz0FeWT5QYvf0AlUzNWHTat6tNkUIXL4Qo4k4eB1621quHnL1kT9pJESUz8AiGAcuHPAc2XynZkr3FlLeRzlrP260Kbl1lLTvbgsaGoztzf6Edt+uMCkUUcafpSSZFGqip+5UBkkjxcKKLoF0wkyX/xqWyXxzhJtBhdWhXvvR6/sbS+zHuRLmBw5R3zqHdyFHiNB7abkaq4cPAdZsf91ZTCe3fOBxmQUO5wDqZpMW7Kolng5gCFTc6+HNAzhm2yo1JcJb88O0n8LJcuYejpIzRUSTi3gm3SmCk/GCMY0FQi09FyEHiNFVW1lV3cvcvYgL
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 07:19:00.6864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bebe8e6-1c91-4ce9-ddc7-08df2e7a6a1c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF5A0A3DFC

Dear maintainers,

This series continues the work of adding support for the USB device
controller (UDC) integrated into the Axiado AX3000 and AX3005 SoCs.

The controller is based on the Corigine USB 3.1 IP core, which is
dual-role capable (device and host) at the hardware level. Which role
is active depends on which driver is bound to it: this series binds
it in device role, while host role would instead use a standard xHCI
host driver - the hardware itself does not fix the role. Endpoint 0
shares the same command-ring / event-ring / per-endpoint transfer-ring
TRB hardware as every other endpoint, so the driver tracks control
transfer stages (SETUP/DATA/STATUS) explicitly instead of relying on a
dedicated hardware FIFO. Other upstream TRB/ring based UDC drivers,
such as cdns2 (whose file layout this series' structure is now modeled
on), share this same shape for the same reason.

Since v2, the driver has been restructured to follow the file layout
and conventions of drivers/usb/gadget/udc/cdns2, split into
core/gadget/ep0/ring source files with ftrace tracepoint support, and
brought in line with cdns2's static/global function ratio. See the
detailed changelog below.

The devicetree binding also picks up one item left over from the v2
review: the description now notes the underlying core is dual-role
capable (device and host), used here in device role.

Tested on an Axiado AX3005 EVK with a mass-storage + composite HID
(keyboard/mouse) gadget, including repeated bind/unbind/rebind cycles
and host-driven bus resets.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
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

To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
To: Karthikeyan Mitran <kmitran@axiado.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Petar Stepanovic <pstepanovic@axiado.com>
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
 drivers/usb/gadget/udc/crg/crg-udc-core.c          |  706 ++++++
 drivers/usb/gadget/udc/crg/crg-udc-debug.h         |  143 ++
 drivers/usb/gadget/udc/crg/crg-udc-ep0.c           | 1106 ++++++++++
 drivers/usb/gadget/udc/crg/crg-udc-gadget.c        | 2299 ++++++++++++++++++++
 drivers/usb/gadget/udc/crg/crg-udc-ring.c          |  664 ++++++
 drivers/usb/gadget/udc/crg/crg-udc-trace.c         |    9 +
 drivers/usb/gadget/udc/crg/crg-udc-trace.h         |  164 ++
 drivers/usb/gadget/udc/crg/crg-udc.h               |  722 ++++++
 14 files changed, 5919 insertions(+)
---
base-commit: c68641afacd9ea5707a489b30f204d5e89b324e0
change-id: 20260128-axiado-ax3000-usb-device-controller-156d3f1840c9

Best regards,
--  
Petar Stepanovic <pstepanovic@axiado.com>

