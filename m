Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7DE5304A5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073656; cv=none; b=s0ovw3e+eEl7KRhu09Ak+lTkdoxyaol5iljoReO9RvZJ/kQVRHU/wmW8WnU1zGi1MNKxQT5t/euSGrcrhDQkR0j9171s/Fih6EZhhKILrdkcKOPc9tUgmVXYipu+DZFeyqzqdY+1sODk+SZkrwevJHPv1XaThceZ3Y2EEir8rYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073656; c=relaxed/simple;
	bh=vifwALirNCulqflcyosVo587mRiiz/RrvkajLnxXmwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNw5TEXRCRWUUTkodp3k90QJBy/4k4PJwnt/Dbt5k7kTgTJrfHn0Ntwe7hs0HpYN6LwAZMOR2o3XRdnIwl7gzsHnjRcKPnEmo7W+PztYUT+QDGa4jEUHSvipVIH511klEBr6GzGHt/1HLAA+9h4dzAQd0uTP9tbozq1L0AsI0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ha8/vyvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TykLdpG6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ha8/vyvP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TykLdpG6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOg12114138
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsvYNszg57jlvaTs1ikqKAQgHALw87NQfyfWIWRw060=; b=ha8/vyvPKRMwqRVU
	zKk41GEPVF+COGBKZ/Zx4rnU0krSGHIARZmS9TIkoxrWvcFZPGN7I6rEcX5HX9pR
	uTleGOtiDx8/dyzpUUY6ysFvcymVtL+oXVbSbS5nRTgIlerrL4yhIFDP1pJqPPYm
	cJ9lm7P6ueSoEkmEMs/U5KmPbPc2qnusigI5hWkQVdBcla56Od8keqDyNhvNI+fZ
	94G9atKSBBYmW8bafSba28InqqFJ5LLzBW//Jb5knIoz9Hv57FLffhXjt8clCtth
	LDdIvVVlqgAGVv4zMvkIWLUYWtprnIhA8UEii6jwyKnc1ep4KuQYz9RUTfGQG4tM
	5z3HLw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmybf3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:14:14 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-821a36bb11fso15825a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073654; x=1792678454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsvYNszg57jlvaTs1ikqKAQgHALw87NQfyfWIWRw060=;
        b=TykLdpG6ywt7UpBY/qhztzyC7ijccjxxr4ZwicjITUEbfBwSKdHowSn6/MLrdSOJDV
         isY1kznO3jW0UOmAtP5UmygM6itDQQqPywhpuDfmxPWiUOa07+JmlSrxRdwgUhAigWto
         fz84BoZ5gwzc5lTLIwHaGK3+5dGhCcFrX0R10Nof7UIljy6gyCA8R6q7xzMlu5yOGLxa
         LwpmR5tzCUFyu8lhaYSvY+xRU38diZyllKE3HpRx2bc0QF1/hFi3Ubdyb2p7vJjOpbR2
         iAsJCw8Q6x/WmOTSBucrh4vl3Tb8r9Ij6y/hDWUZMJmwVTFsxjwloLWzcmrz/LrC/AOo
         QjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073654; x=1792678454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OsvYNszg57jlvaTs1ikqKAQgHALw87NQfyfWIWRw060=;
        b=VqFJjIvELMvrOcdKDWw5KIPlpaeBrqihHV39RUqW0oDs1OeNsEdpYpTnEcVexI0dQx
         L2UtPVHr5YQJAP1EZckMm/1q41Q6tJrc4+/EiFxoq4R+WhCSbniMY5xO1gozrTzQWFRX
         ipTfK2RhMzhv/prtOLr4aw3QqhUyP/ZVHrirVvtyJspsY292CxYC/jkVNGvfxxe9C1I7
         bGCKFdYMopRbPAi2B/5M/axX1/UpBwUjDPFhxFyctHXMeYs4aqE5cj9rQjdL88aUlZVx
         8c3velA8VrdIn5jinTde/pXFOS4XUq28Y+yCnBQVUeNVXlnLfqBBKCtlvBS5+zjgn5BL
         /sKA==
