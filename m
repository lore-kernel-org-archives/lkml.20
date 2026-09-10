Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D7E25F7B9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008844; cv=pass; b=G/aVIAaYsGnm8CdpGxd0z+FR1gAOvmNmF/QWsa8j6sLHgIJmZaoOGW9jqpwuKtgJc7Nke6adez4ZP/GW5ultyEHdsIsfKUnZy8ommFrNMus2Nux6yUPQNxCQNDZdfZzgheuH3DcIwTxEAnR2oGmPC7cyj4HoJXgPnThIPZsY9iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008844; c=relaxed/simple;
	bh=99twiw3SWsuHzNPAxaumHOOPg2ID6EoWKVR0Vj6nrSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CQg+rA42uG/MIH26qN560mj+OifInEoZXmpXWHrxBN0ocY0kdRA4dPgjM0T+F88MrjI893DGQUaAlHBd/r8cH0YMr3udB7xaRV8iV1zNbzOn2UdEgvcnomshOpKHF/85OsatHHD0d3AZEdPRZF3tiUZdnuJ3ozMj5vy4IXByLss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEkmB1SR; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEkmB1SR"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso12530521fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789008840; cv=none;
        d=google.com; s=arc-20260327;
        b=j2HREu00rqlEJH3aD1haz3d4u0kHBY/wSeFzadeUIU6bcIxozEYisKhBLKuTxhddfI
         cHPfgyyH6we8+afeRDuEkP3btIN4jpglxRRQwvSvm2Iism12qVKIvj+v5W7A7d1/mIM1
         J/3cdIKgsok+nt3G9t2/KDIGaZxuxRbnt89to2co3mpGsxmxi4DSJoY3FXOdG+yzUdJT
         dFIklq/LkOJqIvz/1vimzm0SVudoWGMQ3x6wzWpyQjWquwu8X1uvJ5cM6FcEAduX7sPV
         COH5ylB4+T18724Pw9YzgVtWxiWnGaE/iqWUSiTFZh+IgwasRfDM187oGr9CGEizLxBK
         fZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XAjSx3iw2zRmGWIVZaJLgarnBBPeNPtOqIqNRKUzIE=;
        fh=2Ig94J5WXs+aVPKiEztTT/T/6ADeYz1VrSFJR9X3mM0=;
        b=BwR+6nsFTiImby0s1iqOOWMTnRXLBrTdIH8XGDI74OgSbFfu9ahq7TZ9tRPC3nkpks
         XokzRpo8cDX/Ct5e7oe12dDgEDHR8Xom6RdkYEX72SykQEwISP+xG0aOHFkrq8LVNXOP
         TlUAtBBrkRwm9c5b0GJtoAUoBDUcJ2lrT2U7wKb74lGby1zirntyysRrIePw9GUkBhwm
         2RNJSLFV/tL9rUXJEowMAuba4SizH5J9mGRQAWwIf/gTjrr/FszYyZNO/EuwPTAEvg4/
         fmkBoQ+drkN7rXYm0JEot8i7dXPxVRvb+m4W+0vVNLEcot6mFgw34XDwijCXfnxAAG7N
         oDTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789008840; x=1789613640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+XAjSx3iw2zRmGWIVZaJLgarnBBPeNPtOqIqNRKUzIE=;
        b=NEkmB1SReGc9XYSgb0bKP/epDkyZonEOJJn4gU/l3ec/QVQZi8Cf35xZmfimdbKhJD
         mZEoP3CUd/m2ytzWh0PxHzafzfWnrSK5OS37hZwwF6g1yV9cg84Oj6KNFM3mM9NnfP9C
         XC3s3H3Oy5SokaKyjVPtOsok3tBbR0mwoz8hEMKVa0+4+oODQuh4GzsgHrD63OdOzklF
         VwPI7MNWznaFVd+WR2wVxtaIucJKwKOkvX+VU+SaIyBbI1dAjv4Rv8+AafEK9udbm4RI
         eKd9dvMR9QuQ8Y9b87zaTbUNsc0neyRaCKohb64Qey14453VMovyqz0zYPejZu2iIrkj
         8gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789008840; x=1789613640;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+XAjSx3iw2zRmGWIVZaJLgarnBBPeNPtOqIqNRKUzIE=;
        b=R4SCOVhUoWblr+OKVq5KXMAm5gU3PrR9jvDPRbNAdtW/Lt08htPuof17qxdoxUb6v6
         Jvrp30eU6gW9dni3V7iWtGZm/3qu9bAkg4FNXPQCniEEzLsKlb2zozYdC/F/LYvMb7NE
         knBHa7FQci7S6dUPEHZclbUFu7qKakd5J738Rc5pZeESMV+sMjsIBP3RnnZZWRHu87Lq
         2XtsiHdd93WkxnZVM8vbk3QpABwBL7MMYNsq6nIS5U5bfzg+91RkZtwRm4abJlqRT2tc
         4Q0m2C4q8mrNCugvmTnf6QIOSbqtGpdvVoqkHlz/I4Ri2hG9yd6jUGIKsWkWEwXS4u4q
         nPFA==
