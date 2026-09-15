Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E619436403D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436706; cv=none; b=BscVb64E9L+7VYkhHsJpJFI3ryq4fNv6UhoMyAeo7YN/E7bEhHkZpK3zMPz0GJGReeBTa7yxURGfwTKPpBwdCPO5HFDON/cmINcedwYRSrgLMJYxcsJ1p4D7AO/wD+o9re0WyhkWS/sdfE2S+BGxKYXcdoMa1Depi9QtWBspC7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436706; c=relaxed/simple;
	bh=8Xx39gvjAdBP5KCPHnpT8nFQ4HEoiyju0OpagmBgeDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAcHbPs1bwmU4HB+AMlPVCc3WVYWmvdvS8PJ4hhKBIpYC9CUVX7/m9Su7o4zANc0W/twbaD4uPvEQ+BtNJKgfZxDNawe5ZQ9KisfyvuyTbRUelvIlYN58D7I4lKq7mJWfpEDdK/7DrQ+gendBA/k2byAwweR30jcQ8u4sXnsAec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgmyXduq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeTn1KmY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgmyXduq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeTn1KmY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN0buM1198952
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIf7ZLgTwR+
	tXJDOSnsUFYSDR50wgvOhy8cyjzdZAws=; b=SgmyXduq3xJU0ZwlYsLCiGP5D+J
	Bj0gFQsnEJke4vig+230vs+NQtTBey/oJ2rFLxRXzMO0J3bC/wI6NxNMO52hW03U
	Xft/E9Kcaa2Z7WiTXgUlGRhoDtPAsDH5NQGdyDK2JAYnJpvs5xzPKISHjzhHnsWF
	2wzFENh7PNiyKJVDUIsjemL+7mCnKWYj0oNYvoXOjDrmfo7GyFfKyUdeePder+8J
	AiSTqtbIu4oU8Nnxx9d3ngO/AZybl+RtQDTAqvN8UalLx0tWQgTrB5NxYuHxr/tm
	SWXCNcTyQfitHipSJnqIEmwM6/Bd3jDPsPljHul2rdJaWwG3qaVV09aEdCQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg3vn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc2229450b4so3509306a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789436703; x=1790041503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIf7ZLgTwR+tXJDOSnsUFYSDR50wgvOhy8cyjzdZAws=;
        b=CeTn1KmYR8ccySjpsnvA/DUZuYXiG4F6FUaHyS+dGDTMQv7Wi8gac9DkObqNSTmeJB
         m7E7ZkBVc/8glQXh/YnT9W2ENsRxvVDOyUzs8wzm0Pw3MsBneTYznZJBn5ixJ9LlRkJu
         1W6g+R3qvL7yBQfKM212kCC8mQ5cZH89PuSnzjFoItt02GPdrgbrFNK098+rTlF/7pWQ
         SdZ8jWo09OTUAE2ZbLUicJ+eLW+j2Xy36+MSbxTDUVmE5QrC/9Go/D8RZxwXnU8FSHFj
         Dje3X70my6zR5E1ZQFeJTpxHANAhbtQ5wpIZ4CFxvNgDtdxuvcP9vQ5d0FLY5z7l6pSg
         hfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436703; x=1790041503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIf7ZLgTwR+tXJDOSnsUFYSDR50wgvOhy8cyjzdZAws=;
        b=KJhlKPtYdTuB8YMiHNPuQvRsO0w9hDYVEQ/nss28z87RobGrT/+flUaDczxNb5WKwB
         IUbxuBBLzUTkvLiPnDiXhHqvrBRCi58BUy/15IwJvvl78gnktlSb5fiRQ5zH4JJ3jpmk
         jIswTz5DgYhKDT5aM74K42Bf38RxJRyIbM6xGC0dzVuysDrQMl95H9svhJEHDBDy/BhM
         hSFR31AT+0p+2eYcOQhxV9/m5CEHLieFl2mZqEH8Vmg4Me85tRXMJHsZcEAMhN25V1mH
         EbRECtkMDZ4aW1KQMZ9Pa4fp1/sKXdwkVG2CeR3ox1U2fMEwUbJZY31Fmbe7ex4Qfqpt
         FKEA==
