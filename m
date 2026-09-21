Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F30F35B63C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032029; cv=none; b=E2hFDjBlWUio8ZX/9MdOZvdvzQ9P9pMw+S2/BkkYQVdJ4GmtPOoaShoL0XlfH5gD/TU7hunp029STsQb4eP1kNASKn/Jj0Hm2lQfA0glNfsJHivxT4u+6Ii6lQt6bgXX43Nr2ns8BMhs6aJI/phjuVZ83j6/T3858E+aj/9GGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032029; c=relaxed/simple;
	bh=fu64FwrNjb2hoH27b9UxxeBlO22gWRo+fs75+W9N+4U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gEq6PEZ5mBa9fZwYQTsOYKewTvy8WgpJDSGAKqxmgqIMMVfO1Ch3gFfPZPNQuIC9rjporybbxLXrkO2Ff7p3ajbLdaSQUc2K8pHsJIuZ3LBOjyNmIMyI+ytKkJW9uVG+/KgjC8DOrpgU6VPNqeEcGJej5bfeF/vu015HDU2PMuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tZhRXlKb; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tZhRXlKb"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso6311476a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032027; x=1790636827; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0uQiQwfP+TVPEJ4NOA/kG2fqYUhDVbqR/UiJjrphkT8=;
        b=tZhRXlKbLzHpBRz4PfgCn72nQ6RCgi/cdHrPSC7rHENfVkfiWK1pQYxHEpUTBdlR8q
         GnMLpAJiaKDLWMzp2Hq0JuQjk5T9eMjDOQBwN2pOEuG8JY8cXiKkoOJyor8VbWMpGYdq
         Xhlw4ErCfsrTr51N41eYWvxh9pFSTAAmIvHJHYpMr02vbR73LbHQCPbnslJ+He3BDWf8
         UXz1+U+GwRvlLpyuceIOruVq+vlnkJN5uEgIbEdOY0dNrzcLy+gNLqYb7MDrl0gFzGd6
         nsnymA1CP1X5HHa1A6f44vuJsHUfTKk2bwBSvGvX1soRimVt/OcMe7WlAqfBTmQj5Ggq
         I8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032027; x=1790636827;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uQiQwfP+TVPEJ4NOA/kG2fqYUhDVbqR/UiJjrphkT8=;
        b=Qvyi4/o4is/+R099lzupt2aOohLOnuqPzmVmNUVEvTCYtC6BDVxFE52iEovHnQAkd1
         7Nu7EdfZEPxQB3pcOsu2aYag/YgHmhdJ2yctAVTx7ZO2Tl0velbzay9Se5C326BhsR7h
         6vTq+bEpu7mw8En1NWGINi2323lTBs8HjPKdFGllVUTUBpw6bKQlHj0pBSSX5QQjzG2o
         8nSM9e+dtXblZROZ5PcaV82u6OiNOBlpWp2I46oRB8+nz7CYL4DScKEbf/JdH6Jjf/eV
         L2fqzbgnWUXMAbWOAztTTNX+feHMRHwxKlqRETo5njWSsXuGmtm7OMhdy/Cf33n/CAsX
         1GGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5Z4RCYk/sv5GUyI6lqSBHpCNly1jdUHqbDXCFIMneifeawy8JHPvscu7VILBV6EcFQuyxFvvcbX1oBx4=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ164MI++PBrO4BnNfcmcS3JZ8Dxyg5oIMKMhsIA4ywUJPwLFN
	+BP+SqL3t1rk+DrKBbRzlN+0ij5LVaFCDSzjqcUJlW5pYp7Yq26x3M76OB9wjRLjJ+XNtiLcPGq
	wAenoen0bGGmZGDfbHxxAJwT+IFrMzA==
X-Received: from dybta14.prod.google.com ([2002:a05:7301:6f0e:b0:313:b34f:8861])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2743:b0:39e:6c69:34de with SMTP id 98e67ed59e1d1-3a06b0ccf6fmr449314a91.66.1790032027092;
 Mon, 21 Sep 2026 16:07:07 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:05:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-1-samagazaryan@google.com>
Subject: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
Content-Type: text/plain; charset="UTF-8"

