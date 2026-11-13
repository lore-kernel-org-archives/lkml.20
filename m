Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554034;
	b=0p5xAIBclbSCsDSTfcg2rVVOzb1J5DGrwbgDmDPWPCQpgJFoMKbFY2XrT1JzTC0jJLs8
	 Lg0AUDGxJ9OEgvDjtRWsWKFNQ+b9QYBTn84U6rlZX/8sf3d+NEIDBnNnJAKjgLj2NcsjO
	 WREdGuamyf7abTD57kgZ09Sa7Oh/lH7v7JU4EKXkTKixPVTsniQehH2z0usK/fCKd+prR
	 iRaufjr+epK1DEXmWh4W0KsC8Ww0JbqOZeIyQJRtWeYkpL7GMjx7w6Xgz8Q8vzVVu23WX
	 cc4GVNdZ8tfyTyRtU07MvBpCEX+COL/u+2IfLNMBa8QiSAI+iQKOSd2hjiylVTKDjaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554034;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=LUqF/I1QRJINbOzXKJaSp3rR1YzOHCwYnM62PJl+3oQ=;
	b=Npf6jGUxMZ51fx60dhRVjYyXTR/EYznBjzXd4UjtkRoeaB1aOj1ymsp4hdiAtDguhfP5
	 Ht66DmibhdFFQ44TZYwFz2S2qUit3BvOLSKWwwdQI6gHtjl1ZtTokbqjuOSTRHd11uTyA
	 G5yLWLFTWyVLNxsp5qvWanzqjf3rCFywFJl3OTWSXmZ+lIUohpdhsLK0vU/xoCZlGEngy
	 GC78bpJU/mW4FoiqXb/ZVetXYV/mYMIXC2VXTlbYUwZgfENztghX7SUb/02sUHGNITzFg
	 dEQJaVjpX390JjLSyGfWfNTGK0yGRd2CstVcDy/ll9lud4PLjTUduAzo/W9r2ywVYCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B40606A894;
	Fri, 13 Nov 2026 07:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B40606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CTA2059147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
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
Subject: [PATCH v2 09/19] cache: andes_llcache: write the full physical address for CCTL
Date: Fri, 13 Nov 2026 15:11:33 +0800
Message-ID: <20261113071143.1446167-10-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CTA2059147

The CCTL access line registers are 64 bits wide and hold the physical
address for PA-type CCTL operations, but the driver writes them with
writel(). On RV64, a physical address above 4 GiB loses its upper 32
bits, and the LLC operates on the wrong line.

Write the register with writeq(), using the lo-hi helper on RV32, so
that the whole physical address is always written.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 0aea1389f291..bf49dbcb080b 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -8,6 +8,7 @@
 #include <linux/cacheflush.h>
 #include <linux/cacheinfo.h>
 #include <linux/dma-direction.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/soc/andes/csr.h>
@@ -72,7 +73,8 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 		csr_write(CSR_UCCTLCOMMAND, l1_op);
 
 		pa = virt_to_phys((void *)start);
-		writel(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
+		/* The access line register is 64 bits; written lo-hi on RV32 */
+		writeq(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
 		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
 		while ((andes_cpu_llc_get_cctl_status() &
 			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=
-- 
2.34.1

