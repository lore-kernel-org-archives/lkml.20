Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2B748AE28
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524514; cv=none; b=g810k2RZWLbMpR9wcHHnKFtmvNe90CKZvNPSmZQHzEOF3Xcjl2Gx6LlALfd3BB7vqfX/CYG8hqed4YKFBZWNNBtUdArWaVYVzlS/5igayTjVKxCAQ9A8HrDfBK9oqpeVhBAhmJNcPpFhtntuyc2G3KDoGLyPhwjZWYw/AhgtZ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524514; c=relaxed/simple;
	bh=hIxPycmGX2vGgE9VgrZCvRNvMDc/Ixyqt8HHUayCvn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nuESD0simeFOHn6JcIo86zySTy6MLeQt9Umlhd0Yf79bEFbNafitdNe2FrxdlJRXrRYt8828zUNNUrPnE+IszB7K/l8DPMLvsvBNl33DS58CJJUvkBhlNxrMPvKMg851M1fbaOriXKE3RVUNhM8kYCLdpwMhlzsNnuYEBzwwheY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBOlCc7X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXNxtwbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBOlCc7X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXNxtwbE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIZdl3783254
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 12:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GSZubuHyPhwG69Rkw5CPUhQSwtlA4imHtwTkLb0l3c=; b=LBOlCc7XB701Eecd
	tcLPCkodbvhl23gUWiENixYpWYHIyjrhIbEI4FvXwnvmjygGlX4qOa4viFLpip8F
	l/wXEYQLhivo2J7k/FOjvrSSbNJv9xJnB9F7m5ScRF7mWs8LIHAmC3kW94fMBgTo
	d2oGHW54vSZjziM0TM/ZkZfjmng/iFeCS5qE+WQfc6/suin1zzZNdPK4vKb0/OQ4
	GhVGOkDq1xweQ4iaeQvArrmIFMw6xR69xPK+7S6FmxzAv0scelzaPoWB346UXgfR
	R8UuJqjEEoXfum4GF0zyvpNqtzzIdoX6az9S6EVhDZpS8ZIvYiF59UwWSrlf6Wh6
	DyMAjQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfhc9tj41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:21:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78830f4bebaso128515137.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788524511; x=1789129311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GSZubuHyPhwG69Rkw5CPUhQSwtlA4imHtwTkLb0l3c=;
        b=XXNxtwbESnlQo7WXmEVo38EfusnhNmNWVrEpnyxjYCUKjhYG0zTzeCISX6BRWpATts
         YPl6aCqsJP0NMCJ3KeLcMxDJeDSFRV+9XkJ8yWLVijKRMQJ2rHG9TZYMhEKc+Q0NxnX7
         m12HIDEpvchKQP3S0y18KcksFHju5YPBEMiSaJtMXcxgLAyV8b/tEyQuMUgtQP1DdXyt
         K74FWmb255ioVl0ErHPMfN5YqZMlAOK0fchy/tWJy/WqqZS9APFC0PEXUC00dJQG8tuP
         AwHwDBvY+hVd963Fh+kvFIxC3zEazqL6x98qS2hfhJmuEynqlGbU1Ji8AX3WLl7IxTWN
         CD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524511; x=1789129311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GSZubuHyPhwG69Rkw5CPUhQSwtlA4imHtwTkLb0l3c=;
        b=pQqyGEWFptD9ceI1VLqVrU1zqlgpaCTkfcDNFapTOIjltCVWBarDQVq4VbdgPiw5A1
         vwsppGfUBwnHAl5GPMpejlyt/ocGFsFoCYK7oge5q3JSWXCuQGfYXEcf9+8dLod6g//N
         UsmQ2XIoIB48D+WjpDGdaPQuANk+t4APvNIQ+F30uW5M9nhvj051saHUj6KiL5WGW80L
         cKGl/AjUQxs7dMdx532dWN5aBh53uXhf6qLp3zMSiX2RsyEurjg3kmkALlF8p+jcPkDC
         6iy0Erlw0iaTEtnnJSytTxfPliRvyTkYET9Z5PbRvGQ2halN5jaYrG5PzboVlivc/OCP
         MakA==
X-Forwarded-Encrypted: i=1; AKwUvBxZHQxIefK4DChtXstlZHJlvRkhe7dfcKhaKqGCkFaK+DL5j4NgBE+wbyMROJVk5LaXYRxm0GuEnXz8Zhg=@vger.kernel.org
X-Gm-Message-State: AFuF++lvT5X92uogAZ60l5wnmlecQ4e90ZVsLvX0D3PM16gELOnjIMuh
	5p+rLCzugEv7LjjV+RraFSRIoutEMNSaqfpoNXfGbLMct/ctfuuCCfXYapLPngRxRENVBOkku72
	akg74nNglsnssesK0JyzBQht4ShX7avIgNDLnhOlxVDSZc2x1QynBWnwETWh8YRQeKG8=
