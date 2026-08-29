Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F8435F19D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032546; cv=none; b=a4FwRTMghYOVT8lP9L3QSRCLc2wKSsYI3P8AAVIKDexpe/iiVY8IdCOoIAoOtaXIevSQzCn9acdSZijwNGsQFrEPlkbz9WJGmVuO98JbOihk2Yj2EHhqABFA/R5O6LDCdGALQrQVHKSZjK6sJd8Z1wt9GpzkgjwobN6S5GgVVlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032546; c=relaxed/simple;
	bh=k0FiHL7zb0VcpJ1YIXi7ZhMDgu/z9UgZ/RLbSYHVwSo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=klGs01yWl/QTCcnoNwk7jn7JqfTYti4BA+V4gshmL8vrkUBFiogNwfBKKNH0wKOuhZykEdNN1P4HAoj94SnhW5TpUaNov7j5hMxomfqw8FJ8WGSZeUJ73zWkXZU8bejJN5asfIsybhCD/XI2Nt8/9SYmTIPdX3+dI9IoMfV/KvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 46e09a7af769-7f4e3bad307so204958a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032544; x=1788637344;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgGAEc6tgDgVeHJOxVNevJhdTjr5Q/Z/SHLlOeuVhKA=;
        b=Y7nul68VPe/bWwTnMU4RK34R1hZZwCc9Qcq+cCN0CwCpD04R8Wr9o9Xc8I7w4qz+Tx
         IAn7rpJd7sTDkSJ/fa2Rtj6NBi6GFJ6x9rXI23id7FBLe1TSeZGG6vsW7QbFvfRb03Wt
         kb1k53Qwumt3FT/rMsxdxDgIkHsWFYCWrM6nhHKC7Kdxq6+bodR4dPoYMLez3OWMsKCm
         x8kOG3v4S/n5Xc1WPQDSB3zLH91IJLteaaXIWMjgNUL9siii5ZLPBEajtW3PzlsKW1U6
         dBz9PZME2GSsZOIFQuGNCxjK0CXiccJ9CBmmJ5gmzt9tHint0xloWqlw1WIuwLxAer2X
         ofcg==
X-Forwarded-Encrypted: i=1; AHgh+RqJKysp83L94ymxCJqDlh+LV5uv3tfXhuRExeONYRDByzL9rzMwGXfdYGvod5t1eNvug7R3QzZvcGiyOx4=@vger.kernel.org
X-Gm-Message-State: AFuF++lHAqLtVUD8JLj2gzMMLJwVTtru/ye9JfRC8FXKyUxkJGjOkhwe
	rHFnJYR6mEphAXOs7oITkf3zxbbNvJ/XKAq4HkVtSCRycLFBy7ZN9e+OrTqaLB8d5N0zkw7Fmu+
	qUaaYAmYS+/H79DMhJ8RiLrAzHoqaIleKuOEgzndhUU95Ee283iBaiuqwmys=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:52d5:b0:6b1:3534:a5b8 with SMTP id
 006d021491bc7-6b1c66161d9mr12613999eaf.15.1788032543934; Sat, 29 Aug 2026
 12:42:23 -0700 (PDT)
Date: Sat, 29 Aug 2026 12:42:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a93361f.08e933ee.dbf97.009b.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in fifo_open (2)
From: syzbot <syzbot+e6737343c72c2accf79e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1140199e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=e6737343c72c2accf79e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6e4100526b12/vmlinux-818bebeb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/723c4783ee96/bzImage-818bebeb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e6737343c72c2accf79e@syzkaller.appspotmail.com

9p: Bad value for 'version'
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.8.3362/18795 is trying to acquire lock:
ffff88805662e860 (&pipe->mutex){+.+.}-{4:4}, at: fifo_open+0x139/0xb40 fs/pipe.c:1235

