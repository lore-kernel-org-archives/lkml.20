Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9524E4078FF;
	Fri, 28 Aug 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911623; cv=fail; b=BhpRDc3jVHY6iEK7pC0d3LOPHMTaiYYXZDIdIS7LaBLonRGd6EuF4NiWMk8ANillNgafpFxIQsDA5dQ3qzRv1js+Nkd8pG00b/GjGu0/tuokoZGB9MAEPrcXAIhPjMVU0rYbdQ7Lu7zGA+i+bGhTi6q71/dM93DgVgzJBJWZ+dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911623; c=relaxed/simple;
	bh=axItqwb8s3NFt1dIddlJd8BkMnYyyT+uSrjNy7nAbcs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W9G4KsGSxbK3t9EYBAGXjsBFqSV9SCkFKqGyjxvgnvu/48gU25GmXouan/2Ilww8HpnKMIxJTF/fEMG4K82n7ZKTGQ08Nf++97RjJb1tCUSD49aEL2ApfPvhtfJD1fwsaEfu2/Tiv35XmozKnDkIJ2OWKScwvDS97Apd/Lz5d7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=a9EIwAFV; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P6K64zU9; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="a9EIwAFV";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P6K64zU9"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA60SI1042758;
	Fri, 28 Aug 2026 05:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Xz8RFYqy3GJQrjVAmnfrRH4eRv47oE4NtAxKJ3RJ4
	FI=; b=a9EIwAFV0fRPYQm0oQf4/PqWuPNECy911To7U1Rblh4YLsNNeTCSdohaM
	vc7TdRRKsthsdUpnMgMum4z1kx5NbVhKozdppUN8ZUWZ4Cq5RvgnXQPcGVeSxDiA
	1X/66t8Rrzcov3vnLwq39Swt9rZmfSsBhG3ooDOmXMyC4SRxXBeiif7aEPDU3Hxe
	XfbCRnhU5gtJwm5vYJvfadfNUUvfi3ADGRsQKnxGhm+KOLnk5Pxh9t0UnzyWFp8H
	zKPy7kpgPpbs0I7D2eh2MQxV3e0BLPCDJS7j7B/U1whi8qk9kYX1MZG/pryb+bUV
	jSLfVKdXQJwhZCV8nF5rtiCW+FbEA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24r1wmf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 05:06:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgLaEOrs6nXAlZLzKla8A6yjNjygy1Zvjhec+a+Zs5vp8C1xcajXHjtQgD+byrXkgdWN3h7BVD5QR8dErqjzk7gNQ2TQzA1ZugY1uo6WXx47MdFDoeT24W+gOG5s98rxEyYhXLpJoA5MgxqVgIgbTz7JNxB8Vbg+T1ezlBWZSdbO7v3ylRnqgM1K5w5K/31fkEzIC2frA4+aCze07upR+DLh46VFPzAiC+0/ehdXeNAigVe++abcHV/RjRhuKh4bZFS4obUOMCzUJ2vY1Ew56NHPIgX3Tl7G5mkfxfhgQc5Sy67Cn0708v2bpQ54mAtX0v3//BKi5dLMdVvUDVDutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz8RFYqy3GJQrjVAmnfrRH4eRv47oE4NtAxKJ3RJ4FI=;
 b=vHZFYFag6N81jZh2wa9RIbRnB9s3qx5bOZI1IFCPHvpKlFvdX6cIQSRO3RHiuhY6umTwQjsYJrb+HUl9CVCdwhcHgigENqJTP0qYHZOwQFiV8cyw4nzqp2Wk+Te/HOqPbYVMUXNatzPSpdB+jw/vvJNCzFVZpjPXtF3yHgN/iJmHrt1UTIas/W+imMzO5ssZGjxKfRb+FMBXrjE7RPAtCvp8OQQ72rxA3bwhcS76eMcQR4s/6Xx+n4krXQnjSTFgur/F18+UWsqMu+bnn5goy7fajs3/PzZmAIdRUzy3BM2ANSjoDMOhDpKwtDkoGIB1UdMQoeW/yZ8kSKFiomRslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz8RFYqy3GJQrjVAmnfrRH4eRv47oE4NtAxKJ3RJ4FI=;
 b=P6K64zU9FUTWrEewEN6LyFeS066cxV5RTrQcNDdLHLH1owEUnOeIkiO/evC61Z+Vj3T+pVAZtme081XFS6ZpvFUkOSBwowC5Q5ALS/pp7YxWbBKVAHaGv/Yr/oYU5klivz/sl0alNZiTIg5lVAfbEe74nXo1DAldYEXWsRtMnA4=
