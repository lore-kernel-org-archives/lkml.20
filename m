Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513849;
	b=zxoRsYnX/8f7PhPkRAt7JomhN3vBhnKKDiIdjwTpIGKfriuhRRSbS+C46LxVc4bp2HDP
	 yZT2CscNshY7azJr2s9cdevyDNIxETyJ0kZToVcb1iouB159C1UYOGJst5rLV4PJNstrh
	 m4VMSwhMwr7zzRNx+4GU49VeEUqIkQJrCvhZlh9c+VbAnjSHpz1c79HoiziXoK3ALOyY/
	 Xnw9EWQNcvYNI+2PAIn3LjsjaiNhgZJb6ISGPPKn9J5MTtnFEWwNh1d2rtkMn9R/yEsdX
	 2Gy78BPJtiXOvCQCEZA0VfqzOMwfFTjHnA1Tk6X9k/oXKrtCMuMX0vzsOr2pwww9VHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XA0IAiPsmsCfgrqSEgkMXcasY5uxsfrk4i3u8mvlO20=;
	b=qCHwPxs+iIR9ryS2XvMCxFpZAszcH0ZsDiICxyLwKnqKUeT9zAfBvbQiZaLITXvQUO0o
	 8euIiohZ1hgdcrBHQLdnMmLd/u8OjF32UJx0XIDPbAi0+DEZ6dBwI9CkuH0nZ28C9zhF3
	 ZOZorN+2/a8R+Ee+fB2jqKgrbIWPidyMXi7kVkRZNAXpempoTGaAjkHFV+5oHwF+0SXlx
	 dtW3ohALf/HgwCuk/f2321AFYezCUKg13ZI86UoWs8q5FNMdMBJPpYtOi5ozmi8zjPuSt
	 CBcSu9RU5pthP+k0C7+HV/suuswE9zeRSJoLtpSnBldOP0NnjfLrYy31FUthFb2FPRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fM3fSPH2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OSAWB4+G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C9B60A260D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C9B60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fM3fSPH2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OSAWB4+G
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA6WY1575279
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XA0IAiPsmsCfgrqSEgkMXcasY5uxsfrk4i3u8mvlO20=; b=fM3fSPH2d00hRahJ
	Yb54MpFTMI+t3Fq3EpjEGxJp/GbFtTHIqV4a5V9fjVVwgIVFulrz9UK6LGOh2r5A
	B1tEncSv1orJNWdWwsfKqD3aGo8+0gxbG10CFFYeJ5C/sOLKHv1ve2jDqaQ4mENB
	mGo+ouJqTHm/hDnpsA7Bn8dg2uN6toYxlXqGZ8JjChTJ27Kb3d+eTiHUkeqtYBn7
	LOwcYoxKc+LPkJ/RA3slM2RuVDolHeiuuyWX26og9yVfuSWk/UKB2iypodJoiV9r
	IA03mVPPJ2w0OOrfQCUuKWQzXVHYGhH3HiD1sa38GstFof0ABRTolcG1SLFCLhCs
	vCXudg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n3d5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:30:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso5269921eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792513847; x=1793118647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA0IAiPsmsCfgrqSEgkMXcasY5uxsfrk4i3u8mvlO20=;
        b=OSAWB4+G+fYpJaFX6wnGwVpaiFiX7O03kPHJ85V1jrPSMhigZeMn9iOEdLzKKitJtT
         DFKBNEpdNAaErIjPYQPMeWAzhYx2afa03AAGnk8ICpqyece+rPpa50oGs+bfL8feR2OL
         8eZAtQwZJiQEE6KiSTKvc6j3GfZZZV1IFEdl8GUPYdQJaYsyG1au4GYeFvVzydYEuQvl
         7GozZEt9h/foPeAlFNWQoH2duZJDIWI6xloN3fV2Gqfvp5PmdYNHCozhtGo66YsYizS2
         ZOV1MbQy919mPyZP+7DaXDAqYAYEOepz3laX/YLcRgkQZPwxU8fqsgGWQI7D9bePFq5N
         jD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513847; x=1793118647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XA0IAiPsmsCfgrqSEgkMXcasY5uxsfrk4i3u8mvlO20=;
        b=ZtDN2NSPi/9/Wzs9i/a0Hu0clStY1ooDtmpwUCocyufTpF0OgMJYgRKeAqZx1kqybY
         bY2qe+N6bXC9963+viHjW6vB7MyZJ6jDv39o2lx8fqrmd8NyqaiEhQxjau6kcD6HOs/y
         bwqn+4aENJlt9m3AQcrH8clDXWsNG6vfskcVswQGvu16ph75UrqdkmJabYuUUwKfLOr3
         L1e/o3lnAO2j37A9FihzpQiRLbMlCHFv1yjC3VJ/HMsvEjMG3KAg6RlAcm6DihO5lMT9
         BmGXuWwOxdkqzKvXQz8SzHaKyU7pH3XFEHPm81qfpIjhThXyQOH7ca3237UW8zxRhWDQ
         Rucg==
