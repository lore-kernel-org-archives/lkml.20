Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3046B549363
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085966; cv=pass; b=RLgzi84Kik+nSCJVU8obMrDRb5RJQyd2R7QrskXDaoGsuJOuFl2pP0FCtSHZ5h6wult3cxX/cQXG5fGvdV6MoxnSuVAmi7RalyjWQMIAnF3+M/ISX3wkaxyR3ZoF2qNP7ImB/FMSBNn+Oaf5CEPBI4ddfVBYHYHtsMO4lYTlzFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085966; c=relaxed/simple;
	bh=FFDGTIkdjwlrSIKakQdYABzBT/A8PNvRaqDPQjmAe6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIPHTgzICLma7VOnR5pDajOycDp/i2fVdgfKLNe4+DPFvhcj44DB10ll8BvJkxL/dwtU1TgQxOozEKzOG5ktPulqJull/8BN+i4nEEHZ4uOculEgw1Di+xAZQGSemoMtwXVEa9r+jVHpCZG/5exS2Iv8i1ctd3VXOjIaAgg2X1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y2mCWJGM; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y2mCWJGM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso2346465f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790085963; cv=none;
        d=google.com; s=arc-20260327;
        b=iG+Sljpv8e6S8J0KRFouXnOSc8f5CEwjUOpmqP9ND8q6CtuaFBz4DaiugyqdHFXA/D
         TSgwva9CD00HFOv83L1wII38hh+9ir30tpp2ZgHTx5ipTGo1ANVw92jHXNRz36AdFvBK
         1D+rfkWnGRHNoXn9A8kplo20hBEsWjngvg9bC/WZzOh3aiUUfnFQbYMHUucHFae+N7yG
         y+Q3/akoEX/W3pG25XYiHCG4tHSsLOTcyJXlDcyDi+2fC3A8DMyWsvbEJ/kNNkRjDUEZ
         3Hasw3X9E/XmgTpoBvxhks9AmLXZInt8FmD5FWQrH17HvXLKw4uapjiKbiONXIvn2MUg
         Elpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HQ5Sa3kOLjyBVe2SVv4WjG5tA5uHiXwiU9nv/zosuek=;
        fh=lut7uC7i8NW/NUgP02JUJqJTzufIc70OFooJEIQhmW8=;
        b=ZkH8bUp9VYqppSiGRthrMMyz7+3L78VK+nRE6hcK5edgsI1w++eAhMwL1iqGZOM0Ft
         cyO12xoitQeGJlbs0ceAZPS+NrxuIRasvlBFdW2OmQ74vnZFat5jXiSqxdrqrrVZyu4j
         lZG0Gr+gNEhYgTli+0/Sg/yNgDprbdU3mBN8w2ldc7oGrMg234kv1H9BUwHZTrSoMikQ
         qk6zYZcK88+MCghnkjvCSV705/UBHTcSOfJR8yDxusXovjsyenpk+IZuNQ0eFkJtkRuk
         8gx8lS+ZaRpgMbczg7VklPcnGcztqcvCLvekKEDoT3e68QY2RVzDEuim5K5h0Twy9A59
         HbUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790085963; x=1790690763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQ5Sa3kOLjyBVe2SVv4WjG5tA5uHiXwiU9nv/zosuek=;
        b=Y2mCWJGM63FTGl4+yJW4u+r0juwVDCmvwuHvh08vBoh/KHFZxx1mQrlB4lOpzLGQkd
         +PoPDF3QjeFaDtroPLiULmOeE+PQFuJ4pwcUXjRAZ8Kdws5qRDV+RttmHRfXlh4FGt07
         ICZFwgy6nM+mR5fslmAPAZNVCuIheNoI2G3r3svUf9EUJqSgw6sDDiDY/Q3BE3V5/2ut
         whQPnVzaooSi/VV/jgruiDIvINZFSRvpb6BFoiqPw25LpeFLwd2bAqVzG38z6CNMBfds
         wjpVpgyQufgMueHsbd7zyqTl9DOLfgyBul+EvaSMTPh6Ekl9YjstZjQ46O7hJanLyAD0
         e1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085963; x=1790690763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HQ5Sa3kOLjyBVe2SVv4WjG5tA5uHiXwiU9nv/zosuek=;
        b=jRuMIFWTM41haKHvuHjX8zZs+ih6T4yjHbClyukKxOwpzna+m0o64v0Vy5OrU2dm4p
         uK1+hyx2boqvZOU/UoD/o7CZwFt/r1G5hTntvKZTcdhwxPjSsCj+5e9EbSbphD/yWfSN
         FWWZSMpKZerhKyJphRIGn594Rpd0LbwmiDIlc4NkDb+bIhIck/uueXQYtTKyQEqO7rEh
         MHYungLSbmnlgRv7AaEm+UVG2M8Pjg26N18MqgVibk8vmMTG6rAyW9oeUqOw9nlSzftg
         i2ReKl+dnx+QX8RIqa2GUP8NAniIyD2/fCgKRDnvfbFc0LBXBWVGXs/8aYoPvg49kG0g
         Amiw==
