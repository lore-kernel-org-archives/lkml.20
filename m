Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB84D46EF9B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796010; cv=pass; b=KSdS+jFRT6fB1WVLxmfgkI8F5+1W6weynyH9KUiJDdr0cGb25YrDAanc9EPZbQHDqQY/7KdotrDdk7Q1BsNqtnY27UVOv5lUcYkTp/1a6csg5HmITRljUvP0cODDi3TGGj9lztSyBz2NqAEACu1SeRFU7M3J51vRszAdkZOqdA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796010; c=relaxed/simple;
	bh=u6z0nz0rXLQD/d/++bl8nKXdZ9kodSiFoq2BerR4sr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFRwzRQym5V8+XE4YckUG9IYWguLXtEkMCDyMaePsFkCbx9BBh1TKjDhrOI9+9WmYDl1wlsY37BhK3Kgt5vmkKRYEzNcQ5rPihCeREzxjrz+4vPLi7VU1mCe52Alex4dDBmrbSQuAZerBzcOHEeg0WS5JxV7mZpySoQvrO/rb/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYjGnsmW; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYjGnsmW"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66e43c04585so208922d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796007; cv=none;
        d=google.com; s=arc-20260327;
        b=NX5gYr1j0yzTqY4tgu9L6aqZUrBP/r4WIlX638bvqgj2FdLVjsZHcq+jf4c9WXmnUr
         baQ7FzndQAdnXaAIwtFX0mRTK+ezkbKGikYORLc+ZoRNfbgwNklI62Th6dgI/G3k8ac4
         dsXiS64ba+7W46GKOgYOQMAQpOvZ7GksnPZTZswg6fxNIL832mbPv2/HJHi+vCCOStJQ
         dXYbVXsMt9mD/4rPKP8iNlsH3zVvRigNusyizWhw82OPghgWERrUZON/msBDsjLBj+vb
         uBlqkpjUvd7WFJdME6mBrCRBNNL92G8vVkbs7SKFbJQ2T3r+tMLi7DfpARbktI/csQFT
         0ACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DociiOpQMr/snyhgBdk+Kg98nBD7g+hHAnoUTnSy0Q=;
        fh=gPl4CYovl6jdDCwzUO87YnE748hyEvaVdz+ii50xPuY=;
        b=qf+J/OncgUbImhmYBdq4pSc0dP/02hVL8ymEQ4FJHdL33NoHlAsJGmPteFaI8jQZn3
         ZVHmozVi5DnXT3gamT290LWCisMATZEkBYJAAyQQjXmVS8KXksSS6tQQS3sBlACnYtG+
         IOR0XTyc6ypZKb+LodLHX+YJefOxFB4VBXy8PvdnhusjbKv4v0pBT9GwMW3Evq2l0psa
         UAiSS4SZU9FXlNAzfUEdsW+3xC29uPUS9WhrvFBMkHT/+3usf6r2KblIN3D3wG3FAa+y
         OssDnpmS/sfWhbDI70TGeKiOBXY7445q06JOe8XnydxeY0z2z3whTVNHCj8KRWeZCZsa
         wHNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796007; x=1792400807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7DociiOpQMr/snyhgBdk+Kg98nBD7g+hHAnoUTnSy0Q=;
        b=qYjGnsmW2I+G3epC8CkZ2b7Cy/zbLvbldOfYIhREXFQ1nPIYgMZIrgloIp4xF2buGu
         W+DvnlcXf7tS+2mBs3sesX2dL4QB8Fws7dIn+p6WJDZYBxMQVnggqjhV203E0HPME5uJ
         XOzF8EmaRgtqMBHdn5g99BrBnvOYzo9AhQRhqy4hM5Z8HItPZZSjpUM33ojCTzrwFnQn
         65zz4SGuZmIXiHecqpO83UnjBNvommcxRK/Idx8Z7773G5za9azXeledvvbDq/jYXxCE
         TyHmVkyfkdn2YLBrHDA7dkTYUGN+mQ/bhsGm76WCwA+cszEVVPVCX2Pmw4HHl4AJ4SGO
         9bQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796007; x=1792400807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DociiOpQMr/snyhgBdk+Kg98nBD7g+hHAnoUTnSy0Q=;
        b=MbqiUyMDRzHIa6Hh36/ULSeKDmvub6WwD10Us99+mAf4F/hr1JzjdhYMAzfmECopqX
         FPr6EY3DoPLVmWgbvwWWaCIrlVR6hpAxUDmqmhn6VC7JeYQkflG3a5fPtSVRp5FhASPY
         KEPank34U90M9M9UreTOhAvk1jccnSH4B/v5CfVjEsuVR4aM4GNv5B/BM4WFshDuN/lT
         Eube1Haqnl4Rs6O/Dx0ymPpajpbFOSpwU4IHhVvOp0FlE/MHVHZpQiR4YqMCYAAxtT/X
         f7XIfeeIURY0F2UqyzCGzua5DSRj4u4vDH4GzveLcCet6yh/uQXP5m/o9gfNc60cAxIX
         XncA==
