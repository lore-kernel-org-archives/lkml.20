Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A955292D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089300; cv=none; b=nVYkogIYP2e4m+HyW/F50o1Gts4MCCsw6p65cGUMI1p2UDc1KqTO3McVdrwpBx9PIf5JHu7eGTMCrCQVXUetsP3lOVqqpONl5fQIy9d2tlgusC4vht+wU3CL374d5paGWrgNRuVTgN3Cj/JmKbGVWTO9yZ8UxU1iM9eKMz1fylc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089300; c=relaxed/simple;
	bh=ryg85ObrTJOAyfSo30gmnDwUUGRxahMFV5OJfmrABuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9uvM9NV3UISSWi+crALtSSkECxpF1z61/XSgZbw1oXRCn9IvuvL8djKrxwKlJYZxoQoDs1kVIR4auLGy5PdUJOnzT0OEd/CiIb1mYq2M4Fu7AeHluWDSeKMxq5GtOlETej8ewlNprnLzNdoMX9TI7p8vSAI+zjkX7YRQCt8pHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqNKNffW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kS/WOvKJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqNKNffW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kS/WOvKJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjV8r1058306
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tU3Bdg6TWqn6w8wy9nbrOLNYOseegQA2LbNaQyxSzks=; b=CqNKNffWaYZg9pbC
	zQLyDDVaQYnjT4Gfmb+uSiYIeg9nQq2upgbf1GuXRTCyHoUA3kYWZixsuJyZ83KV
	xF4Ftc1dSRLHzHMfOG9ZGwEAJGJERdL/ptS+eRPOzmVN5sejl/+EqsA6LxU7qPbE
	EsMFf/dydUs7wH++vKJ3NjMd/qnAsV66JvQKP0snB0LZ1fclkIyTIZ+nRQrxEjsR
	22vykOec+zBU7bpXnDnNYVMKYJIGh+KiI5SJFvyPLGn+MUmiP/FVQ0e2H5v/uw5V
	4kUhCoveq/AUWfOMVsgkzYvoypg62efLbItICiqWVGf32bvKCQHUUvSn4hzKZNS5
	SzV4Zg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5u049-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:01:36 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c98fd65daaso4464686e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790089291; x=1790694091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tU3Bdg6TWqn6w8wy9nbrOLNYOseegQA2LbNaQyxSzks=;
        b=kS/WOvKJCIg1N9WGDCvgMWOJ2K2y8hht09wUF4WWUvRPD7CCE8dcLKMAPhlFMDXf0u
         cagHfofM1/fooVOWJ7CcskYiNI3UEpEVxpKIqq/kLWa3vYvexNH33RIwSntRnUQZ62xx
         bjpRzP5H+ICo7O4iNbNVLIhQFBKRY0dbre+/r+trwdQQjB8hhqR6NlhBBhUxaSipRm3J
         8AUQ9Q7NTeOOeoM1PmW2UGbK9B0P4ZUoN4kmhF2O1EJhtHR65nFeleIER3ov3ft7RtQQ
         buHtuxMMwsUXcMJdgq1LlrE285/mowcP7OVKG/hAGw3KVcy9yL9hkFJj6hQuI9qmALKB
         ymLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089291; x=1790694091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tU3Bdg6TWqn6w8wy9nbrOLNYOseegQA2LbNaQyxSzks=;
        b=C3MeJq5pXvL1ic9DMILt5jXL7kGA/X0iBVcc9nA42NOLObMWPufoqUdGTuEXE9eSDA
         jSCggEn2um+I+wIVUtZeW3uktAmL2wx891ut/1ifVrLs06eOjA/cajBuQV8ZNxfQYdFK
         ERKrCPynmSq6t/tL+0c/3k28+x2Flgc9K+7kSY0xdLRaS/1FjagQ4+repwomfuOBtSUR
         2nHF+d9/zyFG4QP3jIIavzMIqkDVRI0uJgUHgSir0Igg1wdJo7Nd+FrlcWuTSEtoNSJZ
         eOR6UHw6y9ENiDv+gmlZ1ReoYnYtzP3RglFqT4U5Z95u6YWF/puAetaygCgmthpnqATD
         6pKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV5bGSNoQrhm3Lb2kBJA79EvmsU9ximeHzxj30dGOMGDBvqIfMMVbloVByUyYu+7gWgqF/PEHA1lvrgNM=@vger.kernel.org
