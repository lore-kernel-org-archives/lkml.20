Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F79E47886D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326024; cv=none; b=dezxdY6sUaM3+q2Yctd9fy54H/P4bW3rTiKRim1ZGolG00ynzaOowdPpMUpTz5gqP4M7u6Qqdj95qBFOWm3p5SexeWZG/sUqSIiqYJrKlO80rDtem9ce8X1NXoxhsnuJhOOuJxQ5z1xqG4FZWY0P391tO3zPLiCOpvkXm/+r5RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326024; c=relaxed/simple;
	bh=idzv4/vd0rQo+68PWCIkH4PHUd4x00/KI6aG0rgwbq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zb7SkPBnie5ZxxBxrvIYeadaGfg7ZRq0+TZYpCnMO2DJRHHKHA3JPeJPmV5HCxnCFSaKeerdcVUfVq+5A7i3IUkrbgvd3pishBYppn5lhS20c9GqjIy3BRyHnRyBb00MgG3+DA8KheZGbWRm49CQzZZYG4nSlEKF/+YZYW8g/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4vOUHgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOdB5aPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4vOUHgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOdB5aPU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YooY1194081
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dTFOZ8IDkN6
	23Q2WEMAjS2pcxoPadq6jbVR2SYWGFiE=; b=f4vOUHgqsik0pR3/ZfbJJiH0cGd
	BKwS8TfJiNVgXd69HAcMzSCM7V+6Ymps8Fuph5dD9oP48h6jqtQAP+XseW0nVccD
	1AhVOcE1hOTRmMsKWCkK9nxQAZqFQIECYW+6JbgjkxEHEqiBpib7mVTXNNwVcwOV
	/21Ps0Im5m8ligGRkmZuDHLg93pA12NtJ0cmSxFDF03YtqFpdLjobVpOxqAtJjIk
	6x6FesA3jYsEOJ9jeimOSLtE2Ud6hgquqxeSLmyPSX1atfu6Vnzx9aoQ1Mn5fScq
	5gq+z7SVxLMJONfC65LgnndzA1pOXJwYclSiTzYqHjMS3b7R6zfUqg2eqLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jq33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so149932385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326012; x=1790930812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTFOZ8IDkN623Q2WEMAjS2pcxoPadq6jbVR2SYWGFiE=;
        b=MOdB5aPURdNzY5jgnf8ojZalwqCsD/ZWOUBjJBBevMTVB8Qe6pQgg7Wgtf2x//858P
         Plb56MM70+OYmGouPyfmHehsexA1ll9RsbdD41urBufAe+GptHt9IxbpLXs9zeR58bW9
         lbfdjL2CupUg+O4tRaAO29N1lpJAqma25qi8AcTAKxgl2ITMWV464cO+eBM9YHSPiDIw
         hekIJG7N8yPbUAfOx1TeIuJYzORqHoWH+/fSN7UJqQs6/bnOZHvCVzdWW4nuO5Ii1zGu
         HIkdb2O/nR6OuY1ImInDeCVYTRMNiAaQHOr1XuyY7uoN6JpEZwNslte35Xwr4SLV1JoX
         fwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326012; x=1790930812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dTFOZ8IDkN623Q2WEMAjS2pcxoPadq6jbVR2SYWGFiE=;
        b=rTqyRvBmooiyDAfMBYuXjuqKo43RzbjrGAMQN22xKwY4sJVuzj+85dSrxjrF+CISKg
         Kt6gspUqaTOuqkP/8J4e7eeHwfTwL4OuVwrqaNe2dp5mo/fiRuRR35u6jeMMOF+X1yKc
         QRhnnKqqNhupxv2SS8T9Pi+hNIu+YOYVQCHtOf+KLVxFuh3uc6zg+w5NwawNpdf9JSLp
         uWICPAWmJ4GcJqSIzQBRJoGMWvv+kD47NgSw1QCc4l9GoRNusbgYIPWkrCeMXOAX4xtf
         mLLHLcvqktPJ4IBf4c2MvxRfsmwjU3ZZLqhL3MCOVwEvr6bJvHBDplJv2Fa5I5cjOlCs
         cyWA==
X-Forwarded-Encrypted: i=1; AKwUvBypeuAofk/nidD3/vcb9Xvwkw3+KBQP92mxxm1nMY1ehPolG3nFFTEsSuWXVeALBH88QZMnyKxPKEnpbdk=@vger.kernel.org
X-Gm-Message-State: AFuF++lyp7WMxylnOxeLcn3rQDWOhtpCTV2f74BbU+qhpcmMkoLpaMga
	F7L86nYOn1ijzNaOsMfn84iuDJyZV0hr+zrmIO7tAhSeTJMh6LmhJau/wIyNxoreeVuFPHj7UMi
	FnNsyIjuJEokaolVD7FXIr4q3mhYQI479Zur0GYa8J4wQ6ADUpgzb+yjZG+XUixiIrVA=
