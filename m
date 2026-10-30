Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.96
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793347823;
	b=ujteZHqAMaZ4WUJAOr2XphrMmPrc1VR+ny97PCc9+YzrRJAItx+93BnFeU2aHA+Y1XML
	 ntJuZyCMonZGSNwHxA/Gbst2dycaPjJyIA8bDdNql6LTsbaobAMwwbuCOLBLIb9AvVNz7
	 xnckjtKSK3OTWhqXfZOBTQA3J/G5aEfQJtQuFg8X4TpsXrr9GXyynfZh8vJNRKAiSXY1N
	 QoZbMTqHIEInMpEjwBZQwqVp8GRdEJCkeHlR9p82zgX7gTIS/GRNBvO6eiBtxqm6jEJhw
	 hotN0FtYICZGk5G5bxKTtVzTOssonCs4xXSRdAh09qbxj3sSqRZ4cZN4L0jfRqJw63A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347823;
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
	bh=Tn37/rW9RPUY5mt6Br6+nTxOeaX8mImTlY5/uxoBJDM=;
	b=QtGCMIyDzEi2c2YwxijZursCyux65PL67h0Udy2URuqRfMs2w/T5D01W1iUIa5+CU0mF
	 sZLxLDLuXiPuHYacSrypCebkY0hMMd+1TI5yrYjG5SEP+Si0jJyx1sav/C2lAkb58iB0u
	 kw7tOy1MVz4fAQRhcKl2DBxXY7ncjti5f0etqCb91Nr9aXxycRL1hpEyOxcK4qj9Xbncb
	 r3Kdi3a+OKJKnZu6ygzI6txfT7jB3nUMR/vGm7/+tfIrhp2WUXASaza5n75+bVN7nOo9i
	 zuX8zKhFNtEbxBTedZQms0BQnV7kLzU+QTreqhkLOPFj0w6VGMo6bVo88wdqUCL/IXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b="H/A37GPe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.96
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020096.outbound.protection.outlook.com [52.101.201.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C5A606A33A;
	Fri, 30 Oct 2026 08:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C5A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=H/A37GPe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7Qf2kozgBQ6mcHeXqPMRo7vTSRlnTzcjYVv43d0m6j4SQ5xUqwthx+ba6tLR0vlWvEM+gxFTruLGHG057+0qD6iVBXIhMyI1lVNEkW5SpJvM8JhHpJyp8dc+pMZ98MlJ/TS0km4awiZEHhqbIsxV/B00QZfkHqi7f3Rx8zM6Se2IGjJtT918yzfmiAfBumwxCym3eJck1/TbdTZeEnXOuZ9DVpmPGB9StgctJXWe/CcPQ4he3HD19W0bRZDgAqcr0b9L5Q4D+FnJyxcaj20Rmn1ArrYZ62lQo5GDPwvCzX4NtXLTqkgJVfuGjz2GpYJIdQ8HEBzBI1mSoCUvTGRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn37/rW9RPUY5mt6Br6+nTxOeaX8mImTlY5/uxoBJDM=;
 b=DRLMtsF6NrSGFNPySu1JhMxqBcG01nHNEPXDexNapY+xDc9CcSF/B2wNmqY4NCI0fcVq6hPFxZZ9ArWDJNUjNnIhHD5mmPT16LE3O/SrEnt4NozW/FzYjgHFB2SL9ZsxyWG9pZY78Gw2/eivgPNvCDOxnrA89XqJtDJqKlPC6aDyDMyq3kqMHRA8CjFZXz+AxPHT+JaiWoUzMbxAA/C+WoNNXD/aSkZqZa5RvQhCUcLuoYT+zhe/jOB8Swx6NFCZBA1xnWrR21gzo8XcIwzSJ9q7/P9l/czhxFzVgWL7gIAzi0i5PpUQg3pCSryEN9LtvM5TvdVAxgbD2ImsgPGUhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn37/rW9RPUY5mt6Br6+nTxOeaX8mImTlY5/uxoBJDM=;
 b=H/A37GPeAO+URBeudFElGyJGJ/c4hARQ7p4nDgLvRm2OB9JWH1Z5KSSmcXBjq5Xtf5ekSF/EmPydYVS35f/e0z4BlBikqu16EBMvWsb/DudM+dvdlMrDsm5iG5eXlkFmYnXEvBhrmuZl14XBfb7HDTDlpmw3Jfmz/GORvBJoSdnagVYh2D3ED1qMMGFNtplhclewGjm8aZCgr9hlIfvhIeZJhc2NyEmznhNvHaCt8m/sMc3SjPs4YhnK8afqTuJTjfajdI5RR48hERBVNjNKjTPPPjsm69bXtBYg/DdZEUT5RJPqePFZlV/lnoiMFYp85/f4WrR6ysgU7mNYoPc68w==
Received: from BY5PR04CA0018.namprd04.prod.outlook.com (2603:10b6:a03:1d0::28)
 by PH3PPF93B419591.namprd18.prod.outlook.com (2603:10b6:518:1::cb5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 08:10:16 +0000
Received: from BY1PEPF000264B4.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::20) by BY5PR04CA0018.outlook.office365.com
 (2603:10b6:a03:1d0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 08:10:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BY1PEPF000264B4.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 08:10:15 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 578984186B5A;
	Fri, 30 Oct 2026 01:10:15 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Fri, 30 Oct 2026 01:10:11 -0700
Subject: [PATCH v4 3/6] usb: gadget: udc: crg: Add ring and transfer
 management
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
Message-Id: <20261030-axiado-ax3000-usb-device-controller-v4-3-c5267b36a777@axiado.com>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793347814; l=20654;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=1sozaICler3VZu61hy9scdv9JONYlFt4jx+6KA4Sz9s=;
 b=asP8dSmS62t7tGpet/JDqjypeVCziS6MrvJOe2tfr+j3q3s4/98aWzPU2WGWskC5rTZJI+Vvb
 SpR8aOt2eiKCWRh9qjGSZk1tXd2R1tLFIpWIoTObdTf7EKZJcZfteeC
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B4:EE_|PH3PPF93B419591:EE_
X-MS-Office365-Filtering-Correlation-Id: 51375428-55eb-4e8a-bce0-08df365d3ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|34020700016|82310400026|36860700016|56012099006|261009223027099003|261009221227099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|10067099003|21046099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	7Bk8q7G/E7sp3sbpvsqOWnDgwQBL/oQiHiln8hle8fKmB5TTyds0L/YvDz9IZZ6dXQUEEruRFbsACADO997oGQu0f/8T1+qnSO9c8iA7ZB5J6irCqLlJ3K5KoGTKYelo2UeU3xwGWzvUUFB5D2thVXkIyHSsG9hgmulQSh3GB+CFvVXa2gGoRZV2xbFlEVtM3XWaY72F2VgpkH1AHlpTECDNIKrbwkSbNSpUDlCRfrTdwoY4kdFs7nEjrl1zymB1Osg0T7Qa3GTk62/n62N54lAc9B+vt5+geDa1GT2Vu250R9QF9fVrgGODXUjXDQTAuSF9AAWyxCFeVudDdfV/4hDc3fjL1UNBnFMPoLhHFATuPI9ywvc0rwSAOCJhle6HoneIDsu7X7a4KINdbQ93ffvkyAnPp6BXeZwOuCN9/B/qKqf8jmqrRlivdO/Yw6cAQmUkrjxewwdWRHxPKh+mayh1SNo7yK1b083i9+8nlDnpzFRMKj6JnJEuzNKBexvWghlCK/AZd1OJc+xeZ8nJU7ypSpXeF8/ce/xdGxUoPTJQAz6epLl1N1b6AB7PTA32RX07IrVb8Mm/9BgaPhMutkz/d38L6AT/fcEmg7mxZTc7yUwDfZod0/aPdarKrCiThobAYSukuntm+mCRC3LNOnPCwRNqvmuaDWe+VXttZrV4Fxf7dCN0LRrxdgBhGQGwsSyopQ/bo3MUFY6NbslD/Q==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(34020700016)(82310400026)(36860700016)(56012099006)(261009223027099003)(261009221227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(10067099003)(21046099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VnuIvytRw/EkATy+8eTgfk8N/QIXNUk1FMEr1tqXV7HalMv+vSzbjuSSODusNeS50Mz2oQKYJVh/oVT0Rm4Kup7pdZJ8kzIyCzhuUSsXeD2yrq8623RD/+5WsAKliBw5zp5yPZYniFuuc5Lry24iQyHbV+ee8o6Ilg2+Hp532pADTFrAs3Mb8gvBh+niRTo483rPkzqtQFNeBY9ctlLFDOQ+l72qjidD7pZKwFsT74K9OEm58mdHVJx4eD7CHhxa853pUC4fwqsAFeY+yiCBCXObjjFSkRyLscF1jGtaMQ3OH97kRzn1tEYiKa63hZIE5ETEmiypunC8pGAXhCiFHBoV5OX9HRY1RGeQaMq+KTSvcjG60ZTjSFbibpMEp5kd1B5OTV3cWjewwe+RxaM3BsgfOigeV6ZftZb0yLwpiIbekd7SCk7XavwMaSBBk1Em
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:10:15.6938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51375428-55eb-4e8a-bce0-08df365d3ae4
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF93B419591

This patch introduces the memory management and ring buffer logic
(TRBs and event rings) required by the Axiado AX3000/AX3005 UDC.

Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 drivers/usb/gadget/udc/crg/crg-udc-ring.c | 668 ++++++++++++++++++++++++++++++
 1 file changed, 668 insertions(+)

diff --git a/drivers/usb/gadget/udc/crg/crg-udc-ring.c b/drivers/usb/gadget/udc/crg/crg-udc-ring.c
new file mode 100644
index 000000000000..f1de8893b790
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-ring.c
@@ -0,0 +1,668 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ *
+ * Copyright (c) 2019 Corigine Inc.
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+#include <linux/sched.h>
+#include <linux/scatterlist.h>
+
+#include "crg-udc.h"
+
+void crg_udc_advance_dequeue_pt(struct crg_udc_ep *udc_ep)
+{
+	struct crg_udc_request *udc_req;
+
+	if (!list_empty(&udc_ep->queue)) {
+		udc_req = list_entry(udc_ep->queue.next, struct crg_udc_request,
+				     queue);
+
+		if (udc_req->first_trb)
+			udc_ep->deq_pt = udc_req->first_trb;
+		else
+			udc_ep->deq_pt = udc_ep->enq_pt;
+	} else {
+		udc_ep->deq_pt = udc_ep->enq_pt;
+	}
+}
+
+unsigned int crg_udc_count_trbs_linear(dma_addr_t addr, u64 len)
+{
+	unsigned int num_trbs = 0;
+
+	while (len) {
+		u32 chunk = crg_udc_trb_chunk_len(addr, len);
+
+		if (!chunk)
+			return 0;
+		num_trbs++;
+		addr += chunk;
+		len -= chunk;
+	}
+
+	return num_trbs;
+}
+
+unsigned int crg_udc_count_trbs_sg(struct crg_udc_request *udc_req)
+{
+	struct scatterlist *sg;
+	u64 remaining = udc_req->usb_req.length;
+	unsigned int i;
+	unsigned int num_trbs = 0;
+
+	for_each_sg(udc_req->usb_req.sg, sg, udc_req->usb_req.num_sgs, i) {
+		dma_addr_t addr;
+		u64 len;
+
+		if (!sg_dma_len(sg))
+			continue;
+		if (!remaining)
+			break;
+
+		len = min_t(u64, sg_dma_len(sg), remaining);
+		addr = sg_dma_address(sg);
+		while (len) {
+			u32 chunk = crg_udc_trb_chunk_len(addr, len);
+
+			if (!chunk)
+				return 0;
+			num_trbs++;
+			addr += chunk;
+			len -= chunk;
+			remaining -= chunk;
+		}
+	}
+
+	return remaining ? 0 : num_trbs;
+}
+
+static dma_addr_t event_trb_virt_to_dma(struct crg_udc_event *udc_event,
+					struct crg_event_trb *event)
+{
+	dma_addr_t dma_addr = 0;
+	unsigned long seg_offset;
+
+	if (!udc_event || !event)
+		return DMA_MAPPING_ERROR;
+
+	if ((void *)event < udc_event->event_ring.cpu_addr ||
+	    (void *)event >=
+		    udc_event->event_ring.cpu_addr + udc_event->event_ring.len)
+		return DMA_MAPPING_ERROR;
+
+	seg_offset = (void *)event - udc_event->event_ring.cpu_addr;
+	dma_addr = udc_event->event_ring.dma_addr + seg_offset;
+
+	return dma_addr;
+}
+
+int crg_udc_init_event_ring(struct crg_gadget_dev *crg_udc, int index)
+{
+	struct crg_uicr __iomem *uicr = crg_udc->uicr[index];
+	struct crg_udc_event *udc_event = &crg_udc->udc_event[index];
+
+	int ret;
+	u32 buff_length;
+	dma_addr_t mapping;
+	bool erst_allocated = false;
+
+	buff_length = CRG_ERST_SIZE * sizeof(struct crg_erst);
+	if (!udc_event->erst.cpu_addr) {
+		udc_event->erst.cpu_addr = dma_alloc_coherent(
+			crg_udc->dev, buff_length, &mapping, GFP_ATOMIC);
+
+		if (!udc_event->erst.cpu_addr)
+			return -ENOMEM;
+		erst_allocated = true;
+	} else {
+		mapping = udc_event->erst.dma_addr;
+	}
+
+	udc_event->erst.len = buff_length;
+	udc_event->erst.dma_addr = mapping;
+	udc_event->p_erst = udc_event->erst.cpu_addr;
+
+	buff_length = CRG_EVENT_RING_SIZE * sizeof(struct crg_event_trb);
+	if (!udc_event->event_ring.cpu_addr) {
+		udc_event->event_ring.cpu_addr = dma_alloc_coherent(
+			crg_udc->dev, buff_length, &mapping, GFP_ATOMIC);
+
+		if (!udc_event->event_ring.cpu_addr) {
+			ret = -ENOMEM;
+			goto err_free_erst;
+		}
+	} else {
+		mapping = udc_event->event_ring.dma_addr;
+	}
+
+	udc_event->event_ring.len = buff_length;
+	udc_event->event_ring.dma_addr = mapping;
+	/* Invalidate event handlers which dropped udc_lock during reset. */
+	udc_event->generation++;
+	udc_event->evt_dq_pt = udc_event->event_ring.cpu_addr;
+
+	udc_event->evt_seg0_last_trb =
+		(struct crg_event_trb *)(udc_event->event_ring.cpu_addr) +
+		(CRG_EVENT_RING_SIZE - 1);
+
+	udc_event->ccs = 1;
+
+	udc_event->p_erst->seg_addr_lo =
+		cpu_to_le32(lower_32_bits(udc_event->event_ring.dma_addr));
+	udc_event->p_erst->seg_addr_hi =
+		cpu_to_le32(upper_32_bits(udc_event->event_ring.dma_addr));
+	udc_event->p_erst->seg_size = cpu_to_le32(CRG_EVENT_RING_SIZE);
+	udc_event->p_erst->rsvd = cpu_to_le32(0);
+	/* Ensure that event ring is updated */
+	dma_wmb();
+	/* clear the event ring, to avoid hw unexpected ops
+	 * because of dirty data
+	 */
+	memset(udc_event->event_ring.cpu_addr, 0, buff_length);
+
+	/* Ensure that event ring is clear before programming
+	 * ERSTBA/ERSTSZ/ERDP
+	 */
+	dma_wmb();
+
+	writel(CRG_ERST_SIZE, &uicr->erstsz);
+	writel(lower_32_bits(udc_event->erst.dma_addr), &uicr->erstbalo);
+	writel(upper_32_bits(udc_event->erst.dma_addr), &uicr->erstbahi);
+	writel(lower_32_bits(udc_event->event_ring.dma_addr) |
+		       CRG_U3DC_ERDPLO_EHB,
+	       &uicr->erdplo);
+	writel(upper_32_bits(udc_event->event_ring.dma_addr), &uicr->erdphi);
+
+	writel((CRG_U3DC_IMAN_INT_EN | CRG_U3DC_IMAN_INT_PEND), &uicr->iman);
+	/* Interrupt moderation: 4000 * 250ns = 1ms */
+	writel(4000, &uicr->imod);
+	return 0;
+
+err_free_erst:
+	/* Only free what this call allocated; a pre-existing erst is owned
+	 * by an earlier successful init and released by crg_udc_free_resources().
+	 */
+	if (erst_allocated) {
+		dma_free_coherent(crg_udc->dev, udc_event->erst.len,
+				  udc_event->erst.cpu_addr,
+				  udc_event->erst.dma_addr);
+		udc_event->erst.cpu_addr = NULL;
+	}
+	return ret;
+}
+
+static bool is_event_ring_x_empty(struct crg_gadget_dev *crg_udc, int index)
+{
+	struct crg_event_trb *event;
+	struct crg_udc_event *udc_event;
+
+	udc_event = &crg_udc->udc_event[index];
+	if (udc_event->evt_dq_pt) {
+		event = (struct crg_event_trb *)udc_event->evt_dq_pt;
+
+		if (FIELD_GET(EVE_TRB_CYCLE_BIT_MASK,
+			      le32_to_cpu(event->dw3)) != udc_event->ccs)
+			return true;
+	}
+
+	return false;
+}
+
+bool crg_udc_is_event_rings_empty(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		if (!is_event_ring_x_empty(crg_udc, i)) {
+			dev_err(crg_udc->dev, "event ring not empty\n");
+			return false;
+		}
+	}
+	return true;
+}
+
+bool crg_udc_is_pointer_less_than(struct crg_transfer_trb *a,
+				  struct crg_transfer_trb *b,
+				  struct crg_udc_ep *udc_ep)
+{
+	if (!a || !b || !udc_ep->first_trb || !udc_ep->last_trb)
+		return false;
+	if (b > a && (udc_ep->enq_pt >= b || udc_ep->enq_pt < a))
+		return true;
+	if (b < a && (udc_ep->enq_pt >= b && udc_ep->enq_pt < a))
+		return true;
+	return false;
+}
+
+int crg_udc_process_event_ring(struct crg_gadget_dev *crg_udc, int index,
+			       unsigned long *flags)
+{
+	struct crg_event_trb *event;
+	struct crg_udc_event *udc_event;
+	struct crg_uicr __iomem *uicr = crg_udc->uicr[index];
+	u32 val;
+	dma_addr_t erdp;
+	int ret;
+	u32 generation;
+	unsigned int processed = 0;
+
+	if (!uicr)
+		return -ENODEV;
+
+	val = readl(&uicr->iman);
+	val |= CRG_U3DC_IMAN_INT_PEND;
+	writel(val, &uicr->iman);
+
+	udc_event = &crg_udc->udc_event[index];
+	generation = udc_event->generation;
+	while (udc_event->evt_dq_pt) {
+		event = (struct crg_event_trb *)udc_event->evt_dq_pt;
+
+		if (FIELD_GET(EVE_TRB_CYCLE_BIT_MASK,
+			      le32_to_cpu(event->dw3)) != udc_event->ccs)
+			break;
+		/* Read the payload only after observing device ownership. */
+		dma_rmb();
+
+		ret = crg_udc_handle_event(crg_udc, event, flags);
+		/* The giveback callback may release the lock and reset the ring. */
+		if (unlikely(generation != udc_event->generation))
+			return 0;
+		if (ret == -ECONNRESET) {
+			/* The disconnect path rebuilt and reprogrammed the ring. */
+			return 0;
+		}
+		if (ret < 0)
+			dev_dbg(crg_udc->dev, "failed to process event: %d\n",
+				ret);
+
+		/* Consume malformed events so they cannot pin the ring head. */
+		if (event == udc_event->evt_seg0_last_trb) {
+			udc_event->ccs = udc_event->ccs ? 0 : 1;
+			udc_event->evt_dq_pt = udc_event->event_ring.cpu_addr;
+		} else {
+			udc_event->evt_dq_pt++;
+		}
+
+		/*
+		 * udc_event state is only re-read from crg_udc, never cached
+		 * across this drop, so releasing and reacquiring the lock
+		 * here is safe and lets other udc_lock users, and this CPU's
+		 * other interrupts, make progress during a busy event ring.
+		 */
+		if (++processed % CRG_EVENT_RING_BATCH == 0) {
+			erdp = event_trb_virt_to_dma(udc_event,
+						     udc_event->evt_dq_pt);
+			if (!dma_mapping_error(crg_udc->dev, erdp)) {
+				writel(upper_32_bits(erdp), &uicr->erdphi);
+				writel(lower_32_bits(erdp) |
+					       CRG_U3DC_ERDPLO_EHB,
+				       &uicr->erdplo);
+			}
+			spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+			cond_resched();
+			spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+			if (unlikely(generation != udc_event->generation))
+				return 0;
+		}
+	}
+
+	/* update dequeue pointer */
+	erdp = event_trb_virt_to_dma(udc_event, udc_event->evt_dq_pt);
+	if (dma_mapping_error(crg_udc->dev, erdp))
+		return -EINVAL;
+	writel(upper_32_bits(erdp), &uicr->erdphi);
+	writel(lower_32_bits(erdp) | CRG_U3DC_ERDPLO_EHB, &uicr->erdplo);
+
+	return 0;
+}
+
+/* This function will go through the list of the USB requests for the
+ * given endpoint and schedule any unscheduled trb's to the xfer ring
+ */
+int crg_udc_queue_pending_trbs(struct crg_udc_ep *udc_ep_ptr)
+{
+	struct crg_udc_request *req;
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	u32 generation = crg_udc->udc_event[0].generation;
+	u32 ep_generation = udc_ep_ptr->generation;
+	int ret;
+
+restart:
+	/* A giveback can reset/disable the endpoint while udc_lock is dropped. */
+	if (crg_udc->resetting || !udc_ep_ptr->desc ||
+	    udc_ep_ptr->ep_state == EP_STATE_DISABLED)
+		return 0;
+
+	list_for_each_entry(req, &udc_ep_ptr->queue, queue) {
+		if (req->all_trbs_queued)
+			continue;
+
+		/* A large request must finish its current TD before the next
+		 * TD (or the next USB request) can be submitted: the event
+		 * handler uses all_trbs_queued to complete the USB request.
+		 */
+		if (req->td_pending)
+			return 0;
+
+		ret = crg_udc_build_td(udc_ep_ptr, req);
+		if (ret == -ENOSPC || ret == -EBUSY)
+			return ret;
+		if (ret) {
+			dev_err(crg_udc->dev,
+				"failed to build pending transfer: %d\n", ret);
+			/* Giveback removes req and drops udc_lock: callbacks can
+			 * remove or free every saved request-list iterator.
+			 */
+			crg_udc_req_done(udc_ep_ptr, req, ret);
+			if (generation != crg_udc->udc_event[0].generation ||
+			    ep_generation != udc_ep_ptr->generation)
+				return 0;
+			goto restart;
+		}
+
+		if (udc_ep_ptr->tran_ring_full || !req->all_trbs_queued)
+			return 0;
+	}
+	return 0;
+}
+
+/* num_trbs here is the size of the ring. */
+u32 crg_udc_room_on_ring(struct crg_gadget_dev *crg_udc, u32 num_trbs,
+			 struct crg_transfer_trb *p_ring,
+			 struct crg_transfer_trb *enq_pt,
+			 struct crg_transfer_trb *dq_pt)
+{
+	u32 i = 0;
+
+	if (enq_pt == dq_pt) {
+		/* ring is empty */
+		return num_trbs - 2;
+	}
+
+	while (enq_pt != dq_pt) {
+		i++;
+
+		enq_pt++;
+
+		if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(enq_pt->dw3)) ==
+		    TRB_TYPE_LINK)
+			enq_pt = p_ring;
+
+		if (i > num_trbs)
+			break;
+	}
+
+	return i - 1;
+}
+
+void crg_udc_setup_datastage_trb(struct crg_transfer_trb *p_trb, dma_addr_t dma,
+				 u8 pcs, u32 transfer_length, u32 td_size,
+				 bool ioc, bool chain, bool azp, u8 dir, u8 setup_tag)
+{
+	u32 tmp;
+
+	p_trb->dw0 = cpu_to_le32(lower_32_bits(dma));
+	p_trb->dw1 = cpu_to_le32(upper_32_bits(dma));
+
+	/* TRB_Transfer_Length
+	 * For USB_DIR_OUT, this field is the number of data bytes expected
+	 * from xhc. For USB_DIR_IN, this field is the number of data bytes
+	 * the device will send.
+	 */
+	tmp = 0;
+	FIELD_MODIFY(TRB_TRANSFER_LEN_MASK, &tmp, transfer_length);
+	FIELD_MODIFY(TRB_TD_SIZE_MASK, &tmp, td_size);
+	FIELD_MODIFY(TRB_INTR_TARGET_MASK, &tmp, 0);
+	p_trb->dw2 = cpu_to_le32(tmp);
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_CYCLE_BIT_MASK, &tmp, pcs);
+	FIELD_MODIFY(TRB_INTR_ON_SHORT_PKT_MASK, &tmp, 1);
+	FIELD_MODIFY(TRB_INTR_ON_COMPLETION_MASK, &tmp, ioc);
+	FIELD_MODIFY(TRB_CHAIN_BIT_MASK, &tmp, chain);
+	FIELD_MODIFY(TRB_TYPE_MASK, &tmp, TRB_TYPE_XFER_DATA_STAGE);
+	FIELD_MODIFY(TRB_APPEND_ZLP_MASK, &tmp, azp);
+	FIELD_MODIFY(DATA_STAGE_TRB_DIR_MASK, &tmp, dir);
+	FIELD_MODIFY(TRB_SETUP_TAG_MASK, &tmp, setup_tag);
+
+	/* Publish ownership only after the TRB payload is visible. */
+	dma_wmb();
+	p_trb->dw3 = cpu_to_le32(tmp);
+}
+
+void crg_udc_setup_link_trb(struct crg_transfer_trb *link_trb, bool toggle,
+			    dma_addr_t next_trb)
+{
+	u32 dw = 0;
+
+	link_trb->dw0 = cpu_to_le32(lower_32_bits(next_trb));
+	link_trb->dw1 = cpu_to_le32(upper_32_bits(next_trb));
+	link_trb->dw2 = cpu_to_le32(0);
+
+	FIELD_MODIFY(TRB_TYPE_MASK, &dw, TRB_TYPE_LINK);
+	if (toggle)
+		FIELD_MODIFY(TRB_LINK_TOGGLE_CYCLE_MASK, &dw, 1);
+	else
+		FIELD_MODIFY(TRB_LINK_TOGGLE_CYCLE_MASK, &dw, 0);
+
+	/* Publish ownership only after the link address is visible. */
+	dma_wmb();
+	link_trb->dw3 = cpu_to_le32(dw);
+}
+
+void crg_udc_setup_status_trb(struct crg_gadget_dev *crg_udc,
+			      struct crg_transfer_trb *p_trb,
+			      struct usb_request *usb_req, u8 pcs, u8 set_addr,
+			      u8 stall)
+{
+	u32 tmp, dir = 0;
+
+	/* There are some cases where crg_udc_setup_status_trb() is called with
+	 * usb_req set to NULL.
+	 */
+	p_trb->dw0 = cpu_to_le32(0);
+	p_trb->dw1 = cpu_to_le32(0);
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_INTR_TARGET_MASK, &tmp, 0);
+	p_trb->dw2 = cpu_to_le32(tmp);
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_CYCLE_BIT_MASK, &tmp, pcs);
+	FIELD_MODIFY(TRB_INTR_ON_COMPLETION_MASK, &tmp, 1);
+	FIELD_MODIFY(TRB_TYPE_MASK, &tmp, TRB_TYPE_XFER_STATUS_STAGE);
+
+	dir = (crg_udc->setup_status == STATUS_STAGE_XFER) ? 0 : 1;
+	FIELD_MODIFY(DATA_STAGE_TRB_DIR_MASK, &tmp, dir);
+
+	FIELD_MODIFY(TRB_SETUP_TAG_MASK, &tmp, crg_udc->setup_tag);
+	FIELD_MODIFY(STATUS_STAGE_TRB_STALL_MASK, &tmp, stall);
+	FIELD_MODIFY(STATUS_STAGE_TRB_SET_ADDR_MASK, &tmp, set_addr);
+
+	/* Publish ownership only after the TRB payload is visible. */
+	dma_wmb();
+	p_trb->dw3 = cpu_to_le32(tmp);
+}
+
+void crg_udc_setup_trb(struct crg_transfer_trb *p_trb, u32 xfer_len,
+		       dma_addr_t xfer_buf_addr, u8 td_size, u8 pcs,
+		       u8 trb_type, bool short_pkt, bool chain_bit,
+		       bool intr_on_compl, bool b_setup_stage, u8 usb_dir,
+		       bool b_isoc, u16 frame_id, bool sia, bool azp)
+{
+	u32 tmp;
+
+	p_trb->dw0 = cpu_to_le32(lower_32_bits(xfer_buf_addr));
+	p_trb->dw1 = cpu_to_le32(upper_32_bits(xfer_buf_addr));
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_TRANSFER_LEN_MASK, &tmp, xfer_len);
+	FIELD_MODIFY(TRB_TD_SIZE_MASK, &tmp, td_size);
+	FIELD_MODIFY(TRB_INTR_TARGET_MASK, &tmp, 0);
+
+	p_trb->dw2 = cpu_to_le32(tmp);
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_CYCLE_BIT_MASK, &tmp, pcs);
+	FIELD_MODIFY(TRB_INTR_ON_SHORT_PKT_MASK, &tmp, short_pkt);
+	FIELD_MODIFY(TRB_CHAIN_BIT_MASK, &tmp, chain_bit);
+	FIELD_MODIFY(TRB_INTR_ON_COMPLETION_MASK, &tmp, intr_on_compl);
+	FIELD_MODIFY(TRB_APPEND_ZLP_MASK, &tmp, azp);
+	FIELD_MODIFY(TRB_TYPE_MASK, &tmp, trb_type);
+
+	if (b_setup_stage)
+		FIELD_MODIFY(DATA_STAGE_TRB_DIR_MASK, &tmp, usb_dir);
+
+	if (b_isoc) {
+		FIELD_MODIFY(ISOC_TRB_FRAME_ID_MASK, &tmp, frame_id);
+		FIELD_MODIFY(ISOC_TRB_SIA_MASK, &tmp, sia);
+	}
+
+	/* Publish ownership only after the TRB payload is visible. */
+	dma_wmb();
+	p_trb->dw3 = cpu_to_le32(tmp);
+}
+
+void crg_udc_squeeze_xfer_ring(struct crg_udc_ep *udc_ep_ptr,
+			       struct crg_udc_request *udc_req_ptr)
+{
+	struct crg_transfer_trb *trb = udc_req_ptr->first_trb;
+	struct crg_udc_request *next_req;
+	u8 new_pcs, clear_pcs;
+
+	if (!trb)
+		return;
+
+	/* Rewind the producer to the cancelled request.  These TRBs and
+	 * everything queued after them will be discarded and rebuilt.
+	 */
+	new_pcs = FIELD_GET(TRB_CYCLE_BIT_MASK, le32_to_cpu(trb->dw3));
+	clear_pcs = new_pcs;
+	while (trb != udc_ep_ptr->enq_pt) {
+		/* Zero is not always invalid: after a wrap the consumer
+		 * expects cycle 0.  Invalidate each slot for its cycle pass.
+		 */
+		le32p_replace_bits(&trb->dw3, clear_pcs ^ 1,
+				   TRB_CYCLE_BIT_MASK);
+		trb++;
+		if (trb == udc_ep_ptr->last_trb) {
+			trb = udc_ep_ptr->first_trb;
+			clear_pcs ^= 1;
+		}
+	}
+
+	udc_ep_ptr->enq_pt = udc_req_ptr->first_trb;
+	udc_ep_ptr->pcs = new_pcs;
+	udc_ep_ptr->tran_ring_full = false;
+	/* Do not overwrite the Link TRB: a previous active TD may still
+	 * require its cycle/chain bits to traverse the ring.
+	 */
+	dma_wmb();
+
+	/* Invalidate the bookkeeping of ALL subsequent requests before
+	 * attempting to rebuild any: rebuilding may stop when space runs out.
+	 * The caller gives back the cancelled request before rebuilding.
+	 */
+	next_req = udc_req_ptr;
+	list_for_each_entry_continue(next_req, &udc_ep_ptr->queue, queue) {
+		next_req->usb_req.status = -EINPROGRESS;
+		next_req->usb_req.actual = 0;
+		crg_udc_clear_req_container(next_req);
+	}
+}
+
+struct crg_transfer_trb *crg_udc_tran_trb_dma_to_virt(struct crg_udc_ep *udc_ep,
+						    dma_addr_t address)
+{
+	dma_addr_t offset;
+	struct crg_transfer_trb *trb_virt;
+
+	if (lower_32_bits(address) & 0xf)
+		return NULL;
+
+	offset = address - udc_ep->tran_ring_info.dma_addr;
+	if (unlikely(offset >= udc_ep->tran_ring_info.len))
+		return NULL;
+	offset = offset / sizeof(struct crg_transfer_trb);
+	trb_virt = udc_ep->first_trb + offset;
+	return trb_virt;
+}
+
+dma_addr_t crg_udc_tran_trb_virt_to_dma(struct crg_udc_ep *udc_ep,
+					struct crg_transfer_trb *trb)
+{
+	unsigned long offset;
+	int trb_idx;
+	dma_addr_t dma_addr = 0;
+
+	trb_idx = trb - udc_ep->first_trb;
+	if (unlikely(trb_idx < 0))
+		return DMA_MAPPING_ERROR;
+
+	offset = trb_idx * sizeof(*trb);
+	if (unlikely(offset >= udc_ep->tran_ring_info.len))
+		return DMA_MAPPING_ERROR;
+	dma_addr = udc_ep->tran_ring_info.dma_addr + offset;
+	return dma_addr;
+}
+
+void crg_udc_update_dequeue_pt(struct crg_event_trb *event,
+			       struct crg_udc_ep *udc_ep)
+{
+	u32 deq_pt_lo = le32_to_cpu(event->dw0);
+	u32 deq_pt_hi = le32_to_cpu(event->dw1);
+	u64 dq_pt_addr = (u64)deq_pt_lo | ((u64)deq_pt_hi << 32);
+	struct crg_transfer_trb *deq_pt;
+
+	deq_pt = crg_udc_tran_trb_dma_to_virt(udc_ep, dq_pt_addr);
+	if (!deq_pt)
+		return;
+	deq_pt++;
+	if (deq_pt == udc_ep->last_trb)
+		deq_pt = udc_ep->first_trb;
+
+	if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(deq_pt->dw3)) == TRB_TYPE_LINK)
+		deq_pt = udc_ep->first_trb;
+
+	udc_ep->deq_pt = deq_pt;
+}
+
+u32 crg_udc_trb_chunk_len(dma_addr_t dma, u64 remaining)
+{
+	u32 boundary = CRG_UDC_TRB_MAX_BUFFER_SIZE -
+		       (lower_32_bits(dma) & (CRG_UDC_TRB_MAX_BUFFER_SIZE - 1));
+
+	return min_t(u64, remaining, boundary);
+}
+
+u32 crg_udc_actual_before(struct crg_udc_ep *udc_ep,
+			  struct crg_udc_request *udc_req,
+			  struct crg_transfer_trb *pause)
+{
+	struct crg_transfer_trb *trb = udc_req->first_trb;
+	u32 actual = 0;
+	u32 guard = 0;
+	u32 max_iter = udc_ep->tran_ring_info.len / sizeof(*trb);
+
+	if (!trb || !pause)
+		return 0;
+
+	while (trb != pause && trb != udc_ep->enq_pt && guard++ < max_iter) {
+		u32 len;
+
+		if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(trb->dw3)) ==
+		    TRB_TYPE_LINK) {
+			trb = udc_ep->first_trb;
+			continue;
+		}
+		len = FIELD_GET(TRB_TRANSFER_LEN_MASK, le32_to_cpu(trb->dw2));
+		actual += len;
+		trb++;
+		if (trb == udc_ep->last_trb)
+			trb = udc_ep->first_trb;
+	}
+
+	return min(actual, udc_req->usb_req.length);
+}

-- 
2.34.1

