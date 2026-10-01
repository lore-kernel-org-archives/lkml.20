Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93AC5326CE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867894; cv=none; b=aUIoGkckl8CtY9EHIgF9MFykZkDr/4FNE/WEje7LVJBlCliNQovwz/cIlZMNBG9LHLau3Np1WLJXkMvscFKux0DOJy4r/Z/IMUFPMoK6wwmLdVAIID+LLoo0vOVLRaRQNZ+p1RAP7QD21595AhpXKjKhYKfmsnYHSnvQBbo/sIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867894; c=relaxed/simple;
	bh=hHugJm3SVpPiIxBXc/DD6tnFsE+GEvc1Z3zKaD4tio4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=leD8p7ZBBD1K0eUwgV4ULF1QzeI2ysIQ9fpCZK4E0Yn35nLdSyIKZe9tX5JUUZeuWuMcJxDJzuPQc+7IIPHV/XywQJwh2fK48hRzyE5vHDYeSfyvminbcYVs0zBhXmlHSNBzfxHGWkxarHxvISnN2mIzqQ+Erhd0jpPQPKuH5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzFgalG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJRatapR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzFgalG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJRatapR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DilY63776367
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ingTY46NJ2GQtvCGWZtOAziSPD60qDaEf0ROXwQIT14=; b=nzFgalG1DZjBiNNp
	d4iqD8uYWVdxkfegPNKPs3cBMsJ6VRSs2yMXLUNwaqSf2D7e9UlQxwQqQKhxsV7W
	FewmLvmJgqVru/TOh4DQQBBD5LNQmsMqTvO8SSCvGosbr9Nrd1mGo2YcjiSzPZuQ
	xBgqr4kQN8sp67jtXYC6W7aHXiwkM8l6NNlC5u8jWFRRP/ub0QcQcaz237tqZTcY
	shoIFiJ1yD44u3Kq3CYBEtXTIf9r/syqP+TBvobnGu2l7xczVHZFQULbNEAt5MSl
	Z1rp9ry2JQ61x8GkOjRlNcw+tVIN6BtSaddYq+EEUtC3B+kI5YUkyhyp2beJ8hFC
	Ve1fQA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b94ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:18:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14364a88479so139614c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867891; x=1791472691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ingTY46NJ2GQtvCGWZtOAziSPD60qDaEf0ROXwQIT14=;
        b=IJRatapRhlm17PnoR+buVANF3mHi2A9kjnvtLIhhzo0X/Zbeui5WRim1RF+PUvKaQ7
         GFmrcmKf2PDU/WuPdfOs4nm4b9s9yJbtgu2dOPzxVWc8p15psimMLZ5Sx4rvWcGBaaWQ
         PlUyTtAlFgk2Xp50IHAhvMpeBP9wgUYZDd2DmrFvHmrZpqEwlTPnyvE3jsP4KILjYDXy
         HdFrAbswADrmcmTdEtNwCpeypKrk/uGZFq7Ckf8uzVgtmpCT7CC8HTjkcTt65CQBzADI
         6IS+x/bjbqjb/RchWIUAztw57CbSem1WH7+7T+0KLyLRsT49DDqmrmtXv0nhoFS9wEO8
         GtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867891; x=1791472691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ingTY46NJ2GQtvCGWZtOAziSPD60qDaEf0ROXwQIT14=;
        b=YzkHggWrMd17CIN8IpIyJBahxiAYoZYxWLfXrDAttpGwnGVBGypy4qFQSwtEjQbViW
         6RaD6QGvJLpgJToujPd6tYQ3zNRSU9HlEgcBHXA3ng0tshqqw0ok5YiVE6q+FulbBKjW
         MnkS5MQAhi475x6u5jHZR+qf8EtfzMF6hcsPysF7bfSoplWghW/rFSzUUr7jmK6OXI/G
         B14TXve8Wd19QyTFaABokJUdDdj/iJN5k2H6s27IGpwC7CNdQvtleh3az7WLQC65WqZm
         2SLFdqS8T27tj2Z/WUl/ccKV/hAgtjaeDcb6jxSEvRrndwrE/5lfpAKk3y3saK6fVuUx
         u9Dw==
X-Forwarded-Encrypted: i=1; AKwUvByINKE55t/GFxM/tmRbCHrcM4AWMH7UPLFtxtecl/iQNesbDTSiLEony7AIMi+nbQ4Sq68mBGzgNtUV5tI=@vger.kernel.org
X-Gm-Message-State: AFuF++lnWQGAQLx1/XvZnQheiBX177QVVG0sh89lDpUkLzLsUhTQod8P
	L2HLhuRl4juBQw23wy17Thh2w9yMS3WdGk8OGDIPqePJmp3+RguwsHCcHQxOqSKRc8kzf8QQJtw
	wq0f6Gk8CdS2o4EzqwK26/ykEfIGqklS8dPiZoqWbMTSHP1kv2pbSvgRJtT6/CmvZ+6s=
