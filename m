Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663284;
	b=Hk6QyvOan/PF9u5AcZYypCT56j7NlNDI0hC3ku6ROBsFug6wjs4Fw3VVYkJej1pn4IIM
	 7aXBJDrBQrVuPwOmRZX5hTehW/bAjrLrzq2wcVkQw4kYNjGNgBREg7pu0n17MsqCpNp83
	 hYhvUCLUpILuZuljlvSRLT4h9mfQOXqJ+cssI+9UiuQ1Tl+4HVZC+e65esChF25qk0g65
	 I5qGALuTS3jPbNGP3ZAey7qILdbJY8LB/AIOqJ68XqVwsde7TrQjJssuxlpkaxNxh0mER
	 uLoQXVYfkzhuKQYgdf4SuIqTmeFjQLLg6YuWv6931HOz1HNjqmRcLtpEKFz/V3MzERg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663284;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=BWI3Lrcifhq07nHl0S5uej8tCbV/Fgv3NaO9h++jNTo=;
	b=3ddw/GF364FdMFT48In5UjtvVFJrKiWiG6Bmbz7Vlj0DJ/25hfldYBPPBBVbYfeXrCd2
	 WUi/Z87BA7vfMwz+hGWVtZSYDyfCF9p1iweQcktBno3815hVWwcWpPNZ8aJ7nRpckp8fV
	 4iTtMwkIfc3jaBgXGKk9ID3tOq85FhnqdbQqADW+bhOaFA23Md9ufyBjdXwKztpkz7sat
	 mjottqF6kTFLVVkqNCBVvmDSZWgU6VDJxEEYnXbRhi4Qbv4SRqWIkIqQcJ1KArnccgLWZ
	 XlXqv2DKD0AX/7WbzvFflpdkLoEQhTCwgspHrXrO5LFlCVGrOEBn2U9i2qcxkSP7syQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D3D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f9b643ae53so1239016b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663283; x=1793268083;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWI3Lrcifhq07nHl0S5uej8tCbV/Fgv3NaO9h++jNTo=;
        b=1hminWHF8cgIDXOMAVodvhTXUGpI1KUA1m1KxVUOQzdYd4HwjBuL/wdhtOkZQWDpAq
         atRP7AZD2Elk9YhAS1iQMA892UI+sEx5jP7F258CQycgHYY1T9Ixq2j9STWVngKhPKNJ
         eM0dKfjQRUEQoJ0NfrHvleLABQ8gn25wPCSuc3j4y3+T2ZCCLAHF1qauIvMOAueKnKd6
         ppTiSj04qcMqBeN6JRoLdR8ZSN2s8Of0yzXhQwXFLh4epBVsPiJ5MlhtC0WBU4NFeg+E
         4+502uow3EHKYEImhg4356xf/UHWMSdyD1CnQ6SdEMouGl3DkpZx9goO1JBiiS/GytOi
         gk7A==
X-Forwarded-Encrypted: i=1; AKwUvByEAapt6ElWCPXyKe1RJzMc9r+n5hZBMrNUe0LRW85zxqs6nD4/rI1Oc8dXkjEUECSk3zGfmbJk13HSuQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTVQbO8MCkgaLfTqXPOoFgRVKHcp7K9ugYAuVXRFFME8mycU3x
	D/Xb96paiH+RAJqfJhBFDo2ozxRdGET1NZzbUqddvukChST0BjteLriZsRGdBhPPIn94LmcuniN
	WN421j0FDhub1S/V8HQyGJ/40gPjKJ8sPPVdYZj3m20qgr+/mFDzq/PtlXSc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:152a:b0:4a4:744:a4ff with SMTP id
 5614622812f47-5534f045a74mr2683712b6e.4.1792663283371; Thu, 22 Oct 2026
 03:01:23 -0700 (PDT)
