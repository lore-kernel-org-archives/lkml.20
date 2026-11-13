Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554007;
	b=e4xMhu9uf8PiJ/VwLrqt98RWJEv/c0KTEIvUdEB3dZlftN8PuhgY6T2WZxJBSM2JcBdR
	 DGLNKQCshkGT6EeV4r7tYG+ZivR7h6ja0rhtRh3vjSrI/4cKiAAgbYqVFqoXhFvy8mRHG
	 FvkcPzaFS4Lq8wmo0WUGQqFL4RRS0y6V7ZCgbybq90wHgZzPK6Ge0KT6J+gVwP2ySFIqk
	 VhzR7aMHPp1StB8o6XhB03Srfmr0chyrs9YlU9vMtZ6mSCfPl1ocjGuhGlqt7YLD9vPI4
	 A30mWrRUpnzc1j9lNLDbWp9KGUWs7rIyg9WLEPUAQkWkm5AGwatNFyvmL3uMdg9FA0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554007;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=OBCtFqUMq8lyKwq6C0SlRO4azCv4v9nWsThotF1xxZM=;
	b=uPtb1iD9LEpVUDn1amy6JO3J3kGnYySoeAoXmutD1nlRNGipYMnafE24zgZ0Z3XfaxQ6
	 LCJBdylLPo4elBSQrJUPkCuqw+JfAgI8qdy3MsHcYO93oxctOHSxRJTjdRsWOkyGV1z0J
	 03xeodaa3WpFv/8GfL+YeV4hY2l9ZnmtHc6wugBY96lcDaZlLFHq2b/PKI7sqbLtzg0zL
	 W6bWIbQFdqX1FyIjy1y6deR1dZznxwMxfqL2uIKCD/m770mZ/UNSCpdJldglap42h7iiG
	 Ot6aF9eOh/c+TQAsGERWJcHTNveTYNpL2CB41Oy6dOB7McZrhPh40HeLz4mmJe7SGOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4A606A33B;
	Fri, 13 Nov 2026 07:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C4A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5L059129
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
Subject: [PATCH v2 07/19] cache: andes_llcache: clean up cache inv/wback functions
Date: Fri, 13 Nov 2026 15:11:31 +0800
Message-ID: <20261113071143.1446167-8-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CR5L059129

Replace open-coded cache line alignment with ALIGN_DOWN/ALIGN helpers,
initialize line_size at declaration site, and use !size instead of
start == end for the early-out check. Drop redundant blank lines.

Also declare pa in andes_cpu_cache_operation() as phys_addr_t, the type
virt_to_phys() returns.

No functional change intended.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 61730e218afa..3c271e1e49bf 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -65,7 +65,7 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 	unsigned long line_size = andes_priv.andes_cache_line_size;
 	void __iomem *base = andes_priv.llc_base;
 	int mhartid = smp_processor_id();
-	unsigned long pa;
+	phys_addr_t pa;
 
 	while (end > start) {
 		csr_write(CSR_UCCTLBEGINADDR, start);
@@ -101,21 +101,17 @@ static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
-	unsigned long line_size;
+	unsigned long line_size = andes_priv.andes_cache_line_size;
 	unsigned long flags;
 
-	if (unlikely(start == end))
+	if (unlikely(!size))
 		return;
 
-	line_size = andes_priv.andes_cache_line_size;
-
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
 
 	local_irq_save(flags);
-
 	andes_cpu_dcache_inval_range(start, end);
-
 	local_irq_restore(flags);
 }
 
@@ -123,15 +119,15 @@ static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
-	unsigned long line_size;
+	unsigned long line_size = andes_priv.andes_cache_line_size;
 	unsigned long flags;
 
-	if (unlikely(start == end))
+	if (unlikely(!size))
 		return;
 
-	line_size = andes_priv.andes_cache_line_size;
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
+
 	local_irq_save(flags);
 	andes_cpu_dcache_wb_range(start, end);
 	local_irq_restore(flags);
-- 
2.34.1

