Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009979;
	b=QlguF09BnhZwSKnn/komJVE3p+D23KcmZNBdI9ez67WV6/BseKSmVnA+JHhHhgYv4R6E
	 qyGbz3xoyky/T6L4MmVjkxKK7Khb0b/Rgqp7q0t49bOVAB98o6XKmiHF/QFiHVZ8envxJ
	 7323HaMnAY883xqUpjiOoQ3kC9jzn7FUH0SnPBTXfXgUajW0doV3UK4IBK5ppjQX6T6Yx
	 e7uAzXyBfp7u+ERMCsU+XHr4NDXM00AU9hpVjhCAmXTXX3tlfrm2W8oGbRqMOHnHc4J3G
	 ckddGBROq2x6469Zo8NHOqi8iOjAK78hvOMVP6fSgSC4nGQYKwgpMFS119TOKZ1rZvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009979;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=VjCwWQEnKT/C6/m3RDDGNNH192taIYyNhnW+s5VkkuI=;
	b=cg4aWpLcR+DRbVNwmrZPB4sa/VdUT02yiHG2GDOFmQ4S+PhzKpNlsaYTpg+qiJlR0MuA
	 C3OCgQocvD2tZZtCMkdoLPSaj6O2IndppbU/yWCCxz1eujNLDRDOzf+IZHY1LF4T224cr
	 b98WmDPykVAXxzyGHmkZj4EhR4N4xtAhuXyeLyIxCHzwkGpw4IM7g9QLQ5eozmVIKkenE
	 SNLP3UhVqi3VDwp2nGNYYhlR+NDI2QfUoYMPiBdDAWVoSoJcJcVNhapll6dszLANC3Xnm
	 VX5RKclmgeRevpPol0S5/0Rn71SFStKyqsl+xQPm79A5L2YpgWaiQMaosIMDOnIvf/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-469debb526fso3097419fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009978; x=1793614778;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjCwWQEnKT/C6/m3RDDGNNH192taIYyNhnW+s5VkkuI=;
        b=LxPxjPaqbN9mATCOVuv3cteZ1H+S4conGErh+p1MNt7s6/MoJkG3ufCekENytHd2yO
         wC3h8+dGv6mweSjq+CVuMbd9nB6d+1O20jq4dccqlkI/L/Uyr2Ndz7uy+f7imUcObtRZ
         DWabWvloD0Bv9iKvTYxyrfsw4B9u4TxMPRwcNek9Ew7W75QRtjBUunK9n754U/plci/U
         b9b1Quds32xeSV6wj9E+wx8S/tU6MIkeRuzGi7GqZbcUJxQ5pGzxChRnJSQ8lCweiD7M
         CmlGi+P+9eMkJWCYSkWrtntZvkJzA+IBwiusk1b0BiUj8ltgFC965qixvhjJ54YvbJxo
         drfA==
X-Gm-Message-State: AFq9FYK8VPx99wu7e4e0sBraOhd6vBBRzf59F/Wb4yIH7ugptiE9bMmf
	xcl8pWzDOJ9vB4BIPz8ADLYbduQV9D2aE2GK15caOnU/AghJ0cM55afo1wn7Q7JU9+EUhmrGjz/
	s61HB42FhCKTn34dSNkLHIMf3kz2lfDMqd9XmmbHJmmadNw0wPSRv/y05mpY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1495:b0:4b9:e6ab:d078 with SMTP id
 5614622812f47-55c002591dbmr4158212b6e.24.1793009978104; Mon, 26 Oct 2026
 03:19:38 -0700 (PDT)
Date: Mon, 26 Oct 2026 03:19:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adf293a.67317f00.38c4bc.00af.GAE@google.com>
Subject: [syzbot] [kernel?] possible deadlock in cpuhp_thread_fun
From: syzbot <syzbot+a265816368571f78ab88@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4df4d2a577db Merge tag 'acpi-7.4-rc1' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11030f99580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f7d191e495482ad5
dashboard link: https://syzkaller.appspot.com/bug?extid=a265816368571f78ab88
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4df4d2a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a795aa24387d/vmlinux-4df4d2a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b873ee534f13/bzImage-4df4d2a5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a265816368571f78ab88@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
cpuhp/1/26 is trying to acquire lock:
ffffffff90e24aa0 (device_links_lock){+.+.}-{4:4}, at: device_links_write_lock drivers/base/core.c:322 [inline]
ffffffff90e24aa0 (device_links_lock){+.+.}-{4:4}, at: device_links_purge drivers/base/core.c:1704 [inline]
ffffffff90e24aa0 (device_links_lock){+.+.}-{4:4}, at: device_del+0x3d7/0x9b0 drivers/base/core.c:3969

