Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B563AA9C4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619887; cv=none; b=BZ3EzXUEFSWOz0KwcXyqT89fVo8AjgoXnxRqQTyTBCjBeJ0duAUje7JBDrEW2VM/6ywpnbFsehBG7pNCvP8w5urOnVmdQJKKRCLPUqVi3dBtkIRN3OPM0L4in/0mEz4x4T3X7PXXNTNGl16TpLunS4/z7M834tnrTOo6e2MLxrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619887; c=relaxed/simple;
	bh=fKWRyNcdRFNITSa44qZYedxjTCIbwxk6y6dHw5NYARA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0sxwTwTowX3WBZZMGcBrjjar5pRHdcboxWVcuER1krWZgxyJdw5bMRFMJLtiH1COJ2yfoeNsgD2mFBDRXrteG9KPrgycK4KJd/8CwkFLolrS5CjPngtSBhcpub52GV5pbVGDqDb5ZdVRCh4h3lfQrMRoi90p2LhDtqnnzINns0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmH0TeKJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxyBoZvL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmH0TeKJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxyBoZvL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1g5rV3897354
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlgA9K5u9prw3T3CXPOQRlclq6rmY6x9vd7pNqR3CLg=; b=RmH0TeKJEF0iQoRt
	1U8U3cEeO4DHOMR21ql5ckL+zMGciUkrgjhnChpsTj4MF+TynmXTlaFu4G1DjFMD
	/Ww/WEWFURw+x0wzmPvHz3fis3f397RTXh21KwVtHJg/IObXL2omy/PmKgmer4Gl
	/aLzaFtZZfQ91XqtPrt+NlL6pkiZ/GUDcEYymVPPbuQkDiJglzP6CjqnV6QJb7Bm
	A+LH6fDSAUWzoJxq8G7ktgB0d095T9hkuNsmI9zy8BZt1J6WPuhhM54sotOV1v8A
	Apd/MptyeCVGEDCSA7PVMwFUI1YNScNrUKjR1pbCGP2akRblk+HKnrtgUFxloPQW
	HSAxQw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6atbnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:38:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso828271a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619883; x=1790224683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlgA9K5u9prw3T3CXPOQRlclq6rmY6x9vd7pNqR3CLg=;
        b=AxyBoZvLpBXZmxvkhsz6vKkqaQ6iLDNtJZbusAYYi/5dAqmi2/YOLnHpAROPijpgIh
         iHVkEkWcdvIyV4/mgIP0liusoOEG3BzxCipwtne0SxmiSgcQ/HQWKQKcVb6VSpSElgbo
         vFMAmRUHtZzc89fZzOXXSCA44gAfpwOcaNWcwTwPFY9VfAQd/8CV/md0eXC54/JSyipa
         5bF2jlxqrvHP/lTbxD49IJLHE/m2tiGkfNWG0ozybknCh8VlQPVcEYDf2jLFS1yseI2E
         zOhxyR9+l8MZGGmovvQ2AneUa1aCm/6G/n9Q+VZOjdw0IFviOIYOPolSavTZwFHmu/GC
         p7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619883; x=1790224683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlgA9K5u9prw3T3CXPOQRlclq6rmY6x9vd7pNqR3CLg=;
        b=FNIZVlNPdxFAkhYm9IvRqc+3ZK8A/6Pzxmlf6zioLocWYAFGbGaOYbA6ITYqdPcbpR
         H59XXdpBWQ8eV2NvhQnLkeZ2chDPh9zqvvTUJdAlysObugIS0NhjbXObQQuAutllEu57
         ez91ciLNMPpombJJShVyGEPlfJqCybihWo2MkX4t5ZUksRBhjL3GrDYlhv7NOJD0WofF
         4hDXWuN01X4vx1OGNJNQD+v9265gaHmXOFUgh2jPtTU2RCpr9IWvmdq4bAV1VHk395xD
         VxPBQy/h3NVkGmrSsZU9FLfpoqLSoaFNfYnzGR2UP4Hvq+7LskA+IGptVdmR9ArccH93
         sYmA==
