Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792455399;
	b=2PFncWO9DtC5BLg+8HNpJrYmCFxc9zvJjrjqTPK8Ai8Bs6JJburLTko2Nx9Kof6wakuR
	 Gz/1+WhBpJvr5IZF0K5JdNBf+9+bPDSgNj59PjkMOqYanTT9YSJcN0hN3JtD7GBkQNR7B
	 dCovKgHi0VP/sndrWicR01Lst4iDqXsk2x6raqqd+7PbnW0SjXIva/eYoyxlcnbsNYBoy
	 HlUk4mxqFQEMaELBf0aAi6jyMGwVT32W8fqz45Rf2DgGDcYM39WtXx4nu59Vzsed4eHa0
	 P7RugDbtiwaX8X7DAnVV9TfemezTQdfkCJ8y0sLkv+Iakmjh8XYkxtRp5B7C2kjlhgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oeN6lMsAWhAX3rKxSpB3MVxlEglVTKUqWIRPPdmiiXQ=;
	b=5JAVaoTBXJVEZLRA5Mm+qu544JPj97cq6E08XQkb/h+4T+qOurErIvjeVzzuVo/X+I1b
	 bfM78ztMOvp5A3hpnG2gZkli1gC3SbK6yLMF6wiMNKNajWvMSezTLZ16nKz+u4aQK5Rc2
	 PgKjOnP2/7ik5Ow71euf8GA29PNGCUJ3896gkHqrEjgQkUUoq3dgdoCgmJxCLVs1/vVM3
	 qu+dk+SjeJMpL8k0diZ5vznH26QKafxaBea5GoWOMLnjdJCoR89/5dN6IUr9vSGb+tx97
	 CuKwnr4bpJ/ksO1AY4rOjMjH9MKg2ubMhcaQI13Vcs/7L1Gx5tWGaGBNgPITGyAYpxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mtSaiqpa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0A9606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0A9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mtSaiqpa
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ab3d3c5761so22027487b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792455398; cv=none;
        d=google.com; s=arc-20260327;
        b=UJDz6ehxK+UuZ2uydEOOX1e7Arrj3r0082n8dN82WYwdLV6LLPAr/FUAozWOUwykvL
         8Y+lzYSkLHGArAuYpXmPY4jle+uetiX8IkhM5+Ow8LwY61JXWCqMLHANMXSyReJvow+p
         AcWSQUf1YRQtdKOU9uBLWcB2wgpHJvydtG7j9pD1yyVk0P1VdT73yX9mSPq/6HKOkxwZ
         HGB8GgL9YN7Nib6oc2VtDtC5raJomneuImhhUZYfExArMBNtds+QROL6iywpPftrN0ZP
         Tj9iLuGxQ5HuApeJC2K5QIUWx/2aYOIg34HB0wSSi8fPDg5h/WJq667JOytkc5bWLQuN
         s2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oeN6lMsAWhAX3rKxSpB3MVxlEglVTKUqWIRPPdmiiXQ=;
        fh=fXJUSflQwC3BW86F6ZR+WqQoZxayrlRLvyZZJ3aPHPI=;
        b=U3A0Kvz8BsOEA5cXZAeO0wkYBIrJGg0cn3wwifVbHhw9EFfvH5+NXkUtgYQG9GA/XL
         YRfXBTPR+pvbUhbg89grpTZnhx1nvv3bvkdIJ3QHbqsb0RjuS+3viv9cp0eQ+DfDeRNX
         GwtLrjE5reBfI+LQ5LcowDbzsi40DOjaH4MOBf2MThUETXYzsdDlrn1KoHDfkZcFBpdQ
         BHE9hcac6Eo23Yett24lyjxbDd6jI+PqfOEqFN3d+eB2ZATpie3lpyeSm9vmTe0r5zLv
         f/upaSAosJnlyvIppY9hg1XN7J8LXCSOfIXmcZi/88aSjFtBtJ5xNiLegWF6OUmI81p8
         hzOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455398; x=1793060198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oeN6lMsAWhAX3rKxSpB3MVxlEglVTKUqWIRPPdmiiXQ=;
        b=mtSaiqpaXPHOTOYZxrcYudF+/TTIssk3CHGyluy/NHZU2UHfPIW/kkkts3ygzRgiZM
         rgcWXcanDp5plSca1bT1nbkKqcNc45w7wHKtkEr+pKo/7wtW0uM16vdarUN3tPMtOsm/
         3P1TA5Y0CSOkAhJzXUamdiA1a8huenoB6taH1YlIjysj7e3VK++qfLcN7CgcYVIkYW+7
         +dn/1yn+Zl8BoQUH+EoaR3lS0j3K0uqE12VL+QDzvj4/mYTgwSByJfeVvKfRcl/iKMdt
         Bva66lFkCqm5lcp5xI9PVxNHzqf4oLSczUzdDMwU8Mbmzj+riuLGAgkRpdv6J5yGKQ9Q
         N09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455398; x=1793060198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeN6lMsAWhAX3rKxSpB3MVxlEglVTKUqWIRPPdmiiXQ=;
        b=0Qm8eieq8pHwQEZiTBlxTB3ymzsSPY749frTw7BZcpoRgtsv9sPF3tPJe2Csgjv79M
         yuxJwB5O8bnO4pLXYHrQpNEhxETRmfGnvd1M9MtWd0p+64Uow+CdxJqFZYJmkCMUh5QB
         ++As5FUT3brbs/M9mkChfhLkCUGauuSJTPB9I+JozNa3LwRH6BnS+ehgGPYHfagOsE+f
         XlzDOW1TpfJYTNG3TUQcDLtcj0SeN1iDxJALzIZ7ot3xgu1mbtLmoQy0YlN+Q2dPvsss
         Mkb9YEuRZWoFzamv3BlyxCj6081AlT+nYl84XJHQFK2fjIYF3BlRi5v7had8QyfrW3mk
         yKiw==
