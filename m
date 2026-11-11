Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367732;
	b=S0AoWugpNfxJ7UW6Wcs0VrZNnOMMFgI/fagqsigIgrSQt/IJI7N0SY7MGlCdz1PaCVPZ
	 BvBhPbm3PL/wAPUdIf11RB4qUfga+zA9sYPAtjU8Du8RPrBSY/mYdhTZ6+oluvul5HY6b
	 YSEgloqBUnP62/OAo1yFsee/snskCd8QboeVh7NVST1lWgfhRhdRyI1crmEOv9dc9A3mJ
	 BQ8jPkBTlvPOYRJn3VBzq/GqGcCM4cvDd0q807FRct7wcSzVFDHoHowYu4bcgsQ74axia
	 ubKSdBp2ug6H0LMJaI5zohYlYHplEdRZEWL4DMrAYyp9ykmdTbe9bJnf0/VOpg4NxPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=seJ/5y5RuaC+sAMVS854uyQsp644CPB81fm8EZeB13w=;
	b=f3akgaz8Gmab9K5MYbvpfxGDMSt+rqn7+hJuxNN/z+f7Ks2EOPLj2r8Ag6GcebjWz4FD
	 qW8UqoCK2TEPytGFd4VBvyBF55/+Wo1lWoMqTIWmJGkMfaSXoX8TtVXz4IgXLuesL+ShT
	 ro5sDtDyYWkvSqgw7j0/mpV+q0ydKc+MKYSA4+Pcc4/4G2jGwTPmB8pm0JdnBpZe6wxFx
	 3UaXR4CgfDicgfcPQbRmTybS14HrsTKpX2UPBFwkN9/PC+XmRRcdQTysQVXmtVnUofjBc
	 jE8IZ7mqLsb1buautDJDnzMWadLR98QKLyB6czshNqT+Se2R5NmJUoQMu0E3pd2PREA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hjx6tgUQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SSrMBHXO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0889A60A2606
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0889A60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hjx6tgUQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SSrMBHXO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tI3H1906116
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seJ/5y5RuaC+sAMVS854uyQsp644CPB81fm8EZeB13w=; b=Hjx6tgUQHHY7jOQq
	GeOG5HmIp/bsko5PReWKWFh7XXl0JsGDwCpgdLfQsSJ/o0nxW2noQv2FpDAt0aij
	ncpgaiTtljTOUTrKmCX7a5XJEysA4t62DpFLcLaC5/lR7zatEefjDvc1UvNPjGt5
	Z0W6XECAFaxJKF+Tf/OsRHnq35myMfDVJRbbblhwznSXLa3kfLuIMWvfRr+96EBg
	vBm3/c0TtGsME1DPFomYBLJPTKr4TchKujV3Y1FX5r4JYJXAGqiJfoFqGZG+hRDK
	MD5yzWf/kpW5rqLurS6cphDoEVL/7Wd3n5bgSE9+B21aBD4lT1N14P+iUCjDa6KQ
	14ZiEA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp0kfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:28:51 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso3999231c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794367731; x=1794972531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seJ/5y5RuaC+sAMVS854uyQsp644CPB81fm8EZeB13w=;
        b=SSrMBHXOVzV20eWbeMURI4K5x7D1hJ64QdvUvVK0Kr9DOO21+p2R8aLYxZiAXip5oP
         7EhD/wmFmkmDzHxDMgVkV9Z3b0jY2t9v19kNW/0SNDuYxHOraOry3hmsZor2RLxp4pBl
         0Lk6sarkCBVSWopLvl22vckDjRTPGF2TSCQdSgtii1cSKv/uDhdfOv9iscLdSynj4yEO
         btOvpO7oa6usd8f4rcVLStP5Ads9qIRNDonXy6wCJizGYjs2LbV/KNRE1vx7hKYE7KRT
         hktc/8z8jMhYWf8o6vnsNzUHIjaABBzSewurLCgBsfB9AVfRp71hHvZ02ISsqqgBm6v4
         PX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367731; x=1794972531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seJ/5y5RuaC+sAMVS854uyQsp644CPB81fm8EZeB13w=;
        b=VLbucxbU964EBIQbIO4EghAmfS5DiHY/SuyptkgKk/0VpThzDlEQXLz/zSJGwFV23V
         HF6+IsX3bYgDc5+ddhf+JLpMkW+4w2hvQcoAB0xqtZI3vEZ9Hqqhtelc14WsrYujIXKO
         QfgkhA6XqGqpM9CDwYVY/Ni5KEw2xx3+rytoqz/F4JYoNrtcjQdRSD/OcBUbZ/DgoBy3
         ajHrGJBFJ9a0gKP/nk0Lz3QiECY2JDP0PNdLYfxUMLuDXB2nWXYhYDgdZEWzJH1p1YMh
         32RT+7ow5mWPMqzsVMgmfL9qp3JRWEbiLw+7gKZ5ZFKOeUeGfv8X88jS9fHN7Vu00oRT
         vkVw==
