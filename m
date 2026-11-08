Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794116078;
	b=tgFSgTlpSMQKYx7ggl7S2zN7cxXiuF0JNgS38u8OxQjOL+uFn6BsO7GUH9JdkuJFqF6R
	 Kc7rt0SjDO/rHeSE/bH+x+4lcTWX4362FkfNrHMbgyu9N7/9Z1WCFAwLEyASzYLcMv3Fw
	 IBfVkeOcEC1BoHc9xGsLriDDcw0feEOVCteYfMuoKdJ0XVG0YM8WQAe49ObRdfWfDojH/
	 UNR1ij9XIsqbzg+UEqwmHuNpfujKcUO4Z95Adb8URhjThvsAdAErw0y0A/DCHo0BK7pzS
	 J6bkO6yJ9tDR8frdl9vXtPWnrZvwKC9s8PSA8vBIGAQsrphk3bm9G211u65zcAe08rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794116078;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=j4pNxTToGDL12GNjvn16GWkBSsKG7Fmeufu8AS4sAds=;
	b=GfEl/GI7HJ2s3YDUKzIuV/KCkqhNcoDhVHLpoWPsxVJ/za6nMdlY+yUcSfGwj5EWOeOA
	 Vm7dWjtAR3qhSsndKcK11IWN+hVGsob/Rn+U4jykcD+ofb1JyYcnGPZI09SGOGyqQo5a+
	 uj7NE7puuDqstkRMEFCYLOzCQ4J42PTXqvEwnpnRtt+1NcALr2gwWtjilBM+4AHDBIUWj
	 O0uyJlzT+gmntRx0Yb1bT2/yKFljOZ+YOJaD2fpWNunr1w/NojMl9y9EObPQZi4FZYz99
	 okSYocB6MzHPlQdHYY9txbB1ObCioiPLRKsOmK3YXIpOHxTMdQKxG9FCM/XVrZtPWog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE66606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e9eso283150b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794116077; x=1794720877;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4pNxTToGDL12GNjvn16GWkBSsKG7Fmeufu8AS4sAds=;
        b=Y2wb+hQkDMseCqnIqpZ/3/OBy2zFTMT4nTiynHJkeDGlqnFRGoBY0nnEcXnfHPSkdh
         HTgJ7VbJjHdJp/TlBwc5yJE6fbUSLQxO+XOYDZQxM8gpK3uAH5ujrwKALHecNfhdLi4w
         50P+VFXhCE68ZbIcas/tUovAtSMiMybg1yqfSh/nTTWQ0U4mKQCFvP6qVxb8XdFzeFS+
         IhfMf8SPnJmxlvGeHQ5d699Bu0S3bHg/bZI+tnGHkKG/QSuumzXyGz9k2boLLFZOvLR9
         zsLxMOukn0KzMI04BWPOzbDSpPxt1bbFc1wZPVWwYG3h0c4P5JawuPuDDHUqsCgEimPe
         SRkA==
X-Gm-Message-State: APuU4Z/JANiLkiMjt/CN4RPdt2vw64b5Q9V1sTkCDZjJTFMUePERtDyd
	EyQX8/2zXyQd6oQMz6SQGbnpwODQcwfvUnuYdST3qFlL78ucwgQGN2Zx670mdGHYDB2Hf2A27oA
	Zw0ZeJGzBRoL8LSpDB2EVwwnbdh/Wor4FVMwLXEyOudmT0DuL+APQdbIwDFY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3096:b0:4bb:ac05:9ebf with SMTP id
 5614622812f47-5681431e1dfmr543308b6e.14.1794116077059; Sat, 07 Nov 2026
 21:34:37 -0800 (PST)
Date: Sat, 07 Nov 2026 21:34:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af009ed.4dd4714a.f8d02.000d.GAE@google.com>
Subject: [syzbot] [trace?] WARNING in ring_buffer_nr_dirty_pages (2)
From: syzbot <syzbot+008851bf625629489e75@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, rostedt@goodmis.org, 
	syzkaller-bugs@googlegroups.com, vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d48723711bae Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1075efdd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d16c0eae9c338e3c
