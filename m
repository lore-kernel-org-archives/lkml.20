Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D9494817
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046981; cv=none; b=kGuDwKphL3MgdT2HiHuVyb7OkeWAmVlvZjcbR9B2AdtLL5wVm1EgI4/E2YuWs7ViykPXY1qWnMkR33qEjvWw6tqS6GrDR1AiHtOiddZsiTGPQ5xyoe7X0zfUNxsTA4C0OjfxyNyLq1KjJePYneno28LaYcFP+TqFUPRVeGgZCg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046981; c=relaxed/simple;
	bh=qFrl7WrgaxIYzKwo94j2z0epeDU9I+tiR1m//FB9MyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKtZ2K8yIqr/+8jaYFaiuu7OXkhrSgNXbmpinlZz9p7VkKH/T5e8uQif4WouDoRtK9cohJjJIyFA9IjElP1B84t6EAgvciHzroFoIokaqGtEMLq9SV4pmS6U2N+bo2JotIJqQ9Xlmq5Q+OdMeyt28eYttMt5Rk+cfYFeO5F+wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nd3jh4PG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apoAwQDt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nd3jh4PG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apoAwQDt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7jr5918747
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=; b=nd3jh4PGqwzkKwsI
	82Irm8pdNlqoMBl2GnaCCmJevQXHyP88D4uu1+7YmZiM5sA3NHUTggHuX4H4/V3q
	K+spwJT1/HNTqs2lqON4Hu77iBmWDRVJxjpdVjNa04gGpmH3JCkbZWxWwJGFollB
	bQWbP3i3cJ5EPXS3xKRQ0L0txsgiBIoa96D4M1GLHhEK0ciLCV/zgBFUuoOonlvV
	4X2nplrQJGeAKyz2UbZ+xFGUJ/Jp8S+YQOonLeKRid56KoiCPRF4y50y1jyEgLYK
	KrSBkl3BS9M53BSJFiFwAUOixyEKLz1PjHHb//CoT46UX2i5ovrEoh6QLb5SNAC6
	7Xouqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygv1kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1675136a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046979; x=1789651779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=;
        b=apoAwQDtsJCiNMj5cV8399Pzz+RsQVkTB7TwYznifJKZZhgrQ47X2UKLMNiw3FQ+LA
         SS9ab/jQG0OKL4CHKw/KybSO8q1a9aJc4vdcSx32wrRk4xIQYlmzp3h2S/TaKgCmndEm
         OGJVxa8jSrP9toYtzG66FKxzOBCCS+UNvnpU2lojodJa3ZU7dbvvYumzsMyiTVes6Kfs
         wOMCq9HYnailMwETsqLG0PQgvLIZfwbR3UqCEkrut4Snz6QIsaVwo0PZgilh3rVveJLC
         5t7EWfvwb/3XeR8aorxP/Gjlugc9bDx0WKSu05hzOgc/wpFIHxsnAnvp5lB1p63WKXPo
         /rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046979; x=1789651779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=;
        b=qPUcLNMR6gL4jH7P9GLQJRyzJsSOU+Rg9+4E/MaS1mqJi3nKk3hldaAPvqhf+5v+qb
         NWMKiTl+8MM4WcSjD5oXnwcDLm9dZKOPcUc023sSeV8j4/a+9bofjKjSkF1CA5CcHQiJ
         B2VVwhWJivkE7ruqvDO3/M5zrElpRh6GuzwzelJaxRdrMqiOSmatMfsEefMbfhZ4760Y
         Tsw2UODc3dDoYmS0T0QQLuY8tglKMOqM2OLSVtzo2jnL8sbE8rORoda1pbRJJ6PBMU+E
         SB8tim3hB7tj2IXois7f2e6R3bVfD2zpnp+FeaUy5AKMq82EGzD6r9W0/s5bExcoj7Tw
         EN/A==