X-Forwarded-Encrypted: i=1; AKwUvBxUCcrv71SGKVjBHJYSWFxchBbyH1Gda//qKtp7RUoWWUbBKMXQuZfpSG+2s20ATWB+XeUVCxcP2camFR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzXMKMRnA3ukQZpwKHhYAYlMM9p5Zf1GmDVq2dPU9yhGBEuMiR
	yK7UaL48fGXuekljKRzi0pnK72nRvSKImcvm1F1zyCQH7dpVmga/I6IWks9hhhYpQ8D3B2Mv/c6
	mNMS9d11zEankEF2+BZlnVQWlSMdxcPQ=
X-Gm-Gg: AYBFou2cKc12p8d65XGUAjAK+FEEL488m31vNBQze1x8w9meX72gaWLw1CViQ4bZw0O
	omVS+TRRxF4Vq9Q719vIGvI8atskR0CYd6mKI/Lzthw3Ga8xe9v0/BWmoKZGHMwa8UDPuMT6shK
	qjtUyqKm99uy0MAXdxY/efVbW1TUi3SOHFJIFuNCQ6gAdtvLg8qkBj8RPAsAdjVjkYUjclI7e3X
	QmJ6DLqH/p65ShYPJlnxTHv2XC7+oxvf8EzSiGW03MUXP6brDZEI1RHtaQupdAx5/cRDqUG8YRz
	JBD/Wg04P5q8skkVxbX4baCK/nMbm6dnK/rGn9N8jAftGqr6m/2D9XOBhA3VItcWn9FbLZKEl7c
	dIf8ekKiVxzDcwnOYklR5YACAcZP2zh03PwN43FC4zXx7OCsqV3UFqiiCubaE3/9gb7B5KFaoWx
	Eoo27UCdeYGoUo1UQJw1ojt3pwYpHXNuy8ww==
X-Received: by 2002:a05:690c:f8c:b0:8b0:f116:122a with SMTP id
 00721157ae682-8b0f214020cmr42505667b3.14.1792455397879; Mon, 19 Oct 2026
 17:16:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017050928.128582-1-sidchintamaneni@gmail.com>
 <20261017050928.128582-2-sidchintamaneni@gmail.com> <CAGsJ_4wGq9oc05=-g4aWptLdCbTwUjMjXk4Rd6KjJ6x=tzMm+g@mail.gmail.com>
 <CAE5sdEhGFtGF6LC4xNkMwGj3vTxLOW=GNBXnk3-JmsgjntXx0Q@mail.gmail.com> <CAGsJ_4wmvBvEn_vXu8-c6BRAnRewYmTs8iUd8T7KRx7_svZrwg@mail.gmail.com>
