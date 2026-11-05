Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900436;
	b=NruWbrY4l8vF0LtemKu4gHfwwBjsE/lFtg0tLEDkXgx57qvYsQwQevb2wk7VJWix6nPT
	 44p4VHltHoPVh/xaRbWvNS44OofNZVeOYZVEKvPzsYucDXls9e3lhFB3TVkLOOTQgt0eq
	 YMcN6yufFQHl5oM0jZWQNI40/qCkni/TQ+GN5M0wXNMol4hbDw2bKXCrefL6S41bdZpCU
	 s0P1OsCGMXaEV6M7POL1Qxzoxch2PxFlsLtac/cRKQm1LTol7DrqBEjqw1+ll8TAx+E+O
	 ECNio27l2eeFh6Q+ULLyvt85t85zRACPkg1QXhjzSny3o+mWkG/G6t6AMAdI9jhN9vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kE8q2GjYAflbf+apwEjCC7YUimz7X6qnN6p3qOSXMbY=;
	b=snAJAwt+yJ2/hVquLjFGBhBFOg23tVKgN4S1fznV7NAzs+fYEY55L5v+oLx31CaHUlbG
	 3SP9HXigoJ8cutXVSURC09oasJ7Dhrl4Y2no0NlPI8VwMxwhqEMjNRwAJ7LWP5BXYqmz5
	 Cv/1h+R1jkeo3k2Ndy3u0gLFXKcau+91hOt/jwAY+7izP1lW9L5MAQUIZqgUju87JxXKP
	 gb3l0Tt3u64QbMekmFc/2YwSmAuwvjyYr1XiJ3Du7TV7FuUMvskCS5XB0y92ClOAsvw05
	 nZ8H6HDuxMw4WiezImWHebp0UjCqXiqSVnOICcaWqwlikDRMEFvjwd7ahGAWwgW2yFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsUgOzZR;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7346C606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7346C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsUgOzZR
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91c5e31bea9so29138916d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900435; x=1794505235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kE8q2GjYAflbf+apwEjCC7YUimz7X6qnN6p3qOSXMbY=;
        b=DsUgOzZRr0firaOo6rHyTJvzJxeQeOgTkPLefGpoaGLbuW0110ADbhH9l8UUlzfdhW
         OZQxx31b4IIudwjlAd9NiUJkvOZjhNmZ+iuL/Qkov0jmG/KImIZouq/PxsCpKogcpKn0
         FuQi+pV/n41xepVG9SBE1THkJQBaDR730/UcRUB9AG5++KT+HJQ1Lh94ZZgkw+TU4bTZ
         jLPz9STprBOw4A5LG7GqnThH0iGwUPG+U0ltbpOsAJDyyhZlUrlxIu6WQlceXwx5Ghy5
         +SKi41moLre5nj4soemM13Sim2JSv5sS57z4Z7i3QhJpApGuLqHHeVrnBcKQvgckpzr3
         UnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900435; x=1794505235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kE8q2GjYAflbf+apwEjCC7YUimz7X6qnN6p3qOSXMbY=;
        b=Sbn59LXhMppVA74DzwrFYsp+MbjMTxvE7naCe7vsCSAFy5e8VfrVImtEy07bKEkf+z
         rSZo8cOG1Qp+sN6GOX03OqhY1VHe47QRWnsQhS2ouqgg249HC/zHHRAbDdE3MG7RlhaD
         bHCur8YUrr2BqXTbU37MF4WUv9UY4TnxhvyYHD7131OL4Y3Ca8CelVC5R31K08bm73P4
         venhP/6d6Iw4UyBCN1vsdQ90QtRNJqM6KxLkuMSzLOzmGNx5zT4QsE1AAFmwT56uTTyb
         Ui8z/AZR+YyFDHGqQRq6VK0WS3sT2KiocdpDMvA8atO6wV1ECSrCvh/CBfM89UBHWFev
         7PIA==
X-Forwarded-Encrypted: i=1; AKwUvBxc+j9I04BbMZpj1nay/vjwzud/0Nlr0bbkCRYE3E0LvpyhdoPYGMgj+YdfgDKy+F7zxhIx5EC00sHoafk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rXeTxCkJwj5+bmFfP+bnX/HI4FedyswezEXIdltxukJUWPzn7
	uAY/qJtjEoUtbYu8KtaqKgoJB9FpIwiclyhs7jJw1jhh8+SUEtgjxUbE
X-Gm-Gg: AYBFou0qDD82a9WcAoS60Pr1/OrvTbcjyqRuJDC0gIGLLj00BOe/yxVvq3Tlj71w+Lw
	Op/AIfoSJBpQ4tbuv0RCas9EZoor2MxEUMY2EOAcpN6HCCvAcPEMVsDuAqzK2O5IxV3vNLqYMyI
	OysaIpztXCI+TprB3H8upvSGaYOi3lpYHIxn6IGjB4qfqO75aAK6R6yrkxEH/2I2oxLyVhMoDHb
	Js64YcXFFR0Em49Wg2y31NiwPTbDnHHwnjYaGPeYMpmm8B0jc/5jyVEKiDEDC4c+HQzI8zBalFa
	PzsEK4UT7ECBxr1UaPc0MCGPDpc+p4injBsauekGpI6lsRT7AT3FCD/GAlxF7vK852q67m939n8
	F4SfJENcDOkDlbnY9rtPHSinP+vFsFjjj5VqaXKopCixKbouiWxHYv5acjqg+2ZTaVykoYuUesM
	M/lvbj6lqSJEihMe52Lcwv+Nc9JLZTnC5DQstpfdp2iPfINJFGdcXzeO67MQCFitMpvTam0ptnv
	ngZ9P+jfu+sfj7WNbUIQvjcHK01FPhKOjWtYQqrtH0JFzYIxwAnHSp2K9xW43MddO9SAiMcYBvh
	sVkdlnNllOlFeBW1iHjkXZY+I1OUGWtwIDprzwwK6QARzrxwK8yH8+5xXB9o