X-Forwarded-Encrypted: i=1; AKwUvBwL6Ptm021z0j566Er+7VNJpp7lMjq1pFectLQRCSQaPh0fLr9jIkn/b1GthMB9PSg6JDsgHPyizXs9Rb8=@vger.kernel.org
X-Gm-Message-State: AFuF++l3TgDTSCl1bQq/+9WY/1wSjZgJXWKmZyjb55/HbKBKN3ClaMDS
	lj2hPBfAdRnAJx3K4ozXY3rpP5eDmOgd6v0icQ98LusFpYaB9beatLvO2KcEfW3DYmLz/H2vm46
	4Ojr5VInMcX+FpkhTfS202GUtqNobKTtgXsfAKmw=
X-Gm-Gg: AYBFou18xM0ypt5Z9JlQpX5VsTOyju5fYDsokmMYisOreU85rZ3IPA/Jh8d+8B/51SQ
	5/QIuKE5/crRmDjqPTbN3oWXbTwP7hXrTIgOE2DaKsuzq3GQox/g3WKvisOIFBqTLgoSabClFuh
	8Sbpe7LjFRnmfntxcQ9nHf11edxoENg5vjb8KyeGQzT4v+pNFX1WBrUezxtBLyDIECOK1O8cwcm
	ko/E12Ushb6fEU5VOshduyDiZrX1zsGHfJyapsXgXKZ70y0JFDhoXx7gRGRPu1Wxrdvp54H/yOn
	7hFdv1YR5E6GMBRfapvF24bdJNtL3N+jfgHtKBhNCak2nkxsnzOtGQc=
X-Received: by 2002:a05:6512:b9e:b0:5b1:58d6:4542 with SMTP id
 2adb3069b0e04-5b8986d10d9mr1642039e87.14.1789008840245; Wed, 09 Sep 2026
 19:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909023955.1642244-1-luquijeffrey@gmail.com>
 <20260909025407.7494D1F00A3A@smtp.kernel.org> <mttoruf5.55d3678c-d0ad-4a15-98a0-5ea7ec0d7e8d@nod.at>
In-Reply-To: <mttoruf5.55d3678c-d0ad-4a15-98a0-5ea7ec0d7e8d@nod.at>
From: Lucas Jeffrey <luquijeffrey@gmail.com>
Date: Wed, 9 Sep 2026 23:53:45 -0300
X-Gm-Features: AcwNN1XZBYaXNZSJVSUPW394rsgxNZPCrnIacj6Ah0hbB5aoqooTuaGdupxS2ME
Message-ID: <CAObkL7OEQ7zF42urBYpq20xXDkayNbcANewb6t99+6yc0bcc7Q@mail.gmail.com>
Subject: Re: [PATCH] jffs: initialize inocache to NULL when initializing a jffs2_inode_info
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi richard
I've sort of manually confirmed the crash pointed out by Sashiko,
while not exactly the failure path mentioned in the review,
I found that if immediately after returning a new inode from
jffs2_alloc_inode, if allocation fails in 'security_inode_alloc',
then an ENOMEM is propagated to inode_init_always_gfp and then to
alloc_inode, and enters this failure path:

