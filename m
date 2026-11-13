Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554007;
	b=tTUIHtdagANN1HQbsLKmj3Pa/gM5Klzx4fEOf09+fFvg+69PNGI8zuuvU0myRoacibDw
	 Yy4EE7ZvJBmWbF1USsLpysF3LUSzkB3SGrxNFAEKKeEr42IPtXA3bF3YbJuk4Q/2omDAD
	 yXOHePytlIlEhUEMFiXducuyR34+PuzIJZ9b13wXHZ79jVh49BKptBUgNK2jkXVxzActC
	 fM70d8mypBUY1TasZo3aYrX84dHBgiy5pM3yOcmH0+pmFubCUbODGCakpbuyVI5yDAm/U
	 2eehvoXzpw+OuvVMWIU02BgATB2B30e4fpOdxkimv13hbv4cr+rvtCPq2p0cIQw11vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554007;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:X-DKIM-Results:
	 X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=K8g9zn4kEcTACSbhrjpYTuOLAPacT70rDBWk5dB8Ybo=;
	b=QMl8qRfceryjrOtGQG9v0jKrqnv19/UZWhkNNbo1nRtaKquKUwgwtU3YI6QifnV2y9WQ
	 HxYqU3LHX4aGNEDARmC8ijB2likV8t8bsECCQBhmK5k/2A4HtjGX8p3R3R7bxtEyPryZt
	 V6AaE68cOGAIgjtG8I4p9GVIwqfC2wM5oBxp5QnvAAl9Z+hL0tJcRbvyIC34NZYYi4xpy
	 6+f4nRAhF0BrjTtF8O1nZW8Q/SQaMZDTUk47qD2fOtC9Njv4u4nc9iNY0caVdI/QD4Ton
	 7jNqBBFUwO0+TQzA3vJkDHgq/ICqKPQTuABg/QQDwKT7xoaNRX42y6vp1rNLLBkpRjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F2606A8A3;
	Fri, 13 Nov 2026 07:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408F2606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5H059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:27 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:27 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:27 +0800
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
Subject: [PATCH v2 00/19] riscv: andes: make the LLC driver and cache errata generic
Date: Fri, 13 Nov 2026 15:11:24 +0800
Message-ID: <20261113071143.1446167-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
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
X-MAIL:Atcsqr.andestech.com 6AD7CR5H059129

The Andes last level cache (LLC) driver and the Andes cache errata were
written for the AX45MP core in the Renesas RZ/Five. Other Andes cores use
the same LLC controller and need the same CCTL-based cache maintenance,
but the driver, its binding and the errata only handle AX45MP.

This series makes them generic, in preparation for the Allwinner V821
SoC [1][2], which uses the Andes A27L2 core [3]. The A27L2 has neither
IOCP nor Zicbom, so it relies on the LLC driver for DMA cache
maintenance.

The series is organized as follows:

- Patches 2-6 rename the AX45MP and L2 identifiers to generic Andes and
  LLC names, move the Andes CSR definitions to a shared header, and
  rename ax45mp_cache.c to andes_llcache.c. No functional change.

- Patches 1, 7 and 8 are small cleanups. No functional change.

- Patches 9-11 fix issues that do not show up on RZ/Five but affect
  other Andes platforms:
  - write the full physical address to the 64-bit CCTL registers,
  - register the CCTL cache ops only when the errata asks for them, so
    that they do not override Zicbom CMO,
  - index the per-core CCTL registers by hart ID, not logical CPU
    number.

- Patches 12-15 add andestech,llcache as a generic compatible, keep
  andestech,ax45mp-cache for existing devicetrees, and add a
  MAINTAINERS entry for the driver.

- Patches 16-18 make the Andes cache errata usable on any Andes SoC:
  ERRATA_ANDES_CMO no longer depends on ARCH_R9A07G043, Andes cores
  other than AX45MP use the CCTL ops when they do not implement Zicbom,
  and the SBI-based IOCP check is limited to RZ/Five.

- Patch 19 adds the andestech,a27l2 CPU compatible. The V821 devicetree
  will be submitted separately by Allwinner.

Existing RZ/Five devicetrees and behavior are unchanged.

[1] https://www.allwinnertech.com/index.php?c=product&a=index&id=136
[2] https://github.com/AvaotaSBC/AvaotaF1
[3] https://www.andestech.com/en/products-solutions/andescore-processors/riscv-a27l2/

Changes in v2:
- Rework the series: split the refactoring into smaller patches, drop
  the performance and feature changes, and add the cache errata
  changes needed for other Andes cores.
- Split the v1 refactoring patch into separate rename, header, macro
  and file rename patches.
- Keep andestech,ax45mp-cache and add andestech,llcache as a generic
  fallback compatible, instead of renaming the compatible. Drop the v1
  DTS update patch accordingly.
- Drop the performance and feature changes of v1 patches 2/7-4/7 to
  keep this series focused on making the driver generic. They will be
  sent separately.
- New: fix the CCTL physical address width, the cache ops registration
  condition and the CCTL register index (patches 9-11).
- New: generalize the Andes cache errata (patches 16-18).
- New: add the A27L2 CPU compatible (patch 19).
- Link to v1: https://lore.kernel.org/r/20260330102724.1012470-1-minachou@andestech.com

Mina Hui-Min Chou (19):
  cache: ax45mp_cache: use __initconst for ax45mp_cmo_ops
  cache: ax45mp_cache: rename AX45MP-specific identifiers to generic
    ANDES
  cache: ax45mp_cache: rename L2 identifiers to LLC
  cache: ax45mp_cache: add shared header for Andes CSRs
  cache: ax45mp_cache: standardize macro naming for LLC and L1D
    registers
  cache: ax45mp_cache: rename ax45mp_cache.c to andes_llcache.c
  cache: andes_llcache: clean up cache inv/wback functions
  cache: andes_llcache: use u32 and fix the cache-line-size error
    message
  cache: andes_llcache: write the full physical address for CCTL
  cache: andes_llcache: register cache ops only when the errata needs
    them
  cache: andes_llcache: use the hart ID to index the CCTL registers
  dt-bindings: cache: andestech: update schema for generic LLC support
  dt-bindings: cache: rename andestech,ax45mp-cache to andestech,llcache
  cache: andes_llcache: add generic andestech,llcache compatible
  MAINTAINERS: Add maintainer for Andes cache driver
  riscv: errata: andes: allow ERRATA_ANDES_CMO on all Andes SoCs
  riscv: errata: andes: generalize cache errata for Andes cores
  riscv: errata: andes: limit the IOCP workaround to RZ/Five
  dt-bindings: riscv: add Andes A27L2 CPU compatible

 ...45mp-cache.yaml => andestech,llcache.yaml} |  73 ++++--
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig.errata                     |   6 +-
 arch/riscv/errata/andes/errata.c              |  22 +-
 arch/riscv/include/asm/errata_list_vendors.h  |   2 +-
 drivers/cache/Kconfig                         |   9 +-
 drivers/cache/Makefile                        |   2 +-
 drivers/cache/andes_llcache.c                 | 213 +++++++++++++++++
 drivers/cache/ax45mp_cache.c                  | 217 ------------------
 drivers/soc/renesas/Kconfig                   |   2 +-
 include/linux/soc/andes/csr.h                 |  12 +
 12 files changed, 316 insertions(+), 250 deletions(-)
 rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.yaml => andestech,llcache.yaml} (52%)
 create mode 100644 drivers/cache/andes_llcache.c
 delete mode 100644 drivers/cache/ax45mp_cache.c
 create mode 100644 include/linux/soc/andes/csr.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

