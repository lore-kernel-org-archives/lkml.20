Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595883;
	b=Fk/zJINem0lMQ0Ftg1iAQqP01Bz7pKeRmOwxRA9ATN8PIRLyUJACNtavnF+ll6nY4kP9
	 XNTSOaJUN4GTXAcP33NTXHJors5+0JzysO76IgHd14vTjw6See4b48FzEHYEY8UJNPMj4
	 t6aVMOHDqwN00NjWgHzGSNxDUoIVeHuJLc8RiTLLkL6/h5seId3f+ZQFuuEMdFc8LYQR4
	 SSLFmauiR8p/RuIESysZW7WKGtsXqSfa1G1nhQHVTPqE2Ig2fs0HtM0E2Uqzba54v5lkC
	 ex5SnDvvcxDSLBebwLZcio32Q8aAYmnKKc2sbbq55eBl1RdnC2OsIAVeTgCAHXjTVsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
	b=npe6H4b822os5AfnL4bZ7GtiJPXvCU3TNHsTJa8j0617ty/LT7vjFyYoiE6ojfUZ4tVF
	 +IuPR7C5vqjl/lZdDL/aFH0kG4xS2Tb+2zN2UzaSbifBeIYr9kZiiJlBX+mqfqpDr4jEt
	 NxlPwGUopVypORgxFHG8ePpG1/mJDlnA9v4lDTz8UfEW8qZY0kyucKxDUTI3GuiNqZEet
	 rqFWXPzR6+T3T27dciiU2bS+MdAT2qDz7uLdeuEEM929amLugNrSEy7FiIKl/do6v/qwF
	 RD0TNtrN75XRk/lscqNCO3wWrhStdV1V70/ZQN7Uul7Ylla8L+nPU0Oviq7BO2181jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O/M3bgE4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CVq3rnNM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D2606A331
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5D2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O/M3bgE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CVq3rnNM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEQ44U848470
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=; b=O/M3bgE47wpEgGvI
	b0k8gpmn4QLzEYy6YxCiUpGQz1ISMbSDy4sDGC9LWywIOHbvqSXqjw7N0XiobhTg
	P8zT1eb40VB6q0EJdjoVbRhQA0LC6WSlBzoNVb0b2pQienaNB+p9lNl++7I/i+9P
	62b5/vrS6SBGJybeyZ1P0+LGqxfzOrGsorpIP9lfZs0S1+z8+PIOcasEJVY6OT22
	F0WhUcMQEble0QQKA7u5pmvmVhn2vDzS/1Seg2C/+1gLe9DXGFV96a4NlKVQNxPr
	YxIqhddav16qZhXleYBjClaQ8S8zz+Ezgm4IZhBVKlUjCXzVClEa4j/g4l3HwlS5
	OJD/RQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3qqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36803927a49so1223295eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595879; x=1793200679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
        b=CVq3rnNMzNMVFYcN5zsqfNr885urTnbBxL2sTvfyYTa5X5vmv6YPLUUYuwuTBF8nme
         zOuvlhTUmyfaK4aKS3S89xeUDVgcGgvBcB9wzf18+Ng4vR6aMehoVfSNpzhOHBjPyCCR
         wy60RE+QfPVMjqY5fHJbsu4IJJTe0dmU5qZKd1CPdRsxwCH52akVwfL+O5KGs1kY6R+Y
         L5xK72obvxHdfy6/rUzj0jpq8oPf/rS0QPnlH6FfLsIZqn2kGOIEg/fidgsxmtvPB2Ti
         IeNQsbwFlBA+ZaID/FcJrh+4+n6h0YpnVF81i4vhlYu60J7p0d9+NyaXQ59uTHVgJK/E
         qxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595879; x=1793200679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
        b=I7HJWshXLv3WxIOYmJGC5j526ENfgol79ryGZcwnLoo0IQLMhUHcVRh/hgXBjh/Z5s
         ACtfvuwVd649Dd6qjdaS3WhaAUqrUJZ8IGWbddCgtpX5EYXM5OmWjrh7jB/LDq0xYEII
         sQsU5Acq+Xl2njDSMv63vPZRTEWEF4hMChFMF7MfawYb0RYqa0RTJczen6d3Do8qnveL
         dW3zH2UVRmgKTyzLhnGChPsfSbwZ9hrou+oPi/03VALhN62YPYI4z9c/CWcHnlZLiicH
         pYfniyb4T+yf2pswvdvP8Z3nwKrY6HW9+Yg/KUHvE56V4N1sIYP0A0MWbSweSW0t0G6G
         G6uw==
