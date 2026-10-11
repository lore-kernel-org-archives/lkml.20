Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B78242050;
	Sun, 11 Oct 2026 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695099; cv=none; b=BvwsoKOM53sJcQYdQe0WmU6I6ZYfqM+bAL3/9mzkc+thpFqXuzT4ENsBRb08XI9IeMFaXMcZjBI+p/r7OYIv2m/5BgsJmb+ntmd2J65QIbenoFkB+BKW4uq7KpT3Cauwu1A6HjCLpkhLbD/3FK8DGUveS7kioZ5OdkF/4jLZQew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695099; c=relaxed/simple;
	bh=8GsryULQW3t+UdlV78QIi5IFaLaHhI2THytNcuVSSMs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FDdgHW0rekf0pkIvzbYxd7LveKb1r+rSQ91wSqtpCBeH9M/G7KodCXdnweEhxXjrRbNickNgvBJA1ZZWfx9bGCtkYSv38M1NsvRSspB2nrv8iQY4kx7eUZ8aaGG0kekVH3OCJN296bkLCpZ7nPmFlHUwo0TOwC5otJU6h8pfmDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=d9K+bKif; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="d9K+bKif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695098; x=1823231098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nq1n3MCDMCrOxYmHsV/p30iqaRzrAo2x/jYJlgFyxxI=;
  b=d9K+bKifotFesXMs7/+Qx4SvgNkDLZelNcJY0/6OfWXQhFzl97cGrqME
   K1o86UVAVGer+dRAeRMVJWMu/KCMzYF/0XOH0LEkT8k+xDCV5TY3jrFHA
   DDp4VYCskH1ET6VXaIRiAJ2CKMMPats3EbyxtovBm8ZO6V4noS5kQVJeO
   v62xFT9btog8QNTpSwVPwt3zU1q6dTI5b7hDkSWeDzUfYHfRL0KVRpvUr
   fzgVdwUIE5CO2BczpiVWmRItb8cF89HXVXAjP1Pyluev7BewpJ5YySn4u
   q5Luh+qZ25EI264jMbU58AvHI5axQgn7gyAI//0UlgjlZngV+jKa0wBnO
   g==;
X-CSE-ConnectionGUID: WcJHDpVmTO+g27jAur1qMg==
X-CSE-MsgGUID: RdoGD4LpQJm6URf6cVagJg==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30924730"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:04:55 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:24189]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.7.115:2525] with esmtp (Farcaster)
 id 224c31d1-0129-4298-ba35-296a9fe4459b; Sun, 11 Oct 2026 05:04:55 +0000 (UTC)
X-Farcaster-Flow-ID: 224c31d1-0129-4298-ba35-296a9fe4459b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:04:54 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:04:53 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/9] irqchip/al-fic: shared parent IRQ, error/fatal outputs and affinity
Date: Sun, 11 Oct 2026 05:04:39 +0000
Message-ID: <20261011050449.41903-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
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
  2. Print the init error with %pe instead of %lu, so a failure reports a
     legible error code.
  3. Use %pOF in log messages and raise the successful-init message to
     pr_info, so each FIC instance is identifiable at boot.
  4. Keep the device_node in struct al_fic instead of a cached name string
     that aliased node storage, and take a reference on it.
  5. Request the parent interrupt as shared (IRQF_SHARED) instead of a
     chained handler, so the several nodes of one controller can share one
     GIC SPI. The handler filters the cause register through the generic
     chip's mask cache, so the cache is seeded from the value the driver
     programmed before the parent is requested.
  6. Extend the binding with an optional amazon,al-fic-mask property
     (info, error or fatal; default info) selecting which output a group
     drives.
  7. Add error/fatal output support and FIC v2: version detection from the
     control register and the two extra mask registers.
  8. Add FIC v3 support. v3 reports version id 2 and exposes the same
     group layout as v2, which the existing handling already covers.
  9. Use the interrupt redirection infrastructure to give each child real
     affinity. irq_set_affinity() fails with -EINVAL on a FIC-routed
     interrupt because the FIC has no hardware affinity control and a
     child's handler normally runs in the parent's context; use
     irq_chip_redirect_set_affinity() and generic_handle_demux_domain_irq()
     so a child whose affinity excludes the parent's CPU runs on its
     target CPU in IRQ work context instead.

