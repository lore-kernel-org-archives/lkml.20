Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973349;
	b=YSl5aXy3UTY9Iw5p7ELhlKDioHkdSHb6svSjxGHWQuVmlzZJjYRLJMPqsuB1HhOmWHym
	 zzBopaWZYKC++e9bIV7QmSSbTDZ+RCuaaT5XpwJ2MA05ff19rIJ3NdAhiqqFQNpE1NAUv
	 fp7ZRNRxPBICdUSqbMaYCaU1YjbQt5cN8/9RstYCKFvlXkpCKhKkJuPfcE9rjgVfCwrNY
	 gv8fgqSoGHp8QGiEoZOnnL1y9mRiwZj5bKtVfOvx6Qh31s3Cc6k1GzZS1QUm7hdthZQfi
	 FOhz9QbHY7f2xVYkIXDUr5C+U8qWeCS1xGC2fPH4ICL2RAc3l0tpJoPuD6FLXP0iMbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
	b=0P2Gb4JdXGgM2nDurD9HE2BLZMMgmCCn9s4ygVVNBsWZ0+sHEci1Vcm3KpE9JCC0758h
	 AIwE5dnVW9MIFDiAyLifirgHnvU/s+05JF3smaqjrGQv1OJ0UsYZH9ojVKrlSQAMnb8LI
	 44OUVikX8IDE7qoi3XQPSpz5eKxq8bR7ge6uYDg7Gvmkkw+GEHPslRoGSZBsdodQ82JuA
	 ce+K+kt27sOGxNszmQG4Yiqd1YtKEp93moHSFKbNwoLLF0Wj9U9y4y6+Iw90oma3fluUL
	 dcEhoUIDfNtixfR1bbNlmflwasMiZSFGGGzZkoU4W8Ddl39SIXTcqcoE9+pXzehBdxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxn+JniY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV0rs5ID;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ADC606D82A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47ADC606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxn+JniY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV0rs5ID
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoTi9887727
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=; b=jxn+JniYsCFj/stj
	xvpwoWFejI+khyaQAgnagsSgozbS5/h+auWYJnowJ+fdG6dAiTBwal1ofcS2T2GY
	jS0dimesCc4n4jd9/FaiknhQHNPTVkxiB2yN0iCdIgzBrCj9/AqO90VntzO6yzaz
	LaIdPMmDdBTrCQCFIRq5EStU0xISBiQXSCZTGGKMA7NR+akVt4ceP5zaosWEJb1u
	+tpR4xz2r52PeUATkkvI98LyP8kYifR4eWVU9KhN85EKiQzvIyY0IXjlqljttF1u
	zMZUtGSFzqN6rW2PzcVgtZUGtdXUHcGltgDDqhV/+SQ5fLtHcRWHwGlgYdOIl8/6
	P6CXCA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u2rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:55:48 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-998de183a74so35769241.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973348; x=1794578148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=gV0rs5IDq01G2Doh5Xat4k5dbAE3lDAi/ifbWFOSAY89u1OJk5kPb+iMYkzPncisl7
         grAQIfuDZpScOYqmzTfkRLfci1dc1kYRtfkHFMmEVUkIgGOs9gD3iiaSiTTGchnv3DIA
         ZwTrntWognJ6O17mJBNaw7RFO8CGUrf/WwL+L7chqwAroutnGoHOkd5wghXBFarz7ahe
         FjNJtHipXLuE1qewmKvXvx742lH/80baixYNX+iufaRz/+NOU/H4sqPXVkLHVVGeOR5u
         gzjhu3vy5Q4sq3L3FBKTjS/bYAH5y/nT+VG0Xv20hyZpBZWgDZLLQ+gKta9/oxATP3s2
         0GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973348; x=1794578148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=ApCfcxnP9p4GoKKb0OYjLKRu8jEXeGBOMEF72mF2jnQ4o14+xQRdLn3SHdJ/Ngbb70
         +u2lezGanbinCIqHsBINE+8gdyww6wgOpMNj19Rz2tzcwgDqtNn3AIjakfkcWfkEVh/7
         LS0JK9JWY0LLdyq3cEYDFheBhdC5DwDmGeV8N1p0OARUjVG6JmGGqkvTJza0i7JHw7Qj
         dSaq+1qHJr84vq1s/UVozHIUlrlzGyRn/U+Jk95zjLEDC1ZTwq09VHfOd9Wozi+KZgNK
         I+ed1xIDt0PUQneai5ifxgPLRK6Xg2VwylX8CriTm0LTgTZgvKFil49e189iAW4KsA0W
         QUPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsO76kqIKy7jL44p3uV85CpQR7+HIMs0e8YrlxK/5fYiUde+RIf6ILZtJkyemqBsTxpDK+mhUTMtLG5po=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c5MRGd1OIh6MVs4BHOr4e6+llc79nRSYBf725yWhz+lfuBAJ3
	QgAm30oWuaWGxxWNJkNjVV4otDMhUv3FKwpquO8zQe+qZPxxvAbMnm9x7IpWZCPM9qsDNbFtyjr
	NkcLyvvQ09PKD7R+Gedo3qposir/GeqtDFj5H7GJfWPGj+7Kf57SzcHqn15iLm2n85/s=
