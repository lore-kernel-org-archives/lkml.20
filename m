Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70433AF65C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263232; cv=pass; b=ZtAZVqs1/OauCo5vnPsq85UqjmWjAZgakqkh8MsxB4hqke9UrEUnXnKzledpwUwy3NUFI/3OhOgfVoHGiNfF5IiJKNztZUtVf74sGc68ZxDlzvva/jKaZGa+HwvKt/4j29K0sjhCeJc66vLJnJT5FXyw0gKt8ChsGz2Mm0ORXYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263232; c=relaxed/simple;
	bh=WkEWz4mj8V/La5ibN5ZGxZHCQujl3YdUwyDFz4ro5gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAgQBG3rr1iwgCAPgkqns709pA96cXPrptF+jZZx3QqboV4jhUKpiEm8usxd7n8m4Ox5ASA50AblAeE61cPhKkTKgaDqpx6E/Jyb/2ck5g1TOBf0Y/5tZVg37pXymttcpefZWDM46EoJNHkl4mRTNMFEPJhZJc9HwM9ADvTRihk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGQxFILE; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGQxFILE"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a65e66555cso1049510a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788263229; cv=none;
        d=google.com; s=arc-20260327;
        b=SlsBiUBdMlrZFH1g4WycmMGawEUKKmPnNz8ERYSDZ9qc30YcTkIurPTBvwGptN2KNG
         CB+H1aWMhot8SQIAuiKcjrVQEm3p+Yww5b9LNIdDHfhECwjopQrOShWKjT9AAXqHlGvj
         j3A6tZJZacQg0+6jhZOPw3iuLMxAkvtl/XaC/LEI8l2/D32hTTukopYFHlyEvzumaJ1t
         VWeMsXvlNJxRhGuqmIcD0Y7grwmBg4eSDQsg/uRezfQCJnot6Q2dR1b9NNZkk8iDPbnE
         36qy87fK5LmugcuFO1soJVzXCTlHOiZyNNND+iwvAHIMG2PKohFyB9sWcGh+ABDIBFPS
         RzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ai8hKQw9ceu4/718ljCxu801NyMv3a5qOhxDkpE5Xpg=;
        fh=/MdGsI4bosoPpoNhFH+rVEPwecKbd1ksCdTeiYAi0sI=;
        b=DTm1DWi7aOEcsT/elJFVSn2pH1dMJ9Mdj8XWntrekIRFFmQQ+LbfE2Yk3K5j8hqASH
         vu3IWiaxBJ7mL1GjIb9+UZ8+2VGXADA/TB1nPetJIL4uwY9NoGe+J9PCLgL4kvMF3zlD
         HE19ZYSga/FFxFPPGy/rYk4G/pMC2vTWYmSiTsgptAZ2ZJMDhS7dz33HFT91ivRG4ZfT
         B2KDRGKyWG7abfrza+knivfZ7P1fP2UB1b9aXCrkSxflyFLk5cS0vIpoJC8nvhqq4iWp
         lOKv7ut9XMLglEMxzgG0ZBrmf99Ik2CMPrSLdb1SGVJvxEtYTI92KBZszTXhR19oI0Ht
         a5Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788263229; x=1788868029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ai8hKQw9ceu4/718ljCxu801NyMv3a5qOhxDkpE5Xpg=;
        b=rGQxFILEJdbQkHMaTFcQ5RC6dFtu/XFoonkOt07PdOvZw49n0yMHmoLgPsqmmOSCTe
         JZd3TS/UhVxlTcczSSuST8qWQNYn8G1ef8aY/5eyHoAKXBlWZw5tJ4phIOWXXDjhFvPE
         bvNzjVhlZvbp+inQYeK+pnV0sggjieRbmTwa7jFyEN3rcBJnmC8NTbvRmO+O8aurTeJZ
         3mXu6mHne2qhJcfzPb+iPkenpWV0jNypVQeADVV6adcnhUczXi0GTGkfEBBJ6df/WlGn
         2upFAY700E0vTLgcJWGc/4hgdkoeGX2DhSy7q8bKpA9MvXxFCtNmawDv3QpE4i6mp3M7
         ohKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788263229; x=1788868029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai8hKQw9ceu4/718ljCxu801NyMv3a5qOhxDkpE5Xpg=;
        b=WEClHSQrvh5vGg+pIaKP60vpuksbFlQa3+RyGDvgWbBF7SPIuAiUWvTqCv+Yi68V3G
         sxY2dRjMbnZxhNYkeJlapUVfs1a8INFqw6IhiEg3K+e60ggIuQ9Ax+C2LnJfp0G7id/C
         EPavgbVcJXY8fSmPZxKxzr4MYdR5Qehc3WiPBHh8haLha3M8yl/4Q9M11lou+1VnaIfW
         YC30PhO9AcZke7bvuX5PwmIoX2AkNqsuecSbTpzYs21LuMj2viAaH2oooo1cK+GWj4dh
         RRB7j9E/K6vFrHiHrbHyz33JkI7nm7Q77SNc/3EcFFeGSEBOyTvIV2/6VjD/Sp+cBsfB
         GZHg==
X-Forwarded-Encrypted: i=1; AKwUvBySMtGgQNnSRPZs6oMlkjguMWmz2NPngPTOnKqJ4KKTqTz3fVqGKFlFQVIx9IJZ2uRwzPn1wifZVauq9Ts=@vger.kernel.org
X-Gm-Message-State: AFuF++nbDASBQzX77MbcumTH7qjKUeT1wVI8KkOG0DsaV5C/qT6AlSLw
	K8PnSfdCTy3cV0+2t6a/MxyGYIbZXGIYvzdsR/OjEr/yavQIPVhm240mlcyN+DI9vrnMl0Ep/1W
	fZMvfc3PjKFqvkB/RE8lXy9w/6VHnr1M=
