Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDD937EFFF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853389; cv=pass; b=VV1CrUvnk4p9aKMbAanRDLYtw2sJMvVyszcPPaJJhFQA67izxBeoalapFXyc2ryCH70nt0pBY6okZpm1iPNyqRSTu8Cg/aMJtIusvYQtfJZ3iK5IHqzh1nFBP96hDK5GWAb9BO3CUg9RbqyYwvd0EoROZjA3o8M4KRLzw3R0Bnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853389; c=relaxed/simple;
	bh=lowpFmrvsNjlgMHo2szT6XZJz28KEXOM+3vhDqNGI3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AX+JOS/eJTdrkCr40Y8SJV5LFx3T68EOyfKMvPDm/q8nFsLUvWhSVmBAZwkaUGiy9vn9bF9UJETs5uIOdx15UkCJJYiye8kuGULhHOZzuWTxDozERkWd+reMY3PEgsVDsdmLZ4PH7I1sajoGejyHBGFbHm+QXkPf/ni9Zz9QVak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0Pd+vdV; arc=pass smtp.client-ip=74.125.224.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0Pd+vdV"
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-6755dd402fbso1024147d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791853387; cv=none;
        d=google.com; s=arc-20260327;
        b=S7au2Iw+z+z3/f2OPOTmzvj43y7XAxCT/4XhEDzDEkuhUPTnorPoYJIjryaTTjusgH
         oc0yb56kzFmP2qBBOs4lRbXZD/gDW8Yj7lAThkI1NYD5ytE481aswMlff+ao95zCL8Wd
         BOQsqvFVJ+iIm3pVFoC26N7+PspeM5jBwa0HiOVoqvSsrxaS/f7ppSyjbz5pJzDbdi/Q
         HjIQGvVFo705rrLw/6ZhL70yRCjamguEXioCGbDd3SbjHmafUYi7IIWL2iRM/+O69tGo
         s2IjzDhFsvoEX/NeyHczhlmDBKF7WDLX+PQwfRzbFoxqSrG5NHRbQk3DqnzWR5Npv2f3
         6buA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UTuAYK18jDYjig15mU1GjIAjcvhGQddvH30uBR7Fy04=;
        fh=YC8NBKwV4Na5w+fuHgQknK73l/u0Yhqs4/g8vhLVOg0=;
        b=bqyyMuNGSMXCkzIU0O4OxoaR3fHIDaa3CENXN8pkdbgQK4LKl6gQYaUHyVAIrdNAPu
         pKdAv0u3VsW6mYzwS1hHJtC+wcHxv7uj/6c/J1hS8j7xz4YE/DlQJbqvSjgahZne68sn
         gsE7G0PBuwmmuhxZxuqYUnRDYnYKw//AR1ljP5e7z8XTdw6UYheNVcQ6SZEGQxcZorsv
         wxq0HXVuQLFCFJlIs68knGsPBueFMxGL7R8HbjYw/CTCqg/r0xnbxUBxKw7JxvA7B4I0
         Bb9w0EcYOuFaFzvkmjdsQiITNr/8Zbk+5IZjkxRd8IYAzRUWS/xfC8BvC9MZxac64baD
         dTxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791853387; x=1792458187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UTuAYK18jDYjig15mU1GjIAjcvhGQddvH30uBR7Fy04=;
        b=l0Pd+vdVYxaIyeC3wlw8iz6yekNOjFLzUxorbnIHaO3rH/NPSXb+NfFWPmsMenEmEv
         bN0V5yjapEJ40ueLuITXA8FQniQFbfwC9nIFuE0+6qBL1XWxkosbkJMuqNjwNhxwwQ4Y
         PDlN7gCV/0iikMfpolnJlH3r2IokWltkciwHdptBCnfhnb8u2CIvQ0mUH4uBdWI71gmy
         dvU2895amFkfOdb9xsSCFGqSM26xjPvnQ3cmd6Zc03pYTHudPdOavVG60fJOmBpaYGQw
         0KTDDz4oa+vrQ3WR/KR44iBG7XEI2IGg+XCfsdu0LZUBkKwytGC3cn4BALtHd7W5+pKF
         2FHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853387; x=1792458187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTuAYK18jDYjig15mU1GjIAjcvhGQddvH30uBR7Fy04=;
        b=2PPxgmkptn2gRFmYaeeaeK6uupdLAfu3OGj6UcyMV7AgSNBHsivUa7WVqiis9iYDGK
         rFuz+lVOwLMp6VBrBZ2TK2V0ugywzJnqhqLEw09w0ek8eNdBIml2IwnQWsd8eji/wpa9
         Tv8ejxVJiJRmuE22fUXR2zYvVOTuN0cuWAKNhKi854o3SctzHabtN0SHorSNAcvoGpdB
         eNHHeayEudNAEiDpTz+DVkkFJ4Ip/WAPM0rjX2ErSSJ2CNgRqACS59if3j6T9zoPGqoD
         gNTLwniO/53CzUTPX8aHueCuZ77OckrOFckOEEQcjK64yjOlICsY8RJv+IKeFesxbEwd
         JxcQ==
