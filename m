Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB74AF175
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474605; cv=none; b=Os23pgAP1yidHfgJTObZBX7BzLaYz6x0s9Eaol6N1JgFob4YF/ELiKnO8kzP2zHV3PgBfYaOL0CE43kZKxUXrBkeaem1AvsJHU99PHcCwTs6IWQ1JQu9tZ3YDOOO7gjoBYJSShUHg2pAirDswW0z0FcvnRqGhPXL5f01tWbEaPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474605; c=relaxed/simple;
	bh=/zmUCEoT+WTBIrAitN7rGDYyROw+iPZxtK4h5ZU+Kl8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=R/dlv577EpiudmVNEdJfHdhZN219mhG97tRuee7MJKP/16699krQUdR6xvHKTDi//EgR8ohVIVq4Xb5zZpHYOG2H/N3jpM1uVPeyDD60AZAkT62mPC/7W8qu8A8EeCzhhO/f1wJmRT4ABiX+0b6J5DRi0v6MXtLZ/dnXMQ1kfT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-82285c64cacso7792950a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474602; x=1792079402;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jo7IThI5AHovdr9LtUBMFPFwUF+RBL5DG+uHnnOfYqM=;
        b=seqgCvLtkpSPJDtpGbLexsvz7Y8ePCaR01VUGZLbQnWFH2KNYjcHar5j3T+rxN3pmQ
         jNV/Ysw2SBX2LQRq8pwklKQukxPw9aB/65PiwOAg1PT2VPjCoWdV7vJN8AeOIDrnfzpM
         oIc+p9BeslJ8LJxrh1Rw27Ktsgae2nSPi1DF1enlZRTGYny8kks6NDMR+qVChj6utZlP
         QUaXV/SABvQ9jWQ9u57/IuCDjyTsLh1o4xo6bijNzXPM9CDhk5Of2mB1cEleJIL2/Lny
         OYf4/n8BhDd9MAlkT4hrLXI/0j5i+DqES0Ignd0nz1Y4AfhH8eRmjYt7XR2hptrKNpqo
         OWxg==
X-Forwarded-Encrypted: i=1; AKwUvBzo+W4a3DBMTJX1cLwbQeqNFg8aqYJPS2AtQNFRl9cUVyltI+iiFSgDtNRFlN+UnykCixxDH4n7ZWga0b0=@vger.kernel.org
X-Gm-Message-State: AFuF++nUjsyOB+nO4M3vpLvOb0Yzl+YDNiBfT+qMjLywpZXwBGg8vAys
	n2S0gd1DUjhSI4HuS4yHv/TEFc11aBYLRmLa5XeUe8tZgYGBxlOsDzaM3UHLAqpZsWzxJyNWWdu
	HNOTze6ur5xiIkdwfWYmcBUzY7YzAsJOEuKGQhTdkfvdekfwO6aIuhexWS1g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1306:b0:4b9:e5fa:8917 with SMTP id
 5614622812f47-4fc462637e2mr6199791b6e.42.1791474602492; Thu, 08 Oct 2026
 08:50:02 -0700 (PDT)
Date: Thu, 08 Oct 2026 08:50:02 -0700
In-Reply-To: <20261008102308.82433-1-emmaonana18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac7bbaa.70ed5d86.2ac85.0009.GAE@google.com>
Subject: Re: [syzbot] [net?] INFO: task hung in genl_rcv_msg (5)
From: syzbot <syzbot+2ad5f42cd6ca88f0107c@syzkaller.appspotmail.com>
To: emmaonana18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in ieee80211_register_hw

INFO: task syz-executor:6254 blocked for more than 144 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:22440 pid:6254  tgid:6254  ppid:6247   task_flags:0x400140 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 ieee80211_register_hw+0x38ff/0x4b00 net/mac80211/main.c:1564
 mac80211_hwsim_new_radio+0x3258/0x56b0 drivers/net/wireless/virtual/mac80211_hwsim_main.c:6143
 hwsim_new_radio_nl+0xd8b/0xf90 drivers/net/wireless/virtual/mac80211_hwsim_main.c:6966
 genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
 genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
 genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2575
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
 netlink_unicast_kernel net/netlink/af_netlink.c:1338 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1364
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x408/0x5a0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc260d5e98e
RSP: 002b:00007ffe56dbab58 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 0000555589e0b500 RCX: 00007fc260d5e98e
RDX: 0000000000000024 RSI: 00007fc261b54670 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00007ffe56dbabd4 R09: 000000000000000c
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000000 R14: 00007fc261b54670 R15: 0000000000000000
 </TASK>
INFO: task syz-executor:6258 blocked for more than 144 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:22376 pid:6258  tgid:6258  ppid:6256   task_flags:0x400140 flags:0x00080000
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
 inet_rtm_newaddr+0x470/0x19f0 net/ipv4/devinet.c:978
 rtnetlink_rcv_msg+0x802/0xc00 net/core/rtnetlink.c:7137
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2575
 netlink_unicast_kernel net/netlink/af_netlink.c:1338 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1364
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x408/0x5a0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84


Tested on:

commit:         47324d3a Merge tag 'pwrseq-fixes-for-v7.3-rc7' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=153cdf61580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e5acac5c98285f
dashboard link: https://syzkaller.appspot.com/bug?extid=2ad5f42cd6ca88f0107c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10536ed1580000