X-Forwarded-Encrypted: i=1; AKwUvBxqn4BhJjecC81CK1ud4IR658TTZsQN9L5EQvuAVCW66rEGQLST3M74Wp6FN2op886pJ/W+XFT0TEsdhyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR1C/YwkrTFa3owBBSk+EgdcNx2MQkH+8SgunWfvhlp4AuVF62
	EVQTvlKc8KfwmCaGpsBiMxWu0vm1Yhn9Xa3VYHhHUwLZtRzhNlsegvUYdpxIcXmugRSqvW0cpoU
	JW6S7PaZLzPR0G9fWBNv1bVsKS0g/UguHPLXNCPxRFP7ekDAyFoAcxtRG/bfVRyvTVEg=
X-Gm-Gg: AYBFou0gS1WLfBlFQ7L34XKS40iWUXJ27vrAbG1OAL2j3H3NgG5O2f0gz0VixY4drgO
	2z10LhsXGHA09Rv0Bpm/TuOuoYZoCdLJOQpFBLSr+Qz7c5kVgUySifpqOV4flBGLKNTKT5dqEFR
	LTgKc0Y4kPDqCdcEt6HuVlYyTV3sYGWO21wydZ4T+7QZptZRj2hW7z1Mg3xFAyTmmFn/V+RrHGs
	bkingFE1gF2IKwY+MqnWkEX4MXbf2U44r6nunNvEhUZp723ahksVZrWnjAGQedQUXQ+t/uMi0EK
	g5JaRNx1x/ZFvagcoqZ5yVMnFn3ZZkjhlD1S2f/wVxOVSPF50qOXnKLWyQ7m9U1NepT4G6dOBRJ
	CIsQhYF3ZUgF2pc6/LKSIyDqybXLJFlhohXa26uC01MBdcCM/W0f7o6aEFmKY2UKCm46lip2Wy1
	Uz36+zH6KyJqkur7+XkUrpQkabAQhypO0Oe7I=
X-Received: by 2002:a05:7022:b054:10b0:190:596:4071 with SMTP id a92af1059eb24-190059640ecmr251672c88.11.1792513846495;
        Tue, 20 Oct 2026 09:30:46 -0700 (PDT)
X-Received: by 2002:a05:7022:b054:10b0:190:596:4071 with SMTP id a92af1059eb24-190059640ecmr251602c88.11.1792513845675;
        Tue, 20 Oct 2026 09:30:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm33473794c88.14.2026.10.20.09.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:30:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 22:00:27 +0530
