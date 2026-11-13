Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592306;
	b=B5ItEk7ZcnoYcnG3dxQ2aTwKXXcI/6aTY13DD87xXYWFu/EiNGdyV1BnRfXahupriA7Z
	 RQXZLAPQGryYtjZxpa2EOuZ9UkTdh+cMLGRNysYt9Eja3EvUeSi34dx6/ysGaDux2hUOa
	 7NLRKp/9Bb5EFRYrZhhDe4+rnIoGi8YT1hFUoLQdpZ3LGAIb4eLq4cIgCFc9A3BQ52UFJ
	 SU3YUCUj/7OxWYXvGdEsIzAlSJuddlYZUajdQfacB+X/WiJHEO0l+bkkDatYwpFIlhZea
	 HoRfY65ywRISdB1Ur8eeaelhh0VKfDTxQ1xW8tGJfOYINOkiKpkKcRWv3CcWMjmL9+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592306;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=HDX9FP/gCkD0XZlrFX1/lXfJC5c3lZl1P1CF0qtfO9A=;
	b=Bkr3FidFcf9f6ZIFwOM14mRgmeexkXrC+EaK71AEehUPEdiRhOcVfEjPnUhC1Dwnl+ZH
	 /Zp2EXeAQG3M5ATRbjN0SjKwGq9e6nltcB9W8hS+RMxfr01XsmSWG6EjXsNT9MxJDW3e0
	 /yDCsLid3E56ODW57cDx4yZoBFrMxKRYD3qv+JINh6omKwXaK5HpR/HsPAIkAsP5QoMt0
	 bKCufuEpIvyGaruMH0rlj6/vzxEvAx1ISIyjpnt2Ke/oCS3bQ6iclx6TgY1ZlPPUhyghE
	 L41qMSi8Ouk0rlUIQXNr43Qm6cji+rgTYqhoakyJ9/KsgebIo17O0OX50cKNmIBC7tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B7606D4B5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329B7606D4B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-81b20bea169so736300a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592305; x=1795197105;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDX9FP/gCkD0XZlrFX1/lXfJC5c3lZl1P1CF0qtfO9A=;
        b=G84GYxXMd+65NcjLcGV7Es0canEHxxfZZAavb9WjPItXXGKiCQ76VGu655v+r3kDng
         tlBdVoMfs+NlETlafMxCta+1DsvHUlHpEFDI/5IQgR68Pc8JyXvs9i4K9b/0Hv0j9Qb4
         CGH7jKFjtlbjQf2wVgUvWw63ZmW2bY4Ccc6CZWjHkRGrQDoxlnVLYNShRuo+XMMO4QL7
         j2OnL4z6w5rua3E1Ml2KJB6X+idRlQqFlzOyH3Ly0g79X6YiQ6QLLwnLEbBbktEo/xab
         aUH+b9oi1f6UzScFqpPDUJ8hLKA76m+EZ5o7QEHd7KwmADkIxED2X7GKuo4u6ZsYgPAJ
         /sBA==
X-Forwarded-Encrypted: i=1; AL+hErFRpQEgrnHNGZKA1rpdSC7c1SqfK63pY6+7TKetrz6wxIERpXDGQDG5eyEHJKDDacHvQxV1k8JJ6LBT78g=@vger.kernel.org
X-Gm-Message-State: APuU4Z++TYi2YjXDIGjHLI/b9C7wGGwd25py1ege3y+sBKxlM+fGpPo3
	7z/G2Irw+VXi+J2rPi3d2TlHYENlZWG/kXFP9ZZ1rsNzQXlyxmWHXL1TFIa9MOkaQX5djT3pmrB
	lnHxFd3MWy1UDrgUKoWdhQTVOmIIw15j+maVMT1O/7FafbTpmP+4pDe9wf8Q=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:238a:b0:4f1:6ab6:8fc0 with SMTP id
 5614622812f47-56e642d0ae8mr2617802b6e.15.1794592305279; Fri, 13 Nov 2026
 09:51:45 -0800 (PST)
