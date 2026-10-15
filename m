Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC013F1045
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037585; cv=none; b=J0dRUtpCxT/KLKIBiDws1TbxINWnOZd6HhQ/mCxeCnhH/43gYLw1VLa+QkllyicZbx3xAOn+x1grDMhZ2nNnZY7tBholZb6+9C6gEh/boLomfA5AUpaDySaONMothPI7KumbiqTb3jLnCWfO9rlokRfYrXC972L2yaEpkW0ygJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037585; c=relaxed/simple;
	bh=DPfHJeUtS4Ey1+nsmcrX0fFO+YhMH+PWoVYSZBmUix0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uD66axA2KRUApNPee6MtjHNfGX2zlmd/cTl7ggv7YkaIYECTG7D5sqSIYyDdGaKu+WvZHBR6GTH4Nt2/59wvtBPf9CcD5IXwRffeerthS2HXCw5vWfmOrm0ivRHqZOrj/l2XJOWcoDZ8+36E+ZU9mvowGbAT7SzvOVu7gT0yPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ysyk99WB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEatETTu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ysyk99WB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEatETTu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wmrt1889713
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l7lEINuX6Hz
	2cLvcsU8Y+fM/CxVjdXYAKO+8O8s0XjQ=; b=Ysyk99WBZBpDNw5QTwfN4LnqBQY
	44YscIJ6R3l/3o1YnZuDv/KLk8TGdjtZZsPBT1Ppb7GrRZxWVvzABbDQCSzs5+Yg
	K5HCVGVOUbRUrGlc9TvHd+KT0/b5ROpURfRze1B8b23Gbz/J/kHF9mkNsKDZoWwp
	q4+hgXX1P3eVbUnreX/hPeNSqlRULrLT/8z0kMLaHdNOCBxRct2xQ3/GvKQ8z4UZ
	sqvbSRnffO8NCIrpty5S2qpHv9vudHUvFIRyfE14M4kF+bGLV28fNrJnMgXCdoRQ
	sDvv7jJDjBxnLNXtEH3OWQkhn1XqtpFyQ0TzAcXbNqDf1zDlfskKv3RrLzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda01q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:13:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac94f8df66so135388a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792037582; x=1792642382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7lEINuX6Hz2cLvcsU8Y+fM/CxVjdXYAKO+8O8s0XjQ=;
        b=hEatETTug3usOw4Xj8rpJiAFUf1bPSndkUWeimmlacF2jzhdZ5Q4NdwRmZ8woC2zp6
         QIzyiZg6lbtwkMcgPECnBJF8gYHRMew6N4nXeIDdUVRBfYaX4lDZ+1P7bkyICJoDlDD4
         hPNfNWfxHiGOqIue9gFig1BkE3IwLWmxFw4ACk2QgjoZKuCQR6+TiIL0f6asT0d7p81k
         MINX9g2GN99V6e+OWqhyZWymV/Eb6r6W9OHFilD9Akk28DRx7vwczZ9SPUOcpkaZtxX8
         YwpouStTrZ8GDCFNwX/+/wJ/O75cjIYhLt3XKXdYRZy6jlxo+cpEGI2WZScDC4M08yc6
         UwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037582; x=1792642382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l7lEINuX6Hz2cLvcsU8Y+fM/CxVjdXYAKO+8O8s0XjQ=;
        b=s+F9vPwVvodv8MILlAJF+2YYLTq7BpQtvZuV0h5+u3YsNYoKT5EeBC3DUWE2OZxeTT
         IUyEqLTcrwhINPBM3IkPp/JvmYJVGspAOG/kU+Ejv7K8fwQ+EzH8SDLL0Be4fAl9LrTD
         rwzRXIxSvreoOcuX5c3DIrwFZV8YJuaY0S3i1RSZ3+NR6yiU9LQYCW4EgDQcZ2wiB7h8
         eKnL1EPhmJC1z9lcnHn/tatLs6NOZzxewtbj3fabYDK+4yCk/s6oXZGzjFH3/w/pW+wL
         wuhg7q2B1YxdMHLPWf2B0KXwsODchtHUeraVpolUOM3/L1yFtfivZjjeoisbyVv0EAeN
         IzWA==
X-Forwarded-Encrypted: i=1; AKwUvBzIYdeWgcHOm3tFi7D5EQLLEb+p4jK6l6iJq+/5iNJuVsn/gYpLMoabnD+YK67UIhaEDcVsCvpjXbr1tC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRgAwngTzxTcBolV7Nnh/sbAjHJ+hgGZFm2gZ35uef/PVIXDNd
	R3dGkcHZFB9qAlAUoUvXw2ylW46KC4iNhpabxv2qRRFIAaNRkIWmMvTgHKGjvEVSk0PQ4xejwHe
	8a/gGH7Cx9TDrV4+6imWCyfQqmLljCpUtw6FnkNXC8SRrHjjAwAg+o/4e7eNvtAl6JTU=
