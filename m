Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898253;
	b=wKN0Qusy4Jjox3ynD1kjOWhXUz7UKFwMPcUnosTjexxxIfqnWpb6GoLXyCo0tBM33+/Y
	 f5qNJNo5OeTJrJ4S91nIKpps5pcIg0JTDf49oNNmiNszsWCZZ0lnfxq0rmPM075sQO37y
	 8Mmem1IPdyVk3nUUzUgM4eWNl5P9/6oZHhUFzR/R26eOfBqx+98rPEUH0VOnwv1AC+Clv
	 gc+hdqbgFLuKBl1XCF9nqK55Yc/fwEOgRFfVYajnT7+1R3n97UDdB6F+YjdZ2R6aLbOU3
	 wxgQSIExaGbEuem0hhGcDMezcTEx96TykbZ+FZZAFbpfvBzmY0ToJW6e3Df+hVdYrRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898253;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
	b=vXEWFHndoyKmVhxsxIUbloB+KCUw5E3D7GFq4GxH7eZBIlnxAPx3MpKBsW5Y681/yl6V
	 m8soFyQ9TB3MelmXSsx9FYnGXDjN6exr9hmPwF0asE2z3o+rqHUL4jZdhZJqJGlmirVum
	 poalBsc6t7O58MuI9ad44t8RW1fJmUWb2fSaR5mBiwDZMRrkZVi8W1O3y1V7AJ827zI9o
	 Z0r1b0yhjIjTNHJ1rqHI5sz+xGfQzH6n+O63gGTbx3Punypw3NZtzjac/QEJDpoos1mV9
	 CYpmL7bEolvzJeKN43jzg2DzxzUxBAfBaWWAx8wGBsz5ub65eGiVFDVIWq61+51KIDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZKWQNWT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz1GBPXI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30760A3824
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D30760A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZKWQNWT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz1GBPXI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16Xlf1586223
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=; b=OZKWQNWT4TkvCQXu
	+v6UTayRUYUaMkXQmkbSbDWqK+TNtKBbvvsftYBZvd/c/CTbbzSxEDxo8ovKVgTw
	GQAUIjbvYpkRUdvhGanyv2HWgZyr/kihXxSzGKbAQEhY0y5k2o7FLs9gB4oEnhJw
	xgDx+Adf6Bzhs8D25EVRZmTlTPETsx0JGBpfEdv6Tf2rKEt/Tdp8a5cD35OyZusm
	hB3PXvaCOYxTGZKhHD1woYoV8NZ527iXj/r2xLFMH3U3ZZCcURSCXPh6W2cKzioY
	5A1Zvnu/dSBMN0HM9+tAtwD+nRTeJ0NpBN/mZMJXSzHQh0MLQ1IMCx5NcjZZlA7a
	1tu0rg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuka5cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso3819263eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898252; x=1793503052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=Bz1GBPXIjmW3XY6ajfoVctbb/tI91wsS/DkzodrC3ab9Il6wO2fQvwtuInPiAK5Ej0
         QI+uUUfe0eGLcDXEISHb4kk3dPoRS6mDMPyEjplXfotYtVWw//vc5/goXZQH7ewPcTLA
         h5wjsD+ohzSr+nFZafsUGTOO4pJ3fSoBwe/uAlyqfbKJ4UU7vFq/HGuwMU6ErBLQFAZ0
         ox51ZNZJ7+XE2lnVt0yCVV/Pt/rJGnUs5EHsSF1ltHjP/iS+P6y1BbzDVeU89jS/pkF9
         XAkbbS3OFXFQJKhM+6JhLJMbLUPCqhIFeXsq8zrUJ4SlWqq5NpniCAfrTsQKgBxg4mzD
         v+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898252; x=1793503052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=hRLiqsnAhIu5PM5Cvw2bolywW8uqQExVrxl6LRHaaWnoHH5YYbVlllq7nEgDO9wor6
         F2gNjEsBWsDCG3/Nlq55Tsn7bUojTyuL1R/uZuJam7FiaizRNiEdV611NXMRMWf+zr0L
         qqtdpziUdUKrrJuEGixv6Pfg3PJ52cpcKt4x+X1orLRMoOPDSg0WkInX/YkNYzQjmCJ4
         VaqTu4QAn73qSfFXYXBwy767tssIeEn0pqxlHRIpPEWp/ilvkQxDKS3PVf+t+Q5S5teC
         FjFzRyVJPFW2Lmk9S+nMr/irqqjnFu4kkKsY9MajIUN+FHe9TXWeBOK9FJnRCzB3+8hc
         3zOQ==
