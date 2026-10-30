Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341280;
	b=RbBkmK7GyXH7CgUWSoanl/yjgnvuBQJafYOZF2haTt36Z5QbOdvbebMFaazzZlds6J5M
	 zxsdydKuCMv/dpv+XIbsYmTqaUBagQzU1leuRdIXMd5MXWC/Y4K7FRSUP3CvQa4H6AO2M
	 j/9IiFG/g110N9PHRzn4A+UGy1smstSFwMxztxGD0lTu4LT0diLmqLnebsq9ooCE7nX0K
	 vt/if7tOM/3wsswC/dtnYmT+tXdqZTOoSwCsrYx0WfmaG4kwmXCBsRXdmySzUAsn3IkSR
	 /XJhJk69CkYBSTGMm8fjLpcEZdgFbZB+Jc6EA4AV6r0ieom56y7mKcmdKvhFt02eoSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UlW3zqTQG2I74SnwgUFKN9+XWelWW2Tp3Poa1MbgOC0=;
	b=NQNenaxpAWU2Md6cb2aLKip2HDSq+FVXMMxTeSgEpbXZdcMMZnFd5+cyipaZLnLMy99s
	 LXwXXpg+V3LchCF/g4yQgaI1AFXt8+U6yxgwL4slTIG19RW1NBgGPxQL0/1fy2O+DcCRk
	 ykOyaRX5iiboJhaxLCmQ+lwfoTxKJkSKhurjx+58/LXMH2G7k5LwG301DUg0cUWSugJNW
	 snKcswZA93e7+0zjYOYCE+zfHh3je00N1zxf4JSwv/OoUm7HgLs2nAviIio9Q5Eo0XEBU
	 N0EotGhklTSeN2uvfTRKGc8ar1ecLy5XvKIdUEDFIn1Azz0aL8P1w+OwW9B67M6EzPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KvOjFgXR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UrQMGpJA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA66606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA66606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KvOjFgXR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UrQMGpJA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F7dD725407
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlW3zqTQG2I74SnwgUFKN9+XWelWW2Tp3Poa1MbgOC0=; b=KvOjFgXRHWY0PFjQ
	YALeKAZSekQN8Wxx/2lxyzV2PzMCGsU/0GeqgenpY3VefD9EA9mR91drkzZvmn1g
	+AJIRClUHPNJh/OnQ3Tbdb/ZyEtxj5SVOk/cOxTZaXzYR8C/l09jtPon0WJvL78b
	ju/VigHwvk1GlDtgL/ZKLoxKLfTdBPL9fPPSrNBGUNEvXrMh5hb7p+6kadRKporG
	NrvxNq6jRA6qmOYJRQx9pW0L+52mE7K8L7i6CCBOTiuxx4FnfrbeyiE2ASQ4verk
	nFrBPIm9RftKaqjocFwy/N5Ria8IyTag/Znadu+nvQLjSu064WVB+ETrSp6rNqWj
	bVVRaw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phg5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so346926b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341278; x=1793946078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlW3zqTQG2I74SnwgUFKN9+XWelWW2Tp3Poa1MbgOC0=;
        b=UrQMGpJAXllrA15/OEavS5f2raYDveIbfZ0Oy1JQMEo5aUXWZGjp4BlsSQYT9OTEex
         E9TACuIILXxwKPF68eysc7srXODMUMwNxDol4lbehh7EzrCvddWUxJs/AD3c4kSnEDa7
         A/cosRd/plnFDEQib5dqoKNUrIGfFspe9eHc5Jzt65pV86F2AARBsqLkTd0ICb+uC/4H
         WKGvvj0cbTUhoEFlk4l5UdQ9LUQxdbLVpQVE1Hr54C7J7o82/boFmAC9cGzvFUmb2ZwB
         LFbFMFbHRyRVG8PNaIHzwnv8Ivy33plyaHUqG4E3DddXyMjrJfZij0NkFdP8AQc7n8/x
         PgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341278; x=1793946078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UlW3zqTQG2I74SnwgUFKN9+XWelWW2Tp3Poa1MbgOC0=;
        b=f0I9BtQQJlCAO1URgHwGhEwcWIEPo/3TSaHYjuFZBGQFCz1orfB4gSrL+YHO/pQ/Ff
         kqqsKfk6mvn/eQlEHvzENFl5Vl9U3LY5q5MTzaK3q4WQJ4ZNsWNQC7HRNzWYI42Q71Ct
         kC/V8rG6adQ86k90eA9hu9upiNkXG+rsAdRjhhLRL9lojwXTcVE3DpLz2cJLbC/sxH+i
         J6inaoXOw2gkUX1mW8K2q78bpWVv7bvSeNWLESJWGn2d/nI1uSszst88ajWKRO3F6+VR
         oSMXdByL6/c1wqW1U4/qqceA3rW/nfBGMY3J7AytMEiEi3KsWsBR2a2UdNYFX3IiLKHj
         SJdA==
