Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6446C4BE451
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215590; cv=pass; b=MhVJQlmcJMYEY1uHSFbtMqqnopf6Cvy+VosbnzFFxjzrN3YsjzgLSEvW5/5IwqDzPYUbADLUVi7YnueHF8XmCXFYRRjT3B7UzcfM2fPV3NKzTXZsNJs34RxLUyzaGAY4Ppt0lQBwP9clAZSBytUsfOcm9liKtqXcwp7B/RhePgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215590; c=relaxed/simple;
	bh=+fhE2wZv1FEvlLdfLhyZ2/HtD26fmXx/IX4kZxtllpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LCV/2kgSvWJMXgJZ1WHL0m6kRUlaAbzYvEF/+TwWVS54ueMijse/ciiFWe10nWD/LW79pD75b2zKRsFx1UntNMvB1nkE/NbK1dtUHDn8dJ9BjhETgMp+BXxapdOArI00SwdJtJ6OkmxO3tft9P+HgGzEv6rAEGuipvVcyZON4YM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XyoKBQu/; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XyoKBQu/"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-98c887ba689so54587241.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791215587; cv=none;
        d=google.com; s=arc-20260327;
        b=PeHAJr1d+0C2hX0iXXpNR1XQZYlnf9Sxq+zBua0t4eWb9q2lEXMGGDnYgy+Ls1bXFC
         nJcmsIn//qYJJL8xdVVuPmJq7od7odhCniQI1WA3V6chzpEI87eiINIxo8mhJt9lui2b
         wmgC7T+VHBizV4Cxw6ly1z1PaW22vpjyp/Wj8uf/FkOvBW9ozTE0gKUkclpwEX06qQpy
         sl+BpDypUnf5WKyzdchtLrkhEGVEbZE+Poi2Bt3OLaM4SZurYH4DdYj076Mflo9E2/MT
         pQabQjU/UhblU8XU0+hnuzEkwW0iqErU0CAB/bPSPRhaNTT/IRzgE4UZ9/ctzdCoZvcu
         5Oyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GD9Mu7WM6+mJJxlJEE231dGqw01YMMCu766c9NA+OTM=;
        fh=Slkl6DUyNa1dSS5L+y3kVgLGvkDTCeMdZLejGgb+Uv0=;
        b=Sy00pJnJI/OFN1v2bwvBPKzggfetUos2NoQkHfF77+6Ny9Ib0X6zwgEe2sDG++Wizk
         RqWDjLneySKVtAK9oLmqK7P5tZgIkGzc+RK6/KZMTKZx5sLvUHWrmFJK9CaBo8/kv4Rv
         4lAgv8iMBRpbhbawj4MOktZZC7hPN53FiQBHRCqs2LbZ5Ie/iiHMwIHPyxr23tBLQblJ
         8jk0NPwUG1WTT040jTXirGCHuOOb+iKMe3h5PW0kF+qk1gON82tMCL7zGui/f4hNMVNi
         Hb1DvXxHrCQy3qRBFTfjDAmlGE/SqEY0Qw0ULPbmWXcC9p3ekyyNwi+DM2BxhAWDDFhL
         rJdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791215587; x=1791820387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GD9Mu7WM6+mJJxlJEE231dGqw01YMMCu766c9NA+OTM=;
        b=XyoKBQu/QKOnUMbBIROdqh1d6n92HEpTmUrZHlfbprmroozdlHtcVMDkOO2eikyyS4
         kuT+HqoeEmw+aWvPlE1x5ulrp/Og1ZNz/GjsXvJVdBpRaEkJNk3jWWlMFpsIZhHTJzVL
         Mv9Fwef4kKCVrjtB73Jjvp77pnpz6PmNBv9SD6edpSHV25hUZzkR70sSfNhj8hSkjwO0
         vfv6hHx9ieMmzZFybmaUFNCPrHocjtw5saPkil4NQrRkik28iN3RShfQmQyDMbo6uNeK
         kw5J5ysvB30EZ3ntaChEXOj+6Kfg1bf554fJK26CiZCT9bxGm5GXWDH+zn9Dn1BAb/aE
         /5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215587; x=1791820387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GD9Mu7WM6+mJJxlJEE231dGqw01YMMCu766c9NA+OTM=;
        b=Oo5JtQuaVWZdGNIcTw2iA0i7oJ252y6NzNP5QnZ9M01n41oTd/TkMXbUbtOD2ZD2S9
         BZJxeoSSJNiEFTSxICyO4doUygrbuoCtwuh8/F5apMzD1PGLvP/SjGirzEllw+k0Pque
         rW5Va7+Zw8r1QsMpV1aVnpWifvQ4VXKFQBvF6bHQO+84bbfUyfl23Uz2hQDKhNmLRx+l
         xLk45hhB9OathQvdzeRayBYF/1c9XwvU7Bvv4ZhOiRFXq4KPeYQbLGuxZvz+wAn2x07B
         YykTZj6mxE1OFzjNZi7zXoc5jwHzqinA6BJFyNfNzFOjhb9UBW+8efNRTJZ6zqoKbM1F
         0xPw==
