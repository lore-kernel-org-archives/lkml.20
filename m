Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D973BB123
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787891392; cv=none; b=VvzyueI934h1h1WsIzD/VfeEXPuy0LELeLxdfdGM/+0FHQGnOlScOgt+N0qIxJX3/v16RzdXNLscaUcc0aVIT9h7nB4gfRV4ZrdjsTF0/AIrUnBPRlbJ1g1j6xSveMsDccYhFZB7kARmJyMW3G0aKe8HKn2vb4Z9o1P4On45oqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787891392; c=relaxed/simple;
	bh=4H9VOdLYTH9v60s11zzZp+ccy2UVkAzHbMGzN9G2LCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YDv6yJHy2rGoRo3oRm4I0JiBc/2KFVLJvVlECP0SGJmbUN8agMbS+MU3/Hknvj9FVYwSRYFA8CpsrcfIUMgYDhml5Pp6M6l/YsolOzElS6O7HMDdedVcrn6yXZheXN3BSZPtK0N4KawjWkQVc/unkNPXn996Sb+cGuOQ29C6v5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAbhMwQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jby82Sv3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAbhMwQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jby82Sv3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3JmlS2145438
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/M40XcNzHWaNv+Qt53p8xG
	AAnzoWNCnfOfgxO8U3Ru4=; b=RAbhMwQjt9luMxjamCUE3SdggBfvYSPahfdBxf
	IG7OWA5JjO5FoTeDMVUAA56UGJVgyFRP2tD5SvUbJD+HCcN3t49J5/xJLfLZT7de
	7xmyZO2ZSlw4kjSlvAmgSlt33fqB2M9bn6hiaLYT7RgSZ/5HWiIQzzh9oADrJd+1
	brXW3GFr8Qruq7YAYeKXRl2/Ig5DYIDy9E/0zazyxlbs7MVajrLaw0aIb74Q3/IM
	MtehVdQAmWGIGJ6uwS1Xf0LA72EU0IFbt2H2/t/GUNDoJX7eOAIwY6kki/Bxtk8W
	nMrYRKIZSYoRPHgtQDctnGnPhxkOnZVQL1uCzYQJLedKA1UA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0jnwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:29:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso700309a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787891389; x=1788496189; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/M40XcNzHWaNv+Qt53p8xGAAnzoWNCnfOfgxO8U3Ru4=;
        b=jby82Sv3yBvIYOhvDuAt1j9cfaTKT0uvdB7Ew+kc4rIGNxmJ+T3HyITHH2kkej5xtf
         EKousipjApAPYZMFQuFBCx6RE7NJPScUApL4LT31ain2162QCnnkZLOtwk/85T15OT/b
         2JJOVCveDM9wslbkmlyhbw1M0qmCYLoe87Oul/2sy4P+5/+cqU7gLoKCoi5bMFsMvjp5
         IdT16ANCQoGgEs6QsRxc1q3ngJmfOqb+/alymFhmy4TZILX/xJIF453Cg+PeKrtl+46n
         kt1ppcp7wA0w1cPRWs1bUa04Pr8G3xAr1rJ5I/IvEbAO69Rdf9oMghhZYqla8IZVzvNu
         q0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787891389; x=1788496189;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/M40XcNzHWaNv+Qt53p8xGAAnzoWNCnfOfgxO8U3Ru4=;
        b=ewPtgjxr9KEwz1J1VMePA02WMi/WAZ+CGfOAPoN5mzmu+mDPPW7ScfcZYeVHr/XDpN
         wbjkFg6FmBTaTepn0nQRkwoAV3vQcM2xlmVSyveAKsY4AiiN0OSyZNGB9ODEOJk5nIBb
         J+Jw2O/SyfrmREVExE8le9fWKf9kCmz3q8GJuh21j0wBt+2kMhMSvinSnQ4j81QBgvD4
         91WOlYbggY+thmJyVWuo2xLI6xIrPNSnWm7HDno7b9ssgIW6BZsQ8UxpHK6SmZByOBr0
         KGm8JxMZQfHW4JxzyjdjuKiBrx/1SGFrXRgJ4SGv7wBrcAt1kjAfu3ZRkJkSQjSoVg0c
         SCHw==
X-Gm-Message-State: AFuF++m8Cf/Z97dOpiPq0yJrfpofyYgM1ff94op73MlbY8Y9h6v538Wy
	y3ED5etOpU6LOUzCjAwHEPpxnOL/NVg1Wqd+eXi/GkKxWCtWn5ft4PFGC6xLsUsOp5mfIQVUmKH
	nRU6H350PHD/n9o9Nvdc1X0FwiWlmn7yJPf3O7KzVS9LBqeszd9Jj2fuAV/mG/9GbWb4=
