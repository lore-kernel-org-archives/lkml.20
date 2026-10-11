Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AC530F819
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791702163; cv=none; b=h+XCAM49EAFeOrKqpHWgQWRPT1ZOT4bFQrQXu91W4LbsgipRp/+eo7RaEV2g1zaC/xNCOQqnvKZkGJfuCo0VskEC9G0ZbknLDrzk1kB7Ddg0+8a0Vec40fszlXuirYTaFHC4b6V1NJPw5GAc6UzxtXsL0d2y5Sx7N8OMCJ4qKEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791702163; c=relaxed/simple;
	bh=hqmqGCwbVJx8ioHIcMYlbkKBe0xuh6mKFsHbvXI5YKg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=k3LVFBq+GvJ8kBXWccPi3q5wvN+zoyrLtuJCoFDOnupSNmh46QhJjL26KLOKCZlxj+lrHra/Yy7X/vatONBND75dZxo1OuryUptMxoXBaUjlt97hFhagDU/myWsplg21TmBb/q6xy3V9UinwqzygtF/UWwpV6gj7b4xz++ThsGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c307941971so1787105b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791702161; x=1792306961;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVDCCtkvR+2GpVfroq+EMg9txxyO2n28YifI2CSvk/U=;
        b=lV7PbHMCEgsVAKaRXFAP4UWiK1RQXzT81Bk21AJI4MdIbFB0j4yNvTsg/rapPoE2e0
         wpzKNm53QFbUBT+YovDYVC18SxgK65zK5EOyiyD6fn6/ikR/sVdxeHCG+DBxqyN/vcjK
         U6Qt4AhSdCKzQdX6eaXn2TanLbYTZE4bNPZ6BI5DOWYTfAPqaTfJWfv5fs1jUsD4awog
         BVHADi6i5Yv9fD66gFL33GFBU6p4cNWRnIOh5M0kn1RiEPt5oamjIdk5o6ZMBCbm8yrq
         6I/SDiBZWJwpo6ck4nidmLfTa8yj1st1bToJd4s7Sv1aCdaC8ljliTdPbhAP2+oaVwwO
         qtTQ==
X-Forwarded-Encrypted: i=1; AKwUvBymJTuWVtW1dZitOdXqt9nU6rx8me+3Utmzx+gCD6Vs5q82ghfbOUdxcElrmz2RsaGTW4CBkQFMgtTR8bM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDJnY0EMJm5yMVmyOCFjA6+K3uNbi45iLOEpwXz0+c6/3gnta8
	SO+msMgh8bhUpXEEyyI2Jx3UcU37LjT6jvQUOOtrJCLI+YvJVR/rcb3wNLMaEBJrDAM2pWAQL13
	2U3ZsKWEBNihIU9l6vrKHFNDvWLEQovssNkuHjDKHQCAVrjQ/v8Kby9T/eHM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f6c:b0:4f4:550a:3a86 with SMTP id
 5614622812f47-50c599658bfmr6839516b6e.53.1791702161359; Sun, 11 Oct 2026
 00:02:41 -0700 (PDT)
Date: Sun, 11 Oct 2026 00:02:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acb3491.a150a118.27e199.0039.GAE@google.com>
Subject: [syzbot] [net?] INFO: task hung in addrconf_verify_work (10)
From: syzbot <syzbot+95263979a9c3af871646@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, idosch@nvidia.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3857c2fe5449 Merge tag 'pci-v7.3-fixes-4' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1614c0a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4118aaa2d227be26
dashboard link: https://syzkaller.appspot.com/bug?extid=95263979a9c3af871646
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/891094e1d3d5/disk-3857c2fe.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ea13e7a03404/vmlinux-3857c2fe.xz
kernel image: https://storage.googleapis.com/syzbot-assets/853f16987787/bzImage-3857c2fe.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+95263979a9c3af871646@syzkaller.appspotmail.com

INFO: task kworker/R-ipv6_:3196 blocked for more than 158 seconds.
      Tainted: G             L      syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/R-ipv6_ state:D stack:29528 pid:3196  tgid:3196  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: ipv6_addrconf addrconf_verify_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 rtnl_net_lock include/linux/rtnetlink.h:134 [inline]
 addrconf_verify_work+0x19/0x30 net/ipv6/addrconf.c:4770
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479


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
