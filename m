Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712229;
	b=uevWEMQnaLqwhd1EyRGha7TMjWkXQ/NRT04ttDkBJLUszNWHM9LThEHpD7eP64EedfWu
	 G8Lb8zFfjAf5zabjlEeWZopEcNaYSVfL7tyBG4gsgsDiQh718FcWhRMi1ahk6XwEbUt2G
	 3BT+UTNqIkC4p7xBG+3YTCAo3CqGv5YvbJXc+MBPNOGAPfPrUzP+ZBvU6TALWfedI74RP
	 IWfdoJc2rFHGf3Aui0wtIFTlx3RGpPMTlOwM/vYorBLYm3PDbZtSeSl2zuO6xT3cVOXDR
	 F29/Y7PpNxTmcFepUt2WJvCxLZXWKh5r5kMsTnaHmVJcAkdID3q7sAv5iuq34tYSsJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712229;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=tW45GNGjyYGuZ4JAqIyKTKmzQaRXs93wAefI2nD2qzs=;
	b=te58MyaiAEyFgebWpTMa4o3Pa+iUSljRHYnUCCYsEp9/fgKZMBv1+OhUOyxiLH7A6CQQ
	 PbBatc6kjdtNhanV59YT6XmCR3eC7xOXfFjxiztwk4zcDDvrGzVFOgwf19Uff6CkeeR3u
	 k+SNPLQTwDAFyLWqZ8n/UsbDb5L6To9S0JafjQoahV9hyu4M35IbJf75umkkoySndGyGC
	 uBN09u7sWOjunhCeBHPaOQUzKBtQAgc+9EqM4l5V+bOf0YfVhchtK5udPJr89Zh4na703
	 AlORBXHj8zcOOA+B14Kn08H/k8/inE68siny8o1szKtdmfHrJRj33k79FmbQVeQh7Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B89606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B89606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b597558c4cso2741573b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712228; x=1795317028;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tW45GNGjyYGuZ4JAqIyKTKmzQaRXs93wAefI2nD2qzs=;
        b=eue69h85g87m6TgSXbPBapLcKNFM7FfKrlx3eHrY+pWGXTRQvFbVazNo1prh1O+Eup
         9KqIiE4m3Vwb0RhRgsQ89ZAxvqx7BqGHanxpuMl+1mG/z8+aYAgrbxixaSiJ/c57+mu6
         EohdJWd6G60BPPD4oS9aac41g+HOIvRBB5sxZnQLfRtQC0KSTZY9+TLtMs9Z333YV7wy
         IdWA+hFs9HjYMdrvL5trkXx6BnmPxBFeS+IzxRJKbxqhcjGIfwr0dF8ZTq55lvI7dsyd
         QaTjKL4oVxVe0eLo0zmjcH8NXjaD5z5AzTzVvo2geEk91VuLyu9i+BcINRsS53IDw4R4
         qDfg==
X-Forwarded-Encrypted: i=1; AL+hErGGZw7PqOZpeJLFF6zjmekpkRQxjf/409fCCDL9kyNTex+tm3M7g53ogveDZ2et45wjFXNsggnhEyMB3fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/06QoxFW52xQs8SHCvq4ZlNXvTizPUYzgrWWSo56+taRcVXZ13
	kwVPX61QykEgBca6P28wulOETAozWRxLYuQFWk1IVKwIFUCXXimUJBOwHenOfAVIiCvfFVIQFdN
	XLyulxEvyYWAF/G1sd+uVtynCdaCIU2VGX6l70SbjaoI9peORt0kDKF4186c=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3089:b0:572:dc48:b77a with SMTP id
 5614622812f47-572dc48c7c5mr1493328b6e.22.1794712228540; Sat, 14 Nov 2026
 19:10:28 -0800 (PST)
Date: Sat, 14 Nov 2026 19:10:28 -0800
In-Reply-To: <6a7d0b01.3668565d.e8814.0018.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af922a4.097d52ff.3d440.0011.GAE@google.com>
Subject: Re: [syzbot] [usb?] possible deadlock in uvcg_extension_ba_source_id_show
From: syzbot <syzbot+caf0e2bd08dda787005d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    aacb77975041 Merge tag 'ovl-fixes-7.4-rc3' of git://git.ke..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11cd29ad580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=caf0e2bd08dda787005d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15cd29ad580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+caf0e2bd08dda787005d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz-executor339/5973 is trying to acquire lock:
ffffffff916376e8 (gadget_subsys.su_mutex){+.+.}-{4:4}, at: uvcg_extension_ba_source_id_show+0x7c/0x310 drivers/usb/gadget/function/uvc_configfs.c:1018