but task is already holding lock:
ffffffff8fc7de00 (cpuhp_state-down){+.+.}-{0:0}, at: lockdep_acquire_cpus_lock kernel/cpu.c:545 [inline]
ffffffff8fc7de00 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun+0xdd/0x7c0 kernel/cpu.c:1085

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #5 (cpuhp_state-down){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       cpuhp_lock_acquire kernel/cpu.c:103 [inline]
       cpuhp_kick_ap_work+0xa4/0xbd0 kernel/cpu.c:1188
       _cpu_down+0x47d/0x1020 kernel/cpu.c:1436
       cpu_down_maps_locked kernel/cpu.c:1483 [inline]
       cpu_down kernel/cpu.c:1491 [inline]
       cpu_device_down+0x82/0xc0 kernel/cpu.c:1508
       device_offline drivers/base/core.c:4283 [inline]
       device_offline+0x2f4/0x400 drivers/base/core.c:4267
       acpi_bus_offline+0x3c7/0x550 drivers/acpi/scan.c:164
       acpi_scan_try_to_offline drivers/acpi/scan.c:227 [inline]
       acpi_scan_hot_remove drivers/acpi/scan.c:329 [inline]
       acpi_generic_hotplug_event drivers/acpi/scan.c:432 [inline]
       acpi_device_hotplug+0x627/0xbe0 drivers/acpi/scan.c:456
       acpi_hotplug_work_fn+0x5e/0x90 drivers/acpi/osl.c:1194
       process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
       process_scheduled_works kernel/workqueue.c:3479 [inline]
       worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #4 (cpu_hotplug_lock){++++}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       percpu_down_write+0x4e/0x3d0 kernel/locking/percpu-rwsem.c:232
       cpus_write_lock kernel/cpu.c:508 [inline]
       _cpu_up+0x68/0x960 kernel/cpu.c:1622
       cpu_up+0x1ba/0x230 kernel/cpu.c:1706
       cpuhp_bringup_mask+0xf8/0x180 kernel/cpu.c:1772
       cpuhp_bringup_cpus_parallel kernel/cpu.c:1850 [inline]
       bringup_nonboot_cpus+0xd9/0x1b0 kernel/cpu.c:1876
       smp_init+0x32/0x150 kernel/smp.c:1151
       kernel_init_freeable+0x44b/0x7b0 init/main.c:1667
       kernel_init+0x21/0x1e0 init/main.c:1565
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #3 (cpu_add_remove_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       cpu_maps_update_begin kernel/cpu.c:468 [inline]
       cpu_down kernel/cpu.c:1490 [inline]
       cpu_device_down+0x46/0xc0 kernel/cpu.c:1508
       device_offline drivers/base/core.c:4283 [inline]
       device_offline+0x2f4/0x400 drivers/base/core.c:4267
       acpi_bus_offline+0x3c7/0x550 drivers/acpi/scan.c:164
       acpi_scan_try_to_offline drivers/acpi/scan.c:227 [inline]
       acpi_scan_hot_remove drivers/acpi/scan.c:329 [inline]
       acpi_generic_hotplug_event drivers/acpi/scan.c:432 [inline]
       acpi_device_hotplug+0x627/0xbe0 drivers/acpi/scan.c:456
       acpi_hotplug_work_fn+0x5e/0x90 drivers/acpi/osl.c:1194
       process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
       process_scheduled_works kernel/workqueue.c:3479 [inline]
       worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 (&device->physical_node_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       class_mutex_constructor include/linux/mutex.h:253 [inline]
       acpi_primary_dev_companion drivers/acpi/bus.c:817 [inline]
       acpi_companion_match+0xc0/0x180 drivers/acpi/bus.c:873
       acpi_device_uevent_modalias+0x19/0x30 drivers/acpi/device_sysfs.c:280
       platform_uevent+0x51/0xc0 drivers/base/platform.c:1473
       dev_uevent+0x1de/0x870 drivers/base/core.c:2766
       kobject_uevent_env+0x6eb/0x18b0 lib/kobject_uevent.c:576
       kobject_synth_uevent+0x6f0/0x7d0 lib/kobject_uevent.c:207
       uevent_store+0x24/0x50 drivers/base/core.c:2847
       dev_attr_store+0x58/0x80 drivers/base/core.c:2509
       sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6af/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (kn->active#5){++++}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       kernfs_drain+0x4eb/0x600 fs/kernfs/dir.c:534
       __kernfs_remove+0x34c/0xbc0 fs/kernfs/dir.c:1578
       kernfs_remove_by_name_ns+0x7c/0x120 fs/kernfs/dir.c:1796
       sysfs_remove_file include/linux/sysfs.h:780 [inline]
       device_remove_file drivers/base/core.c:3146 [inline]
       device_remove_file drivers/base/core.c:3142 [inline]
       device_del+0x361/0x9b0 drivers/base/core.c:3963
       device_unregister+0x1d/0xe0 drivers/base/core.c:4006
       kref_put include/linux/kref.h:65 [inline]
       device_link_put_kref drivers/base/core.c:1022 [inline]
       device_link_put_kref+0x156/0x1b0 drivers/base/core.c:1019
       device_link_remove+0xbb/0x110 drivers/base/core.c:1065
       destroy_regulator+0x417/0x510 drivers/regulator/core.c:2647
       _regulator_put+0xf2/0x1b0 drivers/regulator/core.c:2679
       regulator_put+0x23/0x30 drivers/regulator/core.c:2696
       release_nodes+0xa5/0x120 drivers/base/devres.c:546
       devres_release_group+0x1c2/0x2d0 drivers/base/devres.c:739
       i2c_device_probe+0x70c/0xd10 drivers/i2c/i2c-core-base.c:612
       call_driver_probe drivers/base/dd.c:628 [inline]
       really_probe+0x241/0xa60 drivers/base/dd.c:706
       __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
       driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
       __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
       bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
       __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
       device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
       bus_probe_device+0x64/0x160 drivers/base/bus.c:620
       device_add+0x121d/0x1970 drivers/base/core.c:3776
       i2c_new_client_device+0x660/0xd30 drivers/i2c/i2c-core-base.c:1020
       new_device_store+0x20f/0x420 drivers/i2c/i2c-core-base.c:1308
       dev_attr_store+0x58/0x80 drivers/base/core.c:2509
       sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6af/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (device_links_lock){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       device_links_write_lock drivers/base/core.c:322 [inline]
       device_links_purge drivers/base/core.c:1704 [inline]
       device_del+0x3d7/0x9b0 drivers/base/core.c:3969
       device_unregister+0x1d/0xe0 drivers/base/core.c:4006
       mce_device_remove arch/x86/kernel/cpu/mce/core.c:2715 [inline]
       mce_cpu_pre_down+0x325/0x620 arch/x86/kernel/cpu/mce/core.c:2776
       cpuhp_invoke_callback+0x3b4/0x9a0 kernel/cpu.c:194
       cpuhp_thread_fun+0x3e9/0x7c0 kernel/cpu.c:1109
       smpboot_thread_fn+0x41f/0xb90 kernel/smpboot.c:162
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

Chain exists of:
  device_links_lock --> cpu_hotplug_lock --> cpuhp_state-down

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(cpuhp_state-down);
                               lock(cpu_hotplug_lock);
                               lock(cpuhp_state-down);
  lock(device_links_lock);

 *** DEADLOCK ***

locks held by cpuhp/1/26: 2, last CPU#1:
 #0: ffffffff8fc7b810 (cpu_hotplug_lock){++++}-{0:0}, at: lockdep_acquire_cpus_lock kernel/cpu.c:545 [inline]
 #0: ffffffff8fc7b810 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun+0xdd/0x7c0 kernel/cpu.c:1085
 #1: ffffffff8fc7de00 (cpuhp_state-down){+.+.}-{0:0}, at: lockdep_acquire_cpus_lock kernel/cpu.c:545 [inline]
 #1: ffffffff8fc7de00 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun+0xdd/0x7c0 kernel/cpu.c:1085

stack backtrace:
CPU: 1 UID: 0 PID: 26 Comm: cpuhp/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2087
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2219
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
 device_links_write_lock drivers/base/core.c:322 [inline]
 device_links_purge drivers/base/core.c:1704 [inline]
 device_del+0x3d7/0x9b0 drivers/base/core.c:3969
 device_unregister+0x1d/0xe0 drivers/base/core.c:4006
 mce_device_remove arch/x86/kernel/cpu/mce/core.c:2715 [inline]
 mce_cpu_pre_down+0x325/0x620 arch/x86/kernel/cpu/mce/core.c:2776
 cpuhp_invoke_callback+0x3b4/0x9a0 kernel/cpu.c:194
 cpuhp_thread_fun+0x3e9/0x7c0 kernel/cpu.c:1109
 smpboot_thread_fn+0x41f/0xb90 kernel/smpboot.c:162
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