X-Forwarded-Encrypted: i=1; AKwUvBwRB5OlfucOQ+PLnUb2A1qcN1eDT8tIoTOya4XRxDPbIO4byqCS7LmjjeBrzmw/uYpc7Rol9ZYnkQ4Uo1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPGUALIZJlSwXfvzCGSQzk3Ic75Bux6POrZFYKzn9LEGGRpXhc
	fz6lpanyEw3RHuwuNtTdM5Ds/z/m5+0jy39GWPZtvXeyLZmXLvxWRIVbLoX+sU76nl4hvYflLrj
	RsxjyiEnyuycza/3l9b41FmEsEZZ12S3gfTBvqeNAiRCePgNFaEvFRnnDWdfJIHfnuMM=
X-Gm-Gg: AYBFou0q2wbcJkGMbAodB+HKpg9qBWnmadabUn4Nqtu6oEMir1xmgtx7kDOjh+r9WZT
	dr4oaPSf9KARETCatKR2wKM4wqk92iHBiPZK9hd4XpTI7T7ySlHjQVFHat4Oy/UA1jhipnZLXGB
	BRvyivTYsUH7hIfqOeP9uK4qx+MsKnt5sNqWLoZJq8JzOfcEn+IY2de6YOz77KHSH1hFAdX/2db
	iLZUzeMY0vc+aEB6T5HUT4YiwdFyl6pGbx2LYjiXSWLfS8ZBBbHdPIlM/DHWSCqcWSBitc57C3+
	12Bf/i7NuymKy+ff3rXbu9pXgEwOKCjdkhyR3Gwz/ehnJaXuEUnxZ/Ndnz+IH4vyDakOKlQel4Q
	1vPGyMvQZhlz+AnMyqwwdoeXQOMN1Wax4ubs=
X-Received: by 2002:a05:6820:200a:b0:6dc:e1c3:b2b4 with SMTP id 006d021491bc7-70110176ef6mr95033eaf.38.1792073653540;
        Thu, 15 Oct 2026 07:14:13 -0700 (PDT)
X-Received: by 2002:a05:6820:200a:b0:6dc:e1c3:b2b4 with SMTP id 006d021491bc7-70110176ef6mr95002eaf.38.1792073652940;
        Thu, 15 Oct 2026 07:14:12 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm11366719eaf.1.2026.10.15.07.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:14:12 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:43:12 +0530
Subject: [PATCH v1 4/4] ASoC: codecs: pm4125: Add the MBHC callbacks needed
 for jack detection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pm4125_mbhc_support-v1-4-8bc1212db6f7@oss.qualcomm.com>
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
In-Reply-To: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792073622; l=13255;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=vifwALirNCulqflcyosVo587mRiiz/RrvkajLnxXmwg=;
 b=xVkdlESIZnWIIvxIbb12RkB1Cx4qyAqsAtKha4RZ/N1qexOUb2h6oANXq128QmwXI90oDOJ+8
 /5cRNCjaEdpBrWf8wml3R93W6HCHNbhDBLsNv4/dA14rX9O9nlHBgtw
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: 5NQYqjTbmjzsmCXgBwbGOuC6pAl1gqGX
X-Proofpoint-ORIG-GUID: 5NQYqjTbmjzsmCXgBwbGOuC6pAl1gqGX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX3mel8++PeaqH
 gHXCruJcZK3wO1YwLIH4JU56ZJ5T5rUJ0xd9qNuewx4/C6IR83i6K8HzRCnARiRZjMJejt3gwVg
 x70ad/VGSbKKWRUqLB0ydrW1vSwi3VE=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0dfb6 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AT8lqgG73mO-_AR6YKwA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX7Oc26WKxOj9f
 4xPxznJHt53yiDu56bUsN12ix+qAGuEH1KY25N3fg54+35zImuYhG0qMH4HdzlTvzWcCuYm66hF
 slm/F9+N5Go7nbibfTlyveEp1XptbiFDvdh6MA/WGnn35c6++HX47IqK1Kyj2KK9MXeQAkHUdTO
 5YRdoOMux0rLV5SzL2WHM00IilDwje3zEHbDyQlM0YLTKmeVJJXHajJeJzqynSJJzoiAySg4W5H
 uBe1hNijjStOhB6gXizeCJ62SQ/iGYQcsmS3CYO98vs+BqR4fFzD0jYzl0X3XjRcW7W5DicKP+D
 KAL3o+hI/6yXQ9v+mMLIo/Y35A1xcf1VMk0SNjmVwld1afIgqtcEUUbjRncUmZecDvRueuY9A3z
 b3TEVsGm5eE+XqnaaEps4ZvmUEjrrFkektb6ssJpzmZIW14z0EspudrTbZUE2YKLbhPI+r1c/S0
 lZw5SS7lIpT/1G+ovpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

