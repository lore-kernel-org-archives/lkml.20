Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960316;
	b=OEg2c6Ys8mpzX8aLINKT06EsFSpopqCgI33uEfZXno0GrBq74AURYadQpiZ0bkUtZKnz
	 Lkw/Gg2EY2KC6l8t4qbSalvug16VHUS0FOQBKXdUZEW1dJuozsHTuEty1r0ISHLm3YhaK
	 mMmqJ3yBjeOgbGv0+fnWlEwzWd4cNEkk5jgY+KfoJ6KADVlQL8JL1vRcVGQRMHxWzIuH6
	 7GWguvmBBxSo2JuoC31Afg7icVbNjVJ/8b5MC6x2E43K/PDYU7FV/5TsGt3WvH1eeTtED
	 fnI5IetfyieQ4kpy02ShuYfmTAlex3htoBN9ei3nYX9EYhLQ+E/R4ncEdARDK2SWTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Be2Qj5VPj3anKQUTdbqSapQ73mXLTFDSUDurM06zZss=;
	b=DhWZEx6R1TgKUaT0Of7aeZs1+ItO6YwtsH8V5W9y0GHwpGaanaQh4J6eb6QUfB0KHorJ
	 KiGUXQRsurPZGiDdmeuQ4uMQhhF4Wm502rFpazL4sqA1RtkGT5siG7Ht9xp272udN/PK5
	 jo8MlBUzNDeOic6If1mWQBL6Tr0eaAMvE4dml0M8ZNJ9ZY8dn9GOuX8yXBpRUBvGJPL7I
	 4Wrtu10/rpMYD2NpsefbJ776HfO5kKFInrvVAW8sB9RTkD6SqLU2karta5pl7bu0kO3pP
	 E6cTy2p2yGSgKtS3LTDTmkX0CbUrrdSg0DFGRkf3tu9VB0ym4Ala+UgLlSodGPL5A+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6aBLVdw;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD8606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FD8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6aBLVdw
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so3082767a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960315; x=1793565115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Be2Qj5VPj3anKQUTdbqSapQ73mXLTFDSUDurM06zZss=;
        b=K6aBLVdwCtDvNVXrUDErFoAr+HRy4mh7AvlIq94sT2SQL9nyA0N0K9H5ArPFI4co+s
         Hr62gpQP70mBYNeGejcjmoM+Cfj3qhkDcel7pq7QbZsdI0VbAbD6rDdyyY4kvpsHlHUv
         iyzeHlGZwXYYHFOqfgle5UBdOdTPCbKp7wAxs9Mw3zsMWCfZHMsRvOP2eVfXmTACkLBo
         lYLIOPAIRQABc4UuQ7pnKwWy378A7RpZE6pdLZ7SNuijZrhAmeIIV+RqlgtNgxXrBTlr
         GjuvAgHMD07GeL3Pq8U3S5MLlyf8PMp0+5yvMvFbjZs9lpzvib0qYA9zy8nH4IwyQayl
         RFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960315; x=1793565115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Be2Qj5VPj3anKQUTdbqSapQ73mXLTFDSUDurM06zZss=;
        b=OlSEbViuHHJs4zexNeALQaRi+XQioEuEy6Zf1ZTtkNhRrd9mf0/7DZDJbF95tfLRGC
         +C2L+oAg38rytrPLDEsT+fOPUmumuIjUMXp8co5cpEMHxiaYIYqJeVwn5/ZJFXyo+zhQ
         OwuW9wfcNN+vCCLNjaPl9Iy/ftmhFhhy0zzFqRa8aVEQZsi32BmuzHoXJE5kI2NU9EDX
         smtWULLLV1glMz4PTXdYW+zDPY47HkQQE2RdKq61fWG3aMrrb1R2aTFjNnryENxEp82F
         56rCzSjjxbeMM7eWi7A6+K5OAnYsmjZnWUw4UgjnBw4ioHjqv6RW3vBHidyHPdKw5JXt
         amEw==
X-Forwarded-Encrypted: i=1; AKwUvBxWvoCzLsvRadV7wbGHEV4SmI8gTY0yYFIl6DNiis3RF2g2Qy9zNVGkJpVEg69m3GhF96HvAiA773eyffY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjRBo7Egu3oWzrqQjQYDM8c01WEh1FXBsiRujVTNChCZY6fn5b
	4uu0NBlhJb8RJu/KXEx/x+PENeQe4jtShjbP5AWFoT1pPaQwucOKrqIR
X-Gm-Gg: AYBFou2cqd6/HXPewqmrQFpK1F6CMUEVyMWFTch+UIaq+rqCHQEt2GYNOv+MjZeXe3h
	Aj2ThBBeddevlOUxT0GhyGWuUu6xf6vwjh9xFITrCUpFiroAVMXAEDcSLZin2IJIQS8bsFGB1C1
	EyD3fRXBHjRuFNy7tY7IeFK2Q9Bfwrypt3cWGyaYaMeqY9HlBNA0xwLZMsCquXCvodbZZ6swe7S
	HXSifD9X2n6UFkTC+I10oW+zHflAL9MvyLzSJK2mw5S8euegpcmTB0Qp3ZeEzYwLv+Z9ptVuw0o
	cvlaHTIDkdcTaBserS8csdpL4SNBCtaNo5CxMLl8IsSp1nIhh4p2ei3fkAYbJTrHk8Q4aWRJO/e
	B0QfqgixS+gRULPcAKKFXzka/hytMbWWEK+dNRm3dTHa/NkNhBAHNO2+mLhDFtpjD04F0NqaK0J
	C+5Yk3xOrRkjmHbmicI7hkPdLRVnxS1PfwLwIuXnN2r3f4Ytco/c8H2awugXYlTPqIL3ViOnvag
	a49Q0Z5Ek6Pld3+YZhA1lBaKtJESU0sbHD6ohpCDWHiiOHE+QIsB9WCs8fNXhg5NwxJDaJdeJZl
	0U5nPT50o2OQAa2WhlWJbx++dXopoX+L7qQ3IM9fYAKIUZgpmK0FNU0NixPDxebgQmBuYyqoF3s
	ovPLH5ikOOVCvDx9iSLW3C5yJLLH5uUUUkyOOi6jTp6ug
X-Received: by 2002:aa7:d286:0:b0:6b3:8018:7643 with SMTP id 4fb4d7f45d1cf-6b44300a8d3mr4496308a12.45.1792960314732;
        Sun, 25 Oct 2026 13:31:54 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595df8fsm2802175a12.11.2026.10.25.13.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:31:54 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] usb: typec: tcpm: qcom: fix connector fwnode_handle leak in qcom_pmic_typec_port_probe()
Date: Sun, 25 Oct 2026 22:31:51 +0200
Message-ID: <20261025203151.455062-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qcom_pmic_typec_port_probe(), device_get_named_child_node(dev,
"connector") acquires a reference to the connector fwnode_handle to pass
to_of_node(connector) to devm_of_regulator_get_optional(), but never
releases the reference.

Call fwnode_handle_put(connector) immediately after
devm_of_regulator_get_optional() to fix the leak.

Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index bf985efe1..b89495315 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -728,6 +728,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
 								   to_of_node(connector),
 								   "vbus");
+	fwnode_handle_put(connector);
 	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
 		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
-- 
2.56.0
