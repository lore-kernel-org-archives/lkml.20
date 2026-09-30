Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF294DEC39
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772392; cv=none; b=t31O8A4VzeTIPd4slajmRpk4prKjL8aeWDhldC4XROM2+I8BVwHyG9XFMxa/E0cnlb5IwW5bRBYP7VsvdMy2K2u48E5QjcbfF2V0oSfOv3sUdP+QNqVDIaaBICzXqHPIaIfUs8RQ/JzgGUaSLL8bPiVAYtxsMRMYnz0d091ZG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772392; c=relaxed/simple;
	bh=5nKDNvtW1OUJP6Sb+xn+Ybf82dLM6rIu3idQhs5Kwa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOQEvyYAf4j85NqqS6RFIbTlNULPZ1sAh2KxI/jATXCxO/n56qtRC2aBkmvJ6gge1ymwcXl56hMF2BDlyU1l76Z3oZ5Fy9ftE4InN9tFQjyaDdgHiw1WMV2k1FkFCvRJbRfDnvb6EsYAIgOfdWIxKyh8JzcxW6L1qqfOuRonNLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXbfSCBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXBmjcDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXbfSCBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXBmjcDs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7dN9319241
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CmPa0zk9SMg
	32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=; b=NXbfSCBfg1porQtZtgNlqqDOY8I
	LSa7oSLIBODYUWAR6YoE6rlvMLv2M4OI6Ir74xbvuwxugzwKRYtnd++SIZRkxmfq
	RthS6z1AaV/Ykedc+fgIS6fwVJBgbaH5DM0eReMiz23rjxMg847QCS2GYIefDjyR
	U4elJ1IVPsIg3gy8yXSomjkD1gxTsZKeCSZf0o4GKK6iB8TWMCIJafd2nGterpGF
	MrjjZScZfTGYC2JkNyoXyYr1YZlGWq2wbhmpN/7KpvkPBLt2z4Z4k6YBhWOhWZGt
	wyTAc+cyUPBceUUQQg3w5KJ0ytWdytvDt5yty3IUgyY+JYJ5evWiTg/5Ibw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfabqpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a77961b860so998406137.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772384; x=1791377184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmPa0zk9SMg32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=;
        b=HXBmjcDsWWPGvanLRCpnwD9N5lCL7pjEABXCJYG9ivuEnY3bikhd63/tX53oReTZOc
         byALpj7wyRpUGRBCnbgJBGwUlem5unB5Wlscr1Bj+nK5qjMGJp/uIy7d9w+gQ2zWtvTj
         c97Y7Re8euB899D93DT/yD+SAyYaXdSuNLMUqRAYTxFnlZmFEHSAkRXhoLVL+th0LhVD
         e8j9fQIiM3/nz24cw26XsiFRpWkCfcQj1uxPK5dGUAzM57qIg+FXQWTsYMuZvV8XWjfJ
         Dnl6BEE4r49nv2ZxP5cNHhBNChUOVYjww6o5yaY42YHGma0trGjmpZBf7UG0R5ROUZnF
         p1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772384; x=1791377184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmPa0zk9SMg32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=;
        b=F9vQTePCfu+X0K/F/3So8k/D7l1NCTOJLa+k0pa8fqi3UQq8UkaZZQnG2i4VaJA5lQ
         N2BDiMQ5f+So1betbnykaMj4MLyzGXh7Km2JYW/3HsB6prk/9cqYotOwhyjB4Lb+xrm/
         C8nDT7P9GfNns5JE/tl58QTVaXS26ofCihCI2F+hrsI3/QImKCglo0pmneYgGxvi6CWr
         tc134U4sR3oaElYXfKBM7g2eR+ODDFm0fAAEMVJxCwmHQhwYR3CGMH0yxbcxCzvXZJ6m
         GA9UG9iPPmwXsJvANGYtEeJuMY6LB5tMEoklFYH52EnVVsOOeO/fNR9lGyggBW6N4K8N
         SIZw==
