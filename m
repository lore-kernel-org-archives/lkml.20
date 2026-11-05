Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877044;
	b=1tHCWok1PXLh73KKiuQx2YaYWy3T5e87MsBK1TT7gsWkRBePrERHn1pofo6ieIh5ZaKG
	 95Wpxr6oZNIKITzqBVcNMyo7ewsRI4ZBPO3hmRxqmFOvluYnYYqJt8ixPQcEaU3y728JG
	 i3Cn2K48iZYN+xDTogzjKFMyGnf+PYIuhjXNO4rOaHaG00jkPVY/dim6uVXyUF0Cas2yY
	 gRN/M3Cf9GVd6A0gPtTQL0KkQwfI0HEMqas+hHFUahT343wabvD6TUgw3+1UmajaILeN3
	 sXIiom2wUOGn6+KqT3r2TcE3/Cci2szNJHtth0FJqPtNeFpQXcvRxyNics5dHi2dlSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877044;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=QOIwjIRpeVDqlXAgbw2FLrO0KLt63dq5HpsWbh7v4l4=;
	b=scXArT6hPfzROLZAJT/y9reh77iiBj3236j5ZjK/gKb4OV26nv/9bqxraqlNrf14imDX
	 eE8OUtCe63CWvywezMEZHPr9PjqRtc+cPqQAlxpErJcL9utEqYvLT/zafINjgV3vyiP/k
	 jJCJn0flPBlw4CveQ49qCEvBLguQJhyVWElAnCVLQ0xAx0V399GE0CBiy+/U1u7O5U1Zw
	 Zjdl9ZZQJG1KT2b7zg2Y9VOt1k9jJGaRyRKOp+41Y3DOIdY/LNegSc6vfi9EVe2v4nGnV
	 tny3IBz+02QPticWnccIW2oePoxJba+N/wPLlFs19AzVYfoNG+AAPMIrThrym0lAziQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611D0606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 611D0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-54dbbf252cdso2508091b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877043; x=1794481843;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOIwjIRpeVDqlXAgbw2FLrO0KLt63dq5HpsWbh7v4l4=;
        b=LLVMRV82Rt1LemXm9mEkw2MrdWq3IZqzJ7v3Z/EzInTilDEgGgUyG2e56v2jzqAT44
         8uyagf2XMRZzJStc7TulNSG+y7u4u9hofES02VSa6djuSQoOb7S9BOVOE25UOTAk+HpC
         cbttsHFOML9I+TVNkN8v2cYgS6juwVydkkfXU/BIJqewLKSUZTQGb1f2C5nGn1hvHeLi
         ScfY4g0RgHvivgDSzJz/LSNSutL1TbelZooeeN0Ph6jqfdAb3UFKZJwBrs+heceRL5zt
         zh8elF+lD9vuaJt4xVBBtm+JXjj1VHi+uIzQjxCowDZvtcmmi+c8zqPyUD8jMknQ4Q7A
         QI7A==
X-Forwarded-Encrypted: i=1; AKwUvBx0bUkJKAa/C+gizt38pPb8YI8Ntsa+pRmlTur6damDVHqabvsaA6Uo6WTu6lhIUf2nTkk3RNCaXsfL0a8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+prLtquomnOGKke/sn8t3szCi8vgLYiIp1lxy+dl9+yv9N8N8A
	K4ZGABT8c9WOo59V+gPKi8OGQRf3pbWY8tBId1GHNC+ZiHN4qbPSulZWtV/EeG9mAI8XW8oNq4s
	Cx5D0i7jDzrDHFugaOUYsQyjWGQ9gF2VBdmOeJ2BdBpEtj2x+fpvkKKnlUSo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1783:b0:4fb:ac9b:b06a with SMTP id
 5614622812f47-5640de0fc9emr14499827b6e.48.1793877043501; Thu, 05 Nov 2026
 03:10:43 -0800 (PST)
Date: Thu, 05 Nov 2026 03:10:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec6433.0ce67c00.35143.0002.GAE@google.com>
Subject: [syzbot] [rdma?] [f2fs?] memory leak in radix_tree_insert (3)
From: syzbot <syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, jgg@ziepe.ca, leon@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6628e7d4c6b2 Linux 7.4-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149fc6b1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=441b6cc593d83cc4
dashboard link: https://syzkaller.appspot.com/bug?extid=d60be66dd00b4490fa96
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1613be2d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bd1857dac9bc/disk-6628e7d4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0750834263ca/vmlinux-6628e7d4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ef4090776a72/bzImage-6628e7d4.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/b8af1c9e7f1c/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=16e69cdd580000)