X-Forwarded-Encrypted: i=1; AL+hErF9h0aGViv6SziaSXm6D07ibQy5g1tjywHtGZePis/D8IwwmDzq77pNFMM6vNDJcb+3TSr/WLt1zqYwS8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cJLi4SRKo9XML/S+c8Rbuoff/PxbwUjZWTCnppctPnP1SphTl
	JaKTgEuJKarJ0HlRjjVAtja/xlX0RLsnS6o0i0mugPlbKOtGFuo6ZnjYAISI7AnuDgN2bMzqTcb
	UWFISKUNVKJkWiuQ7WYrRcZ5r2ik+9jTKLVZP5xRd62+uWdOTdPn8YaGB7GS0IM6z+d4=
X-Gm-Gg: AYBFou3i8DdcGrUFcZ2zrn7Vh2Lo0tk1tz8Dga3i0qw2mylEZDZ1visvdAwueAHsjxA
	q0eYQbBjZSDwk0NYXtbED1oT3xB5gLw+1+q0CrQ/Vb63V4BNEc6SKwUWa4ByDiBnryUHgb9qtjf
	UFazpGNQ6KMe1eDf2R6hl+xiOGbapYEJmYvElW7XGM5UcFzg0TBZlQms+1ApKrB3ujMb0JDQwWd
	Z7oCqT59o29USzItXfhTVZN3ZfsQvbgBOu2MmPpBqN79qtkQpGfgfEZ8BaDqdKC2mk1auOsSUei
	LSepXko0J1eSzEKjDySwdj54J5iMNJiueHL01qQS4J6l4yyDAxELrqpGg8FP6VepRhi6CH1oduA
	Aapq4NejC1xSFyyt0X+CEysLsJKU4RD2LbG5EASuOfRXyx7sqllTWrRiesvwj2JEOARq+ek58AK
	QM2XUytJuns1KvKSoJPhc81g/i
X-Received: by 2002:a05:701b:2219:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1b3c023b669mr1064304c88.5.1794367730507;
        Tue, 10 Nov 2026 19:28:50 -0800 (PST)
X-Received: by 2002:a05:701b:2219:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1b3c023b669mr1064277c88.5.1794367729839;
        Tue, 10 Nov 2026 19:28:49 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm10261800c88.0.2026.11.10.19.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:28:49 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:28:18 -0800
