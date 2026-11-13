Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554054;
	b=X/jrlXurCDqRXsSqFWvlFD2UDlrGeWHy5Pmy5UDq+z/9dn7UD25ISZ5ejxgHYnOtIJFg
	 JYGNEWOwfDr4RZQy2OTUaYNjGWfEp4TudD2U/HLpxqOZwcC7fd/X8pnD+HkStgZ2DYn6k
	 cEAEVtUujYSqE5CduH9g6R3eneB+MeQtMfhWIVezEFHc6yqEXi+tKOOxAXX4VAZ8cjW2D
	 ZFzYXD53TdJyuaTobOL1CFtD3WzVIPn8SURtkwuPkk5ZM2dr4sTaVwqb5IaCC6/mJNkU4
	 orMCf425KS4J5gPrWS7gXrOepPZMZdc9TOt8FonvP+gyOzA3MpSRhSgbnhnXPNliKfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554054;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=yO0oos7/15UecjM73U8xYz0IPOV7DtGTBsTdoPP4hSU=;
	b=rM8uf9H36iiO2YVap7/WGyw/vCYkiBilRy9yjZivCtzhp7QOXkzSMlBRg1qs+ewsO2f3
	 ul+g0q57yteIt3/5yeJgzg3HeT2T/Bl0Fi54ON0am4nu9CTqX47h7wWGczVFaPUudhGFL
	 BtOzSEo+CavqeyvgJvcV/RiZ3RazxYIGdcO8nRXBvQQ6bWWmBy4SKQ6nw7HwUkfP4GtES
	 gPgyciOxRbb27qkyNqCVm++vIydHryWwLmvSGtjvJcuL7jWrmAakPtAa3X6wrUfVx+Vn1
	 yfN1vnbgqs6p0RxTPo92RGnNr4yH/Oj0aoRUq9KdXcjwk0j2WpRiVVx2yPh4prCKE1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F829606B3C9;
	Fri, 13 Nov 2026 07:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F829606B3C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5K059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:28 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:28 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 03/19] cache: ax45mp_cache: rename L2 identifiers to LLC
Date: Fri, 13 Nov 2026 15:11:27 +0800
Message-ID: <20261113071143.1446167-4-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
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
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CR5K059129

Rename all L2-related identifiers to LLC to accurately reflect the
cache's role as the system's last-level cache.

This is a mechanical rename with no functional change:
- macros: ANDES_L2C_* -> ANDES_LLC_*
- struct: l2c_base -> llc_base
- function: andes_*_l2_*() -> andes_*_llc_*()
- comments: L2 cache -> LLC

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/ax45mp_cache.c | 80 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
index 4f9b8a9ad969..0ee8218d5a82 100644
--- a/drivers/cache/ax45mp_cache.c
+++ b/drivers/cache/ax45mp_cache.c
@@ -13,36 +13,36 @@
 
 #include <asm/dma-noncoherent.h>
 
-/* L2 cache registers */
-#define ANDES_L2C_REG_CTL_OFFSET		0x8
+/* LLC registers */
+#define ANDES_LLC_REG_CTL_OFFSET		0x8
 
-#define ANDES_L2C_REG_C0_CMD_OFFSET		0x40
-#define ANDES_L2C_REG_C0_ACC_OFFSET		0x48
-#define ANDES_L2C_REG_STATUS_OFFSET		0x80
+#define ANDES_LLC_REG_C0_CMD_OFFSET		0x40
+#define ANDES_LLC_REG_C0_ACC_OFFSET		0x48
+#define ANDES_LLC_REG_STATUS_OFFSET		0x80
 
 /* D-cache operation */
 #define ANDES_CCTL_L1D_VA_INVAL		0 /* Invalidate an L1 cache entry */
 #define ANDES_CCTL_L1D_VA_WB			1 /* Write-back an L1 cache entry */
 
-/* L2 CCTL status */
-#define ANDES_CCTL_L2_STATUS_IDLE		0
+/* LLC CCTL status */
+#define ANDES_CCTL_LLC_STATUS_IDLE		0
 
-/* L2 CCTL status cores mask */
-#define ANDES_CCTL_L2_STATUS_C0_MASK		0xf
+/* LLC CCTL status cores mask */
+#define ANDES_CCTL_LLC_STATUS_C0_MASK		0xf
 
-/* L2 cache operation */
-#define ANDES_CCTL_L2_PA_INVAL			0x8 /* Invalidate an L2 cache entry */
-#define ANDES_CCTL_L2_PA_WB			0x9 /* Write-back an L2 cache entry */
+/* LLC operation */
+#define ANDES_CCTL_LLC_PA_INVAL			0x8 /* Invalidate an LLC entry */
+#define ANDES_CCTL_LLC_PA_WB			0x9 /* Write-back an LLC entry */
 
-#define ANDES_L2C_REG_PER_CORE_OFFSET		0x10
-#define ANDES_CCTL_L2_STATUS_PER_CORE_OFFSET	4
+#define ANDES_LLC_REG_PER_CORE_OFFSET		0x10
+#define ANDES_CCTL_LLC_STATUS_PER_CORE_OFFSET	4
 
