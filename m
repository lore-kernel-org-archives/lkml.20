Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793595509;
	b=UhzSYyLx2hacw2eo8ok0Oun3K3yatSJDk4GLr/DoEncc9x3v5SzmmFH1HGh8Wtkz2p+2
	 8UFpirzUT+Qi3dEs2vfsT39fofOzAROt2SDITx9DbibBugaRGbY/EA7R1cJ8fLQFo94Vl
	 6Et69ipBnmi+CpFzle7FpVYMj0TYzjqHGWIlFDixc7k4DWVHdjGOEiUiIx6UVTYn/9kpy
	 g8kphFD9mc6DypgpN8TizuCn9h0Ozvk8h5WmRHMwgfSd512YRLP9J0PTWF06clI/ygCR6
	 rd+Od0Uhy6ZbgLKpe4JFtp7BSk8Gh4stGmSozdzCFcodWXrMjm81rd/JXdNqkqW6WFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s/p0jvuTaezOW7e3Dk7zhXOySIz2zUW5mJL/UjH77G0=;
	b=kO5ndW3WQ1FTb3FZqOruez4e/pAt5Llwxjcu95JYFUmVASisF2SwP3QKM6KAYnAB4k+p
	 Vaz64Oo5sokE+z5r7DDu+HZ2HlGrheERolB8oOGPnPfY8WUez/RPIRLi0SCWT26TE94zH
	 zoFlbHLJpnTa+Dadlej7V7S11i808Ff1tNzUmL23obTA7Qqi0YM/iHMhzc8u3xEzv8gyV
	 iLZBChiXodfLuN8vJ1y8G7qwIJ8Lfn37ecMpyvFN57sk0NERUlJhC3+7FvvPaU9qGHOEk
	 hlAKLVQralpF7w+5nF+A6dK4wtzDVqPUJDe8/EsCJn/ycYzE35+qMmm5iAPV0HewcYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BOo4WRQW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOGwTjya;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921EF606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921EF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BOo4WRQW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOGwTjya
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vU2w2192510
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 04:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s/p0jvuTaez
	OW7e3Dk7zhXOySIz2zUW5mJL/UjH77G0=; b=BOo4WRQWfSrs8FYBpl9355bC5LI
	kVFU6oylz32S1Sd4o42A9GNohtWD3tb+1riksiUKA8C03sh+ZTrpxZi3wbvKWm7W
	stNTE2VrKLUT0QUvn1y9KVHJX2u2WThLM5yKQo9/OaGITe6uIA29m7zMgygCh+ZG
	iQYbRztbSPutL7bTQHoRPZKmCcG57Te892+7UjXBCQvgXaiRlQ9hRIkHa4qt4zvR
	8GMvrFfljTszded44b+jn5EWAJ1n3+XZbg59ZmzLLetMnq+ECqc1BiWDV/S834Ux
	Mq6T9r3Up7gXt0xeXajcb8E/kKnKZwlLj095dxeBtU7WgGmRz0ZCM+z970Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93en1wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:58:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd65711d12aso90958a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793595507; x=1794200307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/p0jvuTaezOW7e3Dk7zhXOySIz2zUW5mJL/UjH77G0=;
        b=hOGwTjya4zhLzgAUOEJpfLl6txQwVmj/P6lyJF6kNVjhV6PZQXADxZ16xvgdFw2msJ
         Uzjszy5JVgwo0vxBxkMn0nONKMLTaccc4z45WTVq+61IkFSHnNgqLVuWSVeTgZrmo8qY
         CTOz+ZFMBYebamFNMaCiBJkdYnb0hxIGa96QeQBPWk9KDByANchyCAANb6VxXmA0DEnP
         1dQl5CHmPsKBtPG16m7T1SZX6bbr7Z4bxnZ60u8zLkIGNiATXjOgu+Prk9mH/ghWHL1C
         R0gGyJehwlscbMzgp731fSTo95x1u2Ib3ootZcyr9REYZ27u0Djlj+FeMSfEwUbFEQvk
         iiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793595507; x=1794200307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/p0jvuTaezOW7e3Dk7zhXOySIz2zUW5mJL/UjH77G0=;
        b=NHqj70skZFd4vcP8L2iENleDaci5hp4AQ04TXSj1jxgHmaJOh9robcfyd+3Wf1qLDD
         7CRAvpmtfi1fw9oab+tY5ImfXQ4E4Xf/jL3X+3T6xRk8FVYC3+KnWceWohGZLAhXIhhQ
         vOjDatwP0/hup0bJ9o2vmSfST5YuB/02fw4Sd+Xal+F+l3aazewZgyOcoQOrRKhYzs4J
         XUDyNt0Uol5yJu3YlHZm1eNZtJo4r8Em2S1FudG0if/XRIKM3Qk3JKwv4wgVS7T08yFE
         CtREZKaSRkb9HgY15TK3wlMQmshTcgWBG/ssACjXkRdo0/9vwGvjzExKqxggTd3Sn/8v
         6Zkg==