X-Forwarded-Encrypted: i=1; AKwUvBw6pXKWdblzJUq5nIxsGn17+NR3zd8HONTRSm1Wv5Wys5W/g/QeXTy4ZjCHw4Hs5UAOTwIPUg4QckJ8bP4=@vger.kernel.org
X-Gm-Message-State: AFuF++kq98w16LkOaJ8acli1ZmLwoyOtFbZlr0IKJGHkaXeXwJ7fvZ8x
	A/j+6Hvdmv5kda0EvhfyR/4fTFXewDXq7wKf3NmOL6jBiAcLUeojWrY5IbxAOvFz/CpbWq3jqLW
	yd1uKg6yhuSswm7QIT/Km0vsIj4S/HMbKQD+FY3gl69qchfxBy98LEsSOahyigMwoN90=
X-Gm-Gg: AYBFou3Vub0UrbM1Hvn+3tE2YCW4jS7lWq2FAn5GXVyxxFRGBjfrSObLRYIg3Mck1YN
	1GHCjHBty+K+FEbPBdoTMIf+l44tmudXnj0x+dxkheS6kKjxukiR+WUyozwZdGdXmYehS7Of90Z
	u5gWCwBeKEuUPFe3zcqRS/V+c19AJ3q8B2lBSuGfhi1xPzCmvpVSACQpgh36+ioxf3qo6O5s8HV
	wQ5BPxWin5Fp7PdNw73bM93TRCg6uDLdaZe4IkoIIX1LBTHsNispGxiRv7T4l7Ivi+GEExz0RcN
	i+ULT4ZIVdSQCiRvQoCbsUbUvP87KdrxorxLSZNDt3Zr6vnxGsOIryhFjkWRXR2NZARuSvJVF3y
	dYfAp/YMI4nRe5dQwBY2kxRMT6uuU1mwWy9UB
X-Received: by 2002:a17:90a:c105:b0:39e:27e:2f09 with SMTP id 98e67ed59e1d1-39e1e284ff2mr12769797a91.8.1789619883126;
        Wed, 16 Sep 2026 21:38:03 -0700 (PDT)
X-Received: by 2002:a17:90a:c105:b0:39e:27e:2f09 with SMTP id 98e67ed59e1d1-39e1e284ff2mr12769751a91.8.1789619882684;
        Wed, 16 Sep 2026 21:38:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:31 +0530
Subject: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=2379;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=fKWRyNcdRFNITSa44qZYedxjTCIbwxk6y6dHw5NYARA=;
 b=YxQWUHIo4h1Ru4RQSNZvHCSd0YTFU+F1PsqGLRnLkyNkdS3RzVJ8wh4/+Gw3XTPlbD3MfO4zB
 iNxleRF8mRFCZ9OeguyT3qUaDVI1xM2HBw8hnFQbhi7DJu/m0Y+GJls
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: VgQJr7aLQou10-ed6YMgaX5e-xH-PeJu
X-Proofpoint-ORIG-GUID: VgQJr7aLQou10-ed6YMgaX5e-xH-PeJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX63ySrhW/vay6
 uj+qGU2UjqbFU2cvpKSK738A3VMmEgVpcMkOzWLceCyfQJPkbFgocyb+FT30nqO0yE3zDo9/Za6
 whbRz56V0yJCx5GMVkNd0htY12G4mxkNUhg/OsmB9HsBiJcHLgVcL7XUfucP/kSD54uXIOL8+la
 1zsS3h3NF1AzzSDN7RJQRNFiXNaAAPIRVaxtit4h+HCzQdaJLRSbxxR4Sq2kYaP35om35KcIsA0
 A2Srb5/Zbq24owh09pvL/WE8UX8BKHBtx5FQZzgJZU2mXExyK3o1F3wQDLOrllQ4M1BROYzRQY6
 oCIuON/zi6QWUKEQCUKzi34aiVGfBYqtsnQwwXA5QPM/KHgdPUQy0NocDGUY9K4iz8wPEOVEP5Y
 U+fdLlY8R/aJAYFfJOeZYlWNcgZGj6PSSCzG/GcdatPrcYQWRc4YqhAIMKV1aVTFgQf5Na4Qrlw
 K1tTzw5cY26ROMQ55KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfXwO/oPvUEq00J
 vslQ84gumO//s1EUgcISyNJnv5u9iHFERaQqxKggMxoCuJclf1ubXjGTXJX7ZzcGOY5iraL1AxP
 qwMVjfAAOk3J86aPyO3Ue9FpZX/5hwM=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab6eac cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SNQ4sQprfOKLKwPE6BEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block. Keep the node disabled at SoC level; board dts files enable
and consume it in subsequent patches.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 999b478e1640..7633d274e090 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3595,6 +3596,40 @@ cti@9900000 {
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

