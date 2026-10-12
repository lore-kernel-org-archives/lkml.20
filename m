Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0943785C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787537; cv=none; b=WGXAJk22kLH2tStQ5Q8r1Tfw1K2s+hcBVXbLfA/gpTlWFvPQeFQGdq9xITd/Ip1Su7mH9Y1rUPXsZ1QObHtjcP9p746LFeEz3vAjsv9hRn78+92b5+n6FHePInqmmNB2zY6yzVgyZVdE93fAskQYkehFUmGftftCYhrMcxGe1MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787537; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iy3KP7KVHRAsFttrdgExF/ZRMVPZLZ1ZAUXrqpPvKmySIt4xG1bs5SvpM0Jm0UcrTraMHbfx7eyZxIf4FoxV2Fvd5GyNDx9WbFVLeyt2fPmeWExFRTDP6+x7xgarZiXf7hrBZIoGdi/vHJoVsVtbvhHTxVjzx7NxlRW1TFDVToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJMxGqPQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsWVlDaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJMxGqPQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsWVlDaY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5Pc2p1787075
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=VJMxGqPQL3IttEW5
	XI0RDFQPEOoUU71wmv1IMV159kSFJvBoeKUJ3+Pj6lQ/VzNkb8NjK5YZ+di5GI/U
	pFSzYric7y41ITHWWUkvL5tSuQkcfsp+o9OT1EnnpRpTZ68E+B3g3992mHjZfHse
	gNW/ibhYpk87iKDm8WqdpJJY4XP+u5Yicf6KvAy3QBkDIOcBs1NxQObo5MnAy1qA
	50b1KW5K7we80rdhpvOVTxsDcj0kTAbR1EP55xdMeaQgpy2Kzs3ClE3+h6EDBAIy
	k8BHo8y8GU7/pft+l5nvUTZ14e878XnDRMr/wiJxVRhBkq/DwctdjEcCxFwLvHeS
	x2pIUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rb5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-887e45c7063so1190193b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787533; x=1792392333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=LsWVlDaYcqKdAVrhr52upEAh79/w+g4Djxw54YMEt9/xK29IX8FQGfQ6bYHphgsGa6
         JQAP/mZldYaPD8Pvbg4YLTmxXzY+7ZvrHc4TIrAE2pR5mwosj9HNZsUklOTxeZCgBMrV
         c5mWkkJ4STtDpMxbOmLSqEkLZnI9QtelwPryTnO3i5kQLNScthFyJ3gpj+bmCwrrnldu
         1Pm3fxZYYVG5CPlk2k2OcswHWxaYEaujJlhJIwOUlcw35hUfRGHXIwv3eQp1/zgmS4Sy
         vRksTtoG/Dj+sdGhTenKf54iW30Y4ZNfqW6+tsLiTJPvijP9DiDEt9dvGrAKSaD0T61e
         uIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787533; x=1792392333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=ik7MLzP96MB52aTFc+EF0dPIzXT2HOO+7E5hhUUoej04NfAIkIaZhnTKHbHwqmqxd2
         xPgpKf7u/LlF5CItYLuVd/+lvJqu8dnwTk3mPp+u9v7GbPyyMZ5lQe1V203bRzyAGFkx
         BeHstj6JpHGLqEbKxPrWuU8l2OGKm1uPQqx92cOajwKCujsPP/S0G7PdDGkphKTW0Vtq
         wP33Lalv2KPcGGJlXUYIepS4LlgaVmiZWrWBWIbsR1GWCV2RDTDX3+NQHtm6BO3VwK2C
         vhWSZdIwo6UVxUT96mixQvPdoe4qEt8XyeMTsZsYHhxNmnyqGTShp8RYan41YJLwRUl9
         UD5w==
