Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DDA4AC14A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050071; cv=none; b=XuZl6rXNojkxiykoo8QpKYYzrN2aUurpErf4lopFf2J5tCp5hmALvShDOP+zW42nDF1HIPK1oUyiXKckS0hNxDTXyG6FcFZYBfIBqz1kb/HHBXzpEjkJR816U+0Mjsor75u/QBNpp42CdMzpy6TOII1MDejNcPY4Yv7tFzOxQ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050071; c=relaxed/simple;
	bh=QfsW7p+EnqCrkp5VxF7nJpn3yBDQp8WAB3SXDfvEA80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnqPNIZe4iF4D4AtUsCGipzmZ6P9Y9UCGeQ6U2jmbs+gDO9+oXaOY5iqxiEXeS8pP2Ho6QREcOftb/AzGkvxupKRiIxXu8UD6BdQFaic9htBJA2SUR9+rootH8zSSQ0igPghAF0TWqln0MetzWj8lRjozxD7/+C9r1URN9KFyfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgTPp/fi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHifKsCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgTPp/fi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHifKsCJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F5phpP500313
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZMJcSwYy1VxSlOobjS03qaCfSpehSXjZPpHWNlF8RAI=; b=TgTPp/fiRJ02OnRu
	K6sP8iGeHpxZs7FtrEExFRzxz2OvdVxz7HKeaEOG5e++i4RD8tRD/diWI4ydxkp/
	I4nGpFcSIj1e9UZeVtRQDYDAO6aeLHweGR90tTUY20TbcYh8XIeTFwwPsysK2SIu
	k9xiLQYll0k+VsVISRPultioYj1jE9mLbrMLffAPRWWUu4ic2WMPqhcoME79hrTe
	KLb9Ze6YupQ0TzCJyh7AL4eoen95eHVI/Lk/22GMC/HJrhPWRbMtQBibHLXJ4CRR
	qULsSlnZo/UNM2Przc1S2/JE0obAq/1zDbIlKAtR6qxHBb6enil/2OEDXFxK1jKT
	07BrkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf3u8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:41:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8ad8c5f80so63103395ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050061; x=1792654861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMJcSwYy1VxSlOobjS03qaCfSpehSXjZPpHWNlF8RAI=;
        b=FHifKsCJ/tEjjdRaDdw7gBC2Q89BdBZgAP36tRCS+6EuGybHyoR4MXVwJ577VwbfJN
         atLgkhEvlMYmcwBeNIzJmRAvN7jEUfgSJwf2jkjeRurNda2mVixWYevIN5qhX5LqMWEM
         am7q4fkH1OJCYNYJxHyX3890PPedMvCgOGy/j6/riq6PiKTho+IBvo4THIuh2xoyxCD/
         OLqw0hXEMt9s5ahndk7Mp1m20Nhd2frcs59Am7SZYCg827wwXr6+Ott5HbqqM3uq1kAK
         OmkvdDzfE9RNBqlho8w2M3NZDs8ZSd3PDJ+u6/s6/q2y9m0zGsUbh6sXseJYn5hwXeHu
         K5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050061; x=1792654861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMJcSwYy1VxSlOobjS03qaCfSpehSXjZPpHWNlF8RAI=;
        b=AIADzLkJYA1tURURrSWHQLrhSR1R6ue/SDu15ytQFr1ss6XFuxK4gbN3c9jshhgQQk
         ieFDlTNBYHHLD5eqtId8eLJl3wZXLiQKwwea8w9Sl3R+inj1vbBjclUU2sg4JgUbEv9K
         61VLbuf8ux9/EhHbsD3hNVtGYTSIhUBHVAnjR2L4r6dlwbrzoj4LtjMwYK7D8dwhqgDC
         MjQU0oYg4zFFa2SHnkRvavkFrIMhpM4+xxUNxGnUEF1SEmtYT1J+0oEAhnQgt4cSfFnM
         BMfTZsnwDx9T/QTXI96Mb3uY52kVkXbV3QPWIKRzWyGZYpZl+OMEABx1Coh67mKUSKG8
         RGnw==
X-Forwarded-Encrypted: i=1; AKwUvBxs3ia2BAwglkWoS5Ph26BcnemdidBdQ7DyawebG12FEkBB4nNKCm/doxfifmtpAGx2gabTSXUU9OR6jxA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3qp8DJ14miR265QhbTHqhrlAa0VNNyo/3LZL1Q4FX00ms6S4T
	wtXpxTOCmWL8GM1ju3DjnQLxP7fT8EhC0bTrORwGXtnQSUgzeae+Z3B08Ow8Yo68HBZGy/a8qZB
	yQSvh81TKC6jxGz+OHoXASFvaU9tmfhWpu8g58M7lsJOpJPXfvJKQDfklJPDdgILdxBQ=
X-Gm-Gg: AYBFou3iWq9Lc17cO74OpfVCuwNtrNMTqTYx+7+IGKfJ1xMmtfpItnsF9PvFOBdI218
	hQZOm1NL9BN3ddCS9RKGj+BePI2VPpz0kDaChjwfQuZOGoY0iqoL2kGky2vf/5B2WI1tRyPzVLR
	tn2d1dgNzmlIvUSW6juF1AJmRUji621R4px5+LhmzXSHVXOvXstEl4jVDe82Sh1VoUGqyJAb6xx
	dNTV06sRYFS50I+YpsADZWfeZUzxZRncgpyRLOMixf8J+czvZqf0hoYAIzGx52L6kTFfx/Zc8De
	okrPJ7tdgHUqDdAPBFBsX0rwxx5o+4cQcpFvCLxNLE8j2IIMOqNcq7K62u4SCDk1d/OUS5Ow8h8
	zz/nQmJu3ZDvDS8AlzMdmfls3fnhtc1UVH/8=
