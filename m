Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACDC4D17A9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848973; cv=pass; b=FWjq9t4HOFmdxGEbsHt73QBQoqPxVAJoE8JJVxILwHhYjM8CWIndpqHvXp+4Y4fbOAm/CfipMeyvrP2+zNA7CSJRpZhX/rXARx9Ff+cWFBX0lUUL+JxMFRxxPj4lc7l0PZu3y1++t/wI6atUuAvDcRW0jtR+eoIzQ/BGrUfbllI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848973; c=relaxed/simple;
	bh=BuczpQavLNIc5iEH5iJditkxvjYv1WxhIpa6xLgIvFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBWAa5J0kX6PuHxKgENbt6pDIaDeFOPgpmfehP6zkofCK50p10b/MdRSZj+JP6pg8QVmhdIMvhPleeCPxN2SU3X/T8z5zcw6Xcs0lwbvOZaVv/KzYpXyx6or9hGPKwrI20iZPg/amexqthD+P3iDKhenShzS2cb3OZxPUeKSwtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyyWmI02; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyyWmI02"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c294ad260fdso455578966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790848969; cv=none;
        d=google.com; s=arc-20260327;
        b=MlxZVZJ4ZmkWGJhxtfl/wAXmuT8cerHq/haYMbDDZHuGmBx5PhGzMjdDdfQQX0MY9j
         OfjvTsoq6CaclxZeflRJhnxXNRK24b4/D9AU0k46pxpPrNtCD3yxs21M3xfwojIma7Zd
         J+IUJXjHa4j/iIUKf3PmIBCcmAqK2iHhkECtnUQmOu17y7NCwTTFqTusnaCDK+S14ASC
         L5xM32BRlc451aGtAFh6DmykukTXsmNfhn5il8RDpK4gPKow8E9VaSdjEw8n5/1tNdnj
         KsG0IL1BHuH8z5K+6Mkpkt2QK+UIlCtAACgJVoRJt76QzSdS4mKC3+1r8YaQ98d/LFpo
         YWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25LG4cwWQUns+MtMzpoTj+Q+wzmEvIHe/GEbNI0aMPo=;
        fh=G1v1zxw86kL2Xbpx5joJNe+14IQjxoHhVFzaPUIDcwA=;
        b=PKQ5+EAY3equh7m5erw3Q+/PiAWS/bbpj2Z8j666L60qNa6ttf+BVJYFgk5IXcsMRA
         AAHNSpPcajU9HAetd6EhGMZqOdUumsVeVxWjpRiDnpKvjiG/Gk33N+jSaT2ZlJhJ/Fkf
         dGfnk0l+e/k2WxJ5P6HjNBJipVV9fTUa3/Ke9OEpWTeF+aEQo0B3N8Gn/JsfeoX4Ypmy
         K/Py9/kgihtsXXyIEsFQ2WQ4Hnw0HLoO6+SMwz2+ha4wgKKOiXPWIfVWBGsrkJKAUxas
         ocIKcJn16pdfOJTFLtwsljQmGCNCIPYb4mopsK0Ua5CoNEpE9Mc7WQAOE7fI7HMT5nYb
         1hiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790848969; x=1791453769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25LG4cwWQUns+MtMzpoTj+Q+wzmEvIHe/GEbNI0aMPo=;
        b=cyyWmI02CP/TAi/O4+v0d/oqd5tXo1G5GFSKrHQ04ttpsb3QnOD0MTq0DtEx29mWvv
         ZJL5qxQcq84r3s6QnXah9QSQdL6g+DJZ+oc3c/CGWEc1gZH5nTYl/hck97ildFXpvd2d
         2udEB6sz4aIbtCIKhplg43GSiX3kCLNX7uT7YISc2q7iP11NDwE8IpUIkEoumNAitoPf
         zX5ZDS0ZA5ulrf8bfsm7f7SFYQJXEkq2O6Pjg9IXPymw/IRwhkUXl7qVbrsVkvxLMBYJ
         ot9xfreTzC/RhDsr+ywLMGV/moOxY1HGQ9VPN9pM1RbENnD6IzH5cm6oeA/9p24JCdwe
         Jr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848969; x=1791453769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25LG4cwWQUns+MtMzpoTj+Q+wzmEvIHe/GEbNI0aMPo=;
        b=ghk6rPEl/u0fXGyH0RCCJEQP926B+RGAO0sawRLeEWeK/grEgDnJhDfJlyrU+zjLMc
         Ii/LJPopbPZtrIcV/Ymkat2+4AgBuyDLlteYY7kk4kOikSHMDzSVvEgL1+5J9lenX3/s
         YoW6WFC12OBsZXFaWO0MpEpHvpRcqlPWcxQGBhv1MjMCaQ7ok+ScM5gVOqQxI7uvxOVW
         XHv4yuABwcbd9W/o2phAhSgN+UtMkjTbmDZ77CFD0s7bhj1Hl0YlpL16mC6+NDLP5HoV
         XvYwmFYxKkuzNi+uzmvDKQVkISGCEvykoZYnHtD7tRlE3VW3MZHC5ltEl4uq5LZ1rXCt
         I4HA==
