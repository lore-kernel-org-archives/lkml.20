Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FD3442B1D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769594; cv=none; b=NfaYxnrgECHSfAgt3ZF7pZwt4uNcNmLcRUbxZ05w+Kv8g4flCb1wW948nUCAGfqkOtHOtXNClkeGyoMALk8WPrbnP3lCnxErAdZIgivcH/53Oa86PcMshZqoy8Nzqht/V2IoMTwW1VxVYnQ9phXBQWOFzLCGN7apIV5nN7Ul3Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769594; c=relaxed/simple;
	bh=6ilCrygcJVQCwHFjl0W5gSS8nhzKVETMGaO0byKSZ6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFbMrR2myVGsoVy23pC9xH8i0UHZnenwdzNxBe9zY5SCHkMN7fDbdPqE6oypHRf/cVmexbKN/1qTZfKBiJpAkAxyFKQrRP4kwwulHLk1gOVS5IVNprsIidXbL17Ze6jpoFuUtRBVFLSb8+oe8JPLzLGq23Bh8KXLkD/KM3g4EA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxXcsNgF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGCQVteH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxXcsNgF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGCQVteH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777aUh2724317
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVR68Ul/xnzrbUTxNhIxSbewKkviF9tBTQO1ocKFetI=; b=IxXcsNgF6Ybmw/i/
	nt5eP2O/ebvNBTzlXl6KLd3sdeub5YCSvT9SaZtyWyN3IBAiNi7w180xVLZMsRoU
	9Ok7X/Ev1kFSMg7lk/ha4TCSm+9mW26SYrgeks3SWWDgiOCgF0h+3qNyKxqgAZHn
	C9y2WoFvs3mV4I/xMMHQceYz6bzHUo5GZu1BD63SmWajUQy2NcO7+tzZChCfUtZL
	2YpLQC6m0op/NAoLRzRkVxqLzfKA8JRUvdzwNHReH5xuVlOnyuVG2ZuCy2zf/BrX
	2kKCx0VsQ8APz2FjWrnaHqVFRG0pDzA1sgSw18aVBISolZ0LIGltgjVIPvu4kqRn
	1zPA0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxkspq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:26:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so5279516a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769590; x=1789374390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVR68Ul/xnzrbUTxNhIxSbewKkviF9tBTQO1ocKFetI=;
        b=gGCQVteHuIClNWpfvv9EdGS7xeEHQID+r7dbAN/oDuX0Ehsb4GaJErlq9MOF+/TywU
         sdMjKMUW2TIQZA78EVhjf+cJaI8I7FcjoSlao4EMHaW0WAXFl0txDhLzj4EEWXBbSe3o
         oR/LN/6yfW1mbXUQ/GzCTiJdc/VF4F7H6Z6Wml70hF6fn/12LhMgvvofOPzZBMeME5nu
         xMn9eDLxrqe7QLhuErnzNjINLjk+3/DqSOWrFKzrdTT49F8366W8CvSJCWFe9x9ePW0T
         CpAWlXJVzoqPSqahKP8QPKVS5CJHo/fsOsOUTomqHooQQ0ofALb2VNj9yM+67CWMgDj4
         TBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769590; x=1789374390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVR68Ul/xnzrbUTxNhIxSbewKkviF9tBTQO1ocKFetI=;
        b=HC2U5681nlrBjnATLiZQc6zkDKDKmyAD9TvIXZIJdNPbl9ALvKgfMI7LogRi3bmKra
         HV0qSkmA2cyMB50DtoKohwDsv9c8OIFY8SKHjIpJhC30mmlfVnHYMaeqEyUfzaYFFYCm
         /38gIHD+oHyLMrakCzPJMyq3KdCWzJyIfxkd0p9k7Nb4UtKcXdtcf5nYuwd7wBUFmoCn
         gD88OOYeIqs5IGvowuSkOx7qtK/DtbrmgxTAp93NEkHs2SIokKB8P/E56UQGZMZOrvbb
         yO/FZa5YE2MM+yrdukLGKG0QrafVg7OThBLQCvDzD1koImFjpFlptwWRmxU3gd2wT2l7
         0Ntg==
X-Forwarded-Encrypted: i=1; AKwUvBzGNFpoVQaysiu9LCJQqJIRhh97E/2RhZTSA5iriEAI9w8pW8x+34rGQXDBFi5m5827plxHhjLAvo5w918=@vger.kernel.org
X-Gm-Message-State: AFuF++njMZ0L1QhJR7EMOn66i7GHK2/a+6rilMa6eS4GI+QNMfWlojbk
	VOOHgVWed2TsoXo+ZIPY65Vge+0m5q0qTEEMSYil66tzHjdg26b1diHyZ5QnmoSLN09SFYiTRxa
	Fvc7Fc60zPv0LpQpk3SWpTfqgbkPtWWaSvM1w3w/skLtv7Jjw1rh8wFUATyR00yXUS35v3IUXzK
	8=
