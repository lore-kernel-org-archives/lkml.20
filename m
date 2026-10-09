Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EFE47ACDE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531357; cv=none; b=FWHkmgHSCZEmri+nRS26ML9IXdg1Gn71e7R2TPaDtS+K9J1NKqJ/aKrN+RMMsqhwGV00r/NSVHDl3y4aQy33V37QjUjD2/wgeQ/75RLoC2ifl7Rxiy4jV5KpVa+FZB8WOvtpEYYBuoBokydiEJiYdogTc3r8FmHgOt1f3lrwOnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531357; c=relaxed/simple;
	bh=lZw8g+oxmmkBv97wk/v0ytrezVEMel8LaFsM2Mv/9ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACtUKtlzk60Gkp/AfkiHRmDvIQG8PpOtcVqfBwVYA5WWHiISrfFXwgbzdpK7gwbKb6Ozi/cpl5MH0PR0uv9qWLDDT9Mtc49xMcyZbX8HJFgseAji1OCfxlVl6afbzzVuqmxOdubrvwFgyRYqYjWTw3AV5hJ2ESHPbxlrDebP5Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lo1R22T9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIl0Z7Jo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lo1R22T9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIl0Z7Jo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HDsw3768709
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 07:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tr9jrPVGCs0d/z/LUEKlUQ2f4iFWWwJ6Kiz2caUOi5A=; b=lo1R22T9Rc6CHrua
	XawJUwvVxEjoaXlLer37v7dHeDdO/9Hfr1lehYxHrKbVE9EUQ3ST45UhJPYZSyMQ
	zRMmoHEPzZmaLggyC8bnFlWONHhjDWVE6AzqjMiV9P5Dq6BfgQzLT0mi6zi1McYe
	jtQSfs0lJtPeWVmZeMfLGsEkvo6nIBSo18i0uWMRLriRMZmIsBWjoVFnZHR/lpp4
	gvCtH6nRihxJqOXWDIeFOjh1xqXjz7ysc2pb1btVs+KSicjLqKqEke9bkEkll549
	VhFPA5wkuMriStJROC6g/H2E3/NyXNpgBwrxHOHq7yp9s8xpQF23UZmflPm3697H
	1GkdUQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu2fga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:35:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d62bb27a1so3251811eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531354; x=1792136154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tr9jrPVGCs0d/z/LUEKlUQ2f4iFWWwJ6Kiz2caUOi5A=;
        b=CIl0Z7JoOrXfoLvEMShiWHNwdvNs8N2qSixj9aRfnaevaKK/OMCb0FbgMFSSLQ0qtS
         FeIGvAk/byRNKYsYwtdqDrqV4KjD/LtJ9KTWHqJ9Ny3mowvDv+n6iBa+L5OJbri50xuY
         UgbJ8k6KXBt4gCktK/37jnLLL9kIcfesNfHR6HeU25WoS9axr2MDzM7KTm/NAjN+88aV
         kh0TO/oGUdmnB3vYxbyGO9ylIT34+Spa52doy2Mh77T6OChYWHze+2i68aLp4VQGFANj
         d1kVknSOJG6cMT46WRBxJZn97YsA86jlYd99rMTHiYRyijG8fc7lJi/bu8qolfSUx6OE
         WBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531354; x=1792136154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tr9jrPVGCs0d/z/LUEKlUQ2f4iFWWwJ6Kiz2caUOi5A=;
        b=rx4xtdlrUbLeRfTfBhQQcHeY8eYBpPt440jPgXAnczxPpwwFKOPr44E64LZSu4y/Bg
         Eip0VYvvIAT+IOWMGi9oaPT51TdeUTGCbPCIIPZBIHxg/aJ0TmJOdiCKBcCl4BgnmFLi
         9bBBYJBvMGkYlglfNrDnWJTzP/cWkJKh3VqKy+PfpPfsYniy1yyvl7QG18SnQQilE6tt
         1P3+4alnZXnkdkgZmym1f8Xwgf+KvLH4pkriRPvMLqNhuelYFhaHJpzZwXBQspL9hl4V
         jjXWeTjTVEaGZFIV9kjYyjJlxUgxJL63tgTHJUZZhs/8pRFj5oXEOVHZzlJGHeWB4YDy
         onqg==
