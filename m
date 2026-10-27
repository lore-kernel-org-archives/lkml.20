Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144444;
	b=S+DbWbP8gHRdjtUE9/zIZGKb0dlo6DndlJA1O8Z4VVSdcpiAHEik2Sogu2SDEhUnj0Pv
	 vFh/i7bc8L9uzYYKuxdU0hYk3kr4dHTiSDtTDQIiqrmhiVvCaPLB5UrUNvSZ7xEaOGRwP
	 SH+qZW/CWdf5tN0RUi2zFe/7OXgK8d+VevexxD8De7V9k+9+PtGU9VRJGmAHFCdCDPbVs
	 mpZubhkT6CoPaILStpclErqRgJzpMrmzrqMKCG3UrwLo2tnpnow+69MW0uaj2OTTVioRk
	 2s6w9jQUZARFldidzTjEX2+kRq+R7699/BEnsITy7ALZnpVHXBSXmXYdZ+uE/koNN4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144444;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+El7GN3ABVO9vM31jJjliUxNOi3FKQJ/7NpwVz7amKE=;
	b=ozl2SRRDXmNn64rRXke8JMDIPCDkaxEOr+HWl+yiNEsyq69dQIZob99mZ2ZnyJ3eww1n
	 gstcBnFdGCar7C1zuBeBhX73vyPfCsR0xQDabAf9bw7KGwZg/LQAxINlyHKe1X9BNn69s
	 I73mrH/iHqE5RLYt6zAy7UE/EXMKk1/eQcHJH3idgkVvhz+0qq0HvwU5A1CcA1sNLhquA
	 bbHLiz5OetsUZvqIcw4icwnVRcpH6HeQ5lwyq1tjM2dpMpnNGRcaxzs6eFzkpRMl8NW1E
	 98WsOZMDx8alfI4mq0qQr4ZJalPmTR8yNk72vkD/CzFBMzFAFNdmWdmkUg6QGxoWlQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=evQ74HRv;
	arc=none smtp.remote-ip=61.135.153.170
Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678AA606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=evQ74HRv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793144438;
	bh=+El7GN3ABVO9vM31jJjliUxNOi3FKQJ/7NpwVz7amKE=;
	h=From:Subject:Date:Message-ID;
	b=evQ74HRvgvLbJiQrelawqfs1l0aPHmoTryHoc7XgzCv7NEOX5AZSvpJ2Op9o+R/cR
	 ChYt2zYeniFTLAwod51vzxuUZbU6b7kqoHRY/XfFRaG5P/5XE2viIJxGwyKrXN5ckf
	 i7DnMNCQHgHV2HHSMlBNLE9a5LKxiv+BUBCOKmAM=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([124.64.22.19])
	by sina.com (10.54.253.34) with ESMTP
	id 6AE1366A000025E2; Tue, 28 Oct 2026 07:40:29 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5950596291622
X-SMAIL-UIID: 15CC297E008E4881A65D3AD8A1C81AC7-20261028-074029-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+df0058a8d0bdce7c4059@syzkaller.appspotmail.com>
Cc: hch@lst.de,
	justin.tee@broadcom.com,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	nareshgottumukkala83@gmail.com,
	paul.ely@broadcom.com,
	sagi@grimberg.me,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] kernel BUG in nvmet_fc_remove_port
Date: Wed, 28 Oct 2026 07:40:16 +0800
Message-ID: <20261027234017.198-1-hdanton@sina.com>
In-Reply-To: <6ae09457.f0fe5aea.79aa1.008c.GAE@google.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Tue, 27 Oct 2026 05:08:55 -0700	[thread overview]
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    6b4b543fa187 Merge tag 'parisc-for-7.4-rc1' of git://git.k..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16ce8f0d580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b4c032ed87e6e91c
> dashboard link: https://syzkaller.appspot.com/bug?extid=df0058a8d0bdce7c4059
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17db5e35580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1413f195580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-6b4b543f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/003ef0d7eda6/vmlinux-6b4b543f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/022618083bf9/bzImage-6b4b543f.xz
> 
> AI-generated root cause summary:
> In the NVMe target subsystem, port attribute store handlers in
> drivers/nvme/target/configfs.c (such as nvmet_addr_trtype_store) do not acquire
> nvmet_config_sem and only check port->enabled. Because port->enabled is not set
> to true until after ops->add_port() finishes in nvmet_enable_port(), a
> concurrent write to addr_trtype can race and switch port->disc_addr.trtype
> (e.g., from TCP to FC). When disabling the port, nvmet_disable_port() in
> drivers/nvme/target/core.c indexes nvmet_transports using port->disc_addr.trtype
> instead of using port->tr_ops, causing type confusion on port->priv (treating
> struct nvmet_tcp_port as struct nvmet_fc_port_entry) and resulting in memory
> corruption, refcount underflow, and use-after-free.
> 
Sounds incorrect given the debug diff that survived a similar syzbot test [11].

[11] https://lore.kernel.org/lkml/6ad48c36.a6d1a155.34a93f.0091.GAE@google.com/

> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=df0058a8d0bdce7c4059
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+df0058a8d0bdce7c4059@syzkaller.appspotmail.com
> 
> nvmet_tcp: enabling port 1 (127.0.0.1:4420)
> refcount_t: underflow; use-after-free.
> ------------[ cut here ]------------
> kernel BUG at lib/refcount.c:37!
> Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 6113 Comm: syz.0.43 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:refcount_warn_saturate+0xd7/0x110 lib/refcount.c:37
> Code: 67 48 0f b9 3a e8 b9 e8 d6 fc 5b 5d e9 c2 d6 b5 06 77 19 83 fd 02 74 3e e8 a6 e8 d6 fc 48 c7 c7 c0 08 81 8c e8 ba 43 eb fb 90 <0f> 0b e8 92 e8 d6 fc 48 8d 3d 6b 27 3d 0d 67 48 0f b9 3a e8 81 e8
> RSP: 0018:ffffc900039d7c00 EFLAGS: 00010086
> RAX: 0000000000000026 RBX: ffff8880549e4678 RCX: 0000000000000000
> RDX: 0000000000000026 RSI: ffffffff81ebe399 RDI: fffff5200073af71
> RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000001 R12: 1ffff9200073af85
> R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880549e4678
> FS:  0000555566238500(0000) GS:ffff8880d449e000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f8d01471220 CR3: 000000002d14f000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  __refcount_sub_and_test include/linux/refcount.h:400 [inline]
>  __refcount_dec_and_test include/linux/refcount.h:432 [inline]
>  refcount_dec_and_test include/linux/refcount.h:450 [inline]
>  kref_put include/linux/kref.h:64 [inline]
>  nvmet_fc_tgtport_put drivers/nvme/target/fc.c:1464 [inline]
>  nvmet_fc_portentry_unbind drivers/nvme/target/fc.c:1278 [inline]
>  nvmet_fc_remove_port+0x4c2/0x5f0 drivers/nvme/target/fc.c:2930
>  nvmet_disable_port+0x13c/0x200 drivers/nvme/target/core.c:400
>  nvmet_port_subsys_drop_link+0x26b/0x310 drivers/nvme/target/configfs.c:1189
>  configfs_unlink+0x3cc/0x800 fs/configfs/symlink.c:258
>  vfs_unlink+0x2f0/0xbd0 fs/namei.c:5661
>  filename_unlinkat+0x408/0x730 fs/namei.c:5731
>  __do_sys_unlinkat fs/namei.c:5760 [inline]
>  __se_sys_unlinkat fs/namei.c:5752 [inline]
>  __x64_sys_unlinkat+0xc0/0x130 fs/namei.c:5752
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
