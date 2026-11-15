Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794754078;
	b=aX9CEMx5jTLsxN73N4H4NVvc3sfrsXV8fKfWcJXAt2/7x4GCmW0EGkmuVn6MnjuKey12
	 UVmnEf1nRjFLbvlZBys+SrkSrjPQa1y8FvqlS+q7HhSCUzQ7gDuaqA+pSTIz0ZlagGgWZ
	 9HexH4cwlV4ynxnuz67SBfKnKtILB0hQw1SthJM76XqfTbFyaPC2H9XGTy6n+SI7tMlfs
	 62Gs+r/XAIwWA5jEENgO+tQBHH/OPAjMqeE3IHPZwKyvPUdwnax/Il5hALlZDvV6CyRQC
	 cEWd04TKJQrfsUKqAG12rCDpukcY3hA10EjsZ4jvSbT2PUp5lbx+1y+nB3gMfYSkkyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x7HykaAJlgnOpmpM8XJHQMzZjK2dm2wSOUdGIuC/Jng=;
	b=5Dt5i9PeWnIO5EBD60NMJ3QdQYjG2ZBol3dH/U6BS6yyqq/JYfVpiX18mBv0MFbWxwFY
	 wSvSZtyLWNlUYIynXRHYtJFjZjssfLdnxD2Lilvpt0XgTLT+P7afFPiisu97yUs+udk2a
	 2TA91JJSmHYuo03GfxZoXy4z3P7MJ9Dg9Ft5Xvx6cwEtP2rzIzjGH/R3BWljKsQBs7z+9
	 YVpVPbdU2He5LGdVqi0ZHeimBmK+X05Ab30+gLqE/xOWDv1cO2HJXY4K6TDSL/HKnl3tq
	 yZselAKVT09DdVBPY12fmjhQ3bvpfYDTzmsJiXPoopEJV2U+FdWArI4JlzyUZlsYpMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vdeJy6VC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB5606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DB5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vdeJy6VC
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso3656521a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:47:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794754076; cv=none;
        d=google.com; s=arc-20260327;
        b=bPkNElmYHE6rPbHY89Q2Tmw/G4RqtS2C9zH7rtCHxC/1CeIv49LayS4r+zmVWxwmLo
         8BUg6MxJB5C24OlxttY8oFUPag9UVpcb9kfsVGlfsDmGB/hikDjggDiDamU91LU5hVSQ
         MYIziOHLL45hobqHqujRXw6zrrEqLA7d1uxH6bxsubfLkSKZJP364hliah3rh7I3I/sy
         5tmB5EBelwMPp29yUjc4m3W/JN/YNZGnZA0nmsTNVqHEu3v/V+tlssCQ+vPGvUJ/SM/0
         aqe56OooLxT4VGc7UHbYpIKZp1hQOWMZbvVjhVbiakcg8kq2WW+ip/tddV6ttaPqWdfO
         l+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x7HykaAJlgnOpmpM8XJHQMzZjK2dm2wSOUdGIuC/Jng=;
        fh=idvk8uCwvoxCLenL+6D794KSNnoVUHDRsuQCj24Qric=;
        b=N4rTqG9YDYpV7bf+h1l9AQItk/Spzoipe5i0Z6i5lOw0XG6SrhLy9npdkD2uB8qh0/
         QKQWoKRAQ7BPKaIP7pORBcPtXaRtKpPMgYDUVMXvOVdb2UoQx2nDgx6Z373L5hFanGOY
         TAHJGCdJOmv4fuVCHiv8anvoDpcjg4up/rVaDESOXxW7nVhXmDLmG790QLKFbHlddksr
         Ykknr++P6zoH1n+y9oO0rDtyyq2yMCtUqLqGeSDKOYa58lWlSG7yHbpPhwHCW6shdqEB
         aUeHU/jHm/2gpgsPWliJk290itnuXE0BvNHDNADAOYuWOZp83OhGE9QlYFqnVPXnCUfn
         Ftrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794754076; x=1795358876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x7HykaAJlgnOpmpM8XJHQMzZjK2dm2wSOUdGIuC/Jng=;
        b=vdeJy6VCk2IGRpnrLWlGo4pWLhKneS7IPoBk81bLTW0iD2g50lPI0We72sIkSM0SV6
         cyTbNZB4O3d6VzvDDG9DPV5xAXhxmw4YkAyPQvdWI1M8aVPLRajltXh2AQAOKJY1EPeA
         J/3fQzDOEdKdl4Og0NnAs1e+UKlTuJcD65e+vWcNglfpyVM0bRYj3j545Ccvj/p07kIf
         RJxqw4iAkOZDz6lvhqxGAdC4rSJXKnOPRkFB2PlSiergeTKJSozBYsIqbEfROUxsRiwA
         +nC6LR2BKa2t52tGscFSOG6fqqncSzV6SKT9uOygWHxo9fsmCNg/KFWBsER32dA/LqAU
         Q4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754076; x=1795358876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7HykaAJlgnOpmpM8XJHQMzZjK2dm2wSOUdGIuC/Jng=;
        b=QU8UpqQ9s8nCYzpuFHcWTmc+CUfi2CXrJAHBi+KeQeYGYthi32+5PiN6EGWPifCBUG
         noh0ltJRoNRHrr6NDtg0qVVwHqUNmlzS42SOcJcd5eVhfkK/dtPc7khD5jCSYmU0XKdX
         1UtW/WI8geYxsmO7M1sEcajygRV+PQ8OC8szPRl7Bfjai5v1SZkIoMIVDDF7yHE9bOpC
         eVrrC2bqYvqzM4s4NCQI/7J5OUBn9Dqn5A+zwRltMMsv7JBnZ+CxHzhd8Zlx/OHZ3RF8
         6GsIW8ISMbV5VvZtHUZbKXYhZEqvp7klXh1JM+4LzYXVg/cl7jdo1bDrTL5N5PG4IqWX
         BPog==
