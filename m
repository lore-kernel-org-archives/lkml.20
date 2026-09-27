Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761F53BB9E0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503858; cv=none; b=J8RDhBmZJxVB88DxrSE/DQNyqX9eT3h6g9Bd/xouPRcMrbzC7Mcf4fATckoTDC+ZkwnfeXJjNcOwfKYJW1soM9T5UdUBKqQB2NJffLb5as8g+j3y6ZGwuv1QsJuq/pBkRH7vaXXV/2zvSqJVXK9CNMmhq3XgMkz6Eo0VbzG4b28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503858; c=relaxed/simple;
	bh=fSmSskI8VE/EVxV1z56H9ldUZamb/IQToTx09gb86c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=og0ihxngm65vuplLZ/wD2SMwmp7o70oqkyJRA+eY+8V69Qxm79eEFBgj6vCL/p4lDvjzMHniiZ7jCl/3Jgl9bCKUThtJ+OpXK63cHzktc4WpRIv9mi0dkrSvrQjge2jKmL1/j7AgadK2zDAQNJCRx5THDGLN0HE8z8g6qyqUpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8apSUo7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8apSUo7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so12485055e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790503855; x=1791108655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxkdMpW5uls3bj2hzuo50IQLuq2BV88+7Gd3LoVozGo=;
        b=h8apSUo7n/XdoEHqZ6hcHPhmv453Oq1bHosXcXW21PoTrFVsnmGcVoPe3LjYJWWNXr
         dDLASL/iHJSnr/yC82DnxH1BZeH0eZxErl96pOQ5J3AMkSwY7kPD7tApBhQGrivQxCcf
         0l/mm0y2bZlB8QnLMg7BWAtHtUbqRDwop4rBJkA9nBXbMr71AhyNaOCTLmPKHwS7oepT
         K3FPTWqwsI/nb7nPfRWRXPeRWhRI4fwtyKTSH1wr5y2Fb4EFpjcYftwWsskgXMaPJWZ8
         5PfTjQuEVEPyGYNZwrzetLU3uteDj5ee6I6QdjcVEdR0DsRz6VStSd0iyf+ulDTmOM3Z
         9sVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790503855; x=1791108655;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bxkdMpW5uls3bj2hzuo50IQLuq2BV88+7Gd3LoVozGo=;
        b=vlOaIgdObLL8hGJqmqw5JMUzsqBut/VlWpg1TjBsabhUQDCDr8F737V0V3Z9scFUSo
         di8MfJ+HkBci7qHkDaJMz6CJMrgfUpW1s2g5kZ/8UqKqZgSWMwxhIuHCvYor4DjLsmhd
         cR6N+Q3bgrXiKGGmx+cnhCvyejcfHaJXQgj8sKc+d5IGu6RJX0xkpUf76obBDnauRdye
         gTeZJLDMc+Kj8WRvr+IPtGW1HKlovOXLDq+ar6cHJOwzFPJj1oWNiOnzv1sjMae8WX5Y
         75fRHuv4vZvIGA9zKM3i5xkunhNIG185jIauGDc6oOsaipfSs1jltc+7ciCGe2xJ8mQi
         +/gQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIhUG3tGAXiHuAEiL08c4ZuCn+Em84U+PpPPoY9HLAYepIcCD6/IGubGdl8sr2uHVqJNEI5jLuG+dwHTE=@vger.kernel.org
X-Gm-Message-State: AFuF++nz7IrrKpmmZrNmFCQzsd3AuDl66rDIO7O4FsujYI1Bi8EWb2hc
	2k3nLPOvXiH1TjxuOQhh1f+i4jrOhKK/mcSNuT0LxJjos9/Rk728GJnu
X-Gm-Gg: AYBFou3RN1u2pyx7gBhLFLfIBWLe0XLI/Q6jpl6gttVZAtB4eKpQVTZlDXQsavenFb2
	2+cziTP3Vu8o8joTd7UOL6JF5UWHJRgxnSCjzYFG4MGK2a8qXnrkciQyQgt152HdMbJBPcRACH+
	1sThDw+q9g+gGZF6mMI/joVkrKxJIGkfvWqz009/S7RLGcMAbR92i6PjO3jXsCOg4RTIdExmeTp
	vk/Otd6pnkpJ0HzkU0KM/y8rKf+rC9uF4q75yIV8qWO/Rh1rT7927Z2fSGqUrHea12wb1IqDzY1
	SfBMu2Lc5nBTMEncY1eMbNICqLeZOYLgZT4Q8GFRjuo2mcPX7Hv3pK/uPrp9g7AW5rj7AHPHAR+
	6F1TP8r2LHRChi+7/YEO8mXdfjzJNKgIheIXVeIS17yEgXlkntPIKPujrNGmrRnvbEWnhWPvxk1
	xgd4R52dwPPu3GtzdRi87cNlVgJalxyTG0Ucvr1EyvNa8e8qXwZh2FbY89xq5siPksvi6of9pn4
	czhX7f3EQ6kFB2JpnPOMbLpkQBWBF0j0YdDcV+IpzBiKL6hiEYo0HHTvNWKJwrNrzxCRgs+
X-Received: by 2002:a05:600c:1391:b0:49f:c18a:61c8 with SMTP id 5b1f17b1804b1-49fe66ff2c3mr187004185e9.29.1790503854348;
        Sun, 27 Sep 2026 03:10:54 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff285550asm125782045e9.3.2026.09.27.03.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:10:53 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4] drm/qxl: fix use-after-free in qxl_irq_handler on PCI
