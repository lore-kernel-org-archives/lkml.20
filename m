Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD43F495048
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251745; cv=none; b=cK5YQaJA9zlXu+0nQd88nffu6lJqR5l8cNEdxHU3qA3Wo7BoHmLEARmxMc0BQsTgkYbWbrGQgZdozJIiH13LUQSnVte7eJQLotEKSxuvUWnAyJIO9dEZodZlx9OQZuQ5uqETV5OKvMy2Iv0Ic5YBtWoIJKAfpVa1rzcjQRrcVQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251745; c=relaxed/simple;
	bh=c0wYPNUgewRDJMW5F+vd3xsVEtdgJT3QfwAzWTspO3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIqcisFCTUvKfu5i+mvmXvRKw1wZbN1YCAWtRm/QmfQIy8SAzpo9urpIap1qLTD8bm30ZYXXocwsaXoJZYB2J5gO7LG9dl11xYBD+4WCaIwnEWLtpiP84aqIAUlRES2rBU4Pt3JzyH/TtkudVZYTQg+JU5L+6y0PmqIK3UlnjSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qp0KlL+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uts076WM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qp0KlL+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uts076WM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4WKk2749219
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y3li9eu0m/HtmddfnsisJDYsvstqJmy8Yy/P6jNbQpI=; b=Qp0KlL+8sSm9NYbb
	1uLWae2ye9pU00CprxrRVIW3vJEWeyDdK61aZuGF6erkjKIijx6MierlwnoDdnVu
	MvZjcpyPvCEEJJB1jXlcicYfPVVQ2sy/2VAhQIIX3fmTKTbzkFd1mKi1JFMjB00s
	MhZKM5oniciI7jCaYIBDeloRUxWG2EIkk3uIha2uqMC6973BixZHs5HxJutgSM+5
	8ZX3DB/y/fMSSv2xKItFv5bEA8QtNN4AFMqTaoGGRXDq9t1bQmeYh200V3GWfwP1
	gAI4NRloS60dZW7cV86oYeWe4ZtGo3RBopMtTVbfnXxKZc4jm21lQkt/QiL4jYdR
	KOXQ+Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s90ev5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-791463ed29dso1737059137.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251742; x=1790856542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3li9eu0m/HtmddfnsisJDYsvstqJmy8Yy/P6jNbQpI=;
        b=Uts076WMCLbbRiGQQi2evgoLAmyMWcXxlVfvfBDLnoj1+esg8KIiK5qsDB9XUL9Rna
         7HCYYkiNylcZ+KLLf/euJp7c0GTroORUfesfSsB9sqVLJzxnbvYIE7yziJZqTfVwfS1F
         BnBarPQh+UfWKuwmmle8c0VFdakv40mHmq90+KcdTI3kSdb4Iy4IH5APdpE4TtEdajDq
         MAGPVoA8GInf4RsjFOGneESpAKQyF0alDBVItP/ZZTGl3lHmmq22gjKMhLbJ+fTGE8zA
         nKIw2+Yk341j6sQRPRA6cgGqn9+xQ1QNuZFenjPV+wCDne7/OG+JoPGsp4/fIp6PxI2Z
         pE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251742; x=1790856542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3li9eu0m/HtmddfnsisJDYsvstqJmy8Yy/P6jNbQpI=;
        b=c0gqBzPQ0PL1irlhthN5NixUGm8whhujhRghF05X1prdab1ZGL/HCVHsqKOvtygHqL
         4g+6NXs2Y7M2w2tdPoaKVi/TvXg9ryRKLfEP9aViE82qrbUgzkapl05xUICQpeDc/pPM
         PIDqMHgTXr9dVAgkybsGb5EBDnEX9rof+Pbl7UdTIkxctWwdz6FZlZ6eOU7uL2V8Dx7y
         J6VN2v+AqsWC/YTUFTvwUzYP8sjJDB3lFBGuVdDVkIB6eeWfkNxOK0J+p7cTKNFS+7z8
         qNTWg2SUYdD9wSYO6SZYIsf3Tnr+7uOXjl9d56cedN916cIrMcJEfhoaKsmkDRXS9dzQ
         IEAA==
X-Forwarded-Encrypted: i=1; AKwUvBxWKYL6PVEvvjwd7AAiqM3BlxQxPP8n3zszcma4YkLDLnPC4clG1ogHnegGyUEMKHssi/vRzpGSH59I/nQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lofW2mX6lS1bM45NxtSDSiy/mFZeVyFlQKfAExqrhf5el1twol
	llISc2idWm3Xf0+B+RuLRwbFSaHJgNnWfY6o766jDMFtFdXwx5bR/zELpjvswy+/gR7Yg0yTGF8
	5Xji439m98xyx5DBsmc6nPuv4jcw8HBOga32P2NCZompYsU6hahA2cT88UJ87NZ7+OP4=
X-Gm-Gg: AYBFou3qYKTJekqcWC4YCOW1gITCr3wVpuJbdhc11iiDBL8xCLmdqTbLn5vUQheSFGj
	ZzEBuYkn8sU9aOcdomh1Z0YI9vG/Ck8A0dgH3FiDWN5sRievgzZrwOUBmOllCXvOH8u+eTH7cUH
	IsvTrdIQ9nEYvU3UrtBaA/0l9LsePcBYTPo2XZ2qlvapgG1/9W/FyyluKRuTUNaTimrGM5dsCCa
	lcTqOfrWeu+jxO2lBQAWIitc5DFS8fwt8X+ibPEH7c3dAJWOwYZ8cOG7JVa/6yLU+B/Dbb04nl7
	MOw7AUL0rrAUpNOzFyNftJZBck/B3bEW2TDzU0yfasUw7QpOg34ZtQM+Xdun4oN3OPu+DzTzuxe
	1vRBIf6+4
