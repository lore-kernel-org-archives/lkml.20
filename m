Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913858;
	b=YYVZanYTEsto7FWmq4A+xaCzwPx9F/mI1DVSRr8Sih9C2lKi8ykLesShCG0W7S23wfDN
	 QNFemlF62V6Z9aJSr9TRpUj5yC0VbO2U5jlVUyP677scRZ96RNgOvKPQclmczVY+1Wz1b
	 6W3A9vNH2t8VFtOkJBt+9VaQu75oNp6h9RW0qJfifPYj/qMUlcgi+iufYzDx5Ds05oTPa
	 t8a42sQS5EjqBYkufX1Otv6p2ofKoeOEPKFe7kLm5EqGWqW6mQBt5DiNwx92MbZWXCROL
	 CrYaSRuJQwqOqgItEX7NIk6hBrn+b1CiEkglVJUAn4SypwEHEjSXaUe6oiLwhix/+CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ujncORWDeCOfsZj4SRemsHJX2GcQyFLH9QWEU5Hn73Q=;
	b=Rj5feC/lmo2O1SXUpDzQIYJcFDL3ue6Q58fwQuyWjj83ARtVuVYWoNVQFEkl6DXA3v3s
	 lRNlrarr2LqYc/Gcev4ZR7hY8Yk8wXvk5PvK9d2AwunjiY7QsQGmeYCXfZJkzYniMEVhZ
	 PMv5Q19ofepG/8qpuuUxIOiFow6BOyMIgTVxwMPdopK8rmlEMjVC2nRa5i9dz988e5Jdf
	 cxa03YJoS3OBLJu6VGUek7mnF1DTJ6MyrDmNNF7PYJEVmkhvSGgsDouuV2oLOC3udjJti
	 2yEMlwUFqq6pu4RYAkNpuXAufPmnll2OT23I1pSg1U+POUpouOO9ZHMyyCuwi1Js26g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=NRC6Poj4;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28AF606A33F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28AF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=NRC6Poj4
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-55e0090c580so903638b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793913857; x=1794518657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujncORWDeCOfsZj4SRemsHJX2GcQyFLH9QWEU5Hn73Q=;
        b=NRC6Poj4RTXJ7vTSrHkVjVxSPEMYyFLBTW9hZbReACOcrd8vd8wc0H3//dp8FOMDLY
         Qb9pjE1OZ0fpX6qC5oIw8eszTwaHM7ofAFQ02b90nyUI+sn0BjbszhOEFVX8lUAYh1KB
         vaq6QM/h+WFTFeoacrNKg/IiarYvg2sdsn7MP7ANvbWpUCt2izvjnoWP7gbtr92c7PS/
         VpbXpCxHiEDK4dfRfjOOAHND26gp596iNREXKK4HwHGp8dc2vHlgdYUO+XDj4YRUu6w5
         h3V/8LhF9GkiwVl213uSUF87QD9QsXjYsFYFciSYwcf0KJrDxmKZtFAbLWCGLEzKEvaE
         F2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913857; x=1794518657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ujncORWDeCOfsZj4SRemsHJX2GcQyFLH9QWEU5Hn73Q=;
        b=auwBIo6bOwgaRznZJyqyd1KMEfLyeOQ7EPgr6naUbXgWEAWXLjdv0yW7mcoC4N2h8A
         W8aAvc85ZdunUJUOmi1cv6kfi6gwpyQCBLIA3rxF4Z6sIbUdkwLyU7ToAuGubryZ5tKO
         E98pFTEwnSaPAri5WhlR0N/BFAvwXvWRl/WehIt/38tkfdh7V54TIumvPZu2o3ODidG7
         2czrFK/1pRu4hyEfY8C6X9g5LeNzNTAV5i9TbnL5v6yZDSTy/sWrxOLZx1XSEqDhWzO4
         /jZzE8wVcyxeJA3//ZpsU//QRzqkKww2VO+IDUgNgFlgN+tRxA8lSFQxzMWmD25nMJUI
         Y6Hw==
