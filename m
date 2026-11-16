Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824404;
	b=POx6v8tMm4nJBgQ4zHqQLPHdoPzXTP6NIQxeQHBFNhFXf9IGc3f3RM9W3SKskKQxTG33
	 Jl0ch+RN6USSHYpp24O57zEa9/uLJay5o8eIios+G9cBSSKKAQjO7JSXjsZrviuGXVAaf
	 NDgVQIxaWg07aeNCfMtD6zwram9toFCcdj66beYtK8IA0ske6qcmJSGvtXWP/speWylgx
	 7xA8JmCzbkaWNkvBbzXOoBVjOBO/OMO1psSzHO1BLiyQOmu+RCVVSNeeFZr3ZXF3aBgLA
	 LHIa2gb37m4HgD3sz6+WvJY9KBF87KMPPWKig+1SyUhHX/WSRmnUmPc68LUNydYpomg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qrLy5z6Dmk9L6TkgVgW6znV4rrxPY2PdTrmHjIa1C5E=;
	b=iA43D/I9OSxDyCUexIBWxiYKZxkTW4HS3Ovn8glfg1EJpYq2/4gSWuXDaUAJiiTGyblB
	 viVPO8D+bKQVFjKt4OGbdhEjf2dD/3zyLMvhHWd1X1QvfTPJqbG79BS6A4Far/xIL20Uh
	 bciWi/MYFaaTuac3am5RicyXXa6hwHNAsKBaJ5/i8X4F0HFP+uZn6NEybUichDTSlKNlt
	 AsZbvA2id2I5ClGaE8/R2DSjfKoEO6mi/c812MoMo+oHVShLka1CTbw+dbtVRshr0riVX
	 UOh+KQe9ZVwgDvJbfEhomDhEMRF74//t/bfvQI1K4wtQYhulbiWQ01UaSfs6KzQLxVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YtcpUWWP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9oBAs2H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4266F606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4266F606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YtcpUWWP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9oBAs2H
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGA2kR2953476
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrLy5z6Dmk9L6TkgVgW6znV4rrxPY2PdTrmHjIa1C5E=; b=YtcpUWWPsyy3uGy2
	TO7WjmUqoQd0U59lkN9b1p3fMn050jNRMCMRF8pq0TqNn8JB9Viq60v+EjFanXcf
	aDaThESNSiT+11VTjU6iWVAgMUUgSgHvBYvRTA3kGwgh999//oFCRntvcv8hTriF
	c0qlT/iMdtQaEDrOJ2MZBzykOU8dgK4DXrz0K/jI7vhLISXdRx/9McIVeP6hpMyG
	4aJtGooCHRXllM4v81b92BkJldNCTVOOkwTcrjycSPZL86VyDONOhIfITkUI2kna
	pQ6wJLctPMsS++cN8VYoiQhxwkbIDjF8w4v8VV1JOMqZyZIqcLahf8IQwm+w6aMT
	oQ0DwQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqy827s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so2685390eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794824400; x=1795429200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrLy5z6Dmk9L6TkgVgW6znV4rrxPY2PdTrmHjIa1C5E=;
        b=O9oBAs2Hxdjjirr/c7w2O3Rw3sK8otrp1MWWVa3GZUDbwoYE8djnp1AI3YpAIhAgaV
         7BJA0tKsnX1Bi/xlXL6LomowoGyevBxPMhNczkloAHXsH9bNMSsZRcsGmqvqFBS1XGLx
         B1vziC26H2ga8mUsxbUOK7VHw4ABdji1L+sHXl2e2GhaqShoO6TjawBMLh4QkSoVeLkG
         OGTuJOxCZqfXAIyoJGApnhB1krE2AMFJKL1QdHNIJS/IdhpMxWLJJJFpGg4sBBPhNp2Z
         wEuIgGRE/+Z5a0rUv02rFzS+rcwsB7liC7BpctHUDmD4aVa6OQ62cZ1R8ZsgGA/p4gyu
         36Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824400; x=1795429200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrLy5z6Dmk9L6TkgVgW6znV4rrxPY2PdTrmHjIa1C5E=;
        b=08nZeHAdQrbaj0vxD7pBsUDYoi4rLMrINBbmnMHnKsBOuCxha0pnBkr+pVWug4XBT9
         6zDIkq7ornMa0iFh5iEGhOt4VVkqKXVxsjaNqQtAFVDXFxyq4hAFMFpISRdir+Ebqc++
         jmsRlnRBe+kWHnXpbcsQQtIPiG9eEg+m7lMEg+m34DMKLaSJvjIBdf+tRRPNOX3ahw/U
         qPo47SWHxgp4IDdR71pS4lSXkhUPhb57CiYMfAFKNuYHFrE7pxrtC08mMnDt0686efJQ
         iitbEJCLTAITDfnVCXW69Mal805fRHUpaCCMa7MMA9FZlhR/xUHYWsI3NgV/xdtfRzPb
         cDJg==
X-Forwarded-Encrypted: i=1; AL+hErEZi/e83Qm2A4GWM/BJyPJWnaYylEecBxlhFTS6XffrDSM01fH53ktkstvvLlZrcEcSkxUQZJH5qGrOaDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+16dnJ9ltQtcKFuR5RPwZVorWLVkYePvsrlTmIcmjYbFFr/m7+
	I8Pld7CKWKM9G7bbp3Pu8z91sAzwqHC4taDZZFk1O7sSIzMkOIaZFy0eWr5MksnH3+SYDNEzham
	t+SdiAZqNfrg3dw620fc9iGPjzm1JcwJPxZAZSYsyCGNebDj4Geaf9pvhy4Zdg0p8v64=
X-Gm-Gg: AYBFou36i74GEcmv56o7cq2TY+60vQDjt/Ms49LWHfsFuQ/KxHqxR3lCduG/eHGlhS5
	HV8Ou7oH/wxt6tJfC9Tbe1iEbBrztmwBD5wU/XY9ysHB0ij/uc1LV8UP4BMaaoIKfhXZLEsXQvT
	FQT+N901O9sTgiM0p1dQ0iIRKCA68eDtAFVJ1FI3hAJQ3vi2DKeWGWDhNcUzkONmNYlUbjubeFz
	d5M5dYU488TG22ZOyyt/tnOeWLtEbAW9Blflsl1nWyGjzhN0mmJuxx4cR8DmUHLM0K8enryl4y2
	zi1O51IxKsYAA/Q28xmem9YEFgfSDYCY3GMURN2cuVyS3uk3tCu18WvnReIPmOvDhOa2O89CK9L
	XGeVacgwZ5+eB3efer3+6Sh6PLGIPbOHqkd3swIPNh0LHxbgJAGb7rjfw7LcsQ6BjC4s9YYYfNM
	w422AtD3lJIr9fusOc
