Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472379;
	b=Sp3SZkZR0TAIHT/ZVXLkyxMybBLebDb9YQS6PV7jakmXmfRLgFBefIG59pX5AF51RvM5
	 1gCaF/BQ004/Xf99UjzaNg5VqVnzhRIsNIqoPyyjN0Ww4aSNll1xXZiziHhaN4vvWw5+5
	 /Bjti3nYUQCJCCHtWiRH3VL/ZhuEFE/bX3y6nYQUUohqOm+m0+OdzkgBLtXu4I9XoICUt
	 Qh+TSrFIAB4YJMSYUgOI8ZRRMO5Vndu4+D6MU1OIySmqEGqj8gBDQe6NhQ4CmL/OxuBU3
	 zWj+s0DtF0QCVrB1359z8TPTXUiVXg9sv46OjZVyVZEMyEtPNez2gfD1IY42b6fJYUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
	b=RxjCN/u4EzGhyFzCPfmcvekb0t5HfTuqoUrIGuHhYEQvAneTtXthtJlvatHowuviTBAi
	 waumSqWqIWRcTOGIItIlCR8l97N24/xEcSNyVP0ISxpIQDjxzUTrqNZ+TTz6tXBxDMv2n
	 jc4E6Ty3Vl9yWdR456Kecp4r59cIi9zjGDoXtZbYcY/wJ17SpSqDV55AX/DFORHVkWq1H
	 w3bZi3X1THv8JzuEdHyRwBPkilZREc+CDkToTI1nkXvLggfuCiOngMCcq5d7F7BOdHBoA
	 Nco+yGAFEQjowscldi+VbrvcXwWBkJL7t2ZoV1Vb2LQREQoPwzAPv0QhdVDNb5vuvDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6sYEmcH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7s46cW1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A78606A8BB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2A78606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6sYEmcH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7s46cW1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iqhb125791
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=O6sYEmcHDgk4vMnY
	cE2oxf7+oLQkYlWF+h/50XbkZ4NgtMq3bWsPoxGofCScueeV8N4NoSXXXyTsHhU/
	T8aTeDz7E3iv3lVQfoCWsl/rzkx6MNMvry8XtKovezvC0648FtPjfSB9cm43HssU
	LrOTfeQKnMIooUXg2L7I/isGXw+9lJfdarTtFWnEPxH30N/RUf1nbIq8Jmu+Rt4Q
	LuZ48JW59V206OCJybVdzPJyxkUjE40rR/wpZaMyQzugycGmjA0tqahICS4Hbg1e
	QsMuYZjCu5yy8qqIbd9awFkBnvSOO6Z2VQEWZdHwg0L/NNFhxNOair0BmKjXptUw
	OW64VA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a086d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so3781709a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472377; x=1795077177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=I7s46cW1xA3rCvPuABDAlJeqkhk/YZ/Ga00SZYhI/gZygqCSPYUcpeUjhiKqGh9MO7
         nFcB5MuUI136PtJ67JDPUawxvtiZjrXrpDqrVTSM6I1JCS/PRIkoT9Qc10NySzpxRo6M
         0Fjqra9xRFw+pKb4fZGSmN3ZCOmeFDmNWdOhZcOm7xYRkVUJMeN3mFM3qGYlSMMOvQkx
         ILBUfCli5gj5XVZepbj6SfO0NMsZqNC/OL8ODZtQcH/poP8Lle5bvq0+BBhXg/kk6srT
         39oFGAxZfNa24dt1JFiQ1FJyQzfeKavX0Ar+kjEMbhde3npWa7PvJCAJFsKI8UPTEW1/
         u6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472377; x=1795077177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=vJl3tWrt03yvzqEoaqU0aAaRVk6PTOMAj2LuhCk4Ef7uC4kxr5A/wPBhvTc/CAOP5I
         ovRIHkD5ltojNRCpwFFc0jNMDZs9rRXI4NGPHT4CGKk6bM4gWwRmdlcCVjPo2pm+2Y0C
         PtGYhLMnDIlSc99owOIy97+H74Yo4WsIvZTisekIBg5NBlaSnTEw0wkSWMdwQ7DhMy51
         9FyT+q0yIPxzAieaNvWoQKm+xa92s0sHBHMb3JB6XheKg1pSG/snjC/+nN27fPtBzebb
         lC9dlnBRvAQgqj1S4Ax2pPteFscY58BfsWJfduuj5Hp6wq3S2uJiwbJT+R39sUNCe37M
         gEPA==