X-Forwarded-Encrypted: i=1; AKwUvBw9qSJkTRFbyVzbMPNSgA+qVYIpaM9w4K95irv9oCHDYv917ET9o64n8UxVXMqEmRk852DQzBPqfLJeBBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PGOChkumIgeNWg4NHco15Lnl3Y6K6e+xA6fO6/ffpXjUXB2R6
	hBeh/2cF3iW6ttQHIk+1PqpT0m0f055OU9zg0HXswfhXG9cJrlD4bBiz3RN/MVqbcDE=
X-Gm-Gg: AYBFou20iYzYMDi3RwfB0dw3JOshVguOmeBPzIRjy3RuA80LCxYKC9bf/yDj9tA4PsE
	J9AhC9uG1EqZ43BX3m3ykAhsykftG3X99fR99x0GJa4uGL13ebH1QWeY9PRdeYsPDiNUBisjjVH
	JPj8mnSaeCLyCRkxc/Hsa8a11/533YeDWzRIV20xFo0Ifvi57sVWbABVbrIw4IMJLeacMn6S2of
	4e0Q3UeB/oKP3vFcsUZZeeNJJ/1AXNgOrS1DKtiynTyRMrhzwVcSwgVRUKnM5ZX7eYXUzcgEqNk
	xbLI44Hiq0p9bD9u7SIeXk8UW/jDCT7P12vOBTiWNdXaTx1GOHpkBBVAnW0m4BLQsx1veLNtC+t
	NgLknxWHsyMwq8PLNvVBjhbMcYOph41Tkc267Yicj5e8YllcrfcxWvZlmq22y59erBAw5/nk1r1
	dW7OLza/iAfNaLshaMJBHCiiaWfoub1e/MU/CO23yF4gjjWKrU8nYqSREZMgb53elBXclJh5gt+
	RyXna0LGyGtoDpBMjWHzoY4VMLyedg7RXXTc4Ufk4zWBH5lYbYjkWqYCrOXKrQ0PgtLcGxIND92
	inDf26fIKuffPoCCTpJB8J1PBTAajmpVEQ==
X-Received: by 2002:a05:6808:10c6:b0:4d6:90f3:74b3 with SMTP id 5614622812f47-567e167dda3mr307509b6e.51.1793913856883;
        Thu, 05 Nov 2026 13:24:16 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm5349897b6e.3.2026.11.05.13.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:24:16 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 1/2] PCI: of: introduce of_pci_build_prop_ranges()
Date: Thu,  5 Nov 2026 15:24:11 -0600
Message-ID: <20261105212412.591931-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105212412.591931-1-elder@riscstar.com>
References: <20261105212412.591931-1-elder@riscstar.com>
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

Move the bulk of what happens inside of_pci_prop_ranges() into
a helper function that builds up the value to be passed to
of_changeset_add_prop_u32_array().

This helper will be used in the next commit to build the ranges
property for a statically-defined PCI endpoint devicetree node
when it has a "pci-ep-bus" sub-node.

Tested-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 126 +++++++++++++++++++++++++-------------
 1 file changed, 83 insertions(+), 43 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 702675672fbc5..b202f45b3660b 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -8,6 +8,10 @@
 #include <linux/of_irq.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/ioport.h>
+#include <linux/slab.h>
+#include <linux/wordpart.h>
+
 #include "pci.h"
 
 #define OF_PCI_ADDRESS_CELLS		3
@@ -104,60 +108,96 @@ static int of_pci_prop_bus_range(struct pci_dev *pdev,
 					       ARRAY_SIZE(bus_range));
 }
 
