Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0346036212D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325199; cv=none; b=PRC5H1ABWynq4ANNHyhIF0Ld05d13e2MUgWghAlSdQYICNs/aEz/ldE/C3UIq9ob77U8cTdDrk4N/p7SfU/G7wwSdIMJSw+kWTTgxBhv3yMO74Z+mL52QBshMb7zY4fLZaGjYC2lDk6Ot0CxE526j6TIGQZTTiBO2co5P2dWxrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325199; c=relaxed/simple;
	bh=W0YxKf/yAqCqi47WNCZuABBNYWvXFJ6dyNLPuuCUvMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HL/BXUKNVSfMo0o83H+dEYI0lTQ0NyOSCodk9A9JjfFe4LefC2WxksYdLfLxcTMbi79UzsURD+sdCFtEtnGD7yUKUIALWUypkWhtcvNdI/ojaF8cXWKaWxO8KTLC52/M1UfZMFpwOmz2aTfBpX12wtryCye+QRFcsAH4Wt6VxM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHRTtqaI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JM5+Md4j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHRTtqaI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JM5+Md4j"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6824ZpZY3750858
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 04:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5u6QXoja+tG
	1fz0jEsS2s3F+VjoTtgrKslth0oBgQH0=; b=QHRTtqaI4FdPkjPmspyEKbZZ3ib
	6DcIPXr05tbxjnfZSuKxLDQ8zRI6s6kjX3wfYNz7FBzyRkpW1x6gOO2Z1H4cqXZi
	wsn2yV496tr2uumDB0nFPQ9LlGlVErNksLRQDFmXTH0UVBfdYJhjrs/7Bw3LCbbR
	QmHtY7ywe08/8KpYfR2SpMj2OpMkhuwjSCGGzwKrR1piMg0WiYOIUPhJD9vFWKHk
	i9ZPmeHdZvmQofWK5BcaVf3dmWSLCUgwfY5DdQvjmyKITaBLzOFjkEhP8UHgf9Dt
	lNdSKl/+aCdWMqYR69XzE2ztcnSVK/wa/sNPuAVwdEEUAXawafYB77iRaGA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge38w262p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:59:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so610346a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788325195; x=1788929995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u6QXoja+tG1fz0jEsS2s3F+VjoTtgrKslth0oBgQH0=;
        b=JM5+Md4jI6ErqXmx5zbrAt2ItRspOKIgL1GBFn7Pk1hQYb+VR+axc0XtIOiAqXgQPR
         CDogJOeUDE6FWdY77JNomx6o+PzJma+b2lxE1G5gzG2pKiMNyzGXfHJdlQG2xcP91nKY
         n7GcRyDHBaoiIng7TLESJrsbbCqJwbvDYNq4UeBxxeLGSGPiwlhrLDsBOe0aCLJBQgJf
         gk7YBe5P5MYR4cG7HD1y1V12HQjVcQXgDWZSPhvjwbbIKGtbgc3NlzPBuO5FMQLo8HmY
         F4PZvtFWaPKwQg9PFtrfsWyX8ID2MBrGzSg07hgFPQtoawJ6v/C+YUSHQWq0Y6RtrbWD
         EACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325195; x=1788929995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5u6QXoja+tG1fz0jEsS2s3F+VjoTtgrKslth0oBgQH0=;
        b=mYS+6E5VXWyrlCJAkWwqCcSuBOSoh0vaC0jD/uG9hHejKa5/VDK6BXux7nK4Q09QWj
         kbcQXKwSXGHGMT4QMrKj/o36dtRm8x30EopfvoMCLK83MVhERFB1meOBAZmw2zvTr7+B
         I824VQ0SXciozN774POC2d2silyk+ELa5oQ5S7xNzrPWqzbnRuFfvVeD2S2jzZN5VqKA
         qIGxbZvqRsBJpRf38ZxJYvGVs7ujVvFifWdDe3iLH5aEe/Q6D13CZbb1fgDmOm02j/H7
         UZMX4vkq6BH8rtD2mF8RATxJc4+hofGntRagIs8FotbaqglwWlsLzsZgy4RHWJUclWBH
         lrDw==
