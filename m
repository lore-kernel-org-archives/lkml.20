Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488754;
	b=psfy2Px7ZhhD9qDt98WOaRcnEi2gcJPvFAHBliLNdiemWn4dNUt0RGDm4lU28a9ci6S3
	 GKmWqYW6QN8riCnOQo2lK2E/kQxpnR/vMJ41u3WSRtJGWkhRHkpO1buAogAY4fTU47bdW
	 badUNrkcOr1StOX4Y4wgemi1hUiQNv99lCtzx6HmPvEQlPbg3y+xPlHHE9F97bjw+sDM0
	 vg/Tfs3IbUdae6uqkc4CxeCOEhV0lkn+adBOj6drfL52vs+wk/BlSTlI7RjLHQUjkjggT
	 1gYzlazZOE1seYmtl/wbtaAA4MYGsfW9mRCUrC3+4ZFJBTL6SJWBRpmANZL2wpwuxbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488754;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=IEGOFRYKNjT2cDILI2yM/s/jbC6C4nGaeAuqDwjS1do=;
	b=kQDaEjjZHmcTUQrVTuEdFeuuJgqKEjx+BJC2nJ9Pc2OFKMik8K7iq4/SXf3Qhe6zNSwX
	 4NHWjCAy4TZZcEle/Dw+RvljqYi/6w0HqrVeKAWTIBwL/oaLeolGZvC8ukROA/LHyRjT4
	 lztMwNtokc3Y4HWIuxp318wGQK09Jasb624HTbyYK0kXlLgyvBmi0vyb8jgeq69/iOTtB
	 hfbDu5q5zHAeffml6/P961aehkNvi+bwB/2CQgz8SVHqS/R+ISupIgobv46MYpt4OlAke
	 oB92W2OCi8ytLhhwOxw/jEKNb7QlRMLI0REuwRAEF5z5JrGY/usdUEvuVsAgpnpzOog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D7606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so5035193b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488753; x=1793093553;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IEGOFRYKNjT2cDILI2yM/s/jbC6C4nGaeAuqDwjS1do=;
        b=boNDLedt5aTxh8NTIq4nir6/4E6zIUHHW7GlirYeV9NaEvUnNQ0JAZP5SWRmkB0awO
         hSrVw0OadVaTaMkIIAoEqODgqzghGiR9OMoanC3WZf0dlCDmbtWKOspKV2k1CeTaoF6m
         +stI9eBQwa0pCtbjislGHF+elbNgtf5dtbuHR5VEsFxnMLxHq4ZJdkAra85RL55hgTBV
         AQ0avf1UkhoBQVfpYO/EkDw25mbq8jptG25IBDHAE87eh4D4aSC4cRpkKICaoG4FWvvj
         I6hA4Z6WluRGBiD5TRJTgOWOnrr2hBD7dfByR2dw5jdwO6EMvcSBVioU5tZwXDxumVQi
         1g1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJzVDluGJ5zOJO6dW3exDZTeewggAeAS8w8fNBK8QrasRT/+mM/fQpACB4V8WMjkENQoIfZCYEwY8JRFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH39sg+hreUzIhD3pSrRbCSuDGbhSxGj2ZQUaStQHIkJ/za36H
	QcALexw7WlvDrnL4//Lgp1y5ru/BwsAEyMrxlc0M7hrI7vx+Gb6aQ/Ljg1zqkbOLQ/YuxzFlXyq
	pcb0EmREBIQooWakmFu8uwvz9NSdejClBps/PgRq+C2P2goGp6mXsoKfROk4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6b8a:b0:4d6:90f4:48ab with SMTP id
 5614622812f47-53ccfba424emr7865166b6e.45.1792488753042; Tue, 20 Oct 2026
 02:32:33 -0700 (PDT)
Date: Tue, 20 Oct 2026 02:32:33 -0700
In-Reply-To: <6a6944b4.d9e86bb5.297b12.003c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad73531.5c73e770.1a06c9.0104.GAE@google.com>
Subject: Re: [syzbot] [usb?] [fs?] possible deadlock in uvc_func_allow_link
From: syzbot <syzbot+8c0a48f6c8357c9da819@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f47d223627f8 Merge tag 'vfs-7.4-rc1.sync_close' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1475c831580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=897740d587b37862
dashboard link: https://syzkaller.appspot.com/bug?extid=8c0a48f6c8357c9da819
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1275c831580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8c0a48f6c8357c9da819@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz-executor238/6025 is trying to acquire lock:
ffffffff914019a8 (gadget_subsys.su_mutex){+.+.}-{4:4}, at: uvc_func_allow_link+0x76/0x3f0 drivers/usb/gadget/function/uvc_configfs.c:3651

