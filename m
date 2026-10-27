Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102937;
	b=VUdyH2qV2iYfF1vtOI1UVrpz9WYBXod7W0FgTF+znlFiUELsO70fDN1i1kD7zabcFCJE
	 QPwlLpgNW9bYSp2XRk1AD5bzmsHTad5AyJqq9xcixd1tuyMYTM5obW4TpMk2B5+x7BfMT
	 fXjoGY19l0sdMwGze5ueakkxIrEBYyQYb9jjhBmzvgxeYAOnjyP0/pQaN86/t9YHXYJk0
	 Gqgs6aR2hwgFCmmhM9pKMcaZ926NhWE/x1JJHWenwcNGpLSd5RJUZqPQrr5xoI2JSxXE7
	 8/1dmIT9v/34hIZq/650hdSqoKDTR/6SisQ/lX3I8nAmktdlHqz5R+geVVO5+JhPUzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102937;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=gNStirggrbCaAZglRUL6AdrKtClH0SRDwxxuW0OS+WQ=;
	b=VbVFPgQmEn9rd9Z5qXUprLi/LTNZbEhbpKdZm1rzWGCe2rd4+xjnp0pOYr66vntYa3Tt
	 RX3loTXzGqG/k1b/vICNAPu9kKzlRHb68TtMCENwSPO0BMSPQtJKG4lzl5DNpwFh675qp
	 eZG/yR5aX/k2ZIXNAK3B2ArV+9Uxwru9fyTmIZyJhAbVWDg+Mfkl3IFZsDvd0MPacn2bs
	 X6JjmozhAEjrRyvtDhbDt8aQiWAOei+N1RchviSv6UNJkNa9gjF47d6H5QlVNE+qI1+xn
	 ywjKrNK3+ATZtn0SWK1m7vKCi8CRrdScNQsdrdrauEqW7pi9CNpPTa93rPSRgkpgYqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F64606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-83f6f9096baso5805532a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102936; x=1793707736;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNStirggrbCaAZglRUL6AdrKtClH0SRDwxxuW0OS+WQ=;
        b=sbrmYKibaI06hpZLUrZSYaJJETX39F6ueGAASYTAkBO0r2dfL8HNZlvZHAuxJCgus1
         ua8b9Htt5dXPXASZMGyjJBeIAAsz0FltiM/AgG5OS5b/4kDJEkTkLcATYPRGaTH6XfK6
         aFHJxFHMw+vqZrSyavvgYXWk2nN/aaWpMXM5CJWFRcY7Xt0Xsi3FugMz9qeVbUm/sJbL
         VYXSejNa5MbrgvazNcJxRe86QdOs5+vUz7IILUTPt/ZD+P7V28qfmXtN9ch6r7LrQ8aN
         vrgG8W8jaVOV0yPtFE56e/uRAdAnD8rIkQRskHxcD9G87gJyop0oN1iTGuWaQ5CZ+aOE
         B3wg==
X-Forwarded-Encrypted: i=1; AKwUvBz6aafSIzV5LrajVG8y6E+iV1nBr3ng17JlscKuFdBT8ZoOTAn6glA4WfdWA+p1h6GQpry4mTNPb6fRyco=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ3rpQ/b23PnfmWsr+uICGI8ehMTWjf4k1cDv9KOfcHoLUNo9w
	ECuk6KpBIZb0R/4U3AMzSM78nj+iWap0yBZrKVXW8erao79H9FA/GR8Qr759x+sYpkwMEGEpL81
	8mUThjIxYiCTqmAvKDfjd3V0rxba6junHsRzPMwtihSuwRk2TQq93VZ0Eydk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c410:b0:4f6:ae3d:8230 with SMTP id
 5614622812f47-55c0037e32emr5854557b6e.46.1793102935989; Tue, 27 Oct 2026
 05:08:55 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:08:55 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae09457.f0fe5aea.79aa1.008c.GAE@google.com>
Subject: [syzbot] [nvme?] kernel BUG in nvmet_fc_remove_port
From: syzbot <syzbot+df0058a8d0bdce7c4059@syzkaller.appspotmail.com>
To: hch@lst.de, justin.tee@broadcom.com, kch@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	nareshgottumukkala83@gmail.com, paul.ely@broadcom.com, sagi@grimberg.me, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6b4b543fa187 Merge tag 'parisc-for-7.4-rc1' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16ce8f0d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b4c032ed87e6e91c
dashboard link: https://syzkaller.appspot.com/bug?extid=df0058a8d0bdce7c4059
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17db5e35580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1413f195580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-6b4b543f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/003ef0d7eda6/vmlinux-6b4b543f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/022618083bf9/bzImage-6b4b543f.xz

