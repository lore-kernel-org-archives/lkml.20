Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F73F4349B5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938644; cv=none; b=YYWiyN5lJIlklA5uCFUSwWcDwdcKkrGJ39XkQ0KZPtv7C8mO/zRENqSrp6Mj3gCfth4ztoa6gUC/e54cfMyfCEDmGWC+gkgmImq+fNW7o93JPIx9A3PQnfyKsvog4paCpQ5GFvak/CiTK7ag98EWnWJ9fkaD14OIxmZwfyopnls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938644; c=relaxed/simple;
	bh=ryt6UsspmEkzT69KdNUQnoLNqJtJsYqmA+A1mTbhgTQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=g4oIR1xh+swVGton7VpWGwm7E4XlEpGWLg9vHhywmuGYcsj7Y3ksMjRH5YqyvVSojkgsVgknDZ/zQYp4Ey8cBzfe4/HEuWhp0dbgWOF0259wEK6sadujg55Zki4Kz0J9t/1L2LcSH45X86Mq2zqvItVm8b1WaF0ab2HfADSYLX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b9376ed5so6557908eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938642; x=1789543442;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6qCaPJDydYgACl5VF4XUWDNeYtUOsOuXabKoqj8+0j0=;
        b=YdwxNNBAo7ui/XfMZVbZH9vdI6EiF4ckpu5w01WxdoVQpY0m1WPNEzgJHifwA7Sugm
         fBhduhuQcOkf4iB1mY/Vx0YVHVHQvpYWFscFWkY33MCwLUe4lg1RL+OQD2keARGslwyg
         CSU9334UvvugvhYca/vCeb4kpA9UIAHGN9vthIz+01RvuRdKIAkEFV0y5trOZ3sRD3cn
         hzISyTlH58KHCwGUA5Mee/mfH1wZ4Sqcdv42whCRf6UHKegUMo00Oqx1AiQvOScfzm9j
         kSyWqn8bjxLHa/G/8YgeEMeX3cI7q7qTXETUrCucOBiMCD8+KxjB/SzQw+z7stT0bdqU
         Vnuw==
X-Gm-Message-State: AFuF++k9JAmOm1vtf91US36T5RG2PCY3ZGpzs49l+fbTB77Nx1Ze9k95
	rY7Pkh6IUQZ6ItSiOTTtMK6o/1nUSShZi77DwoyhQRmOEcOQ+Poh76r8HKKhx3RcBM3MpBMqF/m
	8p5nIDDDRrkn9vw4Y0p9HDCo8W7ONvZ9ASPxYv+X5KRANICHGNEkhTkULsM4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8584:20b0:6ba:3635:8010 with SMTP id
 006d021491bc7-6ba36359c46mr6546626eaf.67.1788938642225; Wed, 09 Sep 2026
 00:24:02 -0700 (PDT)
Date: Wed, 09 Sep 2026 00:24:02 -0700
In-Reply-To: <20260909071013.7123-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa10992.6e6c5f9e.28f11f.001e.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Write in tty_init_dev
From: syzbot <syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in gs_close

------------[ cut here ]------------
1
WARNING: drivers/usb/gadget/function/u_serial.c:738 at gs_close+0x44c/0xca0 drivers/usb/gadget/function/u_serial.c:738, CPU#2: syz-executor933/6041
Modules linked in:
CPU: 2 UID: 0 PID: 6041 Comm: syz-executor933 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:gs_close+0x44c/0xca0 drivers/usb/gadget/function/u_serial.c:738
Code: 00 c7 83 d0 04 00 00 00 00 00 00 e9 03 02 00 00 e8 19 50 21 fa 31 ff 44 89 ee e8 7f 4a 21 fa 45 85 ed 75 62 e8 05 50 21 fa 90 <0f> 0b 90 e8 fc 4f 21 fa 48 89 ef e8 54 69 e8 03 48 8b 0c 24 48 b8
RSP: 0018:ffffc90003f376f0 EFLAGS: 00010093
RAX: 0000000000000000 RBX: ffff8880257b6000 RCX: 0000000000000001
RDX: ffff88802b12cb00 RSI: ffffffff87eac10b RDI: ffff88802b12cb00
RBP: ffff8880257b6388 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880257b6184
R13: 0000000000000000 R14: ffff88803a24a000 R15: 0000000000000000
FS:  00007f6c62ee46c0(0000) GS:ffff8880d5d5d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000560a83265d20 CR3: 000000003538f000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 tty_release+0x40e/0x1300 drivers/tty/tty_io.c:1718
 tty_open+0x31d/0xe20 drivers/tty/tty_io.c:2119
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:996
 vfs_open+0x82/0x3f0 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x19fa/0x2440 fs/namei.c:5000
 do_file_open+0x20e/0x430 fs/namei.c:5029
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6c6373aa1e
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007f6c62ee4158 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f6c62ee46c0 RCX: 00007f6c6373aa1e
RDX: 0000000000000002 RSI: 00007f6c63786028 RDI: ffffffffffffff9c
RBP: 0000000000000021 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffffd0
R13: 0000000000000000 R14: 00007ffeaabd1a60 R15: 00007ffeaabd1b48
 </TASK>


Tested on:

commit:         893e1178 Merge tag 'x86_urgent_for_7.3-rc3' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12235749580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=fe63e4d633540f230624
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=130c2c8e580000

