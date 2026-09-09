Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31D157981D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969379; cv=none; b=f1gFPGwcJfU3U+A6Xkh6sMlIHelJ1D03+7Und4+NX01A0OZneo6cEZQVe8ArjOBNbDZftfJ+MZjcY4msM5kp33+zUvLjJb+gxOvrEWT3sgZppeZ1Zg01mOAIdV7zqV2oTODXUuQ8NusQIPgdNBpkzd6Qy07Cao8NgPD5bgGAX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969379; c=relaxed/simple;
	bh=Wo1oQHJMQhyzMY4Tc7A4+R9/AJNBJHtl11NbPQXWfaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/QcAs5B1YO4eHGRQbBXeW8xqdy09xM4H5ge9rWz5m9QMgA9/L+PgXebxZTFxR4aLUCvYZ3WkBi/XUEwOSaMqmbwELxriCe7tVpkGfAvW3Gm9uOZrb27SScwj/0oF0XB8h50DNLWF3WbnragIHXsZCE4XUNI9cYgbo2yOtlkxUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IW67PV++; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IW67PV++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3C11F00A3A;
	Wed,  9 Sep 2026 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969378;
	bh=yBDgeSYZv0PufE0a7WqXAhwhnJNnCbha7zPdFE4f0Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IW67PV++7ldSiCvvRWh8DNc6weOFPthrysMIYQog217PgTfdBhN6/wySOtcusDtbl
	 Gqnucd9A8LRc0LZiCBVxhPr/zL/W1aBP7xjKGRDkFhCuTFKXr9n9c6LR9vMp9hCica
	 a6Yxtd4Ah2hs2VwJpdY5850TKfuE4I/E5u332P2QZE+kvwC7yBLGKbgOx/1sL6ooXt
	 Lw1xi1LIVvXIBUmMRhmerfg6HDxaP/GNHfwTIa6GjLZpYKK/fB2FIx900sQdkMqGMs
	 uAahLji2eB5Lchx8cZQCBUvMGmZqsPPc/W9yMj6RUN77DhY2koN+UAKTWSR0q9+SKl
	 NYn4/cILtTy1w==
Date: Wed, 9 Sep 2026 08:56:18 -0700
From: Kees Cook <kees@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	Jaeyoung Chung <jjy600901@snu.ac.kr>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, eulgyukim@snu.ac.kr
Subject: Re: [BUG] general protection fault in jffs2_xattr_delete_inode
Message-ID: <202609090841.F0395BF40@keescook>
References: <20260819182805.4020838-1-jjy600901@snu.ac.kr>
 <849183271.921.1787173413104.JavaMail.zimbra@nod.at>
 <CAFLxGvyZO_EDo-YM_EybZG3u7aNUoNiThhvbhQCrOPD7mPV6GA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvyZO_EDo-YM_EybZG3u7aNUoNiThhvbhQCrOPD7mPV6GA@mail.gmail.com>

On Wed, Sep 09, 2026 at 07:59:21AM +0200, Richard Weinberger wrote:
> On Wed, Aug 19, 2026 at 11:03 PM Richard Weinberger <richard@nod.at> wrote:
> >
> > ----- Ursprüngliche Mail -----
> > > Von: "Jaeyoung Chung" <jjy600901@snu.ac.kr>
> >
> > [...]
> >
> > > RIP: 0010:jffs2_xattr_delete_inode+0x38/0x300 fs/jffs2/xattr.c:602
> > > Code: 41 55 41 54 53 48 83 ec 50 48 89 3c 24 48 85 f6 74 2a 49 89 f6 49 bd 00 00
> > > 00 00 00 fc ff df 48 8d 5e 28 48 89 d8 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85
> > > 90 02 00 00 83 3b 00 74 14 48 83 c4 50
> > > RSP: 0018:ffff888104ad7918 EFLAGS: 00010203
> > > RAX: 0c8c8c8c8c8c8c91 RBX: 646464646464648c RCX: 0000000000000001
> > > RDX: 0000000000000001 RSI: 6464646464646464 RDI: ffff888108260000
> > > RBP: dffffc0000000000 R08: ffff888104ad7987 R09: 1ffff1102095af30
> > > R10: dffffc0000000000 R11: ffffed102095af31 R12: 1ffff11022349cfc
> > > R13: dffffc0000000000 R14: 6464646464646464 R15: 1ffff11022349ce8
> > > FS:  00007863627186c0(0000) GS:ffff88815e8ac000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 0000786362717f78 CR3: 000000010795c000 CR4: 00000000000006f0
> > > Call Trace:
> > > <TASK>
> > > jffs2_do_clear_inode+0x4d/0x2f0 fs/jffs2/readinode.c:1418
> > > evict+0x353/0x700 fs/inode.c:825
> > > jffs2_new_inode+0x443/0xce0 fs/jffs2/fs.c:-1
> > > jffs2_create+0x87/0x300 fs/jffs2/dir.c:182
> > > lookup_open fs/namei.c:4508 [inline]
> > > open_last_lookups fs/namei.c:4608 [inline]
> > > path_openat+0xe3c/0x29b0 fs/namei.c:4860
> > > do_file_open+0x19d/0x360 fs/namei.c:4892
> > > do_sys_openat2+0x9a/0x100 fs/open.c:1368
> > > do_sys_open fs/open.c:1374 [inline]
> > > __do_sys_openat fs/open.c:1390 [inline]
> > > __se_sys_openat fs/open.c:1385 [inline]
> > > __x64_sys_openat+0xf8/0x130 fs/open.c:1385
> > > do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> > > do_syscall_64+0xf7/0x370 arch/x86/entry/syscall_64.c:94
> > > entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > RIP: 0033:0x78636301e829
> >
> > So, the partially created inode is evicted in the create path.
> > Does this change help?
> >
> > diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> > index 86ab014a349c..a9906f9e3638 100644
> > --- a/fs/jffs2/os-linux.h
> > +++ b/fs/jffs2/os-linux.h
> > @@ -57,6 +57,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
> >         f->target = NULL;
> >         f->flags = 0;
> >         f->usercompr = 0;
> > +       f->inocache = NULL;
> >  }

Tested-by: Kees Cook <kees@kernel.org>
Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")

I reproduced this and tested your fix. It reproduces immediately under
v7.3-rc2 (df2908090cda3), x86_64 defconfig plus the options from the
report and CONFIG_KASAN=y, with the reporter's delay patch and their C
reproducer used verbatim. Booted under qemu with four CPUs.

The patch fixes it. Note that the bug is not XATTR specific:
jffs2_do_clear_inode() dereferences f->inocache four more times after the
jffs2_xattr_delete_inode() call, so CONFIG_JFFS2_FS_XATTR only decides
which dereference happens first. With XATTR=n the same reproducer faults
one line later instead:

  RIP: 0010:jffs2_do_clear_inode+0x68/0x3a0

which is "deleted = f->inocache && !f->inocache->pino_nlink". The patch
fixes that configuration too.

Note that if you wanted this to be more robust, you could wrap
everything between sem and vfs_inode in a struct_group, and then use
memset in jffs2_init_inode_info:

 struct jffs2_inode_info {
...
        struct mutex sem;
+       struct_group(info,
...
+       );
        struct inode vfs_inode;
 };

...

static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
{
	/* Make sure RB_ROOT is zero-filled. */
	BUILD_BUG_ON(sizeof(RB_ROOT) != sizeof((RB_ROOT).rb_node));
	BUILD_BUG_ON((RB_ROOT).rb_node != NULL);
	memset(&f->info, 0, sizeof(f->info));
}

-Kees

-- 
Kees Cook
