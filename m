Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900814;
	b=UuxQ6jjFeEGdqWNUMPg/9SkTcMrODNwWuARR6wSqeytjclziecGoklTEfJ1gOcmEHYZd
	 TWTGcBw0MY2V1vyQH4RL+pWYT0DZFYOqgoqMh7FsoZo7u4ZQcv3i/H7wc8TFQMdpn57v4
	 n0lgg6hGoG6Rnf8SLoRqzibAKvtpEjl+mcxrrlrXWUMVX1+JRtSu1KExpMQUeFLn2rYwX
	 p5B9c5IUPYqrhBpmmJX+fKhS9Yrz3xww6eprmlLy1NLNmUnkZk+7ihGnV+jqJMQdpZDyM
	 wgvopxpQNEXaUKx5KJ7kXqFTB8b2zGoMw2l/neXR07wDVco+H/5/4hYb2TdnqWq1zOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ljr3p7bWWmksZNtse/bv/k+6EcSlJjIABS0byFl3p0I=;
	b=bYnizpSQm3a3Bc8DtLV2OBwb5jq3tIJnblHHH0WtOTos4qkkSuUWLym53gK1LUXsovWr
	 dZb5Sq8GN7vWj7XkTHKwPhwJ4WzpcnViwg+AnDlhhpm66QA9WE/OFCPaaemr6EmbFaQ+Q
	 x+1uPJm+qnW+9Y7VZ4vdTsHh1SK8ECFgkRJk//o8fNx55z+HOxErW/q+cHHtnqYtL53n7
	 A075S60e/zHTHGuAaD8CYSQ7GcQk55SoiHOLgqsL5e8B6RWtfOr0y9Md4jL9yuSrAzCfZ
	 OBixBF1ABe5Am2xU/oBYoEUJ4dk9amxM+TYTOn3p1Zw6aToD5AhpfTrfEmCeNtJT5SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EovQJRz7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIyrBoer;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A272D606A887
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A272D606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EovQJRz7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIyrBoer
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2a9K63407597
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljr3p7bWWmksZNtse/bv/k+6EcSlJjIABS0byFl3p0I=; b=EovQJRz75Lccah9V
	hwXP4PYo7WCNeGceo5484oq6csllYc/jKaqdek8CP1FBcsRni+9MrE08+9DBHTON
	h2OXfIWDNk4Njm10rTxoKC6luJP7UR0r/8cbHmX2kkeMlrHu+MzvGxFYnti5LViw
	/YAIxb+zIEURtsX2C+Ai/P67TCBj7s6cp8w85lqcubLuTPvPdh9qOM0jtsybuNN2
	3JaKDPezM0Ow7ZXv21ZrkC6m2Yeo4tKWjR26Hw9DNTYf/LDhwj3Z/U8m1YEKrlVf
	1o1ioOZOeuxjemwxofmOzcN6S7xoEMqJsrYM/S24G0ct9AlMjU19hwnsuhY0CfE8
	WXCe2A==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09hthx2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:32 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45e83fd0663so3982227fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900812; x=1795505612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljr3p7bWWmksZNtse/bv/k+6EcSlJjIABS0byFl3p0I=;
        b=bIyrBoerXwTbAQ9BwTd6MC9ycKA/I3NeExw1ibvSA+mpbDAaTfhO098Y0H484qOOK+
         e/cpfbR4xKfyvscY2IKo6lzdIZcX3zxwJUhkC63wVKNWDtIEJ4jmUYaUG89Rj2Zgillk
         mkLf6SBcgfnpvNIEM+JsSWICrMauDV2lb8XZfmSwH1p7dsuuiXCTE/t94IBfhbCNUt8O
         Ea/tFtqKF8Gr+/Jsj2AR9F1yuj3lb223TQPeQBd3O7q/SAA9SJvw0LO01bMH+5IKPFDe
         B0pffnrfZyYD2lEC7FDfN/+8CrsRodsrCRK27yX3nikBDlsuA2IMD3ovsEtdhKlv/Vjp
         LpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900812; x=1795505612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljr3p7bWWmksZNtse/bv/k+6EcSlJjIABS0byFl3p0I=;
        b=cU5eBkI0x5awvRS1sgELXGk+VYwmnFzE3lYYYlaybBkw0nyVX3noUpFZTcDZUinmCC
         zxlDVxCk7tCihtryZdv+mLYO4Rx/BDonpCM4xc50E/vRx8vHYiRHDy0Aj8sxjpGNdmbo
         kjzHZ38/Zzov4P1PG5TrCLkoIfwrIH7fRWcKvKCXYipexBB64LcIqlVTruqypq/HWZMG
         egeMGT3mEz9Cs8wbBGY5UKGmjzwZXCIfegG6sd9b1zLmIqDGTpWYchxwO0RMvLdQxUrH
         cC7M77geDnJRRkeMpgdHNSQ2rV57DW4Pi9QtyxDPRAz3WCfUxYZX7b4090VQmbPgjCPu
         n2aQ==