Date: Fri, 13 Nov 2026 09:51:45 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af74e31.fe96acdb.12252b.0009.GAE@google.com>
Subject: [syzbot] [net?] [usb?] memory leak in ndisc_send_rs (4)
From: syzbot <syzbot+bf62ca9997f43d2fa521@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, idosch@nvidia.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9d66f26fefac Merge tag 'vfs-7.4-rc3.fixes.2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=136da9ea580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4361b1bb937ae1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=bf62ca9997f43d2fa521
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12e9ba09580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/292d4fa72c6e/disk-9d66f26f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/78e602f24eea/vmlinux-9d66f26f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/802a7b846686/bzImage-9d66f26f.xz

AI-generated root cause summary:
In drivers/net/usb/hso.c, hso_net_start_xmit() takes ownership of an outgoing
packet by stashing it in odev->skb_tx_buf when hso_get_activity() returns
-EAGAIN (e.g. when the USB device is suspended, disconnected, or not
configured). However, neither hso_net_close() nor hso_free_net_device() frees
odev->skb_tx_buf prior to unregistering and freeing the net_device. When a
packet (such as an IPv6 Router Solicitation generated during interface
configuration) is queued during device disconnect or suspend, the sk_buff and
its allocated head buffer are permanently leaked.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=bf62ca9997f43d2fa521

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bf62ca9997f43d2fa521@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888100e9f200 (size 240):
  comm "kworker/u8:2", pid 5708, jiffies 4294993435
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 f2 e9 00 81 88 ff ff  ................
    00 20 bd 23 81 88 ff ff 80 31 48 02 81 88 ff ff  . .#.....1H.....
  backtrace (crc 28f53d77):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4733 [inline]
    slab_alloc_node mm/slub.c:5033 [inline]
    kmem_cache_alloc_node_noprof+0x368/0x400 mm/slub.c:5105
    __alloc_skb+0xdc/0x4e0 net/core/skbuff.c:705
    alloc_skb include/linux/skbuff.h:1390 [inline]
    ndisc_alloc_skb+0x46/0xf0 net/ipv6/ndisc.c:421
    ndisc_send_rs+0x49/0x2f0 net/ipv6/ndisc.c:708
    addrconf_dad_completed+0x1f9/0x6c0 net/ipv6/addrconf.c:4422
    addrconf_dad_begin net/ipv6/addrconf.c:4184 [inline]
    addrconf_dad_work+0x5c8/0x910 net/ipv6/addrconf.c:4289
    process_one_work+0x2b7/0x5c0 kernel/workqueue.c:3495
    process_scheduled_works kernel/workqueue.c:3578 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3659
    kthread+0x150/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888106538b00 (size 704):
  comm "kworker/u8:2", pid 5708, jiffies 4294993435
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    60 00 00 00 00 08 3a ff fe 80 00 00 00 00 00 00  `.....:.........
  backtrace (crc 261f6968):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4733 [inline]
    slab_alloc_node mm/slub.c:5033 [inline]
    kmem_cache_alloc_node_noprof+0x368/0x400 mm/slub.c:5105
    kmalloc_reserve+0xd2/0x1b0 net/core/skbuff.c:616
    __alloc_skb+0x15d/0x4e0 net/core/skbuff.c:716
    alloc_skb include/linux/skbuff.h:1390 [inline]
    ndisc_alloc_skb+0x46/0xf0 net/ipv6/ndisc.c:421
    ndisc_send_rs+0x49/0x2f0 net/ipv6/ndisc.c:708
    addrconf_dad_completed+0x1f9/0x6c0 net/ipv6/addrconf.c:4422
    addrconf_dad_begin net/ipv6/addrconf.c:4184 [inline]
    addrconf_dad_work+0x5c8/0x910 net/ipv6/addrconf.c:4289
    process_one_work+0x2b7/0x5c0 kernel/workqueue.c:3495
    process_scheduled_works kernel/workqueue.c:3578 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3659
    kthread+0x150/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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
