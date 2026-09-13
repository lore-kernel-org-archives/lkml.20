Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB054341660
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311575; cv=none; b=Zw5v+3WNdTEKQekpgy78iyT1Brp/2Rebt/RdD5UJV1HU9vxGe8eugoJex+DMb1kUl8QrzMSG/L2QrM4/1a7MLuBrUal8hPxbeZwzpFFDtrVJ9OqTXxfjYKGJVhs3HuwTs6WBJIFc+8doyEyhtuU1yenzV38UuJb6Jqi7PH6bk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311575; c=relaxed/simple;
	bh=mLKbgQtKfNZH/MukbGyy0RqhzRY81GCD/PEfQFLWI3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMR39u3cjR7aj++EdmUGVzE0pTkDVC0nA8dWCVwlJSrNIpBjf388W5M17L3kTRFsWpXxUJXtKmptDGNC7yqtu5/HvPkEz6C2qWwqKnvxgLrhg19ja1g2JfCMkPPTKxNA9lL/ttdrReJg4jNdm3Y3a2owELv9LJUvOeqifEUYZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jb2L7w0M; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jb2L7w0M"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1243049a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311571; x=1789916371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlgimeCT04wK/VVZmKrnlafua+eQjTo1OlyMX75Ktyg=;
        b=jb2L7w0MsQKMULUFtG2bA5zGtQbb96dngYd7gZ7psaP5sEg4Y5BU10g4wTit2RCLU7
         jp2LrG6aP2BsxoDgpegEXHUOz6sAGOn7BO7iZurAyiB8bTJGIqwWN16ZmG/74Uu947Y4
         r32S3AskI8PkejxoMsO5IwCvPw3LW3nDOnyQG2RLeL6PjNnbg2x3uP+1A3NazCiteLEZ
         sUp0SsG16YW1nWKZkFyTeOg3LOupF3Gs5jzGCDHbFYLzA9kC6Fq9HtwOD8nJNDRQ2b+/
         RIWh7vJpK3D7xRGILCf0MjsqUTVCfOsravRKduG1IjzR8qAnF5aBpQxWVPVrvcVMdIO1
         IdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311571; x=1789916371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlgimeCT04wK/VVZmKrnlafua+eQjTo1OlyMX75Ktyg=;
        b=gnB34o0NPkqrMyYo9GZYnCUd7vMggPilMPq3b7HMnPoJfBPfuhOx7O730rXG9oHGho
         1AXcipdBiUNMlq2GSVzsWs+AlYBFlsMsIxHVku0PRzpCz2yOb7pCF/4IJu4eGcyCkCoM
         KfomWD0qW5Dd17gDqYO24FQlIhJd5o1bULwh1hAwU3hfEr+01/LlrgzmbLJRw0SIKtaA
         xCcZ89dTiT2rls2oTtOLJHvviQd/9l1bfHtlTr0U+P/W1UHfpDiAm+wqFduggfYo0+Uh
         wvCRDM72aqfp2jcQ+YNX1BvIwA5QGIQ12jrUI1xth/Nu2msUDLZOvygYkVM35Bdz4m30
         h4yw==
X-Forwarded-Encrypted: i=1; AKwUvBwbAKF1FOErXlVgKeIpXDRQD575SgOy10OMFPd8/zsx2xzMJkHIx3M9yD75lSE9P+mO2B2QTMJ+J6DK5SY=@vger.kernel.org
X-Gm-Message-State: AFuF++m0ccdS+3x4YjbZNaKuIeu3DI2K1wNrNjBvKxu94fGyLiYnsNUI
	i9DUm1nvKCirHytb+xwjqkvfoh5//wv3uNXkbYo6gKqmgnJmee1Cf77P
X-Gm-Gg: AYBFou0bHHq5g+2UM8GOMe1v9RO0ud2PYBfLWrYxdS7E4nbGNQ7Cp+CcSeb7tWBh3Cd
	W3PZAiCLOOcKT+R64pWk0tmHX5CBm7TNbrvWqXKA7RJ9UDvtLfHSPbcTnECuL2KufbBBNGU7Kii
	5bZpVFD9MS9MPKWII5vsrebwEjGaa7dKEjoSe5jPj8SnFtBum/j/GADSedVM857Fg2cDk+wEzj3
	Y1pUyakj1M3aOXyo5NLxcA/yg4W2hsGqm/kjsTiPOVJm7qf6vZXl45Vu+1Ypl37j5kHP4UcMNfO
	GdFRFwGiTgEaNx70UOkOKwMI1yUSX272LQLXug1GxjWpmesWyzz98UnMgTTUije4HERxY3tI+Pa
	J+dqIWarMzrRh3C2viqsyXC27/ASADNHRoVrN887WaqecT+UFBf/eknJW9wBwLxs6dUFRw1Hz2r
	auftJQ6/0Jj+gM2jq5nqHyJSJ/QoO8U+XGm7XbrJr6n4AlizCgZxJtDFSiNIsAR3uUy+hcJNbp
X-Received: by 2002:a17:90b:3c03:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39d9c1db154mr25881100a91.15.1789311570670;
        Sun, 13 Sep 2026 07:59:30 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:30 -0700 (PDT)
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
Subject: [PATCH v9 2/9] thermal/drivers/exynos: Drop invalid IRQF_SHARED flag from TMU interrupts
Date: Sun, 13 Sep 2026 20:28:30 +0530
Message-ID: <20260913145905.9404-3-linux.amoon@gmail.com>
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

Remove the IRQF_SHARED flag from devm_request_threaded_irq().

The driver requests a threaded interrupt with a NULL primary handler,
which requires IRQF_ONESHOT to keep the interrupt line masked until
the threaded handler completes.

The TMU interrupts are dedicated GIC SPIs in the Exynos device tree
configurations, so there is no need to request them as shared
interrupts.

Requesting the interrupt without IRQF_SHARED avoids unnecessary
interrupt sharing and matches the dedicated nature of the TMU
interrupt lines.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index e75040222ccf..825dbdef0b9a 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1078,8 +1078,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
 					exynos_tmu_threaded_irq,
-					IRQF_TRIGGER_RISING
-						| IRQF_SHARED | IRQF_ONESHOT,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					dev_name(dev), data);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request irq\n");
-- 
2.55.0

