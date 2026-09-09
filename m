Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EFE33CEA5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991767; cv=pass; b=RLCDtitfgxk5TxTS7NLDPn54syocc1ynbwjbcmXSGvOzApW5HD6ziawnCWZiNrgWwydsTRTjVz+Y8mKODkwr3YCOP5PYyN533koDikFHhgPtmKvxPq+7CA57puWo9++ieKgdOzOhQlJipuVfZmLfiN6+bZzQi8Yso0SFFVm2xPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991767; c=relaxed/simple;
	bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Suvi9zy8/GujzdpGLLe+5SKPg6s8Do17pJNqUpENOd7e1M9AHjTupmk8Otuk8ouGjV7LkooWL9021cDZOciigLKI1FD2wwlAxkJ/s7Y31GdFcJSpVzsCjapSDHnYbx80PDyYvx1dLrjYORx48xA6j8S3Cpo4CAOEK2Zc3KO3IHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hJnHmHhe; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJnHmHhe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so50585675e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788991763; cv=none;
        d=google.com; s=arc-20260327;
        b=lmePW1zWK+vyXNahApSrd/82DebMym18QQ7MHSuL++1Dqh05VkUwbyXEKh6qlWrDxe
         aFHuevLVEzzyB9sihHfMh0Y+aKbs1uBpfBPR5y6u8ap/7yRgxTVdhhJdOyLBpDkPE/lj
         MnQJxLsZhWyBeBbPyfyE1TO8Edi0afjDe2ZykyJA7KrUKWKiFUu+sn4RiaBm8C0oer1U
         Fny6U5/VKKw1ysS9BJyXIAZHKAd7M58XiXhAK79+oyWfBp8R6AQdQQS5ka+D5VUiP/aO
         OWB+p2QbAaBNUO7auUEb3Jsk/Q9NtizAxFvKizK/lKLJMMdPBB9nBx53JmrvJ4mWv8I/
         5Wyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        fh=GK9L9MfihoMooJSNDusm0Ukc7z4BnQYbfiA7PXnR0Xk=;
        b=plJqdoDA887e410Sfz6L4UEtd3wYUGFLp+BxSb8Q8hlm9i/+uxzA2AS/xFT+AihBvg
         dhf7FeoWCLavqlSsa3h7V1otDBR1vtuckL6puKhr0iw2ksFsNvgThAJNH4ebLBunlMfR
         gOoGca0gV+c3zRb0z5UMNEFvSPDVM1s8vJX5jRQ8srErEWlKeE4s5BOgvd0IWqV9CWI3
         oLMXETS1VR1Qcz6QGm+H8T9LdZhX1vkRHcXgLIeWFpAV+tIsYK3yNMjK+gDgsuM3/uF0
         yhyMVaLAXh82mcz8fggxNeuMdF6nG6owD2nh7onjVCsjEahwHGqrL8xdVf0hbycHl0pk
         O8vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788991763; x=1789596563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=hJnHmHhe+3Z3B/o1b9i3gNkm/aDnbsezDcQyviqY7dy1zsxKPyI3bYCDtR1pjVAytV
         yhiu4H+vtxVlBhhNE1bQlb6f7a48UllOzIPrYLGGCIAN4VhfSbAXPRCETqRmpiSPDTOv
         rWJDZaqFYHjuluIDtrEYzUPixzXiqxS/D9IuWtdGQYfHep7KfZZ14736P7EXNQpqVW08
         pKn1RBFdnG2451tR/nrEy7dEFMergprk0ekp8fLZLbsiP5bXRvyDoJRneG3y2J37tiN7
         kc+HMdzfao1r9BRM3SH3gaRbanbA8Sf7jUGn/rPWRtaAzSNYEBIxyhaqePlgxLqEmC+C
         bNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991763; x=1789596563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=BBRNsMddIw7McdSem2TppeVNmgQZcbc+BDanqPPn0BdhRi6Au3+x1JntCPQ3/HOi3Z
         c0BMOr6iyaYftbjr5NdmYrkdc8Mo1UeXQ81+EgUB8lUXgQ01iJc7KAzW5ScND9UQ8Y0H
         iVwsqmeDBYy6lAdTW6jnpnMMm4WnCdlaKwKtGr0ZMsthOZUxWR4h4mTE0W/poVUOfewM
         7AXgap8JcKFax9+C2jp4YIpDH1IYqXcJbW/ttByFu89D8raSJRjj2qWOH3MisxSs3mLb
         sbN+9aNoGlWdYir8boWPtJhk5p/IC4gSdgLfpzz3q/qKuwBWYicydOpWjkFYjwNsV5a1
         e8zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPX9oYgrhKa3Wc7DW+ywNIpBYe+NAi27jPp9zczwjh2Jo9ZtjH5ofojRVaN28dbRshgTQXgB0XrGQw3r8=@vger.kernel.org
