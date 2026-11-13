Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554007;
	b=1RkfUE4RHHn2SarU0NZJa9hVj8PPPoxj5R8+hfxuVJgZOlA/B3uuyU9Z18wYP+JlARmQ
	 sq2CLFNVpL5N0ms5bde2KTWbGXw17ITWH8p4vC9uKvxUrsUvbr7Y9bGDAGXU+MoG+kTMm
	 JJKvCGJztKbsNtmMgjs7XT2/j6lOEC+DZ0zpMP8zWq9kbR7tUGDXTsoyVa5MyF0EMwDOZ
	 guhqnycVYAOlMuj5AEjWQvg53J3s4TrzP3yXtX2c+iCdJh213HlJIHJFztXAkyz9Xyspr
	 OMvtktpCZmvorZKbdFqwIBv8CuPbhoM3AELpFFeqsx3smlQHqvWbr+OIV3K+CTUC+1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554007;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=e+onakzn4FdMfUu7/pbFKyihuONwQ9R+QDsapZHLtMA=;
	b=mUPBKcViPZFjxyIXnRqR3v6bU9AJ2/RJiZkVZfYofx+ALRRBSNi3bEuEIu7VTtUreqwW
	 q8bNn/EChE6EEyMBpcdMAS0DT/05PdQVnB60h0nP3EmSkECvZ+VQr1Slt5S7UBgakULEH
	 Ydp2FcgC+u/bTXckNEGGqavXpeKc6jBxjf7Ed1nOLmbgXfMTnERVC+IgQI8493t9uEtaU
	 0I0TTk5wFS5YFv55918BEG9FrUkP07o1K+tarKWfgKQcEy+tM0QQC2sWSeYiVbmTrYhzb
	 l+Ru4md7/B6HcmxhJT6grJKUU79LgfA/mP6UmYLMIMrjK/taujU4pC+yb1yu8tJRbjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D960606A33A;
	Fri, 13 Nov 2026 07:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D960606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5N059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:29 +0800
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
Subject: [PATCH v2 11/19] cache: andes_llcache: use the hart ID to index the CCTL registers
Date: Fri, 13 Nov 2026 15:11:35 +0800
Message-ID: <20261113071143.1446167-12-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CR5N059129

The LLC has a separate set of CCTL registers for each core, selected by
the hart ID of the core. The driver selects the set with
smp_processor_id(), which returns the logical CPU number, not the hart
ID.

The two numbers differ when some harts are not used by Linux, or when
Linux boots on a hart other than 0, as the boot hart is always CPU 0.
A CPU then issues its LLC operations through the registers of another
hart, which may be in use by that hart at the same time.

RZ/Five has a single core with hart ID 0, so the two numbers always
match there and the problem never showed up.

Convert the logical CPU number to the hart ID with
cpuid_to_hartid_map().

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 80c55616ab10..9f8fa8964302 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -65,7 +65,7 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 {
 	unsigned long line_size = andes_priv.andes_cache_line_size;
 	void __iomem *base = andes_priv.llc_base;
-	int mhartid = smp_processor_id();
+	unsigned long hartid = cpuid_to_hartid_map(smp_processor_id());
 	phys_addr_t pa;
 
 	while (end > start) {
@@ -74,10 +74,10 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 
 		pa = virt_to_phys((void *)start);
 		/* The access line register is 64 bits; written lo-hi on RV32 */
-		writeq(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
-		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
+		writeq(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(hartid));
+		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(hartid));
 		while ((andes_cpu_llc_get_cctl_status() &
-			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=
+			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(hartid)) !=
 			ANDES_LLC_CCTL_STATUS_IDLE)
 			;
 
-- 
2.34.1

