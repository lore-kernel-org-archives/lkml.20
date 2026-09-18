Received: from mail-oa2-f10.google.com (mail-oa2-f10.google.com [74.125.231.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4D451A13F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750656; cv=none; b=IDwwXKJf/GCLb05ZQDEWI94m6MdMo5ikkCC5guOoB3jo8OL+QOJOffAnCgCJfuW/dTTeV1x1UTdudCx7AOqUtlkwtrcpttjtyczDYYXhyHCbSCene+sCNHLESPC7mjNSNU29K6G8EYrbGyT8FCM5W51FYAv/X9LYg0et3DKsPuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750656; c=relaxed/simple;
	bh=piFmg08jBzDbsIbUC3WwJeFjDPZ9iW0yY4qSaomnAf0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TUIn6vYtEFfdlnIi8Tkx42fNlALTOvQ+97EHoa+IjE5y+JticyayNnH8mvzqxm9nZSU2kniXs98h7eQbKjHzYjtuGHWHyHcxbX11BoLgMbUYIVRkSr9AnkH0uSrlIQrl06mUXrYAR5XrYf55sIWu82NjBkEpY9RJmzpWcCqicAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f10.google.com with SMTP id 586e51a60fabf-4758b868baeso399028fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750651; x=1790355451;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIbWEfl3OtcfF59p74qQH96pu9ARO/UXROO0S4ZFQM8=;
        b=Q1JG3GpVJJDgK2tbDIikghixTCgukOiyS+HgTv5W61ZW03mr1ZXP9HGdG0ayQDLt4b
         zxCuZqh+17eQ/Px5rMqyTlfYL9ON7Fc0XbwqNnhdhJuRvZPcsCMz69uHdryw2hCWMcQW
         YjNZfljgi+oHEkQNS00Ly8+JhsxU5d8pcv2nyQEsTIKpY+ocIQmsMjjR+f6QiR6CLuzv
         HIqPVb7GZ93R+O5Oxj2ykRl4vDbVs6itxdUm3VrfAhqu/p2az9SFz1f0qYZP6azki3S+
         dkYhVHKuaVvgedOQj7QPJezXrTpVvRKBpy1NIMHthMSMBE/rzLBWX4N5PX5NtzF6H7GN
         s+7g==
X-Forwarded-Encrypted: i=1; AKwUvBwSe4ImweIAEMoGT3DmuuaB9CfpqiY3MbBtJ4P4OaAXgFU1M7ibbxS1N13TlaUknM8tNQHZFcu4Fnvw9j4=@vger.kernel.org
X-Gm-Message-State: AFuF++lkAHOIfnBc6QBrKfmVWh7lZWzUclzyAeHYO9IWn1HS06OTZEvY
	auX/YMsDo//wfmn0UTKYKQhxzrGn/FOjC9Nvurj83YoBunhFdyS36c3ey4rSrAtrFdSjNMSVhGX
	sPwwbNdKBVHEQf0PbaGu9AC76alL19n7nSEtrmBLgCKlZoIg0UA3Uj0/X7HA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e910:0:b0:6be:46f4:2908 with SMTP id
 006d021491bc7-6ca9c750b0bmr3004262eaf.55.1789750651100; Fri, 18 Sep 2026
 09:57:31 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:57:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aad6d7b.0c43d342.320d00.0001.GAE@google.com>
Subject: [syzbot] [net?] WARNING in gro_cell_poll
From: syzbot <syzbot+f0661448aa9511ce744a@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    08df884136f1 Merge tag 'thermal-7.3-rc3' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13b88905580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19560cab9a915237
dashboard link: https://syzkaller.appspot.com/bug?extid=f0661448aa9511ce744a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/607f53d96d3b/disk-08df8841.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/af77b44e9d7f/vmlinux-08df8841.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ebeacfa9027e/bzImage-08df8841.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f0661448aa9511ce744a@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(l->owner)
WARNING: ./include/linux/local_lock_internal.h:47 at local_lock_acquire include/linux/local_lock_internal.h:47 [inline], CPU#1: napi/gre0-0/11827
WARNING: ./include/linux/local_lock_internal.h:47 at gro_cell_poll+0x5aa/0x6c0 net/core/gro_cells.c:66, CPU#1: napi/gre0-0/11827
Modules linked in:
CPU: 1 UID: 0 PID: 11827 Comm: napi/gre0-0 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:local_lock_acquire include/linux/local_lock_internal.h:47 [inline]
RIP: 0010:gro_cell_poll+0x5b1/0x6c0 net/core/gro_cells.c:66
Code: 8d 3d f3 aa 9a 07 48 c7 c6 40 c7 3c 8d 67 48 0f b9 3a e9 59 fe ff ff e8 dd 5e 52 f8 48 8d 3d e6 aa 9a 07 48 c7 c6 00 c7 3c 8d <67> 48 0f b9 3a eb be 31 db e9 88 fd ff ff 48 8b 7c 24 20 e8 97 a2
RSP: 0018:ffffc900033c7b70 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000200
RDX: ffff8880284e0000 RSI: ffffffff8d3cc700 RDI: ffffffff91544100
RBP: ffffe8ffffc37198 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
R13: ffffffff9b99e5c0 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888123c59000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b32617ff8 CR3: 000000005d244000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 __napi_poll.constprop.0+0xaf/0x450 net/core/dev.c:7787
 napi_threaded_poll_loop+0x52f/0x870 net/core/dev.c:7907
 napi_threaded_poll+0x3a8/0x4b0 net/core/dev.c:7962
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	8d 3d f3 aa 9a 07    	lea    0x79aaaf3(%rip),%edi        # 0x79aaaf9
   6:	48 c7 c6 40 c7 3c 8d 	mov    $0xffffffff8d3cc740,%rsi
   d:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  12:	e9 59 fe ff ff       	jmp    0xfffffe70
  17:	e8 dd 5e 52 f8       	call   0xf8525ef9
  1c:	48 8d 3d e6 aa 9a 07 	lea    0x79aaae6(%rip),%rdi        # 0x79aab09
  23:	48 c7 c6 00 c7 3c 8d 	mov    $0xffffffff8d3cc700,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	eb be                	jmp    0xffffffef
  31:	31 db                	xor    %ebx,%ebx
  33:	e9 88 fd ff ff       	jmp    0xfffffdc0
  38:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  3d:	e8                   	.byte 0xe8
  3e:	97                   	xchg   %eax,%edi
  3f:	a2                   	.byte 0xa2


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
