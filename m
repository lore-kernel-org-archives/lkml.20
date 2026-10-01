Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E916D29B78F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790880218; cv=none; b=pKoF/tQWWmusHuMOIQnDCsrZCTIoCKncLvT6yZU1wTI8UIXqlIKxioUYmwzLgSgk/tWq0XJ4TaM3oPsTH1ZNEdAXFPkLuL9eBppKJ5hSyjkVdClTJWnQ7b38eeiMNu8jIgwXHPzq8TSJ/WbbRfz6EAIR31m8UN7xYx+za1OAKhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790880218; c=relaxed/simple;
	bh=qW4KtOk37cubL+JO+4SY3vwYvYgXRg8JxwPSIqcYtZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AuPFIeVcG3xpLx/Q6CqBJyFDXxciqNeIxXyCEu/k7aBoNRMRWwZ1XrEH0imXvQITmSF7XfV5x4EA1APuhxWVFAils2AGCrRgsK4KyZYxjkSGqB/PbKhDSTDWFKKQI1Smkv9y+kihJw5Py7R0xF6dD43FR9XrMZphTjwJb+9vbDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mi303Tfs; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mi303Tfs"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so1526697f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790880213; x=1791485013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kb370HTCyakyOGVcYFBEvfEz7eT1+tcdRjWgQ5JA2ho=;
        b=Mi303Tfs3keIGetEjaWdpnj9fPVQZ1sRVqBfrVrrk4YmZ4QzyCYWbsFJ0t9t1pWYSu
         RIVaFqqLJJce2D4WVHsJJt8iluwuinkDCHAxQkZ9sU7raNer8Q09kAn307Q45ETxjWzv
         IUTO0H7YLYuplELj5UWiHrRX3RdfiNHDadQdr1TNcSdzXty5PIBNPBE+sSM7ZoAo0CJ+
         pPA7rRtT7a3hwA7uS1g2wY8XFwcmAiCxVV/dn5b0K9c+hjhKLbvPhmZw70BB0oqwR7Rm
         EoJTemaxXDH+kCa56m2tsEpGjNpUI7FuifKLi/f8CEyYD5ZoCoQjRCC4tCF1HkVJhFR/
         K2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790880213; x=1791485013;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kb370HTCyakyOGVcYFBEvfEz7eT1+tcdRjWgQ5JA2ho=;
        b=ah3Q7VUwEmOCqLMPfO6uLmjwdpZywe20hDYC6/NeX8xhCINX6Xux3xATTYvRXJ/DiT
         ziPDZhQ8UuI6aDRXbdCVwu1iI6HWos6++fIsPOzBISC8Xinl+LFwB8XslvkF3AZ/1f7+
         DVQ2S6BFCiXRpiGcCQMCQW0Ut0ZXhW6RPxOYWCKbfHcfS0uiYHklux+Pp4/cu0oXhbex
         Q95T61hsb8EDhZB4JGpJdQHDzAuSIv1UrUzYHFS7rdGqKE1/TBQi9VGbbMc9cK5LGREJ
         UA2Hkz5kHg07UtT9HBwY0lUU26VYTY7vFCTSO6x2XZadcCIkKez9H27jsc1vxS+fjSA+
         Fjiw==
X-Forwarded-Encrypted: i=1; AKwUvBzT6njwk7NWUjvaJAPjQYWNvdKSdYkyW4Xg3Qk0FIN2Soob7C2zAp36QNz/Am59cLgYOxEL05Vqbdb95r8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUvPfoY4j+N86b3oGoqBssEaGXtreyml8qAnvPX2PmPySJkReF
	7d4YYwd6kiip+HmWxsv2kLZEIqnmXMxjxnP7i3OX4S6nIFEskisA3Snn
