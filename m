Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.171.160.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420457;
	b=JQAi9n2WY9uNkZVW4kKNO2xmI/wv4k2nfHKggMHKYsovio/SNQ+fMlruFWDBMaGlt5c5
	 XwCLiUsKrFEt9UTfsb/yIWYhUALZwI2zHjBKAwC04tuMOpnJ8ZEQghWC7vlJ4O3XE+ewd
	 XGR3VOrERAXN4WSRO2Bd5d3oSBYP+IGYKDaqm42qnJHlmUVeRBWoSfoJ+JfhK9cJzDvAI
	 vTHzQf20CvhAE+xW62dDWqM5vHigxZ370f914NqXbyRKG9rdC+RVBoZqZ4BAE+Ci/ZidM
	 zRGbRu0TrHJLg9rfEayf5pCVMnJxYmmONugWVGDUATPL1oDhADR424a/mZfIns7Sj4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420457;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 User-Agent:MIME-Version:Content-Type;
	bh=W0hdCHLr9QUbd2Sd2fherl19yeusAeZGY0041G9jaws=;
	b=ERsLmwSTG88n8vPuDaYLGdwlQBX2nZYCXoJAhmhfb5VkACG0PCKuJ7V+ebPX/Oh6vTU5
	 YFs8srBOEfV0KrP9iX+09U+7mGPyeGsDXPX+IYdcGJzJ6zb4a7zUg8JnKEI91GWa4E99M
	 3IfrQjkb1cqEFoTHAbmGqOlvxc/uOYVFMYDBgLFoEAXyCywB9F0oLDcJgsjFAL+zja88+
	 3ten5jRUPtOcqgoLAF8hlh9mSu1aU20O7f66Vrd3GMkTDJpHXjqVanXsMEHVbgEusT0H5
	 DGQgmDsRFT69OR6yIcVfGlmuwlV8h8FzrVCxUP0VSqfrSTg/3EjBFtgW8gz8e9mCiDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.parknet.co.jp;
	spf=pass smtp.mailfrom=parknet.co.jp;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=rsa-sha256 header.s=20250114 header.b=MQRe8cdh;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=ed25519-sha256 header.s=20250114-ed25519 header.b=OiUxWO0l;
	arc=none smtp.remote-ip=210.171.160.6
Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B13606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2B13606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=parknet.co.jp header.i=@parknet.co.jp header.a=rsa-sha256 header.s=20250114 header.b=MQRe8cdh;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=ed25519-sha256 header.s=20250114-ed25519 header.b=OiUxWO0l
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 0D38B26F7662;
	Sat, 31 Oct 2026 13:20:52 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1793420452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W0hdCHLr9QUbd2Sd2fherl19yeusAeZGY0041G9jaws=;
	b=MQRe8cdhLjD5MrI4DEzApZSG5RpSu3Paz+fsTdj8g4f5hloTndC2gFTcvYqwN1VQbeYsMS
	iPxKrDHoupMgdN/CDHeT8y0JFUgUlJuDTZwiKvaNqmmm1kgU+3LvkynKbHsx8TUFUKH8Ws
	uzHJ7YY67oos6pffxJ3WTjMxWCWyZOAhI4cWck65QBQS9U52/I35PzTSaivZcmsD7HGK7R
	ELpOwZ7oZzAJwBm/U3TYt6v8a0Ay740MPLNgEkWrQD/0Lfw1LWKUFJa3w8E1k8mkwprZjV
	uKBG327fMAidsPWqY2Iweex7mWLMHQatZKBiTnV9KOSZsWAgEQLUMkqjJzLBPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1793420452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W0hdCHLr9QUbd2Sd2fherl19yeusAeZGY0041G9jaws=;
	b=OiUxWO0leMgVfMCbz4LqPZmrtEpgtunrs/5AXeuaKgZwBuPvYIHMlu2EQ+eGqyVmoX/Ub2
	YRNc29ocxeeZ6KDA==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 888EDE00131;
	Sat, 31 Oct 2026 13:20:51 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 79C4222000C4; Sat, 31 Oct 2026 13:20:51 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: linux-kernel@vger.kernel.org,
  syzbot+018e6f695ad9bccb182a@syzkaller.appspotmail.com,
  syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fat: serialize primary and mirror updates
In-Reply-To: <20261031033232.2490931-1-matthias.goergens@gmail.com>
References: <20261031033232.2490931-1-matthias.goergens@gmail.com>
Date: Sat, 31 Oct 2026 13:20:51 +0900
Message-ID: <87tsm25wm4.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Matthias Goergens <matthias.goergens@gmail.com> writes:

> __fat_alloc_clusters() drops fat_lock before syncing and mirroring
> modified buffer heads. Another allocation can change the primary FAT
> while an earlier allocation is copying it to the mirror.
>
> fat_ent_write() also updates and mirrors without fat_lock. Take the lock
> in both paths, preserving the existing post-unlock error cleanup.
>
> The test detector reproduced a primary-FAT write during a mirror copy.
> Three exact-current trials completed with no FAT conflicts and matching
> mirrors.

What is the real issue?

> Link: https://syzkaller.appspot.com/bug?extid=018e6f695ad9bccb182a
> ---
>  fs/fat/fatent.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/fs/fat/fatent.c b/fs/fat/fatent.c
> index 2d10a815a579..5f2779c7f947 100644
> --- a/fs/fat/fatent.c
> +++ b/fs/fat/fatent.c
> @@ -419,6 +419,7 @@ int fat_ent_write(struct inode *inode, struct fat_entry *fatent,
>  	const struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
>  	int err;
>  
> +	lock_fat(MSDOS_SB(sb));
>  	ops->ent_put(fatent, new);
>  	if (wait) {
>  		err = fat_sync_bhs(fatent->bhs, fatent->nr_bhs);
> @@ -429,7 +430,7 @@ int fat_ent_write(struct inode *inode, struct fat_entry *fatent,
>  			 * would not have value to write again on I/O
>  			 * error.
>  			 */
> -			return err;
> +			goto out_unlock;
>  		}
>  	}
>  
> @@ -440,6 +441,8 @@ int fat_ent_write(struct inode *inode, struct fat_entry *fatent,
>  		if (wait)
>  			fat_sync_bhs(fatent->bhs, fatent->nr_bhs);
>  	}
> +out_unlock:
> +	unlock_fat(MSDOS_SB(sb));
>  	return err;
>  }
>  
> @@ -582,7 +585,6 @@ static int __fat_alloc_clusters(struct inode *inode, int *cluster, int nr_cluste
>  	err = -ENOSPC;
>  
>  out:
> -	unlock_fat(sbi);
>  	mark_fsinfo_dirty(sb);
>  	fatent_brelse(&fatent);
>  	if (!err) {
> @@ -591,6 +593,7 @@ static int __fat_alloc_clusters(struct inode *inode, int *cluster, int nr_cluste
>  		if (!err)
>  			err = fat_mirror_bhs(sb, bhs, nr_bhs);
>  	}
> +	unlock_fat(sbi);
>  	for (i = 0; i < nr_bhs; i++)
>  		brelse(bhs[i]);
>  
>
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
