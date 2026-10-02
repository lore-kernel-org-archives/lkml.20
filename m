Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434433537FF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957842; cv=none; b=jSxrdj8KuD+XSYoey/QwVz4VUrB9oFdHfdOBNAVe8aXB0t5VW9/IK3skqOQXGeIpe2zw4bPP61NBbqWYvam+buDgcEyaupttAIyWfIzn+LrBj4C8eCyJPBjunIeWJPN6OdyNP/getbAPpxfxEmOLO9kowSwklqB4Ad206d+Ot3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957842; c=relaxed/simple;
	bh=MyBN7nnBw3QNPXaan5Cq3lLqlU0H/yPFUpqJdz0cWdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZFhvJ3OgLVj30oOAiRdzovU3n3NEWsmyXEvvKq8+IIeehn0t+RMYka6+wyay9e/ky8N+qMkt6itF4W3VCi0/VsRwfmh7n3vP3rNTLVlm3xIKK+LzMLGwcB9uLDbSK/CP6Wl2Z3mEQPrbPfAaqRqi07w8Uc9Sm4oL30hVfv8BWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIZmf2lG; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIZmf2lG"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso12112571a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957838; x=1791562638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WnmIAjuSEnHEbu2FskxY54VtxWjUv46LMUAmUQRpBk=;
        b=PIZmf2lGRmxOScwuaRvB3PEAbt1nnUTKXz6leG3cIOT3b8NgPFUax4wk4Ihyjq5Qji
         NiIsv3GRkm3/XcvW925tPM4t7AJUwiXmazcFOv2uSul+L8JtLYg1OvK7V05TTat+QhZh
         mrS3GJuL9SnzopetrVT5LuwplO1TnH6d9jOi3erswD0RXB4CBj7eyaD/K8OZXR9sISNL
         5VzV9A2Yb7czt3bLMy4rmlKMoofR2TiCtcKLSxjLpm2FMPwPy8YoOjhED05G/mDJypP/
         rwm4b2nqJ9/Nauq0xwMSYyixXoDQmQMy+8FZqDjz4LZivpKGNlh8a5sTc8XSA7M3qkHY
         Ov6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957838; x=1791562638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WnmIAjuSEnHEbu2FskxY54VtxWjUv46LMUAmUQRpBk=;
        b=szLmU9JkcT8nwkBWlXS49UqmhOYS+LOkdozXekvTcFH6hRVbP7gDYIfBoJmEg6PS4w
         07nLvYdYpOk1KouRtMcvHr608VkpdYvD5k6W9e9E8+oVdC74/VdbEPV5fg5ej66Ifb8j
         oNG/UcGWMa164KPVrxUyqGRsQZQosdA+6KQhSzc85dHdJGdgGTkhMPh4z2i3HxKCAe6p
         /Vm+gvy5kDYW/QPWSrtMFWMWvMlglffjefNr+N24y5wiXgHzTFYWDKglun7TmMaiZEyw
         G8E5MLazsCHpoXMAK9yuSY3bo15jC7tRTB75uLFcsEtAKuEMO64A96tjKyaLrDc/SkHk
         JFwQ==
X-Gm-Message-State: AFuF++lZSaTjEOoJfAOP1WpvaPqFnCqNJo9boxKunOs/jmgqoK8MP2ax
	LEE0ZKapcLtzwgY7/fk2yhYyDppxbmfo+ZDTkLmfLZg0fOLmu+fXQsn4
X-Gm-Gg: AYBFou29zDkvzTJ/hQe3SV0XEKOrCwJvkDZJsXfFKxHUW0if7by3SopLriZgMNwud3r
	xgvPdZEnI/y7FbSWmgIMtFk1oS2ZS7CkLVxJqrTLIDfySB6mQLQjmbZqoyJWo2RKgLFOFPQJy4p
	c3OGw0D9oD948wpU0n1ODkL9piYAVU7R0Pc2gx879sN2IGrUPc3WAtgfYGw14tX03yt7BYqaBvS
	k8VUF9eWO5NA04fKxbTsjvPsiRNkxY73dh5JCjjJq5+vRaFwF2N3Rgl2YR1biV7fEOUQJSy0KyX
	fTr4+qfMcckH/4UPmCBmbwuFjVtRVLpWP4VZ3tIvZqsKSgEecK2EnooSSXsMnimz3pkACyhOfCx
	KO7GwT/iEH+AtycpKjLwza1jpzoQH7CxAMIbaZ0JRPkFChSgp2CUXGS2X5yD8cMWO2pXOiuyaNf
	tAvVq4Q9BAWG7+aBa6ruH4XE+Ob3OvWuZDkjuff4jYpz7KyjjEvlR9wqq9A4hzEOrMCigCJVG5M
	bUQRHX0QNCbMj+fAqH1kh0RkZjLbrAkmQmEWD7BF4ZfHIxHhtQ=
X-Received: by 2002:a17:907:9693:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c2e4ae1e30emr252668166b.35.1790957838142;
        Fri, 02 Oct 2026 09:17:18 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm106437166b.42.2026.10.02.09.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:17:16 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <mchan@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: [PATCH 6/7] tg3: normalize inherited M3000 register byte order
Date: Fri,  2 Oct 2026 18:14:28 +0200
Message-ID: <20261002161515.932316-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002161515.932316-1-linmag7@gmail.com>
References: <20261002161515.932316-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M3000 firmware can leave BCM5718 vendor registers byte-swapped while
standard PCI fields retain normal byte order. Match the Fujitsu 10cf:165a
subsystem, IKKAKU model and swapped revision/product signature before
restoring host control; reject failed PCI accesses or register readbacks.