X-Forwarded-Encrypted: i=1; AKwUvBxig7lODczhcM62F/7ftT6ngoCwNXVqAe3Cuwi80ahVltJeb5moD2/aL29HGOYp2bUfslY6TVGah+SzlM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ikBnZpgXdXRgoWkRYnywLDzI9PGjiEuAM7T/zx8Mpg31yZNih
	kBgpnBdnut/u5fYj2iWQH7wIFE5LCcoviiXmqbAVNHtkomTuflv9dlg85IbicVhR7u5F+FRQx6B
	OzFkV7NEgX3MGMVD64LHDnyvhpt6uHo32vaKeON+jbj1LLMDw6TJzmnSl1CWSIJOphlw=
X-Gm-Gg: AYBFou0X1PPTCfiv/9woUQnfY/lJvqhYgNyHo3GtdpWe94i/JXDbQc9nrgT756BYTbD
	uS3FQ7GTW9fAFXH0Aj1QPqrB6P7yolvAyS+vWNJYgprkuIs1QWhi/lhi3A0+jShemkHLWHRXtc/
	8z2kJIsF6dPjcyMdmBNA0Y+MdN9BJZ6KewNHoocz8Ta9NHyrLD9Rd4h26xUDr9758pEsWgLNNPO
	wjX/NAmUu6tr+YT7WkX3Kr64hfZFQa1TQZIDMByb2lihN78RRauLQhYhDtLviZuujyzEWdQGZo7
	Zf67HjkX/iv88mTsUkth2KoUcINvPl26k5jZjKIiUDF1W6tQO2ekgg6BQVeP67FFJqUdZz9S1vh
	qFM5Q9mmEEH2FmThvs70x2W1oRHMx9mtpXeTzECwMh1OIrZvRTAWAJoFizVQsvAJggWQ8oIEEkX
	9SyA==
X-Received: by 2002:a05:6a00:6d43:b0:8a0:89f2:3357 with SMTP id d2e1a72fcca58-8a9bcd04e01mr10373308b3a.2.1793595506787;
        Sun, 01 Nov 2026 20:58:26 -0800 (PST)
X-Received: by 2002:a05:6a00:6d43:b0:8a0:89f2:3357 with SMTP id d2e1a72fcca58-8a9bcd04e01mr10373290b3a.2.1793595506214;
        Sun, 01 Nov 2026 20:58:26 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d04805sm1485452b3a.32.2026.11.01.20.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:58:25 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Mon,  2 Nov 2026 12:58:15 +0800
Message-ID: <20261102045815.2938940-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxOSBTYWx0ZWRfX94wR3W0AGa93
 M27NwEZaJmoCxGtk3eZc7CoPxR5qXeRW3lu0sN7HCDe6eo6OLH9e36geK2/eRqO2jJ7BSCQpYOz
 EFfWlejKaEwBwJ3o6L9zGKPwTRQYGPkjrv9aegKDHMof+mHwzU3t6bWDK/9XqWOuWggieFCB722
 xyNJTbJmhhl7kd7OIcH2LE4PnIyqd+hc2AEkoUImOEHMtOVCfa3JJx1255fIqHtsLOKWUfGsqqG
 XXH2tml6wJmtobnAKlNWVtzTcTnoCu/gptiYoIUh8jWp1a0Qa3aOEOzdxcwWs4/y4bMmqP33/FB
 bDAQF+IZ9aWYmF3MsaYKfVbqpl8UREvn2zq2XvuWqVidhy9em5qZT21nMHgsvwahh80kM577vzA
 Kejdzey0EwrCoSJY2dPcXf6gIL1P22Zn6eYFgFNYUzaLz0aw37vRUcN8oDZLdDy+RPYBtaTioDB
 /G0etxsHzShDy+dBS+w==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae81873 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=K6LXAmJzQkywega_7-cA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: pqf5i5hl-lXnsmPR36B2fm5-jL9Eyc-M
