Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757FE33EB1A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311595; cv=none; b=BInG7ziFkfaoAQiAeM3CoKtR3XS7Mcguco/eBB/ibz9B5Y1XSP5IaHNvlPeOq1IfhjkyQ+dj90iSuuQdz/dLZntBpdAhf++6kGA/zoKD97v1zr1IysXJWAXooum8vxBGORMsECilNHIyjPSMlEWWulqI5oMIlouB8vLuN7Z5tVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311595; c=relaxed/simple;
	bh=QU92jHTgyoOrjhQ/jU9kAlPGDiTL57NK+D0wMhaXJLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqAwDcGDsiFP05mLX7VAQuFLogTP53T+Q3+fzvITigpCwlVAbB4fFy0WIRTAOXpHPBFRPT6d5NRxhCmqXkrZcHnGWiLZ/32okEi2K0IKBr8VZFdnsb0jxTJ8taVixGTd+5BK7P/5XD/uaeAqCe+um+zLI5qAyCu7A/+okwN2wUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJAxRh73; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJAxRh73"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd020a2e44so22232285ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311594; x=1789916394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4idUXl5Bb6HMJGTVQ31rHFIN8Up+7p6vXg8EYrcuCCA=;
        b=GJAxRh73fO2Cy18i+GdKTL+GSd2QViYMTqtuosuLT9bXaKZaO/wbMM6wmbDHKgMsC+
         NMUK0NJLQ/h8PuTBXxCQEug+cN9H/el/1KMr+1nKgehQXOGPMHk+C5SkmONbx0IocSeT
         h/ep5bkaLlJPMtDnHqoxF8m4fXgLhPV4BB5OqHm082JCi7MGo4DIhbw8eGX7GRceguQ3
         k8J0vpoiqwSADFNg09kwmyXoS+Dvf4nMPYcEUl7rFTYEBLXGflC1FEiXKs+AJ0VXcRBa
         drifEYkRmhrddF5uGY2FBC0DEnPYpVQxO2c4wr75sHTy8KL3enre6yWylbrQtySWjObW
         en8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311594; x=1789916394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4idUXl5Bb6HMJGTVQ31rHFIN8Up+7p6vXg8EYrcuCCA=;
        b=pBSIpYD3uG1azisWxAJydkWP8/i3sewUfrdM0Qcy9PVrj3UWlvUCrmf+iiSevxrKzK
         AlwxeeBeaLwIPeQBapkRB9LOrAHQ7zPKQ5jpgPUznxunMzjmZADCN0KeR3UwjrXTwHiN
         Dmtf9HnygqoR2ye7lc8OIx1Lw+8VXUdCvXS+o2urQJb9I27hVZ016jJvxRZs245mlBa1
         OUeYMT0k+SOVDv7OYUcLccDyHuUtJylXWAvF5j4jTvmVqe4m9iAWHoYpwqRs0c4uYele
         seQpEpH0rIxAiop7zT29W0kl2UgcZLEHyOvZaf8DNrqZERy7PvL2xXARJajhdBAgdn6H
         a/rg==
X-Forwarded-Encrypted: i=1; AKwUvBxJhZYhFEQC6TYyebOLZVgzeMWfKWXQrS4Bolg+s3llQAI+VVWGT8iGcFx/2H89an6DCc03z0tQdzC+wAs=@vger.kernel.org
X-Gm-Message-State: AFuF++mmFyt9gHJjk6FO/KvMMGZOCVeve+0F8u/do3qg3NXKxEdyhTbp
	fgiuTFE5yebFcu8vnyABG9vIfA7Nuwgm9QMno8mxYZzF7e7wrLvBwr2a