Date: Thu, 22 Oct 2026 03:01:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad9def3.3ebfcf67.79b0c.0095.GAE@google.com>
Subject: [syzbot] [fs?] [mm?] KCSAN: data-race in xas_create / xas_find (10)
From: syzbot <syzbot+73641b60a3bc11dfca8c@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a804c5742bff Merge tag 'lsm-pr-20261016' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10762231580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0a09745349d136e
dashboard link: https://syzkaller.appspot.com/bug?extid=73641b60a3bc11dfca8c
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/171f09113e28/disk-a804c574.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0f8812b149fb/vmlinux-a804c574.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6349a85938ab/bzImage-a804c574.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+73641b60a3bc11dfca8c@syzkaller.appspotmail.com

loop6: detected capacity change from 0 to 1024
EXT4-fs: Ignoring removed i_version option
EXT4-fs (loop6): Unsupported encryption level 6
==================================================================
BUG: KCSAN: data-race in xas_create / xas_find

write to 0xffff88811a8efda9 of 1 bytes by task 6715 on cpu 1:
 xas_expand lib/xarray.c:620 [inline]
 xas_create+0x685/0xbf0 lib/xarray.c:661
 xas_store+0x6f/0xce0 lib/xarray.c:795
 __filemap_add_folio+0x647/0x910 mm/filemap.c:915
 filemap_add_folio+0x1cd/0x380 mm/filemap.c:972
 page_cache_ra_unbounded+0x1a4/0x3a0 mm/readahead.c:293
 do_page_cache_ra mm/readahead.c:348 [inline]
 force_page_cache_ra+0x190/0x1d0 mm/readahead.c:378
 page_cache_sync_ra+0x11d/0x560 mm/readahead.c:602
 filemap_get_pages+0x2f2/0x1360 mm/filemap.c:2714
 filemap_read+0x21c/0xad0 mm/filemap.c:2824
 blkdev_read_iter+0x21e/0x2d0 block/fops.c:838
 new_sync_read fs/read_write.c:493 [inline]
 vfs_read+0x699/0x7c0 fs/read_write.c:574
 ksys_read+0xdc/0x1a0 fs/read_write.c:716
 __do_sys_read fs/read_write.c:725 [inline]
 __se_sys_read fs/read_write.c:723 [inline]
 __x64_sys_read+0x40/0x50 fs/read_write.c:723
 x64_sys_call+0x2135/0x2550 arch/x86/include/generated/asm/syscalls_64.h:1
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff88811a8efda9 of 1 bytes by task 6813 on cpu 0:
 xas_find+0x360/0x3e0 lib/xarray.c:1421
 find_get_entry mm/filemap.c:2085 [inline]
 find_lock_entries+0xd4/0x6b0 mm/filemap.c:2189
 mapping_try_invalidate+0xc7/0x430 mm/truncate.c:545
 invalidate_mapping_pages+0x27/0x40 mm/truncate.c:602
 invalidate_bdev+0x58/0x70 block/bdev.c:101
 __ext4_fill_super fs/ext4/super.c:5840 [inline]
 ext4_fill_super+0x2cd3/0x37c0 fs/ext4/super.c:5865
 get_tree_bdev_flags+0x291/0x300 fs/super.c:1883
 get_tree_bdev+0x1f/0x30 fs/super.c:1906
 ext4_get_tree+0x1c/0x30 fs/ext4/super.c:5897
 vfs_get_tree+0x57/0x1d0 fs/super.c:1943
 fc_mount fs/namespace.c:1282 [inline]
 do_new_mount_fc fs/namespace.c:3910 [inline]
 do_new_mount+0x288/0x730 fs/namespace.c:3986
 path_mount+0x4ad/0xb90 fs/namespace.c:4337
 do_mount fs/namespace.c:4350 [inline]
 __do_sys_mount fs/namespace.c:4565 [inline]
 __se_sys_mount+0x28c/0x2e0 fs/namespace.c:4542
 __x64_sys_mount+0x67/0x80 fs/namespace.c:4542
 x64_sys_call+0xc3b/0x2550 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x03 -> 0x00

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 6813 Comm: syz.6.569 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
==================================================================


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
