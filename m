Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E346345DF71
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788391745; cv=none; b=rdxlyi/e133dskJ1X8cNvxC3tkwxeJFWq4z80FjN4Q+b4lVe8jvvpQ6uznq1b8XKoiDvi7ZJHYmJIymnWk1uUBtn4xfcuMKPf7iffY/vnlRajRVcv1RTm+SxgcKuT5ltnsjNkf6l7VcPPdRbgS7yrWleVzRZ8qWCjEOVnIfEa3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788391745; c=relaxed/simple;
	bh=YtmR9Vpz/Vf9dJCVGyp6EOjbUsWccdXKNm5yGOIIAKY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=COTAURNqZ3lya/mR8MVOp9Y9N+TX0DG3qxuhKw325o4wlmzhOPxxIuJZ3rbybrmCY0dS5qXGqqu3EzVHmZhfZQykFKd9w/rMxSM4j4d5dvlIn9nklcvcddkvd7oxdb5+g8TvQsb5syvB16Y5h5GrN7JuKTZVl0HDXiDPzbWO+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b26d8d2498so1949701b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391742; x=1788996542;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yti3fq5dDQlfGKxIs7obF7YC5R9lxUWAtU+qpI+l9uM=;
        b=ASq/m1nYDuB0laQrcxUwK60K0asNzT58dBTM9yzr0N7a6EvLn2i0QaVIYcigJmBvJZ
         I1vr9c9ZvTumwpWKsn6ia72wPU6I0vq/mkw0tWDsP+HLQfOGtzNx2XZi8XCKi4xdFa4K
         7JcRLBS3YVt/ktq43wDUz18R9n+4yJcVjOLO/lymW9j1lkf7lN8rCuR3nFZCo8KM3p9w
         pKzcv/wseo8HOkenXcGpTiSlpT4oVppgWjsRsB0vWFV/fnGfwPw7+6hkrN+yLck+0S4A
         CPH0yX0ehd8Xxtu9peNolu9t6RuRg2i3AjaPUO7a256m47+7PdGpKnNlBxpRApJbsf32
         3vPA==
X-Forwarded-Encrypted: i=1; AKwUvBwbGEVW27ROExgp3JTy36QuBnI8D/MYijzkylk5U8D3I7hR7BWxx/q8ZSupQ9E1IPTD7i1GPFaZlqSOQP8=@vger.kernel.org
X-Gm-Message-State: AFuF++kwP4BYb8H51zj812vGhKWbkLaXuwgcKtrQB+Jy/q54LyzwbEcO
	iK5nVL36WsnfO/i8hVgfYOuRvZ6UqX3GZvrjDBtQN9lVJAVF4MwNW7VZUGLdEUp5VaPN83VoqBW
	yw+nWjKLUFBQxRDmcB3GbfEpUjWfLngXoqiedfd0yBh07MdcMbnuvoxhQQWA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1987:b0:6b1:333b:ffcb with SMTP id
 006d021491bc7-6b47c3b5798mr6492309eaf.6.1788391742754; Wed, 02 Sep 2026
 16:29:02 -0700 (PDT)
Date: Wed, 02 Sep 2026 16:29:02 -0700
In-Reply-To: <20260902230726.7481-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98b13e.9266084e.bf0d7.0012.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_disconnect
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: trying to register non-static key in roccat_open

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 7265 Comm: syz.4.142 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:1000
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1315
 __lock_acquire+0xaf/0x2e40 kernel/locking/lockdep.c:5128
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5908
 __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
 mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:578
 roccat_open+0xf6/0x5d0 drivers/hid/hid-roccat.c:178
 chrdev_open+0x4dc/0x600 fs/char_dev.c:411
 do_dentry_open+0x849/0x1420 fs/open.c:996
 vfs_open+0x3b/0x350 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1448/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdadb7fe159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fdadae5e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fdadba85fa0 RCX: 00007fdadb7fe159
RDX: 0000000000000002 RSI: 0000200000000100 RDI: ffffffffffffff9c
RBP: 00007fdadb895024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fdadba86038 R14: 00007fdadba85fa0 R15: 00007ffd1ce9eae8
 </TASK>


Tested on:

commit:         89a31299 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1253ef79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=c492a9e154f81127551f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13f74125580000

