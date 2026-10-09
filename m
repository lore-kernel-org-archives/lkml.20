Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3090B4E50BB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558350; cv=pass; b=b/2f4lWAWrNYfVeL+OxroYz+Zitn+HDFHsr+WLNyTgZMokGFMQiknqtqz/syUqZwmr7e3zDz4tt7IkExuAdDfAsD0mzGHNkbq1weUMMxkpsmGKoWtpNWcuTB7cRPHq0u53OIO9q9DnvAiaVwPhdE7x0dQCwzOrxGsZGbv8QOE5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558350; c=relaxed/simple;
	bh=7uVKv1Bm5O5ArlnRvGqrT8Rpcnz3Rh5hQPXlJaM48oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7N6Zigb+sme3lZWxY88BZklrgeOFUPmXYBbOGwoNxB6Q68vyMi6yM4jPn241APWm5+gnCqLKuc3O+J9WDEEmtPvxUPWPQ4i5/xsa5cpu11FwvuurqQkB5Zup9RjZcoltipCmWVXHR8dNkfTezceKr3+70ws9BLOyGPe3e4FwdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5h6y6qM; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5h6y6qM"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba37877490so3737540e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791558338; cv=none;
        d=google.com; s=arc-20260327;
        b=lF288phhdHmB2HfymoSuYdS9lma1JremgoeZdap6ub3vteXFnAZcDADrqQN7O1Wc7v
         AzBbJciNh+xM0wvCHTMv1M4MWnO4j2Gsq8FP+EfsLsvC+fMCCVSV1QB5nR7ETAzJc/5P
         DIzrM6sRyGAaiVw1a5gPPHrJxyGFarxD+pD48ESI9Os7Y2T5KuBHl0eENz0cz5kbb9SU
         XnQlKXmF6gRs4xHMA2HbFgLWRRsXV3wLZYSl1vLfynDl9VuxVgOg58EnU38Kjs3GzlHI
         cUfU3GxWy8fsoJAljsYlUnpFU7Xz8F1HbMXSkrq7F/BZ3njwWExQiFmjXF/YqhEeaWq5
         0AWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wDZ2vMGrGE4GsgsQilcLhHHSrN6fikmAwg6tgPE8yrU=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=nTALsmLJGMLhdIWJX0/Hi1XtSUsUI/0rOZP8h/USLomYhmlgtqykbYcjZfuggCNps1
         gf/2cLUDvReGM+x+Jd6Z1KDIJHhoDwwL2F1inNlkfizNUn2D5W9Ll5mi5Ab0OhhH8oQI
         X5bOBhHzA2ItbU/1m4fXwSUqdZeyAL4BHS6MsO68V6MY0nCO2pTMSNBmOninM1gsNTjH
         muR2Q6js4AyLN2Ar+BOEheIQjLtgl68JTDPUyLHl36BWRSuP+GxTCB35fwuPsVq2/3dQ
         ZhbUztr8ndDTpOr4a/fm9je+AEBR3yvcqN9ovVwR2qHwZ9pPDCTSXa+7jZimVliUdb/7
         xfLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791558338; x=1792163138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wDZ2vMGrGE4GsgsQilcLhHHSrN6fikmAwg6tgPE8yrU=;
        b=U5h6y6qMNL98QYpdHFJ/tlOik+XBkkQj3UjAvlxvixMrgokF0hObvDXJVbi0ZdLUVq
         SZv40Aie3DOrzsYrK358jqKGnMa59T4jXqkeyDm2apnxJ3uxJwf1uWxcBE6d6PYHcRrH
         kf0i6usHCxCwWOCgWJoYzjwBiG8DLy67VohnYarhjSJVs8rrUY25dMqVtm0ouJjAghJe
         2NnJTyqBAA1sRBMmleVO/n0gfHr8EPzanw9ypMEWb2F8P7hKAb0I5jNBJPqrPMd38qjZ
         OCYEUTPW9wh6rI04wfzP6AMvmHFm088o2UMekMrGF9hr1KAdfvwGw2ddQptnLwnY5oR8
         KEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558338; x=1792163138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDZ2vMGrGE4GsgsQilcLhHHSrN6fikmAwg6tgPE8yrU=;
        b=ij51abKitnybKxQJmZx0gOH1CUk528j1WvAbxN0ZFwnpJKY/15769cl3hMCbm9UrCq
         hgNLTRWm7Uk63trWDgMFjogEE8xuqC56pGkKLlTY6+nYclGLWE2mL9rJarEHX/lsjdAe
         uAqutZ+pT+ed5CGkgJUzFoAus0HZUp43A/3llnKkYLyiSbQ8hQGqBFhbdEKb8D3Sceyg
         tymOhen6b5lIWCAnZ/4WaexxPwCWiY1Nor4AZ1QZ8Al5ajxLuOnvXmtXe5fJvvta6Okf
         epTJwYpLEZ6W5MwUTmlRPEPMPMSDmO4lZewWe68yoYhRe2ANeZ+xBZqgEABhSgDNHnSS
         chiw==
