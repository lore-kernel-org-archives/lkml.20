Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD74A3F25
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052606; cv=none; b=akAZBW9Ow4ndKDyAGeSqY1IsJgYJJC+tnqXZoiBZx81MsLjRu9ulq7R2VnngmJ7/rjYQo9PgZdgyE73njIEUd6HvJrqN+qa39VowbKfxWqutjnxfRv5lxZAuhh5JRmm6S3K/cc3nb/+vNAam7IIq9xg5fDkUbQVPZULYqj8jV1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052606; c=relaxed/simple;
	bh=AAHHmOjn7wLgWhIqR+F8O7B1Dze2sQ5GrP8Y0jUE5GM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XL1xPSyXh5KjF2oxyAb31/5xqu6rcFkSfFD/t22/+eLPt7XigoS20/d+l+P9qbGrTL7oJmd76nPsiDH8jOTz9EjpxBVNxUYHkUgCFx1YR7B8rfXF/8gzZwhbL49mgeIAodSZwNJQpXhATuSiNVHMaf58aVzgoY/U47cmOnXO6Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pK9Pm47/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxLj7ByU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pK9Pm47/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxLj7ByU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7Wfd3893035
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8WB09ozFppmUtRLfsVXdBp0l11ApnIOq0cWBDFs3qE=; b=pK9Pm47/QGXlbRQi
	J8HTBjxcoPazhLu580f0jzwFTGZvtE9sKivhjC/8+MelvS1MM6oCCJMorFuBg+pV
	exOhyaMeisNUPh6/LHVY+qVE2JLwTg3X7CEBgQgEVCZPhllpVgPgkeEbw5iI8aTg
	9/+4gi2mjj8gSqeK9i03dUozuRnx0761G3GlT9GW3v2zZ0+cAw0T+7JUnuYsYuDn
	Rd0DOz1ZY3TMLvWqrbXqSYv6o983L3XLxz/b68C+RNtutFA9zmX+iIBMHCWdp3wE
	3eLN5/vYy5q8nAXvzU1E0DlXWQWnYkvqJwq274ssYqZP9Maos5Q4iX9UyLX87CZt
	I3Trrw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8smby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a0dc7f26cso1110894b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052603; x=1789657403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8WB09ozFppmUtRLfsVXdBp0l11ApnIOq0cWBDFs3qE=;
        b=gxLj7ByU6cCF9aB7XRteg7Unqg1nLo7aY3c4RrKxZsQWeVw6S+nzpyBtf3vt7F/nn9
         kLolmfSVU0yh1/N/EiAmwfY9ts3K5jeBSXP0l6r99GvOcJoxjpCNOD+hz7JpTX3jDrL0
         Rm07T0EklpaPmqorW5s88QJ3hcWG3LIsJaHZkncfHMIAk0duEAJqlS+NVTIOvrrFrs2i
         DPcpvfAhVt/7SVEMy2Wx6UHbn8M2WhpZlMLfSEy6O8rbbH15djbPw8sEOVTdh2OAw2zn
         GEAd3r2IT7/RxZw9tnljuow/uq5vabNDYsevFXWXrpSM26AmVvJH+ddKnw7/XukbLsC/
         CUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052603; x=1789657403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8WB09ozFppmUtRLfsVXdBp0l11ApnIOq0cWBDFs3qE=;
        b=RK2g+ghL24aDLta3kLYtJ1SAEjC+oVuKG2thCC0WapgAJe2eoCzvzI2SfV5/HnypyW
         AvsrmPOtoXiCFHUUNWpdyBml6TY3OFK411ijmSRRGHH7AtQGCcbvRnmyde2FR8xpx5F2
         8by8/+EmKWAV4amSnnGj/13e694mxFaYnHoM4wq1+uiC70v3xcFzmlTBuEY5PJ30G1ko
         Ql36JMZsuNXLjZ/qq2R8t57WwQC6rYHSB8MejpkVOUYCu4MvZ+CMoc/DMErDIRz9uz6S
         lEvfTrp1zrp4icYOSh1BbMXnIU/rKHVChHoA6N5FCdr9+nL1RCR24RlLrL1VjwQzqgTW
         dQxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAjYFpX+kdux9Aw1F6sopxg+kGZUxIbnTC17LaAVcKtHibwPG33WN1lJ1X1+Ltv6B/UcbojOwmkIzi/zU=@vger.kernel.org
