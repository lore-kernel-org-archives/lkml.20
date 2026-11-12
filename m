Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472412;
	b=Xzr1oj7yclwjmVCZQJQGVBpzTGyCLF2LqMTDhbVZB75g7rbCHKDHRMINXzbKmFp7qcWO
	 aDeZT5mtdUoQ6KwV5y2Mkr7a+5NuVIdvmi9OVpZc/8U95qmm7WoV6YmxExRVNFObWAXXN
	 OuPZOm1GD7oKv/O+rY5FHoSxYlifcE8COEOCZdKKcSYL3SrCI1RCm6ZSNFCsCWZ3LArzA
	 D20nJXXBe9BeGcUiC7Y1hR4Ebyu75P6LR0uU5NVTzzxNDlth1BHR+J0TXU6LTod2T37IN
	 FfaoRMwkUKcamqV6lVHN/i6W+AYrv9dnL4XqKMtQrc45eeyrD+aFS01mdY3bs7DDkKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
	b=WWUuIol617mZgqjeJd7IN+6LIGCOGd39IFtPnLlmArqeHyKHvKlw9mWBJmNPvuvrtoLa
	 Uq4/L2qQ5w8mzxmbzkNUVlGQ8x1qjLZUGT4tl5oQmI1vFGkJvkzfi1lAgVfMha+mdUkm5
	 cu6pZfCirgTmHZe2GchctFdff7faIJVUWqfIqo5xwhWp6Ow88x0DGHku7sl4jemogB/EP
	 VeNXYJKycEM7z4d4+lkcZOwr2DXL135SeBFD5mNgCpsmD2hvTEAD/ydksf0WpAzRa/rsy
	 ugPsqzHKjh8YTHYM5iyQNmwxPfj0nV+s4oYeFD3dzZqwg0pPv8TTyxI5l4T3Z1AFYoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YjHh/NWS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HmmQ5a0z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF5B606A8A6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF5B606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YjHh/NWS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HmmQ5a0z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZsEi4092872
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=YjHh/NWSxVqpHQQX
	6O/19nLrWv3JzxjaKQ0N4A59qitzmX81mdV3g+XWNi9RGD1YURuekKgBGU4WkqL8
	msqEpZX+c/3dJiiuXE5nFUCrEInIP47NEqeLviLLpiUSdK84OOqKvcDS4SSvKPIC
	uvHBIsoGQkRTZQVeNbz/rNJuyqWPlfbLjnCpIH9NJhjLZy3sCiFwlB1DOIWkXgFx
	TvpSx85jDMwU7WfKwmX/7b/eSyIp6ykyeV7kUUU7R8AHYdJm2JJ3s5MJGJWKlq6D
	q/N71X7zNwRC7RNkn/9NZr8P5G3Wf+WZDMNj+yX31xHhCCN7ds7WrS8oB6hWFChu
	QdMDpw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hy7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b09a466295so168090a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472410; x=1795077210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=HmmQ5a0z19Aw/JCre0PFHGkQGYWjSN9OwcaIPY1RgDLMZx2o21fDcop3JkhPzTA4ey
         qGg8SVY9yptzaHaIZ623k4BxVXxwYQMv6H4cYVgWjRyOeDCz3TMA2QwU+GYcBCK3e0X6
         9RAwfGMOyJXtxtyktJ/CNNTtqLQI72GfYNganT8TPM4v/ygs5KIg3pi3nEBidVD+C/zd
         UhuUSKUU19XpozD/XxcKq46CJcClajpBmE9W6pjwhpBDMnY14qtnHuQPdgG3b+CUu3mH
         EBMXEVChEy19CwSbRHHUsckd9gbDryxUneIDWcK/OxUUH2hs2w6exd+yYsTuCjm+Zkug
         QwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472410; x=1795077210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=EtiHB7RDDLaZXPiGf342QG0R4CvEZGAac6sYgjzXotOKgd2ZXEVZXRbl/6n6NkEPD/
         oznJ1dl7/VFEHXOD67nsyOxDRZYLLa/Q3GN9FsU+fCjY/CtlwP8ozOWs1z3apSrIpStk
         qXTsYd34S5PokDhnEdFwdpztlKlofmvjebe6vO3E7u7XvgcqYY9Q1GzgxKH+Viz77Upr
         Ai6AzPYHTKbtvZjfuqhEJPfSpeZSlv97hL70FCuUoxPJkzPdFwCqPZUne2qrCAwAgWZK
         h/a8uib8se1zxAEGfnnyCRzoVij2cB/rIOs7MuhioD3zKYblLwEnER4Losz8KUixZtVl
         jX5w==
X-Forwarded-Encrypted: i=1; AL+hErFkq8hxFrpePzxI7T3MRh+lZKzYsgy3y13KisYxGIVSq43yiInQrZMDwYbGW235t7XWgVb+NO5GHJdubZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z++ehJrHdgQ8QdG7C/9HDDnkgdPbxtvIkFndkr0wE74B4+rjZxY
	LZ9sXD5rQ5K3LemMWNPNREMaJGLAc8/5JtOK1AYWvVphVWYdWb3W2AddBUInHU5ZhkegjOBiXnl
	gaj4Q3vwPOd/aEZyR47hkXu0ogB1a4ZEBw/57ckGeqfnTuGofbPxaIOkITW8OQAs2DxA=