Subject: [PATCH v2 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
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
Message-Id: <20261020-ipq9650_llcc-v2-2-e4c492acc8b2@oss.qualcomm.com>
References: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
In-Reply-To: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 30omy8wzLCBsEqMtwaSeEgDkNZloK8bq
X-Proofpoint-ORIG-GUID: 30omy8wzLCBsEqMtwaSeEgDkNZloK8bq
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad79737 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=g86QhdraO39nIfxGWTwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX9mFwopjameFS
 bf7lQsEU4gGk/5fGPqLYB3aljeeBQEkeNUpZDguZi+S0PgCiloFAtYDBerjcpF+lv3DCfDprP5V
 fPUy0+sfyDfURb5hPSu+gFZzt/9vaRvkG+TWxlzYum70jmHme9aDXci9Q33tPgUlvCY89XHwZ5V
 E9zAbmUF4ft8Q/ozADHVYXKnOF1ZXlJcR0YxJFSWBaLm+badw7VMibvI12RKNu2Fl93QyhGdq8i
 /bOXijtrm3h5J3tjSewE6K6/a9ua3rXRAYLPpTkH+Udd/lq7PAnhspFIB9L1r4ixbyHLSZMpoLn
 42XUM+0ahyOfAAnwWGNrAsPG6jEP5NY7et8Mr7H0+8pfkyXWfmW+TMOSBtLMSKdCA2NhjBytd7H
 tkvLv50If65WGT6LUc5dX3oz5kCY7eXO1FvwVxeV86bW2wyXXiIdIc/LI9bqsjCS6MKMUejHeaL
 MB1M0u74xLEHy00XO9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX5ZFliYkr9gje
 R2MTQ8e+dK8Zkx8CeirBoW0LlQkimDJp3ahzlTIEhysd6nga7k3DWliu9zx8zcxCZLQ2LjDA6lx
 wW0dCEYRzn8oPLDZZIQh1Y5rcRYPqrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200065

Add the system cache table and configuration for IPQ9650. The LLCC
hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
no broadcast region since there is only one LLCC instance.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 76 ++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  1 +
 2 files changed, 77 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index d7a42a8040a1..37154db362f4 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -696,6 +696,66 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 	},
 };
 
+static const struct llcc_slice_config ipq9650_data[] = {
+	{
+		.usecase_id = LLCC_PPE_RXFILL,
+		.slice_id = 1,
+		.max_cap = 128,
+		.priority = 1,
+		.bonus_ways = 0x007f,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 2,
+		.max_cap = 384,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x007f,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+	{
+		.usecase_id = LLCC_PPE_RXDESC,
+		.slice_id = 5,
+		.max_cap = 192,
+		.priority = 3,
+		.bonus_ways = 0x0380,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_WLAN_2G,
+		.slice_id = 8,
+		.max_cap = 384,
+		.priority = 3,
+		.bonus_ways = 0xfc00,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+};
+
 static const struct llcc_slice_config kaanapali_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4673,6 +4733,16 @@ static const struct qcom_llcc_config ipq5424_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config ipq9650_cfg[] = {
+	{
+		.sct_data       = ipq9650_data,
+		.size           = ARRAY_SIZE(ipq9650_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+		.no_broadcast_register = true,
+	},
+};
+
 static const struct qcom_llcc_config sa8775p_cfg[] = {
 	{
 		.sct_data	= sa8775p_data,
@@ -4909,6 +4979,11 @@ static const struct qcom_sct_config ipq5424_cfgs = {
 	.num_config	= ARRAY_SIZE(ipq5424_cfg),
 };
 
+static const struct qcom_sct_config ipq9650_cfgs = {
+	.llcc_config	= ipq9650_cfg,
+	.num_config	= ARRAY_SIZE(ipq9650_cfg),
+};
+
 static const struct qcom_sct_config sa8775p_cfgs = {
 	.llcc_config	= sa8775p_cfg,
 	.num_config	= ARRAY_SIZE(sa8775p_cfg),
@@ -5830,6 +5905,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
 	{ .compatible = "qcom,hawi-llcc", .data = &hawi_sct_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
+	{ .compatible = "qcom,ipq9650-llcc", .data = &ipq9650_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},
 	{ .compatible = "qcom,nord-llcc", .data = &nord_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 713cb0221b14..b0ce1a7d5d8d 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -92,6 +92,7 @@
 #define LLCC_PPE_RXFILL		 102
 #define LLCC_WLAN_5G		 103
 #define LLCC_WLAN_6G		 104
+#define LLCC_WLAN_2G		 105
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

-- 
2.34.1

