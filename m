Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197045;
	b=ejkxnOXbdPIu0Xd9a/P8uCwkI+MjnrSuGyQa3xIsxYzmJoGvkeefxNtSa1RShXA8Ae2A
	 1tSisrs9DRJRZk8n0lzu4nnwNig0tFAq8V23HMYfMEozB/+24rTntWPCld9Kl8/I73paS
	 uHsjW5i/tL2GjCHP9Rv6uEEFExXUEOtUzGmZ2/qZmdPNEiUdfFZxPfzt9iv0b7fYJzSsk
	 DLIR8LW/OX1vv8we7CApJbkUB+0zy+5aQD/QjakYh1aAsWF7JQQy3P//rdMPRwS0ODH1e
	 Yg11Z82Ie7jkrJef8cwhFujJ/ipjRtKIUh4Xj9Tx0Z7tklx0q4WIz2sxBDocXcOspDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hmWM5fppsSHiHGHFwZ1uLxSBn/TikX6J7OE7IaENfqw=;
	b=BSpcR0RVdh+18uFaSPnuhZnRg9sCvK0aoF7QkVM3SmnGJYSrpkaz2K8aZcprTNtkm2Wb
	 epTUKLScvkC3Q/FZNTjNQ0+tFi2zbJ6hl89ARxeehy1c4wdVYcEjFWcFV8c1zCg5E6xHM
	 TUn0c3PWw7iB+CNJHd2EaxLuF5bQ8Mql2YwztgFbl2UULi5T7ETDv05osqgvRh4xSr89d
	 zOdYEhMsDAJON48Wtdx2DvuT6AwEh2UcvnYAnBclo7fijXhX3n+bzDdygj6GeWmlfGdOh
	 CkNlJgg0b7SXv65HaGt7vMym8EYk5OYoOXwsLYIQY36u2tHbTLcCV7TS8UtEhKQ4MpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="W+YPHLl/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RvZOYyO7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07026606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07026606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W+YPHLl/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RvZOYyO7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2IF1538955
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hmWM5fppsSHiHGHFwZ1uLx
	SBn/TikX6J7OE7IaENfqw=; b=W+YPHLl/muJ3BCv6DK0hnAHAg0DwB6fW8Q4wf2
	PyGsNHLIlMON8/3r0J9Td3Jw5gErxlHnjt9aLKFquO6SbrWiisBEAJ9IJRqPjmxY
	0ei40YcAALd+MVAuQVRSfwqMkzTAWezL2kzL8yH0pwlwU8RVTrdc/wGc4RFJUfEu
	ElApk8umxbtmllxGZFV5bBQkQJlqn6HtT2bFBWWCzeOxh0C5y4k34ohQ3mCc0uI9
	Pai2dm2bvKFiWhAvNIBaBlNWhz2BRtANRwOwdcKrDWXtiEJmDElXx8yxpPG+7/0i
	ft8MGYG4iVDXZoEifdtLNGN3GCGS30erDnJPsXKGoqWkOg6g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sag7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:17:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988be118d98so261607241.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197042; x=1793801842; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hmWM5fppsSHiHGHFwZ1uLxSBn/TikX6J7OE7IaENfqw=;
        b=RvZOYyO7MW6X4B51RJXEWO5WEQj/TcXWJWNGRY7QLzlAYOlYptf7h08aNXVQk3qdLV
         Pkfmu/Zb7hnUEyzrkcmvnAeCWjxAGUtDQS5gxcors908WjXO7G3gOf1egelFMN6K8S/I
         qe4xQ4PAwJL2oZJU1QrloSDBLLhHKqssX7ppE20apNApx7kbCK1bzuHWtJxw0HiZP8LO
         YuzT8GbeCsynYZzYyMYbmIf7Gq4QAUzRm1MKs3PGMm4CweKBCcIsIYuKmmDl4DA1zo+U
         zyCZHegB3kay+0ZOSyrtwXk9uF88QFJyFY0KfqYX5miUXeUYPJQKv5aJfQceBkuU5NDe
         1Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197042; x=1793801842;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hmWM5fppsSHiHGHFwZ1uLxSBn/TikX6J7OE7IaENfqw=;
        b=11DBI6aMNBrNSTsGwE1PACytm4gPnPny8csJNOdkMSxD5xO1rcwawYCu4w8znU3BOM
         0Pd+9VZe386nhbbcpWWTnhpi+/JpgRzRON67I4vctIe83Z5Hu7tSm3GthPHQPG9+s78R
         E9MHKJIoLm/pTmjBPIhFptcPnkBS6bW+iM+HTe6cqNoUAWfCtPKoMqgjvWolYStajXEe
         uVy+Ey//hBjLFuKoGpwm2WRzTVHpO6FS+CvDwP5vvdrB9ZcJHk0cNZkmnhz7KkhEDGEQ
         r5bt0MOaYGFo5NUKBRPvMUo7M8QBv+L+Z6vG51nvp6OGUhOCjHX7SrU0pT0sO/2bBYY5
         k/bw==
