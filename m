Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42322BEFEB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440649; cv=none; b=cLQH29NumiwoHm9Ivs73fYwHc8CQXA2wHcpZQv/OTjUiWOudT17oIGMBRoz5N5rtTWyYlnXSuY5LBPNDye+GSUmfbLuhmC/arsCMemVlv5KMgAoj/0VQ5GGtSBo25CdYRQY3nUhxD2xHzP9sk4Hn34XSqDvQq+GIBCjyyzUCcoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440649; c=relaxed/simple;
	bh=wxmxFNTxmH1BxvnW9OL8EFs3pxurc8AKng1CYfcu7cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SulFBFa6xp6t90BkpCofnsXxe1E0DXDaFcFVAiOJVaOLqCEluAOdIBxhuwYp/pZkA6DP9MSEIW2GEyAMi/HO3Ly7ifa3VMuRFmhSyMV+hzSM9GVHsdmK6wbqgJHZuNiuQBzNHD6j/uXkw2XaHPuvIcSMMp7zQy9lCPr/RN4QJdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FeyOr4gi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kiz/qIRP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FeyOr4gi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kiz/qIRP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUlO1157585
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=; b=FeyOr4giye6W5f8z
	zrE5CcqogXB8cYFvlhIH2oB27Ao66teMU+PA+kYMenAxOCCXviVCCsPbH+KE6xNN
	oMmWDxj/aACsgMBvtsUAgQMyWxEoPO/why+Re8blixn6QJASCSnMd4MAnwoduXUs
	y+Icdv4bGq639NejGrV0WNQYQ5mHNTf4LTvdMWPOtUwV1gM8j6qPMKsD8JVmZVIi
	GuKZjQEwowi50fnKR5E2GIQFA7VgitCaHzlbDDCrt0B4prfEVRzNY9AYYGSU0TXV
	ii0/H6zkVrLN7y/WcyYirZLcB/wQ1nhKabQOXJ5aA2OVPK7dih/7gWCd2B2DTpNH
	ZYxLrA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51esf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:24:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a470ead068so4563676a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440645; x=1792045445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=;
        b=kiz/qIRPWk0Mf06gkMD3lzka2/cxOrqE7w13trt8UQyWUp3hJ63qAC/WuRxXv5Lj61
         GGbZVV/YF6d8cEVc3iqWxVl8OV+moOEAoSP1vXaSJ519DJjyAdHfbgdg1C5Y0WYfrjUC
         trlccv07uurP6O0H3Cc79muV7FNpT9UgFdtHkR62vuDoG2FSrvALS+xL5y4DO5+XpyA8
         n3Uek2Er9fS/JRBmqhMoe0bJarl/DXOl0qnzK5eyNzPJ10yUkUf04A5N11YTnMd7zXO2
         5Ygo4OiDz8UamEAiMFsBvY+FwU31qaZ8nOoB6OLYgl3RZEqw7XBe39eYQSq1lUI2Mmx+
         cmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440645; x=1792045445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=;
        b=Ptj3cU/dL4UsPRL49RJ/32fKhC0tMjd3CuhuwXGi8QaFP7OgBZApN7Nvu71ny25A5i
         ljOopPJdKkv8bncRlhxcnQPSN7xexbwIO2mNJ0+aK99F8rROXzIJl1tYNHH8v1Mm0kzA
         KJzDQoCi1mYo5vbSY7la5DCohgCYuFIXQjEyB7g+0p6S4vn8jLfArDRpC62lQLJ8sE4A
         iq3zgjdwieH+KcbuoV1HLZ0YILBG2u05lExPZLrdvsTVuoLuaEN+hCamPAQJjTxrd98J
         2rYrOpKsqoFDj2I7bWKkCndtGOutYHsT/1jKtBkNHyDmpptlKX7AzpBlXNH0HOEN7nWz
         4UCg==
X-Forwarded-Encrypted: i=1; AKwUvBwL+S5k5OyidAcYt6MNsARCbTtQss6qYfL6Sq4ps31llHkDQmKKtpFEFarBrXo1wjtOTHwwtZt0AaUTvQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPuxPseDjEptH5jNkh/WoEj7Q5JKxmXUr0tcERLLDEXV/RkVqM
	tDseFHuc0g24xvUdcUi/e1DBDsmh0nVSc2rTbni8SFCKYOuuA6PyV1y2UNy+fxsUNlONAPj1TKy
	GnVcMJfTq6lA4QfW5M/a461DOkOu3XZ/H6hqKGWwrtbRjvv6UPbupCR4dF02TVdtmhcA=
