Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE471457E67
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459882; cv=none; b=aNHSa/BUh6ayulq4IftVU9h1g5UMpoMRsaX27arw3WQuUk4gH3tKaSUhX8FOOcBTY4oxTqxktmGqnPzF8JP2nXIITZ5aBzIzELDy2kMwfMqInxdrRDmHee/A1Tucc8C4RPRTeaWevsh5SVqt+Uak2nMYec86wuDIisg+N4B5wpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459882; c=relaxed/simple;
	bh=HmeR1l9JD8JvYgGsyzO5QvZGodxO5bhsmjCW69cOhmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahoLJNIyjeYAWuh4XbReuM8a76rCrW7jxt4ima22gaPzMdOUN+Csf6KnQsBlI2/Zi81fcOrm4/Pnv45u8akeB7Zkd41JKNXqjSF2BJ/XbkbJOuA/ugBbVDHYaYkxHROVMqkKWPycqYwmZe5dcFprqD45cxI7h8bq1R5r7wD09Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIi36j+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiOxeSKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIi36j+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiOxeSKb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Yrhg4048580
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=; b=aIi36j+st9gZVvrb
	ErRGyNU2eK7VVNcvwRmJfRH3OVuvPJBZSAkW0D6VKkHd/VLe4cVXZ62PoK5j+qQi
	p6jIe82LCC4eXs9e8GHxFwrW6RMos5MaQPCst/4Jy3grSoV84Ha9rgWrr1Llk5a/
	Eoq1ckVcKvoXat70WJNoOYz5EbUUg8hVDKMP/baeeCeI3R5hksYOIf8jg7xmfTPj
	+KcjWcetp2ZJKR3lOe6d52h0V4mE6S1f89AI25CWOgYqViIjBxm47zuXztapeQ84
	S0iqQth2ogLPEimVfGHNZi8jJkyzwfjbRQauEC5eLOJ4p8PeMdilgYRnpLa244pX
	lbm7Ig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea0rja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so6306985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459878; x=1790064678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=GiOxeSKbpiAkbTZw5QLwKb95ImXSD55kWeWjqydT4ck2KPt91QmgxSM3FZyeeeBe+E
         TmaXLDdOVAjLLcUzk24C9+QqnR4L0Lhh8iFIEHHV2b+VqSWyQA6U8rvmlKNH1yfg0XB7
         n6d6LfeI7K5AXhG7xNTnzr2Mpj1CxSz47BT1xHSuF1l0hsq2WrzvNXYZ8+JOyYhu/JXe
         RuKZu+JbfGle7XwxysLai34X/6BSs6fl/xh5HYc/5gnUD7W4jCfKzkU2DLsOJ6nCi+NG
         haGWmeQ0cZLk9UYkZPUuS1J5IL+epPmBnQFlIFD8k/fb8AwgusD7O1xmgUdDOWIks983
         VrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459878; x=1790064678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=qg84jGTjJn0vWoM9+HeI2RrT1lvx0zjc3qQQ2XBPGU4YYkTBJksLvFARdFSrRPvSTQ
         WqG4ZnqoJHKs/B3MoX7Blxtura6ZgTaTAhpixvZ7zaaOAJ1gBgBQ4Q5L1XOFXl2c+CT6
         kYiV2vfdL2T4veHg4EhwSFv2dDIuDZVdvlJN+3HJiDMh6H5zdZ0Gs1PhiVlIbzsIZf4d
         0Lqre/chyg8aArW8lWPq/MiU2zWikchuwpwQQrRKxdqP8go6Y9+ATFe1hGZum5zSSFpu
         PrF2/Fpt/wHH+mCfqCX2L+rZOJjq6739tB9wrHz7PjwgzEghbasIud4k48Q6JZxZQcQt
         jsyw==