X-Gm-Message-State: AFuF++lbqNgZmX8emM17atSBuz6osdZBgFRzxyiI16fq2+vy7hjIEdDo
	ETDcpPqjezorkL9uvVadtq0wvNCFFACXI1vWvu1bASyKwattvExj/VKqVhXnwxm43MDHjgoJuJV
	cFbQaQvm+IfHctC76Qg6XOMTuTkwR7iP4Ad2vpCFL
X-Gm-Gg: AYBFou03Rh7ypV3mFfIlOKZCD7oKQXLg32Pb5YmR/y2MBNCaXd/68/cjtREnbRDWEPN
	NT6k4BqaNihF7XdUmWaCo1E99QReV30toxkSpX/yEIk5cwqYq0WLm0W2DqT6acVmm9+ugRIN0KA
	nrAlQMLDYI8c5lNFKkhgPVdXkaD1vRK3madbWg7ylGtEBZkgcV7Tqk+V6OXjg22aD6KdXK/aavC
	8Ri1WL+shtC54oCcnR6W1reyk3CFSqCcReqrGiANWeCbVPzE45sHb2rA7tvrSLjU+0F/LPHsq2L
	BH+svb8TwjLhUtna2ddNw6Xj1mVh38aXNH8xdbkPZaH6lIKQRIEWOosekQC1BKwjaFPGnmdeZo+
	hVA37dj6hln7m24q+tSlk9uOHoy9rYurfYp6DaUmnzkN50LPWyEW46cv73OrrWR+K1/885YQ=
X-Received: by 2002:a05:600c:81c8:b0:49d:1f10:8b9f with SMTP id
 5b1f17b1804b1-49d1f109802mr74781425e9.7.1788991761946; Wed, 09 Sep 2026
 15:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com> <aqFptJRjLZIL-NX7@gremlin>
In-Reply-To: <aqFptJRjLZIL-NX7@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Sep 2026 15:09:10 -0700
X-Gm-Features: AcwNN1VBBOSItlzf2aBfQ1Tsn20Bkz1vl5nUIWxayca3KAiKBTvQ_pPLoFqBSq8
Message-ID: <CAKwvOdnMuwKxPB_SXDcwmrAiwZFXWUAgcS1TdAkW+bqhYEZ=ZQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:17=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> On Tue, Sep 08, 2026 at 02:06:18PM -0700, Nick Desaulniers wrote:
> > It would be cool if your LLM could generate any visualizations of
> > what's going on during a build? Seeing what's serial vs parallelized
> > in perhaps useful. Particularly when you can compare the before vs
> > after.
>
> Great idea!
>
> I asked it to do exactly that, attached. Came out quite nice and sums it =
up
> nicely :)
>
> It also provided an ASCII version:

unreadable, but the pictures you attached are worth a thousand words.
Particularly exciting are the speed ups to the usual edit+compile+run
loop.

For the blue graph (the top one, first), any idea what that dip in the
middle is? That's always what annoyed me.
--=20
Thanks,
~Nick Desaulniers
