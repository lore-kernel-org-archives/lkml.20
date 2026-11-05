Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882048;
	b=awM5o34Xb/4Kxz0U4qG25QnRT7g/3zSO2g7of9VffRxmCS+nJekjijs1jiZhgp1EPyK9
	 HT7F7WMno0NB0fkN/E1Sc/uIHaQ0ku8Nu4OILRMA0LJKyhtxQc1Os9xMfELGcLZjjtXcf
	 IIrh95vhzvr5Ol9f/hp/A8ANJATAXDispma5oN244Fdrvkx3VqRTN2eYiaC9kaiNHbs4S
	 PoU6v1Ip1GR9nikNL++wKjgnnti07omqgvP6kOlVQlhWobPyS22EQsMtrtYywkbdvIYgU
	 SV+tqGM9pnbV5Vk/TZhrFcufyngegoiaCCYeuDkrIIiCB2pIyiKM7ORtyQ36uow+9KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882048;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zKSd7uSYmQzY/5LR3ZcH+eQTdOP9XMXjOKWyQWrdLhQ=;
	b=qoWPChDcyoDC84rLigs91X+712d2GRYORLbv2EQvuQuGCkfpoabac/h4LmekmCNrBkEQ
	 8LB0OLmUmlOsp3J3fru2otZ/N7DAuvfV7QDNLR4KFJ14biTJOM4fr3cy+yA+8KdhQQLrX
	 ha9PMjmLWeX1Alk+K7xhKuMIDZuGGx1lw9yH3tt1XdSMmgWQSowQoCJZ8kWewUy/wXM7P
	 Znb3EaqId5R6B+Ogpkt5WFx478R0OMPQlZiTgV/v2RPMFo5nLcR25061YVC8sLgiSLKN5
	 6DVW/6m+7fHAaF3OJHMUKgSVbJrflsHOi72tTK2K6uJJYsZupHhYGLdGstvenADQitA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpEbYDcv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CC5606A33F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpEbYDcv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2056D1F0093A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793882048;
	bh=zKSd7uSYmQzY/5LR3ZcH+eQTdOP9XMXjOKWyQWrdLhQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GpEbYDcvtKF5H26PDy/Lw5I9p0v54rNuyYd3zHUKwHgSrPdSEvRIE/E3AkfFswFIM
	 iljXoGutg4xvnEHaiGhG/WXyCWvrUgoAryY7Ae2tcuqkwJcHPBNBwkBBUgHOuXPHWl
	 MpoD5damQFSW6AoSqW92Ep9mNWMwNH2LFZxgpNtvIDCXvywq6BTIiAPlNgsfqOLOP5
	 j9z/y3GPF4Y/H/DRxiR7BUPMQyXDNvJb+61jc1Z1BEex+Yd/lvRS4/brbi9V1SkqF5
	 1Rcx7oRkMa3581yx2SirUckrrUPnPqJbQhZhocT5zr0KN7xBp3X7XmTKh6rUKIo6nM
	 O36dL+t7d4aYg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso307175766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:34:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwwkh/bg5P7pzj+cniMPhyZRWyCqI8xbkIk957J3jyz2oBjCH1cgOUK3Uo8Rpf0OzXCR0991O6qunxjwPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U/0ZeFzStBW+ojHNQk7ZH+HBkDwFQmt8iI74XKl/VAJPUwSQ+
	1G2hIZnOWE/QHpJGPZMQVyuRLOtG/X0wgpUh3pNl7cSRpcXd0mINdk+jhzJDpJjEvvrcCkLa5jK
	QiEXGD7ii2fF4/MY2ZbfQmhGJI/AjMNE=
X-Received: by 2002:a17:907:3ea2:b0:c44:16ad:c31d with SMTP id
 a640c23a62f3a-c4ca793563emr1703802466b.4.1793882046812; Thu, 05 Nov 2026
 04:34:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105073353.433854-1-hdthky0@gmail.com>
