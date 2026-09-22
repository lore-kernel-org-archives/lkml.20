Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B8543CE4F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085937; cv=pass; b=se5d4jEAbVpec0NxHuG6FqtUNZPCfCFk6ZC3FBF1RozhgaGBtUIuSw1scmx+xggHuYUZ5agb889f91PE8mdVzbkdYPMAMXnWdXtanRwxyw/SV6Mx7h5Xm77xl0CQ0+jM6tUMYejhOiMWVCwTRg9aGaB7Fw8653rqN3QPnwesdwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085937; c=relaxed/simple;
	bh=Ay5NjTz63OiCiHZ7ALzt+lcJMCr4C+fqEYLzWAvlTPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ow+oLdvHHsHuvkYP+H9L0EgBkPiMYEghgSGZ/xBBfTdxislrjtzDWq+uy77Qr4xq5EUMmqTowkZdZFu7JsfIjUP4sgSRq/StrEcKkNnLKKUGLbe3u5AuXBV64DmosfKOVEqXQ42j+HxioG5fV5KKYc63a6sDXlUMyLwmHPgC3dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=It34vOS8; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="It34vOS8"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so2043601f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790085934; cv=none;
        d=google.com; s=arc-20260327;
        b=Ct5BY3OTJZa06Y3xE1Fuut15W9NZqeE52a2phwkfPWT5C/6ap/Lne0OD/XLhHw99UK
         uHfXpt4NH7cD7cto+2I5zn221ZuC2LRqG0yd+TfM3W2iI1Xo/C6+mfWS8I8Zn6ZWHyDf
         lA40guyMgz9+mqufCbl7kt7mRvcDa/h2wFDbw1eAAZziE5IQ+3HPBEWMA9URLUUo3kTT
         ybUag6NfEedPmyedVdxVHOEl1W/lx/RO21hmxiToilnSNtQiQkJNn4myzzognqmYnBJ6
         a/oE+oRTIAcgSO1MbGFAd1IUW10T0A4yw9BTiOXL9QgifSy2QOy7XK2DmjN2y9M+wfTI
         p//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6YS2AxBcCq9ZhMi42e6qWSeGTCX4XCRef+vl2kw8gyg=;
        fh=K1gtFjIhoM7rBsRXiLh8JZuAajrFOBzHbPzr51cCsQM=;
        b=M6MHVAlDO2tXmXwBXP9hFymYF+HtuM26QDz2NJSfsq1oKv+skVEzqcy5tMgjyk3HLo
         g1s0XEyD24gFg6gSKaK2/h7UGUipF7tjenDLKEvqXKvSuSqaY3Tgpn5S5KY/J3Lu4RUn
         6k9gqiYxCHLyVrTeRr/zaJFMzX+vxZvixgNcvnyjYHhRt1AKaxQzWjqPMrZBdWFO6POh
         ZT3nyNYFaJ0z1VC9PVZrug4pVmepZCnkMC2E3gh1hMilZ0MO+ulqmAnFGxNVGb+O0HyA
         driniogSVI+htugXAHz7d1fphAz+/p5TGChnLHgSqr+fQMRz74SbSyD236UiCDlz0ibm
         GWzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790085934; x=1790690734; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YS2AxBcCq9ZhMi42e6qWSeGTCX4XCRef+vl2kw8gyg=;
        b=It34vOS8sUSb96CZ88ohJ7YHGY3ycuWEwg8dqvOZUvCFuYqztFt5TZ1DCFgwxQHyGh
         CEc/A06jCixtwMIhOu2JmVnw77yYJBi57m4ovFQHMvxZLomGf0+6/9G3uDF+fmk4CAmL
         3jGIYPDTXXXu+RmKo/edM+Bd/OAxjjgvH5VWPQQf/++/hpBu3W+KgP5DS7gNlPnsDgvJ
         CjAmNYrYTnlE0qDpqbpzji6TzpPacEbI0ugFuwDuPfPRpCuscoQnr4Nb+BODmAzapyPd
         Fwqv7QBanNNIiCmjxvSssudzUGg7vC7fTuVQBcocAQtdODsoDxxrHS/mSCmzzGZS1DZY
         z9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085934; x=1790690734;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YS2AxBcCq9ZhMi42e6qWSeGTCX4XCRef+vl2kw8gyg=;
        b=sQTyEfydZ36MPiPY3gE5Le9IrqNp5Dc6MNSNYWlMzkhvWKP1BWMsKS3HHVPCew1T3W
         7HQmnIsivFVubRru940UVALm5MHeOQ+jYCAkZZls8PMODdutCtNhrxO3TXA1fk+k2irS
         mdzLDNLEpOpmRzi3w86bBZkum4K2kmhaX4Ee7nZNole627UqNSrQD7e0LzO61R3PNSH4
         wFggiNT2LD/vEx15X7jqiMcBlb3qxxChYNxgJG/eXNwYPU1z3g+FyVb47CZ85jH0NFq/
         SvOUNHG8F5eFcxQ/8gyvQvyPJACTTIK4UOCRacXYU/oPsc9ny6pJySJEmFRPhfsyWgyI
         d6Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwT/rMZ7yIYVPS1Vg55s7BGZm0uo+Zkbp/Aq3rsz/gdEsGVHov9G/rw9z7qg7VzOXvvT2o34GCzf/AxrAU=@vger.kernel.org
