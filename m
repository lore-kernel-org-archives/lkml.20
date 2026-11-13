Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548047;
	b=ikkAN0GaandDPUKSW/sQPg7LtyMPylDXsbhEyL5ZvSgjXNK2vg/aMPkXvTvIvfMIVndG
	 9O8YV5bqpMHkN7D9eic3k+ZRYiPdRZl6mOcmbQHXOcmGXBw8yfdmM8SoJ22h/ctlySvwl
	 Ulu0RdHJLzSyZBIz9loGSO+kXd+PqeA4rANyZ5Sdn/CLL1R542ZAmNM69ZRU3BKsXt7tf
	 XLmWqEx4RC2eUt8pM7TS8OV8lVvlrTAoI/tm/qfSTA7DUgw6wravmHkUZ5H1ptaerIhd3
	 shbP2+/2uEdExi+B0qzFtsY9wXF/sAVhvxv9I2ILVDEiZU34LGLgSrx/31rCh+WvSxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
	b=ASCJ2FOO8Qt7Dl0ruFs8Gb3cR/28bhm1hXSTcJPtPl66x98JR1Z/eIR3+O6QK/Daw72m
	 uXq2zpxyrfKXkBwKgzclI2Np+kyJyARNkk7WWnqpDhFaenqLTH3AyyqdFCa24ZuoJcjHH
	 0rTIvxeyH3acCEj1g3Pn9BEeVoIoYI7+0Dmfu+yrh36BW+xeRt2D0QcuT9pprvpaPrAsH
	 nAx0Z6r6Efg3o1Ex4dXp2U9SE6OzkiV1b2+SImBVVkPiTdi3/pm9B9NVENtCLx+Qrm+qi
	 FurN/uOPHQsdE7+Eb0lH7FOmv2cxmLv+bW8JMy1cEn0qYOTAzOb385D30dER8ZQ3guQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1PJah0C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iD5FFwrc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CDE60A3813
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CDE60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1PJah0C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iD5FFwrc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57RBh1631711
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=; b=p1PJah0CEtUdWkpN
	pnByS5I7/mOuo0ZDI7Hvsu9DOG9ukIw3sDDuisGuJmJ0cnM4HgLj3Uz5WEoJKEnv
	GOp3YF7YwlYQpjd6keOPySolviUmZojfgCQZoCWp9nvG+0r6ebEU90I4NiqEaWUo
	VclKAb4oPLBzEmQGClV7iZxVsDzP/IpkESkyhWShzyFpDcBQoeGAkrAtScuy/aAa
	3DiV9LnFZ8eUfihQM4CwIgrE1ioa88MpoZ7NTGbqQod8X+Io5FWSVdN0+2WsjlEb
	E0ulUCmKRoSfSyO3A25Hv8qdJwRdBzMmbL+b+c60cwV1WhIjFsplTXXVW2OXJCLz
	Jm49OA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1c8gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:06 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-466d41a1d9aso700327fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548046; x=1795152846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
        b=iD5FFwrcAiO2yE0NTXbJTE1NZjsLivUxy4S5Ulmr95lYm/ybIwRoxS2QwH5UCkEgBp
         lEttrgmt9zI6Du6SzOZcXOEMgSJgi1BLnZTKKZ0NO3WbzlPKZcV0BkbKNEWNmjODsXw2
         jBsivLTlQa4N3rQl8XcdAlQoDv9OFcS3jaonoDCEPySNmeK1B7SK607ObxnJ5wR1S1zu
         Wk3qUOOZGj1cSPm+jqEUuAF+7SX+vRvdWx9taQqW3vSqPZvWLgE9Kino7W6cv0TMPaeE
         W0q4Uj6PsuLYClLR0YdLhVVRio1XODQpCPyq4g2ow8NYsitmHhpWAiG7A54XW/BfUVE7
         jqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548046; x=1795152846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
        b=taqicmPmBGV9mfZ03NLV1jvV3XsWnlz099/pY2r2AdyggUAtl6PSyQDjlWISMkDx5h
         4cUgfWHkg5WhwigbP3Y4mVaWSMQvshL+IaWKMHeAm8EDYuWucKK72wTVOBc+VzHOpRAr
         nyR5ar7JVptRj8MSl1Q0THkpqDVIfqwUaFt6TkkNsZgdKpwhCnT7lZMFM4tloYtM7M9s
         cI/M53P9s35QcovqiwLDrw1BLNdeSgPbCChfUjw6qgGLrq2lYMhsWFyO1SZVSAaYZDuY
         sYRIklQLJ8wU23zVduh3mcZTF6m5cwOKjMY79NUXgUbjaACjzuQUaG1fzia8z0tuMzEa
         R3rw==