X-Gm-Gg: AYBFou3mSWs6vt6msrEXChfQblxQiN1sVqpe9+ey2i+xLKwm93sQ3y4UR7owzUcVrY5
	0+Dy0fwfLml8JWlPa79+qQD2SOhpvpSFSg7/c8a8cErzEvsMlO7xakdQcD7joi/XW/ttnr64798
	njbC2pzEaij/KB5C5vQdz3JBapLzORTTDkey4wkBfFgUsCbycAEtDxrZp5WNYEgfe53wA3cIBDi
	N8fQkRNkqAobCdMJxkFt7qDbffJdSn86NvG/YRc/sDN2/5hDEjcAnsD2jp+jMn6YFkfCF7O+zRz
	tPTlx9tNM1qBRwpp9FpHhLYRhpvHBzV3qIQyNCAGsoPHZH3u5qDwbrzDld5XN4pYz/GDnyL4nSi
	RI911ZMxz6qK5wkV47HC124K2idvD
X-Received: by 2002:a17:90b:224c:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3ab3a9d3e21mr29250056a91.4.1792037582293;
        Wed, 14 Oct 2026 21:13:02 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3ab3a9d3e21mr29250008a91.4.1792037581665;
        Wed, 14 Oct 2026 21:13:01 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2267762a91.15.2026.10.14.21.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:13:01 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [RFC PATCH v2 2/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Thu, 15 Oct 2026 12:12:40 +0800
Message-ID: <20261015041241.2186521-3-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX3xH+H7BPic0R
 CMVaP0Q6mi6LPh8mqoILhjrZOHgXcVhu/GfFD6v9TIT9RvvWI582+tr4nrDVLESn5EUIeLpf2Sp
 FX13/JMfLeSOgBpYYeypwOVso+gWwQw=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad052cf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=d3QjpUUrb7QHECHc-BAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Drvp8rcNwOGi2yDD4RG8hsEJxZYs2lsS
X-Proofpoint-ORIG-GUID: Drvp8rcNwOGi2yDD4RG8hsEJxZYs2lsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX1HGk+K8Qn7lr
 efDlOk0ikB+GasKk995Ab7iEDUGQ1kKH6Bq4craIemUtFAIS5bTQwlrCKOVPLAOVa2ogYgTS/lv
 dIgbRzzjkUbZG1GH/8QrX9EgVK0rV3Us6U4vZl8AkDnVR5YoGwiECnVPBr+zZrMdPbSYQQd/KtK
 MvxGEWagLvY++FgADyL/9jNAXOfK9al+iPkT+wId32C8JEGayvSOjFROoLJ5X7eAvzmBU5YMzOH
 uwpTtFrbHUrZSYz09NznmCkSe8NSNH5dYesOqXZwGQdH7EW4uLPcM5MM8pii2jWUhUiHwjIbISj
 Y3qUjaJBiJkRYL2IeDr43RPKabkqmrDqyJfoQ8buQqEma329rsuXZM0MJEwiZ9ZNTefvHTXEAhJ
 Mvll5JS8hxqyrCI6yNfRztD+KICODoS2XdJyA/Q3+wNwq+CouspewdgQaZIW+F+o5snHA5z7yID
 h0U3GbEH9Hjz98KLllw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150016

Some WCN3990-family devices use SW_CTRL to signal that resources must
remain available while the application processor is suspended.

When the PMU is marked as a wakeup source, request the existing SW_CTRL
GPIO as an input, map it to an IRQ and register it as a dedicated wake
IRQ. The PM core then keeps the IRQ disabled during normal operation and
arms it for system suspend.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index 636dd7e63891..69b7eb565996 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -11,6 +11,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pwrseq/provider.h>
@@ -484,11 +486,18 @@ static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
 	return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vdd-1.8-xo-supply");
 }
 
+static void pwrseq_qcom_wcn_clear_wake_irq(void *data)
+{
+	dev_pm_clear_wake_irq(data);
+}
+
 static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct pwrseq_qcom_wcn_ctx *ctx;
+	struct gpio_desc *swctrl_gpio;
 	struct pwrseq_config config;
+	int wake_irq;
 	int i, ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
@@ -526,6 +535,33 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
 				     "Failed to get the Bluetooth enable GPIO\n");
 
+	if (device_property_read_bool(dev, "wakeup-source")) {
+		swctrl_gpio = devm_gpiod_get(dev, "swctrl", GPIOD_IN);
+		if (IS_ERR(swctrl_gpio))
+			return dev_err_probe(dev, PTR_ERR(swctrl_gpio),
+					     "Failed to get the SW_CTRL GPIO\n");
+
+		wake_irq = gpiod_to_irq(swctrl_gpio);
+		if (wake_irq < 0)
+			return dev_err_probe(dev, wake_irq,
+					     "Failed to get the SW_CTRL wake IRQ\n");
+
+		ret = devm_device_init_wakeup(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable wakeup\n");
+
+		ret = dev_pm_set_dedicated_wake_irq(dev, wake_irq);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to set the SW_CTRL wake IRQ\n");
+
+		ret = devm_add_action_or_reset(dev,
+					       pwrseq_qcom_wcn_clear_wake_irq, dev);
+		if (ret)
+			return ret;
+	}
+
 	ctx->wlan_gpio = devm_gpiod_get_optional(dev, "wlan-enable",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->wlan_gpio))
-- 
2.43.0