-static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
-			      struct device_node *np)
+/*
+ * Build a "ranges" property value that defines the mapping between
+ * child and parent PCI address space for each of the given PCI
+ * device's resources.
+ *
+ * Returns a dynamically allocated array of u32 devicetree cells, or
+ * a null pointer if allocation fails.  The cell array is built as a
+ * of_pci_prop_ranges structure consisting of 8 32-bit cells in host
+ * byte order.  It is suitable for use as the value of a PCI device
+ * node "ranges" property passed to of_changeset_add_prop_u32_array().
+ * The total number of cells in the array is returned in *count.
+ *
+ * Caller is responsible for ensuring the returned pointer gets freed.
+ */
+static u32 *of_pci_build_prop_ranges(struct pci_dev *pdev, u32 *count)
 {
-	struct of_pci_range_entry *rp;
+	bool bridge_device = pci_is_bridge(pdev);
+	struct of_pci_range_entry *entries;
+	struct of_pci_range_entry *ep;
+	u32 resource_count = 0;
 	struct resource *res;
-	int i, j, ret;
 	u32 flags, num;
-	u64 val64;
+	u32 first;
+	u32 i;
 
-	if (pci_is_bridge(pdev)) {
+	if (bridge_device) {
+		first = PCI_BRIDGE_RESOURCES;
 		num = PCI_BRIDGE_RESOURCE_NUM;
-		res = &pdev->resource[PCI_BRIDGE_RESOURCES];
 	} else {
+		first = PCI_STD_RESOURCES;
 		num = PCI_STD_NUM_BARS;
-		res = &pdev->resource[PCI_STD_RESOURCES];
 	}
 
-	rp = kzalloc_objs(*rp, num);
-	if (!rp)
+	/* First count how many resources will get a range property */
+	res = pci_resource_n(pdev, first);
+	for (i = 0; i < num; i++, res++)
+		if (resource_size(res) && !of_pci_get_addr_flags(res, &flags))
+			resource_count++;
+
+	entries = kzalloc_objs(*entries, resource_count);
+	if (!entries)
+		return NULL;
+
+	ep = entries;
+	res = pci_resource_n(pdev, first);
+	for (i = 0; i < num; i++, res++) {
+		u64 size = resource_size(res);
+
+		if (!size || of_pci_get_addr_flags(res, &flags))
+			continue;
+
+		/* Record the size in the range entry */
+		ep->size[0] = upper_32_bits(size);
+		ep->size[1] = lower_32_bits(size);
+
+		/* Record the parent bus address from the resource */
+		of_pci_set_address(pdev, ep->parent_addr,
+				   pci_bus_address(pdev, first + i),
+				   flags, false);
+
+		/*
+		 * For a bridge device, the child address matches the
+		 * parent address (including its flags cell).  For an
+		 * endpoint device, the (flags) cell contains the BAR
+		 * number, and the two address cells are zero.
+		 */
+		if (bridge_device)
+			memcpy(ep->child_addr, ep->parent_addr,
+			       sizeof(ep->child_addr));
+		else
+			ep->child_addr[0] = i;
+
+		ep++;
+	}
+	*count = resource_count * sizeof(*ep) / sizeof(u32);
+
+	return (u32 *)entries;
+}
+
+static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
+			      struct device_node *np)
+{
+	u32 *value;
+	u32 count;
+
+	value = of_pci_build_prop_ranges(pdev, &count);
+	if (!value)
 		return -ENOMEM;
 
-	for (i = 0, j = 0; j < num; j++) {
-		if (!resource_size(&res[j]))
-			continue;
-
-		if (of_pci_get_addr_flags(&res[j], &flags))
-			continue;
-
-		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
-		of_pci_set_address(pdev, rp[i].parent_addr, val64, flags,
-				   false);
-		if (pci_is_bridge(pdev)) {
-			memcpy(rp[i].child_addr, rp[i].parent_addr,
-			       sizeof(rp[i].child_addr));
-		} else {
-			/*
-			 * For endpoint device, the lower 64-bits of child
-			 * address is always zero.
-			 */
-			rp[i].child_addr[0] = j;
-		}
-
-		val64 = resource_size(&res[j]);
-		rp[i].size[0] = upper_32_bits(val64);
-		rp[i].size[1] = lower_32_bits(val64);
-
-		i++;
-	}
-
-	ret = of_changeset_add_prop_u32_array(ocs, np, "ranges", (u32 *)rp,
-					      i * sizeof(*rp) / sizeof(u32));
-	kfree(rp);
-
-	return ret;
+	return of_changeset_add_prop_u32_array(ocs, np, "ranges", value, count);
 }
 
 static int of_pci_prop_reg(struct pci_dev *pdev, struct of_changeset *ocs,
-- 
2.53.0