X-Gm-Gg: AYBFou15ITB0z4HCfiFxGmYVvzxTsVSBaWAe3J+rof9Ux8nVCD1XTfL0eKtG2Rzb2OG
	DxNblKQ958MCgOihs/Z7Vz7kiYjdJfMkmYWXc9CCINBnfWQWwnQdRY5T/Lt2XDBNFnMc4O7WsZd
	oQNpbrww+ziaPyb4TwZTAyWmISrfkZNJL9hsZ0r18jBrWmsNOAxnNjH0S+fRGWAPG1sJ8cWJdt9
	4nNJ+kx1p29psfL3Fl10hVOLv0iS0hJ7bDehxYhs7m1l0P7AcIil4sKavCvYZ/gTd8VYfZURmhb
	XqOpLDUAruOP8vzlpAfjIvO/3Fm/vQB8o0CVqS1r+u5+Gsf/8PzJLiIs/pHzh1AGU7DkvMDSIkL
	6POkuc/eg05aYbmdcon/1VknjwrgE
X-Received: by 2002:a17:90b:4ac4:b0:3a2:b038:c931 with SMTP id 98e67ed59e1d1-3a8a0e0af39mr3608606a91.40.1791440645303;
        Wed, 07 Oct 2026 23:24:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac4:b0:3a2:b038:c931 with SMTP id 98e67ed59e1d1-3a8a0e0af39mr3608593a91.40.1791440644766;
        Wed, 07 Oct 2026 23:24:04 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:04 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:46 +0530
Subject: [PATCH v7 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-2-90d278bd7414@oss.qualcomm.com>
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
In-Reply-To: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=8314;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=wxmxFNTxmH1BxvnW9OL8EFs3pxurc8AKng1CYfcu7cA=;
 b=6KJfOR6MzZ14Svtl8d26C5ZSNOzmcE8hQOqtgdBfklw8/DGilYTorQXhtpiIZPmpL96XsqJF2
 2kf37tIlea0D+DFWkODvzZ24wml8rbxqS/UWufRsoqGgnMK/AFuO92t
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: RRV0UUuOKXj0DIh9kqlCCOSR-vqpviOm
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac73706 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h4jUYMdnt1ASHzOZM6YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX4JYbB3WSNBTX
 nQV+riMThJILX8LoMAYzuXayEmn6+vbNUMNnLQHjFafOmG8VrKnjwbHZbvZK+PCAyDbI7ouxtyL
 7Za7DyhmEXTag2QdwRtxSLVpeGGw0Vo=
X-Proofpoint-GUID: RRV0UUuOKXj0DIh9kqlCCOSR-vqpviOm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfXw2Hin2lLVMII
 GZkqa58kwaOZW0Dc5vJBnAvgPuRgJejkg5+/sCQ9eI0jB2rLFzUZi6P37rsFoAIAPUUYmQRu8jy
 EUNI5cGKhRNQc6qjZjv6PyFRCqWcD+9LY79cF4hCJ2mRU7Wb82YNniUDMXNc9TKK30oTlz0L+kK
 IHpNlF+YrK39dzZVs1LCsw0dyHZlZHvek9KZIceaumFplrg1IGv0AwWaGmEXAa94NyVEO7QBlLf
 Xo6pDCO9tF2Mw8PQcxw4++78cxcd5dZDKqbQIp8HxnyqXpfNBOZBzWqRStIT5QdsewhY40ck6YR
 n2SnpCwHfm4ZtSmI1Veor/z1TdwUMKNGlRbveH+rQsplaNjYXAOsz9+wpP6SFxmPPOQcqpsrYZt
 qZ3BEggBD7pJ2pBd7fbf+6u5ivmoHbtDZxUHWCuzdtfS2WyvHivfFpefdrfliC0L/lJuwHivzSW
 bETmHVD8eg6EZiv+SDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080025

The Sahara protocol driver currently lives under the QAIC accelerator
subsystem even though the protocol is transported over MHI and is used by
multiple Qualcomm flashless devices. This makes Sahara appear QAIC specific
and complicates reuse by other MHI based devices.

Move the Sahara protocol driver under drivers/bus/mhi as a host client
driver and build it as an independent MHI protocol driver. This keeps the
QAIC driver focused on the accelerator device while allowing other MHI
users to enable Sahara without depending on QAIC.

As part of the move, add a dedicated Kconfig/Makefile hierarchy under the
MHI host client drivers and convert the driver to use module_mhi_driver()
instead of register/unregister hooks.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/Kconfig                           |  1 +
 drivers/accel/qaic/Makefile                          |  3 +--
 drivers/accel/qaic/qaic_drv.c                        |  9 ---------
 drivers/accel/qaic/sahara.h                          | 10 ----------
 drivers/bus/mhi/Kconfig                              |  1 +
 drivers/bus/mhi/host/Makefile                        |  1 +
 drivers/bus/mhi/host/clients/Kconfig                 |  5 +++++
 drivers/bus/mhi/host/clients/Makefile                |  1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig          | 15 +++++++++++++++
 drivers/bus/mhi/host/clients/sahara/Makefile         |  2 ++
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c    | 20 +++++++-------------
 11 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..af90fdfcf77eeb6dd5ad309b33d793d4fdc91b1e 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
+	depends on MHI_SAHARA
 	select CRC32
 	select WANT_DEV_COREDUMP
 	help
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -13,7 +13,6 @@ qaic-y := \
 	qaic_ras.o \
 	qaic_ssr.o \
 	qaic_sysfs.o \
-	qaic_timesync.o \
-	sahara.o
+	qaic_timesync.o
 
 qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..3907b13e426064f4fa069e803cc44462feea4063 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -32,7 +32,6 @@
 #include "qaic_ras.h"
 #include "qaic_ssr.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -791,12 +790,6 @@ static int __init qaic_init(void)
 		goto free_pci;
 	}
 
