Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49197493625
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782651; cv=none; b=UtBFf6QBosGL5Ry0XU25a0zTGNrXbZiPczE1IrwrmMRDNBn0XZyLFlT4VOwhzsWlkSX6kAfO2QAjVwKOs/sXcbRIICEN5wKpCTyajSZmOtxRN1qwbrTTDsZcVlaT8ZWuj4yl1/ogEvGl8tFu3N4IRuhzFkLL5sjATI1GAyLKJbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782651; c=relaxed/simple;
	bh=LryhUbfCI6kkeuVSJtTA8hln198JB6Pb8SSyu1QSOWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ph0pJ5MZBCWL2mlQLm25lPDYlTHSwscqhzXu9mRxuCSDCHu0vxmGcqkpfIoV98A3TJl11pv9Yk2le596R/EkM1LbnHDDqR/Iv3+LfdiWla9Um53vg4FnZpGDMnkL4UTl29Fcj/WQupJ9Em2dVb3GT/t7psoIX8Gtdm/FHqIs2I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=beKKEdg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDr7qVap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="beKKEdg6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDr7qVap"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvKP1496168
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82ofEcO83bQPd7jzXkJADlMmqIZYW+XTMWLKfngPHuU=; b=beKKEdg6vwhQqE3T
	7+WIzyyD4sT1MZMEitYBIcphABb0e5kf0yMdCxKwwXkyZUuQ3UAc9hXL03B59XgP
	rirRAMSIjdR4w/SOcYqYgP77tMkQBJQ0G7SkX/8aVSJ9mHk8p91xd4uyVYu+gLyS
	5wZv8SHqm2EsjZvH/iMVZGl/lPeWRSjDGQ6owi4TdVXg0l4ov/3CtMAGpYle6vdx
	EN3YQpzTkAfX5XJZHs0Y1WYZQzNOVvzQ1d2s4wyifx+qWq1CHEuvVKbjo8szUoT5
	6hMhLM7UibE0w02lP0HPLtAUniqsQIATjiJCHjNikG3PwlyzoPj1WZqilG9xnHY3
	jEzIjg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk872x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:04:09 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b34ad165e3so1956051eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782649; x=1789387449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82ofEcO83bQPd7jzXkJADlMmqIZYW+XTMWLKfngPHuU=;
        b=KDr7qVapS07j5kzz6lGsexYxf09zbAF2itfYFJVCWMH7gzfJswG4wgOkWJvOigTUjU
         OtAoWUqy/6C/pKFkc2WWvi9BB5xdif8ceVQ9iqRUkxOJ4oKrnryCdImQMPwfzEQE8Zl/
         /zf+y0hDv5Ym81k1FRvbMyWlLl6Py9zlHHBKmLJC/AGPHdpZohF7/NIti7WPTcdnXYev
         osfDOt/5yWoZKGoO7/TJP3kQmHhhHxSRjs2+TvDWpgroMCc0CsdH8KhzggiPebIn6m3Z
         t3E3zvlwy7UF5cOV/Je/0xR1eDxcwaCM8rbKTOlXpocXwV827v4KzzHNO/C9Er+A2K8q
         3RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782649; x=1789387449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82ofEcO83bQPd7jzXkJADlMmqIZYW+XTMWLKfngPHuU=;
        b=guNOovbOZD2XYkWAQgT1pUhWWAsbGH/qomWTYR13zLHx+A2dk/acNbTrSj2gaZH5xi
         QqW2GwGWkkTCBDxer42a7gtT2mcivdNKFOjdRK6MPKOK1jEJq6ZZbYRb0PJGF99MBtmG
         out/LgSvwUSc0Xbssis22obtZBs8lD5r3i0tsXDlydkR2URM8L3lwGn4Ms+oLWzl93bF
         kHBcRVg6JlZdr5vaJYoe3JwgylUFSnrFawKAnv9CTpDamNLzhFPR23XDyV0MQkJua9jH
         ql2NuPbN9yqJ8oj4Qm5awOrYi1PMvZtth37tA/waEAhHX/G7thrbsSY0BFQRe0HdLxRT
         ni/g==