Received: from PH7P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::27)
 by SJ5PPFD1D499C15.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 10:06:42 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::3e) by PH7P221CA0021.outlook.office365.com
 (2603:10b6:510:32a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 10:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 10:06:42 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 05:06:42 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 05:06:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 05:06:42 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SA6SpZ2604176;
	Fri, 28 Aug 2026 05:06:40 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <peda@lysator.liu.se>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <r-sharma3@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 2/2] mux-controller: ti: add driver for event mux router
Date: Fri, 28 Aug 2026 15:36:15 +0530
Message-ID: <20260828100615.1700223-3-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260828100615.1700223-1-r-sharma3@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|SJ5PPFD1D499C15:EE_
X-MS-Office365-Filtering-Correlation-Id: e1adc510-bdc7-4205-c807-08df04ec0f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|13003099007|6133799003|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SfpTEWz73+PxQwHGwIhY+iy6wD9BpOrvrUeU1H2jK3QZxyZdx6jvhNT9OYYD4alhGIGGSOkHX9xTx+a4OyNHuOAB/h/7GH9kRCdq8Lsm6IT0qH8qqPBD/NWv9mXE7FAdtYc9wy/zi83Wj0sFUySib2pH+lRB9EVGfQNDgZtYZ49snH62jovTwFYrVBMjnV/RjrpLU0JWYNlE4u9XV2d870OkqlqCjouyUx+ItA1T/TU9Pgu+/x2g+RDJAs+bNpAMk+1GyGamcXdxIW5HGsyOj6ONgooKKREnswq8BREj0yQgLAp8l5R+XYOdHyzBMyRr+yhSuPUbykan76pSC4ilCT7ImRygWiRvStJy9p+7kP54k61TIh2jEgetgIy71kMyiHglB5H/VUFVB3oID4YlYQMprQfEm4GeNuKVCVor68qOmWliNUdnaXpqAFgUQOup9yIP0VMmOtEwRUc4NfnSDjagsCSRT/SXhf8DOr2xzWsjIq/S39FdFZA2Sj7VxkVrBVZSxt6J7SLIzuQ6Rd2IH/74bFPxyuv9lgwhWHinZIaIRpb3FSYesQvDOLiFWn14tQwOw2aiS2ZaNHsCaN5sgbHL2NWeDRZ+uvmzYbx1XuPcOfTm4g5SWlsivCU20vdyw7nBAHiO4H0+wQ0+tYwAgA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a+BZhhw3ouFFyiQDHb29GA4+DEjx/1rTrlxDyI2re1bBUrKKDdQL1EOAxWBjGfnV7sHjCaQ+SmrSXqOTYLf/3/KDZtz1B1CZc36mEHPkTmxcRviD5gek/7raxFutqhGT+Ogs9BNi6uQk8cKjJo+sEyG+hhFbUyEg9csLvONkI+NmBniCqbpqGblGzaln/LIjSMEXoPEF99oe9k20GyoTIo7Avl/RFQsHRljDshwrwcUJLode58W3ToB0tHJW3Nux9dtDpNsyHOXcLP9bL9KtmlYj5RAp4RUfl0BXrF1Ad8n+h/Dx7qsWPkd4JI+/YdQ0o9KMtK/v6wSVpHlRFBl2TmS6bFu5XDaxa8/ZSVZNmO0cYkreL1AnxKIzNWoQcwJIvM8wFjcBsU2pLGEJ2vQ+OTLIJU6Lt5szOtNWJTNh6BCAeeBIHgI9cKqjtmPypEBV
X-Exchange-RoutingPolicyChecked:
	QtwRPwW4fa+gAMsknYdYmdiSxtevX38Hpr2iH38sJqMh/sDDLpZZ3InVZNne3g5GFQsiPfHtpteaondrRUusp6/mHMibiSX4uFaTAmQWe1nIyoBYUjl/5p4X8CFPcImAoFTCWqN0P6lxPJgfEhq9L2jiujnw4Sc0szFnOgGXs4gzpLgEof5IPJSkQajVBVvtxooV7WnQTv0ZXS9hhxarkW8pXQpaD9i1ejwXx2GZdc652n0Xijf0e8as3cgRi+quVJCpdsoJR6LJWHCj0OUmoaZRMGbExsDMe+qdlZa8/+L4r5Z+K/iSwXrS5WykI63X3x/15RevE29CYdw1pnsL4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:06:42.5970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1adc510-bdc7-4205-c807-08df04ec0f60
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD1D499C15
X-Proofpoint-GUID: CsavCWhOoUM64reYZGu0l0ao06LZnZwn
X-Proofpoint-ORIG-GUID: CsavCWhOoUM64reYZGu0l0ao06LZnZwn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX8ZCp2cGRStRo
 jTe2xqQJ+rKP/dUhi8IvvGyNRw1JQoIbCOCcdsuMP1RvOZWTwRCEYsyv0CSkvxdoVKDhSEenBP6
 lyox3OLvtjt+LjRebNE9G4KqZrwhwdcSFFxO+bEvM5Xh2iUohl84u+pZ+i7+3rUmF5gviiK7zLs
 Yu+m7hf0WSyR429BA3vI/lplLx9QQ+BLQk9vCaEniyo1wJiL9+U5v5ZpK+M/PUceFuT4tGJzYHh
 YhKkhEOjrmprBhIs7NQcx+lwdinLm0xG37DXANRo5QqTQXtfMpSXIG2N4jUJnxIj4VLsYIwKjL8
 tKvde2HYSqLncVdOP2RWo33SJ+YCvgJCm1gJqvhCJG9Sbb0uJ8cJKwBrQBzEFskau0uER5q03q6
 gedi2vuu0sG/lrLAG9NrikBazl/BTkdM28FVVT7Z/Z1ykSXTEI+x1FL1zxe9ktM9JPz/ZOjKQTS
 2ciVGpmjmxAsKdtHr3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX8NEmRDMpXsGp
 +s+mK28x8HYfGLLiq7cSBz28OSg6va56EV8aW1qktWQ2U4p6vGVhtqHfUCcd0A/EdRBq2AASWrn
 Y+rnmj9UBBghwbnCErUa3Z5r425X8fU=