dashboard link: https://syzkaller.appspot.com/bug?extid=008851bf625629489e75
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/db075c0aa29d/disk-d4872371.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/68dc5cfbbb35/vmlinux-d4872371.xz
kernel image: https://storage.googleapis.com/syzbot-assets/044cdc896523/bzImage-d4872371.xz

AI-generated root cause summary:
ring_buffer_subbuf_order_set() updates the sub-buffer order by allocating new
pages, freeing all old pages, and pointing head_page, tail_page, commit_page,
and reader_page to the newly allocated pages. However, it fails to reset the
per-CPU buffer accounting counters (pages_read, pages_touched, pages_lost, etc.)
or invoke rb_reset_cpu(). When pages had previously been read from the buffer,
pages_read remains positive; subsequent event reads on the newly allocated
buffer further increment pages_read while pages_touched remains 0 (since writes
have not yet filled and advanced the tail page). This violates the ring buffer
invariant that pages_read cannot exceed (pages_touched - pages_lost) + 1,
triggering the WARN_ON_ONCE(read > cnt + 1) warning in
ring_buffer_nr_dirty_pages().

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=008851bf625629489e75

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+008851bf625629489e75@syzkaller.appspotmail.com

------------[ cut here ]------------
read > cnt + 1
WARNING: kernel/trace/ring_buffer.c:866 at ring_buffer_nr_dirty_pages+0x1c6/0x1d0 kernel/trace/ring_buffer.c:866, CPU#1: syz.9.1552/10668
Modules linked in:
CPU: 1 UID: 0 PID: 10668 Comm: syz.9.1552 Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
RIP: 0010:ring_buffer_nr_dirty_pages+0x1c6/0x1d0 kernel/trace/ring_buffer.c:866
Code: 02 fe ff 4c 89 f8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc e8 19 02 fe ff 90 0f 0b 90 45 31 ff eb df e8 0b 02 fe ff 90 <0f> 0b 90 45 31 ff eb d1 66 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90005caf880 EFLAGS: 00010087
RAX: ffffffff81c9d795 RBX: 0000000000000002 RCX: 0000000000080000
RDX: ffffc9001e6fa000 RSI: 00000000000000ef RDI: 00000000000000f0
RBP: 1ffff11027fc7a14 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed1027fc8423 R12: 0000000000000000
R13: dffffc0000000000 R14: 0000000000000001 R15: fffffffffffffffe
FS:  00007fbb96ae66c0(0000) GS:ffff888124811000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5b66f85ff8 CR3: 0000000036bc0000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 full_hit kernel/trace/ring_buffer.c:888 [inline]
 rb_watermark_hit+0x1e3/0x2d0 kernel/trace/ring_buffer.c:984
 ring_buffer_poll_wait+0x254/0x2f0 kernel/trace/ring_buffer.c:1141
 vfs_poll include/linux/poll.h:82 [inline]
 __io_arm_poll_handler+0x395/0xbb0 io_uring/poll.c:612
 io_poll_add+0x1a0/0x2c0 io_uring/poll.c:987
 __io_issue_sqe+0x180/0x450 io_uring/io_uring.c:1514
 io_issue_sqe+0x177/0x12a0 io_uring/io_uring.c:1537
 io_queue_sqe io_uring/io_uring.c:1794 [inline]
 io_submit_sqe io_uring/io_uring.c:2089 [inline]
 io_submit_sqes+0xea7/0x2500 io_uring/io_uring.c:2212
 __do_sys_io_uring_enter io_uring/io_uring.c:2903 [inline]
 __se_sys_io_uring_enter+0x364/0x1bb0 io_uring/io_uring.c:2852
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbb9888fb19
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbb96ae6028 EFLAGS: 00000246 ORIG_RAX: 00000000000001aa
RAX: ffffffffffffffda RBX: 00007fbb98b15fa0 RCX: 00007fbb9888fb19
RDX: 00000000fffffffd RSI: 0000000000000b38 RDI: 0000000000000004
RBP: 00007fbb98927b70 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000000004b R11: 0000000000000246 R12: 0000000000000000
R13: 00007fbb98b16038 R14: 00007fbb98b15fa0 R15: 00007ffd91292ae8
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
