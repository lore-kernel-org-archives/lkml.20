Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC413F0AA7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294392; cv=pass; b=l3MCbWMWDivCCLKcPTtxLOWSIMuos9EtEuD1nWixXatOEdzvsjA/Cyc/sDLRGB15vo/HAHG381ZQ2GvWWSYCdjiw9wofmEgBFO1hF/TiyxafPha66svaW9wehw35Af2mAmYtCUoJbeAdCqcWnYbNsk2fJg+CrkIFI01P49X1apo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294392; c=relaxed/simple;
	bh=C4ZK4y5jqDlopKlvsMqwakPYMQHAT0xpUCwWJwaY68c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5EE+RBENM2UQdmksdj6IWGzLiWPAIHACQsh3PkUVE+oW09pBvn4fcNXFYAxQdigd/PMPrtL8W2vEX2TO1NJ8X1HCgME+Rq6/w4dGaA2OuKuRxqDyQqpIWhim4VEdIYDo8TUhc+uyvdOPg8KzKqhFyLXjtPaDiAXXeAedXrq6aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CHxHZPbm; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CHxHZPbm"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5cdb9cb8019so1302750e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791294390; cv=none;
        d=google.com; s=arc-20260327;
        b=RTAyCgOv4HAjhsmf8hzN57Hu60/XO62UI7I0i8zbQZ8vxUesxeeCjm72lrTQqslRxT
         D3HdJr32jH8tic2W3j9Udt41VazPv4VEMmQ9pePRehybiA3PM2iUwj6YvepYtZgIBT6a
         26sj6s9Id3YC2TUXsU7X70Ruz8fCYq+76MlP9kPjjA0QUDiYNO1knv4DFAGs1QO4JBDO
         AaKGUdGZ2Pa7gladysofVsEId+Ov9SD0fobY8AnZBUFziNLS2Cp1oovOydeazI9GcpcW
         +9GysrCpOSYaIsgtk5RrzN38EAD+nDLuiNW2fGYkB+TDsRFvw9g+W954A3FQMU3cPc3t
         Fagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pm8zUZvlBkdi0wY1ju+p+rWxMJ6Dlo5Q1LwsdfKGfK8=;
        fh=jJKWh/DKIG8hmfS/TdBDRDFAsPPovySY52xeaMzHUbs=;
        b=EpW5licP20/UzCeDk6U6Y/6r0vD54sDMQ5pZDPWLu03teQLP5pfKrGYn2/L7FHd8K8
         7NMlwXSHusgg6kdQAuYaUi3C9sdFbBuZjaUnAQgSmpd8LoSWFsygvzEU4QEtCXu2Otx5
         7k3JJAEP1E7UBC3nob+HxXhu9oGt1EKUyrLuuhocMEoPN9mqDyFYG7qj6jg+mzAocsod
         CqEr/T8+sq3ZU487ZX+0WM4d/JU9VhH5Nn0NR4rV2S7eXw/bWAQVooAcx0GWoiPorfai
         seigc8layScl3MfFuyq6sHl502BpLNgocZu0WUKTsgA4FeCMkJSOaZMUHK48jM1s5XW7
         hiWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791294390; x=1791899190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pm8zUZvlBkdi0wY1ju+p+rWxMJ6Dlo5Q1LwsdfKGfK8=;
        b=CHxHZPbmjK81Eem7IAvOyaGw6CHBxZvKKRqctPDVWViClwCdND2OXzb7XsxGMizNtv
         gBur4WcSSCiVtcdIfbPPx1HiFbV/3XZIQSDi0eJyshewFfXBIw29IUcDoQIrQvO4qAt0
         Nou6T8FumIVonVsoN/SYveogMPZeu7oKk5ONZProGhTznQ6UUFYl1LsoaGeDCE/vtL1M
         px8h8yP8de7hxNLEuCeVj9c3Rd2Nj3uisdGN4mubCXae2DR/0yhSxt1MBfgxlKK7ttxH
         LfsgE4RnUZuC6RZI0/GhfAtog6S85sjArAZf1zjXzxdxOcbm1z4OcOZ6aqGxbnnGn8HK
         zTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294390; x=1791899190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pm8zUZvlBkdi0wY1ju+p+rWxMJ6Dlo5Q1LwsdfKGfK8=;
        b=H/khfG1b9W4Fd97oWrXciRZuNFThR3QXW+DwVeMlsptX2MNqxNvTId1kmHLSVqO7dP
         5b3sDXyLYrBy9WGYl1yG9O7MXg2AXjwuw3+T/vzQs35M76OHj3oHsqIIl1y/YHJVDgeh
         Cq9pKpTGLw67JmojSCjW4G6gsYyaV8aR7GG4n4b/t7oRRR7Uz3b0H381h1rju/j9XGy+
         c39/A+DuBUMsn6SeexNpRx5PjRWG2QysYaDZyNlPJnxm3MXdsEySINUpwXeWw/gpifAM
         +RaUtcSvtn1KFU6b+34JjaRvt+jlEL4mM/+I4jqheL0rRwPVVMcodFHK8R84P3YqCJgh
         kGbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTz57NKqS5haWYaTQ4PRL7WTFaCjAsOZCRt/6qpZ82hH50i0qoPfG3DH3QmVxN4A73sbe6XKCsrMfhAwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkNMgJPQgygQVcs07OW6iEqlRNn/8h6w9OVOkGhqkuu5rYlD2k
	18MrzaKA+j7beAxDgN8PLontMC+5uQ5Focl7Ieal8nMcbu/9MU5PD2QgnaINb47qZvN+pkONxSN
	gsm9A9NzQO4mrw2dzoZvXUiq/wB3p93VgfG8kjd4=
