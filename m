Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA7E4D597B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646138; cv=none; b=N2z9RY1RXWMmktwZfztHo+Dx1kPmuy1Z+yUSXwHfyOcE0RTpIJGCf57dpxgZ/SLet0FvaqecIDG0KfjMEydty8Bqt4VlIqbZJrbWPP7brdJ4hb73XSYse7gvDl7ZDZIdm1AL+PrwZJ2CCuJxFLLkUFfpMBR50eaajTywCqqRi9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646138; c=relaxed/simple;
	bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L42FTXxK2oNE6vMTuB4BTZQuE0Te8p9ioY/QXTMqdCSAOCsgAEYeMMQ1FDR5FO7Pfcl0dP/tY0aQe3U1RHeVQnMTA3OlKnj8crtgh1Spd2qSOeSMny3JERhcp4yofre7QD/6wLx5qpNmpF+ucm/nW2fUST3UrGyAT0I8+/J9LWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fi6JniP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OajS7YH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fi6JniP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OajS7YH0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZooF1862999
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=; b=Fi6JniP/uKE4fwho
	QcHpVVAyhHCVTq+C5qIaJgogxt+X6qm8mVM7v4ZEe88UQ8fJTmCPhZgcW53uXyIn
	3b58OjVQiVxtFIGgUbuawkh7QW2/doZuJ1n+9CCPIAVgfujxJtPPpDVrNM6oTrSv
	J1D0a0x2JbaKwASqIYRGiyysNslHAmOIEchwB2yIfdyA20oPQ/2dgHlYk/XkbJyS
	yk+dMGSkZ2XxjEoa1mljmaECidn3jcwKFcX2Pni+1FYQhJRRDE2et4xzZygcPFkc
	7DNzFUfwW+PoZ4R1XnV2UrL6X+UKXy5HEf2uSpSzU/N5t0nubeqAEVrDGYsjqp27
	+ZYXzA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av2u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so943341a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646120; x=1790250920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=OajS7YH0hxDnviZ6ZrNZSBFS5ZGYD924hPa6vz8XoNJzPwH9ZhDeoVwG0hghFzbFiJ
         C2vXbXwW/hXNQ3SMo7H4YBd/EZ0Fd+PmY8z8T+YOsJddqe/hyPxVMS8rnfkUabQ668uH
         jASwjlIhr0m8rfKQCY/yTqXGN/urRms++//1UoFLslN/4ANwMvodXcMZrMbaSmtewGxB
         asy8y1Xykc8plrLwd4/VKka1/GQR2RQ2w73TWCIicYJLSes86kXDWhLw2C/sKJsCLjKm
         tysDxa4lsY/l4spUTNq0L+R2HoCJvD0Fglacmn3ddsfydQBwYadCmK4wOZms5FY40C3F
         CHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646120; x=1790250920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=f97yjPBXI4PNv7VlO9gXV4/e/tyCP5oCKfvpbnKw+spM0hFKIE0VpCcwYeXZUh5JNG
         mZxrUuO91e+ljWK1wqXOL+glvbxB62q5lBbAntZkN2gHah8w/yOUy7NP+9kkw8aNhn5F
         H3nJrx5DB2hPIxZNAWqq9JqzVT/8cDaTbnfyYRknuRg+eho8jO7q0OpzC8UPlnbdGr2X
         +Hjj4qQuexnFFAVdKor8BmI05t2eukhz+Shcafl50B36q82Aqugb//ni9xWb6xJ43Y9i
         lrwQVnWYqDb+c7DYbZs1iBYUO7Q3z3GLGdH5ZVuiJdTrNBjnojM89kwt9UsQPdq4E0oA
         FeVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/rEl52gsu//3UPCMZHrQ18LtpqWNLp9y7vvU9Cn2hLEsozY0oeM8s95HyqnPruW3PB7njxpX+XX2rp0c=@vger.kernel.org
