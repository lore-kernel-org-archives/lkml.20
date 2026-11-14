Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794624621;
	b=Yn+z4QhVmnlloL1h2ncKnBvlWuOmSGiHiFHVeWpbUdxHx2isXARfUD9A9OdStNuCwzKI
	 S8JgCfovgJT5iUXS1Y/sFwEkeSPH2rZLcu1Dm+BL1MMkCPebSFZwAw2g2BJHSatlLkKrT
	 7hVR0wiljaFHkpM5f3N1k5x/haMlNFHuvciIP/kJj6Ws1m0EGQ/K3CymbQr6RTWeuEpa1
	 8FmhrOCYJ8U/8pXopziVW1YEdk0EodvhbFq9sPmlQAItCD5QX3JIDesP3ac/vGEPEKGP/
	 wBgb/QljusSdl+3ybvhRJomhgMwocKOaesiNGG4b6bt/5kxTl9ZFvquWqzQ/xJ/T+jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794624621;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=ZX3hv8Xu6gI8ftkTSINp/a2fIZMdPBfuTiZKelaDOTc=;
	b=Xe7fVStGjG5/oQyYJsof6PvMc62t7nIUjsHjneTs1jV0heqa8UjK61KVv+HQSFEShcGV
	 438hnCBih3l+pTY/L+vgjLw2kW+s7aO5JNTcKbVwNJ4koDosUKV7ynIJFFgtWO5kwGw3b
	 AkSGr87fZ+r7nHnc9zIUcdj/8jL7lSNpdiBwlbT9hDhuEtUdk4xdOy0DccGKx221WKXrt
	 dSauqCSPgM9iaoe3mcZ+C7XZyxtx1pG2iu9V6CCp58oO/mai1VpF79642giTRQL9BxdwD
	 /O8Pi3yywBfqOk1oC1j2IXQ3uZIqGwBSF4FbAGtEK7pptjcQtZRO3YiRrwq9fJa4DzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39067606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39067606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dc57e2a3f2so2368353b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794624620; x=1795229420;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZX3hv8Xu6gI8ftkTSINp/a2fIZMdPBfuTiZKelaDOTc=;
        b=pjqDh9oFR8Oqm16TCw0VTvGf/yiZay3ZohaHgi4nBu9Dta0Km+aYAHC4To7FjaiA9W
         MRun2V2xyf9gJiSn9xp0ERzP5fn9kO9ST4uSFL5wGMu+5t4bLNcSS7KPJ1F8ZRonUMpM
         /YNcxULLezfNgcytm8NHlw0Vi9s8yJ7PBPtU3pMwIWoi6a0IL+fpmWTc7XmrUYBbowbd
         6bvHdAIjOjnfb8p5UKQXElz4aOWzb09MiOBe+whfh+HLxLZCElL7tRAquqjbBDZrkPA7
         AfzuzKBqwtutEjxl3O2ySBz//PZOVvGENiwqekuS3FGV7YSwIakTIV5HlUFRFzXocoaJ
         7CfQ==
X-Forwarded-Encrypted: i=1; AL+hErFkbebACcupe+SXN23k+g8OdKGT5AXr4Q2QqFTtIpvJVI5m2yu8k2EDNid/BDDPlgXhoe0ISV5hcQD5Hos=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yLrwfA+EjVFY+oc3vKmnKd8vsXJtpa74MN22JORxhVtNh1/QZ
	d127+IASsgk7BsIT0L+hvjHb934oszSGoGvgZeUGmcZRSSduadRn20UY3o3IgyJRnakJCHEF8eU
	7qXS/bCk483KtsSZ8nTr+FEFrz1iTJuPUOO2sWPX033QHywFGm6/cFUNWbxw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14ca:b0:4ef:e154:41fb with SMTP id
 5614622812f47-56e6017f5a3mr4250556b6e.1.1794624620222; Fri, 13 Nov 2026
 18:50:20 -0800 (PST)
