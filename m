Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A14471D05
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574060; cv=none; b=rE51uZh9CgJvwGsGuWdsvsXbP5jy1aX+rovSUP3xMcX0LVdOgQAkuEZnYibnouMv4MNQyZUgdm8SQBbtzNIZPwrSgXLvvCLIDLYPKoATpC6tRmtiWSQMaUrjpdInqdPrqDYzYlFzZQXymKvUyv+NKWZnttk/Wp4g90pQ+DHBZjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574060; c=relaxed/simple;
	bh=RmuQWBMnPy6zxFGaVHKgzoeqd0qeTN2hgHvOWm1Lbno=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Sy5hLNEeX5/6CkLvl2vHAk75HXkEhHI4WZw90Tc/VgTX8zZwfnnHzL5lUvixLpBZgYvUlWJMUxJ8u8w8Z/fg+bqNZxqte6SYYwld+eo0e+VQymllA+AYbtYGbPSfiMPyYDvUNaJrx7eiMaKJyEwWqEG+94K+cGHSr5y1b01vMiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a7de733fa9so189674b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791574055; x=1792178855;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgvqW7P3hvQ2A+fFBXR7HoHy5at4znoy1fWG5506N4Y=;
        b=xVnk/AMvuSELx6SbK4tuLmrujSxNBiihko/kBYLc5cGZuUTGys7FEF79J6fuxYjXP6
         lv9nIi2DMkxnd5MMiavWwm8hM8mFAE0PtSEG/AGGtrlfkWCIGiL8FJKCMEpwkQqhmDB9
         yI2EoZb5gjUQp0Ahx36n9H74pxzwHofsGfwy4C1TwK4ss/R5o/sBQFDao8Cjvxr7b6WV
         ykA07K1u6SQMPpL0gA64vXP4JU+CafX7zICyqeoyP9p7tQygRpVC4kNp0MNAW8O+HMFi
         0vc3ZbncV3ceXtrJJL/xU7hJSN+nMn2iqY2wUQvkHy+b5MWTEvCTtmfUBqifibod3RA8
         bPQw==
X-Forwarded-Encrypted: i=1; AKwUvBx1lVHfc1x1Ofiz6yfpdoqvZVGfV21mZue7D6tu5DRDwRV5a+QEY1ZmBQRvupYGMowe7i76k5vL4WDOq0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l8geqc4eLKdp7abZVyOU9VxlsTf/DGLzRfewv8rZo8utk/ILKh
	pcXFUoeWyxVflSmOLrtyvRUeZy0oTZitnxMFQohgN8Kj72PjGr+UPsfSWR5LuMNpLXbgzl43v9w
	Z1bI0Chu1cem2bQaV2BCT0t/8tT4JsKczyZSubZYX7SGWEX2qdOqKxrh748Q=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f8f:b0:4ea:686e:fe86 with SMTP id
 5614622812f47-50c5b464a7emr2535716b6e.63.1791574054953; Fri, 09 Oct 2026
 12:27:34 -0700 (PDT)
Date: Fri, 09 Oct 2026 12:27:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac94026.70ed5d86.2ac85.0077.GAE@google.com>
Subject: [syzbot] [media?] memory leak in vidtv_psi_pmt_create_sec_for_each_pat_entry
From: syzbot <syzbot+3bb39e30be6cca84a865@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7b63ef2d55f2 Merge tag 'for-7.3-rc6-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=169860a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=12c87ae0d043bfa0
dashboard link: https://syzkaller.appspot.com/bug?extid=3bb39e30be6cca84a865
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1277249c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/797a41c61706/disk-7b63ef2d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/734af738f380/vmlinux-7b63ef2d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bcfa942944b7/bzImage-7b63ef2d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3bb39e30be6cca84a865@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88812cf24108 (size 8):
  comm "syz.3.32", pid 6127, jiffies 4294946999
  hex dump (first 8 bytes):
    00 00 00 00 00 00 00 00                          ........
  backtrace (crc 0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4696 [inline]
    slab_alloc_node mm/slub.c:4996 [inline]
    __do_kmalloc_node mm/slub.c:5413 [inline]
    __kmalloc_noprof+0x3fb/0x540 mm/slub.c:5439
    _kmalloc_noprof include/linux/slab.h:995 [inline]
    _kzalloc_noprof include/linux/slab.h:1312 [inline]
    vidtv_psi_pmt_create_sec_for_each_pat_entry+0x7d/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1471
    vidtv_channel_si_init+0x544/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:478
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1072
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
