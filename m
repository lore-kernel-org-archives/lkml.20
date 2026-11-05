Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893100;
	b=cOH0uCPImrVz7s0sxVGuIxma2tbvvbh5mFb60Gntlz/1l7QhpfNf9/Hpa07zUcO/dW5R
	 FZAfM39fFUWGMmRpWr14lBbqj1nxewbEY5YsBFxBZWDV7lfH3JiC85EBy6aumfDGVCeO0
	 wQ/JUZcg9OPa8lBF3WYdJKpB24TMRPwGwRf2lBIDF57LDBJaCPhmg2VavrQZXJW22THDD
	 aIdUF8belUZc1MOfR2/ZeW5stIjEPZaWSmaoqp/yGt4UkNluxmK1EXs/NmLE6AdjQzBly
	 wHHB4CQ1z45t1THlv1lNmBwRKDw4kW2nb83VrkDrESmtBJmEpzBZGPZgMtsrZuKgdPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0l6j1oaqdhgh/JwMCNrOMOspKQGhGlHYbhxav43JvKA=;
	b=cXVJDwZKe0N4kmbMTR8l6jxVMZMVUE7JnJwHsI7SKE25js4BKW1lyaAVCkr4gcG/x6h+
	 EU5ZXGlaVrDXhYSD73XI5iZVh+qm+uSxCUAZvi4pb04JrWpx0O77XiwUH/OrJphzdDleB
	 SVb1weNo63V+lw+218LbwBYwaEZn6UrpwhNkty7YKVqOVrfcKHh1AawRUrDLZiEM9XWyJ
	 FIoEDCOh3yFWdhYrzrdtRY1CxF0V8icCCz//Rm8DaZItdOyUOgOCcyRd2AAPlLD0MwGnr
	 kyaXR41J80QK9/MsDnVcr4DcDktiQ7Ne03NiDHy8I/Horp/K0Cz+lIzSEoPQ8/wjXuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=pIbF9eIp;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643FD606EE85
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643FD606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=pIbF9eIp
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4af173320f9so1464753b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793893099; x=1794497899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0l6j1oaqdhgh/JwMCNrOMOspKQGhGlHYbhxav43JvKA=;
        b=pIbF9eIpQUw9aeaIkjQhkifvbyT8i2wvbrqbK41ifsnKKvOxQkfT2inNS9BmQynMAh
         7K0hfpmGQlYoXEgkxP1RvKcAxmZnLAskwDyjcqLtV0LNMnmvcO7mjPVJgDV3N55m7HcA
         TJGgxF2Urd/OTKkiveJdxurFkOxszywy6i+C7Xf7r/kj5aiiRe+X7gxJLTBgaHpyhHrb
         K/bE0o8bw1Zgb2ggr6AJDndZPpGuYckiws4kyBOG0DFZ4yIWacSFvk5mGdlDbfkJd/3H
         NjvgdkmVZfBAPp9fQja0O46nnC2YGv9ToxbqAmL6xidGGc9VP4eY/rcbcSQcgxVTPdZu
         G9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893099; x=1794497899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0l6j1oaqdhgh/JwMCNrOMOspKQGhGlHYbhxav43JvKA=;
        b=z8rIgXMFaLXUASYszBqaP+Vc48UE+Oex/PAq9OJZrXpORvDrBPe5+pfVzJ0RVBFAQb
         dxG+aBQtF1iSbOfrv/g9ReRtqDyQbTJjxOCSZWWwjqfTvF2SFKQjopqQOq5BXc4mY8dh
         IrtxGVUSpTyQ4+KRKGYWXgf7moBTDXG5ABmCGrTQAVFnsvuHyn9bMLA9dY6pdV7fVfNy
         YFnbvqqpNmM/yFN2kjlkfvcRI56NfCGlkIvUXMTKgDC9mtMlvbo+M+Ar0odUZu7DSedc
         uL1xvpcY1M5PXYlJarSnI+eDItN5EJ/tOumLxkE+mymUpZ4rUWsNFpcdtGr8zN/rOvV7
         pofA==
X-Forwarded-Encrypted: i=1; AKwUvBwFA6+9CKtCZPWPcPqrVie7MpBuvYV9Fdu63FDIvpvCCz06NeRbpzFBpJ3AohTVSnQQyNXQUk6L2Xpqahw=@vger.kernel.org
X-Gm-Message-State: APuU4Z81/X6p2aPoOXij2ag75N8dvJVLQPpKAN7Z9qw870qBYqHCeM6c
	3h9MiOUenqHXlhjwbSP2GP3El1h5iu2OHPCRlM8AxAAf9xSAbC//T0M2on+3vWz+mH5b32N+1Wa
	5eGoVl1g=
