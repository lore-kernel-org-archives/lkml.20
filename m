Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360101;
	b=iN0nqAXkbHLmR1u3A+f3oZ3yyYDjxZxlNZf8T/RC5mpelTDNzTJSglr5nL6bF4ILGxvX
	 XPssyf3HRHcqCnCb4/JETtZx3Aw8RDVy24NflD+MW1DX0UWMYKpvyr7N3dI8ZQfhMGnSW
	 jrAQl6npS25dYMP4sk/Q8BYNHAhpyAaRCb/AwDOcVRZnJv0A8rJ+IoQa60aBUCBxt26u7
	 VyXAhdocTk6yVz8gJgH0zJvXfP8l64tXjgolxTq9eivbTDNwtI8AHDjLN9hxq373QwZW2
	 yGC4G49KSK1VckJB9WZ6l9WfKc+jUNTmqvaBh8ZjLs+PsYedeN62ObePaZ0hU5t3Ymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360101;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vn+1VmYhBBdJfereCP6tHTG+RC3081IsvhsQCT8Kt+Y=;
	b=WPJEDgPBTWFC9ieC3KpEBsSYGQ+/SNhH0CxOfz/5loZVCZPQpOvQiOJCt4Q6aLusbxGy
	 KmFp2YQf51Puvjr4uCelOczAi9yo0AWoL/UU1CWkWqODWwRv6qeW1Z6Jyl5vodYwfBgsH
	 Z+oiPbQMiUBCAYjC+Pii5jNsNCdqlwku398+ddxnbxULZd/nzmMJV7OhbmbW1zKeG5Ud2
	 xvTVy9jHaE97OFwrx0rRgSXwa7OMLfD2G8GjiAG0UVSq9jckPygwGPhOr5hEuEps4Kb8F
	 jl/xBo1Pru+UaK/XDcjjQ2HZyHOnkAq/fdiaWSYa3ptYrOUa8Kk3O8yUkgL7VdPPQ6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="HjvpF/Wy";
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BBC606A325
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BBC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HjvpF/Wy
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794360091; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=vn+1VmYhBBdJfereCP6tHTG+RC3081IsvhsQCT8Kt+Y=;
	b=HjvpF/WyPfUS3UVl9QU2clBCH+m0qDoYCjvZs/5qIN9mTmZioaRVVDfPF+D/+q71k50TywWFYvdGxtXlRfGq8bHWyIsUfjl8YMNOIIvPWFdd5hbzqsQ+r4kc0v76CEakJSTcdFxqdqa0vjH6B58HJpLamvup1aW/nhq+q2R10VI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0XEX7K6x_1794360090;
Received: from 30.221.145.127(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEX7K6x_1794360090 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 09:21:31 +0800
Message-ID: <462d5470-7d1f-43a0-93a0-6de964169fc2@linux.alibaba.com>
Date: Wed, 11 Nov 2026 09:21:30 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: fix lockdep class of newly created directories
To: Shuai Liu <847807867@qq.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com,
 a.p.zijlstra@chello.nl,
 syzbot+c73ff6790f3d6c635abc@syzkaller.appspotmail.com,
 ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <6a791c94.01d0871a.3a0d52.009a.GAE@google.com>
 <tencent_DEBEB3490E975A2C62C2D7DD573A9A254F05@qq.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <tencent_DEBEB3490E975A2C62C2D7DD573A9A254F05@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/26 9:45 AM, Shuai Liu wrote:
> Directories and regular files use different lockdep classes for
> i_rwsem (i_mutex_dir_key vs i_mutex_key) so that lockdep can verify
> the documented locking order "parent[2] -> child -> normal" without
> spurious class-level cycles: e.g. cross-directory rename takes
> I_MUTEX_CHILD on the source directory followed by an unclassed
> I_MUTEX_NORMAL on the target inode, while other paths take
> I_MUTEX_NORMAL on a file before touching a child-class inode.
> 
> Since commit 14358e6ddaed ("lockdep: annotate dir vs file i_mutex"),
> this split is applied in unlock_new_inode(), which relies on the
> inode being created with I_NEW set.  ocfs2 creates inodes through
> new_inode() (no I_NEW) and instantiates them with a plain
> d_instantiate(), so lockdep_annotate_inode_mutex_key() never runs on
> this path.  Every directory created after mount therefore keeps the
> plain i_mutex_key class for its whole lifetime, breaking the
> dir/file class separation that the VFS locking order relies on.
> 
> With such a directory the class-level chain
> 
>   i_mutex_key/I_MUTEX_NORMAL -> i_mutex_key/I_MUTEX_CHILD
> 
> recorded by the reflink path (ocfs2_vfs_reflink() locks the source
> inode, then __ocfs2_reflink() takes I_MUTEX_CHILD on the orphan
> inode) collides with the chain
> 
>   i_mutex_key/I_MUTEX_CHILD -> i_mutex_key
> 
> recorded by vfs_rename() when renaming a directory onto an existing
> file, and lockdep reports a "possible deadlock in vfs_rename":
> 
>   syz-executor105/5623 is trying to acquire lock:
>   ffff8880767009a0 (&sb->s_type->i_mutex_key#18){+.+.}-{4:4}, at: vfs_rename+0x6e3
>   but task is already holding lock:
>   ffff8880764ff9a0 (&sb->s_type->i_mutex_key#18/2){+.+.}-{4:4}, at: vfs_rename+0x64d
> 
>   Chain exists of:
>     &sb->s_type->i_mutex_key#18 --> &oi->ip_alloc_sem --> &sb->s_type->i_mutex_key#18/2
> 
> Fix it by calling lockdep_annotate_inode_mutex_key() in
> ocfs2_get_init_inode() right after the final mode is established,
> before the inode can be found or locked by anyone else.  This is the
> same treatment shmem got (commit b45d71fb89ab8adf, "mm: shmem.c:
> Correctly annotate new inodes for lockdep"), following the hugetlbfs
> pattern of annotating right after new inode creation.  Freshly
> created ocfs2 directories are now properly separated from files in
> lockdep and the rename vs reflink cycle disappears.
> 
> The C reproducer from syzbot (mount ocfs2 image, OCFS2_IOC_REFLINK,
> mkdir two directories, rename a directory onto the reflinked file)
> hits the lockdep warning on every run without the fix and runs
> cleanly with it.
> 
> Reported-by: syzbot+c73ff6790f3d6c635abc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c73ff6790f3d6c635abc
> Fixes: 14358e6ddaed ("lockdep: annotate dir vs file i_mutex")
> Signed-off-by: Shuai Liu <847807867@qq.com>

Looks fine.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/ocfs2/namei.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/ocfs2/namei.c b/fs/ocfs2/namei.c
> index d8759605786c4..f3ec348eb709d 100644
> --- a/fs/ocfs2/namei.c
> +++ b/fs/ocfs2/namei.c
> @@ -203,6 +203,13 @@ static struct inode *ocfs2_get_init_inode(struct inode *dir, umode_t mode)
>  		set_nlink(inode, 2);
>  	mode = mode_strip_sgid(&nop_mnt_idmap, dir, mode);
>  	inode_init_owner(&nop_mnt_idmap, inode, dir, mode);
> +	/*
> +	 * This inode never goes through unlock_new_inode() (there is no
> +	 * I_NEW state on this path), so the directory vs file lockdep
> +	 * class split for i_rwsem has to be done here, before the inode
> +	 * becomes visible to anybody else.
> +	 */
> +	lockdep_annotate_inode_mutex_key(inode);
>  	status = dquot_initialize(inode);
>  	if (status) {
>  		iput(inode);

