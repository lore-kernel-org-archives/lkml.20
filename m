Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EF84119F4;
	Thu, 24 Sep 2026 06:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231001; cv=none; b=VZBhXcqq35kntuzE+YA+CJ91rLNrAgGXMtAhnhXhPAHNtGHt99wWcsEyReZWmqFyE45jrMuh+zz7hKPZwJTnqx56Mo8U0yzChTJLIgIP7FhWhiOL6JnFyM+GHZEBZ1UXa7UlXWDK9+7YZuJGYfUwgvGJW/+5FvGpXkDl11AmvHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231001; c=relaxed/simple;
	bh=Xwcq38e3RbilMI1gGIjkMZNrYlVq2jybpt4DjYrTQ7M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fOBlkqc/oS7Q7dY20rJ85/KYpPzlljbU5X7S/gnzlUcPOrZMfvsvc7PSRSfymHQvcsWTiAdIxtMdLCD8f1VINd3aXsSwQcN1JPBjFxJp0z63Iyv4NdZr+I4zcnXL2BOWjK/4zVgNk0iuSV5eIFr3vJ+uncUdZkxxa2AjziXhBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=J8quiVIb; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="J8quiVIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790230999; x=1821766999;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q4ZvlragUFzYq36yGWnS3+3nrMYV6JILA5S7BMCgYF0=;
  b=J8quiVIbmFFbj7sIfaiE44GV9N2RzPccHuJRzX626jqNqdjFZDXP+i4H
   M82HpyOeL3MbhqqhqD+q93f7SxjZCJ2a69bNAufKWU+8+bk1wKjzbFEiZ
   20szWpSCfck1/UOF3svZb7xsS7URlYhsI1OJsUnXUdpZMSkz+cjI16QhW
   1IUeamXNnl0Y0fGe2EVNSRFfrz5FWqBugtxVNCK57OB5FyKn4ml6hK0Eb
   oFBV8kWkrSvD3EzQMyzptVU5i/Gi+W5dMM6CmSBe2LEsdYiqh2rUQrzQB
   JnIIZycUDGHwpFN6/mAKMMaCtj8kC9SMkjxifQjqTbi5WVMn7m9hxixHE
   Q==;
X-CSE-ConnectionGUID: XF7vMMdgTLOP0dX4dTGO+w==
X-CSE-MsgGUID: iMMWJVtnQVWgNFWymA+A5g==
X-IronPort-AV: E=Sophos;i="6.27,120,1787011200"; 
   d="scan'208";a="29296122"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:23:17 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:11404]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.27:2525] with esmtp (Farcaster)
 id 160bbd05-1c47-4d2d-a546-73bbb9c47201; Thu, 24 Sep 2026 06:23:17 +0000 (UTC)
X-Farcaster-Flow-ID: 160bbd05-1c47-4d2d-a546-73bbb9c47201
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 24 Sep 2026 06:23:16 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 24 Sep 2026
 06:23:15 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/6] irqchip/al-fic: shared parent IRQ, FIC v2/v3 and affinity
Date: Thu, 24 Sep 2026 06:23:05 +0000
Message-ID: <20260924062311.37308-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWB002.ant.amazon.com (10.13.138.89) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

This series extends the Amazon Annapurna Labs Fabric Interrupt Controller
(FIC) driver to support newer hardware revisions and configurations found
on later Annapurna Labs SoCs, plus a couple of smaller fixes.

FIC v2 and later add two interrupt groups alongside the existing legacy
group - an "error" group and a "fatal" group - each described by its own
device tree node and matched by a distinct compatible string. On some
platforms several FIC instances also share a single parent GIC SPI, which
the driver did not previously support.

The series is organised as follows:

  1. Use the full node name in log messages and raise the successful-init
     message to pr_info, so each FIC instance is identifiable at boot.
  2. Request the parent interrupt as shared (IRQF_SHARED) instead of a
     chained handler, so multiple FIC instances can share one GIC SPI.
  3. Extend the binding with the amazon,al-fic-error and amazon,al-fic-fatal
     compatibles for the new groups.
  4. Add FIC v2 support: version detection, the error/fatal groups, and a
     mask_cache workaround for a v2 erratum where the error and fatal mask
     registers always read back as 0.
  5. Add FIC v3 support. v3 shares v2's group layout but fixes the mask
     read-back erratum, so the v2 workaround is deliberately not applied.
  6. Add an irq_set_affinity callback so drivers that call
     irq_set_affinity() (which fails with -EINVAL when the irqchip has no
     such callback) can probe when routed through a FIC instance.

Eliav Farber (6):
  irqchip/al-fic: use full node name and raise init log level
  irqchip/al-fic: switch to shared parent interrupt
  dt-bindings: interrupt-controller: amazon,al-fic: add error/fatal
    groups
  irqchip/al-fic: add support for FIC v2
  irqchip/al-fic: add support for FIC v3
  irqchip/al-fic: add irq_set_affinity callback

 .../interrupt-controller/amazon,al-fic.yaml   |   5 +-
 drivers/irqchip/irq-al-fic.c                  | 176 +++++++++++++++---
 2 files changed, 150 insertions(+), 31 deletions(-)


base-commit: 6828157ab3e96cd1c957b78d995c5e508a2eb2c2
-- 
2.47.3

