Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC3F2874E1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531532; cv=none; b=N3MiT9gd4AdCoUBFNBPLD/1zKHd/SquW/tUe//oaPoQQuHurMzsd8ssjxxTwFbFLSeHvJmLhvUOl9nScAwZoRT7bRmJ2aJBdPykBjqH7V0NKKkzg5HR06Yc7iSJogxv54AzlrSXooGVIoy32pZXrFVxnHre0pQMq6vUM7GBMCAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531532; c=relaxed/simple;
	bh=o7ZFXih1aRtJWFxQcya4mju/4ru4hLafjVLjye66/g4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VTqTmzIrHqCI4n7nLOed3J9QmO90X1IDkLwMi/braMid/14o2GsH0Zss1tfYgqgX8dAVmWQXpaxYkYuAJNcARnj0U3PmtDz/LyVd30h96FJnualuI0AEZ3jtrSqYEGNELANAL6JR2Wax7YaqKr4f/F7gTCMRn3HvvCQiGyg1C2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXHyjPG9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXHyjPG9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso25660335e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531529; x=1791136329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A69PJQ7Nmi5xcTUI4BotLtqEyRQMpUL1rHDBHvcBg3M=;
        b=PXHyjPG91LAMJjuzCBxAoF96JlOHS84QxI51PtXP3yDh9yNYkuWc8iq0XqdkwFKe5T
         xnHc7vxDpKbPSg5t6JfZ6rbyFHypmLr1b0ntR5dIsyDZad6F6a8D2c/FLLjLF67/qHeW
         YGYuxaoiY2WniUa5NDE07WK9i+SrJRv8UJWHo0YQz3Dg1flHjZZDna8w+Jk48EkepBZk
         BFQXUGhDbW8hFqa63AXNl3AqqfAJEd+y/OA9pllc4djJnw9nsVPu4eAcEq5DXBaZdB5r
         KS9l0fbBGlacdDbL3SJ8w0AUyDa6jbpwjdoMuQ4NiqxrAQ3Pvhm7XVA/WHi+ddvcjL78
         6K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531529; x=1791136329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A69PJQ7Nmi5xcTUI4BotLtqEyRQMpUL1rHDBHvcBg3M=;
        b=BkaUiHxn/6hBPjO+tLNls2+bRQ/+MZy8IfYSUi9lZ1F78UpQen9XEEcB6wLZFQJoLZ
         /xdbfFgC4Yii8DxdYYRBbWvIMSXxrpkmbykTHYddkTtX//HbBr6lV3CuT/+ojWUIRiDa
         57B3w9QTNvmCrsM89EAN+2IUFp8sijyLkEB/XFSOj5nEjYzsRhHREx2cgsGQtIghBs+l
         mDcT7gG6FCzhCt2YOVlPaTfMo3iMQy6p6kA2AX+GTUQPlE70uucAZ/BbNqoT10253UGd
         Tcuoa2H4qe0sqtxFvnQFE3Xij7Gy20OMPb3J0w8rCXBJ7KjktFXxQLXtNzSwReUSwheW
         Fuew==
X-Forwarded-Encrypted: i=1; AKwUvBwiuRT7ddIqlyvIRNZMgJ3NK5hwBgnFV6pXp7KR8EuXyUm2o4FdNMg0MVdUxIjDkgkFbIty827I7Qloe+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mst2sumxMz2i/gQ8p4DRzh8YRc13F9v/cNvT0NqwJcv4aun50L
	kE1xu2nM1sFclAQXn5PA10YM9hrgBsoYU9aOKCNjiS+dpBGAFQ1nksSV
X-Gm-Gg: AYBFou1FQsVXM3iCrn7BvBtGfpq3s3kVebUgsWzMJ0k/YFYY9+8goJtXn3irRI43J5X
	PNJOT3+bbsyQDOaipyp7N4kU9HLPGuljp+p+opx4AsOpxk9RyIPQ3ZwV6NFekmjN4UwqzyoFGrq
	ukcAic9T9vjBeqlmXxus938ALcpX15ymcLtJ7Xcmt0/cPJOquzq5ZjKOMLTTkf1Y2jghHbZR5Jn
	g0gfGTPuNF5CvYg2D/oWBCOq/wQtrAxHslQQahmDqBtk23z/xolUkvxAFh5o2uhvWD600ab5rtQ
	wBgFn9XxUYiiOMxnK1WZjdcngCv6zawx7uz0CBYcBQ7Ii7Iu6Zvy0yWvBfOKUlHw6SOw3DLPJXR
	UWmKdxmHTfwyV8Xcg1UZGbmSTE6yzdwvrGLRYuAOv2EhxfVagLRCAY3CQ58jbkthJZdqwQiMn3W
	cldG+Ui/a/veTsTR+cQtbtItatBixXY8g8XxMGqB7uU9pBLGLwfcb8z3S8+Js5uyTy2ckp347P4
	/Qj4gEwTlQFq5FB8sYQoyaWoYr1hNgSR19hPLvDjYceX0QWVznXUDE3Pbw7Ua/D41w=
X-Received: by 2002:a05:600c:19c9:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fe7ae84a9mr187353025e9.0.1790531529031;
        Sun, 27 Sep 2026 10:52:09 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm22563923f8f.1.2026.09.27.10.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:52:08 -0700 (PDT)
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
Subject: [PATCH RFC v3 0/5] PCI: pciehp: Report surprise removal during safe removal
Date: Sun, 27 Sep 2026 17:51:57 +0000
Message-ID: <20260927175203.928270-1-abhinjoses@gmail.com>
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
 drivers/misc/edu_srpoc.c               | 171 +++++++++++++++++++++++++
 drivers/pci/hotplug/pci_hotplug_core.c |  21 ++-
 drivers/pci/hotplug/pciehp.h           |   1 +
 drivers/pci/hotplug/pciehp_hpc.c       |  67 ++++++++++
 drivers/pci/pci.h                      |  10 ++
 drivers/pci/pcie/dpc.c                 |  54 ++++++--
 drivers/pci/probe.c                    |   1 +
 include/linux/pci.h                    |  57 +++++++++
 10 files changed, 380 insertions(+), 14 deletions(-)
 create mode 100644 drivers/misc/edu_srpoc.c


base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
--
2.51.1

