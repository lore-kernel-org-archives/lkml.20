Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736369;
	b=K/LU4qix0F7cJwudovNbLkkdm9qXGb8HiXprCJ083exltiaDe4YREPORN4e/uu4LvmAK
	 9eTbt820QbOSvogiM5tjoyn+bSVZ48GYS4NwJrxAAlY46gRbj6X1rdn+bfhsfXzyOaLF0
	 SWhHWXZGWdCKwOTgFf21thXs7AMcCIJUXpaXiZ6k4H8dfaFuD+IQRV7S2g4V5s72WMzf4
	 bTdkqAi+R5B9l1QcFphwtjjqOfUvYxmuoOb8X1qLBogw25zU9JgYXRPAQOyM1Z3anI+Pw
	 bDDAwuGo+EsmJjD09kf4J+QptQUGHwDgKwg5OXLZSVIhsb0avRbuSbbfLftFr3D8+ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
	b=WLLxl0197D2NaF7ptt0pBI/ICWCBtPvoms4tXgHhwGdjrb9ymoJ0W895J2xGebV3ES+5
	 3mrN0KNsBfrti1PNiAnjMy9wdJKah/lRRteUiq/B/bmgksIAoBoRAtUtjqTUgF2SN0Mk6
	 c8I+XGLVxysE3qWfQt/vwlhU4jn2qM50gYn6gZxcTP5Ksl87v89rLGn4C04pOLHbCxmKc
	 /cP4Ibmbv9eaLnyrJHYz5XutsuwdFj/Y2rGvaHnvio9VmigbYaQysoaeexpLT4lkGcFy4
	 cQWM12Nz6eEWCYITO/kZOmlDfXAYtokeUQmRz20NYFIokikKKHtNalGh9rncYLfzbmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U2aKDJM/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMcZTJK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A80606D802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A80606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2aKDJM/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMcZTJK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ6LB2586404
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 20:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=; b=U2aKDJM/FByQWv/E
	HGdwFgqZqf798U6llOgWXSbQmK9MOc1hvhqopSttSV/Ni8dJziFm/M9ZmgxkR83W
	U9ANharWH8qyu2sDTUC0nlT4wW3augtLPR9Pc7bp4fxT6jimVGTCTZWuo6C2BhAs
	tF+1QcXZgX45qBomUMvX8LD6LmoWQl/bqhwNoGQYJ2pm+osE/zpL6ek3s5jYM+Qv
	MvoLbShGaJyUl5flAjfosQ62kaYxX3ibNSXdVVUyPolIFWQ1Yg6V1uWWkfz+EbyL
	5pQFg3EWmEIhrCh951FK22+2m1CfSSRihFQakE15dP4uopD4C2jGt4Nazt/Kz9fq
	Fo/8/Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbrf7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:06:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc099197b9so3668927137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736367; x=1794341167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=fPMcZTJKcPnkoXrow7KT6/xhK/mg7kzYB73+7UeNHdPxKOZNYABUtm/KnIhz6UhwIv
         HyENFwIJEKQA7hnemgzEAvzDK63hRGpTpQUNCHpYpa2hw4p2LjeT3YVvhPcbPJW2mhSE
         YyZuU6yTz8PdWrkYf0fiVwZ3w+0X14DQU+jELOfjnkNIqRqMyk55dzz1LsvNgcPXoPYM
         /dBxMTWSfjSkvzbog7dHC+w2sJMzjy0fbXwepJmJ60AITjgYmHlDHGkZgWTUfqbI8ry5
         5Okz1SuZLOwaM+EbiNWWMJI9f+XzO2KFbHVu6wriT41IcvjYzaH3klZYZtcrEOppMB+3
         JHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736367; x=1794341167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=ataJnEmoyiY/C5QKMbf+sOuHUmHczGR9iESQ8oxUGeEHeUFxzFFKvCe0B5zT/vG1HJ
         /fzXLJBTizyGjcgzUxN6oWipLl6YMFVhjMv6x17jzF8fZ17fB7vNuvwuE1LJXauwzNba
         aPn4IiYkqOXgglcVf1nbDH22GCeSPzUvEKTVvGEeMa7XAKdI6JzwumveYnkgYBu2b9QX
         FbgRFeylrxzOdX3BB4hDGI7Xmi1RKGKzyLgOTvF9w4J4zDcDHmRVW7fN6UGa24jDPapJ
         JoQMg4q2ODAZsL6I5EnqyNA3oITxgSPLY3H/1VOBV+Cx4/zSTGqiDG1HIiyVPSyu/6kH
         af9g==