In-Reply-To: <CAGsJ_4wmvBvEn_vXu8-c6BRAnRewYmTs8iUd8T7KRx7_svZrwg@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 19 Oct 2026 17:16:27 -0700
X-Gm-Features: AclHuK_duovmGh6MgK6NvBiqxnyMv5OCjdQqCPJY238RVK32rd2T9hHtvaZrtRM
Message-ID: <CAE5sdEiq3bY1kgMUQ6x7RRJCx0JH4sQ9Z_a9_YQSM5FKNwpk8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: multi-gen LRU: fix NULL lruvec->pgdat deref in get_lruvec()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, stable@vger.kernel.org, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 at 16:36, Barry Song <baohua@kernel.org> wrote:
>
> On Tue, Oct 20, 2026 at 4:33=E2=80=AFAM Siddharth Chintamaneni
> <sidchintamaneni@gmail.com> wrote:
> >
> > On Sun, 18 Oct 2026 at 14:24, Barry Song <baohua@kernel.org> wrote:
> > >
> > > On Sat, Oct 17, 2026 at 1:09=E2=80=AFPM Siddharth Chintamaneni
> > > <sidchintamaneni@gmail.com> wrote:
> > > >
> > > > Andrew Morton reported that get_lruvec() has the same problem as
> > > > lru_gen_shrink_node(): when memcg is disabled on the command line
> > > > (cgroup_disable=3Dmemory), it returns &pgdat->__lruvec directly and=
 so
> > > > bypasses the initialization of lruvec->pgdat. The MGLRU debugfs
> > > > interface calls get_lruvec(), then dereferences the pgdat pointer i=
n
> > > > lru_gen_seq_show() and other paths, so these can hit the same NULL
> > > > dereference.
> > >
> > > So userspace must have booted, since otherwise we couldn't read
> > > debugfs. The reachable case is therefore a memory node with no
> > > LRU folios when debugfs is read? So this could happen on a multi-node
> > > system where folios are landed on other nodes but not on this node?
> > >
> >
> > That is my high level understanding. I'll let Andrew to comment if I
> > am missing something,
> >
>
> I made a silly toy setup by running two numa nodes with one of them has o=
nly 4KB
> memory, the other one has 1G-4K:
>
> qemu-system-aarch64 -M virt,gic-version=3D3,mte=3Doff -cpu cortex-a53 -no=
graphic \
> -smp 4 \
> -m 1G \
> -object memory-backend-ram,id=3Dram0,size=3D1048572K \
> -object memory-backend-ram,id=3Dram1,size=3D4K \
> -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1 \
> -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3 \
>   -kernel arch/arm64/boot/Image \
>  -nographic -append "cgroup_disable=3Dmemory
> ...
>
> Then I got a machine where node1 is very difficult to have a page in lru.
>
> then i ran the debugfs for mglru:
>
> / # cat /sys/kernel/debug/lru_gen
> memcg 0
>  node     0
>           0      14972          0         953
>           1      14972          0           1
>           2      14972         18        3308
>           3      14972          0           0
>  node     1
>           0      14972          0           0
>           1      14972          0           0
>           2      14972          0           0
>           3      14972          0           0
>
> now you see node 1 has no page in lru but yet i didn't have any crash.
>
> i think i will need more time to figure out what is the problem and how t=
o
> reproduce it.

I've asked AI to repro the issue with the similar setup

qemu-system-aarch64 -M virt,gic-version=3D3,mte=3Doff -cpu cortex-a53 -nogr=
aphic \
  -smp 4 -m 1G \
  -object memory-backend-ram,id=3Dram0,size=3D1048512K \
  -object memory-backend-ram,id=3Dram1,size=3D64K \
  -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1 \
  -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3 \
  -kernel "$KERNEL" \
  -initrd "$INITRD" \
  -no-reboot \
  -append "console=3DttyAMA0 cgroup_disable=3Dmemory
