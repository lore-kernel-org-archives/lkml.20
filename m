Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912E4CE68D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829104; cv=none; b=s28/JOdxpv+j+a5TK9zxraswVefoo9L3sK+uzhQgkHaeoA0l/7kmEPfbjrhpptb8NATlQ0tTo4w18Wk5u3OO7/4XWjh0LtWGiYcxxxT3yFXQRLjdHWuw9yNI5WLHSxPmy2EcC3DYHcePd7S/0DZmUv4stm30s7Y/W9CkbfcAFnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829104; c=relaxed/simple;
	bh=otXVSurn9WsDOA977t6Y5Qwqxk6Pm0fZvFDTUT1u9c0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMq6dMe2/xo10iI0MVpuLBG05YDRQztNPehHjj4FasKpfOajoIvdB7M5zJe13QLxlfFmxtgZFt1im/0k6f9bCYgMpjCEX7Y+QER6gG5xVeFkoopjjzfNS4AZywlWQVWM91Ywu8pIUD8Mn/0kULqYIIcMdxQFiIqF8t6jnjEoCrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzBWJ4ba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMO/sLAW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzBWJ4ba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMO/sLAW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv2UU1591650
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVI5CEirgjq82tfVffqDikfz3jlDY55roUmiPU+0Vys=; b=OzBWJ4baip6gUv9Z
	Qpu1YuapH8lauvVoMwZdtIy0t9Q1dtzQ/Y/OGBv/cz5nI09SNOPSL0MmYIjgN7Yy
	1vJAeptVG+oE73NoUh8JzjAzcUxSAjvs0sJ+gt0EOkb45DwC+jeNs+8kvfvacl80
	rWsQaGtw874drdSCdMQ5KghIVAXjsmhN+pWkH/k+RXbTe2KYnxqlSpY424HVoocj
	MWTFknvYsx1wNnfZLFpAPdV3ZjE/3NCrTDMx8uNXQyY+U7q9oJpS8YVLubH2WYzz
	JgDsVpj8c603BO4hIDgmqiWJysYSRErYEXu6vRgrnvGItwpzxxeEduqCv8m7kbKu
	3embNg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfct60c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:18:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4391546eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829101; x=1792433901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVI5CEirgjq82tfVffqDikfz3jlDY55roUmiPU+0Vys=;
        b=BMO/sLAWoIWS6a03WAQ1QHck6aflC63imVOQzpFNbIAeHobsuxa9TdClZTYueaR2mv
         8a2vVQTmRm9P83R4SvqUSee4tFRLeEvUN5Tyes211oOSZKJe/7+Box4jTPMOhngp1HE8
         pOHsKd1pTXRwhzLxh12PYaG2rUM9VCdBTsjTU/wIZ+1oItVDUxzu7hpjXiqOyPhBp798
         QhewjtkqrOB3e60ZFD9MBz+3wo3tmKxpnzeXn5V5PolUwdf9mPAAdu3bcU07wIRT1ueU
         pRoahCU/N5kayR4TEA0kTNn8a/EQEAEsOikY8tYmHxdF8/KOWyQQk5HYC2XqwcsLlgUM
         DHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829101; x=1792433901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVI5CEirgjq82tfVffqDikfz3jlDY55roUmiPU+0Vys=;
        b=UQ/x5S79mLib1zGx0VS2Qw+Fr5bvqmB8sZbCnw3/BT7NBPlwFoXJqWd51lXy9cYOeo
         DCfK6QKflU9LYZPh38V4kNmLtfrTsOZ0BaTDFUwicYJ01pWmsZ9lYj+xGmkhKfiH5sOR
         VwjCYBogCNN7CiVtaAQ+WjPc5iaTwi/rwUlvKWSk+exdakPmGBUR7PxTLEEhTzNh+aFO
         XtZcu2lz4iJDE5nQJVi/tjK8y+jxuXYhNBoOBM0NrhnP/vn3TEqhbZ9xLW88FNtLRxub
         lQa1Y71M/1T/Bb5TX/puCV2PVsqMGhReUzyQ0wEbzYaBZYCsi8gfMXW47dxpL+Hr60KZ
         M4yg==