X-Gm-Gg: AYBFou3Vd8/dUttFZr/TTVul5geTeqjyPf8Z+VbsQk9jPmE2wz315WN4HxJaJxn2Efg
	KHuZn2nu/XLx+JgH0pOI7MWRDiATv88dV7mNwOAOuQy5uMldB2vsz6BDLN4asGfGBoFeO385A41
	qcK9SIGIl8Lt9vf8FJ+cApZyM4h2D7FWPGA4GJS6fat9vaSFUG/c3Z7F1k/n49pe++uaK2vJAZk
	ftxzpzf8ZfpgNK1yPwt/h3BY2kNVSb5cBuWGiHVyEE4KXj4KsZFAkZ3fLxihCLK020RvROG1pum
	/eTdByjNrzByRgH53ZX0ZXC6R7wqasWXXON7lYDUxrB1UWq8TmkEI1FdLFgr7c8HehwajU5C/nH
	zP+L5Zc6Jd8fWgMMDkYkqhMgDvEqV
X-Received: by 2002:a05:6402:20d4:20b0:6a6:35ca:af8f with SMTP id
 4fb4d7f45d1cf-6a635cab01emr9499959a12.16.1788263228730; Tue, 01 Sep 2026
 04:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728131050.37032-1-meatuni001@gmail.com> <2026090151-nutrient-clay-c53e@gregkh>
In-Reply-To: <2026090151-nutrient-clay-c53e@gregkh>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 1 Sep 2026 16:46:55 +0500
X-Gm-Features: AcwNN1V9ueymiP7ruql3Mjh2nKm8Knc4dBzDaOwVce9PaTuiK_XJMOgz4bU3x60
Message-ID: <CADqcGBkjYpLko0EF9BgyApg6LrhA+cR_Cbg5A=4AE81pN4rRSw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: sm750fb: fix mono image source stride
 mismatch in lynxfb_ops_imageblit()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sent v4, rebased on current staging-testing and applies cleanly:

Link: https://lore.kernel.org/all/20260901113031.161610-1-meatuni001@gmail.=
com/

Thanks,
Bilal


On Tue, Sep 1, 2026 at 3:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Tue, Jul 28, 2026 at 06:10:50PM +0500, Muhammad Bilal wrote:
> > sm750_hw_imageblit() advances its monochrome source pointer by
> > src_delta per scanline, and computes the correct rounded-up stride
> > internally as:
> >
> >         bytes_per_scan =3D (width + start_bit + 7) / 8;
> >
> > Its only caller, lynxfb_ops_imageblit(), instead passed src_delta as
> > image->width >> 3. For widths not a multiple of 8 this under-counted
> > the stride, so the source pointer fell further behind the real
> > per-scanline layout on every line, corrupting the rendered image.
> >
> > Rather than just fixing the caller's calculation, remove src_delta
> > as a parameter entirely and have sm750_hw_imageblit() advance by the
> > bytes_per_scan it already computes for itself. There has only ever
> > been one caller, and that caller was passing an out-of-sync
> > derivative of the same width/start_bit values sm750_hw_imageblit()
> > already has, so keeping stride as a separate parameter served no
> > purpose beyond letting the two calculations drift apart, which is
> > exactly what happened here.
> >
> > Rounding up, rather than down, is the direction consistent with the
> > rest of the fbdev core: struct fb_image mono bitmap data (the same
> > image->data this driver receives) is walked elsewhere with byte
> > strides derived from a ceiling division of width by 8. The generic
> > mono bit iterator in drivers/video/fbdev/core/fb_imageblit.h advances
> > scanlines with "iter->data +=3D BITS_TO_BYTES(iter->width)", and
> > BITS_TO_BYTES() (include/linux/bitops.h) is a ceiling division.
> > sm750_hw_imageblit()'s own "(width + start_bit + 7) / 8" is that same
> > ceiling division with an added start_bit offset, so the caller's
> > ">> 3" (floor) was the one calculation out of step with how this data
> > layout is handled everywhere else.
> >
> > Found by code review of sm750_hw_imageblit()'s internal stride
> > calculation against what its only caller was passing in, and
> > confirmed with a clean -Werror build. I do not have this hardware,
> > so this has not been exercised at runtime on real sm750 silicon.
> >
> > Fixes: 81dee67e215b2 ("staging: sm750fb: add sm750 to staging")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> > ---
> > v3: Added the version notes below, which Dan pointed out were
> >     missing from v2. Added Cc: stable@vger.kernel.org, flagged by
> >     Greg's patch-bot since the Fixes: tag targets an old (2015)
> >     commit. Added the rounding-direction justification Dan asked
> >     about, citing fb_imageblit.h's BITS_TO_BYTES() as the existing
> >     kernel-wide convention for this same struct fb_image layout.
> >     Moved the "no hardware" disclosure from an email reply into the
> >     commit message itself, per Dan's request.
> > v2: Added a Fixes tag. Moved the src_delta calculation into
> >     sm750_hw_imageblit() itself and dropped it as a parameter, per
> >     Dan Carpenter's review.
> >
> >  drivers/staging/sm750fb/sm750.c       | 2 +-
> >  drivers/staging/sm750fb/sm750.h       | 2 +-
> >  drivers/staging/sm750fb/sm750_accel.c | 6 ++----
> >  drivers/staging/sm750fb/sm750_accel.h | 4 +---
> >  4 files changed, 5 insertions(+), 9 deletions(-)
> >
>
> Does not apply to 7.3-rc1 :(
>
> Can you please rebase and resend?
>
> thanks,
> greg k-h