X-Forwarded-Encrypted: i=1; AKwUvBz9wx3PDKGmreJ4yHqoSjdHJHQVbK2gLEd2SNErladiN8y7iZVWkb0t3rkilNOjgqnKUI8N+Tz/tFfDvOs=@vger.kernel.org
X-Gm-Message-State: AFuF++mGb4S0IhvomKX+cZU71Qn8JiII8pu2z7PF5pyEuCMHYWdgtOEB
	A0DFOp+a9nD80X0PzBynPoiSD4FRYYANsZ7ZRtSqlt0qSBVyi3fXA7Jt+xCXHj/33UNH9nieRE4
	6f/YJdI142VN3+6k9LvYJv4gujg0xzl6lgm5PbjyD6LMEQNBhgPKPvS1hT984zd4/U/E=
X-Gm-Gg: AYBFou0Tn75XQtFa+DWUgUFTbIh/qKo2uApq7T5f43GcLoYewCfqZSpH+vDtK1xXj9b
	032SobB19ay1Hf4/+LF+sL4viVGj+tPPToEZplwTWg46sR2SBXP/Wvb+atKG2xMnKGuyeH3X4o2
	0Wybyn8xHt52rJrJ/cp6w6OreLzvHjlsaCh7AVJtwBz1HI8xQ2YpmX0bOxTOP1wsVuQcAHTp/BP
	QPblc51z3hdxe3N6s9ZDRi3UWaZRj/EM9uL82XHe5N6/g9RdANf/wTrPWb4gAkH/4Wut0zSGoLH
	Q5Sv3iNUeEc5z2olbE8BDq+WTN+9YF5POVVfof/1GSSpP4vhHNC/ZF45xba+xxqAlRXYG92ehIh
	vD9366ktJpHSwZiJHlYjYckrclUtdDmMSTfy0A47uPs0Axeh8hnQRTp7Xjxi+
X-Received: by 2002:a17:90b:54c3:b0:39d:fced:6fb2 with SMTP id 98e67ed59e1d1-39dfced700fmr4411669a91.5.1789436703548;
        Mon, 14 Sep 2026 18:45:03 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:39d:fced:6fb2 with SMTP id 98e67ed59e1d1-39dfced700fmr4411632a91.5.1789436703070;
        Mon, 14 Sep 2026 18:45:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm33104723eec.28.2026.09.14.18.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:45:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Tue, 15 Sep 2026 09:44:47 +0800
Message-ID: <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa8a320 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jHABHta5L3jSstw6_KYA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 4wnbAs6cZnZOR_GYgrLVElYWYeC0aAxz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfX5XhM0oLH31v6
 gGPlggOuY0FQ5OixhfWbafOh0s2yQFrS5KDm5zwgfVJ3/vnwd29YzkzMpcG2/SOmHHWCXEw4mET
 bYPGF4GmBmdQA4G2rk7ySaEkkK3fFy4=
X-Proofpoint-GUID: 4wnbAs6cZnZOR_GYgrLVElYWYeC0aAxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyMSBTYWx0ZWRfX5JR+NEW8ZJji
 Zbe8IacJMyZEqjosCbMejWFjGjhSelwM7srlMWFovpeZzEq6R0wke+4f1wdzumt8uAdgxmnq4he
 Ky5HJHSzdbnI42v/+106hM5u6nOlRr5d28FHYbkaP+vVT+wApXKRVpQ0NE3g94ds1re5JZn1F/P
 2JQ+ft5S9d4YDEHfdWVKpDMv4Ja6Zt9wh9nB3uFqOf+12WurToR5+1yJm+VySQdS8fck4N7GrW2
 DPULlz3jX0UcaBvALdsnldveMmodJV5hm0+JUTCzouJZnxPnthQkdSIBsn0Va6GKRyZjGb1d7Fv
 vDyMzE0GbARinzfRjlfAie1T/boq6aII2mD1QekRPwVuzx5FTKAUdFxaZ8sll4TZ8UNPybInoPB
 uD88CnbrEUr3Vxmz1c3DbIbU3ePF6JoCID5Ttk5jYveD7LoQEUVzaGjSPVdBBkyPTTZMoCFBect
 SA05iiavufpVqBIDt8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150021

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

Assisted-by: LLM
Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
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

