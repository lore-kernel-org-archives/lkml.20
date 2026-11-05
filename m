Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876991;
	b=mXad9/3UhtaWix8D+WSLwUYE7LJxr/dtcsIyP9Jog1THMoQeCVo0ARc98Cyztg5YnDwQ
	 i2YW8rRcpvYYvV1T0TPRfepp48UXfUTzvQkqSyy+FwsAgjUBocqi+ymKtoDxsqsCLAsdl
	 DW2DpJLW3j0yGWR7X0q3Zl0Ba9o1gWZCOuvnC8XHWvyvcolF7g2/378rv74SjmNUrWjP8
	 DThAmOa9pgk/5wcIEQdXenlhVxla145qzGVdA1scarwa9ijqPmcpamyYg1JglKTIenowI
	 sWA6k0HpCXPlp0+0ijDSyq10MbH1eeC9IfMCb6x8052rwsmVUeSrzqlnZR+/YEL/Bjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876991;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=zQMckR/WesW9tsRdzIP/K6hyeTnb4+tfQfASj685Lf4=;
	b=44zaQTNXoCInbcZAlSEkSHid/69iYVT+DHfEe1eheNQs9ACPzWwrWV1ztCBztUJVLuNd
	 xGNrN23NEiDLwQhb56Shc12IczmHc7q/0xGyybe0gxyrTcKKFttKkGD9b96vIMcj5Hhym
	 CBJ+O4TNSpxzxlsWujpeqJjJtEL5SpYpJKyOo/9M1rn66S53IgPllZIwzWmAnJUeqd2Cv
	 PAI0aompowTBUEadD1CL21OJjLXWJHfUWbhYOUgEAxL3PfhmPjDSVGJA4dQgihMzTn6s2
	 PuWV4/9vMzZyEhkvAEIbew/GCvOqsCUFnbjesnp6yXT7XO8d6TZx8/MX4LXHJL5KHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F607606D809
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F607606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso2167025b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876990; x=1794481790;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQMckR/WesW9tsRdzIP/K6hyeTnb4+tfQfASj685Lf4=;
        b=cAdljefHP0mhc5mlNqt9+ufmX07TcQjrZIoeOE/At3IDr+VFNR08r7SRTTRYFKPh5L
         r4sRFEAAxFXFUbzMwjLNpN9G0fUTgzGAS2U+2blYoMehujg2xixZrHlLdRNcimoBFpgh
         o6h5jCHi0Hrpgtlb9fvMIPN684RZx/1jwLo9kxyWbQBmI9vOBKJohYDu2ZlBJkgVtCQD
         KphqICKjzTkbvaCljsOcY4dZ+dTOqP3+OjWz0VsQAYIEeP/T6dRfAxC55ry4uQsb6DN/
         wqza98T2G2um1uYpKoGwc1NNx9KcI4LtMNe2VM2NsAtvNYJkIa3wu+tdajwtzP4zxMXI
         /kvw==
X-Gm-Message-State: APuU4Z+QcbfY0LdGLg1M4sMQy9aureHJs3Pad2MhGQCNHZPaAhYjWFyI
	iSix3RRecsoRG7Hkov8K2qDXKqDz+cOvCxiRhaTwTO2mGlT4BE+Yeoh9z24fsHfemttgSjp5LeX
	Y+v1W5o6oeMHsmuNhB7r2TZ2SKhtw54S7orH6JcmxcK7kxD9RZpIi7kF79JI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c232:b0:4e6:cc78:edc6 with SMTP id
 5614622812f47-5640ddf51bbmr13233038b6e.39.1793876990213; Thu, 05 Nov 2026
 03:09:50 -0800 (PST)
Date: Thu, 05 Nov 2026 03:09:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec63fe.5f5735a5.290c1c.0004.GAE@google.com>
Subject: [syzbot] [raid?] BUG: unable to handle kernel paging request in remove_spares
From: syzbot <syzbot+a53c2918175b36cfd601@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, 
	magiclinan@didiglobal.com, song@kernel.org, syzkaller-bugs@googlegroups.com, 
	xiao@kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6628e7d4c6b2 Linux 7.4-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15e6892d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=a53c2918175b36cfd601
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167b4359580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f7244eb9fc82/disk-6628e7d4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7915cff348a4/vmlinux-6628e7d4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e1ce9287de30/Image-6628e7d4.gz.xz

AI-generated root cause summary:
In the MD (Multiple Devices / RAID) subsystem, md_start_sync is scheduled as a
work item on the md_misc workqueue to initiate resynchronization or manage spare
devices. For read-only arrays (!md_is_rdwr(mddev)), md_start_sync executes
remove_and_add_spares(), which invokes remove_spares(). However, md_start_sync
fails to verify whether the array's personality (mddev->pers) is still valid
before calling into personality operations, and array stop/detach sequences do
not ensure that mddev->sync_work is completely halted or prevented from running
after mddev->pers is cleared. When remove_spares() executes with mddev->pers ==
NULL, it attempts to invoke mddev->pers->hot_remove_disk (located at offset
0x50), triggering a NULL pointer dereference crash.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=a53c2918175b36cfd601

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a53c2918175b36cfd601@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address dfff80000000000a
KASAN: null-ptr-deref in range [0x0000000000000050-0x0000000000000057]
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
[dfff80000000000a] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 4993 Comm: kworker/1:5 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/23/2026
Workqueue: md_misc md_start_sync
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : remove_spares+0x100/0x3c8 drivers/md/md.c:10182
lr : remove_spares+0xe0/0x3c8 drivers/md/md.c:10181
sp : ffff800097277900
x29: ffff8000972779a0 x28: ffff0000f4c1c070 x27: 1fffe0001e98380c
x26: dfff800000000000 x25: ffff700012e4ef24 x24: 0000000000000050
x23: 0000000000000000 x22: ffff0000f4c1d108 x21: 0000000000000000
x20: ffff0000f4c1c058 x19: ffff0000f4c1c060 x18: 00000000ffffffff
x17: ffff80012364b000 x16: ffff80008f920000 x15: ffff80008b586000
x14: 00000000001b18f8 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: ffff60001e983a48 x9 : 0000000000000000
x8 : 000000000000000a x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000008 x3 : ffff8000841063ac
x2 : 0000000000000000 x1 : ffff0000c4d55880 x0 : 0000000000000001
Call trace:
 remove_spares+0x100/0x3c8 drivers/md/md.c:10182 (P)
 remove_and_add_spares+0xf4/0x580 drivers/md/md.c:10207
 md_start_sync+0x1f8/0xc80 drivers/md/md.c:10323
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
Code: 972be018 f9400268 91014118 d343ff08 (387a6908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	972be018 	bl	0xfffffffffcaf8060
   4:	f9400268 	ldr	x8, [x19]
   8:	91014118 	add	x24, x8, #0x50
   c:	d343ff08 	lsr	x8, x24, #3
* 10:	387a6908 	ldrb	w8, [x8, x26] <-- trapping instruction


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