X-Forwarded-Encrypted: i=1; AKwUvBwK10g0sRpYeIGW/X3rNS2nutQBUeGeeNdyQjx0RERfEKDVGMkd2QtpZkOAaLXSoH4y0EU+Ol38rW0htTY=@vger.kernel.org
X-Gm-Message-State: AFuF++lqZAOiD1WbFXjskaagSVdEn+8W017xUo7yUBi84zXVsFzGKFCZ
	OV6dTVyhf2mMhk0QFkawgK9lLHAy+6lNnlvE//eH90KIF4iQcQ20oo/WKMQSlUa2TzhOGHaUQFS
	7xBhDRA4a7nc48AMAHb/C7CMI26z1n7PXAHykGCEnnBlwvSEah9Cjyz2apGTFjPVfnYx2gDq3sU
	QlYg==
X-Gm-Gg: AYBFou2kh5ZL/XQie0p39ildsp8FvHFixiKho8Ci8xqXGNVo9Sder4NErx0UJGZstKa
	0dRemVy18uikod3GxVaFUbkUzeveKfCUCIOcpfZKqdInWQB7xrrOOmgplqgV8UD253d9bN1zx2W
	/uBgaZsGRHetAgaEsm3rizGKFBArGpzkbx5RMXuhNbEUfoRuBKDdt4cBqkoMR1TT4tswCdpimPC
	rggirpWU/lTYJg0p6xr3N8n9c1SwD17QN1dEW+GS5NtEnxaOgIVrN3cqCYgE/GiCFDSIi6xnk+h
	XR0ATJ7GoOFMz3bLMd2BkXj5zfuLEbEW6cSwO1WlJTVtvj/+JvSxXMQPhdrtxq8ky/oRK7paL7C
	Md8hW715ws5l9CPAsXYaPNQba5lCB+N0QZtjrZSoaazpeEwIsgUarqU9pBg8IhzKo+UUl+pH8sC
	qVhGYLXvotGuJ8fij+Bvn2csFjzWvru5cVWa70hDuTktd/HkGzLIE=
X-Received: by 2002:a05:620a:31a8:b0:939:e650:c80 with SMTP id af79cd13be357-93a29a9483emr898345385a.39.1789459877699;
        Tue, 15 Sep 2026 01:11:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:939:e650:c80 with SMTP id af79cd13be357-93a29a9483emr898340385a.39.1789459877157;
        Tue, 15 Sep 2026 01:11:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:10 +0200
Subject: [PATCH v7 7/9] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-7-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: _TjSOMdy1FMz3m4Ra9RV2xeedt5bYxPL
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa8fda6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _TjSOMdy1FMz3m4Ra9RV2xeedt5bYxPL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXwiqV22chqDG3
 CTUO4hTTWer/tM4G/+omqApVaPWNcfToht9eTbKFZGGtsfeRNCcGrzFsCAej+ruLfy4ZVTaR6KU
 ucTCwQ5t+Z26YaIKUwCkTTggQEz2kQs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX0NmgQJDs9aK9
 bx1VuHkYlvgfkkXAhls/aYFY4RPoS09LLDwBoRgDPm/8J0tkvTTlbahmDRNXMSZmZfmDfLu2hJq
 3QvFmypdkOgXeQE8bMthXOQqVoXd4NHFNhx2K3I54uTGse1MIT83msiiI7IOmvQNj2e+lBZCErm
 TWcoMGz9H5F7QLymCUmjmkefr6yl6JCqzD7kz4UMR2KD/D76RH5pc3B1D6XRMxH310RN2vnnp1h
 tlIQ47UmeSrkI7YrYG8Kc9/aUqBw7CK9Tc7tkylmM7mdwrH0/6Sli1jXV40KCyEwowWZSwFhF8N
 ooXx326nmcF3y530+h5DYuuRPUTAKJCzDb8p4PK/HfnvBH+Gf6SxjzbFBf638gTr9YyGL9tbX9j
 kcW3CX47n8bGGtLlRZkHWSCYlZWy1R4yEnuUBQtrimiVlwhBRb+KzJt+eYYJLOQ5tzJ2fp/Yw0d
 t80JhSa8l1Z+ujRFB5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions (cdm, top, qos, pipeline, bus_read, bus_write), clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..7746c58b5b1cb25206e72b888b7559cfe27553b9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,83 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

