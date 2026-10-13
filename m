Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B63558202
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932057; cv=none; b=r9wSsPPivagg/juOOmsLh/VA42jIy3KEiCY1P84VQ7kpwehZrpRxJIA3vRNWNxGCp2JZTOwyLPT/5ObNKrMaLelgeUnphJ/m6Lj/QJnXGRqD08Mxx5sfd/YKoWlqJQUuAe+UTyRU/ow6ud0nliukjNkgojEYRvBftTo6NvLiiS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932057; c=relaxed/simple;
	bh=8Jnb134GcCZ8cVJBe4DdR/G4+KqZEtFIvuGLFVm5SNk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OZ2J6Lbc9xhGD4OqSX3cJC6CFr1Sm761JwE/1uSS57IcpjMYhhz40UjeyTE7hF44ESFkrQiyc2pTzVLLouF6HZ0ll2wra5WEiO0I7w5pTcMwaZX3NOzsLI2cNVsmH3xkg0m0rD2YuFl3vt78Sesug0LFJfCbx7yLdPlyky6pDPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cECYufRX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cECYufRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDF61F000FF;
	Tue, 13 Oct 2026 22:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791932055;
	bh=Bf3Cm2C0wWzO+wjDk3ZYfCIMz+ilKhtlMnT0T9ktl8U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cECYufRXV2u2kG/0RpL/ayZGOaHCNOGK0DmvEmGh4lv2/3GsY60DUK8eWvrwKIgEB
	 OlTzbAlKD+mJB8Zw7lK93BI0XsGNTnoP1flqCeLBcBrfJDba1hoEalgUpz5rMQWe6d
	 VXs+KMzD/RMNw6m59UKZCoQhd4Qk9BC4coQ83Wm0=
Date: Tue, 13 Oct 2026 15:54:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: zhoumin <teczm@foxmail.com>
Cc: hirofumi@mail.parknet.co.jp, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fat: roll back the new entry when create/mkdir fails
 to build the inode
Message-Id: <20261013155415.89ca96f42093ca7434b9ed2c@linux-foundation.org>
In-Reply-To: <tencent_4EDD66523CED299DB0C99498B4D8C939A009@qq.com>
References: <87jynnff0g.fsf@mail.parknet.co.jp>
	<tencent_4EDD66523CED299DB0C99498B4D8C939A009@qq.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 21:20:06 +0800 zhoumin <teczm@foxmail.com> wrote:

> vfat_create(), vfat_mkdir(), msdos_create() and msdos_mkdir() add the
> on-disk entry before calling fat_build_inode() to set up the VFS
> inode.  If fat_build_inode() fails, the error is returned but the
> entry stays on disk and the file or directory shows up after remount.
> 
> Remove the entry in that case.  For mkdir, also free the directory
> cluster and decrement the parent's link count.

  MODPOST Module.symvers
ERROR: modpost: fs/fat/msdos.ko: symbol '_fat_msg' undefined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/usr/src/25/Makefile:2159: modpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2
**FAILED**

Easy fixup, but I'm surprised this hasn't already been encountered - is
something funny going on?


From: Andrew Morton <akpm@linux-foundation.org>
Subject: fat-roll-back-the-new-entry-when-create-mkdir-fails-to-build-the-inode-fix
Date: Tue Oct 13 03:50:35 PM PDT 2026

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: zhoumin <teczm@foxmail.com>
---

 fs/fat/misc.c |    1 +
 1 file changed, 1 insertion(+)

--- a/fs/fat/misc.c~fat-roll-back-the-new-entry-when-create-mkdir-fails-to-build-the-inode-fix
+++ a/fs/fat/misc.c
@@ -62,6 +62,7 @@ void _fat_msg(struct super_block *sb, co
 	_printk(FAT_PRINTK_PREFIX "%pV\n", level, sb->s_id, &vaf);
 	va_end(args);
 }
+EXPORT_SYMBOL_GPL(_fat_msg);
 
 /* Flushes the number of free clusters on FAT32 */
 /* XXX: Need to write one per FSINFO block.  Currently only writes 1 */
_

