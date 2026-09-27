Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D223CAE75
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790533225; cv=none; b=ByG1IGtACbXokRIDE4YFxvyibhVQopjaYYFjd7wb2q/U0NGmXLZqgRTIQWG7YHByttru0N6rvcUFjvv8ykbVaMb0nIv7tH4BABV6f0G1Sd66vNUVT33Vr2+/lYhjKgqWXkJ9cxh1D3+Wyi4YvRqD6BE8CS2dMLnc6FCGDxm5kLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790533225; c=relaxed/simple;
	bh=kW3ZQ8rsWG97RcRaXa/dACFdTUVf2kqBOBluag6uxyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptTLfbS2TrRj9DwNc124pFpcyIAcoxglWF4w6Hn9Ie4pavl4Ebsi+R80PTW5/jCVO6TOAYeV/zHEJi/GK3GGvLYdohOWwMskkiO6p3i3r6PW6Afu697tSFO+DABFLIdur8MxOa9SohQljij6cKJA0kidkftxN8WkxENF4g0A23U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bH2xn/Z8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bH2xn/Z8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso10026145e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790533222; x=1791138022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8DyMH8xCm6UAOKZ4ziM3bYEXT9IVU4WoapGwh9T8uhA=;
        b=bH2xn/Z8Ye20v3hMAr/fnRBRMRjM9/0ldU+EgLvdfwP3O8V3WZvT68PcsUzmeZyW4R
         dB1o3nIZZyHE7UKe3tDLvil29WgII0Ev4fSy88VW+XjcINXEV9i1J6f7MrfsuLeHec2K
         2HgUPeaVi3kNObM9GHolDIz/aJC5Xh4/ZP8Y/LqJVGtHDzumjqL/1lWZ1PeR3455EUaZ
         yt43Fh/amD756TwjzkO+cgczFzB2FBXBeZGmcflZUAUoZHo6ov0JFy3swMxxzuRJF5pr
         vHTq0HX1sfTCtQO7aKBF7GgbElq8rMKa1tcAbVvbx//omfgmjLBWplNIQvchJXkV0MQt
         IOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790533222; x=1791138022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DyMH8xCm6UAOKZ4ziM3bYEXT9IVU4WoapGwh9T8uhA=;
        b=B3uVjmbWtyP7g8EBCF8Pntm4hyJZDaFRhKpy5sPDdtOPZ2SMW87ZvQ4wEfe6yhfW1g
         bgeQCCofkF3GZPyFtI9LQepjuBSAwcEjP+5bhJECdmZbLMK9k3YZIuALi/ZehlMCuURF
         N8yNeaHeaHMpu3zTbQ8XeIAAMfZQILLyWOkoh0ylpFADXy31szAxYk9nohQi7bnxOHPC
         UnfRNIfBsFniHd44y60vTHa6Ps6NLIoGO8SbF10+OZMhQysMoqGGbEFyKg5RhERElEsI
         B0es5aqg6RLDNUO33FnRvM+BBHaNbwAjFcznmGiVN5wNVsCDPCubHZgpBfTiuvvNmmSL
         uDIw==
X-Forwarded-Encrypted: i=1; AKwUvBwSfotX24LF5RBBB7/QV0mlV2Amkdp7nYosxzuxIq53yBONfSOyroQg0XeeWjXhKCKgsPMRPJZO0KSyb4o=@vger.kernel.org
X-Gm-Message-State: AFuF++kKaqXokRAGixkxDiKJ3afpaNKCUWPjvrQZJA9ZHbWwZgrscSFi
	fcSjSTPDUB11+lxhbp8zV2JMK4Yc7fFAjgHH3fG+C05pIlcfShnr/kjQIDjKWQ==
X-Gm-Gg: AYBFou0FOt7uGSGBQBI/wGF8JdjwIwrTuVmurBlyDjne1Pg5TsFpuBvHCNlZ2uTsAfR
	n6Z5yeQqFXSM/gqJtT35svwWCRIY0DicsyiWZhTnKijv8IR+ZlVUXoFMYGShvRPc8CDaygLRoUJ
	dr9AtFPSR/099vjgILXAbpHdaLMAm2Fm3PCSdhRf+eV1pAK3v53giy3Zm/sBNJUkrGEX9NHqahN
	CySdr3KZidalLik0faLa/Lnq4bMjENoC5Om9kwUJefb0YmcAUpP00PJcZZ5nhkJW7Vkf+QOEiDW
	c+j6lfV7+2VcjCFkPf2qDdJPZriPrwjiV0JHLW6v1KMXtmhBHWeyNtqi59eD0DiRS+3gB/XgeuU
	W868KaBW+A0ZOCyiIcq/KoxjIQOKE8UaJTGbBa7xqzOEbOwHJeCiy+eCeOoYORE7b8scoKHNcAG
	d4QR6/ElmQly84u9Ce+Mo/P4u9zjaYnU4+TTzcyseEzTCO7D4eei+onYZiW4UYb6EjHwFs4Csjb
	2zXGAQCz1Y7xYgEc+/3gcx6U3qgn7t9W5ABfIcLSLSmVffMXrUIwxe6TN+94yW2UY/GNRJkM4R4
	/g==