X-Gm-Gg: AYBFou02UoD6cIc373M17TtDyFMCHZ2JuBF1TefpHHRKifcNQt/SJF+obMUGU4wW9my
	gyNDCIz/W4YuILU0LC+rCMMW8FldbQzVrEMaMlOT/42hh4W2L1xOIr8FCzqmR3b1r4yhoK45Sod
	1HayLQfW5B2VkX1svODhfQpfDyZftz7FbAAEH866t48WgmYG7bifm85jWPvq4QjFa/NOthygn88
	X53hMe4LrSs3RRRDZeA8WZwJpkWPQeSc8/cjxxGZWKY1J0xgCoXNMhHYVXMxpQcLHzZ8kHaaY0B
	4kP50OJB4PpAXq2ubXNKoIfyWr5DXO4ALptyyfmw8kbwtmcvUXQPyonxzU0OvUXYQ9KMnvE6n/a
	EgrL1TbcrHANwdIi/aJwFGnaVEPSuNtEQcQ==
X-Received: by 2002:a05:7022:5f06:b0:14c:d041:f9e with SMTP id a92af1059eb24-14dcf491981mr3113007c88.19.1790867891155;
        Thu, 01 Oct 2026 08:18:11 -0700 (PDT)
X-Received: by 2002:a05:7022:5f06:b0:14c:d041:f9e with SMTP id a92af1059eb24-14dcf491981mr3112957c88.19.1790867890268;
        Thu, 01 Oct 2026 08:18:10 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:09 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:25 +0530
Subject: [PATCH v4 5/6] arm64: dts: qcom: kaanapali: add iris video node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=5000;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=hHugJm3SVpPiIxBXc/DD6tnFsE+GEvc1Z3zKaD4tio4=;
 b=3Qk6f6rZiC5tX5qRvZrbVMdAPj7V2+YKSuGGsOQcN2RnjHg9K6/KLVnbueA/vzPtofADRobOo
 LIM8toI0IrBBAxxiKsU6+SmuMG6MFtXy1QSQx7R4O/nnKLx/OYCOTY9
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: wfTYCX2RQkq6Lj6OFzstnip6slw_3YBh
X-Proofpoint-ORIG-GUID: wfTYCX2RQkq6Lj6OFzstnip6slw_3YBh
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe79b4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_7F-lZpJ7T8AqIHUSVsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX9nuc3pUHkDRT
 ctLK/GYB+zVQ3sBdyfdGxxztK2p4zUlcn+w4fsw6D6aLCynzaaW20uL9ERlucUPWh2v+IXH9WmU
 nxUcJFZU5umrAWPkarPgZ1LNNcV00Jk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX/m2VyCFuoXfC
 WB5TCPe2SYD0ZXGjkX/6IYauYGnYSkLthOagxwKnyOMt9/9AQL5Et/xYfV/wQxyvtdlSSESDRBl
 4g8jvYYXLsccBw3dAPAAhUcpIGw24LEJE1nv4F0D01EYByLHO7gNUNlWP35UXn2Art02mb+P38M
 8jMGRenMWWLp3lEzhzAIW7Ho7v7Ayj4R2pUpBOlAGiFqIX/LwtQQoS4cYPo6zDbskvW00M9yB9F
 JrsOriUMAqKnMME4qaYX4hif+TJRK3/8hDesRRbFdPWnQoSkPoyjmH0jyEJJUtWgVnkdJ/lMpz+
 uXP2qlubJ9ESfgXB7ME9NlnSiZsRfzCHj6TSsYf4R7oRKgWBic8XGgvi/G3RecfrLiipkjlsv99
 6yE8Qi8xyS7YU8gnuCoV/UGcvyQq+wNLK3UVbC1mLqOL1hfY5+XiXnwrKeiySYQAa+xb6mnp9lF
 qKN/MdWAuZeZBXVdmSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Add iris video codec to kaanapali SoC, which comes with significantly
different powering up sequence than previous iris generation, thus
different clocks, power domains and resets.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 142 ++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 146eaf9f0b9a9e1cac764fb598ea2433c0af6631..0708815f9ef9565f9560969100153fc532b803d6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2663,6 +2663,148 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		iris: video-codec@2000000 {
+			compatible = "qcom,kaanapali-iris";
+			reg = <0x0 0x02000000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0B_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
+				 <&videocc VIDEO_CC_MVS0A_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec_bse",
+				      "vcodec_vpp0",
+				      "vcodec_vpp1",
+				      "vcodec_apv";
+
+			dma-coherent;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
+					<&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
+					<&videocc VIDEO_CC_MVS0A_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vpp0",
+					     "vpp1",
+					     "apv";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffc00000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x1a20 0x0>;
+				iommu-ranges = <0x25800000 0xda400000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000
+							    240000000 360000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000
+							    338000000 507000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000 420000000
+							    420000000 630000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000
+							    444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000 533000000
+							    533000000 800000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000 630000000
+							    630000000 1104000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000 630000000
+							    630000000 1260000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo_l0>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000 630000000
+							    850000000 1260000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@20f0000 {
 			compatible = "qcom,kaanapali-videocc";
 			reg = <0x0 0x020f0000 0x0 0x10000>;

-- 
2.34.1

