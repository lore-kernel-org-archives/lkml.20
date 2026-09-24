Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5205347F765
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251676; cv=none; b=hfCJrmIsOQ+XUzb+dx35doyJTXPpCsHkXwHZU0Jsi+fXH0fm9twCtjBFu4z0ZyqTeZ/p8T5QxNuoAGEERhct3JABEtLb5UjhGBPlb7DfjAHNKQm3aiqHqloPwJyHoNJwNw4TZfU3m8uNyk8tZbSbgprVP7NY4zQ5SuptzjpTak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251676; c=relaxed/simple;
	bh=Qf+X0ulDflaYn1MY7pLr2NZjomRPc7FLiNF33Tb10hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DvOcISRigdRmtCzsEy1CgWjF5kQMqSoezHQEDHBX0Z5n34VFU2RhzcwDUkJ5fTpTw64skrmTVbllwut42FD3KYC5fET66kHtCRWn2L6dYJP0UjxgfPfOd6MIGr0t1eRbyTHa+n8suwSRgbX1KbwvddAtajta10WG5JpdcHf4rHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+4ahiL4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ia7nNV7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+4ahiL4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ia7nNV7p"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4sft2594609
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9Ur8cPAkq7JD/mNYQr6XjaNZO0hdzmV1h202Uj54xM=; b=M+4ahiL4bStJyiqa
	QNBXRRYWYOPSta19Qxs3NUyDWIYhyDHW8FNdnO6wnRnjhBpkR7hFvCJpvXPw6nDk
	90thwhRzX0GuV8LE39xK8oS2mGDNYShV9Qfa339N9yTS+pWUi/ZG0FX5bTzgyWSE
	Oyx9A429J2QR1KU7XjFc03xohbWzbIaY3qMsLAUdo5hX6kT5lMz3JTIq/d/O4PTU
	+xgdYHmzi9GL2+f1OhVdDXqWq6oFjlyclheXB8LvAGrNbVv+TDzw4RrHCKYpDSuT
	GjQ7z9Baf/rpbF8L0SqVBq5rRtFNcBzBMQfKTrM0LyRk7/dg4V4nyV2iRZGZx87h
	9zf1Fw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjge87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78fb9f59781so1812077137.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251671; x=1790856471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9Ur8cPAkq7JD/mNYQr6XjaNZO0hdzmV1h202Uj54xM=;
        b=ia7nNV7p6lAma/9jtzTlRR2u2+TWROePJeE/TpuDH6LAr0+YCPiDKPWdD/BsqLU7gZ
         PZbLDRjIhJiLs5ulFdlYBozUonsQPSL7x7EOpIJrAgcHDKg0TySyyqYsfrAl8f7kLA3N
         lIq7PYNPaz5QvsItwrwMr9Opr2K95hHZxwQZU0dE828+1ieAchjJgAkOTHUSSEZM1gxp
         A5m3+rd6E7ErGtdKEsiCuCuONRPv5HvefvJ7s9aPGpxZBarb+6CExX/I65RETq9Tmhs+
         1ambjA0nj/AVnsXxyLviy205mjrM+I8xzFN6iiaCWE1GwOjd4qsL6Wiy27xNYAs1b2sI
         0iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251671; x=1790856471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b9Ur8cPAkq7JD/mNYQr6XjaNZO0hdzmV1h202Uj54xM=;
        b=QD0pN7YwWSbXMmwfBsj1Ho/NV+g68lynoxFqFUDf7N9Euujr6UTV1vrAWDmxrKNdli
         IAOl2tCf2ds62NSlspaAj/WzMWmNDQKV6BsRJ8aLSypb91Wgdm8usToz5G9pQhlNF0yE
         jdeRPhJJRsukoUWQVOJrqMwAhB2ThgG+qCpsu6kfXKv09r943Spjyh0LPku4P+5k8n3e
         u/GSddXbn7lq3g71Nw/ldmhBpG658GdhDm8H1SEhYm0/2v69wJ1JCUmQeUDGha9Y40Mx
         /xuOYLVGXcHnMfGRFKYrJiBpYGU7Wby2u+rWJjLtjZrFIRTYeW8E685vZsTWbPqpuFMD
         lwLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfSevqPdJY3pyeEd0/uZ+y+Jt3zE0IZZi1LGR9zsKvjA9fp0c/klqeFIdZ5XE5u71g8pD2U2ssi6zd2TI=@vger.kernel.org
X-Gm-Message-State: AFuF++lteKaPAbCruQZRsdneNVEOuHYK4d+9kUBeljqejJ9aqjL8UwiL
	zFS/nQZZHNeWQ/4C4LvJ1acY2zJoqdwnZ2Dy0pqZXC10VZUhZlLXzW9mxpcE2/yMlOvZcaAgMsj
	nJTTHihyshh/KZvk+gLWvtec9Aq9jGnTzbeT456R8FOwZWmw/4D9iUA3R18AWgHpUYgI=
X-Gm-Gg: AYBFou3SU3Qc6M8G/oDEYduZBGS2JbYbu4/1uN2eBKi/zgfntEz3WL/D4i7gNeCLIpU
	wj+o1nulnCxSsmObBjwNu1I1j8N3+gVQmn9QRaDV2wuWK6bm8Wp6THSQr/mJtZLo8qj1m7GA/fl
	XVolPVMtnmfCZY1n4M11OO+w+uD4/55WDtwmUYXA1ekfjWdRihx2/HYnhn0Q99uvyTtxK7hqJPU
	3qOxp4RQ6gfGWYg7oGwq8LgqYxhiIayheAgGrRjocAczVmOf4oTBPA0t0WkhAi35qzOIBowMk9f
	VNbocx0cRvRdnuK8LOqepGdB1WI/iSfge8fTfZB1c7iw3ob7lWALOqDxnpyRSp9LiypOeyIdRDt
	Pk1kIOy+k