X-Forwarded-Encrypted: i=1; AKwUvBxIOST2cjHaAweWI407DvgSfeDw2YHVCLOdu8KWqYnRI/nWC0voyYUHI9pRcXK3Q4cw1fFvwwS7+hFPmjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcOqGBcZnOoILm+/cLxSrUB3w203bnGbEzbV7RDvqnXya9adrO
	g7dr5WHZtBOfF1ciY1FRkrOP5LyFvYbxTUjYnHQHFG9BBZxVLfAfPl5X0Qo0olOrqsXDfShNwrl
	etNO2ssrOsvpD1UXoUYZ0q7BMWuvJ+d+4Kon9xOwezlzngbijlHkQo9EBcPO77Y1uHavFQSQD07
	o=
X-Gm-Gg: AYBFou3/pXavTsNuaJ5T5wK/ypxHCIJKdRbYmLo6Xwfz+3B3oYbMEnShMXKctYLV4ui
	21KPEdCDhpianKxS9giIQi0Cpdvn9CIRt8LB2pn34MNAzzy6RKDm5mabE+6vBdXDbEejNQB3VjH
	0itTLGG0n9dm+2pdaQMExXn5nc3JO8ekR9saSe6d3ghR+Ezs09CdSdWhYJ2JRwjEtTmjDSPSY//
	rc+oK9D7jaeJhMp41Nro9vnjKI1pKsDcVzWY2WvlXLpU2VaGn4cvCkJR1ah+8AWqe/f+gcO/Q14
	unO4uqLSQ3BIos6YRyNOV91Txr0jHlbgbd1hQ482JEXa+D8/Qgow2d7+51GAT8tsdv/EaL7WdYv
	9iImx7Kz7JR4Tblc1d0jxIjnRuQ8xYFdM
X-Received: by 2002:a05:7300:2552:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-3674f215a14mr3926438eec.23.1792595879210;
        Wed, 21 Oct 2026 08:17:59 -0700 (PDT)
X-Received: by 2002:a05:7300:2552:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-3674f215a14mr3926392eec.23.1792595878378;
        Wed, 21 Oct 2026 08:17:58 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:58 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:28 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch
 DSI panel overlay
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
Message-Id: <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3546;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=Uyeo1BIG7EK9froOsnvpJ61uq9tkb4cEvrpBTfRl3vg=;
 b=ltnv/UqKW7UUOPAU4GsTjxkHxne/i9paXx5gRdSfiIe92c3PzYA3HytEtQwgiY/dUBC8it1SN
 I+mzUGh+3+tCDraiCHf1epXL2mLfZOMmi4kbMHFL2cXGgWEdf9b67qy
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8d7a9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: RDVPlsYM2M8ceQIV6xALkupPOS-FCoZ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXx5xhJnRZfOUC
 IWrhxD9d6TwHb/iZ9S0tX/SkINieWHRXw56awiB1+sIzmUUx+fuBctVq0H+hHdbYx1h+AEi+DwU
 VC1IUzyK40mMgJhL7kGBLTVsimvfNXvIpobtrsN3UMUiGiIfLywG3f6uJM38iaY0vtVwOz7aMgh
 OcF4TdAHcohkgeCxxEBsuZ9N65Ls31p8WMvp4Akbt5RmlKDIFpP52ah3h4n22GOXwGmO+M6JR8M
 7en7PtfArds0OO/jGrQqEqZW+DreUYVj0t6KZUl0tzTnt6FIVJL1mUJbUIFBPD/aqLtMvOD1GW2
 SLYw4o9hurQ9zNeSAmiA61aNCQJ8HsT6Sui2ma5n9dEd1+u1ASMbrXxLl5DY0TRbltLwLLko3kY
 BwgOv3vNIYT4hZwuuevpNz1ZYB8a1Z3RerePDzAMKw8FSzxR5IcRt9WMfBlSMNEquIcLw/gHbEz
 rVkyW1ugPgvthSC6aww==
X-Proofpoint-GUID: RDVPlsYM2M8ceQIV6xALkupPOS-FCoZ1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX+gfEZZXwDaLk
 EK3rdhGtMc2gvGLaZ64kMwF3MFVT5QSq+EoA3ZFvhen1R5i6FP0Tal1TWjJtN8XbBX3z3udGNeJ
 bkdCz2WeFuQCl+10F3I98cqR/CSwgJI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON, for enabling this 22pin connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a2a2ffbbce3a..614152913cbb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -485,6 +485,11 @@ talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
         talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+
+talos-lyra-evk-waveshare-dsi-8inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..e9a8fdf0c179
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+};

-- 
2.55.0

