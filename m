Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345503C585C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422983; cv=pass; b=ews0XzNNznmv6ooa76UtSwwQe+JBAXqw/G3/ee5wpa6CqCoTJkr0spoqECbIy2nRxcErzdBURFz+M0vAZHMuVuYFu0ABAJMl8DHN+8fC1n5bDCJFdMWyz+8N3/BziBlrHlledLZO6Lf8C0go/3Hf2n6kg+vshkThjBET3MOYZoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422983; c=relaxed/simple;
	bh=GE2V7iGy1lJ40QSGCJ1aOi34U1nb6hDAIOvSeMgLVLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZszJpyLO1K4VFhgBhBmNWE+Nf6NCyLnb0d2RR0L1rmkHKW6kYxE0EYXZ9g8Q6605Ycu2+vJKEhHuKKWW3TLQB9KMNrfS5ctswc+5eFDymljOJ72wilXnJnLMeraUfAqMpzTflL0jMtNXbdUKMVRRIzwCeuzjl8T4LXCEalNUhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxqITsm/; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxqITsm/"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso2982945a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788422979; cv=none;
        d=google.com; s=arc-20260327;
        b=DeCoNowEtb/paHQs8sbDsCCBwdwuSXRYE6UI32iShdO1Y7P5BPJ6btC7pO7PtCdo8q
         WOR/q77rFbgOw/KUnp9cfrinS0Xh05eylrU1kkec/p0zzJPCdm5w4NpZJmbkxwdftkDj
         p0BlZ2/KskTslMztXTvfKdqjqBlq614pK9B+ukxbz9f0ZBH6oWlrPprl69ICo9JiUzi6
         S2cF/1kSPUrfeOIpJMGz+YGGzjPg+jdxd7xFH4tpdFmybbzgNllfVfoFGOUCbi80cqvL
         NwLEb24RZgh92oPPogWX3AmCPpVlEENMePSnClkggk3ax6jBsnaVFgG6ZTtu8EnJ77vc
         PaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l7ege4JtjgFHRNv7kt3LuaCil6zWlhJKcEkBUtmR4ro=;
        fh=yaR56AtDYZI/Xh98Hk7zgxN7tMozrpjldQEMv9aFYic=;
        b=pWEe7pJXXFxL+MzWzQQNzx3cJXFrJVMjSKDmtNZt51/Xih6r2hjYARulSSEB2wUfXF
         wGGuvCteS4o1ei2mzP9X8g4/x2BA+Rn4N9iU/j1Lp4bhqrAL9NNl93/bXo12RhC5WBTY
         XfW3XRUoOhX0dKSuJaPZw5sL+6j2djb1LL3C3xGLyrnk8+ekfeWibTf3pb+xksF5ANKg
         goDzOhkmNrBjKdj75StdaOG+7rfnq/Cqqc5489wGNvvQ8IQCWOk/v0PRRsAOFHY/E6dj
         VoTnwUAUr/Vyu+H+0y2ps9US+IijbioRO89Qlkbs2t7PyQrkT1yELOUhVgoyNOswuVAb
         tBUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422979; x=1789027779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7ege4JtjgFHRNv7kt3LuaCil6zWlhJKcEkBUtmR4ro=;
        b=CxqITsm/7UfBXHbg18bcCPFkfOa6SH/nMvjGYaavL2DH9DmbVSoY8Pf1sl4kDGA0L3
         AOblh3QDq24GfTJNpSvBuMxXHKAzgzjGc2YurPDzSbUAH6wr3lVJosD7yhFbtc7IVm4b
         6JlcK8Pm9L2fDp8O+oBnLgH+XZCxlqnhGNGjVYFqqKqfxW8+ESrH8N2gKsBDpM44ckzy
         cFbGGqk/UkXL3ji2oRSRgfvjUqzn2oYyVfUpQDwCGZ63bnwzsE8H3727/mokT4XSS/nI
         cAKrd0rpNJtv4FpKEg7JBBK0pE0qzOzL1UR6los7tdug2CxlGJYfIY6l3+Rm6EbmdXvw
         XUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422979; x=1789027779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7ege4JtjgFHRNv7kt3LuaCil6zWlhJKcEkBUtmR4ro=;
        b=p2W/6pgFuZDECV0KNAa7bXH8kVAhBbWpgBGpFMrm8UM7JBiSu7SJ+J/aH5vTBj+Xxj
         bFqJpF7YeWSM86yFLjgKWMvAYRteaGkHwQBq/HxbuGY3KebGS3oBzqppYiGfXZTpvx1b
         GXPdHyHwgSYgEQFiGsTIECV+SH6hMyMYcfWH7RyyHxzk4+PfSfqPWnyrj5hK+WDYN+p+
         QFpAPGzE/ZwmsQeuoVtcBjXmfjxehXq9I+Z+udoAsXFUhAPn6g6I06V8mfDmxY96xNgU
         OoOUoDDGQrT+/vqKvjInOQjo7mlvKN5vaDPvprhn5z7fKJ8pU12snNREIlgsNWvRko/T
         hmlg==