X-Forwarded-Encrypted: i=1; AKwUvBzQSQZQ8v5w+USI6oxQqWxKtx4YQ1XRq7yQo7F8koRkZ2PWP4+yipy/S7jB+vtS5HmxcEK6F34GmCrw8Ic=@vger.kernel.org
X-Gm-Message-State: AFuF++nTCVL27S62pFyFfPfiVs3ajQs3g88XmJCjGdS3fxfUqDPXADDw
	3fVKefK6NSiUIKNcdaoOGMgMrPIUyxLCsGDahJpceEQnER7hGGclaKVpBjelBOrPauIjoV8IWrj
	b7zGz8Bc15RJkPdEyE6Q2f2g1zULrxnbvvT0kCkCsMYT0wp/jkvLxbFgW4nlHZuAH63g=
X-Gm-Gg: AYBFou0a9oa8CUpiNVG6lUKCKx08n56dx1pMmitZkbVk6b78o6Oub/+MdEjBr/aXLuN
	Cgk596BduHHiSUxjd/sDwyphut4lhrkFQiyELop/Qdcru34ocMb4Wsdu2SV5jk1gGsxZJG/1oK8
	qCi3ygNuK4esyiAep1omKRPSJ3hEGLPq2+sTd/8ciL+I1j64CVe7JE0kjKAkVP+EjSQ2hxl+/ST
	30RjqeYrL7pzXA/SzTZG6WsdaZSwLsaEdLa3t/s8GweDVC+dF0XZqwRz+/2BkpUi1weRx4VlCJd
	FXnRK87pIM26B+rXHCpLMbDxzmjzjTJ2VCsOUhnjAp/l5JurJyekT7DEZk4yE1mV3arVkwNCoJZ
	XE7voAN93u50V4BwbAV9/CVFYji/eRxrGKw==
X-Received: by 2002:a05:6820:217:b0:6b7:8396:f3d2 with SMTP id 006d021491bc7-6b78396f8a2mr10733573eaf.52.1788782648582;
        Mon, 07 Sep 2026 05:04:08 -0700 (PDT)
X-Received: by 2002:a05:6820:217:b0:6b7:8396:f3d2 with SMTP id 006d021491bc7-6b78396f8a2mr10733525eaf.52.1788782648095;
        Mon, 07 Sep 2026 05:04:08 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm26345960eec.0.2026.09.07.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:07 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 17:33:37 +0530
Subject: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX39j5/DLIyumt
 Mz/5HbnniD1ryRXJEFhfY7OObd8PTdq3kr/e2JpxG9llt/ly39Jf/HeVDH0iakr4kWalhVgJGMG
 GEG3rx83KUNjox9QpbpM5uw1ZabC0Jg=
X-Proofpoint-GUID: LSvbs11Bm9YshZJeEevNBnldfNy-xF7L
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9ea839 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Oj_9Y9B9b6gWBUhzqToA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: LSvbs11Bm9YshZJeEevNBnldfNy-xF7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX80Wv/4VMeU9a
 fro5fNbcmthguT+bzu5U6kQA1pVQDZfBDjcLpw2Tlxfl8UQAiU/9uhLqoizU9dNtvvb04dY6UpG
 sy1CFquBSecso+V7I1quPpbsQTkPM53dfEbOEbuuR/HvS+sPuDsgiCWVwnaCUszY8PFiFDo0Jt6
 Hjtgr8XBANHhsE0fdWe0yNPPkllIsZEKsU7Yz+6CN40JY18eAFa5RDQwTuDBfhXtSmd5swluXKY
 s4d1BV3XzkQCK0gdECK7MGtJ9lWVtf7WeKzp9P4KFVOvoK+6Nl0/UjzyOxMhz6P1YfXMlTHC1SH
 LAUhTkBF2Dgj5vLBHKkCAST+MQCk9Xtc37iyshnbf5k3awlXF84S5mEEsUMAOfCor6badSCOGd4
 3+HF9UUxZLmExv0AfiPSeJ9Hbe4M/hqeBoo23K0DBqd5OPNViKZMz9P3XYdqVcBmcaidFX1SAun
 vFOsCGhpyzGXyOZra9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070133

Shikra is derived from Agatti and uses the same QCE integration.
Update the QCE node to match the underlying hardware implementation by
adjusting the fallback compatible and related properties, including
clocks and clock-names.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..30c7cabc058a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1075,10 +1075,12 @@ cryptobam: dma-controller@1b04000 {
 			qcom,controlled-remotely;
 			num-channels = <16>;
 			qcom,num-ees = <4>;
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "bam_clk";
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1089,9 +1091,8 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x96 0x0011>,
 				 <&apps_smmu 0x98 0x0001>,
 				 <&apps_smmu 0x9f 0x0>;
-			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
-					 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