X-Received: by 2002:a05:600c:4eca:b0:49d:2450:68ac with SMTP id 5b1f17b1804b1-49fe66caac9mr208265845e9.5.1790533222192;
        Sun, 27 Sep 2026 11:20:22 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a002d1d8d5sm38371585e9.0.2026.09.27.11.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:20:21 -0700 (PDT)
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Kees Cook <kees@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Abhin Parekadan Jose <abhinjoses@gmail.com>
Subject: [PATCH RFC v4 0/5] PCI: pciehp: Report surprise removal during safe removal
Date: Sun, 27 Sep 2026 18:20:11 +0000
Message-ID: <20260927182017.938565-1-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a safe removal is already in progress when the device is surprise
removed, pciehp cannot report the disconnect [1]. The removal blocks
waiting on a device interrupt or status read, and pciehp's IRQ thread is
single-threaded and is itself executing that removal, so it never runs
again to report the device gone. The removal hangs indefinitely.

pciehp_isr() does run while the IRQ thread is blocked, but pciehp_ist()
must ignore link and presence changes caused by Secondary Bus Reset or
DPC, and telling those apart takes seconds which cannot be spent in
hardirq.

Patch 4 does not do that work in hardirq. pciehp_isr() only checks
whether the card is present or the link is active, and defers the rest
to a work item in process context. The work item does not need to know
why the link changed, only whether the card is gone: it waits for DPC
recovery or a Secondary Bus Reset in progress to complete, then checks
again under reset_lock, and if the card is absent and the link is down
marks the devices below disconnected, which schedules the driver's
disconnect work from patch 1. pciehp_ist() is unchanged and
remains the only consumer of the one-shot flags PCI_DPC_RECOVERED and
PCI_LINK_CHANGED, which tell it whether a link change can be ignored.

Patches:

  1/5 Michael's "PCI: Report surprise removal event" from his RFC v5,
      which adds disconnect_work_enable and pdev->disconnect_work.
      Changed to serialize disconnect_work_enable with a per-device
      spinlock.

  2/5 Add pci_hp_wait_link_change(), which awaits a Secondary Bus Reset
      in progress without consuming PCI_LINK_CHANGED.

  3/5 Add pci_dpc_wait_recovery(), which awaits DPC recovery without
      consuming PCI_DPC_RECOVERED.

  4/5 The pciehp change. Adds disconnect_work to struct controller,
      scheduled from pciehp_isr() on PDC or DLLSC when neither Presence
      Detect State nor Data Link Layer Link Active indicates a card.

  5/5 A POC driver for the QEMU edu device that blocks in remove()
      waiting for an interrupt, standing in for del_gendisk() stuck in
      blk_mq_freeze_queue_wait(). Not for merge -- included so the
      hang can be reproduced.

Changes since RFC v3 [5]:

  - 5/5: Reinitialize the completion in remove() before requesting the
    delayed interrupt, so that an earlier completion cannot let remove()
    return while the interrupt is still pending. (Sashiko)
  - 1/5 to 4/5: No changes.

Changes since RFC v2 [4]:

  - 1/5: Protect disconnect_work_enable with a per-device spinlock, held
    while testing it and scheduling the work, instead of lockless
    accesses and barriers.  pci_dev_set_disconnected() could otherwise
    test the flag, get preempted, and queue the work while a newly bound
    driver re-initializes it.  With the lock, cancel_work_sync() is
    sufficient again, so go back to it from disable_work_sync().
    (Sashiko)
  - 2/5: Test PCI_LINK_CHANGING with test_bit_acquire(), so that the
    caller's subsequent accesses are ordered after the end of the code
    section even if wait_event() returns without sleeping. (Sashiko)
  - 3/5, 4/5, 5/5: No changes.

