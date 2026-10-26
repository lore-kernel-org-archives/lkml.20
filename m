Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995947;
	b=Qg5LsnfT10E/ZSneTnVJlM2+K2IHSXAJkPqR+TqPfY3TopN4sGlSasueW5qau4oNgyjD
	 9ilyCkQ3+7T/KcBOHNDiJ+LECf8HBZTMdY1Z33erSo0ob0Omy4PxZTuqbwmJdB/KoY2O9
	 NVzLTKWJekG9u8nmxAJGrgTbED3vHmSr8hyA/OV9KdE5kSHJi1GSI2Rune/Ifg08WAq4t
	 zDuZ7akIaLrFlg0zPFIIIyQO3cwaQpPWxG3VUMTkeTGF/29T3J6X6fgmW2E7Ju17Abt7X
	 To9QVrcNfvgamdEpYTvYI8+gymsNNVBaiIut101ZW3r57AwLlYYCzJtyK7NeZt+IGLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=;
	b=Pw1Frr0q1W9OwB9T/CZAYfXOEJ475+hAJJBG9S/VYTdid4jSz4+5JPBc78VOaG/72HtR
	 fV1WmM3yPjrpaMgiCnc5u7ZfSFzJ7lq4NBZLJOoqPqMNXR4/djM4watMpmf4lqzjuWbdm
	 YRTQ1Jh3R8vfxaVeepLlYQyXp+xwO9owzT+z+mw/1Sx27FPKRz8xVMcfGnobncwywCtnO
	 PXDSe+c57LTpe7iwkuVPYD7/fs/mNgXk1IBGW+jH0IO/NzvqOVvwngHggm3oKVaczrF3M
	 Gmrqc76ZpIK/biBRlny6IoMyDr9nekl6LIx2vNbpAa+bhs1q1kEfQvIV7gFR1t/UtEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AF2QO09t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QODEv9JY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9614606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9614606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AF2QO09t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QODEv9JY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b50k1340486
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=; b=AF2QO09tuvUM3jqZ
	pSCUqmKrO4lnRGeBAuqNE4HoMghuuf9ANxMv2q8JOwcryBTLC9Rdf8xBqaJnQuD2
	GxzGJdBANbr4UO/monIXFFvfVL5AHC24jI1aFWk3VW46rDw58JNfR0rcj+EPlXRN
	eX+D/VAva651BTctxF+S3TAoiKqqevZaHryYBOLUUf2PMNqNVG2/MT9wGVifnsu5
	bAsE/AWM9z4BFjOP+UMzwbjTUK1qAIsVCcAkxym3FK2GwsDnT9h5QPpfgYR9vkK4
	YTl0r4uPspz5zb/WFIrbwBjxUNx2BBnbNRoQv9anEe7IewLpX16fg4kor6aj+mVp
	VEMIMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9vwnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adad90c894so2986997a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995946; x=1793600746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=;
        b=QODEv9JY4TwGQsU1lqAN+2oer1EuPUiLIimkGBCdF9aK5BQhhR1QPkrCIejNemF80I
         RrVHu+7VAfI6DPHccIkc9gyQ8ED0qkophI5Z+r5bKfXvCzH4bJsfqm2TyamxLJ91Az8t
         hGcjT40Eth2R2InuRIgobIFOqri/Z93GrXva4VVqSKZuY1xEDWduRjlJIv+GXCKvRwXb
         VSHZV43olkf3+hnHk7VWE7xNRFiVxStdLkfoblkbGuCdqq4waJiJcLo9cHktifQHTsm1
         oekKZUL11mc8+WQslavq1vEiExAPdEhVpL0FD4/Ee4KNYNPLlOlaawo3bxi6XbYF9Ow5
         2M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995946; x=1793600746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=;
        b=c87ZelEGzQXqAWIOMFLN3JF7Lrov0Mtd/kicQnEW26whTIRv8e9KCUjlwHER0vLu44
         Zgob/3cUDg0AjvX/WJkSkCy11D8DIbCx3bM1ZOYTo7QjAppnb2eXjMP9LXk8GYfkF7DK
         se5X7Iof81z2xAOlGqRfvj58+nothtUzMxsFgQkd8DqeC6esGDlDFvUcJTluaT7C1nfS
         IEB2AccGeyCew3k76AmpGjiUtJycokUTF1keCPvKiFgDtT0/V0njdQt5kxLAJgQRWNdb
         SKc7mHQBEbi4XFSNw5DF6yCEFwMGoueGscXF9M7aGIywxzKqypSMcsGjaUHlorG6K8ZV
         Y+CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPlLG3HF3bbhiFSJ7mdxVTJ3HvlyafUy8D0QPht4IexjOV5NJvzPNWTUIDpw1cUOrz0TECc0oAJB/3YBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRhBXMqpYNUewxGS5f/CTr3CH2IxXfdWZekXfEHldoBKWZAId8
	sTFWSFLym+NlAJiLnQouP2hRz+cYPeMnElHviWGNdxbY72tEkxGYCt1Y8u6xDM0mxlLCo1GjsLZ
	Z7xb0ajV+81X8OeSCoGCgIJL55VT2oNOjTTotyBeutPF4So80ldTSYk1rigpK088lbuU=
