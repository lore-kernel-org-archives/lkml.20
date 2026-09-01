Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2F1392814
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225230; cv=none; b=p18lv6suK2MOmrukIQpt99hl2lJrKQuMU8NeG2fSDPzauH3bCnPgaxHput7HEpvCPWmt1IK378QSWW9bVitXVsNIqNL/TE52t/u9jEEaGu/UtOOMIEDR1/gbGcDqMpoQUwfV0TzobwcGyTjQBO/J8LhNClqS0iZRpkRchNTdbDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225230; c=relaxed/simple;
	bh=N1/zE0vOogzKBBPg63BlWE0GGZRJLhZwlu+xUzAqzIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGxyNfYybkuMSY+QmGcmB72odYGYjJfJkh64MYkVxk4l73GfdgyJWBgzo8RS2aZVQIh/j4+Lndjs28o4gjmohaM3hAz8ORhu3KqnWq8wJKHcUydXg/458gwXGG9Yg2q7Dm0yKaGlygm1ex7P3SEg5U/mQFomqUoqSW4TkWjvuGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=we4uzwAa; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="we4uzwAa"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92f0b5ed131so503454085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788225227; x=1788830027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxdgYaNd6hSon04HBpeXAMQRDv5bhxmTgVA17jV1UzA=;
        b=we4uzwAaEHZDjQRUtrMHnDBvO8zxLQzWRHZs3bkFVtVvLYViV6Omsc/VWbfmJBYBsU
         UGto5zqc2caePWr0x7XiWriVxFPjAxZB/yurzGOuMK64ANRenXIsrP5it9Ldd+H0uaOM
         AFkbLKWwTm7Jx+7O80i3dypGlZ1ykFMHo9R4TJ+e/ANmvK3MEJSRYAeG/syPmyQ99Vk0
         dl336pXPhc8MBq796slMVIULfacGV2EkYbvA5xa6vqCKgitZzuKBhfYa9RgUjn+3CTvg
         jeJCFCpIZWUdbJeTwep6FC8xhcCS+wyCwKHV4wVI3SKerKhAwm8o2ywTY10vY6F/3YbI
         Mmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788225227; x=1788830027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KxdgYaNd6hSon04HBpeXAMQRDv5bhxmTgVA17jV1UzA=;
        b=tOpL9OmsFD0f1WIdj9Tq+QJOeMuSveop2B4i+EIWQuhQt22Sh4M2veA3mFMfNndLKn
         CXB27dsoAln8U4w0MD84mCn6ZjRjC36AtK1Vw7YeTS31hacNZNq73ZNRiqEgJjtGlz8E
         bkQPMMFhIqFqb6wcM7yEZE9recq7Vrj+j6oviGrFBhFfRJgT2OsaYkW8r9/MYW2zCYwE
         qbRyZooaHjrq+Vy9yLMU0Z0ZiDTQwpN0WlE7B0aYIZb6ksBnRn61+46O5TQHCIWG4/ye
         g4OpCaoX3ruHqPwitZ7rpL4q7RkGrHhTydMsT725coG1MwAiSXHpDCWJeJxD201rD4E9
         pPBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8a5/ZZ93f0cK9Tq1pAImJ1qikyaSVFb8S60QyPLtEAa8oHNxAxwUVs5cUG8V6Q8VPA/ljqu59SdvtE/g=@vger.kernel.org
X-Gm-Message-State: AFuF++k/zXgGDBhxcUiK/IiJO2rK12oDh4w78PtrzgpZ9Xmrl8ZkulUs
	xoXVtyMmRjjToS6tkODZaGtVe8tpCZXJf07hHgfPyZlQB9pcvp0dA3yspL5URLmq6P8=
X-Gm-Gg: AR+sD11qbvF+HGTMgMHRFEly6LrjSm0s+qr0SPj93f8ZiYP3gGd4IR5WSPwVDeXDP8v
	7fwfg7NtfAFIUbP3JbEsKVQ88ucJaz7GGRJd6uQ7xrY7/A27omjoCe7Bd8RIrnDNLBafggJaPtU
	tLAoKk4tiwel9R+voQLY9Zq8Dx+qbih5dw2qaylRi8INZ+voc7hbQzWiQcVDzBONyeBLEhhoNYP
	yl01thpteK2RhVICueXV7s/kUPx+Bokvd6eCY/gQX7FM2yh0Xm4fdjpWNbcJNhSU5lXj1tZJeFr
	ZwIcwF2mIeRp0ta3ckO/2+wMHyoNXNQ6n6TPlE2VYrewTqmyzIqQBqK5HPgeoRZEuh/ljwFbA+w
	2OXK319jYFk+GdRvPkBdYIDEsGkLEodqDab6OosfG6pbDFwueUOfT+J0F1lRDqBISRL1obX8dPM
	FnqgojaqxG/J9lp/R3W3fMTsnPU6Dw6RRtS1oL0IulSFWpqOeFU9TllB+ag6GthuTv/V/lXHGx/
	CE=
