Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2723A9628
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792223703; cv=none; b=rYaaFbLOgDhW/zxEfzPi7liianPykmomOSPsQFe6q7ShRQbunMSky0y+M1W8l9HPtuYeFEFnYOLx8220TyZBGdhRc4AXoWZlJv9EECgAwNWYgrmVpEGc1KKVXvWevNXwFFCJnhIeuhWh2/YeKSQKd3b84zQ2jkx3fKwPTqrvjbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792223703; c=relaxed/simple;
	bh=axYMT++DYQB/eXLTth6QQTwSscE9rxkVTD2XuFS+4gI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TMh2VXEL+xuEQrK8YtTiSYs7CXdMCtvvvp160PeP7GAIXHyr5geFvNkWsoXgazke5F5uuclwg1dTKM9z5rrt2WnLBefNgEa1P/y5sFX15wD6imHwJk5v1Q/uC0CVYZdsojBU49yerQnlKKbPSckA6jB78qVIsANR+67am9TOEfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4eb0b989f0eso1259682b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792223701; x=1792828501;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ew5vmjkKuONU4UcFObb7BO3O/NAMkmI+XNb38PuewRQ=;
        b=PQvlAOH21CM83v67OgiDSwUK1a3Djj+/qFpSQnWTx1YTpV0RQjWd+N6AL9P+j1bOOk
         /q6FpU87AltEeoU/DhrDQexLYtruDETLWwFJAiKDALYy1SYa+h0IYUcyOxh7YmrRRz3W
         29OOlcaNZQui+iSyIOwBfa0fxBMsvHXaDPKq8fE9adN7wQLkdT1sWhBRKI11oDFEuvPW
         UjVzKW4OFH8j5dVvHWCmHkMhYhaAlALwjz7GYiiuQPaa+18DECy2IFU+AVFpwu9KduzP
         1ICorGYvOA5E+48IyDqsqrMFx6Mm3m+3f2M8WTO5BbRrANWxv4KoSI5pdVvnP/104CV+
         QCAg==
X-Forwarded-Encrypted: i=1; AKwUvBxl1WPngdPk4E9EqFD4pjTHSYp3NqP+JdpHkwBerL8BHw66PBLEtGaSjiUbuUtZukhVV4iMPC2cNwqJiDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcRgRYYQOnL8pPzYg+jYSi99MmoXULrC0tqiGZTW1y9SQ+n9UH
	bJU7IcP5IOsfQZ818k1QWmBH/ylgApzwJqtSWeMnsVR4mhc3JZ1K4HN/gJYVXPi7j8DCOFV+9Sv
	nf/GjIoE35IF0316Uru8bp8BYMoMLVaovEKzFavdKNTvEJJ2wHLafsrdNlwQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c224:b0:4c3:cab9:2ab7 with SMTP id
 5614622812f47-536ff97a692mr3794916b6e.31.1792223701490; Sat, 17 Oct 2026
 00:55:01 -0700 (PDT)
Date: Sat, 17 Oct 2026 00:55:01 -0700
In-Reply-To: <20261017073047.631-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad329d5.7952420f.283480.035d.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: user-memory-access Read in nvmet_fc_tgt_a_get

==================================================================
BUG: KASAN: user-memory-access in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: user-memory-access in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: user-memory-access in refcount_read include/linux/refcount.h:170 [inline]
BUG: KASAN: user-memory-access in __refcount_add_not_zero include/linux/refcount.h:176 [inline]
BUG: KASAN: user-memory-access in __refcount_inc_not_zero include/linux/refcount.h:317 [inline]
BUG: KASAN: user-memory-access in refcount_inc_not_zero include/linux/refcount.h:335 [inline]
BUG: KASAN: user-memory-access in kref_get_unless_zero include/linux/kref.h:133 [inline]
BUG: KASAN: user-memory-access in nvmet_fc_tgt_a_get+0x82/0x1d0 drivers/nvme/target/fc.c:1202
Read of size 4 at addr 000000000008c617 by task syz.3.43/6693

CPU: 1 UID: 0 PID: 6693 Comm: syz.3.43 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Goo
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read include/linux/instrumented.h:82 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
 refcount_read include/linux/refcount.h:170 [inline]
 __refcount_add_not_zero include/linux/refcount.h:176 [inline]
 __refcount_inc_not_zero include/linux/refcount.h:317 [inline]
 refcount_inc_not_zero include/linux/refcount.h:335 [inline]
 kref_get_unless_zero include/linux/kref.h:133 [inline]
 nvmet_fc_tgt_a_get+0x82/0x1d0 drivers/nvme/target/fc.c:1202
 __nvmet_fc_free_assocs+0x15a/0x410 drivers/nvme/target/fc.c:1492
 nvmet_fc_remove_port+0x2b1/0x360 drivers/nvme/target/fc.c:2946
 nvmet_disable_port+0x13e/0x1f0 drivers/nvme/target/core.c:400
 nvmet_port_subsys_drop_link+0x1e8/0x210 drivers/nvme/target/configfs.c:1123
 configfs_unlink+0x44f/0x6b0 fs/configfs/symlink.c:258
 vfs_unlink+0x27b/0x6e0 fs/namei.c:5648
 filename_unlinkat+0x3d3/0x610 fs/namei.c:5718
 __do_sys_unlinkat fs/namei.c:5747 [inline]
 __se_sys_unlinkat+0x83/0x1a0 fs/namei.c:5739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbccffce1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbccf60d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007fbcd0256090 RCX: 00007fbccffce1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007fbcd0065888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fbcd0256128 R14: 00007fbcd0256090 R15: 00007fffd68320f8
 </TASK>
==================================================================


Tested on:

commit:         58161ead Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16ac320d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15740f01580000

