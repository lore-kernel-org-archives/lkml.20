Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2841E36E478
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907936; cv=pass; b=h2hGqidOUBZmXmrPqphSQhRPODSrorj43+Bi/OpdNqmh+7BvkVCdqNyWwf1uO0XGY/MFiXF5NpSWFk8z75wrvttBkL67XuW1QnPrqiLM91l+bByDNJ73tqAmYnZOQXSgxyloaqoSP2nLhJoDGk2iocd7fm1Rhs3ZhEloBR9bYXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907936; c=relaxed/simple;
	bh=kcyY+NxYtD7T3O4Y9Nn6CHPlve9WbW1aHvF8C8OLgX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UolBqtOHVtupv9Se2KR2URGRlby7SQ8QNJfEaR2OGamkBqP4X4kEYJyOFtcNT7qAoZnT5Mcr2onMgUBCz71b6wkS1aHIxgGspauf3DWaF2bYYT4iMuw2X21P/m7s+9PIZitPA3Nfe9rmVMMdcBo1X6CUUYW5l1nkPmaIVaObIMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWqB/sky; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWqB/sky"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso956891a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787907931; cv=none;
        d=google.com; s=arc-20260327;
        b=SgHpjRlX99gZBLeQotQnjqm5q9a85YaPdFdgH0126Gh+e6UsaGwYIADKNUd+fp3Ek1
         RzpHQg213nZwk4gRy/ap2likG8uHBtddOwgJzABhCY0rJ1GNZSZI2WukHtpi7Qdh1rrf
         Blyktrt8GRuTydRXucW85vTHrDDosePCzvX97BVkRtx1T+pMU8E/hK3Luh9WnEjAQtQ9
         UNTVgMCssyTJG0cfx9BNVFmxVjwJToRWmivHup7ugj/zvJCYhiQSykegEt60v/BD/moc
         ISup2IjrLIUFWn8CxKcYkym2GigUBNDTI/cnMO+yZHvn6Cjk/R3xcRbtMxyHr1etfmfB
         Zycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iGb5RBnXDA+kbDx6QBFrMut47J0QFMd/GZl3kg+9bis=;
        fh=0IYDgzzRSgiofUKoy5p6NMPIY8Ubual0TytNCmsvWR8=;
        b=gxFzLrsffVzRfrPJRkL3YDfyM20HL/O2b5sZQBlQQ6ZcfeSLMCfMDae8dC1StH+dLN
         FyoZmZwo07fMKryaLS3EnqNSH8cJAWLH+S11aXnEgJ0djuVWvGizfFQRrQr33S/MMvqY
         +2BLWDZP9GIS/JjEEii8/ThkqFQo8yGivM9t+wJgVje7imJdGEAe/Yjwstm7t4lvUe/F
         CNqulWPRSViyxPiCAv1/veyd34U88Nz9mLUGeEUT/92GCaOsXe0Fq8JiSmhGzwKy4BfP
         9toyJfNcghPhgLplntT/ZkiGf0JK9givWrQXBNOaT8ezmVYuF83ntXegOyh89/YZcSNx
         dTfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907931; x=1788512731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGb5RBnXDA+kbDx6QBFrMut47J0QFMd/GZl3kg+9bis=;
        b=JWqB/skyHmfBvHnhrjw40ZDPyRfuh0PTuNhPCxIjWpIJ3pr/gcPIweFjwB7asklzhv
         6DRM1tZEco41nUTMJd58pG0Tsin5CJx/YOJn8RX1FqFaF4iQtacc+rp9NejZE/t9oams
         IURITUoHgHJ1Qqg0XD6LcOP4S7krazwj/6JB1Ju6xQDgaH92DFORSjZGXRe/nqqIe1ta
         2i/kpfHnJzOJAlCMX31DVgvYIE32p9oODuLi3U4ehSn5vBFvrEhhCpQuFYIxyhr1tDGG
         8S3teR7gAdys1LdmVXmY1xHN2mAK1g4GRU/XIcWtGC6AtHTJcm0rua+GqwjkC7C7luLu
         AomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907931; x=1788512731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGb5RBnXDA+kbDx6QBFrMut47J0QFMd/GZl3kg+9bis=;
        b=QJZZhtNKq1vrjaTAWIQ7EMJD0FcTVjeOU3e5Qaf8DPyTScG8fLH/V2qq1wuWSGuS5b
         3JZc9l3AO490VKaqjYCv59WNCz+BLZNMZhdnRYvoLAZo1yy3s23QWhW5lxE+HcVLDzVt
         wuR8fkvogOt9M1WSpPuBoCNOPWyEYRGH9Uoio3WsSyzCHa8bYAM8BRvZHDVtGYGq9S1z
         Ne6e5CsxROL/5jYTSSN55Z/gisATIE+MBmKgr+GyC6n0y3DM9lriUKRAHhGfs0idLCxH
         r0Gjm6j5ngWfS+TMjXw1x6jcxDf2FHfYf+bH+Cf7ea7viXOGSki4t4+4ZVLEK4eWamRJ
         FsNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTVKJ/Eqoxe3qaqBBbYjNLR7jnBmn+a83C7UhFukoO3TiTO3pGYA91ifaGbqQQyc9HpiCwSQ48yReLZ2k=@vger.kernel.org
