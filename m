Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52F239794B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018157; cv=none; b=Y7xX/Oa/WJmKmKoVBulyFUujIZepbrXpaslOFdGM4Kle9FUMc8QlKiz++Aw5f1JFZY0ial7iiABAEvUH8BsZCrkdRaZh1dP7c6bKTiiTwRsbWkD0y6pr369czTiExuV3oBNGCJpgRtx3V1LlmRbtos2D0PGJib9dkKp1D7d50Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018157; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uCQOeTVGxo2vnCset8H0qa25h2BBHRccUfClSfAxi0uJ3/vZuqH7hHT/tsBbc3tIWXo0YIYr9DujXRzyCqDQCBIIuLqsnna/gVS1nWLNKZ3IgGTBUvbgU71U39CkSxUdE6+WvXnEeeLweA8pZz3V48WOwvqoJy5DI3P9ZP6FtOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5v453Tf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+q/4k4Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5v453Tf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+q/4k4Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933I1Ir3628117
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=Q5v453TfNXUD4ACi
	zk0jxYD3aXdA/HOCdsE7bWH417RQuCRjM0JN8+xmmnRCgdGbkFdQBhfYsOhlUH/D
	40w4azfsDgR9VKy2wwodlPS/y/0Kmph4IBvRCtsnCkY4FdGOeJFYbm7r+9cBT3YL
	Lycop4U2NHnW+fKpSM0ZuPNvPdH9sFaFJaMskdPnDnGRErSwCaRpejYu+27b5nho
	tioJu974j1uK4MzhW4bTA2ickdGmmJtrB8YmSY4E+3F2nvgKx31K6iUKuY5ae3RQ
	OGiUs0P9unFSbFK7lBq92kR4F4IYz4y31yqgnCe3Pk5rMKv/rcnMzCDpaN+Iu9AH
	K5mkhA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa0h6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso125143eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018152; x=1791622952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=O+q/4k4QVQG7Or/l/V+IC0ochgEJiAXSUBpQ0m7xkQ+1C09dpMMty7UL629u7oWVzr
         /3xeJfRnwNERGGKeK+bz2o92sDJzSJ/c0rAU7DfYF348Hshp/8yZZ4h7fFJLi7/5xsaA
         Pu7ChYnHKQqquqLo8DItcYRPt1HEs5wkeve7kv5Jkw354oXO2lu65XA/Gzgpc9J33Bn7
         5xsjHmSJvh/ruRL9IUVOpCVK7u5AMh7GcUqbpTQoFquu7VKt54SjPyk9GUYRVoZP/gO+
         nv6YvbiS84xBATY3k4fZJQeLafXusmOHPWYjtxGaHbPoOFpXnVK3nXcqS96MeWFsJRpE
         my/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018152; x=1791622952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=IV43R+VQ7g8VfI1C9QqJPO7ZGEVAlxWG797AKEOsPsSytbQsyhtijZlu54MDZ0mwiq
         YVUOSfXdzftwfWg72XKFzadPVqry9JPetTMAxTrOcPlTwpAUM1PBMkupXIq6Rccj5Pk2
         S1CqQtOa1gyQXZj23s5acgk4ANjWh8B1vVE5/WYSgS7Coyd2Fhdw51WH5mFeUdWMLf5v
         mOwxs6NzhbqJ6/9sWX02ZduSQjxr/D5/X8oRdsWfeC2E+df7hQ/qXy85kS5Rzck2kWaC
         NJKHjtTAjC4sQwEfcVYprGoRPK5Du9ELo5SZw9t5wejobAEudXemKHU89tp3pthEFrTu
         kDbw==