X-Forwarded-Encrypted: i=1; AKwUvBxMZ/AJ7H8kFqczSXMM7m4lOXNTTU/PtU5aJDv7Y96QMDR63KMyeLz9PcVLy5dle+RNIFrXX3i4KLVMlOg=@vger.kernel.org
X-Gm-Message-State: AFuF++mUWwAz5kTbUkZoPHg4ztG6iVD4wH6KiiLT0pvYEBrbxkmFChx1
	hXMU2oCGJO+3q1fyXHXUyoXMwD4z02dkQr0XNZUdyr/FrYy7x8Bi0GcgIrzuZlxZ8u0W3jqHgdC
	ygZMfd9Kv+bs6IfmL7MRNN0lYb+cwjSw2ZU17jefdLxXbXejo8en33JG9kVkaxK5skus=
X-Gm-Gg: AYBFou1sR6zbIou3GaXynao09Aun3RDkXimsX0+zkG3sGMzzM0m1B60iO8lVdTZevE2
	eFXF6w07J3FYP3QB05O9s6EIwWn6YcWFGyuA/fxk+gooDWEBE5291Y+ZjrJAroHi+fAkupYWPTL
	B4S9gxSBbHwTTfnCNy0T6UhTq9muAlynDmN68pPTu50opqku7j3bZBRJQNTpV1GVhrgShXZfiWc
	sK0xFVJw/B9XTL1jrwPtFw6eu4x+Po02gdRv+w0PqUsihQrwa6tT9nczGiJ1Zs4rTg2s0B1S0ml
	6zfN252CzBbpRdPq8/9F0ZMZ/gGuARFUJAkWrBBe+QpUNKNBMJ+KOxngdPdf/dYjOMGp7+YDZdJ
	2ObaO73dxqPb70LzCfMAiC3SZYqru3g8F7Lo=
X-Received: by 2002:a17:90b:4ec7:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39d77bcb0a8mr6587659a91.26.1789046979195;
        Thu, 10 Sep 2026 06:29:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec7:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39d77bcb0a8mr6587610a91.26.1789046978774;
        Thu, 10 Sep 2026 06:29:38 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:38 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:56 +0530
Subject: [PATCH 07/34] arm64: dts: qcom: sm8350: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-7-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1200;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qFrl7WrgaxIYzKwo94j2z0epeDU9I+tiR1m//FB9MyQ=;
 b=5LlS/DXiwsqsZ2yYbBg3z6Km0NRyy2ifaFKQTtfi0sZD6SvYQ4afWbncG/9GBAt107vf9qvON
 Vvg1W/oFxsFDz3C/NBnR12HdACy0l1NdMyPJIDFfXPdVOZfBdleFZWY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX3aFCdpxEzk9g
 8sca2Q/MuXjW3h9vTkhyUl0NLKlJoPLl1J4wuCPzwgT8txosJoW/PqPBgHGBIbtp45DEVEk4xyu
 AEn/X2rnSmXbTGc9Y+HMRyij7OL34aX7zGRyVdbxQrP5/qWVpNr9b9SLgpBK9Y8lhK9LeUf2bpL
 StExABeyf/F+aE3mFMWjaunPKpz5MeyBbmVnwvURqYNcP9l2TdydyxsfW+PpgeHSkkYjjrvfLKK
 Xe/hTBXJ7W2KqW2hAITcuMYcjNddj/GMt6Z6XU8ket5y70ZB3iPv6mxapPWW14SpxxLhmkV08Rz
 2MksR0ZdUI51Z+JXPt17OIDbUTEH4TdTLVb6RK/EoWe3mFDN9FbItZjIMMi99fcJS3Q9fTeAvJr
 +mvxN8a9ahMEhM9xch3KXEMNQrkwxu/8vsrNAD5sgoe/SjsoEXAkP5gETy3/N3qkVfLHBSmB97n
 VPSX3781YO8Asg11oSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX47JyT2zNB3zB
 S1as6s4gPOHIdvNHenxDg9LBH3G96x7RgLrjbaVvAPch8fD/Q0ROxfWVN6ZnZ2xnjeNWl4L2rQ3
 qfpdpnaWW6woIq85sjuaVVsnnxL2wbU=
X-Proofpoint-ORIG-GUID: cUhl3G2CwYXPLJCiLdZxDNpJXnYVKd-e
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa2b0c4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: cUhl3G2CwYXPLJCiLdZxDNpJXnYVKd-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index bb93c3e9417b..e9b9e03f725e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -500,7 +500,7 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -514,7 +514,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

