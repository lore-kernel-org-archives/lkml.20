Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369657;
	b=WLPDHeX54HZAT4KVGByCkkLDBCswgSLQGfqt/6IU7tmpZMpEJCd//yeQmb6L4Wx9IUUu
	 y+VR59Dd8TatMDpoXWs2hyfTw03ge1y5gewIMDKKWVer9MhvTf8BPdlkU48we5w4bWmg1
	 W2FSCOydiEaewToOqHrLJ9F8kLB0Ef6X6Qti9DzdCZE05yqSBBORLHsfwVdPtevYaC5Mv
	 o8IXknbAsqsbKMljS4NWtbsMhXYnKmtBbvTgVh46bwlhEG9iBdC/M0fCbHYenjQSw7yiT
	 kLvDKAshCIUGmOa97cBXV1czGzhvIcDnOdxd106YbSkaHKBKB5KdZakdw8heTOZIzpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pkGH9AI6RyGCV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=;
	b=4vWMvg16a1d1liGKrcjtI5QTRoqEiLX38oYKsd0n2HY9dsjVJ8rU+rznjaNR+ep6DdSR
	 CBYD4G7S0xCTIsuMujdUVF2uy9y6D+YUmQJ3EETFHn0HZXXGq2Q3uKvRVB0OJvstUXwjW
	 Gy87E3tg6H6s7Fz/0IQ7MvJQYwo1ZfWqM4KvAdZO64wqYqzHE+ZUbn6SxvbRi3w3lzPUq
	 wKfObsDxx488CeBjyiqpYXI6lOauHBpw9a+fKE/8UHWw0POxCSGDjTz2aNp7+B1+BrDsq
	 ZC1psFylEHSq6QCJBLIE42IWI5WdDxwI7ElE7iKj4WpJ7GB1UmH7x4arxIFnhCf99Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S92wpA6l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KojOAPVc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6A0606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A6A0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S92wpA6l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KojOAPVc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tfru4050491
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pkGH9AI6RyG
	CV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=; b=S92wpA6lJb//VFKzgHhoQ8muAAY
	okgrOXFt6VZMzK61bnNL1MBmogzJ0CtYnGXJbS3kfTPSSMUIRShGPrnGVVbdprsk
	smO+zQhEdnpKMOkEdy6xm/LFyNxrvkq1d8tcVE5cImCRywtLa7XW9RC23hTS4HZJ
	DXNCRoqR0bvPXb+5HA668FyGxiWRSYGm1AAwlZy2LNgMB5GcusSI1x21GTOq6CoG
	w7RO9zL69mvkE/hJJuSx+1ZZeZZSYEjfca3E6tjOwikM4e7KUNaonIkcHq9MROH0
	loEiv2KRDsdVF4LW5wSmii1WtHxMdXWZElCyGcayPAxQFpNacvj+OG8GmYg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5jbny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:00:56 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b597558c4cso3143601b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369655; x=1794974455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkGH9AI6RyGCV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=;
        b=KojOAPVcu/x5aYHgT41UroPAOQ8QczVP6Y55t89c2IIZHIG7X7FyDWPQfC7vi4vOh9
         nqV4tf/HUbPyQDm7nmA8lL3yywI4d3C0nmJ67PF2pJmmnHtVh+fGz17Nrcarl1zv5YRf
         SROX29n6XSe41Su9gY4T0Lg+y02nwuar4/gGnriHz+1RBIj8BUYqD6m1g+5yP2YXuqut
         9fSSgY4rpQHQDEyNGrzZqO8j/z1G5klfBPdx0rEJqNFb/36y1+Q51T+lIbk+iDMh3/wc
         zQBO9k4fzPoI1hgGFWw4/oJOnJwVgtxErxeCdT7v+BMHRLkbTfNpxf4rjCHHirw8V+Vl
         CrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369655; x=1794974455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkGH9AI6RyGCV6c+Ft5HngJRDB2raFejWpfQYwc4rKM=;
        b=gZwR2cF8l0S8m06pdAjjijL079u3eYhc6lyXG7thJPnnj+dzhbuCSEN60i3T6uFLUh
         crsJLsQB9gy6eWjy0xFbh71vHKKyHUR0WiZj7TIy9xBcJboidlRzjEDrmWUqTJKYDW37
         ikSSE6OYoSvsUNYtosEU6o/mBf6maNBBJo3uCDTEn+2HxRt0AFvC4A1xz/wMWe3F+kRM
         3JdI5c6UuNMBXyIlAHmM8tc0RkxVCCQghieT8AkbCNscip5EGfqee6/gceE2CbMHGB3n
         lIUAlZ0lcvTBsjvjLGaOrpj23JhDIKq/56Y3hw8/6BYjp+cGAtZqudTcG48t4ZYsLGbO
         V4FQ==
