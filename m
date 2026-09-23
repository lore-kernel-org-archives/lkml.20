Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43434367B94
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128279; cv=none; b=UwrcLW3UapnopN/wApjgHN+LU/3pTGCp7Zl6EE9fF8625GEI16LOC7wN1/3PQApYFayT04+H0ugw35y5spt9uYECVSy8RLA9qJJMtRh1QHEhJP/cZgCsemMvBwTAhmGG7ZPNVPsFmb7nK8IR/AmF964dC+nVZTJBfL1cVcmNMhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128279; c=relaxed/simple;
	bh=tzjrnSGriiNsUvWgycospNy4s2NeOSuRgB+TBE7F6QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJPrdBl3Mpfh7IcqIsbFh30Na5YWkhdR/aqAlL7OcSQjxgl5WAiDHEgCV+NSXZE2Vf+MB8xj14qT5ecL0a50lGmAFP2agognYQ9M4qBAZ+j0FgrAlVRtRm3kLKL5VYklUK2Cp7onteLI+GOIUkfM7jLdQvjqz7Xmls1NTvq4qdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4B+gHCc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4B+gHCc"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so1909825ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128275; x=1790733075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=h4B+gHCc57n5ofB5/oA39A2UTGAY/c6loihPbBUHiDCxPGLBzoD1BB++SqSifXecql
         U959Wd67mmUXy64s9vhMTS1CmjFewqoQr+/vMHUFOgJUwqDl23UtWOKoNN6PlFeeovTC
         tB4/QlF25oQgU57a6I5G4U0dOywUzbb+/v//3gnVKmv6nYbdMRR8lr+PSckfLzW/ZVod
         qxCYfLUrY8aQe5D9iScpSJCdAk/jMJtiiHuYQKcsj68jjoWeRimClndYb/fwf6h1zI3m
         bijGfbmX2KpUj7dDDU3McEvXAtujfL/j+hbioCZ8Ck/f81fuQfk1yVdq242Gy7BPCT5g
         KFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128275; x=1790733075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=EwlVVEwJKww1taw9md1a/oMPBgnaw50W3IIA0hza1sOkPwmHQ2hIMAc1mlDvBpDIW+
         EwVmWwolhqCFke91mf3rVwMpl4X0lj2TZ+pGQ4p65CAUzy9+t6QjirRQuSpw70qOZUbJ
         k1VgpHtnv9k6sVzIhL7yjdh4G/mc9cHOJSxlLL4q7m9xDZahvnFoUpUTUPlnsMtXZLbH
         Fsyt/rTFMru3jaWSjp/2pDcWRIb5D8T0I5RuumJm3E2v8Z9mQ42EBHw840cGQYzs5vOJ
         zGJg8jHL1hZnk1CsICIoMj4OXBGxz6d5bwKyXrfikbbYx9Nn+Tat8vb1nfeM08fs+P+o
         wpPg==
X-Forwarded-Encrypted: i=1; AKwUvBwsRfN034yH4qg/K/9T+QKdbVV61IoaIoogwSVBAV7D34bUefOEmn80w8v+L97g+y5jBAFbauseu6k9i4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++maDEM/toDL7aLQb13znSwHwo2m6FrhNkr9ExdNNY0qP3ErAmT2
	Zg2IcydgQGTfixMxhvoJJhtEKJfDSSRExQMaNVQ1WAqDXYjd3hjm0P/F
X-Gm-Gg: AYBFou3/MPN0dgO5yIoG8fVZHHxPw1oXoZ9zbXPDlOY3OrQAXlkF9LlOguvcAM9KMzb
	U1NNupG8ZBbyqcIBTDcFEqis750Sph7wVWDwvDI3TX17vb5P24PUytXQgw0D77l0jJMl0X/pjQh
	reRUXqg6zoKSor3JdZI1Gosswl8O8xfc7X9qk/RqPDQIGW8IqjEPJvnj7dmsL2LkZvWa+TO01o6
	6/1p733GdhkSsKl/F8YM6OeSZ74mSZjsNdLWsdw4kilvje66UlBUVwKdrhjcd577gnMgKBaDljo
	ab7S5mDVy/CuPxdhjfkPVq2S5yhfS18PT2Vy0acutbuE1h185huAlVei46LjJhajjR2RV/IXt1L
	xzeHlQ9gzIH/oskryMKWd9u3WVW2cbd0ewd6HqPH0pku2WOpTiHUajqQNgErvb4c3rH3nSPZ0mN
	GHe2PrxV4/yWvp9qugHtUfR7mcf50L4u6WLB7AeZigOefKMYw=
X-Received: by 2002:a17:902:ce08:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2df69d583b9mr11377075ad.26.1790128275555;
        Tue, 22 Sep 2026 18:51:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c668sm2768035ad.78.2026.09.22.18.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 1/6] PCI: spacemit-k1: Add device data support
Date: Wed, 23 Sep 2026 09:50:10 +0800
Message-ID: <20260923015016.64069-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 0564c46e2f48..ab2953ad8f56 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -45,8 +45,17 @@
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
 
+struct k1_pcie;
+
+struct k1_pcie_device_data {
+	const struct dw_pcie_host_ops *host_ops;
+	const struct dw_pcie_ops *ops;
+	int (*parse_port)(struct k1_pcie *k1);
+};
+
 struct k1_pcie {
 	struct dw_pcie pci;
+	const struct k1_pcie_device_data *data;
 	struct phy *phy;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
@@ -274,14 +283,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
 static int k1_pcie_probe(struct platform_device *pdev)
 {
+	const struct k1_pcie_device_data *data;
 	struct device *dev = &pdev->dev;
 	struct k1_pcie *k1;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODATA;
+
 	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
 	if (!k1)
 		return -ENOMEM;
 
+	k1->data = data;
+
 	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
 						       SYSCON_APMU, 1,
 						       &k1->pmu_off);
@@ -295,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
 				     "failed to map \"link\" registers\n");
 
 	k1->pci.dev = dev;
-	k1->pci.ops = &k1_pcie_ops;
+	k1->pci.ops = data->ops;
 	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
 	dw_pcie_cap_set(&k1->pci, REQ_RES);
 
-	k1->pci.pp.ops = &k1_pcie_host_ops;
+	k1->pci.pp.ops = data->host_ops;
 
 	/* Hold the PHY in reset until we start the link */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
@@ -316,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -334,8 +350,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
 	dw_pcie_host_deinit(&k1->pci.pp);
 }
 
+static const struct k1_pcie_device_data k1_pcie_device_data = {
+	.host_ops	= &k1_pcie_host_ops,
+	.ops		= &k1_pcie_ops,
+	.parse_port	= k1_pcie_parse_port,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
-	{ .compatible = "spacemit,k1-pcie", },
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
-- 
2.55.0