X-Forwarded-Encrypted: i=1; AKwUvBxV4IkQ0Nm9cnBVjVFQYW26DQ/pg7OrMtlPVpF/YtKItfDwHTMjLZiPAa5ms1CNP62nDPuCBJyUHpj7VgQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8CRHpmxTd1M/adCe3WT+S6Fwt2jaQhziuyuBrw8abkU/pPTLQ
	hJH+nvnq5akI2LsA5tNOgyx1Peck/IvdqC2ECODcafahrXndduaR34ZiF2XUBrNd1JjnWfYkfeC
	ATmpasAEeu+KQMO7nPiFIT+Uv04HgRTrlAmEAqqcoeA1Iy1Z67PtnwNjNCl+PRGUnXpk=
X-Gm-Gg: AYBFou2zTzzvzIHRV0bPfl3O23OC/7LaeaxWZxB8NSmw2Xcku+6FLWNwclhgntUYcR9
	LFupwfRdRl1z8hEuO6qLkHgdiEb9nll+S922B+FD94ontdweNqDK8Cz/1jksHcb9TylnQ8s5x8e
	bvSeqqkK27uH6GzUCzRxDaRM99A/T27WSBgNvUvNE5QFskxRLeXwXIBKiacAoZlagnpTM+W/G/V
	n4UXKGhK/lRPDy9+lL+UEf6mRuv+LeAEi+IgIXghYD+RYDj2HklBPw40JWTITKnMlo5k19eNEui
	6ZnXgnfN0WpWOrNAPHCf3IJQIWnei7O6SVd2EzJh7Gkq5dLI2fn6aSJWsWIejFxO7+vPs2GamLe
	NjuxDXwQm9M9aRFN/yzaxoCDGBEv4h931p5+2CtUqcf9HR1kp3CC/oHVUo6EnGOa8LtA6Met0IQ
	axTBVGbG5WDw==
X-Received: by 2002:a05:6a00:9504:b0:878:6ee:671c with SMTP id d2e1a72fcca58-897c700e769mr7277380b3a.30.1791787533072;
        Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:9504:b0:878:6ee:671c with SMTP id d2e1a72fcca58-897c700e769mr7277364b3a.30.1791787532600;
        Sun, 11 Oct 2026 23:45:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:32 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:08 -0700
Subject: [PATCH v21 06/14] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-6-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Oktne897XFZDgUe2IAiM0Yc6CkGvpDpx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXx85qEyaGUaa0
 p2UFuAPL6VLC4ReTgUBuRbHzJnA3Z0Zwyz//ow2WfddCFUMXfy40NpL0FEhzxT2C05G9StPwNYC
 3rJVV8sKbWTfIYuFzskZyvFLrCQ1Fw4=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc820e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Oktne897XFZDgUe2IAiM0Yc6CkGvpDpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX2AVcntNY22CK
 2lb/3JbkLbQAq61/GZdVNtZQpze1xqhWdvVRuoYb9iKDcWkmfg8dvmSoZL9ZKjDFi440BHAYqRV
 AOnE4B5pGCElCYE/wDZhw+1AExClfYdExqHxB6gEPaS5RsGUSNhimMx5VfN6wpQjEODMimlVG2x
 EGhSSruPm/WFooOwXsjG9L1p8ZZ+mJZK/S2mlpgTwXV3Vi1PvQqcz7n7TeoTHSRWrFdX93ejJc5
 4c/huTJVtI+Z0yOGYM2J20a7IzGK9BEOLp4SMg1JGDkY9w4H0RAmx/J0oLb/BhJMvAApvp7X1ew
 pUTm3/ifBAuqJo9oqlJH6LFJrbJ68aLV2yi1JMKWZIjZNYKGBCTPY0oA9vfFkjrGl9gPX/0+WLh
 23ArfiTnQlBEC6uipjEwEgJmFWJyIytTmx21qDX0i+j8tUOP1xazvECZONOXWo0U08hvxWeEsU3
 eTGfyG6ASdPjWXCqVUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026

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
index c54185c93a8a..fca3de214a92 100644
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
@@ -5576,6 +5590,13 @@ static void camss_remove(struct platform_device *pdev)
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
@@ -5810,6 +5831,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..0551211f7948 100644
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

