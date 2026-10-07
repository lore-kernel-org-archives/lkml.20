Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18A36AB56
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407740; cv=none; b=b+KvI1xXljVRUpy80RPcfQwwKIHNunoPK7GGoW4ch71iVykgQjhZg8UmOAh0XYEua2BaPVpfB1t0IdffREZvPkrmrUhrfGmqdmgYcx16uol/HNS3yrHzX/jvyPzBwwPZGNMsLmc5Gpa0bpEolhp1rlG2w/PqPH+ro937Za1zalA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407740; c=relaxed/simple;
	bh=s53OvnooR1ulS/0Bq4hIHLZSlsd821l0ys73ovE1DyM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lkb9WvMRRE1kgHF4gbRR2yGsbC1yO/VUYKMwLxBw/g1j5jcrmpLZDNOzqaOputIbkLKGbMq77HYbC4/He7KwoJxhtTNHyMzzpNTdnBhjpIOI10tHUbBVuu50vqff3AnSBY161JSoRY04R8ltscZrVRbz8g5VLu38WG2HodGu3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCmkrcoA; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCmkrcoA"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91953e11914so29465446d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791407738; x=1792012538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqxmhgLDVi/PTNJvZvAPr17LL9MOC+fh9tOEHolQ+E8=;
        b=hCmkrcoA3mjtRFbT6mZ8KI7FHAWU6iBbE1v7i8N3WWVQjGk1tn5ka+8jKUzKNnRpmr
         y/lx/THfFuXzhXKRD/kktPk545OBoMHC069rKDnPQ72CY+UY5pgghbDnIc3YBjMH/8Ey
         WxznhqPBPSP4ZAouM8U7GreMyB5UKS9rZI5Dub2FOAJI2AJVZDqb671lkTyINb7lgkr9
         EV0rOlsDmLcMc1HJWGx0oAbcvEzJUNdhmmdifj4vgH4kxMb/YbRGLdxSiuWlzw5Vw4Nc
         l6yf0/iENIU5UmU8Nf5Khvc86eAZQ10UOUqcw5tB+UYS7y72BewyQU7KQ+1MvW/FbRfx
         9gTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791407738; x=1792012538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqxmhgLDVi/PTNJvZvAPr17LL9MOC+fh9tOEHolQ+E8=;
        b=HNLicLIuNniRkmsK0hnSsoVtCweahmjfRCf4u2ZbxOT3BTEHE6oAOaDtpSs1KzR8jb
         HjJAuaxevkYuZLvS0QooyNU4sSPHcdZDvDEUg9LpJ7K66k8DSTxkyUXFsJ5HbdEm5uKz
         BwAUCLlkr53FdVbilYO6vWm/mVZtfcT2YTUtj/STWSbYS2jS/spOiC+XOpu/wfVIURZK
         fF+6YUuWhTmZLTIdy31R6U+JDvanbrxuSaOhN29gInSGue/pync68WwbF7frgP0RxCls
         6bsOghzmxSKkh8OWalrjogDWQmjpuaQCZH+gCnG089rU7H2pdsc21aREKMH6bFDqPplj
         4jnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVOrs/LhUPhEhNP6+DFk0mLurj2DtAgPXdQT3sDEQ2Om1vu3DtRwXlYUYuHnFbKGwXIm7adXwadDRGftI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkJExuEcjuATJlp0/nOSURXkcuVh1Jt/zOnhiPbZ+qWmxbhUHD
	yCdC2ZEUGzhfMHeOUF9sX8gpdh/2V9+gyggTefHu340AsMCDkZ1lGdYdIJmQwQ==
X-Gm-Gg: AYBFou0jfhAByEisAWg7HLn2nCDGjwB3TU5gpjHfrpsXSkmXbaxMqUQLqUz6e5HMJmO
	cufaBVxksiYHpnXAAtQeqPW6TIMMA9QBz6/caq2Tf5apfJGrOvQDzuk4W28pMKlDufIpS09VgUe
	wzB3cihrLTzcJPxlngIWXSrAwlIquyAF/4rpx1cnFpO3ykpfq7SCGlvrStgA7KrHIWJFKa8gmlb
	t+Hz/MKswFIKTRfjbva6hKIfAHHgPvVsFk/ERpNfyNq5EM/MfD7FfNUohGkkDatTNDPFObJ6lQH
	BF4GMkw0/Zijz8vqkPkQsbcqcxWUlF6HaXucgzqxIJBsjOGYMv8sG1F4h/Im/q1jAwvOWwHBhnf
	8kL+9iayXwnKap6s+PSBnvk2eMb3SEDOjLNCzR5QYnTUFwl9/8DjrrwF59PiyTmsk5W4WLNNLsa
	CF4GG3j5PJ0TpP5pvMHqPiMMli/mSt3qwvKqIAuOc4KizL5jtfA67sgxynUBrHg9PZTUQtO1eEd
	aPK/LcSJu0=