X-Forwarded-Encrypted: i=1; AL+hErHtJJu6rN+bd73jV6LGPrMKGg5LTUYpZ1c6G+uCVoRdmTemlw415O0x+ncYRltFRbMGfe5yQGlkWzzx1hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VyPv7yBXAief+hfQz7o2LccJhSx3WAau2k6P2rNFOcvBbpGjq
	frP/WIMwUzJ09mbG9tGC8hSP1Ggucwsw7J9KYYoASQ1LwLSMhby95t9PChcpBsqns+MrXW4Ny8q
	XDczxqihdBhJr3NeFSLWnFTDFkCV10aTHMzlKQm413P6LZn3mX0TygkfHiJJU/5psYbU=
X-Gm-Gg: AYBFou0PyorsxytHH2kS4PzePh4cBi09vBXRuQUPIlT70jJnhMrAbwuIFyHk/2JC5B1
	4EWyoqrBRug30aYOi9TIhDi+VleEEfYOwyyLFQFTGhAd2eAjcgvPQBSy9jPvZMsjW3j9gECQIUr
	ekEtd3hitl6W6m4cHFmoMiu06F+Xu6fONs35chhuBS6lhvlUCFJoRDZCzWTu4GK4hlj1ULCMxDj
	NR3J2xLoDjxGQv0WvUlmqfXibiLOny904ktSbXZ+M6smCsXXL1LFMpvKzymhnWOiKE4TyHTrnXS
	6aZpXXDuUDEaG9qdUUbGoJqQAFM6cyG4snWMiQPbj3gN5EBYqUk+F7uWjD0wgqIOFyJ/9f4//lf
	yYp/BWIREpuOJExPgzgUeO8N5kglR0fhFGzXQV9q23YumGDQEB18TXCFAaPaq3aY7RuJ4MuW9vk
	EWmSTCQ73v7sR3mmCjKTreS/jZHlaAR0/SvKp0bkYhp3WoUvgW6JtVgmYDm0oU7DCymzGvvUrD/
	Q==
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4533396a91.65.1794472376914;
        Thu, 12 Nov 2026 00:32:56 -0800 (PST)
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4533373a91.65.1794472376358;
        Thu, 12 Nov 2026 00:32:56 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:55 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:20 +0530
Subject: [PATCH ath-next 06/15] wifi: ath12k: add initial Wi-Fi 8 hw params
 and init helper for QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-6-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: V-Mh-r9wdQ9AFfe8sj5MbuVf11DJjIxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXyVh8YDqPj52i
 CijyrHbgPytV5C8XLMwPiQvzdVUVTSXKuPCGFniO9uPikeGdScKnM2JRUBT+B8Sygf3R9P2+8Bn
 EwYN4GUambsPuxMeuoBwuvwi63SvQyi41C67fV5e+oJf7xNXYu0caT//dqOQzbs3u/pdL0/RfsX
 778QF7iyUmV6sSasc4AsBVXHxYdz7i53tkf3zIFgMbOETi1dofSnzuIzh7aLaB2FlxLiJ6GrW1H
 aEqFdGybge5i6Mct9yZN3D3WSxZusnXjk6DmIC10V2OjqPyVBAyjQz/cIjlF2lAzFVw3xPTSwfQ
 Z1dZn5rfFhLhyw8SpXUUAIIm0RuqM+HpAuv7x4/6VjRP6RzT+L8iL7UfSzTpTJro6jpZt7hhShR
 14wwNxbXKJMGD4R/fTrCT5bT9Db5hhH1miC2/8M4m7vqxQvE+EdgB1SYpzkwEnwXB6n28zxChTR
 OV5Z9KMx13iH/ejP1Uw==
X-Proofpoint-ORIG-GUID: V-Mh-r9wdQ9AFfe8sj5MbuVf11DJjIxG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzIbe0Skv79zZ
 5wgIddU5KXUWkAOsuYZwv/bR+Kx6Zx9TN0qAlvCCMCEnyzKMeGr1qEP218McUQXCtxHojp+Ouoj
 Ojsk8s6hwv338ettHPML0OAC4wJ4w6E=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af579ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

