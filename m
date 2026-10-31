Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465482;
	b=KTIVgpIL3A+wwhF8Ae+XdkcCI27c1VclbE8SJH63hZiiy6z46CLvfOcQUcQzFgTaz0py
	 NX1Lsb7WGsGmuQ2AIsqiF5j//QqYoBWoKUgRgcma44egm0e20IYxrXbYXSCSDkNrVdIT+
	 6ydW62MoRbuZ9384rQme4SJMqWEAt4r3NvJC6jIr1cRPFaxSLROKuPWnNB2bxIazB3USn
	 QQv96kxEdo6JeJKVxJDt7XNHRzPParAQaVbB+bGD3RexhlC98a9Qb6iZu2H/2u2g2VxF/
	 PX5d8aT3+1uz2RBvNbg8N1hUVdl0viFXoSc0XLyfnIB3nDEtzDYrICbHPUaSEzsJi4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465482;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=ZccZDmwpaj/O6pbTWegE+l+s9MNeeSWtqXGKbSCxwYE=;
	b=jMmOaqgAxUvX2DXpMXjM+CynPcdYMuSwGeEulVBd4cmn4G1hcJihgSWT/EQHVr5iTjWH
	 itYyS32zjd8QI7J0Q4plhOYs53KgetjOm58RDRJggG4AF//Wzxv6YOWvWN6F9LCBSUUJg
	 VL1710lRFeNzZ99lpZK5Xpa8vQSxDiaxQmg4zqygF7j3r4FvSW/aiYdKGYMF7klqMGeFs
	 BBSHkCQhF1m6nAipchFkZQagsabrrtSXvrnELVAEpZ+kZJ0k2LLs3znGWzLvoJs5sYPR0
	 pmfUd+8a+eV+4EyY7MpZgPJsKzhVx8KxRPPzz+Vi3D9x/f/7F1LGoFA3A2jvBGm2XTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8E606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F8E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a7de733fa9so2602132b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465480; x=1794070280;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZccZDmwpaj/O6pbTWegE+l+s9MNeeSWtqXGKbSCxwYE=;
        b=yLSsPNIc7L2seepSXUWiWuGyaeVd+cEVAZo1cfr3uJiWBx/mRTLOz3u9kp5WRlU+Kv
         8LrB1fx2WmCmSxg1QpCW+8tvx5SPxoXrzJdc3UZil17357HFNW6uPKmHCBX3JMzqWg7V
         qGV6Bya907laOvYZuWnJOaHBJvlzhdNONhnVsJpn6ZyRcvVXVADff0JjP7Qo1Ftze0yH
         yC908C5PTx2uxE4RsNZ6LpJzjyDpKYo2kJas5CY7aMSjW0M8xPV2zopTWfZL8LTvHwJI
         6VyHnsKjFvSsKWLN0COT+D3qw3jnp7jlCcb0XlodSTA5dTN4usrQIgQix0AOd7IKgY/n
         BKfw==
X-Forwarded-Encrypted: i=1; AKwUvBwrb2saOYj8pZ1abXiqOwBWWkGLKC2FtAHU2uhb7KR/FZPkA/ew17m0DPVs7trWCZThDmVA7oeA5wI5ICo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4AsTaYYk2isUWDM8A7wLoWn/eWxbdVfHFir6j2gGcL8a6N5pN
	YCjAujn8xMpWO85cKeeoer9+fb55Ku0cBReaOX8LQAyz0lF89t2x11HZE8w9zCG8Q84IkLt4aaY
	5+buXboXVtLdS/AMMfxoJg5aKG/MlSMF7KnvBcVncymc/EVwSw+gw36yR05M=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3206:b0:4f7:d324:bc3a with SMTP id
 5614622812f47-5640ddfb115mr4220012b6e.18.1793465480685; Sat, 31 Oct 2026
 09:51:20 -0700 (PDT)
