Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D10F31ED83
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365600; cv=pass; b=dCHaWiTaNpfc6uPHHhMQcUdvfYnDDFs60nNGRsV8+Ti1zmdbRoz1JSZ7eThKcwyomM2BiDmEpxmw+TjWg3ihD/iwJoDwEN2IEsvHt7tgrfpmaqoXe8/ZtIiiuaXwzJpm98fLAFtSynrPdjftNowZvLa9w35ijB4m7LlU4uDk5W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365600; c=relaxed/simple;
	bh=gChNhpPmIRzVuVd4Nx3kZHJx+TICbXpHZEw4CFKr3e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gre2aud4KPJll6oL6ujEYh0AODjJY2JhQcYUd1QaYN02OeTE9ClL/vZOgWHeAsare6mgeri/4tGVxKmJiDhxzfWsuwfpWirx4n9sDuLQgVjeKVphs5IBIzXos28tBd33g06svc/kxKoOKy8JhG0Bo+E+LVzQrirc5SpzDMOE3sA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cGxvz7F2; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cGxvz7F2"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74ab99038afso960194137.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791365582; cv=none;
        d=google.com; s=arc-20260327;
        b=aq8Y5YY1up4zwSZmZFzbHRfsWSI2gsdE3WEpzKAOfPmrJULb88p7diUvWXheD6m2B0
         B0iQvWfu8iH1IEcUyguiTYFyVQLiOfYKuvw/foWwPUaOpc7uzBKwvQp86UiuXKXCRpYr
         ykhmK0Ol/eyXPmDCv2/E0M3lyabXiD6xovkwETUb2Qk/1iS7OulipZGchlJiciRgNvg5
         U0y4INIg/hwKvVa71SUNKNSeyW65FgprT9BBvMqTJ0gRO09s5MRvJZZ9oWQ8N2LYsu1s
         bxsHXgkbVtXq1UbC1kXzgEbyHExT9t5nvzSo0RdqdlCK0UONYENlO3pCkZUfHaGdaCNf
         ow6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gChNhpPmIRzVuVd4Nx3kZHJx+TICbXpHZEw4CFKr3e8=;
        fh=UTjlYYsaUgtm0H986SDytPo2OW7jEG63geOGzCCcZi0=;
        b=Nts7shb63DypjeYP+xnLwih/hb4Ty3O79AS7zMG8YVkTJj4PK+Sr1e6Ct6LxBVHeZy
         okxiqhprJZig9tWN9VhJhlZ3znQ2s7/HmIVKnWzztVBgSaA4+OlDggL5K0+DKcKMOVOo
         220/vbZu+Xq4nFSZmHSttfRiGVSUe9ugKbVGZqr03aUL3D3wABJnkKEepOP7v2GRUD3v
         1l/Yb+6+PEI6DkHYxs4N/Ol0JgC837Oh9jI98X6vQd88WjQh9jb3PE7yp+hC1NIseJap
         lIi2vF7+MrCSCf2VjhOJ3BuW8fv3fgmv6lNyUvGqKIDTjNHvpRnDyrU1zgxiSR49KQ0j
         Ihow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791365582; x=1791970382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gChNhpPmIRzVuVd4Nx3kZHJx+TICbXpHZEw4CFKr3e8=;
        b=cGxvz7F2xsgewg+EkMIpJs5UZPbYtH8Xh2DwFZWj8Mjj1q5zcAoNrcM8IVYNSZEQhk
         xWI8ggQHyoa8gMJRkAfECPmsG5VJxolbooHscRh+jwwFbj1eV6pz33kOM3U+hQOtUAnJ
         pAhoo7BJnKL/k/Zm1nnmScEoa6AX0Q6oieeYbh4FIWxTy+3x0lHKU8E4w4XwxnvJdvgm
         bJ+1eLHoKg5Nl+q3s7s/wLl4oh3V3sZdkbAjS+K2VTeqtj0p0fhR+R7vimWSaN1KXFAS
         rFX2LlOPl7q+eU1EQG4VetT3s4/vG2SxX7laswtRNv65afq7oPfsmIbyqCOrDHhiVoFH
         nuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365582; x=1791970382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gChNhpPmIRzVuVd4Nx3kZHJx+TICbXpHZEw4CFKr3e8=;
        b=z2vvHOyhCA3yl3cxbUfSS9DX88hjANe7GoDmy0xi1OERBs9I1A5hg0XVU47xtJgB2L
         blePeTCRqIzkQEL6PBFRntAWAdp0lqyx37rCPgSRYEZksbORQetM1bnwZP4DXCEd33Dj
         6ZtDF1luaqSTfeCouiQQtKeXivFpQBw72UR90sb2os1n5dR+r0vQWdSxUCNW+lexdzYe
         gvfUd1TqKeov69julu0oKjq322zc5FThP9PjxjPOo9/L2WMQfmfqKvokR1g0A08ZT25p
         D4IGyJxvgjoesuMddM46aPYEhvWEgTcCjafrRjQeCvUuL+WMh+BqcecRNLg8OniDRUYL
         z6yg==