The codec only hands the MBHC framework the electrical bias and button
threshold callbacks, and leaves the rest of struct wcd_mbhc_cb empty.
The framework falls back to driving the shared register fields itself
for some of them, but it has no fallback at all for the ones that
control hardware it cannot describe generically, so plug type detection
runs without the RCO clock, without a micbias ramp and without the
headset ground detection comparator, and never gets a usable ADC
reading.

Add the callbacks the ADC based detection logic needs:

 - clk_setup() enables the MBHC RCO, which clocks the detection FSM.
 - micbias_enable_status() lets the framework tell whether MIC_BIAS_2
   is already up for recording, so it does not switch the button
   current source on underneath a capture stream.
 - hph_pull_up_control() selects the HPHL pull up current used while
   sensing an insertion, defaulting to 3uA as the hardware expects.
 - mbhc_micbias_control() routes the framework's MIC_BIAS_2 requests
   through pm4125_micbias_control() so they share the reference count
   with the DAPM micbias widgets and with the analog master bias.
 - mbhc_micb_ramp_control() ramps MIC_BIAS_2 instead of stepping it,
   which is required before the cross connection check reads the
   Schmitt trigger outputs.
 - mbhc_micb_ctrl_thr_mic() raises MIC_BIAS_2 to the threshold needed
   to tell a special headset from an extension cable, and puts it back
   afterwards.
 - get_micbias_val() reports the programmed MIC_BIAS_2 voltage. The
   generic path assumes a 1V base, while this codec starts at 1.6V in
   50mV steps, so the framework would scale every threshold wrongly.
 - mbhc_gnd_det_ctrl() enables the headset ground pull up comparator
   together with ground detection, in that order on the way up and the
   reverse on the way down.
 - hph_pull_down_ctrl() parks the headphone outputs in a pull down
   while no jack is being driven.

