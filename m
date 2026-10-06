Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2869346AA95
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791320353; cv=none; b=UdM8ubr7W3O4ilYc5mioOcpDjZQc6Ng5FLjT2dyiT9e3AfZTx+Cuc3i5ZEArjtjNBPklXOfcDB2UGgZyFIU2QB6eOvbpIpbjaakMZd74UhoTWfi0iW6eGUd5DUMS5Fl34HgGw6N99q8ccTWRTV+Inli5Y8tceczXanv8Ngo6e1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791320353; c=relaxed/simple;
	bh=zEaqD/keesTKdcXgsXY8m8KUWkHjTwm6HH7mYaWE8V0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=AQxcfnUpqrCxdbQxNe9OpHSyMXO8e5399cadJn8EVdH8oIfDJs1UNMEOx7P9u/s4BCfJVXNy8FnmBnrIJzB7EtWH4HbZ8VNoV2FGn0sSdrEqmNyvEJuDqQ7LXSDlh/oh8N0nPhMJRSyWMlR4mhrY3/IluQ0tvunHY/blKLs4eKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rcWumcvO; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rcWumcvO"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7695f6a30so4038283a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791320351; x=1791925151; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDyPmfaJ8JE6BRIRP31IVBFEXCfuxmNqy4o8/EHwRE4=;
        b=rcWumcvOxXAHEFeknPlws9DQ3ffJ6vdrtxYXMkG9Jo7xFZNHenDjJNi0d42xayl1+G
         oUNnXj7YF+j2tGIvWkINgHOM+aDADe0HBDYGnIQpldxoYO8xO8wIaxztyDgN98+r0rxi
         dWkBUqm6vipW/5IYccBpfiWFt4F8SB3lL39YVybSOYRPO8qKmRJdSXsGKw6HRpGFdk+L
         HUSyDfwtmT7zxP7+WzGZatzZqjKGVbIYfryMyrwHyui5CQkeeqeFT99nOb+FpiZEQeB6
         bXtq7WDmfD1l0VgmKqQzb4FohfYLvaCPn5VcmJNu6HzEOmniAa3zfm38abg96nlYL3ZE
         Zleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791320351; x=1791925151;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDyPmfaJ8JE6BRIRP31IVBFEXCfuxmNqy4o8/EHwRE4=;
        b=RwNQEUj249mlEvV8u83CYTnILICXxlgepK4A3IL/CEg/TS1xqGeQgs4u37WqcVCkbz
         TXQedTkzQU9sh4+nE4q9ElS+zQabLw/bWQWM/7nyk1N+FlT181/6L0whnyZ1BggxLJfj
         h02GE8DMjM0soyG9aSDjsBBBmGuaN+z4j/YZOxxXcYoDUkw2cXGb9AyVK/jxTcKUK4uo
         /kPQnTCO1QjpKj1U5gGDeLvfFpt4NysMLe+/choQfa1zUh0eYaB94mTgd1t4DldraMwP
         kuTIsznO8TZn91ozZIao/qT+HWNZDF2Q5Kzoiq5wzMsUybtxJEsSlZ8OvNxH+Qv6+rbq
         z+pw==
X-Forwarded-Encrypted: i=1; AKwUvBwEfdg56sS4+2T7wb2tb4/mkkd20+h5sYDuj3iewTDRw5yG2qqOVoksrF7JAH0BbrgfI/05fxY6E0F0Eok=@vger.kernel.org
X-Gm-Message-State: AFuF++lqx6YF5Y91zx1QuuFTie/YrPP1uW9jh1NXqvSETSI+DzmqQ1bY
	+tRZoHhzCTPXj5OkkmTPqGdwTMPBqQfvpRnWZqHYeKT7oUaBh7B87EbjQGryqBiaXfAL9ab9hUY
	0pxlUBMxaZ2cCleDPBK98bf2GxPE9wfaoZg==
X-Received: from pfjw28.prod.google.com ([2002:aa7:9a1c:0:b0:88c:682e:9aa6])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e93:b0:88c:cacc:e9e8 with SMTP id d2e1a72fcca58-891b4fd2420mr257550b3a.34.1791320351139;
 Tue, 06 Oct 2026 13:59:11 -0700 (PDT)
Date: Tue, 06 Oct 2026 20:59:09 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB1hxWoC/43QwYrCMBAG4FeRnDeSySRp48n3EA9NMq1h3aQ0U
 lyk777Rg8tSWTz+P8z3w9xYoSlSYbvNjU00xxJzqsF8bJg/dWkgHkPNTAppRIvARx+Jn2P65JT
 CmGO6FG6blkCIoIMwrF6OE/Xx+lAPx5pPsVzy9P0YmeHe/u/NwIGj9LIPrUWytB9yHs609fmL3
 cFZ/iJWqNeI5IKD6b1DAR2SWiH4BoIVUc52FlxQDvUKUU+kfsC8RlRFuqDRtl7VMb9C9BuIrog HalCibpRxf5BlWX4A+BFw+8sBAAA=
X-Change-Id: 20260831-pcie-link-endpoints-978e100d5d06
X-Mailer: b4 0.14.3
Message-ID: <20261006-pcie-link-endpoints-v6-0-154d71657d32@google.com>
Subject: [PATCH v6 0/2] PCI: Add Lane Margining at the Receiver debugfs interface
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "=?utf-8?q?Ilpo_J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Priyank Rathod <rathodpriyank@google.com>
Content-Type: text/plain; charset="utf-8"