X-Gm-Message-State: AFuF++mRc7ZGJfGFpLDWWfBY4VFzXlVvxPIXQnHyd+8XHh5Jq/N2Y1IT
	WMhNTxcP1O/H57Q9nzY4JmkntOunSBdol/xxZXP6qNS0O7aG5yqwJOWIE0oczv55k/dZ2vE8LRi
	t/PypFynK2X5YBa+pRLsrPkEUo+repqxKSerzZ5VyB03me8QXWzxqUuw=
X-Gm-Gg: AYBFou33DO0EG32M0aUaZUObXV+yi8g7X9sIgn+NylMAYqe3ZLiyQ4ZN+ZlSnBvWVT6
	JdRT/D+OnBTEm/sq/Px2s3/A/2lHW5B/7SdxM2HmSvGpOm/m2WNqld6fcfcI1UdrhT6mOD93DC2
	PFotq+3UZMhRaVrJdPcwkFvLT/nEDpAD3qZDFXCF+CttJ1d8l1bCHIj/4SJHf0uZDegmZxMOsQ9
	jK/Mb7gIRXhzqoJTnmpYHD4TqLR88RDWrN/STCK9b+c2lx+fTUxg7tm2qYmKhCjDKvD9YZyVENu
	a2U/2z/BzWQepUE7KWjFQQVFQuoao/o2JyE2AJmW4cq8Df4VmvziwnVURNMhVu7hqgRt2qMzxfA
	Eq+XLurqxy3nyFKNBEFj76mv0jPj/UV2jyCG6/76oRPFIlkLcXSsn
X-Received: by 2002:a05:600c:83cd:b0:49c:c0d4:53d9 with SMTP id
 5b1f17b1804b1-49fc56f7a11mr167442875e9.14.1790085933488; Tue, 22 Sep 2026
 07:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513085340.3673127-1-neelx@suse.com> <20260513085340.3673127-13-neelx@suse.com>
 <20260602032710.GI2295@sol>
