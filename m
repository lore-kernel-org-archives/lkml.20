Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ECB3BB68F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797060; cv=none; b=GAUJm/noqOrdeEnTz9H8C6IdBkRv68re6OiffDYf+PBQHssj7tW+eDdVfKGk16Z6aiS2ZubyWHTjjBlkauuCWQ6sb8Ncd4tXFasfPOkdtEyiP2U0isWOoy7nA7W3QHinwXnirt2gEljs3a9H5Ga3eWuj0ETUTywsHom9c9tpEMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797060; c=relaxed/simple;
	bh=Pm77NGj6cD/HPXHDn+aPY+6LjLAHytgU88Duq3pcg5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dTAW1YlonrB84wvbotRGu0YIBZrYy0v7kZOPKphLm4QqpRPWKaeeF2wo6gzipDpEkJL4dLiUm1uvBC9jSbSQi2upiyFB+yHVdtdUXZXUc/8m3oZQESEfbGI5/CE8olbU3DgC87ojMcvS5D23+YBdk5B4reOUElwBNG+KPTcyJXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=u5yYscga; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=yKNandtL; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="u5yYscga";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="yKNandtL"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id B318D26F7697;
	Mon, 12 Oct 2026 18:24:15 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1791797056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AW4bUPF5yvTbOuiU9y9wZBwmSjMbUZHSE/S+fUgep5Y=;
	b=u5yYscgaE5faSOfIbN4zMt00o3cyos6vWYq1hjj7lbOlcaKgT+7V4s0czyLF4tmxuYd692
	7+pNVDemUNAq3/oDFaPH3upcBpfWeE/mbe++CSu6j6aIXsvUKuWv1ZBfUJ0pmEVJux9Vi9
	z0lLSka2a70QSAMbyiNur+O/q4fbYFNMm2FDzOasQmJpuDfgNGv/l0DY0Aob5SngzADewJ
	fwwez36yhnHxuk5hf1AG+lypdjwdAa7/VAC/OShsKnQ4BBDyIw3DlsI4jXmD3GNeilAAfM
	H0NEoUUVgNVz1VQoV7+XeU1BdO5VOUt5pbXJyxvAIlmibJxxLR26XuL8nhK6+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1791797056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AW4bUPF5yvTbOuiU9y9wZBwmSjMbUZHSE/S+fUgep5Y=;
	b=yKNandtL7sjLfBw6Z3WGG89b4h1M75Q7v6t1hzCzPOM8FyGP15ML49pOITbTz95N9KYkRu
	Fyl/kKGj1iBsvYDA==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 3889CE00070;
	Mon, 12 Oct 2026 18:24:15 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 2F2FA220007C; Mon, 12 Oct 2026 18:24:15 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: zhoumin <teczm@foxmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fat: roll back the new entry when create/mkdir fails to
 build the inode