Lane Margining at the Receiver lets software move the sampling point of
a receiver in time or in voltage while the link stays up, and read back
the errors the receiver sees, to find out how much margin a link running
at 16.0 GT/s or faster has.  pcilmr in pciutils does this today by
writing the capability registers directly from user space.

This series adds a debugfs interface for it.  The kernel sets the link
up for margining and puts it back afterwards:

  - ASPM is turned off for the session with the existing ASPM API,
    Hardware Autonomous Width/Speed Disable are set on both ends, and
    both ends are kept runtime resumed.  All of this is undone when
    the session ends or either end of the link is removed.
  - Before each margining command, the link is checked against the
    state the session started in.
  - User space selects the receiver and the steps; the kernel does not
    run sweeps or interpret results.

Patch 1 adds the interface and its documentation, patch 2 a kselftest.

The only PCI core changes are the init/exit hooks in probe.c and
remove.c and their prototypes in drivers/pci/pci.h.  aspm.c, pci.c and
include/linux/pci.h are not changed.

Signed-off-by: Priyank Rathod <rathodpriyank@google.com>
---
Changes in v6:
- Add a kref on struct pci_lmr_port and use pci_lmr_end_sessions() in
  pci_lmr_reboot_notify() so reboot/kexec waits for in-flight commands
  outside pci_lmr_mutex (preserving the port->lock -> pci_lmr_mutex lock
  order) instead of skipping ports on mutex_trylock() failure.
- Link to v5: https://lore.kernel.org/r/20261006-pcie-link-endpoints-v5-0-c1e73235746b@google.com

Changes in v5:
- Clarify in pcie_lmr.sh why the sysfs 'link/' check targets receiver 6
  (and rename 'up' to 'child'): in PCIe terminology the Upstream Port
  (receiver 6) is the child device below the Downstream Port, and in
  drivers/pci/pcie/aspm.c aspm_ctrl_attrs_are_visible() looks up the
  link via pcie_aspm_get_link(pdev) -> pci_upstream_bridge(pdev)->link_state,
  so '/sys/bus/pci/devices/<dev>/link/' is attached to the child device
  below the Downstream Port, not to the Downstream Port itself.
- Link to v4: https://lore.kernel.org/r/20261006-pcie-link-endpoints-v4-0-ad5398c4260c@google.com

Changes in v4:
- Drop the exported pcie_get_link_endpoints(); the partner lookup is
  private to margin.c (Ilpo).
- Drop pci_aspm_inhibit() and all aspm.c changes.  Use
  pcie_aspm_enabled(), pci_disable_link_state() and
  pci_force_enable_link_state(), call neither when no ASPM state is
  enabled, and restore Clock PM when CLKREQ# was enabled.  ASPM Control
  is checked on both ends before each command.  The remaining
  differences after a session are documented.
- Remove the MSampleMultipleReceivers capability bit.
- One receiver per session, selected with a port-level 'receiver'
  file.  A session starts with receiver 1 on a Downstream Port and 6
  below it, as pcilmr does; receiver 0 is not used for margining.
- Add a per-lane 'status' file with the step response and error count,
  and a 'port' file with the Margining Port bits.  Stop writing
  Margining Port Status.
- Locking: take both device locks with pci_dev_trylock() only while a
  session starts or stops, require both ends to be added, and make no
  runtime PM calls under the LMR locks.
- End sessions from pci_lmr_exit() for either end of the link.
- Commands fail with -EIO after a system suspend.
- Move debugfs to pcie_lmr_<device> at the debugfs root.
- Keep per-device state in margin.c instead of struct pci_dev.
- Split the selftest into its own patch, rename it pcie_lmr, use KTAP,
  and only start a session on the port named by PCIE_LMR_DEV.
- Refer to registers by name instead of specification section numbers.
- Link to v3: https://lore.kernel.org/r/20260904-pcie-link-endpoints-v3-0-4b9a91bd4b35@google.com

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20260904-pcie-link-endpoints-v2-0-16fcb301a3e4@google.com

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260831-pcie-link-endpoints-v1-1-32c2fd893e9e@google.com

---
Priyank Rathod (2):
      PCI/LMR: Add Lane Margining at the Receiver debugfs interface
      selftests/pcie_lmr: Add tests for the Lane Margining debugfs interface

 Documentation/PCI/index.rst                  |    1 +
 Documentation/PCI/pcie-lmr.rst               |  162 +++
 MAINTAINERS                                  |    8 +
 drivers/pci/pci.h                            |    8 +
 drivers/pci/pcie/Kconfig                     |   11 +
 drivers/pci/pcie/Makefile                    |    1 +
 drivers/pci/pcie/margin.c                    | 1609 ++++++++++++++++++++++++++
 drivers/pci/probe.c                          |    1 +
 drivers/pci/remove.c                         |    1 +
 include/uapi/linux/pci_regs.h                |   18 +
 tools/testing/selftests/Makefile             |    1 +
 tools/testing/selftests/pcie_lmr/Makefile    |    3 +
 tools/testing/selftests/pcie_lmr/pcie_lmr.sh |  311 +++++
 13 files changed, 2135 insertions(+)
---
base-commit: 498d9f0561247549701c2af9ea1220a7138eacac
change-id: 20260831-pcie-link-endpoints-978e100d5d06

Best regards,
-- 
Priyank Rathod <rathodpriyank@google.com>