Subject: [PATCH 3/3] rtc: Add Qualcomm GIO RTC driver
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
Message-Id: <20261110-gio-framework-rtc-driver-2026-10-12-v1-3-e4164178183a@oss.qualcomm.com>
References: <20261110-gio-framework-rtc-driver-2026-10-12-v1-0-e4164178183a@oss.qualcomm.com>
In-Reply-To: <20261110-gio-framework-rtc-driver-2026-10-12-v1-0-e4164178183a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794367724; l=8990;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=0ot5QBIsVs13Ds+ZVBJCzyrGNDcgqL2X7Q4XjFAfTB4=;
 b=CmzNuZOXjhIo2ht8ZAxsj7MEjLxhJCkWYO0Q5v3umv5sE/o7BPS3TgU7XUY+B7VgzZTH1o0ra
 kH9E9xKlp7SBkkGUNx0WZ4JNyY12ov/G7Mz7hA4Z+HqbyuAYVURsx0j
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX/fqYblHRoZuy
 fJRSENPqapumpMsFDm20XRdLrCgw2yKoMfdtaFu2cxDnn69Cwgf9b089appi+wvs+n8rwpE4qSS
 Eb7S8GVDxpP7FVqOx72G/4cQCdL+zQQaaDZOXpk4Fsapra3XikqZEXcTx1N5vx5oBLHeCXkvlCy
 pwZxY5WMQp6CD36/ud8SnHTccwSGwipZ7PtFTZ3bgHdTcG9JhOSPedfNAhhZRLiIoBRYlcKp4PW
 gd2ge33c0SzEan0c67kTgeIvTcEV4KeQhSFuTpKJdZs47vhNaxrWNTu676Y3WRKV0sh8PtySAU4
 6J581/YJdTm6XXFXfSsvH5/ujbqUphkt1BHFIk1ILcD7uyiHDIs1g05umTFNypV3iiiMTBJYCSU
 Nt07MhYSa3vkMtDbyxAklIqmWtNmHcpu/9doosuACvHB3T3AJRJBy9CCxiWg3SwG0NeL8T2UF6b
 4UPAbHLk0epC8Z3RpoQ==
X-Proofpoint-GUID: CN-vDS-yChpkzyAZzzxpiks5FTPCkOY8
X-Proofpoint-ORIG-GUID: CN-vDS-yChpkzyAZzzxpiks5FTPCkOY8
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af3e0f3 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_4neYXsdY3XM12RIAjQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX2ZgO+crg5WmJ
 yay3MTFzqomCY0NHRYlUHveGa7AH8+U9Se8N9QmfxGLWqpKI6vJ12B77maOkD/enjzI/EjFlYYW
 B+XOhCd4Pnw/uVclz4Ax651bpDPwX/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013

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
 drivers/soc/qcom/pmic_glink_gio.c |  36 +++++++++
 4 files changed, 201 insertions(+)

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
index f222c0d59220..83656a5758b8 100644
--- a/drivers/soc/qcom/pmic_glink_gio.c
+++ b/drivers/soc/qcom/pmic_glink_gio.c
@@ -116,6 +116,8 @@ struct pmic_glink_gio {
 	bool service_up;
 
 	struct gio_write_req write_req;
+
+	struct auxiliary_device *rtc_aux;
 };
 
 /* Must be called with pgio->lock held. */
@@ -318,6 +320,28 @@ static void pmic_glink_gio_enable_alerts(struct pmic_glink_gio *pgio)
 		dev_err(pgio->dev, "GIO turn on global alert failed: %d\n", ret);
 }
 
+static int pmic_glink_gio_add_consumer(struct pmic_glink_gio *pgio,
+				       struct auxiliary_device **aux,
+				       const char *name)
+{
+	struct auxiliary_device *new_aux;
+	int ret;
+
+	new_aux = devm_kzalloc(pgio->dev, sizeof(*new_aux), GFP_KERNEL);
+	if (!new_aux)
+		return -ENOMEM;
+
+	ret = devm_pmic_gio_add_consumer(pgio->gio, new_aux, name);
+	if (ret) {
+		devm_kfree(pgio->dev, new_aux);
+		return ret;
+	}
+
+	*aux = new_aux;
+
+	return 0;
+}
+
 static void pmic_glink_gio_init_work(struct work_struct *work)
 {
 	struct pmic_glink_gio *pgio = container_of(work, struct pmic_glink_gio, init_work);
@@ -326,6 +350,18 @@ static void pmic_glink_gio_init_work(struct work_struct *work)
 	if (!READ_ONCE(pgio->service_up))
 		return;
 
+	/*
+	 * Create GIO consumers after PDR to ensure the transport
+	 * is up before consumers use the GIO regmap device.
+	 */
+	if (!pgio->rtc_aux) {
+		ret = pmic_glink_gio_add_consumer(pgio, &pgio->rtc_aux, "rtc");
+		if (ret) {
+			dev_err(pgio->dev, "failed to add RTC consumer: %d\n", ret);
+			return;
+		}
+	}
+
 	pmic_glink_gio_enable_alerts(pgio);
 }
 

-- 
2.43.0

