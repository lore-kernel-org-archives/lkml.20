Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328771;
	b=tgXDZpd4VXuQeHUsby/KtHpHPUv05H9zlz8QRFlH+Shw+FieYToNGkoEt9fJqnMWAxi/
	 r0j3QXGGcEjw7Z6ISq4ReqTGl7ILm+5W6tD1TWzJbh2iqmQ9DZUEj5qt4I/TPDKV0x+is
	 +jFjc+d/0aySNmDl3FUGksZKSh6yFpDBHizUyRTB/hejAXXR3Y5Yh/VbMQdiqifl3eRMC
	 AUptljXMDuJEIPkEvbB83aatJwN4bq619PB4eetTmrUm3IFoupfpv2WcSMZq1Zblq6Su5
	 4Z6fYCkUkbgNcvrxazdC6kAhgX8UM+FIHH02Fl0KugfwJ0ylvoxZ32/363S7ZSJAqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uMoLa5nXrmE5D5TkslCS164rpHjf2daSrR+xEZtKhIE=;
	b=DtS6iS6tAuhGxgET+1L9AcZK9I6dQ5TiT+nBihdWsJ7zZj7kt0DhId91wmAWZLObO5HV
	 ICsu/cts2vfOpP+G1H8TpA2JopzHOwdRwusqjAYJyU/AlzvI7nLfWLS2KQBn2e6hwVd0+
	 JGFjmviDvxqFob5MTNS9j3RGqsWMo1tOCdCkLOtC8cgEeWTwPQ4xnbQIa8E96otr5YfX2
	 6h4mdS/lphuvSDfpvrayrWYadfMH85CRtqSMR6SJ0OuL8DmKaQpw9VNTWVhCzEQCA99nq
	 itWsNB+gRFXK3XltcGMRpX2XYmpdIfJdbIzCwj6SZbJO6DmrNRs9/BbZ2+TXoKrG30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=id5ECjwM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz+erQGD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BB560A2610
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BB560A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=id5ECjwM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz+erQGD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Cf13713588
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uMoLa5nXrmE
	5D5TkslCS164rpHjf2daSrR+xEZtKhIE=; b=id5ECjwMpiTWb/JDscdsOoA2vaN
	HeC0nXtSXiQDTgP4eQ43lawRshbOlMOCRKUAmSTEdERULG3KTa4xmz3qLUPbhSUv
	Q/GdT0HTdaeNLosqL/byjhGAaxUflp/sw8/68ocVBB+Rs5kBGqlQV5JZsXTAUewd
	eIDe5F4/079MWMaLTQeaaJtNI09g/2IF8ahfB6zcLgB2aRjWiI7149Js9e2Hm+Lk
	FJcPc+N2Lyb1U6CGudHOWtWUYF/zCdoqEX8F4qbNA9sAY9qjq4I1jyn3QDqhnMtr
	nXBv2H8okQcSgjUOhxTYpcRS7T13uS03ivwl63r546QTuBSrMAiIVyAR9Bg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdamyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:29 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso855012241.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328769; x=1794933569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMoLa5nXrmE5D5TkslCS164rpHjf2daSrR+xEZtKhIE=;
        b=bz+erQGDnO27HjArIQT8sH/5xBXf3wYQMnnsGkjPPzD6LyWnNVwArYFaTOYsg9ps5f
         gPtdWPAhkXxXdVUsKqC7LhZZfxgk/+2UIuNgRt7vRHy1H7Et0aUOv21GHG9xem0JaMXX
         BdrtYJPJCRbCU8C+Evk7GEzH0KKrlfM9s7eezdAoHsaLm1FeYCOGfrZJgr8uyWqOVulP
         VxVuqNWMAdFeSggqoMhsDfH25aMGb/S5j6HfXsVK0saAKjn9HAQz9sHVh7jyb46ZeojF
         PT0jKDKmcD+Cmi1CbPYtHbdNL2hYmRn2/s7xLdRYEQ78U2b9RC70IwiVvNE/34XTxP8B
         cVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328769; x=1794933569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMoLa5nXrmE5D5TkslCS164rpHjf2daSrR+xEZtKhIE=;
        b=G655TTLI0IsTUtQwZIBBZ2SIq07FMth5k2usa4aitU8VvNgbBbHtaoYgR/Lutt208r
         /dyoe1tdzhkrHxd3PRvcXRlnOGEInI+P55d6Rrl6CS9z92ABrVTdPL1lOoUud84+BiBR
         nkbNAtIWdXkiVKFsPdjZyDDwN5YlpRfeMaL72exFDYmJK5QuhIDoplBcjEVVBhBKBFn4
         e0RmMjP/AUGWviNEZeo6HXgL2Uk3skmLB039GX8Rqkw3HBmzuIbKal9uqfMXlxFZXanL
         UQABNkJo9DHWfzQ95aK8hr57wQw2OvqUkREqD57UaV7Y2i/4C7vFHJaHeuNXRA7jN+g4
         EIAg==
