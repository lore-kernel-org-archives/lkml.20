Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662631;
	b=jN1kV8gieM6B2iGTAU0kGiRliOZIevaznQkLJH5PL5Gk8J9FgYe+GH0kcobHRt3ik2PZ
	 1TlIrg+2r252eJJyfgcW4PZIQ+OLCtHfdk8Xh7kxa8ZUtxWHHRQeB1PeC8eUt4QDhQ33B
	 q4kcD5yv3uwUDkGLztS1gb+3sR0wrqjxQwyXZjzmHyAvglow0QezV86QDsVAT1+VMNY4r
	 dbm+FNQz5YLRYEbqFarwnTqGmLyGzAeqQqCv0AWDut80h+lXxMLQN/Ns36N5lfV9cna+u
	 WNVICTmIhqsyS2ET8+XZRpuD2/B8Ht+I1/fp1zMRZosUMsPJ4SsxKh3NzoxwQLXWRKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0BSM0N2JW8/qC2xIwahgqEQhwwj/Oaqli2yB2iYA0Ho=;
	b=J5haIHO9eUZQXMQGzbXKCJcqoYZvxuqNGXbo+8vdXoWUR9DvAh7u4pv9OksnFixv5MSk
	 9tvtgF7OJRfEs5g9sygAZNLWulq5JVrHejsTsAcNk88yi/o27fMAN2ecpwA+4+GWmDQrU
	 aP+bhGGJXuHze4quoZ3gosNll9FOumK8DFw+PvivvKhg91CynUR2/nxNQ8dDP3LYOtIdM
	 pg9tDnyzZsx7lFlMJvqN1k8fbPzfWE4hsa379pgM+ch8eqYJcVTpkFNjbtFCtlhWAZAjd
	 xvkwYpL2+akMnlZMivl7JhV8nwFgPSa1anJU5lvlQ9A5U5GXUIv4PN3tYkrdjGxs3cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPG0aXT+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4vbOlWx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF1D606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF1D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPG0aXT+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4vbOlWx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xqam2171933
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BSM0N2JW8/qC2xIwahgqEQhwwj/Oaqli2yB2iYA0Ho=; b=LPG0aXT+wbIDw5By
	zduC5v5SMhALUeA+JfhOhTFI37hZWTIDYx/yZA2vI13KOV+EqLZCZ5LuYVpvbUk2
	anrscltO0pi9+d8IUz7ptn5ro3zruSBBShaZmiFvLOSbUESVGn6MgvXO+ENzvBsh
	yUsaXXdhnrGADE70Gct3X/22TClRJlUuaY+NHCOFxsQZK5bJmCOhxbO3GX1Ub05g
	mk75xBjtLDXVzaCkKcF4wDGyhUz9ioRiWOIF3hVO6uUy65E21IGABaCMd4dKVvUI
	SqZCBVFF2XWv7LZq61FOSImyH0Rw6TlxNTsWBPRL7Apiiw6+X3PGu/QO9+r5RGIQ
	LrY1BQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahsrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so3873320eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662629; x=1793267429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BSM0N2JW8/qC2xIwahgqEQhwwj/Oaqli2yB2iYA0Ho=;
        b=E4vbOlWxin3AfbviydUilSLg74+WExQtZr1NdlHmnAsnS2uwtBEbrevwdUgQ3wR+6l
         npMdhGPEKAqdrzWv/pkGnBntySgj6xJ+7Kvbd3kkfCBUQ75z0+Q+WQM4bm175qMAFp4r
         VABB+g2TJ+VDsg5mnrQ+hXwHJW3Pcm4A6q/R13bmi0m+5DRt9sz+cMUre040mmusMQV8
         vytTvfzlaW4HJQH/O/YeoyFcGleMu7nn2VfFI+tqM+W9fvOBdzeO+tr6PKWk5l5V5KxQ
         PMfiFSJ3djzBo3jUS5b+2cwIr9QUNIIFgopk74FtrZ06nbNweLwMFiMnpfdGyJzy/xBm
         dYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662629; x=1793267429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BSM0N2JW8/qC2xIwahgqEQhwwj/Oaqli2yB2iYA0Ho=;
        b=zbxG9Bf0DRo+ZkQ3DCorMe69knPACnPaCIwaD7GQtH4SLKqnu11sEhtFY9ajH9ag57
         0iSUmlnRi0wUyO5aWlmhFsaCHflMXuQU1DXbN/1oXy7jXKH5KrDZgGNXUbplMxKzoVV/
         qPJ6h3yb+iThisKHlr9xNQ/IRDiY4dlsTkjB7QzFWGjU0EpGmIdnqXeLPQmDThGVXXkJ
         5QQj0313yopuzCkfVdVLOVFbNQBA6wViE7gYVB/izhdZHE9107kyN7Rc3IkPqpLF+lfJ
         Z0cJIvsIvPg4I25FfCSmcsPDZzw3NZ1HT8dsQ1U4OkE8nOsWLLx187AjK1Ym+DdHBM2W
         ey5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7ezmlYOCCrNAIT8cerOZn3vxvD14g1rwXMOcoTc/09y8sEmrn3aj3baIcOuS7jYcVO2mPSxEmBAfxFGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlfAezf38FDMxHpk8tRthtC0grDisSjHhs0bK6klSbTTwO8QuZ
	HNy8Lg724rZ+82jE/xGuRRZ+ISpYsYnLvX37c7W1014wkKbHJIgya/gM+DsaWzLbeE8a0gl3sSN
	FKic5VkDvURT0LzUpdBieYaVgjshrK2qiklswjTQe28dqzFm0lure2LrtcvynbdD5AfI=