X-Forwarded-Encrypted: i=1; AL+hErGd68deIFbdkZiEm2nwKbkm8laFDrWcQyqSL+AFW5CiJdqELODouFuAVKk/2wLEpF+LkUB9h4pIhigfitc=@vger.kernel.org
X-Gm-Message-State: APuU4Z829gmBCCP8uuj0e64HO4gBw8dVuc2MUuoJTf0tsjbQGL1pjBzs
	cbOYcuE63OwhLA0mqPRlDsOpUjbDVT8cuHKgdysTP3781zJWTiKygRpl5duTpNbTAR6jFSPusbC
	jxXU95NqrJhHHPWcEZE2SR3H122H8rHQ=
X-Gm-Gg: AYBFou3PAOrpY01sLTIxWUiYo9FD2gfDAR5EA+ysosA4kbjONDUdwn7qs6BrK60LJvh
	0yoPDV0JgakeAydt7/GoonU+2SfOVRgupJIlTobgmLjxW6/QYsbvFco46N0hE0ys2ifH9j93OH9
	ijNmyhwoRYHLsq1i61/t5eHytkdmXlg/+hNtBtuh0yA2qnet252dVhRygs9lmgeX6UZb9lNWegj
	7B0zceiulmP1UlH5B+yz8ZGH7QCpcTiBqhf4iQB2Gl+T10SaxGxgd/ZhjpBds5489xVMqUOOQhB
	IJYdmQhkaMBULcDWJ2PYSjbpC4C5ewGdbMQZ4ixqBY6Gmz2e6dN/xUsU4t0tOt47CFA7kh8/GpQ
	mSuY77zac4DhLGsRk0ueImuQVAdYyCYlr78uol1NVfFWtDf7EAazZvOSnYjAfG49CBGoyUg==
X-Received: by 2002:a05:6402:1d4c:b0:6b7:e12e:7f1f with SMTP id
 4fb4d7f45d1cf-6b7e12e824fmr3426650a12.10.1794754076394; Sun, 15 Nov 2026
 06:47:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-work-ovl-d_real-v1-0-ca155efbcb2e@kernel.org> <20261115-work-ovl-d_real-v1-10-ca155efbcb2e@kernel.org>
In-Reply-To: <20261115-work-ovl-d_real-v1-10-ca155efbcb2e@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 15:47:45 +0100
X-Gm-Features: AclHuK_at8qVhKBNN0WXPGQ7F2lmyjSQgMjlfNE9nQtuQriTEXeBZE7dwGmSTD8
Message-ID: <CAOQ4uxggW+UifxBJDY8fAb+g5EWrsD+rELwXa1ngZ_5X_OZx0g@mail.gmail.com>
Subject: Re: [PATCH 10/13] ovl: return the error from the lazy lowerdata
 lookup in ovl_d_real()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Chris Down <chris@chrisdown.name>, 
	Miklos Szeredi <mszeredi@redhat.com>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:02=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> All callers have been converted to d_real_data_inode() and handle an