X-Forwarded-Encrypted: i=1; AKwUvBx9s6cYzZliEhEzNfEdNnOp8BGmAFpXBdlRCJH84YPGWjGGb8CQlZeLxNOmQE50XTIhf+ftcui1Q5ZadAI=@vger.kernel.org
X-Gm-Message-State: AFuF++myFdorjYLYg2ng/6lUf482LwBHJHR7+SLWUfDyCAqEBkltb3IN
	un50z6zVJMfb9yUlqS3gSJvoMoG2UYf+LtYrHS8FClsjS9HFiFeH5zhV2Xr+A6wn04tQzacueVa
	ZOZKx07RgCmK/uG7dlBeqkTRJTLSa1FM=
X-Gm-Gg: AYBFou0Jd6EcHTMmjddgPziyKlAwW9ofDaKA9rOwv2xF8uuRCCs0chPHv+EjPAaM+wh
	qQ/RVlCe9eSv+xRNalsaQ3W3P9z/BTRMxQ+AYZ61OyiJv87BAsPJV8yMR11polhCOC2Yusp9Jff
	mLE/PPiDHEwtekXclvtH5Dtqn8zKkLbVMtEf/x3OhQJ2nYcgia21cSHB4MgPUDQnqqEvLxVTPG2
	OhjejFWaZQKawN/XDHAHBwF3NSs1cFOYz2z4Gl4tRjbqqUb0o48/WybwgyBj1dbWrAd2o7obC+4
	ZClmtZajaRfW8Qx8iiSrmGdsBX3/O17pLcTRCXTYp/gsNvt4nZrGH6EI
X-Received: by 2002:a05:6402:3815:b0:6a6:774e:8a56 with SMTP id
 4fb4d7f45d1cf-6a682567105mr7784290a12.4.1788422978844; Thu, 03 Sep 2026
 01:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903064504.1052841-1-cui.tao@linux.dev>
In-Reply-To: <20260903064504.1052841-1-cui.tao@linux.dev>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 3 Sep 2026 10:09:27 +0200
X-Gm-Features: AcwNN1XMHTJAxrMSsCyIoWLDnNM-q-2UafNwLmU_5tyYTmCFr10VFZDEo8zUcyk
Message-ID: <CAOQ4uxhZOBv93_y4K0mc4PofprdPfSN8c45KW226LR-JO_BEkw@mail.gmail.com>
Subject: Re: [PATCH] ovl: reject verity= together with userxattr
To: Tao Cui <cui.tao@linux.dev>
Cc: linux-unionfs@vger.kernel.org, miklos@szeredi.hu, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 8:45=E2=80=AFAM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> userxattr forces metacopy off, and copy-up only computes and stores
> the verity digest for metacopy inodes.  With "userxattr,verity=3Don"
> (or verity=3Drequire) the mount succeeds, verity is advertised in
> mountinfo, but no digest is ever generated and no lowerdata is ever
> verified - the option silently does nothing:
>
>   $ mount -t overlay ovl -o lowerdir=3D$l,upperdir=3D$u,workdir=3D$w,user=
xattr,verity=3Don /mnt
>   (mount succeeds; after copy-up the upper inode carries only the
>    origin xattr, no metacopy xattr, no digest)

If metacopy is disabled, then the data of the upper file is in the upper fi=
le
there is not supposed to be a verity signature for the upper file data
verity signature is to attest the data of the lower file, so this report
is strange.

Moreover, even though metacopy=3Doff does not create new meta copies,
it still respects existing metacopy xattr, which may very well also contain=
 a
verity digest, so the statement "silently does nothing" is inaccurate.

I admit that user xattrs for verity digest is an odd combination, but it do=
es
what it is supposed to do.

If you want to report a bug please explain how the security model gets
broken.

Thanks,
Amir.
