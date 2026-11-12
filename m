Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472384;
	b=R1Q9TbmMQu+DLcFtr1jznV9P9FphZ+vgoHuAzxz8xYwlcFLN2E/qQfYfpZiBGj4I58ok
	 WI9iw01BqdVAkHkoHIO1JAQ5+Gza5HMJgKbn0r/TePqPGbkPHgA0z51ZYxGAzTUsLsHDg
	 Y74B/VKh9pi1Rl63ikkozD36IDMEA4e0i/zvBtIE1EZy4vIFtDze9ocoBeil0bdBswB76
	 L7vgtYpto2OyQhisyzXKEflkFM3YsJPnEQMwmX4qS91v9UhfbwsTwRVCsDqFv3ogfv2E7
	 FbmoJuTvFAwMIN8EhJBlEd7TWSq/PNx0pcdEkGDFmupV0IgOPXdd9T6f4tKJlrcpLjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
	b=EgNv/dRueKR2DnlUDfxZSSSLOseKAi1BNz2jY8/1fyviYk2WjUmGx6t9GOgoQtvDTv0G
	 poQjHI+zZO+9CU/sZ7Ddf5iQOmI/Qfqw6DveUDZe6j0lLaivn4tQ0B9fWH56rD6tk6ORB
	 6/Vw2xOwrtONOBOj6w4MslARNoFLvV3iGd0AscPITn2dRYs4whxhqUx43CA+Zv4YSzh1q
	 YxXVLZNrwzmTqa5CkUOe8vzFhcN3GTGy8XpyUBG+qFKYagZBLIhQQGZPM4TA4OIfDJNev
	 lZ5PmlVP6OKiDhwKSGyIoNZJ5PlD0DyC+K9rGflGM+hW8mdnW3JQlv3HT+7x5rjgkxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EBLvJdlc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hru4glXq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4519606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4519606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EBLvJdlc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hru4glXq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZYGv4092560
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=EBLvJdlcif5PJ7S2
	HDNYvyDAzk78Q58mjRvxbW5EQunW5vGKQuWwjY0GN0ZpMWmz3U/OgvKSXkXa3+kw
	KLEjxSlK8Mu1cJHeF25V5+TIxgmpatU0gE2/0TXjzFlCfh8olqGu0gn6ldVA3DCE
	J7CSbEktQcP3ljEfpJxPJB26PQS5D5pL0q5w7a/s5zhSIGy690RhT/VKLW58kSLY
	BP3CtwkDhgWlItwlbLyb9fHM5yLL7ioemJGz1IVKqUJDMaqnZkynFB02UBw6JW1o
	a86Sn+f3iFDDz7HX5bZnIHZxnWhrEmSyecCtunWcNMmEprxKbUS6791rB2/DNekO
	fXLUjg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hy5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so664702a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472382; x=1795077182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=Hru4glXqU7Yv1LacmClSWs1xVawwpNK8fgsdAHGg51SAXiA2xfea6+xYcc/Z+fx+Fq
         s0tLvj+VrI3XkWLhzniai8VX7PSKr3+dyKP7yCXjlAD9LeR/V0+bSmYVsjBoYOjSx54E
         8owOV/MIOAX3rrreaUThasCrdsNocQqxg8gBtvCB7BVaD0IyVC6qL5d0nxiRA2ETFhpA
         myT5bPilF/PtGGmbdCPXDAh2XuW3VxKxId2Yg11OlptaBflD5Qj1d2YxF74whFmNtH4B
         8e5ksWNpx7i+UXjtTj78d3d7UUzp9xE7C/yWZr1Z3rd2NBVm3fDMHge7EP+w5R5yslbK
         eEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472382; x=1795077182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=S5lk90AAmqhrkPvH4A13VDcm2cytRpwDqGoscYg5LMs4O+mvKeajpZo5hRnSuFfX9t
         C3Eb/Fak2f09h8es8T6K73URzLO6wwABFyGSG/eq0Ju1uSC6RqldQo0lO7ffPdUkZ+VJ
         dAOZUC5mUBOufcbrYArDo3WZNJDEQrbMwa4X6lA1W6pFv+1LmXIpusTmbii0sEor+otK
         yD8MDurKQWOg0KW5Fstmz6TUybdQ2O/zOB9N8xf3TOM02vYGBfN+apu5ewCUZx+R1XRs
         vqSuLZn3ODPofbOx6sA+M7LN8LNnS5clQvEjXluwFJa1VJLMOpMWwlM5aSAcO9g+/+ne
         l+Xg==