X-Forwarded-Encrypted: i=1; AL+hErFhic9g7pLFlHYOSTss1nDL4L5qlAJjg75O1x1yUk5sQ9v/2mbAJCPH7quuQ9CILHq7njqkcqkFLntFk6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z93OHhJUtpA7byvor3mYtE6FUjU53gLCQ4qR8Rn7L60//oOKbgL
	ElIyzO7dBGMLLL6avftjjSnt2Vi0TO2NwEF7bF8DQ6pRhVusuFIJJfRVVg9/z8X3+XqqP3K/5no
	7W1DM8sWqQ6XnKSDfG0pKXOelsXYBeviObc3wydzriYcX9jdTwqz653+Pu6k9+BQkksc=
X-Gm-Gg: AYBFou1Dm36l44iY+x1xWr3uXYIIiRrprLkVOpX11hK1+mlnGifvSJElySShevGa3MT
	g4t46IJkYNgPa7JJjQ+z/fsXFPW13bprzX2WRyTebf4oLQuR+gQhS44ZtXKP9tDOWUGE4bnMHjQ
	JMKo2UHx8tt6bsdvV1zxexU2eTkvPlDShF5RURuf0ly9xMuAW/kPOz9so6eG9MUSaqxLeonZb6y
	+x0KZQRcs9CFC8CX2hgGYkN6j/LFLLXWUTeRKwTset3M4B7b9egfLr8GYbMY2f5Ar4GRAsUNiNO
	+W89YtbPgloNFZK6v/kKCez45bWnDqaERlj924b0/GScnU21SnUEyl1Kgt8Ee82yYlzjfCTKBvT
	sueUQkXPImfDAD0w1C2ET52cU1nhKbYicRGhHUtvP9YiwTDDOqv8e2P1Qhhu2Q1HaH3XgInlxQ4
	wPQwmHc9AgsVTR33umrBLOwcv/fQ==
X-Received: by 2002:a05:6870:f627:b0:4a8:407d:4076 with SMTP id 586e51a60fabf-4afdf71a881mr11465701fac.34.1794900811811;
        Mon, 16 Nov 2026 23:33:31 -0800 (PST)
X-Received: by 2002:a05:6870:f627:b0:4a8:407d:4076 with SMTP id 586e51a60fabf-4afdf71a881mr11465681fac.34.1794900811324;
        Mon, 16 Nov 2026 23:33:31 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe228982bsm8593875fac.10.2026.11.16.23.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:30 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 23:33:19 -0800
