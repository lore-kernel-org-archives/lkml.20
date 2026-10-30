Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.141
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793347822;
	b=18MOPHPvXXEhZwrn92ykyjCcUxFZkvuyFSgFGjktqK4MtRdPWWV8WbwO+/CoBaBgXMzn
	 uXPud6cRQPz2gu8W3YTVGUEWy+SCOwUfrGRxerd6pMzGYF+Rk1wH+Y2f8GYkDruqDzm+3
	 y7ToRCruWo/nDfpOsl3jS8JDgo5m9shNbk9+ZMS9RyX0t9N0TFHFcL2N9JBlgpq3h9Z/2
	 jVSiVLmqFewtD/L0pIQooMILc0jIlTmVzV7dDLZ/bLuJ1py9keclrfPEwCPi0fsX6dseH
	 qu+aXEME6ABofTJYIrKAmPuEtsKa6vcupRCnGxhmwpJXuz81o0GKg8YmwnrUDbDlsMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347822;
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
	bh=OgBaOT45TF9QOBGqFbGOB7OZlLQhNB2IzhbccaikEO8=;
	b=mFLQDvIrJGywgXgZfAzfYDtYuOF93ORNmQcR131PJ1zSlWPNCyhmc4nfVMgaMazJpGNy
	 eKZqTJO7uXcuWUS3XTB9whZLd7vTkOex1r8IT9X6VkGroKmpOMD/xI9zbcLkGFEOtlZ6s
	 DUDJR5kklmByP//t+xJ75f0Vc6uNm+jrs5/yVMzvPdl7tOS1My2Fsm+CcRBR7aqfeniVr
	 qOcxsd7GyMUHitbHZGApfM8agBtkE0g9piHx3EqMYYguIU3hUXqxmGYIxsSJthSHlDeOi
	 kC4C+mKO35fDYPQL2hyVd5Bm4Buule2xgGJ9V98Fmlhog3gdGFAZEVXwidnE6PgQNNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=XBM9K1AA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.141
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022141.outbound.protection.outlook.com [40.107.209.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE31C606A31A;
	Fri, 30 Oct 2026 08:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE31C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=XBM9K1AA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ok+DYnNDqb2rQwrJNZVPdxqd7JHuyPuIUWPQ17eo2vB1plsKhXPtmLan0SC20fVEa7sp/naUofQuh0IyKP5w7VWlbSvNhlUawssrZNcuMPTI/Ztm72VM6N3/V28cdz9SGv+fukzXrsdCBqf5MHExs2nK2naCsE2x4KoHzZBK7a+wxPSa5Bf+9Y4IjHREtNWYMg9cuvqhIM50D0Un10JE9khae38zcUJzCsFjXXzBEzofhec0NdnPZ0tXJ4A905STXBxpFHbWh9vstXO33t0fVUKICnkmJx/LQjNwc5cIrdRQsnD7CWRUWD/FGb2dLqQw7RB5bljfCLJIuJDKIRxpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgBaOT45TF9QOBGqFbGOB7OZlLQhNB2IzhbccaikEO8=;
 b=Xip2UN4UHPo6ekaa/oTltThRM3/srL//rtA0sE8MjjE+LCkRtX2o9gPqEpo3hSWuoV9y3CcOSLaM3h1zoQMACL0apGIALVdiP59xFaMo0cn8t9CDRckb5Ki8j7/Sbp6KH/CR21Tx1c6WEzLaJccCM2q2pXLFM6Mo/WCBdebzhooIVDD3wKyiv84xCkSItmHrplq5Z8VF8shtt/hoDsindv7hKZ5sdrvUezrUYjN9MiYDfSkGKFe4MKF/vZzag1CIo8OjguY5Ie7w4zg/oGgntyV+ezGSlqd1ujuC1/ym7IeJDpBSmlgIIwli0SLJ9YBG9OmQtTyh5nWu+dOeRmXbLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgBaOT45TF9QOBGqFbGOB7OZlLQhNB2IzhbccaikEO8=;
 b=XBM9K1AAg2tQoDAdc11qVWHS44cmlCEfNOI/b9EzOhr9QeligRcsqjVx0OKy5AmovaKW7I7eD5YXWo5+vkkLOrfNnpvX3lXxPySlXB6p65R/pL1XqKf46vT+mfI3hh+SBNyO0m41FDYSgByKH2ojM30/XzFFqKm1d2RoDhu7rOquPQUW4Xbuy25CeZ0BTD1hKI8V4q5+VpE3Rlury5mfbbTKP4UnLeItU9tS6PUqY90QrrrHf+m5eZ6AptTUKu4vNj1TeVumDNkyDsUcX55NpcFAhuzPTTE3gqWbRY6DKPBlnTJ+awlUscb+bdAlgEnIL80KyFMJz6WCYsxDkkpwQQ==
Received: from PH8P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::6)
 by PH8PR18MB988676.namprd18.prod.outlook.com (2603:10b6:510:40d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 08:10:16 +0000
Received: from CY6PEPF0000004D.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::29) by PH8P220CA0028.outlook.office365.com
 (2603:10b6:510:348::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 08:10:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CY6PEPF0000004D.mail.protection.outlook.com (10.167.247.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 08:10:15 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 4D2F24186B59;
	Fri, 30 Oct 2026 01:10:15 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Fri, 30 Oct 2026 01:10:10 -0700
Subject: [PATCH v4 2/6] usb: gadget: udc: crg: Add hardware definitions and
 structs
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
Message-Id: <20261030-axiado-ax3000-usb-device-controller-v4-2-c5267b36a777@axiado.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793347814; l=36185;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=F/tNHKKLZlnVBZO4cL8i+4NE2tjmx/uvnWAYbo/3Gz4=;
 b=RrUXJp28CaiRFs4rPJZ91ymyoteygqkM69b0c0Q4ojKpfP5MLbU3I7NDAlxV5Xls4G/22ArV1
 GB2N7ow5De8BJum7SJVfwmKj93209AUa4yuuc2e7hoM1zYla/inKPIn
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004D:EE_|PH8PR18MB988676:EE_
X-MS-Office365-Filtering-Correlation-Id: f2cf23ba-f116-433b-1077-08df365d3ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|34020700016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|3023799007|56012099006|5023799004|261026140227099003|261026121527099003|261028144727099003|10067099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261022113327099003|261009223027099003|261009221227099003|261009221727099003|261009223327099003|261009220027099003;
X-Microsoft-Antispam-Message-Info:
	Xho3m5VeiTEezjIPl2CWs0ViQuVNZmD03fzZPUiEChdO+Io8O4fdGRvnbz88j6bdIOx25QnS/ID8DC4f53hEZ6f8iaxWOLQpukJ6015mt9lD7Veg89c5IKWCFgnP7pQS50BS4+v5MyqTC0B0E7mlK4rN5IYXg7sIQMkIFgSjRdO54dzyuzaU/VmEuy1hCNjCw14ikwNnfcA1NkRO49Gl9d5dttHMhMgv04pnYfQTP/Ok1VTacElO0ApSsd3A0s+gFfEU2nwYGd3lSvJ7EIR/c475lLBw3+WQ16HbnzpTpgQ/tTS2MCRdMzE8162rFQlrSL+KljYGMzLe6wVECRXibl1XDf/tSdQKlSjWPkDLFW7wEDHH/4F5beo9HcBr8YKVWrdoeHY/amllDa9/2DDQv0rKqnmeLU+5sJlEPdCWVcjk28EVgRxFeJK+uOpqkDa+XjtxcbNCKTnFZPq32dGgkWIqp3C0upzMYGFq8bZQuiC1GBZR583WuF2uHhddXC+maNCzBCQbdF6S1sz1ycSfVwGkk91YKCweZaINKpwQFUnX7ec3IMGEm7iqqaZb9QYNEXh0MHGPRj4HrTD4QWynv48o533u2JidSN3zq6cz988VKMSrlutaX0Xcl2Z8K4NxhSmVMI9He55ctc5x+9aWRfm1ywGmsY23GCVFE1UKuB5vLWVhryv+MRvTYnYOCiOadBXJvuOjmOc8uA/jhkCK0w==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(34020700016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(5023799004)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022113327099003)(261009223027099003)(261009221227099003)(261009221727099003)(261009223327099003)(261009220027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g0enzk44so0u4vmfkIrH5FhZVhXI9lS542TJ29syLB4aTBcc9I7NIB20x90bf98ddJ7ETWAdNfx70rf/s+lUOrrHKdeyORDqXfk0DjBKgqAxCRZMN1JeJECmj6xYd5OP+46DcbGamohcwjlE08JLsAu1+lK7pM4fJsxvw1e5JIG3mWIvE4nk+vfPHG2SHep3KJym0Nrl2jg66J+yikIPbfdZoMtG3lYJd4v/BVet75SrUlNMWfT3T976OmUQXLrrhxLiwuuPP3Rd2PZnTFdQQl70VZdrxOHqE41fNf63G/8hjuQRKNaEkxvelROuUe6AtMgH2KiCKLX2MVUVNStMHSpbr3TrllHG8Fmz2iZ7HlyBmywkOVb4YpPrBG//S/MjIy8UE9ohuW+Qcx6VUStcdi9+eZidDePTlmFMu1IWVw2zn0f5SdohyjNcJ3WNgOsB
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:10:15.6660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cf23ba-f116-433b-1077-08df365d3ae1
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR18MB988676

This patch introduces the hardware definitions, register offsets, and
fundamental data structures for the Axiado AX3000/AX3005 USB Device
Controller driver.

Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 MAINTAINERS                                |   1 +
 drivers/usb/gadget/udc/crg/crg-udc-debug.h | 143 ++++++
 drivers/usb/gadget/udc/crg/crg-udc-trace.h | 164 +++++++
 drivers/usb/gadget/udc/crg/crg-udc.h       | 729 +++++++++++++++++++++++++++++
 4 files changed, 1037 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 58c5c8e00870..d5b6a04a95ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4515,6 +4515,7 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
 L:	linux-usb@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
+F:	drivers/usb/gadget/udc/crg/
 
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
diff --git a/drivers/usb/gadget/udc/crg/crg-udc-debug.h b/drivers/usb/gadget/udc/crg/crg-udc-debug.h
new file mode 100644
index 000000000000..f73c60a79ade
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-debug.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ * Debug/trace decode helpers.
+ *
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+
+#ifndef __CRG_UDC_DEBUG_H
+#define __CRG_UDC_DEBUG_H
+
+#include "crg-udc.h"
+
+static inline const char *crg_udc_trb_type_string(u32 type)
+{
+	switch (type) {
+	case TRB_TYPE_XFER_NORMAL:
+		return "Normal";
+	case TRB_TYPE_XFER_DATA_STAGE:
+		return "Data Stage";
+	case TRB_TYPE_XFER_STATUS_STAGE:
+		return "Status Stage";
+	case TRB_TYPE_XFER_DATA_ISOCH:
+		return "Isoch";
+	case TRB_TYPE_LINK:
+		return "Link";
+	case TRB_TYPE_NO_OP:
+		return "No-Op";
+	case TRB_TYPE_EVT_TRANSFER:
+		return "Transfer Event";
+	case TRB_TYPE_EVT_CMD_COMPLETION:
+		return "Command Completion Event";
+	case TRB_TYPE_EVT_PORT_STATUS_CHANGE:
+		return "Port Status Change Event";
+	case TRB_TYPE_EVT_MFINDEX_WRAP:
+		return "MFINDEX Wrap Event";
+	case TRB_TYPE_EVT_SETUP_PKT:
+		return "Setup Packet Event";
+	default:
+		return "Reserved";
+	}
+}
+
+static inline const char *crg_udc_cmpl_code_string(u32 code)
+{
+	switch (code) {
+	case CMPL_CODE_INVALID:
+		return "Invalid";
+	case CMPL_CODE_SUCCESS:
+		return "Success";
+	case CMPL_CODE_DATA_BUFFER_ERR:
+		return "Data Buffer Error";
+	case CMPL_CODE_BABBLE_DETECTED_ERR:
+		return "Babble Detected";
+	case CMPL_CODE_USB_TRANS_ERR:
+		return "USB Transaction Error";
+	case CMPL_CODE_TRB_ERR:
+		return "TRB Error";
+	case CMPL_CODE_TRB_STALL:
+		return "Stall";
+	case CMPL_CODE_INVALID_STREAM_TYPE_ERR:
+		return "Invalid Stream Type";
+	case CMPL_CODE_SHORT_PKT:
+		return "Short Packet";
+	case CMPL_CODE_RING_UNDERRUN:
+		return "Ring Underrun";
+	case CMPL_CODE_RING_OVERRUN:
+		return "Ring Overrun";
+	case CMPL_CODE_EVENT_RING_FULL_ERR:
+		return "Event Ring Full";
+	case CMPL_CODE_STOPPED:
+		return "Stopped";
+	case CMPL_CODE_STOPPED_LENGTH_INVALID:
+		return "Stopped - Length Invalid";
+	case CMPL_CODE_ISOCH_BUFFER_OVERRUN:
+		return "Isoch Buffer Overrun";
+	case CMPL_CODE_PROTOCOL_STALL:
+		return "Protocol Stall";
+	case CMPL_CODE_SETUP_TAG_MISMATCH:
+		return "Setup Tag Mismatch";
+	case CMPL_CODE_HALTED:
+		return "Halted";
+	case CMPL_CODE_HALTED_LENGTH_INVALID:
+		return "Halted - Length Invalid";
+	case CMPL_CODE_DISABLED:
+		return "Disabled";
+	case CMPL_CODE_DISABLED_LENGTH_INVALID:
+		return "Disabled - Length Invalid";
+	default:
+		return "Unknown";
+	}
+}
+
+static inline const char *crg_udc_decode_portsc(char *str, size_t size,
+						u32 portsc)
+{
+	scnprintf(str, size, "0x%08x, PLS: %lu, Speed: %lu, %s%s%s%s",
+		 portsc, FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, portsc),
+		 FIELD_GET(CRG_U3DC_PORTSC_SPEED_MASK, portsc),
+		 (portsc & CRG_U3DC_PORTSC_CCS) ? "CCS " : "",
+		 (portsc & CRG_U3DC_PORTSC_PED) ? "PED " : "",
+		 (portsc & CRG_U3DC_PORTSC_PR) ? "PR " : "",
+		 (portsc & CRG_U3DC_PORTSC_PP) ? "PP " : "");
+
+	return str;
+}
+
+static inline const char *crg_udc_decode_trb(char *str, size_t size,
+					     struct crg_transfer_trb *trb)
+{
+	u32 dw2 = le32_to_cpu(trb->dw2);
+	u32 dw3 = le32_to_cpu(trb->dw3);
+	u32 type = FIELD_GET(TRB_TYPE_MASK, dw3);
+
+	scnprintf(str, size,
+		  "type: %s, len: %lu, cycle: %lu, chain: %lu, ioc: %lu",
+		  crg_udc_trb_type_string(type),
+		  FIELD_GET(TRB_TRANSFER_LEN_MASK, dw2),
+		  dw3 & TRB_CYCLE_BIT_MASK ? 1UL : 0UL,
+		  dw3 & TRB_CHAIN_BIT_MASK ? 1UL : 0UL,
+		  dw3 & TRB_INTR_ON_COMPLETION_MASK ? 1UL : 0UL);
+
+	return str;
+}
+
+static inline const char *crg_udc_decode_event_trb(char *str, size_t size,
+						   struct crg_event_trb *trb)
+{
+	u32 dw2 = le32_to_cpu(trb->dw2);
+	u32 dw3 = le32_to_cpu(trb->dw3);
+	u32 type = FIELD_GET(EVE_TRB_TYPE_MASK, dw3);
+
+	scnprintf(str, size, "type: %s, cmpl: %s, len: %lu, dci: %lu",
+		  crg_udc_trb_type_string(type),
+		  crg_udc_cmpl_code_string(
+			  FIELD_GET(EVE_TRB_COMPL_CODE_MASK, dw2)),
+		  FIELD_GET(EVE_TRB_TRAN_LEN_MASK, dw2),
+		  FIELD_GET(EVE_TRB_ENDPOINT_ID_MASK, dw3));
+
+	return str;
+}
+
+#endif /* __CRG_UDC_DEBUG_H */
diff --git a/drivers/usb/gadget/udc/crg/crg-udc-trace.h b/drivers/usb/gadget/udc/crg/crg-udc-trace.h
new file mode 100644
index 000000000000..672a719a041b
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-trace.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ * Trace support header file.
+ *
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM crg-udc
+
+#undef TRACE_SYSTEM_VAR
+#define TRACE_SYSTEM_VAR crg_udc
+
+#if !defined(__CRG_UDC_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define __CRG_UDC_TRACE_H
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+#include <linux/usb/ch9.h>
+#include "crg-udc.h"
+#include "crg-udc-debug.h"
+
+#define CRG_MSG_MAX 200
+
+DECLARE_EVENT_CLASS(crg_udc_log_enable_disable, TP_PROTO(int set), TP_ARGS(set),
+		    TP_STRUCT__entry(__field(int, set)),
+		    TP_fast_assign(__entry->set = set;),
+		    TP_printk("%s", __entry->set ? "enabled" : "disabled"));
+
+DEFINE_EVENT(crg_udc_log_enable_disable, crg_udc_pullup, TP_PROTO(int set),
+	     TP_ARGS(set));
+
+TRACE_EVENT(crg_udc_no_room_on_ring, TP_PROTO(char *msg), TP_ARGS(msg),
+	    TP_STRUCT__entry(__string(text, msg)),
+	    TP_fast_assign(__assign_str(text);),
+	    TP_printk("%s", __get_str(text)));
+
+TRACE_EVENT(crg_udc_ep_halt,
+	    TP_PROTO(struct crg_udc_ep *udc_ep, u8 halt, u8 wedge),
+	    TP_ARGS(udc_ep, halt, wedge),
+	    TP_STRUCT__entry(__string(name, udc_ep->usb_ep.name)
+				     __field(u8, halt) __field(u8, wedge)),
+	    TP_fast_assign(__assign_str(name); __entry->halt = halt;
+			   __entry->wedge = wedge;),
+	    TP_printk("%s: %s%s", __get_str(name),
+		      __entry->halt ? "halted" : "cleared",
+		      __entry->wedge ? " (wedged)" : ""));
+
+TRACE_EVENT(crg_udc_portsc, TP_PROTO(u32 portsc), TP_ARGS(portsc),
+	    TP_STRUCT__entry(__field(u32, portsc)),
+	    TP_fast_assign(__entry->portsc = portsc;),
+	    TP_printk("%s",
+		      crg_udc_decode_portsc(__get_buf(CRG_MSG_MAX), CRG_MSG_MAX,
+					    __entry->portsc)));
+
+TRACE_EVENT(crg_udc_doorbell, TP_PROTO(struct crg_gadget_dev *crg_udc, int dci),
+	    TP_ARGS(crg_udc, dci),
+	    TP_STRUCT__entry(__string(name, crg_udc->udc_ep[dci].usb_ep.name)
+				     __field(int, dci)),
+	    TP_fast_assign(__assign_str(name); __entry->dci = dci;),
+	    TP_printk("%s, dci %d", __get_str(name), __entry->dci));
+
+DECLARE_EVENT_CLASS(
+	crg_udc_log_ctrl, TP_PROTO(struct usb_ctrlrequest *ctrl), TP_ARGS(ctrl),
+	TP_STRUCT__entry(__field(u8, bRequestType) __field(u8, bRequest)
+				 __field(u16, wValue) __field(u16, wIndex)
+					 __field(u16, wLength)),
+	TP_fast_assign(__entry->bRequestType = ctrl->bRequestType;
+		       __entry->bRequest = ctrl->bRequest;
+		       __entry->wValue = le16_to_cpu(ctrl->wValue);
+		       __entry->wIndex = le16_to_cpu(ctrl->wIndex);
+		       __entry->wLength = le16_to_cpu(ctrl->wLength);),
+	TP_printk("%s", usb_decode_ctrl(__get_buf(CRG_MSG_MAX), CRG_MSG_MAX,
+					__entry->bRequestType,
+					__entry->bRequest, __entry->wValue,
+					__entry->wIndex, __entry->wLength)));
+
+DEFINE_EVENT(crg_udc_log_ctrl, crg_udc_ctrl_req,
+	     TP_PROTO(struct usb_ctrlrequest *ctrl), TP_ARGS(ctrl));
+
+DECLARE_EVENT_CLASS(
+	crg_udc_log_trb,
+	TP_PROTO(struct crg_udc_ep *udc_ep, struct crg_transfer_trb *trb),
+	TP_ARGS(udc_ep, trb),
+	TP_STRUCT__entry(__string(name, udc_ep->usb_ep.name)
+				 __field(struct crg_transfer_trb *, trb)
+					 __dynamic_array(char, decoded,
+							 CRG_MSG_MAX)),
+	TP_fast_assign(__assign_str(name); __entry->trb = trb;
+		       crg_udc_decode_trb(__get_dynamic_array(decoded),
+					  CRG_MSG_MAX, trb);),
+	TP_printk("%s: trb %p, %s", __get_str(name), __entry->trb,
+		  __get_str(decoded)));
+
+DEFINE_EVENT(crg_udc_log_trb, crg_udc_queue_trb,
+	     TP_PROTO(struct crg_udc_ep *udc_ep, struct crg_transfer_trb *trb),
+	     TP_ARGS(udc_ep, trb));
+
+TRACE_EVENT(
+	crg_udc_event_trb, TP_PROTO(struct crg_event_trb *trb), TP_ARGS(trb),
+	TP_STRUCT__entry(__field(struct crg_event_trb *, trb)
+				 __dynamic_array(char, decoded, CRG_MSG_MAX)),
+	TP_fast_assign(__entry->trb = trb;
+		       crg_udc_decode_event_trb(__get_dynamic_array(decoded),
+						CRG_MSG_MAX, trb);),
+	TP_printk("trb %p, %s", __entry->trb, __get_str(decoded)));
+
+DECLARE_EVENT_CLASS(
+	crg_udc_log_request,
+	TP_PROTO(struct crg_udc_ep *udc_ep, struct crg_udc_request *udc_req),
+	TP_ARGS(udc_ep, udc_req),
+	TP_STRUCT__entry(
+		__string(name, udc_ep->usb_ep.name) __field(
+			struct usb_request *, request) __field(void *, buf)
+			__field(unsigned int, actual) __field(unsigned int,
+							      length)
+				__field(int, status) __field(dma_addr_t, dma)
+					__field(int, zero) __field(int,
+								   short_not_ok)
+						__field(int, no_interrupt)),
+	TP_fast_assign(__assign_str(name); __entry->request = &udc_req->usb_req;
+		       __entry->buf = udc_req->usb_req.buf;
+		       __entry->actual = udc_req->usb_req.actual;
+		       __entry->length = udc_req->usb_req.length;
+		       __entry->status = udc_req->usb_req.status;
+		       __entry->dma = udc_req->usb_req.dma;
+		       __entry->zero = udc_req->usb_req.zero;
+		       __entry->short_not_ok = udc_req->usb_req.short_not_ok;
+		       __entry->no_interrupt = udc_req->usb_req.no_interrupt;),
+	TP_printk(
+		"%s: req: %p, buf: %p, length: %u/%u, status: %d, dma: %pad, %s%s%s",
+		__get_str(name), __entry->request, __entry->buf,
+		__entry->actual, __entry->length, __entry->status,
+		&__entry->dma, __entry->zero ? "Z" : "z",
+		__entry->short_not_ok ? "S" : "s",
+		__entry->no_interrupt ? "I" : "i"));
+
+DEFINE_EVENT(crg_udc_log_request, crg_udc_alloc_request,
+	     TP_PROTO(struct crg_udc_ep *udc_ep,
+		      struct crg_udc_request *udc_req),
+	     TP_ARGS(udc_ep, udc_req));
+
+DEFINE_EVENT(crg_udc_log_request, crg_udc_free_request,
+	     TP_PROTO(struct crg_udc_ep *udc_ep,
+		      struct crg_udc_request *udc_req),
+	     TP_ARGS(udc_ep, udc_req));
+
+DEFINE_EVENT(crg_udc_log_request, crg_udc_request_giveback,
+	     TP_PROTO(struct crg_udc_ep *udc_ep,
+		      struct crg_udc_request *udc_req),
+	     TP_ARGS(udc_ep, udc_req));
+
+#endif /* __CRG_UDC_TRACE_H */
+
+/* This part must be outside header guard. */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE crg-udc-trace
+
+#include <trace/define_trace.h>
diff --git a/drivers/usb/gadget/udc/crg/crg-udc.h b/drivers/usb/gadget/udc/crg/crg-udc.h
new file mode 100644
index 000000000000..246822219a8a
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc.h
@@ -0,0 +1,729 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (c) 2019 Corigine Inc.
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+
+#ifndef CRG_UDC_H
+#define CRG_UDC_H
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include <linux/usb/ch9.h>
+#include <linux/usb/gadget.h>
+
+#define CRG_UCCR_OFFSET 0x2400
+#define CRG_UICR_OFFSET 0x2500
+#define CRG_UICR_STRIDE 0x20
+
+/* Corigine USB 3.1 device core register layout. */
+struct crg_uccr {
+	u32 capability;
+	u32 resv0[3];
+
+	u32 config0;
+	u32 config1;
+	u32 resv1[2];
+
+	u32 control;
+	u32 status;
+	u32 dcbaplo;
+	u32 dcbaphi;
+	u32 portsc;
+	u32 u3portpmsc;
+	u32 u2portpmsc;
+	u32 u3portli;
+
+	u32 doorbell;
+	u32 mfindex;
+	u32 ptmctrl;
+	u32 resv3[5];
+
+	u32 ep_enable;
+	u32 ep_running;
+	u32 resv4[2];
+
+	u32 cmd_param0;
+	u32 cmd_param1;
+	u32 cmd_control;
+	u32 resv5[1];
+
+	u32 odb_capability;
+	u32 resv6[3];
+	u32 odb_config[8];
+
+	u32 debug0;
+};
+
+struct crg_uicr {
+	u32 iman;
+	u32 imod;
+	u32 erstsz;
+	u32 resv0;
+
+	u32 erstbalo;
+	u32 erstbahi;
+	u32 erdplo;
+	u32 erdphi;
+};
+
+/* config0/config1 registers */
+#define CRG_U3DC_CFG0_MAXSPEED_MASK GENMASK(3, 0)
+#define CRG_U3DC_CFG0_MAXSPEED_FS 1
+#define CRG_U3DC_CFG0_MAXSPEED_HS 3
+#define CRG_U3DC_CFG0_MAXSPEED_SS 4
+#define CRG_U3DC_CFG0_MAXSPEED_SSP 5
+
+#define CRG_U3DC_CFG1_CSC_EVENT_EN BIT(0)
+#define CRG_U3DC_CFG1_PEC_EVENT_EN BIT(1)
+#define CRG_U3DC_CFG1_PPC_EVENT_EN BIT(3)
+#define CRG_U3DC_CFG1_PRC_EVENT_EN BIT(4)
+#define CRG_U3DC_CFG1_PLC_EVENT_EN BIT(5)
+#define CRG_U3DC_CFG1_CEC_EVENT_EN BIT(6)
+
+#define CRG_U3DC_CFG1_U3_ENTRY_EN BIT(8)
+#define CRG_U3DC_CFG1_L1_ENTRY_EN BIT(9)
+#define CRG_U3DC_CFG1_U3_RESUME_EN BIT(10)
+#define CRG_U3DC_CFG1_L1_RESUME_EN BIT(11)
+#define CRG_U3DC_CFG1_INACTIVE_PLC_EN BIT(12)
+#define CRG_U3DC_CFG1_U3_RESUME_NORESP_PLC_EN BIT(13)
+#define CRG_U3DC_CFG1_U2_RESUME_NORESP_PLC_EN BIT(14)
+
+#define CRG_U3DC_CFG1_SETUP_EVENT_EN BIT(16)
+
+/* control register */
+#define CRG_U3DC_CTRL_RUN BIT(0)
+#define CRG_U3DC_CTRL_STOP 0
+#define CRG_U3DC_CTRL_SWRST BIT(1)
+#define CRG_U3DC_CTRL_INT_EN BIT(2)
+#define CRG_U3DC_CTRL_SYSERR_EN BIT(3)
+#define CRG_U3DC_CTRL_EWE BIT(10)
+#define CRG_U3DC_CTRL_KP_CNCT BIT(11)
+
+/* status register */
+#define CRG_U3DC_STATUS_DEV_CTRL_HALT BIT(0)
+#define CRG_U3DC_STATUS_SYS_ERR BIT(2)
+#define CRG_U3DC_STATUS_EINT BIT(3)
+
+/* portsc register */
+#define CRG_U3DC_PORTSC_CCS BIT(0)
+#define CRG_U3DC_PORTSC_PED BIT(1)
+#define CRG_U3DC_PORTSC_PP BIT(3)
+#define CRG_U3DC_PORTSC_PR BIT(4)
+#define CRG_U3DC_PORTSC_PLS_MASK GENMASK(8, 5)
+#define CRG_U3DC_PORTSC_PLS_U3 3
+
+#define CRG_U3DC_PORTSC_SPEED_MASK GENMASK(13, 10)
+#define CRG_U3DC_PORTSC_SPEED_FS 0x1
+#define CRG_U3DC_PORTSC_SPEED_LS 0x2
+#define CRG_U3DC_PORTSC_SPEED_HS 0x3
+#define CRG_U3DC_PORTSC_SPEED_SS 0x4
+#define CRG_U3DC_PORTSC_SPEED_SSP 0x5
+
+#define CRG_U3DC_PORTSC_LWS BIT(16)
+#define CRG_U3DC_PORTSC_CSC BIT(17)
+#define CRG_U3DC_PORTSC_PEC BIT(18)
+#define CRG_U3DC_PORTSC_PPC BIT(20)
+#define CRG_U3DC_PORTSC_PRC BIT(21)
+#define CRG_U3DC_PORTSC_PLC BIT(22)
+#define CRG_U3DC_PORTSC_CEC BIT(23)
+#define CRG_U3DC_PORTSC_WCE BIT(25)
+#define CRG_U3DC_PORTSC_WDE BIT(26)
+#define CRG_U3DC_PORTSC_WPR BIT(31)
+
+#define CRG_U3DC_PORTSC_W1C_MASK                                           \
+	(CRG_U3DC_PORTSC_CSC | CRG_U3DC_PORTSC_PEC | CRG_U3DC_PORTSC_PPC | \
+	 CRG_U3DC_PORTSC_PRC | CRG_U3DC_PORTSC_PLC | CRG_U3DC_PORTSC_CEC)
+
+/* mfindex register */
+#define CRG_U3DC_MFINDEX_CURRENT_MASK GENMASK(17, 4)
+#define CRG_U3DC_MFINDEX_FRAME_MASK GENMASK(17, 7)
+
+/* ptmctrl register */
+#define CRG_U3DC_PTMCTRL_ISOCH_DELAY_MASK GENMASK(13, 0)
+
+/* u3portpmsc */
+#define CRG_U3DC_U3PORTPM_U1TMOUT_MASK GENMASK(7, 0)
+#define CRG_U3DC_U3PORTPM_U2TMOUT_MASK GENMASK(15, 8)
+#define CRG_U3DC_U3PORTPM_FLA BIT(16)
+#define CRG_U3DC_U3PORTPM_U1IEN BIT(20)
+#define CRG_U3DC_U3PORTPM_U2IEN BIT(21)
+#define CRG_U3DC_U3PORTPM_U1AEN BIT(22)
+#define CRG_U3DC_U3PORTPM_U2AEN BIT(23)
+
+#define CRG_U3DC_U3PORTPM_U1U2TMOUT_MASK GENMASK(31, 24)
+
+/* u2portpmsc */
+#define CRG_U3DC_U2PORTPM_RJ_TH_MASK GENMASK(3, 0)
+#define CRG_U3DC_U2PORTPM_DS_TH_MASK GENMASK(7, 4)
+#define CRG_U3DC_U2PORTPM_LPM_EN BIT(8)
+#define CRG_U3DC_U2PORTPM_RJ_TH_EN BIT(9)
+#define CRG_U3DC_U2PORTPM_DS_EN BIT(10)
+#define CRG_U3DC_U2PORTPM_SLP_EN BIT(11)
+#define CRG_U3DC_U2PORTPM_LPM_FACK BIT(12)
+#define CRG_U3DC_U2PORTPM_L1_AEX BIT(13)
+#define CRG_U3DC_U2PORTPM_H_B_MASK GENMASK(19, 16)
+#define CRG_U3DC_U2PORTPM_RWE BIT(20)
+#define CRG_U3DC_U2PORTPM_TM_MASK GENMASK(31, 28)
+
+/* doorbell register */
+#define CRG_U3DC_DB_TARGET_MASK GENMASK(4, 0)
+
+/* odb registers */
+#define CRG_U3DC_ODBCFG_2N_OFFSET_MASK GENMASK(9, 0)
+#define CRG_U3DC_ODBCFG_2N_SIZE_MASK GENMASK(12, 10)
+#define CRG_U3DC_ODBCFG_2N1_OFFSET_MASK GENMASK(25, 16)
+#define CRG_U3DC_ODBCFG_2N1_SIZE_MASK GENMASK(28, 26)
+
+/* command control register */
+#define CRG_U3DC_CMD_CTRL_ACTIVE BIT(0)
+#define CRG_U3DC_CMD_CTRL_IOC_EN BIT(1)
+#define CRG_U3DC_CMD_CTRL_TYPE_MASK GENMASK(7, 4)
+#define CRG_U3DC_CMD_CTRL_STATUS_MASK GENMASK(19, 16)
+
+/* interrupt register / IMAN bits */
+#define CRG_U3DC_IMAN_INT_PEND BIT(0)
+#define CRG_U3DC_IMAN_INT_EN BIT(1)
+
+/* erdp bits */
+#define CRG_U3DC_ERDPLO_EHB BIT(3)
+
+/* command parameters: init EP0 */
+#define CRG_CMD0_0_DQPTRLO_MASK GENMASK(31, 4)
+#define CRG_CMD0_0_DCS_MASK BIT(0)
+
+/* command parameters: update EP0 */
+#define CRG_CMD1_0_MPS_MASK GENMASK(31, 16)
+
+/* command parameters: set address */
+#define CRG_CMD2_0_DEV_ADDR_MASK GENMASK(7, 0)
+
+#define CRG_UDC_MODE_REG 0x20fc
+#define CRG_UDC_ROLE_DEVICE 0x1
+
+#define CRG_UDC_VENDOR_REG 0x210c
+#define CRG_UDC_VBUS_DETECT BIT(26)
+
+/*
+ * Device-visible data structures. The controller reads and writes these
+ * over DMA, so the layouts and field encodings below are fixed by the
+ * hardware in the same way as the register definitions above.
+ */
+
+/* Transfer and event TRB types */
+enum crg_trb_type {
+	TRB_TYPE_RSVD = 0,
+	TRB_TYPE_XFER_NORMAL,
+	TRB_TYPE_RSVD2,
+	TRB_TYPE_XFER_DATA_STAGE,
+	TRB_TYPE_XFER_STATUS_STAGE,
+	TRB_TYPE_XFER_DATA_ISOCH,
+	TRB_TYPE_LINK,
+	TRB_TYPE_RSVD7,
+	TRB_TYPE_NO_OP,
+
+	TRB_TYPE_EVT_TRANSFER = 32,
+	TRB_TYPE_EVT_CMD_COMPLETION = 33,
+	TRB_TYPE_EVT_PORT_STATUS_CHANGE = 34,
+	TRB_TYPE_EVT_MFINDEX_WRAP = 39,
+	TRB_TYPE_EVT_SETUP_PKT = 40,
+};
+
+/* Event TRB completion codes */
+enum crg_trb_cmpl_code {
+	CMPL_CODE_INVALID = 0,
+	CMPL_CODE_SUCCESS,
+	CMPL_CODE_DATA_BUFFER_ERR,
+	CMPL_CODE_BABBLE_DETECTED_ERR,
+	CMPL_CODE_USB_TRANS_ERR,
+	CMPL_CODE_TRB_ERR,
+	CMPL_CODE_TRB_STALL,
+	CMPL_CODE_INVALID_STREAM_TYPE_ERR = 10,
+	CMPL_CODE_SHORT_PKT = 13,
+	CMPL_CODE_RING_UNDERRUN,
+	CMPL_CODE_RING_OVERRUN,
+	CMPL_CODE_EVENT_RING_FULL_ERR = 21,
+	CMPL_CODE_STOPPED = 26,
+	CMPL_CODE_STOPPED_LENGTH_INVALID = 27,
+	CMPL_CODE_ISOCH_BUFFER_OVERRUN = 31,
+
+	CMPL_CODE_PROTOCOL_STALL = 192,
+	CMPL_CODE_SETUP_TAG_MISMATCH = 193,
+	CMPL_CODE_HALTED = 194,
+	CMPL_CODE_HALTED_LENGTH_INVALID = 195,
+	CMPL_CODE_DISABLED = 196,
+	CMPL_CODE_DISABLED_LENGTH_INVALID = 197,
+};
+
+/* Endpoint type encoding in the endpoint context */
+enum crg_ep_type {
+	EP_TYPE_INVALID = 0,
+	EP_TYPE_ISOCH_OUTBOUND,
+	EP_TYPE_BULK_OUTBOUND,
+	EP_TYPE_INTR_OUTBOUND,
+	EP_TYPE_INVALID2,
+	EP_TYPE_ISOCH_INBOUND,
+	EP_TYPE_BULK_INBOUND,
+	EP_TYPE_INTR_INBOUND,
+};
+
+/* crg_transfer_trb dw2 fields */
+#define TRB_TRANSFER_LEN_MASK GENMASK(16, 0)
+#define TRB_TD_SIZE_MASK GENMASK(21, 17)
+#define TRB_INTR_TARGET_MASK GENMASK(31, 22)
+
+/* crg_transfer_trb dw3 fields */
+#define TRB_CYCLE_BIT_MASK BIT(0)
+#define TRB_LINK_TOGGLE_CYCLE_MASK BIT(1)
+#define TRB_INTR_ON_SHORT_PKT_MASK BIT(2)
+#define TRB_NO_SNOOP_MASK BIT(3)
+#define TRB_CHAIN_BIT_MASK BIT(4)
+#define TRB_INTR_ON_COMPLETION_MASK BIT(5)
+#define TRB_APPEND_ZLP_MASK BIT(7)
+#define TRB_BLOCK_EVENT_INT_MASK BIT(9)
+#define TRB_TYPE_MASK GENMASK(15, 10)
+#define DATA_STAGE_TRB_DIR_MASK BIT(16)
+#define TRB_SETUP_TAG_MASK GENMASK(18, 17)
+#define STATUS_STAGE_TRB_STALL_MASK BIT(19)
+#define STATUS_STAGE_TRB_SET_ADDR_MASK BIT(20)
+#define ISOC_TRB_FRAME_ID_MASK GENMASK(30, 20)
+#define ISOC_TRB_SIA_MASK BIT(31)
+
+struct crg_transfer_trb {
+	__le32 dw0;
+	__le32 dw1;
+	__le32 dw2;
+	__le32 dw3;
+};
+
+/* crg_event_trb dw2 fields */
+#define EVE_TRB_TRAN_LEN_MASK GENMASK(16, 0)
+#define EVE_TRB_COMPL_CODE_MASK GENMASK(31, 24)
+
+/* crg_event_trb dw3 fields */
+#define EVE_TRB_CYCLE_BIT_MASK BIT(0)
+#define EVE_TRB_TYPE_MASK GENMASK(15, 10)
+#define EVE_TRB_ENDPOINT_ID_MASK GENMASK(20, 16)
+#define EVE_TRB_SETUP_TAG_MASK GENMASK(22, 21)
+
+struct crg_event_trb {
+	__le32 dw0;
+	__le32 dw1;
+	__le32 dw2;
+	__le32 dw3;
+};
+
+/* crg_ep_cx dw0 fields */
+#define EP_CX_LOGICAL_EP_NUM_MASK GENMASK(6, 3)
+#define EP_CX_INTERVAL_MASK GENMASK(23, 16)
+
+/* crg_ep_cx dw1 fields */
+#define EP_CX_EP_TYPE_MASK GENMASK(5, 3)
+#define EP_CX_MAX_BURST_SIZE_MASK GENMASK(15, 8)
+#define EP_CX_MAX_PACKET_SIZE_MASK GENMASK(31, 16)
+
+/* crg_ep_cx dw2 fields */
+#define EP_CX_DEQ_CYC_STATE_MASK BIT(0)
+#define EP_CX_TR_DQPT_LO_MASK GENMASK(31, 4)
+
+struct crg_ep_cx {
+	__le32 dw0;
+	__le32 dw1;
+	__le32 dw2;
+	__le32 dw3;
+};
+
+struct crg_erst {
+	/* 64-bit event ring segment address */
+	__le32 seg_addr_lo;
+	__le32 seg_addr_hi;
+	__le32 seg_size;
+	/* Set to zero */
+	__le32 rsvd;
+};
+
+/* command type */
+enum crg_cmd_type {
+	CRG_CMD_INIT_EP0 = 0,
+	CRG_CMD_UPDATE_EP0_CFG = 1,
+	CRG_CMD_SET_ADDR = 2,
+	CRG_CMD_SEND_DEV_NOTIFICATION = 3,
+	CRG_CMD_CONFIG_EP = 4,
+	CRG_CMD_SET_HALT = 5,
+	CRG_CMD_CLEAR_HALT = 6,
+	CRG_CMD_RESET_SEQNUM = 7,
+	CRG_CMD_STOP_EP = 8,
+	CRG_CMD_SET_TR_DQPTR = 9,
+	CRG_CMD_FORCE_FLOW_CONTROL = 10,
+	CRG_CMD_REQ_LDM_EXCHANGE = 11,
+};
+
+#define CRG_MAX_PACKET_SIZE 1024
+
+#define CRG_ERST_SIZE 1
+#define CRG_EVENT_RING_SIZE 256
+#define CRG_NUM_EP_CX 32
+
+/*
+ * Cap on events drained per udc_lock acquisition in crg_udc_process_event_ring().
+ * Command polling and crg_udc_reset()'s hardware-reset poll both run from
+ * crg_udc_handle_event() with udc_lock held, so without a cap a busy event
+ * ring could keep the lock, and local IRQs, held for as long as events
+ * keep arriving.
+ */
+#define CRG_EVENT_RING_BATCH 32
+
+#define CRG_UDC_TRB_MAX_BUFFER_SIZE 65536
+#define CRG_UDC_CONTROL_EP_TD_RING_SIZE 16
+#define CRG_UDC_BULK_EP_TD_RING_SIZE 1024
+#define CRG_UDC_ISOC_EP_TD_RING_SIZE 32
+#define CRG_UDC_INT_EP_TD_RING_SIZE 8
+
+#define CRG_UDC_U1_TIMEOUT_VAL 0x70
+#define CRG_UDC_U2_TIMEOUT_VAL 0x70
+
+enum crg_ep_state {
+	EP_STATE_DISABLED = 0,
+	EP_STATE_RUNNING = 1,
+	EP_STATE_HALTED = 2,
+	EP_STATE_STOPPED = 3
+};
+
+/* control-transfer setup state machine */
+enum crg_setup_status {
+	WAIT_FOR_SETUP = 0,
+	SETUP_PKT_PROCESS_IN_PROGRESS,
+	DATA_STAGE_XFER,
+	DATA_STAGE_RECV,
+	STATUS_STAGE_XFER,
+	STATUS_STAGE_RECV,
+};
+
+/* interrupt-on-completion moderation rate (in TRBs) per endpoint type */
+enum {
+	CRG_UDC_BULK_EP_INTERRUPT_RATE = 5,
+	CRG_UDC_ISOC_EP_INTERRUPT_RATE = 1,
+};
+
+struct crg_buffer_info {
+	void *cpu_addr;
+	dma_addr_t dma_addr;
+	u32 len;
+};
+
+struct crg_sel_value {
+	u16 u2_pel_value;
+	u16 u2_sel_value;
+	u8 u1_pel_value;
+	u8 u1_sel_value;
+};
+
+struct crg_udc_request {
+	struct usb_request usb_req;
+	struct list_head queue;
+	bool mapped;
+	/*
+	 * Direction used for the DMA mapping call that produced the mapping
+	 * tracked above. ep0 is bidirectional and its
+	 * descriptor address is always 0, so usb_endpoint_dir_in() on the
+	 * endpoint cannot tell an unmap apart from a control IN or OUT
+	 * transfer; the direction actually used to map is recorded here
+	 * instead and reused as-is at unmap time.
+	 */
+	enum dma_data_direction map_dir;
+	struct scatterlist *sg;
+	unsigned int sg_index;
+	u32 sg_offset;
+	u64 buff_len_left;
+	u32 trbs_needed;
+	struct crg_transfer_trb *first_trb;
+	struct crg_transfer_trb *last_trb;
+	bool all_trbs_queued;
+	/* A TD has been published and its completion event is outstanding. */
+	bool td_pending;
+};
+
+struct crg_udc_ep {
+	struct usb_ep usb_ep;
+
+	struct crg_buffer_info tran_ring_info;
+	struct crg_transfer_trb *first_trb;
+	struct crg_transfer_trb *last_trb;
+
+	struct crg_transfer_trb *enq_pt;
+	struct crg_transfer_trb *deq_pt;
+	u8 pcs;
+
+	char name[10];
+	u8 dci;
+	struct list_head queue;
+	const struct usb_endpoint_descriptor *desc;
+	const struct usb_ss_ep_comp_descriptor *comp_desc;
+	bool tran_ring_full;
+	bool configuring;
+	u32 generation;
+	struct crg_gadget_dev *crg_udc;
+
+	enum crg_ep_state ep_state;
+
+	bool wedge;
+};
+
+#define CRG_RING_NUM 1
+
+struct crg_udc_event {
+	struct crg_buffer_info erst;
+	struct crg_erst *p_erst;
+	struct crg_buffer_info event_ring;
+	struct crg_event_trb *evt_dq_pt;
+	/* Changed on every ring reinitialization under udc_lock. */
+	u32 generation;
+	u8 ccs;
+	struct crg_event_trb *evt_seg0_last_trb;
+};
+
+enum crg_ep0_state {
+	EP0_STATE_IDLE = 0,
+	EP0_STATE_ABORTING,
+	EP0_STATE_ERROR,
+};
+
+struct crg_gadget_dev {
+	void __iomem *mmio_virt_base;
+	struct crg_uccr __iomem *uccr;
+	struct crg_uicr __iomem *uicr[CRG_RING_NUM];
+
+	/* udc_lock device lock */
+	spinlock_t udc_lock;
+
+	struct device *dev;
+	struct clk *clk;
+	struct phy *phy;
+
+	struct usb_gadget gadget;
+	struct usb_gadget_driver *gadget_driver;
+	/* Speed selected for the currently bound gadget driver. */
+	enum usb_device_speed max_speed;
+
+	int irq;
+
+	struct usb_endpoint_descriptor ep0_desc;
+
+	struct crg_udc_ep udc_ep[CRG_NUM_EP_CX];
+	struct crg_buffer_info ep_cx;
+	struct crg_ep_cx *p_epcx;
+
+	struct crg_udc_event udc_event[CRG_RING_NUM];
+
+	struct crg_udc_request *status_req;
+	/* Protected by udc_lock, remains set during a data-stage giveback. */
+	bool status_req_callback_pending;
+	struct crg_sel_value sel_value;
+	void (*setup_fn_call_back)(struct crg_gadget_dev *a);
+
+	enum crg_setup_status setup_status;
+	/* EP0 rejects new requests while the previous control transfer is
+	 * being aborted and its completion callbacks are being given back.
+	 */
+	enum crg_ep0_state ep0_state;
+
+	u8 device_state;
+	u16 dev_addr;
+	u8 setup_tag;
+	u8 set_tm;
+
+	u32 num_enabled_eps;
+
+	bool connected;
+	bool pullup_on;
+	bool async_callbacks;
+	/*
+	 * Set while crg_udc_reset() has udc_lock dropped and is polling for
+	 * SWRST to clear. Checked by crg_udc_ep_queue() so a request queued
+	 * on another endpoint during that window is rejected instead of
+	 * being built into a ring and doorbell-rung while the controller is
+	 * still mid-reset.
+	 */
+	bool resetting;
+
+	bool u2_rwe;
+	bool feature_u1_enable;
+	bool feature_u2_enable;
+
+	bool portsc_on_reconnecting;
+	bool u12_forbidden;
+	bool u12_initiate_forbidden;
+	bool reinit_ep0_on_bus_reset;
+
+	/*
+	 * usb_gadget_udc_reset() re-enters the gadget/function drivers
+	 * synchronously. Calling it directly from the port-status IRQ path
+	 * would require dropping udc_lock mid-event-processing, opening a
+	 * window for a second port-status event to run crg_udc_reinit()
+	 * again while the first event's SET_CONFIGURATION/set_alt() work is
+	 * still landing on another thread, tearing the just-enabled
+	 * endpoints back down. Defer the notification to this work item so
+	 * the IRQ-thread's event processing never has to drop the lock.
+	 */
+	struct work_struct udc_reset_work;
+};
+
+/* Shared prototypes */
+void crg_udc_build_ep0_status(struct crg_udc_ep *udc_ep_ptr, bool default_value,
+			      u32 status, struct crg_udc_request *udc_req_ptr,
+			      u8 set_addr, u8 stall);
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
+int crg_udc_abort_ep0_for_setup(struct crg_gadget_dev *crg_udc);
+int crg_udc_enable_setup(struct crg_gadget_dev *crg_udc);
+void crg_udc_ep0_req_complete(struct crg_udc_ep *udc_ep_ptr,
+			      unsigned long *flags);
+int crg_udc_prepare_for_setup(struct crg_gadget_dev *crg_udc);
+int crg_udc_set_ep0_halt(struct crg_gadget_dev *crg_udc);
+int crg_udc_update_ep0_maxpacketsize(struct crg_gadget_dev *crg_udc);
+void crg_udc_handle_setup_pkt(struct crg_gadget_dev *crg_udc,
+			      struct usb_ctrlrequest *setup_pkt, u8 setup_tag,
+			      unsigned long *flags);
+int crg_udc_init_ep0(struct crg_gadget_dev *crg_udc);
+int crg_udc_queue_ctrl(struct crg_udc_ep *udc_ep_ptr,
+		       struct crg_udc_request *udc_req_ptr,
+		       u32 num_of_trbs_needed);
+void crg_udc_advance_dequeue_pt(struct crg_udc_ep *udc_ep);
+unsigned int crg_udc_count_trbs_linear(dma_addr_t addr, u64 len);
+unsigned int crg_udc_count_trbs_sg(struct crg_udc_request *udc_req);
+int crg_udc_init_event_ring(struct crg_gadget_dev *crg_udc, int index);
+bool crg_udc_is_event_rings_empty(struct crg_gadget_dev *crg_udc);
+bool crg_udc_is_pointer_less_than(struct crg_transfer_trb *a,
+				  struct crg_transfer_trb *b,
+				  struct crg_udc_ep *udc_ep);
+int crg_udc_process_event_ring(struct crg_gadget_dev *crg_udc, int index,
+			       unsigned long *flags);
+/* This function will go through the list of the USB requests for the
+ * given endpoint and schedule any unscheduled trb's to the xfer ring
+ */
+int crg_udc_queue_pending_trbs(struct crg_udc_ep *udc_ep_ptr);
+/* num_trbs here is the size of the ring. */
+u32 crg_udc_room_on_ring(struct crg_gadget_dev *crg_udc, u32 num_trbs,
+			 struct crg_transfer_trb *p_ring,
+			 struct crg_transfer_trb *enq_pt,
+			 struct crg_transfer_trb *dq_pt);
+void crg_udc_setup_datastage_trb(struct crg_transfer_trb *p_trb, dma_addr_t dma,
+				 u8 pcs, u32 transfer_length, u32 td_size,
+				 bool ioc, bool chain, bool azp, u8 dir, u8 setup_tag);
+void crg_udc_setup_link_trb(struct crg_transfer_trb *link_trb, bool toggle,
+			    dma_addr_t next_trb);
+void crg_udc_setup_status_trb(struct crg_gadget_dev *crg_udc,
+			      struct crg_transfer_trb *p_trb,
+			      struct usb_request *usb_req, u8 pcs, u8 set_addr,
+			      u8 stall);
+void crg_udc_setup_trb(struct crg_transfer_trb *p_trb, u32 xfer_len,
+		       dma_addr_t xfer_buf_addr, u8 td_size, u8 pcs,
+		       u8 trb_type, bool short_pkt, bool chain_bit,
+		       bool intr_on_compl, bool b_setup_stage, u8 usb_dir,
+		       bool b_isoc, u16 frame_id, bool sia, bool azp);
+void crg_udc_squeeze_xfer_ring(struct crg_udc_ep *udc_ep_ptr,
+			       struct crg_udc_request *udc_req_ptr);
+struct crg_transfer_trb *crg_udc_tran_trb_dma_to_virt(struct crg_udc_ep *udc_ep,
+						    dma_addr_t address);
+dma_addr_t crg_udc_tran_trb_virt_to_dma(struct crg_udc_ep *udc_ep,
+					struct crg_transfer_trb *trb);
+void crg_udc_update_dequeue_pt(struct crg_event_trb *event,
+			       struct crg_udc_ep *udc_ep);
+u32 crg_udc_trb_chunk_len(dma_addr_t dma, u64 remaining);
+u32 crg_udc_actual_before(struct crg_udc_ep *udc_ep,
+			  struct crg_udc_request *udc_req,
+			  struct crg_transfer_trb *pause);
+/*
+ * command related ops
+ */
+int crg_udc_issue_command(struct crg_gadget_dev *crg_udc,
+			  enum crg_cmd_type type, u32 param0, u32 param1);
+void crg_udc_free_resources(struct crg_gadget_dev *crg_udc);
+int crg_udc_program_speed(struct crg_gadget_dev *crg_udc);
+int crg_udc_reset_data_struct(struct crg_gadget_dev *crg_udc);
+int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags);
+struct usb_request *crg_udc_alloc_request(struct usb_ep *_ep, gfp_t gfp_flags);
+int crg_udc_build_td(struct crg_udc_ep *udc_ep_ptr,
+		     struct crg_udc_request *udc_req_ptr);
+void crg_udc_clear_portpm(struct crg_gadget_dev *crg_udc);
+void crg_udc_ep_nuke(struct crg_udc_ep *udc_ep, int status);
+void crg_udc_free_request(struct usb_ep *_ep, struct usb_request *_req);
+void crg_udc_set_pullup(struct crg_gadget_dev *crg_udc, bool is_on);
+void crg_udc_reset_work(struct work_struct *work);
+void crg_udc_set_vbus_detect(struct crg_gadget_dev *crg_udc, bool enable);
+/*
+ * Undo whatever crg_udc_ep_queue() mapped for this request: the merged
+ * SG list, the single buffer, or neither if the request carried a
+ * pre-mapped DMA address.
+ */
+void crg_udc_unmap_request(struct crg_udc_ep *udc_ep,
+			   struct crg_udc_request *udc_req);
+int crg_udc_handle_port_status(struct crg_gadget_dev *crg_udc,
+			       unsigned long *flags);
+int crg_udc_handle_xfer_event(struct crg_gadget_dev *crg_udc,
+			      struct crg_event_trb *event, unsigned long *flags);
+int crg_udc_handle_event(struct crg_gadget_dev *crg_udc,
+			 struct crg_event_trb *event, unsigned long *flags);
+/*
+ * Invoke the bound gadget driver's ->disconnect() callback, if any.
+ *
+ * The gadget disconnect callback may be called in interrupt context.
+ * Release only udc_lock while keeping local IRQs disabled.
+ */
+void crg_udc_notify_disconnect(struct crg_gadget_dev *crg_udc,
+			       unsigned long *flags);
+int crg_udc_ep_halt(struct crg_udc_ep *udc_ep_ptr, int halt, int ignore_wedge,
+		    unsigned long *flags);
+enum crg_ep_state crg_udc_get_ep_state(struct crg_gadget_dev *crg_udc, int dci);
+u32 crg_udc_index2dci(u16 index);
+int crg_udc_init_device_context(struct crg_gadget_dev *crg_udc);
+void crg_udc_init_ep_info(struct crg_gadget_dev *crg_udc);
+void crg_udc_knock_doorbell(struct crg_gadget_dev *crg_udc, int dci);
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
+		      struct crg_udc_request *udc_req, int status);
+void crg_udc_clear_req_container(struct crg_udc_request *udc_req_ptr);
+
+#define CRG_QUIRK_DIS_U1U2_ENTRY BIT(0)
+#define CRG_QUIRK_DIS_U1U2_INITIATION BIT(1)
+#define CRG_QUIRK_REINIT_EP0_ON_RESET BIT(2)
+
+#define CRG_UDC_QUIRKS_DEFAULT                                      \
+	(CRG_QUIRK_DIS_U1U2_ENTRY | CRG_QUIRK_DIS_U1U2_INITIATION | \
+	 CRG_QUIRK_REINIT_EP0_ON_RESET)
+
+struct crg_udc_priv {
+	u32 quirks;
+};
+
+extern const struct usb_gadget_ops crg_gadget_ops;
+extern const struct usb_ep_ops crg_udc_ep_ops;
+#define gadget_to_udc(g) (container_of(g, struct crg_gadget_dev, gadget))
+
+#endif /* CRG_UDC_H */

-- 
2.34.1