> error now. So return the error from ovl_verify_lowerdata() just like
> ovl_open() does. The lowerdata dentry missing after a successful
> ovl_verify_lowerdata() would be an overlayfs bug, so keep warning about
> that but return -EIO like ovl_open() does when it has no real path.
> D_REAL_METADATA never looks anything up and still can't fail.
>
> Update the comment in ovl_d_real() and the documentation of d_real() in
> dcache.h and vfs.rst accordingly.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo=
91QjJHH9T_Yw@mail.gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Nice!
Thanks for cleaning up this mess.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  Documentation/filesystems/vfs.rst |  6 ++++++
>  fs/overlayfs/super.c              | 17 +++++++++--------
>  include/linux/dcache.h            |  6 ++++++
>  3 files changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystem=
s/vfs.rst
> index 1824462a43711..6953f399672f3 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -1374,6 +1374,12 @@ defined:
>         for returning the real underlying dentry that refers to the inode
>         hosting the file's data or metadata respectively.
>
> +       For D_REAL_DATA the filesystem may have to look up the data first=
,
> +       e.g., for a file that was never opened.  If that fails an ERR_PTR=
()
> +       is returned and callers must handle it.  D_REAL_METADATA must not
> +       fail.  Most callers should use d_real_data_inode() or
> +       d_real_metadata_inode() instead of calling d_real() directly.
> +
>         For non-regular files, the 'dentry' argument is returned.
>
>  ``d_unalias_trylock``
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 1985b553a47b7..39d4d57dec230 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -42,7 +42,7 @@ static struct dentry *ovl_d_real(struct dentry *dentry,=
 enum d_real_type type)
>         }
>
>         if (!d_is_reg(dentry)) {
> -               /* d_real_inode() is only relevant for regular files */
> +               /* d_real() is only relevant for regular files */
>                 return dentry;
>         }
>
> @@ -57,17 +57,18 @@ static struct dentry *ovl_d_real(struct dentry *dentr=
y, enum d_real_type type)
>         }
>
>         /*
> -        * Best effort lazy lookup of lowerdata for D_REAL_DATA case to r=
eturn
> -        * the real lowerdata dentry. Callers may ask for files that were=
 never
> -        * opened, e.g. for uprobes or O_PATH files, so the lookup can fa=
il
> -        * here. Return the overlayfs dentry then.
> +        * Lazy lookup of lowerdata for the D_REAL_DATA case to return th=
e real
> +        * lowerdata dentry. Callers may ask for files that were never op=
ened,
> +        * e.g., for uprobes or O_PATH files, and the lookup or the verit=
y
> +        * validation can fail. Return the error then, just like ovl_open=
()
> +        * would. Callers of d_real() have to deal with that.
>          */
>         err =3D ovl_verify_lowerdata(dentry);
>         if (err)
> -               return dentry;
> +               return ERR_PTR(err);
>         lower =3D ovl_dentry_lowerdata(dentry);
> -       if (!lower)
> -               goto bug;
> +       if (WARN_ON_ONCE(!lower))
> +               return ERR_PTR(-EIO);
>
>  real_lower:
>         /* Handle recursion into stacked lower fs */
> diff --git a/include/linux/dcache.h b/include/linux/dcache.h
> index 674bc50b81827..5b3b34d271bd0 100644
> --- a/include/linux/dcache.h
> +++ b/include/linux/dcache.h
> @@ -638,7 +638,13 @@ static inline struct inode *d_backing_inode(const st=
ruct dentry *upper)
>   * If dentry is on a union/overlay, then return the underlying, real den=
try.
>   * Otherwise return the dentry itself.
>   *
> + * For D_REAL_DATA the union/overlay may have to look up the data first.=
 This
> + * can sleep and it can fail. D_REAL_METADATA never fails.
> + *
>   * See also: Documentation/filesystems/vfs.rst
> + *
> + * Return: The real dentry, or an ERR_PTR() for D_REAL_DATA if the data =
can't
> + * be resolved.
>   */
>  static inline struct dentry *d_real(struct dentry *dentry, enum d_real_t=
ype type)
>  {
>
> --
> 2.53.0
>
