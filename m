Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116D4FC8F5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554691; cv=none; b=jtocEdMpwjraxCox/PPtChS2FiPeJ6vm+EX0Yb9pRWIhq8ZyOsc+pwP7FER6mlRAuxeY7hgoko7KOfo5CW39u/R1X4sbyUREKN7lCIYEbU8KRoKmWBZIJoUcAKJ+m48EwrIOT6VWy5LsSXElqtwu5ExNsz1XdpUhktvqxUn1CM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554691; c=relaxed/simple;
	bh=iZ7pKk3T8R3JKCttBUFqM1emU2wLfSi3zZs1CzHqSOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLigFgLqO3zqUMdTM7kB1Tsw8ZFH5BgYwvRLluheCGgVwknwow0VeQHAhX/yXBRXPv3JV+Ffsly19EJL9kcI2sw14c4PUTjrKhq92MsYfzHP/9+J50ed8X687ciyg6QV9yda9xcMhzIS0yhHjPwAQPxUVc2daW7djG/Eu05wj3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1IhajgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G57dzcvS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1IhajgJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G57dzcvS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92vT51721238
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQ+D7wuoF2Ufg85b23tzb6dwCm2k7tYYoaL/Hlf1zvc=; b=a1IhajgJ4m9UaCub
	Vx6+ul/89wu4nfbSmOXRrW/5pMl2dNlmtjUIq6X0by1+h+opYE7eekLWCZ5Vf5Tw
	Yb7P0t2DocB1ffVPx0OP5H8eCNlQ5sHCqfVTQrR1otjNKkb/oMIhXuz2JAxKlQkk
	lQmYaxK4v2cMRugDLBGRwe3ylcLjjRWCsozZi26dbvA3caPUWRu09CvqX+eG2vRm
	b+vvlOXi8lbv3DxLK8OnnLER19dsu1XOeCj/McFMh4SqFG8qM4kecJ0USW70UuTv
	oRzkPolfBVbueE17rFXBOYW95RNPr7eBOOBqmQzHy1j/eoMGCqB3XsekAbNka2q0
	Ou0Nfg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkc1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so667964385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554650; x=1790159450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQ+D7wuoF2Ufg85b23tzb6dwCm2k7tYYoaL/Hlf1zvc=;
        b=G57dzcvSUHshCHK++1GIUYrJ2oNddjv8Prcuq5hiuigsjMKtwzPiNQRjxdY763tWYQ
         qLIycLHdBVOHPWlbJBPQG0Hms1SbYYTId9HGCqxE25Df0FbbsPvq9dmb3LvwEiXkfKvJ
         zQUI27DiAtEsrVpbEYbE/FxVc8VzPKrYy7LTsAUjNxzYhLzV3pcvwlCPj548D9FpbWbN
         RQupyOE4megBShnkymlD6KyJ5hglVvLHA5k44ajnhV/qrXT/4uCYn8NexE2UbhA8Pz7g
         OCq/ivlfdbMaZnap3VyR7PgZNM/lSL3o1AUfdrRsrjmnBg8oMVmUO/oiRDXfl1u+JQcT
         MRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554650; x=1790159450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQ+D7wuoF2Ufg85b23tzb6dwCm2k7tYYoaL/Hlf1zvc=;
        b=Wk6yKzTbPBOMXDkybd/xZ6LsFAQA5SMu6ff1s21jp04bqAn5Y11NoV7X8Czhgcx240
         sLcM3f82GnxtOezB9Z3lPtAeMvm2ZQpUsWUzq1AR9iJn0VDvcErFOx8F41/34sI28QCq
         Mw25QdSsATvx2omx4gA2Wxo2gXml9CMZ/lvPJXsVt2jgbFhmuojdvYMQZFCehIdv47Fn
         +NT/+b8lFKofBsNHsDoAXLV8+EsqKbWkGIDwgqHmJCUrn2LRL8WuSx/cAdL06Fw96i9v
         GxZoF99//juQNj0g0cK0VNdIn9Nhz1zcbI/loJ+wnfJaCgnvo9Stuh4jfKGXrVrgNmUe
         PYtg==