In-Reply-To: <tencent_355C095BCB939C08BA6886D59393B20E7B05@qq.com>
References: <tencent_355C095BCB939C08BA6886D59393B20E7B05@qq.com>
Date: Mon, 12 Oct 2026 18:24:15 +0900
Message-ID: <87jynnff0g.fsf@mail.parknet.co.jp>
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
> ---
>  fs/fat/namei_msdos.c | 19 ++++++++++++++-----
>  fs/fat/namei_vfat.c  | 19 ++++++++++++++-----
>  2 files changed, 28 insertions(+), 10 deletions(-)
>
> diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
> index d46d1a3851f2..a0d1af5b8a5b 100644
> --- a/fs/fat/namei_msdos.c
> +++ b/fs/fat/namei_msdos.c
> @@ -271,7 +271,7 @@ static int msdos_create(struct mnt_idmap *idmap, struct inode *dir,
>  	struct fat_slot_info sinfo;
>  	struct timespec64 ts;
>  	unsigned char msdos_name[MSDOS_NAME];
> -	int err, is_hid;
> +	int err, err2, is_hid;
>  
>  	mutex_lock(&MSDOS_SB(sb)->s_lock);
>  
> @@ -292,11 +292,15 @@ static int msdos_create(struct mnt_idmap *idmap, struct inode *dir,
>  	if (err)
>  		goto out;
>  	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
> -	brelse(sinfo.bh);
>  	if (IS_ERR(inode)) {
>  		err = PTR_ERR(inode);
> +		err2 = fat_remove_entries(dir, &sinfo);
> +		if (err2)
> +			fat_msg(sb, KERN_WARNING,
> +				"failed to roll back new entry (%d)", err2);

		int err2 = fat_remove_entries(dir, &sinfo);
		if (err2)
			fat_msg(sb, KERN_WARNING,
				"failed to roll back new entry (%d)", err2);
		err = PTR_ERR(inode);

is better? (and other 3 parts are same).

>  		goto out;
>  	}
> +	brelse(sinfo.bh);
>  	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
>  	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
>  
> @@ -353,7 +357,7 @@ static struct dentry *msdos_mkdir(struct mnt_idmap *idmap, struct inode *dir,
>  	struct inode *inode;
>  	unsigned char msdos_name[MSDOS_NAME];
>  	struct timespec64 ts;
> -	int err, is_hid, cluster;
> +	int err, err2, is_hid, cluster;
>  
>  	mutex_lock(&MSDOS_SB(sb)->s_lock);
>  
> @@ -381,12 +385,17 @@ static struct dentry *msdos_mkdir(struct mnt_idmap *idmap, struct inode *dir,
>  	inc_nlink(dir);
>  
>  	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
> -	brelse(sinfo.bh);
>  	if (IS_ERR(inode)) {
>  		err = PTR_ERR(inode);
> -		/* the directory was completed, just return a error */
> +		err2 = fat_remove_entries(dir, &sinfo);
> +		if (err2)
> +			fat_msg(sb, KERN_WARNING,
> +				"failed to roll back new entry (%d)", err2);
> +		drop_nlink(dir);

ditto

> +		fat_free_clusters(dir, cluster);

Maybe "goto out_free" instead of fat_free_cluster()?

>  		goto out;
>  	}
> +	brelse(sinfo.bh);
>  	set_nlink(inode, 2);
>  	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
>  	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
> diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
> index da3e89c0b16a..31d83de5beaa 100644
> --- a/fs/fat/namei_vfat.c
> +++ b/fs/fat/namei_vfat.c
> @@ -760,7 +760,7 @@ static int vfat_create(struct mnt_idmap *idmap, struct inode *dir,
>  	struct inode *inode;
>  	struct fat_slot_info sinfo;
>  	struct timespec64 ts;
> -	int err;
> +	int err, err2;
>  
>  	mutex_lock(&MSDOS_SB(sb)->s_lock);
>  
> @@ -771,11 +771,15 @@ static int vfat_create(struct mnt_idmap *idmap, struct inode *dir,
>  	inode_inc_iversion(dir);
>  
>  	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
> -	brelse(sinfo.bh);
>  	if (IS_ERR(inode)) {
>  		err = PTR_ERR(inode);
> +		err2 = fat_remove_entries(dir, &sinfo);
> +		if (err2)
> +			fat_msg(sb, KERN_WARNING,
> +				"failed to roll back new entry (%d)", err2);

ditto

>  		goto out;
>  	}
> +	brelse(sinfo.bh);
>  	inode_inc_iversion(inode);
>  
>  	d_instantiate(dentry, inode);
> @@ -853,7 +857,7 @@ static struct dentry *vfat_mkdir(struct mnt_idmap *idmap, struct inode *dir,
>  	struct inode *inode;
>  	struct fat_slot_info sinfo;
>  	struct timespec64 ts;
> -	int err, cluster;
> +	int err, err2, cluster;
>  
>  	mutex_lock(&MSDOS_SB(sb)->s_lock);
>  
> @@ -870,12 +874,17 @@ static struct dentry *vfat_mkdir(struct mnt_idmap *idmap, struct inode *dir,
>  	inc_nlink(dir);
>  
>  	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
> -	brelse(sinfo.bh);
>  	if (IS_ERR(inode)) {
>  		err = PTR_ERR(inode);
> -		/* the directory was completed, just return a error */
> +		err2 = fat_remove_entries(dir, &sinfo);
> +		if (err2)
> +			fat_msg(sb, KERN_WARNING,
> +				"failed to roll back new entry (%d)", err2);
> +		drop_nlink(dir);

ditto

> +		fat_free_clusters(dir, cluster);

out_free?

>  		goto out;
>  	}
> +	brelse(sinfo.bh);
>  	inode_inc_iversion(inode);
>  	set_nlink(inode, 2);

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