Date: Sat, 31 Oct 2026 09:51:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae61c88.6552420f.2a0efc.0003.GAE@google.com>
Subject: [syzbot] [netfilter?] WARNING in nf_flow_offload_gc_step
From: syzbot <syzbot+e1a88d8b7e4cf6b51d85@syzkaller.appspotmail.com>
To: coreteam@netfilter.org, davem@davemloft.net, edumazet@kernel.org, 
	fw@strlen.de, horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, pabeni@redhat.com, 
	pablo@netfilter.org, phil@nwl.cc, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d135ab453a74 Merge tag 'backlight-next-7.4' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a51259580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6f2905533069b0f5
dashboard link: https://syzkaller.appspot.com/bug?extid=e1a88d8b7e4cf6b51d85
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14020995580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=100c4f0d580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-d135ab45.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6c39e8158fba/vmlinux-d135ab45.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7fb9f97c1f88/bzImage-d135ab45.xz

AI-generated root cause summary:
In the Netfilter flowtable subsystem, nf_flow_table_extend_ct_timeout() only
accounts for IPPROTO_UDP and IPPROTO_TCP when refreshing conntrack timeouts
during garbage collection. However, both tc act_ct and nftables flow offload
support offloading IPPROTO_GRE connections to the flowtable. When the garbage
collector checks an offloaded GRE connection whose timeout has dropped below
min_timeout, the missing case in nf_flow_table_extend_ct_timeout() triggers the
default: WARN_ON_ONCE(1) branch. In a production kernel without panic_on_warn,
the warning does not crash the system and no memory corruption occurs.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=e1a88d8b7e4cf6b51d85

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e1a88d8b7e4cf6b51d85@syzkaller.appspotmail.com

------------[ cut here ]------------
1
WARNING: net/netfilter/nf_flow_table_core.c:553 at nf_flow_table_extend_ct_timeout net/netfilter/nf_flow_table_core.c:553 [inline], CPU#2: kworker/2:2/1358
WARNING: net/netfilter/nf_flow_table_core.c:553 at nf_flow_offload_gc_step+0xd84/0xf60 net/netfilter/nf_flow_table_core.c:593, CPU#2: kworker/2:2/1358
Modules linked in:
CPU: 2 UID: 0 PID: 1358 Comm: kworker/2:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: events_power_efficient nf_flow_offload_work_gc
RIP: 0010:nf_flow_table_extend_ct_timeout net/netfilter/nf_flow_table_core.c:553 [inline]
RIP: 0010:nf_flow_offload_gc_step+0xd84/0xf60 net/netfilter/nf_flow_table_core.c:593
Code: f8 e9 82 fd ff ff 4c 89 f7 e8 28 e1 6a f8 e9 12 fc ff ff 48 c7 c7 80 f2 c0 8f e8 17 e1 6a f8 e9 ae fc ff ff e8 1d cb f1 f7 90 <0f> 0b 90 41 be 01 00 00 00 e9 7d fc ff ff e8 09 cb f1 f7 48 8b 04
RSP: 0018:ffffc9000618fa88 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88803e161380 RCX: 0000000000000000
RDX: ffff88802c392580 RSI: ffffffff8a1c51f3 RDI: ffff88802c392580
RBP: ffff88803e161488 R08: 0000000000000001 R09: 0000000000000011
R10: 000000000000002f R11: 0000000000000000 R12: 1ffff92000c31f56
R13: ffff88803818f868 R14: 000000000000002f R15: ffffffff8fc0f280
FS:  0000000000000000(0000) GS:ffff8880d469c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000012000 CR3: 000000002f277000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 nf_flow_table_iterate net/netfilter/nf_flow_table_core.c:459 [inline]
 nf_flow_table_gc_run net/netfilter/nf_flow_table_core.c:616 [inline]
 nf_flow_offload_work_gc+0x11e/0x1e0 net/netfilter/nf_flow_table_core.c:624
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
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
