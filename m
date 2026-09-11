Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D054534AE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112084; cv=none; b=X4V2VTDM7vCEGvd2xkvx22SEd4vuDo2+O/8VNmt++gSFMIY+EKOvq+6l0EtwcO6H6gy7/0wpDnyV4BxQjqrydWYK2YLkgcxezxXIOQLY38kP1lqbgFTuSg2sgMaeqVdFTdxC30dbWeKZLHz9Zepw1+Esdx+PGaGhSRgjZBwCRqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112084; c=relaxed/simple;
	bh=3LnQvNqZQtAvp9WnUb4/NIPWUGzliW1Fem44ssAi8l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaUyhvlsVUAUHrgnKXLJ4asetaF8CO2OvNYSfDcGDko1AecTWAmDYbtzYeyrt4rp1IxIit/eYZ5gsa8qj7mEt7ebiRcdtNmtgdv6gdKk4raQHaeB0CxW79CaIWkoa8uXmDOuPb6hTcgQ1Ei/KK7mlLxATIDvAM/FoAskh9Vx17g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/7+dNlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MosjIWGd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/7+dNlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MosjIWGd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kISd2175509
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HF4QKyKT/Je
	wEhpZBgJfZkbG4kIoIpYGSlO1FDEn/LE=; b=e/7+dNlXIbqKoYBVy1X9Z764qIK
	Gp7RaxU8522b+PSpXMeUpglW/C5SEiHpy+aYOlnSjGaZmHj8Lps5O3TbtByeQqyA
	61Q2yldVkC8viyYzy29NYh9PZtaAtxbkH+mQYAFqbTKWyWdH4zEMGnCAdBKZn6AF
	H8yQBpyW+BO6Kh0g5gDvnEPYLnNWl2OidvQk61shcBkLpWyDZf6wcT6yjZ2SM42N
	1cEcFbECSKxg0E+QsuNWHQqJrLMKdUMyc7n8+phT3saBBD+1zGlVjCqm5pzvBdC4
	GLtGi30q55r/jce/PHAHCDnoL6G0QmksO/+MRoasUX+fBjWk8LdHoywxSfA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uch9k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1001640a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789112075; x=1789716875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HF4QKyKT/JewEhpZBgJfZkbG4kIoIpYGSlO1FDEn/LE=;
        b=MosjIWGdY8GfARVnddky/kkAa1H7iTf395GR+UVU0oe9dTXG3LPO+EIA1Z3lpcOG9G
         U/LnxasMg3rtsSsd6+vHoHnvVLe87nXTF9EPgoUH35y3Pi6KqP39S8/a02c5mhx/fze3
         ySS5OHEH56IjqVOLcL8Id66NYY9xrtAh8kMirRMvLr82sz5hAJxFBD5gQEmWt5HNJxvu
         gcDFKqY7PZ/k+++dqjfZ5C5BGxiyS/gtHokMTclQZNriTA3rGaD5fL12lEKSz21C1LRX
         cD/9f6lL+7oXp3W8MAWXx5RcP8A77MCGjTChrtI40/JIw0Ht5//e5/5NrGvSRataJlhP
         SzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112075; x=1789716875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HF4QKyKT/JewEhpZBgJfZkbG4kIoIpYGSlO1FDEn/LE=;
        b=kTdqLiaEYkmogS+/+ipzKItU2G+EQh6DHt4sYfTwmxtiAo8sLav5ktOXSw52H+ThJ1
         rbDp9M0ySEkgJkTKJTa0boO4F9+dqDlt+o1cVkLzwGZO0tNHQIFiopipBwhC8sOrDYbf
         98lATOHuuIjgIqJEtvpmpDi70sic6Htfwe1zwj+HRPRA6mE5bB4BOYOYCwUTKOeSAmWZ
         ZswkKm8hKfRFlZaFuzYMxoNjrQx1//XLEczdpdCFoDqKvTTvW0hWT4+q6BPJvQXsiJz+
         igev8t9Csz6exx8hnvEYMq+u9ZRBGK+zFw1FImGHn3Ua3LvuiI+k3bOFGaNpfDfFaVuR
         rn1A==