Date: Fri, 13 Nov 2026 18:50:20 -0800
In-Reply-To: <20261114025011.50334-1-izaacchong934@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af7cc6c.44894aba.3b5a79.0605.GAE@google.com>
Subject: Re: [PATCH] configfs: fix use-after-free of default group in configfs_symlink()
From: syzbot <syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com>
To: izaacchong934@gmail.com
Cc: izaacchong934@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> configfs_symlink() drops the parent directory's inode lock while it
> resolves the link target, and keeps a reference to parent_item across
> that window. When the parent is a default group, such as
> ports/<n>/subsystems/ in the NVMe target, parent_item is embedded in
> the containing object (struct nvmet_port). A reference on the embedded
> item does not keep the containing object alive, so a concurrent rmdir of
> the port can free it. allow_link() and the final config_item_put() then
> touch freed memory:
>
>   BUG: KASAN: slab-use-after-free in nvmet_port_subsys_allow_link+0x41/0x2e0
>   Call Trace:
>    nvmet_port_subsys_allow_link+0x41/0x2e0 drivers/nvme/target/configfs.c:1059
>    configfs_symlink+0x59a/0x1030 fs/configfs/symlink.c:196
>    vfs_symlink+0x18b/0x330 fs/namei.c:5794
>
> detach_groups() marks a default group's directory S_DEAD while holding
> that directory's inode lock, before the containing object can be freed.
> So drop the parent_item reference before unlocking dir, and after
> re-taking the lock return -ENOENT if dir is dead. Otherwise look
> parent_item up again, which is safe while dir is locked and alive.
>
> Fixes: 351e5d869e5a ("configfs: fix a deadlock in configfs_symlink()")
> Reported-by: syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b0996ac2197dd7420c3e
> Cc: linux-nvme@lists.infradead.org
> Signed-off-by: Izaac Chong <izaacchong934@gmail.com>
> ---
>  fs/configfs/symlink.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
> index 89178f5d371a..1b2c9048a920 100644
> --- a/fs/configfs/symlink.c
> +++ b/fs/configfs/symlink.c
> @@ -166,11 +166,11 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
>  
>  	parent_item = configfs_get_config_item(dentry->d_parent);
>  	type = parent_item->ci_type;
> +	config_item_put(parent_item);
>  
> -	ret = -EPERM;
>  	if (!type || !type->ct_item_ops ||
>  	    !type->ct_item_ops->allow_link)
> -		goto out_put;
> +		return -EPERM;
>  
>  	/*
>  	 * This is really sick.  What they wanted was a hybrid of
> @@ -200,7 +200,20 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
>  	ret = get_target(symname, &target_item, &target_sd, dentry->d_sb);
>  	inode_lock(dir);
>  	if (ret)
> -		goto out_put;
> +		return ret;
> +
> +	/*
> +	 * parent_item may be a default group embedded in an object that a
> +	 * concurrent rmdir freed while dir was unlocked, so we dropped our
> +	 * reference above.  detach_groups() marks dir S_DEAD under its inode
> +	 * lock before the containing object can go away, so it is safe to
> +	 * look parent_item up again only if dir is still alive.
> +	 */
> +	if (IS_DEADDIR(dir)) {
> +		ret = -ENOENT;
> +		goto out_put_target;
> +	}
> +	parent_item = configfs_get_config_item(dentry->d_parent);
>  
>  	if (dentry->d_inode || d_unhashed(dentry))
>  		ret = -EEXIST;
> @@ -218,11 +231,10 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
>  						     target_item);
>  	}
>  
> +	config_item_put(parent_item);
> +out_put_target:
>  	configfs_put(target_sd);
>  	config_item_put(target_item);
> -
> -out_put:
> -	config_item_put(parent_item);
>  	return ret;
>  }
>  
> -- 
> 2.39.2 (Apple Git-143)
>
