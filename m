Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277913;
	b=lbcSiZhMrAXmMuf7CYySIscYnO/49tT3/FF7RIz5ThcfIrtaWg7/xFiWfp8TbMtup7DE
	 GzuVA3JEQ3j4IqY82iotE+KgfbskDyeYjD98Xb45Ud3RDOtLaLcAhQkwS8KpxdvsAdffM
	 2CmMPrxLyNAdexU+q78nFLJmDh4tyfI8i9Af9KvnBbEvNcQeWqaF/j3V5JeJXd7AQgCs5
	 6aq6hzXUcF8cZ6b4xTCl+g5guLV7NnKR0PmPpSiNe6xk52/amwXCGLb3lCLOgvGFlyPLt
	 P5xPdceiKYzOofWP0AvccBCMh1RDDPztVtSSVPD2k4+fQGDH5KEC+gaD1Gtqrt0QpXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277913;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=DWBISPiP/YqrkQrFe/8Fqhl1lcVsGran7Mt4jN7DHzA=;
	b=n0kfmvt3jBzMBtim/lJXvAT8FSlW9p1fzduCcvygQUPelnz4+QtTokcDfSq2/6j/vW6/
	 1EGrjMJh/vTXXvh1+FYoo1WztayazTGLg4SH9PJ4c5gVa4iDzz2gdfK9vrMU8ccyXxqP1
	 dW7qHIjbZCBBQYSzk1C+WRlp/8W3lrzmDJ/PYsj4q1Oig+weOui8mWVU3RiLaui04jAJH
	 y2kOL1j8wlwANu8qvPcUf6UnyKRoMUXCRV7YN22CjLNOcsuchlkJCeSaddiDRiVVhjmhL
	 XCM27shRSPgY8lu46B1sPdEvXCLA+P/RAxW8cawsKVc0H78nijwBvWOGAhfZwl1jovQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CF8606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13CF8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-54dbbf252cdso1864426b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277912; x=1794882712;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWBISPiP/YqrkQrFe/8Fqhl1lcVsGran7Mt4jN7DHzA=;
        b=n2bYycUZk7++ZbBS4NwV2JpHYsndVV08smc6tJZ9KmkwostpZ3HOtgSBrOUkc8UiJb
         UD16sxmA/mZQ3/fePnN0TFhRYWOY2a26nhBXIdCp6WUxHjBM+oReEVK7VsYhzJFlv36J
         BakwgmJfWz2HA8JkmD6249GwNqew7yPur1cUdo9rAOQSKM5HHPEmYzrcSOKvp/0+OZxH
         St8IQoWfaQK7LnvgMJ0LGE+LkobXH5V0zxhNuwmuhCL77VJHMyhS7/nf6r0sV3CW835S
         Cj3JuLJ/Xke/mw0SdWw87LJmhwNdFlvhCPNRy0GWzyQghyzQrpNsIn49v5uT5U8frejK
         /RUw==
X-Forwarded-Encrypted: i=1; AL+hErF7p/jBqCHLUs2IEXXyHLm7Vw71j95Scs4774aOfPrlumpgtUy3spHYADfy3Uim89FFwR3grnuCRZryeuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cwYg1PomQVo0xhgY244Jx/QYSIFBfxdV6fXTKdYl7XfaJVUsv
	WhUz0eYVQLUXUAvoUCW9laXdlVJTqW3y0eQ38JMr/+nTBfHOSzwOe3NgVXY2GzN6siBwnNCjlzH
	wkaq6wdJ/qFo/CQHnz7xC1HidNpB5b/y2kXAfoHzMtO38+To8nBRUTn4NsGY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11d0:b0:4b9:a8ac:47c with SMTP id
 5614622812f47-5683cc6aa75mr1098088b6e.26.1794277912004; Mon, 09 Nov 2026
 18:31:52 -0800 (PST)
Date: Mon, 09 Nov 2026 18:31:51 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af28217.44d55313.247daf.0005.GAE@google.com>
Subject: [syzbot] [driver-core?] INFO: trying to register non-static key in devres_for_each_res
From: syzbot <syzbot+b9c9ce24fd884c28ede4@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    58c1eb84e977 arm64: sdei: Preserve the interrupted context..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10aaf8ad580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=b9c9ce24fd884c28ede4
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b1ec47537e12/disk-58c1eb84.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3bca0c2b1169/vmlinux-58c1eb84.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0a7c49594d5a/Image-58c1eb84.gz.xz

AI-generated root cause summary:
During power management hibernation preparation triggered by snapshot_open(),
fw_pm_notify() calls device_cache_fw_images(), which iterates across all
registered devices on dpm_list using dpm_for_each_dev(). For each device,
devres_for_each_res() is invoked to search for firmware cache resources,
attempting to acquire &dev->devres_lock and traverse &dev->devres_head via
list_for_each_entry_safe_reverse(). A device on dpm_list had
uninitialized/zeroed devres_lock and devres_head fields, causing lockdep to warn
on the unregistered lock key and devres_for_each_res() to read
dev->devres_head.prev as NULL. Attempting to evaluate list_prev_entry() on the
resulting NULL devres_node dereferenced offset 0x8, triggering a fatal
NULL-pointer dereference (KASAN: null-ptr-deref).

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=b9c9ce24fd884c28ede4

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b9c9ce24fd884c28ede4@syzkaller.appspotmail.com