X-Forwarded-Encrypted: i=1; AL+hErHmNbP51yGfblt3+tdP1sF+pzCsgPfMT+jeQ25u8/mNqhzBxtR4YonhvrsIj9QPOFPLCWS0bMDWsi2mCZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+YzO5LJqon5TavDSAyUYvLaO4vkX6xJXOueAYEqbQK1rO81L2
	xr461h02NeZsJUkXOAxqzf/airnyz0TTkswBdiBcK+PLeW04qNjsTyBIYJu2HR4vvhRAPflBFTp
	Gp3KBqZNEbbxm/nmjmtijrSM06Z/5dVEOUpJP5PqNXnUQAEOHy8G3kLoyuMQGxVngnnQ=
X-Gm-Gg: AYBFou0HVBJFRi6NTvO2qKCy4t1n9tQ4WhEofdoBnWp8otteaSfD6Be7y6DSRWFPVav
	OKhvAYOcBvmMFZluJI8GxWg7eCpiv/9WrFgTX8Rac2A6oNZzuifeCUGQeGmQdpnEfPT82tOb1Pl
	/4Wu5ylPofFx/9AmrM7iT7qNsk7bxEbJRQQ/++ygXqlhsxw/SVN3azLE4901+8vAJgv8JMDW45m
	WVR9VI5xIHgxZi2EZVPaU9tIiFgVvRUHBZDQIftn9cUq2CQiShuu5FM98rmdqy8LeNePvOamoUW
	YevauZnp+NRSn7hHeG+y1pNqRLDiNYVw7OXwBnBkR7+MM7j2TekWJGJDVr6UpFgkl+jYAt4ddIs
	ezeLSFYzh4sT4AdnpaChdU5R1RMGx1nbfw7DNIBiv8puaBX8S2ePPf1rEP1UvrFHVWY1SP4KJ+C
	RFooGy6CTOLrJIawDn3Xt9unO2rk/KQ6iEf2+AUyxlpIs0IzZm22EymhuGkMzH
X-Received: by 2002:a05:6871:329c:b0:4ad:514d:b19c with SMTP id 586e51a60fabf-4afdf49294fmr1673511fac.11.1794548045753;
        Thu, 12 Nov 2026 21:34:05 -0800 (PST)
X-Received: by 2002:a05:6871:329c:b0:4ad:514d:b19c with SMTP id 586e51a60fabf-4afdf49294fmr1673501fac.11.1794548045271;
        Thu, 12 Nov 2026 21:34:05 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:38 -0800
Subject: [PATCH v25 06/15] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261112-kaanapali-camss-v25-6-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX3TlyiOxEewbd
 UEhyyzRJagHIto+aoUtx5nKXV08anVs9nH5ARmxLqEmyalMRWS08VZmZThsd+XZjET3crCfeMGA
 QFPLgFwnTy4ygkq7ghaX5Z7mIRHBqOf0tPv4AVuKqVWr9hscqx/BJdafipeIemilZTyJa2eVxxU
 kuSTHjl0yAzmmQW09IqAJ5ULF8SqMkdrwsnOOkzVVwHBaV+yfxo++J3P5unud1F3CQWafvzIZnP
 /MVFYrbquwelBQxhTsnObbZ2qUoQjnMreQM4merhAhgGvLx+opGMaSwnieEK9y7K1m/StXpoXS6
 wTX8Hb/S8j93gAQTcV66moY3MYT47/zTankcn1AWHs7Iq6DScMWyi2SxPg+7gXr7t2MdulyyedO
 9GzuoZwTlJg98W30yQYDnMpi4Miqc1/W5Len99G4jpHDv8z7NB+XiXc6C+KKwXCyMbJZPHy8q3i
 06psGHWWM7GbZYFy4Ig==
X-Proofpoint-GUID: c5PmDzwgDfbglP2fcMH7H1YwmJ0xXQn4
X-Proofpoint-ORIG-GUID: c5PmDzwgDfbglP2fcMH7H1YwmJ0xXQn4
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af6a14e cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX22n3j8qosP2c
 KyrXYNsU2LPruuwG8Nwr0zchZgtaS3zD88aFT7hLZazuAgdR2Lh3pBWXJzaGehh46uR6b7I5cdI
 C5o4K4zoubE+GZOOXQ7m8qSsQriHb4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data includes the ICC paths and TPG resources
and sets the CSIPHY count. CSIPHY resources are not listed because the
PHY is probed standalone. CSID and VFE resources are added by later
changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9521301ec972..cd6adf749c6f 100644
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
@@ -5585,6 +5599,16 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5819,6 +5843,7 @@ static const struct camss_resources x1e80100_resources = {
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