initcall_blacklist=3Dkswapd_init panic=3D-1"

and it was able to repo it. AI identified that kswapd is initializing
the pgdat during boot, so blacklisting kswap_init was able to repro
the crash when reading /sys/kernel/debug/lru_gen

[    1.347868] Unable to handle kernel access to user memory outside
uaccess routines at virtual address 0000000000005040
[    1.347920] Mem abort info:
[    1.347929]   ESR =3D 0x0000000096000005
[    1.347950]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[    1.347964]   SET =3D 0, FnV =3D 0
[    1.347974]   EA =3D 0, S1PTW =3D 0
[    1.347986]   FSC =3D 0x05: level 1 translation fault
[    1.348249] Data abort info:
[    1.348277]   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
[    1.348291]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[    1.348302]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
[    1.348345] user pgtable: 64k pages, 48-bit VAs, pgdp=3D00000000485f6600
[    1.348369] [0000000000005040] pgd=3D0800000043640403,
p4d=3D0800000043640403, pud=3D0800000043640403, pmd=3D0800000043620403,
pte=3D0000000000000000
[    1.349148] Internal error: Oops: 0000000096000005 [#1]  SMP
[    1.350414] Modules linked in:
[    1.350896] CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 7.3.0-rc7+
#9 PREEMPT(full)
[    1.351111] Hardware name: linux,dummy-virt (DT)
[    1.351411] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[    1.351581] pc : lru_gen_seq_show+0x5c/0x460
[    1.351800] lr : lru_gen_seq_show+0x4c/0x460
[    1.351898] sp : ffff80008034f9a0
[    1.351975] x29: ffff80008034fa20 x28: ffff0000035e67e8 x27: 00000000004=
00cc0
[    1.352297] x26: 000000007fff0000 x25: ffff0000035e67d8 x24: 00000000000=
00000
[    1.352454] x23: ffff80008034fb00 x22: ffff80008034fb28 x21: 00000000000=
00000
[    1.352626] x20: ffff0000035e67b0 x19: ffff00003ffc2f20 x18: ffff8000803=
60060
[    1.352775] x17: 0000000000000000 x16: 0000000000000000 x15: 00000000000=
00000
[    1.352915] x14: 0000000000000000 x13: 0000000000000000 x12: 00000000000=
00000
[    1.353058] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffa3468a0=
20c5c
[    1.353226] x8 : ffff000008b07000 x7 : 0000000000000000 x6 : 00000000000=
0003f
[    1.353367] x5 : 00000000ffffffff x4 : 0000000000000003 x3 : 00000000000=
01000
[    1.353511] x2 : ffff00003ffc2f20 x1 : 0000000000004000 x0 : 00000000000=
00000
[    1.353732] Call trace:
[    1.353925]  lru_gen_seq_show+0x5c/0x460 (P)
[    1.354110]  seq_read_iter+0xec/0x4c0
[    1.354213]  seq_read+0xfc/0x148
[    1.354290]  full_proxy_read+0x78/0xc0
[    1.354377]  vfs_read+0xd0/0x338
[    1.354453]  ksys_read+0x7c/0x120
[    1.354528]  __arm64_sys_read+0x24/0x40
[    1.354611]  invoke_syscall+0xa8/0x120
[    1.354695]  el0_svc_common.constprop.0+0x4c/0x100
[    1.354791]  do_el0_svc+0x28/0x40
[    1.354865]  el0_svc+0x48/0x2b0
[    1.354939]  el0t_64_sync_handler+0xa8/0xf0
[    1.355026]  el0t_64_sync+0x1b8/0x1c0
[    1.355250] Code: f9000fe0 f9432661 aa1303e2 91401021 (b9504033)
[    1.355647] ---[ end trace 0000000000000000 ]---
[    1.356555] Kernel panic - not syncing: Attempted to kill init!
exitcode=3D0x0000000b
[    1.356888] SMP: stopping secondary CPUs
[    1.357525] Kernel Offset: 0x234609c00000 from 0xffff800080000000
[    1.357675] PHYS_OFFSET: 0x40000000
[    1.357762] CPU features: 0x0,00000000,09000020,00100002,0800821b
[    1.357901] Memory Limit: none
