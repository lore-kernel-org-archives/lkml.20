Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F240097A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661650; cv=none; b=S48j0D3WNxS8QNryhY/aUBv0wbT/fPHwU2bBj6iiX6Mhb4UEIDgtfeJAwHvEsv0rucws2sO86fqsBOY+AwgGsTQPk4UY/EIG3F5yFr0M/NiCqwudjCRTPqOfwO3W20rNfK6wHptRBt+ut0yqA2N4L4OafCHCeRh2Nj991GjWMc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661650; c=relaxed/simple;
	bh=Wtk27CgwWTeP9vTuK46o6KkvZ6P5CAuaKAMw7OJZuUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLDfacN2tdl+uv6ASlM5cHWVYvqRe+OeNuVvQayMKjLfJhTQhyAqn9ZT/E/KOLeC8h1ggP2i1KNZPbsbPXYBKVxXDOPACNDyXJ5fScRxW77BBad7iqx4cFodDoOqUzUQ13tNFY+xyO8HeMxFndawbmgYX9ZdhEPNfGH1DHJ5H0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Asj2l5uz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2fIhBdc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Asj2l5uz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2fIhBdc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Kj13241635
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1G9ZYYprJidyLCsJUFgcXeWgVtdfvjOEWIRel/cdgTg=; b=Asj2l5uzqpAwS2on
	K3xdczjCzx9o38FUQIgF1H2SSgHgYs6s1L4or8oBMDLYou9753WkSgkWYsF/sdYT
	p7+shG7OFThvFNigP3NEvHBhV8VYMnHGHI9VET+gr4EnBzMP9HzhnlKmtdDJMhJT
	4g98XRLuFEzHgOz3x7W/ko9xWw/rPEBHVZttOWJeZzKn2QtIpscSwo+3e5LB+uIX
	TV+u+rMpPx/7jevqlF6oWABQKClrKf2I19SEYUWptLs+3dCqADB/qTojzqzDJNac
	LIrZtuGRyprQ8KkLiLnrEZUhIMKCDjhO3+/+rBdw2MXQZIfJp0ECuZu0dvmRrkEj
	DVnXCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144sbkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso678006a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661647; x=1791266447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1G9ZYYprJidyLCsJUFgcXeWgVtdfvjOEWIRel/cdgTg=;
        b=J2fIhBdcMpF4AJX6GhAjb7rLVp4HSLskbpSOAKvL9S/GeAdwZK2CTmUbzvjFVg953g
         Lxa+KWeQYz02Rq2UNM/dHOA9HCo894xWScek86FjoKBDwNKMr0o7J0Xgnts3KYsHB8kW
         W4fT27uZfHr12LQu9bo6NK/DxJ9n42vYmPoJHHui9emn6faXH4DNMDQMsVQPF1CrarvQ
         5XU8551Ro7yh4Hba87TGYQagls8/7drZYnbbvGZ7ksmGkIYEwta9qPMshuGybqJwOs5J
         8geC5wl5Oah6rTC5SQtEjmTlqDKVAT5rr5cqnzhxIOTBJ8AZUhgzxVZxfMNkiVxyHq8I
         G74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661647; x=1791266447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1G9ZYYprJidyLCsJUFgcXeWgVtdfvjOEWIRel/cdgTg=;
        b=vPgBrr3tukyhSiWVQaLRY2NjUPEGdXYwacAcrtavMQOdDFJ41eDWAIuknJPt1YOUwK
         f2jULZGiR5zyBC9jHZcjFSWhzyIDIQuwnG1x2QEvt+b+N/3utjWlLw8HB+K25YVLXZD7
         RA37NSHFb9BP1HCjsLb1Rik9TGHgXC89TfU/i5ZnG0P1FUnPa1DPITZZzjQQoqcqYNE8
         aJNNQWcjxJtNwn/ymIBEFGxyQjpbndIjoLPOOZuqT8eb4oxoFqC7FkNv6Qvovwp1g0jg
         l1VhextatSFJmh40cdCp2FKq1gApGRTcZoi9l8E8JUPbuorBiJJOX8XtLO+OWOY8CBO+
         Ovxg==