X-Gm-Gg: AYBFou2weUQCN3gc52XecTBkjJ6m5JrxmeF3e8749WYbGJJLAe/UdLBvwjGvLbphoq+
	XRqyNcDFar+ZJwjL6nrG7tIiQxUDQNTj2/ZAXesB+SHlULJ+9V9rB+ASBMhjJjqDb/Ei9ZbHVND
	vJgtyV8ZyMS84htNUc5FFZJn6b6smd8r3s6RPrbVRqMZ3O+pxDT7rYtslafl2KHpWv7yOkLjxFN
	2A1t/9d4mZLTjFnV7FaIaau1xAmbi9vZ7NqD3diMO2AAQlZxV941kmmKl6oqyX9WJc7aZrKLY+d
	xDEjkNbrEDu4X4T5lFJAt+2kCpmPzbGD9kstACd3zG18lIp50f9yC/GhawxenCjfBe36SIDeucQ
	BZ7pwxCruGRvhwPh0M/V1BS4R2T6cRMCnrFqInaJlMvriZJoy+3AxoHYVC463PeLqLGW+z1JzVb
	P5EIxjeiK+QcxgbHav+QqekLFT1ZBpWrYVopOfhjkoXibs5suWkaQkHjNbWwMlFqklm80ViSOQ6
	w==
X-Received: by 2002:a17:90b:1e47:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b182e030a6mr4671821a91.7.1794472409549;
        Thu, 12 Nov 2026 00:33:29 -0800 (PST)
X-Received: by 2002:a17:90b:1e47:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b182e030a6mr4671784a91.7.1794472408781;
        Thu, 12 Nov 2026 00:33:28 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:28 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:26 +0530
Subject: [PATCH ath-next 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
 QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-12-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX0/jvWegE9yxw
 rkBQ4s/io9HM3zSxZXMfRVDpl+8YPYvj4lnBkCKQ+Dv6VxKW0x8oxkXcgeLarVyeJlG6LImoo83
 4B0nxE4K31ffdlmmH2ZwN5fJseFebhI=
X-Proofpoint-GUID: zHetso2Omw1jI18mrveE54EOEC-YxJh7
X-Proofpoint-ORIG-GUID: zHetso2Omw1jI18mrveE54EOEC-YxJh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXxr5fPl9eYyl8
 TpvmXxGbszyEnKBhhLKXMb+vVCOg/0U3gwdxDx1j5ZdDsDNRVE/89cKH4+lbjyg9Y5l8V8HatWl
 sQy48POayzzfPcKkZ7xW0rWYj28dQdIP21dqOVqtr2GBdn3Aei03rwoOkKDJ/+C3FkTwTmUI7Hh
 6GWWxBZfmXusB5Ub9/YTDJeJXVyykWXrynY65BDnk45D/eGarkj8lR9MOGVoAKeZcyRSkFrfRmn
 tBWwT8J5tmaFxSQYQCsu/Al3Z6R746YenOrYZl4m+T4Pb0NqKbIU9z6hQ9FIGMGJaRpvYYRW01D
 j1xJ/QY7P8yvnaE9yAg60YYRVcipxKwcXppUWmToi+llQjJEiRKJLtifOSinlvdqaEaI5Wt26Mn
 AMrqW1rML4sKk8UTvBH3sEum9yTzolOJVQOM4FjGKjFWPz2CbjOwCxOeTfs+viZn55Rf5rc66p/
 dpF38gNSUgDCaF6L//Q==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af579da cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Implement the WMI resource configuration for QCN9575.

Add ath12k_wifi8_wmi_init_qcn9575() in wifi8/wmi.c to populate the WMI
resource configuration struct used during firmware initialization, setting
vdev and peer counts, RF TX/RX chain masks, scan and power-save limits, EMA
and TWT parameters, and peer metadata version. Set the QCN9575 hw params
wmi_init pointer to ath12k_wifi8_wmi_init_qcn9575 and build wifi8/wmi.c
from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h           |  2 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c    | 57 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h    | 13 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 96776c6e2050..b8045b33ca0d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -77,6 +77,8 @@
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
+/* host supports peer map v3 and unmap v2 */
+#define TARGET_PEER_MAP_UNMAP_VERSION	0x32
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
 #define ATH12K_HW_MAX_QUEUES		4
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 3717b00741fd..989e640c7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -6,4 +6,5 @@ ath12k_wifi8-y += ce.o \
 		  hal_qcn9575.o \
 		  hw.o \
 		  mhi.o \
-		  pci.o
+		  pci.o \
+		  wmi.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index fa64b865b931..74873fc5f3f3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -16,6 +16,7 @@
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
+#include "wmi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -70,7 +71,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
-		.wmi_init = NULL,
+		.wmi_init = ath12k_wifi8_wmi_init_qcn9575,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.c b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
new file mode 100644
index 000000000000..c575cae2582d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../core.h"
+#include "wmi.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	config->num_peers = ab->num_radios *
+		ath12k_core_get_max_peers_per_radio(ab);
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_version = TARGET_PEER_MAP_UNMAP_VERSION;
+	config->twt_ap_pdev_count = ab->num_radios;
+	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.h b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
new file mode 100644
index 000000000000..a66ede369ba3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_WMI_H
+#define ATH12K_WIFI8_WMI_H
+
+#include "../core.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config);
+#endif

-- 
2.34.1