X-Forwarded-Encrypted: i=1; AKwUvBzMcuVkWGROMg3UteLuNCpak7dPCN2dnLjLuClhsWIfnnMP5vFFGWNAVCHsqO/4e/b7u514r2Njc5az/q0=@vger.kernel.org
X-Gm-Message-State: AFuF++nC4EGq9KE4YcSyHrHSPgUc/v91PlWE9nvUGhUMz4IyVUxsqYXw
	s8uRwk2R9WE5k8RMEFfUTKLixrXkb1RPW6McC9rMfOX2P6/bMdhQxDXzmV/6gq5NDCBpqh5GMbJ
	sXQjbgVbY6tU7djt69Fa7f6WY9hmSRPLSElY5kLfhlQ==
X-Gm-Gg: AYBFou2e7omQqHBYv3FEdoIJMdWdHsbu80ijKFzjbgUxB8ACTSS3eBamR9dPofiytj/
	uBsLghKPUTHzt+gmT0ASac/z3K5quAM1v6ozotOQPnqotOsvHt/Q5vOKleChZgoNrpD3DRDIN88
	qivEhWEwVC/kEpo/6EPZT7theKudLrr5RSrYkzSOklXsxv/k9dzN5seSK/iROCYUWG0vKatYHJz
	q1osq4WgDfyC+SHAko5kkz72knAjLhaLHRVYbuiyAJmaqKmkNldYey1gwjwOpSZeALtTGkJPuVP
	/drQGk0qPtrkJExCp1VkMy6wXi+dURUlfoyuitqtyCMddiyWnAi172IereUs3d0LVY++/nIdB+H
	0WBW0ay2uANNe49OSz0x+eHSzfechAropXx73ZSY3nAdMFFa9Lr06Igehw/0tkAI0
X-Received: by 2002:a05:6000:2081:b0:487:936:7ce0 with SMTP id
 ffacd0b85a97d-4871e268810mr20353521f8f.28.1790085963456; Tue, 22 Sep 2026
 07:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513085340.3673127-1-neelx@suse.com> <20260513085340.3673127-16-neelx@suse.com>
 <20260602023556.GC2295@sol>
In-Reply-To: <20260602023556.GC2295@sol>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 22 Sep 2026 16:05:51 +0200
X-Gm-Features: AclHuK9CuIsJsfiw8COS456pIsuT7e5VI7VW-i2_tJPdheeuBMmFVb8b2MLQ3fY
Message-ID: <CAPjX3FfSeE+WOya6Dg8aLSCRADBvnm0nFBk_uBbaeFM4egvqGQ@mail.gmail.com>
Subject: Re: [PATCH v7 15/43] btrfs: implement fscrypt ioctls
To: Eric Biggers <ebiggers@kernel.org>
Cc: Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>, 
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 04:37, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, May 13, 2026 at 10:52:49AM +0200, Daniel Vacek wrote:
> > diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> > index 6a37dd3cc5ee..2e0b79f41197 100644
> > --- a/fs/btrfs/ioctl.c
> > +++ b/fs/btrfs/ioctl.c
> > @@ -5159,6 +5159,35 @@ long btrfs_ioctl(struct file *file, unsigned int
> >               return btrfs_ioctl_get_fslabel(fs_info, argp);
> >       case FS_IOC_SETFSLABEL:
> >               return btrfs_ioctl_set_fslabel(file, argp);
> > +#ifdef CONFIG_BTRFS_EXPERIMENTAL
> > +     case FS_IOC_SET_ENCRYPTION_POLICY: {
> > +             if (!IS_ENABLED(CONFIG_FS_ENCRYPTION))
> > +                     return -EOPNOTSUPP;
> > +             if (sb_rdonly(fs_info->sb))
> > +                     return -EROFS;
> > +             /*
> > +              *  If we crash before we commit, nothing encrypted could have
> > +              * been written so it doesn't matter whether the encrypted
> > +              * state persists.
> > +              */
> > +             btrfs_set_fs_incompat(fs_info, ENCRYPT);
> > +             return fscrypt_ioctl_set_policy(file, (const void __user *)arg);
> > +     }
> > +     case FS_IOC_GET_ENCRYPTION_POLICY:
> > +             return fscrypt_ioctl_get_policy(file, (void __user *)arg);
> > +     case FS_IOC_GET_ENCRYPTION_POLICY_EX:
> > +             return fscrypt_ioctl_get_policy_ex(file, (void __user *)arg);
> > +     case FS_IOC_ADD_ENCRYPTION_KEY:
> > +             return fscrypt_ioctl_add_key(file, (void __user *)arg);
> > +     case FS_IOC_REMOVE_ENCRYPTION_KEY:
> > +             return fscrypt_ioctl_remove_key(file, (void __user *)arg);
> > +     case FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS:
> > +             return fscrypt_ioctl_remove_key_all_users(file, (void __user *)arg);
> > +     case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
> > +             return fscrypt_ioctl_get_key_status(file, (void __user *)arg);
> > +     case FS_IOC_GET_ENCRYPTION_NONCE:
> > +             return fscrypt_ioctl_get_nonce(file, (void __user *)arg);
> > +#endif /* CONFIG_BTRFS_EXPERIMENTAL */
>
> Are you sure you want to auto-enable the "encrypt" feature flag like
> this?  It doesn't even require a privilege.
>
> It's also only in FS_IOC_SET_ENCRYPTION_POLICY, so this doesn't work in
> cases where users add a key first.

The filesystem is flagged with encryption once the first file is
encrypted. Adding a key does not change any on-disk data if I'm not
mistaken.

Though I'm open to suggestions.

--nX

> - Eric
