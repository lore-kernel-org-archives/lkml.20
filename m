Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021129.outbound.protection.outlook.com [40.107.51.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6352ED4A;
	Tue,  8 Sep 2026 11:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867819; cv=fail; b=DxiolHxlo+UP3mKF87wxMTBPdkuEnnK7pUMletCpBffLSWQc+LJy6MOq14y3RbYsqaZu4w2SWrC4jSsj2K7JalH79i9DMTPHre4dEVS4nRtw3qe7aEBRtHIyqeOOzqmfwQuFRZpAKymBe+xwbax3kTDInOBIO7r6lKwbCADiv+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867819; c=relaxed/simple;
	bh=PiaKCkJmCWnwSNy1JY2Um2aknrlzPz7eQaNFIZIWQHo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qEoMirB7AX0Q1AaP5bYZMoNdAEJ0odEsDf//MvWq8PpHmWWlARFLFJHWLfNlXgtCGSg+ku5iTXgZ0X0+BJbOl60FUpo69O9h2A+c8gCqEMcwiYLHGUgE8Ql8aDZcCmcFexyzvvbiG9A38mkNeExpwl0IkY4B0Gy88xboZSzbH5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=bLJOehKr reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="bLJOehKr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fms0JwmHTgR9T3eu+riRwJmILA+Jp/hrTgVdrzYECYSXyEgQNcLiPY8ww4jbGPVahx0JVin5jUrcogG4C8iHSB1mFusQdjNHUY1TMVOrtAB5M8sQRtGJ7LgcVMNmnROHxrbL4kjzMZuJ//vHmb5eq5u5WyfGR1KvQuUpqZj8cZTB52+wOwLthvbgaJG2VZTXwb6MZDhe8cLq3ZPP1mLK+tCnZQKWpgcdvFh2TGIc9zhsMRg7EOTuZgSVFYvE4eJHR7CMR3AkFP2419/6AJgG/2kRxq4Diu4Sxh51ud88Bf0gcjAt9N7Cx/920ShlYhmbZwdDd5sOeh9w1+CXAd2o1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEyVTnOA13FLHnoDnMABydzguiH1aGhUS7elzZXtars=;
 b=avBnBSyZVNcmadTB1c4Edf2V2oygxdheRd/uOYigRY0KtT0m+jD32WHw43RYGGpHog7GR/csMPyGIdbCadfMmSJY2JOoy89hJ88V+7NfW1N7vRLuTMkOEr6BO682wom9ZqV8uyaXEyZvtNivcRWr3UUHs2zYlWihz6Q7Q6EWUPGRqbp8QtZwLTXxYR0rUVos4MW7ZnDfOBrDTFEBPSTxv1a44Qvu3vRfiH29nUl3uRXWwTGmNo3jSxKelvPYpIuwB3IyHCb9J6D3yKxo0bnmOYWW9xx97fDNoaZrOrmIiqysfcGsfYuyS4bQBfolPBMbLN96Ir4Z0Aua4FrO1YM3qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEyVTnOA13FLHnoDnMABydzguiH1aGhUS7elzZXtars=;
 b=bLJOehKrEutNIpXf6QVcAFmjKPkExuTznXNOOvswP5fmATBybCWAsqU+RQoi3yfY1l7iCDv9KR397v1WzSPF2AJ8wZY7tjrCdRXuIC9hPhA4lD/dGUv+RJOuwKDrG2Udv7RvduRDvfII0bFEMaGyYVfBU/DqVOW3QMXo2L36ONQ+D8AUJM72DfOF2vdAZg4QJ3UNO6Qy7ctM///OqZK73thR5wrLgl0rQFl+H1FPYlJN4z731HcmTBxyZv3dL24QN4glQw5026YcnN+JQe/z6p3ih1iPbN3t58rvbqbpyp16tU39UZQ5OGS0o60smDsCE83jbW7Nu2FECoJauYzSNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB5159.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 11:43:26 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%7]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 11:43:26 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Kate Hsuan <hpa@redhat.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 2/2] media: i2c: add os02g10 image sensor driver
Date: Tue,  8 Sep 2026 17:12:28 +0530
Message-Id: <20260908114235.86568-3-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908114235.86568-1-elgin.perumbilly@siliconsignals.io>
References: <20260908114235.86568-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25e::10) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MA5P287MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: 636be006-de98-443d-d369-08df0d9e653e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|23010399003|38350700014|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NTwzN1Ol5P3iFvnc0Nieyh/vekGEuRkbeI1fds6gZg6PqF9Q6PlGRjtA8P+92awythkXrp43jauCUTZzxG6smWvVbgpdiLwvcDKZVkwiM1JNAodHuQq41f60qxurToBRQVxDv4MbuSXpKl7sj3znSww/wtGogm2s8/SZVMHVDU1vEKkvUcQJyAqMdcyUYl9ey9wMJN99H/mFf/MRAjRPku1+JWOED171HnXbvULCuX2Qe2hdB2SKkH8pGj+LxVhv3IfmJvynB6dPrFkQHBV5AyeU1DDR+fotzjcAxjFMS5Bk6Ajhtq7zPKeIv7GLKFasHgjkeM4jXFty04tT2BM21TvXORGnNFXkp/MSUuw+Om0Dl1lE5MnJl/5wi4jottKX9ajzjCXBSWLUa/i/JC6OlMYWH00iSYQWEe/EUVg04td+xFiAlPDoT8PzZViZT6unDPok+OOF5fi8iRs/XfVa7u7zYPW1b4dp5l1RPQJYNIP/jmlMZ+ecapRPOhwSP3JIGE7zzel/wW92H6OJDimJb31h12pJX81ikgaf+95QGp5WyV2MsQkJRCmlhWaPhC4vgqG+8z82ORtm3tZwppqD1AnIrjoJwmJVbjkOc+OyqAElILx4NB73KtHuuq4jBpNitrLO8dU1fCrppLNWKRzDMnDYDIOMuyldbMkYd3Ng2pDv0sNeJIxg4xnxsfxd211+OhJak6/4LhE7wabq4GKa7azGalWLkxyTldD15+sN54k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(23010399003)(38350700014)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RK7+zKLT9ZiOAJ3WAvFtXbF8afxl4lLRHDegGk/3K4EOu7PQhPboxSJM5VO/?=
 =?us-ascii?Q?+B1br+quUQjtnrQRi6O7nYe9snbzu77+VjXi6btQNlbceSf2kfrbPN1O4CG6?=
 =?us-ascii?Q?t6F06eb6NXsRg8cU/gM5bU7bkLloA3r5QuZpwNufLMXxF0O+rKddxBA1UDR8?=
 =?us-ascii?Q?y/b/0WcGY9AKaK4j8vTdJgIKLi4NfCoGeOI5WK6VmDK2O9tci3vIG93N6dbP?=
 =?us-ascii?Q?NbJiukKMAumCoUWI09LiX+PRJ6CliXJNv2+zHzmwmlC1UxTRZIbmbl440EAY?=
 =?us-ascii?Q?gXJriXq2oTJpcy7qmJfTDRKP+ba2CIHU2yvHMSyjTu1U7D0SLt/9/yPd3eDg?=
 =?us-ascii?Q?KcJAKLeJOj5NMZ5EmNi8HG8sKv9h2oDQEEkDhIW/klpaWdgAeBrvRRwRs/Jh?=
 =?us-ascii?Q?tUzoP+Rbojtlma81RiUIV7p1EGn5R51geNC6arF1T3wpUo+isvnpsP7QtDxp?=
 =?us-ascii?Q?tNdQmcs4Uy/bc4CvUqjGZg34rYzJ6Iw8Zl8UNkl231cW0JoTT/DfqZsKxtjS?=
 =?us-ascii?Q?RPKrWAxUFOuXjUOYHS9M7OSt8nCo8QLeXyawz2bC/Vq8pvOZiB63RKDT1Tuq?=
 =?us-ascii?Q?TcJii7rbVoa4IO8lkqs9LiZucFgTXEfflBWljPqUyog6pLLV1dqDeXJcBImS?=
 =?us-ascii?Q?auCjMgSJmY/bzTiPBkD8ame0tud8/i336IMEQiRqwSA5Z2078Vs8ytfGVvjW?=
 =?us-ascii?Q?OjofIbn2Qe57ULnZUY3gebox7HmDXS+hnY9xxrGOUCbCpwfOfjsW6y5fmlHn?=
 =?us-ascii?Q?lHBzAuKZiFCST8iTwl8JjgUxYCmFpKZNu8Ah3g6VgIoLYV8/AssdW3MvoCw5?=
 =?us-ascii?Q?jB39i6gJKMn3sfTBXqdHZRrJ6KmUFJ4R0f+zTnfozviQWdDLDCcb0E3Ksxei?=
 =?us-ascii?Q?MyJ24MJIys+Yzm5iVh3uCEOd4R8IKbRMlKfno8ylGIs+tRzeOMHANE3RwSny?=
 =?us-ascii?Q?az2MXjqqykRcT894LUyio5WwHmBhDxuqB98QyQ4Q39lkvRUPEPD3YRaKidTF?=
 =?us-ascii?Q?7TL356jtlPiSRx6L8Hf6VPYbK4iLncs4Uv4cMrtNgVYOr6MbMGKurQuAC12C?=
 =?us-ascii?Q?2q3v4QfzJXtMZImgivIetBWom3uwo7ZOF4y/jbSbQ+7h0nEenVdpMq/iCNgF?=
 =?us-ascii?Q?ELtgNAw5lfxDJbdrWC9Ni53IKoVETkC2TVJbq0FPlyXJFzAP140I0wmbbvnA?=
 =?us-ascii?Q?RrqKWSKmHhTgjp3qXf9qJT5BAbJYUOLnqyOEgIrUv6s99HN7t3xhEf7Kic77?=
 =?us-ascii?Q?2O3yALyxtdrNREdZf5yN+Uwh5/nNl39Lej5w91HRYfECwtV98sEaSUzsLPhY?=
 =?us-ascii?Q?Z/9z+/UcSRUwEO4Fy8aeAhzQKrBJ+V7qUfk6imGUBEaTCoPjXxhvYPut/XZ2?=
 =?us-ascii?Q?GhwKtO3oj/xWfr8zwSXMeR4073OtaK8gjwbdhUy8VMP6D5GlGrWEtHJ1vqn3?=
 =?us-ascii?Q?btRq1udJVAQPjjP4npfV9ubYmNxJVnNkcqf3WJA4zYnn6aja65QKOH+UFgeP?=
 =?us-ascii?Q?+gY1gH+wZKtg5FIY6rWme2ZCSLkf8F6VdQPTIN6hINnloo7paTs/y2+wy864?=
 =?us-ascii?Q?cPDJq0rGoSwkyzXZIEmJm0Ypyp14FuUuaLfUi0WncU64ynHfpdOLBDVPpPRv?=
 =?us-ascii?Q?o3CZJmAxmYYyD98mNo5HDVGDpYuExn6DauPE86uwrpZsRuXAVgYPgpX9SCns?=
 =?us-ascii?Q?OniBP2MBgK1eyPfh8fcT2siLehGVuVBDQOHYxcRLyMldljvohncvtq92Tlf8?=
 =?us-ascii?Q?RTkBleGegeLAOFjNdPzOd0c4yYm33lHIaVJBPMt6KNRLMKHQQzmM?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 636be006-de98-443d-d369-08df0d9e653e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:43:26.5956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/wr+EO4fKZ7xbj6R5JZgFXVb8TRXMrYuvuc/lSoLKM14asFxPgnYZhnM0lUh/pkWlJ7ztxPmlZb8AVmRxFSRjw3+La6C611HGQrRXfZIfHSaiotjILPCtJDfXYYy5dS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5159

Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.

