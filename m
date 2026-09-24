Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C320547ECDF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251642; cv=none; b=ktQZ4Ry/4I0CYmEz1ej+M2qkhP7Og6wc+fhL2d9GvjzRtJLVJg6HfT3D099D1CqFwITTcwvigqPCBCAnim0jkg3K9AT1GyvyZyPdmbXUcPmMtURHKkYmaaC+gY1IkxpR6CBud/Y9Nuul8GcYzngPccBPQKeb4CHY5vqZ4s9IUpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251642; c=relaxed/simple;
	bh=0fSXr4b+Ztfd2K7iKjW4OpK/vjCYRtqxTfuIJpfY0OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AywhbAHJEmry4Uu7AHkRLVmbhCTICuA8vYcdFk3yPLIlyNvpEDN/hlBTxDaamPO1Lp16tB0iIa7k9pDEhjjBph/DlEm2PXtiTLR+lrMaKluwTiJCoqYRdjldHvq4c3UHkluTN554t58gDvXt0cGxdJp6nREBaBaVs5OP7dhgUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMWlN5vL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0IGeC7N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMWlN5vL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0IGeC7N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4Y8f2285544
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0CH1y/lEg3Q4tkwCwEHIOcuTPB+bNVxl7V4JRcNayM=; b=bMWlN5vLbXMG2MWF
	awa5PZ4kgqgh7l+y9Ie5R7WnA5DQ+K10w8A56927cH80XzkSp5eUY3L7L4D5AZfD
	UyIc47jMrTgMm7m+zlNuczRNCaGv+fr8hEgoz4AkOFAvl70jZWH4fiwMPAjSBArr
	FnFOpO+UIbyA7DwFH+jCbnqDcrxn2zXa7hu5Joe9GkichTwOOtfQS2TsyMSj1rB1
	SZ1mFcqGeNoUtL3ynuiPM2fdroG4oTIDEuPsDhMTWTDZXzrXtaLyXWTjtY5Z8/FI
	gAEAjdfT6LkqAt79wuEv3eTTWeDc1FQFRAWCKd+4Qu+o77g6GFxBdEYr5kSm0+u7
	TLq4ww==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79013d05471so555962137.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251638; x=1790856438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CH1y/lEg3Q4tkwCwEHIOcuTPB+bNVxl7V4JRcNayM=;
        b=f0IGeC7NF+jalAWScnXRw42euq6f0mkg4eBrIAbaTvJ2IjLIPNmurZe5s8PGiPM8J5
         4r8lcPCaBluU/KxWuFcGIQwPgkuNNi10tAy29eeaogsr1BtQw9x018ZIS7hGC9DV0baZ
         zCuvbNU0UccPCN2AjzQbi3yAsxsVqPteJWv/O8fmFoF4SbcqXAo87EiSNW9oEFGaYq0K
         4niR+VODFr7ervEL6ngKEj6nw7ca4GLbkGxaDumnPcTdgwbcR2TPWQ7ssxrKpNk0Hf7c
         kxx+lMh6n9eACNBtDlvsZnBE440Txc0VBMv3nuff4cw7X+UfOl8htyozUI2B3FUIs4GX
         yHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251638; x=1790856438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CH1y/lEg3Q4tkwCwEHIOcuTPB+bNVxl7V4JRcNayM=;
        b=qEu/O+MKW4l4dSY4da4csUlAHcqhL1k4atuBSuifACDtx0vcrGdJQededp/z3aMPN7
         f0zxq4CVMqKtruYPcxQ1kzJDNtgsZ8eDx/7eX7gMba2A6cAqIqeUV/Arj4s+HPFsnK/0
         C5c6dtjsHAlzic0ewtHR/+CyO9fQCy42fIO5umA5C4lNGy8xe0zDzWhp59nW0ZkDg3b/
         qpd+tFLUrlcWs1GZpxynPzI0976Xf+JJGSbh6myHc48WBN4xaf/xT7M511TRPlRwF8LU
         jnyf7LSc7JkRrWqan+FXWFncpO3YGUdv/u+vef1xw39zLctmG5Nfh6zo5DQCMi2BrmaU
         /rWA==
