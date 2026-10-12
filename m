Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC403E765A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802864; cv=none; b=Otl3++GQtJAhanY5wviIEa8SysCepeErpKfTs+AHdHnOR48Jw35OkeWNDRkD2Xqb7GuXwjxa0v+vuQQDWaQAfNSomxn1tY72rB/qNhannq4G1+idOoGyDOUjOPFunnKNPjKoPAqiSFNaBMk6UthgqEO7UwGh0SUmRYcXkVLiSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802864; c=relaxed/simple;
	bh=ECa/km7TTkzQyUivVJJXBNUalNhCAj0gH9DLvE9VgHs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=akXbyFMzjLrtUl/5kmN0K5NmXwCPWoawO0mJRlrN6qb/NBv4seUeCS9F0OWCnEaC3s1/dD2v59hTtVcEhYT8pHYFV5s+VKSsptvnTFsZ2WDPeAp5OPgxdZX2H4VFIkIT2wvYj9s0F+EtOsB9J6BdUSoaeJzFYuH5f5aIIMHJNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28d7ffab1so3110334b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802862; x=1792407662;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q/5hKMUMifbGvAuxSZxRnWCHyabLAx5K6ZHkM6LEJvE=;
        b=mRFTMsPc7xfhzMuHEUylesBOPstpkuraMYxtoVqJsTQPLMqq+h/1XnT7U68wPZZWhd
         m7qjrrDTycu7B+4O589iUtqqRl0W41lrzZmZBW6gEatwq5wupoA/+oYmGLSMsJjZHypr
         vUY3CzcweOJCvW/TAereI7z2jvPrN9DF2he20adulcHlZCDFe4fvHBxSGLWxtZVwDEZG
         ty7llbtgvEBZbuoL4OHIqpGnfb7sgXmBOSzXp+pj2DivI3ORCrLmBH0F6t2vVC31zJnt
         0yT9p2jdfv/Fj9dYOiE6gt0Dt4HDEuedwQZMU3nEq7Jk92T7gT6snjsivTB/h9Wi47K/
         VoNg==
X-Forwarded-Encrypted: i=1; AKwUvBzfYXiiGlTs4HzysYSSWQ8ERIa/islADBRJO5Jvllnyxg6gIUxqocr6Ig7JDJJukeFdJHazMWhoGD3HsPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8laTYM+rSxt+ebTHiFzmZE/LF7a/TlI1yuS342RgNC3aAG+1S
	0VvMCyu4mnZpsfF5iAOm5kIKTRcf7+knbT9Ay3SfUuAO+TV7zD4o5pTRaboo5rcnpPbb/+r79MR
	5EPXHMK6RBf7ZkORBRjhOArCN/UzqsqxNg6B/m56lo0mbz//O9nVYqewNebY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:238f:b0:4af:aaca:7be3 with SMTP id
 5614622812f47-50b5c9bb14emr6337520b6e.12.1791802862051; Mon, 12 Oct 2026
 04:01:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 04:01:02 -0700
In-Reply-To: <20261012103322.472-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accbdee.8cdf6287.1eb53.0125.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: user-memory-access Read in nvmet_fc_tgt_a_get

=========
==================================================================
BUG: KASAN: user-memory-access in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: user-memory-access in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: user-memory-access in refcount_read include/linux/refcount.h:170 [inline]
BUG: KASAN: user-memory-access in __refcount_add_not_zero include/linux/refcount.h:176 [inline]
BUG: KASAN: user-memory-access in __refcount_inc_not_zero include/linux/refcount.h:317 [inline]
BUG: KASAN: user-memory-access in refcount_inc_not_zero include/linux/refcount.h:335 [inline]
BUG: KASAN: user-memory-access in kref_get_unless_zero include/linux/kref.h:133 [inline]
BUG: KASAN: user-memory-access in nvmet_fc_tgt_a_get+0x82/0x1d0 drivers/nvme/target/fc.c:1201
Read of size 4 at addr 000000000008c617 by task syz.1.88/6756

CPU: 0 UID: 0 PID: 6756 Comm: syz.1.88 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
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
 nvmet_fc_tgt_a_get+0x82/0x1d0 drivers/nvme/target/fc.c:1201
 __nvmet_fc_free_assocs+0x10c/0x380 drivers/nvme/target/fc.c:1480
 nvmet_fc_remove_port+0xc5/0x350 drivers/nvme/target/fc.c:2931
 nvmet_disable_port+0x13e/0x1f0 drivers/nvme/target/core.c:400
 nvmet_port_subsys_drop_link+0x1e8/0x210 drivers/nvme/target/configfs.c:1123
 configfs_unlink+0x44f/0x6b0 fs/configfs/symlink.c:258
 vfs_unlink+0x27b/0x6e0 fs/namei.c:5678
 filename_unlinkat+0x3d3/0x610 fs/namei.c:5748
 __do_sys_unlinkat fs/namei.c:5777 [inline]
 __se_sys_unlinkat+0x83/0x1a0 fs/namei.c:5769
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd82566e1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd824cad028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007fd8258f6090 RCX: 00007fd82566e1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007fd825705888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd8258f6128 R14: 00007fd8258f6090 R15: 00007ffe18669a38
 </TASK>
==================================================================


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1710023e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1432149c580000

