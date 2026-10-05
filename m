Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10613348C67
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185104; cv=none; b=pL3rmfDF2eglgkBGzw8lZHO+6YllZeYpJyydj3PEW/9S4zVJsbtqKDOOaxhPHLS7PPaAOwO3MCz6i41JRTPVKRPyPCNQDm4fiu1KLomLdiCYN+examFkNL0LrKVgORiqicJK/B0PvijM/WrrAWTwXvUan18A66480qkJQp/2fc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185104; c=relaxed/simple;
	bh=pp707mFFIsFOhojrFXFJDmxlQS8mlwPfd2cpcTElHgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N83nfU+LcaQxTqcDz0j8iDSIlvu59YeJcCH9rF8GXnG6NW4W90DuBuyLSWCTpD7ini0ihcistBaLD/FTHViL+ryXgodBDUEVCGvKya/sez/aHNnZSckw1aKyi3ASDVxDelXlIce8tBOAGdmd8FQNKLhAxLtgsnexHnK6APcSm/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lycGStG6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCs63Jbs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lycGStG6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCs63Jbs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510NOU1411592
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLb5pDtUQOaPF9wZBJMGDGKqDnkf5ns6MI9EMrBQMvY=; b=lycGStG6yYfswiNT
	C3IgCb8flMbfV+2MsAkgnBKw8P35UTlOZlYaljHDObokQHkovcoVx2oQdrY8U4pe
	tq7OOzWLaAzgkYv2/7CZG8Wx9907N7KVMRG9FJFckrD4e9gLIYYKMupQdg216An8
	giHKj2xRXkwvF4bbKSjOuMf860mJRilyE/dLtC8qJ484My3e1DxuHPex/iW+Xs+w
	hryHHRZtVhLeTibR513+IoKxYqXngTtFeOr5K1hxzSMAPOIgnl2YTDuX6uOs8tbM
	zaekAcExuZWOKaeAaA+LD+nzge742hQww4CYt5HZs0bHN61uBOdCpCfCySD1p/JU
	kNCFPw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr6cw16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:25:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so906128a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185102; x=1791789902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLb5pDtUQOaPF9wZBJMGDGKqDnkf5ns6MI9EMrBQMvY=;
        b=VCs63Jbsgy7FZlYHnmmlnAauG2pTXc2h02373sHgtoFuurohSTtEuN0Flrc6Qy4xJ8
         XyQ0f7euvCKnIRvB6UDKODruioGTiQbscG+QSIJR2rMn2CbM/D+3jsT0a0gQ2skS91wV
         4t1bRghyrxbJbSRpGtDhxMZYypl8V0+hM36y7Z8/9bSnYa4OrGSLCnW74mv+bsJNWZzO
         l7JqHY8mlF5fOiDLjOwtQ81+lyLTWC2pGN/64hn+WFQkkkUzOxnP2lUye6g2fy2Jc6/K
         2kaG1k8Bi6hn5qSSqvv+M0GEMI3XO33K61DndpmOEq0dj7DkZdmxXjrwlGFVLjypndkh
         9EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185102; x=1791789902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLb5pDtUQOaPF9wZBJMGDGKqDnkf5ns6MI9EMrBQMvY=;
        b=sWhP//sAfwNqea0wIMubXE7GzbDyYWV8MYNXVFGgwFEjopSE/nb1MiQdorCRfRB13i
         3Ix8RjkLCCpwn6s9LK3FzQmWl9GAmtn3otdHPixZjAlNjOvprmgdUa+gkPxdlkuy4EvY
         B+2LI6hxa8twBcDb521+boqrDCe6kAP+MUOkdI1biS5DFLHwzFeC4KAepK5AtTulDwfZ
         jteiPR+lB8LNG3I5lSf8AMMFQ7NHYbOV6+2hLUvXziz+OoYWBSh1LmIecKXIdpKNrMsQ
         YRvg2JfVrxPyCAhzktr/MD8lf582cZv3GgLgG41HW6UFL1XThaNyjVtEh73yu7Gf8ygH
         zBBA==
X-Forwarded-Encrypted: i=1; AKwUvBzY9U/3jEXB/zMMM2h8x2Kv1vbXehwkGLxDkRXeHYxP/wM3+qyoQG9Pyq01xtXpU06AA4T6S56g8TeFIPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYInoMkrZvc63DRfuYDK31uYXvqMt9E0pFefC8gHO791RZHV13ox
	D86hOVaT/XIigaW9Od8e76FGCh4A34hcFucPEBqjdzenZeZ7z8QywUl4aZasiU/Vdb8gC4I9LSz
	YuuuWJfz98apRzeFC7v64/htzmljXRVzKhp7IuUVxt0PNtRoKVlkOlFAq4iAmbVLLnRU=