Changes since RFC v1 [2]:

  - 1/5: Use disable_work_sync() instead of cancel_work_sync() in
    pci_clear_disconnect_work(), so that a racing schedule_work() cannot
    queue the work after remove() has returned. (Sashiko)
  - 2/5, 3/5: New.
  - 4/5: Drop schedule_notification_work(); pci_dev_set_disconnected()
    schedules the driver's disconnect work for all callers again.
    (Michael)
  - 4/5: Don't consume PCI_DPC_RECOVERED and PCI_LINK_CHANGED in the
    work item.  In v1 it ran the same spurious link change test as
    pciehp_ist(), and whichever ran first took the flags, so pciehp_ist()
    could tear down a device that was only reset. (Sashiko)
  - 4/5: Check presence with pciehp_card_present_or_link_active() in
    both pciehp_isr() and the work item, as pciehp_ist() does, so that a
    port with Presence Detect State hardwired to zero is not mistaken
    for an empty slot.
  - 4/5: Return early from the work item if pciehp_ist() has already
    taken the pending events, and treat a read error of the presence
    check as "not present". (Sashiko)
  - 4/5: In pciehp_isr(), check presence before dropping the runtime PM
    reference on the port's parent.  In the work item, take a runtime PM
    reference and check presence under reset_lock, since a slot reset
    may make Presence Detect State and Link Active flap.
  - 5/5: Build only with CONFIG_EDU_SRPOC, which depends on PCI; don't
    claim the interrupt when the device reads all ones; clear bus
    mastering on teardown. (Sashiko)

Testing

Reproducing this needs QEMU changes, since neither device_del nor the
attention button produces a true surprise removal.  A branch with both
is here [3]:

  - a delayed-IRQ register on the edu device (BAR0 0x30, write N ms)
  - a pcie_surprise_del monitor command that drops the device and
    generates PDC=1, DLLSC=1, PDS=0

Both tests use:

  ./qemu-system-aarch64 -machine virt,gic-version=3 -cpu cortex-a57 \
    -m 512 -smp 2 -kernel Image -initrd initramfs.cpio.gz \
    -device pcie-root-port,id=rp1,chassis=1,slot=1 \
    -device edu,bus=rp1,id=edu0 -append "console=ttyAMA0 rdinit=/init" \
    -nographic -monitor unix:/tmp/qemu-mon.sock,server,nowait

  and need a guest kernel with CONFIG_EDU_SRPOC=y.

Test 1 (Hang in remove() on a user thread, then surprise removal):

  guest# echo 1 > /sys/bus/pci/devices/0000:01:00.0/remove &
  host$  echo "pcie_surprise_del edu0" | socat - unix-connect:/tmp/qemu-mon.sock

  This is the case patch 1 solves on its own: pciehp's IRQ thread is
  free and handles the removal.

Test 2 (Hang in remove() on pciehp's IRQ thread, then surprise removal):

  guest# echo 0 > /sys/bus/pci/slots/1/power &
  host$  echo "pcie_surprise_del edu0" | socat - unix-connect:/tmp/qemu-mon.sock

  Without patch 4 the safe removal does not return until the delayed
  interrupt fires 600 s later.  With it,
  pciehp_isr() schedules ctrl->disconnect_work, which marks the device
  disconnected; the POC driver's disconnect work completes the wait and
  remove() proceeds.

Open questions

  - Is this a viable approach?

[1] https://lore.kernel.org/all/aHlZE18kPuHuDtTT@wunner.de/
[2] https://lore.kernel.org/all/20260905183905.997833-1-abhinjoses@gmail.com/
[3] https://gitlab.com/abhinkop/qemu/-/commits/suprise-removal
[4] https://lore.kernel.org/all/20260927165459.829900-1-abhinjoses@gmail.com/
[5] https://lore.kernel.org/all/20260927175203.928270-1-abhinjoses@gmail.com/

Assisted-by: LLM

Abhin Parekadan Jose (4):
  PCI: pciehp: Add pci_hp_wait_link_change()
  PCI/DPC: Add pci_dpc_wait_recovery()
  PCI: pciehp: Report surprise removal from pciehp_isr()
  misc: Add edu_srpoc surprise removal POC driver

Michael S. Tsirkin (1):
  PCI: Report surprise removal event

 drivers/misc/Kconfig                   |  11 ++
 drivers/misc/Makefile                  |   1 +
 drivers/misc/edu_srpoc.c               | 172 +++++++++++++++++++++++++
 drivers/pci/hotplug/pci_hotplug_core.c |  21 ++-
 drivers/pci/hotplug/pciehp.h           |   1 +
 drivers/pci/hotplug/pciehp_hpc.c       |  67 ++++++++++
 drivers/pci/pci.h                      |  10 ++
 drivers/pci/pcie/dpc.c                 |  54 ++++++--
 drivers/pci/probe.c                    |   1 +
 include/linux/pci.h                    |  57 ++++++++
 10 files changed, 381 insertions(+), 14 deletions(-)
 create mode 100644 drivers/misc/edu_srpoc.c


base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
--
2.51.1

