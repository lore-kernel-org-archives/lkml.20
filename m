Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51274E0B84
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060367; cv=none; b=JPsW8L/3hwVKS2ByRwGnHBPpqqbw0q9mckhfdZSsnKu+vNF5jKy1cNCtEadY5BeOW6cTwMRb97ilI01nZ4YNkReevtD9v/rafaJWIg9owfT8DctR8JB3/bBvlW5w66AVNm610Ka7ga4WP0cm9neIs2ranr9wNbRMNCGkSAg8qAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060367; c=relaxed/simple;
	bh=iyEuj8ZuYgVHXZdeWaPQ0WiZOh4LrnZeOC9Ro6Ud3gA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mOBVZBrSTo2iSR95kSUIqefrLbRCpVU79CyPrupKt1K9E/1lxC3xdPcxoFQHVP+VhCCSFiY/89HtiLp5ClPf1lUBZSPDgdSetlk4akA5LUtX+70R0zbSAEWvOQ074mb32DtoErLXxEw24lMWOO9e68/PnOJvCRTn81s/tY8OfC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgnTBIpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSI50jMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgnTBIpF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSI50jMR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00Hr33676875
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1LsyYh4hypDdEF2qoePNSyxQNqBxZYGA+BY
	ImKY2Xj8=; b=XgnTBIpFZgJJhJwucppSR0e3ozsp6iMzFXWuAycQ4CpZE/KnBKX
	xjlG4uUgd5ZWvwppmAFN4646cpu1Wy2dexfOSLBBPYqmjQyZfoR1oZaf+iAEe/ou
	k8NIdADkdBWyVAWtdFFs8Xh9QmolDsYwdaD1Sd/ROem4f43DnEB3lG2v74tbgK2I
	GyyKJvAsixYCaucHp2U3vPTx4f/fkS7Av9xF09hTEYTboFAEv6HynGwdH5dX/4/s
	Vnuu2DWCPNhpV8bYegJb5KNxIOsm5u2zp/62TCPD1zGppKxB2afUzUOisZI3RZzc
	I4PFD6MG5Y2GCRJow/DFAbS2836OhelITYg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vjwac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:59:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8688139460bso4155287b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790060359; x=1790665159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LsyYh4hypDdEF2qoePNSyxQNqBxZYGA+BYImKY2Xj8=;
        b=aSI50jMRMaTCxwpnBvlFcDY8wGty6ajBBeVsNSzb9oTPL114GAKIECFnKIrKVSCB46
         XutN/9VTyV2kDnZkaa1Dimske3flXyVx9qCkw2KWcObRYZiQYC392sFVfSe3zEcZKxBH
         Ur7Jp74d6opK7O8jd/hx9MNvni7LDLy5LuiAc4weRm/IddOlcqSQMnH+YfqpZrncAVXY
         t4tZGsqZsWu35Se5jh2av0jFxkc9mEA05eP22OKBqbkkrMtgbN0CNEHmb7cKXOfdiEIc
         78US3sxJ2RwoSaWFK+pPrZ/BFYGpAEnmyqPsAzg0ha0/0o0Qn3TbEKtcdzf0IPjY6z1J
         zBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060359; x=1790665159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LsyYh4hypDdEF2qoePNSyxQNqBxZYGA+BYImKY2Xj8=;
        b=pMN8QmH/oNPfuNaDbI0LPirWzs3ZiPuMNIMoK9L96NISQfp/Fgfxj70WSoIuvMYJLF
         NBEBjGj079BxagH6zBIN4dZrb4c+4KUNdw6ZngfqildUykf7l1apfWk01PU+UUlD3Ymi
         ZTAI2cbH4HSAPNTjZXgYWuIpP93DP2EXr6o5kuv5kA5k2q0r6nKFwybIeYuaFuc3PY+O
         D6460VtsQriicRryQ4W7PD3ODuhwnwJk+6bftjHYfg3WSrSXBCXmc3y1dPhktKl3FOUa
         f4pEZxNp4hn16BBwTiOX2BNQ3nZP6gqaigJ3pzhl0/Eyf5ItE+cBhWOGnR0HpnGkGfVa
         PYZw==
X-Forwarded-Encrypted: i=1; AKwUvBwBUhIn3aeL0mcGRc9d8GAYlc1CoTHunDi7ficLEZwF7GZkkRvgETha2mCR3SbTlzhK6UJW50Lr79smSL4=@vger.kernel.org
X-Gm-Message-State: AFuF++mVWRyZeEK2HkbFP9A4LVrjY0S5LvMhl+yGb7y2dMYdSvOi5w9H
	j7L8ggyd8eaHk/2WpwU6I519mWEDli0pYk5gQ4zsueuWDuz/RCKGUU4W7IFx032MCm9W5E52u0e
	HGyODZTg2NOV2rq265PY6i5+JKAvFgR6yA9NSbrT3BPfNtNcSwINLJzvGapa94Uk5ZZM=
