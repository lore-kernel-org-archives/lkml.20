Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BC66AD4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950608; cv=none; b=YtInGaW49oJyUEL28tGNdYHaHdN8omvlg+CQr+w42MY+VY7jJV3IxM1mzOySNpMvW3PigEMz930Ktt9PZiUPYCIWtstGOqF5e5NoHrU6cwdEJ0sQKXTqowFCt18dXaZ/JtF3F3ceYj9ppgrlNIxCShfKS7VI3F6YgcC8TPyTGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950608; c=relaxed/simple;
	bh=GB8MxMOekdH+9xK+8BIMI9Nm39LZtPOldFIprHDzq1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dU/zsuCo0SVs0o1uhQNEbyw8NrHCqoi8IDa7MgFUFelkt6QPJ8nBEvzMzyLqGqSCIqHDSWEsyFtHejZIOCTR3LSl8J0sQm2FoAF4vXfilHTCDxtH0jo2UlUOpWFRmkMqpkqdB28ZcOB2dipPyGJUJ/nW4t5QDzcf2P8pwlgdEVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=BbDHPyll; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=q5JRMAhW; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="BbDHPyll";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="q5JRMAhW"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id C309326F7664;
	Wed, 14 Oct 2026 13:03:22 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1791950603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JWen3+tsWeQTqVoDVeShkrMpOsQLo60WhBnihdqntk8=;
	b=BbDHPyllsNzhUJUNO8zu06Umxnq0b7fMvq+bcrUe3u0m1871FxrBKpwlqBhJVVFeNdyzh/
	tMT40YjIPhI17+nq/gOLV6bDIhjSFrLJHi0Oc7BSXgLjuUt07+X/CwrOlMaFyMHJENFdSd
	5iOLlAx1xVTxmf10/6qSqwWOHXbGwt/aXfXRNksZesENcEdAUaayF4Dd22mxzSLCHEfRGb
	m0eooHSdIU+y/jUgaGezUrhIXzBKK0gjFUHPn1vFHlls+uf0qw1ZPFzgF+7LFAq7lma49a
	34oTIgU1swFN1tWuWBPd3AaWhbOgfDoAAHRYVTX477GnfueEObUQUleeSbveLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1791950603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JWen3+tsWeQTqVoDVeShkrMpOsQLo60WhBnihdqntk8=;
	b=q5JRMAhWl3uumj47gM0F+wl1aF/Va/Ft9fJtJuIcazLgk0flSfRi5gtH4Ysbvjp4Jh95PU
	BKwSNJQt7RAcF/DA==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 35001E0005B;
	Wed, 14 Oct 2026 13:03:22 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 2C67A22000B9; Wed, 14 Oct 2026 13:03:22 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: zhoumin <teczm@foxmail.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fat: roll back the new entry when create/mkdir fails
 to build the inode
In-Reply-To: <20261013155415.89ca96f42093ca7434b9ed2c@linux-foundation.org>
References: <87jynnff0g.fsf@mail.parknet.co.jp>
	<tencent_4EDD66523CED299DB0C99498B4D8C939A009@qq.com>
	<20261013155415.89ca96f42093ca7434b9ed2c@linux-foundation.org>
Date: Wed, 14 Oct 2026 13:03:22 +0900
Message-ID: <878q41lyid.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Morton <akpm@linux-foundation.org> writes:

> On Mon, 12 Oct 2026 21:20:06 +0800 zhoumin <teczm@foxmail.com> wrote:
>
>> vfat_create(), vfat_mkdir(), msdos_create() and msdos_mkdir() add the
>> on-disk entry before calling fat_build_inode() to set up the VFS
>> inode.  If fat_build_inode() fails, the error is returned but the
>> entry stays on disk and the file or directory shows up after remount.
>> 
>> Remove the entry in that case.  For mkdir, also free the directory
>> cluster and decrement the parent's link count.
>
>   MODPOST Module.symvers
> ERROR: modpost: fs/fat/msdos.ko: symbol '_fat_msg' undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/usr/src/25/Makefile:2159: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> **FAILED**
>
> Easy fixup, but I'm surprised this hasn't already been encountered - is
> something funny going on?

Ouch. Thank you. fat_msg() was not used in msdos.ko or vfat.ko until now
(only in fat.ko). So your patch is right.

> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: fat-roll-back-the-new-entry-when-create-mkdir-fails-to-build-the-inode-fix
> Date: Tue Oct 13 03:50:35 PM PDT 2026
>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
> Cc: zhoumin <teczm@foxmail.com>
> ---
>
>  fs/fat/misc.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/fs/fat/misc.c~fat-roll-back-the-new-entry-when-create-mkdir-fails-to-build-the-inode-fix
> +++ a/fs/fat/misc.c
> @@ -62,6 +62,7 @@ void _fat_msg(struct super_block *sb, co
>  	_printk(FAT_PRINTK_PREFIX "%pV\n", level, sb->s_id, &vaf);
>  	va_end(args);
>  }
> +EXPORT_SYMBOL_GPL(_fat_msg);
>  
>  /* Flushes the number of free clusters on FAT32 */
>  /* XXX: Need to write one per FSINFO block.  Currently only writes 1 */
> _
>

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