X-Gm-Message-State: AFuF++kENvnPxgp820KBzYJdi7G3sW2dDvaUXW03butu70pizdO5oqHr
	fAIM6/2+iiEtMZQzXyS7JJycnLMKQhrPNDV0dsz3BlDu1fu/r9VFtPNXCjDXRG+F5hc74eov9s2
	46rXX18bOrQmZQMtfrRE8hKTNggsvG/KXBkegLxQ=
X-Gm-Gg: AR+sD12H+TrEBCZSVmStZIcYDE2m8lzaRV+basFVTntdEQ28SoOc4RW1fEERCjqEi8d
	S0UXoOBKbCIuZ7NzoDq1/8FP63WAkcY97iciyeXicNBuYH/I+do7+V6WiLjPJeeQTqeFeCpQkzf
	zcQdcTxrW4Mvh7ksgFce2liN9A7SlP/TygIeiyDLbGdPf3TKEY2OaF0mh3uu+u/MmE6W+8Pyz9H
	+AbxYQsEsya+vOA6ALHkCgpuwQc1YyFthMAvZcGljTL8pq5z7NYpXr8MSQNUud964LJ0Ryq7Dfq
	+2rsjdCDx0oUvRr4X+Nu7Cpwo6MkZym2OBSendLv0cRDBQ==
X-Received: by 2002:a05:6402:3812:b0:6a3:6d83:ba44 with SMTP id
 4fb4d7f45d1cf-6a60d2f3663mr3556066a12.2.1787907930829; Fri, 28 Aug 2026
 02:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820175832.44512-1-kmehltretter@gmail.com> <5fa5ef078f41cd57d0e52ab2ab023094@paul-moore.com>