X-Forwarded-Encrypted: i=1; AKwUvBy+11SPjXw74swGSiB+aq7z9AVPzifLTIHSp66J57Y/Nme3U4+yVXOD02N51bg7pfwZUos7GA2YDbYZAUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEQ75jxU9yv7EGsS8ECIkV6Q4Riu9wNVN26axGbyZpyodbngIs
	pzHx3SpIWGKD55lP/uuwE8RZEkWeVidwANRSXLQ4gWannQqN45PzxU2iC76278kM1c/vVA1ISsQ
	UyqWt6OBryPS3hLLLDiE+zUCQJAFJtMQAvR0Ci5TtussqPoSLvM9CyxxwCLHQCOO47TQ=
X-Gm-Gg: AYBFou0uxDoMFKUvzeryNWvQNS1DMgzedZXv9nr9Cev37MRvvtnKv+SGgf3gw7BeyuZ
	rxbJnu3ynue8rQC02LB4rbMbeaj9ZD1B88RmFf/4PHb0kVmt6/hUA1Y2NhezGW7t2mVrGDoNqaq
	H38uwh+6k9MlVox/N8LWJB0SVzH19FgpKi1JpHR0wrr7mXaeClDbLvOoc1iz3yVOy4ywnTR1Onx
	5BTy0AKGJBtAHTbSxLzUeJLOhu32R5oeZ11Us2h7bZ0rGuZxotVEbYRPMnFlNheus3zx9rpk/Df
	ceaWQ+L65ue2nm/ptjHg42fCeR5PMe9o4kpngcawKyB0z4HBokg7uezikCv9/0RFkcpBgh8L44t
	rHtD7XI6a/vAUFWQBA6av+yiG3fKK3KIv/PT6rnIA1Dea4BSyZ81vhzAJCMCs5q5lQeA=
X-Received: by 2002:a05:6a00:b4a:b0:8a0:7573:4f20 with SMTP id d2e1a72fcca58-8a9ba9f778cmr1113996b3a.4.1793341277765;
        Thu, 29 Oct 2026 23:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4a:b0:8a0:7573:4f20 with SMTP id d2e1a72fcca58-8a9ba9f778cmr1113970b3a.4.1793341277252;
        Thu, 29 Oct 2026 23:21:17 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:16 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:50 +0530
Subject: [PATCH v3 2/7] regulator: pm8008: Add PM8010 support
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
Message-Id: <20261030-pm8010_i2c_support-v3-2-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=7975;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=DvfT8b078UHOjTjMUG/LOIFWILfg7ZvUNJWbe8mX0JU=;
 b=8jLoJBduRQuM8RzO4FmKzyh6Q8T1YoIw3Vtyi9Qor1AH7kDK4oTBabf4Uzh/wR1zCyc9IGsNy
 TjyXnLKkVttD0hX3j3MxnY3Z9oifbUgMtxAAk/l92VbqLRpszclOGxx
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX/K5c4uqFo50r
 8SfqkzRb+71dZATLQiBCV1hA5XH2Q8qLZqMKK/mgMbrMjv77Fx71nM4u7WueFCjxMEh8mlZ6Puc
 +8X4zqT/Bim25Nia1lcvMK8lzSXlTaKsLXcco8O6w4BGUa7QylnmF/x4V0RI+T04G5m8Hf+xwld
 Os86UJHCOLDh3ZeJWFMfmzWz/mLt4aKS/6cJrkjUo+q5Q8urdG8h2WMSv99Rt+h3QcbFGoyuOBu
 p6KgN7uNvMnh4nBO+VDq6L9XPzgSKRYbWumECtLi5onAcahNGRQvGJ8jiLGsta2T7HGFQYXinVp
 UO0f5UV+UpwPISZ1PZWLkbF63aZrvkblwp73+PFOiwDrMCZvKqiieJiZiA1w4VU+zNSbV/4cOjC
 0bJPUnbb2n//AIGSM2ZoQlkO6bDxJFW2PMEMp6CdRF+tzwF1VJeMJm8h2VB4UTNu9WW49bkQeX8
 GeGAJwLNt4pg8wER6Ew==
X-Proofpoint-ORIG-GUID: H7vq0aWh1Kg8NypdrY4PjsynF0OoWoiO
X-Proofpoint-GUID: H7vq0aWh1Kg8NypdrY4PjsynF0OoWoiO
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4375e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=CF1g25cjMhU89PGl3DsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX8hkUVjr0g0Mg
 Jmbk0mEzRt/npSPI8MlBY1tDtRjuiDSzQiABSvKYszCUlg8/GKwne25SR2DkFYM16JpzYvjsZ+o
 e9u5zJKHRESclQOYRCNlEeqFVPQ6ZCI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008.

Like PM8008, PM8010 also has 7 LDOs under it which are used to power
camera sensors. The PM8010 LDO are of different types from the PM8008
ones and have different voltage dropout values. PM8010 LDOs do not have
a voltage step rate configuration register.

