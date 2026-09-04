Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021109.outbound.protection.outlook.com [40.107.42.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972441DEDF;
	Fri,  4 Sep 2026 06:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504441; cv=fail; b=YwJiHfupStTg2Dn0RrRDw0LXAgodqSLk9+d5tFAYgmdEILThGkfzOzR7WCvnvke25YxxMebLT8tjKmllW7+Br9nVAHpJGAzFhVG3X+Iq33N1gTCEct0FNuoB4qh8pZzPKlRiY2WI0JkBJjEOtvhPN7+v91tLbnfh+ZLTwDXD36Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504441; c=relaxed/simple;
	bh=tTsUEDkZvXmC9NPvVcGDBjxbguvheESSjTuEmfkuT2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GbqkQEv/oeBKc7GRhcmzY7EdD8TJjGm3VlaXQ+l7v3imG6RFfi+c6Fd9kvBalwyxJIhoWZ9ygdj+opXKmTyImElsYdkrzT1Bz23/OYZqHpQGEDei7iHIezDJzY7EUMkC789faQ1XT72zgxss3A9FQh0NBFP+mkuCQtDFNBVRz1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=VaLWnZDa; arc=fail smtp.client-ip=40.107.42.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="VaLWnZDa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCiuTh8K4l4k61yS44qZhyzkvDxDI/6PdUv978Ab6TfoERD6GWpteK3Kwk5uTXPJTG66gooMtv2JJfYWIaG6n64HxdKKbXu75ogswn/5SUfbCmeka4/0jtErVjKulYUcVZ3OaVKWelk7cUuvwkjHlrPd9kVN2eEvbPE79mjZj9pxvD+mbYc2mz3pkc+hdS4ODD0WEw/N5mCzia1/DbAXwvFZWmFqyp0GZNQGwQw406reEtOexHXYCYelmAqUDjcXI80OSs9cYveZNb8skvkjuN6gkhdsSGr3Uhbh86y0DSWlOIGVZpbLWJpdxnf0Te/U99B9/QO0tjcSjX5ZyzRPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1O6lMfVUCsQvbPT+KbdPco5yG7aP0lxxw8sLWrlrEU=;
 b=MqJIZZmIaH1s2uBqbreph+PkuPR4s4EObbydiczmPhS4e5UHu/56ZYztvZPEw6l8Mq3sgoUdFyAE3gO+3VabQvoBNLmZKcAi00gRud/KwAei3a9vNIIGbsR//d6jrOPk7bzHcfHOOngB8bY38S71RBGRmpSlkMDTkz+moVZrxDkfQQrA552Wq7LTRhgDZeCk/wxEWHjy9S2glIEKw4CD/lxuQnojNWwdiy+fz5AjWV5cCldgYVqZ4Vxz1Qu5pbepj/sPFPWHYILrUGB6sCYCDBHYXpftHu//Q5C82YJc1hRF/K9a1oPO+1T1mvApbqEIxwnYJVFyyPRNNaQ5s+wFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1O6lMfVUCsQvbPT+KbdPco5yG7aP0lxxw8sLWrlrEU=;
 b=VaLWnZDavWJNraZAp+v5aeMv314ADAtlqZm2BawiXIEzw8o+gdCgo+loYrIW+3nU0e38ihNGbH/VixJS8J2t4Mis4NLURjQ02auUiP0xx86EgYOT/TehTlHdsbzcV2si4RctCt3RWh1yn64zk+Iuv/nxBsJ9sO3mKTOpEGBzxj3kfLprTV+iJnVfFCdecBm28U/QpmNEUjFYEo1MbghXs1PW25IRPwvNSBte2I5ej+9vOj/Oimj2GLC/2wjS3CfisB5C8cG8DwNsAUJHT8J807/JfGXBNbFVSd363tEsaOcCbby37Y1K+8xPTci4Fl6DcQKKEoYJ2U09rk49PWGfpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SEWP216MB2979.KORP216.PROD.OUTLOOK.COM (2603:1096:101:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:46:56 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:46:56 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v7 8/9] media: chips-media: wave6: Add Wave6 control driver
Date: Fri,  4 Sep 2026 15:46:34 +0900
Message-Id: <9a39dbcd48c8326394992cc048a635fb2472537e.1788496816.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SEWP216MB2979:EE_
X-MS-Office365-Filtering-Correlation-Id: d1433540-9af4-4009-1289-08df0a505009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|52116014|366016|38350700014|6133799003|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	kVyxASi3cXyl/l2Fq3JpbNwinm7nRf5uJnkDM3kYzsskkTP34Wtnat+caYLEUG1E0cPSELlm+SoibSNprdLiOpWA9QreGzeQ830H+WBPJ0Y5GDqrGp+zsLMCBwssVRZGwtC5K1IMB0e6p7/9F1/aZG0haLVYJxVc/y4aoXnjovan4b1INsK2lU3FimjhyLFZ3w/N9LQT4zM6Sav6ppvklZOsefhBg+ttl4KeFHTgHO8GdTCm4Hbaqz2+uKkCrEa2CvMhdmuF/jGp5RiFD5X80QXZS1valDNPIGqdp2SOAXTmVhvbk2YcKGmZYbdo9pBtFcJYh8FoEl0RmZlBd/6Lsa6BD7PHRjBSDTOSzrrylxYzNDBtewPUDRkz/0SlOXCvmBIrcmJ+szIuDNKwWeb4Khy6GktmYEZ/MAp2R/m3TtLJ5+qr+XBF4NKa5MglDI+hgfVVN1hlguhxOza8ZMv8neZrISLND7mz0JV8gYq4c3i1RCGuETC/oIDOstOZXUHq9QAqykhW9CT9/ANu8C4wS1d4ShxAzL6Kzzq2b/EyoBtqzJKZ2zJkdmyGI/ylmll3pjbYO/p8Yu43Ye8p2zo3pzMEXdKKf23JH+7QX9a4IB1bnbOGaDvbDTiAAEbbF93UKy0cwFMioF9p0DLpWf9iLoQFLAIYlGsgSVLiNcLf5pgJGp3FOfafonU1Kr6PYqxXhN0ANfnJ+B1PF0hah0szgPbFB398Z1G7UuLwf6lKvxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(52116014)(366016)(38350700014)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vE+ZqvbMcRDD972+Zfb5Gz2gah4OBTl13fpgSBI3sF0n/+cj9bmzRlWkzxIG?=
 =?us-ascii?Q?xDBpLiOQ7AqQSk+l1GOyzNHVNQsYmfqEDqfVwnKwr4E0QdpGDwUkwQGHbtQ+?=
 =?us-ascii?Q?y5tI+VFtjK8bYQLvsH+iuMwLX1R8LFS7/i7kyIqE5nPXtHYqb+rUHP/2RM76?=
 =?us-ascii?Q?nQd7TQywmyfZpF1YLQcYUOlOTGp4qM8i8q5djHFudkOPvSbK2PPca0FMKS3Y?=
 =?us-ascii?Q?jg4wTj7VZzGEY8xlu2Dx5YQ4UAEL3JhbKvqH8GA1WSvCFVvmcvHLssza0dHw?=
 =?us-ascii?Q?PlzhjFyw/iH1ONoo3ewUTi9kD6/JrFy3+BY1LzHuXbAJuPKqhWXNF+P5GYTf?=
 =?us-ascii?Q?OWWiMwEKZ4SFcFBytWMTuN8RvGqsYmmDZ5kLC4x27II3ifHI+lJ3YHgK0clg?=
 =?us-ascii?Q?ZINBjK4d7c48aY8yClFdzpCv9Gtgg1FtT13Xe7zG6F3Ak2twAMptvoXSYk7S?=
 =?us-ascii?Q?SeR5tjvHYVeW+s4xV7eUSPJ1rfw3rQhv9nu1cFYp4Q8NxxMcYRQtbQRj9Hmp?=
 =?us-ascii?Q?fTKIcNlxxzjqKe7+S5sB77wMXZ/mcoUsBgD5y5AZd728M/lT/eQSLX/MGJGg?=
 =?us-ascii?Q?k+QGcQ4DLQ5TXbY4Zf8xOxQiv3bdr5pFRBlEQheAouEx61NMe3D/rNGZJcxL?=
 =?us-ascii?Q?833kSpUzg27fvuDxIU/ukzsQ18PwoPSu3AjCRlb9TIY9tOSAuT/AgC3RbmtG?=
 =?us-ascii?Q?ZA7PPVrkyrfJO/mzpbO6F2n7uQ+tY8GRACHAp9KMHZAGoisrizzonX66EsUW?=
 =?us-ascii?Q?nMLwnqP8bPVK1tR1Z/cnFCBPrnHJ70tUlx1QkFs/9OZ89ldQzQYOuHMIX0u/?=
 =?us-ascii?Q?glOqikUAbG9EqplQHEToAtkEj1mIDVt4z+OQSf6F+Vv4nqFQjTjwn5lzpY21?=
 =?us-ascii?Q?iTNOZCEm57EXZ/jYvobykOY12PH5MdaXNCKlQhZkfrEZBGOLq0fYt8FvvvCI?=
 =?us-ascii?Q?Nqza9OXlR/TM0fVHrAHtujSRBdaSpfde1aBrilym/94M8x845WgPIeRlkAjb?=
 =?us-ascii?Q?wVBAtChE7NZqsIu7Qrdh0RfQ4lpWbe6zKWOCmH3Xx/FQ/6ozl75klHL8v3Or?=
 =?us-ascii?Q?LJObgfiW12z+cvnOgfJRv5yz+2Nb4eo+BjhZz2JwOiltV5etvlU/gKF5T3O2?=
 =?us-ascii?Q?/4cXhvfyIkEK6aR54m/UEV3tr2f1LWvIygTP3bq9colOMgBhqLiPxF+lWd3U?=
 =?us-ascii?Q?rZLLt7qqBTLTVzozJup0QlEFFbFJrB40V9J0gUxGkcKm12n+qOr40wgkwUYt?=
 =?us-ascii?Q?dBoakMEzb1Gj6uHjMeOsEL6VBiVK9FUpEuvTxw7ePzl3us9yPVGkXMWmvK9H?=
 =?us-ascii?Q?2mxPzd5Z+1wtxAFERp14Eid60j4xKUpFpeGCZECldKxv6H8AoCIbcNUhJiWg?=
 =?us-ascii?Q?vRjZfX16PGAsj/G3FjZY7iDa18cVPok7LnGVbiRYHTm0YE+R90cMo/+D9Inw?=
 =?us-ascii?Q?ZxFx97R0KsL8PRRHW0y2W9MpqZfZRnGfLpk3viGbcSR9IodeIJ8CAF2tQc/u?=
 =?us-ascii?Q?e5cI+8LYpMuMOkk3kUNBzmb2CaWBrOlqFY9h8TlkoVXXdGR/gczVwPFGjQ92?=
 =?us-ascii?Q?FBSiGLz35s87g91/j8VWMkwZvRC2QdzGDGTUzwwWiBRCOF2dGm43HXHhvApI?=
 =?us-ascii?Q?XLgY/0NXi6qZfIFDS2uN0OYRnVhzESirVWFKVKNZQI7tjygqJn//wX/gg880?=
 =?us-ascii?Q?CVlLJKH9xTSu6NHqV7MoS1JHY37EmM3dsiEkh2oBsAjtieSlGmrsh1u6OLuA?=
 =?us-ascii?Q?dqV29EanyoGQOWX8gzlkKSm6A8Wp27k=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1433540-9af4-4009-1289-08df0a505009
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:46:56.7777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT5tiUsVuIff89meSOCryxIXPAGgv2mfVHI/Bz5AaNQBOH25Nc7AId6+3HxyoBE+jOEtzYXXYnsC4oKm+Bvq0j41bz+YfpVgaXHZ0MelrzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2979

Add the control driver for the Chips&Media Wave6 video codec IP.

The hardware contains one control register region and four interface
register regions for a shared video processing engine.

This driver handles the control region and manages shared resources such
as firmware loading, firmware memory allocation, and coordination required
by the interface register regions.

It also instantiates and coordinates with the `wave6-core` child devices
for firmware and power state management.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 drivers/media/platform/chips-media/Kconfig    |   1 +
 drivers/media/platform/chips-media/Makefile   |   1 +
 .../media/platform/chips-media/wave6/Kconfig  |  17 +
 .../media/platform/chips-media/wave6/Makefile |  17 +
 .../platform/chips-media/wave6/wave6-vpu.c    | 826 ++++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpu.h    | 143 +++
 6 files changed, 1005 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h

diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
index ad350eb6b1fc..8ef7fc8029a4 100644
--- a/drivers/media/platform/chips-media/Kconfig
+++ b/drivers/media/platform/chips-media/Kconfig
@@ -4,3 +4,4 @@ comment "Chips&Media media platform drivers"
 
 source "drivers/media/platform/chips-media/coda/Kconfig"
 source "drivers/media/platform/chips-media/wave5/Kconfig"
+source "drivers/media/platform/chips-media/wave6/Kconfig"
diff --git a/drivers/media/platform/chips-media/Makefile b/drivers/media/platform/chips-media/Makefile
index 6b5d99de8b54..b9a07a91c9d6 100644
--- a/drivers/media/platform/chips-media/Makefile
+++ b/drivers/media/platform/chips-media/Makefile
@@ -2,3 +2,4 @@
 
 obj-y += coda/
 obj-y += wave5/
+obj-y += wave6/
diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
new file mode 100644
index 000000000000..63d79c56c7fc
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_WAVE6_VPU
+	tristate "Chips&Media Wave6 Codec Driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_MXC || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	select GENERIC_ALLOCATOR
+	help
+	  Chips&Media Wave6 stateful codec driver.
+	  The wave6 driver manages shared resources such as firmware memory.
+	  The wave6-core driver provides encoding and decoding capabilities
+	  for H.264, HEVC, and other video formats.
+	  To compile this driver as modules, choose M here: the
+	  modules will be called wave6 and wave6-core.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
new file mode 100644
index 000000000000..06f8ac9bef14
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# tell define_trace.h where to find the trace header
+CFLAGS_wave6-vpu-core.o := -I$(src)
+
+wave6-objs += wave6-vpu.o \
+	      wave6-vpu-thermal.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
+
+wave6-core-objs += wave6-vpu-core.o \
+		   wave6-vpu-v4l2.o \
+		   wave6-vpu-dbg.o \
+		   wave6-vpuapi.o \
+		   wave6-vpu-dec.o \
+		   wave6-vpu-enc.o \
+		   wave6-hw.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6-core.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
new file mode 100644
index 000000000000..40948063b058
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -0,0 +1,826 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/property.h>
+#include <linux/of_irq.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/genalloc.h>
+
+#include "wave6-vpuconfig.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpu.h"
+
+static const struct wave6_vpu_resource wave633c_data = {
+	.fw_name = "cnm/wave633c_imx9_codec_fw.bin",
+	/* For HEVC, AVC, 4096x4096, 8bit */
+	.sram_size = 0x14800,
+};
+
+static const struct wave6_vpu_core_resource wave633c_core_data = {
+	.codec_types = WAVE633_CODEC_TYPE,
+	.compatible_fw_version = WAVE633_COMPATIBLE_FW_VERSION,
+};
+
+static const char *wave6_vpu_state_name(enum wave6_vpu_state state)
+{
+	switch (state) {
+	case WAVE6_VPU_STATE_OFF:
+		return "off";
+	case WAVE6_VPU_STATE_PREPARE:
+		return "prepare";
+	case WAVE6_VPU_STATE_ON:
+		return "on";
+	case WAVE6_VPU_STATE_SLEEP:
+		return "sleep";
+	default:
+		return "unknown";
+	}
+}
+
+static bool wave6_vpu_valid_transition(struct wave6_vpu_device *vpu,
+				       enum wave6_vpu_state next)
+{
+	switch (vpu->state) {
+	case WAVE6_VPU_STATE_OFF:
+		/* to PREPARE: first boot attempt */
+		/* to ON: already booted before, skipping boot */
+		if (next == WAVE6_VPU_STATE_PREPARE ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_PREPARE:
+		/* to OFF: boot failed */
+		/* to ON: boot successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_ON:
+		/* to OFF: sleep failed */
+		/* to SLEEP: sleep successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_SLEEP)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_SLEEP:
+		/* to OFF: resume failed */
+		/* to ON: resume successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	}
+
+	dev_err(vpu->dev, "invalid transition: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(next));
+
+	return false;
+}
+
+static void wave6_vpu_set_state(struct wave6_vpu_device *vpu,
+				enum wave6_vpu_state state)
+{
+	if (!wave6_vpu_valid_transition(vpu, state))
+		return;
+
+	dev_dbg(vpu->dev, "set state: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(state));
+
+	vpu->state = state;
+}
+
+static int wave6_vpu_wait_busy(struct vpu_core_device *core)
+{
+	u32 val;
+
+	return read_poll_timeout(wave6_vdi_readl, val, !val,
+				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				 false, core->reg_base, W6_VPU_BUSY_STATUS);
+}
+
+static int wave6_vpu_check_result(struct vpu_core_device *core)
+{
+	if (wave6_vdi_readl(core->reg_base, W6_RET_SUCCESS))
+		return 0;
+
+	return wave6_vdi_readl(core->reg_base, W6_RET_FAIL_REASON);
+}
+
+static u32 wave6_vpu_get_code_buf_size(struct wave6_vpu_device *vpu)
+{
+	return min_t(u32, vpu->code_buf.size, W6_MAX_CODE_BUF_SIZE);
+}
+
+static void wave6_vpu_remap_code_buf(struct wave6_vpu_device *vpu)
+{
+	dma_addr_t code_base = vpu->code_buf.dma_addr;
+	u32 i, reg_val;
+
+	for (i = 0; i < wave6_vpu_get_code_buf_size(vpu) / W6_MAX_REMAP_PAGE_SIZE; i++) {
+		reg_val = REMAP_CTRL_ON |
+			  REMAP_CTRL_INDEX(i) |
+			  REMAP_CTRL_PAGE_SIZE_ON |
+			  REMAP_CTRL_PAGE_SIZE(W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CTRL_GB, reg_val);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_VADDR_GB,
+				 i * W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_PADDR_GB,
+				 code_base + i * W6_MAX_REMAP_PAGE_SIZE);
+	}
+}
+
+static void wave6_vpu_init_code_buf(struct wave6_vpu_device *vpu)
+{
+	if (vpu->code_buf.size < W6_CODE_BUF_SIZE) {
+		dev_warn(vpu->dev,
+			 "code buf size (%zu) is too small\n", vpu->code_buf.size);
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+
+	vpu->code_buf.vaddr = devm_memremap(vpu->dev,
+					    vpu->code_buf.phys_addr,
+					    vpu->code_buf.size,
+					    MEMREMAP_WC);
+	if (!vpu->code_buf.vaddr) {
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+
+	vpu->code_buf.dma_addr = dma_map_resource(vpu->dev,
+						  vpu->code_buf.phys_addr,
+						  vpu->code_buf.size,
+						  DMA_BIDIRECTIONAL,
+						  0);
+	if (dma_mapping_error(vpu->dev, vpu->code_buf.dma_addr)) {
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+}
+
+static void wave6_vpu_allocate_work_buffers(struct wave6_vpu_device *vpu)
+{
+	struct vpu_buf *buf;
+	int i;
+
+	for (i = 0; i < MAX_NUM_INSTANCE; i++) {
+		buf = &vpu->work_buffers[i];
+		buf->size = W637DEC_WORKBUF_SIZE_FOR_CQ;
+
+		if (wave6_vdi_alloc_dma(vpu->dev, buf)) {
+			dev_warn(vpu->dev, "Failed to allocate work_buffers\n");
+			return;
+		}
+
+		vpu->work_buffers_alloc++;
+	}
+}
+
+static void wave6_vpu_free_work_buffers(struct wave6_vpu_device *vpu)
+{
+	int i;
+
+	for (i = 0; i < vpu->work_buffers_alloc; i++)
+		wave6_vdi_free_dma(&vpu->work_buffers[i]);
+
+	vpu->work_buffers_alloc = 0;
+	vpu->work_buffers_avail = 0;
+}
+
+static int wave6_vpu_init_work_buf(struct wave6_vpu_device *vpu,
+				   struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_INIT_WORK_BUF);
+	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed\n");
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed, reason 0x%x\n", ret);
+		return -EIO;
+	}
+
+	vpu->work_buffers_avail = vpu->work_buffers_alloc;
+
+	return 0;
+}
+
+static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
+			      struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try init directly as firmware is running */
+	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
+		goto init_done;
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_PREPARE);
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_INIT_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+init_done:
+	ret = wave6_vpu_init_work_buf(vpu, core);
+	if (ret)
+		return ret;
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_sleep(struct wave6_vpu_device *vpu,
+			   struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (!wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC)) {
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return 0;
+	}
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_SLEEP_VPU);
+	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_SLEEP);
+
+	return 0;
+}
+
+static int wave6_vpu_wakeup(struct wave6_vpu_device *vpu,
+			    struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try wakeup directly as firmware is running */
+	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
+		goto wakeup_done;
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_WAKEUP_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+wakeup_done:
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_try_boot(struct wave6_vpu_device *vpu,
+			      struct vpu_core_device *core)
+{
+	u32 product_code;
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (vpu->state != WAVE6_VPU_STATE_OFF && vpu->state != WAVE6_VPU_STATE_SLEEP)
+		return 0;
+
+	product_code = wave6_vdi_readl(core->reg_base, W6_VPU_RET_PRODUCT_CODE);
+	if (!wave6_is_product_w_series(product_code)) {
+		dev_err(vpu->dev, "unknown product : %08x\n", product_code);
+		return -EINVAL;
+	}
+
+	if (vpu->state == WAVE6_VPU_STATE_SLEEP) {
+		ret = wave6_vpu_wakeup(vpu, core);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_vpu(vpu, core);
+
+	return ret;
+}
+
+static int wave6_vpu_get(struct wave6_vpu_device *vpu,
+			 struct vpu_core_device *core)
+{
+	int ret;
+
+	if (WARN_ON(!vpu || !core))
+		return -EINVAL;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!vpu->fw_available)
+		return -EINVAL;
+
+	/* Only the first core executes boot; others return */
+	if (atomic_inc_return(&vpu->core_count) > 1)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret)
+		goto error_pm;
+
+	ret = wave6_vpu_try_boot(vpu, core);
+	if (ret)
+		goto error_boot;
+
+	return 0;
+
+error_boot:
+	pm_runtime_put_sync(vpu->dev);
+error_pm:
+	atomic_dec(&vpu->core_count);
+
+	return ret;
+}
+
+static void wave6_vpu_put(struct wave6_vpu_device *vpu,
+			  struct vpu_core_device *core)
+{
+	if (WARN_ON(!vpu || !core))
+		return;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!vpu->fw_available)
+		return;
+
+	/* Only the last core executes sleep; others return */
+	if (atomic_dec_return(&vpu->core_count) > 0)
+		return;
+
+	wave6_vpu_sleep(vpu, core);
+
+	if (!pm_runtime_suspended(vpu->dev))
+		pm_runtime_put_sync(vpu->dev);
+}
+
+static void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
+					  struct vpu_core_device *core)
+{
+	struct vpu_buf *vb;
+	u32 size;
+
+	if (WARN_ON(!vpu || !core))
+		return;
+
+	size = wave6_vdi_readl(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE);
+	if (!size)
+		return;
+
+	if (WARN_ON(size > W637DEC_WORKBUF_SIZE_FOR_CQ))
+		goto exit;
+
+	if (WARN_ON(vpu->work_buffers_avail == 0))
+		goto exit;
+
+	vpu->work_buffers_avail--;
+	vb = &vpu->work_buffers[vpu->work_buffers_avail];
+
+	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_ADDR, vb->daddr);
+
+exit:
+	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE, SET_WORK_BUF_SIZE_ACK);
+}
+
+static int wave6_vpu_create_cores(struct wave6_vpu_device *vpu)
+{
+	struct device_node *child;
+	int num_cores = 0;
+
+	for_each_available_child_of_node(vpu->dev->of_node, child) {
+		struct platform_device_info info = {};
+		struct platform_device *pdev;
+		struct resource res[2];
+		int irq;
+
+		if (num_cores >= W6_VPU_MAX_NUM_CORE) {
+			of_node_put(child);
+			break;
+		}
+
+		if (of_address_to_resource(child, 0, &res[0])) {
+			dev_warn(vpu->dev, "%pOF: missing reg property\n", child);
+			continue;
+		}
+
+		irq = of_irq_get(child, 0);
+		if (irq < 0) {
+			dev_warn(vpu->dev, "%pOF: missing interrupts property\n", child);
+			continue;
+		}
+		res[1] = DEFINE_RES_IRQ(irq);
+
+		info.fwnode = of_fwnode_handle(child);
+		info.parent = vpu->dev;
+		info.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME;
+		info.id = num_cores;
+		info.dma_mask = DMA_BIT_MASK(32);
+		info.res = res;
+		info.num_res = ARRAY_SIZE(res);
+		info.data = &wave633c_core_data;
+		info.size_data = sizeof(wave633c_core_data);
+
+		pdev = platform_device_register_full(&info);
+		if (IS_ERR(pdev)) {
+			dev_err(vpu->dev, "Failed to register core %d: %ld\n",
+				num_cores, PTR_ERR(pdev));
+			continue;
+		}
+
+		vpu->core_pdevs[num_cores] = pdev;
+		num_cores++;
+	}
+
+	return num_cores;
+}
+
+static void wave6_vpu_destroy_cores(struct wave6_vpu_device *vpu)
+{
+	int i;
+
+	for (i = 0; i < W6_VPU_MAX_NUM_CORE; i++) {
+		struct platform_device *pdev = vpu->core_pdevs[i];
+
+		if (!pdev)
+			continue;
+
+		platform_device_unregister(pdev);
+		vpu->core_pdevs[i] = NULL;
+	}
+}
+
+static void wave6_vpu_release(struct wave6_vpu_device *vpu)
+{
+	guard(mutex)(&vpu->lock);
+
+	vpu->fw_available = false;
+	wave6_vpu_destroy_cores(vpu);
+	wave6_vpu_free_work_buffers(vpu);
+	if (vpu->sram_pool && vpu->sram_buf.vaddr) {
+		dma_unmap_resource(vpu->dev,
+				   vpu->sram_buf.dma_addr,
+				   vpu->sram_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+		gen_pool_free(vpu->sram_pool,
+			      (unsigned long)vpu->sram_buf.vaddr,
+			      vpu->sram_buf.size);
+	}
+	if (vpu->code_buf.dma_addr)
+		dma_unmap_resource(vpu->dev,
+				   vpu->code_buf.dma_addr,
+				   vpu->code_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+}
+
+static void wave6_vpu_load_firmware(const struct firmware *fw, void *context)
+{
+	struct wave6_vpu_device *vpu = context;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!fw || !fw->data) {
+		dev_err(vpu->dev, "No firmware.\n");
+		return;
+	}
+
+	if (!vpu->fw_available)
+		goto exit;
+
+	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu)) {
+		dev_err(vpu->dev, "firmware size (%zd > %zd) is too big\n",
+			fw->size, vpu->code_buf.size);
+		vpu->fw_available = false;
+		goto exit;
+	}
+
+	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
+
+	vpu->get_vpu = wave6_vpu_get;
+	vpu->put_vpu = wave6_vpu_put;
+	vpu->req_work_buffer = wave6_vpu_require_work_buffer;
+
+	if (!wave6_vpu_create_cores(vpu)) {
+		dev_err(vpu->dev, "Failed to create VPU cores\n");
+		vpu->fw_available = false;
+	}
+
+exit:
+	release_firmware(fw);
+}
+
+static void wave6_vpu_detach_pm_domains(struct wave6_vpu_device *vpu)
+{
+	if (!vpu->num_pm_domains)
+		return;
+
+	for (int i = 0; i < vpu->num_pm_domains; i++) {
+		struct device *pd_dev = vpu->pd_list->pd_devs[i];
+
+		if (!IS_ERR_OR_NULL(pd_dev) && !pm_runtime_suspended(pd_dev))
+			pm_runtime_force_suspend(pd_dev);
+	}
+
+	dev_pm_domain_detach_list(vpu->pd_list);
+	vpu->pd_list = NULL;
+	vpu->num_pm_domains = 0;
+}
+
+static int wave6_vpu_attach_pm_domains(struct wave6_vpu_device *vpu)
+{
+	int ret;
+
+	vpu->num_pm_domains = of_count_phandle_with_args(vpu->dev->of_node,
+							 "power-domains",
+							 "#power-domain-cells");
+	if (vpu->num_pm_domains < 0) {
+		dev_err(vpu->dev, "No power domains defined for vpu node\n");
+		return vpu->num_pm_domains;
+	}
+
+	if (vpu->num_pm_domains == 1) {
+		/* genpd_dev_pm_attach() attach automatically if count is 1 */
+		vpu->num_pm_domains = 0;
+		return 0;
+	}
+
+	ret = dev_pm_domain_attach_list(vpu->dev, NULL, &vpu->pd_list);
+	if (ret < 0) {
+		dev_err(vpu->dev, "Can't attach pm domains, ret = %d\n", ret);
+		return ret;
+	}
+
+	vpu->num_pm_domains = ret;
+
+	return 0;
+}
+
+static struct device *wave6_vpu_get_performance_dev(struct wave6_vpu_device *vpu)
+{
+	int index;
+
+	if (!vpu->num_pm_domains)
+		return vpu->dev;
+
+	index = of_property_match_string(vpu->dev->of_node,
+					 "power-domain-names", "perf");
+	if (index < 0 || index >= vpu->num_pm_domains)
+		return NULL;
+
+	return vpu->pd_list->pd_devs[index];
+}
+
+static int wave6_vpu_probe(struct platform_device *pdev)
+{
+	struct device_node *np;
+	struct wave6_vpu_device *vpu;
+	const struct wave6_vpu_resource *res;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	res = device_get_match_data(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
+	if (!vpu)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &vpu->lock);
+	if (ret)
+		return ret;
+
+	atomic_set(&vpu->core_count, 0);
+	dev_set_drvdata(&pdev->dev, vpu);
+	vpu->dev = &pdev->dev;
+	vpu->res = res;
+	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vpu->reg_base))
+		return PTR_ERR(vpu->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
+
+	vpu->num_clks = ret;
+
+	ret = wave6_vpu_attach_pm_domains(vpu);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to attach pm domains\n");
+
+	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (np) {
+		struct resource mem;
+
+		ret = of_address_to_resource(np, 0, &mem);
+		of_node_put(np);
+		if (!ret) {
+			vpu->code_buf.phys_addr = mem.start;
+			vpu->code_buf.size = resource_size(&mem);
+			wave6_vpu_init_code_buf(vpu);
+		} else {
+			dev_warn(&pdev->dev, "memory-region is not available.\n");
+		}
+	}
+
+	vpu->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (vpu->sram_pool) {
+		vpu->sram_buf.size = vpu->res->sram_size;
+		vpu->sram_buf.vaddr = gen_pool_dma_alloc(vpu->sram_pool,
+							 vpu->sram_buf.size,
+							 &vpu->sram_buf.phys_addr);
+		if (!vpu->sram_buf.vaddr) {
+			vpu->sram_buf.size = 0;
+		} else {
+			vpu->sram_buf.dma_addr = dma_map_resource(&pdev->dev,
+								  vpu->sram_buf.phys_addr,
+								  vpu->sram_buf.size,
+								  DMA_BIDIRECTIONAL,
+								  0);
+			if (dma_mapping_error(&pdev->dev, vpu->sram_buf.dma_addr)) {
+				gen_pool_free(vpu->sram_pool,
+					      (unsigned long)vpu->sram_buf.vaddr,
+					      vpu->sram_buf.size);
+				memset(&vpu->sram_buf, 0, sizeof(vpu->sram_buf));
+			}
+		}
+	}
+
+	vpu->thermal.dev = wave6_vpu_get_performance_dev(vpu);
+	if (vpu->thermal.dev) {
+		ret = wave6_vpu_cooling_init(vpu->dev, &vpu->thermal);
+		if (ret)
+			dev_err(&pdev->dev, "failed to initialize thermal cooling, %d\n", ret);
+	}
+
+	wave6_vpu_allocate_work_buffers(vpu);
+
+	pm_runtime_enable(&pdev->dev);
+	vpu->fw_available = true;
+
+	request_module("platform:%s", WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME);
+
+	ret = firmware_request_nowait_nowarn(THIS_MODULE,
+					     vpu->res->fw_name,
+					     &pdev->dev,
+					     GFP_KERNEL,
+					     vpu,
+					     wave6_vpu_load_firmware);
+	if (ret) {
+		dev_err(&pdev->dev, "request firmware fail, ret = %d\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	wave6_vpu_release(vpu);
+	pm_runtime_disable(&pdev->dev);
+	wave6_vpu_detach_pm_domains(vpu);
+
+	return ret;
+}
+
+static void wave6_vpu_remove(struct platform_device *pdev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(&pdev->dev);
+
+	wave6_vpu_release(vpu);
+	pm_runtime_disable(vpu->dev);
+	wave6_vpu_detach_pm_domains(vpu);
+}
+
+static int wave6_vpu_runtime_suspend(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
+
+	return 0;
+}
+
+static int wave6_vpu_runtime_resume(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
+}
+
+static const struct dev_pm_ops wave6_vpu_pm_ops = {
+	RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
+		       wave6_vpu_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+			    pm_runtime_force_resume)
+};
+
+static const struct of_device_id wave6_vpu_ids[] = {
+	{ .compatible = "nxp,imx95-vpu", .data = &wave633c_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_vpu_ids);
+
+static struct platform_driver wave6_vpu_driver = {
+	.driver = {
+		.name = WAVE6_VPU_PLATFORM_DRIVER_NAME,
+		.of_match_table = wave6_vpu_ids,
+		.pm = pm_ptr(&wave6_vpu_pm_ops),
+	},
+	.probe = wave6_vpu_probe,
+	.remove = wave6_vpu_remove,
+};
+
+module_platform_driver(wave6_vpu_driver);
+MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
+MODULE_AUTHOR("CHIPS&MEDIA INC");
+MODULE_FIRMWARE("cnm/wave633c_imx9_codec_fw.bin");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
new file mode 100644
index 000000000000..ec3c9299526b
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_H__
+#define __WAVE6_VPU_H__
+
+#include <linux/device.h>
+#include "wave6-vpu-thermal.h"
+#include "wave6-vdi.h"
+#include "wave6-vpuapi.h"
+
+#define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
+#define WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME "wave6-vpu-core"
+
+struct wave6_vpu_device;
+struct vpu_core_device;
+
+/**
+ * enum wave6_vpu_state - VPU states
+ * @WAVE6_VPU_STATE_OFF:	VPU is powered off
+ * @WAVE6_VPU_STATE_PREPARE:	VPU is booting
+ * @WAVE6_VPU_STATE_ON:		VPU is running
+ * @WAVE6_VPU_STATE_SLEEP:	VPU is in a sleep mode
+ */
+enum wave6_vpu_state {
+	WAVE6_VPU_STATE_OFF,
+	WAVE6_VPU_STATE_PREPARE,
+	WAVE6_VPU_STATE_ON,
+	WAVE6_VPU_STATE_SLEEP
+};
+
+/**
+ * struct wave6_vpu_dma_buf - VPU buffer from reserved memory or gen_pool
+ * @size:	Buffer size
+ * @dma_addr:	Mapped address for device access
+ * @vaddr:	Kernel virtual address
+ * @phys_addr:	Physical address of the reserved memory region or gen_pool
+ *
+ * Represents a buffer allocated from pre-reserved device memory regions or
+ * SRAM via gen_pool_dma_alloc(). Used for code and SRAM buffers only.
+ * Managed by the VPU device.
+ */
+struct wave6_vpu_dma_buf {
+	size_t size;
+	dma_addr_t dma_addr;
+	void *vaddr;
+	phys_addr_t phys_addr;
+};
+
+/**
+ * struct wave6_vpu_resource - VPU device compatible data
+ * @fw_name:	Firmware name for the device
+ * @sram_size:	Required SRAM size
+ */
+struct wave6_vpu_resource {
+	const char *fw_name;
+	u32 sram_size;
+};
+
+#define WAVE6_IS_ENC				BIT(0)
+#define WAVE6_IS_DEC				BIT(1)
+
+#define WAVE633_CODEC_TYPE			(WAVE6_IS_ENC | WAVE6_IS_DEC)
+#define WAVE633_COMPATIBLE_FW_VERSION		0x2010000
+
+/**
+ * struct wave6_vpu_core_resource - VPU CORE device compatible data
+ * @codec_types:		Bitmask of supported codec types
+ * @compatible_fw_version:	Firmware version compatible with driver
+ */
+struct wave6_vpu_core_resource {
+	int codec_types;
+	u32 compatible_fw_version;
+};
+
+/**
+ * struct wave6_vpu_device - VPU driver structure
+ * @get_vpu:		Function pointer, boot or wake the device
+ * @put_vpu:		Function pointer, power off or suspend the device
+ * @req_work_buffer:	Function pointer, request allocation of a work buffer
+ * @dev:		Platform device pointer
+ * @reg_base:		Base address of MMIO registers
+ * @clks:		Array of clock handles
+ * @num_clks:		Number of entries in @clks
+ * @state:		Device state
+ * @lock:		Mutex protecting device data, register access
+ * @fw_available:	Firmware availability flag
+ * @res:		Device compatible data
+ * @sram_pool:		Genalloc pool for SRAM allocations
+ * @sram_buf:		Optional SRAM buffer
+ * @code_buf:		Firmware code buffer
+ * @work_buffers:	Array of work buffers
+ * @work_buffers_alloc:	Number of allocated work buffers
+ * @work_buffers_avail:	Number of available work buffers
+ * @thermal:		Thermal cooling device
+ * @core_count:		Number of available VPU core devices
+ *
+ * @get_vpu, @put_vpu, @req_work_buffer are called by VPU core devices.
+ *
+ * Buffers such as @sram_buf, @code_buf, and @work_buffers are managed
+ * by the VPU device and accessed exclusively by the firmware.
+ */
+struct wave6_vpu_device {
+	int (*get_vpu)(struct wave6_vpu_device *vpu,
+		       struct vpu_core_device *core);
+	void (*put_vpu)(struct wave6_vpu_device *vpu,
+			struct vpu_core_device *core);
+	void (*req_work_buffer)(struct wave6_vpu_device *vpu,
+				struct vpu_core_device *core);
+	struct device *dev;
+	void __iomem *reg_base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	enum wave6_vpu_state state;
+	struct mutex lock; /* Protects device data, register access */
+
+	/* Prevents boot or sleep sequence if firmware is unavailable. */
+	bool fw_available;
+
+	const struct wave6_vpu_resource *res;
+	struct gen_pool *sram_pool;
+	struct wave6_vpu_dma_buf sram_buf;
+	struct wave6_vpu_dma_buf code_buf;
+
+	/* Allocates per-instance, used for storing instance-specific data. */
+	struct vpu_buf work_buffers[MAX_NUM_INSTANCE];
+	u32 work_buffers_alloc;
+	u32 work_buffers_avail;
+
+	struct vpu_thermal_cooling thermal;
+	atomic_t core_count;
+
+	int num_pm_domains;
+	struct dev_pm_domain_list *pd_list;
+
+	struct platform_device *core_pdevs[W6_VPU_MAX_NUM_CORE];
+};
+
+#endif /* __WAVE6_VPU_H__ */
-- 
2.31.1

