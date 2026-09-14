Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B01476CE1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390264; cv=none; b=JyxPEOsdidoWzM2TawyyeOTzPdmuwPym7gLSrp6V8vinTJvafqPlTTiy9IhJb5L+kmQu+CuAuDqaSgKpib9KdFpCc3+k09Ee0E91kz1cX4h4meX+tYmkRJHIM2HNBJBxa57Sl08WeS29NPm6XfyHQ56RmXQYzbxR+ytISMS6yeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390264; c=relaxed/simple;
	bh=H8LZYBX9z+KT9qke3wxbu3lNzm4OrkwYk1ZVhj2ukKw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oOoRutb6opoNF0l7Do8GHl8IN1vl+Md/1uao9qVAsL86HY7G8JYNAMN3np9vdZZECZuo51I5Ye52myiaAYeUBQ+CUvqG/eRhPVj8VEu8GSbzEQaZdoeZYiPJKkWozWfMKnFvBn05jJ5LptWZgum2g79K3j3laHQJz2hAJtk4ceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4dd46ddeso2033432b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390262; x=1789995062;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=afUS8z04bv/NP4nWakuFcBReQWiRpz3FjUOZhA9DeoM=;
        b=X4VZRapOZdhAWwYibyVtunoduh0qTSsIRJj7UaqBGmD050QAlbYLiT0hdaTyDf90ff
         cPWTkYOZjLltHeINZHs2gi+F+JCaE0TwRtiQS66rYgdivTJgT5z0IDCaF05nT+Utl2ul
         Sk5k94M9dlmWt7YihP2g6AKeKwNU6SZ0YUj01a3bpI7JeyRbzsOshZCSD130w/SczGPW
         +eoHREQkusssG5AaKquBtM4vlyiPCHYnVfmyWqyIgjHZ1HPn/OzxzSNqDqZlOemU4e6d
         UIQOiuUTOboeRwovhkLiWiEEjjUlt2jwSnv5GtMcSbFlVSXeg8y+sAVyaImKg26ebZsU
         RQCg==
X-Forwarded-Encrypted: i=1; AKwUvBzSEFUrO6aWKQ/IdeIDsXrVTmLecnpkyP1dsbAjQhaVwRUUfuxSB5s7e5dwDBn84mnfxQZAekS6xeJt1uY=@vger.kernel.org
X-Gm-Message-State: AFuF++nWfrwPdRxsPEzmNtxVPuXJw4yb8x4Ko2nHEos62x/lnGS3x9iP
	5DIHmJPhHeXh7HTBfHwZrapD8SCOcc4Cyff3THHbHWTEUMkqWxUKP5UM4CvTbsJ/pGm4V38XgTv
	91WCzlvZVRr5uwdUbNzvGfC6YJ8emAa5hz7/OlLBDxpY24Cx5tkD0Csg5sz4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:138a:b0:4b9:e5fa:8a1a with SMTP id
 5614622812f47-4c7b579e1ddmr1752674b6e.31.1789390262155; Mon, 14 Sep 2026
 05:51:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 05:51:02 -0700
In-Reply-To: <6aa7e879.caa6ce30.140852.5243SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7edb6.4c28b7d0.c1bba.001d.GAE@google.com>
Subject: Re: [syzbot] [raid?] UBSAN: array-index-out-of-bounds in super_90_sync
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: array-index-out-of-bounds in super_90_sync

------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in drivers/md/md.c:1702:17
index 124 is out of range for type 'mdp_disk_t [27]'
CPU: 0 UID: 0 PID: 6036 Comm: syz-executor409 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xcc/0xf0 lib/ubsan.c:455
 super_90_sync+0x1eed/0x1ff0 drivers/md/md.c:1702
 sync_super drivers/md/md.c:2510 [inline]
 sync_sbs drivers/md/md.c:2752 [inline]
 md_update_sb+0xbba/0x2840 drivers/md/md.c:2928
 state_store+0x31e/0x1340 drivers/md/md.c:3250
 rdev_attr_store+0x1d9/0x560 drivers/md/md.c:3773
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3f2533b6f7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fff296be710 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000055556ac25400 RCX: 00007f3f2533b6f7
RDX: 0000000000000008 RSI: 00007f3f25377c12 RDI: 0000000000000003
RBP: 00007f3f25377c12 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007fff296be7e0
R13: 00007f3f25377b5f R14: 00007fff296be8f0 R15: 0000000000000002
 </TASK>
---[ end trace ]---


Tested on:

commit:         2f0c1cf7 Merge tag 's390-7.3-3' of git://git.kernel.or..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15072df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e01925580000