In-Reply-To: <5fa5ef078f41cd57d0e52ab2ab023094@paul-moore.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 28 Aug 2026 11:05:19 +0200
X-Gm-Features: AcwNN1W4dZ0jbuPGgh02j4F1QLJuW5SvC4XfY9m2qygWs-rWNLFgcF97xFGTv1w
Message-ID: <CAOQ4uxjn3sWjkrV8KbA-V+eno3E4OskTnCznNBex6FOstEbJ-A@mail.gmail.com>
Subject: Re: [PATCH v2] selinux: preserve user SID across nested backing files
To: Paul Moore <paul@paul-moore.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, selinux@vger.kernel.org, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 9:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Aug 20, 2026 Karl Mehltretter <kmehltretter@gmail.com> wrote:
> >
> > SELinux saves the user file SID in a backing-file security blob so it
> > remains available after mmap() replaces vma->vm_file with a backing fil=
e.
> >
> > For nested backing files (overlayfs over overlayfs, or FUSE passthrough
> > backed by overlayfs), user_file may itself be a backing file.  Its
> > fsec->sid is the SID of the mounter that opened it, rather than the use=
r
> > that opened the top-level file.  mprotect() then checks fd { use } agai=
nst
> > the mounter SID.  This can incorrectly deny access without a domain
> > transition, or check the wrong target SID after one.
> >
> > Copy the saved user SID when user_file is a backing file.  Keep using t=
he
> > regular file SID for the first backing layer.
> >
> > With two nested overlayfs mounts and SELinux enforcing,
> > mprotect(PROT_READ) returns EACCES with an fd { use } denial against th=
e
> > mounter SID.  With this change, mprotect() succeeds.
> >
> > Fixes: 82544d36b172 ("selinux: fix overlayfs mmap() and mprotect() acce=
ss checks")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-5.6-sol
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> > Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> > Changes in v2:
> > - Add selinux_file_user_sid() helper instead of open-coding the lookup
> >   (Amir).
> >
> > Tested on arm64 QEMU at fd6e2388a3ea with SELinux enforcing and two
> > nested overlayfs mounts. The policy omitted only
> > base_t -> mounter_t:fd { use } among the relevant cross-domain allows:
> >
> >   baseline: mprotect(PROT_READ) returned EACCES with that denial
> >   patched:  mprotect(PROT_READ) succeeded; test exited 0
>
> If you could share the distro and some more details on the testing
> methodology that would be helpful.
>
> > This patch fixes SID propagation only. backing_file_user_path() still
> > resolves to the middle layer for a nested mapping, so the audit path an=
d
> > inode do not correspond to uf_sid, and that layer's mounter is not
> > re-checked. Preserving the full user path likely needs a VFS-side chang=
e,
> > such as having backing_file_open() store file_user_path(user_file).
>
> Additional comments below, and while this patch is useful in fixing some
> of the problems (thank you!), we obviously need to fix the others as
> well.  Is this something you think you will be able to work on?
>
> > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > index 1ead2eee1944..171b90412ff1 100644
> > --- a/security/selinux/hooks.c
> > +++ b/security/selinux/hooks.c
> > @@ -3843,13 +3843,20 @@ static int selinux_file_alloc_security(struct f=
ile *file)
> >       return 0;
> >  }
> >
> > +static inline u32 selinux_file_user_sid(const struct file *file)
> > +{
> > +     if (unlikely(file->f_mode & FMODE_BACKING))
> > +             return selinux_backing_file(file)->uf_sid;
> > +     return selinux_file(file)->sid;
> > +}
>
> I'm a little concerned that this only works for one additional level of
> filesystem stacking.  Yes, I know that OVL_MAX_NESTING and
> FILESYSTEM_MAX_STACK_DEPTH are currently set at "2", but it's not an
> unreasonable concern that at some point in the future that number will
> increase without proper notification or testing and we will once again
> have a problem.
>
> At the absolute minimum we should have a BUILD_BUG_ON() for the stacking
> depth.  It would be good if we could watch both the overlayfs and vfs
> constants, but the overlayfs constant isn't available outside
> fs/overlayfs/inode.c (thankfully it is currently set to the vfs limit).
>
>   BUIILD_BUG_ON(FILESYSTEM_MAX_STACK_DEPTH > 2);
>
> Ideally, the code would be written to keep diving down the stack until
> it hit the true backing file.  No one likes to see recursion, but at the
> point where this function is called there should already be a reasonable
> bound on the stacking depth and the work involved.

Unless I am missing something, stack depth should not matter.
file_user_path() should hold the user visible path, for all the backing fil=
es
in all the depths of the backing files stack.

This is the issue that was fixed with commit
f2381b546e7e6 fs: fix user path of nested backing files

This patch makes uf_sid behave the same way and also documents this:

struct backing_file_security_struct {
-       u32 uf_sid; /* associated user file fsec->sid */
+       u32 uf_sid; /* top-level user file fsec->sid */
 };

[*] For me the "user" visible file is always the "top-level" but if
this comnment
    change helps others understand better it's fine by me.

Thanks,
Amir.