X-Gm-Gg: AYBFou1cKotBAPP6C/fetiVavE/9KAr9ZFiRivLBwueh39MBNQbw0GThHz8J0oqq0LJ
	+CWF4JRCF/3QwIEnCcObRYmL2L/WyepehDXUKBwJJ7PAXes/QVHlK5AqHpZJRztB9zgqvZP9txu
	hiz7Z6MvD8snNYHdgKZUVE7SsNCxo2hDUBYkD615rIz0zm9Dj+6+05Gz2Wl/sIl35CRp5/Evg6F
	2zqlzIyY+zYNZyHuYCSOmcNRw+GV1B8LeKwb1nUQTTCGkzBcj5sP7bjg5KQrW/Pl/BirtfFlUT6
	uMc8mmbP6u72Y0T3Wj6P6ae05etgWMUpjvda2un3/5UD+9jPUDa5J0mFNL9hdckuNxcklQIVI3L
	2txKe10kPtgvg4qrSkCaF0IGWXpyO8q4bv1+6NeaVRYAmw7OZEPcmesplU+aGWuilXobt5D0jw+
	AImrINK5AKzFAYj526wPsi4EJYhwQuTEh5ZWlcUW7/VVXLBG+VBPxAeXF+DhFGkjul2ntUd1ASn
	iOVi723OOZzw2D96/NXS7ufTdWr2+MMsm/MY7x6p9YHaiwTCie6rechpnlbHYSPyFrEG/zN
X-Received: by 2002:a5d:6f13:0:b0:488:898b:5c78 with SMTP id ffacd0b85a97d-48b12737a0bmr866442f8f.29.1790880213322;
        Thu, 01 Oct 2026 11:43:33 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fac3csm138889f8f.21.2026.10.01.11.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:43:32 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v5] drm/qxl: fix use-after-free in qxl_irq_handler on PCI
Date: Thu,  1 Oct 2026 20:43:18 +0200
Message-ID: <20261001184321.80615-1-megia.oscar@gmail.com>
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

in v4, disable_irq() was introduced, but because qxl requests its IRQ with
IRQF_SHARED, calling disable_irq() masks the interrupt line globally at the
controller level (IO-APIC), potentially hanging other devices sharing the
same line (e.g., virtio devices). Furthermore, placing free_irq() too early
caused hardware teardown timeouts (e.g., waiting on qdev->release_event in
qxl_device_fini()).

Fix this by:
1. Masking interrupts specifically on the QXL hardware via ram_header->int_mask = 0
   and flushing pending work before calling free_irq().
2. Placing qxl_irq_fini() in qxl_pci_remove() after drm_atomic_helper_shutdown()
   so completion events are handled during atomic shutdown, but before releasing
   legacy VGA resources and device structures.

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
    qdev->ram_header->int_mask = 0 to prevent global masking on IRQF_SHARED lines.
  - Reorder qxl_irq_fini() call in qxl_pci_remove() to ensure hardware teardown
    events (like release_event in qxl_device_fini) complete before free_irq().
---
 drivers/gpu/drm/qxl/qxl_drv.c |  2 ++
 drivers/gpu/drm/qxl/qxl_drv.h |  1 +
 drivers/gpu/drm/qxl/qxl_irq.c | 13 +++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1e6a2392d7c6..3ec2f9395439 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -154,10 +154,12 @@ static void
 qxl_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct qxl_device *qdev = to_qxl(dev);
 
 	drm_kms_helper_poll_fini(dev);
 	drm_dev_unregister(dev);
 	drm_atomic_helper_shutdown(dev);
+	qxl_irq_fini(qdev);
 	if (pci_is_vga(pdev) && pdev->revision < 5)
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
 }
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
index 4018bcf808e5..9d2311b15660 100644
--- a/drivers/gpu/drm/qxl/qxl_irq.c
+++ b/drivers/gpu/drm/qxl/qxl_irq.c
@@ -105,3 +105,16 @@ int qxl_irq_init(struct qxl_device *qdev)
 	}
 	return 0;
 }
+
+void qxl_irq_fini(struct qxl_device *qdev)
+{
+	struct drm_device *ddev = &qdev->ddev;
+	struct pci_dev *pdev = to_pci_dev(ddev->dev);
+
+	if (qdev->ram_header)
+		qdev->ram_header->int_mask = 0;
+
+	cancel_work_sync(&qdev->client_monitors_config_work);
+
+	free_irq(pdev->irq, ddev);
+}
-- 
2.55.0

