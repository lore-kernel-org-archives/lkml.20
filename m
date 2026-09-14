Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619FE2BE7DD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789358764; cv=none; b=SmHME1CqhqelqLlQkgOOL+aeA8TrCs5wu3M/IHYvlJvtFRmBBLjAf03jCSjYkQgcqEzL9Tm7hl+VES2lcztQ0Tp909MnWzi30WuS+0dmybgZdRCasV9Dl3TT5fDhF0gNk+pYQMUUviGvxILcFLQAQe0NuGGNs9r8V7xUZELeLtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789358764; c=relaxed/simple;
	bh=hRQOLdp3TKXqen5+i8/UisG0MepPQxTBzBYqYOujO30=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QmQMmk5xqrO/JGw5ec5PB5qD4a/t4Xx0QDLcP7CR4bfP728NMlisIJoEO3cTvwaExU+RXBEQdUBUU7o73P4ceuEqmxFBkSHCYbJV38TT1a6uMRmiWB4OPnTLS7lx5qrCaRYe+UTzVsHb/1fpo/rBdPutIEYWzHx+DND2pPzup9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b3962f71e7so3994666b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789358762; x=1789963562;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FUK59AVPa6bF66ExLAH694aQ+UmTJxsBZOFYXNlF7lo=;
        b=MeLnmbSK+syDj7w1E+zZ/U5T3oJrU6aHgf5oJNBQ/J5gpkbOOwJ+hOvH+OimqQzMJW
         zqkSiQxb7BWxXaydk5VZIgbKT/So+NJD26QaurbYY9lVNLBgXru6UNJfo7BlXo4EHQZy
         DGoq76NqQTTe1crZvUwF+5HTYl54oMT77HeGsfgP1xKhPRkVOBbpa8jZWrQlKxqjhmhJ
         GPGPP+9MVgdaE0vfz92zaTLZsvvuzLfEsGbmChSMNVCL6qDq9rDy+cfKKV8Jsi/gR+tl
         O0Qgh+nUoQHYTuJAiOyUp7RKmBlgT6zi2Pi3rqasBScBj3cEvngO0LEUQdBbEHXjxPei
         r+OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwN9Pg6yFyGxb4TZ3TCzbGugnseVdLyk59zRpWvDrhRlu4G+eZR1tdaTPvBRppCTFuB+tVmeIGTo0V0CE=@vger.kernel.org
X-Gm-Message-State: AFuF++mMURirznjQJwWcnUsI4xEFURmjUu2hsab3yMbEI3ISoyQe6rcQ
	VvqHShGSvnTIA36RwvDj6Gm1gVyXBxGXf5hZ+ODWhBF4ikCpu8fatjPxyij1sRHqDAPX25qtdmI
	qjs/1X0pUBUsBRBoy9S0WtncTqhbI6IzWV558gliq8YaTLRQ2pcqXbXOl5Jo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1510:b0:4b9:a8ac:478 with SMTP id
 5614622812f47-4c7b57a0177mr370932b6e.22.1789358762353; Sun, 13 Sep 2026
 21:06:02 -0700 (PDT)
Date: Sun, 13 Sep 2026 21:06:02 -0700
In-Reply-To: <20260914035231.25468-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa772aa.016ef6ab.da411.0009.GAE@google.com>
Subject: Re: [syzbot] [raid?] UBSAN: array-index-out-of-bounds in super_90_sync
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: array-index-out-of-bounds in super_90_sync

loop0: detected capacity change from 0 to 4096
md: async del_gendisk mode will be removed in future, please upgrade to mdadm-4.5+
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in drivers/md/md.c:1698:17
index 124 is out of range for type 'mdp_disk_t [27]'
CPU: 2 UID: 0 PID: 6030 Comm: syz-executor296 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xcc/0xf0 lib/ubsan.c:455
 super_90_sync+0x1eed/0x1ff0 drivers/md/md.c:1698
 sync_super drivers/md/md.c:2506 [inline]
 sync_sbs drivers/md/md.c:2748 [inline]
 md_update_sb+0xbba/0x2840 drivers/md/md.c:2924
 state_store+0x31e/0x1340 drivers/md/md.c:3246
 rdev_attr_store+0x1d9/0x560 drivers/md/md.c:3769
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8bf35ed6f7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffeefb8d700 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000055558c0d1400 RCX: 00007f8bf35ed6f7
RDX: 0000000000000008 RSI: 00007f8bf3629c12 RDI: 0000000000000003
RBP: 00007f8bf3629c12 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffeefb8d7d0
R13: 00007f8bf3629b5f R14: 00007ffeefb8d8e0 R15: 0000000000000002
 </TASK>
---[ end trace ]---


Tested on:

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10bb35f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14dd08c9580000

