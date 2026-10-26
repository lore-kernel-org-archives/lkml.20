Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015096;
	b=xCylbudyIYGSlia3zmIza6lEXBDyg3eHW84XpGMbJWBJ/I2UFC4K4H2Wbl6J3c363Hji
	 JQp4jZ9ReJ5tDrQhoa467TtHjUHR3vaeDFCeNjEkk1krcG41OU/sOibeemrA89DHCIokd
	 SK8hY2IhxF9RqIys3eN2EVijOLDFdlByCIqBjlCBPq6qdLso561NPIAMQg0BabyxXXHv3
	 sKHimwlJIF+PPvAGSX9WNcf2o959+woX/v8dg6mtIwl+67XFE3/k+E8ZHmKsx43SExoWX
	 7vRaKGONR4JvLr4KyIx+iUhwST8Awn44Fdim1xCCp0P3JMwOAk21yJBGEOmRErwTOLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P0WukiBFc+997912KIZRVZRCW9zlZNCxWq+WKVUNL4A=;
	b=16mUnOb1hVFCNi6s04HymcjfG3pk3VWSn/SU2ANJHrn8NMmp0BZc6ygrXzU1Gb2dCyPD
	 I+nv8XnoOZptn1h0DCIvkMqCB3NiV6uzp7WB5kkoUeirWxwRYRf95lm7LwjBCqsKAEH/B
	 U+F87ZrrKtbdqGdKQ0TDy50W62KMjeEWtzDD67mZRuGXQmPuG2ZoxIlbxa+9GA9miUccI
	 P6DrGOXQXShyhfsHmRr1th8A1XqPw7G1TgZaNTCByjsqVAoMoPdD2so2P2Auo33hLy/X0
	 AwxD1M/dUKMnnWq7jXyUX8n5F4CN7ms/+IfGmeo+WdQtG/2kw0VdQoBE0Kee2a48Qgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBApRwkq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9dLb0j1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F4606A337
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895F4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBApRwkq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9dLb0j1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtXXC1547948
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0WukiBFc+997912KIZRVZRCW9zlZNCxWq+WKVUNL4A=; b=IBApRwkqT4K67zzT
	DgcRsuLsVmZ3P8kMYsUy3XW3a/zG6fIR1zwDsLvEDQTaNrJjdAEDupClZA6VpGpn
	2zimHEwEGTLRuiMsMZF7C0NxU0skm6Rij51dDQT4yNCml2hNXXMRU+mOAIjJaiPr
	s/CBRrUSVQHgrXH9WJFSeutPhn/8TkyA8jNGnrYn+QsrmhNMIEA3rOCi3qPAblk0
	98yKVQGym5UTkPqNgpVWWbTjIX5m+r3nflqjDpNHdBxC7a/Mraje8pf6q4UXZdBz
	4mWzA+kOj41BYJ6ThYljjsr9Otrp1poGfF1o5YJrrovey7PiQ/CjZtSbzR+98sEB
	f/BF8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst8xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so2909630a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015094; x=1793619894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0WukiBFc+997912KIZRVZRCW9zlZNCxWq+WKVUNL4A=;
        b=C9dLb0j1J1ZJ+G++6upw5iXdmw+V4HXNmfJKDL0zrpNqn1bf2d844H7cUgM6K0A6ZO
         FC3/9yNHzb0rK/ETpnD4VsQAukt3fpwcKlu8Kp+LLt9fxHQa6R/Lr4MN3eG6vul8hrFl
         QLGHKfauepqeueHBnswYw6fLGKGH4VkTH5GJueFwpC5ejZUhPDYC53zVt5W+PWDJL5+F
         DcB4WABeDFdLwT9VHZaRf2tbFkW4VIBRBRIdlaatApn0SCjDg8lJnJ9tNNW0Abdq18N5
         s/JVTpTDOLYew4hrb08HhSk30xX4WlJSWt9nE/rNGI+AWK2ahZj5bGIK2cKCadoPagsW
         rfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015094; x=1793619894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0WukiBFc+997912KIZRVZRCW9zlZNCxWq+WKVUNL4A=;
        b=etf9znyIe6g204iZvCp6YBAwyJj2iyvKHuVDuvXjAV/ReMJJOKdQGb6mC6wpXar/4e
         DztaVi5sZi+N7LSe2qkA4lrm54SzNzMOTTITCXa7zE2qO7RvW0g88PKaIF8Wz1kqadZ5
         g/3O3d4jL0bgP0ESJiPbdjF9brx4tR2HxKOrVrp2eURU7DiEDcXZglNKnDofNQAIsVfP
         9UiHXy0V6o033AtqyLgcRQQWFSR0/iSe5bq4ES3slTp5JiVMI2u7w7oDfaNNwAALazJb
         JTkA2apOxbp7K/3wrmCYuVhBMKmnu3/aAyx++OFscA3OZB8LoN1eNshEW/jNAyZ+wVXX
         PqZA==