struct inode *alloc_inode(...) {
...
if (unlikely(inode_init_always(sb, inode))) {
if (ops->destroy_inode) {
ops->destroy_inode(inode);
if (!ops->free_inode)
return NULL;
}

inode->free_inode =3D ops->free_inode;
i_callback(&inode->i_rcu); //Here it ends up calling jffs2_free_inode
which frees f->target, double free/UAF if f->target !=3D NULL
return NULL;
}
...
}


Here's the report
[  104.928161] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  104.931812] BUG: KASAN: double-free in jffs2_free_inode+0x31/0x50
[  104.935737] Free of addr ffff88800ad5eb80 by task repro/76
[  104.936013]
[  104.937388] CPU: 0 UID: 0 PID: 76 Comm: repro Not tainted
7.3.0-rc2-00028-g692c6ca486c3-dirty #16 PREEMPT(lazy)
[  104.937872] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX,
arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  104.938350] Call Trace:
[  104.939517]  <TASK>
[  104.939999]  dump_stack_lvl+0x53/0x70
[  104.940358]  print_report+0xd0/0x630
[  104.940415]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  104.940459]  ? jffs2_free_inode+0x31/0x50
[  104.940486]  ? jffs2_free_inode+0x31/0x50
[  104.940509]  kasan_report_invalid_free+0xa2/0xd0
[  104.940542]  ? jffs2_free_inode+0x31/0x50
[  104.940570]  ? jffs2_free_inode+0x31/0x50
[  104.940595]  check_slab_allocation+0xd9/0x100
[  104.940625]  kfree+0xfc/0x390
[  104.940657]  jffs2_free_inode+0x31/0x50
[  104.940684]  ? __pfx_jffs2_free_inode+0x10/0x10
[  104.940715]  alloc_inode+0x135/0x1f0
[  104.940755]  new_inode+0x13/0x140
[  104.940790]  jffs2_new_inode+0x77/0xa00
[  104.940828]  jffs2_create+0x8a/0x340
[  104.940860]  lookup_open+0xa90/0x18d0
[  104.940906]  path_openat+0x1257/0x2280
[  104.940949]  ? __pfx_path_openat+0x10/0x10
[  104.940984]  do_file_open+0x1cd/0x400
[  104.941013]  ? __pfx_do_file_open+0x10/0x10
[  104.941061]  ? alloc_fd+0x331/0x5b0
[  104.941103]  ? do_getname+0x66/0x2c0
[  104.941138]  do_sys_openat2+0xd9/0x170
[  104.941168]  ? __pfx_do_sys_openat2+0x10/0x10
[  104.941203]  __x64_sys_openat+0x11d/0x1d0
[  104.941229]  ? kasan_save_track+0x14/0x30
[  104.941256]  ? __pfx___x64_sys_openat+0x10/0x10
[  104.941283]  ? kmem_cache_free+0xba/0x3a0
[  104.941310]  ? fpregs_restore_userregs+0xe0/0x230
[  104.941362]  do_syscall_64+0xdd/0x4a0
[  104.941400]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  104.941872] RIP: 0033:0x420f77
[  104.942862] Code: 55 9c 48 89 75 a0 89 7d a8 44 89 55 ac e8 71 f0
02 00 44 8b 55 ac 8b 55 9c 41 89 c0 48 8b 75 a0 8b 7d a8 b8 01 01 00
00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 89 45 ac e8 c6 f0 02 00 8b
45 ac
[  104.943373] RSP: 002b:00007f1ef5c4e570 EFLAGS: 00000293 ORIG_RAX:
0000000000000101
[  104.944349] RAX: ffffffffffffffda RBX: 000000000a413220 RCX: 00000000004=
20f77
[  104.944401] RDX: 00000000000000c2 RSI: 00007f1ef5c4e600 RDI: 00000000fff=
fff9c
[  104.944447] RBP: 00007f1ef5c4e5e0 R08: 0000000000000000 R09: 00000000000=
00000
[  104.944491] R10: 00000000000001a4 R11: 0000000000000293 R12: 00000000000=
00483
[  104.944533] R13: 0000000000000007 R14: 00007f1ef5c4ea00 R15: 000000000a4=
13224
[  104.944619]  </TASK>
[  104.944813]
[  104.944856] Allocated by task 78:
[  104.945202]  kasan_save_stack+0x33/0x60
[  104.945489]  kasan_save_track+0x14/0x30
[  104.945515]  __kasan_kmalloc+0x8f/0xa0
[  104.945538]  __kmalloc_node_track_caller_noprof+0x1bc/0x480
[  104.945564]  kmemdup_noprof+0x20/0x50
[  104.945600]  jffs2_symlink+0x520/0x1080
[  104.945624]  vfs_symlink+0x132/0x420
[  104.945645]  filename_symlinkat+0x139/0x3d0
[  104.945670]  __x64_sys_symlink+0x74/0xa0
[  104.945694]  do_syscall_64+0xdd/0x4a0
[  104.945720]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  104.945778]
[  104.945804] Freed by task 80:
[  104.945932]  kasan_save_stack+0x33/0x60
[  104.945984]  kasan_save_track+0x14/0x30
[  104.946074]  kasan_save_free_info+0x3b/0x60
[  104.946101]  __kasan_slab_free+0x43/0x70
[  104.946126]  kfree+0x121/0x390
[  104.946146]  jffs2_free_inode+0x31/0x50
[  104.946167]  rcu_core+0x55a/0x1870
[  104.946192]  handle_softirqs+0x182/0x5a0
[  104.946226]  __irq_exit_rcu+0x63/0x140
[  104.946248]  sysvec_apic_timer_interrupt+0x6b/0x80
[  104.946273]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[  104.946314]
[  104.946386] The buggy address belongs to the object at ffff88800ad5eb80
[  104.946386]  which belongs to the cache kmalloc-64 of size 64
[  104.946519] The buggy address is located 0 bytes inside of
[  104.946519]  64-byte region [ffff88800ad5eb80, ffff88800ad5ebc0)
[  104.946573]
[  104.946800] The buggy address belongs to the physical page:
[  104.947880] page: refcount:0 mapcount:0 mapping:0000000000000000
index:0x0 pfn:0xad5e
[  104.948383] flags: 0x100000000000000(node=3D0|zone=3D1)
[  104.949052] page_type: f5(slab)
[  104.949572] raw: 0100000000000000 ffff8880070418c0 dead000000000100
dead000000000122
[  104.949623] raw: 0000000000000000 0000000000200020 00000000f5000000
0000000000000000
[  104.949710] page dumped because: kasan: bad access detected
[  104.949727]
[  104.949743] Memory state around the buggy address:
[  104.950194]  ffff88800ad5ea80: 00 00 00 00 00 03 fc fc fc fc fc fc
fc fc fc fc
[  104.950242]  ffff88800ad5eb00: 00 00 00 00 00 00 03 fc fc fc fc fc
fc fc fc fc
[  104.950282] >ffff88800ad5eb80: fa fb fb fb fb fb fb fb fc fc fc fc
fc fc fc fc
[  104.950315]                    ^
[  104.950381]  ffff88800ad5ec00: 00 00 00 00 00 00 03 fc fc fc fc fc
fc fc fc fc
[  104.950397]  ffff88800ad5ec80: 00 00 00 00 00 00 03 fc fc fc fc fc
fc fc fc fc
[  104.950439] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  104.968624] Disabling lock debugging due to kernel taint



