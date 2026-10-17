Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082723AE185
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792219986; cv=none; b=EmXzSCuiuRvxiNfyAjJXjzuu2aIVz/lbtfgf4/alsWwTZMBzlLlqLjABvrMKDi7QhcecoOHKQf+1KnJM6C7H0+CvshKOt0T0pNOuVIEHL5Jl7ROdAMQg5uCfn6zK/Z8HhdSH+PiLe1+S2r/mOzCpJ+iPqn6ss9SOEbz0b7PZ5ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792219986; c=relaxed/simple;
	bh=igX6T8hD+yxUgfg/Su3q0fs3EirwHWXUyQr7RjPgj0w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J3I7OQbsYsv0HjEb7BCxiJdRviDvtH9AXwAhojiCIrTLz7ROXdFvyk/1wRLcvh00EqrYuVDNU/7ZdTY0gFHY23cZsP76FzYdlP51QIxnYk21+S1wHT9ctYLLb4gKu7Z/Lp7AuVtPYAla6+P1kM4Fsrs2t2BMrO/1cZoBglz2kZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8452af97d8aso852974a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792219983; x=1792824783;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9NxZcaiD0xI2L83H9nA73iO/Eds1RgPn17rHmEUfveA=;
        b=ddrPnTlD+b1C7EenWSn4Gm5xnhYqaFJt/vlWc3uzW7f3PL79HZzfPsWrMzy7ghzz9k
         Etq2KYkznMJ5V0df67BXGaCiiYrt6XPARgLq8ayBgLGc+pOdCXveFiYD6bpv6vGe4dv+
         KiVaUesH3qI8jSO4Kffhcs0wM6jhDtrg/KNrH/WUj5eK/d2KNASGiRKCR5yav443zwoB
         xoOrygQrRF2fshx4aS4e60h8cvpGDalg9hGzknBCuNLiuHfMhUzbrWuGQuAjsYihTeoj
         fctBQ5wZ+odmH1FfStZtZfdv2ssrRhfaacbhIfpqB2jf+vmgah22VO8pZA4yaYIl09JT
         TrTA==
X-Forwarded-Encrypted: i=1; AKwUvBw6WGCPyASnp65kPRh3LTCAzKX5thH693pboiw9+rOhajOx0nZgS+rCUDk06jQBNkwtHFrZpodO0YV4fZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzKSU/W4tU6h2HhRP0gKULS5Q2UdayhdkcNtxeKk80Y3RqwHji
	dCxGofd2kfIu0QkbUMNn3v2Mh/tHOAusnzSVJ/HNAWto/nSjs4xEmQnbt9BQ15dlP0WVyL6JYdj
	cZHRCRLI+SHur5Gb96keRuzfcu+HICIaAtzB45TeUpUhP78IQGtE5Qfel5lA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1206:b0:53c:156b:a16d with SMTP id
 5614622812f47-53cd1cadc9amr1480220b6e.56.1792219982943; Fri, 16 Oct 2026
 23:53:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 23:53:02 -0700
In-Reply-To: <20261017054235.608-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad31b4e.7952420f.283480.035c.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: user-memory-access Read in nvmet_fc_tgt_a_get

==================================================================
BUG: KASAN: user-memory-access in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: user-memory-access in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: user-memory-access in refcount_read include/linux/refcount.h:170 [inline]
BUG: KASAN: user-memory-access in __refcount_add_not_zero include/linux/refcount.h:176 [inline]
BUG: KASAN: user-memory-access in __refcount_inc_not_zero include/linux/refcount.h:317 [inline]
BUG: KASAN: user-memory-access in refcount_inc_not_zero include/linux/refcount.h:335 [inline]
BUG: KASAN: user-memory-access in kref_get_unless_zero include/linux/kref.h:133 [inline]
BUG: KASAN: user-memory-access in nvmet_fc_tgt_a_get+0x82/0x1d0 drivers/nvme/target/fc.c:1201
Read of size 4 at addr 000000000008c617 by task syz.2.58/6775

CPU: 1 UID: 0 PID: 6775 Comm: syz.2.58 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read include/linux/instrumented.h:82 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
 refcount_read include/linux/refcount.h:170 [inline]
 __refcount_add_not_zero include/linux/refcount.h:176 [inline]
 __refcount_inc_not_zero include/linux/refcount.h:317 [inline]
 refcount_inc_not_zero include/linux/refcount.h:335 [inline]
 kref_get_unless_zero include/linux/kref.h:133 [inline]
 nvmet_fc_tgt_a_get+0x82/0x1d0 drivers/nvme/target/fc.c:1201
 __nvmet_fc_free_assocs+0x10c/0x380 drivers/nvme/target/fc.c:1488
 nvmet_fc_remove_port+0x2b1/0x360 drivers/nvme/target/fc.c:2942
 nvmet_disable_port+0x13e/0x1f0 drivers/nvme/target/core.c:400
 nvmet_port_subsys_drop_link+0x1e8/0x210 drivers/nvme/target/configfs.c:1123
 configfs_unlink+0x44f/0x6b0 fs/configfs/symlink.c:258
 vfs_unlink+0x27b/0x6e0 fs/namei.c:5648
 filename_unlinkat+0x3d3/0x610 fs/namei.c:5718
 __do_sys_unlinkat fs/namei.c:5747 [inline]
 __se_sys_unlinkat+0x83/0x1a0 fs/namei.c:5739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fedc366e1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fedc2cad028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007fedc38f6090 RCX: 00007fedc366e1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007fedc3705888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fedc38f6128 R14: 00007fedc38f6090 R15: 00007ffd3089d1a8
 </TASK>
==================================================================


Tested on:

commit:         58161ead Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14e66ce1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=175d34e1580000

