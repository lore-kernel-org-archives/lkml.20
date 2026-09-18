Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AFB5187F0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749842; cv=none; b=owgXUvZxwcJm2eApFaKVdyBsZApjyAmUbBQx+RULB4JV0dtL6Eu5/tdl2HB8z5aagZkkZaEqRDch2VSQwwFeAPotwO5LXHWvlt6fquOPZttAewWpxH6ZtpM70hjpieI6zM8twJJAHSs66gWNDCakT71FgYw+17+v+yVKAh55EIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749842; c=relaxed/simple;
	bh=6TuCysntbWLZmZYplZzvcQ89wL4jyvz1jjtnZ5NVDWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EG0z8vYnuR3od9o2X8N8hCQ5nrNR12a9o+c+AvxhX99M16g+2We1wvFJn2Po54KBwgfpg61bRV+iUCj4CS3mAPuBhm80bdwrNy4Cx/55HssCSJ+1MocGoiU+XnoImld+vregoxa6Enh45qdl5kmrgQImORdWN3FeQ3cuhg3SjKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUQVLWrx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsuPEEPX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUQVLWrx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsuPEEPX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOVaP215588
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rHc3jmH9501s499HUccFgDkBbylj+aDs/1Ow3J+YeoQ=; b=eUQVLWrxH/vxOiFR
	Utcpiy7vgRH4cynfrDTBcPDzOXok4CPTr5yj1lpzrcCESdMkAN3Who1uCr8EYoei
	WSaMep20zluJ8nD7fQNMn6iAeLst5eW2ViQ49su7k7MohuSMwuI8/+DVevVJJwlZ
	W2uyvAC/6pGIm0kBqEhtBMOE8K/Fpr5pp59ZPSxcMpMt0FR2lqPVwnUiTTr+JYjb
	a3jMIS2xygtan5eF1qWojJDf//zLGNp67cxZ97LgvGgBdxPbYF2gAHS+zywwsG/O
	8ilMBdqnvog5FKNj/fuL8y8nBmCH8cLX+Ks1qzxm9b6lXX9dxdYh+2HgAKS2GQ5I
	paZ0rw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdv6ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:44:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so22695845ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749840; x=1790354640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHc3jmH9501s499HUccFgDkBbylj+aDs/1Ow3J+YeoQ=;
        b=HsuPEEPXnbAsSPlnXIJESN+pNgZo1orlE1oT7DdKlLH73tllTirT5nc9MBWzHPolpQ
         zeQ0pkcSGOBaYlbRE2pbeSgJmWARz/3Gu2aQhEBS+xhGwYxipAxC+EHh5s6UWpozxNcB
         phy/tQyy9ZtY7ld2xfszfjbReuSkv6s8Eql/PiqiOR+8zrOJS1RjfrL131eTSsRS5rd3
         0Q1YfLiHidxHL07DYrl1p25KGtV18sWgb9EK59tiALLdZz9rLZCzC5srBzyCmip2Kfqy
         19OqRF2bzVfGFF3A5nUpbA9aaSu3QlWKQU9yuDZB998drfzkyOVi9AdVmEnXa/eY0B1x
         f1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749840; x=1790354640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHc3jmH9501s499HUccFgDkBbylj+aDs/1Ow3J+YeoQ=;
        b=j1JnUCu5yFN2yi25jL9/nvMr4zDn0zNWfLSKj2Qst+7lCWpS0GkPgxwdtgy9UcaX2F
         2BgTMMW3kOEn5ZRRr3D4PZYbSnrteELyFEvNrHgGcvgLKIp2qSbzYaH4lSnJEqLGuwCw
         VcNfyuE0X5DxQY6wvK+LrLI1o0bUfqG6TCJyQGW1SABmoPJi7qgTsu6w78ioZvAb8d51
         zIB+1SiNtfaSuwaBxfK3FD/RBUaW4cQlsRRoDXbL+fQPRtBtgrAbVIYDh5ScH/TeTnNe
         aKl6DgYUBh/v46otGXFpO0R2crEMUdqRvJtTdHpfxNUka/Ga6Y5JtY1GCBqWTVojAApg
         OWNQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2mob2JWxs78A+hYUNUpkbdATzrAkSHh4VXLATXwqke9L1IzybN7Z9MrMNpALdLHmXEj1FPheW/1kxKG0=@vger.kernel.org
X-Gm-Message-State: AFuF++ms8GHMeieF0R8Znb+TCm9Nzc0XQ9lJuTW+KLdYR0J+4Fvlf3UB
	dqcJhJ2DWISLp5Qin7Xf46xEYIFdIcnssNeysKoMmXi/OTT3hSTOozQq9j5+wG9ygmdSG4YlK8h
	fN6D6tXmYBQ8aJQwU31EBT/nfq86xNOViUCzL28f3AqQEZIdsvDBcUFabptLypLMHHPE=
