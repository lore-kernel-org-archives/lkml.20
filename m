Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C2E483819
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251669; cv=none; b=O/ygreMM7OkoiAxomA/FLeK+XFb/oe7qXdlywHowVcl+B67ELViMVSXXDQE7CWDl4uyHhBgmYxGUxV5o2VOK8NU+PMgALh9QGId1frPxqnV5nbdeNO6IfAN89hS/UVnHP7uaRnFTArXYWEyYEmF+JtAzg0M4875rWBDZoW4Curc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251669; c=relaxed/simple;
	bh=4qZgZvfQ1UVNLqQ1DQ+DesEZn6jUeXUBklv9SGrgPXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j27QiAY2NTJBh9tePQOckBbzyeQiPHRTkF9oGnRGROrpmKZw2LamjX/3Gkm5kyS61zn6fHFsDLzqxQrb0xNm+JY3w34sx2zHLbcQT9kc8hz9hIYdghYg7mcGjCkRaP7qYFCENhZ6mDFoDi7w8bruXHCjXbFnU2AltdaU23adFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fu4QGQdL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfilKwrl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fu4QGQdL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfilKwrl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4Xgl2285456
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWnd8o6a3F8+dW3ewYtgcqbzJQnTNjuMNsusaTfXk/k=; b=Fu4QGQdLCX2euCKA
	BxIB2CCbFsHudmBqbEBgVifCPBa/1J2FWhMXwKqVmPSoTe1HMLC6/myH+fz4RAp2
	q+iHl0KJTgz+3UsQ407IrsptzQ0qJ6qqcbGxcN605iZ73YUbDOU9AnwhfwNGVm41
	02pnRetRtNhM1W3nLN8gfD8iqu6NxfSGudMpzFyeg5BcYClk6Epcq997j6nV3uWf
	clrK+7VaVggax5F9KJHaAkLtQcIx7YG3eNjztHHPUAV7gxmJQuy8RLEVDVeRVl4C
	xcxtw0xGkhsADXdq+rBd90kJr3giqlv3HrEMWMg2j31pzX4mrNlojG9OX+6pLy1J
	4q3eYw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7a3b3c06bso790133e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251665; x=1790856465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWnd8o6a3F8+dW3ewYtgcqbzJQnTNjuMNsusaTfXk/k=;
        b=dfilKwrl7GCy5iviiSYJuBOysx/VCtQvwaL53ydOSyIwiO8mc2gHgZ3/gv2cRrMSPy
         wtzazvJGqOttDCOoq7iS6HlHesf41QilfRAe8ZcH9C6mZ/oSXpyzUW17TG+6IzPKLyCP
         zncxzG2n+8ZQe7iHRwCZT3OvSGdlfiVytiITQEL10bg4fVp9Mf56ZfVP8NylLPBSd+1s
         Udh4PFTS3fgzqEvjFar3PaIcKODwLQPlFA2do2Z7yU4DqNcUQX1HFyenvyEoKfChwI8b
         aNv/xA0QMpjKxLxWXQbEnqkTg7JwvmpyvFpDbiaSbVBuB0ejSM/h1kYZGYe6QzSZY6Sj
         Eh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251665; x=1790856465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWnd8o6a3F8+dW3ewYtgcqbzJQnTNjuMNsusaTfXk/k=;
        b=iqwzlfp2EPr0/Plw6p3tagXbtz1fXWXWrg+9MX0DMvrObwkO8zDPfF9FSeqVT6NiZP
         I7Zy4/Zv4wnku1ILqJWvLbMGLOJFPe+01xT8C4TOGNkCokwfiJU6zue8mev9OJ+Q5SMh
         LLPO6uxe0azbu/2P7irjMiw+aMV4DtMEhJ2vvbacP+MQQPyzA7bcRxEk6FWKVw61120L
         j7aYiGLeOtXPH2716hXdi91z5/undICfNm/zb7kiE9BgnfN+mpw9I/houblFDsMF3eRd
         KSdOCloqMrCuxAP33cj0sJZI2m2see8W6Tr8CiMY1iE74S8CpywuScXKWiVOuF536UrX
         yNXw==
X-Forwarded-Encrypted: i=1; AKwUvBxvbFGYVMRBbhq0QEULHFzFx4YEEpNdndgWimTcoJoaJi11QLdwpueqT48PL93LkIUpcJStLe0VzpwaoR0=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ4Pyj4fV4M1FaukbZ1EEkkK9ZzAI9R4JrWO19TiH7HEskyehw
	dKRYzDqamJrBVfx+yApDnabBzuvkT3ku+l1eXKWTbBomWBq6aVkzmhn+td6hy8m0S3J8mFb1Ogx
	P6laZgmhpUZSjc2/GJfPIEuVu8RL2m8ivquV5DuvQ4xmWzidlvS/A8wLJlVVQSf+WRb4=
