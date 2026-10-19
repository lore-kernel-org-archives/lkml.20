Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433326;
	b=4N/w0iRHLGsv9kI28n5x2vJUabCmLH7pYVbfYsrZJ/8YjI4kK7+hbcXkz3LH5mYTdlas
	 A4Tand8KDsnn94FFyXi39eGG6ukTXShXjLny3kCh1700VGDOlFuovEoDT1TNVwMRUt/4U
	 IryqvM1umrlquj/TmcE2bVBzuY0LqwDl+qmDUo57pHQrUsOt3XLtyLAY3YhTdX+NLlT5J
	 GXk+TX/IWPbRPwlX6YMyL270vgQrwd4t3T7Vw8WPJCuiq2TenwDWSbYphghgCuEGZ9fab
	 53qqWuHdBNo/ynL5j9CUTZNEoxNlX37Kj/iDnGviwtm94qQ+xhPMBrOwjc9SeWGV1Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433326;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=VGPqJh1iYG/cyne1rfNrrk/oTReuQMXtoZwqAwwWG1g=;
	b=xziDKq5cHqlOUnVpsRB8sRt1Bvi/6N2sxJD6qwQqI4DESwUPcbDWUACjh42RB2+cGpW0
	 HyiW0NK5wV0ySKKhhfhhJIa4PFXafA5+Ruj+k778Bjdxk9b9r2NztrJIFIH7dY52xG4+x
	 dwlAB6fX47tn7BwKXCbAt39ZJrh/92ABog2uSIBALTPV/8nmzWaTnE9pJzdbDkN0/7k9V
	 2M3Pou+6jKroBwV6+NILJiuaf7y37WlroZ2W0YQdputjEP/pM1JJlu9uiKaqYaC54piFS
	 C4L14cduwdBFL1HSHblFp+un0AhWV7clUlBWIWJk7pBxbmCn9kDEMV3krw/5r3YWmaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38B6606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38B6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-809f1af7992so4758754a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433325; x=1793038125;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGPqJh1iYG/cyne1rfNrrk/oTReuQMXtoZwqAwwWG1g=;
        b=0hMFyilEv9Q2tCBcM0DMp7hYbfmshYOU23zZrqiHMfkwZ2bgNetf9BBSUnftT/Po3v
         pkZL7xPhjVxlN7MOaa7wcp7H78FUdTwA8A6sbpjCCU4bNcxXHx2oRTwdNtfMHe6WlpOU
         ZuP2OSmmP3EpevMGJ1bCz9PA62whalWLKV8cxLAOoRaBYXHm/fBEAo+EP7MqR9bmNxrg
         nCbVdluuZ5L5ueSdYqBJ1wIB4xrcWHG1BNeYZNFOrSui7QASqjo9xBa90HZp9XGGjjR5
         qVAldDmMPW2obHXwb2KXuOcym7vT5kDmARWQGIrPIfkstWtS2wEr9F6oXkfysfk5Be3H
         9Vog==
X-Gm-Message-State: AFq9FYKlbS28b0ZyDXTGgeXdWBNT9eSgEZyW0pqmLrv+tOvUHTFJTd7l
	6DYIwTl1EzM9jAA8q0kHXEnIVGaJRfDzC6SQDbYCi2vomWgmMd9s9BzOSt/AQtYLxZ2ZouFXiTr
	PS7smM2DlRCv4dFrhmX3Ixi1ylxTmJTm2Bvtc7I1n4UI+/Q5MPL6vpF247b4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1787:b0:536:611a:7fd9 with SMTP id
 5614622812f47-53cc22e1179mr7168668b6e.7.1792433324915; Mon, 19 Oct 2026
 11:08:44 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:08:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad65cac.5a04d468.191e0a.001d.GAE@google.com>
Subject: [syzbot] possible deadlock in lock_system_sleep (2)
From: syzbot <syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    32c52ec87d62 x86/insn-eval: Fix shadowed segment index in ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=120a93a9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=1f0fbc2561b3e5d51b91
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=141d098e580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz.3.5755/5950 is trying to acquire lock:
ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: lock_system_sleep+0x49/0x70 kernel/power/main.c:71

but task is already holding lock:
ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot kernel/reboot.c:774 [inline]
ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: __se_sys_reboot+0x223/0x460 kernel/reboot.c:738

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(system_transition_mutex);
  lock(system_transition_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by syz.3.5755/5950: 1, last CPU#0:
 #0: ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot kernel/reboot.c:774 [inline]
 #0: ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: __se_sys_reboot+0x223/0x460 kernel/reboot.c:738

stack backtrace:
CPU: 0 UID: 0 PID: 5950 Comm: syz.3.5755 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_deadlock_bug+0x27a/0x290 kernel/locking/lockdep.c:3085
 check_deadlock kernel/locking/lockdep.c:3137 [inline]
 validate_chain kernel/locking/lockdep.c:3939 [inline]
 __lock_acquire+0x25db/0x2de0 kernel/locking/lockdep.c:5288
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
 lock_system_sleep+0x49/0x70 kernel/power/main.c:71
 hibernate+0x162/0x680 kernel/power/hibernate.c:784
 __do_sys_reboot kernel/reboot.c:816 [inline]
 __se_sys_reboot+0x2ba/0x460 kernel/reboot.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdb2419f809
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffff22cee98 EFLAGS: 00000246 ORIG_RAX: 00000000000000a9
RAX: ffffffffffffffda RBX: 00007ffff22cefc8 RCX: 00007fdb2419f809
RDX: 00000000d000fce2 RSI: 0000000028121969 RDI: 00000000fee1dead
RBP: 0000000000000001 R08: 0000000000000000 R09: 00007ffff22cefc8
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffff22cefb8
R13: 0000000000000002 R14: 00007fdb24222cc0 R15: 0000000000000002
 </TASK>


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
