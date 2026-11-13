Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794578104;
	b=Qtchg8LCIRCvWEJE8Z8HfrdNBaNIBEgUWkPIn+UjKW2CuqYkj+5ZOr1SETXBKCEv1Bm3
	 qzlru7RAjOhg+3+3OWKvSD2zgbomOxaZMMPt4gOeGXpQ4aOfNAdplOfEekOTioaWRZEOu
	 UGp20nWedTi9lgXDHLP98FZXLBF9FH0ujx1vUoXzf052jNO0GwRQ9V5e///rqXDv/uPka
	 FlCTmxaGZxb0M3TWh1MluM2bP9JYWB+pIWSL+m0cCXS8aeeTsSyFmVlAzzhQkjVsO7m2R
	 KAPH2uaAM5zf69g3qP2HIIozXFgYe1mX1niFXmkDQtVGclH+RYIk5Gf2vDkpCg9Uuqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0C2yalGdx6wKGFDsGp7XJEGbyjvOgIDpciutSW90K6w=;
	b=a3N/ZSJ7kfNXfmXYVWTAoQWO6UjTofCfXDHqhPgms/kpWw0zR96GqLN3R7qVQbAzqjMn
	 S5hpdfvjx2RqB7hYp0TFS4KxvTjVinnjwMiH5aw/Gzd7NmRSTAVOSYFwA4d2QncR20mu3
	 o2jFpkUbqpYqihgYo3bS/PgLO90W+U0el4azyVjNMT/GWB5wWHFnzhrBbDj+rSllIhf/t
	 C+z7KzOWSOoWxawaeaOQWEfShmbDsH9KFDM9roaxwoWPEUN30ObJeTWJdY/u1U28oDHv/
	 vvs2iOpNRplrLSBAxzLXB8FIwfC+rl/x3tVc3fxEi0mHUeg0Zco/5zRhNZuwpXliTTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J6RZ5ab5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE2E606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE2E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J6RZ5ab5
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4af81963f35so1258236b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:55:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794578103; cv=none;
        d=google.com; s=arc-20260327;
        b=sob33l3VxM1Iq4+stVrVumSdb06sS7+yliZz42qAV5wYalQBlfO6CuFPwR9Jc9ApIh
         zXzu6yioNP/dAqNygWv6cpSkNkVI4Wt+nvK6U5dFwYfn6cWUuI55E2DKOMTGFiVZjnPS
         48m9TtfsZMu4vJORkPXM1GNyyS9ZJwXK7lmKdj47rlpjuoxIDqfNx2387sqxKF+ci6mc
         qzGBISgXY5DvP5bKnby63acYmxh+nVmbTnrSvDhSlxj9W50jE1ap8uF8fMzQLXr4/FkI
         +IRIHzcTgouqcS0UzlIM4WHf3GunpPdskBgL2COEWsWB6w7W+mPpPmGVReYAC3mNGqcf
         mUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0C2yalGdx6wKGFDsGp7XJEGbyjvOgIDpciutSW90K6w=;
        fh=PP3FYsd4BCglVDWIq8QJ/1WdsBC3VtdsZEC4yDPhSms=;
        b=TW8Q3VT6uQyndH462w7CGKnZZ7o2vqcr+qmsgd1JaTZ+aziyYalK20iVoBIoMFHSEj
         bzmAMSyMd5w6eHDpzzIZ69zKnvNW3gEpO4Vznt0aULflI4mS8ALz6TmxMxzttTzoGMin
         8gJ+q8T7nm6TF1NfqooclgI8RFZauYOl8CTXly/IE+1kSC1/TeErTldHLoZXF7/o6zuJ
         eycXgD8i8v8LWD+2/wdpUXODmA0lOdXscfroaiKJCIDNiBdTPAq6q+ANcLiuQlVfIW9m
         tqiHmtOzfpYdYE+DG12e+87u7jafgQUNOpc3mz61UTAV0Hv+/p8UyAzpfu/03gUvHoI1
         FEKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794578103; x=1795182903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0C2yalGdx6wKGFDsGp7XJEGbyjvOgIDpciutSW90K6w=;
        b=J6RZ5ab5UXSwcd6r6MnWMgbLFchJAoo+9Pm/kFc4B779wfv31aiE0ycYSYAWg71Hsr
         yZ9akqMiU4P+odRT3gWIDNKs99JSGEVqeoFsANLpfnRH3iVTjGRyeySetgHua/HQ9ERp
         cR2kXBE4ja0bTfirjwffOLepAnEwgmwIqSeOG/yBxGgKkIjIIhsiD1mklyikL0VZqsxE
         rdGMdG7+fc2d6UXA9x92K9XgAq4Oj+lQj9baqSeirDYXLQ5sZr/ETRRckIbeG5mGrfRU
         SXdNqCOaunQ6ezsKkoyTzvZ+KZ8qL5oPxTZDWFaiLAmkh0Jkx/qjqX8gd1MqVtX7r7Wq
         y3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578103; x=1795182903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C2yalGdx6wKGFDsGp7XJEGbyjvOgIDpciutSW90K6w=;
        b=1gxpJv2E3EiWEBkhahhI1EKkXGF/SvSxKwm1S2qNU2yQaB09U+fxXuBM+ndMMbHQrd
         7jvMbhORNjGxGlE7Q796+Ve8E5rbZC4pqA1UUQ1TfKkcEa9i85d4H+RkhsfTUtfsQNgD
         xS9He74bZd6DXrKKN6Nz1DuZH3RaCr0A/0qx28gpempYJA0GqBXKc3QHjJ9P0PdA7Fyn
         rDJYJHqQ2epz2WeN1Vf9E7Wz4HoNHzOePJaraQNj7KAdbIm00s6zKwXAtl68eE5r6Tp8
         iiBfOCWCyL/EYMnmHbrdRyMcCmXNXBKQxWlx2ylm0nM/YYjY1KX22YyggP/NIbnBVDAY
         hhqg==
