Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEBF4BF935
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070240; cv=none; b=qU5JWLKQpVmVr8lN3OkXcNKU3vTujiZ7NzQ5iRwVfy/wleXbqLYjPbqJ+5Ja5+4zr0dKyV4XLf7+ebekbE48fO44RILKzaXmIBTv10X7u+6RARup2oj7SlSe5YM0PWugVHJQMtLs213a5Olfbj2Ly5Q1l78niZL5yREkthjUXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070240; c=relaxed/simple;
	bh=rtiApGBONz2xOyQ3xmfbQmagzxDjn+F9O4dO3vfbWvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vf2eQz+vfXHf5pGHTK4l8gBhVnEusUtIrfQtwDyxOs8HYks0Vr2NUvT7x9bHXh38nK0NKYxzfNE8mfJ6DKPdfj66ijZFBSLmaztWxRMS2jE5eKX3C8UoY0XJbPevSNx2saTWAy3geE7IwF5EPf9Z2KMh5jbMlTYGfJwDbqNP7zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjkUvbi9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDCNZbGF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjkUvbi9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDCNZbGF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6weTU2165590
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sWU8bsM4V81x9mWcfj7huJn45XrpXj4XJzzGRGFqFQA=; b=CjkUvbi9EdPGszH6
	VM6J+8SAYnkcMKk8E17NSwrgnXlHVBzJC4/PEUS2Cw7hezLqPxv9iBxhVpT65ltf
	+je6YBRME3Ps62+LsWbI397RjLx9+jJDeDeHIyYENR6JDIEJoZqii3AkRO8+iYyB
	P73Gjs9IPeVrjjtC2J4nkorW0qFuGm+CnBohR9rajRyil4FZW37WteirJRtsH4lK
	AtQTTP6PasqH2aVI/4Zjfd0jkfOL+Y2WhqBOPpnXLOQUyqt9oBcwWbb9S9LK8A+o
	xSe7AVHpI3Tsrmh80sSR5O1DlM+UmNdZvc7NjyQDgE/funJ2gynhdSk+ajtLQDqQ
	0ubpzw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeub7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:43:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3f521346so4509577a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070237; x=1790675037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWU8bsM4V81x9mWcfj7huJn45XrpXj4XJzzGRGFqFQA=;
        b=GDCNZbGFJ9Yl/1xqC1MXUBXyZRNPfxBHknjCEJIcTAxPmyBZO1Jcs5Ra8nQyfaCu3B
         7VtebRIwkS6LO2eHiUqHnpz1tb6V61g5sw/jejqBpqDn7lnIjDsekx+6rJDzu3PCRX+F
         eVPKQJ1f+T8qGKa23KnXVchyTFNXpOgtjxB9Xi19Mm9ln/oOQ8fOGF7kxMZ5ddo5k/rE
         Aw0K/EDm9aDBATpELCj7WJ4RXuRstkR/Jg9RSwMHiv8GI126Cj8ohNiA2zjJPnADwzmB
         bg9etRiSfrJ2ESKpWAspiLozXNwVXLFbX4GZ3k98BskfSHBjuEwkMJyBCSthiESF5AS/
         cPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070237; x=1790675037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWU8bsM4V81x9mWcfj7huJn45XrpXj4XJzzGRGFqFQA=;
        b=zRZIamjDUNbBT9hYYkRWi0Emh7VLxhC4/rq67wU6g3fFuyUdO/VEjw26yRzrb3rQyH
         iCwk2jolrT839nAE8im+Anos/pzuFtt/V27Q1PR2QRzRbUyMIbTMFJga43ZfKswq8icM
         qU2IXBKVRoyPefw7WYU7v3mi/aKmSFvdxD5oya8BIvYvxWRx9WhvUHDX+BFYkm8hyWrm
         0jF5//uwf65IXcnsw/lDCUJkge0XuzzKru6hxqMl2w4cJk9atRsc+hdkEGWQo3PTHsoN
         0IpsxygUpPb0ZFuKSVbqIOgXrFDiDIPhbMVNb+TnHdvj03VSzB9Gb+GpoZ+xJ7bUrmo6
         Yuxw==
X-Forwarded-Encrypted: i=1; AKwUvBzQNQOj5nW8vim6zriq4TaWqdBz+Ri2wFantroWDYqjrVWhdUNfuNd05c9LOQ5eQw6hk5Pu1vJmqFUN1Jo=@vger.kernel.org
X-Gm-Message-State: AFuF++kp9DBSQuTnHc52fDW7LGqlNPbF1elmSQheCqDJuBYNrPGJxIPv
	gqMK/eLQTN6nF3xjeiM8TIWsike51nSygWqaF9ZgUAgMDnrgjIprRy9XPOK2tSDDV0rv6jfMUa2
	DOUhNVlGUm0K9VohdzZjAgWp60G7VVyXI5oYIBWh3+3zWpRRNF3se3BVr6THGkhjMDVk=