X-Gm-Gg: AYBFou0sJOfM9KSPtOVEH7RSDb14WxYw514g3STNUYMKaPafNIifEdYeWEmUEdm8jQs
	dX4dxCjSItwoYyCvlllcdGGxVUhjFOfPVKRIBz7KudZj762Vx3mBHZZfi6si3Th+RmLN0X7wKxh
	FYjvBsp56WM204hLSI9CQh85YOoINGNioxEpyLaO+16rFLx8fFfmlDOko1DVk+fxjfmC8FNpFNp
	HlEBBl3ypuzXxLl00JveaPrZ7wCrdI0OjLA77PiXHcWQ2oTtWV4DamXfGS0PsuT5IDddnFuAyzX
	1SVOK58TngSS8OKIpvrmvNxIoaC5u3J5BP201W3OdG8AnzyFPzW4PSWqP+Ovvy/Xq4+AMxj7opG
	wdubRBT5Uk66S8e5x5iU4eU0c
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr30533067a91.11.1788769590337;
        Mon, 07 Sep 2026 01:26:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr30533020a91.11.1788769589929;
        Mon, 07 Sep 2026 01:26:29 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm3423284eec.14.2026.09.07.01.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:26:29 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:56:14 +0530
Subject: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
In-Reply-To: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfXyac01Q/sNqzr
 mM0LeG6rsJPsl9YEfc+FwzT8erf69/qS/Z90zuOKmtd6lN3cYGyhFRgmUEtUFJY6f9Jvpmu3eql
 MkRbKYiPAoOU3M3iY4tHvZKdA7jOpWDuAe59ueOdirkRFlYBQlAOphvM0dl2naFrkwzT7ZSiDWk
 vc78CaEGVgiQs4O07syI7NwQl5oIphjuIzW9WXimByxg2FiY1S8Icw7q78YlNEnSloBxZ91BrQP
 0KRWSq5x+hecnZ/sbwbFH8Nou1/GJBPtjRbTV95mLiFjXFSfk1qN+pjxS8E9a0nvc3mv65gzV1z
 U8kvdzZB2Z3jzSUuwXTwALv1CobLSHW+gj/z0KwG7+vGlntS2SPzxjkwgJJw2rhUcJC+O04xnol
 IkAOKFfSAd9UTm+VsICQfOdUsexCVInORLFQ/yT0iYr+yNxWdSCsa2MQSLij+1rKzB/bgplCyuq
 DCuisF8g5DMqnmAIu2g==
X-Proofpoint-GUID: EU7vNlEzqhdDmhu-XRLxd2LHKdylwECk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX/pnOx1nUy4R6
 Aamd9OXX50VZQymkwl6GeV1M7N9DhgoZ/lhcwl5aZEvWg0CWXxNOlx0923Q7y6ys2H79eaAQx9X
 kjliOXZqrG0Hddl/eBWovedpd3XzGLo=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e7537 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=1x_EA7c-f_fbMv8ZdKgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: EU7vNlEzqhdDmhu-XRLxd2LHKdylwECk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070090

Add bindings documentation for the Nord DisplayPort Receiver (DPRX) Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
 2 files changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fbaaad1f3db3ff67589d6201ed0e25710c044614
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DPRX Clock & Reset Controller on Nord
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm dprx clock control module provides the clocks, resets and power
+  domains on Nord.
+
+  See also:
+    include/dt-bindings/clock/qcom,nord-dprxcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-dprxcc0
+      - qcom,nord-dprxcc1
+
+  clocks:
+    items:
+      - description: XO clock source
+      - description: DPRX CFG AHB clock from NWGCC
+      - description: Sleep clock source
+
+  power-domains:
+    description:
+      MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      MMCX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@a940000 {
+      compatible = "qcom,nord-dprxcc0";
+      reg = <0x0a940000 0xc000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
+
+/* DPRX_CC clocks */
+#define DPRX_CC_AHB_CLK					0
+#define DPRX_CC_AUD_CLK					1
+#define DPRX_CC_AUDIO_CLK_SRC				2
+#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
+#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
+#define DPRX_CC_CORE_RCG0_CLK_SRC			5
+#define DPRX_CC_CORE_RCG2_CLK_SRC			6
+#define DPRX_CC_CORE_RCG3_CLK_SRC			7
+#define DPRX_CC_MDP_MEM_CLK				8
+#define DPRX_CC_MMCX_XO_CLK				9
+#define DPRX_CC_PLL0					10
+#define DPRX_CC_PLL1					11
+#define DPRX_CC_VID_MEM_CLK				12
+
+/* DPRX_CC resets */
+#define DPRX_CC_DPRX_BLK_BCR				0
+
+#endif

-- 
2.34.1