X-Gm-Gg: AYBFou2raqhQODzMEMuT+EGlK3FGr+A/Bpld22t1DSbEoerl0tdgEL/NwInGDl4c4Q/
	EUgQpRbXua0r2yM0/cWsfUFaOHXqQ/Y2RhpgDNf1GlaMoWIqzycN7xhV+51qW4l1ghojMfr9dvy
	4OLWGp9xZTvtEkMv112It9H8a0CRzgr61ShnFat6PeM6PhbRThQUoVqOuglqtPWVQoVDfOCpBt+
	JZ6MknOBrTN4Fnb2N9c4LzcalI0WYp0a5nIsneAnajasnK5ftQMeGyGwZJx3aKTI8t4Mx2u/WRQ
	KR4lG+I5E6xe/G6K6KTeA70iHJjgFQoVNKQQgIzr7Ir4YqW4qgoNWOKhCzuddC7mqyeg5bncjAq
	YPRLM60GmAzfKYQ7PGpeecvHl+43FcGIhzJdPCQG+bfEMQUJEV9u4V/qf51tIAM8st5juaqJ9no
	gh7SV8gO5DZgm2rJ1O30Uhf2ee8TQ8VTs+hzuwxLC/Km18hSBm7Cwjso2QOPURDghG6n7hdncGu
	QBK/OC3Z8M46Mp82C5bDXDzcY90
X-Received: by 2002:a05:6102:3346:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d2a15c63d5mr1179456137.19.1793973347631;
        Fri, 06 Nov 2026 05:55:47 -0800 (PST)
X-Received: by 2002:a05:6102:3346:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d2a15c63d5mr1179438137.19.1793973347028;
        Fri, 06 Nov 2026 05:55:47 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:45 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:23 +0100
Subject: [PATCH v14 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261106-camss-isp-ope-v14-7-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX/jOafErGyn6i
 By6uJ1AiqjtUgvvtbm4Yb/ZadHkRW89yMvV2bkPhAEinLUMfc0uZa/fjhafVaqfrmS7jcWp3lPv
 EFX+gUaTkLPJud5mUyb0qqO5AV4nAOI=
X-Proofpoint-GUID: 4a4cQ4rmtjVNvknOIeW8RkndrxAR_mKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX6FugtaxA9qY1
 MICs24rDTbe3UcIrZcRKeOmDicnHOmFZAkDVvYsZRrtRqnU+gEk6rXJBzsSEuc2MYQihIGB7Gnc
 jOh08GfWPvhpucB5G/D2bcTUp9B2CIRZg6AwmPYL9FKyPVZgVH1ISPxb3zW0T8dtbn34fgtMiEO
 vS0FaY6xE666vFrVk6gOIlcjUzZ7eSUhl5USSK7seJr4cE55VPYYRmq7PZD6Dcx4vnivvbbJt/o
 LlGhC/+UxKVVzO73YnWD5dKTgrRv2/srg+U8LPBOHi/XJeYGKyyPWnuYE2Ln5GwtTNJZ5w21LXA
 qUELJUbUOXyh7BJiNd5TSQbOBFrBYyB4OLiG2WuYowhgzwYzqEWE3PTnT7aMdVfFfqnUIboJrN5
 NpLq5+rlFBrdMzWdJNEicBt1fSqn3LT2vhkCNFkRQGo3C18rWv3RMLElqGtrN+P8lLCgpkMG6D4
 09iON7cFiMiHRk/ia9w==
X-Proofpoint-ORIG-GUID: 4a4cQ4rmtjVNvknOIeW8RkndrxAR_mKD
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aeddc64 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

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
index 32d185d0526ffe109d83fe92d9c54f21bedbbcfd..dacb551fef530b73ca5265eb6aca39b807e82382 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2026,6 +2026,83 @@ port@1 {
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

