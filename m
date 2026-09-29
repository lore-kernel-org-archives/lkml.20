Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CAD47989C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671099; cv=none; b=dCofjSpGCmkPMcX0iWmapCI0BO73W6EvuF3cDPnUlO6yeSLTGYqjS3X5Z4AKGdWoM9Gu39aLTcixpRupNfnSjiU41L3WRD9NfRo39mJ0JB/L2xyTeD1EqT2SMhv6Nec+gqjZxJfPO0U1K3z6d869IpweaS77dc0Ta/QBey6sXjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671099; c=relaxed/simple;
	bh=y8V2hkGzlhdb/0KFjTahh6x/FG8XQrgc9cx9Thrw2Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdjwRJG+cK6MDTgA2ix2WjUg+6jMaev9oXmLOFsyOBHAyNBdsEIyO/eg7n2K2hTxRugujnB6n9KLmX+nQZwpF31U3kjnkb6oZGh4/Vtid3EHxjgiR1XJbc9pVT+eWYLw+vpOHW6g4hAdhgw+w2UI7RmVxTl1MxmDDLDGn+vTg7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9VlfhHp; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9VlfhHp"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so598790a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671096; x=1791275896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=e9VlfhHpCALpaO0McDf6gCRZI/bnhnwSqCjsT/H99GBfzzT+Gtg3YNl83C1FDAu98L
         uqjeF5rB3iaM0i2JV+f9FtwN5BKhmaG0w3uUa514OFjOeZiR7I848poFg8jbFyx8r+2n
         aOyclMt3CINMeYB7NA1S1NKM1OR0d7Ozk6as1mWmVtMThvr8BrNqwYkPjyeCbJhBFsaJ
         l9HnEeI412/2FcQ/V0P5ph4sx09p6BazM2+2rGJG+mPI/4Klop0N6wpIMahgC2BNDWe3
         zNlgOiW5yEduK7gxbcORu6vc0DHwhIkXDJTtnz8Rxf0hNK1zLzKf27YOsle/GqjVsJ+x
         uIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671096; x=1791275896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=A8umsrqGTG+qBw9OJ0xf83Uj9Ab9a/u0QmIxqmPGuAaviQPoZ2Kfy6jJpalDTgN2oU
         mFisgzyhdGp5gkx4Zzh8sD/jDxPUT1kVgQvA9AqYHdFLai/ril+RHtYpomHDgqGJRAlA
         NNjneAJMe8MvOqzfHjGqCxtm2WGN4ejBR+mxDqTH1Cs3kFQGxSgTKyMn9cVoej58+r0G
         OzoR57gop6u0Kw85RdcXLI+B8LtyJrLysFe8iPNN4eEzWWpm6KidoGms3G7yjGoZZMIw
         tCftPYDs1KcEgv29fUNJvc1IwC6xeE37nD9+l7drKLxJSswMgNhuWRfsfYLUFi6gIG+U
         l1Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwwTMZKNdX+KtHJCSfW0K9y3HlCWPOEIa1srvDZSNOgQ8IhS9yM7Y2YdRytn7bZYDAXrNJEaq2WT8eIqG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7gorpbbTA6DZA1q6dfyNxYe9kmZlZxJxGBUPDnILUcDsJWDx+
	vIst85HGdtUqd4b2t1tsnxieM5OQxwJgmT1HQUlc/Mk7CGfNO9PFs3FY
X-Gm-Gg: AYBFou1EvujZb63gxtJO9CEJy1/xjPd67eNvpleEOgbsIhOrnTQBZaAbb+AqAy0mTh4
	MQ/xWRS0TwNmdPI4OzDddoTEAudM+tVlvUWEj1cEvSSR2ucFew0arh77S5fevhB73MsN42beikw
	lN6OAnY51yXv2lnR0rpHv1kdXtQWYHpYyRdhw+QKO2iskiwAsA9VOx9CBfz4bA1jXG7+EQG8T1R
	fD6HD6qAWI95VqWh4lf7JVq9ox5NHFpRd2j+UNwcsjD7U2K+FX5gS3m8tfYgkkLYSGBCbu3jKpN
	eVLd98gCZRXnSok6kcsRCUlMrMbIrshhy07on/z5ssQaxz6JaTmGRRGQTQFHOqks/zjTZn28q62
	6MKKbSTlJ0SOBS8NexdVEdowngHOQDE2IIGUNsdF3YmLEXQHITDTNA7CtNwTmFsoUK5XmYLL4Gh
	bO9AMnabgXtnEVhq0OdFtch/Lfk8IWOsJGtfN6keLPi2VQbA8zyHz/DYW4a0roZ6jnSohM
X-Received: by 2002:a17:90b:17c6:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3a098761df2mr11251455a91.26.1790671095882;
        Tue, 29 Sep 2026 01:38:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2c9d06766sm5127845ad.54.2026.09.29.01.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:15 -0700 (PDT)
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
Subject: [PATCH v7 3/6] PCI: spacemit-k1: Add device id update helper
Date: Tue, 29 Sep 2026 16:37:49 +0800
Message-ID: <20260929083755.458238-4-inochiama@gmail.com>
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

Both K1 and K3 need to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 8c4f0b09fe24..ec59ccb710ec 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -52,6 +52,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -153,6 +154,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void k1_pcie_set_device_id(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -168,10 +179,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -381,6 +389,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

