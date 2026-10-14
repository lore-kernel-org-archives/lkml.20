Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3544EC67E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974045; cv=none; b=ZX3mxToe5W3yIGU0K+0iWOj91UQmOxeHC41LbJ3YkSQMt+5Q2jQCV7KqJT89MLXctJtdd4U/KDNtL3+ShaX+++Bluvg/7GYMtDWWK4NgJwtTBnNGUE52V6K4yJQmLmIkDfN7fV/am3w0uh9ixaSX0yCAqLPWIdC60y3TXj3Sn/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974045; c=relaxed/simple;
	bh=E/wYzVG3xDf7L/w2N4suf4ZX/BwoomQCbfZ6b/N9VQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKsPwaSVPNS4yuyJkwQ4aUWK4LkRkPwUtaT7LrNp1tQdHN+rgpcN4Z04D7VtfckdbbgLIYZaeDR2qZkmnkx/jFqMR3mHWg2Qw7CPZXQIlgEnoMAV87jv/yq3qetQ9kQ3ysZAMPAm0AOP+NUDBCjyyDxBFN4i1Mkzz8yMcB95DJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBkc0T4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUmEq2Ej; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBkc0T4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUmEq2Ej"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E91VqI3000868
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uo7sfnxHaYE31FkIynvT/aOThmlUMaQFUS2p5R3dF0=; b=XBkc0T4PI68bdEB5
	KiUIEws4IZXjDCC1z0q10FPKtckZMhlz8emo9SHOoAibyR/WnwTeDFrcACip9iWT
	rOqmCM4UiiYeG7W2P1poLJwkQ6ALi3MlBbNJMdOk0+8FOHbhaCMnx5JeOvbdWhER
	nxqn7gaDzWT7gS2fRKjYt0eE7ryLIm2sLq18Rxhb5PejAlJWm3BUFaWVkJ8DuWoZ
	YoQtrOCimOznemd5V9OJng1YTQ2vGCMVsxuvD9ZUSa25d46pTcKpSz7Zxh1G7f8L
	0ieDzL0ge5yz+FLojURxKbH4ZfLNYJDJhWyEXkYZkfAuTJ+nLmdch77I5Ds7F6ci
	44N1Cw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeugrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a813204f87so242983a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974039; x=1792578839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uo7sfnxHaYE31FkIynvT/aOThmlUMaQFUS2p5R3dF0=;
        b=NUmEq2Ejkx6cdBaKK4DfyJHS+G6IvAqaFH4JGrcCnm1lk6Tgec6xRfatVUM6ie63W9
         b2Wc5f2LMQhaI2PCQURcMwwnHAQ3f82CrKC9bzA1eWdY/xdtukj4zIN4f7WHelH/9v7a
         BZkFqXYGSPG/m2QzdIgEDbugkSQQsCd3OAkWzvBr+UkatTw0zmNi5+gsP40OrjyOecht
         DV8SmlRQFkeT4cCO66GiV+KSjN6Zo1heQA7i6sWYZterOLEzkuLD1juub1vEycgXi50l
         eMXdrFdwHrKidP9Z8w423HwrRI1oKxdOW8+cm7XGGPjS06EqtaX3ML3rTogpOpYZzFZe
         C1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974039; x=1792578839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uo7sfnxHaYE31FkIynvT/aOThmlUMaQFUS2p5R3dF0=;
        b=XVLskkeJSMisG1U46a+6NZIUhUPKBHdbW+Pe1GL34hBJunMhpWkwUYC7rzgfzReBkX
         RsuK3Ty8LCSCJ/lO4qx7aeGJy+LCkl4WmqYIzG5cTjhJaZUzKxXSjcnwwldMxzH8SPfa
         ERK9s0uY3dALMjI79Mi3FB7q3KmSzk+F8VX0dM9GGOV1vpv9aRIvm5nIo3mD3KrDuZiU
         JeWIE4T8oqURJu/7rfQlrRBzlfbPSP48PcuQPkYzpOTNgk6/WHnHxtvq8SSQ2/8fCK75
         eSudfu2dTCwZgZaGAFE1ZhQrJC2EeLowGmQpoYvtrrBsddGT543RSgL7eFPMuNAdPDzU
         MgXw==
X-Forwarded-Encrypted: i=1; AKwUvBxKYVGYWSGLMbh/suEcsIVLn0OzDf8V124SFHSbm1FlVPt+V1VBNEGv/yzTYvzMDKUPu++qsvyXrJF7zwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU5yk0+WNjZNdkAZxallrQ/+nwQxMJ4yKM3QUZKRNZJcdQIAwJ
	trKchFnySPrHRvO4MKlpOuxohqy1itwijr6DCXew/I/qj9w4+GwDShK9IS66rjfKyx+y4aVlP7U
	LEKRkfO4vnrB+beu+OdDBzpbhIh8wRIe7ZwkkscFS50XXBanYtzw2xMBEXpOHexBO/5I=