X-Forwarded-Encrypted: i=1; AKwUvBybvy7WnI11v4siXo0bM4qNQF4wGnRNCFNPV6TbmFUCMw7hE/V1MIQmTDaDBN45ymzAAYCZPEGBWZ0n/BU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQS66etrA0vhsyVIVvKROTz9DBGHH1da93q/RJyshhzV7/RHl5
	RWVKOnlHhtnZZMOjMOxj0oEUa2YEDdp12f08S1BT+2cM5faE2BaK7nlA3ydUTI50XOWJz+zTA1Y
	jo3o0DLJ1QQgWHcJCE+OexnrE76s54AfSt+cVzvuO8vCSfwveqq05b4llEv3cYjJUOSU=
X-Gm-Gg: AYBFou2mV2rYporTp9evjOBIzx+bIJEGK6xNFKJHn22xmXrMju/24QpJMqzAXjWzzYa
	Ar9esYw662EPWOf3VDLUrzXpq8LG7H8z5pLFDxFvveJ0YIiYCFL0YlyCZkgtKJPklAZu7nw8Bep
	ZnMScDIymJevn1waEV+zmetCYQ7SPzbx/V5ok2bd6z71iZ4A2EMgk9Z7CF1ggIWp5N0KaZYPwK8
	seCU3Ocj5Rgf1gLhXLWpO7M04oR/zEP7LlqKwzoml2uRZ98R8lDhgZaxwz8km/UJUnNCtVMdGUi
	nMG51v0IhXBDFrM8az5b+g+fYr7fvDAW+avJkUdZLaYTjuGZn1EA3RHaWTt+4cC/5NDoKyD0C93
	vagQ0fAkbtuXdjsP1wzIDzQH5pzFdob1vPhqxQQHYK27vcMfaTolNrtyvvKlSYOB37UkgebTusB
	6l4OBwLgTjbQ==
X-Received: by 2002:a05:7300:cf94:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-369e86128c1mr4734813eec.38.1792898251707;
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
X-Received: by 2002:a05:7300:cf94:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-369e86128c1mr4734782eec.38.1792898251122;
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:25 -0700
Subject: [PATCH v22 06/14] media: qcom: camss: Add Kaanapali compatible
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-kaanapali-camss-v22-6-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6add74cc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mw3XWTxQXf1jfoyreTJaBvgLCfjW-7Mk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX2Eaa3qr4eABp
 3qG1UvVBdSUJVvkG0Up85yA1Oirx4rMfwpQnutMBI1m1oKpTk8cfW0SYWhdo6GwmQONr0zbydAd
 ewM0fb5jKL7/oUiSYMqEqI5ZdZr28s3825q13cLXrrGEktqIfWEVL8zqCd/LqLwYWzSCYL5L+84
 1szyZTsuXZCQka+FpN3ewSzNw2ztF83KVl4M/77bdcRW8jpJXwLUILRKygieCCvsP9kWx4jU+ss
 vTceLxQAN5u7yi9nEGwKqtKcMu/iGj/Mb9ozgcpzaEe38r0cnOMOUtrHOpvwyS0cOU3EGCuqVY1
 D+9+Oncl/f7cTCzC27PGWBLVMz4gXQ/DID8YWyGVghvQGouVo4VoyTxQ88gMb3nKvJFR7WXCo/h
 2y04MML7GeEKTRRHRmtCoCbmKNjkA3cREsfdtbcsN1n2bp08lxP2khhU1ESmDkg9teWfOMtpX2o
 YcytJ2JmpluaXN7JWfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX8QiHGMaFnEuw
 4gCo7vNAO+fLAAPchN1zaglGhXNQMDS596SZ1RXbEFd+BloiJvawPDyyZy9PO4j0Xm96PDmyVI/
 GTa1ryQeCjXUF+EyHkZdoxMceN79kJ8=
X-Proofpoint-GUID: mw3XWTxQXf1jfoyreTJaBvgLCfjW-7Mk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..98ec23c39fda 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5589,6 +5603,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5844,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

