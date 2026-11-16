Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.117
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856011;
	b=b1Cf7AuXnRImQgNYOLFK/aItZPxCfcnpBw4M8uRsNtDw0EoGd/uTYdBZeJENMEHvEGwu
	 0z+G1m4zAUX1rRRQg+TAlFeypy5HT+zp4bzFxwTBHScWdBMFBQIH2HgZfMVwzTuxkzjGI
	 Vv9nY3z5Q52HNseH5HFSzi2MScbSDQXlAxuLlE2HRVpgaLH6BT5n8GLAfB6OKFUaWO+EX
	 Ex8M6CkrfxPdqhDc6L9UZZGvHONvFUyb2a1GVNYtdtPGBvfsXCc8eGpHUBmOj6FO/YKjj
	 BrPqf0O7HFleI0rCE6WHl1aL3q1ZgIIT+qI/nWiMEFN6CbUU75RIW/8CEFkOmhiTDwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856011;
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
	bh=TMHbLr+meKYeWEoT9Tsc7vJyjtsQ3qrjcCpToPbl/rA=;
	b=j5b2Q8elUkexLt2Q3FnKNELVwB6v+zoqQhrpQTDCr1thHBO3AA7SKJR63cbiGoJvz2hG
	 7Ywkkbfr0ADp+o29QrjLAWQBqVbuHzu4gA7GC7wbTOH4Ov8wponbI4TnSl/BBzBu2PQfA
	 RlbGrzAZ8gefcgUaT4yzOZElgORszPN1JUX9H7LiaBWn3c+XjUX/uiZLZ/LTwpOBLP5Tx
	 GXCnRqHMNylqUvSUqJbIHpnshvts9+7tTO3vwwReyyRNAoPqUtg9bKLNTOV6kcWbRc1Aj
	 CSqmdK5r1mlgUBipEM5mlVFYXDGEWokLo0aazCX0TWsEYGgpZePYjkMRq9ERYzhqtxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=mpBhBegM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.117
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022117.outbound.protection.outlook.com [52.101.53.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B4606B076;
	Mon, 16 Nov 2026 19:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 077B4606B076
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=mpBhBegM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnDGp4r/2bPZqD3s8NlV0I9qt6Kdr9sz6RjRwp9uDAN2dulAMehZ2tCiG4aJMWmCuvSY7Jc0IfvKUVyn055kTVdIxDKG4jV+njFEI0R+EM6XuC2T+/X1/+jxZgoNjp70Ey74I0BlxxgRvYvm93jVfHSSyFmp46s3sLBZB437GVhWRT1mv/LiDQodcJAft5SRYvb6etnBpzaTnvth+FjQiArbogYutkVpmMn2pgVCqPCuAQBiRBrEO1pHZxkjZoRYkxxvLoE+bCw/6N2Im18Ooh/vaEWbN8g7lHzVqgDaD2HcQNDd+6YYWARGmhgdRHgdbCb0ZhuvvpPf4kcvGWCofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMHbLr+meKYeWEoT9Tsc7vJyjtsQ3qrjcCpToPbl/rA=;
 b=fZQFaHteEWitekTVwUFulBAMYRrKhgUx1ED7W5Z2PGuKcNINKgojr7PYvPPxP+StBm1bhNsler6qVsKrp2X2yCdagk+ai8bt8iSaaUA8wi3/FlJe16dKDw6mAQV75JZ7fF53BfitfSvawjdRAr8q2LlfCcXIn+ODCA3zxUB+XuB1k98jyZNPqDZmHJvrT+nNk8Dc/obFHWnPVpsj21EI5i7BJOUDcLR788szSCI2Ik2G7vFXsFBojY36wtuOGvWVUtHZ7+3QkErG1O1dYKuuHF0Inb7W4pt5r5Fy82axafIpvHYyXqCE2FlFsNaqdBsGIBVHx90YT/nudekgG3QmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMHbLr+meKYeWEoT9Tsc7vJyjtsQ3qrjcCpToPbl/rA=;
 b=mpBhBegMkAHfjWHToaBYT7F5P8eYv0LpvSjGb2Pd3fPUSzBJPe5b6XhzZWORuWTU+8NDvvuXJ0aqiUH/PhBWyE++VUx1i+ydHKrjGKpWVJ/3hoi5v445kpomvfOqxHfEc6pZcEbClFM49CAIC0Z6mR//xCTP5F/IE5FjfJeSVTuWINL35UwBvHNleo4xvIbY2LZqFFAR2AZ3UOba8TNWFM5CQWEmRS8wvdSS7pEugXXY1c6Zr5dkujQy4owO/oniZ6QA1VRCGgoSAjCg+3aVS+s2SueySHa9oT//65yEAfHuNV6lvwNpSsA79ODikLGOPvZSk0ucjpRdUfOV1rFBkQ==
Received: from CH0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:610:cd::23)
 by DM3PPFFB06B43CF.namprd18.prod.outlook.com (2603:10b6:f:fc00::6d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:06:42 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::58) by CH0PR03CA0108.outlook.office365.com
 (2603:10b6:610:cd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 19:06:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 19:06:40 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 6CC2E40BFE0F;
	Mon, 16 Nov 2026 11:06:39 -0800 (PST)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Mon, 16 Nov 2026 11:06:19 -0800
Subject: [PATCH v5 5/6] usb: gadget: udc: crg: Add gadget and endpoint
 operations
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
Message-Id: <20261116-axiado-ax3000-usb-device-controller-v5-5-49271ed5c793@axiado.com>
References: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
In-Reply-To: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
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
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794855998; l=103485;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=NiS8T0H/oC2lRNV2EWAXRZNHxHUkvVOLStoDkmKL8aQ=;
 b=5WEJ+a+dlseeMmQ5tgm3EPFBVmocE7sMgQPasoTjs4pwxq0Z6hxS7J6lT9LlP3wzZuZd7XcBs
 t+seCXbnbydA9jQt49zLB2L3Mfd9/DuzgSOoVzEdocoKJtOdjzhVUAJ
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|DM3PPFFB06B43CF:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a8027d-932e-4b0d-0e89-08df4414bf42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|7416014|22082099003|18002099003|6133799003|261009221727099003|261009220027099003|261009223027099003|261009221227099003|261009223327099003|3023799007|5023799004|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261026130827099003|261026121527099003|261026135527099003|261021121427099003|261021130227099003|261022115727099003|261021135927099003|261021133027099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	xLMs/7Dlrtb8J/Cdw6JVCaTQiu5XUAt5iUV5/I6r8ONIuEbWG+PqYhLhSL9r5W1LFaztzMoBt2EVoep+pMqdIXtaWhXmFm1eu+r/KJ2C8o9kuC7zOXYdOK0pZVhrS2V0SNVciFoCJy5VPC0fU1oJLy02iGLXGnyKESYnqt60xFZX5qsZO8/bq5brN5hO4BA2GxNeAeykHbaqlOoTQUBoS9IZ/JCWfuxoBhgVxZACdXtNF7pHUVyKzaXTeuJgOdsl8O+5bjI8e87SIZeJefhdG1JvSxPszH1LgREleg0CCVTcj1s0FK20G4iCfze0sSTC73d8k565XYGc/oM8KKesLQsSU12K+G+z6J7xgzfvH7FxOnkc+Sa/DSD3VMfY/dyoW8G5KYmhOjG4T5JXzpz2XUgVoVEXxlJMLCiAZMezpJgIPlHV9/DRH/W4bzb5Z1ycTfq6wK8wnG/urJVRR/3ULlahBSuu59VMsAunsD84FLE0qw31U8bfr3FcNtvZIMbMufgrqybQ8/1+UGdJd6/LCKNWJM6jZzvHZfzgD2MRPzwZKfScMLQf4+PR8dZmOReM0FnoMY8Tc83iPNGYIt+iTUfWhWozzAsNBITOUnZC9nImaTPF631TDrWwhpzBJx3NaYpqxqfFtiusIXYGHseSlsLreA/eKjaiIv5f8seTTA2QLp8L+Ii8vSdttI1v5qtfjqSH/NjDFhfEawGE/HbNmg==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(7416014)(22082099003)(18002099003)(6133799003)(261009221727099003)(261009220027099003)(261009223027099003)(261009221227099003)(261009223327099003)(3023799007)(5023799004)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026130827099003)(261026121527099003)(261026135527099003)(261021121427099003)(261021130227099003)(261022115727099003)(261021135927099003)(261021133027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J3wypIVD/MfmZqmJSmaspfhJFNjiSRU3p2IFP2SN4E+i7mpWzAc8/h605MPYDTgGOY8XOSjgn8cQK7CKbLO9zfSk7W4DZg2ySKkbUjxppYAo7ix+arnT3Ps4YwWuDiCu2o0Lj6xjnTeC7psKjitqacaQnS7DlKHbBYizdoin6DihSSh1JGrWQ9mfIN+lrMmHU/U+L+zB81iXhEVt8/iXFtmvEi1CjyOITRA1LXUnT76hdkNLLi9xv5QoN5WRcJvfou2un9CwSCsxC/JBeYQg/ImD7me4GWiNEtwj0uhV2BhYw+SmQU+54r47lcl7RUWtUT+xJfsACfys8b036+PGnkj0CvYwJaYrcWsAsZbzgawiHZysSH7ksitJs14APKbyVrKYSnu5XWmIgAXXXauKNJtLm2/iCeKxjZz3UhaEpNnJWXljVYv3LkyyyYw/eGi0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:06:40.4018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a8027d-932e-4b0d-0e89-08df4414bf42
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFFB06B43CF

This patch implements the gadget and endpoint operations for the
Axiado AX3000/AX3005 UDC driver.

Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 drivers/usb/gadget/udc/crg/crg-udc-gadget.c | 3255 +++++++++++++++++++++++++++
 drivers/usb/gadget/udc/crg/crg-udc-trace.c  |    9 +
 2 files changed, 3264 insertions(+)

diff --git a/drivers/usb/gadget/udc/crg/crg-udc-gadget.c b/drivers/usb/gadget/udc/crg/crg-udc-gadget.c
new file mode 100644
index 000000000000..dddfc5cf3d3e
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-gadget.c
@@ -0,0 +1,3255 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ *
+ * Copyright (c) 2019 Corigine Inc.
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+#include <linux/gfp.h>
+#include <linux/highmem.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/jiffies.h>
+#include <linux/slab.h>
+
+#include "crg-udc.h"
+#include "crg-udc-trace.h"
+
+/* Forward declarations for functions used before their definition. */
+static int crg_udc_epcx_setup(struct crg_udc_ep *udc_ep);
+static int crg_udc_epcx_update_dqptr(struct crg_udc_ep *udc_ep);
+static int crg_udc_queue_trbs(struct crg_udc_ep *udc_ep_ptr,
+			      struct crg_udc_request *udc_req_ptr, bool b_isoc,
+			      u32 xfer_ring_size, u32 num_trbs_needed,
+			      u64 buffer_length);
+static int crg_udc_reinit(struct crg_gadget_dev *crg_udc, bool notify_reset);
+static bool crg_udc_sg_advance(struct crg_udc_request *udc_req, u32 bytes);
+static bool crg_udc_sg_current(struct crg_udc_request *udc_req, dma_addr_t *dma,
+			       u32 *len);
+static int crg_udc_sg_init(struct crg_udc_request *udc_req);
+static int crg_udc_validate_ep_desc(struct crg_udc_ep *udc_ep,
+				    const struct usb_endpoint_descriptor *desc);
+static bool is_request_dequeued(struct crg_gadget_dev *crg_udc,
+				struct crg_udc_ep *udc_ep,
+				struct crg_event_trb *event);
+static int crg_udc_stop_error_ep(struct crg_gadget_dev *crg_udc, u8 dci);
+
+static int crg_gadget_get_frame(struct usb_gadget *g)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(g);
+	unsigned long flags;
+	int frame = -ESHUTDOWN;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (!crg_udc->gadget_stopping && !crg_udc->shutting_down &&
+	    !crg_udc->resetting && !crg_udc->controller_recovering &&
+	    !crg_udc->suspended)
+		frame = FIELD_GET(CRG_U3DC_MFINDEX_FRAME_MASK,
+				  readl(&crg_udc->uccr->mfindex));
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return frame;
+}
+
+static int crg_gadget_pullup(struct usb_gadget *g, int is_on)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(g);
+	unsigned long flags;
+	int ret = 0;
+
+	/*
+	 * The core can call ->disconnect() as soon as pullup(0) returns.
+	 * Return the requests even if hardware stop required quarantine.
+	 */
+	if (!is_on) {
+		ret = crg_udc_stop_gadget(crg_udc);
+		if (!ret)
+			trace_crg_udc_pullup(false);
+		return ret;
+	}
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->shutting_down || crg_udc->controller_recovering ||
+	    (!crg_udc->gadget_stopping &&
+	     (crg_udc->resetting || crg_udc->controller_faulted))) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	if (crg_udc->gadget_stopping) {
+		ret = crg_udc_restart_gadget(crg_udc, &flags);
+		if (ret)
+			goto out;
+	} else if (crg_udc->stopped_needs_reset) {
+		ret = crg_udc_recover(crg_udc, &flags);
+		if (ret)
+			goto out;
+	}
+
+	crg_udc->pullup_on = true;
+	if (!crg_udc->suspended)
+		crg_udc_set_pullup(crg_udc, true);
+out:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (!ret)
+		trace_crg_udc_pullup(true);
+	return ret;
+}
+
+static int crg_gadget_set_remote_wakeup(struct usb_gadget *g, int set)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(g);
+	unsigned long flags;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc->u2_rwe = !!set;
+	g->wakeup_armed = !!set;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return 0;
+}
+
+static int crg_gadget_set_selfpowered(struct usb_gadget *g, int set)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(g);
+	unsigned long flags;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	g->is_selfpowered = !!set;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return 0;
+}
+
+static void crg_udc_set_speed(struct usb_gadget *gadget,
+			      enum usb_device_speed speed)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(gadget);
+
+	switch (speed) {
+	case USB_SPEED_FULL:
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+		break;
+	case USB_SPEED_LOW:
+		speed = USB_SPEED_FULL;
+		break;
+	default:
+		speed = gadget->max_speed;
+		break;
+	}
+	crg_udc->max_speed = min(speed, gadget->max_speed);
+}
+
+static int crg_gadget_start(struct usb_gadget *g,
+			    struct usb_gadget_driver *driver)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(g);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->shutting_down || crg_udc->controller_recovering ||
+	    (!crg_udc->gadget_stopping &&
+	     (crg_udc->resetting || crg_udc->controller_faulted))) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EBUSY;
+	}
+	if (crg_udc->gadget_stopping) {
+		ret = crg_udc_restart_gadget(crg_udc, &flags);
+	} else {
+		ret = crg_udc_program_speed(crg_udc);
+		if (!ret)
+			crg_udc_set_vbus_detect(crg_udc, true);
+	}
+	if (!ret)
+		crg_udc->gadget_driver = driver;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
+}
+
+static int crg_gadget_stop(struct usb_gadget *g)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(g);
+	unsigned long flags;
+	int i, ret;
+
+	ret = crg_udc_stop_gadget(crg_udc);
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc->gadget_driver = NULL;
+	for (i = 2; i < CRG_NUM_EP_CX; i++)
+		crg_udc_ep_clear_enabled(&crg_udc->udc_ep[i]);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
+}
+
+static int crg_gadget_wakeup(struct usb_gadget *g)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(g);
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	unsigned long flags;
+	u32 portsc;
+	int ret = 0;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->resetting) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	if (!crg_udc->connected || g->speed > USB_SPEED_HIGH) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+	if (!crg_udc->u2_rwe) {
+		ret = -EACCES;
+		goto out;
+	}
+
+	portsc = readl(&uccr->portsc);
+	if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, portsc) !=
+	    CRG_U3DC_PORTSC_PLS_U3) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	portsc &= ~(CRG_U3DC_PORTSC_W1C_MASK | CRG_U3DC_PORTSC_PLS_MASK);
+	portsc |= CRG_U3DC_PORTSC_LWS;
+	writel(portsc, &uccr->portsc);
+out:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
+}
+
+static void crg_gadget_async_callbacks(struct usb_gadget *g, bool enable)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(g);
+	unsigned long flags;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc->async_callbacks = enable;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	/* Also cover unbind paths that skip pullup(0). */
+	if (!enable)
+		crg_udc_stop_gadget(crg_udc);
+}
+
+struct usb_request *crg_udc_alloc_request(struct usb_ep *_ep, gfp_t gfp_flags)
+{
+	struct crg_udc_request *udc_req_ptr;
+
+	udc_req_ptr = kzalloc_obj(*udc_req_ptr, gfp_flags);
+
+	if (!udc_req_ptr)
+		return NULL;
+
+	udc_req_ptr->usb_req.dma = DMA_MAPPING_ERROR;
+	INIT_LIST_HEAD(&udc_req_ptr->queue);
+
+	trace_crg_udc_alloc_request(
+		container_of(_ep, struct crg_udc_ep, usb_ep), udc_req_ptr);
+
+	return &udc_req_ptr->usb_req;
+}
+
+int crg_udc_build_td(struct crg_udc_ep *udc_ep_ptr,
+		     struct crg_udc_request *udc_req_ptr)
+{
+	int status = 0;
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	u32 num_trbs_needed;
+	u64 buffer_length;
+
+	if (udc_req_ptr->trbs_needed) {
+		/* If this is called to complete pending TRB transfers
+		 * of previous Request
+		 */
+		buffer_length = udc_req_ptr->buff_len_left;
+		num_trbs_needed = udc_req_ptr->trbs_needed;
+	} else {
+		buffer_length = udc_req_ptr->usb_req.length;
+		if (udc_req_ptr->bounce && udc_req_ptr->bounce->sgt.nents)
+			num_trbs_needed = crg_udc_count_trbs_sg(udc_req_ptr);
+		else
+			num_trbs_needed = crg_udc_count_trbs_linear(
+				udc_req_ptr->bounce ? udc_req_ptr->bounce->dma : 0,
+				buffer_length);
+		if (!num_trbs_needed && buffer_length)
+			return -EINVAL;
+		if (!num_trbs_needed)
+			num_trbs_needed = 1;
+	}
+
+	if (usb_endpoint_xfer_control(udc_ep_ptr->desc))
+		status = crg_udc_queue_ctrl(udc_ep_ptr, udc_req_ptr,
+					    num_trbs_needed);
+	else if (usb_endpoint_xfer_isoc(udc_ep_ptr->desc))
+		status = crg_udc_queue_trbs(udc_ep_ptr, udc_req_ptr, true,
+					    CRG_UDC_ISOC_EP_TD_RING_SIZE,
+					    num_trbs_needed, buffer_length);
+	else if (usb_endpoint_xfer_bulk(udc_ep_ptr->desc))
+		status = crg_udc_queue_trbs(udc_ep_ptr, udc_req_ptr, false,
+					    CRG_UDC_BULK_EP_TD_RING_SIZE,
+					    num_trbs_needed, buffer_length);
+	else
+		/* interrupt endpoint */
+		status = crg_udc_queue_trbs(udc_ep_ptr, udc_req_ptr, false,
+					    CRG_UDC_INT_EP_TD_RING_SIZE,
+					    num_trbs_needed, buffer_length);
+
+	if (!status) {
+		udc_req_ptr->td_pending = true;
+		if (!usb_endpoint_xfer_control(udc_ep_ptr->desc))
+			crg_udc_knock_doorbell(crg_udc, udc_ep_ptr->dci);
+	}
+
+	return status;
+}
+
+void crg_udc_clear_portpm(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 tmp;
+
+	tmp = readl(&uccr->u3portpmsc);
+
+	tmp &= (~CRG_U3DC_U3PORTPM_U1IEN);
+	FIELD_MODIFY(CRG_U3DC_U3PORTPM_U1TMOUT_MASK, &tmp, 0);
+	tmp &= (~CRG_U3DC_U3PORTPM_U2IEN);
+	FIELD_MODIFY(CRG_U3DC_U3PORTPM_U2TMOUT_MASK, &tmp, 0);
+
+	writel(tmp, &uccr->u3portpmsc);
+
+	crg_udc->feature_u1_enable = 0;
+	crg_udc->feature_u2_enable = 0;
+}
+
+/* HALTED endpoints may hold requests for CLEAR_FEATURE(ENDPOINT_HALT).
+ * STOPPED endpoints may accept a requeue only while ep_dequeue() has
+ * confirmed STOP_EP and is giving a cancelled request back.
+ * Neither state may publish new TRBs until RUNNING again.
+ * Called with udc_lock held.
+ */
+static bool crg_udc_ep_can_queue(struct crg_udc_ep *ep)
+{
+	if (ep->nuking)
+		return false;
+
+	if (ep->ep_state == EP_STATE_RUNNING)
+		return true;
+
+	if (ep->dci == 0)
+		return false;
+
+	if (ep->ep_state == EP_STATE_HALTED)
+		return true;
+
+	return ep->ep_state == EP_STATE_STOPPED && ep->dequeue_paused;
+}
+
+static int crg_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
+{
+	struct crg_udc_ep *udc_ep_ptr;
+	struct crg_gadget_dev *crg_udc;
+	struct crg_uccr __iomem *uccr;
+	struct crg_udc_request *udc_req = NULL;
+	struct crg_udc_request *iter;
+	struct crg_ep_cx *p_ep_cx;
+	struct crg_transfer_trb *pause_pt;
+	enum crg_ep_state old_ep_state;
+	u32 tmp, deq_pt_lo, deq_pt_hi;
+	dma_addr_t dq_pt_addr;
+	u8 dci;
+	u32 generation;
+	unsigned long flags;
+	const struct usb_endpoint_descriptor *old_desc;
+	u32 event_generation;
+	int ret;
+
+	if (!_ep || !_req)
+		return -EINVAL;
+
+	udc_ep_ptr = container_of(_ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep_ptr->crg_udc;
+	uccr = crg_udc->uccr;
+	dci = udc_ep_ptr->dci;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	list_for_each_entry(iter, &udc_ep_ptr->queue, queue) {
+		if (&iter->usb_req == _req) {
+			udc_req = iter;
+			break;
+		}
+	}
+
+	if (!udc_req) {
+		ret = -EINVAL;
+		goto out;
+	}
+	if (crg_udc->shutting_down) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	if (crg_udc->resetting || crg_udc->controller_recovering ||
+	    crg_udc->gadget_stopping || crg_udc->endpoint_recovery_pending ||
+	    udc_ep_ptr->nuking || udc_ep_ptr->ep_state == EP_STATE_DISABLED) {
+		/* The pending teardown will give back this queued request. */
+		ret = 0;
+		goto out;
+	}
+	if (dci == 0) {
+		/* The abort schedules recovery on hardware failure. */
+		if (crg_udc->port_reset_pending || crg_udc->bus_reset_pending ||
+		    crg_udc_abort_ep0_for_setup(crg_udc) == -ESHUTDOWN)
+			crg_udc_schedule_endpoint_recovery(crg_udc);
+		ret = 0;
+		goto out;
+	}
+	if (crg_udc->port_reset_pending || crg_udc->bus_reset_pending) {
+		ret = 0;
+		goto out;
+	}
+	if (udc_ep_ptr->halt_failed) {
+		ret = -EIO;
+		goto recover;
+	}
+
+	old_ep_state = udc_ep_ptr->ep_state;
+	old_desc = udc_ep_ptr->desc;
+	event_generation = crg_udc->udc_event[0].generation;
+	generation = udc_ep_ptr->generation;
+
+	if (!udc_req->first_trb) {
+		/* This request was queued during HALT / STOP; no live TRB. */
+		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return 0;
+	}
+
+	/*
+	 * RUN=0 quiesces endpoint DMA but prevents STOP_EP / SET_TR_DQPTR.
+	 * Give the request back without touching the stopped hardware ring.
+	 * Force a full controller rebuild before RUN can be asserted again.
+	 */
+	if (!(readl(&uccr->control) & CRG_U3DC_CTRL_RUN)) {
+		ret = readl_poll_timeout_atomic(&uccr->ep_running, tmp,
+					      !(tmp & BIT(dci)), 10, 10000);
+		if (ret)
+			goto recover;
+		crg_udc->stopped_needs_reset = true;
+		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return 0;
+	}
+
+	/* A stopped ring may still contain published requests. */
+	if (old_ep_state == EP_STATE_STOPPED) {
+		ret = -EBUSY;
+		goto recover;
+	}
+
+	if (old_ep_state == EP_STATE_RUNNING) {
+		ret = crg_udc_issue_command(crg_udc, CRG_CMD_STOP_EP,
+						BIT(dci), 0);
+
+		if (ret)
+			goto recover;
+		ret = readl_poll_timeout_atomic(&uccr->ep_running, tmp,
+					       !(tmp & BIT(dci)), 10, 10000);
+		if (ret)
+			goto recover;
+		udc_ep_ptr->ep_state = EP_STATE_STOPPED;
+		udc_ep_ptr->dequeue_paused = true;
+	}
+
+	p_ep_cx = &crg_udc->p_epcx[dci - 2];
+	deq_pt_lo = le32_to_cpu(p_ep_cx->dw2) & EP_CX_TR_DQPT_LO_MASK;
+	deq_pt_hi = le32_to_cpu(p_ep_cx->dw3);
+	dq_pt_addr = (u64)deq_pt_lo | ((u64)deq_pt_hi << 32);
+	pause_pt = crg_udc_tran_trb_dma_to_virt(udc_ep_ptr, dq_pt_addr);
+	if (!pause_pt) {
+		ret = -EIO;
+		goto recover;
+	}
+
+	if (crg_udc_is_pointer_less_than(pause_pt, udc_req->first_trb,
+					 udc_ep_ptr)) {
+		crg_udc_squeeze_xfer_ring(udc_ep_ptr, udc_req);
+		/* Give back the cancelled request BEFORE scheduling the tail:
+		 * its callback may add/remove requests, and dropping udc_lock
+		 * while traversing the old list is unsafe.
+		 */
+		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
+	} else if (udc_req->last_trb &&
+		   crg_udc_is_pointer_less_than(udc_req->last_trb, pause_pt,
+						udc_ep_ptr)) {
+		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
+	} else {
+		struct crg_udc_request *next_req = NULL;
+
+		udc_req->usb_req.actual =
+			crg_udc_actual_before(udc_ep_ptr, udc_req, pause_pt);
+
+		if (!list_is_last(&udc_req->queue, &udc_ep_ptr->queue))
+			next_req = list_entry(udc_req->queue.next,
+					      struct crg_udc_request, queue);
+
+		if (next_req && next_req->first_trb)
+			udc_ep_ptr->deq_pt = next_req->first_trb;
+		else
+			udc_ep_ptr->deq_pt = udc_ep_ptr->enq_pt;
+
+		ret = crg_udc_epcx_update_dqptr(udc_ep_ptr);
+		if (ret)
+			goto recover;
+		udc_ep_ptr->tran_ring_full = false;
+		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
+	}
+
+	/* Stop accepting deferred queues before resuming the endpoint. */
+	if (udc_ep_ptr->generation == generation &&
+	    udc_ep_ptr->desc == old_desc)
+		udc_ep_ptr->dequeue_paused = false;
+
+	if (old_ep_state == EP_STATE_RUNNING && !crg_udc->resetting &&
+	    !crg_udc->port_reset_pending &&
+	    !crg_udc->endpoint_recovery_pending &&
+	    !udc_ep_ptr->halt_failed &&
+	    udc_ep_ptr->desc == old_desc &&
+	    event_generation == crg_udc->udc_event[0].generation &&
+	    udc_ep_ptr->generation == generation &&
+	    udc_ep_ptr->ep_state == EP_STATE_STOPPED) {
+		udc_ep_ptr->ep_state = EP_STATE_RUNNING;
+		udc_ep_ptr->tran_ring_full = false;
+		if (crg_udc_queue_pending_trbs(udc_ep_ptr))
+			udc_ep_ptr->tran_ring_full = true;
+		/* Queue processing can give back requests and drop udc_lock. */
+		if (!crg_udc->resetting && !crg_udc->port_reset_pending &&
+		    !crg_udc->endpoint_recovery_pending &&
+		    !udc_ep_ptr->halt_failed && udc_ep_ptr->desc == old_desc &&
+		    udc_ep_ptr->generation == generation &&
+		    udc_ep_ptr->ep_state == EP_STATE_RUNNING)
+			crg_udc_knock_doorbell(crg_udc, dci);
+	}
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return 0;
+
+recover:
+	/*
+	 * A gadget may hold its own lock across dequeue. Leave requests
+	 * mapped and let the worker reset the controller and give them back.
+	 */
+	dev_err(crg_udc->dev, "EP%d dequeue failed (%d); scheduling recovery\n",
+		dci, ret);
+	udc_ep_ptr->dequeue_paused = false;
+	udc_ep_ptr->halt_failed = true;
+	udc_ep_ptr->ep_state = EP_STATE_STOPPED;
+	crg_udc_schedule_endpoint_recovery(crg_udc);
+	ret = 0;
+out:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
+}
+
+/* endpoint operations */
+
+static int crg_udc_ep_disable(struct usb_ep *ep)
+{
+	struct crg_udc_ep *udc_ep;
+	struct crg_gadget_dev *crg_udc;
+	struct crg_ep_cx *p_ep_cx;
+	struct crg_uccr __iomem *uccr;
+	unsigned long flags;
+	u32 running;
+	int ret;
+
+	if (!ep)
+		return -EINVAL;
+	udc_ep = container_of(ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep->crg_udc;
+	if (udc_ep->dci == 0)
+		return 0;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	/* A completion callback must not restart disable during giveback. */
+	if (udc_ep->nuking) {
+		ret = -EBUSY;
+		goto out;
+	}
+	if (udc_ep->configuring) {
+		ret = -EBUSY;
+		goto out;
+	}
+	if (udc_ep->ep_state == EP_STATE_DISABLED) {
+		/*
+		 * A reset can mark this endpoint disabled before reaching its
+		 * queue. A callback from another endpoint may disable it now.
+		 * Give back its requests before returning success.
+		 */
+		crg_udc_ep_nuke(udc_ep, -ESHUTDOWN);
+		udc_ep->desc = NULL;
+		udc_ep->comp_desc = NULL;
+		udc_ep->usb_ep.enabled = false;
+		ret = 0;
+		goto out;
+	}
+	if (crg_udc->resetting || crg_udc->controller_recovering) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+
+	uccr = crg_udc->uccr;
+	p_ep_cx = &crg_udc->p_epcx[udc_ep->dci - 2];
+	/* The disable attempt owns this endpoint until DMA is quiescent. */
+	udc_ep->ep_state = EP_STATE_STOPPED;
+	udc_ep->dequeue_paused = false;
+	writel(BIT(udc_ep->dci), &uccr->ep_enable);
+	/*
+	 * Wait once for each hardware state, with a bounded timeout. DWC3's
+	 * delayed-stop retry uses a controller-specific SETUP event which CRG
+	 * does not currently have. An asynchronous retry must not outlive
+	 * usb_ep_disable() while Gadget owns the original request buffers.
+	 */
+	ret = readl_poll_timeout_atomic(&uccr->ep_enable, running,
+					!(running & BIT(udc_ep->dci)), 10, 10000);
+	if (ret)
+		goto disable_failed;
+	/* A cleared enable bit alone does not prove DMA is idle. */
+	ret = readl_poll_timeout_atomic(&uccr->ep_running, running,
+					!(running & BIT(udc_ep->dci)), 10, 10000);
+	if (ret)
+		goto disable_failed;
+
+	/* Endpoint DMA is stopped: mappings can now be released. */
+	udc_ep->disable_failed = false;
+	udc_ep->halt_failed = false;
+	udc_ep->dequeue_paused = false;
+	udc_ep->generation++;
+	udc_ep->desc = NULL;
+	udc_ep->comp_desc = NULL;
+	udc_ep->ep_state = EP_STATE_DISABLED;
+	udc_ep->tran_ring_full = false;
+	if (crg_udc->num_enabled_eps)
+		crg_udc->num_enabled_eps--;
+	memset(p_ep_cx, 0, sizeof(*p_ep_cx));
+
+	if (!crg_udc->num_enabled_eps &&
+	    crg_udc->device_state == USB_STATE_CONFIGURED)
+		crg_udc->device_state = USB_STATE_ADDRESS;
+
+	/* crg_udc_req_done() drops the lock during giveback. All endpoint
+	 * state has to be finalized before that can happen.
+	 */
+	crg_udc_ep_nuke(udc_ep, -ESHUTDOWN);
+	udc_ep->usb_ep.enabled = false;
+	ret = 0;
+	goto out;
+
+disable_failed:
+	/*
+	 * usb_ep_disable() may be called with IRQs disabled, and a gadget may
+	 * release its requests as soon as this call returns. A background
+	 * reset alone cannot make the outstanding DMA buffers safe to free.
+	 * Block the endpoint first, then quiesce the entire controller now.
+	 */
+	udc_ep->disable_failed = true;
+	udc_ep->halt_failed = true;
+	dev_err(crg_udc->dev,
+		"EP%d disable failed (%d); attempting controller reset\n",
+		udc_ep->dci, ret);
+
+	ret = crg_udc_recover_endpoints(crg_udc, &flags);
+	if (ret && udc_ep->ep_state == EP_STATE_DISABLED && !udc_ep->nuking &&
+	    list_empty(&udc_ep->queue))
+		udc_ep->usb_ep.enabled = false;
+
+out:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
+}
+
+static int crg_udc_ep_enable(struct usb_ep *ep,
+			     const struct usb_endpoint_descriptor *desc)
+{
+	struct crg_udc_ep *udc_ep;
+	struct crg_gadget_dev *crg_udc;
+	size_t len;
+	unsigned long flags;
+	u32 ring_size, param0;
+	int ret;
+
+	if (!ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT)
+		return -EINVAL;
+	udc_ep = container_of(ep, struct crg_udc_ep, usb_ep);
+	if (udc_ep->dci == 0)
+		return 0;
+	crg_udc = udc_ep->crg_udc;
+
+	if (usb_endpoint_xfer_bulk(desc))
+		ring_size = CRG_UDC_BULK_EP_TD_RING_SIZE;
+	else if (usb_endpoint_xfer_isoc(desc))
+		ring_size = CRG_UDC_ISOC_EP_TD_RING_SIZE;
+	else if (usb_endpoint_xfer_int(desc))
+		ring_size = CRG_UDC_INT_EP_TD_RING_SIZE;
+	else
+		return -EINVAL;
+	len = ring_size * sizeof(struct crg_transfer_trb);
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (!crg_udc->gadget_driver || crg_udc->controller_faulted ||
+	    crg_udc->resetting || crg_udc->gadget_stopping ||
+	    crg_udc->controller_recovering ||
+	    crg_udc->endpoint_recovery_pending ||
+	    crg_udc->shutting_down || crg_udc->bus_reset_pending ||
+	    crg_udc->port_reset_pending) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	if (udc_ep->nuking || udc_ep->configuring ||
+	    udc_ep->disable_failed ||
+	    udc_ep->ep_state != EP_STATE_DISABLED) {
+		ret = -EBUSY;
+		goto out;
+	}
+	udc_ep->configuring = true;
+	udc_ep->desc = desc;
+	udc_ep->comp_desc = ep->comp_desc;
+	ret = crg_udc_validate_ep_desc(udc_ep, desc);
+	if (ret)
+		goto err;
+
+	/* Rings are allocated at probe, outside the atomic enable path. */
+	if (!udc_ep->tran_ring_info.cpu_addr ||
+	    udc_ep->tran_ring_info.len < len) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	udc_ep->first_trb = udc_ep->tran_ring_info.cpu_addr;
+	udc_ep->last_trb = udc_ep->first_trb + ring_size - 1;
+	memset(udc_ep->first_trb, 0, len);
+	dma_wmb();
+	crg_udc_setup_link_trb(udc_ep->last_trb, true,
+				 udc_ep->tran_ring_info.dma_addr);
+	udc_ep->enq_pt = udc_ep->first_trb;
+	udc_ep->deq_pt = udc_ep->first_trb;
+	udc_ep->pcs = 1;
+	udc_ep->tran_ring_full = false;
+	ret = crg_udc_epcx_setup(udc_ep);
+	if (ret)
+		goto err;
+	param0 = BIT(udc_ep->dci);
+	ret = crg_udc_issue_command(crg_udc, CRG_CMD_CONFIG_EP, param0, 0);
+	if (ret)
+		goto err;
+
+	udc_ep->generation++;
+	/* usb_ep.maxpacket must reflect the descriptor actually configured. */
+	udc_ep->usb_ep.maxpacket = usb_endpoint_maxp(desc);
+	udc_ep->wedge = false;
+	udc_ep->halt_failed = false;
+	udc_ep->disable_failed = false;
+	udc_ep->dequeue_paused = false;
+	udc_ep->usb_ep.enabled = 1;
+	udc_ep->ep_state = EP_STATE_RUNNING;
+	udc_ep->configuring = false;
+	crg_udc->num_enabled_eps++;
+	if (crg_udc->device_state == USB_STATE_ADDRESS)
+		crg_udc->device_state = USB_STATE_CONFIGURED;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return 0;
+
+err:
+	udc_ep->desc = NULL;
+	udc_ep->comp_desc = NULL;
+	udc_ep->configuring = false;
+	/* Keep the preallocated ring for a later retry. */
+	udc_ep->ep_state = EP_STATE_DISABLED;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
+out:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
+}
+
+void crg_udc_ep_nuke(struct crg_udc_ep *udc_ep, int status)
+{
+	struct crg_udc_request *req;
+
+	/*
+	 * A giveback may re-enter ep_nuke() via disable or reset. The outer
+	 * drain still owns all originally queued requests, so do not nest it.
+	 * Also reject new queue/enable operations until the drain is finished.
+	 */
+	if (udc_ep->nuking)
+		return;
+
+	udc_ep->nuking = true;
+	while (!list_empty(&udc_ep->queue)) {
+		req = list_first_entry(&udc_ep->queue,
+				       struct crg_udc_request, queue);
+		crg_udc_req_done(udc_ep, req, status);
+	}
+	udc_ep->nuking = false;
+	if (udc_ep->clear_enabled_on_nuke) {
+		udc_ep->clear_enabled_on_nuke = false;
+		udc_ep->usb_ep.enabled = false;
+	}
+}
+
+/* The CPU page list stays intact even if dma_map_sgtable() merges entries. */
+static size_t crg_udc_copy_bounce_pages(struct crg_udc_bounce *bounce,
+				       struct usb_request *req, size_t len)
+{
+	bool to_bounce = bounce->dir == DMA_TO_DEVICE;
+	struct sg_mapping_iter miter;
+	struct page *page;
+	unsigned int sg_flags = to_bounce ? SG_MITER_FROM_SG : SG_MITER_TO_SG;
+	size_t done = 0;
+
+	if (req->num_sgs)
+		sg_miter_start(&miter, req->sg, req->num_sgs,
+			       SG_MITER_ATOMIC | sg_flags);
+
+	list_for_each_entry(page, &bounce->pages, lru) {
+		size_t count = min_t(size_t, PAGE_SIZE, len - done);
+		size_t offset = 0;
+		void *vaddr;
+
+		if (!count)
+			break;
+
+		vaddr = kmap_local_page(page);
+		if (req->num_sgs) {
+			while (offset < count && sg_miter_next(&miter)) {
+				size_t chunk = min(miter.length, count - offset);
+
+				if (to_bounce)
+					memcpy(vaddr + offset, miter.addr, chunk);
+				else
+					memcpy(miter.addr, vaddr + offset, chunk);
+				miter.consumed = chunk;
+				offset += chunk;
+			}
+			sg_miter_stop(&miter);
+		} else {
+			if (to_bounce)
+				memcpy(vaddr, req->buf + done, count);
+			else
+				memcpy(req->buf + done, vaddr, count);
+			offset = count;
+		}
+		kunmap_local(vaddr);
+
+		done += offset;
+		if (offset != count)
+			break;
+	}
+	return done;
+}
+
+static int crg_udc_bounce_map_pages(struct device *dev,
+				   struct crg_udc_bounce *bounce,
+				   struct usb_request *req, gfp_t gfp)
+{
+	unsigned int nr_pages = DIV_ROUND_UP_ULL(req->length, PAGE_SIZE);
+	size_t remaining = req->length;
+	struct scatterlist *sg;
+	unsigned int i;
+	int ret;
+
+	if (bounce->dir == DMA_FROM_DEVICE)
+		gfp |= __GFP_ZERO;
+	ret = sg_alloc_table(&bounce->sgt, nr_pages, gfp);
+	if (ret)
+		return ret;
+
+	for_each_sgtable_sg(&bounce->sgt, sg, i) {
+		size_t len = min_t(size_t, remaining, PAGE_SIZE);
+		struct page *page = alloc_page(gfp);
+
+		if (!page)
+			return -ENOMEM;
+
+		list_add_tail(&page->lru, &bounce->pages);
+		sg_set_page(sg, page, len, 0);
+		remaining -= len;
+	}
+
+	if (bounce->dir == DMA_TO_DEVICE &&
+	    crg_udc_copy_bounce_pages(bounce, req, req->length) != req->length)
+		return -EINVAL;
+
+	return dma_map_sgtable(dev, &bounce->sgt, bounce->dir, 0);
+}
+
+static int crg_udc_bounce_map_ep0(struct device *dev,
+				 struct crg_udc_bounce *bounce,
+				 struct usb_request *req, gfp_t gfp)
+{
+	bounce->buf = kzalloc(req->length, gfp);
+	if (!bounce->buf)
+		return -ENOMEM;
+
+	if (bounce->dir == DMA_TO_DEVICE)
+		memcpy(bounce->buf, req->buf, req->length);
+
+	bounce->dma = dma_map_single(dev, bounce->buf, bounce->len, bounce->dir);
+	return dma_mapping_error(dev, bounce->dma) ? -EIO : 0;
+}
+
+int crg_udc_bounce_map_request(struct crg_udc_ep *udc_ep,
+			       struct crg_udc_request *udc_req,
+			       enum dma_data_direction dir, gfp_t gfp)
+{
+	struct device *dev = udc_ep->crg_udc->dev;
+	struct usb_request *req = &udc_req->usb_req;
+	struct crg_udc_bounce *bounce;
+	int nents, ret;
+
+	if (!req->length)
+		return 0;
+	if (udc_req->bounce)
+		return -EBUSY;
+
+	/* CPU copies require buffers the UDC is allowed to access. */
+	if (req->sg_was_mapped || req->dma_mapped)
+		return -EOPNOTSUPP;
+	if (req->num_sgs) {
+		if (!req->sg)
+			return -EINVAL;
+		nents = sg_nents_for_len(req->sg, req->length);
+		if (nents < 0 || nents > req->num_sgs)
+			return -EINVAL;
+	} else if (!req->buf) {
+		return -EINVAL;
+	}
+
+	bounce = kzalloc(sizeof(*bounce), gfp);
+	if (!bounce)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&bounce->pages);
+	bounce->dir = dir;
+	bounce->len = req->length;
+	udc_req->bounce = bounce;
+
+	if (udc_ep->dci)
+		ret = crg_udc_bounce_map_pages(dev, bounce, req, gfp);
+	else
+		ret = crg_udc_bounce_map_ep0(dev, bounce, req, gfp);
+
+	if (ret) {
+		crg_udc_unmap_request(udc_ep, udc_req, 0);
+		return ret;
+	}
+
+	bounce->mapped = true;
+	return 0;
+}
+
+static int crg_udc_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
+			    gfp_t gfp_flags)
+{
+	struct crg_udc_request *udc_req_ptr;
+	struct crg_udc_ep *udc_ep_ptr;
+	struct crg_gadget_dev *crg_udc;
+	enum dma_data_direction dma_data_dir;
+	const struct usb_endpoint_descriptor *desc;
+	unsigned long flags;
+	int status;
+	bool is_sg;
+	u8 setup_tag = 0;
+	enum crg_setup_status setup_status = WAIT_FOR_SETUP;
+	u32 generation = 0;
+
+	if (!_ep || !_req)
+		return -EINVAL;
+
+	udc_req_ptr = container_of(_req, struct crg_udc_request, usb_req);
+	udc_ep_ptr = container_of(_ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep_ptr->crg_udc;
+	is_sg = _req->num_sgs != 0 && _req->length != 0;
+
+	if (is_sg && !_req->sg)
+		return -EINVAL;
+	if (_req->stream_id)
+		return -EOPNOTSUPP;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	/*
+	 * A completion callback for an aborted EP0 transfer may requeue the
+	 * same request. Reject EP0 requests while the previous control
+	 * transfer is being aborted or EP0 is in an error state. EP0 becomes
+	 * available again only after the new SETUP has been accepted and
+	 * the EP0 transfer ring has been successfully reinitialized.
+	 */
+	if (udc_ep_ptr->dci == 0 && crg_udc->ep0_state != EP0_STATE_IDLE) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -ECONNRESET;
+	}
+	if (!udc_ep_ptr->first_trb || !_req->complete ||
+	    (_req->length && !is_sg && !_req->buf) ||
+	    !list_empty(&udc_req_ptr->queue)) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+	/*
+	 * pullup(false) stops RUN without necessarily changing the EP
+	 * generation. Do not accept requests into a stopped USB session.
+	 */
+	if (!crg_udc_gadget_ready(crg_udc) ||
+	    crg_udc->bus_reset_pending || crg_udc->port_reset_pending) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -ESHUTDOWN;
+	}
+	if (!udc_ep_ptr->desc) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+	desc = udc_ep_ptr->desc;
+	if (udc_ep_ptr->halt_failed ||
+	    !crg_udc_ep_can_queue(udc_ep_ptr) ||
+	    udc_ep_ptr->configuring) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -ESHUTDOWN;
+	}
+	setup_tag = crg_udc->setup_tag;
+	if (udc_ep_ptr->dci == 0)
+		setup_status = crg_udc->setup_status;
+	generation = udc_ep_ptr->generation;
+
+	if (usb_endpoint_xfer_control(udc_ep_ptr->desc) && is_sg) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EOPNOTSUPP;
+	}
+
+	if (usb_endpoint_xfer_control(udc_ep_ptr->desc) && !_req->length) {
+		if (crg_udc->setup_status == SETUP_PKT_PROCESS_IN_PROGRESS) {
+			/* Only a control request without DATA needs STATUS now. */
+			crg_udc_clear_req_container(udc_req_ptr);
+			crg_udc->setup_status = STATUS_STAGE_XFER;
+			status = crg_udc_build_ep0_status(udc_ep_ptr, false,
+						 -EINPROGRESS, udc_req_ptr, 0, 0);
+			if (status)
+				crg_udc->setup_status = SETUP_PKT_PROCESS_IN_PROGRESS;
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return status;
+		}
+		/* A zero-length DATA stage still needs a DATA-stage TRB. */
+		if (crg_udc->setup_status != DATA_STAGE_XFER &&
+		    crg_udc->setup_status != DATA_STAGE_RECV) {
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return -EINVAL;
+		}
+	}
+
+	if (usb_endpoint_xfer_control(udc_ep_ptr->desc)) {
+		if (crg_udc->setup_status == DATA_STAGE_XFER ||
+		    crg_udc->setup_status == STATUS_STAGE_XFER) {
+			dma_data_dir = DMA_TO_DEVICE;
+		} else if (crg_udc->setup_status == DATA_STAGE_RECV ||
+			   crg_udc->setup_status == STATUS_STAGE_RECV) {
+			dma_data_dir = DMA_FROM_DEVICE;
+		} else {
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return -EINVAL;
+		}
+	} else {
+		dma_data_dir = usb_endpoint_dir_in(udc_ep_ptr->desc) ?
+				       DMA_TO_DEVICE :
+				       DMA_FROM_DEVICE;
+	}
+	crg_udc->queueing++;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	crg_udc_clear_req_container(udc_req_ptr);
+
+	status = crg_udc_bounce_map_request(udc_ep_ptr, udc_req_ptr,
+					   dma_data_dir, gfp_flags);
+	if (status)
+		goto out_queueing;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (udc_ep_ptr->desc != desc || !udc_req_ptr->usb_req.complete ||
+	    !list_empty(&udc_req_ptr->queue) ||
+	    !crg_udc_gadget_ready(crg_udc) ||
+	    crg_udc->bus_reset_pending || crg_udc->port_reset_pending ||
+	    udc_ep_ptr->configuring || udc_ep_ptr->halt_failed ||
+	    !crg_udc_ep_can_queue(udc_ep_ptr) ||
+	    udc_ep_ptr->generation != generation ||
+	    (udc_ep_ptr->dci == 0 &&
+	     (crg_udc->ep0_state != EP0_STATE_IDLE ||
+	      crg_udc->setup_status != setup_status ||
+	      crg_udc->setup_tag != setup_tag))) {
+		status = -ESHUTDOWN;
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		goto unmap;
+	}
+
+	_req->status = -EINPROGRESS;
+	_req->actual = 0;
+
+	/* A halted or temporarily stopped endpoint may accept requests,
+	 * but no TRBs may be published until it resumes.
+	 */
+	if (udc_ep_ptr->ep_state != EP_STATE_RUNNING) {
+		status = 0;
+	} else if (!list_empty(&udc_ep_ptr->queue)) {
+		struct crg_udc_request *tail;
+
+		tail = list_last_entry(&udc_ep_ptr->queue,
+				       struct crg_udc_request, queue);
+		status = (!tail->all_trbs_queued ||
+			  udc_ep_ptr->tran_ring_full) ? 0 :
+			 crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+	} else if (udc_ep_ptr->tran_ring_full) {
+		status = 0;
+	} else {
+		status = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+	}
+
+	if (!status) {
+		list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+		goto out_locked;
+	}
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+unmap:
+	crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr, 0);
+out_queueing:
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+out_locked:
+	crg_udc->queueing--;
+	if (crg_udc->gadget_stopping && !crg_udc->queueing)
+		wake_up(&crg_udc->teardown_wait);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return status;
+}
+
+static int crg_udc_ep_set_halt(struct usb_ep *_ep, int value)
+{
+	struct crg_udc_ep *udc_ep_ptr;
+	int status;
+	unsigned long flags = 0;
+	struct crg_gadget_dev *crg_udc;
+
+	if (!_ep)
+		return -EINVAL;
+
+	udc_ep_ptr = container_of(_ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep_ptr->crg_udc;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (!udc_ep_ptr->desc) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+	/*
+	 * A previous HALT/STOP failure retained the queue for DMA safety.
+	 * Do not reject the HALT retry merely because requests remain queued.
+	 */
+	if (value && !udc_ep_ptr->halt_failed &&
+	    usb_endpoint_dir_in(udc_ep_ptr->desc) &&
+	    !list_empty(&udc_ep_ptr->queue)) {
+		dev_err(crg_udc->dev, "set_halt: list not empty\n");
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EAGAIN;
+	}
+
+	status = crg_udc_ep_halt(udc_ep_ptr, value, 1, &flags);
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return status;
+}
+
+static int crg_udc_ep_set_wedge(struct usb_ep *_ep)
+{
+	struct crg_udc_ep *udc_ep_ptr;
+	bool was_wedged;
+	int status;
+	unsigned long flags = 0;
+	struct crg_gadget_dev *crg_udc;
+
+	if (!_ep)
+		return -EINVAL;
+
+	udc_ep_ptr = container_of(_ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep_ptr->crg_udc;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+
+	if (!udc_ep_ptr->desc) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+
+	/* Like set_halt(), do not cancel queued IN requests.  A failed
+	 * HALT/STOP may be retried even though its queue remains populated.
+	 */
+	if (!udc_ep_ptr->halt_failed &&
+	    usb_endpoint_dir_in(udc_ep_ptr->desc) &&
+	    !list_empty(&udc_ep_ptr->queue)) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EAGAIN;
+	}
+
+	was_wedged = udc_ep_ptr->wedge;
+	udc_ep_ptr->wedge = true;
+	status = crg_udc_ep_halt(udc_ep_ptr, 1, 1, &flags);
+	if (status)
+		udc_ep_ptr->wedge = was_wedged;
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return status;
+}
+
+static int crg_udc_epcx_setup(struct crg_udc_ep *udc_ep)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+	const struct usb_endpoint_descriptor *desc = udc_ep->desc;
+	const struct usb_ss_ep_comp_descriptor *comp_desc = udc_ep->comp_desc;
+	u8 dci = udc_ep->dci;
+	struct crg_ep_cx *epcx = &crg_udc->p_epcx[dci - 2];
+	enum crg_ep_type ep_type;
+	u16 maxburst = 0;
+	u8 maxstreams = 0;
+	u16 maxsize;
+	u32 dw;
+
+	/* corigine gadget dir should be opposite to host dir */
+	if (usb_endpoint_dir_out(desc))
+		ep_type = usb_endpoint_type(desc) + EP_TYPE_INVALID2;
+	else
+		ep_type = usb_endpoint_type(desc);
+
+	maxsize = usb_endpoint_maxp(desc) & 0x07ff;
+
+	if (crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+		if (!comp_desc)
+			return -EINVAL;
+		maxburst = comp_desc->bMaxBurst;
+
+		if (usb_endpoint_xfer_bulk(udc_ep->desc))
+			maxstreams = comp_desc->bmAttributes & 0x1f;
+
+	} else if ((crg_udc->gadget.speed == USB_SPEED_HIGH ||
+		    crg_udc->gadget.speed == USB_SPEED_FULL) &&
+		   (usb_endpoint_xfer_int(udc_ep->desc) ||
+		    usb_endpoint_xfer_isoc(udc_ep->desc))) {
+		if (crg_udc->gadget.speed == USB_SPEED_HIGH)
+			maxburst = usb_endpoint_maxp_mult(desc) - 1;
+		if (maxburst == 0x3) {
+			dev_err(crg_udc->dev, "invalid maxburst\n");
+			maxburst = 0x2;
+		}
+	}
+
+	/* fill ep_dw0 */
+	dw = 0;
+	FIELD_MODIFY(EP_CX_LOGICAL_EP_NUM_MASK, &dw, udc_ep->dci / 2);
+	FIELD_MODIFY(EP_CX_INTERVAL_MASK, &dw, desc->bInterval);
+	if (maxstreams) {
+		dev_err(crg_udc->dev, "maxstream=%d is not expected\n",
+			maxstreams);
+	}
+	epcx->dw0 = cpu_to_le32(dw);
+
+	/* fill ep_dw1 */
+	dw = 0;
+	FIELD_MODIFY(EP_CX_EP_TYPE_MASK, &dw, ep_type);
+	FIELD_MODIFY(EP_CX_MAX_PACKET_SIZE_MASK, &dw, maxsize);
+	FIELD_MODIFY(EP_CX_MAX_BURST_SIZE_MASK, &dw, maxburst);
+	epcx->dw1 = cpu_to_le32(dw);
+
+	/* fill ep_dw2 */
+	dw = lower_32_bits(udc_ep->tran_ring_info.dma_addr) &
+	     EP_CX_TR_DQPT_LO_MASK;
+	FIELD_MODIFY(EP_CX_DEQ_CYC_STATE_MASK, &dw, udc_ep->pcs);
+	epcx->dw2 = cpu_to_le32(dw);
+
+	/* fill ep_dw3 */
+	dw = upper_32_bits(udc_ep->tran_ring_info.dma_addr);
+	epcx->dw3 = cpu_to_le32(dw);
+	/* Ensure that epcx is updated */
+	dma_wmb();
+	return 0;
+}
+
+static int crg_udc_epcx_update_dqptr(struct crg_udc_ep *udc_ep)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+	u8 dci = udc_ep->dci;
+	struct crg_ep_cx *epcx;
+	u32 dw;
+	dma_addr_t dqptaddr;
+	u32 cmd_param0;
+
+	if (dci < 2 || dci >= CRG_NUM_EP_CX) {
+		dev_err(crg_udc->dev, "invalid DCI %u for dequeue pointer\n", dci);
+		return -EINVAL;
+	}
+
+	epcx = &crg_udc->p_epcx[dci - 2];
+	dqptaddr = crg_udc_tran_trb_virt_to_dma(udc_ep, udc_ep->deq_pt);
+
+	if (dqptaddr == DMA_MAPPING_ERROR)
+		return -EINVAL;
+
+	/* fill ep_dw2 */
+	dw = lower_32_bits(dqptaddr) & EP_CX_TR_DQPT_LO_MASK;
+	/* The consumer cycle can lag the producer by one ring wrap. */
+	FIELD_MODIFY(EP_CX_DEQ_CYC_STATE_MASK, &dw,
+		     udc_ep->deq_pt > udc_ep->enq_pt ?
+		     udc_ep->pcs ^ 1 : udc_ep->pcs);
+	epcx->dw2 = cpu_to_le32(dw);
+
+	/* fill ep_dw3 */
+	dw = upper_32_bits(dqptaddr);
+	epcx->dw3 = cpu_to_le32(dw);
+
+	cmd_param0 = BIT(udc_ep->dci);
+	/* Ensure that dqptr is updated */
+	dma_wmb();
+
+	return crg_udc_issue_command(crg_udc, CRG_CMD_SET_TR_DQPTR, cmd_param0, 0);
+}
+
+void crg_udc_free_request(struct usb_ep *_ep, struct usb_request *_req)
+{
+	struct crg_udc_request *udc_req_ptr;
+
+	if (!_ep || !_req)
+		return;
+
+	udc_req_ptr = container_of(_req, struct crg_udc_request, usb_req);
+
+	trace_crg_udc_free_request(container_of(_ep, struct crg_udc_ep, usb_ep),
+				   udc_req_ptr);
+
+	/* A queued request is returned through its completion callback. */
+	if (!list_empty(&udc_req_ptr->queue) || udc_req_ptr->bounce) {
+		struct crg_udc_ep *ep = container_of(_ep, struct crg_udc_ep, usb_ep);
+
+		dev_err_ratelimited(ep->crg_udc->dev, "freeing active request on %s\n",
+				    _ep->name);
+		return;
+	}
+
+	kfree(udc_req_ptr);
+}
+
+static int crg_udc_queue_trbs(struct crg_udc_ep *udc_ep_ptr,
+			      struct crg_udc_request *udc_req_ptr, bool b_isoc,
+			      u32 xfer_ring_size, u32 num_trbs_needed,
+			      u64 buffer_length)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	struct crg_transfer_trb *p_xfer_ring = udc_ep_ptr->first_trb;
+	struct crg_transfer_trb *enq_pt = udc_ep_ptr->enq_pt;
+	struct usb_request *usb_req = &udc_req_ptr->usb_req;
+	/* Plan the whole TD before touching hardware-visible TRBs. */
+	struct {
+		dma_addr_t dma;
+		u32 len;
+	} plan[32];
+	struct crg_udc_request sg_cursor = {
+		.bounce = udc_req_ptr->bounce,
+		.sg = udc_req_ptr->sg,
+		.sg_index = udc_req_ptr->sg_index,
+		.sg_offset = udc_req_ptr->sg_offset,
+	};
+	u64 remaining = buffer_length;
+	u32 num_trbs_ava, count, i;
+	u32 td_trbs, td_size, td_bytes, td_done = 0;
+	u32 td_start_offset = usb_req->length - buffer_length;
+	u32 j = 1;
+	u32 intr_rate = b_isoc ? CRG_UDC_ISOC_EP_INTERRUPT_RATE :
+				 CRG_UDC_BULK_EP_INTERRUPT_RATE;
+	bool full_td = true;
+	bool need_zlp = false;
+	bool is_sg = udc_req_ptr->bounce && udc_req_ptr->bounce->sgt.nents;
+	u8 original_pcs = udc_ep_ptr->pcs;
+
+	if (!udc_ep_ptr->usb_ep.maxpacket)
+		return -EINVAL;
+
+	if (!b_isoc && usb_req->zero && usb_req->length &&
+	    !(usb_req->length % udc_ep_ptr->usb_ep.maxpacket))
+		need_zlp = true;
+
+	if (!num_trbs_needed)
+		return -EINVAL;
+
+	/* TD_SIZE is five bits. A request may span multiple 32-TRB TDs. */
+	td_trbs = min_t(u32, num_trbs_needed, ARRAY_SIZE(plan));
+	num_trbs_ava = crg_udc_room_on_ring(crg_udc, xfer_ring_size,
+					    p_xfer_ring, udc_ep_ptr->enq_pt,
+					    udc_ep_ptr->deq_pt);
+
+	if (num_trbs_ava < td_trbs) {
+		if (b_isoc)
+			return -EBUSY;
+		trace_crg_udc_no_room_on_ring(
+			"deferring TRBs to next doorbell");
+		count = num_trbs_ava;
+		full_td = false;
+		need_zlp = false;
+	} else {
+		count = td_trbs;
+	}
+
+	if (!count) {
+		/* There really is no room, not a malformed SG list. */
+		udc_ep_ptr->tran_ring_full = true;
+		return -ENOSPC;
+	}
+
+	/* Preflight all buffers, including every SG boundary.  No request SG
+	 * state or hardware ring state changes if any entry is invalid.
+	 */
+	if (is_sg && !sg_cursor.sg && crg_udc_sg_init(&sg_cursor))
+		return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		dma_addr_t dma;
+		u32 len, sg_len = 0;
+
+		if (is_sg) {
+			if (!crg_udc_sg_current(&sg_cursor, &dma, &sg_len) ||
+			    !sg_len || dma_mapping_error(crg_udc->dev, dma))
+				return -EINVAL;
+			len = min_t(u64, remaining,
+					min_t(u32, sg_len,
+						crg_udc_trb_chunk_len(dma, remaining)));
+		} else {
+			if (remaining)
+				return -EINVAL;
+			dma = 0;
+			len = crg_udc_trb_chunk_len(dma, remaining);
+		}
+
+		if (!len && remaining)
+			return -EINVAL;
+		if (is_sg && !crg_udc_sg_advance(&sg_cursor, len))
+			return -EINVAL;
+
+		plan[i].dma = dma;
+		plan[i].len = len;
+		remaining -= len;
+	}
+
+	/* All validation is complete.  The following loop cannot fail; the
+	 * first TRB's cycle bit is published last, after the complete TD.
+	 */
+	td_bytes = buffer_length - remaining;
+	remaining = buffer_length;
+	for (i = 0; i < count; i++) {
+		u32 trb_len = plan[i].len;
+		bool chain_bit = i != count - 1;
+		bool ioc = !chain_bit;
+		bool short_pkt = usb_endpoint_dir_out(udc_ep_ptr->desc);
+
+		remaining -= trb_len;
+		td_done += trb_len;
+		td_size = crg_udc_td_size(td_bytes, td_done,
+					  udc_ep_ptr->usb_ep.maxpacket, !chain_bit);
+		if (!full_td && j == intr_rate) {
+			ioc = true;
+			j = 0;
+		}
+
+		if (b_isoc) {
+			crg_udc_setup_trb(
+				enq_pt, trb_len, plan[i].dma, td_size,
+				i == 0 ? (original_pcs ^ 1) : udc_ep_ptr->pcs,
+				i == 0 ? TRB_TYPE_XFER_DATA_ISOCH :
+					 TRB_TYPE_XFER_NORMAL,
+				short_pkt, chain_bit, ioc, false, 0,
+				i == 0, 0, i == 0, 0);
+		} else {
+			bool azp = ioc && !chain_bit && !remaining && need_zlp;
+
+			crg_udc_setup_trb(
+				enq_pt, trb_len, plan[i].dma, td_size,
+				i == 0 ? (original_pcs ^ 1) : udc_ep_ptr->pcs,
+				TRB_TYPE_XFER_NORMAL, short_pkt, chain_bit, ioc,
+				false, 0, false, 0, 0, azp);
+		}
+
+		trace_crg_udc_queue_trb(udc_ep_ptr, enq_pt);
+		enq_pt++;
+		j++;
+
+		if (enq_pt == udc_ep_ptr->last_trb) {
+			dma_wmb();
+			le32p_replace_bits(&enq_pt->dw3, udc_ep_ptr->pcs,
+					   TRB_CYCLE_BIT_MASK);
+			udc_ep_ptr->pcs ^= 1;
+			enq_pt = udc_ep_ptr->first_trb;
+		}
+	}
+
+	dma_wmb();
+	le32p_replace_bits(&udc_ep_ptr->enq_pt->dw3, original_pcs,
+			   TRB_CYCLE_BIT_MASK);
+
+	/* Commit request bookkeeping only after publishing the whole TD. */
+	udc_req_ptr->first_trb = udc_ep_ptr->enq_pt;
+	udc_req_ptr->td_start_offset = td_start_offset;
+	udc_ep_ptr->enq_pt = enq_pt;
+	udc_ep_ptr->tran_ring_full = count == num_trbs_ava;
+	udc_req_ptr->buff_len_left = remaining;
+	udc_req_ptr->td_pending = true;
+	udc_req_ptr->trbs_needed = remaining ? num_trbs_needed - count : 0;
+	if (!remaining)
+		udc_req_ptr->all_trbs_queued = true;
+	if (is_sg) {
+		udc_req_ptr->sg = sg_cursor.sg;
+		udc_req_ptr->sg_index = sg_cursor.sg_index;
+		udc_req_ptr->sg_offset = sg_cursor.sg_offset;
+	}
+
+	if (udc_ep_ptr->enq_pt == udc_ep_ptr->first_trb)
+		udc_req_ptr->last_trb = udc_ep_ptr->last_trb - 1;
+	else
+		udc_req_ptr->last_trb = udc_ep_ptr->enq_pt - 1;
+
+	return 0;
+}
+
+static int crg_udc_reinit(struct crg_gadget_dev *crg_udc, bool notify_reset)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	struct crg_udc_ep *ep;
+	u32 i, tmp;
+	int ret;
+
+	if (crg_udc->shutting_down || crg_udc->gadget_stopping)
+		return -ESHUTDOWN;
+	if (crg_udc->controller_recovering)
+		return -EBUSY;
+	crg_udc_recovery_begin(crg_udc);
+
+	/* A newer bus reset invalidates any already-running reset worker. */
+	crg_udc->bus_reset_generation++;
+	/* Invalidate EP0 mappings and SETUPs belonging to the old bus state. */
+	crg_udc->udc_ep[0].generation++;
+	crg_udc->pending_setup_valid = false;
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	crg_udc->device_state = USB_STATE_RECONNECTING;
+	crg_udc->port_reset_pending = false;
+
+	/*
+	 * The controller datasheet defines EP Enabled only in bits 31:2
+	 * (RW1C). Bits 1:0 are reserved and may read as nonzero (bit 0
+	 * stayed set on AX3000), so neither write them nor wait for them
+	 * to clear when disabling endpoints before DMA cleanup.
+	 */
+	tmp = readl(&uccr->ep_enable) & GENMASK(31, 2);
+	writel(tmp, &uccr->ep_enable);
+	if (readl_poll_timeout_atomic(&uccr->ep_enable, tmp,
+				      !(tmp & GENMASK(31, 2)), 10, 10000)) {
+		/* Still DMA-visible: only SWRST can safely release these TRBs. */
+		dev_err(crg_udc->dev,
+			"bus reset: EP_ENABLE did not clear (0x%x)\n", tmp);
+		crg_udc->bus_reset_pending = false;
+		crg_udc->resetting = true;
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	/*
+	 * Disabling an endpoint does not itself prove that DMA stopped.
+	 * Before unmapping any requests, verify every data endpoint is idle.
+	 */
+	if (readl_poll_timeout_atomic(&uccr->ep_running, tmp,
+					      !(tmp & GENMASK(CRG_NUM_EP_CX - 1, 2)),
+					      10, 10000)) {
+		dev_err(crg_udc->dev,
+			"bus reset: EP_RUNNING did not clear (0x%x)\n", tmp);
+		crg_udc->bus_reset_pending = false;
+		crg_udc->resetting = true;
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	/*
+	 * No callbacks until every endpoint has been marked inactive.  When
+	 * notifying composite, keep usb_ep.enabled and descriptors intact:
+	 * its ->disable() callbacks must still reach usb_ep_disable().
+	 */
+	crg_udc->bus_reset_pending = notify_reset;
+	for (i = 2; i < CRG_NUM_EP_CX; i++) {
+		ep = &crg_udc->udc_ep[i];
+		ep->generation++;
+		ep->ep_state = EP_STATE_DISABLED;
+		ep->halt_failed = false;
+		ep->disable_failed = false;
+		ep->dequeue_paused = false;
+		ep->tran_ring_full = false;
+		if (!notify_reset) {
+			ep->desc = NULL;
+			ep->comp_desc = NULL;
+		}
+	}
+	crg_udc->num_enabled_eps = 0;
+
+	for (i = 2; i < CRG_NUM_EP_CX; i++)
+		crg_udc_ep_nuke(&crg_udc->udc_ep[i], -ESHUTDOWN);
+	if (!notify_reset)
+		for (i = 2; i < CRG_NUM_EP_CX; i++)
+			crg_udc_ep_clear_enabled(&crg_udc->udc_ep[i]);
+
+	/*
+	 * Givebacks release udc_lock. A system suspend/shutdown may have
+	 * taken ownership of the controller during that window.
+	 */
+	if (crg_udc->suspended || crg_udc->shutting_down || crg_udc->resetting) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	/* A gadget disconnect may have stopped RUN during giveback. */
+	if (crg_udc->stopped_needs_reset) {
+		ret = -ECONNRESET;
+		goto out;
+	}
+
+	/* EP0 is reinitialized after the event ring has been drained. */
+	if (crg_udc->dev_addr != 0) {
+		u32 param0 = FIELD_PREP(CRG_CMD2_0_DEV_ADDR_MASK, 0);
+
+		if (crg_udc_issue_command(crg_udc, CRG_CMD_SET_ADDR,
+					  param0, 0)) {
+			/* Cleanup must still run, but no new transfers may start. */
+			crg_udc->resetting = true;
+			ret = -EIO;
+			goto out;
+		}
+		crg_udc->dev_addr = 0;
+	}
+
+	crg_udc_clear_portpm(crg_udc);
+	ret = 0;
+out:
+	crg_udc_recovery_end(crg_udc);
+	return ret;
+}
+
+void crg_udc_set_pullup(struct crg_gadget_dev *crg_udc, bool is_on)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 val;
+
+	if (is_on) {
+		if (crg_udc->controller_faulted || crg_udc->resetting ||
+		    crg_udc->controller_recovering || crg_udc->bus_reset_pending ||
+		    crg_udc->endpoint_recovery_pending ||
+		    crg_udc->shutting_down || crg_udc->gadget_stopping)
+			return;
+		/* Enable event reporting and interrupts, then assert RUN */
+		val = readl(&uccr->config1);
+		val |= (CRG_U3DC_CFG1_CSC_EVENT_EN |
+			CRG_U3DC_CFG1_PEC_EVENT_EN |
+			CRG_U3DC_CFG1_PPC_EVENT_EN |
+			CRG_U3DC_CFG1_PRC_EVENT_EN |
+			CRG_U3DC_CFG1_PLC_EVENT_EN |
+			CRG_U3DC_CFG1_CEC_EVENT_EN);
+		writel(val, &uccr->config1);
+
+		val = readl(&uccr->control);
+		val |= (CRG_U3DC_CTRL_SYSERR_EN | CRG_U3DC_CTRL_INT_EN |
+			CRG_U3DC_CTRL_RUN);
+		crg_udc->hw_dma_armed = true;
+		crg_udc->transfer_rings_live = true;
+		writel(val, &uccr->control);
+	} else {
+		val = readl(&uccr->control);
+		val &= ~CRG_U3DC_CTRL_RUN;
+		writel(val, &uccr->control);
+	}
+}
+
+void crg_udc_set_vbus_detect(struct crg_gadget_dev *crg_udc, bool enable)
+{
+	u32 val = readl(crg_udc->mmio_virt_base + CRG_UDC_VENDOR_REG);
+
+	if (enable)
+		val |= CRG_UDC_VBUS_DETECT;
+	else
+		val &= ~CRG_UDC_VBUS_DETECT;
+
+	writel(val, crg_udc->mmio_virt_base + CRG_UDC_VENDOR_REG);
+}
+
+static bool crg_udc_sg_advance(struct crg_udc_request *udc_req, u32 bytes)
+{
+	struct scatterlist *sg = udc_req->sg;
+	unsigned int i = udc_req->sg_index;
+
+	while (bytes) {
+		u32 len;
+
+		if (!sg || i >= udc_req->bounce->sgt.nents)
+			return false;
+
+		len = sg_dma_len(sg);
+		if (!len || udc_req->sg_offset == len) {
+			sg = sg_next(sg);
+			i++;
+			udc_req->sg_offset = 0;
+			continue;
+		}
+
+		len -= udc_req->sg_offset;
+		if (bytes < len) {
+			udc_req->sg_offset += bytes;
+			bytes = 0;
+			break;
+		}
+
+		bytes -= len;
+		sg = sg_next(sg);
+		i++;
+		udc_req->sg_offset = 0;
+	}
+
+	udc_req->sg = sg;
+	udc_req->sg_index = i;
+	return true;
+}
+
+static bool crg_udc_sg_current(struct crg_udc_request *udc_req, dma_addr_t *dma,
+			       u32 *len)
+{
+	struct scatterlist *sg = udc_req->sg;
+
+	while (sg && udc_req->sg_index < udc_req->bounce->sgt.nents &&
+	       !sg_dma_len(sg)) {
+		sg = sg_next(sg);
+		udc_req->sg_index++;
+		udc_req->sg_offset = 0;
+	}
+	udc_req->sg = sg;
+
+	if (!sg || udc_req->sg_index >= udc_req->bounce->sgt.nents)
+		return false;
+
+	if (udc_req->sg_offset >= sg_dma_len(sg))
+		return false;
+
+	*dma = sg_dma_address(sg) + udc_req->sg_offset;
+	*len = sg_dma_len(sg) - udc_req->sg_offset;
+	return true;
+}
+
+static int crg_udc_sg_init(struct crg_udc_request *udc_req)
+{
+	struct scatterlist *sg;
+	unsigned int i;
+
+	for_each_sgtable_dma_sg(&udc_req->bounce->sgt, sg, i) {
+		if (sg_dma_len(sg)) {
+			udc_req->sg = sg;
+			udc_req->sg_index = i;
+			udc_req->sg_offset = 0;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static void crg_udc_bounce_unmap(struct device *dev,
+				struct crg_udc_bounce *bounce)
+{
+	if (!bounce->mapped)
+		return;
+
+	if (bounce->buf)
+		dma_unmap_single(dev, bounce->dma, bounce->len, bounce->dir);
+	else
+		dma_unmap_sgtable(dev, &bounce->sgt, bounce->dir, 0);
+}
+
+static void crg_udc_bounce_free(struct crg_udc_bounce *bounce)
+{
+	struct page *page, *next;
+
+	list_for_each_entry_safe(page, next, &bounce->pages, lru) {
+		list_del(&page->lru);
+		__free_page(page);
+	}
+	sg_free_table(&bounce->sgt);
+	kfree(bounce->buf);
+	kfree(bounce);
+}
+
+/* Call only after hardware can no longer access the retained mappings. */
+void crg_udc_release_quarantine(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_bounce *bounce, *next;
+
+	list_for_each_entry_safe(bounce, next, &crg_udc->dma_quarantine,
+				 quarantine) {
+		list_del(&bounce->quarantine);
+		crg_udc_bounce_unmap(crg_udc->dev, bounce);
+		crg_udc_bounce_free(bounce);
+	}
+}
+
+void crg_udc_unmap_request(struct crg_udc_ep *udc_ep,
+			   struct crg_udc_request *udc_req, size_t received)
+{
+	struct crg_udc_bounce *bounce = udc_req->bounce;
+	struct usb_request *req = &udc_req->usb_req;
+
+	if (!bounce)
+		return;
+
+	udc_req->bounce = NULL;
+	crg_udc_bounce_unmap(udc_ep->crg_udc->dev, bounce);
+	if (bounce->dir == DMA_FROM_DEVICE && received) {
+		size_t len = min(received, bounce->len);
+
+		if (bounce->buf) {
+			memcpy(req->buf, bounce->buf, len);
+		} else {
+			size_t copied = crg_udc_copy_bounce_pages(bounce, req, len);
+
+			if (copied != len) {
+				req->status = -EFAULT;
+				req->actual = copied;
+			}
+		}
+	}
+	crg_udc_bounce_free(bounce);
+}
+
+static int crg_udc_validate_ep_desc(struct crg_udc_ep *udc_ep,
+				    const struct usb_endpoint_descriptor *desc)
+{
+	const struct usb_ss_ep_comp_descriptor *comp = udc_ep->comp_desc;
+	u16 maxpacket = usb_endpoint_maxp(desc);
+
+	if (usb_endpoint_xfer_control(desc) || !maxpacket ||
+	    maxpacket > CRG_MAX_PACKET_SIZE)
+		return -EINVAL;
+
+	if (crg_udc_index2dci(desc->bEndpointAddress) != udc_ep->dci)
+		return -EINVAL;
+
+	if (usb_endpoint_xfer_bulk(desc) && comp && usb_ss_max_streams(comp))
+		return -EOPNOTSUPP;
+
+	if (usb_endpoint_xfer_isoc(desc) && desc->bInterval == 0)
+		return -EINVAL;
+
+	if (udc_ep->crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+		if (!comp || comp->bMaxBurst > 15)
+			return -EINVAL;
+		if (usb_endpoint_xfer_isoc(desc) &&
+		    ((comp->bmAttributes & 0x3) > 2))
+			return -EINVAL;
+	} else if (udc_ep->crg_udc->gadget.speed == USB_SPEED_HIGH) {
+		if (desc->bInterval > 16 && (usb_endpoint_xfer_int(desc) ||
+					     usb_endpoint_xfer_isoc(desc)))
+			return -EINVAL;
+		if (usb_endpoint_xfer_isoc(desc) &&
+		    usb_endpoint_maxp_mult(desc) > 3)
+			return -EINVAL;
+	} else if (udc_ep->crg_udc->gadget.speed == USB_SPEED_FULL) {
+		if (maxpacket > 64 && !usb_endpoint_xfer_isoc(desc))
+			return -EINVAL;
+		if (usb_endpoint_xfer_isoc(desc) && maxpacket > 1023)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static bool crg_udc_vbus_connected(struct crg_gadget_dev *crg_udc)
+{
+	return !!(readl(&crg_udc->uccr->portsc) & CRG_U3DC_PORTSC_PP);
+}
+
+static void crg_ep_struct_setup(struct crg_gadget_dev *crg_udc, u32 dci,
+				const char *name)
+{
+	struct crg_udc_ep *ep = &crg_udc->udc_ep[dci];
+
+	ep->dci = dci;
+
+	if (ep->dci > 1) {
+		strscpy_pad(ep->name, name, sizeof(ep->name));
+		ep->usb_ep.name = ep->name;
+
+		ep->usb_ep.caps.type_iso = 1;
+		ep->usb_ep.caps.type_bulk = 1;
+		ep->usb_ep.caps.type_int = 1;
+		if (ep->dci % 2)
+			ep->usb_ep.caps.dir_out = 1;
+		else
+			ep->usb_ep.caps.dir_in = 1;
+		usb_ep_set_maxpacket_limit(&ep->usb_ep, CRG_MAX_PACKET_SIZE);
+	} else {
+		strscpy(ep->name, "ep0", sizeof(ep->name));
+		ep->usb_ep.name = ep->name;
+		ep->usb_ep.maxpacket = 512;
+		ep->usb_ep.caps.type_control = 1;
+		ep->usb_ep.caps.dir_in = 1;
+		ep->usb_ep.caps.dir_out = 1;
+	}
+
+	ep->usb_ep.ops = &crg_udc_ep_ops;
+	ep->crg_udc = crg_udc;
+
+	INIT_LIST_HEAD(&ep->queue);
+	if (ep->dci > 1)
+		list_add_tail(&ep->usb_ep.ep_list, &crg_udc->gadget.ep_list);
+}
+
+void crg_udc_reset_work(struct work_struct *work)
+{
+	struct crg_gadget_dev *crg_udc =
+		container_of(work, struct crg_gadget_dev, udc_reset_work);
+	struct usb_gadget_driver *driver;
+	unsigned long flags;
+	u32 generation;
+	bool requeue;
+	int i, ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->resetting || crg_udc->controller_recovering ||
+	    crg_udc->shutting_down || crg_udc->gadget_stopping ||
+	    crg_udc->suspended)
+		goto unlock;
+	generation = crg_udc->bus_reset_generation;
+	driver = crg_udc->bus_reset_pending && crg_udc->async_callbacks ?
+		crg_udc->gadget_driver : NULL;
+	/* Defer until callbacks initiated before the reset have returned. */
+	if (driver && crg_udc->gadget_callbacks_active)
+		goto unlock;
+	if (driver)
+		crg_udc->reset_callback_active = true;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	if (driver)
+		usb_gadget_udc_reset(&crg_udc->gadget, driver);
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (generation == crg_udc->bus_reset_generation &&
+	    crg_udc->bus_reset_pending) {
+		/*
+		 * DMA was stopped by crg_udc_reinit() before scheduling this work.
+		 * Some gadget functions do not call usb_ep_disable() when reset.
+		 * Finalize these endpoints under the lock and generation check;
+		 * calling usb_ep_disable() after unlocking would let a newer
+		 * reset reuse the endpoint before the disable operation.
+		 */
+		for (i = 2; i < CRG_NUM_EP_CX; i++) {
+			struct crg_udc_ep *ep = &crg_udc->udc_ep[i];
+			struct crg_ep_cx *epcx;
+
+			if (ep->ep_state != EP_STATE_DISABLED ||
+			    !ep->usb_ep.enabled)
+				continue;
+
+			dev_warn(crg_udc->dev,
+				 "EP%d remained enabled after gadget reset\n", i);
+			epcx = &crg_udc->p_epcx[i - 2];
+			ep->generation++;
+			ep->desc = NULL;
+			ep->comp_desc = NULL;
+			ep->tran_ring_full = false;
+			ep->halt_failed = false;
+			ep->disable_failed = false;
+			ep->dequeue_paused = false;
+			memset(epcx, 0, sizeof(*epcx));
+			/*
+			 * The controller disabled this endpoint and drained the
+			 * requests; reflect that in the USB core's enabled flag.
+			 */
+			crg_udc_ep_clear_enabled(ep);
+		}
+		if (!crg_udc->resetting)
+			crg_udc->bus_reset_pending = false;
+	}
+
+	/*
+	 * Keep port reset events deferred through endpoint cleanup, not just
+	 * through the gadget callback. Replay after clearing the guard.
+	 */
+	if (driver)
+		crg_udc->reset_callback_active = false;
+	if (!crg_udc->resetting && !crg_udc->suspended &&
+	    !crg_udc->shutting_down && crg_udc->deferred_system_error) {
+		crg_udc->deferred_system_error = false;
+		crg_udc_recover_link(crg_udc, &flags, false);
+	}
+	if (!crg_udc->resetting && !crg_udc->suspended &&
+	    !crg_udc->shutting_down && crg_udc->deferred_port_events) {
+		ret = crg_udc_handle_port_status(crg_udc, &flags);
+		if (ret && ret != -ECONNRESET)
+			dev_err(crg_udc->dev,
+				"deferred port status failed: %d\n", ret);
+	}
+
+	/* Port-event replay may have initiated another bus reset. */
+	requeue = generation != crg_udc->bus_reset_generation &&
+		  crg_udc->bus_reset_pending && crg_udc->async_callbacks &&
+		  crg_udc->gadget_driver;
+	/* A failed configured-session reset defers RUN until the gadget's
+	 * reset callback has dropped the old composite configuration.
+	 */
+	if (!requeue && !crg_udc->bus_reset_pending && !crg_udc->connected &&
+	    !crg_udc->resetting && !crg_udc->suspended &&
+	    !crg_udc->shutting_down && crg_udc->pullup_on &&
+	    crg_udc->gadget_driver && crg_udc->async_callbacks &&
+	    (crg_udc->restart_after_reset || crg_udc_vbus_connected(crg_udc))) {
+		crg_udc->restart_after_reset = false;
+		crg_udc_set_pullup(crg_udc, true);
+	}
+
+	if (requeue || crg_udc->external_reset_pending ||
+	    crg_udc->endpoint_recovery_pending)
+		crg_udc_kick_reset_work(crg_udc);
+unlock:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+}
+
+/*
+ * Called with udc_lock held from the port IRQ or its retry worker.
+ * The old bus-reset path may have failed to quiesce endpoint DMA.  Never
+ * unmap requests or restart RUN based on a failed EP_ENABLE/EP_RUNNING
+ * poll; SWRST must succeed and rebuild all rings first.
+ *
+ * A successful full reset invalidates the current PORTSC snapshot/event
+ * ring, so callers must stop processing that event (-ECONNRESET).
+ */
+static int crg_udc_recover_port_failure(struct crg_gadget_dev *crg_udc,
+					unsigned long *flags, bool notify_reset)
+{
+	int ret;
+
+	if (crg_udc->controller_recovering || crg_udc->suspended ||
+	    crg_udc->shutting_down || !crg_udc->gadget_driver)
+		return -ESHUTDOWN;
+
+	ret = crg_udc_recover_link(crg_udc, flags, notify_reset);
+	return ret ?: -ECONNRESET;
+}
+
+/* PRC is W1C at detection, not a completion notification. */
+#define CRG_PORT_RESET_RETRY_MS 50
+#define CRG_PORT_RESET_MAX_RETRIES 40
+
+void crg_udc_port_retry_work(struct work_struct *work)
+{
+	struct crg_gadget_dev *crg_udc =
+		container_of(to_delayed_work(work), struct crg_gadget_dev,
+			     port_retry_work);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (!crg_udc->port_reset_pending && !crg_udc->deferred_port_events)
+		goto out;
+	if (crg_udc->resetting || crg_udc->suspended ||
+	    crg_udc->shutting_down || !crg_udc->pullup_on ||
+	    !crg_udc->gadget_driver || !crg_udc->async_callbacks)
+		goto out;
+	/* Reset work replays deferred events after the callback. A controller
+	 * reconstruction is different: retry once its register state is stable.
+	 */
+	if (crg_udc->controller_recovering) {
+		mod_delayed_work(system_wq, &crg_udc->port_retry_work,
+				 msecs_to_jiffies(CRG_PORT_RESET_RETRY_MS));
+		goto out;
+	}
+	if (crg_udc->port_reset_pending &&
+	    crg_udc->port_reset_retry_count++ >= CRG_PORT_RESET_MAX_RETRIES) {
+		bool notify_reset = crg_udc->device_state == USB_STATE_CONFIGURED;
+
+		dev_err(crg_udc->dev,
+			"port reset did not become ready; resetting controller\n");
+		ret = crg_udc_recover_port_failure(crg_udc, &flags,
+						   notify_reset);
+		if (ret != -ECONNRESET)
+			dev_err(crg_udc->dev,
+				"port-reset recovery returned %d\n", ret);
+		goto out;
+	}
+	ret = crg_udc_handle_port_status(crg_udc, &flags);
+	if (ret && ret != -ECONNRESET)
+		dev_dbg(crg_udc->dev, "port reset poll: %d\n", ret);
+out:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+}
+
+int crg_udc_handle_port_status(struct crg_gadget_dev *crg_udc,
+			       unsigned long *flags)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	bool was_connected = crg_udc->connected;
+	u32 portsc_val;
+	u32 tmp;
+	u32 speed;
+	int ret;
+
+	/* Snapshot and acknowledge every W1C status bit exactly once. */
+	portsc_val = readl(&uccr->portsc);
+	trace_crg_udc_portsc(portsc_val);
+	writel(portsc_val & CRG_U3DC_PORTSC_W1C_MASK, &uccr->portsc);
+
+	/* A new port reset must not tear down endpoints from inside a gadget
+	 * reset callback. Preserve the acknowledged W1C events for replay.
+	 */
+	if (crg_udc->reset_callback_active || crg_udc->suspended ||
+	    crg_udc->shutting_down || crg_udc->controller_recovering) {
+		if (crg_udc->suspended || crg_udc->shutting_down)
+			return -ESHUTDOWN;
+		crg_udc->deferred_port_events |=
+			portsc_val & CRG_U3DC_PORTSC_W1C_MASK;
+		if (portsc_val & CRG_U3DC_PORTSC_PRC)
+			crg_udc->port_reset_pending = true;
+		return 0;
+	}
+
+	portsc_val |= crg_udc->deferred_port_events;
+	crg_udc->deferred_port_events = 0;
+
+	/* Process link changes before any disconnect path can reset the UDC. */
+	if (portsc_val & CRG_U3DC_PORTSC_PLC) {
+		tmp = readl(&uccr->portsc);
+		if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) == 0xf) {
+			tmp &= ~CRG_U3DC_PORTSC_W1C_MASK;
+			FIELD_MODIFY(CRG_U3DC_PORTSC_PLS_MASK, &tmp, 0x0);
+			tmp |= CRG_U3DC_PORTSC_LWS;
+			writel(tmp, &uccr->portsc);
+		}
+	}
+
+	/* A reset may finish before the port is ready; retry on later changes. */
+	if (portsc_val & CRG_U3DC_PORTSC_PRC) {
+		if (!crg_udc->port_reset_pending)
+			crg_udc->port_reset_retry_count = 0;
+		crg_udc->port_reset_pending = true;
+	}
+
+	/* Retry even when no new W1C event was raised: PRC describes when
+	 * the reset was detected, not when PED becomes ready.
+	 */
+	if (crg_udc->port_reset_pending) {
+		tmp = readl(&uccr->portsc);
+		if (tmp & CRG_U3DC_PORTSC_PRC) {
+			dev_dbg(crg_udc->dev, "PRC is still set\n");
+		} else if (tmp & CRG_U3DC_PORTSC_PR) {
+			/* first port status change event for port reset */
+			dev_dbg(crg_udc->dev,
+				"PRC is not set, but PR is set\n");
+		} else {
+			if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) != 0 ||
+			    !(tmp & CRG_U3DC_PORTSC_PED)) {
+				dev_dbg(crg_udc->dev, "portsc=0x%x no PED\n",
+					tmp);
+				goto prc_done;
+			}
+
+			switch (FIELD_GET(CRG_U3DC_PORTSC_SPEED_MASK, tmp)) {
+			case CRG_U3DC_PORTSC_SPEED_SSP:
+				speed = USB_SPEED_SUPER_PLUS;
+				break;
+			case CRG_U3DC_PORTSC_SPEED_SS:
+				speed = USB_SPEED_SUPER;
+				break;
+			case CRG_U3DC_PORTSC_SPEED_HS:
+				speed = USB_SPEED_HIGH;
+				break;
+
+			case CRG_U3DC_PORTSC_SPEED_FS:
+				speed = USB_SPEED_FULL;
+				break;
+
+			case CRG_U3DC_PORTSC_SPEED_LS:
+				speed = USB_SPEED_LOW;
+				break;
+			default:
+				speed = USB_SPEED_UNKNOWN;
+				goto prc_done;
+			}
+
+			/* All prerequisites are met; the deferred reset is consumed. */
+			crg_udc->port_reset_pending = false;
+
+			if (crg_udc->device_state >= USB_STATE_DEFAULT) {
+				/*
+				 * A single enumeration commonly involves two
+				 * bus resets (an initial one, then another
+				 * after SET_ADDRESS before SET_CONFIGURATION).
+				 * By the second reset device_state is already
+				 * USB_STATE_ADDRESS, which is >= DEFAULT but
+				 * has no active configuration to tear down.
+				 * Only notify composite when a configuration
+				 * was actually active: otherwise this races
+				 * with the SET_CONFIGURATION that's about to
+				 * arrive, since the deferred work below can
+				 * run after fsg_set_alt() has already raised
+				 * its own FSG_STATE_CONFIG_CHANGE exception
+				 * and reset_config()'s ->disable() would
+				 * overwrite that exception's argument back to
+				 * NULL before the function's thread consumes
+				 * it, silently skipping the real enable.
+				 */
+				bool was_configured = crg_udc->device_state ==
+						       USB_STATE_CONFIGURED;
+				bool notify_reset = was_configured &&
+					crg_udc->async_callbacks &&
+					crg_udc->gadget_driver;
+				int reinit_ret;
+
+				reinit_ret = crg_udc_reinit(crg_udc, notify_reset);
+				if (reinit_ret) {
+					dev_err(crg_udc->dev,
+						"bus reset reinit failed: %d\n",
+						reinit_ret);
+					/* SWRST is required before releasing DMA buffers.
+					 * Do not resume processing the stale port event.
+					 */
+					if (reinit_ret == -ETIMEDOUT ||
+					    reinit_ret == -EIO)
+						return crg_udc_recover_port_failure(
+							crg_udc, flags, notify_reset);
+					return reinit_ret;
+				}
+				if (notify_reset && crg_udc->bus_reset_pending)
+					schedule_work(&crg_udc->udc_reset_work);
+			}
+
+			crg_udc->gadget.speed = speed;
+
+			ret = crg_udc_update_ep0_maxpacketsize(crg_udc);
+			if (ret) {
+				dev_err(crg_udc->dev,
+					"failed to configure EP0 maxpacket: %d\n", ret);
+				return crg_udc_recover_port_failure(
+					crg_udc, flags,
+					crg_udc->bus_reset_pending ||
+					crg_udc->device_state == USB_STATE_CONFIGURED);
+			}
+
+			crg_udc->connected = 1;
+
+			if (crg_udc->device_state < USB_STATE_RECONNECTING)
+				crg_udc_enable_setup(crg_udc);
+		}
+	}
+prc_done:
+	/* handle Port Reset end */
+
+	/* Port-enable and power changes can also complete initialization. */
+	if (portsc_val & (CRG_U3DC_PORTSC_CSC |
+			 CRG_U3DC_PORTSC_PEC |
+			 CRG_U3DC_PORTSC_PPC)) {
+		tmp = readl(&uccr->portsc);
+		if ((tmp & (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP)) ==
+		    (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP)) {
+			/* Do not configure EP0 until the pending port reset is handled. */
+			if (crg_udc->port_reset_pending)
+				goto csc_done;
+			if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) != 0 ||
+			    (!(tmp & CRG_U3DC_PORTSC_PED)))
+				goto csc_done;
+
+			switch (FIELD_GET(CRG_U3DC_PORTSC_SPEED_MASK, tmp)) {
+			case CRG_U3DC_PORTSC_SPEED_SSP:
+				speed = USB_SPEED_SUPER_PLUS;
+				break;
+			case CRG_U3DC_PORTSC_SPEED_SS:
+				speed = USB_SPEED_SUPER;
+				break;
+			case CRG_U3DC_PORTSC_SPEED_HS:
+				speed = USB_SPEED_HIGH;
+				break;
+
+			case CRG_U3DC_PORTSC_SPEED_FS:
+				speed = USB_SPEED_FULL;
+				break;
+
+			case CRG_U3DC_PORTSC_SPEED_LS:
+				speed = USB_SPEED_LOW;
+				break;
+			default:
+				speed = USB_SPEED_UNKNOWN;
+				goto csc_done;
+			}
+			crg_udc->gadget.speed = speed;
+
+			ret = crg_udc_update_ep0_maxpacketsize(crg_udc);
+			if (ret) {
+				dev_err(crg_udc->dev,
+					"failed to configure EP0 maxpacket: %d\n", ret);
+				return crg_udc_recover_port_failure(
+					crg_udc, flags,
+					crg_udc->bus_reset_pending ||
+					crg_udc->device_state == USB_STATE_CONFIGURED);
+			}
+
+			crg_udc->connected = 1;
+
+			if (crg_udc->device_state < USB_STATE_RECONNECTING)
+				crg_udc_enable_setup(crg_udc);
+
+		} else if ((portsc_val & (CRG_U3DC_PORTSC_CSC |
+					  CRG_U3DC_PORTSC_PPC)) &&
+			   (!(tmp & CRG_U3DC_PORTSC_CCS) ||
+			    !(tmp & CRG_U3DC_PORTSC_PP))) {
+			bool cable_connected;
+			int ccs_drop_ignore = 0;
+
+			if ((FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) == 0x0) &&
+			    (FIELD_GET(CRG_U3DC_PORTSC_SPEED_MASK, tmp) <
+			     CRG_U3DC_PORTSC_SPEED_SS)) {
+				ccs_drop_ignore = 1;
+				dev_err(crg_udc->dev, "ccs glitch detect on HS/FS!\n");
+			}
+
+			cable_connected = crg_udc_vbus_connected(crg_udc);
+			/* A missing port-power bit overrides the HS/FS CCS glitch rule. */
+			if (!cable_connected)
+				ccs_drop_ignore = 0;
+			if (!ccs_drop_ignore)
+				crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+			if ((!ccs_drop_ignore || !cable_connected) &&
+			    was_connected && crg_udc->connected) {
+				u32 generation = crg_udc->udc_event[0].generation;
+
+				/* The callback drops udc_lock: mark link down first. */
+				crg_udc->connected = 0;
+				crg_udc_notify_disconnect(crg_udc, flags);
+				if (crg_udc->resetting ||
+				    generation != crg_udc->udc_event[0].generation)
+					return -ECONNRESET;
+
+				/* Another thread may have handled a new connection. */
+				if (crg_udc->connected)
+					goto csc_done;
+
+				/* A new CCS=1 alone is not proof that software was reset. */
+				cable_connected = crg_udc_vbus_connected(crg_udc);
+			}
+			if (cable_connected && !ccs_drop_ignore) {
+				bool notify_reset = crg_udc->device_state ==
+							 USB_STATE_CONFIGURED;
+				int ret;
+
+				ret = crg_udc_reinit(crg_udc, false);
+				if (ret == -ETIMEDOUT || ret == -EIO)
+					return crg_udc_recover_port_failure(
+						crg_udc, flags, notify_reset);
+				if (ret)
+					return ret;
+				crg_udc->connected = 0;
+			} else if (!cable_connected) {
+				dev_dbg(crg_udc->dev,
+					"cable disconnected, rst controller\n");
+				/* Keep RUN and port interrupts enabled for the next cable. */
+				crg_udc_recover_link(crg_udc, flags, false);
+				return -ECONNRESET;
+			}
+		}
+	}
+csc_done:
+	/* PRC was already acknowledged. It may never interrupt us again if
+	 * PED becomes ready without a further CSC/PLC transition.
+	 */
+	if (crg_udc->port_reset_pending && !crg_udc->resetting &&
+	    !crg_udc->shutting_down && !crg_udc->suspended &&
+	    crg_udc->pullup_on && crg_udc->gadget_driver &&
+	    crg_udc->async_callbacks &&
+	    crg_udc->port_reset_retry_count < CRG_PORT_RESET_MAX_RETRIES)
+		mod_delayed_work(system_wq, &crg_udc->port_retry_work,
+				 msecs_to_jiffies(CRG_PORT_RESET_RETRY_MS));
+	return 0;
+}
+
+/*
+ * A giveback drops udc_lock; its callback can reset, stall, or replace
+ * the control transfer. Never advance an old EP0 transaction afterwards.
+ */
+static void crg_udc_ep0_complete_if_current(struct crg_gadget_dev *crg_udc,
+					    struct crg_udc_ep *ep, u32 generation,
+					    u32 event_generation, u8 setup_tag,
+					    enum crg_setup_status setup_status,
+					    unsigned long *flags)
+{
+	if (crg_udc->resetting || crg_udc->bus_reset_pending ||
+	    crg_udc->port_reset_pending ||
+	    crg_udc->device_state == USB_STATE_RECONNECTING ||
+	    crg_udc->ep0_state != EP0_STATE_IDLE ||
+	    ep->ep_state != EP_STATE_RUNNING || ep->nuking || !ep->desc ||
+	    !usb_endpoint_xfer_control(ep->desc) ||
+	    ep->generation != generation ||
+	    crg_udc->udc_event[0].generation != event_generation ||
+	    crg_udc->setup_tag != setup_tag ||
+	    crg_udc->setup_status != setup_status)
+		return;
+
+	crg_udc_ep0_req_complete(ep, flags);
+}
+
+int crg_udc_handle_xfer_event(struct crg_gadget_dev *crg_udc,
+			      struct crg_event_trb *event, unsigned long *flags)
+{
+	u32 dw3 = le32_to_cpu(event->dw3);
+	u8 dci = FIELD_GET(EVE_TRB_ENDPOINT_ID_MASK, dw3);
+	u16 comp_code =
+		FIELD_GET(EVE_TRB_COMPL_CODE_MASK, le32_to_cpu(event->dw2));
+	struct crg_udc_ep *udc_ep_ptr;
+	struct crg_udc_request *udc_req_ptr;
+	struct crg_transfer_trb *trb;
+	bool trbs_dequeued = false;
+	u32 ep_generation = 0, event_generation = 0;
+	enum crg_setup_status setup_status = WAIT_FOR_SETUP;
+	u8 setup_tag = 0;
+	u32 residual;
+
+	if (dci >= CRG_NUM_EP_CX || dci == 1)
+		return -EINVAL;
+
+	udc_ep_ptr = &crg_udc->udc_ep[dci];
+	if (dci == 0) {
+		ep_generation = udc_ep_ptr->generation;
+		event_generation = crg_udc->udc_event[0].generation;
+		setup_tag = crg_udc->setup_tag;
+		setup_status = crg_udc->setup_status;
+	}
+	/* Recovery owns the mappings while DMA state is uncertain. */
+	if (crg_udc->endpoint_recovery_pending || crg_udc->port_reset_pending ||
+	    udc_ep_ptr->halt_failed)
+		return 0;
+	if (!udc_ep_ptr->first_trb ||
+	    crg_udc_get_ep_state(crg_udc, dci) == EP_STATE_DISABLED)
+		return -ENODEV;
+
+	/* EP0 transfer events from an abort must not affect the new ring. */
+	if (dci == 0 && crg_udc->ep0_state != EP0_STATE_IDLE)
+		return 0;
+
+	if (comp_code != CMPL_CODE_STOPPED &&
+	    comp_code != CMPL_CODE_STOPPED_LENGTH_INVALID &&
+	    comp_code != CMPL_CODE_DISABLED &&
+	    comp_code != CMPL_CODE_DISABLED_LENGTH_INVALID &&
+	    comp_code != CMPL_CODE_HALTED &&
+	    comp_code != CMPL_CODE_HALTED_LENGTH_INVALID &&
+	    comp_code != CMPL_CODE_SETUP_TAG_MISMATCH) {
+		/*
+		 * Only live requests may advance the transfer-ring dequeue
+		 * pointer. EP0 data and status requests both track their TRBs.
+		 */
+		if (list_empty(&udc_ep_ptr->queue) ||
+		    is_request_dequeued(crg_udc, udc_ep_ptr, event))
+			return 0;
+
+		crg_udc_update_dequeue_pt(event, udc_ep_ptr);
+	}
+
+	switch (comp_code) {
+	case CMPL_CODE_SUCCESS:
+		trb = crg_udc_tran_trb_dma_to_virt(
+			udc_ep_ptr,
+			(u64)le32_to_cpu(event->dw0) |
+				((u64)le32_to_cpu(event->dw1) << 32));
+		if (!trb || list_empty(&udc_ep_ptr->queue))
+			break;
+
+		/*
+		 * A control transfer has separate data-stage and status-stage
+		 * TRBs.  The status request is an internal zero-length request
+		 * and its successful completion must not go through
+		 * crg_udc_build_td().  Doing that attempts to queue another
+		 * control TD while the status request is already on the EP0
+		 * software queue, leaving it stuck in -EINPROGRESS.  The next
+		 * SETUP then sees a non-empty queue and enumeration fails.
+		 */
+		if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(trb->dw3)) ==
+		    TRB_TYPE_XFER_STATUS_STAGE) {
+			udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+						       struct crg_udc_request,
+						       queue);
+			if (dci == 0) {
+				udc_req_ptr->usb_req.actual = 0;
+				trbs_dequeued = true;
+				crg_udc_req_done(udc_ep_ptr, udc_req_ptr, 0);
+				crg_udc_ep0_complete_if_current(crg_udc, udc_ep_ptr,
+						 ep_generation, event_generation,
+						 setup_tag, setup_status, flags);
+			} else {
+				dev_err(crg_udc->dev,
+					"status-stage TRB on endpoint %u\n",
+					dci);
+			}
+			break;
+		}
+
+		if (!FIELD_GET(TRB_CHAIN_BIT_MASK, le32_to_cpu(trb->dw3))) {
+			udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+						       struct crg_udc_request,
+						       queue);
+			trbs_dequeued = true;
+			udc_req_ptr->td_pending = false;
+
+			if (udc_req_ptr->all_trbs_queued) {
+				udc_req_ptr->usb_req.actual =
+					udc_req_ptr->usb_req.length -
+					udc_req_ptr->buff_len_left;
+				residual = FIELD_GET(EVE_TRB_TRAN_LEN_MASK,
+						     le32_to_cpu(event->dw2));
+				if (residual > udc_req_ptr->usb_req.actual)
+					residual = 0;
+				udc_req_ptr->usb_req.actual -= residual;
+				crg_udc_req_done(udc_ep_ptr, udc_req_ptr, 0);
+
+				if (dci == 0)
+					crg_udc_ep0_complete_if_current(crg_udc, udc_ep_ptr,
+						 ep_generation, event_generation,
+						 setup_tag, setup_status, flags);
+			} else {
+				int ret;
+
+				ret = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+				if (ret == -ENOSPC || ret == -EBUSY) {
+					/* A previous TD completed, but this next TD
+					 * could not yet be published. Retry later.
+					 */
+					udc_ep_ptr->tran_ring_full = true;
+				} else if (ret) {
+					udc_req_ptr->usb_req.actual =
+						udc_req_ptr->usb_req.length -
+						udc_req_ptr->buff_len_left;
+					crg_udc_req_done(udc_ep_ptr, udc_req_ptr,
+							 ret);
+				}
+			}
+		}
+		break;
+
+	case CMPL_CODE_SHORT_PKT:
+		if (list_empty(&udc_ep_ptr->queue))
+			break;
+
+		udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+					       struct crg_udc_request, queue);
+		trb = crg_udc_tran_trb_dma_to_virt(
+			udc_ep_ptr,
+			(u64)le32_to_cpu(event->dw0) |
+			((u64)le32_to_cpu(event->dw1) << 32));
+		if (!trb)
+			break;
+
+		residual = FIELD_GET(EVE_TRB_TRAN_LEN_MASK,
+				     le32_to_cpu(event->dw2));
+		udc_req_ptr->usb_req.actual =
+			crg_udc_actual_before(udc_ep_ptr, udc_req_ptr, trb) +
+			FIELD_GET(TRB_TRANSFER_LEN_MASK,
+					  le32_to_cpu(trb->dw2)) -
+			min_t(u32, residual,
+			      FIELD_GET(TRB_TRANSFER_LEN_MASK,
+						le32_to_cpu(trb->dw2)));
+		udc_req_ptr->usb_req.actual = min(udc_req_ptr->usb_req.actual,
+						    udc_req_ptr->usb_req.length);
+
+		/*
+		 * Advance past the completed request before giveback drops
+		 * udc_lock and a completion callback can modify the queue.
+		 */
+		trbs_dequeued = true;
+		crg_udc_advance_dequeue_pt(udc_ep_ptr);
+		if (udc_req_ptr->usb_req.short_not_ok &&
+		    usb_endpoint_dir_out(udc_ep_ptr->desc))
+			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, -EREMOTEIO);
+		else
+			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, 0);
+		if (dci == 0)
+			crg_udc_ep0_complete_if_current(crg_udc, udc_ep_ptr,
+						 ep_generation, event_generation,
+						 setup_tag, setup_status, flags);
+		break;
+
+	case CMPL_CODE_PROTOCOL_STALL:
+	case CMPL_CODE_TRB_STALL:
+		if (!list_empty(&udc_ep_ptr->queue)) {
+			udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+						       struct crg_udc_request,
+						       queue);
+			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, -EPIPE);
+			trbs_dequeued = true;
+		}
+		if (dci == 0)
+			crg_udc->setup_status = WAIT_FOR_SETUP;
+		break;
+
+	case CMPL_CODE_SETUP_TAG_MISMATCH:
+		/*
+		 * EP0 SETUP changes are serialized by the SETUP event handler.
+		 * When a new SETUP arrives, crg_udc_abort_ep0_for_setup() stops
+		 * EP0, gives back the old request, resets the EP0 ring, and then
+		 * accepts the new SETUP. A SETUP_TAG_MISMATCH event generated
+		 * afterwards therefore belongs to the aborted control transfer.
+		 *
+		 * Do not complete the current EP0 request or change setup_status
+		 * here: doing so could operate on the new control transfer and
+		 * recreate the EP0 queue/state race this path is intended to avoid.
+		 */
+		if (dci == 0) {
+			dev_dbg(crg_udc->dev,
+				"ignoring stale EP0 SETUP_TAG_MISMATCH\n");
+			break;
+		}
+
+		/* This completion code is meaningful only for EP0. */
+		dev_warn(crg_udc->dev,
+			 "SETUP_TAG_MISMATCH on non-EP0 endpoint %u\n", dci);
+		break;
+
+	case CMPL_CODE_BABBLE_DETECTED_ERR:
+	case CMPL_CODE_DATA_BUFFER_ERR:
+	case CMPL_CODE_INVALID_STREAM_TYPE_ERR:
+	case CMPL_CODE_RING_UNDERRUN:
+	case CMPL_CODE_RING_OVERRUN:
+	case CMPL_CODE_EVENT_RING_FULL_ERR:
+	case CMPL_CODE_ISOCH_BUFFER_OVERRUN:
+	case CMPL_CODE_USB_TRANS_ERR:
+	case CMPL_CODE_TRB_ERR:
+	default:
+		/* Unknown codes are not proof that endpoint DMA has stopped. */
+		dev_err(crg_udc->dev, "transfer error, completion code 0x%x\n",
+			comp_code);
+		if (dci == 0) {
+			int ret;
+
+			/* EP0 must stop DMA before completing a failed transfer. */
+			if (!list_empty(&udc_ep_ptr->queue)) {
+				udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+							       struct crg_udc_request,
+							       queue);
+				if (udc_req_ptr->usb_req.status == -EINPROGRESS)
+					udc_req_ptr->usb_req.status = -EIO;
+			}
+			ret = crg_udc_abort_ep0_for_setup(crg_udc);
+			if (ret)
+				dev_err(crg_udc->dev,
+					"failed to stop EP0 after transfer error: %d\n",
+					ret);
+		} else {
+			int ret = crg_udc_stop_error_ep(crg_udc, dci);
+
+			if (ret)
+				dev_err(crg_udc->dev,
+					"failed to stop EP%u after transfer error: %d\n",
+					dci, ret);
+		}
+		break;
+
+	case CMPL_CODE_STOPPED:
+	case CMPL_CODE_STOPPED_LENGTH_INVALID:
+	case CMPL_CODE_HALTED:
+	case CMPL_CODE_HALTED_LENGTH_INVALID:
+	case CMPL_CODE_DISABLED:
+	case CMPL_CODE_DISABLED_LENGTH_INVALID:
+		break;
+	}
+
+	/* A completed TD frees room, but this event may also have published
+	 * the next TD and filled the ring again.  Recompute from the current
+	 * pointers: unconditionally clearing tran_ring_full loses that state.
+	 */
+	if (trbs_dequeued && dci != 0 &&
+	    udc_ep_ptr->ep_state == EP_STATE_RUNNING &&
+	    !crg_udc->resetting && !crg_udc->port_reset_pending &&
+	    !udc_ep_ptr->halt_failed) {
+		u32 ring_size = udc_ep_ptr->last_trb -
+				udc_ep_ptr->first_trb + 1;
+		u32 room = crg_udc_room_on_ring(crg_udc, ring_size,
+					udc_ep_ptr->first_trb,
+					udc_ep_ptr->enq_pt,
+					udc_ep_ptr->deq_pt);
+
+		udc_ep_ptr->tran_ring_full = !room;
+		if (room && crg_udc_queue_pending_trbs(udc_ep_ptr))
+			udc_ep_ptr->tran_ring_full = true;
+	}
+
+	return 0;
+}
+
+void crg_udc_dispatch_setup(struct crg_gadget_dev *crg_udc,
+			    struct usb_ctrlrequest *setup, u8 setup_tag,
+			    unsigned long *flags)
+{
+	struct crg_udc_ep *ep0 = &crg_udc->udc_ep[0];
+
+	/* A completed control transfer can leave old TRBs on the ring even
+	 * after its software queue becomes empty. A new SETUP aborts those
+	 * TRBs: stop and reinitialize EP0 before accepting another request.
+	 */
+	if (crg_udc->setup_status != WAIT_FOR_SETUP ||
+	    crg_udc->ep0_state != EP0_STATE_IDLE ||
+	    ep0->ep_state != EP_STATE_RUNNING ||
+	    !list_empty(&ep0->queue) || ep0->enq_pt != ep0->deq_pt ||
+	    ep0->tran_ring_full) {
+		/* Do not submit TRBs if STOP_EP failed. */
+		if (crg_udc_abort_ep0_for_setup(crg_udc))
+			return;
+	}
+
+	crg_udc_handle_setup_pkt(crg_udc, setup, setup_tag, flags);
+}
+
+int crg_udc_handle_event(struct crg_gadget_dev *crg_udc,
+			 struct crg_event_trb *event, unsigned long *flags)
+{
+	int ret;
+
+	trace_crg_udc_event_trb(event);
+
+	switch (FIELD_GET(EVE_TRB_TYPE_MASK, le32_to_cpu(event->dw3))) {
+	case TRB_TYPE_EVT_PORT_STATUS_CHANGE:
+		if (crg_udc->device_state == USB_STATE_RECONNECTING) {
+			crg_udc->portsc_on_reconnecting = 1;
+			break;
+		}
+		/* 1.Port Reset  2.Port Connection Change 3.Port Link Change */
+		ret = crg_udc_handle_port_status(crg_udc, flags);
+		if (ret)
+			return ret;
+
+		break;
+	case TRB_TYPE_EVT_TRANSFER:
+		if (crg_udc->device_state < USB_STATE_RECONNECTING) {
+			dev_err(crg_udc->dev,
+				"Xfer compl event rcved when dev state=%d !\n",
+				crg_udc->device_state);
+			break;
+		}
+
+		ret = crg_udc_handle_xfer_event(crg_udc, event, flags);
+		if (ret)
+			return ret;
+		break;
+	case TRB_TYPE_EVT_SETUP_PKT: {
+		struct usb_ctrlrequest setup;
+		u32 dw0 = le32_to_cpu(event->dw0);
+		u32 dw1 = le32_to_cpu(event->dw1);
+		u8 setup_tag;
+
+		BUILD_BUG_ON(sizeof(struct usb_ctrlrequest) != 8);
+		setup.bRequestType = dw0 & 0xff;
+		setup.bRequest = (dw0 >> 8) & 0xff;
+		setup.wValue = cpu_to_le16((dw0 >> 16) & 0xffff);
+		setup.wIndex = cpu_to_le16(dw1 & 0xffff);
+		setup.wLength = cpu_to_le16((dw1 >> 16) & 0xffff);
+
+		setup_tag = FIELD_GET(EVE_TRB_SETUP_TAG_MASK,
+				      le32_to_cpu(event->dw3));
+		if (crg_udc->device_state == USB_STATE_RECONNECTING) {
+			/* EP0 is not ready until the old event ring is drained. */
+			crg_udc->pending_setup = setup;
+			crg_udc->pending_setup_tag = setup_tag;
+			crg_udc->pending_setup_valid = true;
+			break;
+		}
+		crg_udc_dispatch_setup(crg_udc, &setup, setup_tag, flags);
+
+		break;
+	}
+	default:
+		dev_dbg(crg_udc->dev, "unexpected TRB_TYPE = 0x%lx",
+			FIELD_GET(EVE_TRB_TYPE_MASK, le32_to_cpu(event->dw3)));
+		break;
+	}
+
+	return 0;
+}
+
+/*
+ * Invoke the bound gadget driver's ->disconnect() callback, if any.
+ *
+ * The gadget disconnect callback may be called in interrupt context.
+ * Release only udc_lock while keeping local IRQs disabled.
+ */
+void crg_udc_notify_disconnect(struct crg_gadget_dev *crg_udc,
+			       unsigned long *flags)
+{
+	struct usb_gadget_driver *driver = crg_udc->gadget_driver;
+
+	/* Report link loss even when there is no gadget callback. */
+	usb_gadget_set_state(&crg_udc->gadget, USB_STATE_NOTATTACHED);
+
+	if (!crg_udc->async_callbacks || !driver || !driver->disconnect)
+		return;
+
+	/*
+	 * The unbind path disables async callbacks and synchronizes the IRQ
+	 * before freeing the gadget driver. Keep this pointer across unlock.
+	 */
+	crg_udc_callback_enter(crg_udc);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	driver->disconnect(&crg_udc->gadget);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	crg_udc_callback_exit(crg_udc);
+}
+
+int crg_udc_ep_halt(struct crg_udc_ep *udc_ep_ptr, int halt, int ignore_wedge,
+		    unsigned long *flags)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	enum crg_ep_state ep_state;
+	bool reset_seq_only = false;
+	bool recovering;
+	int do_halt, ret;
+	u32 param0;
+	u32 tmp;
+
+	if (crg_udc->resetting || crg_udc->endpoint_recovery_pending)
+		return -ESHUTDOWN;
+	if (!udc_ep_ptr->desc) {
+		dev_err(crg_udc->dev, "NULL desc\n");
+		return -EINVAL;
+	}
+	/* Failed disable is only recoverable by disable retry or reset. */
+	if (udc_ep_ptr->disable_failed)
+		return -ESHUTDOWN;
+
+	if (usb_endpoint_xfer_isoc(udc_ep_ptr->desc)) {
+		dev_err(crg_udc->dev, "Isoc ep, halt not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (udc_ep_ptr->dci == 0) {
+		/* EP0 stalls with a STATUS-stage TRB, not SET_HALT. */
+		if (!halt)
+			return -EOPNOTSUPP;
+
+		return crg_udc_set_ep0_halt(crg_udc);
+	}
+
+	/* A giveback can drop udc_lock while ep_nuke() still owns requests.
+	 * Never resume DMA until the entire cancellation drain is finished.
+	 */
+	if (udc_ep_ptr->nuking && !halt)
+		return -EBUSY;
+
+	/* Do not resume hardware while dequeue() still owns its ring. */
+	if (udc_ep_ptr->dequeue_paused && !halt)
+		return -EBUSY;
+
+	/* A failed halt cannot be cleared until DMA is safely stopped. */
+	if (udc_ep_ptr->halt_failed && !halt)
+		return -EIO;
+	recovering = udc_ep_ptr->halt_failed;
+
+	ep_state = crg_udc_get_ep_state(crg_udc, udc_ep_ptr->dci);
+
+	if (ep_state == EP_STATE_DISABLED)
+		return 0;
+
+	if (ep_state == EP_STATE_HALTED) {
+		if (halt != 0)
+			return 0;
+
+		/* want unhalt an halted ep */
+		if (udc_ep_ptr->wedge && !ignore_wedge) {
+			do_halt = -1;
+			reset_seq_only = true;
+		} else {
+			do_halt = 0;
+		}
+
+	} else {
+		/* ep state == running or stopped */
+		if (halt != 0) {
+			/* want halt a running ep */
+			do_halt = 1;
+		} else {
+			/* reset a running ep */
+			do_halt = 0;
+			reset_seq_only = true;
+		}
+	}
+
+	trace_crg_udc_ep_halt(udc_ep_ptr, do_halt == 1, udc_ep_ptr->wedge);
+
+	param0 = BIT(udc_ep_ptr->dci);
+	if (do_halt == 1) {
+		/* Stop hardware DMA before updating the ring or giving back. */
+		ret = crg_udc_issue_command(crg_udc, CRG_CMD_SET_HALT,
+					    param0, 0);
+		if (!ret)
+			ret = readl_poll_timeout_atomic(&uccr->ep_running, tmp,
+							       !(tmp & param0), 10, 10000);
+		if (ret) {
+			/* The controller might still own the mapped buffers. */
+			udc_ep_ptr->halt_failed = true;
+			udc_ep_ptr->ep_state = EP_STATE_STOPPED;
+			dev_err(crg_udc->dev,
+				"EP%d halt failed (%d); DMA mappings retained\n",
+				udc_ep_ptr->dci, ret);
+			return ret;
+		}
+		udc_ep_ptr->halt_failed = false;
+		udc_ep_ptr->dequeue_paused = false;
+
+		if (recovering || crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+			udc_ep_ptr->deq_pt = udc_ep_ptr->enq_pt;
+			udc_ep_ptr->tran_ring_full = false;
+		}
+		udc_ep_ptr->ep_state = EP_STATE_HALTED;
+		/*
+		 * A failed stop retained old DMA mappings even at HS/FS.
+		 * After a confirmed retry, all those requests can be given back.
+		 */
+		if (recovering || crg_udc->gadget.speed >= USB_SPEED_SUPER)
+			crg_udc_ep_nuke(udc_ep_ptr, -ECONNRESET);
+	} else if (do_halt == 0) {
+		/* clearing ep halt state */
+		/* reset sequence number */
+		if (crg_udc_issue_command(crg_udc, CRG_CMD_RESET_SEQNUM, param0,
+					  0))
+			return -EIO;
+
+		if (!reset_seq_only) {
+			/* Clear halt for a halted EP. */
+			/* NOTE: we must CLEAR_HALT first,
+			 * then SET_TR_DQPTR
+			 */
+			ret = crg_udc_issue_command(crg_udc,
+						    CRG_CMD_CLEAR_HALT, param0, 0);
+			if (ret)
+				goto clear_halt_failed;
+			ret = crg_udc_epcx_update_dqptr(udc_ep_ptr);
+			if (ret)
+				goto clear_halt_failed;
+		}
+
+		udc_ep_ptr->wedge = 0;
+		udc_ep_ptr->ep_state = EP_STATE_RUNNING;
+		/* Requests queued during HALT have DMA mappings but no TRBs.
+		 * Build them before notifying the resumed controller.
+		 */
+		if (!list_empty(&udc_ep_ptr->queue)) {
+			u32 generation = udc_ep_ptr->generation;
+
+			ret = crg_udc_queue_pending_trbs(udc_ep_ptr);
+			if (ret == -ENOSPC || ret == -EBUSY)
+				udc_ep_ptr->tran_ring_full = true;
+			else if (ret)
+				return ret;
+
+			/* Pending-request giveback can drop udc_lock. */
+			if (crg_udc->resetting || crg_udc->port_reset_pending ||
+			    udc_ep_ptr->halt_failed ||
+			    udc_ep_ptr->generation != generation ||
+			    udc_ep_ptr->ep_state != EP_STATE_RUNNING ||
+			    !udc_ep_ptr->desc)
+				return -ESHUTDOWN;
+			crg_udc_knock_doorbell(crg_udc, udc_ep_ptr->dci);
+		}
+	} else {
+		/* wedged EP deny CLEAR HALT */
+		dev_dbg(crg_udc->dev, "wedged EP deny CLEAR HALT dci = %d\n",
+			udc_ep_ptr->dci);
+		/* reset sequence number */
+		if (reset_seq_only &&
+		    crg_udc_issue_command(crg_udc, CRG_CMD_RESET_SEQNUM, param0,
+					  0))
+			return -EIO;
+	}
+
+	return 0;
+
+clear_halt_failed:
+	/*
+	 * CLEAR_HALT may have taken effect even if the following command
+	 * failed. Block software queues and retain DMA mappings until a
+	 * confirmed SET_HALT retry, endpoint disable, or controller reset.
+	 */
+	udc_ep_ptr->halt_failed = true;
+	udc_ep_ptr->dequeue_paused = false;
+	udc_ep_ptr->ep_state = EP_STATE_STOPPED;
+	dev_err(crg_udc->dev,
+		"EP%d CLEAR_HALT recovery failed (%d); DMA mappings retained\n",
+		udc_ep_ptr->dci, ret);
+	return ret;
+}
+
+enum crg_ep_state crg_udc_get_ep_state(struct crg_gadget_dev *crg_udc, int dci)
+{
+	struct crg_udc_ep *udc_ep_ptr;
+
+	/*
+	 * DCI 0 is ep0; DCI 1 is unused in the Corigine ep-context layout
+	 * (ep contexts start from DCI 2 for ep1in/ep1out). This is why the
+	 * ep-context array is indexed as p_epcx[dci - 2] elsewhere.
+	 */
+	if (dci < 0 || dci >= CRG_NUM_EP_CX || dci == 1)
+		return EP_STATE_DISABLED;
+
+	udc_ep_ptr = &crg_udc->udc_ep[dci];
+
+	return udc_ep_ptr->ep_state;
+}
+
+u32 crg_udc_index2dci(u16 index)
+{
+	if (index == 0)
+		return 0;
+
+	return (index & USB_ENDPOINT_NUMBER_MASK) * 2 +
+	       ((index & USB_DIR_IN) ? 0 : 1);
+}
+
+int crg_udc_init_device_context(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	int ret;
+	u32 buff_length;
+	dma_addr_t mapping;
+
+	/* ep0 is not included in ep contexts in crg udc */
+	buff_length = (CRG_NUM_EP_CX - 2) * sizeof(struct crg_ep_cx);
+
+	if (!crg_udc->ep_cx.cpu_addr) {
+		crg_udc->ep_cx.cpu_addr = dma_alloc_coherent(
+			crg_udc->dev, buff_length, &mapping, GFP_ATOMIC);
+		if (!crg_udc->ep_cx.cpu_addr) {
+			ret = -ENOMEM;
+			return ret;
+		}
+	} else {
+		mapping = crg_udc->ep_cx.dma_addr;
+	}
+
+	crg_udc->p_epcx = crg_udc->ep_cx.cpu_addr;
+	crg_udc->ep_cx.len = buff_length;
+	crg_udc->ep_cx.dma_addr = mapping;
+	memset(crg_udc->p_epcx, 0, buff_length);
+	/*
+	 * Ensure the endpoint contexts are initialized before making their
+	 * DMA address visible to the controller.
+	 */
+	dma_wmb();
+	/* hw ops DCBAPLO DCBAPHI */
+	writel(lower_32_bits(crg_udc->ep_cx.dma_addr), &uccr->dcbaplo);
+	writel(upper_32_bits(crg_udc->ep_cx.dma_addr), &uccr->dcbaphi);
+
+	return 0;
+}
+
+void crg_udc_init_ep_info(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	/* udc_ep[0] is reserved */
+	crg_ep_struct_setup(crg_udc, 0, NULL);
+
+	for (i = 1; i < CRG_NUM_EP_CX / 2; i++) {
+		char name[14];
+
+		snprintf(name, sizeof(name), "ep%din", i);
+		crg_ep_struct_setup(crg_udc, i * 2, name);
+		snprintf(name, sizeof(name), "ep%dout", i);
+		crg_ep_struct_setup(crg_udc, i * 2 + 1, name);
+	}
+}
+
+static bool is_request_dequeued(struct crg_gadget_dev *crg_udc,
+				struct crg_udc_ep *udc_ep,
+				struct crg_event_trb *event)
+{
+	struct crg_udc_request *udc_req;
+	u32 trb_pt_lo = le32_to_cpu(event->dw0);
+	u32 trb_pt_hi = le32_to_cpu(event->dw1);
+	u64 trb_addr = (u64)trb_pt_lo | ((u64)trb_pt_hi << 32);
+	struct crg_transfer_trb *trb_pt;
+
+	if (list_empty(&udc_ep->queue))
+		return true;
+
+	trb_pt = crg_udc_tran_trb_dma_to_virt(udc_ep, trb_addr);
+	if (!trb_pt)
+		return true;
+
+	/* The transfer event handler consumes the queue head only. Do not
+	 * accept an event for a later request and attribute it to the head.
+	 */
+	udc_req = list_first_entry(&udc_ep->queue, struct crg_udc_request, queue);
+	if (trb_pt == udc_req->first_trb || trb_pt == udc_req->last_trb)
+		return false;
+
+	return !(crg_udc_is_pointer_less_than(trb_pt, udc_req->last_trb,
+						      udc_ep) &&
+		 crg_udc_is_pointer_less_than(udc_req->first_trb, trb_pt,
+						     udc_ep));
+}
+
+void crg_udc_knock_doorbell(struct crg_gadget_dev *crg_udc, int dci)
+{
+	u32 tmp;
+	struct crg_uccr __iomem *uccr;
+
+	uccr = crg_udc->uccr;
+	/* Ensure everything is written before notifying the HW */
+	dma_wmb();
+
+	tmp = FIELD_PREP(CRG_U3DC_DB_TARGET_MASK, dci);
+	writel(tmp, &uccr->doorbell);
+
+	trace_crg_udc_doorbell(crg_udc, dci);
+}
+
+/*
+ * Complete a request and give it back to the gadget layer via the
+ * standard usb_gadget_giveback_request() helper.
+ *
+ * Must be called with udc_lock held and interrupts disabled.
+ *
+ * The request's ->complete() callback must not sleep. crg_udc_req_done() drops
+ * udc_lock before the giveback and re-acquires it before returning.
+ * Callers therefore cannot assume state protected by udc_lock is
+ * unchanged across this call.
+ */
+void crg_udc_req_done(struct crg_udc_ep *udc_ep,
+		      struct crg_udc_request *udc_req, int status)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+
+	if (likely(udc_req->usb_req.status == -EINPROGRESS))
+		udc_req->usb_req.status = status;
+
+	trace_crg_udc_request_giveback(udc_ep, udc_req);
+
+	list_del_init(&udc_req->queue);
+
+	/*
+	 * Only published payloads can still be owned by the DMA master.
+	 * Move the mapping off the request before giving it back. No CPU
+	 * access to the bounce pages is allowed while they are quarantined.
+	 */
+	if (crg_udc->dma_quiesce_failed && udc_req->bounce &&
+	    udc_req->first_trb) {
+		list_add_tail(&udc_req->bounce->quarantine,
+			      &crg_udc->dma_quarantine);
+		udc_req->bounce = NULL;
+		udc_req->usb_req.status = -ESHUTDOWN;
+		udc_req->usb_req.actual = 0;
+	} else {
+		crg_udc_unmap_request(udc_ep, udc_req, udc_req->usb_req.actual);
+	}
+
+	if (udc_req->usb_req.complete) {
+		crg_udc_callback_enter(crg_udc);
+		spin_unlock(&crg_udc->udc_lock);
+		usb_gadget_giveback_request(&udc_ep->usb_ep, &udc_req->usb_req);
+		spin_lock(&crg_udc->udc_lock);
+		crg_udc_callback_exit(crg_udc);
+	}
+}
+
+/*
+ * A transfer error must stop hardware DMA before giving requests back.
+ * Keep the endpoint blocked if the stop command fails, so callers cannot
+ * queue more TRBs while old requests still own DMA mappings.
+ */
+static int crg_udc_stop_error_ep(struct crg_gadget_dev *crg_udc, u8 dci)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[dci];
+	struct crg_udc_request *req;
+	bool isoc;
+	u32 tmp;
+	int ret;
+
+	if (crg_udc->resetting || !udc_ep_ptr->desc ||
+	    udc_ep_ptr->ep_state == EP_STATE_DISABLED)
+		return -ESHUTDOWN;
+
+	/* Preserve -EIO for the failed request, including after recovery. */
+	if (!list_empty(&udc_ep_ptr->queue)) {
+		req = list_first_entry(&udc_ep_ptr->queue,
+				       struct crg_udc_request, queue);
+		if (req->usb_req.status == -EINPROGRESS)
+			req->usb_req.status = -EIO;
+	}
+
+	isoc = usb_endpoint_xfer_isoc(udc_ep_ptr->desc);
+	if (udc_ep_ptr->ep_state != EP_STATE_HALTED) {
+		/* Block queues while stopping, including on command failure. */
+		udc_ep_ptr->ep_state = EP_STATE_STOPPED;
+		udc_ep_ptr->dequeue_paused = false;
+		ret = crg_udc_issue_command(crg_udc,
+				isoc ? CRG_CMD_STOP_EP : CRG_CMD_SET_HALT,
+				BIT(dci), 0);
+		if (ret)
+			goto stop_failed;
+	}
+
+	ret = readl_poll_timeout_atomic(&uccr->ep_running, tmp,
+					 !(tmp & BIT(dci)), 10, 10000);
+	if (ret)
+		goto stop_failed;
+
+	/* The controller is no longer reading request buffers. */
+	udc_ep_ptr->halt_failed = false;
+	udc_ep_ptr->deq_pt = udc_ep_ptr->enq_pt;
+	udc_ep_ptr->tran_ring_full = false;
+	udc_ep_ptr->ep_state = isoc ? EP_STATE_STOPPED : EP_STATE_HALTED;
+
+	crg_udc_ep_nuke(udc_ep_ptr, -ECONNRESET);
+
+	return 0;
+
+stop_failed:
+	udc_ep_ptr->halt_failed = true;
+	udc_ep_ptr->ep_state = EP_STATE_STOPPED;
+	crg_udc_schedule_endpoint_recovery(crg_udc);
+	return ret;
+}
+
+void crg_udc_clear_req_container(struct crg_udc_request *udc_req_ptr)
+{
+	udc_req_ptr->buff_len_left = 0;
+	udc_req_ptr->trbs_needed = 0;
+	udc_req_ptr->all_trbs_queued = 0;
+	udc_req_ptr->td_pending = false;
+	udc_req_ptr->first_trb = NULL;
+	udc_req_ptr->last_trb = NULL;
+	udc_req_ptr->td_start_offset = 0;
+	udc_req_ptr->sg = NULL;
+	udc_req_ptr->sg_index = 0;
+	udc_req_ptr->sg_offset = 0;
+}
+
+const struct usb_ep_ops crg_udc_ep_ops = {
+	.enable = crg_udc_ep_enable,
+	.disable = crg_udc_ep_disable,
+	.alloc_request = crg_udc_alloc_request,
+	.free_request = crg_udc_free_request,
+	.queue = crg_udc_ep_queue,
+	.dequeue = crg_udc_ep_dequeue,
+	.set_halt = crg_udc_ep_set_halt,
+	.set_wedge = crg_udc_ep_set_wedge,
+};
+
+const struct usb_gadget_ops crg_gadget_ops = {
+	.get_frame = crg_gadget_get_frame,
+	.wakeup = crg_gadget_wakeup,
+	.set_remote_wakeup = crg_gadget_set_remote_wakeup,
+	.set_selfpowered = crg_gadget_set_selfpowered,
+	.pullup = crg_gadget_pullup,
+	.udc_start = crg_gadget_start,
+	.udc_stop = crg_gadget_stop,
+	.udc_set_speed = crg_udc_set_speed,
+	.udc_async_callbacks = crg_gadget_async_callbacks,
+};
diff --git a/drivers/usb/gadget/udc/crg/crg-udc-trace.c b/drivers/usb/gadget/udc/crg/crg-udc-trace.c
new file mode 100644
index 000000000000..ee091708dbe0
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-trace.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ * Trace Support.
+ *
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+#define CREATE_TRACE_POINTS
+#include "crg-udc-trace.h"

-- 
2.34.1

