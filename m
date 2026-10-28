Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184768;
	b=VlEGWKpdBC15UDZtNcwEEK+swiXLZ0b6s6G1QaFVu13Hg6PYfdby4J7tovQDyDXG60TV
	 SegyNMCCpsvpWr2wuQyFQExL3UMDuVgDn2oCUNS/gwlChjfD/ADxN/V+1aS82ak0rkKPn
	 wGOWERCeNoPxPiLODCyoJw4+i2aU66B4ZWcggV1woEONx0EgactMHHz1fyu3KcBfDLAil
	 EWUx5ggqLIl3ufGvzzCAjkn/eDaG0hlGmGLdyOWiUnJ0oRTNzw5CMNmjJpqsNJiZ4go8D
	 sDJNwBo/fC3wCKV9GYY+UW/tytsUOXAPsTEti9YzWooo01VVT+OGT+eoTequo7NpcFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JVEW9pJr+HD2a1AZwH9+kAj2JVI8SOiPv9NNvo5WXjY=;
	b=4w/Q+qFr/sr5Wqyuo+KRUbMhIbs0bYCsuyOHCSh5P+MLWefAOfkpDNXoe6hzFnL4ITXv
	 lCBwz/JIqximU0ycZ229HiVC5WPYkOrDsbtUjHjXo7RJV8zXViAFW950i1sVyXnXO1LKQ
	 Pf1qRTK2wgIgVwDDozEkaSs+4UQaxPqbDVATv3ls3ly4ReyEBsDTCqGu6txxL+kONiVbL
	 Pm4HJEEkLbiYwZDOL0cGUOXAIW0IYRO8VfGVCS4AiZPzlj5951TUMgGQUVWRmqV5CqMEW
	 XndnYGLIsictRdFlleCCckns2UsLeZ9jbMvEKsVryCqtC4BYAk6LwFYUO8AzsI/xsKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcz+XpfF;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0FB606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A0FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcz+XpfF
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1846bc43c28so919889c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184767; x=1793789567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVEW9pJr+HD2a1AZwH9+kAj2JVI8SOiPv9NNvo5WXjY=;
        b=kcz+XpfFSFt/rGYZlD4tmCPxIMossepLPh9HtCqJXQKvNLXdD6SlyGlYQtKPtdGcyf
         Q3CqV3mCCNjnrrXjWglhSCtoVquWCu//lNGpFMswxy+901feI0LWRH3UiYIfqzwEuBqS
         ABhROWRYeJMwyV459dqntIcWB0NK08CY/+M/nsewl2e59nLzlkROpGF8VNVFlrg5UegA
         xQSrsWkpsMnyStStkjKGccwaXJu9SweDjnYG0vY/vu3ocCZgY4gk6rTnqxarWJ4IRQfl
         dp248GbFqb6P4Ir7WGLdaFfTj/1Ef0uyPM8TB5m+KmfDVg+c4O11Un2GDiO/4v6Qr8XZ
         i9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184767; x=1793789567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVEW9pJr+HD2a1AZwH9+kAj2JVI8SOiPv9NNvo5WXjY=;
        b=ZNjCF06PlUk++KIy1O1JrmcX1trC0q+K1jcXw6td9RizFykmgSeR8SVeP/zQbdQxv3
         FJdDBrsxgmxSwu53KGBT4GsoTf+pKMCon6no7oUKB9ESxVAdWGRN/MIIPdanjeeWvsWa
         2lAlTBdkGpeyMqtWiyH1wsqK8ffSe3aYtSFSXIkjiFHAddJH+/SkON/21rRwF+t7e2PK
         5h0ec+I8GLd3kpB8rp2IgZXGGCJD9Komiqx9AyRk0LDccgezcaXxDag4Pd7SN8FNshBy
         NtSXHI3GJy7WbmJWiBBoTMNarcEdHu+lSvlybBWgp/YwwAOGQ3m5Slnv1krfdizDjrPJ
         5Jpw==
X-Forwarded-Encrypted: i=1; AKwUvBxvC2dRnAB3ebNxlc3B13NDUXC/DPcs483nQIuTwf8tOVCDf9wd8ncsjfyB0H/zPgeAy4f+SQFGi2ejIoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL41PtPXMiwjW9cBxvFsUV7GtOmu1YbzGweFNwHLxtu3PtCIEmt
	/27p8r7546oA5ALHrhrxFdZT+O+1/1S1TltXQjiCdEv/MABQsBm9ecJE
