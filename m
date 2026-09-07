Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B61D35DA41
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755044; cv=none; b=p9rFhF3pilN99Lmo2Vt4x3trgE5PKp4JhuCmCKtG6QrHh+zOtVICnQqZ6ff3eR5jND9fNH4PiCtDspVnZS5Iht5dAyVj99YKYsHCghBQ3Y1rixXW/z4ubcXC63miIWsz/Br3/3UYwgOlS1X4z0sDXUqyK0N7E4NA9m6SuiraKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755044; c=relaxed/simple;
	bh=Zbck3fVOLSqGrDPVxKN9z/T40A7mrqIyVPxdyTgQn/I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rvX3nAw3rfLp48u8UpxVKybGuKjbtTrkhFUwNEqPDDyME7Yws9W0vFPFjW1f/rStj7Ou1n8e5KR7YSkk/e/nZqQirUQR2s7gN+vOxjIENJKFEOk9XRR5wf+TVCmSrKgMqTmCSUuUb1XdQhf9EzyI6njTEt/HvFux2MayXTTHaN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9e741693bso3833396a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755042; x=1789359842;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6FBJuCF/vZO0rVHkCwxFGba41YIYfGqMnibWcErxK4A=;
        b=KY6J0b37zMf/82qDIs4yfF7yfezDysTO0PTaN2ur27dTPhrZJtBnl41jt0KifTmcSv
         jWrGd3HJHD6I67o5pLCT4Z995oaqk+v+vQKjNj1je375Yg0ztLkC0N1h3Cyf8oX6eONu
         DzbYguZfwtD9Tx9WIUDZQxvnFFT1mOKD/AOIGsiSXuQiU1dKA2XquLUMgMXAqrpiSRFG
         MmVeisfWzIeBS/2z9WyIN8rbZiWTAVxA5iXJ48nNlXb1bV7AvUBq32be+t/QqHb+IUoZ
         hn7paOpiaN8Xxog1WsE4moNxe/GqM9yHj0/JEeBwAJQJGNTXcIDxRnaQBYoKlxDqbV5N
         95OQ==
X-Gm-Message-State: AFuF++nzK8oO5BtfnKij3VLfqdOz38r5IzX2q7Aq6wyfXsAiOpJuHSk4
	aVLZTjyD5PFVzoTiM2RKth+83rjheKbC9CATl2xwnLq0bADJNrkzNbKsni3ehQArDlKWIOCRRBO
	Wjt2d5VJxqi37b2hgTQoa4928EITkh42Q2lxMGJ9w+Dh1jDgXsNvy31wWhUc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:179b:b0:6b1:6136:956a with SMTP id
 006d021491bc7-6b6fccdb1c9mr22220799eaf.15.1788755042274; Sun, 06 Sep 2026
 21:24:02 -0700 (PDT)
Date: Sun, 06 Sep 2026 21:24:02 -0700
In-Reply-To: <OSZPR01MB9313EC5A624D7513F6801730B2B22@OSZPR01MB9313.jpnprd01.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e3c62.a6639fcc.23b8b0.0010.GAE@google.com>
Subject: Re: [syzbot] WARNING in usb_composite_setup_continue
From: syzbot <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tkdkei@outlook.jp
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in usb_composite_setup_continue

------------[ cut here ]------------
usb_composite_setup_continue: Unexpected call
WARNING: drivers/usb/gadget/composite.c:2743 at usb_composite_setup_continue+0x2be/0x3a0 drivers/usb/gadget/composite.c:2743, CPU#0: file-storage/5924
Modules linked in:
CPU: 0 UID: 0 PID: 5924 Comm: file-storage Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:usb_composite_setup_continue+0x2c5/0x3a0 drivers/usb/gadget/composite.c:2743
Code: e5 40 89 ee e8 8c 5c 30 fa 40 84 ed 0f 84 35 fe ff ff e9 08 ab 78 f9 e8 69 62 30 fa 48 8d 3d 82 75 76 09 48 c7 c6 40 b7 d9 8c <67> 48 0f b9 3a e9 d6 fd ff ff e8 4c 62 30 fa 48 89 da 48 b8 00 00
RSP: 0018:ffffc900026dfc88 EFLAGS: 00010093
RAX: 0000000000000000 RBX: ffff888013232528 RCX: 0000000000000001
RDX: ffff88802cce4b00 RSI: ffffffff8cd9b740 RDI: ffffffff9151ff30
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000293
R13: ffff8880132326c8 R14: ffff888030b52f10 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888123b6f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1070be0d58 CR3: 000000002a5ba000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 handle_exception drivers/usb/gadget/function/f_mass_storage.c:2549 [inline]
 fsg_main_thread+0x171e/0x8aa0 drivers/usb/gadget/function/f_mass_storage.c:2587
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	e5 40                	in     $0x40,%eax
   2:	89 ee                	mov    %ebp,%esi
   4:	e8 8c 5c 30 fa       	call   0xfa305c95
   9:	40 84 ed             	test   %bpl,%bpl
   c:	0f 84 35 fe ff ff    	je     0xfffffe47
  12:	e9 08 ab 78 f9       	jmp    0xf978ab1f
  17:	e8 69 62 30 fa       	call   0xfa306285
  1c:	48 8d 3d 82 75 76 09 	lea    0x9767582(%rip),%rdi        # 0x97675a5
  23:	48 c7 c6 40 b7 d9 8c 	mov    $0xffffffff8cd9b740,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 d6 fd ff ff       	jmp    0xfffffe0a
  34:	e8 4c 62 30 fa       	call   0xfa306285
  39:	48 89 da             	mov    %rbx,%rdx
  3c:	48                   	rex.W
  3d:	b8                   	.byte 0xb8


Tested on:

commit:         edc15184 usb: typec: hd3ss3220: Add support for supply..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=12544749580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec55b50193b453ea
dashboard link: https://syzkaller.appspot.com/bug?extid=a83a5a1ba9ff57935171
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=146bccf9580000

