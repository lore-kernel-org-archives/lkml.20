Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CF23612FE
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625051; cv=none; b=qPBTAVP0g21+yqe9OzXnevQahC3L/985HS5JC08nz+wT/MXbyJXfOevqWNsDQXIsGyO9/vuvrVzJEgCujzk0LXnU2VeQMIyi+CpVaihDX1CoBadYyzknUwljgU/hWg30e+F3sbxyi5xmITo4g9/jiEi9MGZUXmQCbAFMWTNzW2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625051; c=relaxed/simple;
	bh=ltt9zE6z3uKk7G9wFlXs2vJoYj+bEy3/3oRBZ1Lh1QE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=h/kVlBkLJFvA/ZnHyPWRJ6ymasd5K95bG+MGNT/eu0YOPW6yMFAyP3NEOzXJiowE0XPD0DDjXAN288dyZm8Oucc1InuLPGfNsuCfrj79HNLSXPYNH+arjij48RrabhdyKIryjyLI/05RowNfDWBrOj742tXOBegIyRUyAvAOlHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c467e19391so1010128b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791625048; x=1792229848;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uysb7hrMW18ta6csFuo/tjmPM1oPyOV160RXUd7+cRo=;
        b=YDFhU6ONKBhLx3ge5dIVtRrkTtlTE/L7eld7BgBzzrCi0ExMPeuwT21/2pUck6udIs
         Ito8ksCyJN0xqzVKFFQm4dslhkfWnarqEGKY5y9KE/BQzJ0rhxfzyCnDY+GSJR65w5SV
         RWRwi5uN2+8T4kAo8dfIB+F4kDKpJsBHkPyIsszXS81ORQ1k2Ef0bFiZ0wziPyj9Nqk9
         QYecmIvE0jg0NsJJVEncjCIOGyhOQTTuqIwxZyrhratN/W8hwSamxBmS5er6Zj/AwLIN
         cISuX5DcuqT96SldP2/LLoZMhrnJtYZy4x2ueF0PU/dpvZDMaod//a9QKbZXqe37SB/F
         W4Pw==
X-Forwarded-Encrypted: i=1; AKwUvBzAIwz1fd4PlPWFNTNCU8DmSRR9Pr8pUqRDE8bjIdeO2v2JBVIMQaDiJnUy9HsZOJpgflL/hs91gSRgHz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+MyjGDF33cEwOVNYNEF0Mtlp9fkZaKC/wEiJL11GLUa6hwZ5H
	XUobD3Car2+oY1JDttp4+ZoYb0HOj8AgSkfrW/07mAwqa0aLyG0hPKzkNALMjw+0Btp7sRqXu83
	Kj5pwkuT9/yxXOStw5C15IdSlDisUglb8nRXN8HaW/Q+1VDae2lm+vKsnOuM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4495:b0:4d6:90d3:e184 with SMTP id
 5614622812f47-50c57b6e9f2mr3181357b6e.45.1791625048377; Sat, 10 Oct 2026
 02:37:28 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:37:28 -0700
In-Reply-To: <6a9d5836.a5e650b3.26d8a.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aca0758.70ed5d86.2ac85.00ab.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] kernel BUG in jffs2_sum_write_sumnode (2)
From: syzbot <syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    3857c2fe5449 Merge tag 'pci-v7.3-fixes-4' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1433f199580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3e4baf48b1a52e1
dashboard link: https://syzkaller.appspot.com/bug?extid=0727f46a0571de01bf93
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1233f199580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com

block2mtd: Using custom MTD label 'testjffs' for dev /dev/loop0
ftl_cs: FTL header not found.
block2mtd: mtd1: [testjffs] erase_size = 4KiB [4096]
jffs2: notice: (6012) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
jffs2: warning: (6012) jffs2_sum_write_sumnode: Empty summary info!!!
------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:868!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 1 UID: 0 PID: 6012 Comm: syz-executor253 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
RIP: 0010:jffs2_sum_write_sumnode.cold+0x4e/0x174 fs/jffs2/summary.c:868
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e 2c 01 00 00 8b b3 40 06 00 00 48 c7 c2 80 9d 33 8c 48 c7 c7 80 99 33 8c e8 2d 6e f8 ff 90 <0f> 0b e8 65 49 e2 00 65 4c 8b 3d 45 e4 63 14 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc9000347f9a0 EFLAGS: 00010286
RAX: 0000000000000045 RBX: ffff88802f168000 RCX: 0000000000000000
RDX: 0000000000000045 RSI: ffffffff81ea14b9 RDI: fffff5200068ff25
RBP: ffffc9000347fb20 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff88807b45a080
R13: 0000000000000000 R14: 0000000000000012 R15: 0000000000000000
FS:  0000555557c2d400(0000) GS:ffff888122a44000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ab45d7ad51 CR3: 0000000021ea9000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 jffs2_do_reserve_space+0xb94/0xf70 fs/jffs2/nodemgmt.c:392
 jffs2_reserve_space+0x605/0xbb0 fs/jffs2/nodemgmt.c:201
 jffs2_symlink+0x172/0x1160 fs/jffs2/dir.c:317
 vfs_symlink fs/namei.c:5823 [inline]
 vfs_symlink+0x178/0x4d0 fs/namei.c:5802
 filename_symlinkat+0x2a6/0x560 fs/namei.c:5848
 __do_sys_symlink fs/namei.c:5875 [inline]
 __se_sys_symlink fs/namei.c:5871 [inline]
 __x64_sys_symlink+0x79/0xb0 fs/namei.c:5871
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fda09c12537
Code: 00 00 90 48 83 ec 10 48 63 ff 45 31 c9 45 31 c0 6a 00 31 c9 e8 6a cd 02 00 48 83 c4 18 c3 0f 1f 44 00 00 b8 58 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc31fc8508 EFLAGS: 00000206 ORIG_RAX: 0000000000000058
RAX: ffffffffffffffda RBX: 00007ffc31fc85e0 RCX: 00007fda09c12537
RDX: 0000000000000000 RSI: 00007fda09c7eff9 RDI: 00007fda09c7b2b0
RBP: 00007fda09c7ef8c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 00007ffc31fc85e0
R13: 00007fda09c7efa1 R14: 00007fda09ca7cc0 R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jffs2_sum_write_sumnode.cold+0x4e/0x174 fs/jffs2/summary.c:868
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e 2c 01 00 00 8b b3 40 06 00 00 48 c7 c2 80 9d 33 8c 48 c7 c7 80 99 33 8c e8 2d 6e f8 ff 90 <0f> 0b e8 65 49 e2 00 65 4c 8b 3d 45 e4 63 14 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc9000347f9a0 EFLAGS: 00010286
RAX: 0000000000000045 RBX: ffff88802f168000 RCX: 0000000000000000
RDX: 0000000000000045 RSI: ffffffff81ea14b9 RDI: fffff5200068ff25
RBP: ffffc9000347fb20 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff88807b45a080
R13: 0000000000000000 R14: 0000000000000012 R15: 0000000000000000
FS:  0000555557c2d400(0000) GS:ffff888122944000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ab45d75950 CR3: 0000000021ea9000 CR4: 0000000000350ef0


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