X-Gm-Gg: AYBFou1LdC7ILyd9Xb10Qc14tCy6sLZlaYpiCiefKEuOp8xJN/NKuhrd+rsmtP+QlY8
	yY53PXleLudTU7zsbRLQb8QLVsnqc2khF6YySertLmRR8muFXr589SYSziJWh7tg+swsB38Lrhv
	kqy5brQ+KdSPeN7tuXz6smFjGkqh0WyZ7QykOIGpx4WL4on6wDG2GvOec4Gxlwi7jGEV8mGHrAZ
	LRZGUYKf1e8OAMxrrLezBrIz0nbqg+3k21ZV81NbILjD9LOiUjGRG4/KdV8oyFlDzAQYHF03I9G
	NzkmZ4aXzIB3j/heFJ5g3bHz3w/dQMEd3Rgj1ZGlZNDpTnpwT+Qd4f/XGypeEdkzNpYn0EEn6md
	yPW2A9PEZiTxSP25VdqzGnlxyNiuPTpfxUEOHZtXNLvnq8ftuI78dy4rtuzaLvOie04HwR5xqtk
	wHnlpU3nbful5hHB4VZRX5MnUA3FoamXS5cGwBzP83eTTdOW7RDYFWoP2hGfueWfAWFMOp6fmgV
	XsRwmWTyL7MKu4PSAUGTNaC0Rn71JpXtns/WTJn1cEb3Z7Nd5F9E+yIiL3cLnZ1isBkS/uiRDVi
	QgAGBNRUA7fEgQ3UoVb2URKuavibp1TlkorkM6iKlXpGqFTcQTY=
X-Received: by 2002:a05:7022:1003:b0:19c:c396:37aa with SMTP id a92af1059eb24-1a6ce1136b3mr3280960c88.22.1793184767262;
        Wed, 28 Oct 2026 03:52:47 -0700 (PDT)
Received: from localhost.localdomain ([103.177.252.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm7083152c88.21.2026.10.28.03.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:52:46 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	ryder.lee@mediatek.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH v5] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 28 Oct 2026 10:52:11 +0000
Message-ID: <20261028105211.2773-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
References: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
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

resource_size() returns a resource_size_t, which can be 64-bit on
64-bit architectures or 32-bit systems with LPAE/PAE enabled.
Passing this directly to fls(), which accepts an unsigned int,
implicitly truncates the upper bits.

Furthermore, AHB2PCIE_SIZE() uses a 5-bit mask GENMASK(4, 0). If
the size order exceeds the range representable by this field,
higher bits are discarded by the mask. This can leave the hardware
translation window smaller than the OS resource, causing bus
errors when accessing BARs in the unmapped upper region.

Fix this by using fls64(size) to calculate the size order without
truncating the resource size, and return -EINVAL if the size order
exceeds the supported range.

Changelog:

- v5: Use fls64(size) instead of fls64(size - 1) and remove the
  redundant zero-size check.
- v4: Fix struct device pointer access (pcie->dev) for dev_err().
  Verified build and passed Sashiko review checks.
  [Subject: PCI: mediatek: Fix integer truncation and handle
  oversized resources]
- v3: Replace clamping logic with strict size validation
  (size_order > 31 returns -EINVAL), add a zero-size check,
  and update size calculation to fls64(size - 1).
  [Subject: PCI: mediatek: Fix integer truncation and handle
  oversized resources]
- v2: Add size clamping for size_order > 31 to prevent overflowing
  the 5-bit AHB2PCIE_SIZE() macro mask.
  [Subject: PCI: mediatek: Fix integer truncation in fls()
  and clamp size]
- v1: Initial submission using fls64() to handle 64-bit resource
  sizes and prevent integer truncation.
  [Subject: PCI: mediatek: Fix integer truncation in fls()
  for resource size]

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 3a3e91cd0c21..6821452a82b6 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -686,6 +687,8 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	const struct mtk_pcie_soc *soc = port->pcie->soc;
 	u32 val;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -753,8 +756,15 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
@@ -775,6 +785,8 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 	struct resource_entry *entry;
 	u32 val, link_mask;
 	int err;
+	resource_size_t size;
+	int size_order;
 
 	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
 	if (entry)
@@ -829,8 +841,15 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 		mtk_pcie_enable_msi(port);
 
 	/* Set AHB to PCIe translation windows */
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0

