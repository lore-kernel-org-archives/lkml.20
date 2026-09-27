Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4032C3B6378
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515804; cv=none; b=QJ09DKyIQ5+kCgui/6pCcb9xZ6zcgbRxeomzlFFZ5gZ6V3r5edjaykImrS2RDiZSVLP1KQRX/TVe39ZUSW5/hK+SSsFpe1puonkEpAQAwxvpX2pjwwzphbKurhjwdNvQhzvN0f8lnrAoiwTEtAVwxUFchdpJja4uPayWgiAhylM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515804; c=relaxed/simple;
	bh=FL7ldl9LU54gpf6PaJsIAMaKHdINinRa+Hmc9p0bjVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GXL+JqoN7Z6uvW4hTNTXFVUKNPyBNwpdQqNv3ZdyG8JKqaAm7dQcDaI9PbphMTb8USUtpAik5lHBdIqWRQOogdxSC4jBC1g9WIuf2BKKiFde6ihkj2nIzUcgArR8QmRxPDqmX+QXUdvxvkzYfyYk0jh3+RZehQ5MshPWOkdMn2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxRkIzyf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd9DuAFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxRkIzyf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bd9DuAFq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxUUR4013973
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Obygb7aPUf7Z+CJroQ+0vxrBlTyHCRZkXWI/whnPI/8=; b=GxRkIzyfJNJqW7s+
	qWt1A+ohXbjcyJ2NkEKq74pQIsMhxsTiOanYYlmcTYuFbG9mOvQ9k1aBwkvCNpR0
	1DYL+UjR1MaznzBiz1J5dQ79+IQNTl6+wNjHjqcB3f2x0uX9HkHCg+mOwZ9Jsb4F
	6vr/Qd+VkKkLS87xPEL24rtfh1ZYWJg4N4dnx8AcU62mwzSINgSQFRRZOMEjA53G
	MN5aVO9YjfzwswY4l5LrAGXUj3ifOFM4GzsBYLed3HpQudGkn79Ce1KUTT2TvVAm
	tRIOqDcEZVZXNueXtEgDzHGX/p2xseRjVexZ+JP9crYWghfiD3aleEnVHgwIiT5x
	mNEbUw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6tejx6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:30:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91578e96164so6285316d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790515800; x=1791120600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Obygb7aPUf7Z+CJroQ+0vxrBlTyHCRZkXWI/whnPI/8=;
        b=bd9DuAFqaRB27onP9KeFHuwbSHJlbqVBZ7Tu4FQqu8bqRbky8FZO0azlUGhzWPK8fJ
         iFf9VO8CT/gaCc/0OYmoIyaip1yeY03pUfijt/zUICRxodcDlVWpzhmyTkKRUwZf9fMx
         3FJbTQ53AEOYTODcK+ZmLfPscPZtL1kVr0qpkYWYNvX4YLM+mZt+6cphx5mF1q3RGX1S
         IQYPeZpr5DxWQAwLPfrHqtExPyPqA2upctx0Kcxc3nsMtP9XMj4xLUfBGgc94fgR88jV
         NX/9LI/F7eVyf/nji0oRZoKUaV2mKwQRvhDAgqf1JHxsTH4x1/0n2t/j0/TcWYleBtBW
         3psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515800; x=1791120600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Obygb7aPUf7Z+CJroQ+0vxrBlTyHCRZkXWI/whnPI/8=;
        b=H4SAa63Wc44v15rWk9xKaC+t7YXR6h/d+T3mGh64WgUKqC5hf/AdiM1zILpOcoS4oV
         DdfV1GLr/zS6AkLcoLgmJnD2GyRAKl4YA2Yk+NyfvdugEx7VcBfs9Bge5V0jaAYf/B3C
         OAt0LlBoCPx4NtXOr7Z6+yt+Dpmx8ORBcmV81sEWkpRVdixFmiTy2WP0szZ5Wnlkhk3F
         6qUQoxAS1R78Cb/VzuZ5XBsat8v0Q+iEZHvu1WHHaCIH4UOs6L3mgq/MA166DSrNTMHA
         YrB+BwsLyzWCmm6HFT+NZ/AqqlhMgJY3ENjhZOWADV64ons0Bp+ynTq/sTd49YM6W3F5
         pQZg==
X-Forwarded-Encrypted: i=1; AKwUvByw97xa6K92AXcszRBE36/KLxGvLph3rXK6zQdPsmK+XEMAz98MVjYlqV6yfGMAfNU2Cuo/RqtV8OwLCrg=@vger.kernel.org
X-Gm-Message-State: AFuF++nOiRtpjRDwAiZt/sAZdtlkeehWOVy56C2YSjBppEvSPHEJQo5k
	3vvfpYx+2hVumXWBK2fZSmWFGMZN13bgL87PZVs1zTud95Q5Fhne6D3X2L3UKl58W6pO6x6SiDO
	52WRAKvvIS4oldts5f4eMpXfVJ7u0AP1eISTlRzzAFVcq7UAJZY0ljcXDKQVreDLe+hk=
