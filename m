Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7303E3E63B2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601346; cv=pass; b=e8beTvLACsE4zrvWuox5fmiNfj5YnMGowpPiqKcfblw9lWHCRDlWIKVpOgjqaxzWmwHi1v+pVbo89CkCKXHHBkhchCsySo3O+kVihBFqtndYFnuGsVGPwJMZqX7OKGU/LuS6xwMBrDs54U/kvdkn3/kYH1snU3oWux26DTARKyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601346; c=relaxed/simple;
	bh=2JbdcFlbwfG0+BN4/7ewb7NjxsWd8VKSFwj1N3q8G1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jP2FTuqo4/uICmcn3ytvjIcNBXaMOoJIDK3gk18GnTAqWy/yKz14Zj4NQXxAULnEKhlFfeGC6KX8BanKSWi4oARlJpGCpbkB1KaXCSYwykimVhHt/Kvl0kNa29bbS7143nlHhuQJ9q7/6SSRKX+2W/9cJYDWMC6wquJ5L8NkDWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSDUBs6A; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSDUBs6A"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a1f628b0afso14811191fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788601342; cv=none;
        d=google.com; s=arc-20260327;
        b=J/Ba2WYGiZQeTVtSU5xbqkAboJ3hKgHbomeG5poL5TdV+ZZaUYqjhZTrjBQTFsGlpR
         ipSqxdi7AJ6+qFg4FKhE3zfaTEqzUGHN4n2Vd9lzT5MYvk8qXZBTAQas9B3Txa6iU7vz
         XJ920v+kHg6oRZgxEUH8cEXkkAmyj4ERpL4sgKPVwiJxm0cYhAgbHhwnfKPN3AbzL3c+
         IRZwRSb8PSwfVU27Nf1BC2KiykjpTfiAiY4sTq6oifz2G2aU8jjEx7D+UO5rh6sMMWrx
         BT/akdSlMpBCF28JSel6wuznz6qSiqwgJ5aMTDytMJCX/4W1+cYmxArmhtdnzikO0ZTa
         Mhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XjYP77sux2WBwE6dvdQs6V9eSE1W0uYTxsaIvsDbCUM=;
        fh=8SNJaVxBKSRm7Xr0swt0SMk2z7mfFvy168P1omvqmQE=;
        b=oLfo0PNoFaU4wSSajmzohPeRL5ycxAgOqLilNcKJnv2ICcOmtmMh/e5LUq/vfLtThu
         wmufr0icbo0MG2s1HeZrmonQrB4GxDLlURu0+XLbFeaKrPYtepF177HAWRDWI94mGgBN
         /w2QZkwATDuPU0i9a+E3Vd0FwT0aQ+ojUR2psNG+ithDJ2E/eQ1YpY1latQwtnBUtZ2e
         H0x5oFMdufeV80ehQN8EIbeyzSq459VjKhamnqsvm+p1jDzhLabgFLUUOjteHxazWoes
         77pejkBlxXSaMUXyB5nSwj8RN+fNwgd9RQN+OpI5+EwIJxa//St2e5CkSg0maPOlbIKp
         185w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601342; x=1789206142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XjYP77sux2WBwE6dvdQs6V9eSE1W0uYTxsaIvsDbCUM=;
        b=VSDUBs6AsOlUWehpmHSRv6DScVbtFdgTAetm+DPkcsFy4nM0FHu0fNOG6C8urYsKmX
         AzTmK5wrPOhKUoNQ0MFI0KCu14mSAHnFqvnYGc2oLTah0aYZ4LcTcyPhpn+Pl1ue4z9K
         JimdxBEa9Z+TCKuJJ5GPeTiPOB7Z4fn+m25DrkGUnqsiRRVxVqYLUPJbfegwweNOaWOX
         H6RHCJpthsysC/X1YQvBbTMV3d84Vd5M6v9szaK1aWxMzBUB/ZOVdlQFHaQkdyac4xkF
         lG1tS8v3ALP5JrUlEhTX1sRUPVupUng0LK37rWWU0rhmcff4WEjhJnjACt5VagA516RP
         CgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601342; x=1789206142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjYP77sux2WBwE6dvdQs6V9eSE1W0uYTxsaIvsDbCUM=;
        b=Jwd1JfS6T1oJEHx2bYicyTV+eu4yi6yefH6f91UqLM3io5Vvz89vFIn6I4OJB36akd
         H3PbWuJGgkw48lV3nXM//aomIlrJ1Syl6aL1QWIB9Lk76QlxdRShfmkzhtdQi7kWKzu0
         I1x1ScUlH2mzH5TH+G+p35VSzboyV/3PvPB+9p0C+xg6Rv+cDiimwh4k7C/qw2u3QnZM
         1g9NVxWEO0cTrCYY7cHpE0pNzCHeBIq9EHJITMIQJufMDw7zPzguF3vc1EqaRh/e1zXA
         PGvz2r+dgJ7MYbCqO2kT2iHL/jr+3F/AD4dtXZ1Oso57vh+ldX4vns1JUlkZpERjkJAm
         aSYA==