X-Forwarded-Encrypted: i=1; AKwUvBzdb1z9RF+bTdS2odj9AVXEN+iOh7Hor7L/YQ8o4Hl3zV3INRdrNRBku46/zIiX7MnP8YiyDB4DMgyUiuE=@vger.kernel.org
X-Gm-Message-State: AFuF++lABNGz6wRcaNOrmu2ejrCwxb9t85EgGH3QM0u/LzOUAgcfNv6d
	i8KuSDGQLdakiWHidVXILc7goe29n5R2Pol8l2XtkBJQLmfMDfZSvDQpGakjY3/ZRUHIzYgljNt
	TZTNLX+pHw7qjhWc+R+Qo4JvSHj3qYc5YfqhNYJyW972NdXwLbRB8J9YG+yZHI3Uv52E=
X-Gm-Gg: AYBFou0C1fgaQBPp7ZnZwn/CQ6r7DeAi4vyv/omUk0AV7IQ3LTrZ3y/Y6VFSBXzDr+i
	7/+xDcIAoTS1K1arkamrn1U/U5YM0E9IaoVpq6E/yL7cpXahHTm7oFl3PVY0gsAsSyt1bhR+DHr
	k2cLDW1SxpazPWNS2BLAb4/9IMtzZSm2xLz1NgE9VsEoR5PDLygd/CptbBANqCnXkhpbC4BfXsA
	lPkhZSk/L4xSzUKx1VTWbvsH/hobpHYqadx1FOUMcY02mdu1ecElKB2diyVVM313P+HKGUolADM
	im+XFM23judeWoTE4fVhE9X4VUqB61jgIUzNyb8lMnItDJpXAesGTFXQ+wAR0wLjkfE2nFNz5lN
	ZWwY24/7cq4bT10uLy3hvW92KAbS9znNHtuqQCCrqus93zsvoj+TUXJIdH4Az
X-Received: by 2002:a17:90b:380d:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39aedc217demr2780931a91.0.1788325194502;
        Tue, 01 Sep 2026 21:59:54 -0700 (PDT)
X-Received: by 2002:a17:90b:380d:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39aedc217demr2780861a91.0.1788325193907;
        Tue, 01 Sep 2026 21:59:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea31f1esm2782639c88.8.2026.09.01.21.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:59:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
Date: Wed,  2 Sep 2026 12:59:38 +0800
Message-ID: <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: atc1NfSdPdP8Lg9_jCTrWB4BtnUh1xVX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfXyIY3UheavJ9N
 o+eXPx20hRQi2JaS/vdZsXd2zv8NijeT1aK+cJpXrUOObX5XHj3ubW4CrAHqqlbVpqIAxguNKQ1
 SLUpYn4Z7qUrT0vOFPyGVzquVSdiqyU=
X-Authority-Analysis: v=2.4 cv=LOpWhpW9 c=1 sm=1 tr=0 ts=6a97ad4b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-ozyDiMbBtCkaKFn3fsA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: atc1NfSdPdP8Lg9_jCTrWB4BtnUh1xVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX2gInySXHhDfU
 DxMazQ/dkJXzdMWSVfpmYxWzvAK0p4YflSWepjy0FW7W61mRW0DLQNhkPkuarM6xw5e2dJ7fmPD
 di7gGhAoTZ9hTvmdYBkekfpAnV+z4+//iYG72SA46oTiGqThJERGVXFOkBRGDXrUJTteq6mZCaq
 AqKl++rVZ5wAbftdFrrJyR0QYftqUWZeuJoLin6328isbYOhBwQ757UxLfjoGkd9F/z3M6YUd9Z
 cnSxJ9HaSjvCNxLTQMyTLmdIv2y+Wh/dv2THbn0YsQGgtQ2u2XWi39+nQGP8exz6ywVyoJfMZks
 Uk9SFTrV6ITaV+VSOhwSbz6SKObrHYkII9Z2sADvpgkdF7lFMy3pkjHsGrAcIBz+B/Us8FuELae
 Zrn5QmVIxFdfqcUA875yhqjs+iPkR+GQLxTPt7mRbl+IaGZiTeEglX+EGLiXbEeT50TLfDoiCMd
 FApqd/d1dgfYW2VUrHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020042

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
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/usb/typec/Kconfig     |  17 +
 drivers/usb/typec/Makefile    |   1 +
 drivers/usb/typec/fusb15201.c | 581 ++++++++++++++++++++++++++++++++++
 3 files changed, 599 insertions(+)
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
index 000000000000..920c561b6276
--- /dev/null
+++ b/drivers/usb/typec/fusb15201.c
@@ -0,0 +1,581 @@
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
+#include <linux/mod_devicetable.h>
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

