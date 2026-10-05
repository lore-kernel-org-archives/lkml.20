Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D3F4746AD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196791; cv=none; b=O3ADTCmsQ64edyKH9ltuW0yXobFl5PjW7iHMoGw6f3xtdlbjmrmRqvdIi75JdUVVvwcVNG5d1Rjy0Rohw+/dCi2PhFllAJ/LKVBLdNVRuzSjQlNPvjlJnoNk7ilqioyjDq8IXBNnsykX1bEOGBQ0Ba3O2qoFqd9CRQ3Sw/wMGAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196791; c=relaxed/simple;
	bh=rQFvOgrxAjTZgIQ8VEY+1I8jX16u5bvsCq37mDZ8aos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSOuP5XjqGrWUz6drczvuHSK7t/ML/qB7iN+q9WKu7Qm3J1H64JuQrRi5MpnYXeJu5Y6XeonmQbRNhK2aioG6jF90Hm/2rrkIUqkApc+xT1Nv7Rw2i1gSOIZO35RNYSUkuD0KDY/P9r27ibwn5+ij1asPmOpKay94CrlhiKyCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbtC1pgF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LW+toy9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbtC1pgF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LW+toy9F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AVUOZ1304401
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 10:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30HDs5bhuPq5ln0VMFr+h91aND3ddoQz9VJRS079r2U=; b=nbtC1pgFkdMrH7qx
	RS0S7UWgn7v9Z0gl70HdTznttImMG06CHpSGq79vBlKw5pGF3Zr32rG27c8jL9ST
	e6gAzioDe4IzyL70rtZCpJTGHnOS8j8OuPNX5hbDL9bA5ChlGjVXrnt2BuSWCKrp
	PKFcUBf1mWLXK15M93+vNN2bEb9rZxsQhH93bm3DNNdkn5YEcnV3YqeXOpHNK4sk
	a8soV60BmaE0YUalDe/OHF1c1/46vOAu7ay4BdlPirUXuhvNy8AQmeHdF+YOXmeN
	3/GFBJFC+brSUhwhLcOnUCRe/TmfVhZoUJbG9VZsIpPnX0tN9i2D3jKG/fhpaqKy
	v0uXvA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dr0rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:39:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a7d2f25f65so786969a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791196787; x=1791801587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30HDs5bhuPq5ln0VMFr+h91aND3ddoQz9VJRS079r2U=;
        b=LW+toy9F8GBXw1C0FHQktoMpqOuK0eQfUKcvOi2DqG5PhpOw+mKXcVOGzMEANIt9Ct
         2Hj/ba9l7QYcrI23KRo+FvRyBk3ZqfnpF7C5NEZ2VtYwPV1mL/G1F2YLc9U1tV1dR3tO
         d/gG+xESwH+PrKCeWEAGWfCQJ1K+C7Mkdm57rgrapm4Dy6kZisqgPhlxxsuvoM5XJ4W4
         /rPOzF4iQuVQRIr2vk2m2dJTLg3uVME6S+szZRtwDEw/tVuvxosb8oa/+m5Qk6Hf9Mjz
         c2pfF8Y6l+c8qD28Y2lHCLqFrO9g3gT3dBGMFXV/2aZRyOB/M8nPKB1+JgyegZLGWno2
         rERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196787; x=1791801587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30HDs5bhuPq5ln0VMFr+h91aND3ddoQz9VJRS079r2U=;
        b=rSzT0tSYxbwnc3TEYRP3VAe7+xnF+n71eIyqAMM4HfSsz4KlZEi5F4IjJf6YaJ2LHd
         YbSajJ21CGI3jmoZaN6ZjDazieG3IHC0yBTZbTTr2Cn6Ekk1H+y8gkfL/5y9irwMW/G/
         cR/Yt5t1CJcFlD7uWkLgKrvMmm8AdWsqEg75BYjZkTI7jJCdcfc843BJwANOXr1MnQql
         fjmzD9q5FbVcyZADeKVh/Q0aRwjoSaKIBngSQrjumUFY8IqsXWt9yH5R6AOmo1Rq9Iaq
         iC6q/KcXG2CYObcX9sDcLjSP/v4BqhWUwIuuZTF54nGJ/z2VVmrA3UeG/WwgnhGpsgm+
         4RNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0+hRDuzhSAQ3ibcQnMeRco2WsXRUP0p6dNwTk4AQdCcLvHD6EMhlhteppMVpTJLoplwkRfhe3gRtfNUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUTJc0GaZ0ro3Ss7H9tIjDi/4hJresemyP5pCL9aMjneL6nIeU
	5aXvI8NcD1wsK5XXAmxtGFqF3CHDDWUyBLaLN7btkU0yYzkkvRk0xyaBMFVLb/CKx8TNQd2vnPY
	OZpNgD7YcvisHl09JO4wV57ni36U1g1OHNaZglXtHd/Jz7dqinYHjCNhR2v5207TSm+c=