X-Gm-Message-State: AFq9FYJ492htor1PBamuBaxNzFYI2gqNIWSj8i+q+RGz/sXkXfYNZAxb
	1+a7O1d2dclQYNb0yBugwiW5LlOjqfouCet2OJUqWBQOv2TyGqTUFa8Dzwl1Nd4QKi/wBXTBa+Y
	pqIkql9a44D/yEqGT25hgXpgKB4BDGdc=
X-Gm-Gg: AYBFou2ounrNAsLhtaE5ydd3PaQk9hfg16IpH8DmWb01wuMsVLoOgxzTF8Jy+qyUicM
	22bKCSCCYSAEYEk5EGTF6itKc31Ly7rCsyVHPdXtERUi3gzN2NstEoTAxkGhYlGrKHk2s9A5xkE
	DF3FXNaquCAkGQza86kPCwVt3odFo4DQOAUxTtolUzOZV/TztoD+e+V6IK4zE03/IFbZkYB7z7I
	c3dLLgasqUoODNIen8Ad4+4ZZMlS4UqNwPvJqb3DAaK1uQoeFZkFZR7v282cJamX0M1naAr6zhe
	QgN7in+zV56eACr1T9tcPqTKhB/zcYSikL5SffBXgq+VCLapU4QRs9+JHvKYxs4LznXkWavV6JU
	zx5AlWeomixt4hKIBmFG2uRvrJUwS2KKYB7AS6zHG8Xdl
X-Received: by 2002:a05:6512:3189:b0:5b8:f1ae:cbf3 with SMTP id
 2adb3069b0e04-5bcde6bb716mr785623e87.21.1791558337820; Fri, 09 Oct 2026
 08:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002171704.3652570-1-daeho43@gmail.com> <63812000-4677-4af6-a3e1-4e87e39f0d88@kernel.org>
In-Reply-To: <63812000-4677-4af6-a3e1-4e87e39f0d88@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 9 Oct 2026 08:05:25 -0700
X-Gm-Features: AclHuK_BanzYX18T1PuwZKeUxRb9PVETFkcfnNYDdUp-utwELe1CHp99YcU5vzM
Message-ID: <CACOAw_w5uXiYqGObti+uiWwJSeaNCZc6+t3j2yopL-PLf226=A@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: disallow mmap write and data-modifying
 fallocate on atomic files
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 1:35=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 10/3/26 01:17, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > Stores through a shared writable mapping and fallocate with
> > FALLOC_FL_PUNCH_HOLE, FALLOC_FL_ZERO_RANGE, FALLOC_FL_COLLAPSE_RANGE or
> > FALLOC_FL_INSERT_RANGE do not go through ->write_begin, so they bypass
> > the COW inode and modify the original inode directly. Reject them while
> > the file is in atomic write mode, as fallocate already does for pinned
> > and compressed files. A write fault gets SIGBUS and fallocate gets
> > -EOPNOTSUPP.
> >
> > fallocate without these flags only preallocates blocks and stays
> > allowed.
> >
> > Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/file.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index ef4d218e694..56c686b8580 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -140,6 +140,10 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_f=
ault *vmf)
> >               return VM_FAULT_SIGBUS;
> >       }
> >
> > +     /* mmap stores bypass the COW inode and would break atomicity */
> > +     if (f2fs_is_atomic_file(inode))
> > +             return VM_FAULT_SIGBUS;
>
> Will we suffer race issue due to the check w/o lock?
>
> Thanks,

Hi Chao,

Yes, there is a race with f2fs_ioc_start_atomic_write().

page_mkwrite cannot take inode_lock, because the lock order is i_rwsem
-> mmap_lock (e.g. fiemap copies to user under inode_lock). So v2 will
use invalidate_lock instead:

f2fs_ioc_start_atomic_write() holds filemap_invalidate_lock() from the
flush until FI_ATOMIC_FILE is set.
f2fs_vm_page_mkwrite() rechecks the flag after
filemap_invalidate_lock_shared(), which it holds until the folio is
dirtied.

If you are okay with this, I'll send v2.

Thanks,

>
> > +
> >       if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
> >               err =3D -EIO;
> >               goto out;
> > @@ -2113,9 +2117,11 @@ static long f2fs_fallocate(struct file *file, in=
t mode,
> >
> >       /*
> >        * Pinned file should not support partial truncation since the bl=
ock
> > -      * can be used by applications.
> > +      * can be used by applications. Atomic files should not either, s=
ince
> > +      * these modify the original inode directly and break atomicity.
> >        */
> > -     if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &=
&
> > +     if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode) ||
> > +          f2fs_is_atomic_file(inode)) &&
> >               (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE =
|
> >                       FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE))) =
{
> >               ret =3D -EOPNOTSUPP;
>
