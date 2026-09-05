Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640C30C361
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577520; cv=none; b=TiXlFBkniQ6CGt+c6ZrkK6fOqVuSh4wH627HgYZ3kcXyOowLrahcpUJ//G8oEcEljZQasdZMqo5k9/ScMKOJt/yjPPHiSi3gz8005CjjWxdvpJ6wUbiwSZ2OmAWkSehLT+FsGH7czCPYSL5Rzn4alcKEK29QsbHXM+F5FSg8SIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577520; c=relaxed/simple;
	bh=rxreaSuQlW6s6Kj0djllXV7THEUegGiCKPjGOUpJHrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hasfaBe/fuGumOiT3fqtd9Ml8//0pnuixenU20DcNrZnyLbE7XEurxMzWXlV4yl6QOvDeUnskYIXymD0coLL/r7vuTSwULB4ZS3duOT9h9fwA4IndOaQRJJYFdvsLoE9C28PVuTRVIGXKU2UoIWZuRNz7GLteOW/PAiJtT/LcZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ss93fWjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PuvjzhDA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ss93fWjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PuvjzhDA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850uwXB1157823
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 03:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVA9Ee4d2h5FVxtmuChNaYXSYJO45ZWL92iBFqLOn1M=; b=Ss93fWjmY5uogyHA
	K+bddQUymiuexwiyW7xRT6MSjvTw+XC+qIDB3E5lmvpUgRsyGCS6onf6VVp6UmjI
	oXzN0otV9ZXIILZ8mW+Kw0Eb2ogLelGXaRPp8tp60dpcGRhG8i6dZ/tlbMwLt7WR
	HKABDdf7eHIwJfYyCysazqTr/zetuE4c2g4NLzSW9uRVDDyZo624BfPlPFJxsk8k
	oIG972IZT7qKBQFPPG7yvJZrat77q4+h6zBf8BuSdg35y3zaGq0DjqT4//ARfU0A
	2Qu2Y7BCWYdxhuiV2aG/C6YVflZVZ1Ov6v3ZvVoTaGqySxP/WevmtQvFqO8aZEUs
	lVGPtg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp785tff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:05:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so1984201a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 20:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788577516; x=1789182316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVA9Ee4d2h5FVxtmuChNaYXSYJO45ZWL92iBFqLOn1M=;
        b=PuvjzhDAQO6CDx8ewbrW77Xust0Lg7QocJKLQzstCSRDVCPOqQut3IcGbgwPHh3306
         7eRPBy2153lVnRk/hGNZelE9j4VqdS3ECPynQQqiThBQq1p2kCmcZ1HNQr5wNn61KYHZ
         eDVvDCbIHhflPQuhZ8vVSi+2IkNH22QaFVUzwjcth0WYy5I9aDIFc9HSGpIE+wMf6NET
         Clk+TOYaF/a9KSXgYmVsz59xaxg/0SL7QczyAB1GyiLT44LYQC++A9k8hqpu2srpiY6A
         MeDgKUplGzBsfa2cqR5Cza+Zpm99qcnnmyYqHNyvLPPAwyxPa4qJCPRejspeF4Crrr2/
         /CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577516; x=1789182316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVA9Ee4d2h5FVxtmuChNaYXSYJO45ZWL92iBFqLOn1M=;
        b=tU43tsc8UyQercJZaY7AQmJOOhoEXdR3GrKCsgR54zNKf76NaY84Nr/Yqu4OOFYWY+
         zPQVBavQSMQoxCfXoRZdgf3jBfp+LTAbLwcd2sECCYw2SC6CLFEsiOFvwH1CQsg7WODz
         Bt7MA7HOx6lJda3YTlvBEMmq9YBxgvrrX+RKABpm9LD5sopLkt4u6Bo0M62W7sMMTv0n
         5tMdf4XLzQUwA+aEzYrE4rgksVQ66LmXWkLXJT3iqRmXaGjXiWEOxSSGdA6aHvxyLqgs
         yi3krzSVNy84NWWaRMjV7s/iA7TwUhnSehyzsPc0ZytXS1D7dN/QC2R1hnkfqiJnVPWk
         gQIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsNoHWo0NvJ5Zf2qlwfkfbPZL8DdbLdA61IwtjgDY4fMO7Xx+knZ1+SeyFg0j63DsUxcUGZzg30CDPa8I=@vger.kernel.org
X-Gm-Message-State: AFuF++k1Sf5oEKH6XXSRXX29O4lGTTcF2mx2RbIDk4XIUaXAY6+Aj1sY
	QD1jGX45a9LYrDnyM6ImYle4UqCqcksQoD6xFQKb870pO5L6Bud1RMBbwjnvyE+de1rBwxxKoO2
	88N1EOHw1RrhliaakX6cU6xZcx+bQqObtTFXGrSUuP9qj52Ot9TL95lLKS7HFZmoMotU=
