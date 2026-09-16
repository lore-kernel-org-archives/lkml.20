Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0A4E80CA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554604; cv=none; b=dHxz9GSrBZlLBFSFIe9fDGmZmsiH2i3nc6O6l7Q1hdFQWkfoU6Ub/iMKKXlb9z03MMO3no3kPVi7NjHMlpclIJx4+EKjepflSXuT11NMHRnXpqT3BJlQlPXouFVMeiTFYmPtnsWTvv1HPVfjFJGNhJz4mD9hUnDhtQB6Op825No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554604; c=relaxed/simple;
	bh=Zp5PDIm9VF8FmIcIyh/M1Vz68QOUnZO8wJa5myNtLsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N87noDRuk96oz1ZGW3yfMF+EW7zQ+/SdudaOCu647uZbYwoR+UXM+QEyEpWViZxT2Lb7rOb+jo3utAiYsNcrEkXc+zFtMSBoJ39HncJFlUGkkF0bXP6Qv+lPpCE4C2L39F1FYxjVzNPODa0gZUpS1bK2XndWRtM5En0n9Siuu8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4ENCbRI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtCaky32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4ENCbRI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtCaky32"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92xf22822753
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bRmelSw6+kdXBYDg5OpUqhIvT/5ocQAO5ePZLRWdL6E=; b=c4ENCbRIqFNjITsZ
	jFJKY25LMT78V00GKKjnhb5t34mGE9aMOopVBRmynxN8/MIXS93XeZpOYbJMlkuy
	p9JvFiKATqTNMBNm2wxxM3gaqxUbOeHGrmE62CO5khSirjfPmu5ZqpUt4TWhbX0v
	NL275pPk1bwMws8BtUbqwNyNwKk4JZ2bSwy6vW1xAU6ib+ToRd/Bb1TpWpMDoLWz
	+VQPHi9HJc5mlhptzdXbf/Zs0EwQ4KPkgVx3sgw9aKAOrYoTCi6Y49g2yMjD9v0G
	Uog4MmQzhVPj9pFUa9xeM44JG1AC/BqMzcjVbMLA9S9VdQac4TnQEyBbMpftWGVW
	0CMovg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfjb8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0050a554so1095072385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554576; x=1790159376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRmelSw6+kdXBYDg5OpUqhIvT/5ocQAO5ePZLRWdL6E=;
        b=jtCaky3276f4f5wrmupB2HtR1yvXDX1SFb2S9OG1t8O5DBKgz2ne3gJ2PzktI2DFlT
         JgI5qAoZO/PkYaBWrLXqWnUhuT6roiazyd5YiSvgWyXdiEpa1CnuyeHxSzu+y61ZUO+3
         f4OTI+BsLhcdTpTU8U9TYHIKx40qYl9GN77/cz9iCEq2K+Zh0UNlyIApVhtIgpOM0QOC
         nb90D3m08y49GcTZ1w8A2jCEXDXseWU4ErLIe5BKS5KMiba8RaqdwtPBqWpZg0B93HmN
         12w8uJN1uIqnfdY9433Q9MmrSAnMWMRvHreavogBg55Du8OQsk1Nq5fjUgZ08oAEgbqb
         ZMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554576; x=1790159376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRmelSw6+kdXBYDg5OpUqhIvT/5ocQAO5ePZLRWdL6E=;
        b=zuhwXKC8EFVC611ntqPh5TxBTFjmFtXRoWG23WFBwvVpPs8PyKWuP+Ip1CwfJ1xS5M
         +4SRnBb4n8mREY+ArhMib1zbmuRBTs1ayc21fG7TCIhaih/pIA0WypZGcunhxsp6IHDK
         sqrSMs7bAOf62LJxWMMNMFosC2bEmW2QySq4JV+vS2UJLbtj6pjf21E5tZwF23D1WM8R
         ABSnQvc7l0vR4uFEU4oHONd1ZnE58E3TeNJdIpklhbxsDWtz3SjytIyHq8r8yJ7te2m3
         /g3jwCVKKfzUDL0VcopalRPaPIk+LqwsAEvruBuCCvvD4pRD8L8nyi/0PAfy968qjKM6
         h6HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMQeI/aIkw7gsQ6oSc0EmKxuLVdzuHGfY/SJ+TjBNrGFM3cfu/IWy8ISrSxh919tVdCwqPuIJCZAsfqHY=@vger.kernel.org
X-Gm-Message-State: AFuF++kP4NmfPtiCDg9femQ/x+PXFFeIbQsX8xtgJCISIlLMjDjoIVa3
	m3QpE6rzwRRSvHGdpIujLfrjIvKSxI6NPuC1GnPLoTc2oQD8w6SRDle4letgQk47+7Mu9ttp/LZ
	mPDsH+Z2I5+hdJeDyf/axo/qgFHyoAOzIMVrR4cW4EujKdLwVicdfY8Q+y+Zkz+15yqY=