X-Received: by 2002:a05:620a:4550:b0:937:27fb:96f8 with SMTP id af79cd13be357-9391397dc7dmr3345492585a.41.1788225227134;
        Mon, 31 Aug 2026 18:13:47 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391740a307sm581347285a.42.2026.08.31.18.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:13:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] PCI: of: introduce of_pci_verify_node()
Date: Mon, 31 Aug 2026 20:13:36 -0500
Message-ID: <20260901011338.1323243-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901011338.1323243-1-elder@riscstar.com>
References: <20260901011338.1323243-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 407d1a51921e9 ("PCI: Create device tree node for bridge") linked
the PCI enumeration process together with devicetree, creating a devicetree
node for discovered PCI bridges.  Its successor commit ae9813db1dc5a ("PCI:
Add quirks to generate device tree node for Xilinx Alveo U50") shows how
to use a PCI final fixup quirk to also create a devicetree node for a
non-bridge PCI device.  These changes allowed devicetree overlays to
describe components downstream of a PCI device, by providing a place to
attach the overlay.

Note that the dynamic devicetree node is only created if the device didn't
already have an assigned node.

Later, commit aa7b4bbcb3a1d ("arm64: dts: qcom: qcs6490-rb3gen2: Add
TC9563 PCIe switch node") *pre-defined* devicetree nodes to represent the
PCI device nodes that would (also) be discovered via the PCI enumeration
process.  The devicetree node in this case is created with the content
from the DTS file.  So when a (host) bridge is done being initialized
during PCI enumeration, no node is dynamically created (the commits
mentioned above do not apply).

Ideally, any pre-defined PCI devicetree node would contain exactly the
same information as whatever the dynamic creation process would produce
(though it could include more).

However that is not the case for the pre-defined Qualcomm RB3gen2 nodes.
And in particular, the endpoint (function) nodes include this property:

    device_type = "pci";

This is simply wrong; that property is meant only for bridge nodes.

Rob Herring requested that a runtime check to be added to spot this
specific error, only for non-bridge PCI devices.  Herve Codina further
suggested we ensure that bridge PCI devices *do* define the device_type
property, with value "pci".

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Switch a function header to use kernel-doc format
    - Add a warning if a PCI bridge node has no device_type property

 drivers/pci/bus.c |  1 +
 drivers/pci/of.c  | 31 +++++++++++++++++++++++++++++++
 drivers/pci/pci.h |  3 +++
 3 files changed, 35 insertions(+)

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
index a51dff91b196d..1838a3109514c 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -1085,3 +1085,34 @@ int of_pci_get_equalization_presets(struct device *dev,
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
+	device_type_pci = of_node_is_type(np, "pci");
+
+	/* Bridges should have device type "pci"; endpoints should not */
+	if (device_is_bridge == device_type_pci)
+		return;
+
+	dev_err(&pdev->dev, "PCI %s have \"pci\" device_type property\n",
+		device_is_bridge ? "bridge should" : "endpoint should not");
+}
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fddddc23..2e33d3bd4b0ba 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1253,6 +1253,7 @@ bool of_pci_supply_present(struct device_node *np);
 int of_pci_get_equalization_presets(struct device *dev,
 				    struct pci_eq_presets *presets,
 				    int num_lanes);
+void of_pci_verify_node(struct pci_dev *pdev);
 #else
 static inline int
 of_get_pci_domain_nr(struct device_node *node)
@@ -1308,6 +1309,8 @@ static inline int of_pci_get_equalization_presets(struct device *dev,
 
 	return 0;
 }
+
+static inline void of_pci_verify_node(struct pci_dev *pdev) { }
 #endif /* CONFIG_OF */
 
 struct of_changeset;
-- 
2.53.0

