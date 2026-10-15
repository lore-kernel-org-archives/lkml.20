Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5CD599A48
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792097246; cv=pass; b=f70apcRbAJVU5CfRRe9qnYLRvEggtSUXWXztcwPChFw4vfHv5nIzGdsgNX5A4mGXfCL8a7USjkD+drq7PpOxSSVoIWihk+Q9Pm2kMue0txH9oxavtc4xT9AlbQjUajjjUU8DP/xCJQNtIvOSPv3+FjhRnarpTumOuh7+kW4F+LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792097246; c=relaxed/simple;
	bh=L1vTqlNSlo5T5a/keujEElxWpHoRIlrc2YZnv8bHcdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdH6JESSAPbmLRncswfS/VV5irvdt20KfXrq/m7i9VM96sXvF+acEVg3RzNdDnNMNWlVTIBde71DPWcAMlUU6lcp58GzHlZSb9tkCIUn/bbWMSqQ3c/XAmKntQNLjArPnTX99a06KXT29V7UALCKMxmJa1bw80X/x/J6302waWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pydcasoe; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pydcasoe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso41192675e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792097239; cv=none;
        d=google.com; s=arc-20260327;
        b=q06zARXZvjH1b5Jmy2Bh1t865qrE6aD1Ncke5BL4BAyS/Npef8pHI5DAXWZXvKZXRi
         t/7TOkmk6rgfGDW4yQrOeInbXfLUuWBtW3KBiZPhD6i+W82cUS9R2BKK+i1K1Fznurzn
         SFZJaxOpo7TVPAoekDBwrBtZQkHKX/MbGSVSEJpyOiGGDuFkFci3shApI5P3SMEXjh6r
         oMDu4pOD1dFlPazb4GpZNxldvdMsgHCDit2m3DQSbNtqUMM11ANad/MZuiNafgUyJfye
         BNBYtsHnrNzYOcMey1JnJ7rutmIkIWFjl376XGK4U7ETrV4/vJ+PBzyNmbN8TpMo07HW
         aeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jPqdmgliSQJVYELUQkNWh1QYQRXFQZopw8GTjLjl5RA=;
        fh=5dPbtwzdG0paYzESWvtDJHsFwMfSWYvdZBkwCxgUcCU=;
        b=j+KVYIdHxc3QnwwJjaZ5XzI3BDZiUaMByWhgaC/OhLxYzX/oerwCDdcDjmExyOR56G
         +mFchF9BChYL0A1ogu8csm8HV+jWg75vX77X5w1EQAI6CXWKYyLuroesJ9rfp1oklszy
         n0l5gskpNFi/huIQTSnf8cyQh6zSNQvdavsKuENOeWrwiXImqaN6NF/LkmoEfAqZHLWb
         pR7xoAdzxITrhNJYnU1f8/PSSAxFHKuerZUKU7eCXCgPCvfPAwXdz3KOpMkMRCp8v/5h
         Cv0GuNH4NAPcg+YjSbQnRyyzi8WayxnD4pIvEwVpmksS1tvjZpLwv+V986yfpI3eUgb2
         85aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792097239; x=1792702039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jPqdmgliSQJVYELUQkNWh1QYQRXFQZopw8GTjLjl5RA=;
        b=pydcasoe4z/47yqageleE0oT4D4l35B9GzwOMMkmLnyVBXxWkqtSTxt740PAkPYnut
         RwhTbirSyc7BwPGrROB7IS70FBeneuUhuGOhEx/6ZCBStMrxb19i41lCPkZ29hZ10R5l
         pjr6Uz1Kmq3l6ksOdbp9K3vimLyRdgAlFuSLO06CaGLoWfIA4YZfWoeWWT6LxqVeIW9Q
         ETNGNlQxxuqVVnWh87bf3uQ1GoC3RJfCzBc1D2EZbFW7w4xK8YIwSQsms49fhIBbIXEN
         Chx/JWi1ky5QwxvlY9zhxvJ3bfweEXjzZxmXwVDeUkJt34hr7bVbMV1NWBMM8LdcVGfc
         1oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792097239; x=1792702039;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPqdmgliSQJVYELUQkNWh1QYQRXFQZopw8GTjLjl5RA=;
        b=fSAblNO+xelHVk6RPNXRZXm+Q5E/aedc0Zgwu4sHMLd2n8nibqQaYL+xT2rcVEGn5B
         tnOOuZFEB7+Ju4WBOK13C4c8VkkpMbGFdjjWPWazGEpfqm3wglIb6k9lwCu4zQLPEk0O
         jEBIqzKyYTo/dsqvWhAK84eaqlGuiK0VV2fUjfYiPgX77oLIpP5qhWvtwddsIofnZETQ
         lbaSqQdSdCVWeNHGUKKjihwD1WVwxNcuYdjX3FvNMfRJyjTsH4YeC7fvYAI/wWyYLhaL
         4UnHLH/1X+/Cfa6auzQoGgBdhVHFGRg8rsaaGYLFV/qvlrOajSygBwLQAKoylxmcyyRB
         j3Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzeHv3gAO+OoH/UmFC6LKfvngcMlLFAIBptzvgSPRA++7LMKeygW4ugRCIRNAm4v7WRQ+bQG03+yN8YLk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK27lnAWOAjyCy+D7GWSL8FhQAxXaXhrU8IOt4bwYnOKbV7ku+A
	EgJ2hN66xHm8WvUYp15bFigTbwN1eFaDDsD4yrLoOfMs2TJArQLeHduGOL9VlFyc/ooVG5FIt2T
	KvN5ieDlJ6k9Gm2UhK5KJyWbT47PSfn9BukfZ8ElD