X-Forwarded-Encrypted: i=1; AL+hErE0ef1cRxfptqO1qDPRoZv+ymerBKsDZOSwja9Y8ug01aLoXiU1cqA1OmhytQ6J32hnQHc2VmvCH6RO2z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pW7O1a2ekYZG+3cqP7obAIJsmea38vplLktDNIcoeTubYTURx
	tcu+m/fO962ECvHQgoxTgq2juavDT/LM18ex909w+Wklbzx95Xa3GjgAeSqXvJO+vvMpvWiaBbh
	oLT7/24iw7VZgWrEA/+M3yuR4hy2jfJRS5Vl3iAmNXnZCaSMREPFu8vYTDi8=
X-Gm-Gg: AYBFou1yhDQGjZxHPVyIr/ExcuUCL0RShkc7yVZaylAHPK0d3anGthf3gUC1nOETo9Z
	7vHqHOiSSWwdHG+2Ysb/ujQ6EN7vubYc893romrnXDi2FSgOnochtxymcMWyGUOZgLt2FT6lNWY
	VVqEedsKrJxpC9sEf4Zjumbr2mvj3lWWa4BUBBSu/krNMth/0P4TbPZOvrujxamjtKFLxpv1Nfu
	tKMpQSnrq4V08wLZ8ZMPo0uZVILCoOMHq6dmU6iqv/Dz6RyX1dlYNLFfPZXXWuwed5MdRar/8rW
	PSW2h9gHzz7x3UlyhU1h0QN7pJHTZtziHDhbaS7Xw4JFepyKyiZcTPNbrxtkfytc9nGZ2p6T9BZ
	RGi4Yob/q0iYvVAy95dbWgFwQjJZ0cC+SBaBx9osjq2fJOHb6pWIxAzfsmllthCWmeXIpol9AYh
	qLsZ7yBrMHTUrqmfrS0mq/O0xHfFz75CH3u08Ft+ajrCaXIhZTf43UE/qQ6J+wYv+9S614GsWf2
	ohdd8LR
X-Received: by 2002:a05:6808:179e:b0:4d6:9252:48c9 with SMTP id
 5614622812f47-56e6520efa1mr1712240b6e.53.1794578102089; Fri, 13 Nov 2026
 05:55:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6af6a9e8.fe96acdb.12252b.0000.GAE@google.com>
In-Reply-To: <6af6a9e8.fe96acdb.12252b.0000.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 13 Nov 2026 14:54:50 +0100
X-Gm-Features: AclHuK9gPAeneZ0by_7S8O--DcO6yZl6a4icpapqzvMYjM1LieCofYV3lTcxPMw
Message-ID: <CANp29Y63u6oNiz96PGUtH+pg+miU6Rk9bNty6-J2Ggz_HfbFgw@mail.gmail.com>
Subject: Re: [syzbot] [kernfs?] BUG: unable to handle kernel paging request in kernfs_unlink_sibling
To: syzbot <syzbot+02ab1258b7fa66eb1f7f@syzkaller.appspotmail.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

Should no longer appear after https://github.com/google/syzkaller/pull/8111