X-Authority-Analysis: v=2.4 cv=L6gtheT8 c=1 sm=1 tr=0 ts=6a915db8 cx=c_pps
 a=hhtN0wN0XYjGptQO8Yv39Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=0B8mVSteLYWHSwKlH5EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280086

The driver supports event muxing routers like gpio mux router and timesync
router. This driver is adaptation of original reg-mux driver, along with
changes specific to support TI's mux router.

The idle states this driver supports are only 2 which active(represented
by 1 in dt-node) and in-active(represented by 0 in dt-node).

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 drivers/mux/Kconfig           |  15 +++
 drivers/mux/Makefile          |   2 +
 drivers/mux/ti-k3-event-mux.c | 235 ++++++++++++++++++++++++++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 drivers/mux/ti-k3-event-mux.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index eb34457beaab..58739a01f0d5 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -83,6 +83,21 @@ config MUX_RZV2H_VBENCTL
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-rzv2h-vbenctl.
 
+config MUX_TI_K3_EVENT_ROUTER
+	tristate "TI Event Mux Router using MMIO registers"
+	depends on OF && (REGMAP_MMIO || COMPILE_TEST)
+	help
+	  This is extension of MMIO mux for  timesync router and gpiomux
+	  routers on TI K3 SoCs. This driver supports the 3-field format for
+	  mux control: <register-offset mask value>.
+
+	  The driver allows configuration of hardware mux routers using
+	  memory-mapped registers. It's based on the mmio-mux driver but
+	  supports the extended 3-field format for more precise control.
+
+	  To compile the driver as a module, choose M here: the module will
+	  be called mux-ti-k3-event.
+
 endmenu
 
 endif # MULTIPLEXER
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 0854c04613b9..114abf88b75e 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -9,6 +9,7 @@ mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
 mux-rzv2h-vbenctl-objs		:= rzv2h-vbenctl.o