X-Proofpoint-GUID: pqf5i5hl-lXnsmPR36B2fm5-jL9Eyc-M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxOSBTYWx0ZWRfXxxbentOE2+N6
 KZYyvH10w9cbRrG0X0+UnSV92eVcDqz9agYEG0qRJtFNQlibdZzG0cgWCWw4rHy1WUitdlkceBy
 OIiuQq2c3SwTQdsYjuvLAXnQw3QSJZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020019

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
Shikra IQS EVK.

The Shikra product design supports either the onboard Apache WCN3988 path
or the M.2 HSP Cologne path at a time; the two connectivity paths are not
intended to operate simultaneously. The overlay describes the board after
hardware rework selects the M.2 path. Disable the inherited onboard Wi-Fi
and Bluetooth nodes when this overlay is selected.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal.

The Wi-Fi PCIe path was tested with a QCC2072 module. The overlay was
applied, the link trained at Gen2 x1, the endpoint enumerated, and ath12k
started MHI. The Bluetooth UART and HCI path was also tested and the
QCC2072 controller initialized successfully.

Link: https://lore.kernel.org/r/20261020020925.3915548-1.linghui.wu@oss.qualcomm.com
Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
Changes in v2:
- Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.

Changes in v3:
- Drop the unused reg override from the disabled TC9563 node.

Changes in v4:
- Build a composite DTB to validate that the overlay applies to the base DTB.
- Add a label to the WCN3988 PMU and reference it from the overlay.
- Explain that the product design does not operate the onboard and M.2
  connectivity paths simultaneously.
- Update the validation status after testing Bluetooth UART and HCI.
- Restore the TC9563 reg override after runtime testing showed that the stale
  OF node otherwise matches the directly connected QCC2072 endpoint.

 arch/arm64/boot/dts/qcom/Makefile                 |   3 +
 .../boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso  | 106 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts       |   2 +-
 3 files changed, 110 insertions(+), 1 deletion(-)
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 71f9822ad942f3854f4ccaba9cad484298c994aa..c61bf4577d0e67a12e17f7537a0b4dc91c8e5150 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -427,11 +427,14 @@ shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 shikra-iqs-evk-lvds-auo,g133han01-dtbs  := shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
+shikra-iqs-evk-m2-wifi-bt-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-m2-wifi-bt.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..7d65e67bfcc2b05259e01e658d007274cc4f13c4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	m2_keye_3p3: regulator-m2-keye-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3_KEYE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+
+		vpcie3v3-supply = <&m2_keye_3p3>;
+		w-disable1-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 60 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie_port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart8_ep>;
+				};
+			};
+		};
+	};
+};
+
+&wcn3988_pmu {
+	status = "disabled";
+};
+
+&i2c3 {
+	qps_gpio_expander: gpio@3c {
+		compatible = "nxp,pca9534";
+		reg = <0x3c>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&pcie {
+	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
+	vddpe-3v3-supply = <&m2_keye_3p3>;
+};
+
+&pcie_port0 {
+	compatible = "pciclass,0604";
+	reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&tc9563 {
+	reg = <0x1ff00 0x0 0x0 0x0 0x0>;
+	status = "disabled";
+};
+
+&uart8 {
+	bluetooth {
+		status = "disabled";
+	};
+
+	port {
+		uart8_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&wifi {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index e4058a58d05f3d7bf2f69ab945ce5eb6d6635320..779247b7f80af61a394d0dbdec23411ce5d5cb04 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -164,7 +164,7 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-always-on;
 	};
 
-	wcn3988-pmu {
+	wcn3988_pmu: wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
 		pinctrl-0 = <&sw_ctrl_default>;
-- 
2.43.0