X-Gm-Gg: AYBFou3SvEE9DbLTrRZfJa7ji2gZe0d/tYk8NG8hsa1nNGxSwoir7duFr2j95YtvnHu
	hhZqNTQaLk0AQzC9rt3MPX4g4x84WGeWUDZP+mkyx1H9MCWB+Y4cnP/cHYQYRCDrM/VIoTZjOEr
	kSRkbJs/birLV7WrjUVWt75BBLcABioRtJN9DWZc0Jo0iFBYe98xtp3NPAI57/yAbGpl+vwuO6n
	vw4Ewi7mxpl7xanxFw2DjaVqx/0OqP5b5ubsrh5UzNhUzplW9Gt01UY2coyRBpr030JGMN0emyF
	OH3YlnCvFmthFVDFzpGRsiygjIbKTEWC6FfgzTE1J0PlSp6SzIXjFxB/NlmWHYw67jmnV8+J+SG
	YGdfDX7bj
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr992995137.17.1790251665015;
        Thu, 24 Sep 2026 05:07:45 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr992978137.17.1790251664460;
        Thu, 24 Sep 2026 05:07:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:23 +0300
Subject: [PATCH v2 11/48] clk: qcom: dispcc-sm8550: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-11-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4qZgZvfQ1UVNLqQ1DQ+DesEZn6jUeXUBklv9SGrgPXk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJMQcDPMs9FBoowBl/FRyf6SnT/oHvfXI1Wo
 VTPiF1JKGuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSTAAKCRAbX0TJAJUV
 VrYIEACwW0+Rrz1sX0qpkjBslo782/gpdPx8+JiFBriFNAboypzZQWguW34vKJzoyQ2ACbSNHkj
 TKC3h8aY8ece55kbba5L+69wBSu4TRtQYiScX263SECpCingz+apxwFyg2Ic5LUIlP9GWTww7do
 VtqUc0+hpu2gWtaqz5LkiiCj95XlNRR9N4ixurvMxvzwpaU1WpylWLtdTBkmbdiJkGgXZgTBo5/
 gnChPKpMyKVbXFr2alg2dwloV+GPNs3XSucrs5ZqNYVqsCrg7RscD1D1TbyvgfDf41vH72x7REs
 fkh4rQr6PC9Ajj+yRrydvWa0g0wMCzlCDN0da040lk+/CFfbWOmk6F1UL7yYaDQIiZ4ELTGs4Ej
 yMQ/wVDeqCKTZL1XqcsBrCKW/JVaaTK9MbXAxCdPnqQB+0JtYjitXAbh4IeVSkua/TBs//NG8Wy
 l22Hb6+llzxqVUZa7DfT3Z0YSZ7jkMLMcgzvUukF/gJ/K1PBnmSMzQpNjBV9iko7udH2XpoNhlc
 pB8vukuOOnTgz8fcJtns57I8I3M9AfjLOxE/2Lu1ttxC69aR2hjth63G0ztXcE3aFu4aNk+WhyI
 2DOy+YZTZ/rVuJj19leSmaJR9t1S8V5wChNNuTtfx/HUT8W2SgzovqagV2B7sZmKMNkVskqfMn8
 65xqD6pVed1lOYQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX+qUHeRs3kAtJ
 bPh5cgmVTRi18xdw8k9BLGmXStbJXMlEDDoUtc6uHfaqTCrcqnUxGmYgxUmSCG8nHUk0lpZ3D6O
 MW+vtmC7LGeUMidWisAanp2rYj5nCgM=
X-Proofpoint-ORIG-GUID: wBYDMvELASS3W43ucfFxHrZ-uAGxyifO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2qgNbXOmC+tu
 RndgUedPt4HweKFG4XrMSBPBLx6xmSR21YdFa/ktKvsc4SwpZqf7h3RmxqTjadQaCGIEUy7JZFj
 Nu8Wy60fI4o+9owX3Ptzsim0xjbaq6iVOQkN0xxE3oWQiY5ppjR57vkM+zFWspSLKAMinH7h0Vp
 SV+3Xc3zVDu5yE3kY3+92Qek5cb5gStCMNL4NZ1yBOK24ZdVTvqGo5OM0DFIJza007Ah0vBtIiS
 c1DOJL2t7mb0GJDzlBdttA0z5+5DpGXceyBEGjpaxKqlwvSiQS2pX7j8uJkRKVPbaJnkcDDWkLm
 tw/zPnI4wi2zK+zEFKpOoVhKV7Lo1+opzNch+aUPL2VIsAEzNUcE6u1OxVlrI5VqLiYZ2wACyPy
 Pd0h/J5RgDAbM73Sf8QPqKAIZldfhSMb1ClFWCqvnzNirarQG8FAxdl5wBe7rqpWe2D1sGTRVlT
 ejuda4y0HUr948cD5kQ==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab51292 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Mkos_PfpLiWYs3bmBbQA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: wBYDMvELASS3W43ucfFxHrZ-uAGxyifO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

