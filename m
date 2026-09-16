Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B84E80D6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554585; cv=none; b=VXH/8O3dFE5l66WkImFIDvvMLe0iKfXBklCUufB7GxIh3fV54gB5KoJwep+APJ4Lot3opxNUl2oO4g93IeWK799DqllN/pKN5h8Ym5tfRXd2BeWzFhSrT204ANUzncQMyNo7YXEudfhNG9WgDQ8ufuzVM9A9/KoQ9agHvh9B/R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554585; c=relaxed/simple;
	bh=ddZpgrzvUbp1cuqzE7ilVSHV1084ZKP/Bw/rTPEw8vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4bDa/0pLetC/GhIuueaUFtQ5NNi/Yr1GNnw3etIyw7x6RoOl58THHyWkG+cXDMd9RMadDXQVbo1e3WvOtplJqX1ScZ2Bw/xQExHU87nECBVuF2sjUB3uj+HJZUE5BqxnGQgC4DSiB8SqmqlFQrmPqd5SSbswkAn62pdfF5RSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX0WYhW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3hVIdxr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX0WYhW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3hVIdxr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93C2Q2658365
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsDN1TqVi6UMpuxEeMHRkj9cz52RGQHzM/5Tefv2JKE=; b=GX0WYhW2fprXUjrf
	fk7EjX63rRVrd5+rxYmhZ1jYHhUifWs7iZNMRzMYoazODzP9/Fafqi3YaZmORGdQ
	tlTcGMQLTxJUzrKKWG1kAqUg2H1A1bBYnouElNG2fIK5Hu9svJQHu5hQxt/1D/Uu
	lYg7TafIZ3KV509UEnq8VPAXjcnvHZfGmOBGrmudN/n9eXDrQrqYvf3yXusm1KJS
	gJsnSaCpX16xnSNtjCjsF+wu5Fend1M7s1KLeDHkohR2j+lLiQw22jNG1aM1Fi7j
	k+4kFGZDpsCS8avk1fDJtXxF+ZsMS2tQLi8VSbG0KwBVaF4pmfc48fGaLjWaktaf
	8W/OVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujanw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1e564fd5so509388585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554578; x=1790159378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsDN1TqVi6UMpuxEeMHRkj9cz52RGQHzM/5Tefv2JKE=;
        b=M3hVIdxrS/26FFGYD6QN2/kKb+126YpaapGXTeQbqqjrQG46OtebjvLSHleXYVTK0b
         D5X0XtdsUgGmQFPp4Iov7pmIM9DH8tdBvDCbt0aPRx4eQtnC1ZmLw7mQsxg916pJCkKT
         w3XN/Nj0RnDHgZeMXOWeyufhDmLbqv7BGbuQMTUXGpmwlF8u4UfYGNGlMoGi2D9Uhs8/
         asMwbKbz4xbrxla5yyUZp9co4jRYhb0kI07f8xUD2F9woh5wc6Jd/o59XN9EsTCjkCQU
         LAf0puW780Te4Xm3eDmgPVVoS9Xat8n470525TO4QWoLPUZAnItcu9Hx0EIGez9LQCuH
         8Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554578; x=1790159378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsDN1TqVi6UMpuxEeMHRkj9cz52RGQHzM/5Tefv2JKE=;
        b=nMC4comP7bXpcJ8veu0XovFrAQP5/huRwUtHsxwsPpVRGMr2VQClplO7PKWYZod2uA
         /aInQvcYKMubHxuZFQSH8O0yD6Not3wPX8Z7xg2SRSnCeBTOH+WcBrW2OiTn38zlPxaQ
         6up3WMQQ3HAp5lzi8W7rHKEBEo39BuwwDj76334qF1hhNNTHcDLHn89ET0SgIcBzkDRv
         Oa0B1nGpq29tfdGG59nQDM8rbIhIHckzeDcKLz7nUB9ajtQWAWc38QFcMSIMEvWcQjBA
         hvmonC91rV19niFI4auff18y3FpzxsYIfR8iKiIv3QMmga8vPh4jk5UqZCOYKRYmv4O6
         72hQ==
X-Forwarded-Encrypted: i=1; AKwUvBypFaPNdsuXurVGlU0TMGnlHh1CQk5s+wEtskk1KONLwYdAFZzY2ZyixLMiraYTl7b4XiooE96O3hhzIkE=@vger.kernel.org
X-Gm-Message-State: AFuF++mPvf3VexruEfgtvkVBAzhx6k5h7LD4+ob7uWtDIAqbZ8ju8Hk9
	e30cjar7nTn7tg5C9y31G6CsDTIUDTlgRBPz09xu2vFajFqgLg8jRI69CpujG5/YJARobAD4Zy9
	f6E9bARWYEvOxIIZVIjdOXdbCRcYf7MrCnFaqqTiSnV+z1/KVLQVVN/qVzBbjw7eGSmI=
