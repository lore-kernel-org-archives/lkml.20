Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793347821;
	b=E2glwakSOfX0ZFE2K3Sh9V0D8TtWVJOqLU0T9+EgU6Ur+76Akl/QLhkGItXYrUEfLV99
	 yZBEY4MOzwcH+zX19/oPA3k8+8C4wIHoZk7Om+b5Jz+SjhdGLLRUSmDPE+QEfYIPUSjr9
	 rJgUzktUK0kJl4yGv2cefzRK2KLnZR9BGRVD9a+UIb3WlW6SNRq4Cl4TRgdgd4P+Yxpa7
	 cu/15sLd4353j9ZTsRswQcZNYdCO/6TDTx0Iv9FaAUFYsZqULxaKYkwMtOzO2E1L+a/s1
	 neEMggWHAqLHXr3N/TVK8yPpfht59l0tVcaXNGnSz9CuLtXzAFOEDbO5SxPwBmlGXpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347821;
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
	bh=pLBLgF6Yc+TqXEbXDtq5ScQ72m8LwdtBk/aoTPSWlaA=;
	b=wOlNwckWoyTHckkgUzhoux5xuZ5OCPjjHz/XQsGxThe3uL0KKyic59/FOZg35DUzbhjO
	 L25Kecu5+rewuKqChdvXLmvOjPHkwJv1G+7tY7/Ym//q3v9IXJvds8RWjcBCdBLaKluJZ
	 vOUFL87217SDJpuKza/mQRmUBc1MvZUd3CsTUWdGk3RGVGLB5ZVWCQcXSrPUveqwGQIYT
	 oy1g2wKm5DzOesxCsYU/1fry7wWh0c5esTjFffdEfSMZFtZa9ySkYHOacGFfzDiK1f2TX
	 beT626RiJJcPOMvfow6wjOegTy1IbHLRmhsN0597BQFp57nHneL9yW20VenBUub9VvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b="tqy4H6/+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.129
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022129.outbound.protection.outlook.com [40.93.195.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D05606A31C;
	Fri, 30 Oct 2026 08:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=tqy4H6/+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQZPsBWE9O28XHykbjBqiyGYLNa6nyxcktw+FX2xiZnz351Yo8H7U8jUx5RSs/G0+vm7w5fh0aICxHtXVTvH1869uFAFkLoGFIGsKJv4y1WVZ2HG4SODkzMRIIrnA9HMyzn1EtiDG5kRoRPt1WADzFIppjSyGZFPGDsJvnDefFtU0gFgN/s1McUgaM+7gMe+AXnzP3PHmEmLqiB17owDp66e4S1HI6b786VCup2nF+A1wQgOgKX4d2RQMcgSDZidPXO1gaU8YQ9ndebhrDmsBe3ArezXKv9T2ZO1Z3JWhakoRV037JlpEnI1IWyz2sUaPdCLtIpWRkVzK0+cILrm2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLBLgF6Yc+TqXEbXDtq5ScQ72m8LwdtBk/aoTPSWlaA=;
 b=iHBKsgXcPHFtIZBU/1GXOOv7I3OuibDP+5fwRR3slM0uUYP5OiBTHGdTYARfs+0uEc1jMi2+D4CuNWDMhVRrGrF7GtgfE8IVy5eWjbcMg/+Qu7AKf1S49aW7m2j9MkSq+GumXX1+PQfDbmGfZcAqbg6rmUHM69bPr+hoe9NF0kwY2573vc/Ml2M18fl6ICOBs6+0muNBn7TLi7p22WEkaAeu+w90GQTVOpTPpoRj/9QeNh7AYyWxd7elR3g+I1Fl7ipjPKZ9+cebqf0zscaA8UKqORiYWVFf5qNj6HVt4B2iSUsHZKzNskirW8qxJ1j4RPdilvpKWSkxFgJ0Aeg7GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLBLgF6Yc+TqXEbXDtq5ScQ72m8LwdtBk/aoTPSWlaA=;
 b=tqy4H6/+31X9JWX7rDYD6j1mwwut74l50i5sJMfH+sShfU4MlNRdtEdZ9vaV3uJBSCvLEnpg+A5lyQWdKBz4gQNpkTFPeawI+AvwhQXAV0YQE86oIDVA/bYTw6KCZFn/awqWnkYHimFD0ym0sYksaJ3wcexnQku71WSoYi5JSBWKfmD6KkYDF9MyOe+CAwTqDx9VAQ9xxINb+hJdIyaif6fgmcWtQ4/N8avgvoXdGA0Egjg1MaKYmf7nw5ijAW13jGZM7GWxONSx1kk9yCqG5nbEmM3ar6hYUWdsdK2b9xxX0/5y4GGz9x+CQz6sLAOCgFNXF/sVrXRRV6ptQUm9iQ==
Received: from BN0PR04CA0027.namprd04.prod.outlook.com (2603:10b6:408:ee::32)
 by DM4PR18MB4272.namprd18.prod.outlook.com (2603:10b6:5:397::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 08:10:15 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::a4) by BN0PR04CA0027.outlook.office365.com
 (2603:10b6:408:ee::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 08:10:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 08:10:15 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 973854186B53;
	Fri, 30 Oct 2026 01:10:14 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH v4 0/6] Axiado AX3000 and AX3005 USB Device Controller
 (UDC)
Date: Fri, 30 Oct 2026 01:10:08 -0700
Message-Id: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
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
X-B4-Tracking: v=1; b=H4sIAOFQ5GoC/43Q0QrCIBQG4FcJrzOOupZ11XtEF06PJdQMXWMx9
 u6dbVBEN7tRfuF8/8GeZUwBMzusepawDTnEmkKxXjF7NfUFeXCUmQRZgpCamy4YF+lSAMCfueK
 OxixyG+smxdsNExfb0ikvdAF2z0h6JPShm1pOZ8rXkJuYXlNpK8bX2adjkd8KDrzYWgSjKxCFP
 85TGxvvbCxo5RfVYrcMlYQCelDKOTCl/kPVBxW06jJUEaro49B6C2avftBhGN4N8uSpgQEAAA=
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793347814; l=13550;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=e4LuPOpGBY322MhLX6IG2z6TesTl3GB8gh+FFzVCeRM=;
 b=5mUULTgHhBswbLr20oMb/RdQ0au1Fikv7ea6Bf4TOOoBQtBHk1HHyaUxO+IKzv271sZHk9SzP
 odUQDwzAoXVB2CeFuo/SOn4Yb+v77oUYWL/dqTbl1S2AgnnjP8Ff0vu
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|DM4PR18MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e608b1-369a-4e6b-78f2-08df365d3adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|34020700016|82310400026|36860700016|5023799004|56012099006|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	lg8wcIl48DRpXtg6E+PkzzpeQC3pESu2YhIIzQCn1bhum6wMATsJ9dsH7gt9A9upOgxdrZ6M2bCLAUOg2TU7BGIHruUE1cH5OXlMpmqaFfuHt/us6hKOPxOAs9mYyBu6Dychlocrb8HFbrAfA3+57kAbM4dl1VZc9gMhjH4Q62ub4nlR6tMGTD+lry6tn83v0QknCQvqTUZQRKdhR2jJ1cbq1F+l56QOPwMAwZ1mHRch/10bNGWUiFKdxPbs1dljtVdVhTwt2lSza3BwT/fX81vkAWB7chcy7/Z2tnvmkPqsjiUWPw+TESlHJIEHg/z6+sN8kda5gY9ek2o3Ym43qUvuYwf8+EwV0NJnLQc7Y3y23gqt6vIyuEfkDUUYwr9Ff9c9cIkQ7xKr8gugnVCM54JR7XNOYTsJwrPCroMLjN0HbEUOCWXRvRoZw6ydiU4hD41b5Oy+YRj+ZZI39A3zv6HjTAvz7c+5c1MvgQmfj2pABlk/WlFyvFtNFo0CkFk5IOmkG2YobQc4yiHjYT50phUlCM6eh3T/tTTdT/v5ElAo9x/bwx/RL+VcGlTT0kbFyD76ICm9HYv3nFmEjdGCYHtrCTsiI48zXLxWnKCKkbmxFYylyPZtYu0v3pbo1uSHT7vckKsaaZeCnFEdO53Vng==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(34020700016)(82310400026)(36860700016)(5023799004)(56012099006)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	izlFrNCuXb90dfgze8M9dyMb1y22ON1yk2KvuSLgaseSJ29GCyIjJXVk9xJZ3CjIOSrFV0peHAZw3nddcHVtataX3LYMVNqaX1YLEjHQP5useJd5uPvOSrCecSQo0xb0ddTPWINqiAcrnJ2CRP4gzd0QQ7U/085GdDXR/el4aAry4ZtsvrnDXT4Vo26DGDm1YO3VZp1iVA9drNk402uswtB7FkRbt86Nv+Mc9/51mo1Sj6UGJGjwoFJeZcpfo1kh5WjsPqZLMINzS9/XJzz4n0c3wMFL7Flqe2Yx1Vkv+9RJsaUeCtOmEbyQYNuPD4oicEkVxRWnv4vgQMAABgn2qCYA9zmSSCWljMCBENmv/YkWL/g6XwYNCawzYgpa8IMZp6ZUqn3QB4Z95018dAXu17OXcI8hsHwJL3oa0/HV7c3TZOy7OIcDbjAs+AWxAH5k
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:10:15.5807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e608b1-369a-4e6b-78f2-08df365d3adf
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB4272

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
 drivers/usb/gadget/udc/crg/crg-udc-core.c          |  723 ++++++
 drivers/usb/gadget/udc/crg/crg-udc-debug.h         |  143 ++
 drivers/usb/gadget/udc/crg/crg-udc-ep0.c           | 1133 ++++++++++
 drivers/usb/gadget/udc/crg/crg-udc-gadget.c        | 2377 ++++++++++++++++++++
 drivers/usb/gadget/udc/crg/crg-udc-ring.c          |  668 ++++++
 drivers/usb/gadget/udc/crg/crg-udc-trace.c         |    9 +
 drivers/usb/gadget/udc/crg/crg-udc-trace.h         |  164 ++
 drivers/usb/gadget/udc/crg/crg-udc.h               |  729 ++++++
 14 files changed, 6052 insertions(+)
---
base-commit: 870dd89bff3d3b706bfce9ff708b826408b789a9
change-id: 20260128-axiado-ax3000-usb-device-controller-156d3f1840c9

Best regards,
--  
Petar Stepanovic <pstepanovic@axiado.com>