X-Gm-Message-State: AFq9FYIayjW5psbAywhiMej3spKhaQvsINNbX1imyHU8RNKgSyQsJkN6
	TFLBB05AMEC7yCfW0Ykb5JxS3ddN5soeB8K8/sTIn3315H57NVu9XlLR4v21WgA4Vu3EpkYlBTc
	1XnY1DmRj0dG766FuNaF+JpIQf0ViqEM=
X-Gm-Gg: AYBFou1lig5V84geHBOMe+JFTbpcMFKc3rvT9WgpJYmAr1Qkc5O+PVcI/q9Li+xrNiS
	GYmBC9COxvdnZb9mPW7l5RLOELHFSCPM2XtVP4ACHaBV2dLCK5vIM2TkCXuNezRVbcg+X4d1Gll
	jWqTlMwRYIjfSJmvq3D+W+IB+t2/kTJ+E99AfAf7GAOURsm752dkFCY0FNX3euaszWYtbIMb/dE
	g5PLONvyeJWiQfd+tIIoMx/xIctbZFekJhxrv7YdODwt8EiHZ/T+45r7OxHRylFTv+REPq0YDrO
	AApC6LpPTY4thZbsEbz4R5oo2QIxw3YxZQlusC+es/KDtAaBj8PESfI=
X-Received: by 2002:a05:690e:1688:b0:679:42c1:d156 with SMTP id
 956f58d0204a3-67942c1d3e2mr2820147d50.137.1791853387325; Mon, 12 Oct 2026
 18:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012151857.22534-1-jianyungao89@gmail.com> <as1nmV342j-eUOYm@aschofie-mobl2.lan>
In-Reply-To: <as1nmV342j-eUOYm@aschofie-mobl2.lan>
From: Jianyun Gao <jianyungao89@gmail.com>
Date: Tue, 13 Oct 2026 09:02:56 +0800
X-Gm-Features: AclHuK9sFgO33rPYLTn8ixdiEhdZBta4PDJKOZxl9dlxJLJscw0iQpyhSfFl2bw
Message-ID: <CAHP3+4Dr-XsZggVSf=THU7NBb8RANc5MCREHORkXV5shcgk22w@mail.gmail.com>
Subject: Re: [PATCH v2] dax: fix dax_core_init error return code
To: Alison Schofield <alison.schofield@intel.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, 
	"open list:DEVICE DIRECT ACCESS (DAX)" <nvdimm@lists.linux.dev>, 
	"open list:DEVICE DIRECT ACCESS (DAX)" <linux-cxl@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for reviewing the patch! The revised commit message looks
great to me. I'm OK with it.

Best regards,
Jianyun

On Tue, Oct 13, 2026 at 7:05=E2=80=AFAM Alison Schofield
<alison.schofield@intel.com> wrote:
>
> On Mon, Oct 12, 2026 at 11:18:57PM +0800, jianyungao89@gmail.com wrote:
> > From: Jianyun Gao <jianyungao89@gmail.com>
> >
> > dax_core_init() mistakenly returns 0 on error paths. Change the
> > error return to use rc so the actual error code is propagated
> > to the caller.
>
>
> Hi Jianyun,
>
> Thanks for the patch. The change looks good to me.
>
> I'd like to expand the commit message to explain the impact of the bug,
> not just describe the correction. I've proposed a revised message below.
>
>         dax: Return errors from dax_core_init()
>
>         dax_core_init() returns success when either the character device
>         number allocation or DAX bus registration fails, even though the
>         error paths have already released the initialized resources.
>
>         For modular DAX, this allows the module to remain loaded despite
>         failed initialization, leaving subsequent users and module remova=
l
>         to access resources that have already been released.
>
>         Return the error code from the failed operation so that module
>         loading fails rather than reporting successful initialization
>         after the resources have been released.
>
> Please let me know if you're OK with the above, and I'll amend the commit
> message and merge the patch.
>
> -- Alison
>
>
> >
> > Fixes: 9567da0b408a ("device-dax: Introduce bus + driver model")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
> > ---
> >
> > Changes in v2:
> > - Drop unnecessary goto label, keep direct return for dax_fs_init() err=
or
> > - Add Fixes tag and Cc stable
> >
> > Link: https://lore.kernel.org/lkml/20261011132017.31131-1-jianyungao89@=
gmail.com/ # v1
> >
> >  drivers/dax/super.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> > index 45f84b0eb909..210f4af479f0 100644
> > --- a/drivers/dax/super.c
> > +++ b/drivers/dax/super.c
> > @@ -738,7 +738,7 @@ static int __init dax_core_init(void)
> >       unregister_chrdev_region(dax_devt, MINORMASK+1);
> >  err_chrdev:
> >       dax_fs_exit();
> > -     return 0;
> > +     return rc;
> >  }
> >
> >  static void __exit dax_core_exit(void)
> > --
> > 2.34.1
> >