The Omnivision os02g10 is a CMOS image sensor with an active array size of
1920 x 1080.

The following features are supported:
- Manual exposure an gain control support
- vblank/hblank control support
- vflip/hflip control support
- Test pattern control support
- Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS                 |   1 +
 drivers/media/i2c/Kconfig   |  10 +
 drivers/media/i2c/Makefile  |   1 +
 drivers/media/i2c/os02g10.c | 932 ++++++++++++++++++++++++++++++++++++
 4 files changed, 944 insertions(+)
 create mode 100644 drivers/media/i2c/os02g10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a4e6c047c54..197de90c845d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20196,6 +20196,7 @@ M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
+F:	drivers/media/i2c/os02g10.c

 OMNIVISION OS05B10 SENSOR DRIVER
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5c52007f9cbe..b5ff3f52ec3e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -396,6 +396,16 @@ config VIDEO_OG0VE1B
 	  To compile this driver as a module, choose M here: the
 	  module will be called og0ve1b.

+config VIDEO_OS02G10
+	tristate "OmniVision OS02G10 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for Omnivision
+	  OS02G10 camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called os02g10.
+
 config VIDEO_OS05B10
         tristate "OmniVision OS05B10 sensor support"
         select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d04bd5724552..0847e8097bc0 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
 obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
 obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
 obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
