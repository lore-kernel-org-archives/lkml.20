Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12FC435515
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791716531; cv=none; b=uQSOnp+TZcm7i+u/7xRJIdJgNF5DooUQ/qSptJn9fg9NfpwAqCE2wsX/+svFhfMXLKJO9AM71BeAIm6qdm8AYYhHnT8eBTfkWSiUFdryaGB1w1CaJhrETgVUprL6+qBVzXKplGeL5wIuadDfQqwIBtqoSNMJ2ZbDo1/YtP0WjbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791716531; c=relaxed/simple;
	bh=ID59jjhelGBlALrOEwLjK4+YAvd/ykxpAnzLuaEkcso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JXw+P7gm3WO5vIAKKo2f4q/tdaTCi5qLl9gQ7mJRndHGWPxACsGrz1S0O9aJCgQ/x6PpAe/mv4yqfo4I+cChCLBdrXY+iuT22IbDdnyMsYvvCPFLHLqLJA0BXrj1CqIIzsnIOrGKSyNzhuswdhj7LJ7DKf5uOVppKE1poQDV/OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9x9cAjc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9x9cAjc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso12772615e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791716527; x=1792321327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yLUxPzbiNldjCwSi9bPvpj+pj/YOzN3wSQS/XDWpqw=;
        b=a9x9cAjcY6V3hvZqTaaCV8DbVnoq2Ve8GXWcZjyRo7M0Ht6xYdu0pWm6GYuvgW3Q0a
         aZI5VZe+S6mlTYpUfdgV6f/V0FThT3k8O+Rl+m/nZAJf0pMNHEaezDX/vChBzcZEBg+A
         TmKz3mwYfuxVKkkVrnbiBZT24bvEfh1+oG2EAyeTqMbpaeHrWlSNWcqbvV7LZr88nn4o
         7Tuml6PiYsPnI0HCA7o+he0PRIQwkkr+9zanWRTM5oNDVaNcg6/bMNmZt5tsD932eAyI
         ZceZYHF5n8Ng5/HgLgsp6Z3YXN6rDoG9lRhFw6QBUOhf4mRPRUab1iQIxSjb/FF9h0Ic
         x7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791716527; x=1792321327;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9yLUxPzbiNldjCwSi9bPvpj+pj/YOzN3wSQS/XDWpqw=;
        b=yNZez+tT6SQX03P9z7yhKEPpbvyevdfiiMb+fpR65UB7ELwcokrPMhUNisv2rbXAUp
         ocsBnYau4I5FhKIfB8lUF3yvCCKbbC7xljieELlnvAX10THEY5YuR0vtomAcNKW0qNyQ
         4Pn95t+TvfXotVRj7QKdflA+1yU1LvrLQX82gw5HL9q9+5yy/ZFzYq2683B8vqLvb7zn
         e1+SVdHdJ339ov8B1KG7cwenyiRYeYqmKQwrOMYzSJ9z33tnJeQryAxqHMH5Hz2/JVCH
         h7/YWl5xuFeaQJzGfhp7YOSogo3D5+3XnTD1YzOg0MlZgy+c3fOxIfN5Cn0lEZxr0OJf
         fLAw==
X-Forwarded-Encrypted: i=1; AKwUvBynHhE81hGsRMXdyCEWHEDrmXxI14QGwl7+CFFaP/u6qMqhweCyjJQ6wPO0tVSDeNYofkNLNUQYo5aaL0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYL21Grwgt6N6gb8qSDnIbNx+MpRXYhiD6cmb7I2VTptpUlNCpZY
	ASANg47GorICH3VoWPXMDe0JBZJ7wCu9J6LKnNHQxfcKoF07WXSSLxQc