pm4125_mbhc_micb_adjust_voltage() changes MIC_BIAS_2 while it is
enabled, which has to be done with the output briefly pulled up, so
serialise it against concurrent requests with a mutex.

Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pm4125.c | 188 ++++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/pm4125.h |  13 ++++
 2 files changed, 201 insertions(+)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 2100f4e36..6dd5ce0f4 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -8,6 +8,7 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -76,6 +77,8 @@ struct pm4125_priv {
 	struct regmap_irq_chip_data *irq_chip;
 	struct snd_soc_jack *jack;
 	unsigned long status_mask;
+	/* Protects micbias voltage adjustment against concurrent requests */
+	struct mutex micb_lock;
 	s32 micb_ref[PM4125_MAX_MICBIAS];
 	s32 pullup_ref[PM4125_MAX_MICBIAS];
 
@@ -968,6 +971,12 @@ static int pm4125_set_swr_port(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 	return 1;
 }
 
+static void pm4125_mbhc_clk_setup(struct snd_soc_component *component, bool enable)
+{
+	snd_soc_component_write_field(component, PM4125_ANA_MBHC_CTL_1,
+				      PM4125_ANA_MBHC_CTL_RCO_EN_MASK, enable);
+}
+
 static void pm4125_mbhc_bias_control(struct snd_soc_component *component, bool enable)
 {
 	snd_soc_component_write_field(component, PM4125_ANA_MBHC_ELECT,
@@ -995,9 +1004,187 @@ static void pm4125_mbhc_program_btn_thr(struct snd_soc_component *component,
 	}
 }
 
+static bool pm4125_mbhc_micb_en_status(struct snd_soc_component *component, int micb_num)
+{
+	if (micb_num != MIC_BIAS_2)
+		return false;
+
+	return snd_soc_component_read_field(component, PM4125_ANA_MICBIAS_MICB_1_2_EN,
+					    PM4125_ANA_MICBIAS_MICB2_EN_MASK) == 1;
+}
+
+static void pm4125_mbhc_hph_l_pull_up_control(struct snd_soc_component *component,
+					      enum mbhc_hs_pullup_iref pull_up_cur)
+{
+	/* Default pull up current to 3uA */
+	if (pull_up_cur < I_OFF || pull_up_cur > I_3P0_UA || pull_up_cur == I_DEFAULT)
+		pull_up_cur = I_3P0_UA;
+
+	snd_soc_component_write_field(component, PM4125_ANA_MBHC_PLUG_DETECT_CTL,
+				      PM4125_ANA_MBHC_HSDET_PULLUP_C_MASK, pull_up_cur);
+}
+
+static int pm4125_mbhc_request_micbias(struct snd_soc_component *component,
+				       int micb_num, int req)
+{
+	return pm4125_micbias_control(component, micb_num, req, false);
+}
+
+static void pm4125_mbhc_micb_ramp_control(struct snd_soc_component *component, bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, PM4125_ANA_MBHC_MICB2_RAMP,
+					      PM4125_ANA_MBHC_MICB2_RAMP_SHIFT_MASK,
+					      PM4125_ANA_MBHC_MICB2_RAMP_SHIFT_CTRL);
+		snd_soc_component_write_field(component, PM4125_ANA_MBHC_MICB2_RAMP,
+					      PM4125_ANA_MBHC_MICB2_RAMP_EN_MASK, 1);
+	} else {
+		snd_soc_component_write_field(component, PM4125_ANA_MBHC_MICB2_RAMP,
+					      PM4125_ANA_MBHC_MICB2_RAMP_EN_MASK, 0);
+		snd_soc_component_write_field(component, PM4125_ANA_MBHC_MICB2_RAMP,
+					      PM4125_ANA_MBHC_MICB2_RAMP_SHIFT_MASK, 0);
+	}
+}
+
+static int pm4125_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
+					   int req_volt, int micb_num)
+{
+	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
+	int cur_vout_ctl, req_vout_ctl, micb_en, ret = 0;
+	unsigned int pullup_mask, en_mask;
+
+	switch (micb_num) {
+	case MIC_BIAS_1:
+		pullup_mask = PM4125_ANA_MICBIAS_MICB1_PULL_UP_MASK;
+		en_mask = PM4125_ANA_MICBIAS_MICB1_EN_MASK;
+		break;
+	case MIC_BIAS_2:
+		pullup_mask = PM4125_ANA_MICBIAS_MICB2_PULL_UP_MASK;
+		en_mask = PM4125_ANA_MICBIAS_MICB2_EN_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mutex_lock(&pm4125->micb_lock);
+
+	/*
+	 * If requested micbias voltage is same as current micbias voltage,
+	 * then just return. Otherwise, adjust voltage as per requested value.
+	 * If micbias is already enabled, then to avoid slow micbias ramp-up
+	 * or down enable pull-up momentarily, change the micbias value and
+	 * then re-enable micbias.
+	 */
+	micb_en = snd_soc_component_read_field(component, PM4125_ANA_MICBIAS_MICB_1_2_EN,
+					       en_mask);
+	cur_vout_ctl = snd_soc_component_read_field(component, PM4125_ANA_MICBIAS_LDO_1_SETTING,
+						    PM4125_ANA_MICBIAS_MICB_OUT_VAL_MASK);
+
+	req_vout_ctl = pm4125_get_micb_vout_ctl_val(component->dev, req_volt);
+	if (req_vout_ctl < 0) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (cur_vout_ctl == req_vout_ctl)
+		goto exit;
+
+	if (micb_en == 1)
+		snd_soc_component_write_field(component, PM4125_ANA_MICBIAS_MICB_1_2_EN,
+					      pullup_mask,
+					      PM4125_ANA_MICBIAS_MICB_PULL_ENABLE);
+
+	snd_soc_component_write_field(component, PM4125_ANA_MICBIAS_LDO_1_SETTING,
+				      PM4125_ANA_MICBIAS_MICB_OUT_VAL_MASK, req_vout_ctl);
+
+	if (micb_en == 1) {
+		snd_soc_component_write_field(component, PM4125_ANA_MICBIAS_MICB_1_2_EN,
+					      pullup_mask,
+					      PM4125_ANA_MICBIAS_MICB_PULL_DISABLE);
+		/* Add 2ms delay as per HW requirement after enabling micbias */
+		usleep_range(2000, 2100);
+	}
+exit:
+	mutex_unlock(&pm4125->micb_lock);
+
+	return ret;
+}
+
+static int pm4125_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
+					       int micb_num, bool req_en)
+{
+	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
+	int micb_mv;
+
+	if (micb_num != MIC_BIAS_2)
+		return -EINVAL;
+
+	/*
+	 * If device tree micbias level is already above the minimum voltage
+	 * needed to detect threshold microphone, then do not change the
+	 * micbias, just return.
+	 */
+	if (pm4125->micb2_mv >= WCD_MBHC_THR_HS_MICB_MV)
+		return 0;
+
+	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : pm4125->micb2_mv;
+
+	return pm4125_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
+}
+
+static void pm4125_mbhc_get_micbias_val(struct snd_soc_component *component, int *mb)
+{
+	u8 vout_ctl;
+
+	/* Read MBHC Micbias (Mic Bias2) voltage */
+	vout_ctl = snd_soc_component_read_field(component, PM4125_ANA_MICBIAS_LDO_1_SETTING,
+						PM4125_ANA_MICBIAS_MICB_OUT_VAL_MASK);
+
+	/*
+	 * Formula for getting micbias from vout:
+	 *	micbias = 1.6V + VOUT_CTL * 50mV
+	 */
+	*mb = 1600 + (vout_ctl * 50);
+}
+
+static void pm4125_mbhc_gnd_det_ctrl(struct snd_soc_component *component, bool enable)
+{
+	if (enable) {
+		snd_soc_component_write_field(component, PM4125_ANA_MBHC_MECH,
+					      PM4125_ANA_MBHC_HSG_PULLUP_COMP_EN_MASK, 1);
+		snd_soc_component_write_field(component, PM4125_ANA_MBHC_MECH,
+					      PM4125_ANA_MBHC_GND_DET_EN_MASK, 1);
+	} else {
+		snd_soc_component_write_field(component, PM4125_ANA_MBHC_MECH,
+					      PM4125_ANA_MBHC_GND_DET_EN_MASK, 0);
+		snd_soc_component_write_field(component, PM4125_ANA_MBHC_MECH,
+					      PM4125_ANA_MBHC_HSG_PULLUP_COMP_EN_MASK, 0);
+	}
+}
+
+static void pm4125_mbhc_hph_pull_down_ctrl(struct snd_soc_component *component, bool enable)
+{
+	u8 val = enable ? PM4125_ANA_HPHPA_CNP_GND_PULL_DOWN :
+			  PM4125_ANA_HPHPA_CNP_GND_PULL_NONE;
+
+	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_CNP_CTL_2,
+				      PM4125_ANA_HPHPA_CNP_GND_L_MASK, val);
+	snd_soc_component_write_field(component, PM4125_ANA_HPHPA_CNP_CTL_2,
+				      PM4125_ANA_HPHPA_CNP_GND_R_MASK, val);
+}
+
 static const struct wcd_mbhc_cb mbhc_cb = {
+	.clk_setup = pm4125_mbhc_clk_setup,
 	.mbhc_bias = pm4125_mbhc_bias_control,
 	.set_btn_thr = pm4125_mbhc_program_btn_thr,
+	.micbias_enable_status = pm4125_mbhc_micb_en_status,
+	.hph_pull_up_control = pm4125_mbhc_hph_l_pull_up_control,
+	.mbhc_micbias_control = pm4125_mbhc_request_micbias,
+	.mbhc_micb_ramp_control = pm4125_mbhc_micb_ramp_control,
+	.mbhc_micb_ctrl_thr_mic = pm4125_mbhc_micb_ctrl_threshold_mic,
+	.get_micbias_val = pm4125_mbhc_get_micbias_val,
+	.mbhc_gnd_det_ctrl = pm4125_mbhc_gnd_det_ctrl,
+	.hph_pull_down_ctrl = pm4125_mbhc_hph_pull_down_ctrl,
 };
 
 static int pm4125_mbhc_init(struct snd_soc_component *component)
