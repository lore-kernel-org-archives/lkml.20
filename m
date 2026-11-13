Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554006;
	b=sX4KkktKpowEVIBolcOEjnb1C1/BcTEEeJ2hhxdfbSfU4C1QomTUTt7eVUwonblokL/t
	 E2q3ISh6m0zEJKmCSFLN1G1M5HiNCd5dVZZEcZJq+Ink+jEw25svSdGAABQMsTE36A424
	 fqUv+xEs1ozVkcy4Bj6aP+sWKiOYjz3WwrEGaTvPZsvYoSsWiTAKwW+VyPzQLM7DlW7ai
	 m/1rtfc+J6NO64/n8blXRcZF8FQPkmP54UYQZD0PHX9c5vxvtnKYqd4OUUUdLRJFfMeGN
	 uZVCIX5qfXizDKUSgxr1ht7gkJEwXJDOYE5BWPzucMsdDJGGPGGgddTC/LCdcrhif2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554006;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=8To35Jq88R9SDbpZYD7GKp3Djav91brBmXqNgofZmRE=;
	b=HB1UxbvkQ5WgQvzwuLuUEF17b3LkCyaTlyM97qFAtkc+I19B2f9OdSF7iYoS//Tmleyd
	 JTFRRhxeOHiAJRd5LUw7fQgpP16ZUS+oPwPsamlI9gzvSSxuxXgkMiRevX6YEzk/9lLug
	 xLUrxyd3hFkpf55Sk/smwzu12iMJqlIg0eaETqqwfBXHvTL23p4AwjV9SjEWzrq1v0qDQ
	 +kBR8RDY6iFP9g1GKnDJkSUuD4uvO099ezOngfZSWuSBxwBOC9GpolvI/oKnR40ekA8HC
	 ADryv/jqUARSC7AteutzT1j4kcrRxYhKyEpF+c7fOmh9D940dvDeHUNGAHV+lzRG2nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BFA606A321;
	Fri, 13 Nov 2026 07:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BFA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CSCv059145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:28 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH v2 04/19] cache: ax45mp_cache: add shared header for Andes CSRs
Date: Fri, 13 Nov 2026 15:11:28 +0800
Message-ID: <20261113071143.1446167-5-minachou@andestech.com>
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
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CSCv059145

Add linux/soc/andes/csr.h as a central place for Andes vendor-specific
CSR definitions, and update the cache driver to use CSR_UCCTLBEGINADDR
and CSR_UCCTLCOMMAND from the new header instead of local definitions.
More Andes CSR definitions will be added here as needed.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/ax45mp_cache.c  |  8 +++-----
 include/linux/soc/andes/csr.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 5 deletions(-)
 create mode 100644 include/linux/soc/andes/csr.h

diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
index 0ee8218d5a82..b3d6f6a11cfc 100644
--- a/drivers/cache/ax45mp_cache.c
+++ b/drivers/cache/ax45mp_cache.c
@@ -10,6 +10,7 @@
 #include <linux/dma-direction.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/soc/andes/csr.h>
 
 #include <asm/dma-noncoherent.h>
 
@@ -44,9 +45,6 @@
 #define ANDES_CCTL_LLC_STATUS_CN_MASK(n)	\
 	(ANDES_CCTL_LLC_STATUS_C0_MASK << ((n) * ANDES_CCTL_LLC_STATUS_PER_CORE_OFFSET))
 
-#define ANDES_CCTL_REG_UCCTLBEGINADDR_NUM	0x80b
-#define ANDES_CCTL_REG_UCCTLCOMMAND_NUM	0x80c
-
 #define ANDES_CACHE_LINE_SIZE			64
 
 struct andes_priv {
@@ -71,8 +69,8 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 	unsigned long pa;
 
 	while (end > start) {
-		csr_write(ANDES_CCTL_REG_UCCTLBEGINADDR_NUM, start);
-		csr_write(ANDES_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
+		csr_write(CSR_UCCTLBEGINADDR, start);
+		csr_write(CSR_UCCTLCOMMAND, l1_op);
 
 		pa = virt_to_phys((void *)start);
 		writel(pa, base + ANDES_LLC_REG_CN_ACC_OFFSET(mhartid));
diff --git a/include/linux/soc/andes/csr.h b/include/linux/soc/andes/csr.h
new file mode 100644
index 000000000000..3214b4b08a46
--- /dev/null
+++ b/include/linux/soc/andes/csr.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 Andes Technology Corporation.
+ */
+#ifndef __LINUX_SOC_ANDES_CSR_H
+#define __LINUX_SOC_ANDES_CSR_H
+
+/* User mode control registers */
+#define CSR_UCCTLBEGINADDR		0x80b
+#define CSR_UCCTLCOMMAND		0x80c
+
+#endif /* !__LINUX_SOC_ANDES_CSR_H */
-- 
2.34.1

