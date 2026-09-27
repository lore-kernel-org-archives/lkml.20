Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89EB277C88
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471368; cv=none; b=XH9zvsiO9QIBqHAR9pZ+uUvTwNTWg2TfPwfQTX+rOKZVHOlMKq/ctsWHibS7a1VxghG8Ws3+P7jtgLEMBfu2SY/7iHjyILNkOaMIsI2kx8DvKLO0iiFvoAxyfELcwd+ZnI5YJsYhVT2eGBfDK114t6lZ4GfEBfvo2zosK6vGsUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471368; c=relaxed/simple;
	bh=wbWx7cqpz+d/C1Q8z2j058LWkx/w8+P34KhcuFmTNF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=erOk4T6jSKwP7v6U5bjvs6fsgdREUAUjXad4eaaLRgIvR0b70apDbqx7Dzd4YE5CTT1aWNl8oVBU0cBTi0/vU635fUSNYcbm0ALHqgYaw6/FksMP2EgP22sH1TwdOUR7pN3A5nHPGV+VyAEGH3zGvVX7w2J6vPyoRmZDfk/JnHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J38xDBoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QY9s2xvb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J38xDBoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QY9s2xvb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R0FrmX472257
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NhFYFspFINY9mlzAMXB4sTHoh3lFjbG0haA
	vg4EKcn8=; b=J38xDBoRIdBEutpNK/gaokhG5QVUcozBgviMVb3T/gPrhKzSCBC
	O2pfamWDRyT5hJsHek2MVKs46v9Z5V6rA3CYmcJSvDBJ2kHEzR3a49t30+Utg1Xd
	/yCOPF6s7u7twvQSaFJPabcpx+oP+BLyK9mxoGBvaShTjxhg4pFPVgm3ih+sbsjl
	VBc3qxllA/7ob924WeaSxIQoxRQQh19n1Nca1hllU9K3422jw/ltL8ZzH1dwJq4+
	K1BtRjlDJPgggU01o1idxoaT9y8YLD14LNmkaWeEH94VEpr2nbMOmoe6dPkjgthi
	OQcU4YcxzBvLMm+eaSFfYEaauuYDH75Zbww==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9svs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:09:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so2397542c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790471365; x=1791076165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NhFYFspFINY9mlzAMXB4sTHoh3lFjbG0haAvg4EKcn8=;
        b=QY9s2xvbzfCj5Ra5x/yoVYBt1UGa2YqVetJGbYxiaZavl+lLad+CprNNsCE53Rwg/I
         GxbdsyhuKc5GQr/RJQKWVaRHHJH+/fCaH7ZfIM3N8U3Nk9xaD99JEX6MhRgElCe64MPz
         v7IdBy90klvVDDRDJF+4uwdU70Kq/cUFNsb/ygCQ5dHz0nIsE989W53Jr36gF/AOCP8Z
         BemH4jE5G5/PNQBhG8KZqWVesO7lbgZ0A+DpsACQpYjq3H1XUx7+X9IFS9uSLPEKv0JR
         AWix6bZu+gpnYoDHEw7+4BaFGTVKLsZBdIn6sqGVMvPULCaVGa9JpwV9YVvwErZVTyp3
         9+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471365; x=1791076165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhFYFspFINY9mlzAMXB4sTHoh3lFjbG0haAvg4EKcn8=;
        b=Iei1b98W1wwklvrDFDxpYPYO4yU5IWqp99Njnl0lixRVO+GhVx4rLB5e5IxjhRfR8s
         yeX5GHAbz/V7Gaoq/plTDCE4Q52uLAc0wH7gNiiy5MwChtP6+K5FJtw8v8jO6je4jZCF
         3MKI6P7G35oMHpKcSZ3iRcOhb+59i5FY2wxLeSL458kbLONRgcHdBSOXtvqBqocQexmC
         612TL8p2eQ1wE4TZUCfPse6PT2R22D+WNdYuQJVTS5pKKOq+8rTQjrhl7zow+3jHqymD
         qS5RJT2QlSMqO4idG0+/no90u+RDrI+u9SWo32RKg5eqEapuHxHqhPBz9P0Gi9zAgPdb
         DMcA==