X-Received: by 2002:a05:7301:1887:b0:36d:6a77:960a with SMTP id 5a478bee46e88-37963564b9fmr9267313eec.1.1794824399199;
        Mon, 16 Nov 2026 02:19:59 -0800 (PST)
X-Received: by 2002:a05:7301:1887:b0:36d:6a77:960a with SMTP id 5a478bee46e88-37963564b9fmr9267276eec.1.1794824398348;
        Mon, 16 Nov 2026 02:19:58 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32599557eec.26.2026.11.16.02.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:19:57 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 02:19:50 -0800
Subject: [PATCH v3 3/4] clk: qcom: Add NSS clock controller driver for
 IPQ5210 SoC
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
Message-Id: <20261116-qcom_ipq5210_nsscc-v3-3-1eaf92698379@oss.qualcomm.com>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794824393; l=67259;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=0DaSP1QLd+SGh9mjpwBhyH3XfJ1/56gxydbET/cbJlM=;
 b=+Sy3EaOXdGjy9xbsPCzGgEGw/ceyKcyWXBwQpqY+eKuAwnmgapIw9ZzYya2iSyYIPi5Kyq5fz
 xT0ytQa5fbbAky4jsGQUOBC0XN0qemuzarGNa/g705l3/haSGJ8qPZ5
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfX0LOqaHHh2GR6
 4NxKbpm8AKuB3ECNHANBjlaQN5V6pU1uGPnuccm9aWXJhAJbeiK7JqzVO2+imYzNHm92QMx958A
 amalUdvmPNNgUmGvZn7osF3TkkCnTmo=
X-Proofpoint-GUID: DtFgDpo-fP_2b_26XKrbqchDHVoKj7HS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfX7JcpduvYsFdT
 QGDXson7Q5NbjcSt01RxqetoHuVH/DYnYdRKHcKYpQZexHoEJ0dxqSJydqZgE2luwVfUbubivJX
 03NE/80yBy7wjQC8uWMDv6+MtK23ehfgu8+jTXGV+fPLUQtQJBkgp/w3Y3EQX8DRvgBcSOs6IuD
 LnL7g2BnkK840GG0P9rgCR0NOofs1Zv1ZirXUAFu14s6oZMM0HTaW1u/mVCKqrPZRx6VAs3CooZ
 EZdwkWLK56GaKh9i1aRlMmCxQdK5kjUEdquy5QyaJCGluWbUUBoTuXOZjpoU4aEpr6ImlsB+sk8
 Gj0txcji50v2odNtM39wRtaZTxFlycUyKVFd85O7jz7ziYlpTSKHp0GBKiFm3Rl9jebhZPoH20g
 yvLp24Dd2ZqT+oNWz3l/uaj8cugeJ2Li7qRny7hpXeeDLjxUNH1pRblIbM33fADa1fyWylXqhBv
 sFSVNtNwgxVohWjd+Ww==
X-Proofpoint-ORIG-GUID: DtFgDpo-fP_2b_26XKrbqchDHVoKj7HS
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afad8d1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9NNFwX1Lmsrkzrh2ROEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160040

The NSS (Network SubSystem) clock controller provides the clocks and resets
to the networking blocks such as PPE (Packet Process Engine), UNIPHY (PCS)
and the integrated Ethernet PHY on IPQ5210 devices.

The icc-clk framework is used to enable NoC related clocks to create paths
so that the networking blocks such as PPE can connect to these NoCs.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |   12 +
 drivers/clk/qcom/Makefile        |    1 +
 drivers/clk/qcom/nsscc-ipq5210.c | 2201 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 2214 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e6c58e8b1849..a63f568b1405 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -737,6 +737,18 @@ config IPQ_GCC_9650
 	  i2c, USB, SD/eMMC, etc. Select this for the root clock
 	  of ipq9650.
 
+config IPQ_NSSCC_5210
+	tristate "IPQ5210 NSS Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	depends on IPQ_GCC_5210
+	default m if ARCH_QCOM
+	help
+	  Support for NSS clock controller on ipq5210 devices.
+	  NSSCC receives the clock sources from GCC and CMN PLL.
+	  It in turn supplies the clocks and resets to the networking hardware.
+	  Say Y or M if you want to enable networking function on the
+	  IPQ5210 devices.
+
 config IPQ_NSSCC_5424
 	tristate "IPQ5424 NSS Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f84d7343a3a4..a0d9b50f2caf 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
 obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
 obj-$(CONFIG_IPQ_GCC_9574) += gcc-ipq9574.o
 obj-$(CONFIG_IPQ_GCC_9650) += gcc-ipq9650.o
+obj-$(CONFIG_IPQ_NSSCC_5210) += nsscc-ipq5210.o
 obj-$(CONFIG_IPQ_NSSCC_5424) += nsscc-ipq5424.o
 obj-$(CONFIG_IPQ_NSSCC_9574)	+= nsscc-ipq9574.o
 obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
