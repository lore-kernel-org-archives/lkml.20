Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546884E56C4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554578; cv=none; b=RnDsNgEhERBabJNwSQvBT4ICICGK904UUs7S1ZClHUytEAhNT1NViREa4orlkSqZEKrK9nJalIfGHtzP6mT93EsJkHdMq3SgIl4iuicUqpTGIEo3xENznk5ixr5LwiYSZryzeZJkDNlMFNcpXhnB8EV8sCKDHc808joOkjaa9No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554578; c=relaxed/simple;
	bh=5kVvtWRtMetQrC301SdF709Q+ZqaylTFJGaMMYBiDNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gs+TXT8n9ue0RhW4MA4eFjvDG7Ac35WAH+hDVV/GbXihnlC/nhl/ENlseupvbrBhsknVI5K8KqWq466FpoNZhqBxpEXxwIP6wysen/RoZGGWswsaC7omc3GtDpbAjXGLW0U3Ms/RzZm98ky85PzUGulsX/kZJrvzlLWLjimyiIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4EkMDsx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSHnkmYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4EkMDsx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSHnkmYv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G933kk1587182
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCnUlcNtZPRsGZqWJYJql8R0YRzfm5KccrFhdBqwbwM=; b=o4EkMDsxqvIiUL0f
	O/O7FtyGvbXWh+BpnC/iLPg4V5ueAa+P4zMw7QLkudrPcWOZJF5jcRr8vyOt98iR
	Ixs1gC91jhdqI8mb1nhBA0XYtIq3V9vZnuLpASn92bArwL3ZOfBuUWbLs/SONYLC
	6R8ViNuJZfHZ0wCRoNcNfCJUj8Ot7w1LAUQDY3Mz3/Wh3uXExeUCehLHBdvRr+i6
	+OJ99ugNbtJj81X/jZvbEAUrwwD4UcJXAypkI/6wJKyBfgA5sG/IQTUjcOtRE04c
	rpQ0z3PEYjwIpnIpfoRSlEdNrIy4YaKPCn1o3qbVuGjh4qaYsI3cjQa8qLFIrzvZ
	g0CuDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageksau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so364197385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554560; x=1790159360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCnUlcNtZPRsGZqWJYJql8R0YRzfm5KccrFhdBqwbwM=;
        b=ZSHnkmYvnbk+o4Qb8JMYZd3iaYauWBK7i5ttpttEicVSjnFHlpWVFaXA/yetbIVz8J
         RYEJxg08cYl2rTaMzsjWoaL2CFo8QXZgsJZu7VDxETA5FsteF1XDLxmJQv151X+s8Zvu
         7oVcVwh0ktuaSq+0AQ2cBEInIBH2dD+PYMnoaxCoVZMrW3k+uRJUc1tKsUDuH2khL6Tg
         ahF2fTSMiTEjJP3fPP/zdvUBBpVKj4l12+BR1EEDdie06KJ2h9uBYyC7Zj4jeuiOj+RQ
         C8GzVpFi30RWBA1TMwUzblmiO3Yetd0zwFs9qG/YaN7yhdEFLgcBagyYI09SZhh/MM/n
         12Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554560; x=1790159360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCnUlcNtZPRsGZqWJYJql8R0YRzfm5KccrFhdBqwbwM=;
        b=MkEVJ7/jkj/Zx4qkK/z5hLd4bd6vpBPsCI3t+AJPGMUYJ8QZMGrm9d2emgfmkzBzCj
         96RiwyC/D7+bYZwHDqf3D+m69mUPXS7tJ7ncMD6oFgk+EcnGMHAkmB5rwMIb07b1FiCZ
         10trb3bBRAiBF6ghTF/IAlhnlRUPSKw9BG8cE46e/8vEC9zFJICZCJ1JZHrnnLq2xXPK
         ThzfRcGyUrmT4YO8GXvvavQTnc9vZPxTDB6fG+lVTScbfdBzNHBxmScqjO8csabvQCwK
         /8W0rL+h8ns5jb90QpOX6/iPPqyiGyPo7+tWc+sY0BLnn0Myu9nmEbpgz2/g3kqDFcop
         issw==
X-Forwarded-Encrypted: i=1; AKwUvBzYNAQ4bFVWEgTDLNB9TgeN5NuUODgIIKLCaVCyeELSouDwtUkqOaI5mPJpVt6HxBxZ87JRGmZvsS7wyKk=@vger.kernel.org
X-Gm-Message-State: AFuF++kWfd8s0JS9st0kpzM1e/zT74g+Fu43ZMR2h9Pe+LyMuLG38QGs
	gmSLKzJcTzLDNj35dBTVCTUDNHec7MrS8TfIehky+ZpqbQAZwF+LSIYe/r28Acn6xC4KN52mzMD
	BNIaeFzHEwQASTqfURtKqldBr/5SsPO0QP8akM6XNpYv4jC5eoS0peMftDUOtltnA7Wo=