X-Forwarded-Encrypted: i=1; AKwUvBw6Y99XxIdPuwKr59VT4dTE2bilrhtTH7ZFBSlEMnvU/XkoP4QBJpBeNUUUlHFLtTO9iG6ISFvTRWdO7x0=@vger.kernel.org
X-Gm-Message-State: AFuF++l7cZX0ADeNtgHDBlAZvXl8464sCjtTw+1GejvB3YNfKv5z4MXG
	6LJYpgScjTIfXVhDhCKRUyWzvRtzuD/atrlTML4wND3ZLJ8eL4UrSkN9GbHUeTjH9iG12ckFiDy
	lopTg7+yw/greoJH3gMKXpwLRqXnVGd8CrIuJAo+NLp/ZH4wOUDAiyyEHdmEZ0FRUnS+yPFrzkA
	M=
X-Gm-Gg: AYBFou3ygXk3CJzmapiyM3h4x9ON1fpdt82fcwFYf+2g/7GEA004NUUpmZdrBLix/0m
	2AbDiLja0HYs7xRcnQRxg9o6Lkwigp2DzwYV2XIDes3vsnfRmvCCHBwapUMNVKAI+pngHXrs2/L
	cVzzljQtgANxoA4SqID7Rua5/8CKREfq4EABzRXoqrVxAtST3iAyfsgZS0YPpb2T9R/BAHi6iqK
	A0QfjexWFejzJD0NTm34ok+NvMzhHSpqScl7fpwV1EhTK7r4m8x0XIkOflNZtIgRApigbtfNX+Y
	LInx3ryWTyyHdihWbZob1pGr/IhPBKD1tsbFjj4v55sXJ3kK6giSrhivtpgwzT6Pz+UxUupWmF8
	Jt3bSETFp9BIOrb1fIWFRFSq2AaxRIX/8+sS+3zfLy8Jm7IZdXSigDF3eR9I=
X-Received: by 2002:a05:7022:b0c6:b0:142:d676:146a with SMTP id a92af1059eb24-146ce1aa654mr4807849c88.9.1790471364859;
        Sat, 26 Sep 2026 18:09:24 -0700 (PDT)
X-Received: by 2002:a05:7022:b0c6:b0:142:d676:146a with SMTP id a92af1059eb24-146ce1aa654mr4807816c88.9.1790471364201;
        Sat, 26 Sep 2026 18:09:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm15564028c88.4.2026.09.26.18.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:09:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Sun, 27 Sep 2026 09:09:13 +0800
Message-ID: <20260927010913.1212600-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAwNCBTYWx0ZWRfX0JePJgmvCFYv
 HYWbcSn8kPrwAAaqkP85qvPbt5mF6+L9kLHikwogIPC7mOr0sxCjQFV3hBx59CPK2Mf9MKijGEe
 4YNS+MMX5Tkg5INY5FRTWlUt/mtR2oU=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab86cc5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=p8A5mclyQkRvBDaFiD4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: SZ7p6UZtkRwjI0MTkA_ekxyLqUzWbyHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAwNCBTYWx0ZWRfX1dXU3D6Ej/CG
 aGD+SzoPo6cN6gLwCBDtm/aQcsNYTagi0/IlpsV3XoRd8A9FRmAXSIaYNJWocLwPkJIu9O6bmdz
 MjynF0yjaM49kbOBIJhJN00wXVCCwpHwa3ymv2cJKs2hjLqugJALwPr0uV4q747aQERTQKmpiYg
 zWwIJTQjUXKKHJTfCzPdR3f0VAn0G0omGsImP/gzn/fVD65nYUh0u0u+7Obh05OItMFzGLWFPWX
 EJETG1Vq7LofzZFIfv5cRmQcTJ59HODD1Zmktj1Uyx/2tPvlg0ZHoAxFe4F3uFs2e/U7lbsUZ00
 QPRg0HRzA8UgBPWONRs9oOXMyWsiU9nMdhvrg0k95QoBLwusJR2YPWRFZfUa4iXyXIANuih/fqU
 JisXo4xc5iuV//d4hn5FPICyHFvi5DmkmOHFHojJBjly2N99fs6IhoBHV9ZOKz/9o5YytMmeNjS
 RYnVrPhWuMN2yxWUQJA==
X-Proofpoint-ORIG-GUID: SZ7p6UZtkRwjI0MTkA_ekxyLqUzWbyHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270004