X-Gm-Gg: AYBFou325O6qhP7IHDLmxJv8YVbq6rwCxaaPfpau85Lq4+KWOqgBYxBi/sE4Fse4nHv
	wStL2BPlhbVYSZlxiQAKgOcdjMtzqwlH31iHyYZ7rIDRGb3D7v25e2Z9PwzWs2BQEBYodi82LpV
	hWKaEdz8P77j+lMmgp43f8ZnpLZ37dsBUZ9ooNEBa7AqtGBNSnHRK5FiKm4mLqVEjGsjS8ib6aP
	7NA9K4BqDbin4dwfaNyFaSbAnd7+l2wB3YWl32pb7dr6WWFtyOzZWxBKbWKnGD34zFOAw+oZ+p0
	0vzl3uEPotorQU5FgluWHHch0hZ2sjIy1lC5reChPkD99Id5gjjagvP5PoW4qnDHAUrNPX4knt/
	jSDUxYUUX8TxwfFdTbvG//dstk3Z0pQRHhfY=
X-Received: by 2002:a17:90b:3c07:b0:3a7:9fdf:f60 with SMTP id 98e67ed59e1d1-3a79fdf17e1mr3283242a91.11.1791185101441;
        Mon, 05 Oct 2026 00:25:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3c07:b0:3a7:9fdf:f60 with SMTP id 98e67ed59e1d1-3a79fdf17e1mr3283220a91.11.1791185100963;
        Mon, 05 Oct 2026 00:25:00 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:25:00 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:28 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=3560;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=pp707mFFIsFOhojrFXFJDmxlQS8mlwPfd2cpcTElHgg=;
 b=z2L87++pOyLxWbsPAX3pnL+nVhC97yCtc2jN6m0+st48uoNgWCwVgLBSSfdz3diouBTpIEHZa
 93Ug54zFV1UDBkOAyGQTgWeNP3uLcUdVXHF57JoklKDvuDYFmK6k2m/
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfXzMrk4d5VwXMD
 6PMGGuc93p6m5zVd/dqJT65W16EyV/M2C/7r1Mz+JqU4kFg7ImeAZKFjVoQt3RHSNzLcmnZSXK9
 6gs0WLALwcRLctl8HvfP6S3raEE5QnU=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac350ce cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=InTVoh-5CTnzAY78DgIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: KSF8cXqcQtFcCsR_kdrDJxmCNU-VPvz5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX5bpWZoTGHXDd
 4AVBiJ/EqWzoNEj72VIxrXj+gZjQAqHObVCFOjtVrQpheqIKpuCKNaKw7e3XPk8YTKI2HJKwz3T
 16ipEnYVLJVrNEXBp3DcVs+i/XgCQ+1kkiORsDIfHttHX1RGrhLJ1cvSG/Lku35q8AS4SOkfb8Y
 ypKAYZWthlNDqQhBbyIwngEWaCSbyF+5bKKdX6+BFvq1y1hEHqGe1OVvYisaiNVQT9fQNRK++pW
 THIO9M/XBg2n8qZhuDvyJGFMKMD5P2Tif4huxcLGC1ztTsTdOeFlB11uJyJLBgA+0R7FEqCZTlO
 8+BcMoNRjMDzfClGknIjhNyQTk0PBTgQHNAQJxIdur48NLxpVwW61mei8qsSmkXv3kx8ttnXE1I
 oRTpwdBxZ591rwdckUojYtd+8umlUjKHrvQgqX5rwbcFA8beQBepae/91qgKolgxCPswbb/1Ar+
 eFeMbNHeZtgDGdlFipQ==
X-Proofpoint-ORIG-GUID: KSF8cXqcQtFcCsR_kdrDJxmCNU-VPvz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050028

Add device node for the DisplayPort controller, its OPP table, clocks
and power domain, and connect it to the DPU and USB/DP QMP PHY.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 87 ++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..155c590c8eb6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3565,6 +3565,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -3592,6 +3593,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -3699,6 +3701,7 @@ port@2 {
 						reg = <2>;
 
 						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
 				};
@@ -3851,6 +3854,86 @@ mdss_dsi0_phy: phy@9ac1000 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@9ad2000 {
+				compatible = "qcom,kaanapali-dp";
+				reg = <0x0 0x09ad2000 0x0 0x10c>,
+				      <0x0 0x09ad2200 0x0 0xc8>,
+				      <0x0 0x09ad3000 0x0 0x78>,
+				      <0x0 0x09ad4000 0x0 0xa0>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents =
+					<&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+					<&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							data-lanes = <0 1 2 3>;
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
 		};
 
 		dispcc: clock-controller@9ba2000 {
@@ -3860,8 +3943,8 @@ dispcc: clock-controller@9ba2000 {
 				 <&bi_tcxo_ao_div2>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>,
 				 <0>,
 				 <0>,

-- 
2.34.1

