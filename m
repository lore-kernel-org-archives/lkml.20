Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9688E49A3A0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370188; cv=none; b=B6KtXsebbQ4Z0gOUR+XdenkKVP8O51P40BpMDJGwCDifefzKSn8lEhp2xFQcieVB0eG5+/24UXYevIKqBULNtgC1jCwLHj8tD0boB0qYaNBejsoSZJcG4N1V5DTRIHhs6UbhyyQEMifuivAuw8j+zd7g3fSa/3K83BHQWPPmhTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370188; c=relaxed/simple;
	bh=xgVe3/5ChIxKHbtLau34tuV4XNPB7x3ojPv2vZnUFME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PpPzrZ7ii6xPr5bcYpC+n2w9Fod7FEnqycNFRO6d3EW8j3GVT8gyxbkuRVajmeXeUktsyXYR2JHehwrIdKqmj5YWEpbVHzhfLV/AvQAqRi7Dv++A8OIZt2zP/Bqt2rZgGw04XhY54kvEBTNNYB65Lq4bsVgc7+mCBXI2pGyc+pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvSmA0FR; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvSmA0FR"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso344628a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370139; x=1791974939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9e+3jmJX4LTPI4etQxzprcCTZVbd6Ws0ithfkyYyE0I=;
        b=nvSmA0FRbXqc5/oDtGDkyVQO2bdR7TsiVdpsoxGLZPTz6odvbFzPXZQzHY3Z5sn5xu
         q1zKp/Ka8B9UXy4KcDDj3itHeWCozt8Z4P+IWDl9fKNKUaDOI5qHsSncYDpNM2OEHRRA
         qngdQpPrnyDnLQhgOMwYFYm49YW4lP0EC9hVB89yf6VJIw9LBb1gRNjI8/UUe794TsOi
         AS/y/jC6jq7diW8pOOOwYry8OohSMsFTxUjxbAzipZ3zoYxg+tnbgHR3wZVN9sfsIe2V
         NAeANelQZcKSF0ha8hn+Q199eyagBKI3CtSwfpm224sMx+v0QstSB6VRI5B/IZDe9ScV
         aHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370139; x=1791974939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9e+3jmJX4LTPI4etQxzprcCTZVbd6Ws0ithfkyYyE0I=;
        b=gDnvXIO55YB12vUm2n5yLIXf9OpWg9JvP0O3/IKs1Z8B1wKdf291wBsXCWfJmh4D7H
         X6KufViji4xsvZHuolf5e2uQ1plU7slla4RZazvpjIeCGBvKcapgDRvR+XnbFXoDQ7Ns
         4rnmJfoQi+TGCwyuhwzO5lwNu8yWWTg3kLxsjsX76WlSfEUa7CpPltbxT/IUFDjfSIpk
         vrpTLxD9pUn7DwfUOSFb4TIhyQDPU6z0RolQCdJikmfbfHYG4O0h553AMc8XfjFrDNbU
         6nT3jf06gkcckE7knOYhdP2yg6BnQbYUCvwM3v1JMr6QO/2IeCfctZhSUqRbX72WcTZq
         Buyg==
X-Forwarded-Encrypted: i=1; AKwUvByZtWTB/P/Ww4Hi9YufFn/+STui5/i+BynnOTvX6E5Ql1i+nI866si+fNZuEStAd8193qv2nNdSfpDQX50=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrqPPTPv3PHrOzQi7vkHD0UV6EVvpXu42AV9SHSRjSue1XuwIF
	h9Q1k2OATbqqIaYpP+fm4AyceUP+zJuHpUcgMdpal6Gi486zz310V/Ci
X-Gm-Gg: AYBFou0ucm9lvJVjyx6SfzocfVW4pfMrqxdjfHTyiDPUPUAzl66RRfUh9S0B7bgbKRd
	jgThz+Dyq0nwlhtFEj/z2eYfp28hSyKXXSOleAgwEFpYCMOq+UJqVYQp+ItY+Rrkul+ajFnArmx
	/Nm2PCWMf8pvnQlsAYLQBPyeaXTD+82oZUM1ELc2z2wnW9I9id46Blc4ABeKQffa1eCjh2FkqxL
	Gobpi1G5ig4F0VCCVeO/HAeFIAwEmjSt2PNfoDeX210q1jQ0l4IZ6meCpGqysbjy7HhzayWKDiC
	X8fDp9Q4EQqZ8K94hNMO2DVz5oIIEFJiEbXR2qdLtOgXVlji8fbHc2r1swzojqyXYyYAYd1EsYq
	fT6mwUsgjWRzAubFkNGJF/K3pq3Utyzdj3ykppDYv8+Ja3G3vZJQ5Kg9I1jadR8RHeytVwqFCJ0
	5MasdchEFSFZ2Oozk8Ce9i3GX7M7StBdfCn+vvbMId437kZNMtP5Ac6onYwHobM5t2dfeoyJEkL
	kMJYTY+iTXnAUJSsPWovzkasIgF0La30EzBQM+fOpvp92WVX1luV6zGY9MeoQj6SBKjKSmc+BrX
	fJDpq3SeVGl+zw==
X-Received: by 2002:a17:90a:fc50:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3a89f649791mr1506978a91.5.1791370138770;
        Wed, 07 Oct 2026 03:48:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85afe9ef9sm9119961a91.12.2026.10.07.03.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:48:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] PCI: tegra194: use dev_err_probe() for PERST GPIO
Date: Wed,  7 Oct 2026 17:48:46 +0700
Message-ID: <20261007104847.507776-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when getting the PERST GPIO to simplify error
handling and properly handle -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 63a0f56cad8e..767e11216196 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1200,18 +1200,9 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
 
 	/* Endpoint mode specific DT entries */
 	pcie->pex_rst_gpiod = devm_gpiod_get(pcie->dev, "reset", GPIOD_IN);
-	if (IS_ERR(pcie->pex_rst_gpiod)) {
-		int err = PTR_ERR(pcie->pex_rst_gpiod);
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, pcie->dev,
-			   dev_fmt("Failed to get PERST GPIO: %d\n"),
-			   err);
-		return err;
-	}
+	if (IS_ERR(pcie->pex_rst_gpiod))
+		return dev_err_probe(pcie->dev, PTR_ERR(pcie->pex_rst_gpiod),
+				     "Failed to get PERST GPIO\n");
 
 	pcie->pex_refclk_sel_gpiod = devm_gpiod_get_optional(pcie->dev,
 							     "nvidia,refclk-select",
-- 
2.43.0

