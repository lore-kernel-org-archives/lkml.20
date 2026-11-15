Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736718;
	b=jnG9jvAKKbgfzsybi5YQoEQp+nhUktqryysbSKpxRUS2+C8T8aBbYyrpCOhxDTLPyz8n
	 nsq8DrGEdEggmslBgOr6AgEVVi2Xx/GDv1ebRuCmDH9BYiAX5QrwrFD9YlX4neSIjNgx9
	 PC1Lmi96WwPsxnfmz+WPrpHNE/N1RsEv7/4FM05m4b8l3StXuMc1nTr0Ntb796kJBjF/n
	 woYKwk75hvUacR8TNXKemMTB2HwiHgQUkioMpesXTx2Rke51W1R8vf3Y/5meiGK+2ui/q
	 SWfwKKshMXVagkFjOvP+dvWS3znycZF4mjBy1xQ/CdGgyHkOTrUBYfxP2D15bwyuTyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736718;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type:Content-Transfer-Encoding;
	bh=+twLC24k76JaJfVXGnex0iphgAHZtLWPYMiM4tTcxt0=;
	b=3ZrQLIdf0AfyOPadqUnpLLYMXJWnaPiyZiR+ebm3OooVtBZAi9hN93tc6PHSV+cMxwju
	 3TKLNiquKvzQS9c5SN1547UL2PhK9XMgLk6uoj0iPQkD6kWce3TZ0dUEwS2xzmKMNc/Dy
	 qqYYrGB6Kvwr7vbnvzph34Gi1KUN4D7kPpeVrMqH5URzP1rIPZrZnjDyWHjqyNeJJlERP
	 8YfegXdpoYrJt9E56A+eW7Ehdu7CwaHWqgLMtR4s6nXB76cqO/27esoDNDgC65yilhltF
	 IzlC9qmB8HHaVlgY23EA9Np205Ie5G40njPJOHsSe5ZykcejlXuMsVmOE2Rw2AbCRHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF6D606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF6D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862bca06702so357029a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736717; x=1795341517;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+twLC24k76JaJfVXGnex0iphgAHZtLWPYMiM4tTcxt0=;
        b=HO04RzMR8phg1E/AwrkIHwcRCLCLr63LmzBkK8dWIOXKNLSIoY9b2G2cpH658V5QYo
         c6aqvdaAiSn9rbU0SUIi1Gku0DpFgLt4JOQMO/Rwi8eS29/IwjmOIUhgTIm10n6IhYvc
         JW3xEeh5qmVs9gZxT08PFR4v97cmbLSjJQaQHgxMfc4OLK6Ye7ytoG4H0BWudk0giu+5
         0JYI+7O+R/amjNnkmTk8pXAXc86LN37ccN31B5zbEGpYp0lb0zlnd5zGBFic8dIy4mZg
         /uAFZJPrZ/gCmP817uBl/yTbs5aDF71v1v4fESTdBjahFKhzwBKrbm+Ilpk/PnnygZ7i
         IF/w==
X-Forwarded-Encrypted: i=1; AL+hErHdpZJmSnYS7YkntEdXJuQQ90gdpC488Mtt+m6blsOOVxHWk6LYiuFzgxLIINCBKHhYNJgmajI1w/uYtDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FJHcbvzCMRrv0k1m2Uz4KaCt7dlSM0pz/dS/o+8r73OTzfy/u
	1PnwNogclEJtg+WM+BGNPZrEABi7PR56Uj6+SCRZIVmdYHIDC64MeTbKi5No1QBW5nlHjg8e8+M
	RKEKgdCEH5/A48DwhB4jLwN1yNXDGuAKjPBQmLcEYDs8oOzLFPeDoK1s56ME=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:811b:b0:572:878:fccf with SMTP id
 5614622812f47-5720878fd52mr2201182b6e.59.1794736716909; Sun, 15 Nov 2026
 01:58:36 -0800 (PST)
Date: Sun, 15 Nov 2026 01:58:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9824c.920b2b3a.148c65.0009.GAE@google.com>
Subject: [syzbot] [net?] WARNING in devlink_free (2)
From: syzbot <syzbot+bbd81e1e2276c534dea1@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, 
	jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    aa40afa831eb tcp: fix NULL pointer dereference when restar.=