Date: Sun, 27 Sep 2026 12:10:08 +0200
Message-ID: <20260927101026.45411-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Executing below script:

i=0;\
while [ 1 -eq 1 ]; do\
  i=$((i+1)); echo 0000:00:01.0 > /sys/bus/pci/drivers/qxl/unbind;\
  if (($i%1000==0)); then\
      echo loops=$i; free;\
      grep nr_free_pages /proc/vmstat;\
      grep -E "VmallocUsed|Slab|Reclaimable|SUnreclaim" /proc/meminfo;\
      sync; echo 3 > /proc/sys/vm/drop_caches;\
      echo 1 > /proc/sys/vm/compact_memory;\
      udevadm settle;\
      free;\
      grep nr_free_pages /proc/vmstat;\
      grep -E "VmallocUsed|Slab|Reclaimable|SUnreclaim" /proc/meminfo;\
      uptime;\
  fi;\
  echo 0000:00:01.0 > /sys/bus/pci/drivers/qxl/bind;\
done

After a few seconds, it reports:

==================================================================
BUG: KASAN: slab-use-after-free in qxl_irq_handler+0x269/0x2b0
Read of size 8 at addr ffff888001c6cd48 by task swapper/0/0

CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
     7.1.0-10963-g1a3746ccbb0a #31 PREEMPT(lazy)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
               BIOS Arch Linux 1.17.0-2-2 04/01/2014
Call Trace:
 <IRQ>
 dump_stack_lvl+0x4d/0x70
 print_report+0x14b/0x4b0
 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
 ? profile_tick+0x56/0x90
 ? tick_nohz_handler+0x23c/0x5c0
 kasan_report+0x117/0x140
 ? qxl_irq_handler+0x269/0x2b0
 ? qxl_irq_handler+0x269/0x2b0
 ? __pfx_qxl_irq_handler+0x10/0x10
 qxl_irq_handler+0x269/0x2b0
 ? __pfx_qxl_irq_handler+0x10/0x10
 ? __pfx_qxl_irq_handler+0x10/0x10
 __handle_irq_event_percpu+0x116/0x450
 ? __pfx__raw_spin_lock+0x10/0x10
 handle_irq_event+0xa6/0x1c0
 handle_fasteoi_irq+0x271/0xb10
 ? __pfx_handle_fasteoi_irq+0x10/0x10
 __common_interrupt+0x60/0x130
 common_interrupt+0x7a/0x90
 </IRQ>
 <TASK>
  asm_common_interrupt+0x26/0x40
 RIP: 0010:pv_native_safe_halt+0xf/0x20
 Code: 42 de 00 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90
       90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d a3 cf 20 00
       fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90
       90 90 90 90 90
 RSP: 0018:ffffffffb8207e48 EFLAGS: 00000206
 RAX: ffff8880b296f000 RBX: ffffffffb82146c0 RCX: 0000000000000001
 RDX: 0000000000000001 RSI: 0000000000000004 RDI: 0000000000067a04
 RBP: fffffbfff70428d8 R08: ffffffffb7247e1d R09: 1ffff1100d846202
 R10: ffffed100d846203 R11: ffffed100d846203 R12: 0000000000000000
 R13: 0000000000000000 R14: 1ffffffff7040fcd R15: dffffc0000000000
  ? ct_kernel_exit.constprop.0+0x9d/0xc0
  default_idle+0x9/0x10
  default_idle_call+0x37/0x60
  do_idle+0x3a8/0x5d0
  ? __pfx___schedule+0x10/0x10
  ? __pfx_do_idle+0x10/0x10
  cpu_startup_entry+0x4e/0x60
  rest_init+0x11a/0x120
  start_kernel+0x382/0x390
  x86_64_start_reservations+0x24/0x30
  x86_64_start_kernel+0xd6/0xe0
  common_startup_64+0x13e/0x158
  </TASK>

The qxl_pci_remove() function does not call free_irq(), allowing the IRQ
handler to fire after the device has been torn down, accessing freed
memory (qdev->ram_header, qdev->io_base).

Added Disable the device from generating IRQs, Release the IRQ
at the start of qxl_pci_remove() to ensure no IRQs fire
after teardown begins.

Assisted-by: OpenCode:1.17.13-Big Pickle/DeepSeek V4 Flash
Fixes: 48bd85808443 ("drm/qxl: Convert to Linux IRQ interfaces")
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
Changes in v2:
  - Updated qxl_ttm_init to add ttm_device_fini on error in
    qxl_ttm_init_mem_type.

Changes in v3:
  - Added free_irq on qxl_probe unload.
  - Set to NULL after free on qxl_device_fini and
    added idr_destroy on release_idr and surf_id_idr.
  - Free client_monitors_config.

Changes in v4:
  - Delete all code unnecessary. Leave only code to fix the BUG.
---
 drivers/gpu/drm/qxl/qxl_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1e6a2392d7c6..54c1b8a3c723 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -155,6 +155,9 @@ qxl_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
+	disable_irq(pdev->irq);
+	free_irq(pdev->irq, dev);
+
 	drm_kms_helper_poll_fini(dev);
 	drm_dev_unregister(dev);
 	drm_atomic_helper_shutdown(dev);
-- 
2.55.0