X-Forwarded-Encrypted: i=1; AL+hErGEi/ktkkIMFWzleX+muvGyRIMfk5PYz6XGGbR7QX6S/GXvbU/AlD1NfbcDEGKCasFE39Xw4zJSX0+fbg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9k0TsVr0c2InjCCRbgMXzBLIqJyRk9VjUACIeWXcjW/2LD36G
	0YLuuNOe5YpBP0R+SfTbT7ougoUNHDyuxl/b88aRRN2MmciGs9ndltR8vnEo/ouLqWbqDcWiT+V
	cL44k0pw1AGkv+l3sSvd2Pwh1Wvmqjta6Y6Kai/RXbxVDXgC8Y7n2szwMPSonIyqfRS0=
X-Gm-Gg: AYBFou16ymVR+Ob6BL+ZTazK0ttZhhdleTRxjrpjZ+86RkyMB2Y/X455K9XFMCv5FgB
	IngOA8Besn1RIiUpFDU9MRCC+yFz1hlRiJks+5b+nW0t0REJy/k5Z9AMujzmCeQ3wvALy88bK3h
	0fbx/xGuzV8JAZHm9BAHUxld/GVudnZ3jL58b21pQzJu3tYn/NXz8DJ5x8n2aD03bKpzNxbBtOa
	2eBllzSrS2m5DtXxBXXDTgpc0CBKI3WsY0vlvqhU4T/w85UumbIyyYtAIokvx36pP4xqhLELz1S
	bAnvWucUSVRTIkhlUbPIhJAPhnF4NnUQ0oLmEjpjqfh0xBBgBW6PHjQoLXHtyc/ULhpZa3W47n7
	20n/U+8hVGoom+leFl6+dvVbsgBQEx4Cqh5ClEiNv3d80qfyhyIr8sPtouEXzxFACcCuXKp7WDX
	zqtiEBFWZxfNMYyRwHthvyDqcL2d2MZN7D
X-Received: by 2002:a05:6808:c1a6:b0:4eb:80c0:f4bc with SMTP id 5614622812f47-56b95163966mr956152b6e.10.1794369655436;
        Tue, 10 Nov 2026 20:00:55 -0800 (PST)
X-Received: by 2002:a05:6808:c1a6:b0:4eb:80c0:f4bc with SMTP id 5614622812f47-56b95163966mr956130b6e.10.1794369654945;
        Tue, 10 Nov 2026 20:00:54 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm4089276b6e.0.2026.11.10.20.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:00:53 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels
Date: Wed, 11 Nov 2026 12:00:20 +0800
Message-ID: <20261111040021.3636059-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
References: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX5QJjHFwNhZsV
 fn7jBbtH9T6G7lFXz+t14A3fD+x/qzDqq2ZkWahGuvpqGRs2CsQ15XXDfhsn+HMg094gZvM0IJw
 kJ4pGL+IqWY/46aHY0ZAlzDbGFyMHRkPHcsJVs96W4V5CzwXwNb7m9rSpmqP8Ah43cHHVWOBYVd
 CPyWbVxgrY6vispuvnDdszBXags1/EUBdc2iEVED9KwgKM0jtqUKebppI+CVmn6o+EUe9g/XvlL
 mWNGfd9X2erLnRSKwyeQj2sDPi6pjibemcqW7SGL4OB3lqyyiEDVgfl46IUSIZgKS67eSL9sqdp
 +GkpnDa3oZbfWv8COINDkolE1WEBqEqfLXzJaauEaxpiGmKSzPHI6B6WgNZrYdZMnXKtRnXxK69
 gLHa5ztIFdNcs64Z1zsPd9NDimEinyM4Z3llX32rYvFE9m7lEFA2dJwd6eG4zFQNkX2LA1CER1c
 mBh+K/ZqrW2RSR2pRIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX1ArYPRPwX5lR
 3L44f+oHge3bUA5jSP5Un6WSxdzu+o63qBwaDzYnL+7Jx/lDXu2fFGQ4gqutQLlAiPcFozsS73j
 Lu4KZ3J3aed+hdztYDsLtaEt74Rva8o=
X-Proofpoint-ORIG-GUID: D4WrEjl517FvLpkyAzSmExNw7c5Yti0j
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af3e878 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=81vGQKYGPs5K2LOyq8AA:9 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: D4WrEjl517FvLpkyAzSmExNw7c5Yti0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110015

On Nord RRD, three PMAU0102 (Kai_MV) AMUX pins are wired to
thermistors: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's
AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins
monitor voltage rails.

Describe the thermistor channels with qcom,adc-tm and add a thermal
zone for each.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 84 +++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..ddea691f1c6f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,62 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	thermal-zones {
+		sdram3_thermal: sdram3-thermal {
+			thermal-sensors = <&pmau0102_e_adc ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sdram1_thermal: sdram1-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		ufs_thermal: ufs-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +433,34 @@ rtc@32 {
 	};
 };
 
+&pmau0102_e_adc {
+	channel@444 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+		label = "pmau0102_e_sdram3_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
+&pmau0102_i_adc {
+	channel@844 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+		label = "pmau0102_i_sdram1_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+
+	channel@845 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+		label = "pmau0102_i_ufs_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

