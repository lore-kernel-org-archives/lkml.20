Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF71824BBEE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377700; cv=none; b=C78wySZA4iQe5IxbZg0Q2XysldB1FC5E27b4NEW2gXZsb1xZhk9zi021HMZTmQlylUgFsH7yjab7v/vjPJH0ln2Fk6Q8MA0+FVtIVhQh0t7d6ezTEGkNlSimPo1rx59MmPV67lbEPMrXByY8APKqiWgKTsAqvCMIZyIQLZyXFng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377700; c=relaxed/simple;
	bh=7XijPLwz3cHBxl1YFk+E8vu/tL68tteh4h0gxiMHTNc=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=CtTekuQauSGfO5TFu2XOqyu/V2x5l1ouBgAb1oW8NLIuOdfBEybHnlsztC/Hylc1I5EXQ0HB7tg8iPovgoFG7xtMgX/YGw3yB57I0UQzBoJzmIyOK/qEIR9WQ+juMtVlrQpwhYfEUCugDJzBhhNy6xKsebGGC9sjMoZVSSbfy/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=apaOjh7d; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="apaOjh7d"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90f9f8553e0so11338836d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788377690; x=1788982490; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIdNMxFvwqrPz4tpIyv6StSQNKP9oc9jkPpYrkixADU=;
        b=apaOjh7dQp74WY42ZKX1LucplV5mZwhakPtY5Jg2eXD4fZ3oEZRJXmKGzxoPFjE+Sd
         TFfutb20vFTVAwcF8aFfemNt+nNl2YigcQV+qQOzgrBZCsRMIjQAuCsL06AIQQPDPill
         MkUKXuR5tuMo6l8FA//nAL1Tj/XGhR8GdhHCcbs6J/tW84CM/8/sKhSrjkWKYzLVip42
         ZvhxgG8RAlyP+XVemMTyp9hSCSvPOSZ6O099hPlHoH9oipeJfJ8CrCyHgbhmgS30owwF
         HV1aWHhUJ3mUY881jnB4aQkdPvbZn9vSbvoRWmIqm1/impT4Vj7OvR0gzwrjwAj+PxTq
         nR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377691; x=1788982491;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIdNMxFvwqrPz4tpIyv6StSQNKP9oc9jkPpYrkixADU=;
        b=hyxY5jlODFGfYx6EEC3wRNEaAW1SJlJU3G0EuF36Z9J+5CyOy2QxpvPgLOz8zhWOlR
         JR5qZ1TiLsRyCvhsDUTVnc+nH6y3BqzcwLHYdpW9PHWskWv48M/B7BBgaeb06i9klVFt
         eY2cinrBeDZGJEZS/kL4kk6C2ATvLV4iQp80cbD8Ad/X1EPS8GfScnuVC/LPkJxBqYzn
         NAp6snebc5cLbTVJ7XLjgfbBOHocUcJ2TIlZMWBI5az5cT7i9cD1+Ap/z1q0RD5M3mWU
         kBFc6QWYs7VqqamE4RzhhO3trReXl1skpayHDP9OT5ga+aw5HUfumuyn+OfV26Bh0Y0Y
         BExg==
X-Forwarded-Encrypted: i=1; AKwUvBx39VC30pJlA8W/qUfuLHPEfWKjjJOWSe+uGV8ydttm0kswg6fm4Y+tPbTPUufYelzxob8hgMom2UxkAhY=@vger.kernel.org
X-Gm-Message-State: AFuF++mNNGRzRVmO3XUr62Vtq0LjVtzNpRyUyHALmkOek689/VDe433j
	I0TZCswJ6rp5ztXLgMXbBkL2pBUsnu4gh0fuMR3jq76r0SojMreycYXL9xcsyAhy1w==
X-Gm-Gg: AYBFou2ND4wMs/k6hxmnqXN2TWk4LT4felOiDAPFrb/yLQMJLay5gK+Zac3JTZBsM7Q
	IdbQZ9qWGaJ2r/qkH+L4Wk9i8CuEbvHs8IO1b5WBfNKX570QJLfgCThV4it7BZOo0b4Sza1vdVo
	gqMcorYb91ehe9jIKBP0gq8ELx7nCTE4Wr82ClWbkSa4jZnRlrGm3Opp9dxzqg6Z6KoNg2XSVXz
	uLfV9zPIUsoMdZ7Mf+Go0VRnx+v2AMJNDOFbKshB62rfm2MdOD5Gi6LedPX8ru2wJpmcXbDU1cr
	p0doZ22YUMsj0SeVqjT4G4/lC2Zus5ahwB49MsU4b0128gNI3R3uIGfLhzfa8tqiJqHXJ29PwPq
	ylNT+VoO7vVWw/ocWYlktXvzXD0N/Xpl10Comw6tNoXNXeQn2qKcUAHH+okQNWXNuk8GptENTaQ
	faAZRr3xsZzbGTK3wUWnB9aKKeFN/Xuao50U6E7ikI9AnMygqo4wk66jEyHcqASPAJ7Jy30EV8v
	U3QyFtO1jEh+40hET4o4ks5tzYHIMMmjg==
