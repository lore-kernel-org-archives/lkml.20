Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794615781;
	b=qPSRbp7WxGLX2en9J20No57q+j6EhH3zzdaM/8jGFjqiUJ/gMKFjfAXS7FjBTm89pznS
	 YwRpkHAmq/VbTIo1Nmg6rJH+FwbVkgOR3aLgpN2jZgqhqLhb0Rz16cBOii97tQXkPnJcq
	 Eq+ngg52oWxtUG1T94vsP5u8Ip2y9lXBp9jr4bL0hEU6xhpmhsS9r9z5cc/dpoDVjJXmz
	 h7BNQS3394VxrdYfL46KTr5ShrWRYveKkWAzhBPJR9x9JAHCfJVb2N//ZU2KBF9MVv9yR
	 X1YqNOoPub+6akH+idNBLAqcR4AXyL06+671HGofqIqPzgM7xoP/aq7yHh/uu7BIcwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794615781;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=KH4FqHRRPkaUzPXBlL7FuVKAgCFrwQWnlweUMoj5tUY=;
	b=ob2S0pHYV93anTdCb2amzfTYr3aBa+3wSXEfnZc3xa0LYCsz6q5SNWNxhKMBhokkUASq
	 +lwO01MSskTzrHJxMlhj9OnVm8CR4uVjs2Oj2M58mx6eQY1kETUGVqPSXrjk2GJWXdliE
	 DouPY8fWhTGlPg3TnZwaUvHVWXhuj229333GO+sXD9OJ4O/2zdlavvCZeiHVBw2R2XiYm
	 7D19SI83p5Y1g23jPCqqh/+uS9HHmeqcehzDbXqFxW4k/6t1qoAqYOb/LCpjP3t0CZm5j
	 YRyqrOE8iCpGedmvLmSU/j9TH/t1JN9sFUqMOM1WYKtwCqarSjF0HslnwqJBeTN78lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D932B606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D932B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2046684b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794615780; x=1795220580;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KH4FqHRRPkaUzPXBlL7FuVKAgCFrwQWnlweUMoj5tUY=;
        b=WWLoEc/NVQR0HgrU2fy05uKIQnqrbkdcO1/wmEEVKJRfgheF1AHvR0TdnCZZYLROcV
         IRNIB+f5tyqPQ4Y0wXZ7buyrI2agHbVHsW5dShWU30mzQkzSnSuscy1xB3YFzPt0sW7+
         zD9q9gl6e/YlYyyEMPjQcOVGy8d6nBkUMqsIUbLirvHPlsNK3R0AYymSyQyz2p1cSu6c
         xano4zWpGRuVLlwvO/bDSYLNcv7xFvKkSu/VEmTuiveVm6iCDQkONFxV8vZOd3ooBTqt
         hVlT96Fbn8wnERYwmsnol2rGzzsSFcYkOokqGAQTrhmfI/fVnoisOxZcbbgLBpfl72Fh
         rUnA==
X-Forwarded-Encrypted: i=1; AL+hErGbeUW0EiXj4Y6NHgCj63WDh6bG2t2NVLmtN5RXHupHaDhPUiJqqFcE5YRC4mHuzzw4n3taFf1roPSHIyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tZlsT/LMt7/F+4LngtMA8wet0VBuKQBKL0I+qlGWeSF9PiVJO
	GV3G8CbzoTeu32PIyJN31dpj/fYkt30I1F2ANV8R1U2E+E1Icldkzpu4iiVQ8i+JCIAUnFCPrSI
	bQKAMbpBdhMQKVGGxT48KJ/YJuwkp/hBdLgqMyhmTdIJZpWyGiSb0+0uFLMk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f2b:b0:4d6:9153:2965 with SMTP id
 5614622812f47-56e6541434amr3703135b6e.54.1794615779864; Fri, 13 Nov 2026
 16:22:59 -0800 (PST)
