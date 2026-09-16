Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C43AAF70
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554667; cv=none; b=fg0cVixd9+jEtuVrCln/+CDmqXyTvbrH2zRggHFFIcRFM7ZAl5FL8EhwN28OOAc0918I0uldEIBfw/UctVg5tv+Io7BCYv5Ouy4q0swDsua9vq6GqSqpEzpi+IKUzLYI4CyT42RXXnuNOKvhufN557AKZ/wezEtySDAFFuLNHlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554667; c=relaxed/simple;
	bh=rMtNd5inLLPVsBRg9EFQAd6EW0dUSKpKAosDfVpFy08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bo7lhBWoBaR099Bf2+zF8PD8cdnaPKVMs5HilYD8LQvBjh+VtJcxPuv0xeIZcOPL7beIUAaDwEDI/9N3R+5/lO7jHKpkvgY/NW/bUcEqCI7O96twO4X2FqpBeo8FZJy16tkTRI7PrtkV0GvlX1uBhulM6cveihu/Gr5jjW46CYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdbBrf7s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/r6OTu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdbBrf7s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/r6OTu9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92hha3169140
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AB9zMkKYXVpm67YJvqjEfp31mZrTUmWg/tW5iEZ5TTs=; b=LdbBrf7sV3uj9rf1
	4DNP42lNk6Io3BySgeIlh4ZY+N5JGRUkfK4Lg6MhZfxwylcNEGP+GCK5MUmH6egW
	x/0apcpIjlXYXIQzLTZMrl1sm2fAqZUP9CVs4CQGVYoshTG74vnQ1pPXGBQKiMoi
	Bna4PndQjq0yXi3D5s0BZLz8V6JRHFFfBeUs0UnhZYHWE/tQaHBEXgwEOCNg5FtQ
	6151nxYVlr/pme79N4fF+x/NP5qHxMFfZz6wu/vFg8uoQa8xYYFE+npdRiv3Xm+S
	En9tjuE19zJM02uXx/gQzhsKHV77jt3rQeVE1mjhxh8KRXauTSdrRs1zN96ut9w5
	6IhOhw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2rq3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:31:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so21683085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554660; x=1790159460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AB9zMkKYXVpm67YJvqjEfp31mZrTUmWg/tW5iEZ5TTs=;
        b=Z/r6OTu9/lZijiii9yHOx/HOfgrjFBFjd6yE/zgH/cZI9M9nnBziJGcmV2XAYEHW6X
         pU5l711piF+gyoEqvYtD74rYnRuGmtlagZDftem8vRCfkcCaiMmtLFNfqph0hD8nXD9c
         MsJE2Rphcum68aS8kW9IaB03cIimZuQhcndHzHxwPhrGxwWM5tupC8V3ISOtyERoHZLM
         MwKn+BrwFlej/qiQRp8X0lorpW5o2UzlcWjrSP3q1ctV4vxod04W9xp31+BTv+K9F5Gu
         s2lEf1WWdkElZvM0Hk8V5Vd0sb/d0qOif81YBHjR1n7diaG9g5c61KeUPLvkKHEku1Qr
         POxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554660; x=1790159460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AB9zMkKYXVpm67YJvqjEfp31mZrTUmWg/tW5iEZ5TTs=;
        b=d/XMHfDuBF2yQkUKcpqMr2Z28SfJYcRMrKM222Bc/hv/uykvCfL16Tmn+sImRRv041
         8l5dz4+KjGXEV3VyxsjngS0YbBiRId1MkGSZIFX1xOFsUbUX92u2W3S7GInAMh6ZZBpd
         C5MxszdvWLZ7+aFAv+ilfBeMsmrWREh/2z7WQwteokWrV6OT8SJV9EkYhtkP8/6v3VYs
         XnKblhrz4zao2aXmruWe1ORP85mPmWngRNcVfd19b0MsudjhOGY3zG8ml8xFdu7Gb+CR
         SZ1al2kUpWYdf35y/2KIiX/a0mJuSq+kB/Zd+KfRRBWM7JVqwZE0oRSh/DHTxqrarIKE
         Wenw==
