Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C33D2E401;
	Mon,  5 Oct 2026 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199508; cv=none; b=fxfMW8LffHcrcAJ8cq7LlCmmnpf9s12mnCxiu66l5Usaxe3l58OrSD2KTRMQnllaupbwjtfWhOcaJKHxBD8OcV9popA+Txf85WBb4tEN5YVWhCznWJm+VmQnlLHjsnvx8WTW5lTG4cpIP9OzRDufHBn84QUzn5BLL0zND38cfLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199508; c=relaxed/simple;
	bh=lsiuQCisNnRKJ2Ci6DHugfMl2rXdW2qNDLtm3ytqnDs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rNbYzhA7uDWX0VsqwLO9ptUsYHip2k6M7KgVuA8n8CmC0CAmMcR5s3U30Ef/vFl7gPrGsGtVf/GOTigOeYagsb4lHxSW97/nxmAr9Y47eXF+Up8zy2iY+cX0/PttzI6vmBF4cZWGegu6o2zBx/L4Dr3IGrAzZ7h+y9jkudNCMuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=q/3MlC3C; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="q/3MlC3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199507; x=1822735507;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mkNbuN3d+jIbvrPDd+18NnL5Hjxe+/IRmYAm1E729tQ=;
  b=q/3MlC3CuSTxbGpQx7KS44PXC3NsQjUAcO1E9Z/EHLcoMERv7fBhegsi
   6xXjS1+01uta6ekZWMrSheOlgmEs/KRmOJ4vCbq+/PMNNjExYpTeqs78K
   MThVEGWz6GyBJEcTuL7b26rRcNb2MCDYg7fw8PH7P9PTOij3jjpL1j1u2
   2gXl3M91gRqtoPn2y3s8I1rCaEbIwsaFOjsCL9GrZdDzYOFFg+zFLSsjm
   5FOUYEJnEqslwR8J6S+35CmRbYurC/26HRvlK6lV3PHK0mMIiuaHBLXsj
   pYf8WZMDCVRx1Jhbt15tFedXda/7XIWxDRAmjYZowCIbbuKnQWqSVqED8
   g==;
X-CSE-ConnectionGUID: 8B6kUveqQ5a5DLgubZjYJA==
X-CSE-MsgGUID: VopySfgeTbqqEikA4gPAyw==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30206218"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:05 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:2788]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.44.113:2525] with esmtp (Farcaster)
 id 0cadce7a-a239-44dc-ba16-3a66c350d848; Mon, 5 Oct 2026 11:25:04 +0000 (UTC)
X-Farcaster-Flow-ID: 0cadce7a-a239-44dc-ba16-3a66c350d848
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:25:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Mon, 5 Oct 2026
 11:25:02 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/8] irqchip/al-fic: shared parent IRQ, error/fatal outputs and affinity
Date: Mon, 5 Oct 2026 11:24:50 +0000
Message-ID: <20261005112458.22291-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWA001.ant.amazon.com (10.13.139.110) To
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

v2: https://lore.kernel.org/all/20260927080637.27285-1-farbere@amazon.com/
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
 drivers/irqchip/irq-al-fic.c                  | 228 +++++++++++++++---
 2 files changed, 203 insertions(+), 41 deletions(-)


base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
-- 
2.47.3