X-Gm-Gg: AYBFou2Th/bBDG9dlP/99hWLipbnkwNf0cI7nv+GzSBKItT0oVBbEtYlBYgzlBW9Udu
	00+OQ1mRJkxFkohJ1fT+QsLB7201zXaQ9rFyaUz/iefvZqZCp8fLLvCWo/SlMqc9AM47SH0/wIM
	HT50fE+ZbgOiQi+8JBYC1MiXIwJrsb5fS2qcE5RBSIFDxINvzUG+HkKIFI9INQhORhxijtM6xzB
	W1LD5unI6BFCbUZ2o+df6fIYKoPYoTdNvUSw37PZsTtQ+S3soEGi844SCI/nI8qMkPD33RYTLMx
	APTN6DNHGAvyxlFnrz+mQ04KpSKu4QPuV8h5MT4tF/lf+MRll6ikmmqb9Z3aHHdOZc7ixCKD2C2
	DNgpPSuE4H43l1+HBGmg=
X-Received: by 2002:a17:90b:5343:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3ab3a953758mr11614676a91.26.1791974039249;
        Wed, 14 Oct 2026 03:33:59 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3ab3a953758mr11614648a91.26.1791974038675;
        Wed, 14 Oct 2026 03:33:58 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:57 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:04 +0530
Subject: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=4159;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=D8X2HHkS4eWp17tH1OYI+/2C5p80XJqz6bAm/yAKm08=;
 b=w91wQB2tKJUl8m1aQDfMJUVNcJlGTFOU2Eh7prP3mXuHTryQqDw4nsiNrNtzQOyJH2qgRB6xL
 jshtG0L/ZhMBzRUyA4jsNZd9ZBkTJ6KcncXPB72g7t/re3N82g3b3/N
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: rFZXmUZTA-FQeix5uViG3v4sMbk3auXV
X-Proofpoint-GUID: rFZXmUZTA-FQeix5uViG3v4sMbk3auXV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX3c1DmPd2Gb16
 9WKPk8eb10XWNpcuZ6+t2rQkbXnJwaQDDYyAU9tsA/WYru3TCy9COd8dz6QDpNUpJFYiT/p2nHy
 ysMcN4PB+iQh8WW5GiFx4UjmTXObwCstb7gyrICHflRMRrSNiBwQpNWx/r46oZ8q8lhGzFZ+PMQ
 TPdBITcYy9J4NZmLR6wQH+VMbvxgEz3ceMSLaL2+MSZnmCnU6wMOO0A8izU1Z6vq3s/TyIJoY3a
 n04UlGcInI4tDriLq2f2dP4Yo9xQE/2VqeIxnvk0U/htDCr4B/Yyxp57a3QwwDfn8qRCSUYkDDm
 itfkyWZXZwTVUyK3EapAzm/OF6tD7NRFqXjoU+TFfUr1sFtgpflsjmAhng1Sf5F41n6ei745xMZ
 W+HLpEwPpNOSLEcokb+Ksv/PZhISApKVu4hCizYc4KsNER+UiDK682ngny7IYHtYrvu+oeDQ8fq
 WetwNw+8E26/0FkldDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX8lPtXng3sIyz
 qe+sMw0OJwZXBKHx+MLyJ2eP6pA4wY9iJmyjg83K70WBDT0jLbbfi7cKQwpg2pMCu18ztbA4L6w
 aVtOaA5klFETti6FzvwxEcGPKay/IHo=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf5a98 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lbcZtXRpr0qBkvjFNboA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 4179427f3891..8b1bbb4052a7 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8008_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8008-regulator"),
+};
+
+static const struct mfd_cell pm8010_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -215,19 +223,50 @@ static void devm_irq_domain_fwnode_release(void *data)
 	irq_domain_free_fwnode(fwnode);
 }
 
+static int pm8008_irq_config(struct device *dev, int irq, struct regmap *regmap,
+			     const struct regmap_irq_chip *irq_chip_desc,
+			     struct regmap_irq_chip_data **irq_data)
+{
+	struct fwnode_handle *fwnode;
+	char *name;
+	int ret;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+	if (!name)
+		return -ENOMEM;
+
+	name = strreplace(name, '/', ':');
+
+	fwnode = irq_domain_alloc_named_fwnode(name);
+	if (!fwnode)
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+	if (ret)
+		return ret;
+
+	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, irq,
+					      IRQF_SHARED, 0, irq_chip_desc,
+					      irq_data);
+	if (ret) {
+		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int pm8008_probe(struct i2c_client *client)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip_data *irq_data = NULL;
 	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
 	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
-	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
 	unsigned long pmic_type;
 	int num_mfd_cells;
-	char *name;
 	int ret;
 
 	pmic_type = (unsigned long)of_device_get_match_data(dev);
@@ -248,6 +287,19 @@ static int pm8008_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	if (!client->irq) {
+		switch (pmic_type) {
+		case TYPE_PM8008:
+			mfd_cells = pm8008_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells);
+			break;
+		case TYPE_PM8010:
+			mfd_cells = pm8010_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells);
+			break;
+		}
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -278,25 +330,11 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
-
-	name = strreplace(name, '/', ':');
-
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
-
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
+	if (client->irq) {
+		ret = pm8008_irq_config(dev, client->irq, regmap, irq_chip_desc,
+					&irq_data);
+		if (ret)
+			return ret;
 	}
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,

-- 
2.43.0