In-Reply-To: <20261105073353.433854-1-hdthky0@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 5 Nov 2026 21:33:53 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-E0NP2wipYr71y-u0n8oPHJ4ivvp9TiTiwTycoq1uY=g@mail.gmail.com>
X-Gm-Features: AclHuK9Cv-3G-5Ief9HsBr-5pctSH_ukS4ZJ8HtQYsGzEnIp8CDT1FNqbc-lcl0
Message-ID: <CAKYAXd-E0NP2wipYr71y-u0n8oPHJ4ivvp9TiTiwTycoq1uY=g@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix out-of-bounds write race in NTFS_IOC_LIST_STREAMS
To: Xingyuan Mo <hdthky0@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, "open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:34=E2=80=AFPM Xingyuan Mo <hdthky0@gmail.com> wrot=
e:
>
> NTFS_IOC_LIST_STREAMS walks the base inode's MFT attributes twice:
> a first pass sizes the output buffer, a second pass fills it, both
> times filtering out streams that ntfs_stream_unlinked() reports as
> unlinked.  That filter is the culprit: it treats a stream inode that
> is no longer in the inode hash as live, which is precisely the state
> a stream being deleted ends up in.
>
> When a base file is deleted while one of its named streams is still
> open, ntfs_cleanup_deleted_inode() sets NInoStreamUnlinked on the
> stream inode and removes it from the inode hash after dropping the
> MFT record lock.  Nothing serializes this against the ioctl's two
> passes, so if the flag and the unhash land between them, the first
> pass excludes the stream while the second pass includes it, and the
> ioctl writes an entry the allocation never accounted for.
>
> The per-entry bounds check cannot catch this divergence, because
> "offset > required - entry_size" underflows when entry_size exceeds
> required.  With a 1-character stream sizing the buffer at 48 bytes and
> a 250-character stream surfacing only in the second pass, a 544-byte
> entry is written into the 48-byte kmalloc-64 allocation.
>
> Close the hole in two steps:
>
> - Reject base inodes that are being deleted before walking their
>   attributes, like the other named stream entry points in this file
>   already do.  This also stops the listing from reporting streams of a
>   deleted base file as live, which is reproducible even without the
>   race.
>
> - Make the bounds check underflow-safe so any remaining divergence
>   between the passes can only produce -EOVERFLOW, never an
>   out-of-bounds write.
>
> KASAN report from the reproducer (timestamps stripped):
>
> BUG: KASAN: slab-out-of-bounds in ntfs_ioctl_list_streams+0x7a9/0xa00
> Write of size 500 at addr ffff88800b1931a8 by task ntfs_ads_race/305
> CPU: 2 UID: 0 PID: 305 Comm: ntfs_ads_race
> Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 199=
6), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x73/0xb0
>  print_report+0xd1/0x610
>  kasan_report+0xff/0x130
>  kasan_check_range+0x10c/0x1c0
>  __asan_memcpy+0x3f/0x70
>  ntfs_ioctl_list_streams+0x7a9/0xa00
>  ntfs_ioctl+0x3b6/0x420
>  __x64_sys_ioctl+0xd1/0x120
>  x64_sys_call+0x2a5/0x2220
>  do_syscall_64+0x109/0x5e0
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
>
> Allocated by task 305:
>  kasan_save_stack+0x3d/0x60
>  kasan_save_track+0x18/0x40
>  kasan_save_alloc_info+0x3b/0x50
>  __kasan_kmalloc+0x9c/0xa0
>  __kvmalloc_node_noprof+0x2dd/0x800
>  ntfs_ioctl_list_streams+0x57f/0xa00
>  ntfs_ioctl+0x3b6/0x420
>  __x64_sys_ioctl+0xd1/0x120
>  x64_sys_call+0x2a5/0x2220
>  do_syscall_64+0x109/0x5e0
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> The buggy address belongs to the object at ffff88800b193180
>  which belongs to the cache kmalloc-64 of size 64
> The buggy address is located 40 bytes inside of
>  allocated 48-byte region [ffff88800b193180, ffff88800b1931b0)
>
> Fixes: 48996054b706 ("ntfs: add named stream ioctls support")
> Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
Applied it to #ntfs-next.
Thanks!