X-Forwarded-Encrypted: i=1; AKwUvBwBoa5FKqXCUcvhK1dsMMDORpojDS88t6afwQFMyeWJPkKaTV2J4x+Bd9AVRAYPoxjEscNEvHpd+xGfyhA=@vger.kernel.org
X-Gm-Message-State: AFuF++lgZ80HNGUWzqDN8tz/FDFYfXqWfHZx+c/B3+srSAunadMgIvnj
	1D5GjimAGeGWSfd9hwi5XikdGSGeTCaLDcX3D1F8xnbAJ50UXqiTd4FlIO9rlmk5cooTBScBzTw
	HyCWnSRJzf/xeOz0hVOBXbFxZmynYX3lAQiBcon6lNls2l8CagLCFaWGs5r/Qb69OyGg=
X-Gm-Gg: AYBFou20s+0fZN4xEsSG5cuWpytQUbnKG8Pqyt9S0aYHbXsXo7fNo3kvQlHhzgHaNYO
	paclT7P4cntJEHbgpfMH6gFD+CnPdFQPJ0JaZWkxco/WdFjLpa1Vy0Hac4mC/gQHLhjTUK4aqfJ
	C3YvQN2zIocXGmcPoqlHtpxJEUpDRp9j3E1DngXKlLuxinWftT8k3JHVNjKgxJEMq5hujczKwrn
	ae/2pQGAgYEfsAoVVQEkvErB8iRyGvHw1z/59SJAkj9+XyEEqcCsc8kE0yh+3r2KDMxfMUgnCun
	hw7nGAw87Gpv8LQ+6nmxXu4A//yew+P0zus1hHV13dzQGYK8fHSvd1+1QjjhnfFn1x5FKNnjIzh
	jJchBETKW
X-Received: by 2002:a05:6102:5344:b0:7a1:f7d2:e831 with SMTP id ada2fe7eead31-7af1d4bbe21mr907583137.17.1790251637817;
        Thu, 24 Sep 2026 05:07:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5344:b0:7a1:f7d2:e831 with SMTP id ada2fe7eead31-7af1d4bbe21mr907565137.17.1790251637177;
        Thu, 24 Sep 2026 05:07:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:13 +0300
Subject: [PATCH v2 01/48] clk: qcom: camcc-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-1-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0fSXr4b+Ztfd2K7iKjW4OpK/vjCYRtqxTfuIJpfY0OE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJCRYr3Wwy4NAWEYeTIzSiE8cz7r00/8LUhz
 zslueJPu0+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSQgAKCRAbX0TJAJUV
 Vv3pD/kBnr+PrtFVwupmgHnQww9oqbZzTSjENLc0rv27gSdLYVL3XWPYGwqvugGozZiIg8cOZJc
 OFTqLhjYXDU17iUVFjBScc9AID1YKmoPpVsude2GKHZQxXojjqlFOZQ271ISfYLvsjQmM37ceiq
 lwp7EgQgN/G0pofYC3F3EcMI7wKSGCYHk3ySvpfFrkE/jr0hQn0OH/cXASoojXuPDEVlwtd3RxK
 32EunynxPvrrvboAZrCK3okFTDCcpGnIUkOEnqIHypDlg2lpR03AY9w+L26yeSKtWbkwt8XpRjG
 10XISCiPaewT+W0mTaVwxzY5enyL1XGK41rpa15b/E/1zV80Qx46+H7GIpRYMyIbXkvz/5oCkUA
 w8UMaFsCO6TuFRDedN27izQ0WhqmS20B/H7FytvEt14WvHOSyiAoL7qvMZLq0HG3BKJ9qJWhpAV
 CUmUWSBxAVC7Ubqqma2mkPwRcPbIku1jtYyDYb4V0jUWmYJszfjlpk41bLIc3dv+NbwH+pYLpjR
 ByBydIisnnZPRcj66kNr448M/XEaTO/GtBimRxNc4Rt9GWqZUo5DorPp5vrOSQgDI/u3IbFPbLA
 9Qces79dZLSkCyUKGSXJ5Ghxs1Tm6F8wQuhQstNdSFFRVL82ymZHD+z+kAEcvEaukozaEIPRPHZ
 BtDvzyRRViSbq0w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9SDWWMFOuAfC
 zGWUWMOEFJsVDraN2AKxKf/u33x/HHyCRq18YJmvCWmKY2C4Zmvi5/T8UseXoq9aLc8ZOeQTWT8
 K9NpReMVIR7y0afMoZIcgyDHcUAo9Zw=
