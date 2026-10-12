Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB1B3ACA71
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814696; cv=pass; b=Vy0wM124VKoY2MWcS3TvmE8L2vM7GijHWUte6/wueuzEttkuF0P6ndpjC7O2Rkv+G7zBU+awR8fLh9oUApECePeQt6z8+dXzLpk0gvIujQ/aQZ/mLWv7jYeCFvPrEtSDZV4tCTBjLU+QNl8zKa67fM+PqZ2KXPuI9ZMDscp3pJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814696; c=relaxed/simple;
	bh=g/BhmG4j9ffr0oFBvhz7lb5ueTvQbhXIGndnnY78eok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E008MwG3IMTt4lIghdnnxVbyj62jlO3qicgr9Wo8mpVPCbkTtPAtM90QJ10Dh6HFjcuf3vshHE4G0KTzeIjN33O5+ZnTiO7FTBsaeXyVae3/mIdKrxURal8lVE8Pt/iGemzQ4WO6YPDoFCPKIrdJtjtCSCQ6+xKanppbfnLRVmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My1OId9A; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My1OId9A"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-34c522572bfso221432eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814693; cv=none;
        d=google.com; s=arc-20260327;
        b=AiJl0rKLHt4eQMJNslxzZnL+tnjd/Q7VuFPmQBjafdSZQtsxZxrtNnPLGS+QPQ/aWK
         wzCVvbcvjLEZtJgww7cP7Bjs1daLNW5OD+tHM2KG4dXXRmhnwrWa5RLXcihgJzRO+fQ+
         Rz3MaOzhiOTsuJsZftmbtXCkx1tEBtlxLwWF2zRxI0p7oVVHoi3vXQP4ZynG7EI8uEe4
         XyNCeMKNALGgfVQEZhyGGTzr1a0PK6BNe8hLhrgbYyd/5pIfnz+ih1a3iLzM5h//4pHz
         mwmnj1j0JeUrBOJkmlOwXj0a3itt02Jf+nJgfyiU7m4jIk3Mhv76/llTR/qSgfX5CYkM
         MJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        fh=KxxmWn8JxC0wJkvUvQKv+CAa6B9oQC4EXLNO2rNQHGA=;
        b=GCK0cqXx9sI2vOnrt4EK8BBpuj1oXaGKFzaTsXPiaV9aV1SPnnjKAUNZ5Rw1F/mWTG
         H0bvLFTkhiGSSkT+G+ZMH3MiqSkOZ2l6QbrzbkzTmJbLf8kKdCN4QHNs4w4ao+4rdGBq
         7YGw6YELWyj7AyBN4rtKqAO+bumGJX5jq2Utr74eJLKK6wIGClxdPf9wKj0X+M6/1DEI
         5OHzzRDy3xpUnnwIIU1HbPYFc2JVE5aYQmMVeMxoOe0OAreuskLUQnI2uI0zhDEg8Bdp
         ete6o2FySgvXnPwfa9OkZkGZSN4Rf/E6vbkbAlyrqDJA0b707XYwh3/iP+p3+ZGQFIr0
         P2fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814693; x=1792419493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=My1OId9Afu44hbY9lwaqcKNK3hVPzp8rPSGYolT6JXNPvKYoq4DQfBxJm5eeoJXLPE
         LnEVGTrZuX+RqYI1veoEBDoEaHJ0XGtbCfJOw1YNRELMGZDHnFsmI08VMwcpW8q0F+AD
         v5ZfpZVhTLtHNjxeG3QnsaMv1jj4zddz1L4yMn0P2j8BpqLraO8mASnlHu8kXrlT4G0c
         MLRzDVtTDHSq9ocOFjs9CL4dC5zfsgE9m84pKgazql+TJ1BP5kNcPCNMod6lrfmLJDoC
         aKqrtBEw69cKrJ/QfHKwQnTNVLNkRGOqTs66ioJZ3oD84yrKdYtggQ11+otgINcck2Wl
         kEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814693; x=1792419493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=eoY697ejGgtPXshWp5p/s+KTWUOpF4YZSt35kF4cgQ/gxYydbpiMxe3qeZZQzaIgRs
         08PeNeiKUOIGEsWvELOqN77ef7JROf2p25+GqoIybK1uLyB79QgNqMsqkcTlxadoWkdy
         c77t6iOOByYq0cUSTMdSV24ImtfjIWTeFzdiM1xpT1E3mJRAGjvSKbsEzs8uiLOXUAWd
         BDfuRhfj/snRhaYxDlq073ro37G0i6Z3BHfgOW085OzgyszoQX7ot4soNn8vuf3zR3ga
         Sb72F68lkcpDu8PFbikrNS74WEXR+DHEU5xsA/A/tUu7DYBB/ni8zdPfG3V/R8SNzHSa
         ES5A==