X-Gm-Gg: AR+sD13kn/7u5rJ30v2jtzfwkdWlqO5YqejN7q1R5Q7EYVUJBTwB0SEuSOjhA8rBcKQ
	h2NbBNSv5NFYREdSnYO0lQQXyFxdIFhg7YIXqpGZDQnAPrcx3pUt/KnAzaYGGR/tAqqvDwkUXTA
	I+8rC9U9Lf/gZeFdNJ7s1Pa3vwYmUneWTJSAEHjxVFipBfu80H/WJSYN0pW7+PpOP9Q2V9Dv2D/
	3PYxxlSFdLv6YPAhRNquOhRjl+aA5+u1uMNTZBtc6ISAV4IrXky0Zgy66CL3GuSr+Hl+IW2++x5
	I973NQ6sof33kfoGnyJVamlu/Uql5+cLljYSq7kuuiBHgM7hAW75rl/c353du+fuxA4Z8C6Y7ux
	2uOGkwV+cR8C1emv+BLECmmFeOGvNo4zdYjIy
X-Received: by 2002:a05:6a20:43a2:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d265a3d2a2mr8029257637.1.1787891388986;
        Thu, 27 Aug 2026 21:29:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a2:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d265a3d2a2mr8029196637.1.1787891388468;
        Thu, 27 Aug 2026 21:29:48 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm3482765c88.14.2026.08.27.21.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:29:47 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 09:59:43 +0530
Subject: [PATCH] regulator: rpi-panel-v2: Add optional vcc-supply support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-rpi_reg-v1-1-1066b1f68630@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALYOkWoC/yXMQQ5AMBCF4avIrDWpCsVVRESZMhbIFJE07q5Yf
 sn/ngeHTOigijwwnuRoXQKSOIJ+6pYRBQ3BoKTKZaEKwRu1jKNIbTmYRGY6yzWEemO0dH1PdfP
 bHWbGfn/ncN8PudR4F2sAAAA=
X-Change-ID: 20260828-rpi_reg-3f9db1057567
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787891385; l=1905;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=4H9VOdLYTH9v60s11zzZp+ccy2UVkAzHbMGzN9G2LCQ=;
 b=Lqdlb0mhX9qZw4F8BnY+MAYnIe+VDdEEGMI2gTEm+Evnf9YAuBi0wqzkvBaA0u830dRo4FyoE
 1q6p93vP9HhA1g936ofwhTfKVPm2nGLlApN+sLfNJH0pui1rFPXBtQa
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAzNSBTYWx0ZWRfXx7Dzi/FOrSJS
 FiqMrvw6VwnWmThj7R8oZA2uZ4y9et2RFAWkQprJ/+Jr+Ox0sEG0ovk2S8R7ggGBP4yPW4xDneA
 zXXjlenlrP21c8p3kq7usZK0/S/EbxFC/+Dg+YWV5SgDZLc/DKhL3/mZCvC+XmLe2ORwoGcktkL
 qomOOdx0fy4W1uKSF+62IpKRp0v0KaSG2FSci+iDoWFLRIIH9TgQTOOE1KBViqC9K//7VsnXYSw
 p7e0cfLcWdF6/H7EqvyEKjRGkOtL9hJokk7FfW5OAgwcz6rTFg7p7nQp0M7UCJhAasQxOLdqAMo
 8Smmp7GLV9dqrvnOk/lN+730Z9H+0dJf9+dk1+41I2x1QBqi7Hq94TAW3A0qQyJe0QkQtXkHUWm
 ccRSYOG/TGOfKlVl0xCbbkX3VirOrcEmbynch2DA216h+OdCu3wL7hph4UYFko2UoG7nVdhddG9
 tS5yTc8ZAihGdrc2oYQ==
X-Proofpoint-GUID: L4foSJ4wFiuYMWV-pn7-eHkORwoNHf0Q
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a910ebd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=X_4rVqSs34DrZzfsBiQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: L4foSJ4wFiuYMWV-pn7-eHkORwoNHf0Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAzNSBTYWx0ZWRfX5QYrJsBGGTmZ
 bBCIJGAm4UzjaPh4ToC0YcNYsLuI+zk7L8UyrTpk4ZAKnMjHeJ/kBErM+EI7Lh6zU6EZnAFKBAg
 ttS0ci9/Xqi5gO/2thZMHM7+MBM5p7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280035

The Raspberry Pi Panel V2 regulator driver may rely on an external
power rail being provided through the device tree. Add support for an
optional "vcc" regulator and enable it during probe before accessing
the panel controller.

This ensures the panel controller is powered before I2C communication
is attempted while maintaining backward compatibility with existing
platforms.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 drivers/regulator/rpi-panel-v2-regulator.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index 30b78aa75ee3..4e84f05f6811 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 /* I2C registers of the microcontroller. */
 #define REG_ID		0x01
@@ -66,10 +67,27 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
 		.parent		= &i2c->dev,
 		.reg_set_base	= REG_POWERON,
 	};
+	struct regulator *vcc;
 	struct regmap *regmap;
 	struct pwm_chip *pc;
 	int ret;
 
+	vcc = devm_regulator_get_optional(&i2c->dev, "vcc");
+	if (IS_ERR(vcc)) {
+		ret = PTR_ERR(vcc);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+		/* vcc-supply is optional, proceed without it */
+		vcc = NULL;
+	}
+
+	if (vcc) {
+		ret = regulator_enable(vcc);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "Failed to enable vcc supply\n");
+	}
+
 	pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
 	if (IS_ERR(pc))
 		return PTR_ERR(pc);

---
base-commit: bd2a0c2d8c49ffb7acfcb0c1177af355ea417caf
change-id: 20260828-rpi_reg-3f9db1057567

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

