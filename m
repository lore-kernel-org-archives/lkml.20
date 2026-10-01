Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68651381EB3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816429; cv=none; b=PwPaI94BHABo7gbFLto3/zkQ5n6pkQmeZxCjvZSlC3yQoSLKenenhEjfpdci2nrkPlsRgWMJ8rW/CJXek4JVir/SuMxoUSBEb4dU5nG2zdIShE0XIYju9QLJWWqhfHMhOye4J7SPOUpO/bvQad8bM6RmSJ0QI0cNHjZa2xqUzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816429; c=relaxed/simple;
	bh=FpRLzAKoQOj2WK4r99t/gINqZRlyhEfxA8D8qFGtIrE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MCwck808PnwlFzkTNXVdIbPkAlIHrhX3mn/UJglNoymCXsJ6fSh6WP2Wl04tjoo65ZM8K52Lp9vnK4qGv1/2J7ROXvkbWJ3ghQ4DBQRUtwj7O2X+uIGXVQ75huRj7ty9K1teeInNQxOELDLohUZfztd8XLeBuMcSXa3eIlAD80w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso9351483b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790816424; x=1791421224;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yoqFpuJO/gKkgQW+Vs4ZZWyR9d6Arw0t8Tm3FIXdJPI=;
        b=ZYYYr3e/D6tSxoeJjIyqPbtbG5Q84lkvvXkl9XaSCgJXpwXZO0/AWGt2FMinxAcUnf
         MdNGkQnPJFx29Co2+tzQbgkRpyVFC2V6ifbbopl4mQmeqH0QFCqlh6Y/iCILLJaE9ZTL
         G5Lw+BNSjZcP5jyfZ39FLN2QCRG9fzXCiT0ATCDR7kWKg4DKjwyCTqS1RiB4TdS2SK44
         EgVC6QJDVm0RicsHWJYPp1LLx44rNgzsQfbBB/LkDe8jW5zOU6AlESt4xjSrObz93nr+
         VnRF1aG6AvotYr6P0CXtmEx6JzeF2bOm7z0/Vlz+95jCJWzoFMPm4amDVRYWv1rnTQWT
         HWZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHdKMhU0211qWAOerg4nJcBXPvVJIkc5HI3AhP1p2fZ529jk4s0fnCspztNQ/ewEag7FmHa55yEeLpRXY=@vger.kernel.org
X-Gm-Message-State: AFuF++kK/ybP1RzDQZyYVsCLHEUjyVxath0gIiKgU6lUo7Zk+ryHS98B
	H65yihHCwL2d6BBOY4i/v61Vc89rXWvOj8KHvKmLAiR5pOPPysBnT6KsdOCbodjGLFT2EkikNmL
	BbzQqmrr+TOx7yF555jxKENBEJky5mjpJ5y+c6hxJnh5A2SPei70dR6SGcAk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4444:b0:4d6:85d4:8499 with SMTP id
 5614622812f47-4f1b2e3534bmr3646607b6e.7.1790816424773; Wed, 30 Sep 2026
 18:00:24 -0700 (PDT)
Date: Wed, 30 Sep 2026 18:00:24 -0700
In-Reply-To: <6a68b182.4c659fcc.19cd90.0021.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abdb0a8.b50370da.302ea9.0002.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: global-out-of-bounds Read in usb_copy_descriptors
From: syzbot <syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, paritosh.potukuchi@amd.com, 
	paritoshpotukuchi@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    6c2cb8b8b843 Add linux-next specific files for 20260930
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1190e3f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6f425a2650355dac
dashboard link: https://syzkaller.appspot.com/bug?extid=debc5c305403f180c01c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=112a43f5580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=152a43f5580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d79eefc0c62e/disk-6c2cb8b8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d661335b4b7a/vmlinux-6c2cb8b8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e2aeb28cdc89/bzImage-6c2cb8b8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in usb_copy_descriptors+0x1b8/0x320 drivers/usb/gadget/config.c:94
Read of size 128 at addr ffffffff9ad9cd80 by task syz-executor273/5627

CPU: 1 UID: 0 PID: 5627 Comm: syz-executor273 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 __asan_memcpy+0x29/0x70 mm/kasan/shadow.c:105
 usb_copy_descriptors+0x1b8/0x320 drivers/usb/gadget/config.c:94
 usb_assign_descriptors+0xcf/0x290 drivers/usb/gadget/config.c:131
 f_audio_bind+0x1b5e/0x34b0 drivers/usb/gadget/function/f_uac1.c:1443
 usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:386
 bus_add_driver+0x38f/0x6e0 drivers/base/bus.c:771
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc3b3d71df9
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff154ebbf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000200000000400 RCX: 00007fc3b3d71df9
RDX: 000000000000000c RSI: 0000200000000480 RDI: 0000000000000003
RBP: 0000200000000000 R08: 0000555581694060 R09: 0000555581694060
R10: 0000555581694060 R11: 0000000000000246 R12: 00007fff154ebef8
R13: 0000000000000002 R14: 00007fff154ebc30 R15: 0000200000000008
 </TASK>

The buggy address belongs to the variable:
 ac_header_desc+0x0/0x20 f_uac1_legacy.c:-1

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1ad9c
flags: 0xfff00000002000(reserved|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000002000 ffffea00006b6708 ffffea00006b6708 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner info is not present (never set?)

Memory state around the buggy address:
 ffffffff9ad9cc80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffffff9ad9cd00: 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9 f9 f9
>ffffffff9ad9cd80: 00 f9 f9 f9 00 f9 f9 f9 00 f9 f9 f9 00 00 f9 f9
                      ^
 ffffffff9ad9ce00: 00 00 f9 f9 00 00 f9 f9 00 00 f9 f9 00 00 00 00
 ffffffff9ad9ce80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