X-Forwarded-Encrypted: i=1; AKwUvBz479rKt+2o/tRso16IumSawfx83QqPvbUC7Rxsb2xVAux8k0Wh1ilvXouDpmck+vptKvmRCirCaauLtlA=@vger.kernel.org
X-Gm-Message-State: AFuF++l8rdxpf/0XTotE3VoYujEiy9LJ8SZv7+CTKEUDxffOpHBJEvIf
	vnBVP0O8sMw2oiP5AdJ+DRiTB3jWBkJLk0v9Grtdes4Mnhjyt2ZJfBRRZmOQpySUdVjStRDGEEd
	byKOKnR8Bvxa3D/MnOQC8bLfNXv1qtyjK+zY3l7o=
X-Gm-Gg: AYBFou0M6ssDG11sK/qGY324CcIUT2P6VKX0BuvNPQ8pHssMLNhAxpe58iOnx2mldAg
	1Jy7DuAy20l5R1t+Zif409nhtHrEIAGVHcD7Jl93XFItAq5/r9hHErf+kRL4wJr+yu1fV32hI7N
	QEjcjsYop4FhfXToPY2xe/ECNc2vFglfiaD3T8WyAVKHaneuxNfXzvXJDydUDaceFlEFhR9ghJS
	mJpRBi/QdjnYYM5VMK4J2t8uiTMybX4ZNiGZzg8HPu7zQHkvk3FpmwVNUMCLl/RgkIrQZ+FxpID
	LVGlDvKyUXqUANbgDzJYJUkg45TQQXkkRGB2UddpMvN6CXHL47gZNwlJ75n6RYluicFUd9dR522
	JSNq2cyTTpGgub+moq9xK8WnjhQHkkPPRu6gAsxe01LFQBbdjtfxW
X-Received: by 2002:a17:906:d54e:b0:c2d:be57:f742 with SMTP id
 a640c23a62f3a-c2e340d7b10mr191644266b.32.1790848969512; Thu, 01 Oct 2026
 03:02:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ab7dca9.80e1c6cc.1e8e5f.0046.GAE@google.com> <6ab8cfe8.dc2998a4.2261f5.0062.GAE@google.com>
 <CAJnrk1Y8+P5W-6ETYuVDb2xk=GkP5o0XoDyDtvEPw+sC3GA-fQ@mail.gmail.com>
In-Reply-To: <CAJnrk1Y8+P5W-6ETYuVDb2xk=GkP5o0XoDyDtvEPw+sC3GA-fQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 1 Oct 2026 11:02:35 +0100
X-Gm-Features: AclHuK_e1DUM4Tc4vfq9jY6YyNgYBZmIio8LepP1oyZJ-3JdIKCoUCJGfB1Ig6E
Message-ID: <CAJnrk1Ze8s8EGJqy62_mLbgvzW5fVVWMdeq3zSH0mWu_HRfpcQ@mail.gmail.com>
Subject: Re: [syzbot] [fuse?] WARNING in fuse_iomap_writeback_range
To: syzbot <syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, miklos@szeredi.hu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:01=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Sun, Sep 27, 2026 at 9:15=E2=80=AFAM syzbot
> <syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com> wrote:
> >
> > syzbot has found a reproducer for the following issue on:
> >
> > HEAD commit:    fd179f8a05be Merge tag 'ata-7.3-rc5' of git://git.kerne=
l.o..
> > git tree:       upstream
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D13490605580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9d4242cb1c5=
4cdf7
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3De8200299b0556=
976e13c
> > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e=
255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1523f2c95=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D14385315580=
000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/c4cebd01ff3c/d=
isk-fd179f8a.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/9fd8641fa35c/vmli=
nux-fd179f8a.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/c6e8e6332600=
/bzImage-fd179f8a.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com
> >
> > ------------[ cut here ]------------
> > !ff
> > WARNING: fs/fuse/file.c:2043 at fuse_write_file_get fs/fuse/file.c:2043=
 [inline], CPU#0: syz-executor122/5774
> > WARNING: fs/fuse/file.c:2043 at fuse_iomap_writeback_range+0x7c8/0x18f0=
 fs/fuse/file.c:2227, CPU#0: syz-executor122/5774