X-Forwarded-Encrypted: i=1; AKwUvBzxpwDLLqUa7oN1AogfUPXlegjb3koSH9MjzXRsa9l1u0LN1A3HN2sS2c9R4k5HclMr7+/hlbaLEHLG6bA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/62D3MDo/yORfiXoigk+BAyQz+IlgtbrWBPfXPB58ovwCH4bj
	AAUHcf1ekEGppnudSuZRW1Tr8wTYry2tILuwVzZ+Gy9RQ4yGgbCcN+6mlEjoh4Rz4jT8suHtMiI
	q7nc7TWUWCs/g6udNEZ0GIxJIRcSu2tJsCUw6qvuXuSTCAZlO0R5GajKpa21LwpB0/MI=
X-Gm-Gg: AYBFou3CcajMUAj8QWaVaJ+EIMl1fnyS5O507pBegVPIXvFLVSTWMWk/8QUy4FEDbRf
	e1qSPCULwnXxsI0kQxuXb8pnxAHhjGr+BL3AXa/wsUQ2twaWoi6KbmO1XnB8FJP4JktrNoPKPut
	pzApZHXED4j3PgpFCmwZlOPx8rAyjXROHJjkGQEmQ7DEJIUb+eQpmUcuMasxKdUppLirHAVNad1
	zulyWuhyaR9bOWQ4gsqlr6PUqSmsk+VExm10QpqSbE5uJ4jgSlm91WKo2sJaq4kScyonQOoQjWh
	aHlSCCrXl+tWLqA2O+RFD6ke0+XwTn0L9XPmTZa+hebPJo51a6KRQQl57HE104Efcd+abaaLnNm
	fP/BHG0rcxSP/eKA0uFcHSWY0hJ0B
X-Received: by 2002:a05:7300:7fa3:b0:351:4b90:ba01 with SMTP id 5a478bee46e88-3537e086a2bmr17652939eec.15.1791829100952;
        Mon, 12 Oct 2026 11:18:20 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa3:b0:351:4b90:ba01 with SMTP id 5a478bee46e88-3537e086a2bmr17652891eec.15.1791829100253;
        Mon, 12 Oct 2026 11:18:20 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:19 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:00 +0530
Subject: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=8288;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=otXVSurn9WsDOA977t6Y5Qwqxk6Pm0fZvFDTUT1u9c0=;
 b=0wwL70/jEopgIlLia3e1QYwwQht1T1MadvDu3R5vESLxqP2reRqk8IzJqMcDdadQfhMEe9fSn
 f4aONVeiTdnAl6a9fM7Y+heJk3+RmzQ4WnTdegqn4HqJGbH6fecsDfx
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: H6CfzXpAzajiv6It1_l6nMw7frPHrM0W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX/sSStFqoW+ft
 qNsyckMP+qu5ugmo6pq1dCWMfwF5RBf/IngHEtlMKq/7I0+RqwNA0S13QBkrjgyg5QBTuxvdXwQ
 j4SPGJBAGhyIuqXE4WedJ1Ufw2i7vDM=
