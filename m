Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF8846EF6B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798524; cv=none; b=U8toxvb6THld5G6nwmapufkUIS103Xxm+s8STCg+L2+norzEm1+38jTEqszAViW4eDq7pixnNhFCQmWqqk6AcFDor5aU7ztmyRFXvUT0QuxGM/MMT6F8tsl3amCZkkKer7x/Vk3zLK6sk3ByGH8rAjW7Y0dQZ5i4EA/DUc6N/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798524; c=relaxed/simple;
	bh=2YXlOBKMzxFPx3DMx/2ONurojDALU3qcgugVzd5jMsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MffgnscwMFEZubk/18GegxNRd8BK/hliHdW+lMlH1rvShAfCBMLkQCNeyp4nA1C5ZJPvOJha2FEYQaGjQnaBz9sny9vTL9twUs6xrMvImzGxc+LuyvTlRgDMcZ9evHtApzsL2zMZJRS59MP0YEWFivLcbgwg5utivFIiYrjvVc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=as+AMPnd; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="as+AMPnd"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398a5aad413so793337a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798522; x=1792403322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGOboJZ5dJ9D0JSN3yGTlwUzv+5aJL+vgrNZ2KefTzY=;
        b=as+AMPndnf6BXuHnuFvkUXKq8u7l94FvNggLpdylQnWe64PUUs5WBqpOzjYi4o0Dba
         K6RBSX+l3Ri1PsijuNP76DGU7V2LFxrJeU6B3QlLaIS2CoQfutZm4jj63ixqg3I3F6em
         ebgd45Jdz6ahiW1okMXbEDAKgctTCHJu8g0ELjhSVZxQcgcv3YxnvFR1rq6xBUMh6jur
         0FVAzwLo9naGaFgfGfAbskIFz5UR7Y0JRkX2d5rtQUbrSBJhQzvV4kDahLVHJRz5b/pC
         0OXMSJhgeJmwFjYAJJewgyefg7zUQ09nVpicmGZ51w8bE+hWQcycK6ygbGzzBAMbp8JG
         k7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798522; x=1792403322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGOboJZ5dJ9D0JSN3yGTlwUzv+5aJL+vgrNZ2KefTzY=;
        b=GeBunkevcPRbD1GR+d5F6yMYHS1drgGnD/AkDxi1bzDIae/7pmV4gfZ9kH1aT4Ooow
         6sTqmtaOqwim8AjmDW8VirW5COL3H1VWy8yvMylspgpCc1BKUo30HINNRoVC0xAaRKtp
         KVvJ4J32P2WiAuYmSuS5l7YEGCNPEDd9NdrVj4tIPOv/sz6q1WdGjXUgCafBtdEAX2DV
         YSZ7vF45JqJ2c2VeHEFjEW5vHjvGe7V5mBv6SvwQeZjgSRgG8TrdKe81tvZ85Y8erwzG
         m0tzlFNkyXeb1QyWFRhfgPc32SzipsmhZylmmY9B8l9a4wWaptBlBfIOt343YYLkqtzQ
         mw1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/GnwHNr5EoSPeh+vB56+2XVDLDVliHR/xsk7Ukh+Cg4yY7AFWo57j4r/NHKFO3i+LBnMRMysxlF/ViSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJNjQ9fuzteKwqcuOEAAKzz/thALFcaBT8jzQrdltX0OgduGrp
	jgLbZfKYeeoDnezA1Fvdbp2Fim6fEL+fo1JY23stD0/EfTl9HwNWVvIM
X-Gm-Gg: AYBFou1pPV9Mun2jM77BSeSxXYfhGpcUHwN7HGMVk4kRg0C7osLJ4TH6qd7qVi+8Pe5
	dR09je2AatavUSYwZCqC5+wT8dKwP/K8aP9idsbNfO2oD0cAlaB2bVTQWIMZZcGhKY4vwxRZyJ/
	ugxNr2b1gak8k6QBZXBPKrq2mo5EYK2ElqvyaEYH5Zk2HSRJV463TZuGhDGGIF8QlbNsFKw/9VU
	QUDNETggWnHv/0UNBRiNR4MYPebry/4Tn+F+ElzAiXFTfVJySA+qLVQpsf3lOIOkj30ssq8jZJy
	EjuqUfeWXv4cicqc7uIcEr64k2Bxqhif325J3xbqRd1khAv8QqCBydbVYsPxkIgwzQLEZYYxVLv
	xYjmR/zINvalRp0YwpTsyAs3pPlAf7dIJhfZt32E7st3IffICgPYgUpu4D4lO+BWFXuxTK2E/2T
	iq8uLZHwoIkxXvlMiCQSlB6oHYT1h6Vc6f2mX8y67/kYBTJZK0GMcJM3gBiZmGYY3XYD93iPMmX
	WmsgOIUBcysdPl+qRZv7vQ9IBbhSncqxDxEbfjN7dzfUOH5lQO9RzCYNT3ILkuLdZ5Nl/bmFyp/
	7HILnKLdek+w4g==
X-Received: by 2002:a17:90b:384a:b0:3a8:bb56:f1ef with SMTP id 98e67ed59e1d1-3ab3a2902a2mr7546924a91.2.1791798522450;
        Mon, 12 Oct 2026 02:48:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm16189628a91.4.2026.10.12.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:48:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] PCI: tegra194: Propagate REFCLK select GPIO errors
Date: Mon, 12 Oct 2026 16:48:15 +0700
Message-ID: <20261012094815.28160-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012094815.28160-1-phucduc.bui@gmail.com>
References: <20261012094815.28160-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() returns NULL when the optional GPIO is not
present, but may return -EPROBE_DEFER or other errors.

The current code treats GPIO lookup errors as if the GPIO were not
present.

Check the return value and propagate errors from the REFCLK select GPIO
lookup.

Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Follow the subject line capitalization style.

 drivers/pci/controller/dwc/pcie-tegra194.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 2f8e828c4d9a..4c1f22b88288 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1207,18 +1207,9 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
 	pcie->pex_refclk_sel_gpiod = devm_gpiod_get_optional(pcie->dev,
 							     "nvidia,refclk-select",
 							     GPIOD_OUT_HIGH);
-	if (IS_ERR(pcie->pex_refclk_sel_gpiod)) {
-		int err = PTR_ERR(pcie->pex_refclk_sel_gpiod);
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, pcie->dev,
-			   dev_fmt("Failed to get REFCLK select GPIOs: %d\n"),
-			   err);
-		pcie->pex_refclk_sel_gpiod = NULL;
-	}
+	if (IS_ERR(pcie->pex_refclk_sel_gpiod))
+		return dev_err_probe(pcie->dev, PTR_ERR(pcie->pex_refclk_sel_gpiod),
+				     "Failed to get REFCLK select GPIO\n");
 
 	return 0;
 }
-- 
2.43.0

