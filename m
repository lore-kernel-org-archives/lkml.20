Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3497F35A384
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073077; cv=none; b=BBE74HRB4FVNA1Cmnsxltns3a98g7kCeGl/w43AeAP6d8eARYVSPI03H4/LByhMYzM+OVGbGGcQOQqwhfh3hBVmXjioWXRGXR4ct65grNwpE5RQVZ2KwMAXK0CDwsLY0MMxU+9m4IJg+G770mF09mNCq1v7hVlfzigx4k1gopcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073077; c=relaxed/simple;
	bh=4LQ45ROKFicGywgHZnayfDKGzyL13BwtJu+3YDuC35U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=H4pR20FIrn1ifyU1FdcioPocqptFMSuKg5IYc/5oECKfsGgivoc3+R0Q7P8yoJYijVVlLeAuUpcO5L9ZgqUPJiFYbjMaDcqJPcvKF6VeVDem6Cb/tZ/QOz446V+tb26pf+Eke6QEkPT51TxHy07m1pjFmwft1Ef8Ix7t4fDHRXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-6a3900cb2b5so93667eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073075; x=1789677875;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJIrG5q4v+dagYFthCDANA9DJ2ax6fUtO0FRB3AmB1Q=;
        b=GQzuxlw8WS5QGaXChKSYA7tOayCy2vMWHPrfGlZxC7uZFEB6Dy8vRWhryPbejRw7T1
         TaV5BSV96rrT1JNPdo3CRo+O/22Tez7D/WPYFTsisyjHM6Zuve450SeN8Wem9s8pP049
         a8kL3GzXLygRyW7rmoCaf9TRqXio/E/M2y8tz+GqSj3JUA4/qGIoatGFECpMN8vI9d3S
         wwEjtbTxsCq081RHnazaeurVuPgdmx73lsZwiTxxHpNHQSXF2mImyZJ16tXIspg8/ceI
         jGfV3UXsbukLK3HvGt9/FafGiflnTyAE8OnEc7wjX/hvtX9EH9RLrKj3YioDg9/Vwkr1
         oYVA==
X-Forwarded-Encrypted: i=1; AKwUvBz0Ao0DExtTdfzBq+L8y13P7CJWjEGdxO6STrEhcySQfaJyVLfm4HQvBIS5jhG8SfuD09hJQleLLo+Xpac=@vger.kernel.org
X-Gm-Message-State: AFuF++mb5f79p60O6b6YLETOdVAfOUpSJw1QtSUbgRzvSYwJJFHDNDNF
	uQfZjlwaTGzcwjNRMFTFykUhU53x7RQxYfZFpqDjHZK1JYB0q1/8wvp6sYPmj7MVevS8XX+zwIE
	bUkDjAvorZgAInTEoLCyQD5+meT6i0mgKvHxrITMu/BxM4WJpyds65olzTvI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b0e:b0:6b8:ef7d:e17e with SMTP id
 006d021491bc7-6c0bcbb6772mr452238eaf.51.1789073074993; Thu, 10 Sep 2026
 13:44:34 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:44:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa316b2.f81106d8.2ab401.0014.GAE@google.com>
Subject: [syzbot] [net?] BUG: using smp_processor_id() in preemptible code in sk_skb_reason_drop
From: syzbot <syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	nhorman@tuxdriver.com, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    50d05c7c76c9 Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1545c871580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=dc57fd6722deb17e92af
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f6fe01580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ab2c8e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7171282977df/disk-50d05c7c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/eb180d9b54d5/vmlinux-50d05c7c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ff1f279b8f9e/bzImage-50d05c7c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com

BUG: using smp_processor_id() in preemptible [00000000] code: syz-executor/5601
caller is net_dm_packet_trace_kfree_skb_hit+0xdf/0x350 net/core/drop_monitor.c:519
CPU: 0 UID: 0 PID: 5601 Comm: syz-executor Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 check_preemption_disabled+0xcd/0xd0 lib/smp_processor_id.c:47
 net_dm_packet_trace_kfree_skb_hit+0xdf/0x350 net/core/drop_monitor.c:519
 __do_trace_kfree_skb include/trace/events/skb.h:24 [inline]
 trace_kfree_skb+0x1d1/0x210 include/trace/events/skb.h:24
 __sk_skb_reason_drop net/core/skbuff.c:1231 [inline]
 sk_skb_reason_drop+0xdd/0x110 net/core/skbuff.c:1249
 tcp_data_queue+0xb80/0x5fa0 net/ipv4/tcp_input.c:5709
 tcp_rcv_established+0xe45/0x2910 net/ipv4/tcp_input.c:6689
 tcp_v4_do_rcv+0x959/0x13f0 net/ipv4/tcp_ipv4.c:1854
 sk_backlog_rcv include/net/sock.h:1192 [inline]
 __release_sock+0x28e/0x3d0 net/core/sock.c:3263
 release_sock+0x1be/0x290 net/core/sock.c:3862
 tcp_recvmsg+0x106/0x540 net/ipv4/tcp.c:2946
 sock_recvmsg_nosec net/socket.c:1153 [inline]
 sock_recvmsg+0x166/0x1e0 net/socket.c:1173
 sock_read_iter+0x233/0x300 net/socket.c:1242
 new_sync_read fs/read_write.c:493 [inline]
 vfs_read+0x59e/0xa90 fs/read_write.c:574
 ksys_read+0x156/0x270 fs/read_write.c:716
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f32ab5392d7
Code: 48 89 fa 4c 89 df e8 a8 56 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffceb322d90 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000555568ab5540 RCX: 00007f32ab5392d7
RDX: 0000000000000004 RSI: 00007ffceb322dec RDI: 0000000000000003
RBP: 00007ffceb323290 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000004
R13: 00007ffceb322dec R14: 00007ffceb322e80 R15: 0000000000000000
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