X-Forwarded-Encrypted: i=1; AKwUvBwKqMzTb0rQ6N+u2FiYAzWi25dxrRCuU1zrsEEX0fHhgh1lDgupvsmFic0kE6NEOMPYKygbYIeFLzM7gtA=@vger.kernel.org
X-Gm-Message-State: AFuF++lBQoueRcSsPlsEffG62nCH6TurJcSzcWQnNAZXvr7M85vCAD6y
	kE76a3/4dZHT1j3AA7u5pfpMih0baWxLA/l2vpa/ug/+WKMkwxeV3UtGqw90Oev+wXI5h4l0K/0
	3pspWcg2TJ7Au8FxoQ/aF1i5Kw2LxeLpobZoVGD7/jhO0I3z/ADHnwlu5/dD0jmOUtgw=
X-Gm-Gg: AYBFou09QPcK3S8KD37OhmyW7S4A5xTvQ4ez4iG160Xv/CBR9u312gsuPUCIT7uPjcU
	I3jb6Bu0edkoExo/Sekem1CQ01TGtBVklMPWP8AIDXPzd2+RA1M7lzLxhF5wZageQmFtn96a5YW
	UXU+Ahnauf01008AsB42wOlLnuHFIGkrOCv6t7t6NIycBct/GQa4ilQ4K7nCBBjkh7mhU10hr12
	MUUp+nJdYVzzVxoxnIUP9xYbtHAOSsDYezAGZci6RlUwP9ZjpaiZhwJfuVJdRnelQC90RfzIAL0
	PK1J8UL65XYxkDc/LAdfrdgUDUs0483120lviC6iBbZ29opiojhYHnw5WwNMw/uaW4QZSfgu73F
	vFVXFHc0=
X-Received: by 2002:a05:620a:4707:b0:93a:3d22:3122 with SMTP id af79cd13be357-93bb76289e3mr318856985a.3.1789554648785;
        Wed, 16 Sep 2026 03:30:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:93a:3d22:3122 with SMTP id af79cd13be357-93bb76289e3mr318837585a.3.1789554647115;
        Wed, 16 Sep 2026 03:30:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:59 +0300
Subject: [PATCH 43/48] clk: qcom: lpasscorecc-sc7180: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-43-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iZ7pKk3T8R3JKCttBUFqM1emU2wLfSi3zZs1CzHqSOc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm90GrbN/Ojr6Cpf0pCXlh4B5xojAW4Ag6I0P
 YR0Q6BIMYiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvdAAKCRAbX0TJAJUV
 Vni6EADL2z4yt+Xd9XcQt110ATi7dhY/nm28M9M/eL0vLVsO42d3xMVYtBF6cElBqxe0qovzTJN
 YVwOjmhyP6fClauDxGDG6zKvzo/NpcA8geC3lP18rqZ68NmLwIzT3VeLK5WwykeCX+asEYBVI4P
 yqTpwkfyZ4+5bfxYpBYOMCCQWGLMdhIEf+PawX9Be6cdZBeNWIAxDpLmmdVp0EGTChRFKZg4NDv
 wxvB6OrZeirI5a+R0aSymJmRy3/F3G7iv6kdZ3PfAgoiZEhNnraNJjM5JVGZWY1djyEbwDzY9y2
 MqXrFsSl0Z3CxY7phhfdbnS1s/TXD2Ck3lN6PK79CndkTvoVBPjLBJE+AW3XrkPmsKjtihTr37N
 wQJMbGeyUW7quQtf8oOqzLwDy291bgTVeW9BnBtIHNph03Pb2FYCOMN2lcZNVc3usMgfwq4+DQh
 ESpiLyR+Fh9eB7wcBah8mrBQ4lQ4A8X6Ar56GOzdRl/h3Uf2AfcKFjq9eLqgUC3R3c/OtGKpMnB
 9Am+QCKvfv0Z/wWsNLsZjevcGs2GimmCMcRowM81D/e0OOXC/i1V92EHz0j+jqqPiRfFq76Ktr1
 wT4zEyoJuLrW1a8urbKlDJgf7vpVcb5T30ATEz1j4iJYhI55S3rCCnNdxAFwCZ0zusN82y+7K27
 +fTFshHYR65ku5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6fda cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6y-cbsPRrUJUYPj_W9gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX14BE4A8bxnxj
 9/KqSzUcd8n5iirtRbweKS0f1E6Rlw0UQ7Fuk17+3C97hUP3onIosySMNY7+calfHuNWWOKkCh3
 Xag9C1oN+/v1rcUkIqBaQnbn/iu0yqg5te9qhMUwhNRwXmfa7NZILZgOyNTYTPg2DbULD3sd2Ml
 taz1t6UN/ycgTmXasdsRGsNyYgHKn4ZhXXVJpwQPlv1IEiwbQoZ1fggJOZ288Id3nO3NZhS5DIU
 mEqojXZ9j+iKCo2aHBZvOz4WjKgsm7PS9LU7XQN5nUHB++hOP3P6obbj7gAuTlG1Rk9WjtEded2
 06Q+5wlkSEqi7bRwtqERwt4i9FoXJ1hoi5n843P0CgF/PfjHO/qaiia8TWc3GamWgSAfu76gcv7
 kBKpvAvAgPiuduWiC5gcZdPgwqqZwVTpG1Czj+ogoRpinRgbU09pmt285++v8/qG/US18VIndgx
 GnM5rA63YT03a6GVpQQ==