@@ -1692,6 +1879,7 @@ static int pm4125_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Failed to get micbias\n");
 
 	atomic_set(&pm4125->gloal_mbias_cnt, 0);
+	mutex_init(&pm4125->micb_lock);
 
 	cfg = &pm4125->mbhc_cfg;
 	cfg->mbhc_micbias = MIC_BIAS_2;
diff --git a/sound/soc/codecs/pm4125.h b/sound/soc/codecs/pm4125.h
index 25fd3106f..3ee6f9c25 100644
--- a/sound/soc/codecs/pm4125.h
+++ b/sound/soc/codecs/pm4125.h
@@ -13,7 +13,9 @@
 #define PM4125_DIG_BASE_ADDR			0x3400
 
 #define PM4125_ANA_MICBIAS_MICB_1_2_EN		(PM4125_ANA_BASE_ADDR+0x040)
+#define  PM4125_ANA_MICBIAS_MICB1_EN_MASK	BIT(6)
 #define  PM4125_ANA_MICBIAS_MICB1_PULL_UP_MASK	BIT(5)
+#define  PM4125_ANA_MICBIAS_MICB2_EN_MASK	BIT(2)
 #define  PM4125_ANA_MICBIAS_MICB2_PULL_UP_MASK	BIT(1)
 #define  PM4125_ANA_MICBIAS_MICB2_PULL_DN_MASK	BIT(0)
 #define  PM4125_ANA_MICBIAS_MICB_PULL_ENABLE	1