random: crng reseeded on system resumption
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 6639 Comm: syz.7.332 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 assign_lock_key+0xcc/0xdc kernel/locking/lockdep.c:1028
 register_lock_class+0xf8/0x31c kernel/locking/lockdep.c:1343
 __lock_acquire+0x140/0x2b08 kernel/locking/lockdep.c:5162
 lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:155 [inline]
 _raw_spin_lock_irqsave+0x5c/0x7c kernel/locking/spinlock.c:181
 class_spinlock_irqsave_constructor include/linux/spinlock.h:643 [inline]
 devres_for_each_res+0x54/0x1a8 drivers/base/devres.c:223
 dev_cache_fw_image+0xe4/0x3c0 drivers/base/firmware_loader/main.c:1498
 dpm_for_each_dev+0x60/0xc0 drivers/base/power/main.c:2429
 device_cache_fw_images drivers/base/firmware_loader/main.c:1568 [inline]
 fw_pm_notify+0x208/0x2b8 drivers/base/firmware_loader/main.c:1618
 notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:86
 notifier_call_chain_robust+0x54/0xc4 kernel/notifier.c:121
 blocking_notifier_call_chain_robust+0x74/0xa8 kernel/notifier.c:398
 pm_notifier_call_chain_robust+0x34/0x60 kernel/power/main.c:172
 snapshot_open+0x11c/0x270 kernel/power/user.c:87
 misc_open+0x2dc/0x338 drivers/char/misc.c:163
 chrdev_open+0x398/0x3e8 fs/char_dev.c:413
 do_dentry_open+0x5bc/0xfb4 fs/open.c:1000
 vfs_open_consume+0x54/0x2ec fs/open.c:1131
 do_open fs/namei.c:4851 [inline]
 path_openat+0x1098/0x1910 fs/namei.c:5016
 do_file_open+0x1c8/0x2e8 fs/namei.c:5045
 do_sys_openat2+0x114/0x1ec fs/open.c:1442
 do_sys_open+0xb0/0xe0 fs/open.c:1448
 __do_sys_openat fs/open.c:1464 [inline]
 __se_sys_openat fs/open.c:1459 [inline]
 __arm64_sys_openat+0xa8/0xc4 fs/open.c:1459
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
Unable to handle kernel paging request at virtual address dfff800000000001
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
[dfff800000000001] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 6639 Comm: syz.7.332 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
pstate: 034000c5 (nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : devres_for_each_res+0x94/0x1a8 drivers/base/devres.c:224
lr : class_spinlock_irqsave_constructor include/linux/spinlock.h:643 [inline]
lr : devres_for_each_res+0x54/0x1a8 drivers/base/devres.c:223
sp : ffff800098c07360
x29: ffff800098c07380 x28: ffff0000c9442c60 x27: dfff800000000000
x26: ffff80008f852650 x25: ffff80008259ffd8 x24: ffff8000825d8d0c
x23: ffff8000825d9c6c x22: 0000000000000000 x21: ffff8000825d9ccc
x20: ffff0000c9442c68 x19: ffff0000c94427d8 x18: 1fffe000359cf228
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000e68 x13: 0000000000000001 x12: 0000000000000004
x11: ffff700013180e50 x10: ffff700013180e50 x9 : 3eb6a59f390f4600
x8 : 0000000000000001 x7 : 0000000000000000 x6 : ffff8000804a0a1c
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff80008047ebe8
x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 devres_for_each_res+0x94/0x1a8 drivers/base/devres.c:224 (P)
 dev_cache_fw_image+0xe4/0x3c0 drivers/base/firmware_loader/main.c:1498
 dpm_for_each_dev+0x60/0xc0 drivers/base/power/main.c:2429
 device_cache_fw_images drivers/base/firmware_loader/main.c:1568 [inline]
 fw_pm_notify+0x208/0x2b8 drivers/base/firmware_loader/main.c:1618
 notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:86
 notifier_call_chain_robust+0x54/0xc4 kernel/notifier.c:121
 blocking_notifier_call_chain_robust+0x74/0xa8 kernel/notifier.c:398
 pm_notifier_call_chain_robust+0x34/0x60 kernel/power/main.c:172
 snapshot_open+0x11c/0x270 kernel/power/user.c:87
 misc_open+0x2dc/0x338 drivers/char/misc.c:163
 chrdev_open+0x398/0x3e8 fs/char_dev.c:413
 do_dentry_open+0x5bc/0xfb4 fs/open.c:1000
 vfs_open_consume+0x54/0x2ec fs/open.c:1131
 do_open fs/namei.c:4851 [inline]
 path_openat+0x1098/0x1910 fs/namei.c:5016
 do_file_open+0x1c8/0x2e8 fs/namei.c:5045
 do_sys_openat2+0x114/0x1ec fs/open.c:1442
 do_sys_open+0xb0/0xe0 fs/open.c:1448
 __do_sys_openat fs/open.c:1464 [inline]
 __se_sys_openat fs/open.c:1459 [inline]
 __arm64_sys_openat+0xa8/0xc4 fs/open.c:1459
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
Code: 90000019 913f6339 910022c8 d343fd08 (387b6908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	90000019 	adrp	x25, 0x0
   4:	913f6339 	add	x25, x25, #0xfd8
   8:	910022c8 	add	x8, x22, #0x8
   c:	d343fd08 	lsr	x8, x8, #3
* 10:	387b6908 	ldrb	w8, [x8, x27] <-- trapping instruction


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
