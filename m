Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6766047C0E2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251664; cv=none; b=iV8puRRThoysUhPFLB0ZUGrPWGQnu/+SMY3u/JtYR6DVVrSKk6HNAzLaGoW769rah9BSG/SqCo3jI9mf1YjfiVYS5yIL3py82w2Cv/6Sj12Rec8LH+h/vJsgxKrz0v1uY3uOPC9UxJc5lcrjgNd9Fh+ziJgZKge7pA94EDTAq44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251664; c=relaxed/simple;
	bh=+PKjOzW1qJOcRFt9jkyNFKMBUYcRkBbKtj0rZteEkXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeQAafUuiA+QULW62mqhQeQaSl8Inc/kq/2uHhp+0E30INbqFb1QeMCHt/qQeX87kSmiaRzwjXip7OadRuQaYhMZULRlfJBfictsmweUFswAOXacnMwBjaGC8pT6nV2hQiOVjWALx4Mqnm1f/5wXon9C9aZd9BsNbF6eDyrljGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AglOg0UL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gnyfnhps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AglOg0UL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gnyfnhps"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4t3G803928
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7NS4hgdEuI2Kn03sVLhMX8yjBjmnY6qzK/Yb9FsY/v8=; b=AglOg0ULxNznG+pD
	hoCMpYoPcN8KdU5CbM/c3/SPlKoXqPnYpcqj3s8T8ZOIbP3Uvw0/plyl+hjhbTBr
	xmcbF6BPE00vsaSjYB3x1DeagA537xvwtGx2DcxPvPVTtWfXUu9G5ziiy+HZejBq
	zuoXDb5OYpoCEvWrYipIodX9ZzHN228zvDQmNunHDwEzb9fykEYefNWXhXsnI4UM
	b/mIwTHunFyOUNXqkpLLZ0Mmi4NNuHqXbeuepYEqErl4h8FIG/3+8wC0khjIUYLH
	dCL+3HDPHH0r9OBaCFUb0o0fj9wXZ/JJj9T9A/UIRoxR4cnNYVarJSwQZte/I62+
	aYbLOg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8eyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fb21aaad9so751153137.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251660; x=1790856460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NS4hgdEuI2Kn03sVLhMX8yjBjmnY6qzK/Yb9FsY/v8=;
        b=GnyfnhpsRz+EwORz29R/C/Gf6nl5BE46xQuLp0us2J43gqmQ6qqravyG/7Nz69KEvm
         ZoS4OJhEJQ6CfQjt3jcIazR93Ovh3muoaYCNBuWRGKRJUG9TPVtVhDM6QpucWajf56Of
         XX4b0rUbxIo9B0JxmTUUemaa/FCcH0ULksKnGpw1pEoH4a2wzyv5k3P8Gav92Z+m3jcb
         xFJnis1QsiDAgEV1SUq4SDXQ/llRd/EYcjw9mqOGrN25d7+xe5KcPZh1TdB4mVYWiZgR
         noJoGQJiVaFcjWV0u9bV2LZpstWP0mttrWRCThF2UV6FaOrLe/epjhTjmSJM8ACkwnTJ
         /k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251660; x=1790856460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NS4hgdEuI2Kn03sVLhMX8yjBjmnY6qzK/Yb9FsY/v8=;
        b=ivkL7CE/w2DqE7/KidSCOcZVHypcYzsVPEz/76JIRCENBf4l2Fd3zojXYiq4acGan6
         h1bDsFPQ0r3gw90cO02jzGjWhKfe7GZEtU4J06wOsmNGqSGVSSce9gbChFAHUodQ5aM/
         62R9mBtIQo2b0qkOPTU01eTP3VoIizULTTRJOKudTKtqijlWH7gB+60gK+lWkwrU7/y5
         0P91aNqv2L2GVIlRe7iO6SijIRkSv4FsPiygCQ2lO0pSkz0pN4oybxfjZzJgyxstI5FP
         LK2X4WVfS0IJwU6VQVQ/Yh8DPdn6bZcTEZeJJqQXSI0Qqhsa5cOKKInnvKwLiESYcxr4
         pBpw==
X-Forwarded-Encrypted: i=1; AKwUvByuxVZ6f/QTcqT7SKIh7oRHvMuYx6owOgeBB5ehB2qpsy8jgHXLtq0MffX6VT4qB4zPi6bVOgv7wmzJaJI=@vger.kernel.org
X-Gm-Message-State: AFuF++kAGnW26sEiwEOlMWjEYG3DTDjEQ5cyo6qdUxkMmDrxJ91ebMhI
	SrIThSKk6UbWzsGW+WIqGpQ0WLH2WB0JchsA01ZMwQoCdXf5IhCLUWyHy2v6gCxl7qFfOHk1mwF
	C66AjfUk39Y/+Qtj9og+CgOfYONaz3rYflNVn4C8e8elhzsZEhRcbGvAzl9CXh5byZXA=
X-Gm-Gg: AYBFou2ii64HrNUwUai6UpvNnRxbr9WsesPckpL194FCauTBAUD6yHgiFRAxjc11gOt
	j4rzgfDAWsx/BOhBE+Ro1i0ksiQrM1vCDJMb4U6OUpnGyGo81zanX3ysRdMsK3fIABvC/fUQuhs
	kLLEyrtvZEDXT+NwYPK9JLsx0aNJRJ/p+52QW1IYAV2Gszq/h53oCjRuI/d6iXRc5pgUUoMxCw/
	XmJsFigLduT7YhuROJ7Te/V9Qpr89BOEce/74gCDVmWN37dwsr1R8v/Tg+kZM3BRTV2t4691eBM
	n3rR+Ji3D5LLvEy0VtroCVyV/vmRdpaKdU/0Gqr9ktLhLB98RjugNpLpRhFdnM2kCSnauCQ9Gn5
	2RWZopalW