X-Gm-Gg: AYBFou1qnBqp9LPH3L6yunz4kZAI08LXRdHteVAMSMAvBRdfQfh714JJZyPGrNRC7WA
	N21disHR3VHpUdSNnykdgFR5M9qI7KdzNs7m0eAKDvVQHVb2NIs2z0MHhg7e4SJHXh33Ws1kk7L
	nDr7duFAqCAS2Gn027HomKFiwjg/uvQzrv3NpDEoWxmQ0P8+SoSIPjEXlVyl5Z0bX36tUp4cNwX
	BRqurSDwlPIM4TrnfIREoxpdOAycNg6awVD6yAQJp7xlLECEue2dbaV2pxu/KXrazoa67A4M2RT
	BpufRwJvboGjfMAK0tkwdAkJ9EbvcGtJF2k+YyF3hl2JDisUO8PxrIAvp5cgo3jLybh0kIuU7Q8
	fF2zWsFY=
X-Received: by 2002:a05:620a:8399:b0:93a:ea:b00e with SMTP id af79cd13be357-93a346fa5f8mr866254085a.30.1789554560456;
        Wed, 16 Sep 2026 03:29:20 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:93a:ea:b00e with SMTP id af79cd13be357-93a346fa5f8mr866252285a.30.1789554559959;
        Wed, 16 Sep 2026 03:29:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:18 +0300
Subject: [PATCH 02/48] clk: qcom: camcc-sc8280xp: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-2-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5kVvtWRtMetQrC301SdF709Q+ZqaylTFJGaMMYBiDNI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9M8p1vVtXBJ8zAcoN/xc+hTsMvLgAkqRbZq
 NG9r/mZ/lqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvTAAKCRAbX0TJAJUV
 VlJbEAC4iheZL+LPE84bMRPp9qeUFPeNlkZnbnz9/51JABCtbS76XqCiM2uKxiwogopFWQKopyv
 1GU+4aAz45o/oGd6cKXhdJAE3x4nc45Iojrfsn6X6L1obpzMZMtfnQHfef7OqaObDuiQmxASnBi
 ZGWG/QXHdOpYo4iqonOjcYuqcCJly+I3BDX4av42keaf0tuiHllA8BpZQQ46cwtojpS+/kx1Dvy
 5HKDXu0/PLAg3NWVFJBuMAkXwg2N4a9zfEOh9IfC4QIMSdeAsMDtlRbIgdGSIvyBrwMUZIDOcC2
 GhwxZAyIQGj7dX1qSwHKTehaybcNUOMnh/dOOM7/eexTbeoxx4YnZwN7OQ4b8BUwzJvt2V0L7jX
 DGhlpBjOqPOjJsNu6kOQM0VFu06mzE7U28YYS1+mWPPuMPFDx1olmofaOSkTtAnyYpIxCSmMt3u
 XL1LmT/qeY9lAtR50GzEIXSfKhUjhshYyI51eIa0xnzkhtd/zXq1Tpvjj0CnghFWJ9anwsraOGi
 PAxvNXnTmwyKuI58EtrGcsczG60s7UL/Ii8yMAJCCedX8KudjlgDPOw57XMBMEEQMS0e0oILr0s
 9HgPS/0oqHr6mffHSS6+J3OcSFv776NnefXt50+nqWhuG2Iwyw1AHp++0YXUwauMrfunPCO6AQo
 ZOB+fURZyVCGz1A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxWCN38SqlvhF
 hN4+VhMWNX2BBPBkSnNF/tWsvp5uUPee2XJQ4yXEqWV6eU/8n3kME2YU3be6acQcNK4+b5wvf2K
 g66rb3wAKF744UXcGGfVIaqorxusY/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXwA3eXgB2TORs
 XpHkUR6nCAawFRJQ/FLvFgvxJeSqFngdFdaQoA6vYbjI03EEYi1THgYDCrF5kyKtFPoORURENRK
 Qmc33hcJ+xSp2yTPa9CRPL5U2qilrPPC/rHi+j43Grvk6A82leyy5BVZr/Zasx2lPPZCwUsl6fv
 4IVsAxmanzOJT4DHqv8pBSAc7FcnFoGCXIle09OGfZI8MCK6/4GA2uBjngif8nzyxMscRt7fvAi
 Uh1ysHv9rxc0s5H0yG0Vql9ynTp/gTYtn0F8rW9N6HTvUZ8UiSebrqDK1EUFZ0/K9n5+hsIOv7l
 D9Xe1v8T4WJDhHOUvLBIe7AdKxVQQKN7LHJMGzdTaNVPaU5LKYll2coJTvRlVciFNyXtvF9Qih+
 T75ZVwlShmG1yaxRvZpCOu1AQEzKjGqfB9DpFYeR2Cw/0G0Am+4/WZq0f7IH4ydRD5MffzEEZgg
 27zojhj/Yfj+cU6kpDQ==
X-Proofpoint-GUID: F9HAvYQlw0INysY_HeeOPYTAFu1VUVVD
X-Proofpoint-ORIG-GUID: F9HAvYQlw0INysY_HeeOPYTAFu1VUVVD
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa6f81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rrqsg2U6P9VQxLjfjP8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 660d8655d391..b0f1d40d1df5 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2967,7 +2967,17 @@ static const struct regmap_config camcc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 camcc_sc8280xp_critical_cbcrs[] = {
+	0xc1e4, /* CAMCC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data camcc_sc8280xp_driver_data = {
+	.clk_cbcrs = camcc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(camcc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc camcc_sc8280xp_desc = {
+	.driver_data = &camcc_sc8280xp_driver_data,
 	.config = &camcc_sc8280xp_regmap_config,
 	.clks = camcc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(camcc_sc8280xp_clocks),
@@ -3011,9 +3021,6 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
 	clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
 		goto err_disable;

-- 
2.54.0