X-Proofpoint-ORIG-GUID: 5p0Q_Jl1C9r8TYGsby_66mRQjEazxxNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXyrDSI7Ee9zxL
 bfIUMkVpSYk3obsh5sLEJNxujSWsViy0EpS6WUuiyLhX/xab/J9tZ6JhRPCssulI68pGySV32WG
 ExdPTzt+Qt1WplxlzZbyr4BwO6EvNPXQy3IZrhWo799fMHtGl6tM2bjkgNX8H4ef4uPljymCrS1
 97thLiK+pEFxDyuDjn9YfIt3WExEmz1xFeVezYKxTqCdfVEgfllSpXIqKTW9fHraK3gCoUcvj2z
 v4exuBNbs/T58oZe4ASvJVi6eCDgdn6oLd4sw08webYteepEq0ARiOW8Aq/Dnw9TglPtOYo2LIh
 6qWDUcosmlfyyswoX+3yiHgMxuCmT9u3DhmDxtkECYHtMPNJHvCiPVF/9YD7bUnhEnudtArpwUh
 6cdwBFU2rD7nRCHUQXG9lEi/P3whFLKnI46FXiH+KI0lxiXGL9g05bwasspt9YRadfUNfKnRrsD
 anDIninbmeueJpwz7QQ==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab51276 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8Nt88UfW2CkDv28g5HoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 5p0Q_Jl1C9r8TYGsby_66mRQjEazxxNd
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

Keep separate CBCR arrays for SA8775P and QCS8300 to preserve their
different CAMNOC XO, GDSC and sleep clock register offsets.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sa8775p.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index 914478139e97..b0a8f0077dd8 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -1818,7 +1818,30 @@ static const struct regmap_config cam_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 cam_cc_sa8775p_critical_cbcrs[] = {
+	0x13194, /* CAM_CC_CAMNOC_XO_CLK */
+	0x131ec, /* CAM_CC_GDSC_CLK */
+	0x13208, /* CAM_CC_SLEEP_CLK */
+};
+
+static const u32 cam_cc_qcs8300_critical_cbcrs[] = {
+	0x13178, /* CAM_CC_CAMNOC_XO_CLK */
+	0x131d0, /* CAM_CC_GDSC_CLK */
+	0x131ec, /* CAM_CC_SLEEP_CLK */
+};
+
+static const struct qcom_cc_driver_data cam_cc_sa8775p_driver_data = {
+	.clk_cbcrs = cam_cc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sa8775p_critical_cbcrs),
+};
+
+static const struct qcom_cc_driver_data cam_cc_qcs8300_driver_data = {
+	.clk_cbcrs = cam_cc_qcs8300_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_qcs8300_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sa8775p_desc = {
+	.driver_data = &cam_cc_sa8775p_driver_data,
 	.config = &cam_cc_sa8775p_regmap_config,
 	.clks = cam_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sa8775p_clocks),
@@ -1837,6 +1860,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_sa8775p_match_table);
 
 static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 {
+	struct qcom_cc_desc desc = cam_cc_sa8775p_desc;
 	struct regmap *regmap;
 	int ret;
 
@@ -1927,18 +1951,10 @@ static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 		cam_cc_sa8775p_clocks[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] =
 				&cam_cc_titan_top_accu_shift_clk.clkr;
 
-		/* Keep some clocks always enabled */
-		qcom_branch_set_clk_en(regmap, 0x13178); /* CAM_CC_CAMNOC_XO_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131d0); /* CAM_CC_GDSC_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_SLEEP_CLK */
-	} else {
-		/* Keep some clocks always enabled */
-		qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
-		qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
+		desc.driver_data = &cam_cc_qcs8300_driver_data;
 	}
 
-	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sa8775p_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 

-- 
2.54.0

