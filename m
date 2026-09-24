Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4950649B201
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251754; cv=none; b=oQEdhAnxELpBcVBUSazhXC0puy/u2XPaoj8VFbrsFiiy5deanndUSEbOIfZdjzD6z7zWgr6jXXZ9tZ8+UUd53C+COdOS4QxWvxT26CQA84eJGUOBhQh+AE4ijzre6PShzp7oUPJRqVkN0SgyEa5ANWuy5HGHM9AXXhikrNyTfR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251754; c=relaxed/simple;
	bh=go23fVzIuD0WYJGICdaRrnZaMgZbehWOjW07vqTupvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9GXs7OOGHK6d7BI4FYul7mk6IvdpRxSn3bd8QezV2fS0LPn5AITfnlDdD8ucx5qqHjzMXq2xfjAGa61yEkrgWfHT1UVa4O/4Kw/6aQeU5UOevipWQMbI3N/lh6godaMUbpBmNIWu3xCLWvpjFADrB7YA37AukyNUjTY9nVMyuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tc1iqxhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIqI2D5l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tc1iqxhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIqI2D5l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4WuD3134060
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YyIrMqDjgclq6Z9+jyisqmAzAdaX1WE5GYxOifG6sPA=; b=Tc1iqxhL7bbEo6Tg
	Ww71+63N8u96AutJxODRG6neb6qhCKFmveCPPuSryri6r/VOAakaE1ZVvsNsahjY
	kLN9tKtnP4LBF/wWAKAFiuI/bCMfTwhezha9wEeJBUrsZJo7SMvDf55hSkymvW2F
	FIIrbpGo8smlrxzjvtpRInQ1ZSgSSm4JaDB2D6X0qljJUTAa0jOnXU93V6otMmfO
	iSxtpHgKrASIyWdyOIFkjMusxWaHywRVzKdHeApxMTfKtEVZ5daXTy/jpVD3AEK1
	xdK0AsqeypgoyYbdXiHPgHmskC1DwmZTa4Zhe4W57yp6pwaitOLC01YXneznodwC
	puXJ5g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1raggq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980989f5030so1690698241.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251751; x=1790856551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YyIrMqDjgclq6Z9+jyisqmAzAdaX1WE5GYxOifG6sPA=;
        b=PIqI2D5loHdkdCmJE9AT47FXCl3Qw1lOh1Xrq+8/pJFrfb2xlmlDnt6EtkdcuDikUU
         w1BKnhj0X7IQrmlCXSN6neL8JeWjsajg8VMIi5XruUZLni6rci35631VE/vxq4Wht+Cg
         IF2C/ydXZilRiED6qDCRN6IBH6Q4xPYDSK0UTK05AbNJUPJLaX1wvx3xK6Ukktya7xvj
         hVW1Sof9CZoo6Hy8JULWSx+U1MHH1v3OeuFPmrjiQ4XBLD6G+nq1oneTnRKeoQU9k/sU
         eEpvkTj34fRyHwYYLGEMhU7Ng2/Dftmn0lgQQwqMrcRXbgRLwlac4VSp1qEoASLj67La
         6rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251751; x=1790856551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyIrMqDjgclq6Z9+jyisqmAzAdaX1WE5GYxOifG6sPA=;
        b=eyTJjn1PDn7AuyCKfIOHJ9SBHtFOjrMhptMVpNBczyNDD4dHQeciBxNOMcpcCkBL9s
         L4aq3JMavaANKfyQZgc7LH27xDdig38mcX4gli/JODYmYwDSOEYIYy3XpeP4bTNI1JZO
         DCudiwwaUlWn6lwWYfa1hTGH/Ho6engTBjHyjVGl3+HjLzQBUTV5QzCEn9MxyCsSxh9Y
         HbyQYVwwkUGzgmUGCzIa3eMYBt9Y7y1+btHKuK2udl8uMMZxDcOxLFf9Qj4FnP/NugEb
         qNSo9I8wGLun6aBJ2r+RKZNo0sb9zBkTlc5EuI3C0nlanYdYH33IuwqjrpoApHq5C+yR
         BFDw==
X-Forwarded-Encrypted: i=1; AKwUvBzSyZodCku8kOigtuk1KheIhtHft9rve8SEj9fehPpZLdT1hCHzMH3sjHCotP4wv5Yw7BpQlYShKEHGYbc=@vger.kernel.org
X-Gm-Message-State: AFuF++lopH/Sylk1kbQ/yMSk+C1kcCKmusvh+0+OeMacz/INNleyC/UX
	dn/ZH8zgMo9UPTalQgXS99FPtHF9qqytazuCJdg+qSXvIb9ccBP26qtw2ef8Sv0Ms91KeM2pX9L
	XOeDiN+nfaCnRiTnqJNkeEZeJIo3jvHhqFrZXpi9lGuOex5VmzhxiwjSVeleAEUtll7w=
X-Gm-Gg: AYBFou2k/WJ+MOIK5dNk//m06Wcwctzs+46+8dHSTvV83A4cfxWCVHo5aZwoc2/f0fx
	Ou9cguuZqetj3RYfKiM1TVNO/tWcwTp7R8iO7FJPqhPCoP3sVi/XYleHTDYOZarI2GZs3mNCIOv
	5ctIiINiw36DJQP5NoNyD8R98ScM4GGYvg37rT2TLwbXOaCoNURgdQEyuapdjkLuW0ZLfwXR9qG
	0R/sl3F2LVr8Nmj7D8vBatGYezNoH5sWqGbyLg8wRCMyIiEtcbWFPZfCynJxzyzUv9dg/eL1YON
	RKw6qHocK8BHhVotTp9IsxKMBS6mKGZ8jCbhrcXh3n803ZYNgopijsJQsproRx/MZ+4nooTHEoM
	+ywFP570F