Keep this in probe so failures can abort initialization; SPARC firmware
enumeration skips PCI_FIXUP_EARLY. Normal rebinds and other platforms
retain their existing path.

Use tg3.h's MISC_HOST_CTRL_BYTE_SWAP and TG3PCI_GEN2_PRODID_ASICREV;
the inherited state was observed on M3000 hardware.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 drivers/net/ethernet/broadcom/tg3.c | 91 ++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 73a4b569b03e..9335bcc0d8d3 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -56,6 +56,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/crc32.h>
 #include <linux/dmi.h>
+#include <linux/of.h>
 
 #include <net/checksum.h>
 #include <net/gso.h>
@@ -16248,6 +16249,83 @@ static bool tg3_10_100_only_device(struct tg3 *tp,
 	return false;
 }
 
+/* M3000 firmware can leave the on-board BCM5718 registers byte-swapped. */
+static bool tg3_is_m3000(struct pci_dev *pdev)
+{
+	struct device_node *root;
+	const char *model;
+	bool match;
+
+	if (pdev->vendor != PCI_VENDOR_ID_BROADCOM ||
+	    pdev->device != TG3PCI_DEVICE_TIGON3_5718 ||
+	    pdev->subsystem_vendor != 0x10cf ||
+	    pdev->subsystem_device != 0x165a)
+		return false;
+
+	root = of_find_node_by_path("/");
+	match = !of_property_read_string(root, "model", &model) &&
+		!strcmp(model, "IKKAKU");
+	of_node_put(root);
+	return match;
+}
+
+static int tg3_m3000_fw_byteorder(struct tg3 *tp, u32 *misc_ctrl_reg)
+{
+	struct pci_dev *pdev = tp->pdev;
+	u32 prodid, expected_prodid, normalized, readback;
+	int reg, err;
+
+	if (!tg3_is_m3000(pdev) ||
+	    (swab32(*misc_ctrl_reg) >> 28) != ASIC_REV_USE_PROD_ID_REG ||
+	    !(swab32(*misc_ctrl_reg) & MISC_HOST_CTRL_BYTE_SWAP))
+		return 0;
+
+	/* Standard PCI fields are normal; verify the swapped vendor registers. */
+	reg = TG3PCI_GEN2_PRODID_ASICREV;
+	err = pci_read_config_dword(pdev, reg, &prodid);
+	if (err)
+		goto config_error;
+	expected_prodid = swab32(prodid);
+	if ((expected_prodid >> 12) != ASIC_REV_5717) {
+		dev_err(&pdev->dev, "M3000: unexpected swapped product ID %08x\n",
+			prodid);
+		return -ENODEV;
+	}
+
+	normalized = (swab32(*misc_ctrl_reg) & MISC_HOST_CTRL_CHIPREV) |
+		     tp->misc_host_ctrl;
+	reg = TG3PCI_MISC_HOST_CTRL;
+	err = pci_write_config_dword(pdev, reg, swab32(normalized));
+	if (err)
+		goto config_error;
+	err = pci_read_config_dword(pdev, reg, &readback);
+	if (err)
+		goto config_error;
+	if (readback != normalized) {
+		dev_err(&pdev->dev, "M3000: host-control readback mismatch %08x\n",
+			readback);
+		return -EIO;
+	}
+
+	reg = TG3PCI_GEN2_PRODID_ASICREV;
+	err = pci_read_config_dword(pdev, reg, &prodid);
+	if (err)
+		goto config_error;
+	if (prodid != expected_prodid) {
+		dev_err(&pdev->dev, "M3000: product-ID readback mismatch %08x\n",
+			prodid);
+		return -EIO;
+	}
+	*misc_ctrl_reg = readback;
+	dev_info(&pdev->dev, "M3000: normalized firmware register byte order\n");
+	return 0;
+
+config_error:
+	dev_err(&pdev->dev, "M3000: PCI config access at %#x failed (%d)\n",
+		reg, err);
+	return pcibios_err_to_errno(err);
+}
+
 static int tg3_get_invariants(struct tg3 *tp, const struct pci_device_id *ent)
 {
 	u32 misc_ctrl_reg;
@@ -16272,8 +16350,17 @@ static int tg3_get_invariants(struct tg3 *tp, const struct pci_device_id *ent)
 	 * sure that indirect register accesses are enabled before
 	 * the first operation.
 	 */
-	pci_read_config_dword(tp->pdev, TG3PCI_MISC_HOST_CTRL,
-			      &misc_ctrl_reg);
+	err = pci_read_config_dword(tp->pdev, TG3PCI_MISC_HOST_CTRL,
+				    &misc_ctrl_reg);
+	if (err && tg3_is_m3000(tp->pdev)) {
+		dev_err(&tp->pdev->dev, "PCI host-control read failed (%d)\n",
+			err);
+		return pcibios_err_to_errno(err);
+	}
+	err = tg3_m3000_fw_byteorder(tp, &misc_ctrl_reg);
+	if (err)
+		return err;
+
 	tp->misc_host_ctrl |= (misc_ctrl_reg &
 			       MISC_HOST_CTRL_CHIPREV);
 	pci_write_config_dword(tp->pdev, TG3PCI_MISC_HOST_CTRL,
-- 
2.43.0

