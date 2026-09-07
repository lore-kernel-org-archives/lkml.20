Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F5A4756DD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780402; cv=none; b=FF3kTBWo3T7ZwSYNeXMBylcqgE3NBvfvuOVrTC/VC5bbYkX+Xhwluyba4mN604bwtBOAE3S3yQs3BMPHiWJBp9/RxtvzGd/UYv4g5yOdwb/LPCXXHiToi4qWASDx7cd1JLzvqR8a0dsgeL21h07dLpoq/mFJbkv9ZXWQg0JkZ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780402; c=relaxed/simple;
	bh=mdCPQeEcSAMoGJw0IrGjVzlTvAigGgNLqFZhPQ1+zZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jq6A2fLSSSuBueeTxEQ+ND0qZVKvsV18q16pRE71CbbW8kyOLm65GVOjyk05oDbApnT9iniLJgBwhI+oR1MhK58yznxN6KnKuZ0xbydt4hSGx4H6ghnEfOE7lNgtKdtEOxaMg3ENjjSWeFHNx21D1I7wDcG7X5zmrE6aLq6GVjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWbpjmi/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWbpjmi/"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso2454434a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780399; x=1789385199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYNU3JutMTV98e9RCfpqkVsEuBCUrUdbqqssfR9cXXM=;
        b=TWbpjmi/LkluEWP0L3frAlkV52+WxtLHPLYCDRdK1S+8Fr9BFEEnO/vtowh1jOB7NJ
         omAfsKFO8e31GU9ohi0tEIX8YHDSXewzxQxL5QVTGPpFYbkJl6h6N38WFuBSTplWg813
         ken0MVA9dbLBQOR4EuUDPNS1DHiFviSTNsuPPYNFX31som1FtJp4kheNK2yQ5WPvt71k
         gEgM40elsLrZGSEZhxZ/OWkM2OtAepF/lF76OZdAJGh7ilNQOwg0cFSuDG1hyCXhZAY9
         kxUIC/lzC4j6rW65F2OADONXQwGfK38GQDiv3HSfUIRQxe18Qo8NsmdDVx43bjwd/1S9
         /9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780399; x=1789385199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYNU3JutMTV98e9RCfpqkVsEuBCUrUdbqqssfR9cXXM=;
        b=boF1r2WWUmOn1DJoFycHOLAg6/2ctZ6jbRB67zWhCn+yhfZltfi0/avIbyZDwS7Qj/
         rkZkpUBa3gj5bA6CQPOQQDrTwJhA553neeTyji+wjmDWLUJPC1AqNkcV35HwBq5MqmE1
         AWDvCM9qwDcI99+WhPWv1CU9nsVB4s6O0K+O4W30f+UFl1k7B+G1m7P9f2X8pyE72x9w
         cP7MW1Vh5rySjCF7qYB6AFf+aDXlD0iNIRNHQP7BHSgUJ6y7TF16sI90dWPZwVWZsWfQ
         kPLacUZg/WM/365i8n4oEA3TgAr374G/q7rgpf2uFyIlYbBZNEZgSwa+7JBb99UwFfHw
         Eu+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTeD71kNA8l+1NMP1whHDLTon5JxhTo1f6xgPapyNT3i8fWTvh3lei/AlTf2D6YB3fAFEngXiP7/4t4UU=@vger.kernel.org
X-Gm-Message-State: AFuF++kQcKLFpQxHPaPRamwczncXoXIq5rjVJG18qa4JiZvhX4CP+1KF
	LonJzcwf7KQcwtb+afg3oiVkz72AhBQ+gGXxUnzGMC9OijJsGIJw6Q7U
X-Gm-Gg: AYBFou1zhvQnf8xAZOIpWX0rPJRNr8Q2JBAD9glzSMMXPVVFIMBTlhCVMwogPIHEfIc
	OoF0VAYlSSeOaMSa/5ImXrQdnHwkMm+YHpcWF4IsYtoaKo+jN/dUg2eYrzQWDyCL0s2jWti8GfD
	DMYRBV8al0WqsO8Lh7CbHSOIJgx34t6py1PwWlvuTr4PCa0kS/o2ups2Aud4QfoHaCEg2v3tXVC
	p5EVqjv4b1QTE8sUbJ5O6XafCQfC2OUTaaY7lRFQiQz5XJTst0NYmw3HouHrIatpnCkoGAZsCuW
	uGVc7UtjbjP2DVjRKNS26g5MsoYXR3TPkHwtTFlpAiD8jf1U0UBYXFqaM7cNasjzQdcYnbZgaL2
	vt1Crqk2bd7yruX2nGXAh0M66NujnpaJE+aAWUGUDjOCG6KWNJPtMFxdqbyYaNsQ+Ky3+LRN/4C
	yOxumMY4wVeqfLhweeAPKa0Ef93A0iammQMdfC
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr37011195a91.24.1788780398731;
        Mon, 07 Sep 2026 04:26:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm19984853a91.13.2026.09.07.04.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:38 -0700 (PDT)
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
Subject: [PATCH v5 1/6] PCI: spacemit-k1: Add device data support
Date: Mon,  7 Sep 2026 19:26:00 +0800
Message-ID: <20260907112606.465778-2-inochiama@gmail.com>
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

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 0564c46e2f48..9512556d4539 100644
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
+		return -ENODEV;
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