-#define ANDES_L2C_REG_CN_CMD_OFFSET(n)	\
-	(ANDES_L2C_REG_C0_CMD_OFFSET + ((n) * ANDES_L2C_REG_PER_CORE_OFFSET))
-#define ANDES_L2C_REG_CN_ACC_OFFSET(n)	\
-	(ANDES_L2C_REG_C0_ACC_OFFSET + ((n) * ANDES_L2C_REG_PER_CORE_OFFSET))
-#define ANDES_CCTL_L2_STATUS_CN_MASK(n)	\
-	(ANDES_CCTL_L2_STATUS_C0_MASK << ((n) * ANDES_CCTL_L2_STATUS_PER_CORE_OFFSET))
+#define ANDES_LLC_REG_CN_CMD_OFFSET(n)	\
+	(ANDES_LLC_REG_C0_CMD_OFFSET + ((n) * ANDES_LLC_REG_PER_CORE_OFFSET))
+#define ANDES_LLC_REG_CN_ACC_OFFSET(n)	\
+	(ANDES_LLC_REG_C0_ACC_OFFSET + ((n) * ANDES_LLC_REG_PER_CORE_OFFSET))
+#define ANDES_CCTL_LLC_STATUS_CN_MASK(n)	\
+	(ANDES_CCTL_LLC_STATUS_C0_MASK << ((n) * ANDES_CCTL_LLC_STATUS_PER_CORE_OFFSET))
 
 #define ANDES_CCTL_REG_UCCTLBEGINADDR_NUM	0x80b
 #define ANDES_CCTL_REG_UCCTLCOMMAND_NUM	0x80c
@@ -50,23 +50,23 @@
 #define ANDES_CACHE_LINE_SIZE			64
 
 struct andes_priv {
-	void __iomem *l2c_base;
+	void __iomem *llc_base;
 	u32 andes_cache_line_size;
 };
 
 static struct andes_priv andes_priv;
 
-/* L2 Cache operations */
-static inline uint32_t andes_cpu_l2c_get_cctl_status(void)
+/* LLC operations */
+static inline uint32_t andes_cpu_llc_get_cctl_status(void)
 {
-	return readl(andes_priv.l2c_base + ANDES_L2C_REG_STATUS_OFFSET);
+	return readl(andes_priv.llc_base + ANDES_LLC_REG_STATUS_OFFSET);
 }
 
 static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
-				      unsigned int l1_op, unsigned int l2_op)
+				      unsigned int l1_op, unsigned int llc_op)
 {
 	unsigned long line_size = andes_priv.andes_cache_line_size;
-	void __iomem *base = andes_priv.l2c_base;
+	void __iomem *base = andes_priv.llc_base;
 	int mhartid = smp_processor_id();
 	unsigned long pa;
 
@@ -75,29 +75,29 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 		csr_write(ANDES_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
 
 		pa = virt_to_phys((void *)start);
-		writel(pa, base + ANDES_L2C_REG_CN_ACC_OFFSET(mhartid));
-		writel(l2_op, base + ANDES_L2C_REG_CN_CMD_OFFSET(mhartid));
-		while ((andes_cpu_l2c_get_cctl_status() &
-			ANDES_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
-			ANDES_CCTL_L2_STATUS_IDLE)
+		writel(pa, base + ANDES_LLC_REG_CN_ACC_OFFSET(mhartid));
+		writel(llc_op, base + ANDES_LLC_REG_CN_CMD_OFFSET(mhartid));
+		while ((andes_cpu_llc_get_cctl_status() &
+			ANDES_CCTL_LLC_STATUS_CN_MASK(mhartid)) !=
+			ANDES_CCTL_LLC_STATUS_IDLE)
 			;
 
 		start += line_size;
 	}
 }
 
-/* Write-back L1 and L2 cache entry */
+/* Write-back L1 and LLC entry */
 static inline void andes_cpu_dcache_wb_range(unsigned long start, unsigned long end)
 {
 	andes_cpu_cache_operation(start, end, ANDES_CCTL_L1D_VA_WB,
-				  ANDES_CCTL_L2_PA_WB);
+				  ANDES_CCTL_LLC_PA_WB);
 }
 
-/* Invalidate the L1 and L2 cache entry */
+/* Invalidate the L1 and LLC entry */
 static inline void andes_cpu_dcache_inval_range(unsigned long start, unsigned long end)
 {
 	andes_cpu_cache_operation(start, end, ANDES_CCTL_L1D_VA_INVAL,
-				  ANDES_CCTL_L2_PA_INVAL);
+				  ANDES_CCTL_LLC_PA_INVAL);
 }
 
 static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
@@ -146,7 +146,7 @@ static void andes_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 	andes_dma_cache_inv(paddr, size);
 }
 
-static int andes_get_l2_line_size(struct device_node *np)
+static int andes_get_llc_line_size(struct device_node *np)
 {
 	int ret;
 
@@ -200,13 +200,13 @@ static int __init andes_cache_init(void)
 	if (!riscv_cbom_block_size)
 		return 0;
 
-	andes_priv.l2c_base = ioremap(res.start, resource_size(&res));
-	if (!andes_priv.l2c_base)
+	andes_priv.llc_base = ioremap(res.start, resource_size(&res));
+	if (!andes_priv.llc_base)
 		return -ENOMEM;
 
-	ret = andes_get_l2_line_size(np);
+	ret = andes_get_llc_line_size(np);
 	if (ret) {
-		iounmap(andes_priv.l2c_base);
+		iounmap(andes_priv.llc_base);
 		return ret;
 	}
 
-- 
2.34.1