X-Forwarded-Encrypted: i=1; AKwUvBwdmNwKUjI6KQEdrY2rYszpTn8LbzlqT93QiyguskrrrNj8jMmkpXlgzrFa35xix4ycqIY1usa31ZgbEJk=@vger.kernel.org
X-Gm-Message-State: AFuF++k8Ac9ImhbeBa05WbMkJFw14tP66mPIVJZRGEvM/hzFjZq9BV95
	mjs8wmbfsuVyQxsAVq70Yv4Y9mA2pPFVi31xliUjW6NZYcSUpNarlRpT2y9Fhdi45UOeHHYkIF0
	PTd1Dntfb6Vv3K3vlwCABqVroLiJgswV2836fOHo=
X-Gm-Gg: AYBFou3UFDLd+O/kNOoSA82rYdLITR4+zCqaVlIUqmGmSWvAq5KCwIS5v3NJHg1dYjO
	7FUZ2nCWRzykc5mI4mTtvCFz18oOOXGHfRmI3w9uSBh5jAQ/U22XQcAx3jNQ4mOepasQTFe5rN6
	oRgRKWZDtvRINX0b6/YTCNJGd2A8fImIcOr+fRMYJsuaXDGunDG32PHjdP3Kh/jnf6UjZSxY7QU
	1KOA7Q5eUB08XD4kQXWSioBllK8tqVvTDDWXXSkMIJgnoaM4AmuAcmjTPYutEwObBk0Nxo9FzQi
	ufCyS/Asw/x2Npm9PY2AV1EyZ17/mVN8GJ+4QZ7hxmbHXmPk3T6VmIqYwMg4x6/+ozyh9UqOmI/
	sgn568/MIPqqZwoJZELQHHl0JjXG5E7QGD9LxpSdWXQohHGCBFKwJv2aBRDITHWjvIY5QUg==
X-Received: by 2002:a05:651c:a1a5:b0:3a3:361e:6f1a with SMTP id
 38308e7fff4ca-3a371f50b18mr13337611fa.12.1788601341855; Sat, 05 Sep 2026
 02:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082741.578048-1-ubizjak@gmail.com> <20260904082741.578048-3-ubizjak@gmail.com>
 <CAHk-=wiKvgXTJAXveUoWq0+Wn=E5255-Uc5ZzhXDgk31iXEZgw@mail.gmail.com>
 <CAFULd4aynHJZ3hUbXk5WuyreNDE5D0RppiZFsGrYmQgiaqvVAw@mail.gmail.com> <CAHk-=whYAZQXQ4X2kDjigwhE5W7qwYWR3pHnP-67ceYChqJzvw@mail.gmail.com>
In-Reply-To: <CAHk-=whYAZQXQ4X2kDjigwhE5W7qwYWR3pHnP-67ceYChqJzvw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sat, 5 Sep 2026 11:42:09 +0200
X-Gm-Features: AcwNN1VJMaHSnAOC_Q7rt1Emj_tVVpCNwAN4IAqYt-yWqjtP6h9Y1x_UMWvJeA8
Message-ID: <CAFULd4aHBevLgA-fJXx+Uh-JHZSnDRsgU6k+XO2+T8HS5QEpfg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] compiler-gcc: Remove obsolete RELOC_HIDE() macro
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 5:40=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 4 Sept 2026 at 08:30, Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > The cast to (unsigned long) should remove all compiler's knowledge
> > about the pointer and force the compiler to use integer arithmetic
> > instead of pointer arithmetic. This is what the generic version does
> > without inline asm.
>
> Yes. The question here is that word "should".
>
> It's not clear that it always does, and historically hasn't.
>
> To clarify: I'm not against this patch. But it is potentially
> dangerous and could expose things. See for example:
>
>         /* RELOC_HIDE to prevent gcc from warning about short alloc */
>         ptr1 =3D RELOC_HIDE(kmalloc(sizeof(*ptr1) - 3, GFP_KERNEL), 0);
>         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
>
> where RELOC_HIDE() is used to make sure gcc doesn't do certain optimizati=
ons.
>
> Is that code pretty or valid? No. But it's an existing example of
> people using RELOC_HIDE to hide things from the compiler.

Yes, this one requires inline asm. The testcase:

--cut here--
void *baz (void)
{
struct {
unsigned long words[2];
} *ptr1;

    /* RELOC_HIDE to prevent gcc from warning about short alloc */
ptr1 =3D RELOC_HIDE(malloc(sizeof(*ptr1) - 3), 0);

    return ptr1;
}
--cut here--

compiles without warning with the old definition of RELOC_HIDE() and report=
s:

<source>: In function 'baz':
<source>:33:14: warning: allocation of insufficient size '13' for type
'struct <anonymous>' with size '16' [-Walloc-size]
   33 |         ptr1 =3D RELOC_HIDE(malloc(sizeof(*ptr1) - 3), 0);
      |              ^

Also, GCC > 4.9 has its share of problems with "=3Drm" output (e.g.
[1]), so the output asm operand constraint should stay "=3Dr".

So, RELOC_HIDE() should stay as it is, and the patch should simply
remove the obsolete third paragraph from the comment.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D124209

Thanks,
Uros.
