Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFBB471258
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249031; cv=none; b=OUoJ4D9zG5V8jC2QyzJldBMo7qExPxjwKHIFZLfWMeh6pMSuJlymjDYgdBl5igJ59JTZTKRNj/3UZ6YLGCADevklimSk4FZMle7onXI86QwkozQCd2GBwun8Ceig7JY4WMO9CmuzSI6mURU8aE9NJfSnXRpKGHruPGmeS6OpMbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249031; c=relaxed/simple;
	bh=gWeyuG+w8bqJGqJ78i+dxr6OjbBp/qhzFx2elgd5rgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3yUsbYTByYIbbuDCATAe96rgABSRHo52/4TjWuVrYFxGLIxt8v8/a88B/Ld/pIIuy52G7D3nAwxGZbOqj6TnOIr+Q7XhEduA7MsFZExPuZRwX5GcBAccmX8AKPG4tZOM3KyPz57UatdSyI95NOSbPAcn+o9JXE9HXDg/MxlwPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=paJVeMxI; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paJVeMxI"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so780798a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249029; x=1790853829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXQnRB/nHO1IWYbvBq2662vmfOoejPsA25AzXQKF5g8=;
        b=paJVeMxILrCS+tGmVi3PfkloVez4y8QtNa4z1WfuJh2Pp+VpvjuwStzGK4PhmIOi7v
         9Ey4JRStKLnNbX/V7sPPBF5tJ72Qo49KNqZhv35IhYdFFSLFCNrH3XoPGP1bLKmhIoiX
         rMiDNxHwwvX+2vQJICAVMyNK4NL/afAW60g8vEZGI1WtQ3rn78OAjQxPE7fp8g4Gsp6O
         vGfzw+7jJEN8ZlF23t8IdpplNLxTky2iuk9GemN1enzzyoeXFApL0nYvI354ytCGtCIO
         wGhvXE0MrQ9iEK9RFhZdSqv/nTs92jcvEHbtTzkrgCO+Vnfk3/dp3LbpjKyisaXqkUuH
         5nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249029; x=1790853829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXQnRB/nHO1IWYbvBq2662vmfOoejPsA25AzXQKF5g8=;
        b=F+NtwSb7m+HIFszdhIe5PJfJOvlFJbDNWvsd3hnD6jqD9EvoD8OtrzoOi1vMP6BLEZ
         AvEp2kU6pOFw3F2qgk9Oryo/bPgGYmpC4IaINLjkr4deNhUOf6mLESdJKNcgZK1iV51t
         RyMdYEOGehmhHv8OMcrSz5XxHHOTaKWQ+zpofeWt/zt6KqobefG4sELp083bQ/inrgbM
         fz2QtVDGvIdDL2hH5onjoKDZMye1upj2eLqDXHcCiiA8r/M9rO9cz1HZ60NuEIKniFBB
         psTSL5YALkj7lzJIBquE+XErgYCod4RuGCNC9oJOB/MgIk5up94rGDtaK9k1THpTyFDh
         31iw==
X-Forwarded-Encrypted: i=1; AKwUvBy3gdcKFpRyDD2+yYYT/aiwHq1BUfzv3FZNwbZ6Xt7l1ZfmCRDGle4NFbkUmO33Wg8r6EO8q42E7qGOKJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++mqRoXD85YKCzZVJy578jZLdEH7Xa9YSOpJ+UFKIbw1XH+Iha1H
	/XVqO+m61ucHYLmYqtE/mRsQDyU49JocdoJV7TBMyZCTkQiC/5LOhrUV
X-Gm-Gg: AYBFou0UYfCn5OeS5Z9VblcoBXqEzMMUO7f4MV3m/doF2JFwX708Qbq+em4vYulkrsY
	PQ7GbjIpChMRgHz+j1HCFiMvK8Dx1uSONGS0qzaTseT3J915z8yyHz3DEfpKFLlfx3LF3IguSDj
	dEoraElGXC/D6AfXFHG23ClAcvQLUo7c7etLvJuUM2rqIhyAgA9hSj1EejyWZ+qkxQAxG3mibNQ
	V1DVMtcdW6sCI5OkIIY9MmVXQCbgHJeduqFruE60Hk30rvpBOVQiQqDNHqYqTLtNWSYlD9h9cDq
	1EAJUmKPro1l6jYQKanUpaRcSqHa7ZFS1VjdXadI36eRuU8yTWi560iEBUFqRueCWYeV1SSjowj
	64MUV3Kj4gU8ebKg4h/k2Z5tay+lToUFad7UG7p0JhLfWkRQrMN3McCf9Drz6hPM93nLXlyxryv
	PotCiJiKIJRQZYek/DSOfw2pTyGr4BnuFWh3Qb9UF4mBnpvMEiUEezdg==
X-Received: by 2002:a17:90b:2e03:b0:39d:e1da:81e5 with SMTP id 98e67ed59e1d1-3a09864ac91mr1422278a91.11.1790249029396;
        Thu, 24 Sep 2026 04:23:49 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0813318c1sm3586800a91.4.2026.09.24.04.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:23:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	jon.lin@rock-chips.com,
	bcm-kernel-feedback-list@broadcom.com,
	noltari@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH 2/3] spi: rockchip-sfc: Clean up runtime PM on remove
Date: Thu, 24 Sep 2026 19:23:28 +0800
Message-ID: <20260924112329.1566051-3-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112329.1566051-1-lgs201920130244@gmail.com>
References: <20260924112329.1566051-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rockchip_sfc_probe() enables runtime PM and autosuspend before registering
the controller. After a successful probe, rockchip_sfc_remove() tears down
the controller and clocks without undoing that runtime PM setup.

The probe error path resumes the device, drops the temporary usage count,
disables runtime PM, marks the device suspended, and stops using
autosuspend before disabling the clocks. The remove path lacks this
matching cleanup.

Mirror the existing error-path sequence in rockchip_sfc_remove() before
disabling the clocks.

Fixes: 8011709906d0 ("spi: rockchip-sfc: Support pm ops")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/spi/spi-rockchip-sfc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 662a994da60b..6e1c7d6318bb 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -747,6 +747,12 @@ static void rockchip_sfc_remove(struct platform_device *pdev)
 			 DMA_BIDIRECTIONAL);
 	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
 
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
 	clk_disable_unprepare(sfc->clk);
 	clk_disable_unprepare(sfc->hclk);
 }
-- 
2.43.0