AI-generated root cause summary:
In lib/radix-tree.c:__radix_tree_create(), intermediate radix_tree_node
(xa_node) structures are allocated and linked into parent slots as the function
descends through tree levels (shift -= RADIX_TREE_MAP_SHIFT). If a subsequent
node allocation fails with -ENOMEM before reaching the leaf slot,
__radix_tree_create() returns the error immediately without unwinding or
deleting the newly allocated empty intermediate nodes. Consequently, slot-based
iterators such as radix_tree_for_each_slot() used during cleanup (e.g. in
uverbs_destroy_api() -> uapi_remove_range()) never encounter the empty nodes
(which have count == 0), causing those radix_tree_node objects to leak when the
containing object is destroyed.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=d60be66dd00b4490fa96

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810d78f488 (size 576):
  comm "syz.1.32", pid 7505, jiffies 4294948085
  hex dump (first 32 bytes):
    0c 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    40 e5 f3 11 81 88 ff ff a0 f4 78 0d 81 88 ff ff  @.........x.....
  backtrace (crc d8883653):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4733 [inline]
    slab_alloc_node mm/slub.c:5033 [inline]
    kmem_cache_alloc_noprof+0x35b/0x3e0 mm/slub.c:5047
    radix_tree_node_alloc.constprop.0+0x81/0x1a0 lib/radix-tree.c:276
    __radix_tree_create lib/radix-tree.c:624 [inline]
    radix_tree_insert+0x140/0x390 lib/radix-tree.c:712
    uapi_add_elm drivers/infiniband/core/uverbs_uapi.c:27 [inline]
    uapi_add_elm drivers/infiniband/core/uverbs_uapi.c:16 [inline]
    uapi_add_get_elm+0x61/0x140 drivers/infiniband/core/uverbs_uapi.c:41
    uapi_merge_obj_tree drivers/infiniband/core/uverbs_uapi.c:178 [inline]
    uapi_merge_def+0x4c4/0xb60 drivers/infiniband/core/uverbs_uapi.c:297
    uapi_merge_def+0xf0/0xb60 drivers/infiniband/core/uverbs_uapi.c:286
    uverbs_alloc_api+0x85/0xc50 drivers/infiniband/core/uverbs_uapi.c:659
    ib_uverbs_create_uapi drivers/infiniband/core/uverbs_main.c:1140 [inline]
    ib_uverbs_add_one+0x1b1/0x350 drivers/infiniband/core/uverbs_main.c:1196
    add_client_context+0x290/0x480 drivers/infiniband/core/device.c:755
    enable_device_and_get+0x106/0x250 drivers/infiniband/core/device.c:1375
    ib_register_device drivers/infiniband/core/device.c:1503 [inline]
    ib_register_device+0x4fe/0x7f0 drivers/infiniband/core/device.c:1441
    siw_device_register drivers/infiniband/sw/siw/siw_main.c:71 [inline]
    siw_newlink drivers/infiniband/sw/siw/siw_main.c:433 [inline]
    siw_newlink+0x36a/0x3f0 drivers/infiniband/sw/siw/siw_main.c:415
    nldev_newlink+0x26f/0x3e0 drivers/infiniband/core/nldev.c:1859
    rdma_nl_rcv_msg+0x1ad/0x2d0 drivers/infiniband/core/netlink.c:195
    rdma_nl_rcv_skb.constprop.0.isra.0+0x175/0x1f0 drivers/infiniband/core/netlink.c:239
    netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
    netlink_unicast+0x3e0/0x530 net/netlink/af_netlink.c:1361

BUG: memory leak
unreferenced object 0xffff88810d792920 (size 576):
  comm "syz.1.32", pid 7505, jiffies 4294948085
  hex dump (first 32 bytes):
    06 09 00 00 00 00 00 00 88 f4 78 0d 81 88 ff ff  ..........x.....
    40 e5 f3 11 81 88 ff ff 38 29 79 0d 81 88 ff ff  @.......8)y.....
  backtrace (crc 415aa5b6):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4733 [inline]
    slab_alloc_node mm/slub.c:5033 [inline]
    kmem_cache_alloc_noprof+0x35b/0x3e0 mm/slub.c:5047
    radix_tree_node_alloc.constprop.0+0x81/0x1a0 lib/radix-tree.c:276
    __radix_tree_create lib/radix-tree.c:624 [inline]
    radix_tree_insert+0x140/0x390 lib/radix-tree.c:712
    uapi_add_elm drivers/infiniband/core/uverbs_uapi.c:27 [inline]
    uapi_add_elm drivers/infiniband/core/uverbs_uapi.c:16 [inline]
    uapi_add_get_elm+0x61/0x140 drivers/infiniband/core/uverbs_uapi.c:41
    uapi_merge_obj_tree drivers/infiniband/core/uverbs_uapi.c:178 [inline]
    uapi_merge_def+0x4c4/0xb60 drivers/infiniband/core/uverbs_uapi.c:297
    uapi_merge_def+0xf0/0xb60 drivers/infiniband/core/uverbs_uapi.c:286
    uverbs_alloc_api+0x85/0xc50 drivers/infiniband/core/uverbs_uapi.c:659
    ib_uverbs_create_uapi drivers/infiniband/core/uverbs_main.c:1140 [inline]
    ib_uverbs_add_one+0x1b1/0x350 drivers/infiniband/core/uverbs_main.c:1196
    add_client_context+0x290/0x480 drivers/infiniband/core/device.c:755
    enable_device_and_get+0x106/0x250 drivers/infiniband/core/device.c:1375
    ib_register_device drivers/infiniband/core/device.c:1503 [inline]
    ib_register_device+0x4fe/0x7f0 drivers/infiniband/core/device.c:1441
    siw_device_register drivers/infiniband/sw/siw/siw_main.c:71 [inline]
    siw_newlink drivers/infiniband/sw/siw/siw_main.c:433 [inline]
    siw_newlink+0x36a/0x3f0 drivers/infiniband/sw/siw/siw_main.c:415
    nldev_newlink+0x26f/0x3e0 drivers/infiniband/core/nldev.c:1859
    rdma_nl_rcv_msg+0x1ad/0x2d0 drivers/infiniband/core/netlink.c:195
    rdma_nl_rcv_skb.constprop.0.isra.0+0x175/0x1f0 drivers/infiniband/core/netlink.c:239
    netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
    netlink_unicast+0x3e0/0x530 net/netlink/af_netlink.c:1361

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