X-Forwarded-Encrypted: i=1; AKwUvBwx8DbluuHetVZzf7854Y+KYb1C4Tq88ervEQCFhipruO8Pjd2mivK2kf1C63+cscaoeBgRN/b0maY9voI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs1fqel8i4XBvgsUUJowXYm6PkI0YpNHwVp3xooykW6OPjlAdO
	jt6h1M4hSN7lF8PluF9IEtDUjBS4LFIKdBDBVLwD/Mhh8LQ33XgpxI4JI67mAiweBoeyuY3XkZr
	zpg1RsdTTTcLcQmD+hGYMgd6+Ig/iNdQ=
X-Gm-Gg: AYBFou3iayjRSAEV1MO6k4wjKZ549v9q1oEde2tC0BxKEX+IMf5OjwQbVkAdLziLn1C
	ugxsS7S9IzgbXphf40rXu8LQxwRjAo0NQK8pzzZ1WRqMJyy3rDWZYFBI2sn2CAD6PYpxGAAsm+/
	iNTr9oivAn/Bd8ZeL8MmVft8FdAYMVcxIa3UI6/VhQu65UzUW+aCgCjuxFo9pcY3kLTtHOzfcg5
	8G4kHCoiei3gKoutZhTyqGWaaP/BfZp2nNppj2YRIQ4pQjdFRROsjGxSSwn+1nrgIOCb7zsHqf0
	dmfuWRw6/s3acBBGoMiE7TXgyiL7jF15k/6WavWDynGJw+1CcMPYkAMOzA==
X-Received: by 2002:a05:690c:6e10:b0:855:ba1b:c71a with SMTP id
 00721157ae682-8b07edcda9emr55018537b3.3.1791796006796; Mon, 12 Oct 2026
 02:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012031656.3858771-1-charsyam@gmail.com> <d19c802b-623b-4900-ba09-76302fc7b602@163.com>
In-Reply-To: <d19c802b-623b-4900-ba09-76302fc7b602@163.com>
From: CharSyam <charsyam@gmail.com>
Date: Mon, 12 Oct 2026 18:06:34 +0900
X-Gm-Features: AclHuK-5pJRz0EpMFaEkPVRrTYtxxFY8A2HZW0Ubbkdh28bgEbVt00nBBYDq37g
Message-ID: <CAMrLSE6UGq4gfq2kuxgTdzzVFEocs_7gzx=FwN-o8Nm9+ZvDcg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: compare streams_interface with mounted volume on remount
To: liubaolin <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, hyc.lee@gmail.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi liubaolin.

Thanks for your reviews.
I will fix it soon.

2026=EB=85=84 10=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:26, =
liubaolin <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>
>
> =E5=9C=A8 2026/10/12 11:16, DaeMyung Kang =E5=86=99=E9=81=93:
> > During reconfiguration, fc->s_fs_info points to a newly allocated
> > ntfs_volume. It does not contain the mounted volume's stream setting.
> > Consequently, a windows mount rejects a remount with the same
> > streams_interface=3Dwindows setting, but accepts streams_interface=3Dno=
ne
> > without changing the active pathname interface. This also breaks an
> > ordinary read-only remount when the existing windows setting is passed
> > again, for example from fstab.
> >
> > Compare the requested setting with the mounted volume instead. Use its
> > superblock when reporting an unsupported setting change.
> >
> > Fixes: 2de2cdd9cc08 ("ntfs: add pathname access for named streams")
> > Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
> > ---
> >   fs/ntfs/super.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> > index 242fb19ced2b..711e90be9382 100644
> > --- a/fs/ntfs/super.c
> > +++ b/fs/ntfs/super.c
> > @@ -275,8 +275,8 @@ static int ntfs_parse_param(struct fs_context *fc, =
struct fs_parameter *param)
> >                       result.uint_32 =3D=3D STREAMS_INTERFACE_WINDOWS;
> >
> >               if (fc->purpose =3D=3D FS_CONTEXT_FOR_RECONFIGURE &&
> > -                 NVolStreamsWindows(vol) !=3D streams_windows) {
> > -                     ntfs_error(vol->sb,
> > +                 NVolStreamsWindows(NTFS_SB(fc->root->d_sb)) !=3D stre=
ams_windows) {
> > +                     ntfs_error(fc->root->d_sb,
> >                                  "Cannot change streams_interface on re=
mount.");
> >                       return -EINVAL;
> >               }
>
> Hi DaeMyung,
>
>     The fix looks correct.
>     However, vol->sb is NULL in the newly allocated volume, so
> ntfs_error() only logs the message. Changing the argument to
> fc->root->d_sb also invokes the mounted volume=E2=80=99s error-handling p=
olicy,
> which would trigger a panic on a read-write mount with errors=3Dpanic.
>
>     This branch only rejects an unsupported option change during
> remount; it does not indicate filesystem corruption or an I/O error.
>
>     Could we use ntfs_warning(fc->root->d_sb, ...) without triggering
> that policy?
>
> Thanks,
> Baolin.
>