X-Gm-Gg: AYBFou2vOIU+egSpIyuX0YBT0Mz/BIA+g/DuRrLwthdsGN834HDJj59ueOdSHNqZbw/
	lcLKjaI/dpTGU4LyJxQYvyMNx8zvhjUm05pPi2M0qbj5m+HW1F30AVEJ1ThaGvZH9j4pilo0kHf
	Iy/ynTCzmWKJf4WcRBnJ84yAUKlFWZ+GezHUoi2s49ALG1hyNpT5oCjBvHAhTUYO9jPBmU1zw1q
	s+A2E6yfQJAbbl1CkDYgy9PtWy1H/O+kYsT3kve9zZM08HOYTlCV9kYjkDaHojmoMdwSgyPAclt
	1WzzTXlo0KcTn0pECnYcTAFY/zO2TcHBeqkehiUU9ByBRiyEBMbXJGniS7ZTfTq6u8XL/fa5G8G
	K44C3iwM=
X-Received: by 2002:a05:620a:2b9c:b0:939:6dea:ce78 with SMTP id af79cd13be357-93bb796a45amr311659085a.46.1789554575732;
        Wed, 16 Sep 2026 03:29:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:6dea:ce78 with SMTP id af79cd13be357-93bb796a45amr311654785a.46.1789554575253;
        Wed, 16 Sep 2026 03:29:35 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:26 +0300
Subject: [PATCH 10/48] clk: qcom: dispcc-sm8250: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-10-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zp5PDIm9VF8FmIcIyh/M1Vz68QOUnZO8wJa5myNtLsU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9UgR8qNCDYipELjq/6MW2yZK+H/36V30V3G
 aSl2kivwnuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvVAAKCRAbX0TJAJUV
 VuSzD/9t9B27rQeT2YcM8D6AsKHysbW7DRWKhaGseiPsS49g8/YJgZXnyowzvM6qJBRNEr2qvD9
 93v9pPHmbrY8czLzhduPxblsSTHmTJBNA0ZRvfOZnOxTrL1yHwbAyDUVD45oJjVIkTF54zMAgXH
 E1oCjpRGLmvZloYwPv0+8wn6rC91mHI7C0XiRksh0es5Kp5C5+kfiM7AJksw6EeGWLvkAc9nXBe
 Qf3D/OK4ajSCTVgAzbwolseGIgxwsTsCcQIx73W22gS23gf3Tb+OV05wNBM/rdmAfLNS8cJT1mz
 ts79SExyFRXjrYb7qzDRKFUOeSiPg4eB03vgyn397Izb3FikRZTlrIIJMhA17uSOIHdgOkg6hQi
 9XZT5BzxJ5dXddyEYA5WiH+q2LzwTYIi+Qj8muhKzeLsZhBz6xIczLq4n19DJrVeaiigIFWj/iX
 C128KuxdShcjOBlQMgM/trNhUM7h0e5qLUJlTA7GZWpI5UrzJQBMImk2JOGzXESjK4XaIIl7ynt
 c0cOUCXKTSwjL58j6O5wteATA7egk2sfiZUloVYshYmJumuAPrB3nRYvWihazboKOrGXUI7KSZo
 NJ+bDeDG3cSEM8Egi2MiQ/VFuq2uUZpwlfAdw2xDBI5fqRzEXAWsWIcsIX6xOpm923Nen4Bs0Aq
 MmcWQsExh1tocCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa6f90 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6NcTdUUM2wu3ikSZIO0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXzIr2A4bSAWOF
 mmF9XhYUl3Yd9mjgBjoqjLyeg1uIftOMO5xzinl8ruCNs/59ktEIzUlyC1DaPDhwHjsJfSLJrFZ
 8j9Jeek97AiNm4cpA4XDPcY9HD6kOuCbPrzS1bmWyutiitdy62HMkX/gacIY5zx4UyxE/bHo+vt
 wMXhMxkuRvccXcX0QJMmasz+68eOdY72/DstzgazPmoHpEtZ1msYEiRJeGwXn7wCmmRUeNNhtQ9
 lKbTr3t1ngFhec6/F44JZ24NxLIaza1ve7XThspmg8lJoIiUZ/2t2m2ivx/0goCRf3U8bLYJPAf
 8yfd22DlGCgtpRggJut2FLwwEpF3BEPa+g5leHb5TfvCvrPb6ecuzoaAbFonV0f11LKa2iHttoG
 JYi6nVsQlZQysAbkFSi3r+w8s3M9dP2PXrcP3Xga2x5wlzw//FBmnYG7Qk78XmZf8+AMZEKJMoF
 2e2ous7COjx+d361pLA==
X-Proofpoint-GUID: M7dvdKWKbUy321s-SHEB0N6w0mr8vexg
X-Proofpoint-ORIG-GUID: M7dvdKWKbUy321s-SHEB0N6w0mr8vexg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX1ClhP3WBGib/
 1rM95apjVlNdxb+8jH1utrIlSphjZPAu6xzw8/6PFLbfOsp9brbO72JCDOO2si9Iz3hxIYWiLqa
 UXTHX3dMEQBX+jnMvmyUbrEpTqAWgQU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
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