X-Received: by 2002:a05:6102:f8b:b0:7a1:f7c3:3a47 with SMTP id ada2fe7eead31-7af1d6c2e25mr1025326137.20.1790251741893;
        Thu, 24 Sep 2026 05:09:01 -0700 (PDT)
X-Received: by 2002:a05:6102:f8b:b0:7a1:f7c3:3a47 with SMTP id ada2fe7eead31-7af1d6c2e25mr1025312137.20.1790251741280;
        Thu, 24 Sep 2026 05:09:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:49 +0300
Subject: [PATCH v2 37/48] clk: qcom: gpucc-sc7280: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-37-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=c0wYPNUgewRDJMW5F+vd3xsVEtdgJT3QfwAzWTspO3s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJl/9yp3g10naQVMDMNr5N+hsbFUv8EWIvVJ
 UnXbdxKer+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSZQAKCRAbX0TJAJUV
 VqjND/4z0NkhOw/OWCCz0rQkE8gUjGr463luBVOcGHGelzCG3o+vOs60/WH/LQaH5hLqixx8SN5
 IWGsrWnOkWEOhAjm+HEXgtrltybm8OnSqVFOWkSbJWsmWVShxyx6tAWk1/3mIdt/3I6mE6SxCZ6
 pra9ZwmS/OSojq7kCf4idb8iHDTKbJVKC8h12wby/jeq3CSbCTnr//Dqzb+tR88scZg4QjmIhpb
 uTF/7vBZK6MzMfJ7+53UzSwwaFNao60RQjT1MiNbh6GwUl7jZst5avM6lBPLPk0BCpO3wxOmY+w
 JeZHKZx4HT0FooPRY/otkqII3JKrTSrR+18xeCn66hMpSrB0nRciU2ljp2NVmtVu5nYcYWHzxa3
 EHrMKyGA4wsPYjyRwJhWsYILqgW+LeFQeeZ4gT8KPFKXEnnOWa0jJKN/WzseG0rfE/KwN5Ba+kG
 TW5HvPI0vY/fYpTolNdsafTi7BF88EO7jx3b6y5IbjBDbcCSo4d1S9B7BMQ/c9MhPyLO9+Bub+v
 eULRWTEaHwN1qQGuI6oqbmDaHZJf4GJA7oox3yAYskPBjRoynLYPwPzc5bRGsS1ZTmV+g/S4HU9
 1eoAVbGx9YGjMvTwEJWIpUAE8D+3jaTYW4mXvbbbCdO5Aj+Be9S2BI8J0JOJbi5CGTGVnPUZj+T
 axSlTRfrelsbrnA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXwxOqeUh69f7f
 peRPIyxdnRHScLXcgtAF3FTx/lkTgSEHx9KhH39ovvTRrNyD1evxJj3Up/Zzwo68EL2DidCaaGk
 widPPKEwXqDVnN+JKuUSYhrHql8UWK+y1uLwUdBRd+28lEbejndr8lWhRjd9dnm/not2P/BGykD
 yhV5uZJsggaQAUARfHkje8sNUROo2dbPfEqBcw2D05kWuD8UFHQvMU4wDXi7TBHIwOg/zHn/8T/
 JJK32v31mFSdXF694orZiKe0I2gEFr5cp8amfUcKevypAYEHJNPC5KwhH9VZMD2LZNKhFlfakqh
 3Gb8Q1VX0YW+TwkYiG5UL4/TMD8UWmdq2I+CwKUVITnHD6cNdR67ND0a/ia+6s4fpgAypSxRtUR
 IK6IkTYPbdtefHXyyAZTb4t37tCZ58a0DwWaBNb3On3XNGiH1Jwfk1yFei1axHcMdN7koTjjF8P
 B72O7SQVY+2nrNGptRA==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab512de cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=W2O9Cv0nt9n2xGTIkqUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX8OJiHz7XL/ns
 hStU3Uup8d0VeBHumytiRZK05f0EbEW1ZX8emeSrFOq5bClSYfHz3fo5laD8Z9gsQK3cH8yGCHQ
 iD6ESx4R7mZR0fuzNU7JaOsK51QjLrk=
X-Proofpoint-ORIG-GUID: wlyC9PKqcK1e2rwtS4PufTuQQ04NawMo
X-Proofpoint-GUID: wlyC9PKqcK1e2rwtS4PufTuQQ04NawMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Move the GMU branch register update into the clk_regs_configure callback
so it still follows the always-on branch enables.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sc7280.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index bd699a624517..9b267276eac7 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -440,7 +440,24 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sc7280_critical_cbcrs[] = {
+	0x1170, /* GPU_CC_CB_CLK */
+	0x1098, /* GPUCC_CX_GMU_CLK */
+};
+
+static void gpu_cc_sc7280_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
+}
+
+static const struct qcom_cc_driver_data gpu_cc_sc7280_driver_data = {
+	.clk_cbcrs = gpu_cc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sc7280_critical_cbcrs),
+	.clk_regs_configure = gpu_cc_sc7280_regs_configure,
+};
+
 static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
+	.driver_data = &gpu_cc_sc7280_driver_data,
 	.config = &gpu_cc_sc7280_regmap_config,
 	.clks = gpu_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
@@ -464,11 +481,6 @@ static int gpu_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x1170); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x1098); /* GPUCC_CX_GMU_CLK */
-	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc7280_desc, regmap);
 }
 

-- 
2.54.0

