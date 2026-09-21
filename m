Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6314AF9D4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003284; cv=none; b=bwGMYeZxoV10IKFxIzbkVPuAfDiiwUmsWpT4vZqjUv6wilKFQtec/vQ4r3HGrMsvzc2/JOnAXFeomU0VWKHABCPSuvc4HCwE1rJDO5QnOz//NFCkQdHTlKOrOISkX25uBadjyIuuJBfvUAahs08gfmFMMiAacljcrvBJwtVa7zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003284; c=relaxed/simple;
	bh=ncbxfCvot7fu/Zg+Gzm+D6gktbvHNhD00vzNR9ki5is=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RqBLo1mKmEWYPW95TFoQ21nesZF4bK9Q3Gc6szso/zvDjf9AY7GhICPcmBiMXL43E1gYQZ0wyjGGDaGKggNoIbYcQN35n+lADE6Ckk8SZly5/bil9gBVTRrsKpFGApKBrBkHDUtiix52w4e9jA3/Qdm2TQN4D8HkpdahGVZdB+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c7f887ac6bso4518974b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003282; x=1790608082;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FSwFlhmPGFn5Duvois/IG+KiVLo/Vyg294KnrEoq2Ic=;
        b=Y8J5dNldCRxuI9o1Ie6hnrQ1S6Z8PhUASuCSoTdOCVXX1nJawgW1IqA2fSH7+nHLNM
         HeW5k1sP6WiBu+LoNsRaQSwtCybHY3MH+nYkNkzJaLkxyjiogJiq0BrxHLT7knUPJltD
         hOVk4oA+fbCEZCsZMlO9nzj8a24FVA153yi0F+llfl7aIQWeuxsEvS16+n9JRoGzCaAb
         WJu/aXYwlCjos1+GLhMMG5ZiECxS7AqyyT9WTwcvKvQaRSGF46I/MIIBe/aRsW3N6PXK
         Veypn1b0cOnqkbb/AmIfVvd2a5tjPkrGmmPJIXVmjLoGWd/BKcUJGiEX/f4pBngBfZ/R
         IPWQ==
X-Gm-Message-State: AFuF++nMSSBCI1YFkWD3moSWCV2NfbFaJEiaBDZNgEJpLjxbU5AocuAR
	edJgHsCglgqgBbvcdY1Dp6RK08MJPf3SoywsFwpWKp+n2LaRqacToxTLAkzLJiUD5SYfPMOxphC
	bZPS5GcbLEWckc389Gv1ZDnYtkVtArVGvm3UXw+8xH41dFrV8LalyGYRcAYk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e912:0:b0:6c3:5bdd:1753 with SMTP id
 006d021491bc7-6ca9a12e996mr9541606eaf.2.1790003282021; Mon, 21 Sep 2026
 08:08:02 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:08:01 -0700
In-Reply-To: <20260921142756.10991-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab14851.514bccd6.255447.0016.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in ntfs_evict_inode

------------[ cut here ]------------
ifs_up != folio_up
WARNING: fs/iomap/buffered-io.c:298 at ifs_free+0x352/0x420 fs/iomap/buffered-io.c:298, CPU#0: syz-executor/6287
Modules linked in:
CPU: 0 UID: 0 PID: 6287 Comm: syz-executor Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:ifs_free+0x352/0x420 fs/iomap/buffered-io.c:298
Code: e8 83 47 61 ff 90 0f 0b 90 e9 d5 fe ff ff e8 75 47 61 ff 90 0f 0b 90 e9 12 ff ff ff e8 67 47 61 ff 41 c1 ee 03 40 0f b6 f5 90 <0f> 0b 90 48 c7 c7 20 94 81 8b 44 89 f2 e8 ac 11 c2 fe eb b0 44 89
RSP: 0018:ffffc900045b7698 EFLAGS: 00010202
RAX: ffffffff826553d9 RBX: 1ffffd400023e8c8 RCX: ffff888026ef3e80
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 000000008265d200 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff9400023e8c9 R12: ffff88801f2cdb84
R13: ffff88801f2cdb00 R14: 0000000000000001 R15: 0000000000000000
FS:  000055557ccb3500(0000) GS:ffff888125bcb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb94f093eb8 CR3: 000000002577a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 folio_invalidate mm/truncate.c:140 [inline]
 truncate_cleanup_folio+0xcb/0x190 mm/truncate.c:160
 truncate_inode_pages_range+0x2c4/0xd80 mm/truncate.c:404
 ntfs_evict_inode+0x19/0x40 fs/ntfs3/inode.c:2012
 evict+0x624/0xb50 fs/inode.c:822
 dispose_list fs/inode.c:864 [inline]
 evict_inodes+0x7e3/0x870 fs/inode.c:918
 generic_shutdown_super+0xaa/0x2d0 fs/super.c:741
 kill_block_super+0x44/0xa0 fs/super.c:1904
 ntfs3_kill_sb+0x44/0x1c0 fs/ntfs3/super.c:1940
 deactivate_locked_super+0xbc/0x110 fs/super.c:589
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1317
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd2acb8f397
Code: a2 c7 05 5c 43 25 00 00 00 00 00 eb 96 e8 e1 12 00 00 90 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffed59dc6e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007fd2acc244bb RCX: 00007fd2acb8f397
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffed59dc7a0
RBP: 00007ffed59dc7a0 R08: 00007ffed59dd7a0 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffed59dd830
R13: 00007fd2acc244bb R14: 0000000000037dd0 R15: 00007ffed59dd870
 </TASK>


Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1034f005580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=3db654d91b471c4d7a7d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10719005580000