but task is already holding lock:
ffff88802b41f920 (&common->filesem){++++}-{4:4}, at: fsg_store_file+0x193/0x450 drivers/usb/gadget/function/storage_common.c:452

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #5 (&common->filesem){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       down_read+0x99/0x4c0 kernel/locking/rwsem.c:1574
       fsg_store_cdrom+0xe2/0x190 drivers/usb/gadget/function/storage_common.c:478
       flush_write_buffer fs/configfs/file.c:207 [inline]
       configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6af/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #4 (&p->frag_sem){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       down_read+0x99/0x4c0 kernel/locking/rwsem.c:1574
       flush_write_buffer fs/configfs/file.c:205 [inline]
       configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6af/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (&buffer->mutex#2){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
       configfs_read_iter+0x79/0x6f0 fs/configfs/file.c:86
       __kernel_read+0x397/0xad0 fs/read_write.c:532
       integrity_kernel_read+0x7e/0xb0 security/integrity/iint.c:28
       ima_calc_file_hash_tfm+0x25e/0x350 security/integrity/ima/ima_crypto.c:222
       ima_calc_file_hash+0x1e3/0x380 security/integrity/ima/ima_crypto.c:280
       ima_collect_measurement+0x94f/0xb30 security/integrity/ima/ima_api.c:300
       process_measurement+0xdfe/0x2350 security/integrity/ima/ima_main.c:425
       ima_file_check+0xc3/0x110 security/integrity/ima/ima_main.c:685
       security_file_post_open+0xc4/0x210 security/security.c:2755
       do_open fs/namei.c:4839 [inline]
       path_openat+0x5cd/0x2440 fs/namei.c:5000
       do_file_open+0x20e/0x430 fs/namei.c:5029
       do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
       do_sys_open fs/open.c:1423 [inline]
       __do_sys_openat fs/open.c:1439 [inline]
       __se_sys_openat fs/open.c:1434 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1434
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&ima_iint_mutex_key[depth]){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
       process_measurement+0x5ab/0x2350 security/integrity/ima/ima_main.c:319
       ima_file_check+0xc3/0x110 security/integrity/ima/ima_main.c:685
       security_file_post_open+0xc4/0x210 security/security.c:2755
       do_open fs/namei.c:4839 [inline]
       path_openat+0x5cd/0x2440 fs/namei.c:5000
       do_file_open+0x20e/0x430 fs/namei.c:5029
       file_open_name+0x1c3/0x3e0 fs/open.c:1375
       filp_open+0x2e/0x50 fs/open.c:1392
       kernel_read_file_from_path_initns+0xec/0x240 fs/kernel_read_file.c:159
       fw_get_filesystem_firmware drivers/base/firmware_loader/main.c:549 [inline]
       _request_firmware+0x733/0x13c0 drivers/base/firmware_loader/main.c:873
       request_firmware+0x35/0x50 drivers/base/firmware_loader/main.c:948
       reg_reload_regdb+0x85/0x460 net/wireless/reg.c:1067
       genl_family_rcv_msg_doit+0x214/0x300 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x560/0x800 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2556
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
       netlink_unicast+0x585/0x850 net/netlink/af_netlink.c:1345
       netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1900
       sock_sendmsg_nosec net/socket.c:800 [inline]
       __sock_sendmsg net/socket.c:815 [inline]
       ____sys_sendmsg+0xa4d/0xbe0 net/socket.c:2713
       ___sys_sendmsg+0x190/0x1e0 net/socket.c:2767
       __sys_sendmsg+0x160/0x210 net/socket.c:2799
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (cb_lock){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       down_read+0x99/0x4c0 kernel/locking/rwsem.c:1574
       genl_rcv+0x19/0x40 net/netlink/genetlink.c:1217
       netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
       netlink_unicast+0x585/0x850 net/netlink/af_netlink.c:1345
       netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1900
       sock_sendmsg_nosec net/socket.c:800 [inline]
       __sock_sendmsg net/socket.c:815 [inline]
       sock_sendmsg+0x394/0x410 net/socket.c:838
       splice_to_socket+0xb3c/0x11a0 fs/splice.c:884
       do_splice_from fs/splice.c:936 [inline]
       do_splice+0x109c/0x1fa0 fs/splice.c:1349
       __do_splice+0x33b/0x370 fs/splice.c:1431
       __do_sys_splice fs/splice.c:1634 [inline]
       __se_sys_splice fs/splice.c:1616 [inline]
       __x64_sys_splice+0x187/0x250 fs/splice.c:1616
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&pipe->mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
       check_prevs_add kernel/locking/lockdep.c:3300 [inline]
       validate_chain kernel/locking/lockdep.c:3924 [inline]
       __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5253
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
       fifo_open+0x139/0xb40 fs/pipe.c:1235
       do_dentry_open+0x6ab/0x14d0 fs/open.c:996
       vfs_open+0x82/0x3f0 fs/open.c:1101
       do_open fs/namei.c:4837 [inline]
       path_openat+0x19fa/0x2440 fs/namei.c:5000
       do_file_open+0x20e/0x430 fs/namei.c:5029
       file_open_name+0x1c3/0x3e0 fs/open.c:1375
       filp_open+0x2e/0x50 fs/open.c:1392
       fsg_lun_open+0x9e/0x7b0 drivers/usb/gadget/function/storage_common.c:199
       fsg_store_file+0x1e7/0x450 drivers/usb/gadget/function/storage_common.c:455
       flush_write_buffer fs/configfs/file.c:207 [inline]
       configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6af/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &pipe->mutex --> &p->frag_sem --> &common->filesem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&common->filesem);
                               lock(&p->frag_sem);
                               lock(&common->filesem);
  lock(&pipe->mutex);

 *** DEADLOCK ***

locks held by syz.8.3362/18795: 5, last CPU#0:
 #0: ffff888034a2c9b0 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2aa/0x380 fs/file.c:1259
 #1: ffff8880238a2460 (sb_writers#18){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:739
 #2: ffff88803d2cde80 (&buffer->mutex#2){+.+.}-{4:4}, at: configfs_write_iter+0x76/0x4e0 fs/configfs/file.c:226
 #3: ffff88803c8bd070 (&p->frag_sem){++++}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
 #3: ffff88803c8bd070 (&p->frag_sem){++++}-{4:4}, at: configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229
 #4: ffff88802b41f920 (&common->filesem){++++}-{4:4}, at: fsg_store_file+0x193/0x450 drivers/usb/gadget/function/storage_common.c:452

stack backtrace:
CPU: 0 UID: 0 PID: 18795 Comm: syz.8.3362 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2059
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2191
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
 check_prevs_add kernel/locking/lockdep.c:3300 [inline]
 validate_chain kernel/locking/lockdep.c:3924 [inline]
 __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5253
 lock_acquire kernel/locking/lockdep.c:5886 [inline]
 lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
 fifo_open+0x139/0xb40 fs/pipe.c:1235
 do_dentry_open+0x6ab/0x14d0 fs/open.c:996
 vfs_open+0x82/0x3f0 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x19fa/0x2440 fs/namei.c:5000
 do_file_open+0x20e/0x430 fs/namei.c:5029
 file_open_name+0x1c3/0x3e0 fs/open.c:1375
 filp_open+0x2e/0x50 fs/open.c:1392
 fsg_lun_open+0x9e/0x7b0 drivers/usb/gadget/function/storage_common.c:199
 fsg_store_file+0x1e7/0x450 drivers/usb/gadget/function/storage_common.c:455
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f485679e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4857660028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f4856a25fa0 RCX: 00007f485679e0d9
RDX: 0000000000000005 RSI: 00002000000003c0 RDI: 0000000000000003
RBP: 00007f4856835024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f4856a26038 R14: 00007f4856a25fa0 R15: 00007ffd7288fbb8
 </TASK>
mass_storage.0/lun.0: unable to open backing file: file0


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
