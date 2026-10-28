Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182392;
	b=F6B/ljT/6u2prm7v1SbuGn/6Mh4JmxItFd/C1M8erPJhUjPS+aujP/1j8eQz71qpaQaV
	 GGKv6ux4RYSOjCuUHo1cU1mTo9x+5EHw0WU2MySZHw4QI2XkY0lfzH/oIuqiBHZs4ljkd
	 6jXmLSLiBMErNhVd+qDNaeTkwAN17RuybdjrxfPv4KTDVCq7jSCGCXdV3P0dZ95YY8W+R
	 XoClfCuNxE9o4VFRQRytypoNUkmsSHwamaAqu0ErqDB5AatitRRSubP7dxj8098L8aERs
	 sLUMbuHI0IsrVgLUiXdsEwrSA1Jb5S3vtbwFXbfmJNUOQwYgSsNOK/U49X1rZkHF7jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182392;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Last-TLS-Session-Version;
	bh=ubjEcerpRYPkrBmSQwo5V4W5j9UQ8STAOxq9l3KgdhY=;
	b=2Eisxkfa85oUV7+EfVUjfMWQKksUOMFEyz9C6Xx5QXOBi6Rrm0WOVgza3q+oAiz4e/Qx
	 kChejjiwejYi7SRPLfncPTJRlXHgAynyPSanRV80QjTEYoarWDUp8CmSfj7fjd6zaMBAa
	 WZO6s/OajOsw1N5DfaQbq+6ZGF9UFuvUnmcI7c9tUu8V4fndRTmKMud8zISZmO2TpKAV0
	 C4U+1IMdsOJELwYalZu+9dLlFLwUCDgyB86lFcGBj9EZ8qoaddjFexkBX/HurJYdtLOBw
	 1vKoqf9ShBuSqfqs88I/w0rxV6sNOxUd3ab0UvaJ6YWaiIUOF1R6a1do4/MI2CA1bsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Y32I/9WL";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CE7606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96CE7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Y32I/9WL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 45200C4FECF
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:14:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6021D60769;
	Wed, 28 Oct 2026 10:13:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E68910329092;
	Wed, 28 Oct 2026 11:13:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793182381; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=ubjEcerpRYPkrBmSQwo5V4W5j9UQ8STAOxq9l3KgdhY=;
	b=Y32I/9WLzaPlwIj+mxfZ/HpWH7Un45e7Ahgutq1FG6U2toCHBXBGO14FoK3dsBY/0j9WWk
	y187cJNvUOe3o2z29mEPbpsXFSQ3lUa21MggROM8RxLR16bxf3Y/8uQvMOlpKlYHe961Ws
	QITSz4QfWsLmHSD6zQkv6gzbmIVY0u4Mdzv2m7kBiJ+tajt5y14PMkfWKcC+1qpSoHWC6A
	v0jF9LVBHrkBSBKmcc7tWkAxWfZf9MG/NCfeG1LXx8GnP35sAXOzyWJNZx8mMGTWFrUgwI
	VKdIUmsZdENydcaY1mse15Sbx56oNy+21pfBMn/NiigbTScV8/c1ZOfjht746w==
Date: Wed, 28 Oct 2026 11:12:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 7.4
Message-ID: <20261028101259ce32989d@mail.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3

Hello Linus,

Here is the i3c subsystem pull request for 7.4. It introduces the I3C
hub support in the core with drivers still being worked on. Then we have
the usual fixes and cleanups.


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.4

for you to fetch changes up to fc5eb1b0631aa3b34c530ae962d01699ed22a0ae:

  dt-bindings: i3c: Add Synaptics sl2610 i3c (2026-10-08 14:21:37 +0200)

----------------------------------------------------------------
I3C for 7.4

Subsystem:
 - Add APIs for I3C hub support
 - Restrict HDR modes to those supported by the bus and target
 - Fix ACPI target enumeration on multi-instance controllers by extracting the
   bus-controller instance number and PID from the correct _ADR fields.
 - allocate IBI workqueue with WQ_HIGHPRI

Drivers:
 - dw: Synaptics sl2610 support
 - mipi-i3c-hci: HDR-DDR support, cleanup and fixes

----------------------------------------------------------------
Adrian Hunter (17):
      i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
      i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
      i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
      i3c: master: Match ACPI targets to the correct bus controller instance
      i3c: master: Remove stale GETSTATUS length check
      i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
      i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
      i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
      i3c: mipi-i3c-hci: Process multiple IBIs per interrupt
      i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
      i3c: mipi-i3c-hci: Stop rings gracefully when suspending
      i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
      i3c: mipi-i3c-hci: Remove invalid transfer size limit
      i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
      i3c: mipi-i3c-hci: Support configurable device NACK retries
      i3c: Restrict HDR modes to those supported by the bus and target
      i3c: mipi-i3c-hci: Add HDR-DDR support

Aman Kumar Pandey (2):
      i3c: master: Add APIs for I3C hub support
      dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support

Fan Wu (1):
      i3c: master: adi: free the IRQ before unregistering the master

Jisheng Zhang (3):
      dt-bindings: i3c: dw: support up to two reset lines
      i3c: dw: switch to array-based exclusive reset control
      dt-bindings: i3c: Add Synaptics sl2610 i3c

Lakshay Piplani (2):
      i3c: master: Add controller-only device operation helpers
      i3c: hub: Add support for the I3C interface in the I3C hub

Pawel Zalewski (1):
      i3c: master: use named initializers for acpi_device_id

Shubham Patil (1):
      i3c: master: amd: Report direct CCC read length in payload.actual_len

Stanley Chu (1):
      i3c: master: allocate IBI workqueue with WQ_HIGHPRI

 .../devicetree/bindings/i3c/nxp,p3h2840.yaml       | 330 ++++++++
 .../bindings/i3c/snps,dw-i3c-master.yaml           |  16 +-
 MAINTAINERS                                        |   9 +
 drivers/i3c/Kconfig                                |  14 +
 drivers/i3c/Makefile                               |   1 +
 drivers/i3c/device.c                               |  15 +-
 drivers/i3c/hub.c                                  | 832 +++++++++++++++++++++
 drivers/i3c/internals.h                            |  16 +
 drivers/i3c/master.c                               | 476 ++++++++++--
 drivers/i3c/master/adi-i3c-master.c                |   4 +
 drivers/i3c/master/amd-i3c-master.c                |   4 +-
 drivers/i3c/master/dw-i3c-master.c                 |  28 +-
 drivers/i3c/master/dw-i3c-master.h                 |   2 +-
 drivers/i3c/master/mipi-i3c-hci/cmd.h              |   4 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |  28 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             | 112 ++-
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   2 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  13 +-
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 136 +++-
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   9 +-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |   5 +-
 include/linux/i3c/device.h                         |   4 +
 include/linux/i3c/hub.h                            |  92 +++
 include/linux/i3c/master.h                         |  20 +
 include/linux/platform_data/mipi-i3c-hci.h         |   4 +
 26 files changed, 2024 insertions(+), 156 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 create mode 100644 drivers/i3c/hub.c
 create mode 100644 include/linux/i3c/hub.h

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
