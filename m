Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FFE47885C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671093; cv=none; b=AdCiSoXrY903rw/k9Ow63ojbszJFHNf7djuqqW6uQPzXMjtSurVSqiN9D66cMFyHJT2bfd25LmOE8hFv8sOHOG+8qKl/IMCzYqJt/f5Ve/UEBiEXh8j25R9n+TvF9Inz2ulclzpoJ3U5nDeXhJKSDg8hnGLw7w2j7eksIKEXDa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671093; c=relaxed/simple;
	bh=tzjrnSGriiNsUvWgycospNy4s2NeOSuRgB+TBE7F6QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTTsSQoAX+PlK4FPzqTsC/olStZA1wHLoX4dqeBCxMScs3i2s94j2kGqBYN8n3nZ9rPHk2Iwxi089cmezMJvvCM84H1KYM4kEKfr3nRRpuL16M0zro8ZmLRf8OkafdG3oVtt1HzQcMAgviZILxo/iB+VXF3Vtzb1b2+EZJB8gOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAagpgNO; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAagpgNO"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2c646bf55so1305695ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671090; x=1791275890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=XAagpgNOMHT/v5CeDsbmzERCUlwI/ubaWZrIorftx+6Qhj6uiPORQPXUTtzxmJf4xz
         3iJ72T52zgXLswicPr0IdDQWWUfK141/UsDGzNAcbcN6/hT+6a7mJTIPQHwEYXG/1iBQ
         SmOYeuctTc4RxnZtutvmIMjdAT20wFOAkjDz7QrKxXxARVAsLmkui+ZIKN6Zvb2T8WRW
         8+ntYmdJGKLu3rXkvq4f4In3iqajF/dxI2mjCVhV8xZA7cER8wzbH4OyRYKc8ejVB+I6
         DbQlbUXc6S8YBQiHwC5Dja7ipvquJ6OjztZtjeHR5Tp7ulUhFru3QYMeN10YpxBkTJrp
         ODow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671090; x=1791275890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=qy0YvmMIEBZGSZsUurpiTDtIyuwhbvsOOWX5S1XncuvVOaxRSuxdpHdNypmvgqSlZZ
         CzSED3LQuCYO/x6Nh/l1dnbYxmIhPo0N3iXU+j5MjlLww6H6rEWndc+PW9KrZiyBE1ND
         OEduUTi0xJzxdEuXlI0fXU/4SArcnhABZks0fuSwWmQKqQvVu2QT53PH8ZY/guBifw/4
         Fx12idvnXOOmWRKrZ/a1T1JbfH6NxCeJzsjxeVG7ECtOd8Ue4J4Gv6JScnzOr+901hKK
         ybU81UWF+5MyddsLC573p+kTeakpvC//1tIJRd1PXjiuRr7NsUGNRM7q/FxCVRu4Xwnh
         xGLw==
X-Forwarded-Encrypted: i=1; AKwUvBz+d1/MCmVqmTDVCC/I8J3lM8f0DvYYG5/nwAYqlrkmaN/b7dCpzPJ2QLAdP2c+sQ+IKHE6rau2qYOuUd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGgSgUbrQSxt7AJhfIxFcpXc2o/xYRvIYiIOzhIP1frelSrqFR
	6trdxj6QYkaMUKJhWvbkJ8ELtaOOZu+vBqb0AZAKYQnIsihV4lwxV0SK
X-Gm-Gg: AYBFou1VT1vzSGWFLXYe+D6oXc+kJ7pGsNdwVsVDmlC+gbuocXuCxw0raKRjYM83M2/
	Ct1y0UG94ebi5LRGZp+IOKdCLTKm8yhO+gMuTx+NTn+TdcOQqaLVBgRHW26ffWbYQrxtogD/xbs
	fUzssL3J9s/hRdwQOC2wXTH0WKrxH3/+04tvCE+zmjLZh5LRO2/aSivLM/Pe4OcWLO4YtgP7XcR
	pTdmIQJrcj3VbLG0AZN4hx1c8zxQaT4JT7LloaIcnmG70zrUv2cgHBY8N+573vADifzDSP3++pw
	tPHP8FsVmxsTRVYip3Le0zUa8I3m+Ub3W02+T+C2ANBiDnGHN4InBTfMSz5eWygxGf5xecx3HO5
	XtHwogqo3EWRNngYcoqdhTSth/Bvb8OrKi7zTin/3vbjd11P8OXiw9MOum75tsfaramLk1RAYIS
	8KyH6Kz8TOk/Rbyc0F40qHWgUwyngBC+ejxBzIHKZTJsrL2T5yNAgN6whi61c1C20yljZO
X-Received: by 2002:a17:90b:538c:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-3a49c0b06cbmr995624a91.6.1790671090167;
        Tue, 29 Sep 2026 01:38:10 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498c4b665sm1745414a91.2.2026.09.29.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:09 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
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
Subject: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Date: Tue, 29 Sep 2026 16:37:47 +0800
Message-ID: <20260929083755.458238-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
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