X-Gm-Gg: AYBFou2UYPAaifEdATYrMo68xK2YjYjSEVQLPAI4w1Bu5SFUDpuof63FMZFqlQ0TIcE
	wGuO7FpfddpXmbzXYy/NX6ZXasXlLljmK72P1RGfEXjvQORRq5WBrT2J/t1nyMH9zzakfJmVC43
	+XaPsmqCkxw8V6KsRDXOtMkDIoG18gtBAu/e/Kh9appagoN0j57qZ+SZiMaKbo8F5wmrvj9glfL
	vCbq+WsPr9zGSeZtnSS9mEJagG2Irx1Uv5TeEL79UXRI3rLEb5mJWtbnaKR2YyAeJ+kFbdRgstV
	TiQ25UCU++MJW+Txqr2hn6eftebePOAoMTb1eVcg8EwIHNeEFP0R9Xvuhr8NC6/wXnLmLdrU8dk
	2uOarpORBIQEYGuJxSCb5cHZY8TwotCAs3MmHvvzTY86u6j6qEb6lxnTU9dM4OMxT6on5eZVSmd
	D1AW22GW1n5KSaVgdRgftpZoEwsd5Ng/diNwXZqZ4XmvKK3iq/txl0
X-Received: by 2002:a05:600c:1d20:b0:49f:fd40:80fa with SMTP id
 5b1f17b1804b1-4a18e4f50ecmr425834315e9.34.1792097238491; Thu, 15 Oct 2026
 13:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014225811.i.852-kees@kernel.org> <20261014225818.3457479-2-kees@kernel.org>
 <2026101517-profane-opponent-4523@gregkh> <CANiq72m_iyquf4Lc8AWvbsBp++ASz4+C_MQ5iYQW-fHd_MNDxA@mail.gmail.com>
 <C46E97AC-3722-4264-B541-04EBC3091E00@kernel.org> <2026101532-fantastic-deafness-e04c@gregkh>
 <CANiq72=wS5NJyeKKaYiHKWhDq2Wjk728qkCUNq4xVoHrPEPCRw@mail.gmail.com> <202610151304.AA5EC855@keescook>
In-Reply-To: <202610151304.AA5EC855@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Oct 2026 13:47:07 -0700
X-Gm-Features: AclHuK-rLxxhEDBL9-rcDMumk-sd1jsus0ssxmyF55pyppHSQxHMSWMGokd2Kic
Message-ID: <CAKwvOdkn-CniSBEb6ospWuLSGHmXkZwM0JuPcnNbW8biv7TC9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] seq_file: Require explicit initialization of struct seq_operations
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Ian Rogers <irogers@google.com>, 
	Greg KH <greg@kroah.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-fsdevel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:07=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Oct 15, 2026 at 09:47:34AM +0200, Miguel Ojeda wrote:
> > On Thu, Oct 15, 2026 at 9:11=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
> > >
> > > __must_init might be smaller?
> >
> > That sounds fine too. I like that it says that something *has* to be
> > done (like the original name did). Hmm... On the other hand, I guess
> > "must" could sound like one has to initialize the field "somehow",
> > i.e. writing:
> >
> >   struct S s =3D {};
> >
> > definitely initializes it, yet the compiler would warn. Would
> > "explicit" hint a bit more at the fact that one has to actually
> > "write" the field, even if it may have been initialized anyway?
> >
> > (Of course, if one knows that the attribute only applies to fields,
> > then it doesn't make much of a difference)
>
> Hmm, I just noticed Clang isn't diagnosing for file-scoped definitions.
> I've opened: https://github.com/llvm/llvm-project/issues/232483
>
> Do we want to wait on this attribute until Clang has full coverage for
> all initializer cases, or land the attribute so we can continue to add
> coverage for function-level coverage? I'm worried about a compiler bump
> (once the bug is fixed) suddenly exposing a bunch of missed
> initializers, but then again we also have no users yet...

This is a false negative, right? When it gets fixed in clang, the
existing uses in globals start getting checked.  Nothing that would
require compiler version checks, IMO.

>
> -Kees
>
> --
> Kees Cook



--=20
Thanks,
~Nick Desaulniers
