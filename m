Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973354;
	b=YjZ8MneEkYymBRZ+u9VwH5g1auwIj5swh0Ybsy+BfWCb2eJ1nUBW0vwlB7a1A5AtOPFQ
	 pBOy69gHysabUkVubtRTEGaQ6DlJN9qoY6W4pp1WWMBfwXFCPOTT3Q+oJeGiNcYqTr4nE
	 PVz5G0T+Xkj2AMsOo+t/uTPopZR8kUHaFDF49nHdbm9I75eKwrcKyJzAzEniKeFz9T6V6
	 CEC2Zplnu5OCQb/KrrsBzY5SqRk+QFU+mTIM45c+azIXsI2zfI7GXWa/WiaVrX4bLUkmM
	 4onJ8E7C2VCf7KfOSHYMzdMHp85JfMMRf7jS+x6fnrWZaKjSUfzn+QUux/dAXrs/Amw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
	b=Bse287qKiPMzk6IyinI37vJD4URpPLVhyoU2/00vyZHMYHhAjlgTTNZnpTjkqyRPfi1y
	 JI73sytxchFsfPC0FgUEi/N9RZ+G//zMcW8suvc4da8qciBYSF+mEF1cXydz5G+NsJrwR
	 QxjtK511xCxVdq75hXSv2mrFMmX1ICagK8UltZNsQ6LfzDBBtubH1Nzwl+nJPXdlKVruY
	 bpRHZpU2cMLlEjDK8zJj0ZiP7xovquqY7HRIlMvtkg2h7NQJvHxRy+PKahn/podI/57Qs
	 +O38QZduP5GeGux/ri+vPsICO8HwatKQaevvDpjazr3derrC+uFdqDhIp1xnpUMvyDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyvZCes6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bya0wzpK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA256083604
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA256083604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyvZCes6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bya0wzpK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoCOJ971181
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=; b=dyvZCes6NiGDy9LV
	nUkUVCjJMmXfm323NRoS1JsUVpuUzvl9IIm9NBvE8Hiz8T5hMLIfx5h/xxxg7Q0R
	pY2BwAAhJiN48FdCL8uA9uLulO22LtIkJol+K8HgXsIhmimsFKfUtdsoMCx4TapB
	/YPhMV0I4poiY5Q6eon8Oy8GEhwUoAqvROaaEiavncEeVdn0peOD4XevxC+WUpEs
	08ikHwCorLjGCa6Geltc30VsuA0MLAv7mZmD7nqXjmcRlbbC8yNt2u2WYJVwtLNm
	Cea9hRIJNWnegv78qXy13PyjUtzWkRXR8OeYeOs9Var6JVqvjvOnmV4wsD74/VAY
	FxgVmg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u12g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:55:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc4149b885so580539137.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973353; x=1794578153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=Bya0wzpKbjPI4Jgj/mA4MdsxvNQSLMPoN/y0HUEsm7etdHwmm82oIrqtzXJdkmNs76
         rbUjCCHwBnRBKLJca45tci/2OXGnSKvoRow7c3TdQ2s/LAXHhW5tdfYIkhXW6tdnZsKW
         q/9DbaYlX5YFnCD3NQ63zQPJuxVDXKeLUbLEiYa/uz7E7R43oYEh/2pyFCq8HlEzqqa6
         XvYOIH9x6qBfXeN+GoXpFOIMps2rbKcMuy6tYbfx+uc3HKqswM5hc0IjiMshuHBpDPQb
         wJJqmvETKwo5+QSGrBSC+1J7LEw+VpQf3cT7sOYEh9aBeh0rotKc76tT+gXoYq0miXFR
         DEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973353; x=1794578153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=wvnUbZj6eIJbMPibwbZUB+rwbHsya1dwSB9Loh7JuVOd/63I3YUA5bTNfiLaY6+1NZ
         7GpuQ7WPz0xwWogTWbVqsE9BsRhJENVZa/IIzZoUCckCi+7/8YMKTSXlHI+ir+Q6E+e2
         d8Zi8v4WkABs+sFkIFUFu1F9zkRGCRRV6yHrkWAAUBTji3DFtd2T7ffuohnz8cireyM4
         NhHeQeS/6S/1Rr0olyjaLLAPYyGJX5frB8ElToTENuIth86L17Qe2yA0wmprl0XNeVAi
         9A/tJMaXvNmf0Xbs8n23lmG/GOxH21N2gLomge8h0av41qLLh4KQcHWmNkyFRSToXoWQ
         PXgA==