X-Forwarded-Encrypted: i=1; AKwUvBz0XXZyJubxN3Hg4EFC8/Q55weUvM+W6ClfdxsblypZr6YT/Zvc6W6PTgnjeiPIyZjgAEAb3Z2ta6FYpx4=@vger.kernel.org
X-Gm-Message-State: AFuF++ljAjL7tkLyN1rAnQ7g6hWEhOXouQWM4UR6GXSw4LGQLHsTZVIH
	g8OjixlLIsgkXmLfP2AubbbClRjDeF8BDBoMXDM68u2Xr7cO/ZG39zUBT5NQedCIHt70TIa1quh
	jI4tJki+kTbqh/WGkjP9f2/pVZyMYAon0vq2AF81Cu3HJ1Mw6c6c/ty8O0ItaNrJYa74=
X-Gm-Gg: AYBFou145/1nLwS1t/rBJO+wHYxT6/ImRhtEM/T6KtBY5+xBs0dIrr4p3JKM62PEA5k
	c24sq6xTVnvuKKfpYd/iFH7ARIFUe09wGwNkIedvFyFgO1HSWvYnvCtsHsDLMJ7hDeg73oJG/G1
	NJOPFWyz6k8C7ekJoAOfUk6ZCnJEUt7mjDJRrRgVAoCy9BFAIXEG+rzr0GXj97xMGFSDunWz1wo
	D1cOunGSE324DKRjKmLv//SS2fGt6BQ+YbeeZlHfyzp57qUTpyZHQcB6/JDqO3I3wVG/ubWCQNf
	64PTzH6QQPjs5OpvhQ8sWlcuWzHooNi2i1ccw6KMTnG7YghcCCE8siZVtbRLHxUBmPPyzpIGzWO
	974RR3tU=
X-Received: by 2002:a05:620a:1b84:b0:937:1097:feb8 with SMTP id af79cd13be357-93bb785a7a8mr333206185a.24.1789554659635;
        Wed, 16 Sep 2026 03:30:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1b84:b0:937:1097:feb8 with SMTP id af79cd13be357-93bb785a7a8mr333199785a.24.1789554659120;
        Wed, 16 Sep 2026 03:30:59 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:29:04 +0300
