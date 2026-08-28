Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3683C1400
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895418; cv=none; b=HATcPTLlKR7knHs3sHD6O5tC6qj10nDSY/ohESUTaqnpJspjyjLl9yAnXcCiztL0WDNvAzv1aOvbiO629lI/WGXZIUBJRJbuaSD86T9RKG+Ys2cQ0Zh54o0SdISJxipGBk0Bfspw+qDJpUwczcamzfMNLkzexrnpjL98JVHVXH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895418; c=relaxed/simple;
	bh=h9WfLuWGKcerM2wWkrGVT+9/+JdZZk4v06cpnrS/zhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W70yi0sA7mEnOXcNT/uyQZoZ7LOTiAokmhwx6Tiisv3ZvV3354nc9zoG4k2ZkBdlYrt8cQ4ErbwDpeV3rfK9bjr3lfe056rpKXau8Pr9oiy+ywTq0uyGvnIPEgaSvNhiOd83OV6J0CCo9eC9e35waxX0gy82kSb6SDMqUOaQw8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eCFHy8du; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eCFHy8du"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f96c5b722so319882f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787895413; x=1788500213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKnm9/fmrIQX/p3UdIJ0P7OVm8nkpUuAfCjDFGGmEKs=;
        b=eCFHy8duQqW9Nw6tj5JCp/3ibe6/kaiGlyks4jnM1AscOQS3dAHKGC3wsoJerLmUza
         Z4xzG5GuO//IB5ttdKsG4oI/PyWPZUr5EQPP7CvR6tQ+2pfuk3DIpT4P+/ixI73icmic
         5NiH4Vezt9iIG92QAd6rGJFLFumVvEwlm3mUPHNf5k3yTdldcyWqShdnlsLZMcNUkbjC
         +mA5ZxtNQ2xncn12YPgaDyiIqxgPGRGVqarIRppEe76JqnAtLHJQe4wLA+nLgA99xete
         2zLF+ekBKMzM7s832JWB3AguSWCN1X7/osZhwnoBBxxe05GYgXLh3Xl56YfMlZFNEVyu
         QC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895413; x=1788500213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKnm9/fmrIQX/p3UdIJ0P7OVm8nkpUuAfCjDFGGmEKs=;
        b=QYx1aw48JqBuRadctDk2LiECKCZ2UMrYP52hSKFkAg1vN19xxHHe/tyWOZl+cs/n66
         Uby5CUOees1YzVbKjgyeDucMyugYa+T/5svqzC14yD1rnD/OdEC1dGBnyrUdJyZCFHTp
         r/l+8utvcbdfAkQL4ji5+Zp7LK0S2hQDEAg4hhmMmLHN8nk+gvApc9L0TN/WrtXm/9YY
         24oeJVXryxNf+YdB4jD5/9wGiuHGKp8R6rvfsPaBrT7a04H6j3C3IkdTLSsL+Fi5BnFN
         sDN9enrT2jGwahTqB9eYc5LJQYdvg9vJ+F/pD9+hHWm3d5d2zG1yrQ1InifNkBcNb6nG
         qcwg==
X-Forwarded-Encrypted: i=1; AHgh+RqBB/BigmViAPoEJI0f8vf9u0iPP3hYUhOdwIudvd3d0Izbp7gtdTniNxJqvhJePtMm5Th/L29RAOpJ7WA=@vger.kernel.org
X-Gm-Message-State: AFuF++kwH3lyUW+5sVhxIClpopPIdvBvuJ5evvRk8PiPyKFdtGkAGqv3
	IuX4LhbhGa5wyZHOJOPYy+ILGAqfNWksMphH5i4glaE6xwmg0wwi3OGn6jsyvPMWtcc=
X-Gm-Gg: AR+sD11Kyk8/9dlEjE9qSwViwZ/o5aSqy5Myr5nQ3zNejm693QMLnHN0wpc5BKtpCod
	X9bcVfkqYiwim+qcD6XV8pEjP99qmV3XgVrcuayNiDGSUhv3wFut86S9CMoqYvFhekvP0IvPkBP
	OVNLZaNX6v0T7VafMy5BFCkGBiNSihiuw5RDCiXX1y/kRyO887KsfixtI7Xrn5sFU/8Md00+LzZ
	xj60F0q6nSl6gt0F9xdhImv0pfQIUHT1dn6DJneQ12jsPzIsYNi8IV4//7WwAZ/c5SURR/qHh4r
	bDOFlmPggr9IVcF9iRdOeUNDmpoqS2RJz4rd63y/FkNvyvJq/GSLLU5udDC+FZmWgmX95eOtQnJ
	PyPxJIq1s0G2sXfP1tRiliQzP3EE6tMC9Ls8GDfj+Cebn8UjB6uOaFMX+QHwk48KX5OuYSybkrp
	XXwQ+G0G6jWgOq6eByaPRB84d6n6Lu0oTW0x5Xex1pQAcCIK9BRyn1+QPPT/OIsanLKFt0wyxgc
	gb6DOKX3R4T0F/JlZe45sg6j0XSdxuIXW290QyOD2+QgDsfjAEk
X-Received: by 2002:a05:6000:40cb:b0:482:f0dc:e647 with SMTP id ffacd0b85a97d-482f79f3328mr4351967f8f.21.1787895412837;
        Thu, 27 Aug 2026 22:36:52 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm1410402f8f.10.2026.08.27.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:36:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 28 Aug 2026 06:36:46 +0100
Subject: [PATCH v2 1/2] soc: samsung: exynos-pmu: fix use-after-free of
 interrupt generator node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-1-06bce6107bd6@linaro.org>
References: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
In-Reply-To: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

The setup_cpuhp_and_cpuidle() parses the device tree node for the
interrupt generation block via of_parse_phandle() and decrements its
reference count using of_node_put() immediately after fetching the resource
address. However, later the intr_gen_node pointer is passed into
of_syscon_register_regmap().

Fix this by declaring intr_gen_node with __free() and removing
of_node_put().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index f5fcdde9750e..efccdd63e40e 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -409,13 +409,12 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
 
 static int setup_cpuhp_and_cpuidle(struct device *dev)
 {
-	struct device_node *intr_gen_node;
+	struct device_node *intr_gen_node __free(device_node) =
+		of_parse_phandle(dev->of_node, "google,pmu-intr-gen-syscon", 0);
 	struct resource intrgen_res;
 	void __iomem *virt_addr;
 	int ret, cpu;
 
-	intr_gen_node = of_parse_phandle(dev->of_node,
-					 "google,pmu-intr-gen-syscon", 0);
 	if (!intr_gen_node) {
 		/*
 		 * To maintain support for older DTs that didn't specify syscon
@@ -431,8 +430,6 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	 * syscon provided regmap.
 	 */
 	ret = of_address_to_resource(intr_gen_node, 0, &intrgen_res);
-	of_node_put(intr_gen_node);
-
 	virt_addr = devm_ioremap(dev, intrgen_res.start,
 				 resource_size(&intrgen_res));
 	if (!virt_addr)

-- 
2.51.0