X-Gm-Gg: AYBFou3hCqR+vTUUbaeIBEmHsvG/vdjE77g4a8rNpAhurNGH20xcuI4zNGmfp0kryzJ
	O/AwzAHPftgvRbCxlD3Af/xZqpCmgG/Gjd+BcZiTXlbE1enzqei62KUNYaW63isDqtMNhV/VSgt
	dRat94Uj2T5HB1I8SB2yqDFP/2dQNDbwceTwQRhlQg97Zhvb6xfbuvBf0YtLT33zLsSRr+5YksK
	hC0q7WeuuAP7CTzMhD5LRANLSnhuPRP3Q6qB+s4EohJhDoS/51+3mc1/dI7RXFQZwykCj0F5XsT
	hnTxAhArY3xdTYQZnuBqWbl9ZDqE8HinaAqmcN4tJbkfLkAjq51BfFh7/uVIelQV0l2+fbUs7Qu
	KjVLXKA==
X-Received: by 2002:a05:6102:e0c:b0:778:721:53db with SMTP id ada2fe7eead31-78a4a4ca11amr1356064137.0.1788524511078;
        Fri, 04 Sep 2026 05:21:51 -0700 (PDT)
X-Received: by 2002:a05:6102:e0c:b0:778:721:53db with SMTP id ada2fe7eead31-78a4a4ca11amr1356031137.0.1788524510494;
        Fri, 04 Sep 2026 05:21:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm195686665e9.1.2026.09.04.05.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 15:21:40 +0300
Subject: [PATCH v6 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-dts-qcom-eliza-add-cdsp-v6-1-d4f38936902e@oss.qualcomm.com>
References: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
In-Reply-To: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=hIxPycmGX2vGgE9VgrZCvRNvMDc/Ixyqt8HHUayCvn0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmrfXiHay0y1kHiE2i/u8T8XGM074P0F7PqWHI
 yfsF3EqbsKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapq31wAKCRAbX0TJAJUV
 VsfuEADKIVpaofz/xi+w5xWqniLiXCSmVT4SE7vCdAGnUeAlf7BL5LDSeeR88SEAM8mYlVNtl0A
 ABUHRfvP+8RcZTr3HtDzIQaQgqsCDP5Y2xMKRqxFXOBn/g+EQJbqPwNYUT7VUlUBT+kn0bx06cB
 M3cfKHWLndNedCfhTK6lHvf5GBXAOx1J8GMMvCLEFsNTy2cPT82WZ8JoJMz0NtC3N5To021XRx6
 aROG8mMpESylMDgFkFaMtYTWMQqjAPZRa/WJ6DMGqH99u6+hag9MPNy4tXqAyrGG81Jc0oXNI9N
 CMD7QaRiaZiyKTY7jRBDA9V1N5Yygb3w81jcyVZFnH8VlJU0Xn7D9ky9AKTyBt06fr8Hs36j1xP
 VlrpuxvtBpPuEceFFPAQaLh0SdrnsnS8vhhRKvuOtmn7mQ4SSDGLh/S4EZrp7C38lF+ES3xIBDo
 tS1oBx8e/AUuSI9Ohp2muCwF+EfQ9JXoQn57Spy5I7hnLlC0Fl81sfCMhmfNvgj/29t5SROoxic
 cWq9jD2jTdnSxcyHmfSmQunjSGMXF6U1ZOmTbAZ/w3Xfxu095SApauveNV+EcZel0Cf1gHYlgUZ
 0KqyOZ+YuRWJyPesblqPVpalkVLYT3muxZBj3PG1wQVLXu8bCpZVapl0edHubXH7/opWsclDo3w
 3OepKf/AIAz6FRQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=afdRWxot c=1 sm=1 tr=0 ts=6a9ab7df cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2GlqV2yqP6Fn-iQxV0EA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX13Cc5X1mxPJu
 dqJ727KfSyqxHfVYKYYLH3ebcyzX0TeIEznw0RWyPdZ/eSnwhNrw39inW1yeA+0eJbuD+QDf5s8
 V9vjkrfTqsSavC35Morfp34P9lRV5gJeXVqplFNCioNOA25e/+QyYwBX00DGAkW8CeeQ5GLdboI
 gh3WuyZK7gTQ3yFN110lYg4yG09JDg6fauiil5yJZoKhApICFzaKEPrnKbQPBN1bxm1FE42vU/+
 JYaXXHgs1oVt8g9kgV5mPrwx0VcJ3CMIPsRnlMQoxiQuKK3IEWk6zbJ/y7HbRhGTqfYfDyN/fb9
 lRBmkXDSDMSpezgUaLs5GAh1v7l96M02lYWP1obN81/vNoazLiQ67nYkPQLvaITH3nQhLrguNRn
 anVtmW9yG8KnVjcDnHfUVX60YLB5N9DyiWDbCRB4I0zCzN1Fqes3xhmHES3NxW0fvVlYyyZyrGC
 wwnjYB/5nYlUPXHmuCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX9OIyIAMFBAZ3
 3aOCBpAYqUXMz8BO3OwzsN0h0BohQTfmbf0ToHwm+1CITu3abZ5LJDeiBHmToKKA5fP0106RnA1
 5do+eiJtVim9pm0KdARWwtA2ixHlGFU=
X-Proofpoint-ORIG-GUID: f_QMy42M2KDWRqOLadIcWv3wsF1k058y
X-Proofpoint-GUID: f_QMy42M2KDWRqOLadIcWv3wsF1k058y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040111

Describe the CDSP remoteproc along with the glink-edge subnode and the
related SMP2P. FastRPC subnode will be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a84db7c80b26..f71e391a29de 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -641,6 +641,30 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -4499,6 +4523,57 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,eliza-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mx",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43020100", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,

-- 
2.54.0

