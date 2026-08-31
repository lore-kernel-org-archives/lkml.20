Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459C5391829
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195444; cv=none; b=M4OxXjCWKet3ndsc0K4yFznaHcheR32A/XNe1vjCJOufEX8KHXvPE4SmHxtP4o8eYXp9nPfG788+dixikr5NfT8P5aeTJLz3BgUImvE5UJp+TmR6UJQ4RUku11ZA/5Dq5YwphYvU/nz/vTD97ru/HkZbzY1cs6Nuy29RLIgvaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195444; c=relaxed/simple;
	bh=gBWoRCWmc3NVqJdziYQIe284NuCXpbfFOVvQjjM+Egc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQnE6/hdv7rVuiQq/VsksJkhMfclMLKWSsJ0mbniIH3ASXfpZVg2NHdtgNGl8w0v6xK96xUuqaCvCZDjuYbj9SRk71OQZMjpok//ElHdoqTNKxJiuXEntR+tJjYFZ83fiveC7/JnstzsR61NF7W+yS/rr5xBR+MXf65YHE6OgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsPAo+Nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxlCYTC3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsPAo+Nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxlCYTC3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpZK7037016
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCEt4VezC4Mrr5q4zAeSzdrkdi7o3q+oyX2WYTTsB8Y=; b=bsPAo+NcDSuRRYEN
	XSbd5FNMoruUvSsf1UvIY/QD6tzWeVhu1mmfKiPjrXk51dpiW8wXIHzcwfgZRWCh
	w6fM83JlErwwPQgIh4smbiYbHPwbcULJfYAIqdWDE+n7uD8ToufcO1F+pFjU4CRd
	yOA/eJniq20OUXObygHzaRUKR/WfW9jp0XnUB1l3wqoxrrXltt6tXCrtuK54awDQ
	DkTL2TFQEFhsKXIXq6btv3qrFwyopyz3hl9Nxpe6tfbK7bK1evp/dybuF1F9BvGB
	bke/8k2VPuPLXy3Eob4pHzw84XTKEDbtj4N2JOmTg4LH+yXZjy7i1eE0VxzUJfVk
	qbpb0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgj2e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:57:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so449447285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788195441; x=1788800241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCEt4VezC4Mrr5q4zAeSzdrkdi7o3q+oyX2WYTTsB8Y=;
        b=RxlCYTC3fhTjKvWCp+xY5IwtrVtf5Ss1nJuJxz7FF99MR1FuagAPKlxGHrRABWR53D
         raRHIZloJn2uUj/7DDgJzMYSJQIlNLnauAhGJaPNURT1R1E403cVo0iHItQffXozheGd
         QN8/PGN+BknXJfkpK7wHvWeipcuZbccFibXbUsNiNBN+6U7P7dqJwVRmjrdm8Oa6zs8q
         OtaiYKLXnLqtGXdd+bLPGSUPRritHNrKdEWO/SAgTi9Y8QD7Emti9g901u8N8cNbWG4J
         AtxP5f6HSAgnqePgaHWBs6/G6wKHKPsPCGcRejMWvStebysQxCo9SLh+D54LHrNCNP5b
         /i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195441; x=1788800241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCEt4VezC4Mrr5q4zAeSzdrkdi7o3q+oyX2WYTTsB8Y=;
        b=bfHpkfaZwQWmp5F6JPuclecKCuBv5GK8acMNaCcq5c1Y7ClV5OAdNfKePQn+mHCBk0
         YXJHoGK3z4Lr3kXh9m2yjnaUlZONxt8iro8zFLraVuPAyjTUpqK/cbilp57XykRnjd7D
         xDx408SVcBrWpIdxsNBtNbUTNfx+soHw6J3mlFUGi/wobXmcdTMY5ff9hAreDyS0NV7u
         E78biHhpSKvn5OQIeD2Xd21Hzr5QS0PKj5vWoJxg3wAYLjQm/amcr1jcvM7yRZcfsnKD
         bNywDlARWfBM9ew2xf0/Fkwbm/bjdyZkaS96QB548PwmGyW3u/pFrpdNoaFlRv6wMbuV
         kSEw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8JDoDw/RNRT0DOH0AHNS3whu1Pk0ylgTtpaSUYZYWciCnRbVB+3MwRUKWvIPl5qKPw6Ro5+huLL0kcM8=@vger.kernel.org
X-Gm-Message-State: AFuF++m5WiB2g/aEIyryvA/o29jmLcQqhOX4oavjs1hn6bP0cb75sWRI
	JEMKQTYCXOVTbcYDsL1gMSBd8pIEviQJdQR2JnEjWphAxneRInOkKJzfJP2AihHYoBdHBH0v8vC
	bSj5r7P4QBPCz/XNTMYvDiTJnPcVRJINbd2aF5RwCv1icYw91Eh6fW7kXc781Ua9bo50=
X-Gm-Gg: AR+sD10ePNLVuCxgo88wKKSKLjoA38GTkmVM2+vvoOOPdlBzhhy/VOQDCMXkKCDV3y1
	0gcGax00KwejIEM2S3wOsYw+YddLLcXnm4DEnGKHw09SmOGNfZLfIbFqdJ4GOrLGPCU95JW5v3o
	foUv6Jg1nNYoA44SHD4RhNOcZ2YF6/pNTq5lS6IvqojK3d7NkWVcMlFtxj+h+4bkdSs9ShxVcQ0
	R/b2q8CQOe5z2iN4U6koOWUPlj7LjVSvpt4XWNmnyT9F4J3MFTlrXns88WVyHMUJPlV/92hASx3
	/HSTHfylvTWPBdkRYenHUnxtdKwDBToLXAAFqDN7ivakQ/DmpGyahGBrnR2ocJrdu6a17wvTYjy
	69t8JeQ==
