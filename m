Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548067;
	b=ZVp92M2K0S/5QtOENk3NZNTzfGk1OUdox1BmJZwBuKjPXZF6lckXeuRmtleEPYFaNVWL
	 dUYiWj3TvzIraDbJxv7b9NLyW0VwbBraGNy3Gd+gq0j/NyF4+UFVSVZwxBbjbZEq+OxON
	 PhDshzCsnMT9x7e8oRpUOImz4PKH3mDmp2kLNRAQsE6N16W/Xoi64+0xOXbLihQpQ8wUz
	 UQbs6NOBBuTckHWg1EEp3t3ljOE//jsXFm0RaE5byRZIGNkhkgdjTUslLzMQHdWbCGCvG
	 U7HXkaUAf0MSOrh9tbqmmQT2iO+WHDiPjBp5RCtzgLV698cI9VYpQN2hLEcdAesvKbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=;
	b=g4Ggd5P5W8l92sSDCC4XSPXqKYHSlb1W9wEZY4Qo67u+p5PM3JWoBKos2K7220sMaTIE
	 8MlQultMemtEC1IriI5uge33jf5uvEcD1k9+IAe0Ax+wMN/9FdVVnAI8mKeqKIP8Fnm5d
	 /4OdJpmcw2pSV0nAcxp8yKpI6PCtHxScrIAQ1OpsC+9oMOlik8vsc3LWiI0496OFqmxr2
	 ExyGZkd5xtTMilNe9TzgGNduACmH+B2Qrmk7kxbKODBpF9w/lG2FEur2UMCpfV6pZx+O/
	 84rM6H+ZyfZ6Rx1kpvF2jfd+Mxzi05s22ODJBIvW/VqSWwwkFP7RXSS5UcwmJ6RXt2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kuqi/G3N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VkCpS6+g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF2D606B286
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF2D606B286
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuqi/G3N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VkCpS6+g
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576gb073405
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=; b=kuqi/G3Nvv+JxC2i
	TQcv752qreQ5+hjhHq5NAl4upMPDCb4T0eCLk2SI0rN2UKi2yFM3mNe4OcUi7Cv1
	hAyj0/ttaQxurAvaii+8e3VL+0SwR01Ayxw+07inhuV81HFJlS3/5nKgkHxQIHjG
	Y9clAcvk+pl3Q/e2HdUIPtEwpcqwe8nESL2ceuDmHFbhKzO5NdgtEB0UrUN3hhjJ
	I4k4rIP5GbMevVb/YIfiAm/yG0eurQZrYpKEViIiM2JdHXNKRGtZXvWqogc4cb8s
	216v6UHZz2CeKzGnkoJv7gR3wGnjhrZ1BWEVT5x1V1D8ALApbgFV85hiSub4INPj
	bRf1lw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs03mgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:25 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4574f1cac98so927067fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548065; x=1795152865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=;
        b=VkCpS6+gzBeLqKdhE5eyx/ObjVQojLMpZ/0uUIWC9VjnPmmhi/MLQMCneZ7SqmaMFu
         F6atVK7nXyQHPLX2lOPHFzwsiSiQxNVePkwxQDZqbs63xpG6d3GJ5vp5i+as7RZMaOu/
         ccFvX1qSXWYCwC12ao+j63XWPZCp3HB4FiHiNzNWqYoQkJHkSSHpMM6e/CgdOrgiVtFy
         Mvz8N/NBDL1qp/0Knm00AdzvzHk+Zh2ShlgkTXsHvu8G0mEMFfhGTMpRA0AkJsZsshRA
         cFHMP8HIqLDwWwVbC4JbxALWM4D+2yv7Qxy8ko3wvm+2i3dmJLMrsWESlNbDCsgZGhGf
         0+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548065; x=1795152865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BLrYl5h4yMVFXBJ+rSB6i8v9tN+ezJoVhrSaE+41aI=;
        b=0v0QqXefEMd04XrZ3vDsMApVDj7fafH43DB7wxuErLA7h2D3//CqgxkXJtAOzirI4L
         2f/cUFFLGBMmHNlpf9EiWbfzyraqrVGhBp1IVckIdcB9ry6389/sRp/3zVxEbULkkfKT
         fxXClC77aqIPjAGUnIJUdYAuyAAgAu1H8QhcxXc6qujipqGg/AXqOb4TWULqYrb48auP
         6bXK3tYbhZvwgG3atLfwbMiRyf6vu1l+6np4Z13iCJjuzp1EdqzEcVMg3RemBu7p4tyh
         jMMfNHbvkccpKxBTSpOY7/9femhAYCaO5/1CUBKoZUM8B9oxAMIups+eHOANtl7+pB/q
         o6Qg==
