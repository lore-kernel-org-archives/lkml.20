Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A966F29AB02
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044866; cv=none; b=H8DSkbnYQhB2tCgZfCHutyZHFj50nhyM2Iw55y9vk4vOpdxePsvzW/C5449hQ63D3kmXrk+8nDs8a1re5JoGnE7w+S/UQY7Vg6hJUouYGIWyr/Z53ZcP8d/kz+pnRN1T93rPPhKktGha3P+90en0LtA2P9X9FIeWyY9N3ZwSIZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044866; c=relaxed/simple;
	bh=lU99Dt4trAWs6vcpxpwjJ9lPSAC0ytnhTnOlTmHJHZM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=a1dy+4vTHw1UY2g3SC4GJbVps1ALVdkCIlzVLwncZzS2o+gARwiQnvqD/9OLpsYhxczAeT3tCeHL5bSlLBqBkoXaDY1IzK0at1jZ/P3/KUf/1V1e5Mv1txKIrhYuBbTk/3c39ox2sQmy52taxCi+cf/EvvwTlUnQZmluMZ/g5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a313ec13ceso6497821eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044862; x=1790649662;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SnLOtDIjriAsPijJTR8/5Uf1YvOm3vz1zVZI0dFCmgA=;
        b=nX9Jlbq30Z2JY6noW1MU8+K9FZXlddTKSmWqk41qtMhyyJidRYlxArxRLam85It1NI
         oRU1zeWT6awf4Yu9nSk6t9MkamqlqOu8OGaCDciQfv0YAXkJY+uSQaKkdEjIQKrMiEx3
         5v+8FWuEQcM+3hBKT81wyrgP+J2nTfrPxDa3kxwDUHAqgCxESWcJaZd3ZX3mIxD2RbPg
         5ZiV34sl9PnVYtwbzMwyg0iM01MhGXojIWYN03sedCl7iWBdKgZQZHagn87OWLLIFaKc
         keKDcnaj3LI1Q7lv8/LfyTKrHG1NBok42i1W1/GOH7yughtr2n1PeYn6RtXJGKvxr/Jq
         x8sA==
X-Gm-Message-State: AFuF++lE5t6a9DBaXzuf+M+WJ1ZUeglX0DuikY84BcYNxDoxWFOmGPJ4
	1GV7UZx4H7i6sUAC+xIb7/CBYvYZCJBeRwQu0X4P+TKdSSZ5uqcieMk+Al8cUktD3g3y983ih3M
	/7Rr0YWIuqvvHm+9z3PXOKVvEcnf9E5VdT77uNgjOtN4lFMKHzqZ37hv44F0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:168b:b0:6b6:f16d:d672 with SMTP id
 006d021491bc7-6ca9a63e9c6mr10879588eaf.16.1790044862508; Mon, 21 Sep 2026
 19:41:02 -0700 (PDT)
Date: Mon, 21 Sep 2026 19:41:02 -0700
In-Reply-To: <179001646572.88583.7894729070981725004@proton.me>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab1eabe.71f81b7d.15fa6d.003b.GAE@google.com>
Subject: Re: [syzbot] [block?] WARNING: suspicious RCU usage in mas_start (2)
From: syzbot <syzbot+b48868c46e62c1c4cb2c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, paolobertinetti200f4@proton.me, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in io_wq_put_and_exit

------------[ cut here ]------------
time_after(jiffies, warn_timeout)
WARNING: io_uring/io-wq.c:1378 at io_wq_exit_workers io_uring/io-wq.c:1378 [inline], CPU#0: syz.0.29/6458
WARNING: io_uring/io-wq.c:1378 at io_wq_put_and_exit+0x736/0xaa0 io_uring/io-wq.c:1407, CPU#0: syz.0.29/6458
Modules linked in:
CPU: 0 UID: 0 PID: 6458 Comm: syz.0.29 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2026
RIP: 0010:io_wq_exit_workers io_uring/io-wq.c:1378 [inline]
RIP: 0010:io_wq_put_and_exit+0x736/0xaa0 io_uring/io-wq.c:1407
Code: 78 22 e8 5d 74 ee fc 4c 89 e7 4c 89 fe e8 a2 c4 0d 07 48 85 c0 75 18 e8 48 74 ee fc 80 3c 2b 00 75 bb eb c5 e8 3b 74 ee fc 90 <0f> 0b 90 eb d8 e8 30 74 ee fc 4c 8b 2c 24 4d 8d 7d 08 4c 89 fd 48
RSP: 0018:ffffc9000207f838 EFLAGS: 00010293
RAX: ffffffff84d967c5 RBX: 1ffffffff1d41e50 RCX: ffff88807d221f40
RDX: 0000000000000000 RSI: ffffffffffffe945 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff907a517f R09: 1ffffffff20f4a2f
R10: dffffc0000000000 R11: fffffbfff20f4a30 R12: ffff888028864018
R13: 0000000100003546 R14: 0000000100004c01 R15: 0000000000001b58
FS:  00007fd861d256c0(0000) GS:ffff888124ccb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055944da2bd51 CR3: 000000002b20a000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 io_uring_clean_tctx+0x12e/0x1b0 io_uring/tctx.c:258
 io_uring_cancel_generic+0x6c0/0x7d0 io_uring/cancel.c:655
 io_uring_files_cancel include/linux/io_uring.h:20 [inline]
 do_exit+0x39f/0x2360 kernel/exit.c:952
 do_group_exit+0x22d/0x2f0 kernel/exit.c:1155
 get_signal+0x121b/0x12c0 kernel/signal.c:3112
 arch_do_signal_or_restart+0xbb/0x860 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x10e/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd860d9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd861d250e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00007fd861025fa8 RCX: 00007fd860d9e159
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007fd861025fa8
RBP: 00007fd861025fa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd861026038 R14: 00007fffbb02fd80 R15: 00007fffbb02fe68
 </TASK>


Tested on:

commit:         f0100363 Merge tag 'xfs-fixes-7.3-rc5' of gitolite.ker..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=1147745e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=b48868c46e62c1c4cb2c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=114f3525580000