X-Received: by 2002:a67:eeca:0:b0:7ab:f5c8:4e11 with SMTP id ada2fe7eead31-7af1f40f506mr732848137.35.1790251659534;
        Thu, 24 Sep 2026 05:07:39 -0700 (PDT)
X-Received: by 2002:a67:eeca:0:b0:7ab:f5c8:4e11 with SMTP id ada2fe7eead31-7af1f40f506mr732837137.35.1790251658953;
        Thu, 24 Sep 2026 05:07:38 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:21 +0300
Subject: [PATCH v2 09/48] clk: qcom: dispcc-sm7150: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-9-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+PKjOzW1qJOcRFt9jkyNFKMBUYcRkBbKtj0rZteEkXs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJKt6hYAF4jDceApu1mi9QJGM5gAV8SaRoLJ
 WuUJRELyOqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSSgAKCRAbX0TJAJUV
 VpESEACiLFBQM6O5ftoSHB872E6yzFQI8+yupOXgPvj7AlIVv65MOalLK3VO/CnahIolCUtsCOi
 ytJsOH2taS+uff1QZHNXtP0FPsoRO06Z+JbeDvmlR7f9u0zbM2GEi/DkoKY6EKqmh5EeQwKrRqO
 i390cJbbqPau2h1RYTEbfl/UD+mJILn6H6duaTATA/FE3utEA6rG0H2sWPO/szGTWkUyZnryEgg
 SgcvyJOQHpEzStrxn0HgEE94Z2bNAdrENKt8ajoesFKtzlc9Hr68+g0dNkPqtlW6phi5b2kch5R
 dxaQBdqpbbJhuyDues8+Y4Zdg6cyJEGfls5jgNJ9DeCNblyWu9sDI1dkiuImAcGV0JZqY/lIavc
 XkR5jq1D5rOPhdmrK6mUTlJLI4At5hlSWvzC59mwMh5jmhhRxEFO5YrHTsFsixt1K+an6Js8EpM
 aKvFEnMklncbZ/Ytt0RTLcvTAjpDWWkSI7grxhewBRGPh374WJBRO5jXQW0oQ7RsyOUnDkxsSw8
 u4TWudD+pIwjy/w27zbn3aHGS636cNfmPjfDR/Oq9rFPPvUKpMwuCIdTFAC4nUaFC46/mpialRu
 ohfDga3KK5XN/HOAoPtyV13XPf9VbsEcwKKlfTuLoz99MCueUhkohGyTTXEteXq6K+V523Rm0wU
 +RyCKKUuvnzSdpg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: KKalEDtDlx_s_dt1eaW4Nu3n6VMOGYcI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0zbDGfC1d2wV
 ZHQMgw9DMrHIueyhEAW4swKAK8Z7eTazXCbvT0Qrrtx7lwQv9IpdqSGGEqkxyAwoC213CYooJBW
 lC4LotXVpH7GuPLWd2SWqkZBBxUeAXVEl0NpmdwtYo+rhjQR2KdF5n8Tj+Nnfx6BYpPQXVgupv0
 pm/SSiaDmsHztyFbmdlMGFnwjs1xW9vMdrAIyxDFqqbo9/wOjh8JKycXVwF5MGZVvU/CWGKKYB6
 5cdTYWhzx2oHGvo64BAbZHp8CtNmqG26dRk0Q5xud5qEbMNZvGUlQMfr73PxBc7UX0X+9YQbOE8
 C+qQXhlNtAweN3pYv5dUokQpJqBAyNxmtFYJre9vNN1K2zABeC33eWEqFK9TD/ABYBWRTDwUrDW
 7QH8riioDB/nN3/+XHK762dZYNkd25D9PukD4/c1CHq0UrzrJoUSag823JWdyYBTPg0+BXiq9xL
 U5qmL34fEirXuWF7fcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX7EZlixCVnJBK
 F/w8J8fMBrBN0Zlkm4Zowzy+8E7aU8P4K8QeIu5VCHPwWEZPQDhfeKMIrc0/B4kzsHEU/JgxwJ7
 0m+AvsQ71u9lS6Bnqy+okYOBxyMM89o=
X-Proofpoint-ORIG-GUID: KKalEDtDlx_s_dt1eaW4Nu3n6VMOGYcI
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab5128c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6fVa3aOakVPtjiFSkAIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
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
 drivers/clk/qcom/dispcc-sm7150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index b9df6153e50f..da7610856e56 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -963,7 +963,17 @@ static const struct regmap_config dispcc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 dispcc_sm7150_critical_cbcrs[] = {
+	0x605c, /* DISPCC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data dispcc_sm7150_driver_data = {
+	.clk_cbcrs = dispcc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(dispcc_sm7150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc dispcc_sm7150_desc = {
+	.driver_data = &dispcc_sm7150_driver_data,
 	.config = &dispcc_sm7150_regmap_config,
 	.clks = dispcc_sm7150_clocks,
 	.num_clks = ARRAY_SIZE(dispcc_sm7150_clocks),
@@ -991,9 +1001,6 @@ static int dispcc_sm7150_probe(struct platform_device *pdev)
 	/* Enable clock gating for DSI and MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x605c); /* DISPCC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &dispcc_sm7150_desc, regmap);
 }
 

-- 
2.54.0

