Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22234F472E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893778; cv=none; b=q0/xF9M6yxeEhekTXPMTuQ9irPMW8MCxDU3mChDJkjVC1jYAlZBwY36BozNS43Nhd8vr7piUtwAAWfxrZrzbUYn7DRp/6XqKQw96lREb7dSOc7p+DDTxzCqbu0iifFlNm4+nmSQOKEj7ol4Ig18kQThKx9xkgUL3j1+utl4kycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893778; c=relaxed/simple;
	bh=2dTs3JtClhJ3Onwv/krrzPiugWJurZnlOKDiVZp3WSo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Qon1+xJewJVAYCWmqYG4ZsCVWiMndQjvkP4+TZNlOxxpS4Siwktuf3z+DgzqP/LGoSILnO/tU1M8nSPLrHjrIQXCuRZJMgscett4jaq+vhA6oNoEeSJzvAzkRRSeCR1AHu+JXQ3lf8wrsBWwddsMBtcNpKDyDcXA5Igs9dkgvZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=CJ0qnePX; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=P4mdQOGB; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="CJ0qnePX";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="P4mdQOGB"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 72C1326F7697;
	Tue, 13 Oct 2026 21:16:05 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1791893765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HPixjkRcY32J9RpKtisXwVocmyIPTqJn6VgOKOpClZI=;
	b=CJ0qnePXtre2Y8iadMlw4Pu1IjJqYTt/BMPqWHuV00RPR+d6zFDCESxvfXBYKI2IVfB93H
	2Jyz9c+VCvGFUy49cBp0wrRmZtIJs6Q4Fi+EAVWIx3IwekI4mMdB0H3wcdUIVzvgxDZG6H
	U1BNSPdyFX9nwf8mNVEYV4kkPJpFuzAvHrroJmUXeHpS1hXsYduNS9bWr+/QM13pWyrWpe
	ObQF5T3MHwae6LJW4cVORhdHZUXAhypzXjawv+Ld9MdOtjpBtOyzlKvogTLD8o31kYTbRe
	l0BHVH7glH7/xU+A5JHYN8y0dmZDVeWbwsRbl4Z/Mpup7zLjFQ9eKtEfWhxECA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1791893765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HPixjkRcY32J9RpKtisXwVocmyIPTqJn6VgOKOpClZI=;
	b=P4mdQOGBeVk+sH85pmUe1gmz/txVj8uuDtVA7Y7OSjU0KQWnOJOBbPrWpd9uCODF8mdw4s
	d2pb/3rSYce1oKBg==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id E9229E0005B;
	Tue, 13 Oct 2026 21:16:04 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id DDA0922000A7; Tue, 13 Oct 2026 21:16:04 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: zhoumin <teczm@foxmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fat: roll back the new entry when create/mkdir fails
 to build the inode
In-Reply-To: <tencent_4EDD66523CED299DB0C99498B4D8C939A009@qq.com>
References: <87jynnff0g.fsf@mail.parknet.co.jp>
	<tencent_4EDD66523CED299DB0C99498B4D8C939A009@qq.com>
Date: Tue, 13 Oct 2026 21:16:04 +0900
Message-ID: <87tsmpn6d7.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

zhoumin <teczm@foxmail.com> writes:

> vfat_create(), vfat_mkdir(), msdos_create() and msdos_mkdir() add the
> on-disk entry before calling fat_build_inode() to set up the VFS
> inode.  If fat_build_inode() fails, the error is returned but the
> entry stays on disk and the file or directory shows up after remount.
>
> Remove the entry in that case.  For mkdir, also free the directory
> cluster and decrement the parent's link count.
>
> Signed-off-by: zhoumin <teczm@foxmail.com>

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

Thanks.

> ---
> Changes since v1:
>  - Only undo the parent nlink and free the cluster when
>    fat_remove_entries() succeeds.
>  - Use a block scoped err2.
>  - Reuse out_free instead of an open coded fat_free_clusters().
>
>  fs/fat/namei_msdos.c | 22 ++++++++++++++++++----
>  fs/fat/namei_vfat.c  | 22 ++++++++++++++++++----
>  2 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
> index d46d1a3851f2..7f2c68149efd 100644
> --- a/fs/fat/namei_msdos.c
> +++ b/fs/fat/namei_msdos.c
> @@ -292,11 +292,17 @@ static int msdos_create(struct mnt_idmap *idmap, struct inode *dir,
>  	if (err)
>  		goto out;
>  	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
> -	brelse(sinfo.bh);
>  	if (IS_ERR(inode)) {
> +		int err2;
> +
>  		err = PTR_ERR(inode);
> +		err2 = fat_remove_entries(dir, &sinfo);
> +		if (err2)
> +			fat_msg(sb, KERN_WARNING,
> +				"failed to roll back new entry (%d)", err2);
>  		goto out;
>  	}
> +	brelse(sinfo.bh);
>  	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
>  	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
>  
> @@ -381,12 +387,20 @@ static struct dentry *msdos_mkdir(struct mnt_idmap *idmap, struct inode *dir,
>  	inc_nlink(dir);
>  
>  	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
> -	brelse(sinfo.bh);
>  	if (IS_ERR(inode)) {
> +		int err2;
> +
>  		err = PTR_ERR(inode);
> -		/* the directory was completed, just return a error */
> -		goto out;
> +		err2 = fat_remove_entries(dir, &sinfo);
> +		if (err2) {
> +			fat_msg(sb, KERN_WARNING,
> +				"failed to roll back new entry (%d)", err2);
> +			goto out;
> +		}
> +		drop_nlink(dir);
> +		goto out_free;
>  	}
> +	brelse(sinfo.bh);
>  	set_nlink(inode, 2);
>  	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
>  	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
> diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
> index da3e89c0b16a..b366e0163272 100644
> --- a/fs/fat/namei_vfat.c
> +++ b/fs/fat/namei_vfat.c
> @@ -771,11 +771,17 @@ static int vfat_create(struct mnt_idmap *idmap, struct inode *dir,
>  	inode_inc_iversion(dir);
>  
>  	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
> -	brelse(sinfo.bh);
>  	if (IS_ERR(inode)) {
> +		int err2;
> +
>  		err = PTR_ERR(inode);
> +		err2 = fat_remove_entries(dir, &sinfo);
> +		if (err2)
> +			fat_msg(sb, KERN_WARNING,
> +				"failed to roll back new entry (%d)", err2);
>  		goto out;
>  	}
> +	brelse(sinfo.bh);
>  	inode_inc_iversion(inode);
>  
>  	d_instantiate(dentry, inode);
> @@ -870,12 +876,20 @@ static struct dentry *vfat_mkdir(struct mnt_idmap *idmap, struct inode *dir,
>  	inc_nlink(dir);
>  
>  	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
> -	brelse(sinfo.bh);
>  	if (IS_ERR(inode)) {
> +		int err2;
> +
>  		err = PTR_ERR(inode);
> -		/* the directory was completed, just return a error */
> -		goto out;
> +		err2 = fat_remove_entries(dir, &sinfo);
> +		if (err2) {
> +			fat_msg(sb, KERN_WARNING,
> +				"failed to roll back new entry (%d)", err2);
> +			goto out;
> +		}
> +		drop_nlink(dir);
> +		goto out_free;
>  	}
> +	brelse(sinfo.bh);
>  	inode_inc_iversion(inode);
>  	set_nlink(inode, 2);

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