X-Gm-Gg: AYBFou0RMQhe1cOLB29pX2mc/FeK42LL7Lr+RGv3h5yvkWyGzn1zv3IJSDmfuG+1uDO
	m7yk/PjexWu2LOy+BVCH62sVnd0ZAOrAfyQ2y2CR2FCL8jZ/X8wCEnD7oN2X7+xVhV4ev5fi7Kf
	wCVPdvik8STW6kn0BRYqUQo4IuoLvT1KPBdHFu2633KFPsiDGCa7YZVc1bFC9imIXhmWP1Zi5QU
	Zo0UOMV0UaFVshBwZIHB7Sv9chO+Qn4h1Kki/GqnTX2+VSESXiyUEnUX1txuCgjiV9zV7pjpTId
	1yU/8e+Y3W/aLqXNJeENhFqQXEzGcPSCcAD9yjcV/lFSdhprZjn/ROOolyySl1L+t9biCLFfmdb
	DrIWoPtpCdfoo
X-Received: by 2002:a05:620a:2693:b0:939:3a51:2490 with SMTP id af79cd13be357-93c43c5e38bmr323434485a.15.1790326011929;
        Fri, 25 Sep 2026 01:46:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2693:b0:939:3a51:2490 with SMTP id af79cd13be357-93c43c5e38bmr323431285a.15.1790326011420;
        Fri, 25 Sep 2026 01:46:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver for Glymur
Date: Fri, 25 Sep 2026 09:46:34 +0100
Message-ID: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2rZQ6SPOA_vbVrvWDa452xxuGbF_jUdT
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab634fc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7GdS1con5BCYmhUutoQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX2o47HaqDtiVj
 BVF4MAT/0HAdvzyBZNmrEWGPWTh79f588UnGDyhRWkItOhnxNZwI44V/R9Lc8CE0JRcHlLirjV+
 59S22tH1pC/nB5U1/dFibb81tpUrixbk44e+4vyqtMDBnd+Efbuw5qSKTDzMriIE3I1FgqDqhGU
 /ze8+z6gS1x/N0gk2KJ0iDoqtyoWrFUdhmOXi+9TlkTtuGlfd4DKAeBDfMD6UgdmiIBTOw1wUDA
 D2Kk60UCQyzXKHmrl/t4p75JDn49+ueo/rCAcUIEeOuqA7w9p4kpreVaO5GvEXYGdjHAjacyRk6
 BjfmfXq+27OTPLmt2cb9Ad4S9+aYDi+d43T6OujbbsjHmaobGoSs+ed/MQbIP2bDlbJ5Cv39rU1
 a8UyEyFviyq0JDph8cOLQkghvaoBbjtkfRxMGoyZjYrOkzYgzvLLFMRbrESX+sE5vVcezpzBefh
 HCiQ6cE/FAOv+bJ3lmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX1zSshCir4I5s
 yp7ZH5hAtTpoCBYRdnvED0k3UemUmQ5JtAIYTrNgCYh7QE0kEvXWzQdTfSb8thY2jpzr83qiXbZ
 82H3i8AInSVCGbsUjMqrW15rCjy4mf0=
X-Proofpoint-GUID: 2rZQ6SPOA_vbVrvWDa452xxuGbF_jUdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

Add support for the lpass audio clock controller found on Glymur based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          | 11 +++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3bf39a2c54c8..c9f5daed0e14 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1264,6 +1264,17 @@ config SC_LPASSCC_8280XP
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
 	  controller to reset the LPASS subsystem.
 
+config SC_LPASSCC_GLYMUR
+	tristate "GLYMUR Low Power Audio Subsystem (LPASS) Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	help
+	  Support for the LPASS clock controller on Glymur devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.  Required for the LPASS
+	  audio macros and the SoundWire compute-mode controller to leave
+	  reset on Glymur.
+
 config SC_LPASS_CORECC_7180
 	tristate "SC7180 LPASS Core Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index bd70e18a7118..2bad94a1d982 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_GLYMUR) += lpasscc-glymur.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
new file mode 100644
index 000000000000..356625dce99e
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+
+#include "common.h"
+#include "reset.h"
+
+static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xb0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
+	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300c, 1 },
+	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301c, 1 },
+};
+
+static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x1000,
+};
+
+static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
+	.config = &lpass_audiocc_glymur_regmap_config,
+	.resets = lpass_audiocc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
+};
+
+static const struct of_device_id lpasscc_glymur_match_table[] = {
+	{
+		.compatible = "qcom,glymur-lpassaudiocc",
+		.data = &lpass_audiocc_glymur_reset_desc,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpasscc_glymur_match_table);
+
+static int lpasscc_glymur_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc = device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe_by_index(pdev, 0, desc);
+}
+
+static struct platform_driver lpasscc_glymur_driver = {
+	.probe = lpasscc_glymur_probe,
+	.driver = {
+		.name = "lpasscc-glymur",
+		.of_match_table = lpasscc_glymur_match_table,
+	},
+};
+
+module_platform_driver(lpasscc_glymur_driver);
+
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>");
+MODULE_DESCRIPTION("QTI LPASSCC Glymur Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

