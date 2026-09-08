Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC53BFE52
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901593; cv=pass; b=dr4InyeaFgukL5tUAxx3+IHH+GOzd5UjQ62W+BJPc/viJ43ldSK2Xln1FN//oEoeC8e42cP4nHeRxLbKl5svSLKoWF53A6RDsUjTrlUhDqdbyY+9UOtW6rcf8ypB2TSqrhrFcSVUVhsh5zKHXxatUyIm0ztpgAvwbqbtPsISqqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901593; c=relaxed/simple;
	bh=cIOFXtCuNna/zYNDEeDAmAkgX9xNg/vNmHFdct8PtpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoG5nZf+Tafp2FecC9fy6rLLKsOV70AqILfKP2QaCqrOmuT1vO/NxtaVLvET7jKa3QY/yByHaEYmy/d3UzE52N4BeYu8ZkGrS/ht0MHTPXXZU1+iFmGp6FlElmqjJHzNJ/eZKcFZEOTQeMsQp6mx77KwM04dlmdxEph4wpI22RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otsf6b66; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otsf6b66"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso48914955e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901590; cv=none;
        d=google.com; s=arc-20260327;
        b=XMDZ+jrc5GdyyjjCYnGVlsVpikISb9vs4hFVrJXrpbMNE51Uk2Fs8iUyHaH2onOr/M
         ZOE9mgWCXgMFmqFf3p8zwJlm9h+TahiDwmj+LZ6uCrEiLk5jJapc3z5/Fe4Kg22li/XY
         IHKTYdBwU+s0PV7ZS2nbGUGGrXKZsXf4VdGHICor+enGYpJNHUPf2hunWpS3lAO0eJbC
         hzJYJ0vwYNrp/rpK3Nh9pBdwmG1N+40Wk8Ex13M5H+zFRPnJF0wanDh3cgNKUoMnfmGa
         zIPMR6KuCHHQGJBGPt12UdPr+wB9UeOEL4mka1rTanB7Lx1j0xEnhZkHpxdpqloshu9S
         IQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        fh=oCcUcyTl7MU46nCBdlTp/5UaYOMrMj0JyDGaKyVR+6Q=;
        b=CYPbbz6unltsX4Ge70YRNhDSQo2FO4bovXSMBz303WyUCIOGZfBkSO8V/OdvyOdm36
         ecSU/tLbS9U/vd38VGtpnzMnkviFBzGAwQ53u2mVKB9y7IiwEwfXiKwCho53rWVLnrI5
         cqvuSNewXNwT2YS/fUqnyvrOPxurCim1X+GbslbfoSqkOuWKO8azULl6gw/VHP3TAceF
         LRPgPl1dK5nOiXEygkYp+CfA9sUbmludxrZYYv1v5TTC4GqSMC7ZBEe8Agj7GxBYHz2D
         cYCbxFykTC+K45QRC46ew5PWD40u3cuF6HfSHWJVt6IA5fJZv5stdNimFtKA2qfRJW1X
         vcTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788901590; x=1789506390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=otsf6b66eLyN+62lzguVV+VBMlATv6z+svgDrA31hnA5b3fBV3bwYCqshPtnmsyGmv
         QDNDZwx7N31zA+x89VYITcROT5ZRN8TP4ggK6R9uMannUm/MUJSMRZGWkbAMzCuOqlSY
         H6biXYN3dL5DiY2yXed6Ky4yh4BVxXR56j5VYoNJgh5pu6nlbLx8ul8LTxw6ojhP81mJ
         6JTXwtflQYVkO/SfV7yVBVRWnh5SQfasm8wlbFkY625Bkt4jmQ2QbNf1ssWLfzh6NMk7
         l1RjM2KYlCGn6nKE0yFuTlHEHgKavdGE6I5+Sqelz5oi5Z+IpMaKNlUCqzRnSjeVC5x7
         BuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901590; x=1789506390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=BqLbDEz5PQE2+Up/ENI+mFpjUqT+7+Wt5U0wNUdVNorDBKz2FGM1Uyy7mjLmx/Muo0
         lJVKbUJV8JY3l5txlrikwaRXjugnWobsmqM9HJW3BxHBh1lDyNfH31xduLciO42ZPvDN
         rsGCA+NxueShAJvRq3+dIgAqNbS+86i0bV9LTrkPGDZwbotp5SpPOixNLTlbtnYBurEJ
         59TvDkvvxurItF+99MmKu+SlgwsmSvRh2ikoXOBwKxX5uiGuwApz9AJaift9wmYf/oGP
         k1N83t2ZOsbDwiTQPJcicF41MIlAsmIZMVvcn2WysWRvVTFsnwRW8in/LQL8soIzpSgo
         j4kw==
