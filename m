Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D799B2110E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789952616; cv=none; b=pdtLjdRmxabHn67OHc9ym/HtzbBlm3Bw3vmPhqHWyk09dU0zsU7EwjyTzkHRcPcOnfgEwdRfPXHg0/hlhOJZE0WS6VIiDk1K7oyvZlU4mBygLnrBjXjK2TJAzvymRK5pLD5eFc4yZhjM62omREV0aXdvZLhe3Kj1BW0Gf+4TBSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789952616; c=relaxed/simple;
	bh=PgeuqQTq9W1vWB7P0kp7Q+m+/JUt7Stg6tA7IteQVL4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TKz9b+UrLKzq7EBM0ZPaOlXPDNl5El4YpOlnyTVo2A0SzRtZ4GJ7Gzp5SvXvQ1yjj6SMbMNpc5n6ntqbimg7NeUHRtewfyNFa2uDCKsdlqqo7eAULOBh5aqpLHbdyiplR+v9ZDX7AvJTCe9IVLE8yhq/SMZ9VyzO61djhsUoWkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6b1bebb3ae8so1236575eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789952613; x=1790557413;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/JWRPDnmTzkO48RL49AOEHMRmvJYjnSTPOTUHlxfVU=;
        b=qnoTleX7D1AW0GHh4SCCKaBSz4JOVtXIhcCvGrYLT0M2xrBAbpnswA0UOoN3kGx6//
         DUKYSYTparumUVyrBAyco7pkBNJsqbdlgJpVm9e7uCmLkJDsHvolrSCVx4TOwjUTTC3e
         mzFA9kCBvyOzCrp/Jya6VSEGn2WkU/liWDHMkSzCywyvTer1LWtyT4Vnmslz/96Tg5sn
         UW6rW12IovARB1c0Upu3tFnb7e6FtA7wlM17S2kZfOUBjx061RaPppEKLihQVbKQ6L2R
         /jDKYDEdtqq3uMNJGmmYPNeRLan4H5Doke91k3Zy6oPW0sEKA0J+ydb6N1NwSRR+MwwY
         dbMw==
X-Forwarded-Encrypted: i=1; AKwUvBzNfsGyj07ChG5BxE55+juX8yf9+V9NF7aStW++1GgJpGZOvBYwA2iOb9Lg4LwTEtzhIOyfVBsRYzZ9Ue0=@vger.kernel.org
X-Gm-Message-State: AFuF++m5TmNpCNKpZzfvb3LDyqdC4a42Rcvib6DWVY9PWhKTMZcuFmPU
	Kk/chVgteKc9CqbCTTvI409dYQZ4VqG3R+80pYK4unSzTZKnP3uAlSPVX+pIO+YkyNj4ygfTBRB
	r9wqEKAICJKL6jW83paJmvjck2koPt3Q/RD4lubjwIihrZpA9s+zT+j/55t0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f036:b0:6b1:2f12:6c0c with SMTP id
 006d021491bc7-6ca9bf4f83amr8557844eaf.34.1789952613686; Sun, 20 Sep 2026
 18:03:33 -0700 (PDT)
Date: Sun, 20 Sep 2026 18:03:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab08265.71f81b7d.15fa6d.001d.GAE@google.com>
Subject: [syzbot] [mm?] KCSAN: data-race in copy_mm / lru_gen_del_mm (3)
From: syzbot <syzbot+c6e1b1b32ff2fc3b7d60@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axelrasmussen@google.com, baohua@kernel.org, 
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	syzkaller-bugs@googlegroups.com, weixugc@google.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    17e7b8eacf4c Merge tag 'cifs-fixes-7.3-rc4' of https://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11d6c525580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8372e2cd52628d4f
dashboard link: https://syzkaller.appspot.com/bug?extid=c6e1b1b32ff2fc3b7d60
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/60ea54622289/disk-17e7b8ea.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/675e38c8bebf/vmlinux-17e7b8ea.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1006b8efd827/bzImage-17e7b8ea.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c6e1b1b32ff2fc3b7d60@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in copy_mm / lru_gen_del_mm

write to 0xffff8881077eb088 of 8 bytes by task 7336 on cpu 0:
 __list_del include/linux/list.h:241 [inline]
 __list_del_entry include/linux/list.h:264 [inline]
 list_del_init include/linux/list.h:333 [inline]
 lru_gen_del_mm+0x299/0x3e0 mm/vmscan.c:2998
 __mmput+0x17a/0x1c0 kernel/fork.c:1203
 mmput+0x40/0x50 kernel/fork.c:1216
 exit_mm+0x113/0x1a0 kernel/exit.c:617
 do_exit+0x438/0x1510 kernel/exit.c:999
 do_group_exit+0x138/0x140 kernel/exit.c:1154
 __do_sys_exit_group kernel/exit.c:1165 [inline]
 __se_sys_exit_group kernel/exit.c:1163 [inline]
 __x64_sys_exit_group+0x1f/0x20 kernel/exit.c:1163
 x64_sys_call+0x254f/0x2550 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff8881077eaa00 of 1728 bytes by task 7337 on cpu 1:
 dup_mm kernel/fork.c:1537 [inline]
 copy_mm+0xd6/0x340 kernel/fork.c:1595
 copy_process+0x10ad/0x2340 kernel/fork.c:2310
 kernel_clone+0x1c0/0x5f0 kernel/fork.c:2769
 __do_sys_clone kernel/fork.c:2911 [inline]
 __se_sys_clone kernel/fork.c:2895 [inline]
 __x64_sys_clone+0x143/0x180 kernel/fork.c:2895
 x64_sys_call+0x2479/0x2550 arch/x86/include/generated/asm/syscalls_64.h:57
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 7337 Comm: dhcpcd-run-hook Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
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