i'll send a V2 patch that also initializes f->target =3D NULL when
allocating the inode
Thanks,
Lucas J.


On Wed, Sep 9, 2026 at 2:57=E2=80=AFAM Richard Weinberger <richard@nod.at> =
wrote:
>
> Lucas,
>
> Am Wed, Sep 9, 2026, 04:54 schrieb sashiko-bot@kernel.org:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [Critical] Double free of `f->target` on early VFS failure paths due =
to uninitialized slab memory.
> > --
> >
> > commit 9fd2012cfec1b8d15df193fea97deabda99aa5e5
> > Author: Lucas Jeffrey <luquijeffrey@gmail.com>
> >
> > jffs: initialize inocache to NULL when initializing a jffs2_inode_info
> >
> > When a jffs2_inode_info is allocated via new_inode(), due to memory reu=
se it
> > can retain stale values from its previous use.
> >
> > If the new jffs2_inode_info object allocated retains an old reference t=
o a
> > freed inocache, the function jffs2_new_inode may crash if either
> > jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
> > when calling iput() with the inode it will eventually attempt to free a=
gain
> > the inocache.
> >
> > Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D3a8099322b09d8d073d1
> > Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
> >
> > > diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> > > index 86ab014a349c5..40f17218a276b 100644
> > > --- a/fs/jffs2/os-linux.h
> > > +++ b/fs/jffs2/os-linux.h
> > > @@ -52,6 +52,7 @@ static inline void jffs2_init_inode_info(struct jff=
s2_inode_info *f)
> > >  {
> > >     f->highest_version =3D 0;
> > >     f->fragtree =3D RB_ROOT;
> > > +   f->inocache =3D NULL;
> > >     f->metadata =3D NULL;
> > >     f->dents =3D NULL;
> > >     f->target =3D NULL;
> >
> > [Severity: Critical]
> > This isn't a bug introduced by this patch, but doesn't f->target suffer=
 from
> > a similar issue due to uninitialized slab memory on early VFS failure p=
aths?
> >
> > When the VFS allocates a new inode via jffs2_alloc_inode() in
> > fs/jffs2/super.c, the object is returned from the SLAB cache without
> > __GFP_ZERO. It retains stale values from its previous lifecycle, includ=
ing
> > a dangling pointer in f->target, because jffs2_free_inode() frees f->ta=
rget
> > but does not nullify it.
> >
> > JFFS2 defers initializing f->target =3D NULL to jffs2_init_inode_info()=
, which
> > is called after VFS initialization completes. If the VFS fails early (e=
.g.,
> > inode_init_always() fails due to an LSM memory allocation, or iget_lock=
ed()
> > in fs/inode.c encounters a hash collision race and drops the newly allo=
cated
> > inode), the VFS destroys the inode via jffs2_free_inode() before JFFS2 =
ever
> > initializes it.
> >
> > This causes a double free when kfree(f->target) executes again on the
> > dangling pointer:
> >
> > fs/jffs2/super.c:jffs2_free_inode() {
> >       ...
> >       kfree(f->target);
> >       kmem_cache_free(jffs2_inode_cachep, f);
> > }
> >
> > Userspace can reliably trigger the iget_locked() hash collision race by
> > performing concurrent lookups (e.g., stat() or open()) on the same
> > non-resident inode:
> >
> > fs/inode.c:iget_locked() {
> >       ...
> >       if (unlikely(test_bit(__I_NEW, &inode->i_state))) {
> >               /* Uhhuh, somebody else created the same inode under us..=
. */
> >               spin_unlock(&inode_hash_lock);
> >               destroy_inode(inode);
> >       ...
> > }
> >
> > Would it be safer to zero these fields in jffs2_alloc_inode() or ensure
> > jffs2_free_inode() nullifies them before returning the object to the sl=
ab
> > cache?
>
> I think this is a legit bug pointed out by Sashiko.
> Do you want to double check and (if needed) fix it?
>
> Thanks,
> //richard