Subject: [PATCH 48/48] clk: qcom: videocc-sm8350: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-48-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3067;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rMtNd5inLLPVsBRg9EFQAd6EW0dUSKpKAosDfVpFy08=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm95wf4fTycs6dfIv2bVwj/rNy9SsFZ8weo5a
 J2iDqVjbmaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpveQAKCRAbX0TJAJUV
 VrSOD/9DRaFrnFC7FqAfn4FkpGEwD7CY3hBn6l6ZmIgdeK3Mn/RCRA21TCVRHG1A6eC9pGISAiO
 /zugxMATdqGwOwTChGwKDAzwR6dkjJcYyTm3wdOTxnoNtETloDm2HUxqEnnl97+wBGQKFx/wI9n
 uUGZ00PYFrnDdsyBA+Ea5frdg3iYsK7dTkyTs/a80gM+YNQnil46FzaRFxVt/jxdo4rN8TAKIal
 kkwN/bfceJk03OuLwBOM7x5voiSG9S9+mqheCKTkIT4gG3gdiGayr094lBlV53LeIf9hk6Porbt
 SKfepreYW+UF3z6A4mxo0JCWEqd38m63zbYSeTW3SRNCPzucKi76Tyrtk2n2pDUTJAgp0LxBsUs
 eQR10AoBmfJx/PESWBtnrEDsB2vMW6gAFmlPkFIlO8fssY/9xomHQLPSBvxCqo+zxLxOvx182Ta
 MT8U0mFDhTwRFZnAEBlPyGxy1GOPCF46cwQ8ScLidj+Wvi/UuqAFy4NiXpqXijNihz0SvkB6BBD
 ME7nPcQoKQrNr+j8GBJB9SdfPi8ypjEDPEdP+yv5oINq1ZE/bDDT8nR7r/+xFlHRWavGpCa0o7Q
 SrNz7O8VPDeMSmdYHG40RIJ8c3vef2mVrh9VcGhM0U59wJt9sdbD+A3in9EgCgnBQm7kY9fwKh1
 bDQXcxmKtxnGefg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Ela7H8NG5-3-7pLs5NNLqk4rASqXrWod
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa6fe4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8NXlPAYpUir2QwZKpCEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Ela7H8NG5-3-7pLs5NNLqk4rASqXrWod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX9GPK6AcKw1A1
 WKIXvyt7AAYUk+CUHAyJX/x7grNG+vDpb9c4fa5NxHth/aiCfXvVJdujyAVKQ7ENc+mJFoppqJQ
 oTaAnzTqcQOY6HVXHxoLmbdWSjuWcQGWxuTlYr/+QFaRJc9WWhjyxUEIvDSKd/NAx5hzibuZqFX
 t/VvT6Exg2+mG8ryOdoBcBL1kPdhgHrElSs8n3Tv2mlLI3QE5K3ExbXARHSft3FR/CQF4xJh2qc
 G/mg6I1YO6aZXYXzd5jLMr1GHhgPBlHZrYN8zqjSc6q4CT03X5urNTpyE0KckRiQa+NS9+JnjZq
 Kh31//8x02seurVmZzihTJz7JtSocoD07BuBwvvpzhuKpJyfLbObbrtQCd326SU6KZgSI3UrXPJ
 MhAeQIMFB9eyp554gg/84jA9M5Ml7oNsO1p+kRNR1VxiF15s1azA23pYDWS34KL3/ToCNUPCohr
 R28NWiy7E5zE7Ln07mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxTsXQwtoWcnj
 jCjTnTjLaah4gad3JNRcBtVhatKqeK3bbgLcRu6HBDIlCU3PqtE0fhFC///CQTOLXI1PeDKrCkl
 AXk/IpZwa5k2Lr14UdWx55dW26BU9Is=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Keep separate CBCR arrays for SM8350 and SC8280XP to preserve their
different XO clock register offsets.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sm8350.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index 057a9474894a..8528aeb3a342 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -510,7 +510,28 @@ static const struct regmap_config video_cc_sm8350_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sm8350_critical_cbcrs[] = {
+	0xe58, /* VIDEO_CC_AHB_CLK */
+	0xeec, /* VIDEO_CC_XO_CLK */
+};
+
+static const u32 video_cc_sc8280xp_critical_cbcrs[] = {
+	0xe58, /* VIDEO_CC_AHB_CLK */
+	0xf34, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sm8350_driver_data = {
+	.clk_cbcrs = video_cc_sm8350_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8350_critical_cbcrs),
+};
+
+static const struct qcom_cc_driver_data video_cc_sc8280xp_driver_data = {
+	.clk_cbcrs = video_cc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm8350_desc = {
+	.driver_data = &video_cc_sm8350_driver_data,
 	.config = &video_cc_sm8350_regmap_config,
 	.clks = video_cc_sm8350_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8350_clocks),
@@ -522,7 +543,7 @@ static const struct qcom_cc_desc video_cc_sm8350_desc = {
 
 static int video_cc_sm8350_probe(struct platform_device *pdev)
 {
-	u32 video_cc_xo_clk_cbcr = 0xeec;
+	struct qcom_cc_desc desc = video_cc_sm8350_desc;
 	struct regmap *regmap;
 	int ret;
 
@@ -539,7 +560,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 		video_cc_sleep_clk.halt_reg = 0xf58;
 		video_cc_sleep_clk.clkr.enable_reg = 0xf58;
 		video_cc_xo_clk_src.cmd_rcgr = 0xf14;
-		video_cc_xo_clk_cbcr = 0xf34;
+		desc.driver_data = &video_cc_sc8280xp_driver_data;
 
 		video_pll0.vco_table = video_pll1.vco_table = lucid_5lpe_vco_8280xp;
 		/* No change, but assign it for completeness */
@@ -558,11 +579,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
 	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, video_cc_xo_clk_cbcr); /* VIDEO_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8350_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &desc, regmap);
 	pm_runtime_put(&pdev->dev);
 
 	return ret;

-- 
2.54.0