X-Gm-Gg: AYBFou2yUA6ep0vWRk2Kz0MnfZQYabpxSkxCahb7yCV0BKtR6b+DYdr6HVEh3UA8PgI
	q5WQ6zt4/hpOX0Yj8bdt8cjGbBpkL5xYXGD0wB23Yyq+p4ySjesggHzmI4KWA/Z7p4de/MkjWfv
	MhVbqaOr3fzr2L63ZTTrSa3ubG2MfBG9YLFbtb8EddGMjytPHA4zSt92SJP+BgQg9QTYD2KagfB
	TP8fgIjkzb4NedjOfF1eeBb2125dU/EfYkQgipAgbUvGFyLnh0d/BDEzPUDPascxMZvQYijVs6g
	wsgZ0hFKKcM0X80dGEC+PUZ6DuDrUuMSPnku/Qqyej1UJF4xJSzP0yvW5v5W3qGZfFw9JFpLaI8
	y8EUmELkzfhY5htQi9w==
X-Received: by 2002:a17:902:dac5:b0:2dd:c100:2519 with SMTP id d9443c01a7336-2ddc10025bamr2589765ad.34.1789749839453;
        Fri, 18 Sep 2026 09:43:59 -0700 (PDT)
X-Received: by 2002:a17:902:dac5:b0:2dd:c100:2519 with SMTP id d9443c01a7336-2ddc10025bamr2589465ad.34.1789749838928;
        Fri, 18 Sep 2026 09:43:58 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:58 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:50 +0530
Subject: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=2909;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=5Yca1qyIZcBlbgpfZoFyilYL65XMLuzCTJFN98C2W+o=;
 b=ncxS/vdpTtWyvH8/mj8iVyzXI2Z9etz9JDpGrrZHRLP/dovy3yLv2nHa5TftnMc/wu1QPxDr6
 w0hbGIf+EW7B89ULsIJ88ywvTydtMgoGfduBqYLZIJFrgnQURGdMAXU
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX9v1hARx8uppr
 4fVy9D1KDSVfLOB1wQWO8yfylKtK5liUjboZz06Wt61MUNbIm9b8CERUmkKplPSf27w0AleSmSI
 YwM4Xc3Wu/y/hOOJOIpnGAkA1wnFtYxaHz7k0+RuPUDL/F2x59ux1rNkH7r0rlpE7Q8Jthce+UN
 N4NbZdJY8/DG8xbwv6xZKvimhZV0c6i/N+M+A+JxCE6J0B3EEKlJJQTjn7HH7UsKFqgJzwcEXYU
 MaIFnFSPFAx3eIeWmWsFyWm/mAnYcx60oKHIzO5VtL8OwrdpaMKL6DTQRCJ1NNKnr7EpaWaIR1P
 8U6u9cJ73t/kcpWC3NquW/M6YEn1HuVV7nAnmvenQee5s9ytde+4tgf5VCytGugi4G3c+Ufcxu9
 6QIvMWqwnBa5WVrn4ZVXzOuZM0wjIk/yAiNVQV9ZGeVFpjBHG5CPSzaocsqQAmEX33qVu7kXXmG
 uz5eKP2VbyqqOSeuAeQ==
X-Proofpoint-ORIG-GUID: AXlIx43RHdSzBh-sArlRg5PGkAXp0eVn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX9DyjZdHgaIdC
 iMuEVCjcYlwFJEx8sCDDRovbba5LM7AbzkbDOT33QE9NWpklIvv6R1odzyTWf2Y1KaEnE6EEpjw
 vD0i9O3lSidJmK0GF863ig2ZBsv/TJA=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad6a50 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mZ3i9vGqhTwK5z6FwQYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: AXlIx43RHdSzBh-sArlRg5PGkAXp0eVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180238

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index ed656f0d6df2..77e4f6c04ac7 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -233,7 +233,7 @@ static void devm_irq_domain_fwnode_release(void *data)
 
 static int pm8008_probe(struct i2c_client *client)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip_data *irq_data = NULL;
 	const struct pm8008_match_data *data;
 	struct device *dev = &client->dev;
 	struct regmap *regmap, *regmap2;
@@ -277,33 +277,36 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
+	if (client->irq) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+		if (!name)
+			return -ENOMEM;
 
-	name = strreplace(name, '/', ':');
+		name = strreplace(name, '/', ':');
 
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
+		fwnode = irq_domain_alloc_named_fwnode(name);
+		if (!fwnode)
+			return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
+		ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+		if (ret)
+			return ret;
 
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, data->irq_chip_desc, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
-	}
+		ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
+						      IRQF_SHARED, 0, data->irq_chip_desc,
+						      &irq_data);
+		if (ret) {
+			dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+			return ret;
+		}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
+		/* Needed by GPIO driver. */
+		dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
+	}
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->mfd_cells,
-				data->num_mfd_cells, NULL, 0,
-				regmap_irq_get_domain(irq_data));
+				    data->num_mfd_cells, NULL, 0,
+				    regmap_irq_get_domain(irq_data));
 }
 
 static const struct pm8008_match_data pm8008_data = {

-- 
2.43.0