X-Forwarded-Encrypted: i=1; AKwUvBxo9PJw2ddwhRMzQqWqy62XBroQL9diFVntMzQV4hYVSyxS2Eyrbw/o9SKAxU9IhjM9d/5XPRGBfQ2DGew=@vger.kernel.org
X-Gm-Message-State: AFuF++l3UQ7nwH9YG1BvyOvMQb3phu7oiWoaZDdhPhEifTiksqiW86M1
	CtMvyyADIQ1pzgFMOo/T19cLcqZ1lOSiblwy+glrjQUMyfr4QbYtbrdRA8V8P6/GKfp0ZNfzIlr
	7iE2d9rcU+1FAmi+23EnTh27HAuGj0ZRPPC1t1fndKrBWVqVULWO6ReGzxnnI0YDlfdQ=
X-Gm-Gg: AYBFou3YDrCa5eUZ/Gs/38u/awzCnFwDKb2bkZ9PkLzC8JUjz5BCcMFMUnqtpPPKYWf
	gnjzPLSo/dW1GwrisJ0zFt9dsWWtBYX2fRtynUoNaPfLW5b4Bv3f2q25Ga/aHj+kJR8wHnWBQ6k
	YpTwfCa9C7/ettRXM7C/6VY4KrP+XWBqKMpoieHAoBDInlr4805KWL5Y+G8xNyrTMsgE4Pouzu1
	LGftRMAm9LZ8ZEDr0K6HkS9Nm9AegOD87neCQ0Viek5b8v/jkgHGDjNNxAU+1gjQbsznJbLHvSC
	xyLqDhfsCGFNMcouMFN7j6a3uiQAhoxDi64Rg5RWo73PVijXqBdqyRw0SZDy1z5SHudZcpPrYtB
	rqlwydiAL+cLKGREmu8bmMADzWN8XNo0ylGASGDxendRJuQyYk/3uYXKpzGfd
X-Received: by 2002:a17:90b:2d82:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39d77d22aa2mr10616582a91.32.1789112075023;
        Fri, 11 Sep 2026 00:34:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39d77d22aa2mr10616523a91.32.1789112074317;
        Fri, 11 Sep 2026 00:34:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm6163058c88.14.2026.09.11.00.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:34:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 RESEND 2/2] usb: typec: Add onsemi FUSB15201 driver
Date: Fri, 11 Sep 2026 15:34:14 +0800
Message-ID: <20260911073414.16711-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
References: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3af0c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-ozyDiMbBtCkaKFn3fsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfXwMFvoUtdaxGU
 psopOGXps6L45Rya8WyxvXtQyuFzvsS+fh6FCX3/gCeqr4pyX6UI4/kjcZG7toExH1KHSMi/Pl8
 tfVQWGdHsjYj8qfFoeHG/Z1ikB15K+XBYBlPcNlV4enNtG04cuCw1ZWlBu1ZZoSWhDUbwbxgnaR
 7DMZBp6P31NcNn5bwbS0WwgOYR4PST0dxmyXBpHr6oC9NuvPgvc1iDTG0Tc0hc//MG90icKfVlx
 HCgewIzbsVsZO0WPefBOSuJ5IyY1ZmIjHuJbpq5Nc/Ecx2Gf5Q8mEbzmTl4+w1oqCiCGUH1Tlti
 KpCIwsF+EjWiEKG1heF6BnFa8sjRo2wmbO4AwPM08IHfvLGAYud0oezNNzdnrxN/vczTsa4GiQC
 LMc7x5XuIPzm7vhUiaRFy7ZhI1JK+n5ppsMbz2toimmk35qtKRviCLdHVfIlW0XvCBHvctuElo5
 KYecaU5RZg5Ha0WhDtg==