X-Gm-Gg: AYBFou0TO8GcFQxbamm2lJCfa+2mVpgWblmyqJLrc71K/WEQWdb6OJ0/ef11Ej1BGAp
	7szxquT20PcNT0sATF//fzh+MntyC0d1vcx/PnpV9NPZBZLr4EPLybBaZvbI43MRf5vcpP5Eg+g
	WFM4oyGvUz5zUThvP/ScN+aCQVQVKf2Zb7rUrlROfdKX2mxReXhR5gBt0Xfly0deiYjmVjQEdJ3
	8CkTXALIYFRQQBRaaS3598KkDvNtQRIzDqu+W0Ys1Nvg7/hvnHrVw4vhAtFNo6kZ6VNWEIrMkHu
	L7z8aibbgq7V3HMKR5hVwGKeeKTy9WD3UfCPcrN249sjlMlighG2BH3dkV5LhpUW82KhSufBRlh
	ZUUfaJlyjyLdxwM64DHfQuXbF4H2u/1z+4aU=
X-Received: by 2002:a05:7301:2411:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36858cac5cemr3317454eec.7.1792662628621;
        Thu, 22 Oct 2026 02:50:28 -0700 (PDT)
X-Received: by 2002:a05:7301:2411:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36858cac5cemr3317420eec.7.1792662628073;
        Thu, 22 Oct 2026 02:50:28 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:26 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:44 +0530
Subject: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
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
Message-Id: <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
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
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=3872;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=kPYPcZOWZuwHUS12Mgjdh0g+aFqX48seESi4efFzydM=;
 b=7lerbAuO+khdCd/pqmyfNxB3meVJT9ZMCEUpz9JyvrHFx7v+qfVZ0sF+uM/K3YcVHpP6xpA36
 Wy/qYQfM3NlDtJqkZeWBQ49J7mlckxdEpqXZ5CXEU+dWWKMszb85deG
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-GUID: T1VxxO4UnkGfbBL4Hev0Gmq0T17A1eKM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX22eANNa3j0nH
 e3OUHfAj812iUFzNTu2XkaPr45DhqleaTzTxK44HlbHrEsor/uQT9yylmQWcnxTDJ6EDuyBTSN8
 9sj/79g+V0Ii2ihH3csOjAJtq6D2fK8=
X-Proofpoint-ORIG-GUID: T1VxxO4UnkGfbBL4Hev0Gmq0T17A1eKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX4H5gmj/vbHU2
 fu4UAB901aWiuTSvnt7XbyMRx3wcAR/n6m6yBTewJqpjkqtrIHQifemf7lt1oI2APfb1GjdQM6G
 1068uXmwrt0HOliSb1QBI80uAJfBsVbFigYQgKT63UGlgrkwN/8ACEBcB2+VrZKBhJwUZSg7sqQ
 K5agbFDBsem2yO9hSZtWkyoFImKtzzqTyxOMkXDz4E2OKS2qy+TeAwkjJp24ap0zNeOo8faJVzs
 k5yhPt+GKM8h3VJ0yhrC0yM/Ap7fS+mTsuSGC+TwkZWBDuuRKLm/wAtce1/5S07XTDzkEYRA4Aq
 TTUNRmkGHsuESx0fJgqVP+OSwNn9TlmTxhXhwlLv6+J060VDOTwBssMADD7oEmp7ABNgA0Id7qu
 3goDSv+QaKE9ph1MTaWxcOU5edyJ6M1AmKNA1foqTuReOFOs9hV3jIC6rAvr4HpotTEnNZPNFGi
 o2YiIxjZ5oywd/7jb6g==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9dc65 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CcA5yJ8BMwMt8-iLN6QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220039

Add the DisplayPort controller node, including its OPP table,
controller clocks and power domain.

Connect the controller to the DPU and USB/DP QMP PHY, and enable
mode switching on the PHY for DisplayPort altmode.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 90 ++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..ee1fa830b6b1 100644
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
@@ -3851,6 +3854,89 @@ mdss_dsi0_phy: phy@9ac1000 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@9ad2000 {
+				compatible = "qcom,kaanapali-dp";
+				reg = <0x0 0x09ad2000 0x0 0x200>,
+				      <0x0 0x09ad2200 0x0 0x200>,
+				      <0x0 0x09ad3000 0x0 0xc00>,
+				      <0x0 0x09ad4000 0x0 0x400>,
+				      <0x0 0x09ad5000 0x0 0x400>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
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
@@ -3860,8 +3946,8 @@ dispcc: clock-controller@9ba2000 {
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

