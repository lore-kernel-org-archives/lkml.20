Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377793;
	b=eoy8aBbLPbQhuDYlONiIB+dNy/8gMk0+ik37TAJKKOgHE8OG9nQXVTsnUMGgLxlvW1kC
	 2KELu9r/HRKT3XZw7ITcL8enenXJhJIyX3CAf92ULVdpO26wLbnyc1CvrXhDW8lYR12g5
	 cEkhreYmfFWOhRUexIaCIJLW8hFQIATRQzVGmJv+2+Vx7MKx9i+y9B4mGrlsdsmSqyZ2z
	 k8yMxZphYX7CSJSGREFDLOSBa5slgyvuZPLeruKlLFg0fccRxd5plcc7dJHQO2pwITCam
	 LhNazVDt2INK4P194HcOneVdntsZWnaowxFWM2fqnih+P4SqtIBuaO8GSJHLIx6SQEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377793;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=UbrJK1gmEBay7iBFJFQ+GOKQWV182S9OUrosyeEkatM=;
	b=Q4/jxMtoOpJD6UUiDpQ9PbKgWJFM6aw+Ix90eDjBAoaya0zwVXH6jQWpG+3D2M06hOTu
	 8Mpglgu4YmJeuYX8tR0jyMnsc504CMcU3ZAg5KwhPddWlxqbqtBgjWGpDugSnmYjN3KJy
	 7ad+CiwEwTFPY6p2BhCZOJQgzmRACiEBFGPhTnlV1zYJsbugAN7gB0anQJn5cykgdYRAZ
	 PMxymMdvqIpVdSA+GgvuAN3o+UkLU2l6D+ze5nrTfszzQRTq6cZ686oySD/K1EgPMAAph
	 3ZyPIEe23uiT4bXsmHb582IK07fQ44J/OPRmT/AtkOGFRW1NbVQH20mFTqWmzX6wWrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51747606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51747606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4d2f0f77124so989970b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377792; x=1793982592;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbrJK1gmEBay7iBFJFQ+GOKQWV182S9OUrosyeEkatM=;
        b=avi7Eg3qJppYc4ZL9g0p68p7GTHzISsjEHBn7DbQjz6aPO8ANrBasDW8nm4EYL2tqE
         ixRSShKc1+ZL/ChTqmVYhH58lZiaN6chjb07cGOY54O7ZIUXWSAXhaOb4XAEaoKHE+X+
         B0E3hJ/0MuLIWarH10ZhEjTo1j/+8psv3XCJQy4ZakBuj/uh4B/+5N/uH7kE+auRz9Ir
         VnZUH/EQdOXt7B6/HjeXDmqwzEJRKWBGZccQgEKwtDCxfvAR2/xHkVDwHwYmdwnS0IY6
         WhXQGvSmYZ38/n5OxxmRFrUPTChFlB6Z46xO2F5EYZgnAF9YTh7Q6ARnmeBzfG4mk8bZ
         sqTQ==
X-Forwarded-Encrypted: i=1; AKwUvByLNUWqxgLATPzR95aINS6SelSOiUkp62EUkyBY9GjFGfP1tVjQGrw8jbCkqta84zKWc1iiR57dfP8wZys=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEg1ZOf5htY2qK1WXVVG//i2OW4U5KKxyVySE3S/9qc57oody7
	vAo8O/JnObyS+tl8i8cMbXdyxdj8R8iZbXyVp7qat1qB7jRjygodrmQZEbVxYtIObtWkz9UkIn+
	yBhyFGvqcPMXi55zqj4KGrnudZ1nWj1vdsVyLHKWTrNRNY9SyRherX8GKYGo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6408:b0:4d6:9283:1df2 with SMTP id
 5614622812f47-5640de79c53mr1920184b6e.61.1793377792209; Fri, 30 Oct 2026
 09:29:52 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:29:52 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae4c600.0c1d3ab6.e3d48.0072.GAE@google.com>
Subject: [syzbot] [ext4?] WARNING in ext4_do_writepages
From: syzbot <syzbot+97fbc97fdd4e4fa2ed3a@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, jack@suse.cz, libaokun@linux.alibaba.com, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojaswin@linux.ibm.com, ritesh.list@gmail.com, syzkaller-bugs@googlegroups.com, 
	tytso@mit.edu, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6b4b543fa187 Merge tag 'parisc-for-7.4-rc1' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=17423721580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=34fc2a03f519bd67
