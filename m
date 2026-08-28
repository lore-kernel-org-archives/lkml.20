Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54783C10BD;
	Fri, 28 Aug 2026 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911649; cv=fail; b=IHFLPI2ryQA+Zx3oH5q/wiCc6B7/v7y9m7Yw2brh73gROslN3fftcCde3R1IFn6eT4WAj6Z2FcCtlk4jBPaD/I97GKnkZHpyxU0vbasvCX+UQrzfQhNXgrhPnRubD+i2Z/GAhUc+6NCNMTvQ7c+gVaupGSS8zCqlb6Do5nhzpbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911649; c=relaxed/simple;
	bh=AW7orbB63pD6bURp6FKIV4wlUfCaWoMnqGBnCRwQPUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7/5GoLVo4XiImWe5Ugomalpiu+i3Daic0ddWFzZuDdCrOwNFgZF7MTtQWgOcRB/tEZbnI8/Mnmmaz0mfPRFPS8mJsnD81AQOg6PplG/bXWDitYhcWwLKjI89jrvqxJLevUQrUS1AM7UXQsdxFfUNPMQdPy7Gl4r6u101PQrW0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=dcCbVFJs; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vQYSMOCn; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="dcCbVFJs";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vQYSMOCn"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67SA5XLb1234437;
	Fri, 28 Aug 2026 05:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KC4wOko1FRKWRESaqJQ4n62GNvGEr61Y9me+Q8cWj
	q4=; b=dcCbVFJslANR1VQxgr/WHTCkRb3DrbowkD0gL3fLOskWjfZGK6DrqqwGc
	5EfYgZnadrWs3ml8t/MVLSoN0hRiu067A5fSHlrqO6UXwV2h6x7wDVZSHz0pBpin
	kZldv4C0YjoKCV6NRJF9VoPbOfZFrnIpM10D8MHpzGT2WUftJxA6RwVHXxultwx/
	3eNPsfEwFC15BXgislaf4RLvl4mucCK5+9i30Eow6WkWaFCUzynfIkAFzg+OW2i8
	1bmyaD3eZ4Yth40VXDYKC8Sq8Y33yZcROb0MNhkCJAf4gJZ5kzGVLOgUEajhgUpH
	yGtMLDgHou+qEoCZ/g8tfF8krG68w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gb5kdgv8q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 05:07:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PW8231t2x9CwwxnRbR8P4jPfxePoN9otHH2nuIARxI5duZ1D8YtOjOn043XmMY60llS3QqNv9xVUNamkAyIQYDbJOLnq6NEsD0zagWnpfcngWZOTP4rKdSfwcJfVW3N14fF4JVH160UklrHd0OpOQef0Jpcq6PtdV6V1QXjhQ4wY5VFNkOBQvvkouZCUtEpV1X0216lFWl1V1ZpxCqe7PZPalT4OLWsfr3yUBzum0XJ35/nabcCzVvPBwG9zy7MnAdQRDNIHqt0746r3+yfT85yRAcAPwNu3AyCDuaA/bm7fVUvRFqAcyPN0RZ4WPj0IkkeqmS0chGtENpdehaqCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KC4wOko1FRKWRESaqJQ4n62GNvGEr61Y9me+Q8cWjq4=;
 b=gITvHiyuXqu2tevdOB17YhUS+n4NPrFaXcDOXEuMZXAjq4UOeOMYA1VpMmn4jUraTXmFE43hEG4H+SOTtQ3v7F3D9cmgizyYeGdyEBrIDiYmIaOnKoRM/KDtbOwAsn4l4ThBQp6aBlfAWZ09RfTbLmprHYljrpm/1SyZwBDQRaPrY0ssgduAID8j1OrsVDZxm64Td6OGSJf/c5f4WA/6v8yp0Hs+Zm7jtmmkwCSrWvcoSNCwNuQjvlWrsvuqbFE9NkghdsIbijQlu2eElicPMfilVI2nLCCMdzCw1iY3USJfdHW06tNCOx0iWJ7uhOBeBR6jXN27OJzwSHrFgzf3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC4wOko1FRKWRESaqJQ4n62GNvGEr61Y9me+Q8cWjq4=;
 b=vQYSMOCn1b2KjAGb9i3RT6czfkCTcEnljTLFf8xgilwQesk0xgH+8Sa7q5VgKGUlgocOTkMrofOcRG9e1K0Dw9qfWzZDdyPqGqZ7JRooyHveWF1cLZFUtm60ribaq7C6Qpas01n1g7jNyuCXfcmHRuFdSykr1ua5vjM6oshwhB8=