X-Gm-Gg: AYBFou0k0/48nuVYeOqHKO7uy8vZ4zKxdD84CwfdvRWl52VKhNgZ0bWtSShGlG0dzQD
	Zd54sXOvQ7OMGXQWyX019tFjgb1SNGwbeOax7M6NL1GooFvK6bez910RXQHCV9X1LnWZSBunJGy
	MAhPZjryU9Ey0pS7Blqkn5evdqu/p+rX7CIVkFHUWv2PG8mwKDS3fPZT75XANiqN+sIpagb+cjc
	kwst/boHrFaecafJ+e0rDEMBPrMfgUhwhCgdIOgTToeCNxWtQesn4hBXtY4cY7+FAMWhsSPCcua
	Nvuxe88Kng+QNP2GsDO/DY1dnEqYvaO/cELJLDhffy1YrT+Ix4M4RnNRV3SXGxIAk4FEG+oO/oL
	F+fSl2nc=
X-Received: by 2002:a05:620a:890e:b0:939:896f:3d8f with SMTP id af79cd13be357-93bb78f9fd9mr264925885a.33.1789554577921;
        Wed, 16 Sep 2026 03:29:37 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:939:896f:3d8f with SMTP id af79cd13be357-93bb78f9fd9mr264921885a.33.1789554577378;
        Wed, 16 Sep 2026 03:29:37 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:27 +0300
Subject: [PATCH 11/48] clk: qcom: dispcc-sm8550: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-11-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ddZpgrzvUbp1cuqzE7ilVSHV1084ZKP/Bw/rTPEw8vQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9VsHE2iOCeEH1t3v4N4BWahVojli8fQWsio
 8KCn4HhNESJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvVQAKCRAbX0TJAJUV
 Vo2KD/4opYoOYXrtFt/U8c88WiXbuwXm4Dxg7e5yrr8auaBFmrWWJYlFbfbOT2RKc27bU5IZzWB
 CSnkW2iAgXEYCeBD50ko8M8zDOEQFluHJZshQgO7boPAoHSEApz2SlzZy6nBVc3AGDf3m1LxZ0u
 mVEr1bmiUcFUPmol7nRdKXhyc+jeZZVjAVpwlwLIVIJE8Wx0AjJgnwoyWqqfuKw1+DCJtR39o8E
 xBVQ5XcSslEpWaANfCeSZ+GSLZfCkwKHv5sT5KurlD2E/1+b7rZ8bqS6fBE5LH+8ayrywhjE8kC
 +XkgPgJ0Xa9qsTshkyXLQhAjOtACakvRDnT5paSlu5hApTINp1N/hvngfNQCp/1A1uZGKvrY6m8
 n1GXyrbiXdtapzTqo6pgK5An46uY1O1CGbJfEjcy9uAEzvwhZQJJlIbRNdh3faaRq7zmh8cO2vr
 FdkNWgl65//YkydZjuomy24jm/aFxbR05qwC78RW+agCMXdt0HtxH13gDVmoobiodXN4V4xecg2
 MqjLHvN4Xkpoi6xfwZE86DMhgAkbQPStq0r4/Fd0B3BiVFKp6+nsgSCQx/KrSjAKIjhfKxGUoqR
 jQni9QgJDmZOxATdzqIAk9WoopDPaqSg0wzg18cwOw+5VgmcPp1sWXhu1ITmXNThM65ppynvo3J
 jz+HrplNs1EaKqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXzRwOKK+FKyjR
 QH2z1j3N7KB4JUP303RqMXrsKhqH7OV09U0IoL7xSKqpzl2DZCPr7cQse2LQYbfQxdQ4UUnGpvk
 HCP+BJE93IuK8q16raalsQUN5BdSK6mOoSDIHZFkEPorWQ3TW2E5iKz9F4e9yG8CJpitaYRXXTu
 wW983TETOAz5f2UHhFBrxufkQwR+v8sp37QtXhYuKWaBI/hkEeNKVLoPObAcAZAU6IDzKw0Sazq
 nMj/0pVxox+j4UYHsOVicNcjOsKCu4e8qS5EtsZucW5J9XGjZW3a000zSRAPvUKJfOm7A26iGp7
 sdVGFy8mHK+XA4niZ5XPP5qEDRwJe9C6NySE+5IQz2MjlD/S56NxIr1Y/CrfLuN3TDWasob9tbG
 JgmIxmZbQkmPv69BYmvkyeLX+GIY61cUgeqos2hrhUiL8ewemfswfUJB9dy81hlaTgmaA3zvxvS
 LxRnoGUaqZX8FnSm0Ew==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6f92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Mkos_PfpLiWYs3bmBbQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXw920Y95RdUQX
 kBAl1LlB2bq53RKeF8JZcHVvkwWyFnXorEsZnbwKzlyqgzDIVOzFKxWS9bIdwNEo20Dhhly48w4
 JZZxB2I73olmijg3TmtX9UGILWWDl18=
X-Proofpoint-GUID: U8qT3_wQSomlG9xjHmhmO0M157Y71Gi5
X-Proofpoint-ORIG-GUID: U8qT3_wQSomlG9xjHmhmO0M157Y71Gi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8550.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 418dcea20f00..030fc7ef1fbf 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -1744,7 +1744,17 @@ static const struct regmap_config disp_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm8550_critical_cbcrs[] = {
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8550_driver_data = {
+	.clk_cbcrs = disp_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8550_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8550_desc = {
+	.driver_data = &disp_cc_sm8550_driver_data,
 	.config = &disp_cc_sm8550_regmap_config,
 	.clks = disp_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm8550_clocks),
@@ -1800,9 +1810,6 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8550_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