X-Gm-Message-State: AFuF++kpUrZsuianI28/1TeI9GB5fUBYaS4Q58sIzn3dhl7YvopILM9i
	xUmHFm81L+qe9lsEf1F5OPgE/3y66oTb7czYhDUFIA324OYlMbyU82S+fNNRqK3y5KFw/qjbse7
	fqIp/2nRYAY5YQ9DBwIDxr/WzIwCUY5GYKTXGtV2HBQiuHsf1aj2xanASR/24MJ3qrwg=
X-Gm-Gg: AYBFou3T0GHJFm1iEqfpTPEbnV8vRLbWWuhu+3FlCKMuiBs4A8CZTQ7PpZpH1sdUT0d
	5DPiJT5nebcCjdFZfH6Hsv2YCUcbo7pytJsux1/pce22ExDDAM9/tXJOG8gtnxS4e+ta9ni0G8g
	h4BYY2a8mOG+pY8heaNEibbtJL3b9P6Qw6LesuA+VLfzW1v7NWx19TcdDMzb7ttEuy8l2w2y5SX
	sjeVKZFoI+VuC3hj9M+5A2LCmpn7E6gY7F2hnJUYCpSrTFDjL26kmCedSePF7esgfhiBhVLjkEl
	TSbifwS0GhQam4K40ysdJzCgA/hGlJt1pOziXhCPrGBJkmF349nOz5h48CtPjpwVLy52gncGX4Y
	vTCA1hKLQZHx2byMpttSv1aNpO8tw
X-Received: by 2002:a05:6a00:b4c:b0:85f:1492:61a8 with SMTP id d2e1a72fcca58-8694644a922mr7586605b3a.7.1789052602825;
        Thu, 10 Sep 2026 08:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4c:b0:85f:1492:61a8 with SMTP id d2e1a72fcca58-8694644a922mr7586496b3a.7.1789052602085;
        Thu, 10 Sep 2026 08:03:22 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:21 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:41 +0530
Subject: [PATCH v2 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX0Cg6GUEUmEkm
 FzgNaCCPyFgQxVl/smLsO41DhAdKuqxM+i2Mb9eV3B9kFlFytK57767dpsEs3lbxa3HbrE//UJb
 OgDftEFJrvrrN5HbY9qjzMaqMuE7oJrHqKoawfWDoCswUnWTGbTCCL98JO6EP+xrC2mBhDT5dKI
 XPCvQ3pKATXY7THmTAsoi1RZkvkiEHjEkLMKyrnLy2cWjq4s6PlPDlnRYaG6cphJhxwpM28mozV
 45v/4O48giO+cGvUssKPzk9sYOG6ixPTEBl509QI+Ap3AiJmBog7B2vi43LT7e9T4SnvnUWmJ7n
 F82cT+TxiNtIo5DlCxpBY73grUZQr11puXClsTxCB37cGOd/nyntoj/IiI9rYYOLBQQtGKy0AcS
 oe3BeGgITUd7V8Z3HRhon1/0AVjaKg==
X-Proofpoint-GUID: DhvJjBhk4s34DdAsa9O_5lzU8oORQMZw
X-Proofpoint-ORIG-GUID: DhvJjBhk4s34DdAsa9O_5lzU8oORQMZw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX5KaCSrwb9E+J
 n0Sq9hauJnKpnFGe50WonTnLG42rbV9PU5IQBz6aDuROtD+SV1TPvaCEmW5B0iQyzhV9Lypu1Or
 yyqdfw3XwX0mzwdu8GO+ojGR/YgC8rk=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa2c6bc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mwyM69RmJpR6kuacx_4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609100181

Add machine driver support for the Qualcomm Shikra CQS EVK board.
The Shikra CQS platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components with modem-DSP based
audio processing.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index f9fed5c37c7f..5bcdaa192704 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -535,6 +535,14 @@ static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
 	.codec_sysclk_set = true,
 };
 
+static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.mi2s_bclk_enable = true,
+	.codec_sysclk_set = true,
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -602,6 +610,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
+	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