Date: Fri, 13 Nov 2026 16:22:59 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af7a9e3.ff6dfe28.557e.002d.GAE@google.com>
Subject: [syzbot] [net?] WARNING in xfrm_output_resume
From: syzbot <syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@kernel.org, herbert@gondor.apana.org.au, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, steffen.klassert@secunet.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7475ea8b5861 Linux 7.4-rc2
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=177f9fe1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d44b06612b68f56
dashboard link: https://syzkaller.appspot.com/bug?extid=622de7e1f18a30fc404a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1338e03d580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11877f8d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1dc544ec8515/disk-7475ea8b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6fb265017368/vmlinux-7475ea8b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5f78347f28bf/bzImage-7475ea8b.xz

AI-generated root cause summary:
IP-TFS (net/xfrm/xfrm_iptfs.c) registers iptfs_output_collect() as the
dst->output handler for XFRM IPTFS mode to aggregate outgoing packets onto
xtfs->queue for delayed transmission via an hrtimer (iptfs_delay_timer()).
Packets delivered to dst->output can carry an unrefcounted, RCU-protected
destination entry (SKB_DST_NOREF). Because iptfs_output_collect() does not force
a refcount on the dst entry with skb_dst_force() before enqueuing, the SKBs
retain an unpinned dst pointer after the caller's RCU read-side critical section
completes. When iptfs_delay_timer() subsequently dequeues and transmits the
packet via xfrm_output() in softirq context without rcu_read_lock(),
xfrm_output_one() invokes skb_dst_force(), triggering
WARN_ON(!rcu_read_lock_held()) and risking a use-after-free if the dst_entry was
freed during the queuing delay.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=622de7e1f18a30fc404a

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com

------------[ cut here ]------------
!rcu_read_lock_held()
WARNING: ./include/net/dst.h:326 at skb_dst_force include/net/dst.h:326 [inline], CPU#1: ksoftirqd/1/24
WARNING: ./include/net/dst.h:326 at xfrm_output_one net/xfrm/xfrm_output.c:549 [inline], CPU#1: ksoftirqd/1/24
WARNING: ./include/net/dst.h:326 at xfrm_output_resume+0x41d9/0x64e0 net/xfrm/xfrm_output.c:597, CPU#1: ksoftirqd/1/24
Modules linked in:
CPU: 1 UID: 0 PID: 24 Comm: ksoftirqd/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:skb_dst_force include/net/dst.h:326 [inline]
RIP: 0010:xfrm_output_one net/xfrm/xfrm_output.c:549 [inline]
RIP: 0010:xfrm_output_resume+0x41d9/0x64e0 net/xfrm/xfrm_output.c:597
Code: be b4 01 00 00 48 c7 c2 20 fd 53 8d e8 f0 05 07 f7 e9 aa fc ff ff e8 96 b1 2b f7 90 0f 0b 90 e9 7e ed ff ff e8 88 b1 2b f7 90 <0f> 0b 90 e9 44 e0 ff ff 48 89 df e8 c7 3c 52 fa 84 c0 0f 84 e1 00
RSP: 0018:ffffc900001e7660 EFLAGS: 00010246
RAX: ffffffff8a9d6fa8 RBX: 0000000000000000 RCX: ffff88801f2f5dc0
RDX: 8000000000000100 RSI: 0000000000000100 RDI: 0000000000000000
RBP: ffffc900001e78f0 R08: 0000000000000100 R09: 1ffffffff237c017
R10: dffffc0000000000 R11: fffffbfff237c018 R12: dffffc0000000000
R13: ffff8880243df198 R14: ffff888021b2b210 R15: ffff888028e9a780
FS:  0000000000000000(0000) GS:ffff888123509000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f781b792e9c CR3: 000000007dcea000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 iptfs_output_queued net/xfrm/xfrm_iptfs.c:2325 [inline]
 iptfs_delay_timer+0x3803/0x4310 net/xfrm/xfrm_iptfs.c:2362
 __run_hrtimer kernel/time/hrtimer.c:2079 [inline]
 __hrtimer_run_queues+0x3bc/0xa10 kernel/time/hrtimer.c:2136
 hrtimer_run_softirq+0x1e3/0x2e0 kernel/time/hrtimer.c:2153
 handle_softirqs+0x265/0x8d0 kernel/softirq.c:669
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1133
 smpboot_thread_fn+0x5f8/0xb30 kernel/smpboot.c:162
 kthread+0x38b/0x480 kernel/kthread.c:436
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