@@ -25,6 +27,8 @@
 #define PM4125_ANA_TX_AMIC1			(PM4125_ANA_BASE_ADDR+0x047)
 #define PM4125_ANA_TX_AMIC2			(PM4125_ANA_BASE_ADDR+0x048)
 #define PM4125_ANA_MBHC_MECH			(PM4125_ANA_BASE_ADDR+0x05A)
+#define  PM4125_ANA_MBHC_GND_DET_EN_MASK	BIT(6)
+#define  PM4125_ANA_MBHC_HSG_PULLUP_COMP_EN_MASK BIT(1)
 #define PM4125_ANA_MBHC_ELECT			(PM4125_ANA_BASE_ADDR+0x05B)
 #define  PM4125_ANA_MBHC_ELECT_BIAS_EN_MASK	BIT(0)
 #define  PM4125_ANA_MBHC_ELECT_BIAS_ENABLE	1
@@ -40,9 +44,14 @@
 #define PM4125_ANA_MBHC_BTN3_ZDET_DBG_400	(PM4125_ANA_BASE_ADDR+0x063)
 #define PM4125_ANA_MBHC_BTN4_ZDET_DBG_1400	(PM4125_ANA_BASE_ADDR+0x064)
 #define PM4125_ANA_MBHC_MICB2_RAMP		(PM4125_ANA_BASE_ADDR+0x065)
+#define  PM4125_ANA_MBHC_MICB2_RAMP_EN_MASK	BIT(7)
+#define  PM4125_ANA_MBHC_MICB2_RAMP_SHIFT_MASK	GENMASK(4, 2)
+#define  PM4125_ANA_MBHC_MICB2_RAMP_SHIFT_CTRL	3
 #define PM4125_ANA_MBHC_CTL_1			(PM4125_ANA_BASE_ADDR+0x066)
+#define  PM4125_ANA_MBHC_CTL_RCO_EN_MASK	BIT(7)
 #define PM4125_ANA_MBHC_CTL_2			(PM4125_ANA_BASE_ADDR+0x067)
 #define PM4125_ANA_MBHC_PLUG_DETECT_CTL		(PM4125_ANA_BASE_ADDR+0x068)
+#define  PM4125_ANA_MBHC_HSDET_PULLUP_C_MASK	GENMASK(7, 6)
 #define PM4125_ANA_MBHC_ZDET_ANA_CTL		(PM4125_ANA_BASE_ADDR+0x069)
 #define PM4125_ANA_MBHC_ZDET_RAMP_CTL		(PM4125_ANA_BASE_ADDR+0x06A)
 #define PM4125_ANA_MBHC_FSM_STATUS		(PM4125_ANA_BASE_ADDR+0x06B)
@@ -58,6 +67,10 @@
 #define  PM4125_ANA_HPHPA_CNP_CTL_1_EN_MASK	BIT(1)
 #define  PM4125_ANA_HPHPA_CNP_CTL_1_EN		1
 #define PM4125_ANA_HPHPA_CNP_CTL_2		(PM4125_ANA_BASE_ADDR+0x084)
+#define  PM4125_ANA_HPHPA_CNP_GND_L_MASK	GENMASK(5, 4)
+#define  PM4125_ANA_HPHPA_CNP_GND_R_MASK	GENMASK(3, 2)
+#define  PM4125_ANA_HPHPA_CNP_GND_PULL_DOWN	2
+#define  PM4125_ANA_HPHPA_CNP_GND_PULL_NONE	0
 #define  PM4125_ANA_HPHPA_CNP_OCP_EN_L_MASK	BIT(1)
 #define  PM4125_ANA_HPHPA_CNP_OCP_EN_R_MASK	BIT(0)
 #define  PM4125_ANA_HPHPA_CNP_OCP_ENABLE	1

-- 
2.34.1