X-Forwarded-Encrypted: i=1; AKwUvBxHdqb2v2nM6/Ios+TRZhn2r7eET/DDDIGhKFusMwQ6WLA+GO6O9ZFRaM+naFf3vzRE3L2ZFkZHuMWXYn8=@vger.kernel.org
X-Gm-Message-State: AFuF++kwLvtK//xC4m+67rZswUUQBNmUpWw9ap9JydLuALfGxQ4Gpi3/
	Dvs8M9Bk5ZxKOeVQ+6rs8vtUEFnbD9r8XoFpvshEi9inkDZXQJIE1QXAYlPzJFuJG6wsfGM0Ycd
	lR24P0Gt2rsmWdNTqw68ecweazcanz8bz5JQaGm8uGlIQ9AarmriWXbivfvRw/vJrICo=
X-Gm-Gg: AYBFou3Vj1E97T1ftyu2wJvvmNnPet6Ul4+pm014tZ60WWEI0sEgRMrgf+snM2smhiy
	j1k4CBhGKYixxD03+QkWNJZnhSHdrGqg9zDVBLieQuKqpzoz5FgiYe4Ot3SgqO/egtrUzGmWl7B
	JBHSRpx6cEzC6WS/wk6ZKaUJABiEgc3Qv35frrsOiuZ6LqnEpN2qwjxDyh+xoDPFRWQrzezEWZA
	wbX3rL4Ll5p89My4nwy3ajc9wNyKqcTb788USVFz1tmez8FBg8/5S/9g4irkhBdK5ZIIzA7J9wU
	ulg/FdIXlRglxnArERamrhBZnnMTPZSRKvSQbjYPTCk6AZpryn1LtMwVocRCZ+ErO3XJj4nAV02
	NC+MGg7mXWnwFaFaCabUfimf6TXYwy0RM2ZZH
X-Received: by 2002:a05:7301:488b:b0:351:51c4:a296 with SMTP id 5a478bee46e88-3537dde56bamr1770354eec.4.1791531353893;
        Fri, 09 Oct 2026 00:35:53 -0700 (PDT)
X-Received: by 2002:a05:7301:488b:b0:351:51c4:a296 with SMTP id 5a478bee46e88-3537dde56bamr1770314eec.4.1791531353242;
        Fri, 09 Oct 2026 00:35:53 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm5658974eec.14.2026.10.09.00.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:35:52 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 13:05:40 +0530
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX3isP4KraPlzy
 0t/da8L5dGZiJruwsv/g5CHDr/7LRem1g3hFxPj3vfi7Eur48wIy6XtomZVsrHpgcmMY5vQEaqK
 GKC/B9ti+J7hJfd4i3AcWiDRmENZUntr4E1t+vbLZ8CLBssFLhxGzWgVqqowEdv/itrX0jjP55K
 glR0IAp5IUXq0ydJ6/x1lX6NNJzuCBZ1Jeim5DjSDkZpjabuemMqmhxyILz/Gb6EYDCH4REBQNN
 a8Vxjs3Ene/wo80Tpr9Crat/xNiN3oCnWuJyznJTbScj31bhc51sTIrt1Y+JshQ25heSpNcBn2H
 xZshcxVMd0AMrctN+ryG4K3OSN3E7ln+tu8CX3b3cQccJDlwmW0wqsegmlMBRgnxiFwILUlEwhT
 LQXyfc1A21MHkj7HhDJb7R0XfI9lyI0gMKHDM/M9Q3/WGHnUHewca04lWlCe1TCSPQuUlNuSbi5
 sK75FZ5aupsi3qn2vqQ==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8995a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: d8c4-H2b24BiqBvPArMa-NyILlust-dX
X-Proofpoint-ORIG-GUID: d8c4-H2b24BiqBvPArMa-NyILlust-dX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfXwX1jeNN11ucS
 Nh2ra2Veq+rdHglPhB31LB1F3LJNwla0mR8+CzxbVqklFeORjCyax7I0CfHYfxpwWT7lF4QiSMi
 5I8d3yY8IDhmXlY7UFAAAfYvLjCujL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090030

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Nord
platform

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..6fa958044218 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
 	.smem_host_id = 197,
 };
 
+static const struct qcom_pas_data nord_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.pas_id = 51,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1844,6 +1858,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
 	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
 	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
+	{ .compatible = "qcom,nord-soccp-pas", .data = &nord_soccp_resource },
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },

-- 
2.43.0