QCN9575 is a Wi-Fi 8 target that requires its own hardware-params entry
to be matched at probe time. Add ATH12K_HW_QCN9575_HW20 to ath12k_hw_rev
and populate the initial parameter set in wifi8/hw.c. Introduce
ath12k_wifi8_hw_init() to walk the Wi-Fi 8 hw_params table and select the
matching entry at runtime. Hardware-specific operation pointers (hw_ops,
wmi_init, mhi_config) and CE config tables are left as NULL placeholders
until the corresponding subsystem support is added. Explicitly initialize
every top-level member of the hw_params entry, including zero/NULL/false
defaults, rather than relying on implicit designated-initializer
zero-fill, so the full set of fields is visible and easy to audit as
later patches replace individual placeholders with real values. Add
wifi8/hw.h and wire wifi8/hw.c into the wifi8/Makefile.

Define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB with the correct OTP
register address 0x1F90070 and set it as the otp_board_id_register in the
QCN9575 hw_params.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h         |   1 +
 drivers/net/wireless/ath/ath12k/qmi.h          |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     | 135 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h     |  14 +++
 5 files changed, 152 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 2a4b5e5e1af3..56b509841126 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -159,6 +159,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_QCC2072_HW10,
 	ATH12K_HW_IPQ5424_HW10,
 	ATH12K_HW_QCN6432_HW10,
+	ATH12K_HW_QCN9575_HW20,
 };
 
 #define ATH12K_IRQ_NUM_MAX 57
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index fc68ff649352..438ab92802bf 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -19,6 +19,7 @@
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850 0x1
 
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274	0x07
+#define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575	0x07
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332	0x2
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432	0x60
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b8c5b6d3a7bd..277b5f13754d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
new file mode 100644
index 000000000000..6e89a42111b6
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+
+#include "../core.h"
+#include "../debug.h"
+#include "../hw.h"
+#include "../mhi.h"
+#include "hw.h"
+
+static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
+	{
+		.name = "qcn9575 hw2.0",
+		.hw_rev = ATH12K_HW_QCN9575_HW20,
+		.fw = {
+			.dir = "QCN9575/hw2.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_driver,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 2,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575,
+		.qmi_max_chunk_size = SZ_2M,
+		.internal_sleep_clock = false,
+
+		.hw_ops = NULL,
+		.ring_mask = NULL,
+
+		.host_ce_config = NULL,
+		.ce_count = 16,
+		.target_ce_config = NULL,
+		.target_ce_count = 0,
+		.svc_to_ce_map = NULL,
+		.svc_to_ce_map_len = 0,
+
+		.rxdma1_enable = false,
+		.num_rxdma_per_pdev = 0,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = false,
+		.supports_cong_ctrl_max_msdus = false,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = false,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 0,
+		.max_tx_ring = 0,
+
+		.mhi_config = NULL,
+
+		.wmi_init = NULL,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0x600000,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = true,
+
+		.iova_mask = 0,
+
+		.supports_aspm = true,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = false,
+
+		.dp_primary_link_only = false,
+		.client = {
+			.max_client_single = 0,
+			.max_client_dbs = 0,
+			.max_client_dbs_sbs = 0,
+		},
+
+		.host_alloc_ml_id = false,
+		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
+	},
+};
+
+int ath12k_wifi8_hw_init(struct ath12k_base *ab)
+{
+	const struct ath12k_hw_params *hw_params = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi8_hw_params); i++) {
+		hw_params = &ath12k_wifi8_hw_params[i];
+
+		if (hw_params->hw_rev == ab->hw_rev)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ath12k_wifi8_hw_params)) {
+		ath12k_err(ab, "Unsupported Wi-Fi 8 hardware version: 0x%x\n",
+			   ab->hw_rev);
+		return -EINVAL;
+	}
+
+	ab->hw_params = hw_params;
+
+	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.h b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
new file mode 100644
index 000000000000..ad11370f9752
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HW_H
+#define ATH12K_WIFI8_HW_H
+
+#define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB	0x1F90070
+
+struct ath12k_base;
+int ath12k_wifi8_hw_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HW_H */

-- 
2.34.1