Subject: [PATCH v2 3/3] rtc: Add Qualcomm GIO RTC driver
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
Message-Id: <20261116-gio-framework-rtc-driver-2026-10-12-v2-3-b60e6fe33831@oss.qualcomm.com>
References: <20261116-gio-framework-rtc-driver-2026-10-12-v2-0-b60e6fe33831@oss.qualcomm.com>
In-Reply-To: <20261116-gio-framework-rtc-driver-2026-10-12-v2-0-b60e6fe33831@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794900802; l=8209;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=9pSSayOZld+8+2ZtoJm1a47VtEYByZ4Mwtri1xjlJJ0=;
 b=+9wMJQN8Fg5qHtM9J7rMJOZkwnol/zWY0bVcHoHy9ecnJrOgt2tlIr6JgjNvKDlXmU17SK5YM
 +IN/RUZ6j5dAL1EAFHwbXtT7DeM7VO4kuctn1N9GeyDO1NwPE0T5e2q
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX2yvPHhPpAa/a
 D1aAeLnEdIhIDie/ufrb2g9QsFaxtLYKFsk5k1zUbMGJH5E02SAYn23WjFpHaoBIovJm2R9ulQF
 9ORPIxnqjp02csAg134/Jy7/IGIN7XA=
X-Proofpoint-ORIG-GUID: r05lWcF1eScW-hd9VdB4bP0t7pNRnKL2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX00pRHmXTKvNx
 RCwy9iZm2sFxVjaMevOSQzVISRrcqBqB46TW+MnCAeo8GrYUYG4ks68pB8LDEvq2GLoRoGWqzUa
 8YNzXMkjSnjqEuOz3Vo0j/F2gN29yJyGVSc0ZJgpZ2NNlJ4WlyyJZ4tw/o2ZLAaIO+vDbL6u+ad
 KNEj2tt17s5Cxv8ZH5K41CGQ75uBsNZ7Bax06dgkmNM+HeheoW5LEHZg3vOxpMYwZZuuO0UautL
 mTaEc5jrQrBLlkT9qpe9K01qex0BEyp8JKAzahiaw7xLJVK+ohVgR383/3w69sNE6Wo8eJTWbwG
 DtU4tiQpQ/ltLAz+453PM8N2Gh8mZXY1uAskpMbd5tg+hABpeqQb4hxAeXN7ID521ukL1Ib10DP
 w+AijhpSzHM6b1hQsWgKvlscZFb2ZRTOP6mwvkA2ARTHr7Q8z3foAwoqLf4z5y4nXN/QE3qY5Hb
 u/jIYSN33RQo/BVC5fw==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc034c cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PQbxmwGiin7G8qBTPywA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: r05lWcF1eScW-hd9VdB4bP0t7pNRnKL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

On the Glymur platform, the GIO (General I/O) interface communicates
with the SoCCP battery-management firmware and provides a set of TAD
(Time-Alarm-Device) registers for reading and writing RTC time. The
platform also includes registers for configuring an alarm timer and
initiating device boot-up into different power stages, such as:
charging only or fully powered-on system, based on the applied power
source (AC/DC). However, repurposing this alarm timer has very limited
value for an RTC driver because it does not expose an interrupt when
the timer expires.

Add an auxiliary RTC driver that corresponds to the auxiliary device
created by the GIO driver, "pmic_gio.rtc", which manages the RTC timer
by accessing to the TAD real-time register block through the regmap
interface exposed by the GIO device.

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/rtc/Kconfig               |  11 +++
 drivers/rtc/Makefile              |   1 +
 drivers/rtc/rtc-qcom-gio.c        | 153 ++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/pmic_glink_gio.c |  14 ++++
 4 files changed, 179 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 73ec9230edfd..a298f7ae68f9 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1863,6 +1863,17 @@ config RTC_DRV_PM8XXX
 	  To compile this driver as a module, choose M here: the
 	  module will be called rtc-pm8xxx.
 