X-Forwarded-Encrypted: i=1; AKwUvBwSA6CvtUMgvgMazz+eQOjbAp3JMlsT0W6TvChZfBl1vs83X7U9r+Bznsp0TBbVXy9xWNN9NDqb3UAX+zg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9pwYQ9WyloTmiOx0j32zXpkUDw+AbPLx9ovQjJEdCS1OlwaPo
	YfI1M6TZyOUstq0og/mr4G2KFWqxaTTqomFeVpHr4NyPlbLLfvI7Xf+zcxeQmf2rytlFMXzBUvh
	aQWL7Cz0BbrYyYQfjkOdugBseNyLGd0k=
X-Gm-Gg: AYBFou3HOE1eOccuDcngx5jbxIxKP/+TML7vudjOL5q6/57gjsKdLCqLOOd4tWPZluc
	XctYh/fryDnClpWBEB/L+NGZTaRVMcC2ltAdAX1HdBAV4KKu01WC7aOuDHfag2pV4L2PmlN0NMy
	2PY+zve5xo2vkknaaH94WUmy5w1N7/ef9UhU7/jUUnFXSyDAUPymYxTpqgsrqws10juc6sIJGHd
	Z1S+FgqhCRAjVMOy3qzNxHfKmlUJ0MBf2Lav2lXRVVwCR+CDA9YUQByou+6Y8kHAVqCsU6r6fgy
	h4w/8jcTSomPQ4NzNQAiumVW3TCBW/FDGZ7j5tm0UKJe4SG/GkiAXB45rURWeeA8GCZJB2fPEvb
	5pzZ6fO8Sfzw42njZWGxVi9gpoJOC/jVGj1NcTakd+Pw2VyoXomDaT0VG4dVO+ZYYHUgPSIyHdb
	wJmZYDCNwHZUBcXw0A5E2JxCOuYVA1+vT8smONwqeb1zx6EZJBpEVWLr+PKwUKKA==
X-Received: by 2002:a05:7301:428b:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3587ee40938mr13997955eec.0.1791814693087; Mon, 12 Oct 2026
 07:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 16:17:59 +0200
X-Gm-Features: AclHuK-Ywlbcl-S8KQPaD-1cIH6SBhIHUu2wWCV_8Z4IN4dYEXXQbTyoeFpEilQ
Message-ID: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> +Rust code is instrumented as well on architectures whose Rust target sup=
ports
> +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).

Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
places, although it is convenient to know in the docs (but risks
getting out of date, of course).

> +  Note that ``rustc`` rejects linking crates built with and without KCSA=
N
> +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o=
``
> +  cannot currently be used for Rust code.

Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
the patch (and in fact I don't know if we would like to actually
support it even if it works), but perhaps in the future we can relax
it using that.

(If it doesn't work for some reason, and we want it, then we can ask
upstream for an "escape hatch" as we usually do, since things like
this should normally have one...)

> +# The minimum supported rustc's LLVM supports all of these options.

Just to double-check: does this refer to the LLVM version of the
upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
support in that minimum `rustc` version (LLVM 18 major)?

I think all the options exist for a long time, so it doesn't matter,
but just to confirm...

In any case, this sounds all reasonable:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