+obj-$(CONFIG_VIDEO_OS02G10) += os02g10.o
 obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
 obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
 obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
new file mode 100644
index 000000000000..61de45c54d18
--- /dev/null
+++ b/drivers/media/i2c/os02g10.c
@@ -0,0 +1,932 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 Support for the OS02G10
+ *
+ * Copyright (C) 2026 Silicon Signals Pvt. Ltd.
+ *
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/units.h>
+#include <linux/types.h>
+#include <linux/time.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+#define OS02G10_XCLK_FREQ_24MHZ			(24 * HZ_PER_MHZ)
+
+/* Page 0 */
+#define OS02G10_REG_CHIPID			CCI_REG24(0x002)
+#define OS02G10_CHIPID				0x560247
+
+#define OS02G10_REG_PLL_DIV_CTRL		CCI_REG8(0x030)
+#define OS02G10_REG_PLL_DCTL_BIAS_CTRL		CCI_REG8(0x035)
+#define OS02G10_REG_GATE_EN_CTRL		CCI_REG8(0x038)
+#define OS02G10_REG_DPLL_NC			CCI_REG8(0x041)
+#define OS02G10_REG_MP_PHASE_CTRL		CCI_REG8(0x044)
+
+/* Page 1 */
+#define OS02G10_REG_FRAME_SYNC			CCI_REG8(0x101)
+
+#define OS02G10_REG_LONG_EXPOSURE		CCI_REG16(0x103)
+#define OS02G10_EXPOSURE_MIN			4
+#define OS02G10_EXPOSURE_STEP			1
+#define OS02G10_EXPOSURE_MARGIN			9
+
+#define OS02G10_REG_HBLANK			CCI_REG16(0x109)
+
+#define OS02G10_REG_FRAME_TEST_CTRL		CCI_REG8(0x10d)
+#define OS02G10_FRAME_EXP_SEPERATE_EN		BIT(4)
+#define OS02G10_TEST_PATTERN_ENABLE		BIT(0)
+
+#define OS02G10_REG_FRAME_LENGTH		CCI_REG16(0x10e)
+#define OS02G10_FRAME_LENGTH_MAX		(BIT(16) - 1)
+
+#define OS02G10_REG_ANALOG_GAIN			CCI_REG8(0x124)
+#define OS02G10_ANALOG_GAIN_MIN			16
+#define OS02G10_ANALOG_GAIN_MAX			248
+#define OS02G10_ANALOG_GAIN_STEP		1
+#define OS02G10_ANALOG_GAIN_DEFAULT		16
+
+#define OS02G10_REG_DIGITAL_GAIN_H		CCI_REG8(0x137)
+#define OS02G10_REG_DIGITAL_GAIN_L		CCI_REG8(0x139)
+#define OS02G10_DIGITAL_GAIN_MIN		64
+#define OS02G10_DIGITAL_GAIN_MAX		2048
+#define OS02G10_DIGITAL_GAIN_STEP		64
+#define OS02G10_DIGITAL_GAIN_DEFAULT		64
+
+#define OS02G10_REG_ULP_PWD_DUMMY_CTRL		CCI_REG8(0x13c)
+
+#define OS02G10_REG_FLIP_MIRROR			CCI_REG8(0x13f)
+#define OS02G10_FLIP				BIT(1)
+#define OS02G10_MIRROR				BIT(0)
+
+#define OS02G10_REG_DC_LEVEL_LIMIT_EN		CCI_REG8(0x146)
+#define OS02G10_REG_DC_LEVEL_LIMIT_L		CCI_REG8(0x147)
+#define OS02G10_REG_BLC_DATA_LIMIT_L		CCI_REG8(0x148)
+#define OS02G10_REG_DC_BLC_LIMIT_H		CCI_REG8(0x149)
+
+#define OS02G10_REG_H_SIZE_MIPI			CCI_REG16(0x18e)
+#define OS02G10_REG_V_SIZE_MIPI			CCI_REG16(0x190)
+
+#define OS02G10_REG_HS_LP_CTRL			CCI_REG8(0x192)
+#define OS02G10_REG_HS_LEVEL			CCI_REG8(0x19d)
+#define OS02G10_REG_HS_DRV			CCI_REG8(0x19e)
+
+#define OS02G10_REG_MIPI_TX_SPEED_CTRL		CCI_REG8(0x1a1)
+
+#define OS02G10_REG_STREAM_CTRL			CCI_REG8(0x1b1)
+#define OS02G10_STREAM_CTRL_ON			0x03
+#define OS02G10_STREAM_CTRL_OFF			0x00
+
+#define OS02G10_REG_GB_SUBOFFSET		CCI_REG8(0x1f0)
+#define OS02G10_REG_BLUE_SUBOFFSET		CCI_REG8(0x1f1)
+#define OS02G10_REG_RED_SUBOFFSET		CCI_REG8(0x1f2)
+#define OS02G10_REG_GR_SUBOFFSET		CCI_REG8(0x1f3)
+
+#define OS02G10_REG_ABL_TRIGGER			CCI_REG8(0x1fa)
+#define OS02G10_REG_ABL				CCI_REG8(0x1fb)
+
+/* Page 2 */
+#define OS02G10_REG_SIF_CTRL			CCI_REG8(0x25e)
+#define OS02G10_ORIENTATION_BAYER_FIX		0x32
+
+#define OS02G10_REG_V_START			CCI_REG16(0x2a0)
+#define OS02G10_REG_V_SIZE			CCI_REG16(0x2a2)
+#define OS02G10_REG_H_START			CCI_REG16(0x2a4)
+#define OS02G10_REG_H_SIZE			CCI_REG16(0x2a6)
+
+#define OS02G10_LINK_FREQ_720MHZ		(720 * HZ_PER_MHZ)
+#define OS02G10_DATA_LANES			2
+
+/* OS02G10 native and active pixel array size */
+static const struct v4l2_rect os02g10_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 1928,
+	.height = 1088,
+};
+
+static const struct v4l2_rect os02g10_active_area = {
+	.top = 4,
+	.left = 4,
+	.width = 1920,
+	.height = 1080,
+};
+
+static const char * const os02g10_supply_name[] = {
+	"avdd",		/* Analog power */
+	"dovdd",	/* Digital I/O power */
+	"dvdd",		/* Digital core power */
+};
+
+struct os02g10 {
+	struct device *dev;
+	struct regmap *cci;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct clk *xclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(os02g10_supply_name)];
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
+};
+
+struct os02g10_mode {
+	u32 width;
+	u32 height;
+	u32 vts_def;
+	u32 exp_def;
+	u32 x_start;
+	u32 y_start;
+};
+
+static const struct cci_reg_sequence os02g10_common_regs[] = {
+	{ OS02G10_REG_PLL_DIV_CTRL,		0x0a},
+	{ OS02G10_REG_PLL_DCTL_BIAS_CTRL,	0x04},
+	{ OS02G10_REG_GATE_EN_CTRL,		0x11},
+	{ OS02G10_REG_DPLL_NC,			0x06},
+	{ OS02G10_REG_MP_PHASE_CTRL,		0x20},
+	{ CCI_REG8(0x119),			0x50},
+	{ CCI_REG8(0x11a),			0x0c},
+	{ CCI_REG8(0x11b),			0x0d},
+	{ CCI_REG8(0x11c),			0x00},
+	{ CCI_REG8(0x11d),			0x75},
+	{ CCI_REG8(0x11e),			0x52},
+	{ CCI_REG8(0x122),			0x14},
+	{ CCI_REG8(0x125),			0x44},
+	{ CCI_REG8(0x126),			0x0f},
+	{ OS02G10_REG_ULP_PWD_DUMMY_CTRL,	0xca},
+	{ CCI_REG8(0x13d),			0x4a},
+	{ CCI_REG8(0x140),			0x0f},
+	{ CCI_REG8(0x143),			0x38},
+	{ OS02G10_REG_DC_LEVEL_LIMIT_EN,	0x01},
+	{ OS02G10_REG_DC_LEVEL_LIMIT_L,		0x00},
+	{ OS02G10_REG_DC_BLC_LIMIT_H,		0x32},
+	{ CCI_REG8(0x150),			0x01},
+	{ CCI_REG8(0x151),			0x28},
+	{ CCI_REG8(0x152),			0x20},
+	{ CCI_REG8(0x153),			0x03},
+	{ CCI_REG8(0x157),			0x16},
+	{ CCI_REG8(0x159),			0x01},
+	{ CCI_REG8(0x15a),			0x01},
+	{ CCI_REG8(0x15d),			0x04},
+	{ CCI_REG8(0x16a),			0x04},
+	{ CCI_REG8(0x16b),			0x03},
+	{ CCI_REG8(0x16e),			0x28},
+	{ CCI_REG8(0x171),			0xc2},
+	{ CCI_REG8(0x172),			0x04},
+	{ CCI_REG8(0x173),			0x38},
+	{ CCI_REG8(0x174),			0x04},
+	{ CCI_REG8(0x179),			0x00},
+	{ CCI_REG8(0x17a),			0xb2},
+	{ CCI_REG8(0x17b),			0x10},
+	{ OS02G10_REG_HS_LP_CTRL,		0x02},
+	{ OS02G10_REG_HS_LEVEL,			0x03},
+	{ OS02G10_REG_HS_DRV,			0x55},
+	{ CCI_REG8(0x1b8),			0x70},
+	{ CCI_REG8(0x1b9),			0x70},
+	{ CCI_REG8(0x1ba),			0x70},
+	{ CCI_REG8(0x1bb),			0x70},
+	{ CCI_REG8(0x1bc),			0x00},
+	{ CCI_REG8(0x1c4),			0x6d},
+	{ CCI_REG8(0x1c5),			0x6d},
+	{ CCI_REG8(0x1c6),			0x6d},
+	{ CCI_REG8(0x1c7),			0x6d},
+	{ CCI_REG8(0x1cc),			0x11},
+	{ CCI_REG8(0x1cd),			0xe0},
+	{ CCI_REG8(0x1d0),			0x1b},
+	{ CCI_REG8(0x1d2),			0x76},
+	{ CCI_REG8(0x1d3),			0x68},
+	{ CCI_REG8(0x1d4),			0x68},
+	{ CCI_REG8(0x1d5),			0x73},
+	{ CCI_REG8(0x1d6),			0x73},
+	{ CCI_REG8(0x1e8),			0x55},
+	{ OS02G10_REG_GB_SUBOFFSET,		0x40},
+	{ OS02G10_REG_BLUE_SUBOFFSET,		0x40},
+	{ OS02G10_REG_RED_SUBOFFSET,		0x40},
+	{ OS02G10_REG_GR_SUBOFFSET,		0x40},
+	{ OS02G10_REG_ABL_TRIGGER,		0x1c},
+	{ OS02G10_REG_ABL,			0x33},
+	{ CCI_REG8(0x1fc),			0x80},
+	{ CCI_REG8(0x1fe),			0x80},
+	{ CCI_REG8(0x303),			0x67},
+	{ CCI_REG8(0x300),			0x59},
+	{ CCI_REG8(0x304),			0x11},
+	{ CCI_REG8(0x305),			0x04},
+	{ CCI_REG8(0x306),			0x0c},
+	{ CCI_REG8(0x307),			0x08},
+	{ CCI_REG8(0x308),			0x08},
+	{ CCI_REG8(0x309),			0x4f},
+	{ CCI_REG8(0x30b),			0x08},
+	{ CCI_REG8(0x30d),			0x26},
+	{ CCI_REG8(0x30f),			0x00},
+	{ CCI_REG8(0x234),			0xfe},
+	{ OS02G10_REG_MIPI_TX_SPEED_CTRL,	0x05},
+};
+
+static const struct os02g10_mode supported_modes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+		.vts_def = 1246,
+		.exp_def = 1100,
+		.x_start = 2,
+		.y_start = 6,
+	},
+};
+
+static const s64 link_freq_menu_items[] = {
+	OS02G10_LINK_FREQ_720MHZ,
+};
+
+static const char * const os02g10_test_pattern_menu[] = {
+	"Disabled",
+	"Colorbar",
+};
+
+static inline struct os02g10 *to_os02g10(struct v4l2_subdev *sd)
+{
+	return container_of_const(sd, struct os02g10, sd);
+}
+
+static u32 os02g10_get_format_code(struct os02g10 *os02g10)
+{
+	static const u32 codes[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
+		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	};
+
+	return codes[os02g10->vflip->val][os02g10->hflip->val];
+}
+
+static int os02g10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct os02g10 *os02g10 = container_of_const(ctrl->handler,
+						     struct os02g10, handler);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	state = v4l2_subdev_get_locked_active_state(&os02g10->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Honour the VBLANK limits when setting exposure */
+		s64 max = fmt->height + ctrl->val - OS02G10_EXPOSURE_MARGIN;
+
+		ret = __v4l2_ctrl_modify_range(os02g10->exposure,
+					       os02g10->exposure->minimum, max,
+					       os02g10->exposure->step,
+					       os02g10->exposure->default_value);
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_active(os02g10->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
+		cci_write(os02g10->cci, OS02G10_REG_LONG_EXPOSURE,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		cci_write(os02g10->cci, OS02G10_REG_ANALOG_GAIN,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		cci_write(os02g10->cci, OS02G10_REG_DIGITAL_GAIN_L,
+			  (ctrl->val & 0xff), &ret);
+		cci_write(os02g10->cci, OS02G10_REG_DIGITAL_GAIN_H,
+			  ((ctrl->val >> 8) & 0x7), &ret);
+		break;
+	case V4L2_CID_VBLANK: {
+		u64 vts = ctrl->val + fmt->height;
+
+		cci_update_bits(os02g10->cci, OS02G10_REG_FRAME_TEST_CTRL,
+				OS02G10_FRAME_EXP_SEPERATE_EN,
+				OS02G10_FRAME_EXP_SEPERATE_EN, &ret);
+		cci_write(os02g10->cci, OS02G10_REG_FRAME_LENGTH, vts, &ret);
+		break;
+	}
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		cci_write(os02g10->cci, OS02G10_REG_FLIP_MIRROR,
+			  os02g10->hflip->val | os02g10->vflip->val << 1, &ret);
+		cci_write(os02g10->cci, OS02G10_REG_SIF_CTRL,
+			  OS02G10_ORIENTATION_BAYER_FIX, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		cci_update_bits(os02g10->cci,
+				OS02G10_REG_FRAME_TEST_CTRL,
+				OS02G10_TEST_PATTERN_ENABLE,
+				ctrl->val ? OS02G10_TEST_PATTERN_ENABLE : 0,
+				&ret);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	cci_write(os02g10->cci, OS02G10_REG_FRAME_SYNC, 0x01, &ret);
+
+	pm_runtime_put(os02g10->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops os02g10_ctrl_ops = {
+	.s_ctrl = os02g10_set_ctrl,
+};
+
+static int os02g10_init_controls(struct os02g10 *os02g10)
+{
+	const struct os02g10_mode *mode = &supported_modes[0];
+	struct v4l2_fwnode_device_properties props;
+	u64 vblank_def, exp_max, pixel_rate;
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_ctrl *link_freq;
+	int ret;
+
+	ret = v4l2_fwnode_device_parse(os02g10->dev, &props);
+	if (ret)
+		return ret;
+
+	ctrl_hdlr = &os02g10->handler;
+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+
+	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
+	pixel_rate = div_u64(OS02G10_LINK_FREQ_720MHZ * 2 * OS02G10_DATA_LANES, 10);
+	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops, V4L2_CID_PIXEL_RATE, 0,
+			  pixel_rate, 1, pixel_rate);
+
+	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os02g10_ctrl_ops,
+					   V4L2_CID_LINK_FREQ,
+					   ARRAY_SIZE(link_freq_menu_items) - 1,
+					   0, link_freq_menu_items);
+
+	vblank_def = mode->vts_def - mode->height;
+	os02g10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+					    V4L2_CID_VBLANK, vblank_def,
+					    OS02G10_FRAME_LENGTH_MAX - mode->height,
+					    1, vblank_def);
+
+	exp_max = mode->vts_def - OS02G10_EXPOSURE_MARGIN;
+	os02g10->exposure =
+		v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+				  V4L2_CID_EXPOSURE,
+				  OS02G10_EXPOSURE_MIN, exp_max,
+				  OS02G10_EXPOSURE_STEP, mode->exp_def);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+			  V4L2_CID_ANALOGUE_GAIN, OS02G10_ANALOG_GAIN_MIN,
+			  OS02G10_ANALOG_GAIN_MAX, OS02G10_ANALOG_GAIN_STEP,
+			  OS02G10_ANALOG_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+			  V4L2_CID_DIGITAL_GAIN, OS02G10_DIGITAL_GAIN_MIN,
+			  OS02G10_DIGITAL_GAIN_MAX, OS02G10_DIGITAL_GAIN_STEP,
+			  OS02G10_DIGITAL_GAIN_DEFAULT);
+
+	os02g10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	os02g10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os02g10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(os02g10_test_pattern_menu) - 1,
+				     0, 0, os02g10_test_pattern_menu);
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr,
+					      &os02g10_ctrl_ops, &props);
+	if (ret)
+		goto err_handler_free;
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		goto err_handler_free;
+	}
+
+	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	os02g10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	os02g10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	os02g10->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+err_handler_free:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int os02g10_set_framefmt(struct os02g10 *os02g10,
+				struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *format;
+	const struct os02g10_mode *mode;
+	int ret = 0;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes), width,
+				      height, format->width, format->height);
+
+	cci_write(os02g10->cci, OS02G10_REG_V_START, mode->y_start, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_V_SIZE, mode->height, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, mode->height, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_H_START, mode->x_start, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_H_SIZE, mode->width, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, mode->width, &ret);
+
+	return ret;
+}
+
+static int os02g10_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(os02g10->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = cci_multi_reg_write(os02g10->cci, os02g10_common_regs,
+				  ARRAY_SIZE(os02g10_common_regs), NULL);
+	if (ret) {
+		dev_err(os02g10->dev, "failed to write common registers\n");
+		goto err_rpm_put;
+	}
+
+	ret = os02g10_set_framefmt(os02g10, state);
+	if (ret) {
+		dev_err(os02g10->dev, "failed to set frame foramt\n");
+		goto err_rpm_put;
+	}
+
+	/* Apply customized values from user */
+	ret = __v4l2_ctrl_handler_setup(os02g10->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	ret = cci_write(os02g10->cci, OS02G10_REG_STREAM_CTRL,
+			OS02G10_STREAM_CTRL_ON, NULL);
+	if (ret)
+		goto err_rpm_put;
+
+	/* vflip and hflip cannot change during streaming */
+	__v4l2_ctrl_grab(os02g10->vflip, true);
+	__v4l2_ctrl_grab(os02g10->hflip, true);
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(os02g10->dev);
+	return ret;
+}
+
+static int os02g10_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+	int ret;
+
+	ret = cci_write(os02g10->cci, OS02G10_REG_STREAM_CTRL,
+			OS02G10_STREAM_CTRL_OFF, NULL);
+	if (ret)
+		dev_err(os02g10->dev, "Failed to stop stream\n");
+
+	__v4l2_ctrl_grab(os02g10->vflip, false);
+	__v4l2_ctrl_grab(os02g10->hflip, false);
+
+	pm_runtime_put(os02g10->dev);
+
+	return ret;
+}
+
+static int os02g10_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r = os02g10_native_area;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = os02g10_active_area;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int os02g10_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+
+	if (code->index)
+		return -EINVAL;
+
+	code->code = os02g10_get_format_code(os02g10);
+
+	return 0;
+}
+
+static int os02g10_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+
+	if (fse->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	if (fse->code != os02g10_get_format_code(os02g10))
+		return -EINVAL;
+
+	fse->min_width = supported_modes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = supported_modes[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int os02g10_set_pad_format(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+	struct v4l2_mbus_framefmt *format;
+	const struct os02g10_mode *mode;
+
+	format = v4l2_subdev_state_get_format(sd_state, 0);
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	fmt->format.code = os02g10_get_format_code(os02g10);
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	*format = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		u32 vblank_def = mode->vts_def - mode->height;
+
+		return __v4l2_ctrl_modify_range(os02g10->vblank, vblank_def,
+						OS02G10_FRAME_LENGTH_MAX -
+						mode->height, 1, vblank_def);
+	}
+
+	return 0;
+}
+
+static int os02g10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.format = {
+			.width = supported_modes[0].width,
+			.height = supported_modes[0].height,
+		},
+	};
+
+	return os02g10_set_pad_format(sd, state, &fmt);
+}
+
+static const struct v4l2_subdev_video_ops os02g10_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops os02g10_pad_ops = {
+	.enum_mbus_code = os02g10_enum_mbus_code,
+	.enum_frame_size = os02g10_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = os02g10_set_pad_format,
+	.get_selection = os02g10_get_selection,
+	.enable_streams = os02g10_enable_streams,
+	.disable_streams = os02g10_disable_streams,
+};
+
+static const struct v4l2_subdev_ops os02g10_subdev_ops = {
+	.video = &os02g10_video_ops,
+	.pad = &os02g10_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops os02g10_internal_ops = {
+	.init_state = os02g10_init_state,
+};
+
+static int os02g10_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os02g10 *os02g10 = to_os02g10(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(os02g10_supply_name),
+				    os02g10->supplies);
+	if (ret) {
+		dev_err(os02g10->dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	/* Wait for T3/T4 timing requirements after supplies become stable */
+	fsleep(5 * USEC_PER_MSEC);
+
+	ret = clk_prepare_enable(os02g10->xclk);
+	if (ret)
+		goto err_regulator_off;
+
+	gpiod_set_value_cansleep(os02g10->reset_gpio, 0);
+
+	/* T5: delay from sensor power up stable to SCCB initialization */
+	fsleep(5 * USEC_PER_MSEC);
+
+	return 0;
+
+err_regulator_off:
+	regulator_bulk_disable(ARRAY_SIZE(os02g10_supply_name), os02g10->supplies);
+
+	return ret;
+}
+
+static int os02g10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os02g10 *os02g10 = to_os02g10(sd);
+
+	clk_disable_unprepare(os02g10->xclk);
+	gpiod_set_value_cansleep(os02g10->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(os02g10_supply_name), os02g10->supplies);
+
+	return 0;
+}
+
+static int os02g10_identify_module(struct os02g10 *os02g10)
+{
+	u64 chip_id;
+	int ret;
+
+	ret = cci_read(os02g10->cci, OS02G10_REG_CHIPID, &chip_id, NULL);
+	if (ret)
+		return dev_err_probe(os02g10->dev, ret,
+				     "failed to read chip id %x\n",
+				     OS02G10_CHIPID);
+
+	if (chip_id != OS02G10_CHIPID)
+		return dev_err_probe(os02g10->dev, -EIO,
+				     "chip id mismatch: %x!=%llx\n",
+				     OS02G10_CHIPID, chip_id);
+
+	return 0;
+}
+
+static int os02g10_parse_endpoint(struct os02g10 *os02g10)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	unsigned long link_freq_bitmap;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(os02g10->dev), NULL);
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	ret = v4l2_link_freq_to_bitmap(os02g10->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items),
+				       &link_freq_bitmap);
+
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+};
+
+static const struct regmap_range_cfg os02g10_ranges[] = {
+	{
+		.range_min      = 0x0000,
+		.range_max      = 0x03ff,
+		.selector_reg   = 0xfd,
+		.selector_mask  = 0x03,
+		.selector_shift = 0,
+		.window_start   = 0x00,
+		.window_len     = 0x100,
+	},
+};
+
+static const struct regmap_config os02g10_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = 0x3ff,
+	.ranges = os02g10_ranges,
+	.num_ranges = ARRAY_SIZE(os02g10_ranges),
+	.disable_locking = true,
+};
+
+static int os02g10_probe(struct i2c_client *client)
+{
+	struct os02g10 *os02g10;
+	unsigned int xclk_freq;
+	int ret;
+
+	os02g10 = devm_kzalloc(&client->dev, sizeof(*os02g10), GFP_KERNEL);
+	if (!os02g10)
+		return -ENOMEM;
+
+	os02g10->dev = &client->dev;
+
+	v4l2_i2c_subdev_init(&os02g10->sd, client, &os02g10_subdev_ops);
+	os02g10->sd.internal_ops = &os02g10_internal_ops;
+
+	/*
+	 * This is not using devm_cci_regmap_init_i2c(), because the driver
+	 * makes use of regmap's pagination feature. The chosen settings are
+	 * compatible with the CCI helpers.
+	 */
+	os02g10->cci = devm_regmap_init_i2c(client, &os02g10_regmap_config);
+	if (IS_ERR(os02g10->cci))
+		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->cci),
+				     "failed to initialize CCI\n");
+
+	ret = os02g10_parse_endpoint(os02g10);
+	if (ret)
+		return dev_err_probe(os02g10->dev, ret,
+				     "failed to parse endpoint configuration\n");
+
+	/* Get system clock (xvclk) */
+	os02g10->xclk = devm_v4l2_sensor_clk_get(os02g10->dev, NULL);
+	if (IS_ERR(os02g10->xclk))
+		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->xclk),
+				     "failed to get xclk\n");
+
+	xclk_freq = clk_get_rate(os02g10->xclk);
+	if (xclk_freq != OS02G10_XCLK_FREQ_24MHZ)
+		return dev_err_probe(os02g10->dev, -EINVAL,
+				     "xclk frequency not supported: %u Hz\n",
+				     xclk_freq);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(os02g10_supply_name); i++)
+		os02g10->supplies[i].supply = os02g10_supply_name[i];
+
+	ret = devm_regulator_bulk_get(os02g10->dev,
+				      ARRAY_SIZE(os02g10_supply_name),
+				      os02g10->supplies);
+	if (ret)
+		return dev_err_probe(os02g10->dev, ret,
+				     "failed to get regulators\n");
+
+	os02g10->reset_gpio = devm_gpiod_get_optional(os02g10->dev,
+						      "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(os02g10->reset_gpio))
+		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	ret = os02g10_power_on(os02g10->dev);
+	if (ret)
+		return ret;
+
+	ret = os02g10_identify_module(os02g10);
+	if (ret)
+		goto error_power_off;
+
+	ret = os02g10_init_controls(os02g10);
+	if (ret)
+		goto error_power_off;
+
+	/* Initialize subdev */
+	os02g10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	os02g10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	os02g10->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&os02g10->sd.entity, 1, &os02g10->pad);
+	if (ret) {
+		dev_err_probe(os02g10->dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
+
+	os02g10->sd.state_lock = os02g10->handler.lock;
+	ret = v4l2_subdev_init_finalize(&os02g10->sd);
+	if (ret) {
+		dev_err_probe(os02g10->dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
+
+	pm_runtime_set_active(os02g10->dev);
+	pm_runtime_enable(os02g10->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&os02g10->sd);
+	if (ret) {
+		dev_err_probe(os02g10->dev, ret,
+			      "failed to register os02g10 sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	pm_runtime_idle(os02g10->dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&os02g10->sd);
+	pm_runtime_disable(os02g10->dev);
+	pm_runtime_set_suspended(os02g10->dev);
+
+error_media_entity:
+	media_entity_cleanup(&os02g10->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(os02g10->sd.ctrl_handler);
+
+error_power_off:
+	os02g10_power_off(os02g10->dev);
+
+	return ret;
+}
+
+static void os02g10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct os02g10 *os02g10 = to_os02g10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(&os02g10->sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(os02g10->sd.ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		os02g10_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(os02g10_pm_ops,
+				 os02g10_power_off, os02g10_power_on, NULL);
+
+static const struct of_device_id os02g10_id[] = {
+	{ .compatible = "ovti,os02g10" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, os02g10_id);
+
+static struct i2c_driver os02g10_driver = {
+	.driver = {
+		.name = "os02g10",
+		.pm = pm_ptr(&os02g10_pm_ops),
+		.of_match_table = os02g10_id,
+	},
+	.probe = os02g10_probe,
+	.remove = os02g10_remove,
+};
+module_i2c_driver(os02g10_driver);
+
+MODULE_DESCRIPTION("OS02G10 Camera Sensor Driver");
+MODULE_AUTHOR("Tarang Raval <tarang.raval@siliconsignals.io>");
+MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");
+MODULE_LICENSE("GPL");
--
2.34.1

