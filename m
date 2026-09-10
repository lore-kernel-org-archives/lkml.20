Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C94A4983
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052611; cv=none; b=EoI0ev49otVvP/1XUJx333/u9IL7L6VJ3z7Ib7onaMMabE+f6h6IoKFYbhRkWBmk60LLeLjndJit6eERFeewsxeWPph+cpZ2sk6/+gWedTRTsth+EosrN2y4GTRc4ytIqpRLKmFqq1Ug336QvFlKhpwCx2R2+sRjjOUTIB+XWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052611; c=relaxed/simple;
	bh=4FjFToH5ffcBDgAlLURcYX7T87RMUw59JYFGuJWakQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvHxAkIUGBkv35KqNWzlhFqcWHTVshvTMRNpfMlQv27n4vCdSUbZnpmvPTQfsWMNuxbdfsWVJyLo/RLw9c+NSdpHRjEK7qizxsOfC3evC6soKSzWZ56Z9Ue9ybmCc9ZmPpFvsyf8wyScRA33sxEv2Ak8MJ2i3N0vR35y4nzH2Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsMg3swu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Whp0wMgE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsMg3swu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Whp0wMgE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADvKKH625959
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWcIiqdgBVS1H44AvfP9lVPTjbT1g58XO7fJFATH97Y=; b=jsMg3swurpE0kiZI
	vbVOYBfJuSJKpDRYV9c1EAEUrgwouKO2KAka4jOLEWQJJn2o2/qWic2aOvMfBraM
	UZr3WR7eBtbLK4fP8L4+ZmRWZkm59IK82ivgW5NYQdbeLzOLdCb4rScoUMUW3EYW
	NHNPZDHj+4tdq6PryoNvzaCzT2D6lvGY3YyLvQuIXVWSdu9rclniEShDCuUyw5U2
	mRA/AoE3UtCGYo9v48S+wgb8YLgxm8NfPsYY2D13vlwu4szjD8dVLBpBQB9a2nOD
	6k+lvQAq79fnVFb+ok2kIaQP2iGuOR9GkOhs+MTuYGjuNG0cZuA0BL4bO0wtTUTD
	xDpvOA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx0e41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-869b8d63e28so807830b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052608; x=1789657408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWcIiqdgBVS1H44AvfP9lVPTjbT1g58XO7fJFATH97Y=;
        b=Whp0wMgEXna+MzjvHE/cqOmnzJm9VSo0/2TsL+yfXBeDLfacIPxsiR21XwGrUYhfcy
         5JSNkBS38cf8IWJz/L5HtJ6TRV23m8n3ziQuLtv1gRtYE4ei4I+gO2vXVYE5qBlUBXM9
         ttMfUiXyrhlovbEfTH78f8ETKjpK/Um3m7/wjikjL6pRuSn4/RFJbht7V2+eB4r9eplo
         ltAJ13/XffNd0Y4go1QuzIyEqCLwQsE6P64BEa0t/TBP1bXbzCYvvz+ZHKXO5D4w4dwo
         Ve0NhxXwB9Xs3p2rasoDj+qrFdMNmMnssBP9zqX9Hlh6ed+0DGMcXLgB6KVvY91d8IYw
         6lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052609; x=1789657409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWcIiqdgBVS1H44AvfP9lVPTjbT1g58XO7fJFATH97Y=;
        b=LHfOsQ/zX9fhdzO/cm75deontCKcRV6+4o6j9JOnM/MARAu+Zpg3+5PPsgzOeMg6BE
         9Zqh1Pbg42jHChMoufRzPDAaRat/53t1xJ/9EfDwZyO4hMQ18cfPFUmi20aSKHq4vxy4
         SoDVap0ok2rv0gkyHQ71Lv3yHc0v8U0qAQupYj5COOxSwH2Xv3Ddrjs9g/e1zH9J4lrO
         JSiBMTnLxGUlvGjzqKHA/4xcjnaeFBGuz7FUoxJvBVINnNPMTi5zifrxyTTnlDQT25mD
         tGKt8CHUBmVeuubtCXnVNV/RA/eYOL0lHnNoQ5UGya9B3rXhOPYm5Dkur3fKjo/jL7hi
         kp+Q==
