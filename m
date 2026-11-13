Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554053;
	b=0vQJLI63yfZ1lGB7z9cbfvjlEFr94tCNkKMYkU14dtbc88mqAIn5476mDEedQoxMJayb
	 ZOWY09H8cD6dws+qzDcnPMtxxD9jYkUolSieOuq1fuPIL+y1nOdvxYTMUEEjBvDBWkmJF
	 kL42pKobjk5W9VJVF98aCEyRZZTI6cg/lYxrPGkt/cJLB6kuIok52um/KUTO5RHjt1Ffa
	 nEBI9RlvT1/2XOQ0EY/r6mKlk/bCpERq0H+WT2xDt6y/L0OOjOvnQtXfgDZK2imhrVpqW
	 +TqZxspygJXLBCdXbwwOFqQ1E9lGOe32yMljpp3FNdqcnMAdrC6NlvbPR4wjG1wwhiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554053;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=dH1XGgWBuKgO8db9Omitdjkauyn6sTFjYM42t0BkKE8=;
	b=pfklnO62dEywpw6XoHsvCRpiDbosLo1VtoX6gU78h5bAc96pdj1nkUp/iSUM+cgIUgln
	 X6ukgwLxUWkyI4wboEuW1SRer5kNgLJAPjDUWkrYxU1WFwFvL8wjYN1s73UIRF1Nqg37Q
	 TF8PxNXqZ+6jobM3k0fh+FRTKYbeax+pvKBdCzAiyGixffe5JSkblF/LgheXlr7xpk2pJ
	 x4E2ZMNS0MXG1Y9zKj8AmswxD6id0wWH0XN/OJjcosUEhHfTaLZeOLsGfHizPWftnprmn
	 OBWpJLVFL7/ml2oD7gIMg81Qou6vCCEcom1O2NgBkcZE2UBQXpCxKn7vZAyH9BfQxuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A670F60A2612;
	Fri, 13 Nov 2026 07:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A670F60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CUTN059151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:30 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:30 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:30 +0800
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
Subject: [PATCH v2 17/19] riscv: errata: andes: generalize cache errata for Andes cores
Date: Fri, 13 Nov 2026 15:11:41 +0800
Message-ID: <20261113071143.1446167-18-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CUTN059151

The Andes cache errata probe only runs on AX45MP: it matches
ANDES_AX45MP_MARCHID/MIMPID and then asks the Andes SBI extension
whether IOCP is missing. Other Andes cores that need CCTL-based cache
maintenance, such as the A27L2, which has neither IOCP nor Zicbom, are
silently skipped.

The IOCP_SW_WORKAROUND SBI call cannot simply be used on every Andes
core: OpenSBI checks the IOCP bit in mmsc_cfg[47], which only exists on
RV64 cores. RV32 cores such as the A45MP report IOCP in mmsc_cfg2
instead, and cores such as the A25/A27 do not support IOCP at all.

Keep the existing SBI-based check for AX45MP. On other Andes cores, use
the Andes CCTL operations for cache maintenance when the core does not
implement Zicbom.

As the probe is no longer only about IOCP, rename errata_probe_iocp()
to errata_probe_andes_cache(), ERRATA_ANDES_NO_IOCP to
ERRATA_ANDES_CACHE, and the ERRATA_ANDES prompt from "Andes AX45MP
errata" to "Andes errata".

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 arch/riscv/Kconfig.errata                    |  2 +-
 arch/riscv/errata/andes/errata.c             | 13 +++++++------
 arch/riscv/include/asm/errata_list_vendors.h |  2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c43e065aa01..ca8e52bee497 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -1,7 +1,7 @@
 menu "CPU errata selection"
 
 config ERRATA_ANDES
-	bool "Andes AX45MP errata"
+	bool "Andes errata"
 	depends on RISCV_SBI
 	help
 	  All Andes errata Kconfig depend on this Kconfig. Disabling
diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index dcc9d1ee5ffd..530d2df216e0 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -39,7 +39,7 @@ static long ax45mp_iocp_sw_workaround(void)
 	return ret.error ? 0 : ret.value;
 }
 
-static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
+static void errata_probe_andes_cache(unsigned int stage, unsigned long arch_id, unsigned long impid)
 {
 	static bool done;
 
@@ -51,11 +51,12 @@ static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigne
 
 	done = true;
 
-	if (arch_id != ANDES_AX45MP_MARCHID || impid != ANDES_AX45MP_MIMPID)
-		return;
-
-	if (!ax45mp_iocp_sw_workaround())
+	if (arch_id == ANDES_AX45MP_MARCHID && impid == ANDES_AX45MP_MIMPID) {
+		if (!ax45mp_iocp_sw_workaround())
+			return;
+	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
 		return;
+	}
 
 	/* Set this just to make core cbo code happy */
 	riscv_cbom_block_size = 1;
@@ -69,7 +70,7 @@ void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct al
 	BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
 
 	if (stage == RISCV_ALTERNATIVES_BOOT)
-		errata_probe_iocp(stage, archid, impid);
+		errata_probe_andes_cache(stage, archid, impid);
 
 	/* we have nothing to patch here ATM so just return back */
 }
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
index 02b5ab0d23a8..d2fbef69f421 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -4,7 +4,7 @@
 #define ASM_ERRATA_LIST_VENDORS_H
 
 #ifdef CONFIG_ERRATA_ANDES
-#define	ERRATA_ANDES_NO_IOCP 0
+#define	ERRATA_ANDES_CACHE 0
 #define	ERRATA_ANDES_NUMBER 1
 #endif
 
-- 
2.34.1

