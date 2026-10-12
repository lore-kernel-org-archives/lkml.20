Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E534EF0C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798516; cv=none; b=B+OVyHlL6oZZdp97nFkjf9pVuK9JgRPAKA+G2oz/BTelQYma3m7Y9F10QKx2PSxwYcmtdyRFAPoTlx6d3t05IQUfyRkqXnIZl8NUStS3rydX4DEuNBY6oIfgP6XnqqFcxOnfbN1XN567ve6NgR+miDBnx6ViYQVFt8EESeYZWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798516; c=relaxed/simple;
	bh=Xwo1yCAMK5tqAeCHkGuwh4MMuZ0ul0FuqvfPBWClix4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EBMXHTyILVZ9841koT9Lr6WSbXxR0tg6CqpbQynxXFMJobQ7rt4JP4G3XioRInJ6WyHvR8iRiI366oLzZ0XKm6MlMTvIyvAfs09kdK7E6ATtYNzsf2Iqifn86sw/j1f3RPoJdZg4FplDswBLOzYJq5neubqqByHQueMLNejF3ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TORYaqkV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TORYaqkV"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1224730a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798515; x=1792403315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AE3qN2Gya+sk1Ul6ZbTJH8NleA3l4oK8s0FP1HbUA3M=;
        b=TORYaqkVFtclOWs603SYkBWWxbqnriwpP+x52DkpssGyR5Unfd/daaOYmfUzIzbDe2
         UROnVRll3Vn0U/sZ51Qosr5Wl92DBaiYgY1lOmzexCtjjlOWEJ06/EJa+ud1VWNel3X9
         um22y+RmZykC3PnCNi6rRrMRLBojjLpNcz4x7nPtfPaCrLmHTxEACWD9mtBLZyaorTwh
         SG95Igkt9EIDDU9dSLWqQ8vmfGdYYuJx/6yzyMyCWBxDzZnL8f7Jll1Dn9fB9U9/XhP4
         KVgfb8YVgCfQ5TUYyALGeysPFYWpscTiow9rK/nM6Q4Vig4GBg2bEMhgquvgmF6Bvw9f
         Ev0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798515; x=1792403315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE3qN2Gya+sk1Ul6ZbTJH8NleA3l4oK8s0FP1HbUA3M=;
        b=o2k4JY2VHAdR44coIscUv2Np8hzn9zBfg2OHfHrNo8AD4EKmXjZmaWlwqyY31sMY38
         lzIIz5jDt3gYulGq3kKUyIBHT+dn0vk1iCF6NFHlsa96jc7vQdrH74tJCm/3vMOvGZLK
         ha2+RjD7OcEHMTE3B9GIEhzbomcn+FcpimngZtS1NKyWHSO8np0UTa6N3JcMe9218eoE
         YE0WJa3ZUiKi/bfNLKbrpT3m7PDp2gtObMrreAEPHgvBEJ7Ntm4eVTaVk/zNbnMdefWx
         DYvbTf/f0f67OuoU/KdA4ODRz2r4BKeg2EHWGdE4yfWqkbERh0UgCF6qs91JflE/kZiV
         V1ww==
X-Forwarded-Encrypted: i=1; AKwUvBwZx8JOdffXGTdrMiaRWIGbg+mlny9B32agmbcdqGocMq/TmYqiEmDKL2Ic6N+6niql/rtx8GNwBq8P+dM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7p5b3pAfFwyRjZ6EVz2s0NOcDckHViaUO36mEpWkgHhRsisn/
	gR0qp+PM7qB4ByDyoNA0q2FJWs5ub8dEy/TEU+VuSXcvX2OYMjMyi3xJ
X-Gm-Gg: AYBFou1y1mCuuhbvGx/D3KO8ciNqbsrLw9xFHVEcew1YWRmqWqOQ1IDgkOiVtwrYxfW
	vqyvvDFpMYnY7FwA42E2JTRt4CWYrrU5WVoyaBVLJvbFokmzZb93NmoKnFxnQUGgNqKhzfiSys3
	K5bRNVV7qf5O8UcgHAFwdIrHqojqjPMo2zTIExHkJ+cfN39X/e2Y6UsWQJZF4eZBB1tc0AQYF6s
	lwfnxFI3CIII9HygKnOIHUXlnPCgZY/PF4Un3FNcDFYDPodQDLHK0ykbRHLsQ6Yeqy0kQoTpF8x
	6m74Dt8XXKcT8+JWT5esMQkPbCAOGx2gIkPkFMLAJaleNBOKnGs36gB+Pr704ErG6+RLRgpZEeL
	v1ZAPLxxM5z257O89zzvoI8J52xMHId5GvuWJ0eSYziWyy7b86nbKTJm96hRX4n7ab6IcpY8mIN
	RPSdE+O2feQauzHcD57HpsHngKzKLZX55w7uEG25/623YDZyfV0xlAEPbILjMUKnaSgGnZyp5+6
	oEYuOs16+KAU8FZsDO5J5aYNsw+j49g4iYEPZYOjwU1yGmRVke/s7tCsYkeZL7mjxx6jHkE29Ob
	4Qc5/nZ3Zwivhg==
X-Received: by 2002:a17:90b:58cb:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ac0e6a4ed3mr1023251a91.0.1791798515002;
        Mon, 12 Oct 2026 02:48:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm16189628a91.4.2026.10.12.02.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:48:34 -0700 (PDT)
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
Subject: [PATCH v2 1/2] PCI: tegra194: Use dev_err_probe() for PERST# GPIO
Date: Mon, 12 Oct 2026 16:48:14 +0700
Message-ID: <20261012094815.28160-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when getting the PERST# GPIO to simplify error
handling and properly handle -EPROBE_DEFER.

Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Follow the subject line capitalization style.
 - Use "PERST#" in the subject, commit log, and dmesg text to match
   spec usage.

 drivers/pci/controller/dwc/pcie-tegra194.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 63a0f56cad8e..2f8e828c4d9a 100644
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
+				     "Failed to get PERST# GPIO\n");
 
 	pcie->pex_refclk_sel_gpiod = devm_gpiod_get_optional(pcie->dev,
 							     "nvidia,refclk-select",
-- 
2.43.0

