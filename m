Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051511DDFE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497101; cv=none; b=c5sVJfkNT6PM0dgI1BBl3LSTSM3uzcjxVqXqZezD1UQKWwdmP+UbCePzuxFLXbHL9O1DZS8zgQgWwmNkTQH0Cid/fKXhxqbsmQQkk3Sk/VfDVGipg5Qa4bVxzxYIQ/1Ced8HpjyGNg56KEjm78T3xD5wKiat3zfi7VcHCQf0QWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497101; c=relaxed/simple;
	bh=3wpSjBY/I7g9gOZFmdzHZU8Of0zVvJGk1pU2XSV8U1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cu9sgvZlPswpa36JgDbVgk8WfHob2HxjhecR7LL+uTsMGo00iYpw6ZGbBWxtqML+RZXVa7VTqWR2wg80GGTvTeZamP6lFThqfEaYyITPGt5anpj6CSqo1KLFOnr+qJ5me9a9seFjP8WcWfvvmwgJiuZR+qS0O8NrHRahC9FZupg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjoretWQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjoretWQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2a4e013a44so886678966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791497098; x=1792101898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zO/pByUBdtqSocQGJbztOlhRBCY/I/SOyW+XAegmzr0=;
        b=pjoretWQ1lfnXtw77Mau64GEICTpwnZ/rDJd6NRMzJzTZ4fL/liIAlMxb7dIGXPOsG
         oA16EoVkCzwnK759EeAlEMsWcd+K0nb6NP8PmR2w7/w3tFQXnNvfRuwEkps6a5aBljR7
         vSxUa2zfJ/d89rfnJSzRn/N30FyKbAd4zFUBbmSu3VLcOiS5C1wyKAJqgFm0dvSeUFvS
         wdrwOiAzg9/h+W0WyFm9U+ycu4eRurVN3Tijcr6QF0HV1Ocv/giJvjT74tWuaLNiqwtL
         URkMY5zFG6zOkHt6s97OMhATBkc2j1JGsUz8A2e9Y1K5Sy7eCShXFN6zf2IPwElFsFOL
         je/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497098; x=1792101898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zO/pByUBdtqSocQGJbztOlhRBCY/I/SOyW+XAegmzr0=;
        b=lNn0it5WtD0pOKdVMNz13/7oN0iyU3WoO3Rsr3K+108cLslMyfmmBCJjpQ4yJ0ANLd
         Aw523OaLJCNCeCP+PtQP1K3rx/uns8CvXLSelgs4wlGbdNvWlxDCWMZBnar7Mkr7F+q1
         ZUxKrovK6YnlaF4qiQJZZn5HPr4gtuHYaz2QgfTDreD1vow5RCVLXJI3iaXcWgM82mOq
         Sqqvbf1ZrR4JnDlUZHKaQOnkHLYPcSseP6e+Ls5jpUEg0nCLwU/APHubc3TGv0nucA9E
         GFsZ6qqtD+xc/prVzjPR44JLKwk4FzjSSDW2Vv6mtqyQ76xPXgv6eWefgSIh/hFlZcES
         ntkw==
X-Forwarded-Encrypted: i=1; AKwUvBxqOVllR9PCVWKrTSTzPPgokUcEYiipI8SVrEvM5CoEFAGVcdAkutrM7YBRcQm2o2grLV08ZOakyk/HcxE=@vger.kernel.org
X-Gm-Message-State: AFuF++nP7iUxmBmKVLJ4eC18AAVAkMJtfS98FS/Yl2OkS9xgtERLH1pT
	RFFTQ+Fkfz8upCoqssscoZ2HCj2JipB55WsmrHbLfG8sUVfZGA5Ar0wC
X-Gm-Gg: AYBFou3eZ0uKyW1tHHAvM8tDT4P3/k8w9yJEDRdzXbVZHwADEgC4zpsT3a4lz+A924s
	ovhVwsImiRnnLteyhWxHx6v0qPVAMBQvVQdkGwgr01Zcc5y0iJSLIPacvlaAZJJcc9loEgVi61E
	+Vk1PQnzAU72d4tX2tYh4yRN2AjW7nv4JRzGDwkbX2+e2wsXyeVypqHX+xtlb9OUM3nNBw9r8SE
	llzUrRtp80M3H248f/Nj20IfC4rmvGvbg02JeifZLH9ATFyua3DniAUWXxoZO4dXQz5gT5qy61h
	LTPCDQqhvdQPHMdYzOtr2GR6rlAdAFYIe71t5nSAZvTnay7NBq2rJePXniUa+JSpVn1KajtcswL
	6b+XLuJ2E3xxOkfbnWxaP6IkYMsE1w6KPSMZwbS8cZQNcyh87OcY9lrUAkp2xnTHP3pI4dQgsHG
	3iv9UnJ5lydo3foOU5pLexXPF8kl7YqOSVqsxdJcQmjfMld2uOgiVTU3NJYFnwLUAtBRQQtrPB0
	0KSyV1RCYw0Kl02Urh+t4B0L8ZIPcCWuCx6z3Vg
X-Received: by 2002:a17:907:3f25:b0:c31:82aa:dd4c with SMTP id a640c23a62f3a-c31a9d15f06mr9124366b.24.1791497097994;
        Thu, 08 Oct 2026 15:04:57 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74c48sm3718166b.43.2026.10.08.15.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:04:57 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: pavan.chebbi@broadcom.com,
	mchan@broadcom.com,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH net-next] tg3: normalize inherited M3000 register byte order
Date: Fri,  9 Oct 2026 00:04:03 +0200
Message-ID: <20261008220433.965791-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Previously posted as patch 6/7 of the M3000 series; resending separately
as requested by Jakub Kicinski. The diff is unchanged from that posting.
This patch has no code dependency on the M3000 platform patches.

Link: https://lore.kernel.org/sparclinux/20261002161515.932316-1-linmag7@gmail.com/

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

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

