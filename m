Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F714B7155
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643629; cv=none; b=P+NhEPkcI4LhF42DLSNORbJmYMpSpdn1f/CMR47lYijI9EfrhmWjv7CCiQUjtZxPH7q6eH7nauC4IQJX9E0keuv0IZja04lg41UzjyoD8J5PMaDbItqBwlxppYZyq1uVqbqGpk6un8JBoe/KFfJFweGaeA/5pYncVBYbxnPG/jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643629; c=relaxed/simple;
	bh=FPRRsaLOotLLGU2qlqoDfHiPkXVpRDaTl35pAxkM6mA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ueNvASz2YAe9HDL6UBeeQNcDBotGd+AFdLDvpTWQzbCu+yTRjkaHPuxiRsWw3wm16miyv+6VVogbpb3c8Y08ZoRh7uvnP76gS8ROiyN2x7el11N9M0Qn5wxixaoPLPmP3fxvZnB/Xk3dtA7Z/NuHAUMW9a1dv99jeR5rPf8tioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odPfWtlx; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odPfWtlx"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so593347e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789643621; x=1790248421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BcjxxUUz9REzI1Cz/zHV7EuDapF8kpq7QNpQA5pel8=;
        b=odPfWtlxZd9XnKySyT3gVVZnv06c0MWBDu8Ho0r9qdRgBR1qY3O4Yrvih27VVbIfCI
         9mzyvT2kmc/udK7CASKRQ+wEQzm9j/1XKZI9auhqdtzJwEDR7g6HMZNXmvW7BIAP548W
         yIJzQVW7RrBpsV2mB8oCqSfd4QVPOYhtzZbSxb1bFP9GMcHiNeKSnUG3m/QqPdO0x3ut
         xiabW2Xk4Z1MJdabZrOGxU6mzwdSTnQTPkowm+Kc1JPF/JwHE7U0eXQt/zLkmwLkPd+f
         RuLtdWzfMHm+6HUzNXC84Pqbx08j48+ACa8Sewsa8lNvm7VuhGHc470C8ekgtz6y3cqI
         RbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643621; x=1790248421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BcjxxUUz9REzI1Cz/zHV7EuDapF8kpq7QNpQA5pel8=;
        b=Rs4LH643CDgQPRp10dNX4n6J+GE7M3i5noNlLJPcKwesA7/lI795NMpTBGUWzaVnWa
         Ed0T12XoBn3rlt/YX+yoeAf//MHTdl8VzMf75gJI0a+XCic8ylaqUYeBWMNZDhvPOMs1
         +bt2g1um/vNA1D516luO1HjralcFggr+zMfaYb5UN4NuQSXdB1kJ2CsYcsbbnM3J0rql
         Nr5z28VKc8GOpZa8wdPQ8WFeDqVX0zpF/JEuFO3Jgpii6gbeJiAo8t/2Fe6dk8Pu/d0J
         8W/VzwuJY3B+X1E7g6k9/W7gE9Hdciz6mluCUM3Vx2eNrmN/pW4FE7ypiBIJJqgHrzo5
         XhdA==
X-Forwarded-Encrypted: i=1; AKwUvBxAzbCA/moadKzr4MEURSJ6sLfRJYvTSxT2r+guN+oEEY9Y6TrbNlH5NDJV1vgRaNSVF4dW8beEHc0o5Fs=@vger.kernel.org
X-Gm-Message-State: AFuF++lLlaqPtnTytV2E075MSIkrPfkWPTrUxDt/F8yQUwNTZi9fCZul
	wKwJx4VSp/gjgA4zkNjGNYisEqheSM0zj4nhUGD7On+2aMTwnILvx9fMMH26gw==
X-Gm-Gg: AYBFou2xls2cBfDtLYUvZHpmgB+CNAzZkadc024UYWthw581HgtCT5lo6iP50JS6wjK
	oZfOLMQf2kwHHgHNfn7a5vSIeaSBCt9xpCwngZ+f/hF5PAuBADbbsv0Qp8IRJ5mtSJTSsV+mRK5
	Ure5J9mBLtwAf9EsTQIlnZ7iNRe/ZPgv+3kQgU2X+Y5UaPV5mgWoNX9fc3yvLBdCdnBjngYBNLN
	F0u8q1t4QlQP3+nMsk/uylB/v2/zRkQkogTxurnmK7uHZF7U5BNr7erQieUMVeoRbZ8/3MxrmIN
	g3kMIFIZcVZEQGSZpT90qBjVYkfVLA//pS+0fAkttuG0wk7FQwIKw5d9biAzoIwopRVu6d3Hezn
	hesv2hic1gDjQoTm3IO8VAGtSIcYSGR0lNUjN97oFHBwT3EQs8gVoUWAgvQhN6W8lLyKn+tLhyy
	/7QQx3TNVAKgbOCm3PvVJWM3PJm+Sk8ggclp5knJCZiRh7v0NYdRKpCkNd9hWMe0l0fUglBRsP1
	IqydLs52nzwr1hy4dJmN6tvkPe2vEy8nO+iZbHeWvadoDV/fNWOfJodPRvi7gQw6MJ8nWm3chnX
X-Received: by 2002:a05:6512:31c2:b0:5b8:bc5e:d10f with SMTP id 2adb3069b0e04-5b8bc5ed2dfmr596727e87.57.1789643620561;
        Thu, 17 Sep 2026 04:13:40 -0700 (PDT)
Received: from localhost.localdomain ([176.40.225.86])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3b81sm1702367e87.20.2026.09.17.04.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:13:40 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Alper Ak <alperyasinak1@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: sdhci-pci: Replace deprecated PCI functions
Date: Thu, 17 Sep 2026 14:13:35 +0300
Message-ID: <20260917111336.1102829-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_regions() and pcim_iomap_table() have been deprecated.
Replace them with pcim_iomap_region(), which requests and maps a single
BAR and returns the mapping directly.

pcim_iomap_region() returns an IOMEM_ERR_PTR() on failure, so check the
result with IS_ERR() and propagate the error with ERR_CAST().

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/mmc/host/sdhci-pci-core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
index b121d896a804..a9000f3bd419 100644
--- a/drivers/mmc/host/sdhci-pci-core.c
+++ b/drivers/mmc/host/sdhci-pci-core.c
@@ -2170,14 +2170,12 @@ static struct sdhci_pci_slot *sdhci_pci_probe_slot(
 
 	host->irq = pdev->irq;
 
-	ret = pcim_iomap_regions(pdev, BIT(bar), mmc_hostname(host->mmc));
-	if (ret) {
+	host->ioaddr = pcim_iomap_region(pdev, bar, mmc_hostname(host->mmc));
+	if (IS_ERR(host->ioaddr)) {
 		dev_err(&pdev->dev, "cannot request region\n");
-		return ERR_PTR(ret);
+		return ERR_CAST(host->ioaddr);
 	}
 
-	host->ioaddr = pcim_iomap_table(pdev)[bar];
-
 	if (chip->fixes && chip->fixes->probe_slot) {
 		ret = chip->fixes->probe_slot(slot);
 		if (ret)
-- 
2.43.0