X-Forwarded-Encrypted: i=1; AKwUvBxWgm8TtlWaMmHRr6kUaUC1MCgM1BMyE5qNgzPM9X630HBsrBtvcxJNKfELrXkjbnfWkfqztGhwblHjp/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/qNBRImpGZ1vM1i1KDXmhVQZUsa1ZfkxBlsvk0QhtqaXbRAky
	Yu6PrIgfR54ph2vuKPtWBIFQIrDNcQ/pvrJvJ5mf+NiEAUs3Gwm3o17+vRcuilJw8RSJoO01eGy
	j5CCIU5g5JR8wZVickzhrXqCo8QxwfWLrGuxVKdChfY0JND0AKoOEpKvZfZjyOSMp5Bw=
X-Gm-Gg: AYBFou3qYo2rauhqWTarg3hSwXeGWTCcB1Cau2SbrDyKfQyDGUw54rIHSEVH+M2iL/w
	lZb1TssRsm4Okz9pX+5Tu27RaO+UKhK4U5s4VvOFai6Gud9AU1lSUw7/qL+WEgkF1lrwHTCUJlS
	XCwLBeKv3OR9VH1hh8KHcmkIhSkgcRBb3IjQ10Qh/NeTeYDGsW4FeDApIQWSbzWvQRKgR0Y+Itm
	S9uSl6HkEQH5M/Z48dDtlV7ROm5NNAFpdKp+BNmz/1UwZTAj1yVKWhBMy9OhAx8sndGINtQuFa1
	BD/H+MU/wpifueu7gLmNjCsg0du0pR4INo5xiKkc6G5rZV5M0w/mcc6tUhs/SHCeJGREjzOO/N4
	pMGp8/04kA4ixinmeUfuMwTrz/D7DR0KlrigMhlJYe5JwqBqCMALrjqvfOb5xbL6D1PqPbxMGiP
	Yws0gDiu/45IEN52pc4EjM2krJZptlilPOBZsCXpZq8s8otODBZnlk6EzdNMYlSjuGXrpAfNqHb
	tFgOHxBopnkEoFWYJyCPGvKi+Iq
X-Received: by 2002:a05:6102:2b85:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d0723d2480mr6172732137.0.1793736366937;
        Tue, 03 Nov 2026 12:06:06 -0800 (PST)
X-Received: by 2002:a05:6102:2b85:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d0723d2480mr6172709137.0.1793736366363;
        Tue, 03 Nov 2026 12:06:06 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:06:04 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:51 +0100
Subject: [PATCH v13 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261103-camss-isp-ope-v13-7-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
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
X-Proofpoint-GUID: IB9YpBUclz3vduXCUU7fNXlqCAvCjo66
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX7ekSByMwAEVG
 MS3JdBVNrc2yCMskEXkdvLo7h+sF2+IFCFWtFHSmJD9KzIPgVwQy7/vb0TEgv2MepvD6uvQttlV
 U6s+G3jBkl3uG/jWguFy5vwY/A8OqC7G7u/Q8/+5OtmoIfgk8VsHfSMbImFKoUwp5bCDJrq8hgY
 BNSLjQk/G6RzGxQ2GjP+JxMd0nKuh852U7Jqim/nwujum7Z3TEgfAE20d5O5Bh8ARdAXBHuVANX
 ht3rTkIPH1qKfsbNO29IjU7BSC37RApp/FXpzz+8RJvGXUUVYa8YWT6ltOlcV0T9jv4+VsOat/4
 M3Kb+VatlA7egt12eq3SzW1yzxJ3iFsgUBhg4oKlfyGvxheFoTRY6AsjTGpoFpKoi+7ZS/ry9Jq
 /+cSZlmZOR9dYBszcVSI1vJwuHpmhyEy+QblqkgzDRiPLd8+stGCLeZbEZq8xyhvNZGYmmG123b
 rq0QDJRemksjYzT8zDA==
X-Proofpoint-ORIG-GUID: IB9YpBUclz3vduXCUU7fNXlqCAvCjo66
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea3eaf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX9KqVnpO9e6PY
 CejfmoFrAlkMMCHLRNXFyJKdDkf9PNQ1ZPxZhsMgj/IcQjgcFLExUn4GB3erGu0q5TU5kL0DbeX
 AnChdjRuCm0KKZdR95Cuv542VY1hP9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

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

