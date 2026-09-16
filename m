Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF61356749
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591624; cv=none; b=rLleDFAMUIS3YV1x77zX4IEgJJ/BzruTF0tLx3BFNH++SA65bQ+dYtcqaFAi3K5Aet+x0w1kSnNCxY/neTvriftaL7xTDZUfflGVGjAJU03aU4mzNR3GyOb32Aq/OqKidLmveCpybtbSKKUTwwVUnj5VCCCLyfkUODbHNfZ7EwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591624; c=relaxed/simple;
	bh=6GxNqUO2FgxW58rRGHvFpoo4MT/9X4scEBWR2BNwJxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfmQmQFSMCk2D0zTZ0VyGiVxMs/MP776bQ2BOx9IGfFfVoeLan4dhBl5vZIXeJFRDimYR9aB2mTrhZKcdkEP062LfQm62OVtiLH81jkFZb66vZ0qT/ZcSTx+qOv+SrAbyxSfqXAoaVCPoCK0yM8zeHzfKfQijwM+lKgWC2fvMrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUdlrjxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cv9QSRE8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUdlrjxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cv9QSRE8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GGiS18210642
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQBLZZIoByJkwhF/TFyPtlGrfpslHyh5fbM5pCr/2xk=; b=MUdlrjxT9MOtmtcv
	od+86KLoClScwNI7pYxvIsPqZEE6lV3ft3+7ZRZiGPiclPQy+9C5WAX9O0acjz3F
	A1MaU+7+tLz1OTZ129+qfXwFClpKxVu6b9wJzTSBzfrk3cAeDyjUXEUXxHFy6ODx
	j/D32a7VSfCROqwFuC3uOmjpuKkGNBuGtYzLEnepWyM0AdlKBcKl8G8DSfOfpMj5
	ArEmSNtzeJBkQEVtsI3X/NvfNtbZXVP5zKC6GaEQD9HCCQ4Xn6amCF78XLB32vpO
	GKDEuG60TX2+/fSKHYJlTMNGYz2A9xVMyn5k/zsRT3muJRD1LO1OnHleV8vZSfni
	oaRchA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxw8s36s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:46:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so18307185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591608; x=1790196408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQBLZZIoByJkwhF/TFyPtlGrfpslHyh5fbM5pCr/2xk=;
        b=cv9QSRE8+h/m4LOomwFnqu98a0LFEruS951w98v8Ac5edE/azyk6864RM3Yxr/64CO
         NzfVwnvKLbkibWmdia64ozmByiISv8BcH4EizpVirVeaWHPVdVBC8wG6LypChcVmTepg
         MZrf1sZX9eH1QRt/4ebxDEEdH+FPwFDBBOnB8SiV3a4pcGS5EQ2fkCvEDlk/mHnewRGy
         epmvxgqB59D4NePIpGF5UTfpfbsKbwiv5Wg/8fVvKkHt5nMgoYTS3ujSWKVfWKvFoikh
         ll0S+AzMmNd5TLEbZ6G3QZDYFtcUD192vbITkJCvFEUpXgku1UhQlaEuTHs+2y4JHE1v
         G76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591608; x=1790196408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQBLZZIoByJkwhF/TFyPtlGrfpslHyh5fbM5pCr/2xk=;
        b=03aOgYAs3EVKrZI9Q1nMI5RHIwH8eNLPIBHlZJyKXe0DHqt91fCBKKcC7G6inuTrnB
         hzGzQfeQYWWtdgENwBoSu6iQE+CCrSEjd49ZGlR2ovDnROUCZV9+4OINgf5y8GfQlfOg
         1sK+R2Tx5h9OzRUwNnu+et3t0+6dn1U5LxSGhX+4eE/YUeb8W5biKqdBL3XcJhS5ZiC3
         tJl77Khv5nuiWCj0Bqf+2WITQYVtRR7qqKcoQNwWva9vw9hjg3oqES0cGOyE6S3SfXaP
         B5nmY2N0K3kHq0qrlB/iOe0uhUSXYCRZ6XbvAHpTU5boTu49HeW1QHoaRrQ5wWHxNqGo
         +7Jw==
X-Gm-Message-State: AFuF++m+jsUYoq9feoXQ0oP23RWwYeMHOPrkHSRzLSBbR3/9QXsx71ck
	p8g9GPulx4hu40a6aGqUInCCX9cOIHL9S+H/w8maPXJ7mfH3mDGIUBQOrVtSq0/P2bYcq4j96zZ
	i3O7pcyXK7o36psasvaguRaXKBQD1KOxiJ7e0kP55k9YIuCavDZzf7K9FozhtQYYPrKc=
X-Gm-Gg: AYBFou3h6luGNPyMsy/CF6PJx0iL9fX8w64p67tETvUI5RejI2fr7dBUNjHxBuFLYa5
	G62j8p9duyS87wYqcgAPXA5HYIURDVvx7HJGCBgYhg9m367pup6oFlyuuSFdHDx12M0//bxYnUW
	FrOY0dWW79kT79cmkLF5IB87JI1Glca1xTGhpDAZODYkP2m5u5i0JxsrvyKDTDSCeEVWqmTa+BN
	9q/YljlTnKaSo8n2lbjEboaCV5pxTfgSmx3SCgiC2yrRkW6NJmvTi/bGZeO7Wf4RWDrk1b5vA/u
	nQ+9bvtvQFaTTpgGkcvE5RcqjWDt+1kPWk0fJEs/0hVar/3XD5wtC2O068CyGYHZooQ7gmj8FAE
	+Biq5b9F9I8LhNFKypD3In3M=
