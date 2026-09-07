Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE5A47728A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780404; cv=none; b=KzWuEajeydfCmUVLCb/eAkkit7nY0V9863kjYBlByclk3at7Fzxx84sB3jYpKm6uQEqbATOZLZi9JIY5zo6QruSQCwVcJNB4i9JJJpb2/XJ4uhzuKBCC08dCT4LOY49/CuRvJ8G98xXjvXBN0V7vYeMvkzIUAQGM2lEoPPsfOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780404; c=relaxed/simple;
	bh=RyM/haTxWa/nYIBLao3nZXKdo96GACCECSjiTCRDRkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbKxms+EtAopI+q+/4zN1+tbrIFXMjMsAZCMFszLLHJiXlGCpCE/ZvaLbSwN2Ba687/DSUnbBgGye1d6EV49au136kC44S98VLyZxr9TVrZElqnpcu92LUekv8Ml08m0NOsS4Z+Kdu/xjc4n6jZ23VuyeT5FtZjQM8P8BHVns/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J00smpDq; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J00smpDq"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3952871a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780402; x=1789385202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc3uyG1Btuax47jaWosPyczOcgqdfqJHPv/7lDCZEAM=;
        b=J00smpDqERzGTq8/L89wsUQ/Ubiu+2dHCZqo4Vm4t3hAhpV210Hnu7AF8fKg7D2ndZ
         6JyXTPurcv/bBgROQxUoYMjxS13tsPSTMMFlJxglwDQ+GF+qB+zGeDdEbqk3X9g1wuXo
         MkZJjvjhcacnLW3IXk5mrEUKi9F6P87u9XhOrSvH/1jnQojpe51/DHW+kNpn0twgDloc
         r1oqCbx+EnnjEUMS5lHTBQtDRvsMLQVy4JNfN8iQ1u3IzDAP4u7w5qRH+uh7FZ0Q3cWs
         Ed70x/lJ13kCsSCEiKaBUu7JWJXP8QKBQunyi80w08ZkEws04gfI62fQ+LvN8+BecNDP
         GIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780402; x=1789385202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rc3uyG1Btuax47jaWosPyczOcgqdfqJHPv/7lDCZEAM=;
        b=CBFIDMJ3ccdZYte+Me2JebLQCy0f+pqRt92cdFd3Y/y3kxvJP2nAMYSmMLC/G/Clvw
         vTPCCoyy4dUy9YhpX1NVac7OddIIhAA43p4IoNURv5qR3VfQJxbaDYzDug40kCEn9/2N
         irmmxlk1+HzjMYAgE+aO/Io5FZ60o47VMs0H57UUEGrDusEYJSFdYEdUQ4xY0imsQwBl
         8FQMPBy4DkShYFhcj9jfSHeP0pjiPOGbofKGP0p1brOQUSthPms5OU0Ev7Sx/OtDDqWj
         uXhv8qbgGq+3X+59EgZNRy++5LeDNS0B/ABK+iTGz0fITFxnywuvQ2nABYJaKi49i58v
         Y8NQ==
X-Forwarded-Encrypted: i=1; AKwUvBypegD970jCgbZcHnJMOJVPXSBg+DCNnaAUA2BT8Vw4e6MD7KY9ylLoqweGiKf1afIfcYHZICMqI+ss3jY=@vger.kernel.org
X-Gm-Message-State: AFuF++k9lHBjdM4E5xhYvSVwi9OLA14Sz23IOM9HZp7OWuLhHSQAqEKR
	kjDWxVMK3GUeNkihFz6qecFpxvEWOKuv/F4LJqSkbNW4jEqfhPCAhrFW
X-Gm-Gg: AYBFou0iMaxl2WLJTITZRwargkW8Ll/ZqttfIqN+5jLnbP9jIQaRy2uam6nxTmfs5DB
	P2Bv/G8Vn4uCZdq0QKjZXI7DX2sm4hFXbobo7qiVlTw/G/MVFZwZXk74QXzqBnb6pHxzvm8IOFI
	Sjw4CeHMNjaEd/LOtJLQdEfp5b8Tv3UPbjhhdQr9m1xCKBDofa9Tbv0BQ9bVoUWXsJGfedZMrJi
	zRklMZnwCUBwGSVzpxtilXEMsPyJZ2fPOxVrNpFQD/LWCF++uJvSmJ3b3JPzYQRgrMOzCharht6
	I3HCvAtqIFLM8AAW9bIQxkIGhhUuOzb77MZnkCV3r+iorwr2tV79ST1C79vkZ+htm6iSeHFQ5Cm
	cowgW7hv0o02VzgkqH3lPJH0W5wNod/+FokN1JlU3ikHF2wHePE0qbIi2+IgLUneuTGBx/VdC29
	Q9h0MSkXPTPnaSiM/Dl1werhulSA54TRHlaaiDUUibCtTr4FA=
X-Received: by 2002:a17:90b:17cf:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39b26216cf7mr33136274a91.23.1788780401528;
        Mon, 07 Sep 2026 04:26:41 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm27707027a91.12.2026.09.07.04.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:41 -0700 (PDT)
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
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Mon,  7 Sep 2026 19:26:01 +0800
Message-ID: <20260907112606.465778-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not supported by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 37 +++++++++++++------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 9512556d4539..1049391beee8 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -51,12 +51,14 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_host_ops *host_ops;
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
+	unsigned int max_phy_count;
 };
 
 struct k1_pcie {
 	struct dw_pcie pci;
 	const struct k1_pcie_device_data *data;
-	struct phy *phy;
+	struct phy_bulk_data *phys;
+	unsigned int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -115,6 +117,23 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
 	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
 }
 
+static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
+{
+	const struct k1_pcie_device_data *data = k1->data;
+	struct device *dev = k1->pci.dev;
+	int count;
+
+	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
+	if (count < 0)
+		return count;
+	if (count == 0 || count > data->max_phy_count)
+		return -EINVAL;
+
+	k1->phy_count = count;
+
+	return 0;
+}
+
 /* FIXME: Disable ASPM L1 to avoid errors reported on some NVMe drives */
 static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 {
@@ -170,7 +189,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
+	ret = phy_bulk_init(k1->phy_count, k1->phys);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
 
@@ -195,7 +214,7 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	phy_bulk_exit(k1->phy_count, k1->phys);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -262,23 +281,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 {
 	struct device *dev = k1->pci.dev;
 	struct device_node *root_port;
-	struct phy *phy;
+	int ret;
 
 	/* We assume only one root port */
 	root_port = of_get_next_available_child(dev_of_node(dev), NULL);
 	if (!root_port)
 		return -EINVAL;
 
-	phy = devm_of_phy_get(dev, root_port, NULL);
+	ret = k1_pcie_get_phy_handle(k1, root_port);
 
 	of_node_put(root_port);
 
-	if (IS_ERR(phy))
-		return PTR_ERR(phy);
-
-	k1->phy = phy;
-
-	return 0;
+	return ret;
 }
 
 static int k1_pcie_probe(struct platform_device *pdev)
@@ -354,6 +368,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.host_ops	= &k1_pcie_host_ops,
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
+	.max_phy_count	= 1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

