Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCBD41BA72
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198927; cv=none; b=ZlOe316NOfz5yqFBmW35epgaPQPFYsgnAhq2mqjdIOZCj3y/fq3j+O1NA0LBQcEg8R3LhedfDjAh2xdhWY1QQsobXeGbuVI0D2tG1MtthfHPrO1Kx8hZLgu1ZdjDmSJhzdtQbKbepvL4MTFaqqgdaDel/fFQxqHHKcsiKdAiVUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198927; c=relaxed/simple;
	bh=iQptdSxIZbd6XD+am5BwvFFoB8o0BWFfJTajvQKVbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIvukZ0ziLFLcrstMi2dc8pGj5c8m9jO27VTLBYkND5pqkDVsNloHe3mhPDgx2cDNdgVpRlb1vBHICBjhX9zaapvAVkxkgxR3ePdI1KXP8Hq34VI4Zn1DZexxFdV8x1uyLNG08YVtUJXLOOYl3KhN6OuD8tf9VE+sCW+ONje+LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfWWb6kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TORV+hLh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfWWb6kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TORV+hLh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AocnH1541858
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 11:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5zpWD3mnv7WU7hMgVBLR/dKIG8Et/paIfsLnXHJhkU=; b=LfWWb6kSDgH44Jbh
	d0xVrKflfiSPFoHkHXnL82awvAmjwEcZTYBTD7Qsy0G+RiFD6j5lcTv750NKMw0b
	ZV0YeDZqICmUFeqjd/LT1hxU0gmN/p+6SjtnVEM+LAgJqoc0KJJn2doqSHoEWOkn
	4v5qmWu8YBlq+Q41aiPC2pU5BOrVl0ph18JqLLzV9ZjqwFqz06e+xPPkUGIpD653
	Ob3opncIFrJOAXdwvI1vh2odYmJl7WuWn7mRxWpZLvgKazDu0OXiKUtfTEWBAPh7
	RTQD2y2jRHHVM1lvBIwP9isjILUbEdWwTHZqUili/u6fHxWGeRBdfGb2iED8FJlg
	MG0uAg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs1tke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:15:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8886b1d3242so1117922b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198923; x=1791803723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5zpWD3mnv7WU7hMgVBLR/dKIG8Et/paIfsLnXHJhkU=;
        b=TORV+hLh8d8PGRWx/romIdumAK9WF/XdAm8bNQm2m4OwNSxKAFFH6bXq7XLWs8OLmw
         4ukhxbV/1fj+QRiRP2xBZGJXDWNpx68q5ujuuAmr0YzvkOzRhk/5TN+1Bxf4h67tCBm3
         hV3m9c4rNeqdgvgUAe66tVOLuVVwD66GvLxSfZTg6iBZCEv5MZhr9sYwxzxzkHTwzDSb
         F0yFP5O5XUChvw4n3KHSgpJddMfW6PdoGO9tqTwkmFiqH9tV7JaVhggx5CPNmRYN2mJg
         2vpxwbhilj3NU80VgAlMhaF4OJoLPuutAToO7r6Xt5yjPGXEF8L9pgUiZ69EP6GF1UNO
         NRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198923; x=1791803723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5zpWD3mnv7WU7hMgVBLR/dKIG8Et/paIfsLnXHJhkU=;
        b=NVKwq1MzmXgiE7IRptuEKv5LQQXDwmiiXP6Xcn60jvY2Nt7XjpDzYq1IZ9uo7zgneN
         iWalBcYS9LEXptCFUq1aIraOswvWZDAj+9aKvTgfR6jsmECgPV9HaWyhq/nPiyBff+/I
         3gjxS4PZTpSokVdN8N1gLcUPnfBP5DkSw0FDV3VpQQ+BrpRO3ypirxWjnnGqEKva5GWP
         bcxcKOji5lN2tvSagHYmHaUD4hgd6/4tyvdikbrvPpaMTjU2QkN88ciw6XyHG5/f0qPV
         uAvaYYXNOLfokEhtIGbIv+yUjRuN+6xUJwdmGBRu6M1+Rrs14S/evhOLLZe+SXH2j5c2
         o4AQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4q6UTgbU+ReS9IFDfrizXa9RbxYuboombdUbAzCpdRBIZDjPT1EwdbsVgAPXFEAe6PEslAjgIwEajOL4=@vger.kernel.org