X-Gm-Gg: AYBFou1aMQfuhOKSnKE4bBA6TBA0ZMsYw4dxZ3VCYU11cKEN71K9Q3gNS12CiXYvZk6
	PRJ7trwAk1AeDobst6CfofemPARzig8Yb6ea+p4R4EIl0f1nE2/CPIbqQqvNlKqOrOOE5gNAdhB
	KREgWcVlixMDm6Z4NXGyzgsTfJYmXbo2xIRCt2Z0GwyrsNjh/o9dzGMHNbPYwNP9YssrOQGpCzM
	7tnq8sXzQY2XqZySQMtH7kaEPg5z28oq9ZmPbTPar8twUaEl7n2dzhd9ABbV5yYqxatAB7IzdMt
	b9byBVXMSEG4ISigMxiXJp6WRJtiRPzvQDQh02RFcKqw9Zylk9EdkpN0i7uTeBkL4TyK1XbMEYv
	1SjHdUQKDCURSL4vYjnRiyDXO5imLuT4NtS8zdp4A8VJBgRYe4hpbiTVNkPGpk3zLsPcOq6LQ5b
	ehBIJh1l2s+tkzxFKbLUX2Z/zJIjeKs/f3n72gEds2zUDQaiMnpvA=
X-Received: by 2002:a05:620a:4608:b0:93c:7800:bc55 with SMTP id af79cd13be357-93c7800d31bmr107413485a.18.1790515799864;
        Sun, 27 Sep 2026 06:29:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4608:b0:93c:7800:bc55 with SMTP id af79cd13be357-93c7800d31bmr107410385a.18.1790515799360;
        Sun, 27 Sep 2026 06:29:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00179c729sm94636745e9.15.2026.09.27.06.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:29:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 15:29:53 +0200
Subject: [PATCH v5 4/5] i2c: qcom-cci: Share the timing table across CCI
 revisions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-cci-clk-fix-v5-4-4cd498559ae5@oss.qualcomm.com>
References: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
In-Reply-To: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfX8vM1eobKJLsM
 lpxOeUa1kDjjcvQ0cpuSamE1L5JcpHatKGPFHdcUnHgRPT2BNKU5IuwPFiUgtMpiyDjX2g1wLfP
 Jnk1OFV88E5bTjH3Bpwsll6DNECE3jsLI+qY2gbbJrlcttn7zy0ERGak1H17LCh1zOHzHlqNZ+1
 G+oeV/xuSogsaTzhD1bpW3Y939H5XKOVA8h0fbjSMFGM4tDzstQssmhU/M8v7jCM7nzl3Uym9jV
 YPxxtPElniUpm5g8/BlWKD9xoHZ39Mn8MW+vt48p1/n6rKoSLdq+D2Rg3mjB92+rpzyGOMFM1IR
 BsQsxO6QKSTCJ9kgmBsEALHrWreC9wxswk+Uc5e66DWoHzH8cnahnzuT03+P6c5Z/dv4rK/xiQn
 J7LM9I9KSQtb7YZkdie8GUE+AYs4nMY3CzxUwHGOpk3o6hX36D8qO3KvIBjyDfKxwNgQaxx/RCC
 Zy3bLOo8Wj1st3kmZvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfX8AAuLbkJ5fZQ
 jvHFDRv7B90uptEDU+HnrL95NKG7vhDugfS/CeqLl+mHoWS4qpFiWINnF+6e2DabjVFNRvJj/Er
 Ra7HUuc5v7HO7Qsh17mLLSeRJRC4sas=
X-Proofpoint-ORIG-GUID: wa5M3eY0OqOYvs79csg__JL34wfFwMW_
X-Authority-Analysis: v=2.4 cv=X9LHu2Te c=1 sm=1 tr=0 ts=6ab91a59 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=aKP0LZVuKWpzAjQh7DIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wa5M3eY0OqOYvs79csg__JL34wfFwMW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270053

The hw_params timing values only depend on the CCI clock rate and the
I2C mode, not on the hardware revision: every per-variant table used
identical values for a given [rate][mode]. Only the set of supported
modes differs between revisions.

Move the timings into a single shared cci_hw_params[rate][mode] table
and describe each variant's highest supported mode in cci_data with
max_mode instead of duplicating the timing values. This removes the
per-variant timing tables without any functional change.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 181 +++++++++++++++-----------------------
 1 file changed, 70 insertions(+), 111 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index b6fa37a306758ec33ede6fcc39ce4412b86d9a84..21695c744502f7fb5d333f1272f3771e4d9d5508 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -124,7 +124,8 @@ struct cci_data {
 	unsigned int num_masters;
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
-	struct hw_params params[NUM_CCI_CLK_RATES][NUM_I2C_MODES];
+	/* Highest I2C mode supported by this variant. */
+	u8 max_mode;
 };
 
 struct cci {
@@ -249,13 +250,76 @@ static int cci_clk_rate_idx(unsigned long rate)
 	return -EINVAL;
 }
 