X-Gm-Gg: AYBFou2eS8VQQR6M+wRKvVAaRuJaRQiNtMIOfzlJsqTdCVSTROHefrDwOosEjuwIsPn
	Gib3H70yrgc/tTU0ksxwjan9hjTku1Li4Nr1mMZQJlkMzUidvsFnpFtkNN5ZqST/xq769DMFzpG
	IoZwzt+VPY7CyU7lR+UStcUhPyUbp9AXx1HHTJDpP5xm0UMnIr9QQbV6EWUIfHGxqSrKkSbFwF1
	PVxZhywFByYfjfSuJFrn6vnpwsjqsRh9xRz+O/Py1/MYd1kmYm51UjJaenbWwc5tygmNIOFQoX1
	xeb3bRgT6tcJfl4cI5L+GJqPTl6cFZLiFA8hKmclibOgfI4CLrAbGcdzymEnHQN+gJDytpsBoOc
	kzndfLJUZl3RaaZgPrMnFVnCznqYnzSN9inRL7DvGTMVB446m03ax7VDv4JPPUZprS0GRKcO4La
	doCf2enq8nKvvPHzV596TyORQPORV6pRIjPmJjJwd8dL9V1Gk1Rr/iSDLPJE3hDUlbWLuX0CkOS
	awny9hLEePG6TzPMmTZ4nb74umPZR+Up8Py7PCDT3oV+wCmunO4fQNbxbW9CcT/0U4VUiciorVX
	QnEQ1qFPbyvsVb8hRyFz6Fk6U3KAfuzinA==
X-Received: by 2002:a05:6808:1997:b0:4d5:295c:a82c with SMTP id 5614622812f47-5640df07875mr15241603b6e.57.1793893099154;
        Thu, 05 Nov 2026 07:38:19 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6e3bsm4435329b6e.5.2026.11.05.07.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:38:18 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/4] PCI: of: introduce of_pci_verify_node()
Date: Thu,  5 Nov 2026 09:38:01 -0600
Message-ID: <20261105153801.435566-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105153801.435566-1-elder@riscstar.com>
References: <20261105153801.435566-1-elder@riscstar.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Open Firmware PCI Bus Supplement and Devicetree Specification
reserves the device_type property for PCI bridge nodes (with value
"pci" or "pciex").  Non-bridge PCI endpoint nodes must not include
this property.  Rob Herring observed that developers seem to get
this wrong.  Commit df4107fc729e3 ("arm64: dts: qcom: qcs6490-rb3gen2:
clean up PCI function nodes") and a few that follow demonstrate this.

Rob requested that a runtime check be added to spot this specific error,
only for non-bridge PCI devices.  Herve Codina further suggested we
ensure that bridge PCI devices *do* define the device_type property,
with value "pci" or "pciex".

Implement these suggested warnings in of_pci_verify_node(), a new
function called by pci_bus_add_device() for both bridges and endpoints.
If a PCI bridge has a devicetree node, a warning is issued if it has
a device_type property whose value is not "pci" or "pciex" (or if it
has no such property).  Similarly, a warning is issued for an endpoint
if it has a device_type property having one of those two values.

To be clear, this adds warnings, but otherwise ignores the errors
it warns about.  It is meant to help developers; users should never
see these messages.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/bus.c |  1 +
 drivers/pci/of.c  | 32 ++++++++++++++++++++++++++++++++
 drivers/pci/pci.h |  3 +++
 3 files changed, 36 insertions(+)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 655ed53436d3e..679afbc6d3109 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -351,6 +351,7 @@ void pci_bus_add_device(struct pci_dev *dev)
 	 * are not assigned yet for some devices.
 	 */
 	pcibios_bus_add_device(dev);
+	of_pci_verify_node(dev);
 	pci_fixup_device(pci_fixup_final, dev);
 	if (pci_is_bridge(dev))
 		of_pci_make_dev_node(dev);
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index a51dff91b196d..5a040ed836744 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -1085,3 +1085,35 @@ int of_pci_get_equalization_presets(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
+
+/**
+ * of_pci_verify_node - Sanity check some PCI device node properties
+ * @pdev: The PCI device whose device node is checked
+ *
+ * PCI enumeration authoritatively discovers what we need to know about
+ * a PCI device.  A devicetree-based platform will represent a PCI root
+ * bridge with a node, but otherwise devicetree doesn't typically include
+ * many PCI nodes.  Where such nodes do exist, experience has shown that
+ * the "device_type" property is sometimes wrong, so warn about that.
+ */
+void of_pci_verify_node(struct pci_dev *pdev)
+{
+	struct device_node *np = pci_device_to_OF_node(pdev);
+	bool device_is_bridge;
+	bool device_type_pci;
+
+	/* Nothing to check if there's no pre-existing devicetree node */
+	if (!np)
+		return;
+
+	device_is_bridge = pci_is_bridge(pdev);
+	device_type_pci = of_node_is_type(np, "pci") ||
+			  of_node_is_type(np, "pciex");
+
+	/* Bridges should have device type "pci"; endpoints should not */
+	if (device_is_bridge == device_type_pci)
+		return;
+
+	dev_err(&pdev->dev, "PCI %s have \"pci\" device_type property\n",
+		device_is_bridge ? "bridge should" : "endpoint should not");
+}
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 77efa4c5c960e..e93f602b9ca48 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1259,6 +1259,7 @@ bool of_pci_supply_present(struct device_node *np);
 int of_pci_get_equalization_presets(struct device *dev,
 				    struct pci_eq_presets *presets,
 				    int num_lanes);
+void of_pci_verify_node(struct pci_dev *pdev);
 #else
 static inline int
 of_get_pci_domain_nr(struct device_node *node)
@@ -1314,6 +1315,8 @@ static inline int of_pci_get_equalization_presets(struct device *dev,
 
 	return 0;
 }
+
+static inline void of_pci_verify_node(struct pci_dev *pdev) { }
 #endif /* CONFIG_OF */
 
 struct of_changeset;
-- 
2.53.0

