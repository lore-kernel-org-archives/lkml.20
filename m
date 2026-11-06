Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954561;
	b=GU7Q47UHz9nkEEnjo6NeJiD67nhGnD23fJKZ4Jd5CSpU/3dBPOPzSdAOK9y/JEYbsaXE
	 u211+oNMSe1L3he920cQ4M1c050Gl9ZgKKmcVby3iNdc46OTZEvYcb6qPkgCzsAblqgdU
	 NSQ8UIvT5zCRRDjHixKZB5a2GEIVZGOgqmBTPjmXzAL2Cv7TadMp13XxPVSy5hf4uZ2ah
	 uWFWRp5NiBW4vsGsxCFNjzlEChTmRO3pz0pGnrTC6c7ZKHHyOQxvmScZKTkBg1CTBBsFp
	 vjF7fagS0Q+nBV9OZxYuj5Mt87V+i4BWWyUujDqberucauNRxYMONuvEy4/MG8QDWwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954561;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=M8yDQ/yIYjf1yjkinMkq3f1GifKllueCDz6yFTcJFC8=;
	b=U5OuN7jckvsWqkWiC5Zvy+AJA7k/2O/HceR3fYXzBDpTAE2oHkIHLb4PA+l+9KMb4esR
	 hfufRXvLz/tyXq079bwE7AZf/7qjBCZwYdINvq0CX7RWwAELMRWdTj3Q7OICoP7oO7Qwu
	 cVZV3tiL2wyYReXMyRkdSPrBRQIA94y42x0s0iDD62ZqiFp4yxSnwiA0wtP/f8/DcDUTy
	 P96oeAU9eEelun5Rw+L/4/EgVGdxcWUSxmOqsuhIlEi5Mo279tC8hTnX82vWi1hO3S5jr
	 8sfgW1M67GQaKnza23BSu7eg2UiojSB3hoUVy0LaNrbqjxUm/6e9u9PurhyiBfH+6Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F314606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F314606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7de733fa9so474676b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:42:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954560; x=1794559360;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M8yDQ/yIYjf1yjkinMkq3f1GifKllueCDz6yFTcJFC8=;
        b=okohfEoN5nlNpjebjf8/V4+vmE8bVssFnhSnR8BiZWTM2THxReTT0ert6h872mhg8o
         arDX2OFySFOfFVdl1+QbNPxwWjd5nUHxrg6t2QfcTmEmkyEQx1WQi3lBzBkQnZL6PUfH
         K9PQSdsCO//+nQEk+lplWW3d8HI8iR/S/WDiM4/O32TX1Nj8JWP9onhMK/koW3vTwg1e
         2rtx0xovknnJD4RQlIK0gR2Vb4h7CAH6HlDeRHjoJsjjWejLZRhw0pqSUD52K4Z4JMv8
         Yq16KHyHmSqMJHgutIX+TnpPYCp81lww480eYSP4s2UWIKqe8FJGKjbQsHZDvcNxXxrm
         EuJw==
X-Forwarded-Encrypted: i=1; AKwUvBwUrIeVYzB3cEkCzDj9p7wCjfwWDOcAGK2+0gBgItfrvdFUvZmHUhKWubvFrLhwn44QY7s4Nkzx204FFKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R03P5eQlNUyJduQe+SwXgTX/rcG+InYx0XLCGX4m1a9kxSAq+
	s6Nc1UY10lIgY53CqAshdaVLrWk5EGBGs1PmLP78GiW6H3pROkYx4vgIUSld1qffxyEXNcwx4ch
	qfVhHgLZcLMjxirZcoKe30wfEi02XKHoQRmLH1iUBUA6U+wyJQLWT5kob4r0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3097:b0:4b3:7b31:8df7 with SMTP id
 5614622812f47-567e0faab32mr1577450b6e.14.1793954559883; Fri, 06 Nov 2026
 00:42:39 -0800 (PST)
Date: Fri, 06 Nov 2026 00:42:39 -0800
In-Reply-To: <6aec6433.0ce67c00.35143.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed92ff.a716b02e.a4a62.0000.GAE@google.com>
Subject: Re: [syzbot] [rdma?] [f2fs?] memory leak in radix_tree_insert (3)
From: syzbot <syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com>
To: chao@kernel.org, edwards@nvidia.com, hemanth.selam@gmail.com, 
	jaegeuk@kernel.org, jgg@ziepe.ca, kartikey406@gmail.com, leon@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, michael.j.ruhl@intel.com, mrgolin@amazon.com, 
	syzkaller-bugs@googlegroups.com, yishaih@nvidia.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    d68ce4e71248 Merge tag 'mm-core-7.4-rc2' of git://git.kern..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1781772d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4361b1bb937ae1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=d60be66dd00b4490fa96
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=169572fd580000

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
unreferenced object 0xffff8881102cb918 (size 576):
  comm "syz.1.20", pid 6842, jiffies 4294945826
  hex dump (first 32 bytes):
    0c 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 ef c5 11 81 88 ff ff 30 b9 2c 10 81 88 ff ff  ........0.,.....
  backtrace (crc c4ea6eb8):
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
unreferenced object 0xffff88811021f488 (size 576):
  comm "syz.1.20", pid 6842, jiffies 4294945826
  hex dump (first 32 bytes):
    06 09 00 00 00 00 00 00 18 b9 2c 10 81 88 ff ff  ..........,.....
    00 ef c5 11 81 88 ff ff a0 f4 21 10 81 88 ff ff  ..........!.....
  backtrace (crc 8219f7d7):
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
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
