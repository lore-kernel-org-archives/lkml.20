Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB7245020
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351385; cv=none; b=QCp9tT+xApJHV3HEDCQj43WbrR9Cn3BtLp4F6UKXycLtVx7bMMal9icQntL43jTsXA/aglhDQcfYw3hF+imC4gD6/C6UAxkjksNV1yrMkGHbirJhOMCZuZeRoenEziDWB4LEQpEbskS875izoTPw+3wyRZkGhUgeghX2xxIuhcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351385; c=relaxed/simple;
	bh=gF1QW0Ig2Sba+Tmb/Zs+9oZFdmkgCXK5bo3IXNieFqM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KVwOcErz3pLpjq1qr6yEoKlKEp3BpuZh7f49H6uHG+h2J+WMrv8j6Unda39lJYBsaWO28KSFrsuGp4tygAKRRug5bBKWNaZljO8niMf0t8f/rxl6H5JyOzve3Th+M5Hpio80KleXru6JOvAQCtP28N98ietqyeZ39sEMHiFCD3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ad778bacbeso4708569b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789351383; x=1789956183;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gO/R69cYMwrlavSbi1XpU7D7/7bNbizcayAR/WkfIJU=;
        b=oUSIWFxlgOGPr34sSPepdIGQ53z+7QD0Llzratxnp9n8LAXaFnOZ4sk1K7kmw5bEKp
         5+r+uAI8bDBLJ2UYLnjHgfno3F5aE7u4PHmRE6azd1eFuwIq8r4jLrpRfNXJybmCyXMH
         4niBv9+oiVhawz/uWvyG+iRe9Ul1l0K8Yp2xNBshY+h/R1IKHulV0HIZlpGAQbCUTpry
         b2uZL0ponC74DDvHiRH/pbDzfSPwPDLr89rdZj6YjE1XBDObiRvXxu3I2CboNewwE9L3
         rkhQzwdYwX0wauV3GyoyyO0gL78DFXtRONSkj1ksFkp8VhdNoD52CT1SZ+9MPo++AzXr
         BHnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVDzEu43mN9/HYKhoKfBijBBrMpvYxO86ua88iZj0HVKWuKpFa4vwfOOZL7zlcJ7IHvgdRXUWlZkhqlMs=@vger.kernel.org
X-Gm-Message-State: AFuF++lgmZYE/eFy4gexYiI8nrrbOVA5xEr2CPvTolnbGnw37xWjg24y
	OQ/tsNwcB3y2oJDEKaBeoAgx2FRO/D5504FwKFSfH+S3sULqi0bTdLA0I35nTPgGaHpqXZtFKAz
	yAMqjGdVZSg2LBiUbgcyO8uwWdSg2Zb/UiLqFBJrhU9oMNxn0IQYitzUePHA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:198e:b0:4c4:d8a0:2773 with SMTP id
 5614622812f47-4c7b626a8efmr220367b6e.32.1789351383436; Sun, 13 Sep 2026
 19:03:03 -0700 (PDT)
Date: Sun, 13 Sep 2026 19:03:03 -0700
In-Reply-To: <6aa74ffd.2cd27cd2.290120.3dbeSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa755d7.a211d2ce.1a5198.0289.GAE@google.com>
Subject: Re: [syzbot] [fs?] KASAN: slab-use-after-free Write in config_item_get
From: syzbot <syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Write in config_item_get

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_add_relaxed include/linux/atomic/atomic-instrumented.h:252 [inline]
BUG: KASAN: slab-use-after-free in __refcount_add include/linux/refcount.h:283 [inline]
BUG: KASAN: slab-use-after-free in __refcount_inc include/linux/refcount.h:366 [inline]
BUG: KASAN: slab-use-after-free in refcount_inc include/linux/refcount.h:383 [inline]
BUG: KASAN: slab-use-after-free in kref_get include/linux/kref.h:45 [inline]
BUG: KASAN: slab-use-after-free in config_item_get+0x26/0x90 fs/configfs/item.c:104
Write of size 4 at addr ffff88804491f01c by task syz.1.545/7868

CPU: 1 UID: 0 PID: 7868 Comm: syz.1.545 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/08/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
 atomic_fetch_add_relaxed include/linux/atomic/atomic-instrumented.h:252 [inline]
 __refcount_add include/linux/refcount.h:283 [inline]
 __refcount_inc include/linux/refcount.h:366 [inline]
 refcount_inc include/linux/refcount.h:383 [inline]
 kref_get include/linux/kref.h:45 [inline]
 config_item_get+0x26/0x90 fs/configfs/item.c:104
 get_target fs/configfs/symlink.c:139 [inline]
 configfs_symlink+0x407/0x11d0 fs/configfs/symlink.c:200
 vfs_symlink+0x18b/0x330 fs/namei.c:5794
 filename_symlinkat+0x1cd/0x420 fs/namei.c:5819
 __do_sys_symlinkat fs/namei.c:5839 [inline]
 __se_sys_symlinkat+0x4e/0x2b0 fs/namei.c:5834
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84


Tested on:

commit:         a7c1290e configfs: pin the symlink target's dirent ins..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1626c115580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d794b10c2a1184e
dashboard link: https://syzkaller.appspot.com/bug?extid=6b16e3d085833cbf3e25
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