X-Received: by 2002:ad4:5d41:0:b0:91e:91d3:82f3 with SMTP id 6a1803df08f44-91e91d3888bmr65059416d6.19.1793900435225;
        Thu, 05 Nov 2026 09:40:35 -0800 (PST)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6ac8d02sm673786d6.42.2026.11.05.09.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:40:33 -0800 (PST)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Bernard Metzler <bernard.metzler@linux.dev>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] RDMA/siw: slab-use-after-free in siw_cep_set_free
Date: Thu,  5 Nov 2026 12:37:47 -0500
Message-ID: <20261105173754.660897-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in _raw_spin_lock_irqsave

This is a SIW CEP lifetime bug reached from `siw_cep_set_free()`'s
`wake_up(&cep->waitq)`.

on commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d (7.4.0-rc1)

To help trigger the bug more reliably, I applied a minimal diagnostic patch
that only adds delays and print statements.

A related CEP lifetime concern was raised in:
Link: https://lore.kernel.org/linux-rdma/05b91f98-e3a3-793a-9197-f09d84acfaf7@linux.dev/

This report provides a reproducible TX-worker race in
`siw_qp_cm_drop()` around the `siw_cep_set_free()` unlock-to-
`wake_up()` window.

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/0ef6a31bdb90f4f245b5f86b76775bc5

I am happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

==================================================================
BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave (include/linux/instrumented.h:112 include/linux/atomic/atomic-instrumented.h:1300 include/asm-generic/qspinlock.h:112 include/linux/spinlock.h:188 include/linux/spinlock_api_smp.h:156 kernel/locking/spinlock.c:181)
Write of size 4 at addr ffff88810d742230 by task siw_tx/1/78

Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
<TASK>
dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:595)
kasan_check_range (mm/kasan/generic.c:200)
_raw_spin_lock_irqsave (include/linux/instrumented.h:112 include/linux/atomic/atomic-instrumented.h:1300 include/asm-generic/qspinlock.h:112 include/linux/spinlock.h:188 include/linux/spinlock_api_smp.h:156 kernel/locking/spinlock.c:181)
__wake_up (kernel/sched/wait.c:124 kernel/sched/wait.c:146)
siw_qp_cm_drop (drivers/infiniband/sw/siw/siw_cm.c:517)
siw_sq_resume (drivers/infiniband/sw/siw/siw_qp_tx.c:1190)
siw_run_sq (drivers/infiniband/sw/siw/siw_qp_tx.c:1278)
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
</TASK>

Allocated by task 340 on cpu 1 at 18.058572s:
kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
__kasan_kmalloc (mm/kasan/common.c:409 mm/kasan/common.c:426)
siw_cep_alloc (include/linux/slab.h:991 include/linux/slab.h:1312 drivers/infiniband/sw/siw/siw_cm.c:210)
siw_connect (drivers/infiniband/sw/siw/siw_cm.c:1487)
iw_cm_connect (drivers/infiniband/core/iwcm.c:730)
rdma_connect_locked (drivers/infiniband/core/cma.c:4490 drivers/infiniband/core/cma.c:4530)
rdma_connect_ece (drivers/infiniband/core/cma.c:4562 drivers/infiniband/core/cma.c:4585)
ucma_connect (drivers/infiniband/core/ucma.c:1148)
ucma_write (drivers/infiniband/core/ucma.c:1869)
vfs_write (fs/read_write.c:685)
ksys_write (fs/read_write.c:739)
do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

Freed by task 340 on cpu 1 at 18.111920s:
kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
kasan_save_free_info (mm/kasan/generic.c:584)
__kasan_slab_free (mm/kasan/common.c:264 mm/kasan/common.c:296)
kfree (include/linux/kasan.h:235 mm/slub.c:2780 mm/slub.c:6630 mm/slub.c:6923)
siw_destroy_qp (drivers/infiniband/sw/siw/siw_verbs.c:635)
ib_destroy_qp_user (drivers/infiniband/core/verbs.c:2182)
uverbs_free_qp (drivers/infiniband/core/uverbs_std_types_qp.c:34)
destroy_hw_idr_uobject (drivers/infiniband/core/rdma_core.c:579)
uverbs_destroy_uobject (drivers/infiniband/core/rdma_core.c:172)
uobj_destroy (drivers/infiniband/core/rdma_core.c:240)
ib_uverbs_cmd_verbs (drivers/infiniband/core/uverbs_ioctl.c:379 drivers/infiniband/core/uverbs_ioctl.c:526)
ib_uverbs_ioctl (drivers/infiniband/core/uverbs_ioctl.c:555)
__se_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:597 fs/ioctl.c:583)
do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

The buggy address belongs to the object at ffff88810d742200
which belongs to the cache kmalloc-256 of size 256
The buggy address is located 48 bytes inside of
freed 256-byte region [ffff88810d742200, ffff88810d742300)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10d742
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100041b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 0200000000000040 ffff888100041b40 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 0200000000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
ffff88810d742100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
ffff88810d742180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88810d742200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
^
ffff88810d742280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
ffff88810d742300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================

Best,
Shuangpeng