diff --git a/drivers/clk/qcom/nsscc-ipq5210.c b/drivers/clk/qcom/nsscc-ipq5210.c
new file mode 100644
index 000000000000..5607471caf20
--- /dev/null
+++ b/drivers/clk/qcom/nsscc-ipq5210.c
@@ -0,0 +1,2201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/interconnect-provider.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,ipq5210-nsscc.h>
+#include <dt-bindings/interconnect/qcom,ipq5210.h>
+#include <dt-bindings/reset/qcom,ipq5210-nsscc.h>
+
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+/* Need to match the order of clocks in DT binding */
+enum {
+	DT_XO,
+	DT_CMN_PLL_NSS_CLK_375M,
+	DT_CMN_PLL_NSS_CLK_429M,
+	DT_GCC_GPLL0,
+	DT_UNIPHY0_NSS_RX_CLK,
+	DT_UNIPHY0_NSS_TX_CLK,
+	DT_UNIPHY1_NSS_RX_CLK,
+	DT_UNIPHY1_NSS_TX_CLK,
+	DT_UNIPHY2_NSS_RX_CLK,
+	DT_UNIPHY2_NSS_TX_CLK,
+	DT_GCC_NSSCC_CLK,
+	DT_EPHY_RX_CLK,
+	DT_EPHY_TX_CLK,
+};
+
+enum {
+	P_XO,
+	P_CMN_PLL_NSS_CLK_375M,
+	P_CMN_PLL_NSS_CLK_429M,
+	P_GCC_GPLL0,
+	P_UNIPHY0_NSS_RX_CLK,
+	P_UNIPHY0_NSS_TX_CLK,
+	P_UNIPHY1_NSS_RX_CLK,
+	P_UNIPHY1_NSS_TX_CLK,
+	P_UNIPHY2_NSS_RX_CLK,
+	P_UNIPHY2_NSS_TX_CLK,
+	P_EPHY_RX_CLK,
+	P_EPHY_TX_CLK,
+};
+
+static const struct parent_map nss_cc_parent_map_ppe_cfg[] = {
+	{ P_XO, 0 },
+	{ P_GCC_GPLL0, 2 },
+};
+
+static const struct parent_map nss_cc_parent_map_ppe[] = {
+	{ P_XO, 0 },
+	{ P_CMN_PLL_NSS_CLK_429M, 6 },
+};
+
+static const struct clk_parent_data nss_cc_ppe_parent_data_ppe_cfg[] = {
+	{ .index = DT_XO },
+	{ .index = DT_GCC_GPLL0 },
+};
+
+static const struct clk_parent_data nss_cc_ppe_parent_data_ppe[] = {
+	{ .index = DT_XO },
+	{ .index = DT_CMN_PLL_NSS_CLK_429M },
+};
+
+static const struct clk_parent_data nss_cc_ppe_parent_data_eip[] = {
+	{ .index = DT_XO },
+	{ .index = DT_CMN_PLL_NSS_CLK_375M },
+};
+
+static const struct parent_map nss_cc_parent_map_port1_3_rx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_NSS_RX_CLK, 3 },
+};
+
+static const struct parent_map nss_cc_parent_map_port1_3_tx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_NSS_TX_CLK, 4 },
+};
+
+static const struct parent_map nss_cc_parent_map_port4_rx[] = {
+	{ P_XO, 0 },
+	{ P_EPHY_RX_CLK, 1 },
+	{ P_UNIPHY0_NSS_RX_CLK, 3 },
+};
+
+static const struct parent_map nss_cc_parent_map_port4_tx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_NSS_TX_CLK, 4 },
+	{ P_EPHY_TX_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_xo_ephy_uniphy0_rx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_EPHY_RX_CLK },
+	{ .index = DT_UNIPHY0_NSS_RX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_ephy_uniphy0_tx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY0_NSS_TX_CLK },
+	{ .index = DT_EPHY_TX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_uniphy0_gcc_rx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY0_NSS_RX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_uniphy0_gcc_tx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY0_NSS_TX_CLK },
+};
+
+static const struct parent_map nss_cc_parent_map_port5_rx[] = {
+	{ P_XO, 0 },
+	{ P_EPHY_RX_CLK, 1 },
+	{ P_UNIPHY1_NSS_RX_CLK, 3 },
+};
+
+static const struct parent_map nss_cc_parent_map_port5_tx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY1_NSS_TX_CLK, 4 },
+	{ P_EPHY_TX_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_xo_ephy_uniphy1_rx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_EPHY_RX_CLK },
+	{ .index = DT_UNIPHY1_NSS_RX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_ephy_uniphy1_tx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY1_NSS_TX_CLK },
+	{ .index = DT_EPHY_TX_CLK },
+};
+
+static const struct parent_map nss_cc_parent_map_port6_rx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY2_NSS_RX_CLK, 3 },
+};
+
+static const struct parent_map nss_cc_parent_map_port6_tx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY2_NSS_TX_CLK, 4 },
+};
+
+static const struct clk_parent_data gcc_xo_uniphy2_rx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY2_NSS_RX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_uniphy2_tx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY2_NSS_TX_CLK },
+};
+
+static const struct freq_tbl ftbl_nss_cc_ppe_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(429000000, P_CMN_PLL_NSS_CLK_429M, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_ppe_clk_src = {
+	.cmd_rcgr = 0x3ec,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_ppe,
+	.freq_tbl = ftbl_nss_cc_ppe_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_ppe_clk_src",
+		.parent_data = nss_cc_ppe_parent_data_ppe,
+		.num_parents = ARRAY_SIZE(nss_cc_ppe_parent_data_ppe),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+/*
+ * The XGMAC PTP reference clock rate needs to be configurable, so the
+ * PTP reference dividers use the writable divider ops. CLK_SET_RATE_PARENT
+ * is not set, so that the rate change only updates the divider and does
+ * not change the shared PPE clock.
+ */
+static struct clk_regmap_div nss_cc_xgmac0_ptp_ref_div_clk_src = {
+	.reg = 0x3f4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac0_ptp_ref_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac1_ptp_ref_div_clk_src = {
+	.reg = 0x3f8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac1_ptp_ref_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac2_ptp_ref_div_clk_src = {
+	.reg = 0x3fc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac2_ptp_ref_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_ipe_clk = {
+	.halt_reg = 0x424,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x424,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_switch_ipe_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_btq_clk = {
+	.halt_reg = 0x42c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x42c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_switch_btq_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_clk = {
+	.halt_reg = 0x434,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x434,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_switch_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_cfg_clk = {
+	.halt_reg = 0x43c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x43c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_switch_cfg_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_edma_clk = {
+	.halt_reg = 0x440,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x440,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_edma_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_edma_cfg_clk = {
+	.halt_reg = 0x448,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x448,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_edma_cfg_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port1_mac_clk = {
+	.halt_reg = 0x44c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x44c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port1_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port2_mac_clk = {
+	.halt_reg = 0x454,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x454,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port2_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port3_mac_clk = {
+	.halt_reg = 0x45c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x45c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port3_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port4_mac_clk = {
+	.halt_reg = 0x464,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x464,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port4_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port5_mac_clk = {
+	.halt_reg = 0x46c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x46c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port5_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port6_mac_clk = {
+	.halt_reg = 0x474,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x474,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port6_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_pon_clk = {
+	.halt_reg = 0x47c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x47c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_pon_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac0_ptp_ref_clk = {
+	.halt_reg = 0x488,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x488,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_xgmac0_ptp_ref_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_xgmac0_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac1_ptp_ref_clk = {
+	.halt_reg = 0x48c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x48c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_xgmac1_ptp_ref_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_xgmac1_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac2_ptp_ref_clk = {
+	.halt_reg = 0x490,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x490,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_xgmac2_ptp_ref_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_xgmac2_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ppe_clk = {
+	.halt_reg = 0x4a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nssnoc_ppe_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ppe_cfg_clk = {
+	.halt_reg = 0x4a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nssnoc_ppe_cfg_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_rx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_rx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port1_3_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port1_rx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port1_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY0_NSS_RX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+	FMS(378788000, P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port1_rx_clk_src = {
+	.cmd_rcgr = 0x4b4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port1_rx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port1_rx_div_clk_src = {
+	.reg = 0x4bc,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port1_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port1_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_tx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_tx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port1_3_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port1_tx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port1_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY0_NSS_TX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+	FMS(378788000, P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port1_tx_clk_src = {
+	.cmd_rcgr = 0x4c0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port1_tx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port1_tx_div_clk_src = {
+	.reg = 0x4c8,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port1_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port1_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port2_rx_clk_src = {
+	.cmd_rcgr = 0x4cc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port2_rx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port2_rx_div_clk_src = {
+	.reg = 0x4d4,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port2_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port2_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port2_tx_clk_src = {
+	.cmd_rcgr = 0x4d8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port2_tx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port2_tx_div_clk_src = {
+	.reg = 0x4e0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port2_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port2_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port3_rx_clk_src = {
+	.cmd_rcgr = 0x4e4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port3_rx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port3_rx_div_clk_src = {
+	.reg = 0x4ec,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port3_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port3_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port3_tx_clk_src = {
+	.cmd_rcgr = 0x4f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port3_tx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port3_tx_div_clk_src = {
+	.reg = 0x4f8,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port3_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port3_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_rx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 5, 0, 0),
+	C(P_EPHY_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_rx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+	C(P_EPHY_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_rx_clk_src_312p5[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+	C(P_EPHY_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port4_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port4_rx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port4_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY0_NSS_RX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port4_rx_clk_src_312p5),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port4_rx_clk_src = {
+	.cmd_rcgr = 0x4fc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port4_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port4_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port4_rx_clk_src",
+		.parent_data = gcc_xo_ephy_uniphy0_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_ephy_uniphy0_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port4_rx_div_clk_src = {
+	.reg = 0x504,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port4_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port4_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_tx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 5, 0, 0),
+	C(P_EPHY_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_tx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+	C(P_EPHY_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_tx_clk_src_312p5[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+	C(P_EPHY_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port4_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port4_tx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port4_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY0_NSS_TX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port4_tx_clk_src_312p5),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port4_tx_clk_src = {
+	.cmd_rcgr = 0x508,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port4_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port4_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port4_tx_clk_src",
+		.parent_data = gcc_xo_ephy_uniphy0_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_ephy_uniphy0_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port4_tx_div_clk_src = {
+	.reg = 0x510,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port4_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port4_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_rx_clk_src_25[] = {
+	C(P_UNIPHY1_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY1_NSS_RX_CLK, 5, 0, 0),
+	C(P_EPHY_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_rx_clk_src_125[] = {
+	C(P_UNIPHY1_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY1_NSS_RX_CLK, 1, 0, 0),
+	C(P_EPHY_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_rx_clk_src_312p5[] = {
+	C(P_UNIPHY1_NSS_RX_CLK, 1, 0, 0),
+	C(P_EPHY_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port5_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port5_rx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port5_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY1_NSS_RX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port5_rx_clk_src_312p5),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port5_rx_clk_src = {
+	.cmd_rcgr = 0x514,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port5_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port5_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port5_rx_clk_src",
+		.parent_data = gcc_xo_ephy_uniphy1_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_ephy_uniphy1_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port5_rx_div_clk_src = {
+	.reg = 0x51c,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port5_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port5_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_tx_clk_src_25[] = {
+	C(P_UNIPHY1_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY1_NSS_TX_CLK, 5, 0, 0),
+	C(P_EPHY_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_tx_clk_src_125[] = {
+	C(P_UNIPHY1_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY1_NSS_TX_CLK, 1, 0, 0),
+	C(P_EPHY_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_tx_clk_src_312p5[] = {
+	C(P_UNIPHY1_NSS_TX_CLK, 1, 0, 0),
+	C(P_EPHY_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port5_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port5_tx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port5_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY1_NSS_TX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port5_tx_clk_src_312p5),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port5_tx_clk_src = {
+	.cmd_rcgr = 0x520,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port5_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port5_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port5_tx_clk_src",
+		.parent_data = gcc_xo_ephy_uniphy1_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_ephy_uniphy1_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port5_tx_div_clk_src = {
+	.reg = 0x528,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port5_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port5_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_rx_clk_src_25[] = {
+	C(P_UNIPHY2_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY2_NSS_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_rx_clk_src_125[] = {
+	C(P_UNIPHY2_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY2_NSS_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port6_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port6_rx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port6_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY2_NSS_RX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY2_NSS_RX_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port6_rx_clk_src = {
+	.cmd_rcgr = 0x52c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port6_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port6_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port6_rx_clk_src",
+		.parent_data = gcc_xo_uniphy2_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy2_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port6_rx_div_clk_src = {
+	.reg = 0x534,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port6_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port6_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_tx_clk_src_25[] = {
+	C(P_UNIPHY2_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY2_NSS_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_tx_clk_src_125[] = {
+	C(P_UNIPHY2_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY2_NSS_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port6_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port6_tx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port6_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY2_NSS_TX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY2_NSS_TX_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port6_tx_clk_src = {
+	.cmd_rcgr = 0x538,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port6_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port6_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port6_tx_clk_src",
+		.parent_data = gcc_xo_uniphy2_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy2_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port6_tx_div_clk_src = {
+	.reg = 0x540,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port6_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port6_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_branch nss_cc_port1_rx_clk = {
+	.halt_reg = 0x548,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x548,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port1_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port1_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port1_tx_clk = {
+	.halt_reg = 0x550,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x550,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port1_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port1_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port2_rx_clk = {
+	.halt_reg = 0x558,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x558,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port2_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port2_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port2_tx_clk = {
+	.halt_reg = 0x560,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x560,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port2_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port2_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port3_rx_clk = {
+	.halt_reg = 0x568,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x568,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port3_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port3_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port3_tx_clk = {
+	.halt_reg = 0x570,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x570,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port3_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port3_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port4_rx_clk = {
+	.halt_reg = 0x578,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x578,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port4_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port4_tx_clk = {
+	.halt_reg = 0x580,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x580,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port4_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port5_rx_clk = {
+	.halt_reg = 0x588,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x588,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port5_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port5_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port5_tx_clk = {
+	.halt_reg = 0x590,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x590,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port5_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port5_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port6_rx_clk = {
+	.halt_reg = 0x598,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x598,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port6_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port6_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port6_tx_clk = {
+	.halt_reg = 0x5a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port6_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port6_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_rx_clk = {
+	.halt_reg = 0x5e0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port1_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port1_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_tx_clk = {
+	.halt_reg = 0x5e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port1_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port1_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_rx_clk = {
+	.halt_reg = 0x5e8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port2_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port2_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_tx_clk = {
+	.halt_reg = 0x5ec,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port2_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port2_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_rx_clk = {
+	.halt_reg = 0x5f0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5f0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port3_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port3_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_tx_clk = {
+	.halt_reg = 0x5f4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port3_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port3_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_rx_clk = {
+	.halt_reg = 0x5f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port4_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_tx_clk = {
+	.halt_reg = 0x5fc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port4_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port5_rx_clk = {
+	.halt_reg = 0x600,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x600,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port5_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port5_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port5_tx_clk = {
+	.halt_reg = 0x604,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x604,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port5_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port5_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port6_rx_clk = {
+	.halt_reg = 0x608,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x608,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port6_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port6_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port6_tx_clk = {
+	.halt_reg = 0x60c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x60c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port6_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port6_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_mux nss_cc_ephy_rx_mux_clk_src = {
+	.reg = 0x610,
+	.shift = 0,
+	.width = 1,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ephy_rx_mux_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_rx_div_clk_src.clkr.hw,
+				&nss_cc_port5_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 2,
+			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ephy_rx_clk = {
+	.halt_reg = 0x618,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x618,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ephy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ephy_rx_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_mux nss_cc_ephy_tx_mux_clk_src = {
+	.reg = 0x614,
+	.shift = 0,
+	.width = 1,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ephy_tx_mux_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_tx_div_clk_src.clkr.hw,
+				&nss_cc_port5_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 2,
+			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ephy_tx_clk = {
+	.halt_reg = 0x61c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x61c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ephy_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ephy_tx_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port1_rx_div4_clk_src = {
+	.reg = 0x624,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port1_rx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port1_rx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port1_tx_div4_clk_src = {
+	.reg = 0x628,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port1_tx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port1_tx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port2_rx_div4_clk_src = {
+	.reg = 0x62c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port2_rx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port2_rx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port2_tx_div4_clk_src = {
+	.reg = 0x630,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port2_tx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port2_tx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port3_rx_div4_clk_src = {
+	.reg = 0x634,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port3_rx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port3_rx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port3_tx_div4_clk_src = {
+	.reg = 0x638,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port3_tx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port3_tx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port4_rx_div4_clk_src = {
+	.reg = 0x63c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port4_rx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port4_rx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port4_tx_div4_clk_src = {
+	.reg = 0x640,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port4_tx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port4_tx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_rx_div4_clk = {
+	.halt_reg = 0x644,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x644,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port1_rx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port1_rx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_tx_div4_clk = {
+	.halt_reg = 0x648,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x648,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port1_tx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port1_tx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_rx_div4_clk = {
+	.halt_reg = 0x64c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x64c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port2_rx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port2_rx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_tx_div4_clk = {
+	.halt_reg = 0x650,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x650,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port2_tx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port2_tx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_rx_div4_clk = {
+	.halt_reg = 0x654,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x654,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port3_rx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port3_rx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_tx_div4_clk = {
+	.halt_reg = 0x658,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x658,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port3_tx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port3_tx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_rx_div4_clk = {
+	.halt_reg = 0x65c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x65c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port4_rx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port4_rx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_tx_div4_clk = {
+	.halt_reg = 0x660,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x660,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port4_tx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port4_tx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_cc_eip_bfdcd_clk_src[] = {
+	F(375000000, P_CMN_PLL_NSS_CLK_375M, 1, 0, 0),
+	{ }
+};
+
+static const struct parent_map nss_cc_parent_map_eip[] = {
+	{ P_XO, 0 },
+	{ P_CMN_PLL_NSS_CLK_375M, 5 },
+};
+
+static struct clk_rcg2 nss_cc_eip_bfdcd_clk_src = {
+	.cmd_rcgr = 0x6a8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_eip,
+	.freq_tbl = ftbl_nss_cc_eip_bfdcd_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_eip_bfdcd_clk_src",
+		.parent_data = nss_cc_ppe_parent_data_eip,
+		.num_parents = ARRAY_SIZE(nss_cc_ppe_parent_data_eip),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch nss_cc_eip_clk = {
+	.halt_reg = 0x6bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_eip_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_eip_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_eip_clk = {
+	.halt_reg = 0x6c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nssnoc_eip_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_eip_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_cc_cfg_clk_ppe_cfg[] = {
+	F(100000000, P_GCC_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_cfg_clk_src = {
+	.cmd_rcgr = 0x70c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_ppe_cfg,
+	.freq_tbl = ftbl_nss_cc_cfg_clk_ppe_cfg,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_cfg_clk_src",
+		.parent_data = nss_cc_ppe_parent_data_ppe_cfg,
+		.num_parents = ARRAY_SIZE(nss_cc_ppe_parent_data_ppe_cfg),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch nss_cc_nss_csr_clk = {
+	.halt_reg = 0x714,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x714,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nss_csr_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_nss_csr_clk = {
+	.halt_reg = 0x718,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x718,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nssnoc_nss_csr_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *nss_cc_ipq5210_clocks[] = {
+	[NSS_CC_PPE_CLK_SRC] = &nss_cc_ppe_clk_src.clkr,
+	[NSS_CC_PPE_SWITCH_IPE_CLK] = &nss_cc_ppe_switch_ipe_clk.clkr,
+	[NSS_CC_PPE_SWITCH_BTQ_CLK] = &nss_cc_ppe_switch_btq_clk.clkr,
+	[NSS_CC_PPE_SWITCH_CLK] = &nss_cc_ppe_switch_clk.clkr,
+	[NSS_CC_PPE_SWITCH_CFG_CLK] = &nss_cc_ppe_switch_cfg_clk.clkr,
+	[NSS_CC_PPE_EDMA_CLK] = &nss_cc_ppe_edma_clk.clkr,
+	[NSS_CC_PPE_EDMA_CFG_CLK] = &nss_cc_ppe_edma_cfg_clk.clkr,
+	[NSS_CC_PORT1_MAC_CLK] = &nss_cc_port1_mac_clk.clkr,
+	[NSS_CC_PORT1_RX_CLK] = &nss_cc_port1_rx_clk.clkr,
+	[NSS_CC_PORT1_RX_CLK_SRC] = &nss_cc_port1_rx_clk_src.clkr,
+	[NSS_CC_PORT1_RX_DIV_CLK_SRC] = &nss_cc_port1_rx_div_clk_src.clkr,
+	[NSS_CC_PORT1_TX_CLK] = &nss_cc_port1_tx_clk.clkr,
+	[NSS_CC_PORT1_TX_CLK_SRC] = &nss_cc_port1_tx_clk_src.clkr,
+	[NSS_CC_PORT1_TX_DIV_CLK_SRC] = &nss_cc_port1_tx_div_clk_src.clkr,
+	[NSS_CC_PORT2_MAC_CLK] = &nss_cc_port2_mac_clk.clkr,
+	[NSS_CC_PORT2_RX_CLK] = &nss_cc_port2_rx_clk.clkr,
+	[NSS_CC_PORT2_RX_CLK_SRC] = &nss_cc_port2_rx_clk_src.clkr,
+	[NSS_CC_PORT2_RX_DIV_CLK_SRC] = &nss_cc_port2_rx_div_clk_src.clkr,
+	[NSS_CC_PORT2_TX_CLK] = &nss_cc_port2_tx_clk.clkr,
+	[NSS_CC_PORT2_TX_CLK_SRC] = &nss_cc_port2_tx_clk_src.clkr,
+	[NSS_CC_PORT2_TX_DIV_CLK_SRC] = &nss_cc_port2_tx_div_clk_src.clkr,
+	[NSS_CC_PORT3_MAC_CLK] = &nss_cc_port3_mac_clk.clkr,
+	[NSS_CC_PORT3_RX_CLK] = &nss_cc_port3_rx_clk.clkr,
+	[NSS_CC_PORT3_RX_CLK_SRC] = &nss_cc_port3_rx_clk_src.clkr,
+	[NSS_CC_PORT3_RX_DIV_CLK_SRC] = &nss_cc_port3_rx_div_clk_src.clkr,
+	[NSS_CC_PORT3_TX_CLK] = &nss_cc_port3_tx_clk.clkr,
+	[NSS_CC_PORT3_TX_CLK_SRC] = &nss_cc_port3_tx_clk_src.clkr,
+	[NSS_CC_PORT3_TX_DIV_CLK_SRC] = &nss_cc_port3_tx_div_clk_src.clkr,
+	[NSS_CC_PORT4_MAC_CLK] = &nss_cc_port4_mac_clk.clkr,
+	[NSS_CC_PORT4_RX_CLK] = &nss_cc_port4_rx_clk.clkr,
+	[NSS_CC_PORT4_RX_CLK_SRC] = &nss_cc_port4_rx_clk_src.clkr,
+	[NSS_CC_PORT4_RX_DIV_CLK_SRC] = &nss_cc_port4_rx_div_clk_src.clkr,
+	[NSS_CC_PORT4_TX_CLK] = &nss_cc_port4_tx_clk.clkr,
+	[NSS_CC_PORT4_TX_CLK_SRC] = &nss_cc_port4_tx_clk_src.clkr,
+	[NSS_CC_PORT4_TX_DIV_CLK_SRC] = &nss_cc_port4_tx_div_clk_src.clkr,
+	[NSS_CC_PORT5_MAC_CLK] = &nss_cc_port5_mac_clk.clkr,
+	[NSS_CC_PORT5_RX_CLK] = &nss_cc_port5_rx_clk.clkr,
+	[NSS_CC_PORT5_RX_CLK_SRC] = &nss_cc_port5_rx_clk_src.clkr,
+	[NSS_CC_PORT5_RX_DIV_CLK_SRC] = &nss_cc_port5_rx_div_clk_src.clkr,
+	[NSS_CC_PORT5_TX_CLK] = &nss_cc_port5_tx_clk.clkr,
+	[NSS_CC_PORT5_TX_CLK_SRC] = &nss_cc_port5_tx_clk_src.clkr,
+	[NSS_CC_PORT5_TX_DIV_CLK_SRC] = &nss_cc_port5_tx_div_clk_src.clkr,
+	[NSS_CC_PORT6_MAC_CLK] = &nss_cc_port6_mac_clk.clkr,
+	[NSS_CC_PORT6_RX_CLK] = &nss_cc_port6_rx_clk.clkr,
+	[NSS_CC_PORT6_RX_CLK_SRC] = &nss_cc_port6_rx_clk_src.clkr,
+	[NSS_CC_PORT6_RX_DIV_CLK_SRC] = &nss_cc_port6_rx_div_clk_src.clkr,
+	[NSS_CC_PORT6_TX_CLK] = &nss_cc_port6_tx_clk.clkr,
+	[NSS_CC_PORT6_TX_CLK_SRC] = &nss_cc_port6_tx_clk_src.clkr,
+	[NSS_CC_PORT6_TX_DIV_CLK_SRC] = &nss_cc_port6_tx_div_clk_src.clkr,
+	[NSS_CC_NSSNOC_PPE_CLK] = &nss_cc_nssnoc_ppe_clk.clkr,
+	[NSS_CC_NSSNOC_PPE_CFG_CLK] = &nss_cc_nssnoc_ppe_cfg_clk.clkr,
+	[NSS_CC_UNIPHY_PORT1_RX_CLK] = &nss_cc_uniphy_port1_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT1_TX_CLK] = &nss_cc_uniphy_port1_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_RX_CLK] = &nss_cc_uniphy_port2_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_TX_CLK] = &nss_cc_uniphy_port2_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_RX_CLK] = &nss_cc_uniphy_port3_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_TX_CLK] = &nss_cc_uniphy_port3_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_RX_CLK] = &nss_cc_uniphy_port4_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_TX_CLK] = &nss_cc_uniphy_port4_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT5_RX_CLK] = &nss_cc_uniphy_port5_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT5_TX_CLK] = &nss_cc_uniphy_port5_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT6_RX_CLK] = &nss_cc_uniphy_port6_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT6_TX_CLK] = &nss_cc_uniphy_port6_tx_clk.clkr,
+	[NSS_CC_XGMAC0_PTP_REF_CLK] = &nss_cc_xgmac0_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC0_PTP_REF_DIV_CLK_SRC] = &nss_cc_xgmac0_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_XGMAC1_PTP_REF_CLK] = &nss_cc_xgmac1_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC1_PTP_REF_DIV_CLK_SRC] = &nss_cc_xgmac1_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_XGMAC2_PTP_REF_CLK] = &nss_cc_xgmac2_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC2_PTP_REF_DIV_CLK_SRC] = &nss_cc_xgmac2_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_PON_CLK] = &nss_cc_pon_clk.clkr,
+	[NSS_CC_EPHY_RX_CLK_SRC] = &nss_cc_ephy_rx_mux_clk_src.clkr,
+	[NSS_CC_EPHY_RX_CLK] = &nss_cc_ephy_rx_clk.clkr,
+	[NSS_CC_EPHY_TX_CLK_SRC] = &nss_cc_ephy_tx_mux_clk_src.clkr,
+	[NSS_CC_EPHY_TX_CLK] = &nss_cc_ephy_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT1_RX_DIV4_CLK_SRC] = &nss_cc_uniphy_port1_rx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT1_TX_DIV4_CLK_SRC] = &nss_cc_uniphy_port1_tx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT2_RX_DIV4_CLK_SRC] = &nss_cc_uniphy_port2_rx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT2_TX_DIV4_CLK_SRC] = &nss_cc_uniphy_port2_tx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT3_RX_DIV4_CLK_SRC] = &nss_cc_uniphy_port3_rx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT3_TX_DIV4_CLK_SRC] = &nss_cc_uniphy_port3_tx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT4_RX_DIV4_CLK_SRC] = &nss_cc_uniphy_port4_rx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT4_TX_DIV4_CLK_SRC] = &nss_cc_uniphy_port4_tx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT1_RX_DIV4_CLK] = &nss_cc_uniphy_port1_rx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT1_TX_DIV4_CLK] = &nss_cc_uniphy_port1_tx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_RX_DIV4_CLK] = &nss_cc_uniphy_port2_rx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_TX_DIV4_CLK] = &nss_cc_uniphy_port2_tx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_RX_DIV4_CLK] = &nss_cc_uniphy_port3_rx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_TX_DIV4_CLK] = &nss_cc_uniphy_port3_tx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_RX_DIV4_CLK] = &nss_cc_uniphy_port4_rx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_TX_DIV4_CLK] = &nss_cc_uniphy_port4_tx_div4_clk.clkr,
+	[NSS_CC_EIP_BFDCD_CLK_SRC] = &nss_cc_eip_bfdcd_clk_src.clkr,
+	[NSS_CC_EIP_CLK] = &nss_cc_eip_clk.clkr,
+	[NSS_CC_NSSNOC_EIP_CLK] = &nss_cc_nssnoc_eip_clk.clkr,
+	[NSS_CC_CFG_CLK_SRC] = &nss_cc_cfg_clk_src.clkr,
+	[NSS_CC_NSS_CSR_CLK] = &nss_cc_nss_csr_clk.clkr,
+	[NSS_CC_NSSNOC_NSS_CSR_CLK] = &nss_cc_nssnoc_nss_csr_clk.clkr,
+};
+
+static const struct qcom_reset_map nss_cc_ipq5210_resets[] = {
+	[NSS_CC_PPE_BCR] = { 0x3e8 },
+	[NSS_CC_PPE_SWITCH_IPE_CLK_ARES] = { 0x424, 2 },
+	[NSS_CC_PPE_SWITCH_BTQ_CLK_ARES] = { 0x42c, 2 },
+	[NSS_CC_PPE_SWITCH_CLK_ARES] = { 0x434, 2 },
+	[NSS_CC_PPE_SWITCH_CFG_CLK_ARES] = { 0x43c, 2 },
+	[NSS_CC_PPE_EDMA_CLK_ARES] = { 0x440, 2 },
+	[NSS_CC_PPE_EDMA_CFG_CLK_ARES] = { 0x448, 2 },
+	[NSS_CC_PORT1_MAC_CLK_ARES] = { 0x44c, 2 },
+	[NSS_CC_PORT2_MAC_CLK_ARES] = { 0x454, 2 },
+	[NSS_CC_PORT3_MAC_CLK_ARES] = { 0x45c, 2 },
+	[NSS_CC_PORT4_MAC_CLK_ARES] = { 0x464, 2 },
+	[NSS_CC_PORT5_MAC_CLK_ARES] = { 0x46c, 2 },
+	[NSS_CC_PORT6_MAC_CLK_ARES] = { 0x474, 2 },
+	[NSS_CC_PON_CLK_ARES] = { 0x47c, 2 },
+	[NSS_CC_XGMAC0_PTP_REF_CLK_ARES] = { 0x488, 2 },
+	[NSS_CC_XGMAC1_PTP_REF_CLK_ARES] = { 0x48c, 2 },
+	[NSS_CC_XGMAC2_PTP_REF_CLK_ARES] = { 0x490, 2 },
+	[NSS_CC_NSSNOC_PPE_CLK_ARES] = { 0x4a4, 2 },
+	[NSS_CC_NSSNOC_PPE_CFG_CLK_ARES] = { 0x4a8, 2 },
+	[NSS_CC_PORT1_RX_CLK_ARES] = { 0x548, 2 },
+	[NSS_CC_PORT1_TX_CLK_ARES] = { 0x550, 2 },
+	[NSS_CC_PORT2_RX_CLK_ARES] = { 0x558, 2 },
+	[NSS_CC_PORT2_TX_CLK_ARES] = { 0x560, 2 },
+	[NSS_CC_PORT3_RX_CLK_ARES] = { 0x568, 2 },
+	[NSS_CC_PORT3_TX_CLK_ARES] = { 0x570, 2 },
+	[NSS_CC_PORT4_RX_CLK_ARES] = { 0x578, 2 },
+	[NSS_CC_PORT4_TX_CLK_ARES] = { 0x580, 2 },
+	[NSS_CC_PORT5_RX_CLK_ARES] = { 0x588, 2 },
+	[NSS_CC_PORT5_TX_CLK_ARES] = { 0x590, 2 },
+	[NSS_CC_PORT6_RX_CLK_ARES] = { 0x598, 2 },
+	[NSS_CC_PORT6_TX_CLK_ARES] = { 0x5a0, 2 },
+	[NSS_CC_EPHY_RX_CLK_ARES] = { 0x618, 2 },
+	[NSS_CC_EPHY_TX_CLK_ARES] = { 0x61c, 2 },
+	[NSS_CC_UNIPHY_PORT1_RX_CLK_ARES] = { 0x5e0, 2 },
+	[NSS_CC_UNIPHY_PORT1_TX_CLK_ARES] = { 0x5e4, 2 },
+	[NSS_CC_UNIPHY_PORT2_RX_CLK_ARES] = { 0x5e8, 2 },
+	[NSS_CC_UNIPHY_PORT2_TX_CLK_ARES] = { 0x5ec, 2 },
+	[NSS_CC_UNIPHY_PORT3_RX_CLK_ARES] = { 0x5f0, 2 },
+	[NSS_CC_UNIPHY_PORT3_TX_CLK_ARES] = { 0x5f4, 2 },
+	[NSS_CC_UNIPHY_PORT4_RX_CLK_ARES] = { 0x5f8, 2 },
+	[NSS_CC_UNIPHY_PORT4_TX_CLK_ARES] = { 0x5fc, 2 },
+	[NSS_CC_UNIPHY_PORT5_RX_CLK_ARES] = { 0x600, 2 },
+	[NSS_CC_UNIPHY_PORT5_TX_CLK_ARES] = { 0x604, 2 },
+	[NSS_CC_UNIPHY_PORT6_RX_CLK_ARES] = { 0x608, 2 },
+	[NSS_CC_UNIPHY_PORT6_TX_CLK_ARES] = { 0x60c, 2 },
+	[NSS_CC_EIP_CLK_ARES] = { 0x6bc, 2 },
+	[NSS_CC_NSSNOC_EIP_CLK_ARES] = { 0x6c4, 2 },
+	[NSS_CC_NSS_CSR_CLK_ARES] = { 0x714, 2 },
+	[NSS_CC_NSSNOC_NSS_CSR_CLK_ARES] = { 0x718, 2 },
+	[NSS_CC_DEBUG_CLK_ARES] = { 0x770, 2 },
+};
+
+static const struct regmap_config nss_cc_ipq5210_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x800,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_hws_data icc_ipq5210_nss_hws[] = {
+	{ MASTER_NSSNOC_PPE, SLAVE_NSSNOC_PPE, NSS_CC_NSSNOC_PPE_CLK },
+	{ MASTER_NSSNOC_PPE_CFG, SLAVE_NSSNOC_PPE_CFG, NSS_CC_NSSNOC_PPE_CFG_CLK },
+	{ MASTER_NSSNOC_NSS_CSR, SLAVE_NSSNOC_NSS_CSR, NSS_CC_NSSNOC_NSS_CSR_CLK },
+	{ MASTER_NSSNOC_EIP, SLAVE_NSSNOC_EIP, NSS_CC_NSSNOC_EIP_CLK },
+};
+
+#define IPQ_NSSCC_ID	(5210 * 2) /* some unique value */
+
+static const struct qcom_cc_desc nss_cc_ipq5210_desc = {
+	.config = &nss_cc_ipq5210_regmap_config,
+	.clks = nss_cc_ipq5210_clocks,
+	.num_clks = ARRAY_SIZE(nss_cc_ipq5210_clocks),
+	.resets = nss_cc_ipq5210_resets,
+	.num_resets = ARRAY_SIZE(nss_cc_ipq5210_resets),
+	.icc_hws = icc_ipq5210_nss_hws,
+	.num_icc_hws = ARRAY_SIZE(icc_ipq5210_nss_hws),
+	.icc_first_node_id = IPQ_NSSCC_ID,
+};
+
+static const struct dev_pm_ops nss_cc_ipq5210_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static const struct of_device_id nss_cc_ipq5210_match_table[] = {
+	{ .compatible = "qcom,ipq5210-nsscc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nss_cc_ipq5210_match_table);
+
+static int nss_cc_ipq5210_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Fail to enable runtime PM\n");
+
+	ret = devm_pm_clk_create(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Fail to create PM clock\n");
+
+	ret = pm_clk_add(&pdev->dev, "bus");
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Fail to add bus clock\n");
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Fail to resume\n");
+
+	ret = qcom_cc_probe(pdev, &nss_cc_ipq5210_desc);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+static struct platform_driver nss_cc_ipq5210_driver = {
+	.probe = nss_cc_ipq5210_probe,
+	.driver = {
+		.name = "qcom,ipq5210-nsscc",
+		.of_match_table = nss_cc_ipq5210_match_table,
+		.pm = pm_ptr(&nss_cc_ipq5210_pm_ops),
+		.sync_state = icc_sync_state,
+	},
+};
+module_platform_driver(nss_cc_ipq5210_driver);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. NSSCC IPQ5210 Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