X-Forwarded-Encrypted: i=1; AKwUvBy+5ji7WMLr2/Yqg8LEhbg3XCyH5MBwNw/Xl+WzESuERpN2+9qmwRxiEDztmfdF1Q0Jov0WCmbfnQrraSI=@vger.kernel.org
X-Gm-Message-State: AFuF++lsffy/zQFkYYDlbho3SDTBv5T+qkKPMZ3VwYVIfLum9oCNTUun
	qQmdfyIQFjdIFjAXdvmW6ZWcDSu9CQfO5btjULENzjTDROd5fuS0fULiIvQWblY4R0RkPbzBdxq
	+GWkjzOtov6BIaioJ52BNqPSeBfFAIFKED2nwljsyt20tgLLGr/57wrXMnH6ytRHiS8Y=
X-Gm-Gg: AYBFou0sr8xevmHFy8D/F/vQvaIX/H/i4rNpFDr2hZvSdl0R9uYWoUsefOxTo32oEuy
	vUTZCNTJxQrPvWNq+EA9dXyA+dvFGkAWQeDQgAtsCbb2moWasYPI6lmN6T349xY/Kb3RzzJqc1C
	HtB/b0UeTR+izaThw5OsER8tNxtWvLzBAsOBVg9Yo/4OgU1/9kukdgjEuEP1wZb9Vv8oM20K6jy
	DwuqP/steEtkK97wT8RNcRSgW9hx4WBwwdg1ECPUu4HpLyCjCJAk9exXHpCU2bFOdSyOI1Jrna3
	oP0b5zw33b9qM0JjXt6Dd9jIbojDhy4wT5dXdmU1Xj3ki5ePeco/TotWneY6dFPC9uinLAXGs9x
	ckYc8W5HSSr/JhYPhutJ6YsWqvtEUsPcV4b0h+wDGEQ8l2rV4s5mF0sMBdTJSr+i8sDcKLwfigm
	NIfpMdXG8ClA==
X-Received: by 2002:a05:701b:451c:10b0:151:ed93:e273 with SMTP id a92af1059eb24-151ed93e5bdmr1698405c88.19.1791018151964;
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
X-Received: by 2002:a05:701b:451c:10b0:151:ed93:e273 with SMTP id a92af1059eb24-151ed93e5bdmr1698384c88.19.1791018151403;
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:14 -0700
Subject: [PATCH v18 03/11] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-3-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfXzWbzNkssI/UZ
 lbk0+XopZ44PvcXN0nvK7RwdKhf4Zy5ltD9kylVNNk3rwZmmeWSxmOy+hiM7m6+vdgsKe6a7u7C
 elfykMmtrbPGmuGI0GHw4N3Qppv75pm0hN6XH8IoGrNbSHCQfoCUtYIL0SsplraMy49zE27fU4T
 Z2ncpVEHbenUnqbL0zJfowzB4lowXAWhMSRD2KClRg2F2uz/9rPOyOEavQy5JEiV+T79KZRRBPE
 Sl+HbSdrxe7FhnQQIdUu8S0TCShC6nGtW4hzW5Ig9D8J+Za+IvqpQjOgTKBjAa5Ww3belKcxL6p
 Wo+yI1oBMoVN7W+R0zDGQabhb6BhsmWdc/52u1xLNdA+Qwhl7FIAQEJc5U/NTkmIQYNhnrt1hTS
 vNmr4dSPQm//1sdQ/Tmxzl4spdU0OQbOweye+TqYiaKzZbrJ4etoFY+UZIuCOtdm80Ngvwvhj+A
 7PWkDAUmUemER0GW0eg==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac0c4a9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: THmA_cknJL2uKn6P2Y12MtVvE6tvpX7R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfXw4tNd79PPUZW
 eHkHuJHIB93KTBkYmJX5EovMlPyyQFzDQt4TGo/Ep7eScTxl4RkGE4SBzEfcITbA54tIHb1fKEC
 4eJhbjeSxK/V1bzbKnignxbpbKt9GrE=
X-Proofpoint-GUID: THmA_cknJL2uKn6P2Y12MtVvE6tvpX7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030035

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

