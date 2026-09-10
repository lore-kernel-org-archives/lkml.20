Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980C30F92D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082230; cv=none; b=K9qD5QcJn3EyM3wZnx6c5NBoLN+HLX+zR32yGrjgK+tFTN+LGi66yifK4FZpbsClqWx93Rz6h33kDJ2lE1C64OwHoZIPXA4P+9bLcOQ/I9nL1vDscQWCbku2EKzv0NwnvtJI6dq2euUkDPtSHVYdqCMhUdOgmqk6BeOxMrV8NDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082230; c=relaxed/simple;
	bh=Zeq7+ocqQo+fqTVIrp6IWUcv70w/mUcUuk6iTuYKfPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aXHhjNdShnykibOQ3xwUAOR8f9RNJ50I7i7Rvvlvip1Ip93Iu60gesRW4PSkH8beBtZSW06pr/ENkS23/S5TZ5T14CiP+XEkzc/o/X5PacesyBY5PzsoA9/PIPmc5qJjojg8cXOkO4SQbbgB8qBeOMXnzb0LFjlH9mV+6DN43ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgO7SOW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM53GHKn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgO7SOW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM53GHKn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALUThU2350104
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GBDO4MTnE4z
	zdYneqlVVENoQc2OyNRG/GX2WC0P1ovY=; b=WgO7SOW0bP5jqHCCJSm1Vop/Bsv
	iI2OzRx04+PNkUURd+keFkSz767SVg6nJCPEsTmCUk2ZiUekzRKiTBVmYTuQA/5Q
	+0N7Yrgus96wgZrC2AjaP+yLqCD4LO2mIzBI46OxnF1ggEdf2viuBb3LEKMIoQaz
	C2aDHS2Nci6cOevfbkjbbYe+6HnXxAGD6lsAFA1TZ5L7sE6+twTlsdZLskMxeiV2
	FUMXGpwGI/gjcrZkcBtVrR80kYxp4ybDr+R0xDfGFbDEj68mVA1XC8PB3BF+SLPb
	ZXMvLZZWHa/EiwGJKYayM9TNi3IZ56cIfXbjESOBxMahJX9lwI6h/94cpJA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9tfxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b6416441eso513744a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082226; x=1789687026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBDO4MTnE4zzdYneqlVVENoQc2OyNRG/GX2WC0P1ovY=;
        b=OM53GHKnVXI9x0m39Xpqa4oK/0kW2w4DqXjl7ZaQ9yo1b6fTxHH1LYxw9IJfRjKA0l
         yUcnNgjIXQGdss/UZTE8EupBBF7WNhgCHRd6CxrKT3w//Pg0f3CTFPGlsLRHzgPDeleW
         d0wsxT704TPq58eM6I8uV0uMmQ9DEY29bOZtDuci5NBRTsrGdSi5oqqIQhTAqn3xntH8
         K7IVi4kCY8cqcoFQGCXJUUk/tsuUTv2Rx+6XuGhfh5Il27dhLt+s4VbbT1fURqzJpQqX
         aMnPHXPPzuBYBsS8REkFwHJ8enBd/wRzB+XexvzMLlewDKQMy7PwmMQxB+4kqOcWqtWF
         MpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082226; x=1789687026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBDO4MTnE4zzdYneqlVVENoQc2OyNRG/GX2WC0P1ovY=;
        b=rkokSjHMrtU7Nyp7cPvtFJ8TpRK/ybxgxzIXgc10LfWfdzt+/uT7JPuJKFlA07D5DJ
         k38ausqWtUWYSJeh7kWgwsygVTqNZHc9AHMCpQCwnO/FfzwO0bmK1wtwLyOY5mG3XEIM
         1vj+SBufhSODIODdOOyJKBvUCWySVZiTae5xUt4FZXldXKuFy4A3UWbFGlijvOp1lDiA
         gkj1Z/Bbd4ZENY6oTecxWPK/5dI+4ZGXhMj8+SN9OxVGNTwTXr+lJwTr+z+0GlbSrrOf
         TfYOmBZJiDge58853nXzSoZAk+0eIRHo3O2OtSNGWAU7o2ZmU1Z5HGzgM5ZrUJd2eh1i
         yJ3A==