.
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1582ee3d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd44b06612b68f56
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dbbd81e1e2276c534d=
ea1
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2e5d84927015/disk-=
aa40afa8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e267992573f1/vmlinux-=
aa40afa8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/828d3e3f2df4/bzI=
mage-aa40afa8.xz

AI-generated root cause summary:
In netdevsim, switchdev eswitch mode can be enabled with zero VFs configure=
d,
allowing userspace to create devlink rate nodes via netlink. However, durin=
g
device teardown or reload in nsim_dev_reload_destroy(), the cleanup call to
nsim_esw_legacy_enable()=E2=80=94which invokes devl_rate_nodes_destroy()=E2=
=80=94is
conditionally guarded by if (nsim_dev_get_vfs(nsim_dev)). When VFs were nev=
er
configured (num_vfs =3D=3D 0), nsim_esw_legacy_enable() is bypassed, leavin=
g
devlink_rate nodes in devlink->rate_list and triggering the
WARN_ON(devlink_rates_check(devlink, NULL, NULL)) sanity check in
devlink_free().

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3Dbbd81e1e2=
276c534dea1

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+bbd81e1e2276c534dea1@syzkaller.appspotmail.com

netdevsim netdevsim0 netdevsim0 (unregistering): unset [0, 0] type 1 family=
 0 port 8472 - 0
netdevsim netdevsim0 netdevsim0 (unregistering): unset [1, 0] type 2 family=
 0 port 6081 - 0
netdevsim netdevsim0 netdevsim0 (unregistering): unset [1, 1] type 2 family=
 0 port 20004 - 0
------------[ cut here ]------------
devlink_rates_check(devlink, NULL, NULL)
WARNING: net/devlink/core.c:544 at devlink_free+0x359/0x450 net/devlink/cor=
e.c:544, CPU#1: syz-executor/17425
Modules linked in:
CPU: 1 UID: 0 PID: 17425 Comm: syz-executor Not tainted syzkaller #0 PREEMP=
T(full)=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 11/06/2026
RIP: 0010:devlink_free+0x359/0x450 net/devlink/core.c:544
Code: 00 e8 fb 62 e8 f6 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc e8 =
e6 62 e8 f6 90 0f 0b 90 e9 02 fd ff ff e8 d8 62 e8 f6 90 <0f> 0b 90 e9 29 f=
d ff ff e8 ca 62 e8 f6 90 0f 0b 90 e9 59 fd ff ff
RSP: 0018:ffffc900038a78b8 EFLAGS: 00010293
RAX: ffffffff8ae0be08 RBX: ffff8880797aa000 RCX: ffff8880546a9f40
RDX: 0000000000000000 RSI: 00000000fffffff0 RDI: 0000000000000000
RBP: 00000000fffffff0 R08: ffffffff91be00bf R09: 1ffffffff237c017
R10: dffffc0000000000 R11: 0000000000000000 R12: dffffc0000000000
R13: 1ffff1100f2f5400 R14: ffff8880797aa1f8 R15: ffff8880797aa3e0
FS:  000055557a90f500(0000) GS:ffff888123508000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd61b5f0ce0 CR3: 000000002bf22000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 nsim_drv_remove+0x146/0x170 drivers/net/netdevsim/dev.c:1736
 device_remove drivers/base/dd.c:617 [inline]
 __device_release_driver drivers/base/dd.c:1357 [inline]
 device_release_driver_internal+0x42b/0x7d0 drivers/base/dd.c:1380
 bus_remove_device+0x444/0x560 drivers/base/bus.c:678
 device_del+0x524/0x8f0 drivers/base/core.c:3967
 device_unregister+0x21/0xf0 drivers/base/core.c:4008
 nsim_bus_dev_del drivers/net/netdevsim/bus.c:488 [inline]
 del_device_store+0x2b5/0x370 drivers/net/netdevsim/bus.c:243
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:575 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:667
 ksys_write+0x150/0x270 fs/read_write.c:719
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ffbf2169d0e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d =
89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 8=
4 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007ffef50b4238 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000055557a90f500 RCX: 00007ffbf2169d0e
RDX: 0000000000000001 RSI: 00007ffef50b42c0 RDI: 0000000000000005
RBP: 00007ffbf223891c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffef50b42c0 R14: 00007ffef50b4b00 R15: 0000000000000003
 </TASK>


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