X-Gm-Gg: AYBFou2rLvnrAiH5TaUOeZma13mVwZMW6OAXEtd3caBE+ZJ+BZNatzNJBof6yFiEGDk
	aiH1J6AKmc1bLf9skulHwx9XGdjFL1nQmLUlowG82Wh4gvz+lAd12QMviBBPEoMAwXilbLU0wPj
	1PDFQWAguRS+tEKMjP0m2DDVHpBZeXPDNDPsn/mrRjKbUwv+N/DJejnIQLBNNansrqzvnEGKDco
	InceKuvXrok7zdS18Q84dCAR2XXq6L4f38nLtKfsGzYo8odwzbIeE+2o2vugDGqdVZ9rslzQqDs
	Q277nRon7wmF0lS34uxTr2pG20XampkhCWtmI2YLgREfjXOxGC/yZ334p8rk3ZzrysjuyUChqLf
	r7n/cyTlxBehu2xWt4bWlo4MprLrRSoA96g==
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr48839035ad.17.1792995945650;
        Sun, 25 Oct 2026 23:25:45 -0700 (PDT)
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr48838845ad.17.1792995945230;
        Sun, 25 Oct 2026 23:25:45 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:44 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:33 +0530
Subject: [PATCH v2 23/23] arm64: dts: qcom: hawi: Add DCP support
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-23-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=5616;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=JWax6SHxXqnSdz0sR52ZG2fr/5xHogt+xoHHZShHbR4=;
 b=3phvyPAWLpPk42PFcsZstSJQNZG3MKuNnHg2gCbX6SuTSkcshSlrsuGkDS29WnsFK2MrUgree
 GAjJ2fJdmXzC8b2UQG8TZFR1oKZzbT3VTflheMwfWxfPdFCg0+kVtOU
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: MpTNnSZuulQWtXbWNCd3xPoYrYZ9TACr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX0DOhuu32uC8S
 ypb4m51xOd+moNXCA3UL7KuBejvSGtMr8tHN8ncDJ309l1BIVBf7UR5nrQdLmJqx50pDOWkdNz3
 S+bWjvEQNb4UxYa/qW+qp7XojvfKp5njLU0bcHCNoHODust8/mxrTc/UxrEZkxKoAIkroXBHFZg
 HGVKEv3+77wHrBie+kUxxZdvyGz2T0KW0roI9bG9DwOOehPNzfiHSJyvqQItWHdfLDFmMZ3Knu1
 YzE/7dkCcKF/MkatoWr08v4K3BfY2HrFYTFczgbl527FQvpdAkBwmAolK/gmuWP1rEqFiGzGnqm
 DEbxNL8NT05UVs5bwCSMkZ4uHl2rFWirSwu78/6BF8riZ8Kes5sac33SyEKqI7qlmCX7lmgaY+R
 C96D4KC5YvPoZTiFIw8piNloBlDEhhVB5VeWPF2CCCRpQ49005VNr09SUjt8ygc4lMIGX8Rqjun
 tG2CZvzGgzcbecVPH0g==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adef26a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cp69EZODLtjo7xmYzNYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: MpTNnSZuulQWtXbWNCd3xPoYrYZ9TACr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX7sJU19khoS3L
 DcpaazGKjoj28kBUOQBTe6seybMATq62yZMfAVUj65rsn/G9yYK+fGbB0A8sUn6hfnWlDi97sNk
 bWjCh8JSejQG0QieYflzOz9FhVUZd+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Hawi display hardware is owned by DCP firmware, so the platform device tree
must describe the Qualcomm transport wrapper, firmware display subsystem,
power-notify channel, IOMMU contexts, and display graph used by the MSM DRM
driver.

Describe the Qualcomm DCP transport and its VirtIO-MMIO child,
the IPCC power-notify channel, IOMMU assignments, firmware-visible IOVA
range, and DSI display endpoints on Hawi. Enable the DCP display device on
the Hawi MTP platform.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 129 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hawi.dtsi    |  40 +++++++++++
 2 files changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index c38e5fab7a2c..a27003f69d02 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -34,6 +34,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	display_panel_vdd: regulator-display-panel-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "display-panel-vdd";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		pinctrl-0 = <&sde_disp0_vdd_active>;
+		pinctrl-names = "default";
+	};
+
 	clocks {
 		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			compatible = "fixed-factor-clock";
@@ -142,6 +154,7 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 
 		vin-supply = <&vreg_bob1>;
 	};
+
 };
 
 &apps_rsc {
@@ -995,3 +1008,119 @@ &usb_dp_qmpphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&dcp_dsi0 {
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&display_panel_vdd>;
+
+		reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_dcp_in: endpoint {
+				remote-endpoint = <&dcp_intf0_out>;
+			};
+		};
+	};
+};
+
+&dcp_intf0_out {
+	remote-endpoint = <&panel_dcp_in>;
+};
+
+&pmd8028_e1_gpios {
+	sde_disp0_vdd_active: sde_disp0_vdd_active {
+		pins = "gpio2";
+		function = "normal";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <2>;
+		qcom,drive-strength = <2>;
+	};
+};
+
+&pmh0110_d_e0_gpios {
+	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&pmh0110_f_e0_gpios {
+	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&tlmm {
+	sde_te_active: sde-te-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_suspend: sde-te-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_esync0_suspend: sde-esync0-suspend-state {
+		pins = "gpio88";
+		function = "mdp_esync0";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio211";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio211";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 6b0a0ff0faa4..836970cdef71 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -6841,4 +6841,44 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	dcp: virtio@9be8000 {
+		compatible = "qcom,dcp-virtio";
+		reg = <0x0 0x09be8000 0x0 0x1000>;
+		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+		iommus = <&apps_smmu 0x15a3 0x0>;
+		iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+		dma-coherent;
+		mboxes = <&ipcc 13 5>;
+		mbox-names = "dcp-power-tx";
+
+		dcp-subsystem {
+			compatible = "virtio,device34";
+
+			iommus = <&apps_smmu 0x400 0x2>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dcp_intf0_out: endpoint {
+
+					};
+				};
+
+			};
+
+			dcp_dsi0: dsi@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
 };

-- 
2.43.0