X-Forwarded-Encrypted: i=1; AKwUvBzZs8lLMKJ3ZIgqxtsYGvwvoMjPhF7yPt8rVRpYsUYC6VaJUvrp+o1tYVmquAuw+rIXAZfDIai02nJKbiU=@vger.kernel.org
X-Gm-Message-State: AFuF++mApsaQByOSfplC7GhZsuz71oR3I941fAkuZ1Qs649DqyAYHbOQ
	8B7usoR7TmReOX728wmJsiOdRtTvQO0nY12zvRaxj6Y6v/biuwDAn9eYOv1NFkdGUzdAoaD1+gk
	TqD09CQEhDXnD4gwN7JIuBuOg9ySFEjuRv97FqP8H
X-Gm-Gg: AYBFou2BmEj+V3ugK4Yi6jJAdHNpoKae9//BYdCrG/Q0uakBSKuiRQ4tjLQcqAy05qP
	HxTIeOs4lrjbrQeLSQOkW549eNkrHPsDlyIwjl4h3kUrBWPZYzCwiHHFb8ZNyxPI//gt/q6txgO
	JEj1RTtHgolhOWqrOktiGLCxmFbFb98dMDHD6dgQQ57sG5NTeS2apAFRHd2gaB6XA2rjPBQKNRl
	SUUqx9mIbzcsoluEWpmNKh79ZRJREL8gpBzkvcibZj5utSbE5HdCjl4+MXgGLMc+mDVifpIPhnJ
	CqqFhPjTG3RiA5cWgrEp2W6v9JiM6pKkTsJj7w5E+fWSApFaKp3T+KbMewxzFGTuhcyOmYELjaB
	Gw7A39oBQGd+ijgXBtAqSUd2gjxJIGaE+zBT+8sOgZJwGMiVygkNnJGXO
X-Received: by 2002:a05:600c:6091:b0:49c:eb17:cf3b with SMTP id
 5b1f17b1804b1-49cf8252497mr286154405e9.8.1788901589479; Tue, 08 Sep 2026
 14:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Sep 2026 14:06:18 -0700
X-Gm-Features: AcwNN1Vne6n6eJi0vjoX52mygVY2Bf7Bhttyek2fKXqRHQxDJ8Lg5WpFcLyZtjc
Message-ID: <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
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

On Tue, Sep 8, 2026 at 1:55=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time
> spent stuck in single-threaded bottlenecks.
>
> It turns out that there's a lot we can do about this and doing so
> significantly impacts kernel build times.


> Fundamentally the series improves build times by parallelising
> single-threaded tasks as much as possible and improving the efficiency of
> code used in the build process.

Cool!  I have not reviewed this patch series, but am supportive of
solving the problem, since I do recall this being an issue;

i.e. it always annoyed me that despite have a 128 core machine, much
of the build is sequential!  Having all those cores and not saturating
them during a build was always something I noticed (usually have
system monitor always showing system load, always) but never had time
to look into.

It would be cool if your LLM could generate any visualizations of
what's going on during a build? Seeing what's serial vs parallelized
in perhaps useful. Particularly when you can compare the before vs
after.
--=20
Thanks,
~Nick Desaulniers
