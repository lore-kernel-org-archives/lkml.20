Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793331248;
	b=TmRXGc9mpBeKZF9OoYa/9u10wX2EErzeZ8pWAxEazmT14WT55R1hy6PnHKiWPepdAj5o
	 QbJvBsGSrDY1W5hIhm3q3FLg9A8e6RZmMuInPXhF+pM5UbCbUoaWV2Czsus+mudf/a1/w
	 9W6rqS+j6qlSa40Ml6IohI7ERkCE/VGF8D2WmoT6T/QNwokc2fH7wLblIot0DKcSYiii5
	 SaCNJIXz1/A4q84JGUhck25D9WSla7WF/tTq15n9ycCeVPViiPhbtfRnVPZ1RwhZGHn5R
	 RTip8E6qu7E3qlahORozLAikaiIXL4NwR8kJRWvnnsbkVHlWMUyWTqOiQCP5A7OqAZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331248;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Vix3fmD5B1RoXCv2Tg2/yNFH2E30GjPKB1m+XBLjNCc=;
	b=mkez1sp9MJWjSzUrRw8QwZnUcJXwAIFRwAMfrc0y/RcMqornPbhxqeTx+PoqYcVmk2YM
	 T01oOqUtihKHuG3l/wWWoDtm3K0xMfZnceIqD2gH6j607z0rEu9Uw7VKeZI2BUHX7ClUU
	 /TZ3AKDgFLDNNz3WV2Ak/bowMeLR3FFVgiRf2QC+AFDdBBgHtre2C3xw74S0tEZ1rSucT
	 O+ESSrIljpJQYLatLtgwfMXISFi+dBEz72fLfgBuNV9yCDiv/kGuKUN0g8PUQ1WTwpQmL
	 qnUV+qqi5j/V3kPKn7OlY9dIGi2vY2/WZswpOT3e+LSdPaLhAtCKjkqCXZW/zTKBeEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D781606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D781606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-540537f959fso397558b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793331246; x=1793936046;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vix3fmD5B1RoXCv2Tg2/yNFH2E30GjPKB1m+XBLjNCc=;
        b=0zM4WbPS/eOECulHiJjZzhMNOeLR4kJ/VBUoYEcV7YCu2Q5YqbL5eddvSXPZw3oyRC
         8/M5KGD6U6XVSldvELdgRMrEGFBi7E9zmt+L6jAem1TxDHy+NCK8GnJFE7uPxdkVKYhs
         c8tv9N1AfKg9YSlkaZ7eSoNSlsbnRFv2ir7kpw0xARvlSsmWEb34ooVaKE43j7aKO3Km
         qYtpq910KxYhH3dOgCJCX6XPwG41e8wHWWMj4aCGc/SiOBy/901+f7woPj5QCpPQJKvQ
         wpk2Y/2br16pXljvjEwiL6l4z0c3X4QuKjGRL+dpk8IbN2JdbWox5KDyRtv8rmS7VDlh
         iyzw==
X-Forwarded-Encrypted: i=1; AKwUvBzJXL5zCu2tbt/mi0GKWQxGKxY+MfS1/roZuc8ymPB4OV47QxziUK1CzyPuY4IbMhuLgxnGYw0GtJKrLEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP8nsWWWfGBalFfVbNxbWzspvym/avdhiEIwzVso/QQU473/M9
	SNFYWnyb0f0sz41y3trDFzChfzPC4dkdIsIt9UinqVtdZ7N/lgMUhg7ponTYXNlcKheVULQxDyK
	OS84mJKT56vRh8LYx8OEqre6u4zbP8ugQZhyXzdwQycBLO4S+URBauAjNS0M=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2396:b0:53f:3c0e:c74b with SMTP id
 5614622812f47-5640d91a298mr938755b6e.9.1793331246705; Thu, 29 Oct 2026
 20:34:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:34:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae4102e.9c6421ad.36baac.0005.GAE@google.com>
Subject: [syzbot] [net?] memory leak in build_skb
From: syzbot <syzbot+a3f21220cbbb6e14ee2e@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	jasowangio@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    65ba8f34ec88 Merge tag 'xtensa-20261027' of https://github..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1592353e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fbf447a1375a1948
dashboard link: https://syzkaller.appspot.com/bug?extid=a3f21220cbbb6e14ee2e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142ee469580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b4e738ce5f2b/disk-65ba8f34.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1de9d1ecbbb6/vmlinux-65ba8f34.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8a3d79b65181/bzImage-65ba8f34.xz