X-Forwarded-Encrypted: i=1; AL+hErG5pz7e4pDTAN4t1gX24jLt35ZCHAmWBMHtfdAJVsKIHOaK53ah+HFDgoudB0HEG9lNSF/W64Wa3MlIFTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Oi2ZHROXM8f2vE6f/kBd6G4fNVOiObTp068JhaJDUOOHMVhQv
	HDjVpyGY0iXqwpDfC16fLIhiX8Nzc7e6+m37DTZzgv2h668s2d1CRqhaLwDH8/Y1+4dE0E+y6iL
	oHGvSxOrY2YLSi4lG5Wtm/Lq+Iud1pLUw9Hdca+7FqNtbzmNKryIcDD4gCbT/YX8If+w=
X-Gm-Gg: AYBFou1pJIqoxSbk9sa1IKukNqNDNTUnsEQwiQtOcPHQfaHZoI9LRx3dNNyXQOj21YR
	g8EcgzEC7+psvfkhzhHcHajQMfHwQG6LGCXyunMp0kYRq90nbjB9FpHkuoxHytc5zBNYwkXBais
	965Lq6O45gLw8ie0EHIZ8UaNlTQlr8A49xhzKVVc5ekzrUNqxy+lD90PqP+OvgXlL2eGCTt5Pn0
	USFpzw0XzdyTY7Pdi9FNoTsLDsPgrVkM4JCHWhm7nRoaXCvOMQg/zuZ7JV2aoASmvOwFXchoe6T
	3/m9UJn/5IQA+e9K72Y9iBnMxL0tWb1YbBm8hLTkwN7QarnV9k/2zwpIGU5ETMDEIEss9XNPGZH
	MSitpE1rj431x2GMkkL++4Ac3od/Y746+pNTIG08DVMR/L85IRh6Q9XvyqFBHyhreycta9KYNA9
	nP6T/2ktMgVZcU030UhZHwIbF27UgqqEDbc1O2uXvhQCg9gfPN5sMKWqnWqHLw14qcp4DfNF4/G
	g==
X-Received: by 2002:a17:90b:540f:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b197caa480mr1248036a91.21.1794472382246;
        Thu, 12 Nov 2026 00:33:02 -0800 (PST)
X-Received: by 2002:a17:90b:540f:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b197caa480mr1248026a91.21.1794472381784;
        Thu, 12 Nov 2026 00:33:01 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:01 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:21 +0530
Subject: [PATCH ath-next 07/15] wifi: ath12k: add Wi-Fi 8 HAL register
 table and hal init hook for QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-7-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+1SaUzGj68Mf
 Qg93p9u0irqmzZiOSVH4mfXN6HWetbAmnW4UYAES+jTdAAu4Y6pzENfWxS41OrLwQ4QhBJBvh7g
 0+rc0xp4ItKatFIPZqQEje7D9zVQy80=
X-Proofpoint-GUID: 0p2OQ39Aj8TfkqiHtzHGomgQzqMASHKl
X-Proofpoint-ORIG-GUID: 0p2OQ39Aj8TfkqiHtzHGomgQzqMASHKl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzLmPEVZ6axnI
 5vmTcvYP9VAGcQAZ9OeGv5oWEr+6zaqgH6Um4wWpM6DNDpJxjRv+rjgw2BC6kDY3q479lioN6y/
 dHBPZ9gsMn8crBJwl0VGMoLzqD/6qigwJvfLVCqz4lwMEUKnHL1HK5IGD4hFk0ubcrkisQgv/Ue
 hMkRW8aHltBUsuXx7xy6Js5kS6HictxAtLQA+oZHKDCt+IeC8k186pCa9llDcYs2UPMAHdVnhRd
 Lo9lVFvnatlWPxUWHkt075YtKZe9rvef09zNsfv5ksYSyVYUMHG6BFLf3Hyu+Ex9MopaoHoRC/g
 IMECzfEXtkYv/Z0vx0hEBi7qKKWmXfoGEt5Tk1/0zL+c15+NZjB2zSRwTEaK3CJ6N5BGTkd9DyQ
 hmbyvB3/pJiA5+u6H0bI/v2TKa0ybofRX3OnFU/CjY+APynciv+x4mCpGlFeuQxSVxbBhYXbo9a
 mMzYmEd4dPuHXppZUdw==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af579be cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