X-Gm-Gg: AYBFou25U2wxJCvXJp28nnmtRC2UtJ4yUk7ULmruwyIDTWpYwmEMJbKo/1554gQB/Q+
	AQAShcakLSovrYjR7+l9/ZCbegT2Z1CqFHI/Wi1tD5+YV1DZjag8FJ43uSIrd5u4WU5hlue9iv0
	8skhws8uNgPDEhNsJq2fYLfepCWSP/888Gn7KW+X2ZCc5KRQyNtBP/2nv2hfWP2L3bUFp36wHXh
	ZCTGwSmUwb6BOFM4zFYbkut66oD33RAypeUfqMB752v2eR1ZmzHpfVx4LSbV8GB+RKYj8bHETNG
	9Q2DwKgAyYXUvW7KtMbXxYHcLJ2hoyJD0T1u1ijRY/qLXD/TFwu2GL9eRfem60aSvGxRrPJ8hAF
	rtEACfw+yu9Z7c/GUszPRTLnF
X-Received: by 2002:a17:90b:3ec7:b0:3a0:c20b:2ff1 with SMTP id 98e67ed59e1d1-3a6cec1edf5mr6072588a91.28.1791196787214;
        Mon, 05 Oct 2026 03:39:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec7:b0:3a0:c20b:2ff1 with SMTP id 98e67ed59e1d1-3a6cec1edf5mr6072577a91.28.1791196786696;
        Mon, 05 Oct 2026 03:39:46 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e61386csm11223918a91.17.2026.10.05.03.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:39:46 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:09:31 +0530
Subject: [PATCH v7 3/3] bus: mhi: ep: clients: Add loopback driver for data
 path testing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-lb-v7-3-36a268b6386f@oss.qualcomm.com>
References: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
In-Reply-To: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791196775; l=7151;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=rQFvOgrxAjTZgIQ8VEY+1I8jX16u5bvsCq37mDZ8aos=;
 b=WJ7aFCSLgd9GJ34LXq1dwnHufSeWxL2+AR9ZI8gdcUx8rDsNfqOm212vEPF4k7YpdpgPsgIiH
 7S79mDMcbe4D4z1htQWFG2xTCO0kWDUHI7YHGPWe/axCZMR6yRlSMa6
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX0/irAbjryADp
 SGXHuIifyPM92hyg4fDewstxfO7DzyXsn4WFiwhJ+5p3EVtFdP6cXlKL3IN02PrXMRXVOa5ZWXG
 5y7odpnoE/brUAptLihJ8H0YyL1qOqs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX5rEYQaDveNsV
 1+ms3etlEliFnjvvpl3HvkQOh0aSUeYnw081iVB05Yhr+hml8i3p0jzaPyMxL0YB1EDhZ2HFIA1
 m2inOnxePrNpaPes2RDO/Ws1yXF/SIUuspZJHkvKrCMGu7fAKZN2Yk+8P+L01xIPXczaI2lh1l2
 mVqiniGOgaYEzTt0wjQx0TtmGt/2IrO6m1Mzl3l9lt9PsUJRCkVpq7YirDsjHOaKpVkMyUuh1Ki
 0+EnaWL0xJ9DVeguM5R8/SgMyBOlu/6NMUEJQiPhrTqWnd1Wt6RVobCIXzCn7nBGGmiWszS3MjE
 9ZnVsVfXfjlRMUT2LtUQ7SA0r140z8HJR7j1JbHQz+y7eM5bTGjUJSdmY3e83/YpE0WlJenUBe3
 /duYeP4KKeB5LcgGRa+cy/WgWQNF7wVnAmKVhPeekAsQf2drxiHQCkJwyAyxcT2bUXOYMXi9fdz
 PQ6x/2x0Q4jU+pL+hkA==