Neither direction callback clears the opposite buffer: .direction_output()
only packs PIN_CONFIG_LEVEL and .direction_input() only packs
PIN_CONFIG_INPUT_ENABLE.  As pmic_gpio_populate() seeds input_enabled and
output_enabled from MODE_CTL, a pad left in DIGITAL_INPUT[_OUTPUT] by the
bootloader ends up in DIGITAL_INPUT_OUTPUT whichever direction is
requested.  That leaves an input still driving the line, and makes
pmic_gpio_get_direction() report an output as an input, which breaks
consumers that read the direction back:

  reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO

Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
direction, so MODE_CTL becomes DIGITAL_INPUT or DIGITAL_OUTPUT, never
both.  pmic_gpio_config_set() writes the registers once after walking all
configs, so this stays a single write.

An open-drain or open-source output is the exception: it only drives one
rail, so pmic_gpio_get() needs the input buffer to sample the line rather
than return the value last written.  Program the input buffer from
pad->buffer_type, which gpiolib has already updated via
PIN_CONFIG_DRIVE_OPEN_DRAIN, and key pmic_gpio_get_direction() off
output_enabled so such pads still read back as outputs.

Genuinely bidirectional pads can still be described that way through
pinconf; the gpiolib callbacks now mean what gpiolib says they mean.

Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
Assisted-by: LLM
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v5:
- Update commit log to be terse
- Link to v4: https://lore.kernel.org/all/20260924070323.983528-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- .direction_output() now programs PIN_CONFIG_INPUT_ENABLE unconditionally
  from pad->buffer_type, instead of only clearing it for a CMOS pad,
  so an open-drain or open-source pad whose input buffer was already off
  gets it re-enabled rather than falling back to reporting the value last
  written.
- Link to v3: https://lore.kernel.org/all/20260924032314.948638-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- .direction_output() clears PIN_CONFIG_INPUT_ENABLE only for
  PMIC_GPIO_OUT_BUF_CMOS pads; open-drain/open-source keep the input
  buffer so pmic_gpio_get() samples the wire.
- pmic_gpio_get_direction() now keys on output_enabled instead of
  input_enabled - required, or an open-drain output reports IN again and
  the -EPERM regression returns.
- Link to v2: https://lore.kernel.org/all/20260922065908.477523-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Drop GPIO shared-proxy patch
- Update Fixes tag (Thanks Neil!)
- Link to v1: https://lore.kernel.org/all/20260915014447.282121-1-shengchao.guo@oss.qualcomm.com/

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 37 +++++++++++++++++++-----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f6dc43e27b38..9163bb14d703 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -734,29 +734,50 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
 	    (!pad->input_enabled && !pad->output_enabled))
 		return -EINVAL;
 
-	/* Make sure the state is aligned on what pmic_gpio_get() returns */
-	return pad->input_enabled ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+	/*
+	 * An open-drain or open-source pad keeps its input buffer enabled while
+	 * driving, so the output buffer is what tells the direction.
+	 */
+	return pad->output_enabled ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
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
+	struct pmic_gpio_pad *pad = state->ctrl->desc->pins[pin].drv_data;
+	unsigned long configs[2];
 
-	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
+	/*
+	 * An open-drain or open-source pad only ever drives one rail, so the
+	 * line can still be sampled while the pad is an output.  Keep the input
+	 * buffer enabled for those, so that pmic_gpio_get() reports what is on
+	 * the wire rather than the value last written, and disable it for a
+	 * CMOS pad, so that the pad ends up in DIGITAL_OUTPUT rather than
+	 * DIGITAL_INPUT_OUTPUT.  Program it either way, as the buffer may have
+	 * been left in the opposite state by the bootloader or by an earlier
+	 * direction change with a different buffer type.  gpiolib applies
+	 * PIN_CONFIG_DRIVE_OPEN_DRAIN before calling this, so buffer_type is
+	 * already up to date here.
+	 */
+	configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE,
+					     pad->buffer_type != PMIC_GPIO_OUT_BUF_CMOS);
+	configs[1] = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
 
-	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_config_set(state->ctrl, pin, configs,
+				    ARRAY_SIZE(configs));
 }
 
 static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
-- 
2.43.0