AI-generated root cause summary:
In the NVMe target subsystem, port attribute store handlers in
drivers/nvme/target/configfs.c (such as nvmet_addr_trtype_store) do not acquire
nvmet_config_sem and only check port->enabled. Because port->enabled is not set
to true until after ops->add_port() finishes in nvmet_enable_port(), a
concurrent write to addr_trtype can race and switch port->disc_addr.trtype
(e.g., from TCP to FC). When disabling the port, nvmet_disable_port() in
drivers/nvme/target/core.c indexes nvmet_transports using port->disc_addr.trtype
instead of using port->tr_ops, causing type confusion on port->priv (treating
struct nvmet_tcp_port as struct nvmet_fc_port_entry) and resulting in memory
corruption, refcount underflow, and use-after-free.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=df0058a8d0bdce7c4059

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+df0058a8d0bdce7c4059@syzkaller.appspotmail.com

nvmet_tcp: enabling port 1 (127.0.0.1:4420)
refcount_t: underflow; use-after-free.
------------[ cut here ]------------
kernel BUG at lib/refcount.c:37!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 6113 Comm: syz.0.43 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:refcount_warn_saturate+0xd7/0x110 lib/refcount.c:37
Code: 67 48 0f b9 3a e8 b9 e8 d6 fc 5b 5d e9 c2 d6 b5 06 77 19 83 fd 02 74 3e e8 a6 e8 d6 fc 48 c7 c7 c0 08 81 8c e8 ba 43 eb fb 90 <0f> 0b e8 92 e8 d6 fc 48 8d 3d 6b 27 3d 0d 67 48 0f b9 3a e8 81 e8
RSP: 0018:ffffc900039d7c00 EFLAGS: 00010086
RAX: 0000000000000026 RBX: ffff8880549e4678 RCX: 0000000000000000
RDX: 0000000000000026 RSI: ffffffff81ebe399 RDI: fffff5200073af71
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 1ffff9200073af85
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880549e4678
FS:  0000555566238500(0000) GS:ffff8880d449e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8d01471220 CR3: 000000002d14f000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __refcount_sub_and_test include/linux/refcount.h:400 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 nvmet_fc_tgtport_put drivers/nvme/target/fc.c:1464 [inline]
 nvmet_fc_portentry_unbind drivers/nvme/target/fc.c:1278 [inline]
 nvmet_fc_remove_port+0x4c2/0x5f0 drivers/nvme/target/fc.c:2930
 nvmet_disable_port+0x13c/0x200 drivers/nvme/target/core.c:400
 nvmet_port_subsys_drop_link+0x26b/0x310 drivers/nvme/target/configfs.c:1189
 configfs_unlink+0x3cc/0x800 fs/configfs/symlink.c:258
 vfs_unlink+0x2f0/0xbd0 fs/namei.c:5661
 filename_unlinkat+0x408/0x730 fs/namei.c:5731
 __do_sys_unlinkat fs/namei.c:5760 [inline]
 __se_sys_unlinkat fs/namei.c:5752 [inline]
 __x64_sys_unlinkat+0xc0/0x130 fs/namei.c:5752
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8d0159f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffef6d7e878 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007f8d01825fa0 RCX: 00007f8d0159f559
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007f8d01636b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8d01825fac R14: 00007f8d01825fa0 R15: 00007f8d01825fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:refcount_warn_saturate+0xd7/0x110 lib/refcount.c:37
Code: 67 48 0f b9 3a e8 b9 e8 d6 fc 5b 5d e9 c2 d6 b5 06 77 19 83 fd 02 74 3e e8 a6 e8 d6 fc 48 c7 c7 c0 08 81 8c e8 ba 43 eb fb 90 <0f> 0b e8 92 e8 d6 fc 48 8d 3d 6b 27 3d 0d 67 48 0f b9 3a e8 81 e8
RSP: 0018:ffffc900039d7c00 EFLAGS: 00010086
RAX: 0000000000000026 RBX: ffff8880549e4678 RCX: 0000000000000000
RDX: 0000000000000026 RSI: ffffffff81ebe399 RDI: fffff5200073af71
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 1ffff9200073af85
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880549e4678
FS:  0000555566238500(0000) GS:ffff8880d449e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8d01471220 CR3: 000000002d14f000 CR4: 0000000000352ef0


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