X-Gm-Gg: AYBFou2MBDy/7+mfFCWNRfnSa8gG+bS1iuJOFTtGo/SfJ9qE6hX3GogwrwA0N9jBgYi
	8VfCMwIgf0ZVGLXmxlahaV1z79DDmpZ4y5c1jPzFvOt5pPJrJuY7/VzPJLxJBkaV3rSSYdpP/ID
	2SYThxHb1S5oA9pF/thJK10wYTWbpleOh74MksyRNjrwBXb2/rnniqvcVlNM95P0yGMslchZPNZ
	DfRZpKYbaBGiKmJMcCyeQGbG7pcgOeBus8ei6NiYzFYd1QXDxguefbU1ZrOQeJpgtyTisyNvKbH
	sf7s2d4FuIuOsr5ssaxVEN3YYSUQpqSjEWEv6vecKirnPa6cwyq+Lzzeja/wYq2I8DpJHiw/uRQ
	Z/r5ETO1J7Zw47+AUwdwq
X-Received: by 2002:a05:6122:d22:b0:5c9:c60e:5cf6 with SMTP id
 71dfb90a1353d-5de6d6ad882mr3678253e0c.20.1791294388970; Tue, 06 Oct 2026
 06:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261006094358.2948476-1-morbo@google.com>
 <3cd11b18-30da-4dc1-9585-1112778aba38@app.fastmail.com>
In-Reply-To: <3cd11b18-30da-4dc1-9585-1112778aba38@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 6 Oct 2026 06:46:12 -0700
X-Gm-Features: AclHuK-xrMb5bRM8C1f3tnWgdVCw-4GPt92q5ifPXVanSRIoA_ArhDjbqKs1NeA
Message-ID: <CAGG=3QWxG9m1gde+RVwqEfDHSizfNP_hOV5UpQUdA5aTbx_8Eg@mail.gmail.com>
Subject: Re: [PATCH v4] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 3:09=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
>
>
> On Tue, 6 Oct 2026, at 11:43, Bill Wendling wrote:
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
> > '__NO_COUNTED_BY' to turn the corresponding annotation into a no-op.
> >
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2: Only specify __NO_COUNTED_BY_PTR. Leave __NO_COUNTED_BY until we ne=
ed it.
> > v3: Add the version to the Subject line.
> > v4: Use __NO_COUNTED_BY to reduce churn later on.
> > ---
> >  include/linux/compiler_types.h | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_ty=
pes.h
> > index c5921f139007..05e2b637f1cd 100644
> > --- a/include/linux/compiler_types.h
> > +++ b/include/linux/compiler_types.h
> > @@ -371,8 +371,13 @@ struct ftrace_likely_data {
> >   *
> >   * __bdos on clang < 19.1.3 can be off by 4:
> >   * https://github.com/llvm/llvm-project/pull/112636
> > + *
> > + * Code that runs outside the kernel proper (e.g. the EFI stub) can de=
fine
> > + * __NO_COUNTED_BY to drop the annotation, since it gains nothing from=
 the
> > + * bounds checks. __NO_COUNTED_BY should be used sparingly, because th=
ere are
> > + * better options for opting out of bounds checking.
> >   */
> > -#ifdef CONFIG_CC_HAS_COUNTED_BY
> > +#if defined(CONFIG_CC_HAS_COUNTED_BY) && !defined(__NO_COUNTED_BY)
> >  # define __counted_by(member)                __attribute__((__counted_=
by__(member)))
> >  #else
> >  # define __counted_by(member)
>
>
> What happened to counted_by_ptr() now? __NO_COUNTED_BY should disable tha=
t too.
>
I realized that just now. *sigh* I'd take up basketweaving, but I'd
probably get splinters that would fester and I'd lose fingers.

Fixed in v5.

-bw