This patch series introduces the i3cdev module, exposing unbound I3C
target devices to userspace via character device nodes (/dev/bus/i3c/*),
along with the i3ctransfer userspace utility in tools/i3c/.

Userspace access to I3C targets is needed for devices that do not have a
kernel driver bound to them, such as targets in ROM/bootloader recovery
mode (e.g., OCP Secure Firmware Recovery v1.1 and Caliptra Silicon Root of
Trust recovery flows), as well as hardware bring-up and diagnostics.

When a kernel driver later binds to an I3C device (for example via
dynamic module loading), i3cdev automatically detaches via the
BUS_NOTIFY_BIND_DRIVER notifier so kernel drivers always take
precedence.

Testing status:
This v5 series has been compile-tested across all modified I3C controller
drivers with W=1. Posting v5 now so collaborators and controller owners
can test the unified UAPI and actual_len updates on their respective
hardware and provide Tested-by tags while we complete final hardware
verification of the v5 updates on our platform.

Changes in v5:
- Updated Patch 2/5 ("i3c: master: add i3c_for_each_dev helper"):
  - Dropped mutex_lock(&i3c_core_lock) around bus_for_each_dev() to avoid
    lock inversion and deadlock with external callbacks (sashiko-bot).
- Added Patch 3/5 ("i3c: use actual_len for read transfers"):
  - Clarified @actual_len kerneldoc in <linux/i3c/device.h>
    (Adrian Hunter).
  - Incorporated Meagan Lloyd's controller updates (adi, dw, cdns,
    mipi-i3c-hci, renesas) so all I3C controller drivers populate
    xfer->actual_len on reads without mutating xfer->len
    (Adrian Hunter, Meagan Lloyd).
  - Updated mctp-i3c to read xfer.actual_len instead of xfer.len
    (Adrian Hunter).
- Updated Patch 4/5 ("i3c: add i3cdev module to expose i3c dev in /dev"):
  - Unified the UAPI around struct i3c_ioc_xfer and I3C_IOC_XFER(N) in
    <uapi/linux/i3c/i3cdev.h>, supporting both SDR and HDR modes via a
    mode field and union { __u8 rnw; __u8 cmd; } (Frank Li).
  - Added __u16 actual_len to struct i3c_ioc_xfer and updated
    i3cdev_do_xfer() to copy actual_len bytes to userspace and write
    actual_len back to userspace via put_user() on read transfers
    (Adrian Hunter, Frank Li).
  - Tracked active i3cdev instances in a private list (i3cdev_list)
    instead of using i3cdev_set_drvdata()/i3cdev_get_drvdata() so i3cdev
    never clobbers client drivers' dev->driver_data (Meagan Lloyd).
  - Validated direction field and verified that reserved padding pad[2] is
    zeroed (Greg KH).
  - Clamped read()/write() byte count to type_max(xfers.len) (u16) to
    prevent silent integer truncation and unbounded kernel allocations
    (sashiko-bot).
  - Used ida_alloc_max() capped to MINORMASK to prevent minor number
    overflow (sashiko-bot).
  - Added i3cdev_attach_lock mutex and idempotency check in
    i3cdev_attach()/i3cdev_detach() to serialize concurrent attach/detach
    calls (sashiko-bot).
  - Updated bus notifier to handle BUS_NOTIFY_DRIVER_NOT_BOUND and return
    NOTIFY_OK instead of raw errno values (sashiko-bot).
- Added Patch 5/5 ("tools: i3c: add i3ctransfer utility"):
  - Added tools/i3c/i3ctransfer.c (adapted from Vitor Soares's
    i3c-tools) updated for struct i3c_ioc_xfer, supporting SDR and HDR
    (-m, -c) modes and reporting actual_len bytes on reads
    (Wolfram Sang).
  - Note to Vitor Soares: Since your original i3ctransfer commit in
    i3c-tools did not include a Signed-off-by tag, could you please
    reply with your Signed-off-by / Acked-by for Patch 5/5?

Changes in v4:
- Dropped dev_open count tracking and used cdev_device_add/del with
  mutex locking to prevent use-after-free on detach
  (Greg KH, Wolfram Sang).
- Fixed 32/64-bit UAPI alignment and added compat_ptr_ioctl.
- Switched to dynamic minor allocation via IDA.

Sam Agazaryan (2):
  i3c: use actual_len for read transfers
  tools: i3c: add i3ctransfer utility

Vitor Soares (3):
  i3c: master: export i3c_masterdev_type
  i3c: master: add i3c_for_each_dev helper
  i3c: add i3cdev module to expose i3c dev in /dev

 MAINTAINERS                            |   2 +
 drivers/i3c/Kconfig                    |  11 +
 drivers/i3c/Makefile                   |   1 +
 drivers/i3c/i3cdev.c                   | 491 +++++++++++++++++++++++++
 drivers/i3c/internals.h                |   4 +
 drivers/i3c/master.c                   |   9 +-
 drivers/i3c/master/adi-i3c-master.c    |   5 +-
 drivers/i3c/master/dw-i3c-master.c     |   2 +-
 drivers/i3c/master/i3c-master-cdns.c   |   5 +-
 drivers/i3c/master/mipi-i3c-hci/core.c |   2 +-
 drivers/i3c/master/renesas-i3c.c       |   3 +
 drivers/net/mctp/mctp-i3c.c            |  10 +-
 include/linux/i3c/device.h             |   2 +-
 include/uapi/linux/i3c/i3cdev.h        |  57 +++
 tools/Makefile                         |  13 +-
 tools/i3c/Build                        |   1 +
 tools/i3c/Makefile                     |  58 +++
 tools/i3c/i3ctransfer.c                | 307 ++++++++++++++++
 18 files changed, 966 insertions(+), 17 deletions(-)
 create mode 100644 drivers/i3c/i3cdev.c
 create mode 100644 include/uapi/linux/i3c/i3cdev.h
 create mode 100644 tools/i3c/Build
 create mode 100644 tools/i3c/Makefile
 create mode 100644 tools/i3c/i3ctransfer.c

-- 
2.55.0.1082.g2b9226bbc0-goog