X-Proofpoint-GUID: GQ-dBdXVsTaucbjjChaVfo-ZKh0ezKpR
X-Proofpoint-ORIG-GUID: GQ-dBdXVsTaucbjjChaVfo-ZKh0ezKpR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfX/ZVc9AnmJZnl
 ZUbUu1LnVS1CEQEMjLu2CDoWmxiIlMuU+ve97Vmj6+5lWXyBu+cSHJTTjYZDPlvQibDEPVWJGWn
 v1ZxB+mROLHm83s5dFUUxw5JQu3gF90=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110104

The FUSB15201 is a dual-port USB Type-C and Power Delivery controller
which runs the Type-C state machine and the PD policy engine on an
integrated microcontroller. The host only observes the resulting state
and may ask for role swaps, so this is a plain Type-C class driver
rather than a TCPC driven by the Type-C Port Manager.

Register a Type-C port for each connector described in firmware, report
attach and detach, orientation, power and data roles and the PD
capability of the partner, and drive the USB role switch of the attached
USB controller so that OTG role switching works. Data and power role
swaps requested through sysfs are forwarded to the controller, which
performs them asynchronously and reports the outcome as a port status
interrupt.

The controller exposes a per-port VBUS ADC reading, but the Type-C class
has no VBUS attribute and nothing needs the value, so it is not read.
PD messages, PDOs and alternate modes are not exposed by the hardware at
all. The chip-wide MASTER_RESET command would drop both ports at once
and has no caller, so it is left alone as well.

Assisted-by: LLM
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/usb/typec/Kconfig     |  17 +
 drivers/usb/typec/Makefile    |   1 +
 drivers/usb/typec/fusb15201.c | 580 ++++++++++++++++++++++++++++++++++
 3 files changed, 598 insertions(+)
 create mode 100644 drivers/usb/typec/fusb15201.c

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 2f80c2792dbd..e21854cb89d4 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -64,6 +64,23 @@ config TYPEC_ANX7411
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called anx7411.ko.
 
+config TYPEC_FUSB15201
+	tristate "onsemi FUSB15201 Type-C and Power Delivery controller driver"
+	depends on I2C
+	depends on USB_ROLE_SWITCH
+	select REGMAP_I2C
+	help
+	  Say Y or M here if your system has an onsemi FUSB15201 dual-port USB
+	  Type-C and Power Delivery controller.
+
+	  The FUSB15201 handles Type-C detection and Power Delivery negotiation
+	  autonomously. This driver reports the resulting state to the Type-C
+	  class, drives the USB role switch of the attached USB controller, and
+	  allows data and power role swaps to be requested.
+
+	  If you choose to build this driver as a dynamically linked module, the
+	  module will be called fusb15201.ko.
+
 config TYPEC_RT1719
 	tristate "Richtek RT1719 Sink Only Type-C controller driver"
 	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 8a6a1c663eb6..9f3a156d9c9f 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
 obj-$(CONFIG_TYPEC_TPS6598X)	+= tipd/
 obj-$(CONFIG_TYPEC_ANX7411)	+= anx7411.o
+obj-$(CONFIG_TYPEC_FUSB15201)	+= fusb15201.o
 obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
 obj-$(CONFIG_TYPEC_STUSB160X) 	+= stusb160x.o
 obj-$(CONFIG_TYPEC_RT1719)	+= rt1719.o
