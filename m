Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7160C3D9DD7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625884; cv=none; b=VORDbd2jONuX/ti2JtMm2yhGKgj+b7zttMVw5/W8W7wRE49jNkqQuAZ+UUJY4gObfoohjVySf+yWElmyUEibQFpE1/7zy77iZXkqjOWSHJXDgbgDP1XP+/I0nZtA9pQpcg4cB8kYHuAWMWZ7QbaTane1zn/A2N4ndt3/5/nzoRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625884; c=relaxed/simple;
	bh=2Lv8NDzj+T3UTyjb33WC6P6Ozt2HHfXFpD4R6y/SsyE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=IpqA2pzScRrBLFff9pIfBbIlp/Lx5naU+e+qGhX90BBPlKtrDjndA8rdPNN4Kc4JMpzKeLd9Vk8ERVeqk3GXttLvD75Y9UT1u0bnPVngHrpM/sOX+LGmV2UZ0RElCiAWMryHFg9gnMBQruVPCUxXHA2LwamW5Uu1eSXrYGgOkEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-82169fb66c3so1132117a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791625880; x=1792230680;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u17fSLvRKaqpbnwLQAy6kOq0zdVHHVLRFQq310rjNQY=;
        b=1M3zk+fAe2xJUo11P2N2ne3Kn++zuVyq3HZp5NlHCToTYNRoUDNPuaHQh34zNmTlzI
         S1f5hGb/DRWRfGVQD61Zi7CyyXb56l1o+2kTZ7B5xPTwxEX7SRw1JSESH446IyIWV1lQ
         RmzbJFLVksJ22J3bpweRownH70x62GjxJbt1cRnEP4+jpl0ga8gKp0NuB8eTBRvZDyhX
         FT7+CjtaA9uyeH9wKErSPhTtUZZ4iVBGiSAGSmVQY0+1KQRwEqz56shGG32nZdYtyqec
         qxx4Bcj3f/xptwaTUTSSRr6LRuKQRmDnBGcpW1QHH85ka8GZLlJTXkpM61QGxNHC7YRE
         2DDg==
X-Forwarded-Encrypted: i=1; AKwUvBybMi1wI7EjpA1zCv4O4Kvw+0V5K75JXJ4bDLOtdvXW4R9OCogRuftPvBMLBb7jvoxN/ah2aYUsrGt84ZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRdTkd9OyFBXyLxh5Uk+QrQHQo3TWW38XUf02kaNYY7BHYDAXe
	KQdc284BOTAYMgaTgn54nf6J/Uzy/+DrfvTLtjbmRZbsThwPdINuIt2eUvCdezqdjL3LhheQIw8
	XTBJun4suVexkdENllVbJUTq6NkccZGI4L1o33yPQqT0THZmNqgK9z8Z67vg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1983:b0:4f3:36ff:e521 with SMTP id
 5614622812f47-50c57a6c42dmr4003843b6e.58.1791625880053; Sat, 10 Oct 2026
 02:51:20 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:51:20 -0700
In-Reply-To: <716cc2d6-0468-48db-967e-0b3c9048ac47n@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aca0a98.a150a118.27e199.0029.GAE@google.com>
Subject: Re: [syzbot] [lsm?] general protection fault in smack_inode_permission
 (4)
From: syzbot <syzbot+fc1d5d9a7ebabbc27458@syzkaller.appspotmail.com>
To: khalid.swe@diu.edu.bd
Cc: khalid.swe@diu.edu.bd, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: 

This crash does not have a reproducer. I cannot test it.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> Try reverting the kmalloc introducer patch
>
> diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
> index ac0f79fafaca..8ce6e4458cc2 100644
> --- a/fs/jfs/jfs_dtree.c
> +++ b/fs/jfs/jfs_dtree.c
> @@ -2729,7 +2729,7 @@ int jfs_readdir(struct file *file, struct dir_context 
> *ctx)
>   struct ldtentry *d;
>   struct dtslot *t;
>   int d_namleft, len, outlen;
> - unsigned long dirent_buf;
> + void *dirent_buf;
>   char *name_ptr;
>   u32 dir_index;
>   int do_index = 0;
> @@ -2884,7 +2884,7 @@ int jfs_readdir(struct file *file, struct dir_context 
> *ctx)
>   }
>   }
>  
> - dirent_buf = __get_free_page(GFP_KERNEL);
> + dirent_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
>   if (dirent_buf == 0) {
>   DT_PUTPAGE(mp);
>   jfs_warn("jfs_readdir: __get_free_page failed!");
> @@ -2893,7 +2893,7 @@ int jfs_readdir(struct file *file, struct dir_context 
> *ctx)
>   }
>  
>   while (1) {
> - jfs_dirent = (struct jfs_dirent *) dirent_buf;
> + jfs_dirent = dirent_buf;
>   jfs_dirents = 0;
>   overflow = fix_page = 0;
>  
> @@ -2903,7 +2903,7 @@ int jfs_readdir(struct file *file, struct dir_context 
> *ctx)
>   if (stbl[i] < 0) {
>   jfs_err("JFS: Invalid stbl[%d] = %d for inode %ld, block = %lld",
>   i, stbl[i], (long)ip->i_ino, (long long)bn);
> - free_page(dirent_buf);
> + kfree(dirent_buf);
>   DT_PUTPAGE(mp);
>   return -EIO;
>   }
> @@ -2911,7 +2911,7 @@ int jfs_readdir(struct file *file, struct dir_context 
> *ctx)
>   d = (struct ldtentry *) & p->slot[stbl[i]];
>  
>   if (((long) jfs_dirent + d->namlen + 1) >
> -     (dirent_buf + PAGE_SIZE)) {
> +     ((long)dirent_buf + PAGE_SIZE)) {
>   /* DBCS codepages could overrun dirent_buf */
>   index = i;
>   overflow = 1;
> @@ -3014,7 +3014,7 @@ int jfs_readdir(struct file *file, struct dir_context 
> *ctx)
>   /* unpin previous leaf page */
>   DT_PUTPAGE(mp);
>  
> - jfs_dirent = (struct jfs_dirent *) dirent_buf;
> + jfs_dirent = dirent_buf;
>   while (jfs_dirents--) {
>   ctx->pos = jfs_dirent->position;
>   if (!dir_emit(ctx, jfs_dirent->name,
> @@ -3037,13 +3037,13 @@ int jfs_readdir(struct file *file, struct 
> dir_context *ctx)
>  
>   DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>   if (rc) {
> - free_page(dirent_buf);
> + kfree(dirent_buf);
>   return rc;
>   }
>   }
>  
>        out:
> - free_page(dirent_buf);
> + kfree(dirent_buf);
>  
>   return rc;
>  }
> diff --git a/fs/jfs/super.c b/fs/jfs/super.c
> index 61575f7397ae..8180d83d33fe 100644
> --- a/fs/jfs/super.c
> +++ b/fs/jfs/super.c
> @@ -491,7 +491,8 @@ static int jfs_fill_super(struct super_block *sb, 
> struct fs_context *fc)
>   /*
>    * Initialize blocksize to 4K.
>    */
> - sb_set_blocksize(sb, PSIZE);
> + if (!sb_set_blocksize(sb, PSIZE))
> + goto out_unload;
>  
>   /*
>    * Set method vectors.
>
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller-bugs/716cc2d6-0468-48db-967e-0b3c9048ac47n%40googlegroups.com.