+config RTC_DRV_QCOM_GIO
+	tristate "Qualcomm GIO RTC driver"
+	depends on QCOM_PMIC_GLINK_GIO
+	help
+	  Say y here to support the real-time clock exposed in Qualcomm
+	  SoCCP battery management firmware through the GIO (General I/O)
+	  interface.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called rtc-qcom-gio.
+
 config RTC_DRV_TEGRA
 	tristate "NVIDIA Tegra Internal RTC driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 46f1a0fc2416..9cb76aac7897 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -142,6 +142,7 @@ obj-$(CONFIG_RTC_DRV_PM8XXX)	+= rtc-pm8xxx.o
 obj-$(CONFIG_RTC_DRV_POLARFIRE_SOC)	+= rtc-mpfs.o
 obj-$(CONFIG_RTC_DRV_PS3)	+= rtc-ps3.o
 obj-$(CONFIG_RTC_DRV_PXA)	+= rtc-pxa.o
+obj-$(CONFIG_RTC_DRV_QCOM_GIO)	+= rtc-qcom-gio.o
 obj-$(CONFIG_RTC_DRV_R7301)	+= rtc-r7301.o
 obj-$(CONFIG_RTC_DRV_R9701)	+= rtc-r9701.o
 obj-$(CONFIG_RTC_DRV_RPI)	+= rtc-raspberrypi.o