X-Gm-Gg: AYBFou12FeOA9ibrKFBcOssrTkZZBhlyusDUCbZNZ1W4SBM98E9wpEduiG+iw9UKUvf
	gwxOUTsvAbO/KJHrX5yXmmirYKWj4Pr4U2GvPTbSlKvXtgNJre1i/LHMd53/yv+QpdmVIyLGVot
	8muYJPYU7a5U167g6xyLCjrWFhwAfoob1hTQrJuKtzpckMGsHDWCUZEX1d+KoFXqGzf7KeTsIyn
	VgeFYzWx3mk2B313UDhhw7GRFwzlQ1XHoXLd99aMQj+kUG2Er0Ru0OVJsvExz7qGr6BtY5yhO67
	93jONY6BF6jhzrvGKuwnsBb/WtB7bSup+4EqdM84jkjqOG067c1MaNVnyMzt5QgmNvwbL+B4RC6
	gWN//EcWreB8P4PZyFcJthvwfsxuDRSsx9Lo=
X-Received: by 2002:a17:90b:1c08:b0:39e:4c81:6c66 with SMTP id 98e67ed59e1d1-3a0731f95edmr579723a91.33.1790070236763;
        Tue, 22 Sep 2026 02:43:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1c08:b0:39e:4c81:6c66 with SMTP id 98e67ed59e1d1-3a0731f95edmr579702a91.33.1790070236282;
        Tue, 22 Sep 2026 02:43:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:55 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:37 +0530
Subject: [PATCH v4 8/8] ASoC: qcom: lpass: Add support for LPASS codec v4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070193; l=4318;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=zH2ejRs7z26KYa4wJQEh/ci98ueSkbMEPcesHCoanHM=;
 b=wlMhugFsBBW0+tDX/xgzzp69o1UGq483cUt7d6nH3AEmVNsC8+wcHvfEWK+ApqYbwsgzBobQX
 RaojzYJaFwAC4spGRjDdFjh7GQ6IKlAC7N5gGMV2wgA8HV+JkqHhON1
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: I8MHUTKEANuvwUjorX1MLNchb9MD4tuS
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab24ddd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Pm4gKVr55SiOJ_VcJFcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: I8MHUTKEANuvwUjorX1MLNchb9MD4tuS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX/hR2xL3feCS6
 5EqX74PkxTsGxDOJ9FM51k/coJ3V3bHw8OUYOhToU3qjymtjREMNqenvN0Do3MW9tryreh9ckQy
 MIB3ihXFNNr10EXsB8yLSig2qvCgWIh6Sr/pWBO7QXXlMlTU5butTUhVXNXw6s8HpmbCrHo6b1K
 eoX43/TrI7p3ZSkWmleZBEnLOb/TVLaBLJDzfMgknDPD56rAYFN4EWCexwJIattv133uTQee5qz
 eLAS+1iZU4vBU0PkGZP9s/c8Kkt3+muYiJZRK11GSmy0NyDTxZAc6s3NqIigwROgyEGpssC3G3I
 7u7ArzPYzThmvAwVpQPTREFpyFsHBRakNnkD6uIvIsZE8xZDnDPuP5oPbAEMEnFmFmz8w8t1x3J
 PQOMOgOKq0eLq4SmqQqxQ0AYFCZcoxTVQA257arl77kek6KyOyooLIM5FwKrVQsVbOH7/EoZpRV
 jsUcFIBdrkDn9ApCueA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX40g947Ma9PYT
 5xEodZzikgJKxR4DSCFVBmbAkRsE/rXr0noCgS3biB8gR/hgwF5PPSSBzf4j82XQndoh3bFG4nL
 80wn8Md/jg2spxiFrykbHk7ZC3FZN3Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220139

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Hawi and Maili use the LPASS codec v4.0, which the macro drivers do not
yet recognise.

Add LPASS_CODEC_VERSION_4_0 and its "v4.0" version string, and detect it
in the VA macro when the hardware reports major version 4, minor 0.

The RX macro register layout of LPASS codec v4.0 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls,
widgets and register defaults for it. Unlike v4.1, v4.0 does not need
the FS counter bypass or the adaptive filter blocks, so those stay keyed
off v4.1 only.

Add the "qcom,hawi-lpass-rx-macro" and "qcom,hawi-lpass-va-macro"
compatibles, both pointing at the sm8550 match data, so the version is
read back from the hardware at probe.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 5 +++++
 sound/soc/codecs/lpass-va-macro.c     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 707b22a6bda6..a51a6012a7ec 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -31,6 +31,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_0,
 	LPASS_CODEC_VERSION_4_1,
 };
 
@@ -72,6 +73,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_0:
+		return "v4.0";
 	case LPASS_CODEC_VERSION_4_1:
 		return "v4.1";
 	default:
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 93ceee878b78..b7c1eff05ce6 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1615,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 	case LPASS_CODEC_VERSION_4_1:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
@@ -3660,6 +3661,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 	case LPASS_CODEC_VERSION_4_1:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
@@ -3846,6 +3848,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 	case LPASS_CODEC_VERSION_4_1:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
@@ -3959,6 +3962,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8550-lpass-rx-macro",
+	}, {
+		.compatible = "qcom,hawi-lpass-rx-macro",
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 79abbdd158b7..46ae627ca594 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1896,6 +1896,9 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
 		}
 	} else if (maj == 4) {
 		switch (min) {
+		case 0:
+			version = LPASS_CODEC_VERSION_4_0;
+			break;
 		case 1:
 			version = LPASS_CODEC_VERSION_4_1;
 			break;
@@ -2166,6 +2169,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
+	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}

-- 
2.34.1