dashboard link: https://syzkaller.appspot.com/bug?extid=97fbc97fdd4e4fa2ed3a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12257b0d580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c23721580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4286db2c74d4/disk-6b4b543f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c7bad85f1b9a/vmlinux-6b4b543f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cb2301e1bf76/bzImage-6b4b543f.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/60f2e9127825/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=11a9250d580000)

AI-generated root cause summary:
In ext4 writeback (mpage_map_one_extent), a WARN_ON_ONCE(!err) is hit because
ext4_map_blocks() returns 0 (indicating a hole) for an extent that was queued
for writeback by mpage_add_bh_to_extent(). This occurs when a buffer head
remains marked mapped, dirty, and delayed/unwritten (for example, during file
truncation down via ftruncate/ext4_block_zero_eof or direct I/O fallback paths),
while the extent status tree or on-disk extent mapping for the logical block is
or becomes a hole. When ext4_map_blocks() is called with
EXT4_GET_BLOCKS_IO_SUBMIT, it avoids allocating blocks for holes and returns 0,
triggering the warning and returning -EINVAL. In production kernels, the warning
does not halt execution and error recovery safely invalidates the page without
causing memory corruption, information leaks, or denial of service.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=97fbc97fdd4e4fa2ed3a

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+97fbc97fdd4e4fa2ed3a@syzkaller.appspotmail.com

------------[ cut here ]------------
!err
WARNING: fs/ext4/inode.c:2512 at mpage_map_one_extent fs/ext4/inode.c:2512 [inline], CPU#1: kworker/u8:5/72
WARNING: fs/ext4/inode.c:2512 at mpage_map_and_submit_extent fs/ext4/inode.c:2601 [inline], CPU#1: kworker/u8:5/72
WARNING: fs/ext4/inode.c:2512 at ext4_do_writepages+0x33b6/0x44b0 fs/ext4/inode.c:3077, CPU#1: kworker/u8:5/72
Modules linked in:
CPU: 1 UID: 0 PID: 72 Comm: kworker/u8:5 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Workqueue: writeback wb_workfn (flush-7:0)
RIP: 0010:mpage_map_one_extent fs/ext4/inode.c:2512 [inline]
RIP: 0010:mpage_map_and_submit_extent fs/ext4/inode.c:2601 [inline]
RIP: 0010:ext4_do_writepages+0x33b6/0x44b0 fs/ext4/inode.c:3077
Code: 0f 0b 90 e9 b6 d9 ff ff e8 c7 d4 38 ff 90 0f 0b 90 e9 e6 dc ff ff e8 b9 d4 38 ff 90 0f 0b 90 e9 94 df ff ff e8 ab d4 38 ff 90 <0f> 0b 90 bb ea ff ff ff e9 ae f8 ff ff e8 98 d4 38 ff 48 8d 3d 11
RSP: 0018:ffffc9000158ec60 EFLAGS: 00010293
RAX: ffffffff828f01e5 RBX: 0000000000000000 RCX: ffff88801eb7ddc0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc9000158f070 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10054fc8bc R12: ffffc9000158f120
R13: dffffc0000000000 R14: 0000000000000000 R15: 1ffff110054fc8d1
FS:  0000000000000000(0000) GS:ffff888124834000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6c27e15b20 CR3: 0000000032ea4000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 ext4_writepages+0x1fe/0x4e0 fs/ext4/inode.c:3171
 do_writepages+0x338/0x560 mm/page-writeback.c:2560
 __writeback_single_inode+0x136/0x1230 fs/fs-writeback.c:1800
 writeback_sb_inodes+0x9db/0x1aa0 fs/fs-writeback.c:2111
 __writeback_inodes_wb+0x114/0x240 fs/fs-writeback.c:2187
 wb_writeback+0x42f/0xad0 fs/fs-writeback.c:2298
 wb_check_old_data_flush fs/fs-writeback.c:2402 [inline]
 wb_do_writeback fs/fs-writeback.c:2481 [inline]
 wb_workfn+0xc98/0x10f0 fs/fs-writeback.c:2509
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
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