X-Proofpoint-ORIG-GUID: H6CfzXpAzajiv6It1_l6nMw7frPHrM0W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX8JbMivCHbxkO
 fUBnqcIfTw3xLe3lQF4HR4NqLYGk6gknqO0mRv/FR0dRKaGGBb6Yv1hUz1uv4gV7NEgxjSHYnAK
 rF8vwtebkGVwz658QFuDMLS81UMy34LgrVgpnkXGIuGvfLWKL7NU/MOLte7xP7W5ZtC1UB41aR2
 UVBoh11k37oI0I5u4B6U5AU9gQC+qVzTnoagoDwKnHQ4zd9e8Vdrj+17WUbPtCiveSwwQWFzynr
 YIUQEB07VKeY/enz2Pm9b4BXAQmAN4mL1aMC9RKHZvLW5Pql9fA/yPyUnhcqpBnyADb0xEx0SbS
 O0VyNA0mlmVoBFMwFLIFCuJbanNCbcVsyU7xCRkMSNiUAmGqhP19jj39BoABLmqlDCtQsTkwtmp
 datB/aoyBOChIQ4Thy2uTNei96371VxR4nCadQ/mh/9KwYeKHq0ef8uhKp7OAetLPineshR/5xr
 Yb8VnwLL7Zjb7lUuVJQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd246d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YsTF_x4DAHpo6Sg_WHoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072

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
 drivers/accel/qaic/Kconfig                          |  1 +
 drivers/accel/qaic/Makefile                         |  3 +--
 drivers/accel/qaic/qaic_drv.c                       |  9 ---------
 drivers/accel/qaic/sahara.h                         | 10 ----------
 drivers/bus/mhi/host/Makefile                       |  2 +-
 drivers/bus/mhi/host/clients/Kconfig                |  6 ++++++
 drivers/bus/mhi/host/clients/Makefile               |  1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig         | 15 +++++++++++++++
 drivers/bus/mhi/host/clients/sahara/Makefile        |  2 ++
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c   | 21 ++++++++-------------
 10 files changed, 35 insertions(+), 35 deletions(-)

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
index 0acf6cdd44f81430ec52c7120b8b50c60721a615..64e87dfaa560376ecdf1e6f8bf7abf6153160926 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -32,7 +32,6 @@
 #include "qaic_ras.h"
 #include "qaic_ssr.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -789,12 +788,6 @@ static int __init qaic_init(void)
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
@@ -816,7 +809,6 @@ static int __init qaic_init(void)
 
 free_bootlog:
 	qaic_bootlog_unregister();
-free_mhi:
 	mhi_driver_unregister(&qaic_mhi_driver);
 free_pci:
 	pci_unregister_driver(&qaic_pci_driver);
@@ -845,7 +837,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
deleted file mode 100644
index 08037281c80e28f6c85b924c45ce2c2f9dc60c39..0000000000000000000000000000000000000000
--- a/drivers/accel/qaic/sahara.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
-
-#ifndef __SAHARA_H__
-#define __SAHARA_H__
-
-int sahara_register(void);
-void sahara_unregister(void);
-#endif /* __SAHARA_H__ */
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 2a16008aeb38127494782bbff4e1656428d2b776..2e8949f1a2fe6f3f3b2e1dc541f97d2c393d6a0f 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,4 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
-obj-y += clients/
+obj-$(CONFIG_MHI_BUS) += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
index 8bb5715e61d0d6e64a51012b4e1594ba46e5bfc1..1932344157a5b1dc25c8d63f6d4ac38f896d08a7 100644
--- a/drivers/bus/mhi/host/clients/Kconfig
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -15,3 +15,9 @@ config MHI_BUS_LOOPBACK
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called mhi_loopback.
+
+menu "MHI host client drivers"
+
+source "drivers/bus/mhi/host/clients/sahara/Kconfig"
+
+endmenu
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
index 3811b6928f42b38f94b1167941cf3b0fe512d32b..67e70de280369870164b4808f39d9b3340f2589b 100644
--- a/drivers/bus/mhi/host/clients/Makefile
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
 mhi_loopback-y += loopback.o
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
index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..dc64beae06ada6915a506ed8f4ae4d71c03158bb 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -1,19 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
 #include <linux/limits.h>
 #include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
 #include <linux/minmax.h>
 #include <linux/overflow.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -922,13 +923,7 @@ static struct mhi_driver sahara_mhi_driver = {
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

