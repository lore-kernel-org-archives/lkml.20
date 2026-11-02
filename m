Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634819;
	b=OJJgLQ7frIpo8D4p14wW95nGPF4R+XG+lxuTYX3ogY7Ol7bWf8z2OJjKJkoaiTsPzEIn
	 t3+QS7brQLdXFZJQKZmNSLRZcqD5kEaY7x4QLuBVQ+Jx6/TTQeNJwU5OVwaSDC3uqv1dE
	 +Krt3rMeUfHPGT1CwxlyxSeOEJo+zY+jkYRkJLZWl8m3CqGSCRGOoDMtAMEBeri+jcwW0
	 Wc0evrIqdxDAbYhK3nT5sR9VemvjFijwNMntG7vwjK5E6mi8rEYNi5D+m/BVZxD1tXho/
	 uZjNo2wFytaWZZUpHTMjr3+YZuDUy0T87umOPLtIZsIuaan9/D5WcglaZsKUBagBkbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
	b=bRJ87Nk3G/UUiRAOuPhh6hcC2WIjuwBdOglMQc9TofHBUAFDjaTtINVwVD9aWQQREFb+
	 Y9B9SfJOrDWHldJDPJOGu9wnLAx01NqZ+06ludMi2OaD717bRdsScOp24ot1hRdO32uc8
	 Ooviuf90gSJ0RBgQANnttIWjDcxblOsDt7pZYjOql7yLlCFqZrGyc1jSQL+AaBpvTNc/H
	 hRFfbAYSQhTVz0asB5gAcKTZ6lfn/foTsogzq2NGEmgizBukiIgiiE/4PRFMZikLv4H4a
	 vnw3Ob/pnd+odgBSH5TP3LVmHFS5UsD9EfpUoiRIl8UvYRkDSKADYuvw1vdHDCpHy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+CObwbX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wcy6Ufrk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8BF60B424A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC8BF60B424A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+CObwbX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wcy6Ufrk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpQLR3102713
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=; b=G+CObwbX/Gmg+pZ4
	fognyXMh0IC2dT0SEtBOqA3W5rLWfbUixeNS9VHb+YeFE6zdOuzltBj9CJT3qljG
	Mbxn69/NvckEtVEAEUO2kkgzYKZpEU0Kn7almUd8SSgVKMVICe/7IEhwCGSWe/8m
	mj62r7hQfvurb89H6G27Qg42J2ABelwBTrtz0wmPAyJZqOl+QE/Y4nefcTbtrS94
	DdRyPHFlUnDSvwScaNjfDRvrHCnH1DbJORSFHqBK3pT5hDnYfCfR48BT92VfvEpl
	j4AZu5yP7YBs0DIuX7N+1TfVlgzLzCrR5YguDrSMjIn4/8kcbUaHYoArTNyzttJC
	zOyeVg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjp4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:53:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf634a101fso2729573137.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634812; x=1794239612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=Wcy6Ufrkq+Y8ltAuJRUPYHqbcZlRyib+cZCa9vquHjVuSTGSbjie5a8kkJVezRbM3d
         xA/65zZT03Z/Bdq8WnDne9w3POonpbzgq2v8GgAR1v2V3y0N4ztQh2Hys7DQfh1rNaby
         n4gHT9HEtBrodrCgYRVgYyCQdlamAQqudS7syI3LP6H2BVM05BIkFvR7LIk7kE3khfuQ
         LoI92P42bgVMplpVvO6MdKUmQ5hAJft2qQ4K1woV8sbq4v2xflBHGVv+XGQPMlm5x88a
         IKC8JJNo4cSwTeVz9s8YhqINGc2wIeWnOxPS7k7FpE/q5HkjpDPKxIFmjR63p0hDs4v+
         KnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634812; x=1794239612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=I9jgrROlMtJUqO+NUQ/gIJcdylacnlVVe7IDz46xPH7iFXXF9cn1JFxS0QQsSFZUKA
         ZomiDWMyoThl3qN5htzxbT5EEtEnBm07QYsWZYOSjd/ymQnxbR5y2Ts1F6Jm+cphW5h6
         uq8YyghWaBWY39KBE+NRJkMsvltWR0skQEcmdaXRL8QV/7O3pqBno+Xdqdp3+c7gBPSc
         2q+98edgA7EEMwmHRsiK4Cl4M3ZJF2w5DLJnoHsSjlNTL0+xAbdlyCdjaF1LGx8k5bvl
         hJDgyVHrx/HSK6hzqiIzrDMqB3nQ3ioTsF+7pO7NTxVz+rHyhENkfYt14r/dZankr9mA
         C7sg==