Changes in v5 - a maintainer rejection and a review thread settled on patch
9, two sashiko-bot findings on the v4 posting, one review comment from
Radu Rendec on patch 4, and two tags. The new patch 2 shifts the
numbering of every later patch by one.
 - patch 9 (was 8): REWRITTEN. Thomas Gleixner rejected the
   IRQ_SET_MASK_OK_DONE approach ("a horrible hack ..."). This version
   instead implements per-child affinity using that infrastructure, per Radu
   Rendec's confirmation of the shape (irq_chip_redirect_set_affinity(),
   generic_handle_demux_domain_irq(), and an irq_pre_redirect callback
   that moves the ack/mask into parent context) and the dw_pci driver he
   and Thomas referenced. Tested on our hardware.
 - new patch 2: print the init error with %pe. al_fic_init_dt() logged
   PTR_ERR(fic) with %lu, which turns a negative error code into a large
   positive number. The bug predates this series and is only visible here
   as context in patch 3.
 - patch 4 (was 3): take a reference on the device_node the driver keeps.
   of_irq_init() stopped holding one past the init callback in commit
   30724547b221 ("of/irq: Fix remaining refcount leaks in of_irq_init()"),
   so the commit message no longer argues from that behaviour. Radu
   Rendec's Reviewed-by is dropped: the code changed.
 - patch 5 (was 4): Radu Rendec's Reviewed-by added.
 - patch 7 (was 6): Radu Rendec's Reviewed-by added.
 - rebased onto v7.3-rc6.

Changes in v4 - all from a sashiko-bot finding on the v3 posting of patch
4. Patches 1, 2, 3, 5 and 8 are unchanged.
 - patch 4: seed gc->mask_cache before the parent is requested and drop
   IRQ_GC_INIT_MASK_CACHE, which only seeds on the first child mapping -
   too late once the handler is shared, and never at all for a group with
   no consumer in the devicetree, leaving the cache at 0 so the handler
   claims interrupts it did not service. Radu Rendec's Reviewed-by is
   dropped: functional change.
 - patch 6: the gc_flags condition and the enum al_fic_version parameter
   go, since patch 4 no longer asks for the flag.
 - patch 7: reduced to the enum addition; the comment it reworded went
   with patch 6's condition. Reviewed-by retained.

Changes in v3 - all from Radu Rendec's review of the v2 series. Patches
1, 2, 5 and 7 are unchanged and carry the tags he and Conor Dooley gave
them; patches 3, 4 and 6 changed; patch 8 is unchanged and its open
question is still being discussed on the v2 thread.
 - patch 3: use of_node_full_name() instead of reaching into
   node->full_name. The commit message is rewritten to say plainly that
   this patch does not fix a lifetime bug - of_irq_init() pins the node
   for the life of the system on a successful init, so node->name was
   never at risk of dangling. The value is making the dependency
   explicit.
 - patch 4: al_fic_irq_handler() no longer derives its return value from
   generic_handle_domain_irq(), which only reports whether the hwirq
   mapping succeeded. It now returns IRQ_HANDLED when the masked CAUSE
   snapshot is non-zero, which is the correct signal for a shared
   interrupt.
 - patch 4: set IRQ_DOMAIN_FLAG_DESTROY_GC on the domain and let
   irq_domain_remove() free the generic chips, instead of calling
   irq_domain_remove_generic_chips() by hand. Both error paths collapse
   into one label. The invalid-free fix from v2 is unaffected; only the
   teardown mechanism changed.
 - patch 4: use of_node_full_name() in the request_irq() call.
 - patch 6: initialise gc_flags to IRQ_GC_INIT_MASK_CACHE at its
   declaration and only clear it on the v2 error/fatal path, dropping the
   else branch.
 - patch 6: use ~0U instead of 0xFFFFFFFF for the mask_cache seed and the
   three mask register writes.
 - patch 6: the commit message now explains the control register
   read-modify-write. Every writable bit in that register resets to 0, so
   preserving the other bits is equivalent to the previous plain write at
   probe time; it is not a behaviour fix.

Changes in v2 - Conor Dooley's review of the v1 binding, plus two bugs
found while re-reading the series.
 - patch 5 (binding): drop the two proposed per-output compatible strings
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

v4: https://lore.kernel.org/all/20261008090058.38591-1-farbere@amazon.com/
v3: https://lore.kernel.org/all/20261005112458.22291-1-farbere@amazon.com/
v2: https://lore.kernel.org/all/20260927080637.27285-1-farbere@amazon.com/
v1: https://lore.kernel.org/all/20260924062311.37308-1-farbere@amazon.com/

Eliav Farber (9):
  irqchip/al-fic: fix argument alignment and a repeated word
  irqchip/al-fic: use %pe to print init error
  irqchip/al-fic: use %pOF and raise init log level
  irqchip/al-fic: keep the device_node instead of a cached name string
  irqchip/al-fic: switch to shared parent interrupt
  dt-bindings: interrupt-controller: amazon,al-fic: add mask selection
  irqchip/al-fic: support error and fatal outputs and FIC v2
  irqchip/al-fic: add support for FIC v3
  irqchip/al-fic: support per-child affinity via interrupt redirection

 .../interrupt-controller/amazon,al-fic.yaml   |  16 +-
 drivers/irqchip/irq-al-fic.c                  | 229 +++++++++++++++----
 2 files changed, 201 insertions(+), 44 deletions(-)


base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.47.3