diff --git a/drivers/rtc/rtc-qcom-gio.c b/drivers/rtc/rtc-qcom-gio.c
new file mode 100644
index 000000000000..679b24f2a190
--- /dev/null
+++ b/drivers/rtc/rtc-qcom-gio.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+#include <linux/soc/qcom/pmic_gio.h>
+#include <linux/soc/qcom/pmic_gio_regs.h>
+
+struct tad_rt {
+	u32 ymd;
+#define RT_YMD_DAY		GENMASK(31, 24)
+#define RT_YMD_MONTH		GENMASK(23, 16)
+#define RT_YMD_YEAR		GENMASK(15, 0)
+
+	u32 hms;
+#define RT_HMS_VALID		GENMASK(31, 24)
+#define RT_HMS_SEC		GENMASK(23, 16)
+#define RT_HMS_MINUTE		GENMASK(15, 8)
+#define RT_HMS_HOUR		GENMASK(7, 0)
+
+	u32 ms_tz;
+	u32 daylight;
+} __packed;
+
+static_assert(sizeof(struct tad_rt) == GIO_SVC_TAD_RT_SIZE);
+
+struct rtc_qcom_gio {
+	struct regmap *regmap;
+	struct rtc_device *rtc;
+};
+
+static int rtc_qcom_gio_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rtc_qcom_gio *rtc = dev_get_drvdata(dev);
+	struct tad_rt rt;
+	int ret;
+
+	ret = regmap_bulk_read(rtc->regmap, GIO_SVC_TAD_RT_ADDR, &rt,
+			       sizeof(rt) / PMIC_GIO_REG_GRANULARITY);
+	if (ret)
+		return ret;
+
+	/*
+	 * The firmware may return valid RTC values even when VALID is not set.
+	 * Only print out register values for potential debug if it's needed.
+	 */
+	if (!FIELD_GET(RT_HMS_VALID, rt.hms))
+		dev_dbg(dev, "RTC registers: ymd=%#010x hms=%#010x\n", rt.ymd, rt.hms);
+
+	tm->tm_year = FIELD_GET(RT_YMD_YEAR, rt.ymd) - 1900;
+	tm->tm_mon = FIELD_GET(RT_YMD_MONTH, rt.ymd) - 1;
+	tm->tm_mday = FIELD_GET(RT_YMD_DAY, rt.ymd);
+	tm->tm_hour = FIELD_GET(RT_HMS_HOUR, rt.hms);
+	tm->tm_min = FIELD_GET(RT_HMS_MINUTE, rt.hms);
+	tm->tm_sec = FIELD_GET(RT_HMS_SEC, rt.hms);
+
+	return 0;
+}
+
+static int rtc_qcom_gio_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rtc_qcom_gio *rtc = dev_get_drvdata(dev);
+	struct tad_rt rt;
+	int ret;
+
+	/*
+	 * The firmware requires the whole TAD_RT block to be written in a
+	 * single transaction, so ms_tz/daylight (which this driver never
+	 * changes) have to be read back and carried through unmodified
+	 * rather than writing just the ymd/hms words we care about. This
+	 * leaves a small window where a concurrent firmware-side update to
+	 * ms_tz/daylight between the read and the write below is clobbered
+	 * with a stale value; accepted given the firmware doesn't support
+	 * partial-block writes.
+	 */
+	ret = regmap_bulk_read(rtc->regmap, GIO_SVC_TAD_RT_ADDR, &rt,
+			       sizeof(rt) / PMIC_GIO_REG_GRANULARITY);
+	if (ret)
+		return ret;
+
+	rt.ymd = FIELD_PREP(RT_YMD_DAY, tm->tm_mday) |
+		 FIELD_PREP(RT_YMD_MONTH, tm->tm_mon + 1) |
+		 FIELD_PREP(RT_YMD_YEAR, tm->tm_year + 1900);
+
+	rt.hms = FIELD_PREP(RT_HMS_VALID, 1) |
+		 FIELD_PREP(RT_HMS_SEC, tm->tm_sec) |
+		 FIELD_PREP(RT_HMS_MINUTE, tm->tm_min) |
+		 FIELD_PREP(RT_HMS_HOUR, tm->tm_hour);
+
+	return regmap_bulk_write(rtc->regmap, GIO_SVC_TAD_RT_ADDR, &rt,
+				 sizeof(rt) / PMIC_GIO_REG_GRANULARITY);
+}
+
+static const struct rtc_class_ops rtc_qcom_gio_ops = {
+	.read_time = rtc_qcom_gio_read_time,
+	.set_time = rtc_qcom_gio_set_time,
+};
+
+static int rtc_qcom_gio_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct rtc_qcom_gio *rtc;
+	int ret;
+
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!rtc->regmap)
+		return -ENODEV;
+
+	dev_set_drvdata(dev, rtc);
+
+	rtc->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc->rtc))
+		return PTR_ERR(rtc->rtc);
+
+	rtc->rtc->ops = &rtc_qcom_gio_ops;
+	rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	ret = devm_rtc_register_device(rtc->rtc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct auxiliary_device_id rtc_qcom_gio_id_table[] = {
+	{ .name = "pmic_gio.rtc", },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, rtc_qcom_gio_id_table);
+
+static struct auxiliary_driver rtc_qcom_gio_driver = {
+	.name = "rtc_qcom_gio",
+	.probe = rtc_qcom_gio_probe,
+	.id_table = rtc_qcom_gio_id_table,
+};
+
+module_auxiliary_driver(rtc_qcom_gio_driver);
+
+MODULE_DESCRIPTION("Qualcomm GIO RTC driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/qcom/pmic_glink_gio.c b/drivers/soc/qcom/pmic_glink_gio.c
index 9a28f88152b2..1f58a8fcada3 100644
--- a/drivers/soc/qcom/pmic_glink_gio.c
+++ b/drivers/soc/qcom/pmic_glink_gio.c
@@ -113,6 +113,8 @@ struct pmic_glink_gio {
 	bool service_up;
 
 	struct gio_write_req write_req;
+
+	struct auxiliary_device *rtc_aux;
 };
 
 /* Must be called with pgio->lock held. */
@@ -339,6 +341,18 @@ static void pmic_glink_gio_init_work(struct work_struct *work)
 
 		pmic_gio_set_state(pgio->gio, PMIC_GIO_STATE_UP);
 	}
+
+	/*
+	 * Create GIO consumers after PDR to ensure the transport
+	 * is up before consumers use the GIO regmap device.
+	 */
+	if (!pgio->rtc_aux) {
+		pgio->rtc_aux = devm_pmic_gio_add_consumer(pgio->gio, "rtc");
+		if (!pgio->rtc_aux) {
+			dev_err(pgio->dev, "failed to add RTC consumer\n");
+			return;
+		}
+	}
 }
 
 static void pmic_glink_gio_alert_work(struct work_struct *work)

-- 
2.43.0

