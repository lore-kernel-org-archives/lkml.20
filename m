Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DE248A2C3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471566; cv=none; b=CWvtYtnShYcSLMQ/EsPD77V1jkHKefyFpBv60v6Ke7PErni9z9uddwsEODKkEhxYRbDJkJ05JZyHJI8yByPal1molFonE79TXcYsmPx9MihStESOyK8cqBIKjbSCjPXaxXy/YoQPYBuvs2MZR7GJmp4t4TaK6fYPdtHSSVTTwHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471566; c=relaxed/simple;
	bh=vwje+zk6L0f9A9KR1ZNiK4y1SOQoWea7KlFyCg8v0hA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=d/JVfeUJ8uTWaXjLLbdz8s0g55872es/a6CpKs7vntIxjm+qKXav5WciOyYoVjTOwqS0pcUhrFM6AUyPWZy3aszHpXHBarSLc3tJaSdtdaRrh6wzoIOs2TcxOaRnpSVijS2UEtdU7CitiW7y+HOdjCISkSXMdGzst9uswd+PHsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2d1eb484aso7977372b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471564; x=1790076364;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/XlmnNvaR500brzrbTvgrJ3xDRhROLoEM3ith0oldps=;
        b=By+FUuOf8XiGoX4qAN4axAvpdc0ZUxh5ZUujRwIkOznEioJhDn+RbvbZ3Pcr6IQCRI
         A0m3xyUDpHqXDsaA6zwP+Sr4825PgbECVHqxmeq8MWtOK3DZpzwnoTPkbj6H+ozOA5eq
         1eNqITSGmKYiUhk1vKhaRPKDVxii4pPeZU42DNAIAVFwkn7IADzNAvnSyONge7B46Fot
         9NlLmk8ZPzRhtK4QDKoIb4XzquDFR6eP0y2NA1PEIwfXSd6ettjkj3k5Gfgf5fYWOAZ8
         3eGnryW4bIOr4bXeaNgQTCicP+lxLrsAwEJewGd9huYubg2nC3X+eeEWkRFKWdFikFAk
         As5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/RMCCguRIntN/6O0Z7GiJbu70TlVyPcwe1vTH472ZdUfUCtE4WDo+tlTy5tcezibWymGCgwvUPiM8AEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mEQFT1GS70esZp6raFda2YAZb3ZguScqhMSpOUB/62DUFw75LQ
	HWrIyGOxjjiSpYpvktjih7hy5m1MHnZSJQtHs+mVry5/JvXdjQ1m2vxD2GFZ28HmvAn7GJecKSY
	btaFXDRYyZbzAy9mB5BaZlQwQa99bWeG3B2WKA3mxr0+MWOIQjAoTdy1tTBc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4dc2:b0:6c2:6f93:389f with SMTP id
 006d021491bc7-6c739794590mr285386eaf.37.1789471563876; Tue, 15 Sep 2026
 04:26:03 -0700 (PDT)
Date: Tue, 15 Sep 2026 04:26:03 -0700
In-Reply-To: <6aa8de92.bf2fa351.a84d0.48e1SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa92b4b.4c28b7d0.c1bba.0039.GAE@google.com>
Subject: Re: [syzbot] [wireless?] INFO: task hung in ieee80211_register_hw (8)
From: syzbot <syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in netdev_work_proc

INFO: task kworker/1:1:30 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:1     state:D stack:25352 pid:30    tgid:30    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events netdev_work_proc
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 netdev_work_proc+0x6f/0x770 net/core/netdev_work.c:132
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task syz-executor:6137 blocked for more than 152 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:22248 pid:6137  tgid:6137  ppid:6131   task_flags:0x400140 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821


Tested on:

commit:         6f157f39 Merge branch 'remove-comma-after-sentinel-ent..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=178d5925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba53f227359c9d59
dashboard link: https://syzkaller.appspot.com/bug?extid=c92af8613ad38696ff09
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=100148c9580000