X-Forwarded-Encrypted: i=1; AKwUvByrQW/Ojxh3QYfLrfYP0qYU9ahRUS9C+Ne4vJLNb5mk/Umg7kGMKc/JU/OzBka6222jShvu2hplV+QKe60=@vger.kernel.org
X-Gm-Message-State: AFuF++kasFsWcXJOUBYLpN4/W4NXfvSmQBuKnaXG0nQy6VhC6ruSLFjE
	d2RdsSzxPStyCx36zxczGInlYE3zTfqSqaXYUpdSg86xh5FIFjQ7tE3KhrZM1YKIBJSAiEpfPvo
	fVMUYNgViNndmkbIbzzL8tbdJZAxZqigimBxgdA1KNmDEVPR6uxehZ5WF9dOYJ3bmhEo=
X-Gm-Gg: AYBFou3/ILaQS7lnS8v7LDuXNZ5napuJzk2e+P9y5+1WlOgmmp4IGvY9/XnfYmMUG0O
	YpXPHa6EWabwPLjQCG4K/YH5QfuEk0By7gl8EXDYAF4DZ1A+L1EHF4cgSkvU82GMFX15nHxjaxK
	mVCSUyHb6uA2IK46Lt9TtfVQg0M4iwTcM8UnbUxcVIGBO14EgmEcqbMEhhJxDnCqqga9q8FTjMR
	PgHQ3VMBjyK0730birlfDhLGDetvfFEOU5ZNoCR0Qj/KwkK8x8toKrijC5irXRFooAJP/Ina1Xc
	UL2vrNTtb6R/bOaD496kJneWIBtO4SrtEZD7ykb4S8gcwfsBz5oiavn+vFpFFCu6LwmZHJneW4u
	J6Th/iSBg1K86AfC7aV5Hor+0fVRc
X-Received: by 2002:a05:6a00:2d81:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-86947d0a9cbmr7728580b3a.13.1789052608382;
        Thu, 10 Sep 2026 08:03:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d81:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-86947d0a9cbmr7728368b3a.13.1789052606931;
        Thu, 10 Sep 2026 08:03:26 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:26 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:42 +0530
Subject: [PATCH v2 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX8bihJ2bbkUp0
 N4/GOyfrj6B9p+HKiI61GAmTpDTKkEn1kfPReD31373WZEHaapbRsXRgkzPgsS81C39f/kCHbkz
 L1M3WSRtuScUMADVrQ4zdl5a2D0rT+14pXsg/ZsYhSt5qkNEpxp9xxhn6Nq0azGXb6/fFKlyBD+
 DGRyaXuLTmYJYDn3thFHqFS3L5f+IYONGRMmGeoC7DqpCTNzavmR8fJ84JPvGHsgZO1ZU7W3EEj
 78bkKoENGi9IOJgB22q5sOZypn23TKhkhjAiqZLWr08nGlq1xRzrg99NhD43bhf5pI6Jfjws55O
 5e0q88Ert+xMT351Ks5W/RwqmxmnRYCLmgVx96cad0Crt3PmKC6sXCHVZlFZFWpG2VJT5OdE8eJ
 bKLnbEBs8yqyDE9Rute85Tbjkl8di8G6a2DhEfaDVVUJLpZsJ7UVpnlbIij+ngNjfJ6kXYuMZl+
 VS5AcQhqmrVqf8cxV0A==
X-Proofpoint-ORIG-GUID: p-fwLHW3QNdSBKx94ZP2O7leCN8XBeRJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX/lfwtMNIWsYC
 0DgA5WfnQfmahRYUsKDNMMciVRPGVCgu9bNIbgLVQNSM8lqKdZBh6evM6z0bwxtCTB50nN9K/+z
 RneHeYuzjeTg9wEjB+xfv7LOo4pNEiA=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa2c6c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=W2XY7Ad4WFpPBbQoNBUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: p-fwLHW3QNdSBKx94ZP2O7leCN8XBeRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add machine driver support for the Qualcomm Shikra IQS EVK board.
The Shikra IQS platform uses a third-party MAX98091 codec with
modem-DSP support.

IQS requires board-level DAPM widgets and pin-switch kcontrols
because the MAX98091 codec driver does not expose its own endpoint
topology, unlike the Qualcomm WSA885x/Rouleur codecs used on the
CQM/CQS variants.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 5bcdaa192704..0551110a685f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -63,6 +63,20 @@ static const struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 };
 
+static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_kcontrol_new shikra_iqs_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
 struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -543,6 +557,19 @@ static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
 	.codec_sysclk_set = true,
 };
 
+static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_iqs_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
+	.controls = shikra_iqs_controls,
+	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
+	.codec_sysclk_set = true,
+	.mi2s_bclk_enable = true,
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -611,6 +638,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
+	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