Add the necessary changes to support PM8010 LDOs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 109 +++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 9c9b8be2e15a..b484c0f73eea 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -39,24 +39,59 @@ struct pm8008_regulator_data {
 	unsigned int			base;
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
+	int				n_linear_ranges;
 };
 
-static const struct linear_range nldo_ranges[] = {
+struct pm8008_match_data {
+	const bool has_stepper_ctl_reg;
+	const struct pm8008_regulator_data *regulator_data;
+	const int num_regulators;
+};
+
+static const struct linear_range pm8008_nldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(528000, 0, 122, 8000),
 };
 
-static const struct linear_range pldo_ranges[] = {
+static const struct linear_range pm8008_pldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(1504000, 0, 237, 8000),
 };
 
+static const struct linear_range pm8010_nldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(528000, 0, 127, 8000),
+};
+
+static const struct linear_range pm8010_pldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+};
+
+static const struct linear_range pm8010_pldo_lv_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
+	REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
+	REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
+	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
+};
+
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
-	{ "ldo1", "vdd-l1-l2", 0x4000, 225000, nldo_ranges, },
-	{ "ldo2", "vdd-l1-l2", 0x4100, 225000, nldo_ranges, },
-	{ "ldo3", "vdd-l3-l4", 0x4200, 300000, pldo_ranges, },
-	{ "ldo4", "vdd-l3-l4", 0x4300, 300000, pldo_ranges, },
-	{ "ldo5", "vdd-l5",    0x4400, 200000, pldo_ranges, },
-	{ "ldo6", "vdd-l6",    0x4500, 200000, pldo_ranges, },
-	{ "ldo7", "vdd-l7",    0x4600, 200000, pldo_ranges, },
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
+};
+
+static const struct pm8008_regulator_data pm8010_reg_data[] = {
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 296000, pm8010_pldo_ranges),
 };
 
 static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
@@ -100,7 +135,7 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 }
 
 static const struct regulator_ops pm8008_regulator_ops = {
-	.list_voltage		= regulator_list_voltage_linear,
+	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
 	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
 	.enable			= regulator_enable_regmap,
@@ -110,8 +145,10 @@ static const struct regulator_ops pm8008_regulator_ops = {
 
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
+	const struct pm8008_match_data *match_data;
 	const struct pm8008_regulator_data *data;
 	struct regulator_config config = {};
+	const struct platform_device_id *id;
 	struct device *dev = &pdev->dev;
 	struct pm8008_regulator *preg;
 	struct regulator_desc *desc;
@@ -120,12 +157,20 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	unsigned int val;
 	int ret, i;
 
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(dev, -ENODEV, "Missing platform device id\n");
+
+	match_data = (const struct pm8008_match_data *)id->driver_data;
+	if (!match_data)
+		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
+
 	regmap = dev_get_regmap(dev->parent, "secondary");
 	if (!regmap)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(pm8008_reg_data); i++) {
-		data = &pm8008_reg_data[i];
+	for (i = 0; i < match_data->num_regulators; i++) {
+		data = &match_data->regulator_data[i];
 
 		preg = devm_kzalloc(dev, sizeof(*preg), GFP_KERNEL);
 		if (!preg)
@@ -145,18 +190,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->owner = THIS_MODULE;
 
 		desc->linear_ranges = data->voltage_range;
-		desc->n_linear_ranges = 1;
-		desc->uV_step = desc->linear_ranges[0].step;
-		desc->min_uV = desc->linear_ranges[0].min;
-		desc->n_voltages = linear_range_values_in_range(&desc->linear_ranges[0]);
-
-		ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
-		if (ret < 0) {
-			dev_err(dev, "failed to read step rate: %d\n", ret);
-			return ret;
+		desc->n_linear_ranges = data->n_linear_ranges;
+		desc->n_voltages = linear_range_values_in_range_array(desc->linear_ranges,
+								      desc->n_linear_ranges);
+
+		if (match_data->has_stepper_ctl_reg) {
+			ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
+			if (ret < 0) {
+				dev_err(dev, "failed to read step rate: %d\n", ret);
+				return ret;
+			}
+			val &= STEP_RATE_MASK;
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
+		} else {
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE;
 		}
-		val &= STEP_RATE_MASK;
-		desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
 
 		desc->min_dropout_uV = data->min_dropout_uV;
 
@@ -179,8 +227,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pm8008_match_data pm8008_data = {
+	.has_stepper_ctl_reg = true,
+	.regulator_data = pm8008_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8008_reg_data),
+};
+
+static const struct pm8008_match_data pm8010_data = {
+	.has_stepper_ctl_reg = false,
+	.regulator_data = pm8010_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8010_reg_data),
+};
+
 static const struct platform_device_id pm8008_regulator_id_table[] = {
-	{ .name = "pm8008-regulator" },
+	{ .name = "pm8008-regulator", .driver_data = (kernel_ulong_t)&pm8008_data },
+	{ .name = "pm8010-regulator", .driver_data = (kernel_ulong_t)&pm8010_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);

-- 
2.43.0

