Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187380;
	b=x0/l8iHsCLWop2DwnFlvg4bF9E4O2nr2x3k8nVoWGga72O8EDYUGd1isPNZJRzJS/n3c
	 bdw/vBasluiObW3GTE8lps2YGAbhHj3otfwodACFKsRLz4nvZwqSVSzPGlQYehoPisrNS
	 By6zNaUdzVJRD8U74FIEgns4EmsqnFS0O6BlrB3WeXLmflQwR0cWsWUTb4GsM7WKtrc5s
	 ChdfBdmE2BHPzPA2OPxUeur3n5Yhj4KlOQanpdrm6mfO5US1cjZ2vLJjkHU2SvoHVCnF+
	 49i1Cu499z/8lX8q72/gw9A06URImdSsdh7yMVsWl12NylgJwZx/rpSx8SJ5zQEmjig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BqcLJCt/Zv6v/NHtTbSxJ0dXgZEQb3K5NLkXSY+SP5Q=;
	b=3YtUDn2EKHvqTVSRs0sH1Fdr7h8qyIzO/1ZeyZOOl3FQGOncpxKEE4lOp6mcozciCmwn
	 yfDVHkp8f+q6t2HWomauoONOD72dErs88f01/9PnE71MMJIfVdHYVueRouRemHqVjBnlo
	 ulzoNBZTfVQTQ/R9irl6MvtXTXGNGhZOcmr6LVeFzEk/mUTrQ7h5uXObZGnLo2XuHBKtu
	 3l3asnmUN+rKPZE7zSEo5bqUXhO3R6kdHE+OzhqFIeZcCXIVSPOpMgyYBRGTFqot9+2V0
	 Gm39rItbLs7Qq45EgHYK9SGFeMAZJ3ccmEDjlO7VNnjZQ7KXpIcIHppeVyamoPwfPYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JF5UzmNd;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F84606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F84606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JF5UzmNd
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35b2c599f43so1854492eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187379; x=1793792179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqcLJCt/Zv6v/NHtTbSxJ0dXgZEQb3K5NLkXSY+SP5Q=;
        b=JF5UzmNddHhtz2/oYUx2wKcB3EeIBY/JHtxjH5/Z5b8X1Y9wWsMOHPzWhSL1MrNX9b
         SNEHHLtuL/8uMApI+sQoUlmCZ+onKTHMg3Pypzvj+cVgdOYxvLhy7yIpw/k+Jwp8QIJx
         Tfl9uLSkTWLIS/kOyM2O0UMXicgTi/C1puRPBvFATpbCS3FohBEjmbRsYqTGBFIC/IU8
         pD156d8CkJyMCCX+OIBvCFOxTug9Y+pzpD2U2XF2Pbi5+2VrhRfUMaoL9D9faXSR6YSs
         0YTafJxXP/NOwqXtlMC37UQzeXHLUdkLgxX6uNV5RDd0mxKomGXSEldkhTpWs9xee5xU
         Eoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187379; x=1793792179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BqcLJCt/Zv6v/NHtTbSxJ0dXgZEQb3K5NLkXSY+SP5Q=;
        b=z6Oi2sMqKt8krhcPvqL9CWyN+MQI7GDu1GJQyYz6+Gv0UfY8KTc/G5l4V5a/hn7GTY
         rvfImMAQbFTjIeb3aJkzbNTil/6TdwmLDL1gqmLprK6Mb6XgqrxKy2CchH4M8lU+vlUe
         mbHnUln2k0qqck5oF0jgPCPV+aUKOhvabXBe6m5alZgow8cPHsbcg6oJI9zNkAlGqoff
         Jue2bon0PUV4pheiiKmd59OdXqu8qnG4XeJ+FboEHaTGf29tEPHFloFORb0xB5dnVLxN
         wXHAhJ02dMAnoJwGy7PIbmoPzlMCDuzaOEBPIbLwIjZoehSU//hx+N3SWM1eQWEtNTPh
         aPEA==
X-Forwarded-Encrypted: i=1; AKwUvByvix+jRsXhwqxNKZ1x5RE1UHdAlwAsA+1MdH89jAH0BkSjtBdoRocRH9byTIrWEPQVLeLhkkGZnxBD5hk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOkHC1ljDRpj6sqzEreJ1QOPZ0meNXwjyyeRYnXyoS9+uaDz8B
	qoUdRjpPvqvoAk8fdvGMGtZDFK9Pc1pkVls+Ds98yltIxQSv8mS8aPsZ
X-Gm-Gg: AYBFou1CP+a9PiRiil3VeNEmlGZQAHoDBDp/dXG2lz63VQatYfEF4uBUJjeUg9qU4uT
	5NEOy3s+cF+j0+BdEvfGeVtOWTXk0MZUKbdPL/gFGKK8zxxDqGlw7W5kwnwFgXJUh9Hj/Dg4swC
	j8to9tupJm/KZzE/SwUImFKnMETNnvDO7dQVfIkdOLjacWE9olR5uwa87nVj5gQPDzspGBUSPt2
	Sv3iK3C5Vd1TUtrpqX/WDlPucLqKWX6A96SjLnFtVWJstKwno3JNawP8gPhxQ5H8fmITnWRDixx
	0D/NdrWmCuqomDkE7k/qhz/8B7Yf/ev7TQE2y8MU7A0QvwVeSCPpYOfCKvxUV7R6X7qtJx4Vm9v
	V2gUzzXIGakFs+wyXQqOIhv6JQz8/yAHvKWwW3N7QCpV/hDZ58Yk+q2at+Y3wiYxGHSZ3YsqP/W
	wmNWf8q1QTP+HubpC667rpesl9v+AQBjgihknyzH3EtBjXASFLNmSTPxORJF8A7nAa9BO6OPcPK
	qsZMy1LsLCipnydLxfywvsQy1z7WtHTERArkHcNO6AMcsnGhiF0slFAmgeemYC7Oi3jyOCyQ1rB
	qNkqpFvUEES+3VwP+Hlvo5lCS+sAIgTSW+aUmNIbfE56NFeFHxI=
X-Received: by 2002:a05:693c:401a:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a20477909mr3084505eec.28.1793187378627;
        Wed, 28 Oct 2026 04:36:18 -0700 (PDT)
Received: from localhost.localdomain ([103.177.252.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238d9a21sm6623522eec.4.2026.10.28.04.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:36:17 -0700 (PDT)
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
Subject: [PATCH v6] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 28 Oct 2026 11:34:53 +0000
Message-ID: <20261028113453.2599-1-sreekuttan2156239@gmail.com>
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

- v6: Move oversized resource validation before hardware
  initialization to avoid leaving interrupts unmasked on
  the error path.
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
index 3a3e91cd0c21..cc04a7b862f0 100644
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
@@ -693,6 +696,13 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	if (!mem)
 		return -EINVAL;
 
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	/* MT7622 platforms need to enable LTSSM and ASPM from PCIe subsys */
 	if (pcie->base) {
 		val = readl(pcie->base + PCIE_SYS_CFG_V2);
@@ -754,7 +764,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
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
@@ -782,6 +794,13 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 	if (!mem)
 		return -EINVAL;
 
+	size = resource_size(mem);
+	size_order = fls64(size);
+	if (size_order > 31) {
+		dev_err(pcie->dev, "Memory resource size too large: %pa\n", &size);
+		return -EINVAL;
+	}
+
 	if (!pcie->cfg) {
 		dev_err(pcie->dev, "EN7528: pciecfg syscon not available\n");
 		return -EINVAL;
@@ -830,7 +849,7 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(size_order);
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0