X-Gm-Gg: AYBFou0xV88nYr7LXeqrFaHk0PRHB5L2QEH2ppv8RAJz/UGzP4JF7H1Y2wp5NRQhIXg
	cvTwTRMLHyIOyVQpjeCz3Of59BzGGu5r4xiTJxGNiC7edY4gXBtJKyNkWLQbSbeO6fQAKUhjLms
	e9jH/0qpi8CKeWUQevvYOWztU/gSM64KCwUCBTjldajnzoxAZroWKUpapSDvEXIxk8tgqxosovQ
	KaHaBuA+2uhANVd5p1x2LpotTnadYBVdqD79W50V+t9VI9pMWHpUNW9+5LrzoP9xHXB7ehwUSp5
	i1rHXv0MSkDUg7LpZKDzV8EfqAhi1ALurB2dWDNXs/Ctn+R0tS62lKKZE429XlW/BeHYU8paZgh
	YDRKSJJaVzYb9dmOGent/94gPYYk68qWgjkymFhmA3gdvwVJo3iK6WsdOc8QTwQb6ZzySuMdToi
	pUxlCiLx/+k1/+nwQCJACRG2rhHNpnPebVqPcAcOh2OGjqncMuFkASCk7SHe9RvS0MLYTE8qdwp
	IRaUEkIyJfjWQvwcKKp+tttOF8BTnT3BwfyX/WvQJ4c9JEnYV1DlPuZSSxqnw==
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-4a18e49886amr139699625e9.10.1791716526419;
        Sun, 11 Oct 2026 04:02:06 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm124386765e9.0.2026.10.11.04.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 04:02:04 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v6] drm/qxl: fix use-after-free in qxl_irq_handler on PCI
Date: Sun, 11 Oct 2026 13:01:42 +0200
Message-ID: <20261011110144.40575-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.56.0
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

qxl_device_fini() tears down GEM, buffer objects and command rings,
but it never releases the IRQ resources allocated during device
initialization. This leaves the IRQ handler and its associated state
alive after the device has been finalized, which can lead to use-after-
free if an interrupt fires during or after teardown.

Add the missing qxl_irq_fini() call to the finalization path, placed
before qxl_gem_fini() so that no IRQ can be delivered while GEM and
buffer object resources are being freed.

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

Changes in v5:
  - Replace disable_irq() with device-specific interrupt masking via
    qdev->ram_header->int_mask = 0 to prevent global masking on
    IRQF_SHARED lines.
  - Reorder qxl_irq_fini() call in qxl_pci_remove() to ensure hardware
    teardown events (like release_event in qxl_device_fini) complete before
    free_irq().

Changes in v6:
  - qxl_irq_fini() call in qxl_pci_remove() do not free all resources
    if your run unbind after end xorg. Place qxl_irq_fini() in
    qxl_device_fini() before GEM and buffer object resources are being
    freed is the correct place to release IRQ resources.
---
 drivers/gpu/drm/qxl/qxl_drv.h |  1 +
 drivers/gpu/drm/qxl/qxl_irq.c | 15 +++++++++++++++
 drivers/gpu/drm/qxl/qxl_kms.c |  1 +
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index cc02b5f10ad9..e8598fdbe886 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -424,6 +424,7 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
 
 /* qxl_irq.c */
 int qxl_irq_init(struct qxl_device *qdev);
+void qxl_irq_fini(struct qxl_device *qdev);
 
 void qxl_debugfs_add_files(struct qxl_device *qdev,
 			   struct drm_info_list *files,
diff --git a/drivers/gpu/drm/qxl/qxl_irq.c b/drivers/gpu/drm/qxl/qxl_irq.c
index 4018bcf808e5..3698428b50ef 100644
--- a/drivers/gpu/drm/qxl/qxl_irq.c
+++ b/drivers/gpu/drm/qxl/qxl_irq.c
@@ -105,3 +105,18 @@ int qxl_irq_init(struct qxl_device *qdev)
 	}
 	return 0;
 }
+
+void qxl_irq_fini(struct qxl_device *qdev)
+{
+	struct drm_device *ddev = &qdev->ddev;
+	struct pci_dev *pdev = to_pci_dev(ddev->dev);
+
+	if (qdev->ram_header) {
+		qdev->ram_header->int_mask = 0;
+		outb(0, qdev->io_base + QXL_IO_UPDATE_IRQ);
+	}
+
+	cancel_work_sync(&qdev->client_monitors_config_work);
+
+	free_irq(pdev->irq, ddev);
+}
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 461b7ab9ad5c..fc2502752ae2 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -310,6 +310,7 @@ void qxl_device_fini(struct qxl_device *qdev)
 	qxl_surf_evict(qdev);
 	qxl_vram_evict(qdev);
 
+	qxl_irq_fini(qdev);
 	qxl_gem_fini(qdev);
 	qxl_bo_fini(qdev);
 	qxl_ring_free(qdev->command_ring);
-- 
2.56.0