X-Received: by 2002:a17:903:230c:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2e8429a58b9mr173469285ad.18.1792050060843;
        Thu, 15 Oct 2026 00:41:00 -0700 (PDT)
X-Received: by 2002:a17:903:230c:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2e8429a58b9mr173468885ad.18.1792050060272;
        Thu, 15 Oct 2026 00:41:00 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm14014825ad.27.2026.10.15.00.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:40:59 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:33 +0530
Subject: [PATCH 13/13] arm64: dts: qcom: hawi: Add DCP support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-jshekhar-drm-msm-dcp-v1-v1-13-48aad0fe4f72@oss.qualcomm.com>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792049920; l=6156;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=QfsW7p+EnqCrkp5VxF7nJpn3yBDQp8WAB3SXDfvEA80=;
 b=JxMeN+DmWGewFKBEVzcKUqFUkqoSyxqpGwErK350VoQIwFKd+fbhLmrtRxjrT83vph7NHMhD/
 kefG95krZ7aB85pcavRl2PIXjyPSamuyWWB5KyY+6SVKlJroQsTCpRq
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX8o/0NyfxZIaC
 9DKbLywtIgz2OZzc57p1Iak5/DpVsBudbYdNi91+UVO5U4uJ5QigQ3Z8fHLugHbg+2Z5d3IxyJS
 GBK/BxgDUC+/E7/dbrzTL3eXqauWUt6rmxA/SxincN3SYQANRODCVZ3ZVcqmclvScUofjtSDU5I
 pUdatYoZNtiCm7dPEa0MBqdlqUF+hN69Vr9iuNYkWda3EZiqPFif8w4n1P6ijM8oMhFyWtRR3rL
 wRfF1l0Yb7m09EcfMsCmK8pNUrfL3IIGTTnXXPUt8dVVMPL565WsgTHZZ+xXyP4R+3K8fUS+jhC
 j4w7iVfrY/+9TMjW5HJURHHkCJPGfEQ9rqY19ubVT9pCTB8TawDtCDgQaG4waopPhxbNV1Oa3z2
 xc9EFdwS/r0sfm7eQ2OIAX4YvGuwODGDVRNoo60crY68l9wQV0DYn+6o/mQLD8m5vs9C34PPvPg
 kzVLLlDpMixt+txGebw==
X-Proofpoint-GUID: WZboIox6PUjG0lUDr4ClJ6QQNRrQ9KZY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX6/AGN2H3G0N3
 SI33ElZIXTLBr47zsdeRLgwZXHQBg9KnEVZEsWZHX6WMBgMngDkFb+qg/YyKPQlQF4OWA2fiCWr
 eM7MDy4CEDmhqH2eBxeEAd7JET8sDlw=
X-Proofpoint-ORIG-GUID: WZboIox6PUjG0lUDr4ClJ6QQNRrQ9KZY
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad0838d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_CzEFU3RdQMONSqgxRIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150030

Hawi display hardware is owned by DCP firmware, so the platform device tree
must describe the VirtIO transport, firmware display function, power-notify
channel, IOMMU contexts, and display graph used by the MSM DRM driver.

Describe the DCP VirtIO transport and function, IPCC channel, IOMMU
assignments, firmware-visible IOVA range, and DSI display endpoints on
Hawi. Enable the DCP display device on the Hawi MTP platform.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Assisted-by: LLM
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 131 +++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/hawi.dtsi    |  59 +++++++++++++++
 2 files changed, 189 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 9c86e0477053..03e4cc117109 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -36,6 +36,18 @@ chosen {
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
 		xo_board: xo_board {
 			compatible = "fixed-clock";
@@ -261,6 +273,7 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 
 		vin-supply = <&vreg_bob1>;
 	};
+
 };
 
 &lpass_vamacro {
@@ -271,7 +284,6 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
-
 &q6apmbedai {
 	dai@40 {
 		reg = <SECONDARY_TDM_RX_0>;
@@ -1277,3 +1289,120 @@ &usb_1_dwc3_hs {
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
+				remote-endpoint = <&dcp_dsi0_out>;
+			};
+		};
+	};
+};
+
+&dcp_dsi0_out {
+	remote-endpoint = <&panel_dcp_in>;
+	data-lanes = <0 1 2 3>;
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
index 0926d880cb0c..58fcf42cbaba 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -8235,4 +8235,63 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	dcp: virtio@9be8000 {
+		compatible = "qcom,dcp-virtio", "virtio,mmio";
+		reg = <0x0 0x09be8000 0x0 0x1000>;
+		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+				      <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "virtio", "dcp_power_notify_irq";
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
+				port@1 {
+					reg = <1>;
+					dcp_intf1_out: endpoint {
+
+						remote-endpoint = <&dcp_dsi0_in>;
+					};
+				};
+
+			};
+
+			dcp_dsi0: dsi@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dcp_dsi0_in: endpoint {
+							remote-endpoint = <&dcp_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dcp_dsi0_out: endpoint { };
+					};
+				};
+			};
+		};
+	};
 };

-- 
2.43.0