X-Forwarded-Encrypted: i=1; AKwUvBwG+vs10uMD0acdsZgv/TY4FBUR8k+xpT4mAaFC0tWPW5LdoO3zHAD1gz9L1Lrqsa2Bk4IoVulFgh4nxzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYOfNATwg/ptTV9i6yi7VPxgGNfFJf42QdDpf630AQop0ZG7VM
	8FM5jzdwj/BovpGFeJHNtIyP11kZx/Of3jHz2qoo2bg410IzN9S4Qj+5iVD4S+T6g4gzXUjN9C7
	QLAQTG+0btj+jfgsUHVWYq6jhpIaXhYj8jQAS4sfU14NiwvlC5zFEvWwT9Up9xh5ddxw=
X-Gm-Gg: AYBFou0E3XK1Z+SbS6KpNF2OgOilHBS5CCnV4LDM5Py+ni2e5xVNUVtqq/2371QQlk7
	BaES21YXCBWWZQLaODfYMPO5QAX98TDzvIZsippbUYZ2Af/SjWOENPESUb/1EnUWrGDPTCn0SAH
	QUz7GbmpZ0d51GLQlX2eHg4fgwd6/j86MRpEmsv7rcVeZvcZ2pAK7PvxK3oqJmq0FoRmpKt3KIB
	y9HYzSviBbYA3uI89VE+edPfmg+pNqJ5tY9AH2bjUIvUWpcbgR2ApO6HDfAuD2GopIn68NvpN6z
	ub9PiEHVcPfzWPZNX6bfg+InWiz8S07ndn8M3WlJ/V3s1rObO1QVA+IXdtuMvRFaLrkBDmakE+Q
	3txIMf03UGUs0U0KnT5nSgxdmSLvlf6d1iDdxzRvsPhTBscEqHD5vI4XhghDbD8wJHpdZv525Yo
	SxvJemY+vTPw==
X-Received: by 2002:a17:90b:28c6:b0:3a0:34a4:187e with SMTP id 98e67ed59e1d1-3a49c120f78mr703365a91.15.1790661646695;
        Mon, 28 Sep 2026 23:00:46 -0700 (PDT)
X-Received: by 2002:a17:90b:28c6:b0:3a0:34a4:187e with SMTP id 98e67ed59e1d1-3a49c120f78mr703335a91.15.1790661646208;
        Mon, 28 Sep 2026 23:00:46 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:45 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:29 -0700
Subject: [PATCH v17 03/11] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-3-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX7XIJ1h8UwFHJ
 B7iq0StrPjbf0jGHAccGM0EViBgVXP6rJnF4zO3w8iUTEjgXEGZlm6od+G249UHgL6bvOG8Ak2y
 u2hxFFCUixGPfbNIaqxOPn2EbPcntQ2o/ynceJFPjkzWu+dlD6hz80z+5DfCFAIVZN5UFfKa3Cs
 qQCv/UliI2azFvmmubuoGmxklf/FWddkaSW/GahdxJVr7XVXR21Qfy3Jm+hGUji6KR9QneLniau
 2cydx1xGlAzI+GW2iourPlem7fBoyEnJ9OivSwBCmMEuGjQyFlLCJ9J7Mov2vjpL1U88uvZsmwe
 OScS2hc7Xvfa75z5Elt04/v5U0fYUFx8Dg8Um82ILcBcbsFERm03xXHNjzotQ18A5A5n3gft4mO
 WdXCrvD/qCjR3gEtE/1TwybPpoLBcgKjLd5xEgIBrbN33zEhncEY49y/vOC5rrrGILp9ifV8ElD
 D+axpYxSDynqYodAsTQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb540f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6pjQ1XQhcxg9qDS6pweefXP2JDVhAscA
X-Proofpoint-GUID: 6pjQ1XQhcxg9qDS6pweefXP2JDVhAscA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXwqrXFhU6blSS
 EKxpE5QGfN57NyL4tMl+LXNRO4A7pIrYOhCEfDaDVRv+kqYXuE7IsGCFy1G9iQuxNF0uK4U3qSd
 o7Vgj0zITE+AlPq9CN0UeGprFk2ypd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290023

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data, the private data just include some basic information
now, later changes will enumerate with CSIPHY, TPG, CSID and VFE
resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 23f3cc30a15a..a528760487bd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
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
@@ -5500,6 +5514,13 @@ static void camss_remove(struct platform_device *pdev)
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
@@ -5733,6 +5754,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63..2c7a0218a82b 100644
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