X-Gm-Gg: AYBFou2nOxOtleqKRXSMgPpQqPQuq4Y66xEwfilBKhHYaMhgCqF0xmfqUUziKvseQBg
	e28y5ZUUUyUdX+Oi0AXi7vJ8DIxu1ActMTK0FIuSFywbrXz+RGVg5NZuReLSgz4ziAapkb7Q5Vb
	p4IPQ0ZrgaB6MBZXzE42YkyLVevbUHDJjle5s2+uC+LCNICSaTmiJGHFSyNSF6kvI4nN03DSph/
	GzapS0GBo1k/yXWx+IHZtODyk26Mbm2cFHOrscIMTzYWfnvqYfrv9LMmO7KVHjwLhhCzTHir2Cp
	8cnYo1nWEyOwLVsWIDrGiYlaoWwhTClRrC3suh7Db6AdtAaFpCuS+Hl6QKj15TV8MsuWVpAKWBj
	daNYFf8acG/VgVtAtnHkbRZ7vzsJC43wLJGLFR/eoPEdRD1Mef9MHaOyxD6Q4SxTEeB04PcFSUa
	TcOrrDHatPJGlK7dAQBkuR34tt6n6hFWKaXBWg/GRmTD5hGzjKdFZxoXin6gBw1Kv1Lo3HywYH0
	RWZxwCU/Bo=
X-Received: by 2002:a17:90a:da8f:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39d9bc10072mr20891195a91.6.1789311592428;
        Sun, 13 Sep 2026 07:59:52 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:51 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v9 5/9] thermal/drivers/exynos: Remove redundant base_second register resource
Date: Sun, 13 Sep 2026 20:28:33 +0530
Message-ID: <20260913145905.9404-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos5420 TRIMINFO register can be accessed through the main TMU
register space, so a separate register mapping is not required.

Remove the base_second member and the corresponding second resource
mapping from the driver. Access EXYNOS_TMU_REG_TRIMINFO through the
main TMU base address for all supported SoCs.

Also simplify the triminfo reload handling by directly using the
appropriate reload register for Exynos3250, Exynos4412 and Exynos5250.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 39 +++++-----------------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index a38b48e2236a..82cb4140646a 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -139,12 +139,11 @@ enum soc_type {
  * struct exynos_tmu_data : A structure to hold the private data of the TMU
  *			    driver
  * @base: base address of the single instance of the TMU controller.
- * @base_second: base address of the common registers of the TMU controller.
  * @irq: irq number of the TMU controller.
  * @soc: id of the SOC type.
  * @lock: lock to implement synchronization.
  * @clk: pointer to the clock structure.
- * @clk_sec: pointer to the clock structure for accessing the base_second.
+ * @clk_sec: pointer to the clock structure for accessing triminfo registers.
  * @sclk: pointer to the clock structure for accessing the tmu special clk.
  * @cal_type: calibration type for temperature
  * @efuse_value: SoC defined fuse value
@@ -172,7 +171,6 @@ enum soc_type {
  */
 struct exynos_tmu_data {
 	void __iomem *base;
-	void __iomem *base_second;
 	int irq;
 	enum soc_type soc;
 	struct mutex lock;
@@ -447,23 +445,17 @@ static void exynos4412_tmu_initialize(struct platform_device *pdev)
 	unsigned int trim_info, ctrl;
 
 	if (data->soc == SOC_ARCH_EXYNOS3250 ||
-	    data->soc == SOC_ARCH_EXYNOS4412 ||
 	    data->soc == SOC_ARCH_EXYNOS5250) {
-		if (data->soc == SOC_ARCH_EXYNOS3250) {
-			ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
-			ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
-			writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
-		}
+		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
+		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
+		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
+	} else if (data->soc == SOC_ARCH_EXYNOS4412) {
 		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
 		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
 		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
 	}
 
-	/* On exynos5420 the triminfo register is in the shared space */
-	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-		trim_info = readl(data->base_second + EXYNOS_TMU_REG_TRIMINFO);
-	else
-		trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
+	trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
 
 	sanitize_temp_error(data, trim_info);
 }
@@ -965,25 +957,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 
 	data->cal_type = TYPE_ONE_POINT_TRIMMING;
 
-	/*
-	 * Check if the TMU shares some registers and then try to map the
-	 * memory of common registers.
-	 */
-	if (data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
-		return 0;
-
-	if (of_address_to_resource(pdev->dev.of_node, 1, &res)) {
-		dev_err(&pdev->dev, "failed to get Resource 1\n");
-		return -ENODEV;
-	}
-
-	data->base_second = devm_ioremap(&pdev->dev, res.start,
-					resource_size(&res));
-	if (!data->base_second) {
-		dev_err(&pdev->dev, "Failed to ioremap memory\n");
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
-- 
2.55.0

