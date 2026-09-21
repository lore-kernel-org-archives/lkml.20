Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8894BEE41
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006016; cv=none; b=MjzCyPf8YnZyNHVdOorMtyMsYztjaDJ10h7UPBi4RKK7rXAuWKz3Ek9zZup19hP08vFKSZXFV4eu7ryLgXCxxJaTLQn+YD1cqUHlc1GkaPA6rjEMRp3pfnPn23ehE2LOjmqoPuR2MXnW6iTnuE3wPU/zpjkOqwELbIM209V8Z/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006016; c=relaxed/simple;
	bh=nxGwjILTh4xIX6mV3nB1fPXwHlwhbOHiuWwGkRGn388=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QN0W7wOh8IlQM6HZxIyVtjtdxKBhW/pE1vICVXrfdj8t20qiaHejstHwLVGdS+NQP3KkDXNU7BuhW/ADJ+ducu0nRnRM2fg9mwtAfqEHzsjNMZyiPLUqVK6h27RUtjMifSwZwiCQ2UKeCaiiChiUIxBt9TKwmqyLmnQBtabS12o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f9.google.com with SMTP id 46e09a7af769-7f66624aa21so830635a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006013; x=1790610813;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FX/GTJgWGkqIUI8nSAN2WOSl6t2HvG1xLOMC7TepdRw=;
        b=Fte0XhxuHucNRTawNIIOZA62Yy6l0XiAhH5GMt0ZU1gUDFL6Zaepo0EPyfPlVO3DDn
         RLuV0jHQQq3PuiSKuVlthdKHP2xdRaMN6gxz/3wiiFhpx03wLfM35eogpTphw5oieKvm
         I2RA3tm8d/sfoNmI9XkhybIEu+0DrZU4S9EtGUEMn7W8tjTNH62Cry/8mikQCdNFo8KD
         fTwx7QJbvdLjHhLhh8O/fBHPg4iQrbPNspqbvBRNCcKd1BUdV/k2YkL8CVZFDlJvJNOE
         r8AglYKqkfI1LXNnhxJb9h7LmC7wn8JvQO/8fSDgiEXF57ODBrFUfr92yoAHGrHeumyA
         FpXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJsCtYIn7sGTkIiM/TOL3GeM7/YUtzVWanTBRwdXBmIC40gkkkTRY8imurDzy37YRSS4RIumorGbDPp1E=@vger.kernel.org
X-Gm-Message-State: AFuF++kIrWAzx06H6NFJXL2bkrhoCzL9xOw9y5U4SgLNvuP6bfV9ZM25
	lGyKdtXs04fcndYTdhWn6EpNazNlspVRWzscjTIkmPVaHs79nSF7ZK6Z7+ZSGcdOXNjHclUfP2v
	FrHIRcjuJ8SnNPj64sThvEqECJn4Cr/BnTFqkW/9pHB9FEQXfQ9I01w9CFPc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81d3:b0:6b1:42ab:d040 with SMTP id
 006d021491bc7-6ca9ab3c96dmr9931207eaf.28.1790006012954; Mon, 21 Sep 2026
 08:53:32 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:53:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab152fc.71f81b7d.15fa6d.0031.GAE@google.com>
Subject: [syzbot] [block?] WARNING: zero-size vmalloc in disksize_store
From: syzbot <syzbot+fb23651a7efbea8868ed@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	minchan@kernel.org, senozhatsky@chromium.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    73ae59e97596 Merge tag 'erofs-for-7.3-rc1-2' of git://git...
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=11d5d525580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c35e49327a11721f
dashboard link: https://syzkaller.appspot.com/bug?extid=fb23651a7efbea8868ed
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175514c9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123b1005580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-73ae59e9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9a72e0bdbe94/vmlinux-73ae59e9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d050a726f316/Image-73ae59e9.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fb23651a7efbea8868ed@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: mm/vmalloc.c:4038 at __vmalloc_node_range_noprof+0x798/0x8ec mm/vmalloc.c:4038, CPU#0: syz.2.17/3661
Modules linked in:
CPU: 0 UID: 0 PID: 3661 Comm: syz.2.17 Tainted: G        W           syzkaller #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: linux,dummy-virt (DT)
pstate: 01402009 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : __vmalloc_node_range_noprof+0x798/0x8ec mm/vmalloc.c:4038
lr : __vmalloc_node_noprof mm/vmalloc.c:4166 [inline]
lr : vzalloc_noprof+0x94/0xa4 mm/vmalloc.c:4244
sp : ffff800089a53b20
x29: ffff800089a53b30 x28: fcf00000046e0000 x27: 00000000ffffffff
x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
x23: 0000000000000000 x22: f3f00000057d3140 x21: 0000000000000012
x20: 0000000000000000 x19: f3f00000057d3100 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000020000000
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000080000000
x11: 0000000000000000 x10: 0fffffffffffffff x9 : 0000000000000010
x8 : 00000000ffffffbf x7 : 00000000ffffffff x6 : 0000000000000000
x5 : 00e8000000000403 x4 : 0000000000000dc0 x3 : ffffc1ffbf800000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 __vmalloc_node_range_noprof+0x798/0x8ec mm/vmalloc.c:4038 (P)
 __vmalloc_node_noprof mm/vmalloc.c:4166 [inline]
 vzalloc_noprof+0x94/0xa4 mm/vmalloc.c:4244
 zram_meta_alloc drivers/block/zram/zram_drv.c:1982 [inline]
 disksize_store+0x64/0x1b0 drivers/block/zram/zram_drv.c:2872
 dev_attr_store+0x18/0x2c drivers/base/core.c:2509
 sysfs_kf_write+0x7c/0x98 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x138/0x200 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x244/0x36c fs/read_write.c:687
 ksys_write+0x70/0x108 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x18/0x24 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x54/0x10c arch/arm64/kernel/syscall.c:49
 el0_svc_common.constprop.0+0x40/0xe0 arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x1c/0x34 arch/arm64/kernel/syscall.c:140
 el0_svc+0x38/0x1fc arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:590
---[ end trace 0000000000000000 ]---


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
