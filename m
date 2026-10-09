Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8813C1D70
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540029; cv=none; b=TUtD+/6Gt3iYNsDpS3ZyVXAruMeXmx8uDSSCsTLPyxjaKN0tpoYxzbM1ED+CYp091Nxvspjp4CqkxRIC9zbVg5J1Ug8XG4783O3Qf9ji9PXW+d2AF78vbe3L63r1gu56ysLNYa+p5pHF4qxmTcuqvqUmraxZKJgFx/eTSyytbKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540029; c=relaxed/simple;
	bh=wiFcg7spgf+gSySps1xhttTxlek008Dpbvjy+jIvD7A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=EEnWyz2kwZ6e4C2CrTkYro03oZSv3xn7JORI8oXjUCClZaZnBw0uj++27BmsCUEWHFa55/G4guHMPrvN45z4RmdqmcnsXJbWuCoozm7HHAviwDsOoP3xHTe7WgJSTW36XpvqG/R9lXhez+ivPyHtOSqcqZpn3fcXuDaAMQihVUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e9eso8926771b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540026; x=1792144826;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:in-reply-to:date:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wiFcg7spgf+gSySps1xhttTxlek008Dpbvjy+jIvD7A=;
        b=vUFPHS3z9rTDxv778aGbTx95Iwvfx3N/ub5klgDbDHJ1XXhC/q0a5LI3KJlMzNfWmM
         LI+Esb6F7M2esiY4rGOvkabji6zf5GDxUaqLVWCMRDRrPP/1hk5aZc3VjkngG+fysuWu
         GNhoMr7wRzfeCVL6vHQWlE5limrmJ0mZa11Wfj0kOnGbE3lEDBvP+YvaooR4q8ng+LNc
         IWUwpxIFbJBjBMVy8BHQ5rBzNGsD5cuSapwyx1kX72jRJ8gbyIwM69gHLhAa7l5BVt5+
         5/cgTs/Auk9WPYObkNzkKgljmnKnz1/PCz8gR54IT+qEvCDpSK33bwqxNjFEMDzCtE5p
         N8OA==
X-Forwarded-Encrypted: i=1; AKwUvBxKHRaI0+er77JTt5Tyvo0Ac995ilXPMzvJ8doRqLQWM4d+na12CFX/W8hRcvvsQB8IBVs30XXzphdwacE=@vger.kernel.org
X-Gm-Message-State: AFuF++nElKcjT7lwhACJCHeX1wW1lyrSAOD7fO+ChSvLusu5N/VIXI7G
	MHvqlHYu9+S+yOyn0+TRvYqNeuwAQTnILxROJA+/0F4BmO8iC5Xirol6CRRngvrijAwk7nYUO50
	0bZ2X0WvXat9eUumplISQbFh0+gWUx6Aieq6h5QpAAGNjXTHkpzOxQfxS8js=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6406:b0:4d5:27da:a492 with SMTP id
 5614622812f47-50c54842320mr1056277b6e.44.1791540026542; Fri, 09 Oct 2026
 03:00:26 -0700 (PDT)
Date: Fri, 09 Oct 2026 03:00:26 -0700
In-Reply-To: <40467130-a611-4634-a194-ee1b155167e7n@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac8bb3a.a150a118.27e199.0022.GAE@google.com>
Subject: Re: [syzbot] [lsm?] general protection fault in smack_inode_permission
 (4)
From: syzbot <syzbot+fc1d5d9a7ebabbc27458@syzkaller.appspotmail.com>
To: khalid.masum.92@gmail.com
Cc: khalid.masum.92@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> #syz test:=20