X-Forwarded-Encrypted: i=1; AKwUvBy/yC7bFBBpOzOPpydai3zjmKglJZhNKeeNQmaRDEFb0iUvJkt4i0UeZ75nJE/3o1gFEk2c07WVxRjxXZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBTM3E89Mh+mftoY+NyqjJoFK9P07WXhqa1gtkAmb+ahviYt7j
	ke6CnanLGXY8NGo/4Rq0wlREsvfs36UxpoUZYGoiteHTyz1H5LOxYDGHTe7YwCJpzJE9V3UG46x
	UigIgZ4kkrnvyD2b6yhx5TkfOxpQ6r6oBAWi4Zj1+v28Q1Ijzze0+nYDTmVAWJnKksQo8stqwwe
	w=
X-Gm-Gg: AYBFou2zWK3+96pEyj2NBCJkaVsrRxnuk9keSDTUhEaqQQGupsqNpeJJZCkFj0cugcw
	JcEGRyR6Bg0QOS3UX+xiJapVG8Dg0s00yqpZnfke/fay19obAoSyaHCSqRCLvKhxwM+yLqBQ1+m
	ibEI9aABUocls3n5GB/NMvvL+PWJy9+enU0Hwkiycrh/4nixIlNooFDSkt+2HfoBZ16cQtlJ5XI
	onfjvsAjuFnNT6tjKaNl2qTpq15dnQg1d9sPRjVu64q2V+tEN6vvn7Ik7m4dzfIQ1aO6iYBCqoy
	2xHf1rl2BQCJ71EILVLmcAhJrnaHvZHiFfWvuw6Q73/V0YgSssQ3Px/klALs5fTkRcUs1XOvZwR
	qn5Q97WadUWG5LaVxSe/seZsqBBes0nLG6v0=
X-Received: by 2002:a17:90b:1804:b0:3ab:4e4:e979 with SMTP id 98e67ed59e1d1-3adead4fb3cmr5111254a91.36.1793015094107;
        Mon, 26 Oct 2026 04:44:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1804:b0:3ab:4e4:e979 with SMTP id 98e67ed59e1d1-3adead4fb3cmr5111229a91.36.1793015093572;
        Mon, 26 Oct 2026 04:44:53 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:44:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:29 +0530
Subject: [PATCH v4 v4 1/7] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-1-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=2341;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=tpB+61RQfNBAVuGYPmC8P8m57QRl8CwOCNsOem43oOw=;
 b=dAGQOkxE43L8l/yjArucWSJ/boK2tpuFw/uw+pt0Ee+16Rx+LaxEDIFjgyaDJDiRQBR/6tSm1
 jLTCfdS/CmtBSU32B9W9uTMUnWFfPxit6qyDsj8LjW3yi9RCRMhbl6e
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX2uSTq3N8zjdc
 TCGmSocbVRVaeAIcA/5QYKiBjPXEcnBKvmEUKoHePypF+MC/2DPjn02JmE11t+JCUGjzdPf5Ybv
 TA5GqtDI9E0aWjjFk3g8dizR1E1kLYU=
X-Proofpoint-GUID: WjC64ppTeJ9tFJIAevonmxiPe-QqeGqe
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf3d36 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SNQ4sQprfOKLKwPE6BEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: WjC64ppTeJ9tFJIAevonmxiPe-QqeGqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX4Qrzvkqu3vK+
 CwxVA0a9P0w2javIRYmJ6I9CHNcWO9WQdq72h3nA1j8vdtXf8H9Ny9SlSu9YEkAYOGPoqq1YmLN
 32JjFGb+5v/KbQ0N7KwUBobX83+2lmA/OkXzTQorHs+S59sV/XIChppyGQy2gHMb8GGqggWKu6n
 AKF6S60CQ8rSJAi2Sevb7patrnMEZha0udJaYD24iSsHLyJJFKoHoCtfUIhUEvr/8//g5ZdiJrb
 NDGxhDHWg1pztVoy5XJWWFF2hyDIKamtyGrV33VGyylpF5RejplUWncsF++HzdB1xpC4DjucYD8
 Mge4n7mdicunVgS4uRUQ2cDzyNPG2bRucJz9K/SKzIPLHOQIySVR7JU6DPEM4GMA3Q074HqnFOS
 jpihfokRQwav8TojeHCs2085aJgqlXo08b2Gru9+e7jrS5TBO6CZDpRsadGFaqckVcvkPKYt45U
 DK93vUhU+udf8vy0zFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260046

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..c010dd7b92cf 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -4007,6 +4008,40 @@ cti@9900000 {
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