X-Proofpoint-GUID: cEgRPUI2KRUsEtk5M1AWi6IkqEe5eC0h
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac37e74 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=F9PWhn0UeK7EsyOwsFYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: cEgRPUI2KRUsEtk5M1AWi6IkqEe5eC0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050041

When an MHI endpoint device runs Linux, there is no firmware to implement
the LOOPBACK channel echo that real modem firmware provides. Without an
endpoint-side driver, the host loopback test has no software echo partner
and cannot exercise the full end-to-end MHI data path.

Add an endpoint-side loopback driver that binds to the LOOPBACK channel and
echoes received data back to the host. An ordered workqueue is used for
asynchronous processing to preserve packet ordering. Together with the
host-side loopback driver, this enables complete MHI data path validation
for Linux-based endpoint devices.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/Kconfig            |   2 +
 drivers/bus/mhi/ep/Makefile           |   1 +
 drivers/bus/mhi/ep/clients/Kconfig    |  16 +++++
 drivers/bus/mhi/ep/clients/Makefile   |   2 +
 drivers/bus/mhi/ep/clients/loopback.c | 129 ++++++++++++++++++++++++++++++++++
 5 files changed, 150 insertions(+)

diff --git a/drivers/bus/mhi/ep/Kconfig b/drivers/bus/mhi/ep/Kconfig
index 90ab3b040672e0f04181d4802e3062afcc7cf782..9edb81b39890e093a51138465a4d7705767eafa5 100644
--- a/drivers/bus/mhi/ep/Kconfig
+++ b/drivers/bus/mhi/ep/Kconfig
@@ -8,3 +8,5 @@ config MHI_BUS_EP
 
 	  MHI_BUS_EP implements the MHI protocol for the endpoint devices,
 	  such as SDX55 modem connected to the host machine over PCIe.
+
+source "drivers/bus/mhi/ep/clients/Kconfig"
diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
index aad85f180b707fb997fcb541837eda9bbbb67437..ab36ef2a40ab8174e5ddae44a3e6ccb8eb31168d 100644
--- a/drivers/bus/mhi/ep/Makefile
+++ b/drivers/bus/mhi/ep/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
 mhi_ep-y := main.o mmio.o ring.o sm.o
