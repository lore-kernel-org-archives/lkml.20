Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0983B4EB0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144911; cv=none; b=Oj2hpaYTxnP9bOWvV9jgYe+rVh4+ekPiGIzHRcV+3yXxcdCQ70gPKfZm5hp2XD/havN/7B2sceZAY1E1Q4j6xmzbbm/DksmwSX43WhZDYlPlx9TPmSlSFAU0/RRappqnGd+R6Y300dk1sU6nLVNm+jspF1oOCrEndyyIiio3W14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144911; c=relaxed/simple;
	bh=QCon49Ot8O/e2pM7+8CojRw7D66D4IEK4MsBLQANqrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E96f9JEFgwhI+I3Vqj9ruQVsUxqM6J4FIp/nwXamLsbD+BlU4nUJ/8KL17wwITls1VrkIM0V7bZO3Zty5X25vNd1WCUNkyIhyHZe2AyLTPM9xN0UxoGLQqGnnV5wRybKfvUrXgUIcUIf66DN0RN1AQLR1yAeY1eLEpHQJqG9TOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CL96jNwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYoWVH3M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CL96jNwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYoWVH3M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm7Hx1090772
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbsLMOeJpYAGtp5sTYvCoYNNSc8CfAGSW5oeUPz/10Q=; b=CL96jNwEngNQGV39
	WmtPZjm2Z1Rl5LfhdfaYV1rfU3pdBIzqzl4lZDWxu6WEOKvYdOpihsKAcKmulyGc
	6TJmu73yGyJjsUBnrXjZvJvPAwPaSM/qZynbNKV/kuhJdXI6ayIo+HDDOJSOb1KI
	t3tASXcDLopGba4CULScpT4aWtb0PscBSJijwfO5TdxBEf6U1xcDqzZrjM/tfLSJ
	rvIDCAJT3Sq/VE8MYzTjBIBlmWACD+IRKUJI0TMhK4BFfBIlwbcd8/xTHoygaUq8
	oRj5WpCPXMu9U6gCT8vDU+4VXT3al/h0RSFbVUCRE3GailnOI07oA8wvhbADZsju
	rrPKJg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3atje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so15249345ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789144903; x=1789749703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbsLMOeJpYAGtp5sTYvCoYNNSc8CfAGSW5oeUPz/10Q=;
        b=WYoWVH3Mom4rWvJDN1WivedmrMiaE4K68OCvT6hxgimSBL/LCkkdrxgGPDI3MmASan
         2mv9w7AsBzzlm4/aSgOahtW0UfotL/3Gig4eskensZvHkRqvfkhvA2JJfds4RuM9taUs
         tXRAm//RPwNt1Y9lYlDa2L/G773a8CVYgzXeo5m21gIC+nVtZVAH9w6l7s/MmGzd0D8A
         EPpwwZ2zenA6/nKQYGo7SePiA2Zy/g5NvtPu+6XNS3TDSXbid2oR6NHcXYTH9Zkb9+MO
         lP5fO/Ybn1jh5OCXhyw1P8ZjI8rHMSqdeY1XSZDX44/K9z/bwEp8Sj0lTZ+K6TQzzGGw
         DKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144903; x=1789749703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbsLMOeJpYAGtp5sTYvCoYNNSc8CfAGSW5oeUPz/10Q=;
        b=cptz87ihLHzod0THDdCDHeMU29+6EFnV5IZN2d3OMov6euZVRrpdZOzbCJm4TyKesk
         hbWSe3C2rst/2zi/iTSz51q5Q4mNEVA4ylwkyPbuplOk17Bm7wQZCnVa1F3q+uexEvXZ
         BuJ/+4OtRl3jvwJXavz3c6X41Nq5nUjeNrdeBND43LqnsECiQEavN4yNCwy3eMru1eCp
         Lvgq2zYFu+ejFlDM8YuEdY0fFOykbWHkrcY8RWNRgbqRSEm0OoG1tLoa7Pavw9FGoXd6
         T0MKBbmSEs5Wki8ITXL2WxRyhWJOcK6T0x4pjevGn8oL4rJtwv1uvSvvoWKUdnLJmCB7
         fvgA==
X-Forwarded-Encrypted: i=1; AKwUvByihEWsp6clZGpqZOj2ugSQXo8uC7T5ENB4QpDdgT3e9tqEOQomtHfECJl71iLRXk4wGVkpllw9ZPEe588=@vger.kernel.org
X-Gm-Message-State: AFuF++kyhW4L7y6BDZ0gYFhTOIJNIpvK6LEJj3s4LXtrhuWE/3Sv+9e7
	YFrQneSW+6S8ycWUVff6rJouG8UU0LFn00T7qHz+zrw2BWA6Qzaj6eMqiRpVGQtE2Jjg1Xgje+y
	CFGZpZHrfvJo+mJeJ9PsjNsIPpY1GeP9AuElmP8ONPzRDkEHvzQTL12JCSLPSAcbhjIs=
