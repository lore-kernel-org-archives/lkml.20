Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.125
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792480748;
	b=bYROqRveAyD3xANtCKdW9hoXuddxHBVloIrv8q5KiPVDTVTsMeozeb5O3aVxyEmimfYE
	 APIruqgV7AT04HPU4Ts3bM5NC13C2JPCsdmnEr9Om9lge1/k3tRQiPxxVFPJm1jh14K/A
	 2FBrLXBwiNLeN64MtIGdYMGMhMN+0FMwMZwSmhiiGOnh2Tlk/LcXNVqf4YNrMZCor6gUU
	 53q6sKnX7nQsukiWjupU9t7bRR0ioWCcrpGpK1sxd1ziYR+2AJeA033KHCw8WQ7QS9HvF
	 yUKA4zBI1RzFnFf63sNzMETY52I1EL1lk2ysX+0J1qBfaUxid7Cj80Z/2yfSBJ/+N2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480748;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
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
	bh=u6Xl0DxAwZRUx0Loyq/GQSvzlYHrjDCb2aEX3ISwTEs=;
	b=KffT7K02RuNiT6Kqw1RifW3aTYTZWL8tTkSPjmusDDw5tmd4ZT0H+jUNMkeBbnprf50F
	 4jgB2MlG59dOlLRazUbT6ua/VzXGkZFggzwIV2I5M4uLDMtIu7hxegc5tKaL9XnrDIaZl
	 0cbJTUqEtukCpHJGeJCQrzgH2ccTX7SklFZfxwuMqhcqza4alYwqR2cbiHOxkchMKffD7
	 r2gJnHbpG3vbKCPMwTU5vFaiY2yI/1R3TLYjnmZVAPzMdx7kXqYvAAx6PF157vXI+Ztn8
	 AN/22PTt+9vV+KxjbfP+9tErFIRdkvRRTDrQFvYoIYKbByRtJbQk/LCeAnOepaca2Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=QFMc9qJb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.125
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11022125.outbound.protection.outlook.com [40.107.200.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DC7606A31D;
	Tue, 20 Oct 2026 07:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DC7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=QFMc9qJb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tu4ZUq8E9JjiK3ZCxoGFbYn+RcsTaez6aaQhpOK0mkO25iOPEcvspK+W2IQlacZz9W+odPVPL/F6PRN9Z3tMGOd1FzBwpMUXOtLfcT/qVEo3/+ciA+WXOAl5eq0t624qELj5PnMJz8LiC8BuIF4tYx1AF5yifhVEUBmxE1ypcC/+Bnal0Ie5Esj3lIEQghsKFVIKDjBEq27Bl5fnKNfTsYFAeegQOJ4qwULPN0+Yh7F1xXcZiI8iAgP0xgkecAvl4wLzQy6bzJTyPubOrVZ6Y/+hjCX8De6bpqrliQlgex+IjRalRI/axSw25qL6vAcRDiW/jDTZ4a5SDbJ08a+irA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6Xl0DxAwZRUx0Loyq/GQSvzlYHrjDCb2aEX3ISwTEs=;
 b=ErR0Q8xdL9MQbayBP9igDM2f4eO5sbvxwYrTosH0zy0sEx5DR52HDldpi4r6vC3jbioD65Y2IM3ISvkFIUX4OY3j6aXxindP+Xl/0IeK23x8wiU0E6uxXRGRY7eKNfy7ou3q9wpXWUN7ef6vikSTZuGPuLOQ01t5O0mXlFgvQ51koKrw5Tg/Cmh/enxcydqZ++6LxDmOBvMemcIBiMFeqokFyreHmj5PKx9Izz1o1/HB4ej0hSTGFebqY4hNdFFzns3OYU7ExvFf75kBJ3EgCWEyox4x4TP3M2WIUZxKXjX7byTXV5qvBFJxcrfZ77kVIKBCM3zYO5p9dAgEBQ3zow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6Xl0DxAwZRUx0Loyq/GQSvzlYHrjDCb2aEX3ISwTEs=;
 b=QFMc9qJbyLrrL1hRm1VOHW3b2DTiiP3dA7eltGzR7L+gKAJlKzx/B4zrPhdsZ1HwJUTy2+6Pl9TjHU/xLle1ZvveesOM4A2DhwW2JWDi2sVPy5F1p4JI6lQrd/XQW0yzP0J8+VDNHvnbtw1LDXaU0SYnkuRVXZpAhqyRDVJUGK4fJpDY8JlGoK73PThr8sXD1Xm+FFjnf2qkaOl95uSQ8YzeDe2vEIZmwDWrO2xIK8v0XfiD5yp/liJyTMYnpe13vxSfZTuM6nylHFFHlWX1jsr2p6EneHVw6aKjTHgDmWmZn8xzjZpEYdfCmPd01YOksjpcvoXwPbJwnMM9OMxb9Q==
Received: from DS7P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::15) by
 SACPR18MB259539.namprd18.prod.outlook.com (2603:10b6:806:546::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 07:19:01 +0000
Received: from CY4PEPF000392D8.namprd03.prod.outlook.com
 (2603:10b6:8:1ca:cafe::2d) by DS7P220CA0008.outlook.office365.com
 (2603:10b6:8:1ca::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 07:19:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CY4PEPF000392D8.mail.protection.outlook.com (10.167.247.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Tue, 20 Oct 2026 07:19:01 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 93FBA40BFE0E;
	Tue, 20 Oct 2026 00:19:00 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 20 Oct 2026 00:18:58 -0700
Subject: [PATCH v3 4/6] usb: gadget: udc: crg: Add endpoint 0 handling
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
Message-Id: <20261020-axiado-ax3000-usb-device-controller-v3-4-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792480739; l=34751;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=iCOXJH599YS88Y9x13BiZec+TkMt4ZeUzRO19Yx6GwU=;
 b=7fPlIz6rS8ZVvlReIpcv/z5Mn5eNKw3p7RPBtgI2c76X++7A8D8qSUdYlZIeeCixjBLf7A7uQ
 qUF8FVyJeGsAlFk/AuwQDLEe/vBLB/pFXvetMKQ1Zaaf8okTB0P11de
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D8:EE_|SACPR18MB259539:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f540d1f-f5bf-4baf-26d2-08df2e7a6a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|23010399003|6133799003|18002099003|22082099003|10067099003|261009220027099003|261009221727099003|261009223327099003|261009223027099003|5023799004|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	K5CPdGKpciKvmTfIywDTSVo1mZERt785a+Gts2gXk92oZBkl2ulsac+SGnRaNZGEO7DWwAzmC2RgY6Wc3Cq16hhP3vX8TiAkjBDs3YfXlELetC+fOfF4SrEoEuJlkEuKmgWJ/yhW0ilIFOHxzTQzFtVGmzr1O4o72X1e0TtMy9wM/S9ts26H7iaUM8XIlOndkaXouTWKxlD3MfLYscYGs58xcgTGZ9l6FqlrW/xTUkUmGNsM8cIyEHk9z2Hh9NE3C1/J0t6sxPMzk7HuP7GFAGBO1FEG180WzZFwq2LoBrSg2PC4O747NGYLT255kIZXoXtwcnvc+lTpzYvJE1nJ+jZ9K7c/Sdf9xU65as75pR882lRIjcmps7+UHONom7rCz286A8WebrcfPEqML4+7FrLfnclxunoETl+n65X0OJuqY5P4CU6Da9A4GAkBvedxd+Zvc3v09mCOJ3TIwO3c7dN2BoD6reGDzm0Qm+tfvzGB8rEo7G5jLw9g63pjlx48Kw4tijfWnas+2O4hPOw5lTzny5Hrm3aKi9k2b5i4gvj8xX0qai49jzmP9AuOGK9049ME6NGLuUfnaz+b2QJnq5o6N/drX4h08o8KwMZzZlySLWMM6nfWkQ0fJTQ9zNYmO2DwcgsXDfime3ZqpOos4NCVMLv7tb9CQKQsFs1b9fCnaq2XF4d5NgrtvraXCCROOszzdrWdqBEaH0P//gur8Q==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(261009220027099003)(261009221727099003)(261009223327099003)(261009223027099003)(5023799004)(261009221227099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8iht6k1Rf7E1eSFZnzZzFlvpGfhpTeuCXfKs1TDpruhlf/uE8PKzxdU45Y/D+G8370hksCubq5fo8gvsWM+s6qnrx0PCBXj3Ytehfqbw7Ge00BDlmjFKQpjGgMdjtuqWgnumH2W2QO3vTVp+PIjr+tezi6YJE2vTKEgcKdlYIbW99DSieycK9rpsvAhtaJFhbtpyt1PBWSnX295S6owT/C7CWpluG/R6q8KRecskqM6xcrmtKBjtq6pvSdvGMwivjVyIVz0iMaW/8R7mfuTohH9QMDZk0D4pkTanEvnuLxgKCUdIxkXFWm1PNWMkfGEEjw7BmCyxppKRappr1hWV3MBrJ7BPGWpEWxt6MMJFy06EBV8SZncADvGz1fNymUl+eSZIWtKAkofGSUWnO4EdspGpGTjzrXNsUKSuxanFoMbOIfRdlHQkc1b/hFsUZlP/
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 07:19:01.2111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f540d1f-f5bf-4baf-26d2-08df2e7a6a43
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF000392D8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SACPR18MB259539

This patch adds the endpoint 0 setup packet, status, and control
transfer handling for the Axiado AX3000/AX3005 UDC.

Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 drivers/usb/gadget/udc/crg/crg-udc-ep0.c | 1106 ++++++++++++++++++++++++++++++
 1 file changed, 1106 insertions(+)

diff --git a/drivers/usb/gadget/udc/crg/crg-udc-ep0.c b/drivers/usb/gadget/udc/crg/crg-udc-ep0.c
new file mode 100644
index 000000000000..dce36d23d3ec
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-ep0.c
@@ -0,0 +1,1106 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ *
+ * Copyright (c) 2019 Corigine Inc.
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+#include <linux/iopoll.h>
+
+#include "crg-udc.h"
+#include "crg-udc-trace.h"
+
+static void enable_setup_event(struct crg_gadget_dev *crg_udc);
+
+void crg_udc_build_ep0_status(struct crg_udc_ep *udc_ep_ptr, bool default_value,
+			      u32 status, struct crg_udc_request *udc_req_ptr,
+			      u8 set_addr, u8 stall)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	struct crg_transfer_trb *enq_pt = udc_ep_ptr->enq_pt;
+
+	if (default_value) {
+		udc_req_ptr = crg_udc->status_req;
+		udc_req_ptr->usb_req.length = 0;
+		udc_req_ptr->usb_req.status = status;
+		udc_req_ptr->usb_req.actual = 0;
+		udc_req_ptr->usb_req.complete = NULL;
+	} else {
+		udc_req_ptr->usb_req.status = status;
+		udc_req_ptr->usb_req.actual = 0;
+	}
+
+	crg_udc_setup_status_trb(crg_udc, enq_pt, &udc_req_ptr->usb_req,
+				 udc_ep_ptr->pcs, set_addr, stall);
+
+	enq_pt++;
+
+	/* check if we are at end of trb segment.  If so, update
+	 * pcs and enq for next segment
+	 */
+	if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(enq_pt->dw3)) ==
+	    TRB_TYPE_LINK) {
+		if (FIELD_GET(TRB_LINK_TOGGLE_CYCLE_MASK,
+			      le32_to_cpu(enq_pt->dw3))) {
+			dma_wmb();
+			le32p_replace_bits(&enq_pt->dw3, udc_ep_ptr->pcs,
+					   TRB_CYCLE_BIT_MASK);
+			udc_ep_ptr->pcs ^= 0x1;
+		}
+		enq_pt = udc_ep_ptr->first_trb;
+	}
+	udc_ep_ptr->enq_pt = enq_pt;
+
+	crg_udc_knock_doorbell(crg_udc, 0);
+
+	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+}
+
+/*
+ * Abort the current EP0 control transfer when a new SETUP packet arrives.
+ *
+ * A SETUP packet is allowed to abort any in-progress control transfer. Do
+ * not defer the new SETUP until the old transfer completes: doing so leaves
+ * the old request on the EP0 software queue and subsequent gadget requests
+ * are rejected as "queue not empty".
+ *
+ * The controller's EP0 ring is reinitialized at the ring start, making all
+ * TRBs belonging to the aborted control transfer stale. The new SETUP is
+ * then handled immediately with a fresh setup tag.
+ */
+int crg_udc_abort_ep0_for_setup(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep0 = &crg_udc->udc_ep[0];
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	dma_addr_t dqptaddr;
+	u32 cmd_param0;
+	u32 cmd_param1;
+	u32 tmp;
+	int ret;
+
+	/*
+	 * A new SETUP is allowed to abort the current control transfer.
+	 * Keep EP0 in ABORTING for the complete stop/nuke/reinitialize
+	 * sequence. crg_udc_req_done() drops udc_lock while invoking the gadget
+	 * callback, so the callback may re-enter the UDC during the nuke.
+	 */
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	crg_udc->ep0_state = EP0_STATE_ABORTING;
+
+	/*
+	 * Stop EP0 before touching the transfer ring. The controller may still
+	 * own the old TRBs even when no EP0 request is running from the gadget's
+	 * point of view. Do not clear the DMA-visible ring until the hardware
+	 * reports that EP0 is no longer running.
+	 */
+	ret = crg_udc_issue_command(crg_udc, CRG_CMD_STOP_EP, BIT(0), 0);
+	if (ret) {
+		dev_err(crg_udc->dev,
+			"failed to stop EP0 for SETUP abort: %d\n", ret);
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return ret;
+	}
+
+	ret = readl_poll_timeout_atomic(&uccr->ep_running, tmp, !(tmp & BIT(0)),
+					10, 10000);
+	if (ret) {
+		dev_err(crg_udc->dev, "timeout stopping EP0 for SETUP abort\n");
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return ret;
+	}
+
+	udc_ep0->ep_state = EP_STATE_STOPPED;
+	/* Complete requests belonging to the aborted control transfer. */
+	crg_udc_ep_nuke(udc_ep0, -ECONNRESET);
+
+	if (!udc_ep0->first_trb || !udc_ep0->tran_ring_info.cpu_addr) {
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return -ENODEV;
+	}
+
+	/*
+	 * The controller has stopped consuming EP0 TRBs. It is now safe to
+	 * discard the old transfer descriptors and restart the ring from its
+	 * beginning. No ring memory is freed here.
+	 */
+	memset(udc_ep0->first_trb, 0, udc_ep0->tran_ring_info.len);
+	udc_ep0->enq_pt = udc_ep0->first_trb;
+	udc_ep0->deq_pt = udc_ep0->first_trb;
+	udc_ep0->pcs = 1;
+	udc_ep0->tran_ring_full = false;
+	crg_udc_setup_link_trb(udc_ep0->last_trb, true,
+			       udc_ep0->tran_ring_info.dma_addr);
+
+	/* Make the new ring contents visible before handing the ring to HW. */
+	dma_wmb();
+
+	dqptaddr = crg_udc_tran_trb_virt_to_dma(udc_ep0, udc_ep0->first_trb);
+	if (dma_mapping_error(crg_udc->dev, dqptaddr)) {
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return -EIO;
+	}
+
+	cmd_param0 = (lower_32_bits(dqptaddr) & CRG_CMD0_0_DQPTRLO_MASK) |
+		     FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep0->pcs);
+	cmd_param1 = upper_32_bits(dqptaddr);
+
+	ret = crg_udc_issue_command(crg_udc, CRG_CMD_INIT_EP0, cmd_param0,
+				    cmd_param1);
+	if (ret) {
+		dev_err(crg_udc->dev,
+			"failed to reinitialize EP0 for SETUP: %d\n", ret);
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return ret;
+	}
+
+	udc_ep0->ep_state = EP_STATE_RUNNING;
+	crg_udc->ep0_state = EP0_STATE_IDLE;
+	return 0;
+}
+
+int crg_udc_enable_setup(struct crg_gadget_dev *crg_udc)
+{
+	enable_setup_event(crg_udc);
+	crg_udc->device_state = USB_STATE_DEFAULT;
+	usb_gadget_set_state(&crg_udc->gadget, USB_STATE_DEFAULT);
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+
+	return 0;
+}
+
+static void enable_setup_event(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 val;
+
+	val = readl(&uccr->config1);
+	val |= CRG_U3DC_CFG1_SETUP_EVENT_EN;
+	writel(val, &uccr->config1);
+}
+
+void crg_udc_ep0_req_complete(struct crg_udc_ep *udc_ep_ptr,
+			      unsigned long *flags)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+
+	switch (crg_udc->setup_status) {
+	case DATA_STAGE_XFER:
+		crg_udc->setup_status = STATUS_STAGE_RECV;
+		crg_udc_build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL,
+					 0, 0);
+		break;
+	case DATA_STAGE_RECV:
+		crg_udc->setup_status = STATUS_STAGE_XFER;
+		crg_udc_build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL,
+					 0, 0);
+		break;
+	default:
+		if (crg_udc->setup_fn_call_back) {
+			crg_udc->setup_fn_call_back(crg_udc);
+			crg_udc->setup_fn_call_back = NULL;
+		}
+		crg_udc->setup_status = WAIT_FOR_SETUP;
+		break;
+	}
+}
+
+static void get_status_cmpl(struct usb_ep *ep, struct usb_request *req)
+{
+	struct crg_udc_ep *udc_ep = container_of(ep, struct crg_udc_ep, usb_ep);
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+	unsigned long flags;
+
+	kfree(req->buf);
+	req->buf = NULL;
+
+	/*
+	 * A non-zero status means this request was completed early (e.g.
+	 * crg_udc_ep_nuke(..., -ECONNRESET) from crg_udc_abort_ep0_for_setup()
+	 * for a new SETUP). EP0 is being reinitialized for that new control
+	 * transfer; queuing a status stage here would race with it.
+	 */
+	if (req->status)
+		return;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc->setup_status = STATUS_STAGE_RECV;
+	crg_udc_build_ep0_status(udc_ep, true, -EINPROGRESS, NULL, 0, 0);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+}
+
+static void getstatusrequest(struct crg_gadget_dev *crg_udc, u8 request_type,
+			     u16 value, u16 index, u16 length)
+{
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	struct crg_udc_request *udc_req_ptr = crg_udc->status_req;
+	u16 status_val = 0;
+	u32 dci;
+	int ret;
+
+	if (!udc_req_ptr || !list_empty(&udc_req_ptr->queue) || value ||
+	    length != sizeof(u16)) {
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+
+	switch (request_type & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		if (index)
+			goto invalid;
+		if (crg_udc->gadget.speed == USB_SPEED_HIGH ||
+		    crg_udc->gadget.speed == USB_SPEED_FULL) {
+			if (crg_udc->u2_rwe)
+				status_val |= BIT(USB_DEVICE_REMOTE_WAKEUP);
+		} else if (crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+			if (crg_udc->feature_u1_enable)
+				status_val |= BIT(USB_DEV_STAT_U1_ENABLED);
+			if (crg_udc->feature_u2_enable)
+				status_val |= BIT(USB_DEV_STAT_U2_ENABLED);
+		}
+		if (crg_udc->gadget.is_selfpowered)
+			status_val |= BIT(USB_DEVICE_SELF_POWERED);
+		break;
+
+	case USB_RECIP_INTERFACE:
+		if (crg_udc->device_state != USB_STATE_CONFIGURED ||
+		    (index & 0xff00))
+			goto invalid;
+		break;
+
+	case USB_RECIP_ENDPOINT:
+		if (index & ~(USB_ENDPOINT_NUMBER_MASK | USB_DIR_IN))
+			goto invalid;
+		dci = crg_udc_index2dci(index);
+		if (dci == 1 || dci >= CRG_NUM_EP_CX)
+			goto invalid;
+		if (crg_udc->device_state < USB_STATE_ADDRESS && dci != 0)
+			goto invalid;
+		if (crg_udc->device_state == USB_STATE_ADDRESS && dci != 0)
+			goto invalid;
+		if (crg_udc->device_state == USB_STATE_CONFIGURED &&
+		    crg_udc_get_ep_state(crg_udc, dci) == EP_STATE_DISABLED)
+			goto invalid;
+		if (crg_udc_get_ep_state(crg_udc, dci) == EP_STATE_HALTED)
+			status_val = BIT(USB_ENDPOINT_HALT);
+		break;
+
+	default:
+		goto invalid;
+	}
+
+	kfree(udc_req_ptr->usb_req.buf);
+
+	udc_req_ptr->usb_req.buf = kzalloc_obj(status_val, GFP_ATOMIC);
+	if (!udc_req_ptr->usb_req.buf)
+		goto invalid;
+
+	*(__le16 *)udc_req_ptr->usb_req.buf = cpu_to_le16(status_val);
+	udc_req_ptr->usb_req.length = sizeof(status_val);
+	udc_req_ptr->usb_req.status = -EINPROGRESS;
+	udc_req_ptr->usb_req.actual = 0;
+	udc_req_ptr->usb_req.complete = get_status_cmpl;
+
+	udc_req_ptr->map_dir = DMA_TO_DEVICE;
+	ret = usb_gadget_map_request_by_dev(crg_udc->dev, &udc_req_ptr->usb_req,
+					    true);
+	if (ret) {
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		goto invalid;
+	}
+
+	crg_udc->setup_status = DATA_STAGE_XFER;
+
+	ret = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+	if (ret) {
+		crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr);
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+	return;
+
+invalid:
+	crg_udc_set_ep0_halt(crg_udc);
+}
+
+int crg_udc_prepare_for_setup(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep0_ptr;
+
+	dma_addr_t dqptaddr;
+	u32 cmd_param0;
+	u32 cmd_param1;
+
+	if (!crg_udc_is_event_rings_empty(crg_udc) ||
+	    crg_udc->portsc_on_reconnecting == 1)
+		return -EBUSY;
+
+	udc_ep0_ptr = &crg_udc->udc_ep[0];
+	/* If we reinit ep0 on bus reset, we just make ep0 dequeue pointer
+	 * align with enqueue pointer, all remaining xfer trbs became dumb once
+	 * which will not produce xfer event anymore.
+	 *
+	 * If we considering the opposite solution, we should wait all ep0 xfer
+	 * trbs be completed(with some err complete code)
+	 */
+	if (crg_udc->reinit_ep0_on_bus_reset) {
+		/* Complete any reqs on EP0 queue */
+		crg_udc_ep_nuke(udc_ep0_ptr, -ESHUTDOWN);
+
+		/* context related ops */
+		dqptaddr = crg_udc_tran_trb_virt_to_dma(udc_ep0_ptr,
+							udc_ep0_ptr->enq_pt);
+		if (dma_mapping_error(crg_udc->dev, dqptaddr))
+			return -EIO;
+		cmd_param0 =
+			(lower_32_bits(dqptaddr) & CRG_CMD0_0_DQPTRLO_MASK) |
+			FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep0_ptr->pcs);
+		cmd_param1 = upper_32_bits(dqptaddr);
+		if (crg_udc_issue_command(crg_udc, CRG_CMD_INIT_EP0, cmd_param0,
+					  cmd_param1))
+			return -EIO;
+
+		udc_ep0_ptr->deq_pt = udc_ep0_ptr->enq_pt;
+		udc_ep0_ptr->tran_ring_full = false;
+	} else {
+		if (!list_empty(&udc_ep0_ptr->queue)) {
+			dev_err(crg_udc->dev,
+				"remaining ep0 xfer trbs on reset\n");
+			return -EBUSY;
+		}
+	}
+
+	crg_udc_enable_setup(crg_udc);
+
+	return 0;
+}
+
+static void set_address_cmpl(struct crg_gadget_dev *crg_udc)
+{
+	if (crg_udc->device_state == USB_STATE_DEFAULT &&
+	    crg_udc->dev_addr != 0) {
+		crg_udc->device_state = USB_STATE_ADDRESS;
+		usb_gadget_set_state(&crg_udc->gadget, USB_STATE_ADDRESS);
+	} else if (crg_udc->device_state == USB_STATE_ADDRESS) {
+		if (crg_udc->dev_addr == 0) {
+			crg_udc->device_state = USB_STATE_DEFAULT;
+			usb_gadget_set_state(&crg_udc->gadget,
+					     USB_STATE_DEFAULT);
+		}
+
+	}
+}
+
+int crg_udc_set_ep0_halt(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	enum crg_ep_state ep_state;
+
+	ep_state = crg_udc_get_ep_state(crg_udc, udc_ep_ptr->dci);
+	if (ep_state == EP_STATE_HALTED || ep_state == EP_STATE_DISABLED)
+		return 0;
+
+	crg_udc_build_ep0_status(udc_ep_ptr, true, -EINVAL, NULL, 0, 1);
+
+	udc_ep_ptr->ep_state = EP_STATE_HALTED;
+
+	return 0;
+}
+
+static void set_sel_cmpl(struct usb_ep *ep, struct usb_request *req)
+{
+	struct crg_udc_ep *udc_ep;
+	struct crg_gadget_dev *crg_udc;
+	struct crg_sel_value *sel_value;
+
+	udc_ep = container_of(ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep->crg_udc;
+
+	if (req->buf) {
+		if (!req->status && req->actual >= sizeof(*sel_value)) {
+			sel_value = req->buf;
+			crg_udc->sel_value.u2_pel_value =
+				le16_to_cpu(sel_value->u2_pel_value);
+			crg_udc->sel_value.u2_sel_value =
+				le16_to_cpu(sel_value->u2_sel_value);
+			crg_udc->sel_value.u1_pel_value = sel_value->u1_pel_value;
+			crg_udc->sel_value.u1_sel_value = sel_value->u1_sel_value;
+		}
+
+		kfree(req->buf);
+		req->buf = NULL;
+	}
+}
+
+static void set_test_mode_cmpl(struct crg_gadget_dev *crg_udc)
+{
+	if (crg_udc->set_tm != 0) {
+		u32 tmp;
+		struct crg_uccr __iomem *uccr = crg_udc->uccr;
+
+		tmp = readl(&uccr->u2portpmsc);
+		FIELD_MODIFY(CRG_U3DC_U2PORTPM_TM_MASK, &tmp, crg_udc->set_tm);
+		writel(tmp, &uccr->u2portpmsc);
+
+		crg_udc->set_tm = 0;
+	}
+}
+
+static void setaddressrequest(struct crg_gadget_dev *crg_udc, u16 value,
+			      u16 index, u16 length)
+{
+	int status = -EINPROGRESS;
+	u8 status_set_addr = 0;
+
+	if (value > 127 || index != 0 || length != 0) {
+		status = -EINVAL;
+		goto set_address_error;
+	}
+
+	if ((crg_udc->device_state == USB_STATE_DEFAULT && value != 0) ||
+	    crg_udc->device_state == USB_STATE_ADDRESS) {
+		u32 param0;
+
+		param0 = FIELD_PREP(CRG_CMD2_0_DEV_ADDR_MASK, value);
+		if (crg_udc_issue_command(crg_udc, CRG_CMD_SET_ADDR, param0,
+					  0)) {
+			status = -EIO;
+		} else {
+			crg_udc->dev_addr = value;
+			status_set_addr = 1;
+		}
+	} else {
+		status = -EINVAL;
+	}
+
+set_address_error:
+	dev_dbg(crg_udc->dev, "crg_udc_build_ep0_status for Address Device\n");
+
+	crg_udc->setup_status = STATUS_STAGE_XFER;
+	crg_udc->setup_fn_call_back = &set_address_cmpl;
+	crg_udc_build_ep0_status(&crg_udc->udc_ep[0], true, status, NULL,
+				 status_set_addr, status != -EINPROGRESS);
+}
+
+static bool setfeaturesrequest(struct crg_gadget_dev *crg_udc, u8 request_type,
+			       u8 b_request, u16 value, u16 index, u16 length,
+			       unsigned long *flags)
+{
+	int status = -EINPROGRESS;
+	u8 dci;
+	struct crg_udc_ep *udc_ep_ptr;
+	u32 tmp;
+	u32 set_feat = 0;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+
+	if (length != 0) {
+		status = -EINVAL;
+		goto set_feature_error;
+	}
+
+	if (crg_udc->device_state == USB_STATE_DEFAULT) {
+		status = -EINVAL;
+		goto set_feature_error;
+	}
+
+	set_feat = (b_request == USB_REQ_SET_FEATURE) ? 1 : 0;
+	if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) ==
+	    (USB_RECIP_ENDPOINT | USB_TYPE_STANDARD)) {
+		dev_dbg(crg_udc->dev, "Halt/Unhalt EP\n");
+		if (crg_udc->device_state == USB_STATE_ADDRESS) {
+			if (index != 0) {
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+		}
+
+		if (value != USB_ENDPOINT_HALT)
+			goto set_feature_error;
+
+		if (index & ~(USB_ENDPOINT_NUMBER_MASK | USB_DIR_IN))
+			goto set_feature_error;
+
+		dci = crg_udc_index2dci(index);
+		if (dci == 1 || dci >= CRG_NUM_EP_CX)
+			goto set_feature_error;
+		if (dci != 0 && crg_udc->device_state == USB_STATE_CONFIGURED &&
+		    crg_udc_get_ep_state(crg_udc, dci) == EP_STATE_DISABLED)
+			goto set_feature_error;
+
+		udc_ep_ptr = &crg_udc->udc_ep[dci];
+		status = crg_udc_ep_halt(
+			udc_ep_ptr, (b_request == USB_REQ_SET_FEATURE) ? 1 : 0,
+			0, flags);
+
+		if (status < 0)
+			goto set_feature_error;
+	} else if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) ==
+		   (USB_RECIP_DEVICE | USB_TYPE_STANDARD)) {
+		switch (value) {
+		case USB_DEVICE_REMOTE_WAKEUP:
+			/* REMOTE_WAKEUP selector is not used by USB3.0 */
+			if (index ||
+			    crg_udc->device_state < USB_STATE_DEFAULT ||
+			    crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+
+			crg_udc->u2_rwe = set_feat;
+			crg_udc->gadget.wakeup_armed = set_feat;
+
+			break;
+		case USB_DEVICE_U1_ENABLE:
+		case USB_DEVICE_U2_ENABLE: {
+			u32 timeout_val;
+
+			if (crg_udc->device_state != USB_STATE_CONFIGURED) {
+				dev_err(crg_udc->dev,
+					"u12 enable fail, usb state=%d\n",
+					crg_udc->device_state);
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+
+			if (index != 0 ||
+			    crg_udc->gadget.speed < USB_SPEED_SUPER) {
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+
+			if (set_feat == 1 && crg_udc->u12_forbidden) {
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+
+			tmp = readl(&uccr->u3portpmsc);
+			if (value == USB_DEVICE_U1_ENABLE) {
+				if (!crg_udc->u12_initiate_forbidden) {
+					tmp &= (~CRG_U3DC_U3PORTPM_U1IEN);
+					tmp |= FIELD_PREP(
+						CRG_U3DC_U3PORTPM_U1IEN,
+						set_feat);
+				}
+				if (!crg_udc->u12_forbidden)
+					timeout_val =
+						set_feat ? CRG_UDC_U1_TIMEOUT_VAL : 0;
+				else
+					timeout_val = 0;
+
+				FIELD_MODIFY(CRG_U3DC_U3PORTPM_U1TMOUT_MASK,
+					     &tmp, timeout_val);
+
+				crg_udc->feature_u1_enable = set_feat;
+			}
+
+			if (value == USB_DEVICE_U2_ENABLE) {
+				if (!crg_udc->u12_initiate_forbidden) {
+					tmp &= (~CRG_U3DC_U3PORTPM_U2IEN);
+					tmp |= FIELD_PREP(
+						CRG_U3DC_U3PORTPM_U2IEN,
+						set_feat);
+				}
+				if (!crg_udc->u12_forbidden)
+					timeout_val =
+						set_feat ? CRG_UDC_U2_TIMEOUT_VAL : 0;
+				else
+					timeout_val = 0;
+
+				FIELD_MODIFY(CRG_U3DC_U3PORTPM_U2TMOUT_MASK,
+					     &tmp, timeout_val);
+
+				crg_udc->feature_u2_enable = set_feat;
+			}
+			writel(tmp, &uccr->u3portpmsc);
+
+			break;
+		}
+		case USB_DEVICE_TEST_MODE: {
+			u32 u_pattern;
+
+			if (b_request != USB_REQ_SET_FEATURE ||
+			    crg_udc->gadget.speed != USB_SPEED_HIGH ||
+			    crg_udc->device_state < USB_STATE_DEFAULT ||
+			    (index & 0xff) || (index >> 8) == 0 ||
+			    (index >> 8) > 6)
+				goto set_feature_error;
+			u_pattern = index >> 8;
+			crg_udc->set_tm = u_pattern;
+			crg_udc->setup_fn_call_back = &set_test_mode_cmpl;
+
+			break;
+		}
+
+		default:
+			goto set_feature_error;
+		}
+
+	} else if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) ==
+		   (USB_RECIP_INTERFACE | USB_TYPE_STANDARD)) {
+		if (crg_udc->device_state != USB_STATE_CONFIGURED) {
+			dev_err(crg_udc->dev,
+				"interface u12 enable fail, usb state=%d\n",
+				crg_udc->device_state);
+			status = -EINVAL;
+			goto set_feature_error;
+		}
+
+		/* Suspend Option */
+		if (value != USB_INTRF_FUNC_SUSPEND) {
+			status = -EINVAL;
+			goto set_feature_error;
+		}
+
+		if (!(index & USB_INTR_FUNC_SUSPEND_OPT_MASK &
+		      USB_INTRF_FUNC_SUSPEND_LP)) {
+			status = -EINVAL;
+			goto set_feature_error;
+		}
+
+		if (index & USB_INTRF_FUNC_SUSPEND_RW)
+			dev_dbg(crg_udc->dev, "Interface En Remote Wakeup\n");
+		else
+			dev_dbg(crg_udc->dev, "Interface Dis RemoteWakeup\n");
+
+		/* Do not need to return status stage here
+		 * Pass to composite gadget driver to process
+		 * the request
+		 */
+		return false;
+	}
+
+	crg_udc->setup_status = STATUS_STAGE_XFER;
+	crg_udc_build_ep0_status(&crg_udc->udc_ep[0], true, status, NULL, 0, 0);
+	return true;
+
+set_feature_error:
+	crg_udc_set_ep0_halt(crg_udc);
+	return true;
+}
+
+static void setselrequest(struct crg_gadget_dev *crg_udc, u16 value, u16 index,
+			  u16 length)
+{
+	struct crg_udc_request *udc_req_ptr = crg_udc->status_req;
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	struct crg_sel_value *sel;
+	int ret;
+
+	if (!udc_req_ptr || !list_empty(&udc_req_ptr->queue) ||
+	    crg_udc->device_state == USB_STATE_DEFAULT || value || index ||
+	    length != sizeof(struct crg_sel_value)) {
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+
+	kfree(udc_req_ptr->usb_req.buf);
+
+	udc_req_ptr->usb_req.buf = kzalloc_obj(*sel, GFP_ATOMIC);
+	if (!udc_req_ptr->usb_req.buf) {
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+
+	sel = udc_req_ptr->usb_req.buf;
+	udc_req_ptr->usb_req.length = sizeof(*sel);
+	udc_req_ptr->usb_req.status = -EINPROGRESS;
+	udc_req_ptr->usb_req.actual = 0;
+	udc_req_ptr->usb_req.complete = set_sel_cmpl;
+	udc_req_ptr->map_dir = DMA_FROM_DEVICE;
+	ret = usb_gadget_map_request_by_dev(crg_udc->dev, &udc_req_ptr->usb_req,
+					    false);
+	if (ret) {
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+
+	crg_udc->setup_status = DATA_STAGE_RECV;
+
+	ret = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+	if (ret) {
+		crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr);
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+}
+
+int crg_udc_update_ep0_maxpacketsize(struct crg_gadget_dev *crg_udc)
+{
+	u16 maxpacketsize = 0;
+	struct crg_udc_ep *udc_ep0 = &crg_udc->udc_ep[0];
+	u32 param0;
+
+	if (crg_udc->gadget.speed >= USB_SPEED_SUPER)
+		maxpacketsize = 512;
+	else
+		maxpacketsize = 64;
+
+	param0 = FIELD_PREP(CRG_CMD1_0_MPS_MASK, maxpacketsize);
+	if (crg_udc_issue_command(crg_udc, CRG_CMD_UPDATE_EP0_CFG, param0, 0))
+		return -EIO;
+
+	crg_udc->ep0_desc.wMaxPacketSize = cpu_to_le16(maxpacketsize);
+	udc_ep0->usb_ep.maxpacket = maxpacketsize;
+
+	return 0;
+}
+
+void crg_udc_handle_setup_pkt(struct crg_gadget_dev *crg_udc,
+			      struct usb_ctrlrequest *setup_pkt, u8 setup_tag,
+			      unsigned long *flags)
+{
+	u16 w_value = le16_to_cpu(setup_pkt->wValue);
+	u16 w_index = le16_to_cpu(setup_pkt->wIndex);
+	u16 w_length = le16_to_cpu(setup_pkt->wLength);
+	struct usb_gadget_driver *driver;
+	u32 tmp;
+
+	trace_crg_udc_ctrl_req(setup_pkt);
+
+	/* EP0 come backs to running when new setup packet comes */
+	crg_udc->udc_ep[0].ep_state = EP_STATE_RUNNING;
+
+	crg_udc->setup_tag = setup_tag;
+	crg_udc->setup_status = SETUP_PKT_PROCESS_IN_PROGRESS;
+	crg_udc->setup_fn_call_back = NULL;
+
+	if ((setup_pkt->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
+		switch (setup_pkt->bRequest) {
+		case USB_REQ_GET_STATUS:
+			if (setup_pkt->bRequestType !=
+				    (USB_DIR_IN | USB_RECIP_DEVICE |
+				     USB_TYPE_STANDARD) &&
+			    setup_pkt->bRequestType !=
+				    (USB_DIR_IN | USB_RECIP_INTERFACE |
+				     USB_TYPE_STANDARD) &&
+			    setup_pkt->bRequestType !=
+				    (USB_DIR_IN | USB_RECIP_ENDPOINT |
+				     USB_TYPE_STANDARD)) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+
+			getstatusrequest(crg_udc, setup_pkt->bRequestType,
+					 w_value, w_index, w_length);
+			return;
+		case USB_REQ_SET_ADDRESS:
+			if (setup_pkt->bRequestType !=
+			    (USB_DIR_OUT | USB_RECIP_DEVICE |
+			     USB_TYPE_STANDARD)) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+
+			setaddressrequest(crg_udc, w_value, w_index, w_length);
+			return;
+		case USB_REQ_SET_SEL:
+			if (setup_pkt->bRequestType !=
+			    (USB_DIR_OUT | USB_RECIP_DEVICE |
+			     USB_TYPE_STANDARD)) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+			crg_udc->setup_status = DATA_STAGE_RECV;
+			setselrequest(crg_udc, w_value, w_index, w_length);
+			return;
+		case USB_REQ_SET_ISOCH_DELAY:
+			if (setup_pkt->bRequestType !=
+				    (USB_DIR_OUT | USB_RECIP_DEVICE |
+				     USB_TYPE_STANDARD) ||
+			    w_index || w_length ||
+			    w_value >
+				    FIELD_MAX(
+					    CRG_U3DC_PTMCTRL_ISOCH_DELAY_MASK)) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+
+			tmp = readl(&crg_udc->uccr->ptmctrl);
+			FIELD_MODIFY(CRG_U3DC_PTMCTRL_ISOCH_DELAY_MASK, &tmp,
+				     w_value);
+			writel(tmp, &crg_udc->uccr->ptmctrl);
+			crg_udc->setup_status = STATUS_STAGE_XFER;
+			crg_udc_build_ep0_status(&crg_udc->udc_ep[0], true,
+						 -EINPROGRESS, NULL, 0, 0);
+			return;
+
+		case USB_REQ_CLEAR_FEATURE:
+		case USB_REQ_SET_FEATURE:
+			/* Need composite gadget driver
+			 * to process the function remote wakeup request
+			 */
+			if (setfeaturesrequest(crg_udc, setup_pkt->bRequestType,
+					       setup_pkt->bRequest, w_value,
+					       w_index, w_length, flags)) {
+				/* Get here if request has been processed.*/
+				return;
+			}
+			break;
+		case USB_REQ_SET_CONFIGURATION:
+			if (setup_pkt->bRequestType !=
+				    (USB_DIR_OUT | USB_RECIP_DEVICE |
+				     USB_TYPE_STANDARD) ||
+			    w_length || w_value > 0xff) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+			/* In theory we need to clear RUN bit before
+			 * status stage of deconfig request sent.
+			 * But seeing problem if we do it before all the
+			 * endpoints belonging to the configuration
+			 * disabled.
+			 */
+			if (crg_udc->device_state <= USB_STATE_DEFAULT) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+
+			break;
+		default:
+			dev_dbg(crg_udc->dev,
+				"USB_REQ default bRequest=%d, bRequestType=%d\n",
+				setup_pkt->bRequest, setup_pkt->bRequestType);
+		}
+	}
+
+	if (w_length) {
+		/* data phase from gadget like GET_CONFIGURATION
+		 * call the setup routine of gadget driver.
+		 * remember the request direction.
+		 */
+		crg_udc->setup_status = (setup_pkt->bRequestType & USB_DIR_IN) ?
+						DATA_STAGE_XFER :
+						DATA_STAGE_RECV;
+	}
+	driver = crg_udc->async_callbacks ? crg_udc->gadget_driver : NULL;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+
+	/*
+	 * Make sure any reset notification queued by
+	 * crg_udc_handle_port_status() has actually run before this SETUP
+	 * (which may be SET_CONFIGURATION) reaches the function driver.
+	 * Otherwise udc_reset_work's usb_gadget_udc_reset() could run after
+	 * the new configuration is already active and tear it back down.
+	 */
+	flush_work(&crg_udc->udc_reset_work);
+
+	if (!driver || driver->setup(&crg_udc->gadget, setup_pkt) < 0) {
+		spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	if (setup_pkt->bRequest == USB_REQ_SET_CONFIGURATION &&
+	    (setup_pkt->bRequestType & (USB_TYPE_MASK | USB_RECIP_MASK)) ==
+		    (USB_TYPE_STANDARD | USB_RECIP_DEVICE)) {
+		if (w_value) {
+			crg_udc->device_state = USB_STATE_CONFIGURED;
+			usb_gadget_set_state(&crg_udc->gadget,
+					     USB_STATE_CONFIGURED);
+		} else {
+			/* Endpoint disable may already have updated device_state. */
+			crg_udc->device_state = USB_STATE_ADDRESS;
+			usb_gadget_set_state(&crg_udc->gadget,
+					     USB_STATE_ADDRESS);
+		}
+	}
+}
+
+int crg_udc_init_ep0(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	u32 cmd_param0;
+	u32 cmd_param1;
+
+	/* setup transfer ring */
+	if (!udc_ep_ptr->tran_ring_info.cpu_addr) {
+		dma_addr_t dma;
+		u32 ring_size = CRG_UDC_CONTROL_EP_TD_RING_SIZE;
+		void *vaddr;
+		size_t len;
+
+		len = ring_size * sizeof(struct crg_transfer_trb);
+		vaddr = dma_alloc_coherent(crg_udc->dev, len, &dma, GFP_KERNEL);
+		if (!vaddr)
+			return -ENOMEM;
+
+		udc_ep_ptr->tran_ring_info.cpu_addr = vaddr;
+		udc_ep_ptr->tran_ring_info.dma_addr = dma;
+		udc_ep_ptr->tran_ring_info.len = len;
+		udc_ep_ptr->first_trb = vaddr;
+		udc_ep_ptr->last_trb = udc_ep_ptr->first_trb + ring_size - 1;
+	}
+
+	memset(udc_ep_ptr->first_trb, 0, udc_ep_ptr->tran_ring_info.len);
+	/* Ensure that transfer ring is updated */
+	dma_wmb();
+	udc_ep_ptr->enq_pt = udc_ep_ptr->first_trb;
+	udc_ep_ptr->deq_pt = udc_ep_ptr->first_trb;
+	udc_ep_ptr->pcs = 1;
+	udc_ep_ptr->tran_ring_full = false;
+
+	crg_udc_setup_link_trb(udc_ep_ptr->last_trb, true,
+			       udc_ep_ptr->tran_ring_info.dma_addr);
+
+	/* context related ops */
+	cmd_param0 = (lower_32_bits(udc_ep_ptr->tran_ring_info.dma_addr) &
+		      CRG_CMD0_0_DQPTRLO_MASK) |
+		     FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep_ptr->pcs);
+	cmd_param1 = upper_32_bits(udc_ep_ptr->tran_ring_info.dma_addr);
+
+	if (crg_udc_issue_command(crg_udc, CRG_CMD_INIT_EP0, cmd_param0,
+				  cmd_param1))
+		return -EIO;
+
+	udc_ep_ptr->desc = &crg_udc->ep0_desc;
+	udc_ep_ptr->ep_state = EP_STATE_RUNNING;
+	udc_ep_ptr->pcs = 1;
+
+	return 0;
+}
+
+int crg_udc_queue_ctrl(struct crg_udc_ep *udc_ep_ptr,
+		       struct crg_udc_request *udc_req_ptr,
+		       u32 num_of_trbs_needed)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	enum crg_ep_state ep_state;
+	struct crg_transfer_trb *enq_pt = udc_ep_ptr->enq_pt;
+	struct crg_transfer_trb *dq_pt = udc_ep_ptr->deq_pt;
+	struct usb_request *usb_req = &udc_req_ptr->usb_req;
+	struct crg_transfer_trb *p_trb;
+	u32 transfer_length;
+	bool ioc;
+	bool azp;
+	u8 dir = 0;
+	u8 setup_tag = crg_udc->setup_tag;
+
+	/* A new SETUP aborts the previous EP0 transaction. The completion
+	 * callback of the aborted request is allowed to run, but it must not
+	 * requeue the old request before the new SETUP has been handed to the
+	 * gadget driver.
+	 */
+	if (crg_udc->ep0_state == EP0_STATE_ABORTING)
+		return -ECONNRESET;
+
+	ep_state = crg_udc_get_ep_state(crg_udc, 0);
+	/* Need to queue the request even ep is paused or halted */
+	if (ep_state != EP_STATE_RUNNING) {
+		dev_dbg(crg_udc->dev, "EP State = 0x%x\n", ep_state);
+		return -EINVAL;
+	}
+	if (list_empty(&udc_ep_ptr->queue)) {
+		/* For control endpoint, we can handle one setup request at a
+		 * time. so if there are TD pending in the transfer ring.
+		 * wait for the sequence number error event. Then put the new
+		 * request to transfer ring
+		 */
+		if (enq_pt == dq_pt) {
+			u32 i;
+			bool need_zlp = false;
+			dma_addr_t trb_dma = usb_req->dma;
+			u64 remaining = usb_req->length;
+			/* Transfer ring is empty
+			 * setup data stage TRBs
+			 */
+			udc_req_ptr->first_trb = udc_ep_ptr->enq_pt;
+			if (crg_udc->setup_status == DATA_STAGE_XFER)
+				dir = 0;
+			else if (crg_udc->setup_status == DATA_STAGE_RECV)
+				dir = 1;
+			else
+				dev_dbg(crg_udc->dev,
+					"unexpected setup_status!%d\n",
+					crg_udc->setup_status);
+			if (udc_req_ptr->usb_req.zero == 1 &&
+			    udc_req_ptr->usb_req.length != 0 &&
+			    ((udc_req_ptr->usb_req.length %
+			      udc_ep_ptr->usb_ep.maxpacket) == 0))
+				need_zlp = true; /* zero length packet */
+			if (num_of_trbs_needed > 32)
+				return -EMSGSIZE;
+
+			if (num_of_trbs_needed >
+			    crg_udc_room_on_ring(
+				    crg_udc, CRG_UDC_CONTROL_EP_TD_RING_SIZE,
+				    udc_ep_ptr->first_trb, enq_pt, dq_pt))
+				return -ENOSPC;
+
+			u8 original_pcs = udc_ep_ptr->pcs;
+
+			for (i = 0; i < num_of_trbs_needed; i++) {
+				p_trb = enq_pt;
+				transfer_length = crg_udc_trb_chunk_len(
+					trb_dma, remaining);
+				ioc = (i == num_of_trbs_needed - 1);
+				azp = ioc && need_zlp;
+				crg_udc_setup_datastage_trb(
+					p_trb, trb_dma,
+					i == 0 ? (original_pcs ^ 1) :
+						 udc_ep_ptr->pcs,
+					transfer_length,
+					num_of_trbs_needed - i - 1, ioc, azp,
+					dir, setup_tag);
+				udc_req_ptr->all_trbs_queued = 1;
+				trb_dma += transfer_length;
+				remaining -= transfer_length;
+				enq_pt++;
+				if (FIELD_GET(TRB_TYPE_MASK,
+					      le32_to_cpu(enq_pt->dw3)) ==
+				    TRB_TYPE_LINK) {
+					if (FIELD_GET(
+						    TRB_LINK_TOGGLE_CYCLE_MASK,
+						    le32_to_cpu(enq_pt->dw3))) {
+						dma_wmb();
+						le32p_replace_bits(
+							&enq_pt->dw3,
+							udc_ep_ptr->pcs,
+							TRB_CYCLE_BIT_MASK);
+						udc_ep_ptr->pcs ^= 0x1;
+					}
+					enq_pt = udc_ep_ptr->first_trb;
+				}
+			}
+			dma_wmb();
+			le32p_replace_bits(&udc_req_ptr->first_trb->dw3,
+					   original_pcs, TRB_CYCLE_BIT_MASK);
+			udc_ep_ptr->enq_pt = enq_pt;
+			crg_udc_knock_doorbell(crg_udc, 0);
+			if (udc_ep_ptr->enq_pt == udc_ep_ptr->first_trb)
+				udc_req_ptr->last_trb =
+					udc_ep_ptr->last_trb - 1;
+			else
+				udc_req_ptr->last_trb = udc_ep_ptr->enq_pt - 1;
+		} else {
+			/*
+			 * The software queue is empty but the transfer ring
+			 * still holds pending TDs from a previous control
+			 * transfer (the host issued a new setup before the
+			 * old one drained). We process one setup at a time,
+			 * so we intentionally do not queue TRBs here.
+			 * Returning success leaves this request on the
+			 * endpoint queue; the stale TDs and this request are
+			 * flushed and completed (with -EINVAL) by the
+			 * sequence-number-error / setup-tag-mismatch event in
+			 * crg_udc_handle_xfer_event().
+			 */
+			dev_err(crg_udc->dev,
+				"ep0 ring not idle on new setup\n");
+		}
+	} else {
+		dev_err(crg_udc->dev, "udc_ep_ptr->queue not empty\n");
+		/* New setup packet came
+		 * Drop this request.
+		 */
+		return -EINVAL;
+	}
+	return 0;
+}

-- 
2.34.1