X-Received: by 2002:a05:6214:f06:b0:917:9407:ebe6 with SMTP id 6a1803df08f44-91997895b9bmr65257016d6.45.1791407738109;
        Wed, 07 Oct 2026 14:15:38 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91997d66da0sm27123856d6.39.2026.10.07.14.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:15:37 -0700 (PDT)
From: Dingisoul <dingiso.kernel@gmail.com>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] scsi: st: use-after-free race between st_remove() and st_open()/scsi_tape_get()
Date: Wed,  7 Oct 2026 17:15:20 -0400
Message-Id: <20261007211520.1428497-1-dingiso.kernel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in st_open

on commit: a90ee4305c4a (2026-10-06)

Root cause: st_remove() does

    mutex_lock(&st_ref_mutex);
    kref_put(&tpnt->kref, scsi_tape_release);   /* may kfree(tpnt) here */
    mutex_unlock(&st_ref_mutex);
    spin_lock(&st_index_lock);
    idr_remove(&st_index_idr, index);           /* too late: already freed above */
    spin_unlock(&st_index_lock);

while scsi_tape_get() (called from st_open() on every open of a tape
device node) does

    mutex_lock(&st_ref_mutex);
    spin_lock(&st_index_lock);
    STp = idr_find(&st_index_idr, dev);          /* can still find the freed tpnt */
    kref_get(&STp->kref);                        /* UAF write */

There is a window, between st_remove()'s mutex_unlock() and its own
spin_lock(), where a concurrent scsi_tape_get() can acquire both locks
and find the already-freed tpnt still in st_index_idr.

To help trigger the bug more reliably, we applied a minimal diagnostic
patch that only inserts a fixed udelay(2000) in that window (no locks
added/removed, no reordering); it does not change the bug itself. We used
scsi_debug (ptype=1, emulating a tape LUN) to avoid needing real tape
hardware.

The reproducer and .config files are here.
https://gist.github.com/dingiso/b33f8c01a47bfcbb902d3f21a4877feb

I'm happy to test debug patches or provide additional information.