X-Proofpoint-GUID: KI_FAgB2qymVg9Gk1vMjZ7XmyEiHIye-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX0N7ruXSVFac0
 pfDwJFNdCd4e0iLUTumnCqb3URLmIPAmndgoyiELKM4ddyCCoMf9/ckuDeuGzlQuk8t6KuVirhq
 ZPLegtjTZmZdbIfghGOFwcSP8Fp83Z0=
X-Proofpoint-ORIG-GUID: KI_FAgB2qymVg9Gk1vMjZ7XmyEiHIye-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Move the PLL register setup into the clk_regs_configure callback so it
still follows the SYSNOC branch enable. Attach this data only to the
LPASS core clock controller descriptor.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscorecc-sc7180.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 5174bd3dcdc5..af28da5f04b3 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -343,7 +343,28 @@ static const struct qcom_cc_desc lpass_core_hm_sc7180_desc = {
 	.num_gdscs = ARRAY_SIZE(lpass_core_hm_sc7180_gdscs),
 };
 
+static const u32 lpass_core_cc_sc7180_critical_cbcrs[] = {
+	0x24000, /* LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK */
+};
+
+static void lpass_core_cc_sc7180_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* PLL settings */
+	regmap_write(regmap, 0x1008, 0x20);
+	regmap_update_bits(regmap, 0x1014, BIT(0), BIT(0));
+
+	clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
+			      &lpass_lpaaudio_dig_pll_config);
+}
+
+static const struct qcom_cc_driver_data lpass_core_cc_sc7180_driver_data = {
+	.clk_cbcrs = lpass_core_cc_sc7180_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(lpass_core_cc_sc7180_critical_cbcrs),
+	.clk_regs_configure = lpass_core_cc_sc7180_regs_configure,
+};
+
 static const struct qcom_cc_desc lpass_core_cc_sc7180_desc = {
+	.driver_data = &lpass_core_cc_sc7180_driver_data,
 	.config = &lpass_core_cc_sc7180_regmap_config,
 	.clks = lpass_core_cc_sc7180_clocks,
 	.num_clks = ARRAY_SIZE(lpass_core_cc_sc7180_clocks),
@@ -400,16 +421,6 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 		goto exit;
 	}
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x24000); /* LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK */
-
-	/* PLL settings */
-	regmap_write(regmap, 0x1008, 0x20);
-	regmap_update_bits(regmap, 0x1014, BIT(0), BIT(0));
-
-	clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
-				&lpass_lpaaudio_dig_pll_config);
-
 	ret = qcom_cc_really_probe(&pdev->dev, &lpass_core_cc_sc7180_desc, regmap);
 
 exit:

-- 
2.54.0