X-Forwarded-Encrypted: i=1; AKwUvByzuEnUpeHpCy4OmJ7MbWHLEuqxG2hJxtPHT1c4+baoF/NoD31CTKApYP13KnT8Dan5QkP3TkMnFyiB31k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHPt3NKvxrf4nSLRDru5CCdr8o/cZpE6fJeeKcNEQmWmeUWRkV
	8G4Qqb4ZzwtA62LlNj2P/oDqDq9JF0m4KCW47ZVgIpqiREXh82Cw8BuidMDEwVsslrLQxNoBGnA
	102y0UrWws76vLOgF/GCUKo5De/dG02fPTSdw6y0=
X-Gm-Gg: AYBFou3hOyj2DCZa8OMc3CwOWrD46iVLqm8kCmpdTl+3jnETMlEzpyVXBPlasGS1TRL
	qwYIV4AtIVctrckMyPPzQR7XZNAFKm799G5zDp9bLSsdrUoq+hMX7gjR1wf5o3MnT5sxrKQhQ2Q
	GB+MQeBgwHgDJdKB1cidNBISmVNKnvMHZOK7TANGL2PyJyqu/rb2AoX+iRfl2wT/B7snok5uOi4
	imx91IvNNZ/WUwkKtmbGRsXW+0Sdl6lP/QIzSEXWwmR3ACqTS/t8uc+i55BJlYXDKoppjllB4tX
	POwITWzeWOQ5VKbxE43Ug7x3CZhrBqJFtAa/ftm25wYbe+BXROH6IvRYosMA7IaZCFKjyMi1SYH
	ZfDJdT8jwiHGEpiYB+GzS
X-Received: by 2002:a05:6102:318a:b0:7bf:d09:8f65 with SMTP id
 ada2fe7eead31-7c7e0cd91aamr7307137.13.1791215586222; Mon, 05 Oct 2026
 08:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <ea6e022d-e04b-42e7-b526-ac96559b3633@app.fastmail.com>
In-Reply-To: <ea6e022d-e04b-42e7-b526-ac96559b3633@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 5 Oct 2026 08:52:49 -0700
X-Gm-Features: AclHuK_Gfowy8Y-I0Ooc088gxc8QVe3LPtj8zIs2qHUBLzmWW-HnmUT4ck7UGKI
Message-ID: <CAGG=3QV+PmsOZnM7+ss-6K71nKyRLzpJirBmFQSo3vuLMqDjLQ@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 3:54=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> Hi Bill,
>
> On Mon, 5 Oct 2026, at 12:25, Bill Wendling wrote:
> > Code that runs outside the kernel proper, such as the EFI stub, gets
> > nothing out of the counted_by annotations: the bounds checks they feed
> > (FORTIFY_SOURCE, UBSAN_BOUNDS) are already disabled there.
> >
> > The annotations can also break the build. A __counted_by_ptr() that
> > names a member declared after the pointer needs Clang's
> > '-fexperimental-late-parse-attributes', which the top-level Makefile
> > adds to 'KBUILD_CFLAGS'. The x86 EFI stub builds its own cflags and doe=
s
> > not get that flag, so it fails as soon as such a struct is pulled in
> > through a common header.
> >
> > Overriding the macros from a Makefile doesn't work:
> > 'compiler_types.h' is pulled in with '-include', which is processed
> > after all -D/-U options, so it re-establishes the definitions. Follow
> > the '__NO_FORTIFY' precedent instead: let a build define
> > '__NO_COUNTED_BY' or '__NO_COUNTED_BY_PTR' to turn the corresponding
> > annotation into a no-op.  The two are kept separate but parallel so the=
y
> > can be folded together once all supported compilers handle
> > '__counted_by' on pointers.
> >
>
> I'd prefer a single macro here - if there is ever a case where we need to
> turn off one but not the other, we can revisit.
>
> Otherwise, this looks good to me - thanks.

Hi Ard,

I wanted to do it this way because the two attributes rely upon
compiler versions, and this gives us more flexibility. Eventually,
there will be Only One(tm), once the minimal compiler version supports
both __counted_by and __counted_by_ptr.

But it's a small issue. I can resend with just the __NO_COUNTED_BY_PTR part=
.

-bw
