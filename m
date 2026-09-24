Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63F547C11A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251667; cv=none; b=KOwXwrPNaGOoJ19F5pX8YBhBt5KYn6ld2c4007ECVUtWEJwjd7G5jeavauY5GP2sFUFwcPY6wGrxSOKIj0dDjBWJ1mOhx+mY8dRylOXgpDzW1gXXvIYT0ZAZtsvWtB9D54LTVnAfc2sCwXm3JmFKuJKu+MSgM5Sj7jWbjWp1FFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251667; c=relaxed/simple;
	bh=ln36Hj6KcOVQga3cV2n/3n0DleS9IFTsnosLmwz6Jqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VenPsoyzzGWswmozyRY3XPkg6ynAqeEiYlMVghSzM/Dv6y+t6TgTGoXHYFdoE4gZJlH0ojCFJ/+eNBqDVEh9snmY06LD6/In0gEzSR86j64XqdxTtxo6ev5LksqVEUdpP+lQzLsYgR+UmZcBkMkXPvV6MaxJETyUteUEeY0qjDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nT3jWqwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/veWwHn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nT3jWqwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/veWwHn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4s8i1630757
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUQ9oqq8ZI+JLx2cOtLyDRh8oQaGB19xWAL4U2iaC10=; b=nT3jWqwDwqgNYNeI
	ZOz3zhBi1ZIeG0YTPU/hmpSifZ7cCxak9O0lVWzmoDVJV0cxEg1SIqrQaFJso9km
	cuzML/J1V/nT6fRda3QHTE8eXtSfo2wSrfY0sSegruPi/nFBxOKJuJ1VevWg0Sxh
	//7Q8RnegI/tPcn6JwUcJb/JkDuG+SPJvYR4E+izpwht5wedZwt0HKVcOxITcKfu
	wYguIR87fZkGxkplDWyodaMEH8gutdMWWGhgarsloRVJqCOK2qITj3HL1HxfVnA1
	akgzYwrbDmMBBh2/ROym9ACK6Vv9yZqAd7GCW3ABcp5lIS6y8kobdHGB31gH7dI+
	ld6Gyw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ax95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78a58df134aso566176137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251662; x=1790856462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUQ9oqq8ZI+JLx2cOtLyDRh8oQaGB19xWAL4U2iaC10=;
        b=B/veWwHnOQ5TsapPpVh4CDz8egjGmRUm4a19BGth0LBUtiRgXlqd0Bx4IqXNXoRdRs
         pHNvq2n5NTdWVPcDWo8wIiqLFs9TlpUp9hmnuzbFZ513IqrGFZSlUI+YSAVadjHHuZhu
         1r+NhTVEJWiZt1eeBSOTXWvrGoThkoBGdg4xeIWOallnzJcM70Cid8QjFE8b/2BrcQLT
         HDkgGEBrPJ/72u2vKd4WZgxsZZSuMQLqfyfqKeW3CEkWyFoIy3NVgdbCDzx4qLOhvVfp
         6tGAKw1J25Kb5+3WvkLEmeO6VZbIqj+28uhrUJwgC6EPEdOVTXM8DDAi3cKVr+UR0+j2
         DBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251662; x=1790856462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUQ9oqq8ZI+JLx2cOtLyDRh8oQaGB19xWAL4U2iaC10=;
        b=powuzUWSXj4kWed5Ld2/afNC3FYChKKvag1zFd5NWjEW+myqobnuzgaDkSmIE8vwNl
         JccA/pRfAILxiug2hmD81IXTdNvEzG1gbWQvHDPTDzxGjHZQdDBbwcCW4Y4IXaq3fN+N
         wkxYqlFRqSi8G7Krg3WcY9jfIy9kFhyaoWdbwdpot9s+jWBvs8RBjno2aM6/UW9VhRxR
         9Vf/uhf3WfsC/hRWhBezI+IXpPIi7py8S0noutUQ3PLZPCls47R0LuSWCCUcqQUgH1u2
         EC3AZNFYg+Ev7BwnCZ6JlXbCrpyuM5SpAcqAxH/g43XIa69qEJhaZFUvw62zuS+bIqgL
         OUTg==
X-Forwarded-Encrypted: i=1; AKwUvBxUXw4wKwoDKy7tG9vatq5GZf8uxIgp7CYmu2MOHuQ8xTzLcLnbTz4D8tpZWBLSStaUmR8xiCcfhUb1DdE=@vger.kernel.org
X-Gm-Message-State: AFuF++mz/z5LwkFEP4gYwJfPtjddpYpJGlW0g/y9G7skYyY5RpaGEz4h
	PwqTmqTY+8cVjvqFDIHI82UGjXY3NIit9TX1H7DWmfn5uj6z7rMutlI5F2YX1Q2DH7n4CqYoart
	loCMZy8ZTkSf1BjsmBIym3YISYWUXd+n6Qdi9SKkc2+PM/ow4lwIUQKGpwb9j3QLCacI=