Received: from PH0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::35)
 by IA1PR10MB7141.namprd10.prod.outlook.com (2603:10b6:208:3fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 10:07:19 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:510:d3:cafe::5d) by PH0P220CA0012.outlook.office365.com
 (2603:10b6:510:d3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 10:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 10:07:17 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 05:06:39 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 05:06:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 05:06:39 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SA6SpY2604176;
	Fri, 28 Aug 2026 05:06:37 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <peda@lysator.liu.se>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <r-sharma3@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 1/2] dt-bindings: mux-controller: ti: add binding for event mux router
Date: Fri, 28 Aug 2026 15:36:14 +0530
Message-ID: <20260828100615.1700223-2-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260828100615.1700223-1-r-sharma3@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|IA1PR10MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 224c2ced-f493-47b6-2e54-08df04ec2405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	p/FBZDFTkK9SbNNyJfoOgRr5f5tum9z6AZobEpG+FhLaFkTTU3mF2uCcQbQYW8cu+M/glf6Z6gb3mbpLXZjdZccgxqYvo0lLkWMIzXOvybXaDlZXx5H4dPu0wo1/gUDgfxr2opSdrvRIL7p67AwcR6bxSWVYPfMZlXgO6LJglHfdXfod+KRcCTL1brZw5biQbggS7Gt1oxwC3RgreOK41Qukv5mViVUDAjL5GDpK1v95D2ACkcIdw0Vsmils+gBd40dHbmcQL3nmsKERwrgTwDlkwky0wqHQR0nM9dvNI41VBCj8zs6hRI84QB4FYiW5znh6j3eBnXTPWoRtImEA8szyB5bFTcLXR5befzpWoIKJbsinds70QladIFmVMfnv9rnC0n6oMO/ekDDzAghMPD0bHaG8q+eb7K01AQF3Xex+qVbbk81X2sIRDInszEvU4tNbtSGLSrrTFHfqcEe1cVGfmYCFxDORYTVW6PG2E9yzEWsp+pvCasR9IWXlD2whg3L+CqRHXUDhFll84IrxnvfAQNSaAlVQALiP5DHx335f9YOEXd3OdgwH7BMjNfGJ9XCFgkfcTrnR+W5YXUdtCcZ1qpXm856Xd8Pzx4DruudIhuIAWQhMn2xS+1a9/rsiRqEVNL8P6v5ZwAMl3oWEyA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d2Xy+ldz2+49KPJ8NNkunl22nKTIaN9CY6OM4BgOntsZQVl5htlTWXrY3b7X5LwVdgF1Y9Sp/HFe0HwjSfIoX6/m62bjPbIg2nWXPq/roPN0BZjnVAEq01ozq6A4N0p+EMkCJFWstTsPkugW8wHheQmflFSWE1eXu6Vp1w3xxvD3qCftFxSLnd6ElCFuQAfgyVon92pYlkIlOi9E6fcpopHr5H2YmzL/zHN2w3bZ5fdCnu1HBsbzyGR/fw9O7B2BpH4PjRy6RnQzSJVlw6prML5QxALBi+9J5Rh+yrWPWatCnX3lQGGOGPDpbo2FPrS3AujajaEWcXvr0jt5h23A5ErqN/V8T2Z0iM7c3PliK+0rP8vbjkgeyi22YQvV/oED1gagcjHw5VgkWH3AcLI+PlRCt9ntnkLFnZ030VbhjJsin3lh9K7zPJbhZug/2veG
X-Exchange-RoutingPolicyChecked:
	vt5ITgoNWMzmfaXHaI8QygVv0QDiE91Oev9iHS0CxgUdsDfPV2os5xC3WsL+UFJ6XVAImWEall5I5L8USRvd9uTOX5jdvTp1wR0An0nZ1Wp+LHV1p22WGmYw51m84j6/ydFR4sGSSrTrmaR0rKnNmu1792cSoEyl3yCSfL1Lz1Gnsxt/V22BjCKoZ0TFvk1+yA4TcKy80auyULFqKx8nN/HuneuhMNSGtofXVXiUHnm3tik4Z4l3wFWXDpCNByvg9VMxJteo4tZUB8JRQ0GhVkruBpeQHg5rfY7t6xPEhX+cupY8Tb26BqIJMR4DtdJFJlefl2dSOgyVWlQ8df4vOw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:07:17.2342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 224c2ced-f493-47b6-2e54-08df04ec2405
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7141
X-Proofpoint-ORIG-GUID: P81ktINcZBp3P7YgrmsycTNtuhZqiEw5
X-Proofpoint-GUID: P81ktINcZBp3P7YgrmsycTNtuhZqiEw5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX6T50E+BmGDpI
 zNl364i/SlJmOBh3vpKim7iUo/sszg2lZcw2LlV+kNY4V7BOqAJ8fAL6Gx/aA+yPkegwWXVjOYE
 pXsEbBpRODFeECJV287d0z85HxpbncQ=
