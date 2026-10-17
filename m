Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7353637A4AB
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213923; cv=none; b=o5z2YSF7HXN49bV28K2hJ1zsqAb1vFKeCo+779bgWhm6kb2a/yFEp0ES9A00L9rhideZGGOB96P9ID7BGdniIh/bOzlcEnjaxeUyAmBLZ3czScI/pqfBJVEBkA3suxfRNgqkn9cmXcjIxkEa4W7RnutW15sGAKnfJNuIUgkFKso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213923; c=relaxed/simple;
	bh=mWKg7wFk5PnnAClHbJNt0g7b1/SIucf0sBIIYhAs4jo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iGE4my4Y0YPXTJjt335ckqEyqdsEwt8yJov/46aDlZORX3v//Z4CQLcho4k0Sp/jWC1fJTFq+hsQ2ucSWb/Afegi1lyAwES2GolWCM9ic+Z3jHmuUxvUGV/r3bfm/H8fGNrXoOBeStKk8pF8fM8H94rf/w9T9XHXgMMU2elOPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45ecb9dd589so594670fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213921; x=1792818721;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+gCDS6Gg9zpE6CzVNYM5IScv3rDmY6hSLTpOpM5yg9U=;
        b=wLQXpN+nzUiocO+16tZB+nGmbm94P0GhGv0wBMaYZ7LXMCikC96PidJ/Acm/psCkhB
         82hC8MRLNPkSrn5FgJrVL6UTGFqTk/X8P9EBMW0P4MChoVBWP0SOCVaIsnTig2U3ikej
         JRkxbgUBImzmKfQ5LhVwTzx+gSg3TlMX9rPe+/aMBnS7BDgYbJdxZ8botETnHXtrE/1F
         JBGElAgPezMdegvgPzXv42XtDMPmAPtyv2Eqwyrll3vNO3EtS8U67RB0jbCYOJZEqjrI
         ogwq5DPIaRsZRsOhU8IX+D2W+Ns71DX7mJIX2bfUUCbP/I6iu57IoGkjjEWh/d6II/cS
         ICOw==
X-Forwarded-Encrypted: i=1; AKwUvBxNg0yNASBgC7OxWDAY1trvCp8RxleWfUAW8WRMmukDnXYxLq75GgCsZle5rN9NhEBnCBZI7pBNFETILwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjQBzMHaYGfrjt/5gD+kl5A+MpWF2zGCYRBeiwolgglT5Ug6Ry
	ZU6Y7C5SBPK6L2//T6HAosKOApyjKm/G1QPDQCNRwfT0Xr4fAbsCesUvpirkzhz8E/2l+iSMk5m
	KsIulEGpda7CAT3QtE5XzJha2DaWZglrHTjsZXAxUeVOYSw1rU6AFzeqsFjg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0d:b0:53a:3533:10d7 with SMTP id
 5614622812f47-53ccd01040cmr1261126b6e.14.1792213921449; Fri, 16 Oct 2026
 22:12:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 22:12:01 -0700
In-Reply-To: <20261017044149.584-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad303a1.7952420f.283480.035b.GAE@google.com>
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
Read of size 4 at addr 000000000008c617 by task syz.2.87/6911

CPU: 1 UID: 0 PID: 6911 Comm: syz.2.87 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
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
 nvmet_fc_remove_port+0x2a5/0x350 drivers/nvme/target/fc.c:2939
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
RIP: 0033:0x7f1994b5e1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f199419d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007f1994de6090 RCX: 00007f1994b5e1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007f1994bf5888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1994de6128 R14: 00007f1994de6090 R15: 00007ffcd30e9a38
 </TASK>
==================================================================


Tested on:

commit:         58161ead Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1492efd1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15d8320d580000

