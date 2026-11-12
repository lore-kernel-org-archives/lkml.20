Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472373;
	b=hCTeB8nWDUNdH0sniTf5pfujuPdMpg4yocHQ6oorXtUJJ0kXNGdM/MB+VPLv7N/zIfk4
	 nkOzAKjEHbLdP9/HJt1QPDOdCbgUsGdu5A56ZKCkLjh8yKALlOBlfnyX/v6QB9VAnNhLZ
	 I9wdvk/uxKi5PbmVTHdlj9BHDQGT8X1H9MqBZ4udqUs+PegOdkJ6a1Xh3+AhgrtjmpIEs
	 08kKuf3shV+SSniUrBpODREckHHp1/9JFHu1y2PzWo0mGJMxcBH7gKHa+Nj4pCvuOmc+0
	 dhDa88CJcUTdiprbYxD9bjdhox5rwaeR0LGDhdtp6/3wz60Lwdrccn0iTFz30CE6p9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472373;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=UHDfjoyHLXHvtzsUnGhE4GW8xf4b8bmkbfSNuy03QA5NWoONwkr/sDbudITJrTgJmVO5
	 NSoO5VrO3lUGyzwDImifMeASwPNKczQKoeqUtva+FcU1lCCZ7VFqmKqAhpSa6M0PpgKeG
	 kwHVeTcAvQRgTnVTUIW9wcTnqnZt7m5v+bESsIVRZIQpP+mUeyIns/MAJSSftVokjqxCz
	 PQlr1ytzsiXJUg4DE14wkyvzNFzrWrKyc6nTW9yti1kowOQLPghIRRYo2nVdQAyDRRltf
	 +/njWwpvCw7E9nRBLKhqo2/lBaJ73ZVD6i1Hh5e3IxnPtPKhyq3fgNlS7Ga89ADupsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UY1mprCa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fsIXzgIV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217E606B704
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1217E606B704
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UY1mprCa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fsIXzgIV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZVOD2514118
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=UY1mprCalcSCyaMg
	MmkNtghlBAC0H6EiCe6XvvllNqmTib3KbZm9udLxwwIKi473iAeZmCO4NbKVBY8J
	2nDvywiAotO5zhBeUFWdpag7pZeUttW9/qsCyd1SE7nV7erVjhtJ2Li6HFQpc8CQ
	99rg4kAo0xDPHs3Xh12jSSaAkPxQJYb46l5CHLVtiDsUWFgDd3kylGzYV1TDH688
	sPLUe+PsICH27xpQZl7JGizW7J5ZKyR/n5QLTkR86tOQmcn3rpiHv5Ec/ucNcROj
	nhB1iLLxYlVO+qKXc0J+54Az4Qu9uodyKQMLQzYwuxusREkSNQQBrWqpdX+tYMog
	5ZFPcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1tpwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so2934392a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472372; x=1795077172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=fsIXzgIVo5iT+R2BJa1DuSqtyT4m3fwZyb2xJZVyd0ZgjpdTNgXzxy20nuBYrQ2xvx
         Q0fqBJlef43HnzzkNlzBdodvh0ebTvISCYl10InPCK0v0i7ofnVOaiQSFLUCOphc0hwN
         g1hpZ3+Ei/OXk6s4mpNR6NaxWCW4w34WmI9B+/ZV8bSF5SL5YewNlnSzIg8xq7vrETwu
         /Jgcw6aOpNkh1io3KMmmrc8sQevx0wPMlKN8AtHXA+yknmFaVNDtMxwqcYXA42XcnoKY
         hfB4AbNBCjLHYrmh3TU9Idh/ht98fZoxGXV4vj3caXiNyOg8ghc1vdnWGHBcyKiQZaq7
         0jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472372; x=1795077172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=Q3FwyzBvwWPucUz9wqCBCIxmBmRXjWncT74X9IjtzYY4C9MKb97XfwZytAqZiZefm+
         tatWuc7FfqVLnR6R9VEFMFIs5MZ79+WKfIRftUCwQ/vFzfqbvqoc6CGE91iLlnSo/3Yg
         j+n+stpJkOVfFZNn7cl6IEHgQNOFss3/T3QI8Sdpa73/MNRxjeM6KMtv0K33V8e5KGeW
         SEOomWMRD8Sy9yzdYnWhFt6mdEQqsTMUf+zGi0F9Cx3qIoxJfnP9DOZL3WrEUCziU2dY
         Nz/2FUV/BTCDJ7OsYao8hoob7gVl/2EKCIaqVURfshb/lwMCDOYPvHac8Q+7nflpInn3
         VcFg==
X-Forwarded-Encrypted: i=1; AL+hErGNMXIr1ALv2QwEmbdHOocvFCG7RDlmzw2Yrx6UN88vw3cIH2TtOK+hni+yY++zb1jEpk3z+a7ZPaLiUCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/chriF02jwSDGLSQCmnwoBsGU1E8kecwShgb8L7Vs95EZIvI5h
	WK66kWkpyXBmDCmxc905md71V3I+QUVHbJkDDmA8fcl6noOwD3bRIXfukicXWe7ubFlFEq3VX9w
	L61WzIb8wJeoKfaRdz/9q0jPTl9GLhORyJh775xu8TWzl2Z3KS7bKzme1izjzYVKaU68=