X-Forwarded-Encrypted: i=1; AKwUvBwKz1ynHY4W4+M3vDzAH9JXY7zGzVjbHk6ceC++63CK+kEh75Al53Uor6yID49cBrGzwBPc4tWLBUkhFR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaS2Uy5dpHvznc4gWNfAWAjZtEGHbISpkp5U6n6WP0U8DgtoHM
	5RlG7n8eF6oaMLl/UX/PdPPE5w63Q/UIV7CRWx/9x7tI5PuyBuFme1M0roB9iT6AMReYHAsCAIM
	ANx8sy4qD1OIxDEUBjCriDAvzzVnjxR9HrmWxBCCBJ54M4zTFwZIzfhNYGc8yo2w+7NE3S89HAa
	A=
X-Gm-Gg: AYBFou0N+DzZAH82d1MJWwVGgGrCHZf2wDlkiPAYs44cJPPutyaSoF/In4LYjEcZkj7
	HQHsXFrDJlwMdJZh8NQNJQhvGHLOOltKtVT3xt/7qBe+n+yE5CsTwZuRS5xnjkPx6HDEzGp9Qm0
	FuBnJCRexOdQ/swpNyWI8OV2KSIbmD1QJyCzglhW4a8ivXeRdOL8ymdm/p658l8bWQxC9ahk/fs
	7M0TFa65En5qwFo9qRHmREhg7wfqTwnWmI/X/xOpGNHA/RDcFNn8qkW9nbFvwnZHSS3T+N4rs5H
	ZjreRDBsBEyUuhmjO8IZe6mjghUBZaDe/jPx+T4b8K6gvH0hh5PCQxkozREAiAFs+vXlYJyl8iM
	LgrPwCsLm9+fS
X-Received: by 2002:a05:6102:5cc4:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7be726b9215mr191792137.9.1790772383901;
        Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc4:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7be726b9215mr191776137.9.1790772383393;
        Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/4] arm64: defconfig: Enable pm4125 audio codec driver
Date: Wed, 30 Sep 2026 13:46:06 +0100
Message-ID: <20260930124607.1109167-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX1IpLG+p0tEJ3
 IryBom9pKO1Ca5tR1mJfYvd1cbpo7C4086ys4ihQO4DhlOuJg+GStTbB7Sd4bwKIx5EZfZ8Fmtd
 7Pk9KAL1E08qvjm4OrcxADyPIvky8XerMTCCIvFWngGFLOXb9h8P8WE9BDpBd0mDgJ+xL+Kya8U
 3KQJcXX14FWyjxQWxYT/u9qrjgQpGI4u93fL50OKri39ihLkBF/vxuB/3P7INUREiUlw6Y603kW
 BsUs6iPRyMNikHhApb0wt8AusZCQwRngndw4hJC1cSoHYHgFvndZzwihiRIwSlzAsfK/E3klS92
 dvg0M/FTCR1ktf7u9wR+1bcqzp8bZ+gPJU48niWyzQ7gn2YouPOnwgQt5QsxnHNF7+4u/E5DPZh
 cyZ15mGklgZ93C0zJLC0DHfowKQotwIJ865FjFFxzMvScooC6rsqCJuLn4nscVGtatfesVyC9B0
 VCe6UmqkQk9J9U1Y83w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX99LZUhooJJyd
 zlG6Uf0ZJrzqBVNilDY+pdulmEEtXSYs3iLLDAY1VY7YrVlRdSQaSV8lHPPKjUtLd/uEhNtFpEh
 BZ1FL5lwhmRf8SBSEk+la/Fpq4wHzuM=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abd04a0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=I744n4YQ6ztvz6u6AXgA:9 a=gYDTvv6II1OnSo0itH1n:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kx5z2U4ZvCyY2uQLjRwjc-Rh6YKvCZlV
X-Proofpoint-ORIG-GUID: kx5z2U4ZvCyY2uQLjRwjc-Rh6YKvCZlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050

Enable pm4125 audio codec driver that is required to enable audio
support on Arduino UnoQ board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..6c41348d1abc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1172,6 +1172,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
-- 
2.53.0