X-Forwarded-Encrypted: i=1; AKwUvByzE10zjRUwN0NPWvNDQriNLyDUNUbk5cQJs2Q7ezayLiriZ1sOJdwa6TYLeWAhQwRBHkLu9Ouotjc6ilg=@vger.kernel.org
X-Gm-Message-State: AFuF++kiClsz/TmpLkBBCdziLthy5bQBJ9pdzNLzpNO83M9Adg77q5+Z
	MHgcKCZPu9BNxho/JEF0cIbqvimL0ca2KDmAj5iN9/CxjgiVWzEO7cxViB13/BEOdZJvi/c0SCL
	HFxqDgUCFG6LOqeiUKfzaXWzbanxjiOctWBwLd1vfN9zI2GvDeT98I0YuuhN8z4QePFA=
X-Gm-Gg: AYBFou3T3oTpWEsQxyJK7MNFnzX50khCNNJnAeJB3yFpcGdDeEgMcTd3uzrmYPTgvXG
	tAQXAHJpnEN0LaNxudUKrs5UQO0M0gx5A0lfTFeGMWr6hOd3W6r2J9+ahMpzSGAvsfjqS9jXrPv
	pmIX8QCJvLJDE1W1j99s1rkemfqYq6S2OamSWrK8Ullr84WA/VKZJgis8wq3gHjLgqs+ccbVuGP
	QjJi99zQja6iYeBUbtt55kIY5LOwtaMBRYPcX6bERxGo1/ZVlmwSvwiIQa7xqr6gTmGOdwr6GJD
	meRojrMgmFmVRQQA5RjWQQdwX2HTU8y5hNTyTdrQ78SB3K4FLQ2lU8PS5JZ7RaSn5zFu5cMO0B4
	hrOodPzIKLwA/lHd5fOT6SDjz+alP7RsAB6xj
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr1942090a91.1.1789082226306;
        Thu, 10 Sep 2026 16:17:06 -0700 (PDT)
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr1942028a91.1.1789082225910;
        Thu, 10 Sep 2026 16:17:05 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:05 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: [PATCH v2 3/9] arm64: dts: qcom: shikra: Add QAIF CPU node for audio
Date: Fri, 11 Sep 2026 04:46:36 +0530
Message-Id: <20260910231642.1794948-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX4mL2zSSkc772
 JUe1M1aAQvVXRa+QHE4LzdfVD+eabx1DFL60z3zoO4SRHstRSeJpKHkLfmJbo0qzXEZnwsmCnEX
 NKvu2wzIoMHk5N9KWU5AShgZfxWl6rff1QEUHR5m7yG/fapWo/UmRHYRxOWQ7sbHNEd286nCd4o
 gRUb5ci17TEfnoKcYF87LVY1mkUabrBHD+S/ucxWiML2xsM451p67uRbORDyZai+rjV2aGUNUCt
 Deh6cA6bEVwKgkaEpdst8ShK7dZpVLvVhivvcPFS/tsLYLnqTIOhePtSz++QfCKDzUDRccTF9rj
 MPmZEiWtcurpCndvfmanZDfNuHrD6GKV2YpfRXNf4JAlkozMDppwOhz/RECspcx1Fl+RvI29fOf
 5iqp44YXF8brGluK1Qx0f31vcr3gSQCng8PVoMgbB1SRE0LPXzu0dVMymD7UWJIeiwk+3EXbq0c
 iVWSFV204Bod0ZDbbQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX0hZQ4hfoMLgl
 q+6le3MqLntY0Zp8ZXnue0iB8LcxhCuahp11bjHGm2cLuhtnNrtZENfzaCBypLX1JKhMv7OWH6w
 yYhX5r00YgsGKUnEXboEdi++kVoBQZY=
X-Proofpoint-GUID: ZIKs8ExffSGdwqmeAsiwW39IcOnvZ4WJ
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa33a73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SNQ4sQprfOKLKwPE6BEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ZIKs8ExffSGdwqmeAsiwW39IcOnvZ4WJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block. Keep the node disabled at SoC level; board dts files enable
and consume it in subsequent patches.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index b8a13462771a..52b71790becb 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3486,6 +3487,40 @@ cti@9900000 {
 			label = "cti_apss_2";
 		};
 
+		qaif_cpu: audio@a000000 {
+			compatible = "qcom,shikra-qaif-cpu";
+			reg = <0x0 0x0a000000 0x0 0x20000>;
+
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+				 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>;
+			clock-names = "lpass_config",
+				      "lpass_core_axim",
+				      "aud_dma",
+				      "aud_dma_mem",
+				      "bus",
+				      "aif_if0_ibit",
+				      "aif_if1_ibit",
+				      "aif_if2_ibit",
+				      "aif_if3_ibit";
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>;
-- 
2.34.1