X-Gm-Gg: AYBFou2ULzga07HklVRqTV7lW3e90G1YYZQ8cQqfHYSMmnNZI40RZ/py5iDDF4Wlu3I
	FTYsRqSmijiVDW1sR9sQSwUrndZhMnRdJ4BhPe4z7XiW+Q01Y2EVKVVaCTetqdt/h9DfLYlU8Bo
	nd/unVRqVXLSHzHinhiREOFNVUimyjfMiEwyI+ZLge4KxbfF8nZi3u2uP0Iz1+iMiItguYv2MT6
	dY0OWYYSmBIiRMxxE4b2g5ciM9/CpQTH3pxrB3IKOkNsuCq8lG0y9nOC6zjw7758unCcVNrz1Me
	+LVi1l7huJw2tWYaWt/7sF/HZQ/HAbA0dhtIuiDeJ+dMGNdVGG+BwrjAf0bz53Go448fFrX/N1b
	gwPRNVFN+HRTcXk5+yI5aAQmr6xD6FRZ6apggbwuA7U50Z5SCx2vZ0Fhw3nAuc9KUOEdxFZ84UH
	MX1pz9Ne/ycoD5dp2jMgUPz/WfYwUcP80lRmfkZamPcJ3FNjH5Qwh9P0fditurOoJ13eTP51wGS
	g==
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031297a91.49.1794472371373;
        Thu, 12 Nov 2026 00:32:51 -0800 (PST)
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031273a91.49.1794472370879;
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:19 +0530
Subject: [PATCH ath-next 05/15] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-5-3f30fbc2bb69@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af579b4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: o4e9WixnJda6sNYYwXzDEqntLe-hSg1K
X-Proofpoint-ORIG-GUID: o4e9WixnJda6sNYYwXzDEqntLe-hSg1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+j8vUgjjdvAW
 2FEa39mLYfoPVGsd4+JY83hwleaimSNyY5VQ8c6yxmFIFoz1a47ag9j3x9KqWU06BOCak7j3fRY
 lZ2KEPe5kzEu5zQJgMp+S82BTMSmsq60DVHm/RX6Z26SPYjXUIgQDHcGz6SddqNB5IS/dY7gSRl
 1UWYsc5Fzzw+ibx+flj2yeJmTA2Jzh42f0lqaH3SOjhL17K4duPqayMNYZU4TcwtmtW5VJnhNiN
 aT4Z313hAoztJu4jHp7zRcJponkyX1j0WFi1QTWKY5P/kolEDCTIAvbRKuOAnVaT1wSU2Yh5Mna
 dIMhXrVN47fsK77uyUeu1FOY/khqIYKLCOAjbYWJYDCBRse9qWDBvXPP3P3JCKZLcBMd4ocS24k
 Qlu6bHnVIoRSN3pmG/QGKo6osbbcw4TYRP5yYbFjd+v6pm5ZLOukuNmjFmu2IRclHp3YQiPrqU5
 RcpM7GJw3n3Qf6y7mVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX4xTrOnoZbodO
 l5ZFOpAMekVZj4/h9H9O6UGXz/Gj0BXY/cvSiiZoouiLsXo8wLkNLlGreAhhfA+8TGA6qHzSFVO
 DHoHQf1H9csUkvIzPyWr3au5n4aqtLQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
init/exit as stubs so the module builds cleanly and remains bisect-safe;
actual PCI driver registration and hardware support come in follow-up
patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile       |  1 +
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
 6 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 861ec85eebed..332110d72a1d 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -25,6 +25,7 @@ ath12k-y += core.o \
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
+obj-$(CONFIG_ATH12K) += wifi8/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a8e8a55aa718..2a4b5e5e1af3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
 enum ath12k_device_family {
 	ATH12K_DEVICE_FAMILY_START,
 	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
+	ATH12K_DEVICE_FAMILY_WIFI8,
 	ATH12K_DEVICE_FAMILY_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
new file mode 100644
index 000000000000..b8c5b6d3a7bd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
+ath12k_wifi8-y += core.o \
+		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
new file mode 100644
index 000000000000..9253ef9d9cf5
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include "../pci.h"
+#include "pci.h"
+
+static int ath12k_wifi8_init(void)
+{
+	int ret;
+
+	ret = ath12k_wifi8_pci_init();
+	if (ret)
+		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
+			ret);
+
+	return ret;
+}
+
+static void ath12k_wifi8_exit(void)
+{
+	ath12k_wifi8_pci_exit();
+}
+
+module_init(ath12k_wifi8_init);
+module_exit(ath12k_wifi8_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
new file mode 100644
index 000000000000..3975081d167b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/pci.h>
+
+#include "pci.h"
+
+int ath12k_wifi8_pci_init(void)
+{
+	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	return 0;
+}
+
+void ath12k_wifi8_pci_exit(void)
+{
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.h b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
new file mode 100644
index 000000000000..efe02721e470
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef ATH12K_WIFI8_PCI_H
+#define ATH12K_WIFI8_PCI_H
+
+int ath12k_wifi8_pci_init(void);
+void ath12k_wifi8_pci_exit(void);
+
+#endif /* ATH12K_WIFI8_PCI_H */

-- 
2.34.1