-	ret = sahara_register();
-	if (ret) {
-		pr_debug("qaic: sahara_register failed %d\n", ret);
-		goto free_mhi;
-	}
-
 	ret = qaic_timesync_init();
 	if (ret)
 		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
@@ -818,7 +811,6 @@ static int __init qaic_init(void)
 
 free_bootlog:
 	qaic_bootlog_unregister();
-free_mhi:
 	mhi_driver_unregister(&qaic_mhi_driver);
 free_pci:
 	pci_unregister_driver(&qaic_pci_driver);
@@ -847,7 +839,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
deleted file mode 100644
index 640208acc0d13d423bd9220e6861b7c141af74ff..0000000000000000000000000000000000000000
--- a/drivers/accel/qaic/sahara.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
-
-#ifndef __SAHARA_H__
-#define __SAHARA_H__
-
-int sahara_register(void);
-void sahara_unregister(void);
-#endif /* __SAHARA_H__ */
diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index b39a11e6c624ba00349cca22d74bd876020590ab..720115218c2401c99b29f79bbd4113cd877503ac 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -7,3 +7,4 @@
 
 source "drivers/bus/mhi/host/Kconfig"
 source "drivers/bus/mhi/ep/Kconfig"
+source "drivers/bus/mhi/host/clients/Kconfig"
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2e8949f1a2fe6f3f3b2e1dc541f97d2c393d6a0f 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-$(CONFIG_MHI_BUS) += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..a4f2a3c1d20c887cc474646ea91532d775a13f57
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -0,0 +1,5 @@
+menu "MHI host client drivers"
+
+source "drivers/bus/mhi/host/clients/sahara/Kconfig"
+
+endmenu
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..62e2fa161565225be7f6a23d3cdf4f2f169cb7ce
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MHI_SAHARA) += sahara/
diff --git a/drivers/bus/mhi/host/clients/sahara/Kconfig b/drivers/bus/mhi/host/clients/sahara/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..f1fc7013a2dee0be645c50f32305659e591de7e7
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/sahara/Kconfig
@@ -0,0 +1,15 @@
+config MHI_SAHARA
+	tristate "Sahara protocol driver"
+	depends on MHI_BUS
+	help
+	  Enable support for the Sahara protocol transported over the MHI bus.
+
+	  The Sahara protocol is used to transfer firmware images, retrieve
+	  memory dumps and exchange command mode DDR calibration data between
+	  host and device. This driver is not tied to a specific SoC and may be
+	  used by multiple MHI based devices.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called mhi_sahara.
diff --git a/drivers/bus/mhi/host/clients/sahara/Makefile b/drivers/bus/mhi/host/clients/sahara/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/sahara/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
+mhi_sahara-y := sahara.o
diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
similarity index 99%
rename from drivers/accel/qaic/sahara.c
rename to drivers/bus/mhi/host/clients/sahara/sahara.c
index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..858dc5bc39c1ad42922cabef3b1abcd43bc4f0f4 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
@@ -13,8 +15,6 @@
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -923,13 +923,7 @@ static struct mhi_driver sahara_mhi_driver = {
 		.name = "sahara",
 	},
 };
+module_mhi_driver(sahara_mhi_driver);
 
-int sahara_register(void)
-{
-	return mhi_driver_register(&sahara_mhi_driver);
-}
-
-void sahara_unregister(void)
-{
-	mhi_driver_unregister(&sahara_mhi_driver);
-}
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm Sahara MHI protocol driver");

-- 
2.34.1