+obj-y += clients/
diff --git a/drivers/bus/mhi/ep/clients/Kconfig b/drivers/bus/mhi/ep/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..4cf27184058ca2be020885b6f57b4cc44b5054b6
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MHI_BUS_EP_LOOPBACK
+	tristate "MHI Endpoint LOOPBACK client driver"
+	depends on MHI_BUS_EP
+	help
+	  MHI Endpoint LOOPBACK client driver that binds to the MHI LOOPBACK
+	  channel as defined in the MHI specification. The LOOPBACK channel is
+	  implemented by MHI-based endpoint devices (modems, WLAN) in the field,
+	  where the endpoint firmware echoes back whatever the host sends.
+
+	  This driver receives data on the uplink channel and echoes it back on
+	  the downlink channel for testing the MHI endpoint data path.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mhi_ep_loopback.
diff --git a/drivers/bus/mhi/ep/clients/Makefile b/drivers/bus/mhi/ep/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..71dc91cc63b02592b177cf66db6090748c0653a6
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_BUS_EP_LOOPBACK) += mhi_ep_loopback.o
+mhi_ep_loopback-y += loopback.o
diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..58310644b05d63de19ac7a7237919ef211bb82e0
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/loopback.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mhi_ep.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+struct mhi_ep_loopback {
+	struct workqueue_struct *wq;
+	struct mhi_ep_device *mdev;
+};
+
+struct mhi_ep_loopback_work {
+	struct mhi_ep_device *mdev;
+	struct work_struct work;
+	void *buf;
+	size_t len;
+};
+
+static void mhi_ep_loopback_work_handler(struct work_struct *work)
+{
+	struct mhi_ep_loopback_work *mhi_ep_lb_work = container_of(work,
+								struct mhi_ep_loopback_work, work);
+	int ret;
+
+	ret = mhi_ep_queue_buf(mhi_ep_lb_work->mdev, mhi_ep_lb_work->buf,
+			       mhi_ep_lb_work->len);
+	if (ret) {
+		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to queue buffer: %d\n", ret);
+		kfree(mhi_ep_lb_work->buf);
+	}
+
+	kfree(mhi_ep_lb_work);
+}
+
+static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+	struct mhi_ep_loopback_work *mhi_ep_lb_work;
+	void *buf;
+
+	if (!mhi_ep_lb)
+		return;
+
+	if (!mhi_res->transaction_status) {
+		if (!mhi_res->bytes_xferd)
+			return;
+
+		buf = kmemdup(mhi_res->buf_addr, mhi_res->bytes_xferd, GFP_KERNEL);
+		if (!buf) {
+			dev_err(&mhi_dev->dev, "Failed to allocate loopback buffer\n");
+			return;
+		}
+
+		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
+		if (!mhi_ep_lb_work) {
+			dev_err(&mhi_dev->dev, "Failed to allocate loopback work\n");
+			kfree(buf);
+			return;
+		}
+
+		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
+		mhi_ep_lb_work->mdev = mhi_dev;
+		mhi_ep_lb_work->buf = buf;
+		mhi_ep_lb_work->len = mhi_res->bytes_xferd;
+
+		queue_work(mhi_ep_lb->wq, &mhi_ep_lb_work->work);
+	}
+}
+
+static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	kfree(mhi_res->buf_addr);
+}
+
+static int mhi_ep_loopback_probe(struct mhi_ep_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct mhi_ep_loopback *mhi_ep_lb;
+
+	mhi_ep_lb = devm_kzalloc(&mhi_dev->dev, sizeof(*mhi_ep_lb), GFP_KERNEL);
+	if (!mhi_ep_lb)
+		return -ENOMEM;
+
+	mhi_ep_lb->wq = alloc_ordered_workqueue("mhi_ep_loopback", WQ_MEM_RECLAIM);
+	if (!mhi_ep_lb->wq) {
+		dev_err(&mhi_dev->dev, "Failed to create workqueue\n");
+		return -ENOMEM;
+	}
+
+	mhi_ep_lb->mdev = mhi_dev;
+	dev_set_drvdata(&mhi_dev->dev, mhi_ep_lb);
+
+	return 0;
+}
+
+static void mhi_ep_loopback_remove(struct mhi_ep_device *mhi_dev)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+
+	destroy_workqueue(mhi_ep_lb->wq);
+}
+
+static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
+	{ .chan = "LOOPBACK" },
+	{ }
+};
+MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);
+
+static struct mhi_ep_driver mhi_ep_loopback_driver = {
+	.probe = mhi_ep_loopback_probe,
+	.remove = mhi_ep_loopback_remove,
+	.dl_xfer_cb = mhi_ep_loopback_dl_callback,
+	.ul_xfer_cb = mhi_ep_loopback_ul_callback,
+	.id_table = mhi_ep_loopback_id_table,
+	.driver = {
+		.name = "mhi_ep_loopback",
+	},
+};
+
+module_mhi_ep_driver(mhi_ep_loopback_driver);
+
+MODULE_AUTHOR("Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Endpoint Loopback driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

