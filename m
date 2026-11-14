Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622093;
	b=3c6y4jvEeZBpdJ6bhh4NrD+TmvmLkFIyRxUxt6vngukyNIWWoX0/kUEojqRYqtiZ+IN9
	 8MNLkFAo0LFMeKrEYCCU85BQ3qPnx3wPzzN7Ahf2hFoypd+sDBce2yFavMtnrpmwi3UdP
	 myNIYCduzOknGoIKNxYLkNQ6J9UjM905/qw3/PQVVcuWlIStL86Zs376sVSEk26iHv1M2
	 6UtWj4kj/8pDFxmTz+UDucdKpeVTcHpWMHizdkVzbW0maydJbG8gvY4bOursd8ZkRwUsC
	 phzLCQknTwoRr4PS9tWUASi8fV+gizNdSleLwQM7r1jZiWod056B8izicDUTcvjFYQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622093;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=ZX3hv8Xu6gI8ftkTSINp/a2fIZMdPBfuTiZKelaDOTc=;
	b=iGYlS2sSgb03iZ5Ov9wi7pDE1pClHeuX7n+j1ULjyYzq2XounxArKL6630qJwwDfsgCv
	 PO+CRkB8S+pP7zbKgutKf84FmJHVzl7SzeVR2nIjgx927RnDgjhwsEZu6ODeuuy8RP4cX
	 Lucl04kD1gUYK/EX1Eo5sc2VM657DB4qHKFxJj4GdChBqpH1YuLD3ILoD0amgBXMBDQPQ
	 mZM7B4KIwTKatQtYxZdD/QiG9K/cr5PnUTmfgmbXN2fFyEXZiEoVnHJbpYPyMietn0qi4
	 q8aGDAB5v8s5/Pk3KRAniFMB0bs4TyQeN4k/lt0XoQb8GPEJCyvnCDJv+GdYGykRSJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23587606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23587606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so2793249b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622092; x=1795226892;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZX3hv8Xu6gI8ftkTSINp/a2fIZMdPBfuTiZKelaDOTc=;
        b=Md4Ol96QTjZd4hzx6wftRuSvY2eeajJE/Ksix3SZtaIujT4Q/DhuVG0GjW1/Zktvli
         XhTb5dreKxXkoTpAVd8tvSfb921R+NPWzLizxuVCBVzGyENvTA1wjmDAwzTsJdwe0IMn
         o/ap94mOxcfF1it5Swa1g4RigEkYM08/KFaOjL4fRZWiNU88zQAJzcizHLNSk7963Sb5
         cBUrDs9CrfRha4wQdyuaMHJthK58f/OGTWjYurSqGbTOpIGkfK1AWBg1vz0qrgjcKEj0
         JTsbAGfPxl0v6+Y3Ro47jgg/zw5xbv8u9HrCa3LAwdgBpX6xS1kVXdJk/I6AXG8z0lfj
         vgHQ==
X-Forwarded-Encrypted: i=1; AL+hErHJbUlno5a249yUEgu6Dxfp/gphUfJudbMNRUM0lVYhJdO4J9al6hzztuZN2RaIYvKSKBV7UzsAyq038BU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YAOkCxpVKQORc6OzRKUG160afLUiVtDt61uYU35GiHBvlmRad
	vzrhvViQ1IE4QADf1Id+ic1/yrNgyC/tjLhF+yxAiAU1gJQ/2cBEczsA6XSbdbTAt0FmVj9dvOH
	T+BNGPZWZE3R/u4G7qS4E0c1h628hw6i8vkLB0+jVCOKs+klwY1cUCY+tWmw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1590:b0:4b9:e65b:8c36 with SMTP id
 5614622812f47-56e648eb2b4mr3859324b6e.36.1794622092112; Fri, 13 Nov 2026
 18:08:12 -0800 (PST)
Date: Fri, 13 Nov 2026 18:08:12 -0800
In-Reply-To: <20261114020731.49877-1-izaacchong934@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af7c28c.0a97acdb.ae7e9.000b.GAE@google.com>
Subject: Re: [PATCH] configfs: fix use-after-free of default group in configfs_symlink()
From: syzbot <syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com>
To: izaacchong934@gmail.com
Cc: izaacchong934@gmail.com, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
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