X-Gm-Message-State: AFuF++lgwu8McX32V0msOTcGWrbjXiCagajM0wLF6osAsPYDgXkIbyWy
	1Jy/qLgGz+y4zoWRxAfz75xrN1bg1M3Cnil1EN6shjnDMG8N8gt9d49NDtz6V7Y0OmU+zY7pdYv
	EKECQU8vUkEWneC5Pu1Wqc794shwPA081hguPp8X8kjVUGZA5OhDk6yqILe/Bp1V5b7A=
X-Gm-Gg: AYBFou22oY/K+RT252JQUEBB+kUQI89T4uRAoP/u7eWTVjiYsjy+Nkd+aKFUfAZddNy
	xS71sRq7pUBzG6ItAMWs2wsySXksrRatfgLWa/NnkOPTwJxVsbz+zVBgtfBe2hyCakhvg7vNSkU
	H0OQRrSFYeWdFHowAI0bnTZHGNlhbnRS/+Wjk5IoBdIxQfEcuTLuuINZPUKrDtHRe04/1GgwRBZ
	UBF9rcBK6Us0cJ7UpEnUWR4aX8PORk+Hv9lGBasJ1tql2/lRSlRUWTaLtq9CETpY9RVvdmQsCYP
	1zRTbtzNitH5O3DJT+W55U3aMzClO164ZN6ti3WhgnLecyje1OxqDvmMC9y4LaCvD/xiepbi/oq
	P3DZtwAM6aRSwXYvoQp1oEFU7x7IKJIS/Zg==
X-Received: by 2002:a05:6a21:9103:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3dd5f5e8c0bmr17137925637.19.1789646120315;
        Thu, 17 Sep 2026 04:55:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:9103:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3dd5f5e8c0bmr17137846637.19.1789646119776;
        Thu, 17 Sep 2026 04:55:19 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:19 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:19 +0530
Subject: [PATCH v2 11/18] arm64: dts: qcom: sm8750: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-11-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
 b=OilxmmyIs5BTqVQhAhlpEscfytOalovaVpvmaIvQaNtCr0JkHwTgzOja7V+OHLrEJchM38i4v
 ougO3Q+sa6yAKLviQYX2LTNG71i7QxzO2lzwQ38JAI4rwObd2ER9mVJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: fYBEpzLdtC61_zvm7RAETsSUFHuGiJEn
X-Proofpoint-ORIG-GUID: fYBEpzLdtC61_zvm7RAETsSUFHuGiJEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX0AFJYgN7KbDH
 KgLLQsGLkaDMEGxHUYCrIWd5JqZYlMjb2vOva+4licJMrdFlI6WiWoEQ11aiaoyymdy106N0p0W
 T1tsJCL5opcvQI3ftWX3trVaehPmjhV6Hxw0JmlOnWD3LVumrI2y7UaIvQHyo0iR27j4T56rZw9
 +hEZv2k/DWkf7KCzYM+wxYbQl1KnT7HoLFH4AL/CBr02vlwhlG3blWNkcP2xMzpwz06vb0nEWIN
 ZfvyPFsASTnJdJ5vXsdVarwVJWAL2AiyhMeJiGrAAZCt4YXn/tnflI+1lDg2F2itMhOp4Qgj8e/
 idrhqmdVpMmCpiI07+baaQev9qDDnYThbshMc5DVk04nV9glFel95swTHHut0gG1IRKei7a82/E
 MFUzbV6tute4ouUKaNWnos7Zy2GeLG27DxJf0lyZxeQVzoVYFbnCciHuA2Tnw3ElcYhlge2A3s5
 4XQKXC2ZzhHad3Hk/7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX6EGinFr3gls/
 io8mwKYkfY9vHgl8lb+IvyRHouceR/qhHrYWfazWlQRVIqLLx3wNMTuaALGwxfOg1ybX7vo+Po9
 mOmQlHIzHqom8jvK7wJoMt+aisfMDfY=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabd529 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9b5fbc004df4..23476fbd993c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