X-Received: by 2002:a05:6102:2927:b0:7a2:568f:815d with SMTP id ada2fe7eead31-7af1e6f7995mr1166709137.18.1790251751357;
        Thu, 24 Sep 2026 05:09:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:7a2:568f:815d with SMTP id ada2fe7eead31-7af1e6f7995mr1166690137.18.1790251750772;
        Thu, 24 Sep 2026 05:09:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:53 +0300
Subject: [PATCH v2 41/48] clk: qcom: gpucc-x1e80100: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-41-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=go23fVzIuD0WYJGICdaRrnZaMgZbehWOjW07vqTupvU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJpnfB8dfrJK7m9Gkr6VD0RdoQ6f1v8mKbu0
 3AUwXBX0WyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSaQAKCRAbX0TJAJUV
 VtGsD/0fwn6mHHmCTTYAyLwWZ2WGae0TxPyeehWERo8g9Ersu7Eca0iTaVkCgZgi1By8fQGCkTf
 PFG8KU9J2t4GlnU2w9PpcsXoLN5TwIJp10qBmFrzvQPCuqwM0EywjZ9YMOSAJdDqDYYrYVoLGdw
 OcBswQkxoxt6IXXexbo4wVkih6ksNQeBKyEA/UFQCU9rYao8hAmAJFVizlYhhLjAeAYvZ7olLNL
 cTKtUkhePWQ3u1+gWTKWVcmSwg2++q/2CteGRsugGHdAPOTov9TzBytCS6IZuaMenY+d1RrUEtE
 CZJoPK2fCMpFTn8/OtNSKfeXg7IlOEpwhw1A9AZbbJCRwMSgx/zXfkU+T4BbllmaYtS3FBfyFVR
 jg9x4+jMFpKBzXAxxKwAe39W0bGcja1ECanF36quYKJbF2taA6iSUomg2VhPoDesLhZ2CB8M4Mb
 qghMklznvQknpSrkC/xbQ/LEeW8SeoPea53OddjdAHtezDpNq3DzE1JX3hGfNM2mSKv0KWen6Fh
 RXNVOFOY7n8lAsXfXtvPI1ps0LXAaYisB+I+WzNQc06/QyAHpAxnnq4IlKX7tGY3nY2+7rFTP0k
 eH8GvPSr8L9kxunYJNPQ7U8s5ktZm2+k0nAr6jo8cSErEry6xQvrKYSXK000qrYQHsC8zMSRtj5
 /Iqk1abvVT8S6HQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX33ZBZIxFbd8G
 li7Zq3V4haeuk5gnqxFjBZwqU3Z4WHJrX7/+GpAW99mMApskd9fgtBVN3tBKI76ZjQd5Rwi9XwD
 6ZDbB8mghNaOgBApbll8REllizj0vebgLgKOni+0d5aPhbEMhOE7TbkR3ODqw1QplBqoyk8z+IP
 W/RpfpSTCF859Zy/tWovKKzh9GmJFXHsOm4o4JGBL00MWirkg/cXMJxuGpLmapNDxVqf3D6asD7
 hH9aHkaIuRc8wQlvEXuy9lU7SXzxo1+qbvkB0vjeOXRjpmyQc50iQUdMI+ubSybgzqTW54pgDq8
 3+lygVUfayxAZFtfFbRxLHKXKRdLaf6Zt1W4Oqx6LBVfa+x4lHl5SRf2Xx8EdkqA87Je0F705+U
 Sj073kl5PRV5V/MqF2nsLEalG6uGgK4R3RY0+2z5+4LmpuxRnOn4YOG4qwhiCf5MGdSJxj+6of+
 r37Emm+f82O8CQ9Kb3Q==
X-Proofpoint-ORIG-GUID: Ur8zVLHBDCQ0n_M05OlvtnYB0kTdHxC8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9V1zlUjLgoqb
 AxKJIcF2QTyIaw4cd9JeRlUnCK2ghL2GF1xqXra/crhKDD0+blvYcDonXTbuT4OwAQ+2CLj36yn
 vRqDW5I9rj1Oq0iMM7gKRDX2WFzwXSI=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab512e8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q3WM7qoV2j0wxbEI33wA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: Ur8zVLHBDCQ0n_M05OlvtnYB0kTdHxC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-x1e80100.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-x1e80100.c b/drivers/clk/qcom/gpucc-x1e80100.c
index f9161dbaedd7..10a0b11927e3 100644
--- a/drivers/clk/qcom/gpucc-x1e80100.c
+++ b/drivers/clk/qcom/gpucc-x1e80100.c
@@ -609,7 +609,17 @@ static const struct regmap_config gpu_cc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_x1e80100_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_x1e80100_driver_data = {
+	.clk_cbcrs = gpu_cc_x1e80100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_x1e80100_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_x1e80100_desc = {
+	.driver_data = &gpu_cc_x1e80100_driver_data,
 	.config = &gpu_cc_x1e80100_regmap_config,
 	.clks = gpu_cc_x1e80100_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_x1e80100_clocks),
@@ -636,9 +646,6 @@ static int gpu_cc_x1e80100_probe(struct platform_device *pdev)
 	clk_zonda_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_x1e80100_desc, regmap);
 }
 

-- 
2.54.0