X-Gm-Message-State: AFuF++lbSkz0BHbFaTGSiU9KXNc0+E7+lvQEiOZZoGbtF7sQwm2asuLl
	ZUUGFRg4WomgQ5cXUskJ+CsCm4zK9XWpAWYLg5eu59UQuetq2pLk9rlya6N0ZEhKyr5cvUOL62C
	VycO7+Qg+PtGRYW1BIFXu2O1CrSqTSgQ7l3Usuf+TfAv65q0XnAfzRdKi2pLL1IDZaBc=
X-Gm-Gg: AYBFou2FVoExebfMqWRghHpd5zpVV4/TAfo73KHtNSh+oPtXySSwyGgARbF+PF6UPjj
	KfDJFcvnoXUs/sjueDz7eWvAt6kjZLFOjkgLNIBMTt7lVDTQR/eN/BGeM5I96Yj6rPWfdAWOPuv
	o4pBKlofCL+gNN4qmwzDtWhUezGICsYD+iza87luHuXst6uUhfFxDu9bLPZGTx0DRMuY5sfKnqO
	FxhGTMLjeok6nODBhUtGRkUWYMfz6/wy3zNY/5bWHN7yRJVVwaXcA1usN5I99fbfGhGAqMe64BW
	oN4LWOC+VqOQuEQZR8ggi7MGIyUpVpXWo2V5slvi8ertYuOSa0/XG50ar64emdrJO6XbcMBoIGz
	Y1PzfVV/946GW0IxbP6o6muSokec=
X-Received: by 2002:a05:6122:3116:b0:5c9:a60b:e5b1 with SMTP id 71dfb90a1353d-5c9b5934364mr9606676e0c.10.1790089290223;
        Tue, 22 Sep 2026 08:01:30 -0700 (PDT)
X-Received: by 2002:a05:6122:3116:b0:5c9:a60b:e5b1 with SMTP id 71dfb90a1353d-5c9b5934364mr9606580e0c.10.1790089289382;
        Tue, 22 Sep 2026 08:01:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4504298f8f.35.2026.09.22.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:01:08 +0200
Subject: [PATCH v2 2/4] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-nord-usb-dwc-dts-v2-2-ba2b39f1a843@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9585;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ryg85ObrTJOAyfSo30gmnDwUUGRxahMFV5OJfmrABuQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqspg+fs/gF5EOYe4dwJcAdW1I/2F97liSt0tER
 mAZxaucwzaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKYPgAKCRAFnS7L/zaE
 w5fnD/9pgTFRhWTjf+UID3uHsIMWT8+LxZY4vmKXqJzaZBOvRyqDNf7gGGTAFdWamSbHwxUsmaG
 MixINeAtmlUJnx/k453cc7nPUVJe0AYSbteAltpaYgR8DrS88MTme5l0NqODS9NGZ6a8hyoZ/xP
 Fowoewh3PghQDeSHlRNjSX1XQV+QZR9MPy9Hk3zQ+VZuZVXZEmI7kQmH5t4kJFK2FBg+bl2y75j
 1JnYng0hptniqZQ6GahktdazHLFjXwmDRynuMXg5gddsHYM35cIkTVQSsCgeaST9ayQEBuBj8Rr
 AIPtjsQ3PQXBGe76Br09nkgZenfj5KXmAKOm8mrrMwL/MJC3bv05z8fcM9LSh0a/2h5F9/MYfNq
 wt3ENnrtyMWwYWbxfaNllpE3UR1AGm5/I5ihXN6Uu03K+sdsQyNoN6HvsiOlMQQq9EdO7UKZ93E
 8vac5LulJ2I3msL7xbPYFCvEqbgLrZWMqi4yqVq9rauF8N08e3AtuojT6Uvj7CsPGb6Dgw97xOt
 CCQB10oBAMG0tBp33ssQCkJqE7llV6x/O7kPrREzFMCbHEISO0QRFWJ8nwiU/52Jd/Hwi0B18ue
 rkZNVz3THFI33pSb9S1nUX5Q4BNAmj78uRl0SHjBj3OC5eqnOKne6ZAlEr4mrKOlqViV5JIFylF
 ZMK/5fco4W0z7kw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5ppGqQgwFkVWL5eNFDmAHSRJcC5UmZk9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfXxBKHCNMPsRGZ
 sdGdQxZTw5ZSSMsnadZod4qTHRmIDT0oI3yJKZS69yuxZbLCfelxBNkmIMSFoscKhncQmYjGb/J
 6jSMyt1GVEcu895HrBpCxotamwIfSKk=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab29850 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=NOSK86ayaCRT3GQFxdkA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 5ppGqQgwFkVWL5eNFDmAHSRJcC5UmZk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX3kLdJF4qzaUJ
 B7fLUBHXy2qXDEEZI1gkslNOlNXhUfbwKavGiapa6OoE3WTsGprt/CGSm1zgejG3GYfNxj4l1w3
 5Jx2HF7Gx70YOnFl2C6dnJo+DhtXovIkIdLgWArMxN28He5xY6KFi5X4hx3ouFpwEffQdHjE1M4
 P7+KgtjFK3N44GPxhbhbXi2mxAk8TEfVG5Dfkru4iiILK6VxF0NwbI2K8LBO3rcNjA4g0u7E5TN
 LRvl+xpFi+hn8WUwcNAbiFWPqRAwEKNpNE2lPOUrWHWGLqDIgVIZMA/RxDvsX5Ijmug5ydo5Nfu
 H5plRddCthhl7UeXrevNg9p6YvKquDIvsqZ3Fd1sR8bTLOOCAxy+Eubj5bhdMYLB+GLqMayyU3M
 YHod7cRarvfpIazY5+ssErob3624YzEhAaxAmEMs0RS0GnFU1JDF6X4v9WglH8cpCd9mEBmXM6W
 uGTt4DlCThCEGkJNi2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220219