> > Modules linked in:
> > CPU: 0 UID: 0 PID: 5774 Comm: syz-executor122 Not tainted syzkaller #0 =
PREEMPT(full)
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 07/24/2026
> > RIP: 0010:fuse_write_file_get fs/fuse/file.c:2043 [inline]
> > RIP: 0010:fuse_iomap_writeback_range+0x7c8/0x18f0 fs/fuse/file.c:2227
> > Code: fe 48 83 3b 00 74 5b e8 e6 f0 6c fe 4c 8b 3c 24 e9 08 0b 00 00 e8=
 d8 f0 6c fe eb 5c e8 d1 f0 6c fe 4c 89 f7 e8 39 63 8e 08 90 <0f> 0b 90 48 =
b8 00 00 00 00 00 fc ff df 48 8b 4c 24 58 80 3c 01 00
> > RSP: 0018:ffffc90003e172b8 EFLAGS: 00010286
> > RAX: 8000000000000000 RBX: ffff88806e4ea880 RCX: ffffffff9a9ec501
> > RDX: 0000000000000001 RSI: 0000000000000004 RDI: 00000000ffffffff
> > RBP: 0000000000001000 R08: ffff88806e4eae63 R09: 1ffff1100dc9d5cc
> > R10: dffffc0000000000 R11: ffffed100dc9d5cd R12: ffff88806e4ead08
> > R13: 0000000000001000 R14: ffff88806e4eae60 R15: ffff88806e4ead08
> > FS:  00007f6a3f53e6c0(0000) GS:ffff888124cc8000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 000020000000b000 CR3: 0000000078090000 CR4: 00000000003526f0
> > Call Trace:
> >  <TASK>
> >  iomap_writeback_range fs/iomap/buffered-io.c:1896 [inline]
> >  iomap_writeback_folio+0x1526/0x2490 fs/iomap/buffered-io.c:2022
> >  fuse_launder_folio+0x17b/0x240 fs/fuse/file.c:2331
> >  folio_launder mm/truncate.c:612 [inline]
> >  folio_unmap_invalidate+0x4cd/0x830 mm/truncate.c:634
> >  invalidate_inode_pages2_range+0x629/0xb30 mm/truncate.c:726
> >  fuse_open+0x5a6/0x770 fs/fuse/file.c:297
> >  do_dentry_open+0x816/0x1380 fs/open.c:996
> >  vfs_open+0x3b/0x340 fs/open.c:1101
> >  do_open fs/namei.c:4837 [inline]
> >  path_openat+0x1443/0x1d60 fs/namei.c:5000
> >  do_file_open+0x23e/0x4a0 fs/namei.c:5029
> >  do_sys_openat2+0x115/0x200 fs/open.c:1417
> >  do_sys_open fs/open.c:1423 [inline]
> >  __do_sys_openat fs/open.c:1439 [inline]
> >  __se_sys_openat fs/open.c:1434 [inline]
> >  __x64_sys_openat+0x138/0x170 fs/open.c:1434
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
> >  do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > RIP: 0033:0x7f6a3f58fae9
> > Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89=
 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 =
ff ff 73 01 c3 48 c7 c1 d0 ff ff ff f7 d8 64 89 01 48
> > RSP: 002b:00007f6a3f53e1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
> > RAX: ffffffffffffffda RBX: 00007f6a3f644b98 RCX: 00007f6a3f58fae9
> > RDX: 0000000000000040 RSI: 000020000000c380 RDI: 00000000ffffff9c
> > RBP: 00007f6a3f644b90 R08: 31203a6b63617473 R09: 31203a6b63617473
> > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f6a3f6117f4
> > R13: 000020000000e3c0 R14: 00002000000062c0 R15: 00007ffe0b2d2af8
> >  </TASK>
> >
> >
> > ---
> > If you want syzbot to run the reproducer, reply with:
> > #syz test: git://repo/address.git branch-or-commit-hash
> > If you attach or paste a git patch, syzbot will apply it before testing=
.
> >
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 6d707f2b3bff..0ef46f6e0267 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -2351,6 +2351,9 @@ static int fuse_launder_folio(struct folio *folio)
>                 .wb_ctx =3D &data,
>         };
>
> +       if (fuse_is_bad(wpc.inode))
> +               return -EIO;
> +
>         if (folio_clear_dirty_for_io(folio)) {
>                 err =3D iomap_writeback_folio(&wpc, folio);
>                 err =3D fuse_iomap_writeback_submit(&wpc, err);

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t
fd179f8a05be

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 6d707f2b3bff..0ef46f6e0267 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -2351,6 +2351,9 @@ static int fuse_launder_folio(struct folio *folio)
                .wb_ctx =3D &data,
        };

+       if (fuse_is_bad(wpc.inode))
+               return -EIO;
+
        if (folio_clear_dirty_for_io(folio)) {
                err =3D iomap_writeback_folio(&wpc, folio);
                err =3D fuse_iomap_writeback_submit(&wpc, err);