X-Gm-Gg: AYBFou1MbU0LBzAc2jduwyc9SxMCHiuXrvruOsSqFCm7mREtf/3ZURqDNFoDmfd3uNl
	opW+mjXUxD8i+C8MDlJvZb+cHNGWRDMvIhnOHtmuTH69jTsBwBjkt3fq9l4F3Bak6Q6MfsSBY+Y
	iGNQliAYcgrBh+G1hfT7EhpG92nq8+gWB2M0oNKO/lwDSF2TaL0L5tjtV274Kaed1JgsJ3Fwv2M
	KD5HBFd/p2+B9PSQk+Sd33IFwP6a8uZmRUgKWT1i6EdRE2wwTCqo2OabVJzAl8852DgwKQ5TtGC
	jK2UYYhP18DvPQmQOCjrAZ7zUI84tEnQc7q6nP8jEf9oxU81a3fkR42mF/j16i4MX+94pWgJ7MO
	BwLHDH9J0AkIo8Yltovz2Kn/rXYhV+Fpi2qHZPSvuKQ==
X-Received: by 2002:a17:90b:4e8f:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39b261ba63bmr14724498a91.11.1788577516467;
        Fri, 04 Sep 2026 20:05:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8f:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39b261ba63bmr14724420a91.11.1788577516042;
        Fri, 04 Sep 2026 20:05:16 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm10066268eec.14.2026.09.04.20.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:05:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 03:05:05 +0000
Subject: [PATCH v2 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-hamoa-sys-therm-v2-3-1cb8c958c981@oss.qualcomm.com>
References: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
In-Reply-To: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788577511; l=1251;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=rxreaSuQlW6s6Kj0djllXV7THEUegGiCKPjGOUpJHrQ=;
 b=iDk678TU7TFAt5gHT58aww9SHykDV+ublp7Jsgl5+M9+wQhRx0q8UIcLPxpzj6tTQl3YiGhjV
 +XFHt6RWwH8B2wp4BMHNhOSvLk6/qom5HfhqcK8rHapLy/8GOKmPrVb
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfXwyKpT3iJ0hyA
 kBSWmeUROyRLtS4Lyk9GbA4oaeB99679rxgO/jzlQ3kh/sVZV3i4wqU3WUE0bwjVuHnaD8C3Bgs
 ESGLId/h3A4+x5/SAlbQxtLtOUKtwww=
X-Proofpoint-ORIG-GUID: dKUJxTwxnlVKtS5ItiXQ-myXDbWQre5b
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9b86ed cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TDjc9THpsqGe-NSjT6UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: dKUJxTwxnlVKtS5ItiXQ-myXDbWQre5b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfXy+of1ZWzlY6H
 Vgki1ll/AK1tkcjNllWwL/HtVmtLBzkSNiwz8gOq+udS0ipWWmeQXFCP1QXeoWbaijWyyIaFFB+
 kCBQBwwhUWoz5Ulz5RsMMPE9vVp87zcR7gW4OnVPmpd7Knli8MTMNAhqq3fuIynvYhyGLXYZq2g
 spmvbExDD5YRpxdzll5Le7WaFA5uBDHQV4L6MRCWOCkkAhCrM3AvyI341EEtJMLYTsHHLrQPzrb
 +p9/GMQFyvfmMnupucjIemdNp8sySdpAex4r6iZW/QZy7ewil8SrNPGFrcegN1XnJUhpcQCwVkL
 uBMtfHAExBwLhRB3F8jm8SuBseq3ntHdLBC+cChC/4XqGUceAQn15k6cF+aBvjsZaftPsFFhIbw
 uSHiqdIrKRhFnhCe/lCJUaLoNI7W2VJ2UFXGFw066rxYqNjLoLbIRRGTTlSzYrAhnxXQ7wg2WCp
 2BD2L233W9KGZ88PExA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050028

All Qualcomm Hamoa-based devices uses PMIC5 Gen3 ADC connected to
thermistors for measuring temperature across the system.

Enable the Qualcomm PMIC Gen3 ADC, and it's associated ADC_TM auxiliary,
drivers to enable these use cases.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..08ff68643e21 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -800,6 +800,7 @@ CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_QCOM_TSENS=y
 CONFIG_QCOM_SPMI_ADC_TM5=m
+CONFIG_QCOM_SPMI_ADC_TM5_GEN3=m
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
 CONFIG_QCOM_LMH=m
 CONFIG_UNIPHIER_THERMAL=y
@@ -1699,6 +1700,7 @@ CONFIG_MEDIATEK_MT6359_AUXADC=m
 CONFIG_MEDIATEK_MT6577_AUXADC=m
 CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
+CONFIG_QCOM_SPMI_ADC5_GEN3=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
 CONFIG_RZT2H_ADC=m

-- 
2.55.0