X-Received: by 2002:a05:620a:1a16:b0:939:46d7:4b4e with SMTP id af79cd13be357-93947f8ef62mr336392985a.7.1788195441250;
        Mon, 31 Aug 2026 09:57:21 -0700 (PDT)
X-Received: by 2002:a05:620a:1a16:b0:939:46d7:4b4e with SMTP id af79cd13be357-93947f8ef62mr336386685a.7.1788195440641;
        Mon, 31 Aug 2026 09:57:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm248426785e9.1.2026.08.31.09.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:57:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 19:57:11 +0300
Subject: [PATCH v5 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-eliza-add-cdsp-v5-1-dda8af2d2920@oss.qualcomm.com>
References: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gBWoRCWmc3NVqJdziYQIe284NuCXpbfFOVvQjjM+Egc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlbJqx5+tT+/GvNgkkR0BSGbzPUY8tqFDL97uK
 xeOAjsNl86JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapWyagAKCRAbX0TJAJUV
 VnmyD/9jLIAAWa5IkiNXWwMS3JrjUznKe6tKlL36QtTVddayUzDBqvD3CjaK4zl7axJK+6DJdRj
 DHUQQl5bz/GvSSDwcaYSJ+ayPEDy/QHBL106eOD3taruI4RQ4wEEyjLHKn8Q1iXL10Mq3hdIVoA
 KAnL4xMOlDyxMIitkPDz+w21eAo80XUKo85/cVI2qoMQzJCw4IJq0gCFSJBPmdiViT9afqZtDXg
 fu+ENhcHHgV9vPRdgnb/1L9mToIRUQ4q72fpGEdgGR8moROMEdxeiJrtPk5v6a6rMpdBjFkbSTR
 GwIgt2Wc8piFW5djwaCo/6/nwyHccaFgYZ9bSmMJF0rxVuMdo9t0KCAvFjPSL+t0mg0KbLyC9jz
 i/CpGjDGPIqEOG5hAbWQXJfMxUTbv6lIrzJlWlbRZJ7Wdl4TJl4rvJq9ls1BMLiOVvJzodI4TDG
 MhqwdP4Gl2X1qi0Cs7YN23BFEJdhYnAL35VU1bNXAVEWnleoFob2ErCGfZ8Y0UTvh+tSPKWppfm
 2R0bwwWrima3vDDZPXl8mErL2JD05zh0G9ybP42RjzXThqb9dh6o7kqtHpri1fb3Id/mo7AukgG
 5OMI8TfH3QKbrlKNHdWgA1oJJT3sfiob7BkIeiHIhhdYzxdiXUbHf/zffTqBdORNYBGr3XM+umr
 xFN56RxG8ijMnqg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: -XTqOAV3FbWDnCMctkHh_FmhPKrYwPJq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfX2VgIlaUP8gPi
 NPH+BkGyrQVcPPcU3PpCdSJLZ/ZkMqZONkaDhRvf9ChBhi+K96yNCGMBYSvGzguan+tdRtLrrdu
 kShgb9uj8y74EFM3QCDlMppxAYI8W4Q=
X-Proofpoint-ORIG-GUID: -XTqOAV3FbWDnCMctkHh_FmhPKrYwPJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfXwgffV6nL6Qq4
 VhpDjnQsWxhCUu+ICZA3nI+SrL4yjCVq112cxwHFxAHGrCARZg26j/1kJuSyFuIYIii38QEhSDF
 lWtTRMuhFkItoIOB+EuNCYMATPjRtJd1vF0iFq1nDb+ZQRZbNDXIt6OhwLhSxvIx3PaU6Gma2o7
 4FQvU93d5ZzUSgVzNT/gOfHHem/Uk28UckO0uCCvo8n7E7INHLA+0mq1XhYxwNrp6GkEAuOEqA3
 rAH82lsKNB4yXbXsanKkzh/RvWG/kZEawR+St6xRIaNeH1r3bnwG9GTQHspROx2Dxk3i2Bko8ZX
 V/dCgSOxFv7MjxP822M67zbq6f5tsEpgluJ9cbjElYudZYdCxNk8Xm7O2sdEtbvsW59a3J9MkJL
 RYcjW937bpqc7G+UUnDi61zLA1j6ggQupa0QoHI+YBznIb30YaSgmV84R4FumJTb+o0+iqyBQ7I
 GJsy4xAs38rIGcTym8w==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a95b272 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2GlqV2yqP6Fn-iQxV0EA:9 a=fTrgFlXldL-EUvLj:21
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310146

Describe the CDSP remoteproc along with the glink-edge subnode and the
related SMP2P. FastRPC subnode will be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..1585f13cdcfe 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -636,6 +636,30 @@ smp2p_adsp_in: slave-kernel {
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
 
@@ -3975,6 +3999,57 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
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
 	};
 
 	thermal-zones {

-- 
2.54.0

