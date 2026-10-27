Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102938;
	b=Piirdye/DXBAKO/R9I1KYSBrMPPLyee/ozhUW3EMJ0NRj3Pp3wwuKpWqw7B+M5e3gn5d
	 lhu9EVwEnD0bzoegqyfh0Kn27q1dNwnFgAvIWRgvG1K7oCZswtV6zXJyFtSjuzWwHBNwM
	 nvyPiKrJCiJh/tvVU/swp/K9QpfrtEl2V6iYwQvRKjr1e7ouCTHXggbv3fL6Xyo1IVjt5
	 /viFEb/0cl1dvlK4c5bcoLA7OQkOO3Q4zsjge/glbgE+t4m/2uPvHcQ38I2cKQAwiQ/L7
	 qbwfqHQ6XSOwDNJDN7lKMDdJsMCQkZa84EGVKfYZGcu05/paDqzDEk1JKUoy+AHW3hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102938;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=3x0gcGxLoe8xh9zXM3KZqk8OeXnLeLRjDbX8BPObqNg=;
	b=jNvQp8w+KIgwPSucmBcrGldEqDwpStY4ohSIbAMPPlkE6qSBBnaSi5AReh69HiK3lCcn
	 DLBRf6P9yq+hUzPdOLCJgogD2QQR5End++wt27lfTRypmwaibxeSfJkWtLlBjrfeh/ZYu
	 zweuPciE4d6Ay07arj14R2UmDi3LXkwfxd4nQ+SGNzOJMnouEVzFPRsqvu1aLy1y5AOOs
	 WF9UWSFqZaTKqcGpmE1qUIvnOd8EEoaZZZ2PTnpD7ZctV2XfO0qZDAbGGbjDvnxHi7Md9
	 Ek+VyTIJg90/ueMpB/DYw/v8JoFyi656ObX0ah2FV+cO3bOJYWBOT1qc/sfRFKYPFEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDDE606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDDE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f2040e10d8so3696182b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102937; x=1793707737;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3x0gcGxLoe8xh9zXM3KZqk8OeXnLeLRjDbX8BPObqNg=;
        b=AlBk9KCNQW+Yzj31ddJ8ufnSGqvhlixsZuopHLunHJmz38TBRMlBWU7vecrHNEx5EP
         i9w89aeDyNjjMYthTzuiQLwx0RzmMeuyXLQeTYMueHpPIafO4LiUWojRApZxbjniGAtm
         udKgp2p5swCmr6BLbyQrbxtwlk8tPtPOS3I+4oFc0PqQeyOOPcEdiahsmwD4Jf4hBfre
         iOPyBymo0l7vhkH2ErQ3akJfqhOx2PrH2SKHxyrI0QXKfr4EN1kwKyEHY3DRQfJ8hwee
         opLF2wdM53AETF1TGdYQ2/Td/KHLiHFbdCIwe7dV+xZSVoiYok8fOnPi1nCi5Wn6XA6r
         fs9A==
X-Forwarded-Encrypted: i=1; AKwUvByNZ8ZvCfdgUROHYr6qkGoll+cEEbqrV8OXLbjmSXDNHoCX9mLxRkg4/hQvpHC1v0o+KKRY/XhK5EDrzLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwNRGhm/MqOVs8T3wUbpDSRTfpwONX1i+T8iiQ/ZxSD+8478f4
	9Y4rI34GnXPorShmCMbMTj1QFP7vlvE0pup846KWvWXHKCAO9VSrLxtyX0Kwbd+R8jmjE0QEu8W
	pQp42DFXdfYJBdh9dAMrthKHwiyqMLRMk7mggDwaoXhZDsMDfp43zR9nhSuQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1822:b0:550:de67:2631 with SMTP id
 5614622812f47-55c00414357mr5845145b6e.63.1793102936555; Tue, 27 Oct 2026
 05:08:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:08:56 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae09458.f0fe5aea.79aa1.008e.GAE@google.com>
Subject: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
From: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, cl@gentwo.org, hao.li@linux.dev, 
	harry@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, rientjes@google.com, roman.gushchin@linux.dev, 
	syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5b0764a53235 Merge tag 'drm-next-2026-10-21' of https://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13739fc9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd1433abd362f255
dashboard link: https://syzkaller.appspot.com/bug?extid=9fe09db3795456e0b442
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11cb9b0d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/05ac8658d211/disk-5b0764a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9cfb73243216/vmlinux-5b0764a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fc45c7faf785/bzImage-5b0764a5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com

------------[ cut here ]------------
!PageLargeKmalloc(page)
WARNING: mm/slub.c:6855 at free_large_kmalloc+0x97/0x110 mm/slub.c:6855, CPU#0: kworker/0:1/10


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