X-Forwarded-Encrypted: i=1; AKwUvBwPoc4Y6AvdO2rFUATshO0OtB3pTQ+3fjDOkJbT3G0iaNl0wwCw0xSX3EEzay5N/2zxSzprdYx2Zbo30lQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sTKnEh/OXo9jHkl1vYhZljRG91Zrz1TKfNqcj4S1K5O+sXe8t
	pq5Y+Rsj4zRaRr96NP80tldLqxiVHvYmEcby2RCeTzhFY/TnExQ7oX9nzoEH4WXg0SYkEMSNzsx
	BqOyWPXujdGCDCzsDYwML2wV9WfMcCMgC3kywh3rxH7lOy5ThoWD/7zP5+tshnZxipPA=
X-Gm-Gg: AYBFou2COGFlSvjGxluQQvgUJ0jNgmrElFwfvf2y1PohUykgBmyF5eeP05ZOQPONWWX
	U1hjbkCyCeZIFKSBqUTY+IPemmIHYZcy31QPUpYfXNrb6YYDpIe3qvAkSmex3kqvTY4hOv8TQbO
	lKRRF/s5XYMDyr6jadigJlzqcCEWAaQtA1qirSeV1w/N/30HDaZ5e8+pJI3es+s14K0waj3Yrnb
	v69l9ybLdwWdXycnvnadUp6SJBUJv/c00fZZMgLliYajw3XgA+FNTr7lcNPZ37xtOJMHyTLpd57
	Ej81j+lPlH7xBFfp5IQJMCWR+UaQbyppm+bpYtCyUnYz+CEC2O+FaUBWxYbmx2wdeM7Xh+riSEi
	S9KgM8RLZ+696x58Mxrx7vygTkv6ZtlEhelvsfWPw8kzBohnyn8OgQtHpRExalI49tXFrAg3gKh
	UUvSu8gA2V+eCaE5npAb9b7wRAofvxWOGeo8da0+P7lb9/hdatjsHUJdbGERQVNErow2Lata1Xd
	FTVip/9XTlAdzhh0Nu/MDsq9YDX
X-Received: by 2002:a67:e712:0:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d2a1700630mr1387941137.36.1793973352578;
        Fri, 06 Nov 2026 05:55:52 -0800 (PST)
X-Received: by 2002:a67:e712:0:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d2a1700630mr1387915137.36.1793973351926;
        Fri, 06 Nov 2026 05:55:51 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:24 +0100
Subject: [PATCH v14 8/9] arm64: dts: qcom: shikra: Add OPE node
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
Message-Id: <20261106-camss-isp-ope-v14-8-49c426cd2715@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX2dQrZyj/IPQI
 9ZDSyTiAnQnXzT01CFGx8Znbe7Nx0Ad9og0mxPG/a8g2oceK0LvTqZrchJEXAiNucfF6Wd5gM1W
 +RpdXTgTzcToryxtcY3bFhvWHkjbIio=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXzDYt1O6pWxTz
 c35ooqGfF1Xd0SU9H4VVIZp81G0jdu/eE1wK3KLSJU54DVPdpFwtd4df0XGEM65nW/oQdLpi9Go
 GH3TDSwdw3kmOfRkXEbt2YT4dH1PVsiwGQ9RCXFb7y1jn6tiVLHZo++oNHLZY0/61Uko+kWxJI3
 nzXmyy7dPd4MLeisfVQVjqTlAqrNUZg1cKYHlIlSqIa0nnLamtMFp2Y96K6goxzXN4Tx9NAlaQi
 yeHE6nxMCiMjrD3Zo1FUz8xXN7/SJYovQFYM+ru/Ogo5uRUL+zNe0dSKmI2fu49FHiCzSa+yOBs
 Pu0XFiH1TDj9uSojrcQ163YLdVVTJAEXIHnmaE+3bH1my1WgKbX1wxSHf1D9fR7C4RVgB4qTxwN
 JkPL/u1SnaCtGYXO3gXpJXF6r9vZiEjyl4HvtyzZn+dzbXfIEsEv3UJ8mwzP6ABvW5yCbBIMsuF
 3PiL0bnj0tgzWIAdMBA==
X-Proofpoint-ORIG-GUID: IWr-b5F0QYz0btyU_S6XWTn9tvri334O
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aeddc69 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: IWr-b5F0QYz0btyU_S6XWTn9tvri334O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..b95ad1e61b9b4ecd29a1b7b7fb0c2c52ce31a967 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2357,6 +2357,83 @@ cci_i2c1: i2c-bus@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
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
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
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
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