X-Forwarded-Encrypted: i=1; AL+hErH1WskiQuxmoxGlEt2vSb0bISFqq6tr80+ss2MN8tzsGu+afcHbE8zKR9OEWnSaF6zGSyMdz+iuuSnepgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8obfRmQe/oZyIkrq7NwAbBtOQbvUDBIC0/I9UD2Kcs6/3yLjv
	QL6j09GoI4XZrbDsq0XrqSF+hRreMbCeL5auYzY7c7CZGYzpItbaW7RA/vdlzLhoNNtpvUYYAnw
	HN2S9SSVySiuDkh7WMhd/h3aOPdCmWFRXLZ0yVfpUVgmUd/oFnULgg3Vf0lz6z/u8BQI=
X-Gm-Gg: AYBFou3AiqCAsHYdihtlZjsilAiOAAJbfjej2J6mtexxmByGw/6g632cLqRnrBzM1HZ
	eDqSjHH9Vi71hBYr43IPheCHrnLszoXhTmJvGl3vKT8UszcNpi221bUYb+zU/wdO5x7rv2jXcej
	W92M1NWKMIe5KRT6SdXS+WWVW+jcdxSIZlZA/LSRgQ6GW1e3bVXdfR96Q/r0b0XIh2ldvqUp190
	gh7V/WpirmBBvIzjOOw+l8KW4rH0UCeVJWoS0R4HQNHkJdXzl0M4sMnRAsX3VfOqY4HrMwJNnNY
	tHSzBeZrBZWFr6OuTbTpwXqIooN98Lc0mBT5n2xDody6pMzMbZSe8k5O9/3I4N6vQNpX6amEQib
	hiRkJtT0nGDTfZKnQxUQPtdFO1+oFthzRc/u1bUmmUp3b+HdjH8MHns/05mzUjjzNd/bJe4onev
	sO4zpxT4kkTwKkYNBoGE7JqrriMP4EkogXNnXVGJSy2qfKzc5nzVla87JCaDJY
X-Received: by 2002:a05:6871:c914:b0:490:f2cf:2977 with SMTP id 586e51a60fabf-4afdf77c4ffmr1844590fac.45.1794548065124;
        Thu, 12 Nov 2026 21:34:25 -0800 (PST)
X-Received: by 2002:a05:6871:c914:b0:490:f2cf:2977 with SMTP id 586e51a60fabf-4afdf77c4ffmr1844561fac.45.1794548064639;
        Thu, 12 Nov 2026 21:34:24 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:24 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:47 -0800
Subject: [PATCH v25 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
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
Message-Id: <20261112-kaanapali-camss-v25-15-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX4UqrbhBZW3MT
 oKJxfxULSF+i3/lIkmyuYJw4bAfCst+JKA8YV83gjwrKwN+Im9Vu/xbapRv0uWkPvJRqeZlb3b3
 ZTWIw4vpUAq5mIjVIAO7qh3ylMzIiNCTWbYxLJqhrmkzrXzE3valaIVFbjvSMulMwOvcrnUqoNk
 niK1dAWSm0THjTGNOl8xg8HhWjLbL6aru4UKNvKsvnBS/8w+NVfBYOxD87TrzEE+vWI+B8vUHVL
 I47PYbfok0VDImFZoVviHh6t9AuBiM6Ot71lFDQ+xYrnxi6RjkO5ZKJ1jWeYJTXNJjS7oIqt8xr
 b+k6E3spxq0k+Mw6efjMonaL8nfmCJW/Kv0rK6Ix7W2QzD0VzBDvbb0sSC+Jv4y3YhGoqvjGXUJ
 G4F5eEPzyjTB2v1vMt13JGdFc5miar9lCUaYzft+1JTKwfobUbTCI1LzODMcXc2zEhEHK63N8Jq
 Owts1Rva6J7jCfDq8Jw==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6a161 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=azXR8Rw6a_W_3m1MFLIA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX/bDRy+zZwrFg
 xNOWFowzfBXpMoFUi5rnmodWSeD18WfxXc3Ynpj/Do6POo/FAJzPHQwVpNz37g3Ug6EDeLNrv9X
 NSWh23PWjG1dzjjUqiGYLfw3gGLteV8=
X-Proofpoint-GUID: jkeC8P1mWYbNomc8iK6RccUHipQvf-lw
X-Proofpoint-ORIG-GUID: jkeC8P1mWYbNomc8iK6RccUHipQvf-lw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..2e1a4cfa2505 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -57,6 +57,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..d0e39855e0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