X-Forwarded-Encrypted: i=1; AL+hErGQf5iWUrG9B60FXueslYPrnWRJ1JgH+jb/+vLCigjJ0ahw+9hm3ZVhhhbZkr+ijG3v+Tc4aon6KIV75tQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xszACtFypsIyH7a6jNKrvhW0ZQ+KK+6S98dFDf5N5h8Fwr8uc
	eJRblAHB6TCikCCkKLHoDXI9d8FhJuaOGzJ3pifZGvHO6wuHC2VTKzu9jRJvIVSAG22ai/BsJq9
	NN4kkZz/sk8RZkSlTTN35uivqkl4CcaXuh8Bl1ARA8tlCPiqkDmUWnYJHsImlvD0i7Y8=
X-Gm-Gg: AYBFou0lqbIA6GtmBMN0Myckpc2SmqfRn9uTwh1zifAJwODqYG3VY+KU1sXwn0H0ni1
	N0xELVHurD3l6b/gd3WTPqlO8eKtTxVWaZsQe3P4fkieTyHlRCSLRBdg3R+lAWV6eb7LTydQwHe
	bVnenRwXBXT1zesndkQtoijg4irD7VvkEWGkDqY0gPFixm8p5ftvnJiIg5O8eVfFCrioo5IEJ/l
	fjEgnM2zASRS9OHNnu4SjyckUzbGaLTGzTiaNT2AuF/7NLwOqQTvY1O7LzOoaA5ECrJgPfnEk8I
	/wQNo4WzeIHYzoPs88VP5dvK4+oY5uZT5DB/t5Kq3LeNSIuYyX3UklnZ0U/3tl3Q+zeKkgwldjR
	azMRsNfyQ5/7nA/kNKcSRnZ5PSJ37PgNA+O4Jarlxik7YJIxy4efsQg/i0lm43xYslJad5YfhfQ
	==
X-Received: by 2002:a05:6102:579b:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d301c16e28mr1097966137.34.1794328768966;
        Tue, 10 Nov 2026 08:39:28 -0800 (PST)
X-Received: by 2002:a05:6102:579b:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d301c16e28mr1097951137.34.1794328768520;
        Tue, 10 Nov 2026 08:39:28 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:27 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Tue, 10 Nov 2026 18:39:08 +0200
Message-Id: <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OgEVRkb3rbXfEKOAOuSHXccJMO_uM1vx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX3584QDb8BV8f
 E+PmRFKOd9MUgNKCDWH3LVmWvWxX0KZNa0kNh3gcalk9e83mgtnq40ElabH1XWqdCFAWJkQ7R4b
 wkbmUkPxj4oHhDldheNzxAYI7Rut1eY=
X-Proofpoint-ORIG-GUID: OgEVRkb3rbXfEKOAOuSHXccJMO_uM1vx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX4R+1KrSmjNHo
 a+flJRseTIId/0u29GfZAbi1PC0GOQXajkxdCJhaNaOYkWiS3mZo10XmIbPVOybwRD/oXYKZ3pK
 uF8AOG/fyHsaOGT5rcnd1s3d2zKv1vy3oIU0KpTvuBbmezlL6iRnEzvIC86Qiit2sWG17DpDZ22
 ulbmPQGLK/z6pwvwCaIvyX86thVeWPQeAQcU/yCVbLoam479LWhMI6XZ71BqX37PpopOZp6HJ52
 5fGuQa2JiZ4k6uRek8vRy4zApp/GR1C2eemZzA0DtldAlmlJ0BuDyzEsPi4OdTsEOBr346xijsm
 aL+SFEt03ILyRo/3Q0vNecw9xNFPl8amrmynYBW/ijL5WBWAcU/RVJzDOWBNgLur8RFK4S9LgXf
 A09p9C5ORfqlpCOeRnySbZhc77Jh8As93n0EWJsbDGZ/1eqwrXxE8tPqamh7nYSLpCDo2XzD/HK
 KJf1LlWQhDCwudd8vGg==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af348c1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=iVVtd_vrlZ2ormJ2GbwA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
so the qcom-jpeg V4L2 encoder driver can bind and operate on this
platform. The node is disabled by default.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 67 ++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d271..b46fbf5ebbeed 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5164,6 +5164,73 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac4e000 {
+			compatible = "qcom,sc7280-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac4e000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd SC7280_CX>;
+			power-domain-names = "titan_top", "cx";
+
+			clocks = <&camcc CAM_CC_JPEG_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+
+			clock-names = "core",
+				      "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x20c0 0x20>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <258480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <531480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <1006560>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

