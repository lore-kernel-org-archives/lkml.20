Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978365;
	b=tk5M3y0Z9KWcrKfB6gPSVj5xpo3s/x/YKLQRqr9/gaSR+GbHDiUnEKufh9PoYFHGgQE0
	 Ab9DnnhOEJOIn0AGqTbe9X8jiLJWOxKU9XO3f/T1nNElY9n8bUWVctQvLQZw+99bEkERE
	 ZCfmhF3Z6aiBhvDDvHRTmUsdQg/Eqzu7xutPHvA9FGhQc3cvw69vvq5d/d2wgSRxb9MvV
	 lH1IVDZ42mVOdtgoe8pc1UasuiTRQU9ZR0xBBO8GM4t0uQOqJOi2w6v7LpMqG8Vh9Tf/R
	 PWyLWAHuYl2nNqxRWJQU0BVxqbNvI2th8PWJlo+OWpFTJPTeX+gxmLmhG02+JKJgs5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978365;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=1WrAPJVqztXGeicWZ8YmBuP6dCF2HqU/IaTH6pLRzhE=;
	b=cQBNNog9HKrbbVFgTUcBtLxr8wUGcASebP799K38Yh5tlZNLR4JnCJm7crSBnAenZmQP
	 Sp4Xgolwh+UXDzKxNgDDqKpoimUNzIM1B/v0hdl0eMjhQhWksULl6muj8ll2/DoVzLKLk
	 RLqK0hgJ/IL1ijKMtnOp/4i+pGLQvUHjMIxYu4e6+d1d68D3dzpVvhdAiz+JiSj8CMsc2
	 BdFG0m9N1IkEcRtsjYaLcWltqzvP5Qf3fBvTGRevnjthcaxt3TdG/n/YiAHWejOFNXkaK
	 eSxVpSXHoFrwrEvQh17o72FhyuvkxjFPCIrfv6IIS2RyKS9TDYXs1ySMqIa+oR9+a5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EDA606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12EDA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54dbbf252cdso4402324b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978364; x=1793583164;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WrAPJVqztXGeicWZ8YmBuP6dCF2HqU/IaTH6pLRzhE=;
        b=EpXs4Yv67rrSxxZ1+gXJz2mfHm0IfJYOrWODArZks6ljuDlGZrneqN7pcQkRYtDseR
         /BVNCrDcYhFe5h+BDv6t8eHO/T8ArPeJIyIDcUSXjRkadWEYVTB4uZLD3vcmgmP39RLU
         +7mAK+znL6f1qDeYn1jUeHoNtANs2dnkd9LfiAgiU7la3hiKRIN5wXujWTyITvD3uSvJ
         MYijo2XFsw0o4ozlounmG+0mdORnaWrYDcrFfWFbJQvMRI8jXNozWPVnYYyfpcRFPtx8
         RZ/C1j1qFWW1e2okMZHC3b29cQvpM1ZKzZqEDN/BxK55m5s3Iism1AJ9JhirVosNsS5M
         nImw==
X-Forwarded-Encrypted: i=1; AKwUvBwQLz2nW1ZkUm2tIW5/h/19VXvxJhPO5y7KnPO+sWbBrCPqDQgn7zw0AQeFPfEu/Xa+kadoapEyHwaMa5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKccjr0zNo9a2dMaBTq6BYWpwhuqOr9lrUVI4Ge84qBNn2mEjLf
	jav+GpW5dkDpRYLcs3Rusv+5hkmVDGoG/Sr9bBMwrhw+loGKGJ/7trGtKKjF22kumlHkQENk/sj
	z+F4TGs4mNF7gL2I71/BH3HfcVf9Q1dlDz7i9unuB4LNqKM3SgbB6m31o3u0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:220a:b0:4ed:7045:d3bc with SMTP id
 5614622812f47-55c002d9ed3mr3460748b6e.32.1792978364068; Sun, 25 Oct 2026
 18:32:44 -0700 (PDT)
Date: Sun, 25 Oct 2026 18:32:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adeadbc.a6443767.132891.0050.GAE@google.com>
Subject: [syzbot] [wireless?] WARNING in cfg80211_cac_event
From: syzbot <syzbot+3df76a08d929e91e5327@syzkaller.appspotmail.com>
To: johannes@sipsolutions.net, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    734bef548a96 Merge tag 'net-next-7.4' of git://git.kernel...
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12a55469580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0f4f48df8e34eb3
dashboard link: https://syzkaller.appspot.com/bug?extid=3df76a08d929e91e5327
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/585a51a9cc57/disk-734bef54.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b2888e6093ab/vmlinux-734bef54.xz
kernel image: https://storage.googleapis.com/syzbot-assets/74d0b6ec60eb/bzImage-734bef54.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3df76a08d929e91e5327@syzkaller.appspotmail.com

------------[ cut here ]------------
!time_after_eq(jiffies, timeout)
WARNING: net/wireless/mlme.c:1309 at cfg80211_cac_event+0x45b/0x6e0 net/wireless/mlme.c:1309, CPU#1: kworker/u8:3/2120
Modules linked in:
CPU: 1 UID: 0 PID: 2120 Comm: kworker/u8:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Workqueue: events_unbound cfg80211_wiphy_work
RIP: 0010:cfg80211_cac_event+0x45b/0x6e0 net/wireless/mlme.c:1309
Code: fc ff ff e8 67 a8 7d f6 90 0f 0b 90 eb c8 e8 5c a8 7d f6 48 8d 3d 85 18 43 06 67 48 0f b9 3a e9 35 fd ff ff e8 46 a8 7d f6 90 <0f> 0b 90 e9 82 fe ff ff 89 d9 80 e1 07 fe c1 38 c1 0f 8c 24 fc ff
RSP: 0000:ffffc9000328f918 EFLAGS: 00010293
RAX: ffffffff8b4abdda RBX: 0000000100010317 RCX: ffff888031c13e80
RDX: 0000000000000000 RSI: ffffffffffffffff RDI: 0000000000000000
RBP: 0000000100011a86 R08: ffff888031c13e80 R09: 0000000000000003
R10: 0000000000000005 R11: 0000000000000000 R12: ffff8880569213e8
R13: dffffc0000000000 R14: 0000000100011a87 R15: 1ffff1100ad2427d
FS:  0000000000000000(0000) GS:ffff888123b6b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd8c6a5cdc CR3: 000000007562a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 ieee80211_dfs_cac_timer_work+0x264/0x380 net/mac80211/mlme.c:3995
 cfg80211_wiphy_work+0x29e/0x420 net/wireless/core.c:610
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