X-Forwarded-Encrypted: i=1; AKwUvBzoaYfHr31b+efW3Rtgqarf102hdvMbfhSyfEtyyl+XOdWrNWcqzN1ATaQNOGWYefY3eZs2tBH+lAgqB4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYInvcw6YNDVuD5k2JXqSOMsqtKEx5ZV0o3Gz/v+b9JpHG6tiC5v
	Wgw6ln9zTjv/Cxck7D1gxmy95quKdX4dIreuJJFh+x8PBk7UclZLez/XMxMI/ajwdLgHPdmBo1Y
	vDt715x8eD6gz/8dYh2Zkys+w4OZAwzsnsZ1WgMmld2tSZdGYI3v3s4WW5s1fhS6wBaCHnCdlpt
	k=
X-Gm-Gg: AYBFou1XITiIcNrDM+QOO3lNg5tQroFFxVI0ZSmmDI5kwmXJ6oAtSpno6SCIro1+o3g
	bClt/VPGJ+nySZhNTXYa0K7Z6Xjww4LU+lsr/rhziwsFY2I3PogF6HtCmS+7ooMVYOeZPR5jAzY
	wlddvO1kLV6wCCNDzBj65k4q8ROc5kzD9dKXV++fTfH12ZIwc0M1NVY+uoDPLaGWqvaG43fH4BX
	ddXQd51ro2bOoS/r08cyq65nvuoxRTvfXSJ8j7Q5A6YtHCdkFPWtPVvP7YAbSNHp7B3JBq1M7li
	lPQ4rXfzEUjJUiXkbFyDNPvYKSbr48nx93DtK9QFF1OxqHwlBCcTNLuQvOOQNcVQYeF2UUCJAjK
	mhDHABrqip1Ih76+8DRoFzC+r0HWwMIwDN4pyM77NUtgbf1u00kprpuLgG1JL5W9e0JAsKQN4XB
	MRIrvaGUyXS7pTAuHiOVejo5kV0YyiMwWTMXyHGJpD2WmojIIxekROgObC5oAwlJ0Ze2ByUFSQJ
	tOrCUajUjuUnhArHtq96kXRqBr3
X-Received: by 2002:a05:6122:1c03:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ec4cc14f21mr1095733e0c.4.1793197041921;
        Wed, 28 Oct 2026 07:17:21 -0700 (PDT)
X-Received: by 2002:a05:6122:1c03:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ec4cc14f21mr1095688e0c.4.1793197041412;
        Wed, 28 Oct 2026 07:17:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm28463589f8f.50.2026.10.28.07.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:17:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:17:18 +0100
Subject: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
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
Message-Id: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO0D4moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3dz8vKpE3ZKM1KJcXROTtKTUNBOjNAvLJCWgjoKi1LTMCrBp0bG
 1tQDPM7VuXQAAAA==
X-Change-ID: 20261028-monza-therm-44fbef42f89b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae203f2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: lheya4mpoq0cNARwiCN0B-JkhvmwSp3F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfX0XEiMTc1ZwNb
 4zflAumaDPl1BcNmP/8MInYrLFj8D7OpW2zOpn9ph0C+QiwgB87xjJafLv8Z8vnIHmIHzqKybwy
 H1kxOzSjWyTndD/RBvlrifZUmIdrsqA=
X-Proofpoint-ORIG-GUID: lheya4mpoq0cNARwiCN0B-JkhvmwSp3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfX3GsT8A3/+oFR
 c4rKeUUxSDeJDnZ8vmBkzStzrxjQlxtUg/H8P1+22EqknP2YqxAIH4UCagL31DH/b86yx3wtwgP
 sb77fKWUw7sbAA+aF/twwh0tAfcjT59KOTXZQAHzYfJ7FXcB5mKfq7ccFvvp2n77slIYX1/jmju
 /pFvhbW3hTFDMcSxxauZ2wUUOHQBv53WVbUBZ8Pom+1ltvsMwdq798ddhv3otffStb4KKX3uq1W
 Hu7oG07X8FjKGJh+KuygFb9Myes7yEFkbUqw9pfo8arpyRKq8nFVV5aloZn2bwtRpkcRj0r/V8C
 HxY76oLMUE3M+OKExPKaNuT0T2fUiKhvXvK0svY8a6zKPfTCedhYeD0/qwfVU99fL6sJbHG+xFs
 yFbFyP8XDOfxCK3pAmxWuP8QkI+2qRJe8n0E0C60sKn2fT7rHLhsVJOlvbtX2g6LIDRnta7IJWO
 Kz3NgCyDvpy5Y22VLFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280056

Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
nodes for thermal monitoring on the Monaco Monza SoM:

- pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
- pmm8650au_1: SDRAM thermistor (AMUX6)

All channels use 100K pull-up.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 36af1ad2105d5b3e5674fa59f5648c77ccfe7d11..dc2ef7e5b061354eca4e4fee90906e205ccac1a4 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -227,6 +227,46 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pmm8620au_0_adc {
+	channel@44 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(0)>;
+		label = "pmm8620au_0_xo_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@48 {
+		reg = <ADC5_GEN3_AMUX5_THM_100K_PU(0)>;
+		label = "pmm8620au_0_ufs_emmc_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@49 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(0)>;
+		label = "pmm8620au_0_soc_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+};
+
+&pmm8650au_1_adc {
+	channel@249 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(2)>;
+		label = "pmm8620au_1_sdram_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261028-monza-therm-44fbef42f89b

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