X-Authority-Analysis: v=2.4 cv=UPPt2ify c=1 sm=1 tr=0 ts=6a915dda cx=c_pps
 a=S2IqtmjrQAXuShkhhqPLog==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=gEfo2CItAAAA:8
 a=3W-q-mIBmBcix3eDAfQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX43bCzgpawclX
 zNcCYth2d/rTYdoH1F++/3SpKStiGQc6F26GoMxvadMXq0PeF9C9Uv2a5unB27y8ysmRJKyHxC7
 D22fXRxOLDifEs/dhkuCUNNTZFkPwaw4VT5H1J9thPwa19ihm3TH0etASYG1iF0pkdsdgG25TvQ
 a3h62HJkrljs1PySRvvtnUyHDkTNxJHLcr7J9CQMBeKQGsgGzgsisd5gdLPPRl38dZ9ULS0QuYB
 7z3OImllVYMIqDW20U+CwI1wNAUGywSq88K0zJo0p1gSx45KTuLqbLy0edWxVHsDBMzBtPtU+/a
 06DRAsOhk5xiN7RFT0yOEAbg3g8MQNbK2nhOZcaGciOzchWIn4oAq1YsWNYejK9zcLH8aNTouwC
 GzgNJjZv/v2bXYiucuOOmyPkONPA4uXsVFJ0K16vBm/m2tXb28y2bid/qOvt3A2N0DlacB8SzfW
 UIC3nn0DCg3TGuTqLMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1011 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280086

Add binding for the event mux router of TI's K3 based SoC AM62L.

The TI K3 mux routers which route the GPIO input events or Time-Sync
events b/w peripherals instead of routing to a CPU.

Refer Section 10.2 and 10.2.1 of https://www.ti.com/lit/pdf/sprujb4

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 .../mux/ti,am62l-event-mux-router.yaml        | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml

diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
new file mode 100644
index 000000000000..a5ba7f78a156
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mux/ti,am62l-event-mux-router.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Event Multiplexer on K3 SoCs
+
+maintainers:
+  - Rahul Sharma <r-sharma3@ti.com>
+
+description:
+  The TI K3 mux routers routes the GPIO input events or Time
+  Sync events between peripherals instead of routing to a CPU.
+
+allOf:
+  - $ref: mux-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-event-mux-router
+
+  reg:
+    description: Register base address and size.
+    maxItems: 1
+
+  '#mux-control-cells':
+    const: 1
+    description:
+      Number of cells in a mux control specifier. This should be 1.
+      The cell specifies which mux control to use (0-based index).
+
+  ti,reg-mask-val:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Register offset (relative to reg base)
+        - description: Bit mask for the mux control bits
+        - description: Value to write when mux is active (state 1)
+    minItems: 1
+    description: |
+      Array of triplets specifying register offset, mask, and value for each
+      mux control. Each triplet contains:
+      - register offset (relative to reg base)
+      - bit mask for the mux control bits
+      - value to write when mux is active (state 1)
+
+  idle-states:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Idle state for each mux control. Each entry corresponds to a mux control:
+      - 0: clear masked bits when idle, also refers to inactive state
+      - 1: set configured value when idle, also refers to active state
+      - MUX_IDLE_AS_IS (-1): keep current state when idle
+
+required:
+  - compatible
+  - reg
+  - '#mux-control-cells'
+  - ti,reg-mask-val
+  - idle-states
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/mux/mux.h>
+
+    // Example 1: TI AM62L GPIO Mux Router
+    mux-controller@a00000 {
+        compatible = "ti,am62l-event-mux-router";
+        reg = <0xa00000 0x400>;
+        #mux-control-cells = <1>;
+
+        /* Mux Register addresses: 0xa00004 + (J × 4) */
+        /* GPIO0_40 -> BCDMA trigger 15 */
+        ti,reg-mask-val = <0x40 0x000ff 0x00028>;
+        idle-states = <0>;
+    };
-- 
2.34.1