X-Received: by 2002:a05:620a:3910:b0:939:3a81:326 with SMTP id af79cd13be357-93bb78ec108mr717317585a.37.1789591608024;
        Wed, 16 Sep 2026 13:46:48 -0700 (PDT)
X-Received: by 2002:a05:620a:3910:b0:939:3a81:326 with SMTP id af79cd13be357-93bb78ec108mr717312085a.37.1789591607582;
        Wed, 16 Sep 2026 13:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 22:46:34 +0200
Subject: [PATCH 3/3] arm64: dts: exynos5433: Suppress a few intentional
 redundant whitespaces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-3-81b86685d068@oss.qualcomm.com>
References: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6GxNqUO2FgxW58rRGHvFpoo4MT/9X4scEBWR2BNwJxU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwAt5aTPfhhsYJ/7S7ksGmX63laaIX5Kywcv1
 gwg9bETL/yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsALQAKCRDBN2bmhouD
 12EED/9Sq772ZYxvx6Xr/M9kb/T8RvmMQ2f2TQ21UPoaItGwCDBvRQijdnDonosMMahZUtbQRzP
 0q/0celNEjLYZyI7gxqcgFcUAdIkGBgHwf6DDidv1oVAG6goHc9VP0qopBiZPWs5lnmAX0LsHjm
 Xz85uI9y0W8jqnUK3gqq1I4b41GkR1i6q83tkDLOVXKy13JTJ9CaiVD6tQG46zLiDhAgoc+xPRQ
 ThEKQPXvaNd+bRhGlscwyDaW7lm9j13yDW8k+AnkQizQq5QI0pqYLTxwQWrN4E1CINtKUlV9lWU
 k4Dhk+P9t2AHUE6nWmUlMAiA1wsx1tnjbXFuEnCLGJiuy0Z9Fq/BOdg1V9UAaCI5gHfT5BidyJy
 ULnatIBD9OcLpuVAyxDFQXUhqL1CM/KOsSMJMP3VW1jHTL49YEp/A/KixLPIhxZfCYb/1y3hfMy
 bM2k2PjgxUBf8PdPO+LIVRtYwEskZPNCrY+m23IYWLomrZ+agYit7HhQsLvmltv1X4V6fRaIthQ
 JS/ZO5PQlco2N5GKmJPBnprfGaROuPIt5sxyAtapVinaRl8+LLNLCC6eec+avJ9puU83BPD4jm5
 DwdvduSPHzwZnslneOIfI8DfZYf0BC/Mk4LqvzPSe942bESua9YFQ+LzHSA9hynz8Ku5R8fYCh6
 msjUQd6S8pwTr/Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: oFGc09GCfDy8OaAWonvUWLsCbUqneH27
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6aab0039 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=M_DGnhg9fGpO6n-mJRQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX6pDc5ddsMo4G
 eeavZoMqnsP6G/+in87lxkrEul39zW2yEmPGCUQL/e32oI8q4iVZJ7uCyAEuPn9GWEXinBV+pzU
 uDlmF5GHGKlaieGThTsSItV7H3PE/SI=
X-Proofpoint-ORIG-GUID: oFGc09GCfDy8OaAWonvUWLsCbUqneH27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfXwGSxMMAz/OU0
 sW1JtkvPO0/+klyVHa6ew7lY4ihA1hJycptp+lDfvF86cqrM4VLhllmxfWcHN6yJZx+SK+6sjMT
 z5GiWCnWd/RowWY/EGWI2TON2R4jGXBi5stiOt4c4jR0SY0sU96/DDfSvSoPn5c0ulAf0c1VVlE
 k9rknH33IIGPXYtmKzosSVqkYUzesGshBTJAOrhnnAzZHjhp0XPTfVwfyWxNiDSLLbyhE6a6sG1
 bSEgT2gfMy4CudEipu0arIpN5Q3JdbcHRZmtwHOdOZhvPnhx+OEX+uluw6K0vqH1mwLrHdxFiYU
 s/02PEPfnS9uJ+CELZNOJ0GbTOOxu4iQem2VRpVkRgKC36XXOtRqSHZfsPupkG7eUiWCEGaaz6Y
 S4qzhoqzpM/D+a155R+0/X7Ntyo4nIOAZJO+9zBLVCSRKIiZbaC12LUO1g/Hvv+6SsgA9EE7cjz
 qBIrXywBq87bzGuQYdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160288

Ignore ordering by address in entire Exynos5433 DTSI warnings from
dt-check-style, because first (boot) CPU has to be cpu@100 and most of
nodes in SoC are not going to be re-shuffled to avoid mess on backports.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index d318c87effaa..ff3f310da5f9 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -11,6 +11,10 @@
  * Note: This file does not include device nodes for all the controllers in
  * Exynos5433 SoC. As device tree coverage for Exynos5433 increases,
  * additional nodes can be added to this file.
+ *
+ * First (boot) CPU has to be cpu@100, also most of nodes in SoC are not going
+ * to be re-shuffled to avoid mess on backports:
+ * dt-check-style disable=child-address-order
  */
 
 #include <dt-bindings/clock/exynos5433.h>

-- 
2.53.0

