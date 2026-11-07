Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013479;
	b=O8TKNenyZCkszBCRFYlrJ12kIIzwd9naB1UtuAqvBYQCcCsfjb7HF15f1wrXh1q8R9Jn
	 qNZie5jNSMGQmCJtZ7D/oEfJJopvQ50y7I/9u++N9/qSANqcAh8CF0ZLlKks6ZsKu4pxz
	 7AEdxX9Mt9oOYdgRJlssQi9lJMrYScM8GSyx461YJVk3UKd0pAhyn6NX8V6wW+jyq+r2y
	 QAVOrO2hUHZYrKFPvhT3z1tTrQ0aMlS3553Bp37b8h31JjJjpYQqpaIdkAg7RxYxxA6sD
	 9PHyZBjErSAcxFPgZHLdtET5vAZQUGs2ZH2aDaHhV86c+WL82PUp1opSH1WsVg7nZRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013479;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=aQAkv1Ch1hBWt9F5oKlCKZa1WGD0uucsNqTVeJRSM+g=;
	b=zUCs8j1rSZpgOITvBMuaMuHTMsYOmVGXk12084encAp32slqLh6BN2kKgXZt4c3AdSl6
	 PgQuWNslfC1dRjBFj+ov3MaqKZNQHAhsHaThEJCqAsXEPiWqfpkjOGswE7wDM4z7VQn8T
	 uPr4T4CrQ2Ev8aP2YeZa2GBoaOSVWvIiip9a805d0jmvDPMbHWBZZqcq1ixXr6rbJi6XI
	 fG0Le6arJOfRLeki0XHixieDnRVPXHEH3rn6wi5MgdDmyj2rMt1jWRdJv0FOsJqQY/rm8
	 cWWXDiWEyHJO6+/XWWp97YMDiNT6L50zuVcyfmSOXEsga7b+AuQON2w9rh0FM6OOsrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF04606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF04606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-85d630e451aso1681070a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013478; x=1794618278;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aQAkv1Ch1hBWt9F5oKlCKZa1WGD0uucsNqTVeJRSM+g=;
        b=yKH2RWUP3mg9pFhqV+pGN/EI/1fcAjQe7GRWHIMNAKsax6eSjUiSHqSl5nlnNXj3NI
         Uj+mD2RpL383Rhnt34s+rNyt4FNcajVWmGW7zJnph+qG/9EcwGWOpekAzcaT78yknjGI
         h6olG1F5hgkjHtuupwEYoz84FkVJ8Oq7g6Qhix6S5a93s+QdUUSZUInOxEWuzhZWJNBi
         8P5vBfVQq9K/ebX6kC3pjHTzwB5F8R8hGRzQRq/DqpR0csEmBZ4KSZlGRcaaqmSt05P+
         V5w+aVJVOj0t+asWB3eMRfu23+leZWnh40KJzuZwMxrEMlMtIuoZCT6/u260x785YmLc
         EsKg==
X-Forwarded-Encrypted: i=1; AKwUvBwT0wX4mtS4d5ctYD0ei76oKcnJ1UiBo12JFJ/vIadsFzNu7BuFxb5rzcKtk26VAKj/hAfz7SsFoZMmxNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0qMUtla8uerzBzKGg82WIpxXM/7S132grMz4IvQwdglaJH18j
	dk5jdVDfroPJYBSfue/snjeMULTeG8XFte/cLJH9IPkQAZqqDUT/+J4XYbCTucHIcqDpA6xVf8/
	1a2mKLvLCu0R/hbbYe3wkXAKfB5LqdV9swYYiDlMm23EamfPQ+hDX5bft/d0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1987:b0:4f4:d7:b15b with SMTP id
 5614622812f47-567e0997171mr3468472b6e.4.1794013478283; Fri, 06 Nov 2026
 17:04:38 -0800 (PST)
Date: Fri, 06 Nov 2026 17:04:38 -0800
In-Reply-To: <6aec6433.0ce67c00.35143.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aee7926.45cab1c5.12a849.0002.GAE@google.com>
Subject: Re: [syzbot] [mm?] [fuse?] WARNING in shmem_initxattrs
From: syzbot <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	brauner@kernel.org, fuse-devel@lists.linux.dev, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mszeredi@redhat.com, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f66469d9905b Merge tag 'net-7.4-rc2' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=110ad735580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=4324f771847cecb27c54
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13bb58d9580000

AI-generated root cause summary:
In mm/shmem.c:shmem_initxattrs(), the initial reservation of inode xattr space
(ispace) from sbinfo->free_ispace is gated by 'if (sbinfo->max_inodes)', and
subsequent per-xattr subtraction from ispace is also gated by 'if
(sbinfo->max_inodes)'. Because sbinfo->max_inodes is accessed locklessly and can
be concurrently modified to 0 during a remount (shmem_reconfigure() with
nr_inodes=0), ispace can be reserved when max_inodes is non-zero, but fail to be
decremented when max_inodes becomes 0. Consequently, after all security xattrs
are successfully allocated and added, ispace remains non-zero, tripping the
WARN_ON(ispace) assertion.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=4324f771847cecb27c54

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com

------------[ cut here ]------------
ispace
WARNING: mm/shmem.c:4499 at shmem_initxattrs+0x3f5/0x650 mm/shmem.c:4499, CPU#3: syz.3.20/6999
Modules linked in:
CPU: 3 UID: 0 PID: 6999 Comm: syz.3.20 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:shmem_initxattrs+0x3f5/0x650 mm/shmem.c:4499
Code: 03 80 3c 02 00 0f 85 5d 02 00 00 48 83 3b 00 0f 85 fd fc ff ff e8 eb 3b ae ff 4c 89 ee 31 ff e8 81 36 ae ff e8 dc 3b ae ff 90 <0f> 0b 90 e9 dd fe ff ff e8 ce 3b ae ff 4d 8d 7e 78 4c 89 ff e8 12
RSP: 0018:ffffc90004fa7bb0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888031a28818 RCX: 0000000000000000
RDX: ffff88803397a580 RSI: ffffffff82603cc4 RDI: 0000000000000007
RBP: ffff888037912b00 R08: 0000000000000000 R09: 0000000000000053
R10: ffff88805aa5a973 R11: 0000000000000000 R12: dffffc0000000000
R13: 0000000000000053 R14: ffff88805aa58000 R15: ffff888037912b30
FS:  00007fd3ae9026c0(0000) GS:ffff8880d4775000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcb0d7556c8 CR3: 000000001d7a3000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 security_inode_init_security+0x242/0x370 security/security.c:1384
 shmem_mknod+0x2ce/0x480 mm/shmem.c:4087
 shmem_mkdir+0x31/0x80 mm/shmem.c:4142
 vfs_mkdir+0x36d/0x8a0 fs/namei.c:5428
 filename_mkdirat+0x4c4/0x630 fs/namei.c:5461
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd3ad99fb19
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd3ae902028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007fd3adc26090 RCX: 00007fd3ad99fb19
RDX: 00000000000001ff RSI: 0000200000000800 RDI: ffffffffffffff9c
RBP: 00007fd3ada37b70 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd3adc26128 R14: 00007fd3adc26090 R15: 00007ffcae78f808
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
