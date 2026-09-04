Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AED23E5EC7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509808; cv=none; b=hRUCGwFr44A3HY5N6CyHC4rQvgUsVCBpeyLE2fXb+638WsEDmzpHoe+0AMp82CcP2Lxrx0Db8SfnXkQ3AVgRaNoItNPJqOyRb1xWs0ZISApFTh64WsTOIbGYCYLTkiMIZ4j0wnJvZwu3OMyUJf+uqHWgVXGeRZS+gvZ5m6QTX98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509808; c=relaxed/simple;
	bh=TPZ2UeL9Yr3m3dbS1QU3Mf+DPrHdAp2KCtxoGMEFR0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWfmKnUjzb30Nn0390cr1Px4JJtdQUKnZaQJOao8ZW8KlAdUbPL3hAnT0tt7CzdTrcigCoRMj/fzB+V8//31cOoNwfR3MSpVYFxoYaYWV500igLaGwAGD4niPvtdrviRtxm+Jl72a5jGnTCjBhP5C4od6G7yBb+ZgJtnYgsBEM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6PpkZVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWrjTTeD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6PpkZVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWrjTTeD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847n22E1770747
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 08:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXbYoRmgPzS
	A4gebf4xnIvSIMQ4UDRbdcKU6SjfVKsw=; b=K6PpkZVEeaPQoGj4nPuhqS1Wj2t
	Wsaq0ZQoT+8y3yRond7ARPSv3jrlHIsUmr8sxA+zTZZOyG4bnSfkI/snZzIf3CAf
	a9tl8HNfwbdSAzB4yEoYnIqJUBuonCqlVWU7Q7BSlz5vZu6nIqNqCS585ICwTBzy
	eOPs+Y6+SoaKjAq0DxCvCFWwnVGRo9hAoRN+6UJJ0SwLSbGJocg+vuAdYKsPCwek
	efYs0noPUzb5YXS9ouPDku0e695h3C6I99/Gunn7BzoSRcupZn2Lwkz5aZkUEyBx
	xWWdA4NvF1SGZBRgvkxOO6DytyBPDsw/u0vTivR3PfnNs5QOPEyA7sAFtIA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqrsdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:16:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so959416a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509806; x=1789114606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXbYoRmgPzSA4gebf4xnIvSIMQ4UDRbdcKU6SjfVKsw=;
        b=bWrjTTeDad7PmeZOoGlZVkqPv7BXF4FVkr6KcdeZuppI0OwWlGR0W7nSORqnl97kp4
         GZBIxXBiQMRoVl9PwSvXpFZtZPPjqh+oYU6kLxvx/xjjwQ8qILCL1dgoQXvwONCJ7yhB
         JrmGuRyGEt9u3X+5oGrCWI/Gh/OkLIRi0WtUjc1JaYMWMJIH1wyl90XMmmQhKudMbLtW
         /nwWxJrXi6/DT2gLerftb8RGkd6entMFzkGDM2kurAyqjloRRDB5THJ9rS7KO4PDYgrb
         sJeBGUUNXI0UVgnPwsNxlx9QUkJUKZ+3wE1z0RBRMIiv4AIkHDIARzEcVJr+wOh7R/BX
         K93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509806; x=1789114606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXbYoRmgPzSA4gebf4xnIvSIMQ4UDRbdcKU6SjfVKsw=;
        b=oVwwEm3VKcALr+w/MKZDiS1bsFKGkAal2Osuh7qL31kUk5mB9MSgK56JNKZS9w9dsq
         /6/Q07InEbK881OIFuFYXf9+07Xp9eozMY7uF1Xl8dFwn0HNNBYrtK+PKOH9NQ+NaBwH
         7Stf6QlfcQ5y80fZnMRAwm+A9dgYv/D8avuDqCBt3LD0FIVte3a1ipn15PiMI3MlIR7T
         LNjHU5HRzfAqp4qSA5CJb4d4lmM9RpeDsffjvRImJk99nY+qZuTRh1nOZNigLpAkDhhP
         o76dFiEEiz9lyu+XMcQfvoFBjreCQmfMCRJUCScKBM+LSIAZbTlNoq82bbmW6DcH0R+Q
         ukZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx95iXlHCp/JEuQwGRcieu4vWWPsmW9emroOj1A29ZQxZw+HrBvkpBUgna/BsEEkqCUyrxA8zL7KQjjaY=@vger.kernel.org