X-Forwarded-Encrypted: i=1; AKwUvByazY1JXm8/GhfA8C8TkW2wU9F+k6EMsC32sjQIMWo72gsvcwybV9cEOvZbHJH31Sk2nIxxc+7b/IUyVFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA6d5/2RByQpO5SsWsPhhKkO71rbLfjLePEt91CvikdNoW4vEx
	8493HIbIgm/t7T0tYHqyfHgW7roplLMbgb+7lHBPvGp0A41KPv8dL+CZjUFX4AQwlEgKDirV4U6
	R5oyA8qzaFM6/WhG5zwmmeN9SqYNRBBmJ7wBjqec=
X-Gm-Gg: AYBFou3YgML0QBFXCP5K7s8xlh7bcCd7zhmbKz9svaQaJhM6C0fI3MF4q1OhHtWs+Wf
	GTV5ILtVAN7dHNOnLq6oFUBQ+7M9FLgKiF4g0h28qaqjTeRx1HyYbo0R+r+lh+d3/I3Pt0QGEK1
	jebh2lkwYXCr063ZQag07JSVpjBRBiXQxkovWFuOBV3NWFynmpzTGg2BcS0mgV0bNB9OxxB5Xs/
	OLAFZMIt6UeOa5YRr4oEHSDyUZg4paBIVR2RLnhEX1qXybSDAmEwvnuPhlu1m6Pb0bFJNNOAr1d
	XPGohdqiGscvaaJ0Vv+bMQB90p/usyqIhSCzFyjFfE820i7PKwO/uyJXsUjMOa3m1sH0kNf2Ana
	/Xl5aeNb/4X7VoFmbdbMN
X-Received: by 2002:a05:6102:808e:b0:7a1:88cc:6787 with SMTP id
 ada2fe7eead31-7ca38912387mr457577137.12.1791365581501; Wed, 07 Oct 2026
 02:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261006094358.2948476-1-morbo@google.com>
 <202610060642.7C4125F@keescook> <20261007090915.GA1504630@ax162>
In-Reply-To: <20261007090915.GA1504630@ax162>
From: Bill Wendling <morbo@google.com>
Date: Wed, 7 Oct 2026 02:32:45 -0700
X-Gm-Features: AclHuK_Xc-2s-IDXfEqf9QTUl62NLNcyE0G5JoWqRVUXRHBcaDN1yyh_K1ccOqQ
Message-ID: <CAGG=3QXPAa-i4r3Vv6-q25A6EvsxGb5RDLn02z1=a5zo7W-7Vw@mail.gmail.com>
Subject: Re: [PATCH v4] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, ardb@kernel.org, gustavoars@kernel.org, 
	ndesaulniers@google.com, justinstitt@google.com, broonie@kernel.org, 
	elver@google.com, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	peterz@infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 2:09=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Tue, Oct 06, 2026 at 07:12:07AM -0700, Kees Cook wrote:
> > And other architectures solve this problem by not wiping KBUILD_CFLAGS =
in
> > the first place. :P So if we want to continue to accept the x86 excepti=
on
> > (which I would argue is the actual problem), we likely need to, instead=
,
> > construct an explicit export that is used to collect parsing control
> > options so that it can be re-included here. Today, I can think of
> > -fms-extensions besides -fexperimental-late-parse-attributes.
> >
> > KBUILD_PARSE_CFLAGS +=3D -fms-extensions
> > ...
> > KBUILD_PARSE_CFLAGS +=3D -fexperimental-late-parse-attributes
> > ...
> > export KBUILD_PARSE_CFLAGS
> > KBUILD_CFLAGS +=3D $(KBUILD_PARSE_CFLAGS)
> > ...
> >
> > We already do something like this for CLANG_FLAGS, which, given
> > -fexperimental-late-parse-attributes being Clang-specific, perhaps we
> > ignore my -fms-extensions future-proofing, and just add it there, but
> > it doesn't look like that is how scripts/Makefile.clang was intended to
> > be used.
>
> I agree that fixing the x86 efistub to mirror other architectures is the
> right fix for this particular instance of the problem (as you note this
> is not the first time this has bitten us). However, we may want to
> consider adding '-fexperimental-late-parse-attributes' to
> CC_FLAGS_DIALECT as well so that the many other places in the kernel
> that blow away KBUILD_CFLAGS won't have similar problems if
> __counted_by_ptr happens to be used there, as this type of solution
> might not always be possible. We could rename it to CC_FLAGS_PARSE or
> something like that but I am not sure it is strictly necessary.
>
Ard,

What's the reason why x86 doesn't need the KBUILD_CFLAGS flags? Is
there something that breaks things?

-bw