In-Reply-To: <20260602032710.GI2295@sol>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 22 Sep 2026 16:05:22 +0200
X-Gm-Features: AclHuK9W2Pxjl3KwkDzeI2ubrLmu06MdbRUN3yT63V6ZnZJwdsBl8QwyQ-GSdxM
Message-ID: <CAPjX3Ffd8uiaOaOkwyATq_NtCf-Jx5+Q3Q+y-PH+3XhC+GBvgQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/43] btrfs: add new FEATURE_INCOMPAT_ENCRYPT flag
To: Eric Biggers <ebiggers@kernel.org>
Cc: Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>, 
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 05:28, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, May 13, 2026 at 10:52:46AM +0200, Daniel Vacek wrote:
> > From: Omar Sandoval <osandov@osandov.com>
> >
> > As encrypted files will be incompatible with older filesystem versions,
> > new filesystems should be created with an incompat flag for fscrypt,
> > which will gate access to the encryption ioctls.
> >
> > Signed-off-by: Omar Sandoval <osandov@osandov.com>
> > Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > Signed-off-by: Daniel Vacek <neelx@suse.com>
> > ---
> >
> > v5: https://lore.kernel.org/linux-btrfs/ccbea52046c1dadbbef926bfc878cc23af952729.1706116485.git.josef@toxicpanda.com/
> >  * No changes since.
> > ---
> >  fs/btrfs/fs.h              | 3 ++-
> >  fs/btrfs/super.c           | 5 +++++
> >  fs/btrfs/sysfs.c           | 6 ++++++
> >  include/uapi/linux/btrfs.h | 1 +
> >  4 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/btrfs/fs.h b/fs/btrfs/fs.h
> > index a4758d94b32e..dbdb73722c14 100644
> > --- a/fs/btrfs/fs.h
> > +++ b/fs/btrfs/fs.h
> > @@ -322,7 +322,8 @@ enum {
> >       (BTRFS_FEATURE_INCOMPAT_SUPP_STABLE |   \
> >        BTRFS_FEATURE_INCOMPAT_RAID_STRIPE_TREE | \
> >        BTRFS_FEATURE_INCOMPAT_EXTENT_TREE_V2 | \
> > -      BTRFS_FEATURE_INCOMPAT_REMAP_TREE)
> > +      BTRFS_FEATURE_INCOMPAT_REMAP_TREE |    \
> > +      BTRFS_FEATURE_INCOMPAT_ENCRYPT)
> >
> >  #else
> >
> > diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
> > index efaa0788c1fc..84df97363611 100644
> > --- a/fs/btrfs/super.c
> > +++ b/fs/btrfs/super.c
> > @@ -2563,6 +2563,11 @@ static int __init btrfs_print_mod_info(void)
> >                       ", fsverity=yes"
> >  #else
> >                       ", fsverity=no"
> > +#endif
> > +#ifdef CONFIG_FS_ENCRYPTION
> > +                     ", fscrypt=yes"
> > +#else
> > +                     ", fscrypt=no"
> >  #endif
> >                       ;
> >
> > diff --git a/fs/btrfs/sysfs.c b/fs/btrfs/sysfs.c
> > index 0d14570c8bc2..3fe57843f902 100644
> > --- a/fs/btrfs/sysfs.c
> > +++ b/fs/btrfs/sysfs.c
> > @@ -305,6 +305,9 @@ BTRFS_FEAT_ATTR_INCOMPAT(remap_tree, REMAP_TREE);
> >  #ifdef CONFIG_FS_VERITY
> >  BTRFS_FEAT_ATTR_COMPAT_RO(verity, VERITY);
> >  #endif
> > +#ifdef CONFIG_FS_ENCRYPTION
> > +BTRFS_FEAT_ATTR_INCOMPAT(encryption, ENCRYPT);
> > +#endif /* CONFIG_FS_ENCRYPTION */
> >
> >  /*
> >   * Features which depend on feature bits and may differ between each fs.
> > @@ -338,6 +341,9 @@ static struct attribute *btrfs_supported_feature_attrs[] = {
> >  #ifdef CONFIG_FS_VERITY
> >       BTRFS_FEAT_ATTR_PTR(verity),
> >  #endif
> > +#ifdef CONFIG_FS_ENCRYPTION
> > +     BTRFS_FEAT_ATTR_PTR(encryption),
> > +#endif /* CONFIG_FS_ENCRYPTION */
> >       NULL
> >  };
> >
> > diff --git a/include/uapi/linux/btrfs.h b/include/uapi/linux/btrfs.h
> > index 9165154a274d..2f6a46e5f4ce 100644
> > --- a/include/uapi/linux/btrfs.h
> > +++ b/include/uapi/linux/btrfs.h
> > @@ -335,6 +335,7 @@ struct btrfs_ioctl_fs_info_args {
> >  #define BTRFS_FEATURE_INCOMPAT_ZONED         (1ULL << 12)
> >  #define BTRFS_FEATURE_INCOMPAT_EXTENT_TREE_V2        (1ULL << 13)
> >  #define BTRFS_FEATURE_INCOMPAT_RAID_STRIPE_TREE      (1ULL << 14)
> > +#define BTRFS_FEATURE_INCOMPAT_ENCRYPT               (1ULL << 15)
> >  #define BTRFS_FEATURE_INCOMPAT_SIMPLE_QUOTA  (1ULL << 16)
> >  #define BTRFS_FEATURE_INCOMPAT_REMAP_TREE    (1ULL << 17)
>
> There seems to be an inconsistency where btrfs's fscrypt support depends
> on CONFIG_BTRFS_EXPERIMENTAL, but the support is advertised in sysfs
> regardless.

That is true. These should also depend on BTRFS_EXPERIMENTAL. Will
amend. Thank you.

--nX

> - Eric
