Received: from mta1.migadu.com (out-192.mta1.migadu.com [95.215.58.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0354279E0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790186833; cv=none; b=q4xPR/Kwqn79VclLdjQeix24WgXaz+eo1crCSWp6s2aHvzwIl0jxfqBmdI6OzHzWitpoXbpiKuvMm1XwrqsQKraNTKE3VuS7Vn2hh8es2V9jXrSHXagQHiwRpa2Rd+8dTgLoati0ReM4phGNcDJlc/smnn+imdR2H0Wnay+NUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790186833; c=relaxed/simple;
	bh=fLLjzktRThpp0ku+nxVYQNHTTS5nBtNj2dirivgqdeI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qfSAg0kqwfqGYIVrzfa7ZwEkbspmCk5AS/oiutZsfR4If66kEl1ewX7eG5QbON04xpySHGWaw8Nscbq2TcRV9JhwEjdmq9DKUZW6Z4UBj6pkzQo4grianIrO3FWD6pivw/ChHTshIwa0NAClu5ypWMKk4+7K+4StSzeKbpYedyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f+5CF+uK; arc=none smtp.client-ip=95.215.58.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f+5CF+uK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fLLjzktRThpp0ku+nxVYQNHTTS5nBtNj2dirivgqdeI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790186828; v=1; x=1790791628;
 b=f+5CF+uKYoaeaL55SARSElXxlgsY0rwyMRGGem8hTgWVm/ZvkOoeypJki1Zi6sVWzCxsN+0U
 IOoa6IDb4twSkxhgqKrsEpzF3G/0D8zxQNzYhe58C+3zq1Tm0HvlNEQBF9OgJrm9z+55Jv6qWU6
 yiGBQiMpmFfQGixWYvINI38Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0587aecf2ffa7478;
	Wed, 23 Sep 2026 18:07:08 +0000
X-Mizu-Trace-ID: 0587aecf2ffa7478
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2] PCI: iproc: Use __free(device_node) in iproc_pcie_msi_enable()
Date: Wed, 23 Sep 2026 19:07:03 +0100
Message-Id: <20260923180703.3901185-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare msi_node with __free(device_node) and drop the out_put_node
label and its goto: the scoped cleanup puts the MSI controller node on
every return, as the label did.

No functional change intended.

Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Link: https://lore.kernel.org/linux-pci/61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org/
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v1:
    - Declare msi_node immediately before of_msi_xlate() rather than at the
      top of the function (Jonathan).
    - Kept Marek's Reviewed-by, since the generated code is unchanged.

 drivers/pci/controller/pcie-iproc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index afb3aa38ac6bb..bf455f2a9d9a9 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1338,13 +1338,13 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
 
 static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
 {
-	struct device_node *msi_node = NULL;
 	int ret;
 
 	/*
 	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
 	 * for us to obtain the MSI node.
 	 */
+	struct device_node *msi_node __free(device_node) = NULL;
 	of_msi_xlate(pcie->dev, &msi_node, 0);
 	if (!msi_node)
 		return -ENODEV;
@@ -1357,18 +1357,14 @@ static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
 	if (pcie->need_msi_steer) {
 		ret = iproc_pcie_msi_steer(pcie, msi_node);
 		if (ret)
-			goto out_put_node;
+			return ret;
 	}
 
 	/*
 	 * If another MSI controller is being used, the call below should fail
 	 * but that is okay
 	 */
-	ret = iproc_msi_init(pcie, msi_node);
-
-out_put_node:
-	of_node_put(msi_node);
-	return ret;
+	return iproc_msi_init(pcie, msi_node);
 }
 
 static void iproc_pcie_msi_disable(struct iproc_pcie *pcie)

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5