+static const struct hw_params cci_hw_params[NUM_CCI_CLK_RATES][NUM_I2C_MODES] = {
+	[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
+		.thigh = 78,
+		.tlow = 114,
+		.tsu_sto = 28,
+		.tsu_sta = 28,
+		.thd_dat = 10,
+		.thd_sta = 77,
+		.tbuf = 118,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 1
+	},
+	[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
+		.thigh = 20,
+		.tlow = 28,
+		.tsu_sto = 21,
+		.tsu_sta = 21,
+		.thd_dat = 13,
+		.thd_sta = 18,
+		.tbuf = 32,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
+	[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
+		.thigh = 201,
+		.tlow = 174,
+		.tsu_sto = 204,
+		.tsu_sta = 231,
+		.thd_dat = 22,
+		.thd_sta = 162,
+		.tbuf = 227,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
+	[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST] = {
+		.thigh = 38,
+		.tlow = 56,
+		.tsu_sto = 40,
+		.tsu_sta = 40,
+		.thd_dat = 22,
+		.thd_sta = 35,
+		.tbuf = 62,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
+	[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST_PLUS] = {
+		.thigh = 16,
+		.tlow = 22,
+		.tsu_sto = 17,
+		.tsu_sta = 18,
+		.thd_dat = 16,
+		.thd_sta = 15,
+		.tbuf = 24,
+		.scl_stretch_en = 0,
+		.trdhld = 3,
+		.tsp = 3
+	},
+};
+
 static const struct hw_params *cci_get_hw_params(struct cci *cci, int mode)
 {
 	unsigned long rate = clk_get_rate(cci->cci_clk);
 	int ri = cci_clk_rate_idx(rate);
 
-	if (ri >= 0 && cci->data->params[ri][mode].thigh)
-		return &cci->data->params[ri][mode];
+	if (ri >= 0 && mode <= cci->data->max_mode && cci_hw_params[ri][mode].thigh)
+		return &cci_hw_params[ri][mode];
 
 	return NULL;
 }
@@ -696,30 +760,7 @@ static const struct cci_data cci_v1_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
-		.thigh = 78,
-		.tlow = 114,
-		.tsu_sto = 28,
-		.tsu_sta = 28,
-		.thd_dat = 10,
-		.thd_sta = 77,
-		.tbuf = 118,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 1
-	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
-		.thigh = 20,
-		.tlow = 28,
-		.tsu_sto = 21,
-		.tsu_sta = 21,
-		.thd_dat = 13,
-		.thd_sta = 18,
-		.tbuf = 32,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
+	.max_mode = I2C_MODE_FAST,
 };
 
 static const struct cci_data cci_v1_5_data = {
@@ -729,30 +770,7 @@ static const struct cci_data cci_v1_5_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
-		.thigh = 78,
-		.tlow = 114,
-		.tsu_sto = 28,
-		.tsu_sta = 28,
-		.thd_dat = 10,
-		.thd_sta = 77,
-		.tbuf = 118,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 1
-	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
-		.thigh = 20,
-		.tlow = 28,
-		.tsu_sto = 21,
-		.tsu_sta = 21,
-		.thd_dat = 13,
-		.thd_sta = 18,
-		.tbuf = 32,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
+	.max_mode = I2C_MODE_FAST,
 };
 
 static const struct cci_data cci_v2_data = {
@@ -762,66 +780,7 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
-		.thigh = 78,
-		.tlow = 114,
-		.tsu_sto = 28,
-		.tsu_sta = 28,
-		.thd_dat = 10,
-		.thd_sta = 77,
-		.tbuf = 118,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 1
-	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
-		.thigh = 20,
-		.tlow = 28,
-		.tsu_sto = 21,
-		.tsu_sta = 21,
-		.thd_dat = 13,
-		.thd_sta = 18,
-		.tbuf = 32,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
-	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
-		.thigh = 201,
-		.tlow = 174,
-		.tsu_sto = 204,
-		.tsu_sta = 231,
-		.thd_dat = 22,
-		.thd_sta = 162,
-		.tbuf = 227,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
-	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST] = {
-		.thigh = 38,
-		.tlow = 56,
-		.tsu_sto = 40,
-		.tsu_sta = 40,
-		.thd_dat = 22,
-		.thd_sta = 35,
-		.tbuf = 62,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
-	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST_PLUS] = {
-		.thigh = 16,
-		.tlow = 22,
-		.tsu_sto = 17,
-		.tsu_sta = 18,
-		.thd_dat = 16,
-		.thd_sta = 15,
-		.tbuf = 24,
-		.scl_stretch_en = 0,
-		.trdhld = 3,
-		.tsp = 3
-	},
+	.max_mode = I2C_MODE_FAST_PLUS,
 };
 
 static const struct of_device_id cci_dt_match[] = {

-- 
2.34.1