but task is already holding lock:
ffff8880242aa370 (&p->frag_sem){++++}-{4:4}, at: fill_read_buffer fs/configfs/file.c:66 [inline]
ffff8880242aa370 (&p->frag_sem){++++}-{4:4}, at: configfs_read_iter+0x346/0x6f0 fs/configfs/file.c:88

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&p->frag_sem){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       down_write_killable+0x8e/0x240 kernel/locking/rwsem.c:1643
       configfs_rmdir+0x3fa/0x950 fs/configfs/dir.c:1543
       vfs_rmdir fs/namei.c:5533 [inline]
       vfs_rmdir+0x328/0x8e0 fs/namei.c:5506
       filename_rmdir+0x31a/0x610 fs/namei.c:5590
       __do_sys_rmdir fs/namei.c:5613 [inline]
       __se_sys_rmdir fs/namei.c:5610 [inline]
       __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x7b0 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (&sb->s_type->i_mutex_key#24){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       down_write+0x86/0x1f0 kernel/locking/rwsem.c:1631
       inode_lock include/linux/fs.h:1027 [inline]
       configfs_depend_item_unlocked+0xf3/0x6a0 fs/configfs/dir.c:1268
       usbg_make_tpg+0x251/0x610 drivers/usb/gadget/function/f_tcm.c:1692
       target_fabric_make_tpg+0xab/0x8c0 drivers/target/target_core_fabric_configfs.c:947
       configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
       vfs_mkdir+0x36d/0x8a0 fs/namei.c:5428
       filename_mkdirat+0x4c4/0x630 fs/namei.c:5461
       __do_sys_mkdir fs/namei.c:5488 [inline]
       __se_sys_mkdir fs/namei.c:5485 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5485
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x7b0 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (tpg_instances_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       tcm_alloc_inst+0x5f/0x1e0 drivers/usb/gadget/function/f_tcm.c:2687
       try_get_usb_function_instance+0x136/0x1f0 drivers/usb/gadget/functions.c:28
       usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
       function_make+0x18c/0x3f0 drivers/usb/gadget/configfs.c:626
       configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
       vfs_mkdir+0x36d/0x8a0 fs/namei.c:5428
       filename_mkdirat+0x4c4/0x630 fs/namei.c:5461
       __do_sys_mkdir fs/namei.c:5488 [inline]
       __se_sys_mkdir fs/namei.c:5485 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5485
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x7b0 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (func_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       try_get_usb_function_instance+0x26/0x1f0 drivers/usb/gadget/functions.c:18
       usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
       function_make+0x18c/0x3f0 drivers/usb/gadget/configfs.c:626
       configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
       vfs_mkdir+0x36d/0x8a0 fs/namei.c:5428
       filename_mkdirat+0x4c4/0x630 fs/namei.c:5461
       __do_sys_mkdir fs/namei.c:5488 [inline]
       __se_sys_mkdir fs/namei.c:5485 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5485
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x7b0 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (gadget_subsys.su_mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       uvcg_extension_ba_source_id_show+0x7c/0x310 drivers/usb/gadget/function/uvc_configfs.c:1018
       fill_read_buffer fs/configfs/file.c:68 [inline]
       configfs_read_iter+0x426/0x6f0 fs/configfs/file.c:88
       new_sync_read fs/read_write.c:473 [inline]
       vfs_read+0x825/0xb30 fs/read_write.c:554
       ksys_read+0x12a/0x250 fs/read_write.c:696
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x7b0 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  gadget_subsys.su_mutex --> &sb->s_type->i_mutex_key#24 --> &p->frag_sem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&p->frag_sem);
                               lock(&sb->s_type->i_mutex_key#24);
                               lock(&p->frag_sem);
  lock(gadget_subsys.su_mutex);

 *** DEADLOCK ***

locks held by syz-executor339/5973: 2, on CPU#1:
 #0: ffff88807364f680 (&buffer->mutex){+.+.}-{4:4}, at: configfs_read_iter+0x79/0x6f0 fs/configfs/file.c:86
 #1: ffff8880242aa370 (&p->frag_sem){++++}-{4:4}, at: fill_read_buffer fs/configfs/file.c:66 [inline]
 #1: ffff8880242aa370 (&p->frag_sem){++++}-{4:4}, at: configfs_read_iter+0x346/0x6f0 fs/configfs/file.c:88

stack backtrace:
CPU: 1 UID: 0 PID: 5973 Comm: syz-executor339 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
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
 uvcg_extension_ba_source_id_show+0x7c/0x310 drivers/usb/gadget/function/uvc_configfs.c:1018
 fill_read_buffer fs/configfs/file.c:68 [inline]
 configfs_read_iter+0x426/0x6f0 fs/configfs/file.c:88
 new_sync_read fs/read_write.c:473 [inline]
 vfs_read+0x825/0xb30 fs/read_write.c:554
 ksys_read+0x12a/0x250 fs/read_write.c:696
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x7b0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb9d4bb53f7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffd83b44e50 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 000055555f71e400 RCX: 00007fb9d4bb53f7
RDX: 0000000000000080 RSI: 00007ffd83b44ea0 RDI: 0000000000000003
RBP: 00007fb9d4beb708 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007fb9d4bef01a
R13: 000055555f71f813 R14: 00007fb9d4beb130 R15: 0000000000000002
 </TASK>