[   23.212502] ==================================================================
[   23.212506] BUG: KASAN: slab-use-after-free in st_open (./include/linux/instrumented.h:112 ./include/linux/atomic/atomic-instrumented.h:252 ./include/linux/refcount.h:283 ./include/linux/refcount.h:366 ./include/linux/refcount.h:383 ./include/linux/kref.h:45 drivers/scsi/st.c:254 drivers/scsi/st.c:1291)
[   23.212537] Write of size 4 at addr ffff888009854a1c by task repro/315
[   23.212541] 
[   23.212551] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   23.212554] Call Trace:
[   23.212556]  <TASK>
[   23.212558]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[   23.212566]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[   23.212591]  kasan_report (mm/kasan/report.c:595)
[   23.212602]  kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
[   23.212607]  st_open (./include/linux/instrumented.h:112 ./include/linux/atomic/atomic-instrumented.h:252 ./include/linux/refcount.h:283 ./include/linux/refcount.h:366 ./include/linux/refcount.h:383 ./include/linux/kref.h:45 drivers/scsi/st.c:254 drivers/scsi/st.c:1291)
[   23.212623]  chrdev_open (fs/char_dev.c:411)
[   23.212645]  do_dentry_open (fs/open.c:996)
[   23.212651]  vfs_open (fs/open.c:1101)
[   23.212656]  path_openat (fs/namei.c:4837 fs/namei.c:5000)
[   23.212669]  do_file_open (fs/namei.c:5029)
[   23.212693]  do_sys_openat2 (fs/open.c:1417 (discriminator 1))
[   23.212702]  __x64_sys_openat (fs/open.c:1423 fs/open.c:1439 fs/open.c:1434 fs/open.c:1434)
[   23.212712]  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
[   23.212719]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   23.212755] 
[   23.212756] Allocated by task 325:
[   23.212758]  kasan_save_stack (mm/kasan/common.c:57)
[   23.212764]  kasan_save_track (mm/kasan/common.c:78)
[   23.212768]  __kasan_kmalloc (mm/kasan/common.c:409 mm/kasan/common.c:426)
[   23.212773]  __kmalloc_cache_noprof (./include/linux/kasan.h:263 mm/slub.c:5563)
[   23.212778]  st_probe (./include/linux/slab.h:991 ./include/linux/slab.h:1312 drivers/scsi/st.c:4376)
[   23.212783]  really_probe (drivers/base/dd.c:628 drivers/base/dd.c:706)
[   23.212788]  __driver_probe_device (drivers/base/dd.c:868)
[   23.212793]  driver_probe_device (drivers/base/dd.c:898)
[   23.212798]  __device_attach_driver (drivers/base/dd.c:1026)
[   23.212803]  bus_for_each_drv (drivers/base/bus.c:500)
[   23.212807]  __device_attach (drivers/base/dd.c:1098)
[   23.212811]  device_initial_probe (drivers/base/dd.c:1153)
[   23.212816]  bus_probe_device (drivers/base/bus.c:620)
[   23.212821]  device_add (drivers/base/core.c:3776)
[   23.212826]  scsi_sysfs_add_sdev (drivers/scsi/scsi_sysfs.c:1427)
[   23.212830]  scsi_add_lun (drivers/scsi/scsi_scan.c:1138 (discriminator 1))
[   23.212834]  scsi_probe_and_add_lun (drivers/scsi/scsi_scan.c:1311)
[   23.212838]  __scsi_scan_target (drivers/scsi/scsi_scan.c:1805)
[   23.212841]  scsi_scan_channel (drivers/scsi/scsi_scan.c:1895 drivers/scsi/scsi_scan.c:1870)
[   23.212845]  scsi_scan_host_selected (drivers/scsi/scsi_scan.c:1924)
[   23.212849]  scsi_scan_host (drivers/scsi/scsi_scan.c:2089 drivers/scsi/scsi_scan.c:2077)
[   23.212852] sdebug_driver_probe (drivers/scsi/scsi_debug.c:9618) scsi_debug
[   23.212875]  really_probe (drivers/base/dd.c:628 drivers/base/dd.c:706)
[   23.212879]  __driver_probe_device (drivers/base/dd.c:868)
[   23.212883]  driver_probe_device (drivers/base/dd.c:898)
[   23.212887]  __device_attach_driver (drivers/base/dd.c:1026)
[   23.212891]  bus_for_each_drv (drivers/base/bus.c:500)
[   23.212895]  __device_attach (drivers/base/dd.c:1098)
[   23.212900]  device_initial_probe (drivers/base/dd.c:1153)
[   23.212905]  bus_probe_device (drivers/base/bus.c:620)
[   23.212909]  device_add (drivers/base/core.c:3776)
[   23.212914] sdebug_add_host_helper (drivers/scsi/scsi_debug.c:8843) scsi_debug
[   23.212937] add_host_store (drivers/scsi/scsi_debug.c:8878 drivers/scsi/scsi_debug.c:8105) scsi_debug
[   23.212954]  kernfs_fop_write_iter (fs/kernfs/file.c:345)
[   23.212960]  vfs_write (fs/read_write.c:595 fs/read_write.c:687)
[   23.212964]  ksys_write (fs/read_write.c:739)
[   23.212968]  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
[   23.212973]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   23.212977] 
[   23.212978] Freed by task 325:
[   23.212980]  kasan_save_stack (mm/kasan/common.c:57)
[   23.212984]  kasan_save_track (mm/kasan/common.c:78)
[   23.212989]  kasan_save_free_info (mm/kasan/generic.c:584)
[   23.212993]  __kasan_slab_free (mm/kasan/common.c:264 mm/kasan/common.c:296)
[   23.212997]  kfree (./include/linux/kasan.h:235 mm/slub.c:2748 mm/slub.c:6509 mm/slub.c:6802)
[   23.213000]  st_remove (./include/linux/kref.h:65 drivers/scsi/st.c:4512)
[   23.213004]  device_release_driver_internal (drivers/base/dd.c:1349 drivers/base/dd.c:1372)
[   23.213009]  bus_remove_device (drivers/base/bus.c:664)
[   23.213014]  device_del (drivers/base/core.c:3965)
[   23.213018]  __scsi_remove_device (drivers/scsi/scsi_sysfs.c:1499)
[   23.213021]  scsi_forget_host (drivers/scsi/scsi_scan.c:2115)
[   23.213025]  scsi_remove_host (drivers/scsi/hosts.c:182)
[   23.213031] sdebug_driver_remove (drivers/scsi/scsi_debug.c:9631) scsi_debug
[   23.213052]  device_release_driver_internal (drivers/base/dd.c:1349 drivers/base/dd.c:1372)
[   23.213057]  bus_remove_device (drivers/base/bus.c:664)
[   23.213061]  device_del (drivers/base/core.c:3965)
[   23.213065]  device_unregister (drivers/base/core.c:4006)
[   23.213070] sdebug_do_remove_host (drivers/scsi/scsi_debug.c:8917) scsi_debug
[   23.213089] add_host_store (drivers/scsi/scsi_debug.c:8110) scsi_debug
[   23.213109]  kernfs_fop_write_iter (fs/kernfs/file.c:345)
[   23.213113]  vfs_write (fs/read_write.c:595 fs/read_write.c:687)
[   23.213117]  ksys_write (fs/read_write.c:739)
[   23.213121]  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
[   23.213126]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

Best,
Dingisoul