X-Gm-Message-State: AFuF++k3mYtb96wMhN8vL5m2k/XnogY6xopj9vsanfp5pSQx2orUE0Nu
	k0h+O8CxdM0HcT7u16dzmyAb1ZQGp3BJs07DNaG7338s5FWz7f7O60L/eE+4zkdIaq57mH2i2ar
	cBao7sO5FmfNnddK7nOdu8v4tMOzSRolKZ1MSfQADzm8+TwczvC45stSIEhWGxXcA5Ow=
X-Gm-Gg: AYBFou2ADMEQPhNLrTR9vpwO9IQ8BViZmNT8OUHdIjHLXRq0HcqBk4yfd5nrwV1drxC
	MT00rL3Gn7c/lFGm5WgVaJBvaueTDMqg4bp7H6WLOZj2lhHAhHS46BVKQ1S/cBzNFVYIAP5iLpT
	N+hJpusPFYtF69miWvjFSFZKzAimPG+npqMBBjEIEa37iBNYZqb3X/TCu203TNzFZZYVyORzmv2
	MezcBGKw9KYnf27cG3s0mRM439lBa3HEzEgB7dFIe6B09Vz51n1goC1298JM827Qp52DO4pXG+f
	OzGWQHfef7D6zmBIIURFViI6QgKC51EjJ7+uxCIsEbe2Q9RDJzytidGX+gOQT/09vozjjUSu/Vq
	OK8qBZMAuXcrppQ==
X-Received: by 2002:a05:6a00:816:b0:885:2a6b:1c46 with SMTP id d2e1a72fcca58-88af2689661mr10121581b3a.8.1791198923303;
        Mon, 05 Oct 2026 04:15:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:816:b0:885:2a6b:1c46 with SMTP id d2e1a72fcca58-88af2689661mr10121537b3a.8.1791198922775;
        Mon, 05 Oct 2026 04:15:22 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c59e3afsm3249852b3a.33.2026.10.05.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:15:22 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:44:46 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-shikra-el2-v3-2-618f7343695c@oss.qualcomm.com>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
In-Reply-To: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791198906; l=2800;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=iQptdSxIZbd6XD+am5BwvFFoB8o0BWFfJTajvQKVbRg=;
 b=YPUoiHynD+erhLO/09Ji5++tV2ctGKv9cC8wtdDWrfaFo9zK7Gqpleup7dSXecBB18xuhDAmn
 LgzK/jM9eIMCthYYb4vekTFsUfG7pEqqQLYF3dQ10EYhRMoKfKshBpg
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: ntjDKjmNRyjNGu2OHd94CZslNfl3Rs8I
X-Proofpoint-GUID: ntjDKjmNRyjNGu2OHd94CZslNfl3Rs8I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX6+/Zr3lO/1of
 hhg5gtnwCuG182UdYpV3u3Y0xwiQwJK0vP+JHIBfqjE2YfUtkYrsmJHL6jxzi1p5coCgh6HTzUw
 B3ccvVgUWLaym1EeZ4I7nFWqZoXpFY4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX++Na3cdTYqzW
 tKcOoJzGhd1HmMb9jyl0h5Z7yJi8mVnBhYeDz+P2GB4gyolRV+omilxgwYKiBx3ErfFTfAFBJcz
 6RA8ZQeVi9Sq2URLEIlm1Iw3ZAH0UKMiTx10CTZEeikSScU7eeVAq2KyZHpKvSzHJeRdNCoKNt6
 Mw2+9LIOLHHbUlwvfb6L/MmYS8Lwphi0Ze87QNsAR0UUjpvNFLZM8pYahvDbKvWVPUxSee69Gy2
 4UHabhsgwnuCCpKJME+j+hfTsEaAt6x8uKpXfGt789p8BKjn+QspQQ+cu+MudYIkEJVxjxhgql+
 gviYTo2jmRrSWhY5XFuI+uGDWB/ITtj+mxga8xyhFKrFylkh7oTmIXsq9Gr+7w6qlHZX3BBQtwQ
 BLCoEJmsydvoyKfOBHSoGAXj5x8R8fKMZZhwHgDuJytjZpY6xGh17fVo6DlhHe0NDLqXL785ZTN
 lvt3ce+8HzIXNRIBldg==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac386cc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ieEIU8YVhEgz5sbSP_EA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

Shikra boards currently boot Linux under a hypervisor, where the
remote processor firmware IOMMU streams are managed by the hypervisor.
When booting Linux directly at EL2 without the hypervisor, the IOMMU
is instead managed by the consumer of this DeviceTree, so the firmware
streams for each remote processor need to be described explicitly.

Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
devices to produce an -el2.dtb alongside the "normal" dtb.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..296c53b82687 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -373,9 +373,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..d2f3186bd47d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};

-- 
2.34.1