but task is already holding lock:
ffff88802eca5b80 (&sb->s_type->i_mutex_key#25){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
ffff88802eca5b80 (&sb->s_type->i_mutex_key#25){+.+.}-{4:4}, at: configfs_symlink+0x452/0x1340 fs/configfs/symlink.c:201

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&sb->s_type->i_mutex_key#25){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
       inode_lock include/linux/fs.h:1024 [inline]
       configfs_depend_item_unlocked+0xf3/0x6a0 fs/configfs/dir.c:1268
       usbg_make_tpg+0x251/0x610 drivers/usb/gadget/function/f_tcm.c:1692
       target_fabric_make_tpg+0xab/0x8c0 drivers/target/target_core_fabric_configfs.c:947
       configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
       vfs_mkdir+0x364/0x850 fs/namei.c:5420
       filename_mkdirat+0x48b/0x5e0 fs/namei.c:5453
       __do_sys_mkdir fs/namei.c:5480 [inline]
       __se_sys_mkdir fs/namei.c:5477 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5477
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (tpg_instances_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1c20 kernel/locking/mutex.c:821
       tcm_alloc_inst+0x5f/0x1e0 drivers/usb/gadget/function/f_tcm.c:2687
       try_get_usb_function_instance+0x136/0x1f0 drivers/usb/gadget/functions.c:28
       usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
       function_make+0x18c/0x3f0 drivers/usb/gadget/configfs.c:626
       configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
       vfs_mkdir+0x364/0x850 fs/namei.c:5420
       filename_mkdirat+0x48b/0x5e0 fs/namei.c:5453
       __do_sys_mkdir fs/namei.c:5480 [inline]
       __se_sys_mkdir fs/namei.c:5477 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5477
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (func_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1c20 kernel/locking/mutex.c:821
       try_get_usb_function_instance+0x26/0x1f0 drivers/usb/gadget/functions.c:18
       usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
       function_make+0x18c/0x3f0 drivers/usb/gadget/configfs.c:626
       configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
       vfs_mkdir+0x364/0x850 fs/namei.c:5420
       filename_mkdirat+0x48b/0x5e0 fs/namei.c:5453
       __do_sys_mkdir fs/namei.c:5480 [inline]
       __se_sys_mkdir fs/namei.c:5477 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5477
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (gadget_subsys.su_mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1c20 kernel/locking/mutex.c:821
       uvc_func_allow_link+0x76/0x3f0 drivers/usb/gadget/function/uvc_configfs.c:3651
       configfs_symlink+0x695/0x1340 fs/configfs/symlink.c:211
       vfs_symlink fs/namei.c:5804 [inline]
       vfs_symlink+0x178/0x4d0 fs/namei.c:5783
       filename_symlinkat+0x2a6/0x560 fs/namei.c:5829
       __do_sys_symlink fs/namei.c:5856 [inline]
       __se_sys_symlink fs/namei.c:5852 [inline]
       __x64_sys_symlink+0x79/0xb0 fs/namei.c:5852
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  gadget_subsys.su_mutex --> tpg_instances_lock --> &sb->s_type->i_mutex_key#25

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sb->s_type->i_mutex_key#25);
                               lock(tpg_instances_lock);
                               lock(&sb->s_type->i_mutex_key#25);
  lock(gadget_subsys.su_mutex);

 *** DEADLOCK ***

locks held by syz-executor238/6025: 2, last CPU#3:
 #0: ffff888025b44460 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5095
 #1: ffff88802eca5b80 (&sb->s_type->i_mutex_key#25){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff88802eca5b80 (&sb->s_type->i_mutex_key#25){+.+.}-{4:4}, at: configfs_symlink+0x452/0x1340 fs/configfs/symlink.c:201

stack backtrace:
CPU: 3 UID: 0 PID: 6025 Comm: syz-executor238 Not tainted syzkaller #0 PREEMPT(full) 
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
 __mutex_lock+0x1a4/0x1c20 kernel/locking/mutex.c:821
 uvc_func_allow_link+0x76/0x3f0 drivers/usb/gadget/function/uvc_configfs.c:3651
 configfs_symlink+0x695/0x1340 fs/configfs/symlink.c:211
 vfs_symlink fs/namei.c:5804 [inline]
 vfs_symlink+0x178/0x4d0 fs/namei.c:5783
 filename_symlinkat+0x2a6/0x560 fs/namei.c:5829
 __do_sys_symlink fs/namei.c:5856 [inline]
 __se_sys_symlink fs/namei.c:5852 [inline]
 __x64_sys_symlink+0x79/0xb0 fs/namei.c:5852
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f17e04c5357
Code: 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 b8 58 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffdfd785e48 EFLAGS: 00000206 ORIG_RAX: 0000000000000058
RAX: ffffffffffffffda RBX: 00007f17e051e1e8 RCX: 00007f17e04c5357
RDX: 0000000000000000 RSI: 00007f17e051e170 RDI: 00007f17e051e1e8
RBP: 00007f17e051e300 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 00007f17e051e250
R13: 00007f17e051e298 R14: 00007f17e051e2d8 R15: 00007f17e051e1b0
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