X-Gm-Message-State: AFuF++kX5Wli8wrCCV1z3cPAVa3CN+mhrCQat4UZaYtvybgpGJAur4+Q
	jjQQP50fblQ6wqgOT6YFQ36bdVZ6OKs0BxFXMB0kXgdLmhvNmMo6oX4PUdaEsevqGpr48GxCeq9
	yrx3AkHygFEWc3lfwBwm2Ec+fyfiyS+HAg7lQ9KU+Z+sK717OK3V2MnFQMphWXE8XhgE=
X-Gm-Gg: AYBFou0XLAWGDAMCOBsB52GTV7ixHDXBhNr03UNeTiHsPV92dd74LZiSjiUdaGcSwvg
	euoUPjDGh4TAUkZtEE+w8fojJscLD36GN4DjBwrpC75DTY2+T+9D3P6BOmDWKe7IUxvaRzs3Kuk
	zLWmeiWpD7OuPLvT9W0TPW6aDDRsOsk4FRI9wSNCYvx4EbxtF1IPsMCoUZiDz6AyTzCklLSfN4F
	4AKGHGWiXyNIKmtRhY+d6e3JwlQB1dmPBDjCPn2POHCRKemg2aF8RrW7V8ORM7wlNV5Zh50erp/
	C8ihDaePVUFuEoA7JqK4xOw2NnbT5uDAlF1fuLHRqBtsWCgU7WvVZnpY0TAFH4VXdWfJVBDRXSI
	V2zZ6Rh+FbOk3aIFDV9bUvGbjGH0ZnGCI+u0EXRa5C6Su/z9CN0PjXAcmUvKx
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr7555889a91.9.1788509805911;
        Fri, 04 Sep 2026 01:16:45 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr7555828a91.9.1788509805313;
        Fri, 04 Sep 2026 01:16:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:45 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Fri,  4 Sep 2026 16:16:15 +0800
Message-ID: <20260904081619.593602-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX8b7u7vaGTnOv
 +7WDr01afS1QSjXqlKARRtzglyvFmYUwYt71OadQzj2t2qZ8mbUoDJPh/speTg5gMQsT136zC56
 r0zf10BR3bDUEkCh5w8aLRalY63GQiM=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9a7e6e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UZuJur8GfllDSyYqWHAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX0J3KxQNRCk9g
 oBtNcIAeBoYSQEGd19n6QdAnulRxd6AuSrctd8Efhy0INHKWZ1r5xG10cnqdK3UD9b373Kp/y5O
 w/mXHqGUGnM2Gj6JeRFUxSBYIsLBeAmUW10d442AMc6OmbtNWHhz7VqsgDVvoWIl4obZoifd/yd
 szsQovIS3L2wqOWD6mYviUX4ibBiLXsgXvxcRpNip+cTdanHu6rMfqLRnhmIU9VaJJAYHqFyO5d
 i7r799qNR853odJjJAqXHu8OxeCYX1h/b3LnMC0Vioe5hc34hBpD4pGN1hFJl2H8AdSE1UEigkC
 vTgs8Vaex0cPD+QndNuHtQkYbPIfMU421w9FvEfRuLHTzpit8Yj7/TYzmRYFOyTKkqNwwoKIpZi
 IS45q4C1vP7JFUBNonImm3HWV1O36ufLnhoDGkyMbqrPqSmkTjrtEEtmsO6qPviufZVyxBD5Fqp
 B0ozYZ+IgvLJAGlk+Gg==
X-Proofpoint-ORIG-GUID: DCYJ_GDdbjyEdL6TK3g0846jxzl9SAmm
X-Proofpoint-GUID: DCYJ_GDdbjyEdL6TK3g0846jxzl9SAmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040075

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..e4c3aee441c2 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp1.mbn",
+			"qcom/nord/cdsp1_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp2.mbn",
+			"qcom/nord/cdsp2_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp3.mbn",
+			"qcom/nord/cdsp3_dtbs.elf";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