Add the platform resources for the three USB controllers on the embedded
Nord variant: clocks, resets, power domains and interconnect paths.

Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
into negcc, which so far carried placeholder zeros in their place.

The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
out of reset with the rest of the USB20 tile, driven by the controller.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 311 +++++++++++++++++++++++++++-
 1 file changed, 309 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index c7ac2e66632e57852f6dd88d8070d5c28cf70d2f..e7ff8c420300f34a2ad4063ecad8a31f08b8d80b 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -842,6 +843,161 @@ hpass_ag_noc: interconnect@5fc0000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	usb_2_hsphy: phy@88e0000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088e0000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
+		clock-names = "ref";
+
+		/*
+		 * The SoC has three eUSB2 PHYs but only two QUSB2PHY block
+		 * resets, which belong to instances 0 and 1 (usb_0 and usb_1).
+		 * This PHY, instance 2, has none of its own: it is taken out of
+		 * reset together with the rest of the USB20 tile by
+		 * NE_GCC_USB20_PRIM_BCR, which the controller owns and pulses
+		 * before touching any register. So no 'resets' here - both
+		 * consumers would need that single reset exclusively.
+		 */
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_0_qmpphy: phy@88e1000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e1000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_PRIM_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_0_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_PIPE_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe";
+
+		power-domains = <&negcc NE_GCC_USB3_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_PRIM_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_PRIM_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_0_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_0_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_0_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_1_qmpphy: phy@88e4000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e4000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_SEC_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_1_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_PIPE_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe";
+
+		power-domains = <&negcc NE_GCC_USB3_SEC_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_SEC_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_SEC_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_1_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_1_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_0_hsphy: phy@88ea000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088ea000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_0_CLKREF_EN>;
+		clock-names = "ref";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_PRIM_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_1_hsphy: phy@88eb000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088eb000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_1_CLKREF_EN>;
+		clock-names = "ref";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_SEC_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
 	negcc: clock-controller@8900000 {
 		compatible = "qcom,nord-negcc";
 		reg = <0x0 0x08900000 0x0 0xf4200>;
@@ -850,8 +1006,8 @@ negcc: clock-controller@8900000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>;
+			 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+			 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
@@ -1881,3 +2037,154 @@ opp-403000000 {
 		};
 	};
 };
+
+&usb_0 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_0_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_0_hsphy>,
+	       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_0_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_0_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_1 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_1_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_SEC_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_SEC_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_SEC_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_1_hsphy>,
+	       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_1_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_1_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_2 {
+	clocks = <&negcc NE_GCC_CNOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB20_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <120000000>;
+
+	power-domains = <&negcc NE_GCC_USB20_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB20_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_2_hsphy>;
+	phy-names = "usb2-phy";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+		};
+	};
+};

-- 
2.47.3