+mux-ti-k3-event-objs		:= ti-k3-event-mux.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
@@ -16,3 +17,4 @@ obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
 obj-$(CONFIG_MUX_RZV2H_VBENCTL)	+= mux-rzv2h-vbenctl.o
+obj-$(CONFIG_MUX_TI_K3_EVENT_ROUTER)	+= mux-ti-k3-event.o
diff --git a/drivers/mux/ti-k3-event-mux.c b/drivers/mux/ti-k3-event-mux.c
new file mode 100644
index 000000000000..2469500d1b48
--- /dev/null
+++ b/drivers/mux/ti-k3-event-mux.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MMIO register bit-field controlled multiplexer driver
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com
+ *
+ * Based on drivers/mux/mmio.c by Philipp Zabel <kernel@pengutronix.de>
+ * Modified to support 3-field format: reg-offset, mask & value
+ *
+ * Author: Rahul Sharma <r-sharma3@ti.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MUX_ENABLE_INTR BIT(16)
+
+struct mux_ti_k3_event {
+	struct regmap *regmap;
+	u32 reg;
+	u32 mask;
+	u32 value;
+};
+
+struct mux_ti_k3_event_chip {
+	struct mux_chip *mux_chip;
+	struct mux_ti_k3_event *fields;
+	int num_fields;
+	u32 *saved_states;
+};
+
+static int mux_ti_k3_event_suspend(struct device *dev)
+{
+	struct mux_ti_k3_event_chip *chip = dev_get_drvdata(dev);
+	int i, ret;
+
+	if (!chip->saved_states) {
+		chip->saved_states = devm_kcalloc(dev, chip->num_fields,
+						  sizeof(u32), GFP_KERNEL);
+		if (!chip->saved_states)
+			return -ENOMEM;
+	}
+
+	for (i = 0; i < chip->num_fields; i++) {
+		struct mux_ti_k3_event *field = &chip->fields[i];
+
+		ret = regmap_read(field->regmap, field->reg,
+				  &chip->saved_states[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mux_ti_k3_event_resume(struct device *dev)
+{
+	struct mux_ti_k3_event_chip *chip = dev_get_drvdata(dev);
+	int i, ret;
+
+	if (!chip->saved_states)
+		return 0;
+
+	for (i = 0; i < chip->num_fields; i++) {
+		struct mux_ti_k3_event *field = &chip->fields[i];
+
+		ret = regmap_write(field->regmap, field->reg,
+				   chip->saved_states[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mux_ti_k3_event_pm_ops,
+				mux_ti_k3_event_suspend,
+				mux_ti_k3_event_resume);
+
+/*
+ * State behavior:
+ * - state 0: Clears the mask bits in the target register (inactive state)
+ * - state 1: Sets both the value bits and enable bit (bit 16) in the register
+ */
+static int mux_ti_k3_event_set(struct mux_control *mux, int state)
+{
+	struct mux_ti_k3_event *fields = mux_chip_priv(mux->chip);
+	struct mux_ti_k3_event *field = &fields[mux_control_get_index(mux)];
+
+	if (!state)
+		return regmap_update_bits(field->regmap, field->reg, field->mask, 0);
+
+	return regmap_update_bits(field->regmap, field->reg, field->mask | MUX_ENABLE_INTR,
+		field->value | MUX_ENABLE_INTR);
+}
+
+static const struct mux_control_ops mux_ti_k3_event_ops = {
+	.set = mux_ti_k3_event_set,
+};
+
+static const struct regmap_config mux_ti_k3_event_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int mux_ti_k3_event_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct mux_ti_k3_event_chip *chip;
+	struct mux_ti_k3_event *fields;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	void __iomem *base;
+	int num_fields;
+	int ret;
+	int i;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to get base address\n");
+	} else {
+		regmap = devm_regmap_init_mmio(dev, base, &mux_ti_k3_event_regmap_cfg);
+	}
+	if (IS_ERR(regmap)) {
+		iounmap(base);
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get regmap\n");
+	}
+
+	ret = of_property_count_u32_elems(np, "ti,reg-mask-val");
+	if (!ret || ret % 3) {
+		ret = -EINVAL;
+		dev_err(dev, "ti,reg-mask-val property missing or invalid: %d\n",
+			ret);
+		return ret;
+	}
+
+	num_fields = ret / 3;
+	mux_chip = devm_mux_chip_alloc(dev, num_fields, num_fields *
+				       sizeof(*fields));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	fields = mux_chip_priv(mux_chip);
+	chip->mux_chip = mux_chip;
+	chip->fields = fields;
+	chip->num_fields = num_fields;
+
+	platform_set_drvdata(pdev, chip);
+
+	for (i = 0; i < num_fields; i++) {
+		struct mux_control *mux = &mux_chip->mux[i];
+		s32 idle_state = MUX_IDLE_AS_IS;
+		u32 reg, mask, value;
+
+		ret = of_property_read_u32_index(np, "ti,reg-mask-val",
+						 3 * i, &reg);
+		if (!ret)
+			ret = of_property_read_u32_index(np, "ti,reg-mask-val",
+							 3 * i + 1, &mask);
+		if (!ret)
+			ret = of_property_read_u32_index(np, "ti,reg-mask-val",
+							 3 * i + 2, &value);
+		if (ret < 0) {
+			dev_err(dev, "field %d: failed to read ti,reg-mask-val property: %d\n",
+				i, ret);
+			return ret;
+		}
+
+		/* Validate that value bits are within mask */
+		if (value & ~mask) {
+			dev_err(dev, "field %d: value 0x%x has bits outside mask 0x%x\n",
+				i, value, mask);
+			return -EINVAL;
+		}
+
+		fields[i].regmap = regmap;
+		fields[i].reg = reg;
+		fields[i].mask = mask;
+		fields[i].value = value;
+
+		/* This driver supports binary mux (2 states: 0 and active) */
+		mux->states = 2;
+
+		of_property_read_u32_index(np, "idle-states", i,
+					   (u32 *)&idle_state);
+		if (idle_state != MUX_IDLE_AS_IS) {
+			if (idle_state < 0 || idle_state >= mux->states) {
+				dev_err(dev, "field: %d: out of range idle state %d\n",
+					i, idle_state);
+				return -EINVAL;
+			}
+
+			mux->idle_state = idle_state;
+		}
+	}
+
+	mux_chip->ops = &mux_ti_k3_event_ops;
+
+	return devm_mux_chip_register(dev, mux_chip);
+}
+
+static const struct of_device_id mux_ti_k3_event_dt_ids[] = {
+	{ .compatible = "ti,am62l-event-mux-router", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mux_ti_k3_event_dt_ids);
+
+static struct platform_driver mux_ti_k3_event_driver = {
+	.driver = {
+		.name = "ti-k3-event-mux",
+		.of_match_table	= mux_ti_k3_event_dt_ids,
+		.pm = &mux_ti_k3_event_pm_ops,
+	},
+	.probe = mux_ti_k3_event_probe,
+};
+module_platform_driver(mux_ti_k3_event_driver);
+
+MODULE_DESCRIPTION("TI K3 Bit-field Controlled Event Multiplexer driver");
+MODULE_AUTHOR("Rahul Sharma <r-sharma3@ti.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