On Fri, Nov 13, 2026 at 7:10=E2=80=AFAM syzbot
<syzbot+02ab1258b7fa66eb1f7f@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    58c1eb84e977 arm64: sdei: Preserve the interrupted contex=
t..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux=
.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D10ee7f8d58000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da58b6b4d667e7=
a61
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D02ab1258b7fa66e=
b1f7f
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.=
8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17119f8d580=
000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/b1ec47537e12/dis=
k-58c1eb84.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/3bca0c2b1169/vmlinu=
x-58c1eb84.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/0a7c49594d5a/I=
mage-58c1eb84.gz.xz
>
> AI-generated root cause summary:
> The crash manifests during network namespace teardown (cleanup_net ->
> rdma_dev_exit_net -> ib_free_port_attrs -> destroy_gid_attrs ->
> kernfs_unlink_sibling -> rb_erase) when ____rb_erase_color encounters a N=
ULL
> sibling pointer and dereferences address 0x0 (detected by KASAN at shadow
> address dfff800000000000). In a valid red-black tree, ____rb_erase_color =
is only
> entered after deleting a black node, so the sibling subtree must contain =
at
> least one black node and sibling can never be NULL; furthermore, all kern=
fs
> directory operations are strictly protected by root->kernfs_rwsem. This r=
btree
> corruption is induced externally: userspace mmaps the PCI BAR0 MMIO windo=
w
> exposed via sysfs (/sys/bus/pci/devices/.../resource0 in
> drivers/pci/pci-sysfs.c) and writes arbitrary data into device MMIO space=
,
> reprogramming hardware DMA queues and causing device DMA to overwrite ker=
nel
> memory structures.
>
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3D02ab125=
8b7fa66eb1f7f
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+02ab1258b7fa66eb1f7f@syzkaller.appspotmail.com
>
> Unable to handle kernel paging request at virtual address dfff80000000000=
0
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> Mem abort info:
>   ESR =3D 0x0000000096000005
>   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 0x05: level 1 translation fault
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
>   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
> [dfff800000000000] address between user and kernel address ranges
> Internal error: Oops: 0000000096000005 [#1]  SMP
> Modules linked in:
> CPU: 1 UID: 0 PID: 1195 Comm: kworker/u8:6 Not tainted syzkaller #0 PREEM=
PT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 11/06/2026
> Workqueue: netns cleanup_net
> pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
> pc : ____rb_erase_color lib/rbtree.c:354 [inline]
> pc : rb_erase+0x4e4/0xba0 lib/rbtree.c:445
> lr : kernfs_unlink_sibling+0x190/0x218 fs/kernfs/dir.c:449
> sp : ffff800094d775f0
> x29: ffff800094d77600 x28: ffff0000d985c408 x27: ffff0000d985c410
> x26: 1fffe0001b30b882 x25: dfff800000000000 x24: ffff0000c6b58ca0
> x23: 0000000000000000 x22: 0000000000000000 x21: ffff0000d98545e0
> x20: ffff0000d985c400 x19: 0000000000000000 x18: 1fffe000359d3e28
> x17: 0000000000000003 x16: ffff8000898b7000 x15: 0000000000000000
> x14: 0000000000287419 x13: 0000000000000001 x12: 0000000000000003
> x11: 0000000000000000 x10: 0000000000000001 x9 : 0000000000000000
> x8 : 0000000000000000 x7 : ffff800080f6a0dc x6 : 0000000000000000
> x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff80008046e414
> x2 : 0000000000000001 x1 : ffff0000c6b58ca0 x0 : ffff0000d98545e0
> Call trace:
>  ____rb_erase_color lib/rbtree.c:354 [inline] (P)
>  rb_erase+0x4e4/0xba0 lib/rbtree.c:445 (P)
>  kernfs_unlink_sibling+0x190/0x218 fs/kernfs/dir.c:449
>  __kernfs_remove+0x36c/0x748 fs/kernfs/dir.c:1584
>  kernfs_remove_by_name_ns+0x70/0xd0 fs/kernfs/dir.c:1796
>  kernfs_remove_by_name include/linux/kernfs.h:644 [inline]
>  remove_files+0x90/0x184 fs/sysfs/group.c:28
>  sysfs_remove_group+0x98/0x160 fs/sysfs/group.c:328
>  sysfs_remove_groups+0x5c/0xb4 fs/sysfs/group.c:352
>  destroy_gid_attrs drivers/infiniband/core/sysfs.c:1143 [inline]
>  ib_free_port_attrs+0xa8/0x340 drivers/infiniband/core/sysfs.c:1367
>  remove_one_compat_dev+0x54/0x7c drivers/infiniband/core/device.c:1035
>  rdma_dev_exit_net+0x188/0x388 drivers/infiniband/core/device.c:1173
>  ops_exit_list net/core/net_namespace.c:200 [inline]
>  ops_undo_list+0x3cc/0x81c net/core/net_namespace.c:253
>  cleanup_net+0x474/0x6c4 net/core/net_namespace.c:708
>  process_one_work kernel/workqueue.c:3495 [inline]
>  process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
>  worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
>  kthread+0x304/0x3d4 kernel/kthread.c:436
>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
> Code: 91004280 968b3531 f9400376 d343fed7 (38796ae8)
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
>    0:   91004280        add     x0, x20, #0x10
>    4:   968b3531        bl      0xfffffffffa2cd4c8
>    8:   f9400376        ldr     x22, [x27]
>    c:   d343fed7        lsr     x23, x22, #3
> * 10:   38796ae8        ldrb    w8, [x23, x25] <-- trapping instruction
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6af6a9e8.fe96acdb.12252b.0000.GAE%40google.com.