X-Gm-Gg: AYBFou2jrtnI5TnwY9gPL61Xs0TThfr6CKufhLrz7chq+bgVFry9P8gNY1FGvPJyILi
	df+LcJ/kD/NlKDs8PIBv8+jcqkwSfyN3XqEHtayaC7CoDdpRbvyP8dUdncepScDrqALUERWaetB
	Odtgq8O+yO4MvlYLt/VW41XH5YcselBoqKdxo6kMO+aqM3P+y+B7+TV8s01obYjp+IDAVl5+ti/
	XxVng+13jrVepDE/S0fVeKJavimMi+PrbII4rJBG6+GJ6diJbzWiYFf3i4XJ0nfhCVCHITb7NKt
	7OgZjm+v8mCBamMwDbxabthvhFfMxNX5yqYYB8tmGE+PzrxsIQIAIjXrLw7iep3TOoM15yee7jO
	zgWqfouKcEpKJYa7l9nZi0bxx5SUtE1NDVGu5T6CuN/kpS7PhnQg/zF7AEBk=
X-Received: by 2002:a05:6a20:c90e:b0:3dd:85a9:559b with SMTP id adf61e73a8af0-3ddec661693mr304195637.29.1790060359187;
        Mon, 21 Sep 2026 23:59:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90e:b0:3dd:85a9:559b with SMTP id adf61e73a8af0-3ddec661693mr304165637.29.1790060358595;
        Mon, 21 Sep 2026 23:59:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61271041sm2999418eec.10.2026.09.21.23.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:59:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Tue, 22 Sep 2026 14:59:08 +0800
Message-ID: <20260922065908.477523-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfXz2CH4OjLT6Xh
 6oR6TeXrOGu0NAp7cz4WvYNHcdepciKxO7jIRtXZSA1osxFV5LWgk8VMNvl9Y9krvJfoEMZUVEL
 LtTIql6I0xnptjhFkLZHUCCpuiNbkHo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfXzfnVM0AcBU7f
 JWtr7VJZxEX453iB9NU46IN3j2yOO4pIhOTJCSpFxlIJW2pcUrr0dUqgju+sGl8vdNAhSAbtkmz
 6s5bHsowrqXmGc0ue70U82o2ighyiE3aFqWg8+w1ZIhQo95wqz0jrD8mGMeWAWhpW9KgZWpt3gn
 3KyvHeYpk/8bCvMIbDx1YzhMmtPIQmgZh1W1XfTbcHhwJLE8zXA5BHrTYR0dkOM+4W3oH2x6WEc
 TDf7Oz9rrvn/Gaym6AY9wn1ZoNLe8WlU2GbY+5eFKI9LTpO9iJ8YNvOazpkk7XKh5nf2N65W+5z
 vF42fBz5Rs74s5Z02OL5lM+/WjwvFyL19TP+/f3CS4vsNhxl+mfaMUD6B98+Z2zh766n+WyCpCv
 ckglJRvta0l7JoWSUsnQ1kXm7zfnIiijStMLXlLVYX9I4YU4hk2YC4vIuVW0Op+D7elCLoX8GCy
 HgQWhxWnnP4FpVKGG4A==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab22747 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jHABHta5L3jSstw6_KYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 23TPh1eq2J5cgL3QkAfuBZ6tycaPp8Rm
X-Proofpoint-GUID: 23TPh1eq2J5cgL3QkAfuBZ6tycaPp8Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220099

pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
buffer enabled.  Neither direction callback clears the opposite buffer:
.direction_output() only packs PIN_CONFIG_LEVEL, which sets
output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
which sets input_enabled.  Requesting either direction on such a pad
therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
direction.

That silently breaks both directions.  After gpiod_direction_input() the
pad keeps driving the line, since the output buffer is never disabled.
And after gpiod_direction_output() pmic_gpio_get_direction() still reports
GPIO_LINE_DIRECTION_IN, because it cannot tell plain input from
input+output, which makes gpiolib consider the line an input while the
driver is driving it.  On a board where several regulator-fixed nodes
share one PMIC GPIO the shared GPIO proxy reads that direction back and
rejects every consumer after the first:

  reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO

Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
direction so that the resulting MODE_CTL is DIGITAL_INPUT or
DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
once after walking all configs, so this stays a single register write.

Pads that are genuinely bidirectional can still be described that way
through pinconf, which is the interface that has always been able to
express it; the gpiolib direction callbacks now mean what gpiolib says
they mean.

Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Drop GPIO shared-proxy patch
- Update Fixes tag (Thanks Neil!)
- Link to v1: https://lore.kernel.org/all/20260915014447.282121-1-shengchao.guo@oss.qualcomm.com/

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f6dc43e27b38..eb4431591331 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -741,22 +741,26 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
 static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 {
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
-	unsigned long config;
+	unsigned long configs[2];
 
-	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
+	configs[0] = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	configs[1] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_config_set(state->ctrl, pin, configs,
+				    ARRAY_SIZE(configs));
 }
 
 static int pmic_gpio_direction_output(struct gpio_chip *chip,
 				      unsigned pin, int val)
 {
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
-	unsigned long config;
+	unsigned long configs[2];
 
-	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
+	configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);
+	configs[1] = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_config_set(state->ctrl, pin, configs,
+				    ARRAY_SIZE(configs));
 }
 
 static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
-- 
2.43.0