X-Gm-Gg: AYBFou20z++pnJa8dXLaqOVostwWUF1nVVl1swYY9OBHEhLZxkRX0ldaAjlaMq65Q/N
	mO+3CaGGBcW8DfBU+BUvGv2GMgKIHvFORw8HKUiBDsiBlG6teT1lQMOfImaSggDemkYH5evPBbM
	g+yQk2iiNA0ZGtMzGanf/RtQbJHpXiBBEIE1zMgOiCLX0nMf7MRs9PY5qaxqnSAabvwuqMFLJiv
	9D28Zfz9Gy5HSPSADbbgEiGKam7mdoZBY/YqwITaXaBdR3+ex9CkI70G7nX6HDdPympSIqid/+H
	q6J8hGTw4se483cqw1avWqHMLKltUW5frMAEbFasuYUBfM/QGiWDwKZefSs4YtFgYDW6F+dN5lI
	rAhuTNZOf5Jdk7YHcjS4=
X-Received: by 2002:a17:90b:384d:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39d9c1b4a9dmr7808059a91.16.1789144902755;
        Fri, 11 Sep 2026 09:41:42 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39d9c1b4a9dmr7807988a91.16.1789144901838;
        Fri, 11 Sep 2026 09:41:41 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1618171a91.1.2026.09.11.09.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:41:41 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:10:42 +0530
Subject: [PATCH v6 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra_adc_support-v6-4-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789144881; l=3566;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=QCon49Ot8O/e2pM7+8CojRw7D66D4IEK4MsBLQANqrY=;
 b=uXjRvEzrRS5DLiice8qtLaEkec0RtzA+pW+MuOApF62UkdnaYgIEoS4VI6oDfI0tFu1DUIkk4
 78R1lFCgm1pBYcuroea/OZLGAI10jaxJHPI/aCexywQbaJoYNFIImlU
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa42f47 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: nUt_np1BQ5T5NuEySIdJov-rYS-zGxh6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX/Wd0b8OFgXGr
 z5qYtJRQE21p2wcD9JMxAplSPDD4m7//nuTP1U+vgX/ViCUXT69q8pCIqb2HxayEEyeiBlkXrMs
 Q0SOQ+bkSy1pf9MGAUSZAXBTT9OFc9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX82WctUvGy8te
 GL3QDt8FseDScwqzP595/qktS4AFweGe5NL598qHZuVqbtYvb3+37NqE6AhL4ZElVdmhG2lW+eo
 KhG3tQy742TydUIuAbzbuVKtJ3WtGkezVyT9Xz5WY7q4fUaXMdhv6FOvHvRy5X9uMjsipABBlBo
 WT8rrdNIDyyN+IBZlvMiDfO06pLVQDTbSVcLmbpnwsFNCz6JxwQwwLckdSTkgw9yWDm9jxGAJpW
 lBkGdphZnmF6bdBmhTv4HYdY8w84yZDMCYPcXzGpMucb9K3n5sDOhmOgoyi0smCj4ne1p3eC1Li
 HKlbsPGIt6lF/7GQ63XA+KBGjIk9QQjNir2TG5tSZqDE4K1iMpnYdbkZYgjcRLRBJtK6VVd0TV1
 2GQ/s2rEmdglys2F0hi7e+85DXV+MnSjl/nQHox5WihvgPqGpVfx+H+mLwYGWkCuriyDgzDmrEw
 XzGfn8tQFI8s+MgyDfQ==
X-Proofpoint-ORIG-GUID: nUt_np1BQ5T5NuEySIdJov-rYS-zGxh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110233

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
for them.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index e119ace54e58..a6769364c192 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -31,6 +32,44 @@ key-volume-up {
 		};
 	};
 
+	thermal-zones {
+		sys-1-thermal {
+			thermal-sensors = <&pm8150_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			thermal-sensors = <&pm8150_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			thermal-sensors = <&pm8150_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 		regulator-name = "wcn_3p3";
@@ -76,7 +115,81 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&pm8150_adc {
+	pinctrl-0 = <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@52 {
+		reg = <ADC5_GPIO1_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
+&pm8150_adc_tm {
+	status = "okay";
+
+	pa-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150_adc ADC5_GPIO4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	msm-therm@2 {
+		reg = <2>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
 &pm8150_gpios {
+	pm8150_adc_gpio2_default: pm8150-adc-gpio2-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm8150_adc_gpio3_default: pm8150-adc-gpio3-state {
+		pins = "gpio3";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0