QCN9575 uses a different HAL register layout from Wi-Fi 7 and requires a
dedicated register table and HAL init path. Add QCN9575-specific HAL
register definitions in wifi8/hal_qcn9575.c (qcn9575_regs) and its
header.  Add wifi8/hal.c with an ath12k_hw_version_map entry that points
ATH12K_HW_QCN9575_HW20 to qcn9575_regs, and introduce
ath12k_wifi8_hal_init(). Invoke ath12k_wifi8_hal_init() from
ath12k_wifi8_hw_init() so HAL setup is hooked into the Wi-Fi 8 hardware
init path. Keep HAL ops and params fields as NULL placeholders;
follow-up patches fill operation tables and remaining HAL parameters.
Update wifi8/Makefile to build hal.c and hal_qcn9575.c.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  2 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 23 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 13 +++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 42 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    | 13 +++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  3 ++
 6 files changed, 96 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 277b5f13754d..b1b90c109c76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hal.o \
+		  hal_qcn9575.o \
 		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.c b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
new file mode 100644
index 000000000000..1afc6fc21d0f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "../hal.h"
+#include "../hif.h"
+#include "hal.h"
+#include "hal_qcn9575.h"
+
+static const struct ath12k_hw_version_map ath12k_wifi8_hw_ver_map[] = {
+	[ATH12K_HW_QCN9575_HW20] = {
+		.hw_regs = &qcn9575_regs,
+	},
+};
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab)
+{
+	struct ath12k_hal *hal = &ab->hal;
+
+	memset(hal, 0, sizeof(*hal));
+
+	hal->regs = ath12k_wifi8_hw_ver_map[ab->hw_rev].hw_regs;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
new file mode 100644
index 000000000000..311fc5b8015c
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_H
+#define ATH12K_WIFI8_HAL_H
+
+#include "../core.h"
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HAL_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
new file mode 100644
index 000000000000..56d45785ecd4
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "hal_qcn9575.h"
+
+const struct ath12k_hw_regs qcn9575_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00001604,
+	.tcl1_ring_misc = 0x0000160c,
+	.tcl1_ring_tp_addr_lsb = 0x00001618,
+	.tcl1_ring_tp_addr_msb = 0x0000161c,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x0000162c,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00001630,
+	.tcl1_ring_msi1_base_lsb = 0x00001644,
+	.tcl1_ring_msi1_base_msb = 0x00001648,
+	.tcl1_ring_msi1_data = 0x0000164c,
+	.tcl1_ring_base_lsb = 0x000015fc,
+	.tcl1_ring_base_msb = 0x00001600,
+
+	/* REO DEST ring address */
+	.reo1_ring_base_lsb = 0x00000848,
+	.reo1_ring_base_msb = 0x0000084c,
+	.reo1_ring_id = 0x00000850,
+	.reo1_ring_misc = 0x00000858,
+	.reo1_ring_hp_addr_lsb = 0x0000085c,
+	.reo1_ring_hp_addr_msb = 0x00000860,
+	.reo1_ring_producer_int_setup = 0x0000086c,
+	.reo1_ring_msi1_base_lsb = 0x00000890,
+	.reo1_ring_msi1_base_msb = 0x00000894,
+	.reo1_ring_msi1_data = 0x00000898,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+
+	.gcc_gcc_pcie_hot_rst = 0x1e38438,
+
+	.qrtr_node_id = 0x01e03300,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
new file mode 100644
index 000000000000..e2dd68ebd82f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_QCN9575_H
+#define ATH12K_WIFI8_HAL_QCN9575_H
+
+#include "../hal.h"
+
+extern const struct ath12k_hw_regs qcn9575_regs;
+
+#endif /* ATH12K_WIFI8_HAL_QCN9575_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 6e89a42111b6..91d8f762e642 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -11,6 +11,7 @@
 #include "../debug.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "hal.h"
 #include "hw.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
@@ -129,6 +130,8 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 
 	ab->hw_params = hw_params;
 
+	ath12k_wifi8_hal_init(ab);
+
 	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
 
 	return 0;

-- 
2.34.1