This crash does not have a reproducer. I cannot test it.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> Try reverting the kmalloc introducer patch
>
>
>
> On Sunday, October 4, 2026 at 8:47:29=E2=80=AFAM UTC+6 syzbot wrote:
>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit: ce1e0223d8ad Merge tag 'devicetree-fixes-for-7.3-2' of git.=
.
>> git tree: upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D12555b155800=
00
>> kernel config: https://syzkaller.appspot.com/x/.config?x=3D718e346eb0b8f=
38
>> dashboard link:=20
>> https://syzkaller.appspot.com/bug?extid=3Dfc1d5d9a7ebabbc27458
>> compiler: Debian clang version 22.1.8=20
>> (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.=
1.8
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> Downloadable assets:
>> disk image:=20
>> https://storage.googleapis.com/syzbot-assets/4167e1ad25c1/disk-ce1e0223.=
raw.xz
>> vmlinux:=20
>> https://storage.googleapis.com/syzbot-assets/a0a74c8dec59/vmlinux-ce1e02=
23.xz
>> kernel image:=20
>> https://storage.googleapis.com/syzbot-assets/f6caa72edd70/bzImage-ce1e02=
23.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the=20
>> commit:
>> Reported-by: syzbot+fc1d5d...@syzkaller.appspotmail.com
>>
>> ERROR: (device loop4): jfs_readdir: JFS:Dtree error: ino =3D 2, bn=3D0, =
index=20
>> =3D 3
>> ERROR: (device loop4): jfs_readdir: JFS:Dtree error: ino =3D 2, bn=3D0, =
index=20
>> =3D 5
>> ERROR: (device loop4): jfs_readdir: JFS:Dtree error: ino =3D 2, bn=3D0, =
index=20
>> =3D 6
>> Oops: general protection fault, probably for non-canonical address=20
>> 0xdffffc018bd1a30b: 0000 [#1] SMP KASAN PTI
>> KASAN: probably user-memory-access in range=20
>> [0x0000000c5e8d1858-0x0000000c5e8d185f]
>> CPU: 1 UID: 0 PID: 5607 Comm: syz-executor Not tainted syzkaller #0=20
>> PREEMPT_{RT,(full)}=20
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
=20
>> Google 07/24/2026
>> RIP: 0010:smk_of_inode security/smack/smack.h:411 [inline]
>> RIP: 0010:smack_inode_permission+0x265/0x320=20
>> security/smack/smack_lsm.c:1260
>> Code: 83 c5 38 4c 89 e8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ef e8 1d 99 =
ab=20
>> fd 44 8b 3d 66 df 2c 09 4d 03 7d 00 4c 89 f8 48 c1 e8 03 <80> 3c 18 00 7=
4=20
>> 08 4c 89 ff e8 fd 98 ab fd 49 8b 3f 44 89 f6 48 8d
>> RSP: 0018:ffffc900058c7920 EFLAGS: 00010202
>> RAX: 000000018bd1a30b RBX: dffffc0000000000 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc900058c7978
>> RBP: ffffc900058c7a28 R08: ffffc900058c79af R09: 0000000000000000
>> R10: ffffc900058c7980 R11: fffff52000b18f36 R12: 1ffff92000b18f28
>> R13: ffff888040368e20 R14: 0000000000000001 R15: 0000000c5e8d1858
>> FS: 0000555564dc7500(0000) GS:ffff888125cc3000(0000) knlGS:0000000000000=
000
>> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007ffc8c0efcf0 CR3: 000000002ad9e000 CR4: 00000000003526f0
>> Call Trace:
>> <TASK>
>> security_inode_permission+0xf4/0x2e0 security/security.c:1842
>> lookup_inode_permission_may_exec fs/namei.c:696 [inline]
>> may_lookup fs/namei.c:1961 [inline]
>> link_path_walk+0xc30/0x1910 fs/namei.c:2604
>> path_lookupat+0xe4/0x8c0 fs/namei.c:2812
>> filename_lookup+0x265/0x5d0 fs/namei.c:2842
>> user_path_at+0x40/0x160 fs/namei.c:3641
>> ksys_umount fs/namespace.c:2067 [inline]
>> __do_sys_umount fs/namespace.c:2075 [inline]
>> __se_sys_umount fs/namespace.c:2073 [inline]
>> __x64_sys_umount+0xf6/0x170 fs/namespace.c:2073
>> do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>> do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
>> entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7fabd8aaf397
>> Code: a2 c7 05 5c 43 25 00 00 00 00 00 eb 96 e8 e1 12 00 00 90 31 f6 e9 =
09=20
>> 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 f=
f=20
>> ff 77 01 c3 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8
>> RSP: 002b:00007ffc8c0f0348 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
>> RAX: ffffffffffffffda RBX: 00007fabd8b444bb RCX: 00007fabd8aaf397
>> RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc8c0f0400
>> RBP: 00007ffc8c0f0400 R08: 00007ffc8c0f1400 R09: 00000000ffffffff
>> R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc8c0f14f0
>> R13: 00007fabd8b444bb R14: 00000000000345b3 R15: 00007ffc8c0f25c0
>> </TASK>
>> Modules linked in:
>> ---[ end trace 0000000000000000 ]---
>> RIP: 0010:smk_of_inode security/smack/smack.h:411 [inline]
>> RIP: 0010:smack_inode_permission+0x265/0x320=20
>> security/smack/smack_lsm.c:1260
>> Code: 83 c5 38 4c 89 e8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ef e8 1d 99 =
ab=20
>> fd 44 8b 3d 66 df 2c 09 4d 03 7d 00 4c 89 f8 48 c1 e8 03 <80> 3c 18 00 7=
4=20
>> 08 4c 89 ff e8 fd 98 ab fd 49 8b 3f 44 89 f6 48 8d
>> RSP: 0018:ffffc900058c7920 EFLAGS: 00010202
>> RAX: 000000018bd1a30b RBX: dffffc0000000000 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc900058c7978
>> RBP: ffffc900058c7a28 R08: ffffc900058c79af R09: 0000000000000000
>> R10: ffffc900058c7980 R11: fffff52000b18f36 R12: 1ffff92000b18f28
>> R13: ffff888040368e20 R14: 0000000000000001 R15: 0000000c5e8d1858
>> FS: 0000555564dc7500(0000) GS:ffff888125cc3000(0000) knlGS:0000000000000=
000
>> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007ffc8c0efcf0 CR3: 000000002ad9e000 CR4: 00000000003526f0
>> ----------------
>> Code disassembly (best guess):
>> 0: 83 c5 38 add $0x38,%ebp
>> 3: 4c 89 e8 mov %r13,%rax
>> 6: 48 c1 e8 03 shr $0x3,%rax
>> a: 80 3c 18 00 cmpb $0x0,(%rax,%rbx,1)
>> e: 74 08 je 0x18
>> 10: 4c 89 ef mov %r13,%rdi
>> 13: e8 1d 99 ab fd call 0xfdab9935
>> 18: 44 8b 3d 66 df 2c 09 mov 0x92cdf66(%rip),%r15d # 0x92cdf85
>> 1f: 4d 03 7d 00 add 0x0(%r13),%r15
>> 23: 4c 89 f8 mov %r15,%rax
>> 26: 48 c1 e8 03 shr $0x3,%rax
>> * 2a: 80 3c 18 00 cmpb $0x0,(%rax,%rbx,1) <-- trapping instruction
>> 2e: 74 08 je 0x38
>> 30: 4c 89 ff mov %r15,%rdi
>> 33: e8 fd 98 ab fd call 0xfdab9935
>> 38: 49 8b 3f mov (%r15),%rdi
>> 3b: 44 89 f6 mov %r14d,%esi
>> 3e: 48 rex.W
>> 3f: 8d .byte 0x8d
>>
>>
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzk...@googlegroups.com.
>>
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>>
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>>
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>>
>> If you want to undo deduplication, reply with:
>> #syz undup
>>
>
> --=20
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/40467130-a611-4634-a194-ee1b155167e7n%40googlegroups.com.