X-Received: by 2002:a05:6214:4601:b0:8f0:3b2c:a9c8 with SMTP id 6a1803df08f44-90e9f25c224mr108760886d6.12.1788377690538;
        Wed, 02 Sep 2026 12:34:50 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ef0f57fsm25004716d6.47.2026.09.02.12.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:49 -0700 (PDT)
Date: Wed, 02 Sep 2026 15:34:49 -0400
Message-ID: <f12155b3bc5ca8d846bf822b35f6b857@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260902_1319/pstg-lib:20260901_1604/pstg-pwork:20260902_1319
From: Paul Moore <paul@paul-moore.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Seth Forshee <sforshee@kernel.org>, linux-security-module@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH 13/27] fs: port xattr to const mnt_idmap
References: <20260901-work-idmap-const-v1-13-54ccd48e100b@kernel.org>
In-Reply-To: <20260901-work-idmap-const-v1-13-54ccd48e100b@kernel.org>

On Sep  1, 2026 Christian Brauner <brauner@kernel.org> wrote:
> 
> Convert to const struct mnt_idmap.
> 
> A mount's idmapping is immutable. The only thing that is allowed to be
> modified afterwards is the reference count and that is hidden behind
> mnt_idmap_get() and mnt_idmap_put(). Everything else only ever reads
> from the idmapping. This is the same model that struct cred uses and the
> idmapping is also rather sensitive.
> 
> So make the idmap argument const wherever we can. The conversion is done
> from the bottom up so callers can continue to pass a non-const pointer
> to a const parameter until the conversion is finished.
> 
> No functional changes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> ---
>  Documentation/filesystems/locking.rst |  2 +-
>  fs/9p/xattr.c                         |  2 +-
>  fs/afs/xattr.c                        |  4 ++--
>  fs/attr.c                             |  2 +-
>  fs/btrfs/xattr.c                      |  6 +++---
>  fs/ceph/xattr.c                       |  2 +-
>  fs/ecryptfs/inode.c                   |  2 +-
>  fs/ext2/xattr_security.c              |  2 +-
>  fs/ext2/xattr_trusted.c               |  2 +-
>  fs/ext2/xattr_user.c                  |  2 +-
>  fs/ext4/xattr_hurd.c                  |  2 +-
>  fs/ext4/xattr_security.c              |  2 +-
>  fs/ext4/xattr_trusted.c               |  2 +-
>  fs/ext4/xattr_user.c                  |  2 +-
>  fs/f2fs/xattr.c                       |  4 ++--
>  fs/fuse/dir.c                         |  2 +-
>  fs/fuse/fuse_i.h                      |  2 +-
>  fs/fuse/xattr.c                       |  2 +-
>  fs/gfs2/xattr.c                       |  2 +-
>  fs/hfs/attr.c                         |  2 +-
>  fs/hfsplus/xattr.c                    |  2 +-
>  fs/hfsplus/xattr_security.c           |  2 +-
>  fs/hfsplus/xattr_trusted.c            |  2 +-
>  fs/hfsplus/xattr_user.c               |  2 +-
>  fs/jffs2/security.c                   |  2 +-
>  fs/jffs2/xattr_trusted.c              |  2 +-
>  fs/jffs2/xattr_user.c                 |  2 +-
>  fs/jfs/xattr.c                        |  4 ++--
>  fs/kernfs/inode.c                     |  4 ++--
>  fs/nfs/nfs4proc.c                     | 10 +++++-----
>  fs/ntfs/ea.c                          |  2 +-
>  fs/ntfs3/xattr.c                      |  2 +-
>  fs/ocfs2/xattr.c                      |  6 +++---
>  fs/orangefs/xattr.c                   |  2 +-
>  fs/overlayfs/xattrs.c                 |  4 ++--
>  fs/pidfs.c                            |  2 +-
>  fs/smb/client/xattr.c                 |  2 +-
>  fs/smb/server/vfs.c                   | 24 ++++++++++++------------
>  fs/smb/server/vfs.h                   | 20 ++++++++++----------
>  fs/ubifs/xattr.c                      |  2 +-
>  fs/xattr.c                            | 22 +++++++++++-----------
>  fs/xfs/xfs_iops.c                     |  2 +-
>  fs/xfs/xfs_xattr.c                    |  2 +-
>  include/linux/capability.h            |  4 ++--
>  include/linux/fs.h                    |  2 +-
>  include/linux/lsm_hook_defs.h         |  8 ++++----
>  include/linux/security.h              | 20 ++++++++++----------
>  include/linux/xattr.h                 | 20 ++++++++++----------
>  kernel/bpf/inode.c                    |  2 +-
>  mm/shmem.c                            |  2 +-
>  net/socket.c                          |  4 ++--
>  security/commoncap.c                  |  8 ++++----
>  security/integrity/evm/evm_main.c     |  4 ++--
>  security/integrity/ima/ima_appraise.c |  4 ++--
>  security/security.c                   |  8 ++++----
>  security/selinux/hooks.c              |  6 +++---
>  security/smack/smack_lsm.c            |  6 +++---
>  57 files changed, 135 insertions(+), 135 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com> (LSM, SELinux)

--
paul-moore.com
