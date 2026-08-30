Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C85F3A1D05
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788084294; cv=none; b=iZ8qabcoqT/eSC6VRYng2PAFHRCSw/4R/yIFXynnkjOqYWZcEOVhvfseUaG6az22yWHmjtuCSg5IzinHA2skYSKXOhcR/+xCIWEiqNY10V+F30WXit7MEPCHqgzP4kQLy7uaFEFatp8ghFK56Q2uHmp10EDlFyepLLW7zwIUE54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788084294; c=relaxed/simple;
	bh=KM6Cnj399XIBC9u0uEwCdTRH26w5grUstLV/5UCRGeM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RX0Xlr1cShpk+CIZgcTekl7xP4AYcLDf+Jg+RF9QEgDMDSMXHhkg3YZMWN/0gwXexNgenoF/gIIFOMuAwrg265nHZzuEC7jI62Dq7hzmUycvKRl9xq7mpeNMJHg73OPK9Q8xDv2BghbjtNsvM0VJA3vO4IOb/wr5uySFAmOwZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37620eb73so5648809b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788084292; x=1788689092;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVP6cY2WCLtan0qu4XTPvdPvb7JjsJOvNyDuILhJ8Q8=;
        b=YrK4jo8EjXMsv2+tnjzRcSpgG7YXb+0MnacMvPajYQGfqZpcnQ9JEUfwnR//QsC2zx
         CtmlXg3aFLFWD957nmRIhvsyro8JX60nCq5+fCj7ORHN84CYuAQkvj4nQeNXLmnza1cV
         MlSOeCEJ8X6GUk0xm8re0vlCA8bw5IqiLFTP3U9muGFn+oNJRS+mCInmMVVZPuLywJMv
         rLRVJ0XZmn+fV15vK6j29/Xc7a4roEU1NdsMtt2xxhX75ZhUztVQoOlwY7e03fPWe9D6
         mbcmKD3j8tzDSijo+i6lgi3dre3TOEU7IAsZMdIahYcXkjFlvpYpPk2MFoPqEXwQU4Py
         5QJQ==
X-Gm-Message-State: AFuF++nJSYinjLZcUhMHNwKVYGaUKnQTUBVf6anXMqoYmWm24H/2CfD4
	EAdXyfh52dsbPNyxvlIKKa6yjwT6SVGgx+8BUVAuxhXxIQ9D/zBYbRDu8GX1TKdQ6yp/ELIDavE
	KV1C5rJmEfxMUiJYMk1Q5vA5wp2eD5uw1blQ079LiVlLCt8qfE554O3Apprs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3305:b0:495:c607:b13d with SMTP id
 5614622812f47-4b397faca9bmr21201736b6e.2.1788084292161; Sun, 30 Aug 2026
 03:04:52 -0700 (PDT)
Date: Sun, 30 Aug 2026 03:04:52 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a940044.1d9ded08.62e62.011a.GAE@google.com>
Subject: [syzbot] WARNING in wiphy_delayed_work_cancel
From: syzbot <syzbot+e9cbd080a7801f06cf08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11cff979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=e9cbd080a7801f06cf08
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1284d979580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e9cbd080a7801f06cf08@syzkaller.appspotmail.com

------------[ cut here ]------------
debug_locks && !(lock_is_held(&(&wiphy->mtx)->dep_map) != 0)
WARNING: net/wireless/core.c:1957 at wiphy_delayed_work_cancel+0x9a/0xb0 net/wireless/core.c:1957, CPU#3: kworker/u32:0/12
Modules linked in:
CPU: 3 UID: 0 PID: 12 Comm: kworker/u32:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: netns cleanup_net
RIP: 0010:wiphy_delayed_work_cancel+0x9a/0xb0 net/wireless/core.c:1957
Code: e8 bb a8 fa f6 48 8d 7d 60 be ff ff ff ff e8 ed 85 b6 00 31 ff 41 89 c4 89 c6 e8 11 a3 fa f6 45 85 e4 75 bf e8 97 a8 fa f6 90 <0f> 0b 90 eb b4 48 c7 c7 84 8a 43 91 e8 45 7c 6d f7 eb 90 0f 1f 00
RSP: 0018:ffffc900000f7740 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88802b5e18a8 RCX: 0000000000000000
RDX: ffff88801ee9cb00 RSI: ffffffff8b105939 RDI: ffff88801ee9cb00
RBP: ffff888103680740 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: ffff888103680f40 R15: ffff888103680f90
FS:  0000000000000000(0000) GS:ffff8880d5ea2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055979cdf8da8 CR3: 000000003e9c7000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 ieee80211_free_keys+0xcd/0x640 net/mac80211/key.c:1148
 ieee80211_teardown_sdata+0x54/0x250 net/mac80211/iface.c:906
 unregister_netdevice_many_notify+0x1407/0x2150 net/core/dev.c:12537
 unregister_netdevice_many net/core/dev.c:12589 [inline]
 default_device_exit_batch+0x907/0xbd0 net/core/dev.c:13288
 ops_exit_list net/core/net_namespace.c:206 [inline]
 ops_undo_list+0x363/0xab0 net/core/net_namespace.c:253
 cleanup_net+0x499/0x920 net/core/net_namespace.c:706
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