X-Forwarded-Encrypted: i=1; AKwUvBwU8TOCarhUZD798bx6JDRJz4GIG5k+WARLvvFawermVMRFMaRVAhUVl1cNFtt0MJRgHxuevOXadaFFO+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EiVdMSkIm3HYKqXqIZBjwm6FY8WmIMyugjo3iZHUIN7FwWL86
	4/PqqwWK5gpWNy22IFWdVgPZAUXiz0kryfl90vAcrJcptuMFw1vSDRKswiWn/p4+tf/+WVNeOhX
	DEXnyiq4ecT9bhKNLD7ZVS9zLC/Ztqg68CdxWZEfMkuXKnXIv4un+1gVw8nZt6QoGJPQ=
X-Gm-Gg: AYBFou2xVrTRkr8+cY9UlIrGQkWSCKjFtFeEiSjzHyeiHtyUlYjtb5GPGGyRa5uEuDL
	YUG21TPt0LGAhzpqL5ZGbLmNB8VvLMC8Vs0kdi5Ms+yOr28DnWF7fDCk5czMJ3nQ3bnIAcoSe28
	7EKQw5zfQICdrOj9n2JY8mzQncyngN9kZ7SlQUd2TskNv8XncSED2CtMka4ZijojyqIZP2w9EtK
	KWExPb1/+EZ1iEkHr2Hbyn3Cd4e4DLUXWnBlu23y2sM54AVu22PB+KiIdaFCXB3Czy9XXDCW0Um
	xwQqHXDzxKjbsXQlb/Z5AmzbAvX598NM97mv7u5U8tIEfIJt/sJKfVhWvT6uuS9dXd95ZneuoY5
	wNiS7w+Z51aNvifnon+PGgZ1YgxdyFDgbw4uOv/9omTIuqtwssSazDE59k3R4TuZ8RZ0qmamR9j
	BSwg9sRYNtM5zOaqibwT3f1kZbU/wGbTYZcrCJl28wRrNb4DTFq5/Ow0BoBT/0x8oPpohy/fti6
	qA4kzCI2Kf1GzYoKTy1Z/b8PNbY
X-Received: by 2002:a05:6102:3ec5:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d07269900fmr4433998137.14.1793634812069;
        Mon, 02 Nov 2026 07:53:32 -0800 (PST)
X-Received: by 2002:a05:6102:3ec5:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d07269900fmr4433972137.14.1793634811366;
        Mon, 02 Nov 2026 07:53:31 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:30 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:38 +0100
Subject: [PATCH v12 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261102-camss-isp-ope-v12-7-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: DDu-CQbryFDWAmQN9SzwYDoXKMB1Cebr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXwC04k/uOSEDZ
 v8RJY+ZC86HuxMqoLRZlzJjUctaYxrE9vJ6F41i1y/JCcOjGMjUSuvlIkqQ6jKSGerjnA8KlIxQ
 CYjykkC5WROwl7+LiTDZlBqYxozBlgc7T4l7FN1xZLwTjhMqIY44Pgle7vGNfssR38NJfSaODnJ
 jGGiT7gm/T3i0H2YZguaBxsLButnDzLphzsGNPQ7xsS0RRcuj0Q7b0ew29LzEQNn9ZmcJkax65S
 8HOLXVsVkz66OzhXvhI58N59pvn3XDpm+a4MRwv6/uzp3XTYytcW5GmU3GjeDldu1g3q7S1dJdS
 n/cPoOC3E6BlkMmzyRBWyZc1Ngnc3ataWKuI3Rttihevd9ezneD/f5tAifJvo/g6tb5TG3k98A/
 Lv3xctb2Z8NevN6gGgEtPYfUMAJEgKT3XKaqchofu1Wia7bYHlekqMm3FSUXh9WgT1KES81rtCa
 czRkHRZKNBDnsmPCXog==
X-Proofpoint-GUID: DDu-CQbryFDWAmQN9SzwYDoXKMB1Cebr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX5ZWjxPCbWRLO
 AuhKb3fi0pujmQORAYkpc5KofYh6h3vWP1U098xMdjYTHVDw7euJUGdt4aIqgXdvT5jW6K/qTKD
 Aj8/lnijQH5usgzIMPwX5lus+9+Vj0g=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8b1fd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

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