X-Received: by 2002:a05:6102:6883:b0:7a1:f7d2:e820 with SMTP id ada2fe7eead31-7af1ecf1913mr1074371137.25.1790251671357;
        Thu, 24 Sep 2026 05:07:51 -0700 (PDT)
X-Received: by 2002:a05:6102:6883:b0:7a1:f7d2:e820 with SMTP id ada2fe7eead31-7af1ecf1913mr1074359137.25.1790251670852;
        Thu, 24 Sep 2026 05:07:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:25 +0300
Subject: [PATCH v2 13/48] clk: qcom: dispcc-x1e80100: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-13-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qf+X0ulDflaYn1MY7pLr2NZjomRPc7FLiNF33Tb10hE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJO80Uxr2mGMK+LCHJj0UMjL19jse/NPJomH
 SfUL9lkfuCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSTgAKCRAbX0TJAJUV
 VrwXD/9GskLbx95X5a+GvjC/GkUffxCSh5p5Do8XtLPhfkWMkBEdZEeGK0H83OaQtsMEJKSlsGA
 ePiIxkAEScsot0ZCvWjpH0qg0FfGclYbs1iUBGWKc68vKK0jNmLrW3/Y5lX5bynn9TKJYVrwrvp
 I4DSXY6XKhOb0XX2AeYaNWPPZcmdZudmk76EujUfQ1fgsr2UtvBw5DHH8D/U6A8AWJVuy922v5l
 2aF4uHFELDvrBfvRaRJihr6Rwlq1aMtE44eAST/okYAhUbaqRcOlFJb4GBwxCqURYtt17NYjP8p
 +haj3FkGHbZ8lBvw0E00Km9H01WTJnjwQcksCg8yrAUfUoDX3sjUlAReH03jovT2DTib4Cak6Th
 PEk/nD3/RN/JcecnXgSqLuZi/X3PhWLEcNyIDc9Q8AIz7VNNta9ZT6S7WKYwZLsFRh+bxYWrKdM
 frOgYnl7vKFsi7pizGfMprt//YFh8VWnvty1ywc5NKpUkZ7JdUvAw+za56gaVeRdQz8txTpoq/N
 9v43LHbxa9McQOQ9kLzi6xznqw5whZaLlPCYuam//REE2AaSx7Z1l4JaH9Yi+6wjAiLoVikJa6A
 pOCVvtnpbOphX8MVnfE6JF3pNQ3TdcUNqlM33Q8liy/ATZ9IccHXVCVfMbDnip6l+bD32R9QPod
 ywykz7ph5Oopo6g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: T_i_NS2IJCbbnsQw7uGtYndBoyyhpYYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXxX4FOB2xkBbL
 HjRPrQr+5DTpwDWV5c+0mewM9aa9ujKNiNG8ZNAJY4DSl8rRsCDA4bPKNEYgAUeHyHpQJ3xCjv5
 7GQ/7Z6gSJOdu5FvxdMe2RugjGQDHzIrLqjWDO1I7NYnyPQvQhUZTDSb0UfjdJTp2+bn1VPQnuR
 n2+fzT15r34cCT5Swoo6oG2bpJB1JF7Gw1chGoTy2uSvfPqpy8bLnzea6jkevA32Hz2Kz9CeXbM
 J985rdngb2xsMlWM14RvrVRXEBjtON3HpZ1EHbKfj6gXVvOsF+HWngkUoMfrSS+PmddmZbG6NWZ
 /100lYkGWNp6TRGVKuqFSHLahDtecbiozWVO41X89QfyVbAui/TP4h6MstbV8CqwQHpJjWJX7Ow
 wOCAZOqrlRC/G5i9BTmNhk5B1yQ41GxUktpWlwp15jqfLSNs9zww+ZpLIfqYF/tHMuN7XUaT/TS
 nkR92VxTh8xCHkoK63A==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab51298 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=55LTGlQWyvwDnq5kMygA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: T_i_NS2IJCbbnsQw7uGtYndBoyyhpYYY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX84zZoxYiUH6t
 6ASqYCog2rH+3VML7ZlCBPID440yhuJH1Ka809aTDQxhr64osNbzoZWgveBOp+hbvYki7QRRJ7B
 fyrxyaUHfuQTk26FAxzyS72jhWQU7jI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-x1e80100.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index d3dc678a298d..aed06203a886 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -1637,7 +1637,18 @@ static const struct regmap_config disp_cc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_x1e80100_critical_cbcrs[] = {
+	0xe074, /* DISP_CC_SLEEP_CLK */
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_x1e80100_driver_data = {
+	.clk_cbcrs = disp_cc_x1e80100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_x1e80100_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_x1e80100_desc = {
+	.driver_data = &disp_cc_x1e80100_driver_data,
 	.config = &disp_cc_x1e80100_regmap_config,
 	.clks = disp_cc_x1e80100_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_x1e80100_clocks),
@@ -1678,10 +1689,6 @@ static int disp_cc_x1e80100_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xe074); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_x1e80100_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