diff --git a/drivers/usb/typec/fusb15201.c b/drivers/usb/typec/fusb15201.c
new file mode 100644
index 000000000000..897b2fabc449
--- /dev/null
+++ b/drivers/usb/typec/fusb15201.c
@@ -0,0 +1,580 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Driver for the onsemi FUSB15201 dual-port USB Type-C and Power Delivery
+ * controller.
+ *
+ * The FUSB15201 runs the Type-C state machine and the Power Delivery policy
+ * engine on an integrated microcontroller. The host only observes the
+ * resulting state and may ask for role swaps, so this is a plain Type-C class
+ * driver rather than a TCPC on the Type-C Port Manager.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/usb/role.h>
+#include <linux/usb/typec.h>
+
+#define FUSB15201_NUM_PORTS		2
+
+#define FUSB15201_REG_VENDID		0x00
+#define FUSB15201_REG_PRODID		0x01
+#define FUSB15201_REG_DEVID		0x02
+#define FUSB15201_REG_HWVER		0x03
+#define FUSB15201_REG_FWVER		0x04
+
+#define FUSB15201_VENDID		0xaa
+#define FUSB15201_PRODID		0x65
+#define FUSB15201_DEVID			0x01
+
+/* Per-port status block, port A at 0x06 and port B at 0x0c */
+#define FUSB15201_PORT_BASE(p)		(0x06 + (p) * 0x06)
+#define FUSB15201_REG_STATUS(p)		(FUSB15201_PORT_BASE(p) + 0x02)
+#define FUSB15201_REG_RESET_STATUS(p)	(FUSB15201_PORT_BASE(p) + 0x03)
+#define FUSB15201_REG_FAULT_STATUS(p)	(FUSB15201_PORT_BASE(p) + 0x04)
+
+#define FUSB15201_STATUS_ATTACHED	BIT(0)
+#define FUSB15201_STATUS_USBPD		BIT(1)
+#define FUSB15201_STATUS_CC2		BIT(2)
+#define FUSB15201_STATUS_DFP		BIT(3)
+#define FUSB15201_STATUS_SINK		BIT(4)
+
+#define FUSB15201_RESET_ERR_RECOVERY	BIT(2)
+
+#define FUSB15201_FAULT_VBUS_OVP	BIT(0)
+#define FUSB15201_FAULT_OTP		BIT(1)
+#define FUSB15201_FAULT_CC_OVP		BIT(2)
+#define FUSB15201_FAULT_VCONN_OCP	BIT(3)
+
+/* Per-port command block, port A at 0x11 and port B at 0x13 */
+#define FUSB15201_REG_COMMANDS(p)	(0x11 + (p) * 0x02)
+#define FUSB15201_REG_INT_MASK(p)	(0x12 + (p) * 0x02)
+
+/*
+ * The swap command bits are named after the role the port is in when the swap
+ * is requested, not the role it ends up in.
+ */
+#define FUSB15201_CMD_UFP_TO_DFP	BIT(4)
+#define FUSB15201_CMD_DFP_TO_UFP	BIT(5)
+#define FUSB15201_CMD_SINK_TO_SOURCE	BIT(6)
+#define FUSB15201_CMD_SOURCE_TO_SINK	BIT(7)
+
+#define FUSB15201_REG_MASTER_CONTROL	0x15
+#define FUSB15201_MASTER_DRP_DISABLE	BIT(1)
+
+/* Per-port interrupt status, write one to clear */
+#define FUSB15201_REG_INTERRUPT(p)	(0x16 + (p))
+#define FUSB15201_INT_FAULT		BIT(0)
+#define FUSB15201_INT_RESET_STATUS	BIT(1)
+#define FUSB15201_INT_PORT_STATUS	BIT(2)
+#define FUSB15201_INT_ALL		(FUSB15201_INT_FAULT | \
+					 FUSB15201_INT_RESET_STATUS | \
+					 FUSB15201_INT_PORT_STATUS)
+
+#define FUSB15201_REG_MAX		FUSB15201_REG_INTERRUPT(1)
+
+struct fusb15201;
+
+struct fusb15201_port {
+	struct fusb15201 *chip;
+	unsigned int index;
+	struct typec_port *port;
+	struct typec_partner *partner;
+	struct usb_role_switch *role_sw;
+	struct typec_capability cap;
+	unsigned int status;
+};
+
+struct fusb15201 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex lock;	/* serialises access to the shared registers */
+	struct fusb15201_port ports[FUSB15201_NUM_PORTS];
+};
+
+static enum typec_role fusb15201_default_pwr_role(struct fusb15201_port *port)
+{
+	switch (port->cap.type) {
+	case TYPEC_PORT_SRC:
+		return TYPEC_SOURCE;
+	case TYPEC_PORT_SNK:
+		return TYPEC_SINK;
+	default:
+		if (port->cap.prefer_role == TYPEC_SOURCE)
+			return TYPEC_SOURCE;
+		return TYPEC_SINK;
+	}
+}
+
+static void fusb15201_set_roles(struct fusb15201_port *port,
+				enum typec_role pwr_role,
+				enum typec_data_role data_role, bool attached)
+{
+	typec_set_pwr_role(port->port, pwr_role);
+	typec_set_vconn_role(port->port, pwr_role);
+	typec_set_data_role(port->port, data_role);
+
+	if (!port->role_sw)
+		return;
+
+	if (!attached)
+		usb_role_switch_set_role(port->role_sw, USB_ROLE_NONE);
+	else if (data_role == TYPEC_HOST)
+		usb_role_switch_set_role(port->role_sw, USB_ROLE_HOST);
+	else
+		usb_role_switch_set_role(port->role_sw, USB_ROLE_DEVICE);
+}
+
+static void fusb15201_hw_update(struct fusb15201_port *port)
+{
+	struct fusb15201 *chip = port->chip;
+	enum typec_data_role data_role;
+	enum typec_role pwr_role;
+	unsigned int status;
+	int ret;
+
+	ret = regmap_read(chip->regmap, FUSB15201_REG_STATUS(port->index),
+			  &status);
+	if (ret) {
+		dev_warn(chip->dev, "port%u: failed to read status: %d\n",
+			 port->index, ret);
+		return;
+	}
+
+	if (!(status & FUSB15201_STATUS_ATTACHED)) {
+		if (port->partner) {
+			typec_unregister_partner(port->partner);
+			port->partner = NULL;
+		}
+
+		/*
+		 * None of the remaining status bits are valid while detached,
+		 * so fall back to what the port is configured to do.
+		 */
+		typec_set_orientation(port->port, TYPEC_ORIENTATION_NONE);
+		typec_set_pwr_opmode(port->port, TYPEC_PWR_MODE_USB);
+
+		pwr_role = fusb15201_default_pwr_role(port);
+		data_role = pwr_role == TYPEC_SOURCE ? TYPEC_HOST : TYPEC_DEVICE;
+		fusb15201_set_roles(port, pwr_role, data_role, false);
+
+		port->status = status;
+		return;
+	}
+
+	if (!(port->status & FUSB15201_STATUS_ATTACHED)) {
+		struct typec_partner_desc desc = {
+			.usb_pd = !!(status & FUSB15201_STATUS_USBPD),
+		};
+
+		port->partner = typec_register_partner(port->port, &desc);
+		if (IS_ERR(port->partner)) {
+			dev_err(chip->dev,
+				"port%u: failed to register partner: %pe\n",
+				port->index, port->partner);
+			port->partner = NULL;
+		}
+	}
+
+	typec_set_orientation(port->port, status & FUSB15201_STATUS_CC2 ?
+			      TYPEC_ORIENTATION_REVERSE :
+			      TYPEC_ORIENTATION_NORMAL);
+
+	/*
+	 * The controller only tells us whether the partner is PD capable. The
+	 * Type-C current advertisement is not reported, so 1.5A and 3.0A
+	 * operation cannot be distinguished from the default.
+	 */
+	typec_set_pwr_opmode(port->port, status & FUSB15201_STATUS_USBPD ?
+			     TYPEC_PWR_MODE_PD : TYPEC_PWR_MODE_USB);
+
+	pwr_role = status & FUSB15201_STATUS_SINK ? TYPEC_SINK : TYPEC_SOURCE;
+	data_role = status & FUSB15201_STATUS_DFP ? TYPEC_HOST : TYPEC_DEVICE;
+	fusb15201_set_roles(port, pwr_role, data_role, true);
+
+	port->status = status;
+}
+
+static void fusb15201_report_faults(struct fusb15201_port *port)
+{
+	struct fusb15201 *chip = port->chip;
+	unsigned int fault;
+	int ret;
+
+	ret = regmap_read(chip->regmap, FUSB15201_REG_FAULT_STATUS(port->index),
+			  &fault);
+	if (ret)
+		return;
+
+	/*
+	 * The controller protects itself, so there is nothing to do here
+	 * beyond making the fault visible.
+	 */
+	if (fault & FUSB15201_FAULT_VBUS_OVP)
+		dev_warn_ratelimited(chip->dev, "port%u: VBUS overvoltage\n",
+				     port->index);
+	if (fault & FUSB15201_FAULT_OTP)
+		dev_warn_ratelimited(chip->dev, "port%u: over temperature\n",
+				     port->index);
+	if (fault & FUSB15201_FAULT_CC_OVP)
+		dev_warn_ratelimited(chip->dev, "port%u: CC overvoltage\n",
+				     port->index);
+	if (fault & FUSB15201_FAULT_VCONN_OCP)
+		dev_warn_ratelimited(chip->dev, "port%u: VCONN overcurrent\n",
+				     port->index);
+}
+
+static void fusb15201_report_reset(struct fusb15201_port *port)
+{
+	struct fusb15201 *chip = port->chip;
+	unsigned int reset;
+	int ret;
+
+	ret = regmap_read(chip->regmap, FUSB15201_REG_RESET_STATUS(port->index),
+			  &reset);
+	if (ret)
+		return;
+
+	dev_dbg(chip->dev, "port%u: reset status 0x%02x\n", port->index, reset);
+
+	if (reset & FUSB15201_RESET_ERR_RECOVERY)
+		dev_warn_ratelimited(chip->dev,
+				     "port%u: entered error recovery\n",
+				     port->index);
+}
+
+static irqreturn_t fusb15201_irq(int irq, void *data)
+{
+	struct fusb15201 *chip = data;
+	irqreturn_t ret = IRQ_NONE;
+	unsigned int i;
+
+	guard(mutex)(&chip->lock);
+
+	for (i = 0; i < FUSB15201_NUM_PORTS; i++) {
+		struct fusb15201_port *port = &chip->ports[i];
+		unsigned int pending;
+
+		if (!port->port)
+			continue;
+
+		if (regmap_read(chip->regmap, FUSB15201_REG_INTERRUPT(i),
+				&pending))
+			continue;
+
+		pending &= FUSB15201_INT_ALL;
+		if (!pending)
+			continue;
+
+		/* Write one to clear */
+		regmap_write(chip->regmap, FUSB15201_REG_INTERRUPT(i), pending);
+
+		if (pending & FUSB15201_INT_PORT_STATUS)
+			fusb15201_hw_update(port);
+		if (pending & FUSB15201_INT_FAULT)
+			fusb15201_report_faults(port);
+		if (pending & FUSB15201_INT_RESET_STATUS)
+			fusb15201_report_reset(port);
+
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+/*
+ * Role swaps are asynchronous: the command only asks the controller to start
+ * the swap, and the outcome arrives later as a port status interrupt.
+ */
+static int fusb15201_command(struct fusb15201_port *port, unsigned int cmd)
+{
+	struct fusb15201 *chip = port->chip;
+
+	guard(mutex)(&chip->lock);
+
+	if (!(port->status & FUSB15201_STATUS_ATTACHED))
+		return -ENOTCONN;
+
+	return regmap_write(chip->regmap, FUSB15201_REG_COMMANDS(port->index),
+			    cmd);
+}
+
+static int fusb15201_dr_set(struct typec_port *p, enum typec_data_role role)
+{
+	struct fusb15201_port *port = typec_get_drvdata(p);
+	unsigned int cmd;
+
+	cmd = role == TYPEC_HOST ? FUSB15201_CMD_UFP_TO_DFP :
+				   FUSB15201_CMD_DFP_TO_UFP;
+
+	return fusb15201_command(port, cmd);
+}
+
+static int fusb15201_pr_set(struct typec_port *p, enum typec_role role)
+{
+	struct fusb15201_port *port = typec_get_drvdata(p);
+	unsigned int cmd;
+
+	cmd = role == TYPEC_SOURCE ? FUSB15201_CMD_SINK_TO_SOURCE :
+				     FUSB15201_CMD_SOURCE_TO_SINK;
+
+	return fusb15201_command(port, cmd);
+}
+
+static const struct typec_operations fusb15201_typec_ops = {
+	.dr_set = fusb15201_dr_set,
+	.pr_set = fusb15201_pr_set,
+};
+
+/*
+ * Nearly every register is either volatile or write-only, and the interrupt
+ * registers are write-one-to-clear, so the register map is not cached.
+ */
+static const struct regmap_config fusb15201_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = FUSB15201_REG_MAX,
+};
+
+static void fusb15201_unregister_port(void *data)
+{
+	struct fusb15201_port *port = data;
+
+	if (port->partner)
+		typec_unregister_partner(port->partner);
+	typec_unregister_port(port->port);
+}
+
+static void fusb15201_put_role_sw(void *data)
+{
+	usb_role_switch_put(data);
+}
+
+static int fusb15201_check_id(struct fusb15201 *chip)
+{
+	static const struct {
+		unsigned int reg;
+		unsigned int expected;
+		const char *name;
+	} ids[] = {
+		{ FUSB15201_REG_VENDID, FUSB15201_VENDID, "vendor" },
+		{ FUSB15201_REG_PRODID, FUSB15201_PRODID, "product" },
+		{ FUSB15201_REG_DEVID, FUSB15201_DEVID, "device" },
+	};
+	unsigned int val, hwver, fwver;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(ids); i++) {
+		ret = regmap_read(chip->regmap, ids[i].reg, &val);
+		if (ret)
+			return dev_err_probe(chip->dev, ret,
+					     "failed to read %s id\n",
+					     ids[i].name);
+
+		if (val != ids[i].expected)
+			return dev_err_probe(chip->dev, -ENODEV,
+					     "bad %s id 0x%02x, expected 0x%02x\n",
+					     ids[i].name, val, ids[i].expected);
+	}
+
+	/*
+	 * The register semantics are defined by the firmware image, so record
+	 * the versions to make mismatches easier to spot.
+	 */
+	if (!regmap_read(chip->regmap, FUSB15201_REG_HWVER, &hwver) &&
+	    !regmap_read(chip->regmap, FUSB15201_REG_FWVER, &fwver))
+		dev_dbg(chip->dev, "hardware version %u, firmware version %u\n",
+			hwver, fwver);
+
+	return 0;
+}
+
+static int fusb15201_register_port(struct fusb15201 *chip,
+				   struct fwnode_handle *fwnode)
+{
+	struct fusb15201_port *port;
+	unsigned int index;
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, "reg", &index);
+	if (ret)
+		return dev_err_probe(chip->dev, ret,
+				     "missing reg property of %pfwP\n", fwnode);
+
+	if (index >= FUSB15201_NUM_PORTS)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "invalid connector index %u\n", index);
+
+	port = &chip->ports[index];
+	if (port->port)
+		return dev_err_probe(chip->dev, -EINVAL,
+				     "duplicate connector for port %u\n", index);
+
+	port->chip = chip;
+	port->index = index;
+
+	ret = typec_get_fw_cap(&port->cap, fwnode);
+	if (ret)
+		return dev_err_probe(chip->dev, ret,
+				     "port%u: failed to get capabilities\n",
+				     index);
+
+	port->cap.revision = USB_TYPEC_REV_2_0;
+	port->cap.orientation_aware = true;
+	port->cap.driver_data = port;
+	port->cap.ops = &fusb15201_typec_ops;
+
+	port->port = typec_register_port(chip->dev, &port->cap);
+	if (IS_ERR(port->port)) {
+		ret = PTR_ERR(port->port);
+		port->port = NULL;
+		return dev_err_probe(chip->dev, ret,
+				     "port%u: failed to register\n", index);
+	}
+
+	ret = devm_add_action_or_reset(chip->dev, fusb15201_unregister_port,
+				       port);
+	if (ret)
+		return ret;
+
+	port->role_sw = fwnode_usb_role_switch_get(fwnode);
+	if (IS_ERR(port->role_sw))
+		return dev_err_probe(chip->dev, PTR_ERR(port->role_sw),
+				     "port%u: failed to get role switch\n",
+				     index);
+
+	if (port->role_sw) {
+		ret = devm_add_action_or_reset(chip->dev, fusb15201_put_role_sw,
+					       port->role_sw);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int fusb15201_hw_init(struct fusb15201 *chip)
+{
+	bool source_only = true;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < FUSB15201_NUM_PORTS; i++) {
+		struct fusb15201_port *port = &chip->ports[i];
+
+		if (!port->port) {
+			/* Nothing describes this port, keep it quiet. */
+			ret = regmap_write(chip->regmap,
+					   FUSB15201_REG_INT_MASK(i),
+					   FUSB15201_INT_ALL);
+			if (ret)
+				return ret;
+
+			continue;
+		}
+
+		if (port->cap.type != TYPEC_PORT_SRC)
+			source_only = false;
+
+		ret = regmap_write(chip->regmap, FUSB15201_REG_INT_MASK(i), 0);
+		if (ret)
+			return ret;
+
+		/* Discard anything that happened before we got here */
+		ret = regmap_write(chip->regmap, FUSB15201_REG_INTERRUPT(i),
+				   FUSB15201_INT_ALL);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Dual role toggling is the only configurable part of the Type-C state
+	 * machine, and it is chip wide rather than per port, which is why it is
+	 * set up here instead of from a port_type_set() callback.
+	 */
+	return regmap_update_bits(chip->regmap, FUSB15201_REG_MASTER_CONTROL,
+				  FUSB15201_MASTER_DRP_DISABLE,
+				  source_only ? FUSB15201_MASTER_DRP_DISABLE : 0);
+}
+
+static int fusb15201_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct fusb15201 *chip;
+	unsigned int i, nports = 0;
+	int ret;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = dev;
+	i2c_set_clientdata(client, chip);
+
+	ret = devm_mutex_init(dev, &chip->lock);
+	if (ret)
+		return ret;
+
+	chip->regmap = devm_regmap_init_i2c(client, &fusb15201_regmap_config);
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(dev, PTR_ERR(chip->regmap),
+				     "failed to initialise register map\n");
+
+	ret = fusb15201_check_id(chip);
+	if (ret)
+		return ret;
+
+	device_for_each_child_node_scoped(dev, fwnode) {
+		ret = fusb15201_register_port(chip, fwnode);
+		if (ret)
+			return ret;
+
+		nports++;
+	}
+
+	if (!nports)
+		return dev_err_probe(dev, -ENODEV, "no connector described\n");
+
+	ret = fusb15201_hw_init(chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialise\n");
+
+	/* Seed the Type-C class with the current state before arming the IRQ */
+	for (i = 0; i < FUSB15201_NUM_PORTS; i++) {
+		if (chip->ports[i].port)
+			fusb15201_hw_update(&chip->ports[i]);
+	}
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, fusb15201_irq,
+					IRQF_ONESHOT, dev_name(dev), chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq\n");
+
+	return 0;
+}
+
+static const struct of_device_id fusb15201_of_match[] = {
+	{ .compatible = "onnn,fusb15201" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, fusb15201_of_match);
+
+static struct i2c_driver fusb15201_driver = {
+	.driver = {
+		.name = "fusb15201",
+		.of_match_table = fusb15201_of_match,
+	},
+	.probe = fusb15201_probe,
+};
+module_i2c_driver(fusb15201_driver);
+
+MODULE_AUTHOR("Shawn Guo <shengchao.guo@oss.qualcomm.com>");
+MODULE_DESCRIPTION("onsemi FUSB15201 Type-C and Power Delivery controller");
+MODULE_LICENSE("GPL");
-- 
2.43.0

