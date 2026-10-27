Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081804;
	b=f+QanMRANy8S6eC98ILuPdkMSnLxfYRCo5qZVszwP4N5rLDNk7JupPdV469otMs8KiXw
	 dUJ4qasY+AWF2msHGIk+YDFC+yx4XbSoFi+RLTuN/vNlT9BnylTkdqAfFS+vYjPVR+OYy
	 ZBOcsDoEOyMgE7206mc+iFLkb6OVplAOI5OclwtYlfUt/sPcF2odlN0Fnc+V5wmv5c+po
	 W4Jne3O9giYiFZyZXopB0tprcLLrwRATrHOoGhJu9GovgSeEFz0sHSgZqiNv7GwJiUPC3
	 yc+ojCoMXtZkDyBQRwlwQcQSzHPrRGwyOE22SEUQp3lLxmG0gL2fzTrL5og/jAUe58w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=NzMh65B9AZkRaXJPotcmGK1ir72uv2PdqZaO7KODNg0=;
	b=YbOnHun9RxDTS7+oyuXnAf8JWI4cCYeL8lbhC9P4poX2lcK1POybmLrHPuSsUyCIC3dY
	 3gSnUALXipQiCf4laQHYaZ2xpFlGgL5CYDYBgMPpT0CYRefnCOMCWSMlWFKyuh3z1TGtj
	 Cavc2KNgDPNnYRMf7DGFGumAkxlq4qcywRowU5lP8VSV4KMFZEsgyhFKd5H/+MUCbxWwm
	 ddjCJRTKTMNtbyvBP4tFTE6EQ/VMIeodF5nTi3zTV6vR0sg/xAV5WayDMNBIsSIUHy42c
	 boos63ptK1SNrurtfLolvjQMJiD9AAiO6FsM2wRYyoTsd2RQGtpZC0YZrRFlGUcMYGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23EB606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b26d8d2498so5469866b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793081803; x=1793686603;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NzMh65B9AZkRaXJPotcmGK1ir72uv2PdqZaO7KODNg0=;
        b=2DmA31qGhtdP2USb/+pjUlN7e91YT18/4tt080Iowy8F9GtIQwWD2ejQbWs4NzF1zO
         5xLmsoc9sLEUyVrIKl+mvhitYIR0G9CRwt/WdU/ohKeFCKiviw8DoL5vU/sANTAtDjHb
         bktA9s2oAKMyoSFkDeZNvXIHGjVWDhkt6iRK5ldniEpNJpIhFD5Rht3hKTS/l52f7KJn
         /K1jHb1HA9ESY+IBuRxtQPKruNh6xK3HIHRJ/9nBwHWCiiUizOjzt2eKBz1hA77R0BBC
         W84VyK9GdvizBg9zyCojSYktavxx9LyGR98eFJFpTRMP7ipOvkr5XnHYIVDSCpN0FEe2
         mSVw==
X-Forwarded-Encrypted: i=1; AKwUvBzZubLC/0PuGdgJZ5t5W3DR6avkAQXfrqakIoURrsGB/o5g4Gvvlf8l/IwROIVSbtdr6p6JC9i2I8pSPQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2dW0QUsdaDohgiGW00lUHJeox/CsDi5Lz1VVRusigb2srLZm2
	JodUEZ7J/Wxaa/C4bUmPMQULy0gs9F4mx2iaD4fcdICIx1sH4ilr2dRO/j+mFeXkZtO3FN7x1Qx
	s3Eza9d+KtpBIpzu6qArda9wpn1CqtEaiHunOpYd6xR1H0OqVdfnGjLPMqac=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5091:b0:53f:4cb6:cda8 with SMTP id
 5614622812f47-55c0023e171mr5695440b6e.23.1793081802851; Mon, 26 Oct 2026
 23:16:42 -0700 (PDT)
Date: Mon, 26 Oct 2026 23:16:42 -0700
In-Reply-To: <6a81cb33.9ebadd4d.20b15e.0018.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae041ca.6200f071.51519.0f36.GAE@google.com>
Subject: Re: [syzbot] [udf?] WARNING in udf_map_block
From: syzbot <syzbot+de2fef01040748da6822@syzkaller.appspotmail.com>
To: golasch18@web.de, jack@suse.com, jack@suse.cz, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    d135ab453a74 Merge tag 'backlight-next-7.4' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13dadee1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b990d88b41ee3220
dashboard link: https://syzkaller.appspot.com/bug?extid=de2fef01040748da6822
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c93721580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16146469580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7442602f534e/disk-d135ab45.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ddc5d8dd9280/vmlinux-d135ab45.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ec40039f5ff5/bzImage-d135ab45.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/2af222d62d5c/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+de2fef01040748da6822@syzkaller.appspotmail.com

------------[ cut here ]------------
iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB
WARNING: fs/udf/inode.c:355 at udf_map_block+0x387f/0x4240 fs/udf/inode.c:355, CPU#0: syz.1.25/6056
Modules linked in:
CPU: 0 UID: 0 PID: 6056 Comm: syz.1.25 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:udf_map_block+0x387f/0x4240 fs/udf/inode.c:355
Code: af 78 66 10 48 3b 84 24 40 03 00 00 75 49 89 d8 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d e9 48 c2 0b 08 cc e8 f2 6e 5f fe 90 <0f> 0b 90 bb 8b ff ff ff 4c 8b 74 24 78 eb aa 44 89 f9 80 e1 07 80
RSP: 0018:ffffc900048b6fc0 EFLAGS: 00010293
RAX: ffffffff8368679e RBX: 0000000000000003 RCX: ffff888022703e80
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900048b7350 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000100 R11: ffffffff83687170 R12: ffffc900048b7368
R13: ffff88804a8a09a8 R14: dffffc0000000000 R15: ffff88804a8a07c8
FS:  00007fee297756c0(0000) GS:ffff888124732000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0274e99440 CR3: 000000002c070000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __udf_get_block+0x52/0x250 fs/udf/inode.c:476
 get_more_blocks fs/direct-io.c:644 [inline]
 do_direct_IO fs/direct-io.c:932 [inline]
 __blockdev_direct_IO+0x1965/0x33d0 fs/direct-io.c:1236
 blockdev_direct_IO include/linux/fs.h:3160 [inline]
 udf_direct_IO+0x13b/0x210 fs/udf/inode.c:309
 generic_file_read_iter+0x346/0x560 mm/filemap.c:3011
 copy_splice_read+0x605/0xab0 fs/splice.c:362
 do_splice_read fs/splice.c:979 [inline]
 splice_direct_to_actor+0x4c1/0xcc0 fs/splice.c:1077
 do_splice_direct_actor fs/splice.c:1230 [inline]
 do_splice_direct+0x19b/0x2a0 fs/splice.c:1256
 do_sendfile+0x540/0x7e0 fs/read_write.c:1371
 __do_sys_sendfile64 fs/read_write.c:1432 [inline]
 __se_sys_sendfile64+0x144/0x1a0 fs/read_write.c:1418
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fee2a13f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fee29775028 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007fee2a3c6090 RCX: 00007fee2a13f559
RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000004
RBP: 00007fee2a1d6b20 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000e3aa6ea R11: 0000000000000246 R12: 0000000000000000
R13: 00007fee2a3c6128 R14: 00007fee2a3c6090 R15: 00007fff0dc92f08
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