AI-generated root cause summary:
In IPsec IP-TFS (XFRM_MODE_IPTFS) processing, when inner packets (including the
reused outer skb) are parsed and added to a temporary local 'sublist' during
__input_process_payload(), any error encountering invalid header data or
truncated payload jumps to 'done:'. At 'done:', packets on 'sublist' are neither
delivered nor freed, and the reused outer skb is neither placed in 'defer' nor
freed by kfree_skb(), permanently leaking the sk_buff and its attached sec_path
extension.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=a3f21220cbbb6e14ee2e

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a3f21220cbbb6e14ee2e@syzkaller.appspotmail.com

2026/10/28 09:56:01 executed programs: 5
BUG: memory leak
unreferenced object 0xffff888104c73c00 (size 240):
  comm "syz.0.17", pid 5970, jiffies 4294947974
  hex dump (first 32 bytes):
    90 38 1f 02 00 c9 ff ff 90 38 1f 02 00 c9 ff ff  .8.......8......
    00 00 6a 24 81 88 ff ff 00 00 00 00 00 00 00 00  ..j$............
  backtrace (crc 84fdfeb5):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4733 [inline]
    slab_alloc_node mm/slub.c:5033 [inline]
    kmem_cache_alloc_noprof+0x35b/0x3e0 mm/slub.c:5047
    __build_skb net/core/skbuff.c:495 [inline]
    build_skb+0x25/0x120 net/core/skbuff.c:511
    __tun_build_skb drivers/net/tun.c:1631 [inline]
    tun_build_skb+0x489/0x770 drivers/net/tun.c:1726
    tun_get_user+0xd2e/0x2040 drivers/net/tun.c:1860
    tun_chr_write_iter+0x71/0x120 drivers/net/tun.c:2100
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ae/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888104d139c0 (size 192):
  comm "syz.0.17", pid 5970, jiffies 4294947974
  hex dump (first 32 bytes):
    01 00 00 00 00 02 00 00 00 00 0b 00 00 00 00 00  ................
    80 9f 7b 24 81 88 ff ff 00 00 00 00 00 00 00 00  ..{$............
  backtrace (crc 420634a7):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4733 [inline]
    slab_alloc_node mm/slub.c:5033 [inline]
    kmem_cache_alloc_noprof+0x35b/0x3e0 mm/slub.c:5047
    __skb_ext_alloc+0x1a/0x50 net/core/skbuff.c:7246
    skb_ext_add+0x1a6/0x280 net/core/skbuff.c:7350
    secpath_set+0x7c/0xc0 net/xfrm/xfrm_input.c:127
    xfrm_input+0x381/0x28a0 net/xfrm/xfrm_input.c:571
    vti_input+0xf4/0x160 net/ipv4/ip_vti.c:69
    xfrm4_esp_rcv+0x46/0xb0 net/ipv4/xfrm4_protocol.c:104
    ip_protocol_deliver_rcu+0x259/0x260 net/ipv4/ip_input.c:207
    ip_local_deliver_finish+0x115/0x1e0 net/ipv4/ip_input.c:241
    NF_HOOK include/linux/netfilter.h:325 [inline]
    NF_HOOK include/linux/netfilter.h:319 [inline]
    ip_local_deliver+0x97/0x140 net/ipv4/ip_input.c:262
    dst_input include/net/dst.h:481 [inline]
    ip_rcv_finish net/ipv4/ip_input.c:492 [inline]
    NF_HOOK include/linux/netfilter.h:325 [inline]
    NF_HOOK include/linux/netfilter.h:319 [inline]
    ip_rcv+0x212/0x230 net/ipv4/ip_input.c:612
    __netif_receive_skb_one_core+0xce/0x100 net/core/dev.c:6405
    __netif_receive_skb+0x1d/0x80 net/core/dev.c:6518
    netif_receive_skb_internal net/core/dev.c:6604 [inline]
    netif_receive_skb+0x49/0x200 net/core/dev.c:6663
    tun_rx_batched drivers/net/tun.c:1575 [inline]
    tun_get_user+0x1ccc/0x2040 drivers/net/tun.c:2053
    tun_chr_write_iter+0x71/0x120 drivers/net/tun.c:2100

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
