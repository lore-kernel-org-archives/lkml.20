Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF2F380FCA;
	Sun, 27 Sep 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496410; cv=none; b=eL2nhAqJMgu7a7jKoXw944FcV0jn8RiaNHTEm6li+qMQ4cKkpdFaRrandTs6fSd+e1kUgcG+GxnArF6Yg0xk3MN1yuut60/Vs16I9pFQ0XKtbewIdNk1sqnGEeFWT01Q62zJETzI25ov7+EF5a9r9jTRDdf+6/SOtdAgeju0tlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496410; c=relaxed/simple;
	bh=xaPxIp98O6P2GRdcGxA2ojoA1iV/lvq+VAkYXJh9le0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oP3Nz3k9q+9dO1/l0WHQU4xiqsIZXzP/MnK8TTbYm8/TlLbGn1qeHy2BNw9FB8b6HmbT4mu45apbbu4bGCcdMLISsIlQoGGrX3vuFqviYz0LDO++iWSyh2T/o5jDdh1U1AlmNT5iqFu9yOLbFq/yVpRDULp2BQ5zyigAQHmQrjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=NKP/gz3z; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="NKP/gz3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790496408; x=1822032408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WFBnaOq2tOHu9Vf2oQkwGYeyWi/eMRfc70hDocu4jx0=;
  b=NKP/gz3zraSrqOwCzBu2UWKcgX+nsmSqqG0GO7nwadVhlm2aoeq9+FfD
   VOcQGe2/i3QyqQJd+u0FXPaHwiE8xp9MxBzPfBBjqN1ZBG71VbnlHaNeu
   xLbhlJbm106rlx8T0UPYqDce3P7MJG5Pn+yDNK8MXM/gc47idhJmA+S+T
   x++d15V4dIRvAZRMMf/WFcwwXjaWV1CXPLA+iSi5xsn3R5ORDL3n+H5zy
   ltBGFjVh1+UwmICO7/9xlGvHsbIEdIwuTNc/I7/CWLMiiyt6StALFMXyW
   IM0P+mT35dQSYM1jW4K1vGLCXW1J5a49ltRI1KDsq5EUfXgifoRUy+/hd
   w==;
X-CSE-ConnectionGUID: +tL2R20TTsG5PJMH/AKjJQ==
X-CSE-MsgGUID: mFzGoy4MTfaxfYNtRXjTqA==
X-IronPort-AV: E=Sophos;i="6.27,126,1787011200"; 
   d="scan'208";a="29615319"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 08:06:44 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:8053]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.104:2525] with esmtp (Farcaster)
 id 352f5e6e-52ee-4f28-87c5-e996bdd5d7da; Sun, 27 Sep 2026 08:06:43 +0000 (UTC)
X-Farcaster-Flow-ID: 352f5e6e-52ee-4f28-87c5-e996bdd5d7da
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 27 Sep 2026 08:06:43 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sun, 27 Sep 2026
 08:06:41 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/8] irqchip/al-fic: shared parent IRQ, error/fatal outputs and affinity
Date: Sun, 27 Sep 2026 08:06:29 +0000
Message-ID: <20260927080637.27285-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

This series extends the Amazon Annapurna Labs Fabric Interrupt Controller
(FIC) driver to support newer hardware revisions found on later Annapurna
Labs SoCs, plus a few smaller fixes and cleanups.

The block the driver calls a FIC is the generic Annapurna Labs interrupt
controller, built from groups of up to 32 triggers each. A device tree node
describes one group, not a whole controller, and the groups of one
controller share that controller's output line toward the parent GIC SPI.
Later revisions add two interrupt outputs on top of the original "info"
output - an "error" output and a "fatal" output - each with its own mask
register. Which output a group drives is fixed when the SoC is wired.

The series is organised as follows:

  1. Fix an argument alignment and a repeated word flagged by checkpatch.
     No functional change.
  2. Use %pOF in log messages and raise the successful-init message to
     pr_info, so each FIC instance is identifiable at boot.
  3. Keep the device_node in struct al_fic instead of a cached name string
     that aliased node storage.
  4. Request the parent interrupt as shared (IRQF_SHARED) instead of a
     chained handler, so the several nodes of one controller can share one
     GIC SPI.
  5. Extend the binding with an optional amazon,al-fic-mask property
     (info, error or fatal; default info) selecting which output a group
     drives.
  6. Add error/fatal output support and FIC v2: version detection from the
     control register, the two extra mask registers, and a mask_cache
     workaround for a v2 erratum where the error and fatal mask registers
     always read back as 0.
  7. Add FIC v3 support. v3 shares v2's group layout but fixes the mask
     read-back erratum, so the v2 workaround is deliberately not applied.
  8. Add an irq_set_affinity callback so drivers that call
     irq_set_affinity() (which fails with -EINVAL when the irqchip has no
     such callback) can probe when routed through a FIC instance.

Patches 4 and 8 are co-developed with Talel Shenhar, the al-fic driver
maintainer, and carry his Signed-off-by.

Changes since v1:
 - Binding (patch 5): drop the two proposed per-output compatible strings
   (amazon,al-fic-error / amazon,al-fic-fatal). A node describes one group
   and a controller reports its revision in the group control register
   (bits 29-28), so no per-revision or per-output compatible is needed.
   Instead select the output with a new optional amazon,al-fic-mask
   property (info, error, fatal; default info), which keeps existing
   amazon,al-fic nodes behaving as before. This addresses Conor Dooley's
   review of the v1 binding patch, and the commit message now describes
   the hardware and the group granularity as he asked. The YAML gains an
   example fragment.
 - FIX (patch 4): the request_irq() error path called
   irq_free_generic_chip(gc), which is kfree(gc) on an interior pointer
   into a single allocation - invalid free, reachable when request_irq()
   fails at probe. Replace it with irq_domain_remove_generic_chips()
   before irq_domain_remove().
 - FIX (patch 6): the v2 mask_cache workaround was dead. mask_cache is not
   seeded until the first child mapping, so the override was overwritten
   with 0 and the first unmask then cleared the whole mask register,
   unmasking all 32 sources. Drop IRQ_GC_INIT_MASK_CACHE for the error and
   fatal outputs and seed mask_cache from the value the driver programmed.
 - New patch 1: checkpatch cleanup (alignment + repeated word), at the head
   of the series.
 - New patch 3: keep the device_node rather than a cached name string;
   reorders the irqchip prep so every commit builds on its own.
 - Reworded commit messages throughout to describe hardware rather than
   device tree mechanics.

v1: https://lore.kernel.org/all/20260924062311.37308-1-farbere@amazon.com/

Eliav Farber (8):
  irqchip/al-fic: fix argument alignment and a repeated word
  irqchip/al-fic: use %pOF and raise init log level
  irqchip/al-fic: keep the device_node instead of a cached name string
  irqchip/al-fic: switch to shared parent interrupt
  dt-bindings: interrupt-controller: amazon,al-fic: add mask selection
  irqchip/al-fic: support error and fatal outputs and FIC v2
  irqchip/al-fic: add support for FIC v3
  irqchip/al-fic: add irq_set_affinity callback

 .../interrupt-controller/amazon,al-fic.yaml   |  16 +-
 drivers/irqchip/irq-al-fic.c                  | 233 ++++++++++++++----
 2 files changed, 206 insertions(+), 43 deletions(-)


base-commit: 6828157ab3e96cd1c957b78d995c5e508a2eb2c2
-- 
2.47.3