X-Gm-Gg: AYBFou0aJbNdRfAvSfAuW52hECV0c/qXA3JDgsl8YVwB+tHTG9P8znOzwE0HpSNJZHC
	eMtWleqkhP/8wnPCgUyiEd10zz9F6rXnFxUpTjcJlZsvWhErD6vxmNulNKObNMni7qAgdfQbJV+
	wKpk/XrJO3XVPGeslBHhuLXrUzgr5TwhsdssrErpW5FCYZS1u8NmtjwDoTSK5X7ERc3Viwc6k/2
	mfDJKcVO4SBY3DrJf1tZital6DMtuYH0D/HPZRu7KTTzUoGr+6NKcpK8fgTmok/rUnDDrRuvO4F
	qNrK/K1VJ6OXBDkrGH3KGU2aWhsOkspnyzNqmzoy+V42Tc1izwXoezODROBt+YvCss7789zVuaq
	JEd8D4sua
X-Received: by 2002:a05:6102:41a1:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7af1eff6b23mr934967137.29.1790251662278;
        Thu, 24 Sep 2026 05:07:42 -0700 (PDT)
X-Received: by 2002:a05:6102:41a1:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7af1eff6b23mr934949137.29.1790251661569;
        Thu, 24 Sep 2026 05:07:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:22 +0300
Subject: [PATCH v2 10/48] clk: qcom: dispcc-sm8250: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-10-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ln36Hj6KcOVQga3cV2n/3n0DleS9IFTsnosLmwz6Jqg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJLIVtMpp8ji+hnjq9GuAgLPArky/drRg5zU
 zqnXT3OO62JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSSwAKCRAbX0TJAJUV
 Vg02EACkoGt2bk39d5RHtziiYzGD5M8v77Z0nyqV3u+0+Y8aQ1JloklKYDAe2GJJATprH5kbaNY
 4T+LQw/Hhw2hvVFdOAjkLEJ0tD82aqxyqAdFe3RHM7JLhSo8xn3hD1858q8wzvZ7aIZFsVbcvWE
 Etkxo9bubwUzoT1/YWD4q1U6VLXcM6hrhfYL8SQq7vzCJBucM9jMgKfvFdHPLj6Os9nYfWRtUHp
 ifQ61wEicbQT/b3RhKshoS1mK9Ds4xRuY8fUWBB1HRi+1kt3tegXxuw96c2b5Cq+5EONO2I2FBc
 1IiqQE+9gqTVLX+8shczZXgqTpzDz3iFvRVUoSHar61vT/nNT9kS9TgII4qwVnyEwZXxUHfPx5/
 3O1NI/mzi3GQzjQpeWTsAkvuvwprMlHjdTcqGZFXnh19WjoKf4v6MDOJFlu29cpm0ELregO1yuJ
 XN0XGiaCs0XM3N97sjgkbcIDZl1Y0wx2HS2EGnQr28sBbU+ek7uyVs78PvUTNkk8A6uIDgQRe6N
 +jmVPmbzMW+uNebAxR1VfsJW83Zl+6+qTFiwZIKdq1TWIN+4ViZgSvJ3fhKTa+c7I2YtBHfi9WB
 IebtV3QoeBMoswEkFPgP/whsUjt/XIofuNC8IS2PcgZbkrSxJQ30aRvAiiBYQmb0aHEz6R8GN/K
 2D+S/K/0MN4EJhQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXwugo9bcF3KdW
 ym1nlaRRLLg0hhZ7r1kgjuBkr1dPzG/PXM2SsSuVlvrF/1QM3vD3EcUWy0LsPHETehzZtI2UmOF
 L9s9NUvC4xoudPp4UzH73oM0EC86oGc=
X-Proofpoint-GUID: ypRj__xe8hoADNsftDXw8UwKpcSVAMSI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX96OFRUhFViSN
 9j8YCc4OUWbVdXG9v5XLmXH3HRLBlRj7W6WLqaFNj0I1uKff1AMu+OEjl1Rx1WBOMsd+lthzDkS
 9Nc2Yop3hqP7BOHWMY7lfcbHb79rWQrPCayM9NREMiB7xf9d3KdQYvNRev4VEFWY843vPwUdWep
 6+fFtqFA6a4zD6Gxh9TkJjKEXBDoc9oAZmrGCU4XOhO41Cu5AUgDsdv+aedv7eEh1FTdZXUp0MC
 XkDA7Z0JmBThMJOKhosu6v/mO2EgoYcWa8VQx0EgG9CTMNmUX2xB0l/wkq11ucuSB5qCvEAUgTb
 7ftPs9wRG70qSoXi6bnnvBj0uDoBYjvfxpPeVt2lWfruR3YThCRsQvVQTn0U98GJWHwhs+9wmUk
 moUe4HzXCZ0nwtW39vegXgJamO9xxHdX1W/JO0FjevJ9LJa6947xNboFOd10/67xLnQwe3HqPYk
 wO1Yrsx5jneyHrD2WwQ==
X-Proofpoint-ORIG-GUID: ypRj__xe8hoADNsftDXw8UwKpcSVAMSI
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab5128f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6NcTdUUM2wu3ikSZIO0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8250.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index fdc07323f298..dc62eb18deed 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1232,7 +1232,17 @@ static const struct regmap_config disp_cc_sm8250_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 disp_cc_sm8250_critical_cbcrs[] = {
+	0x605c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8250_driver_data = {
+	.clk_cbcrs = disp_cc_sm8250_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8250_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8250_desc = {
+	.driver_data = &disp_cc_sm8250_driver_data,
 	.config = &disp_cc_sm8250_regmap_config,
 	.clks = disp_cc_sm8250_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm8250_clocks),
@@ -1370,9 +1380,6 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x605c); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8250_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

