Received: from mail-pz2-f29.google.com (mail-pz2-f29.google.com [74.125.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF40374A19
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453938; cv=pass; b=J/xAZ6ilF/AQoQaB63SGJDl7hr8FOuLVQu8xFklMwpQSYkEVk9zZnE6CmyBpej7cow+KarZYq1s2v8s3Q4+xeElLE4Yi64QAGZyJB/Ymg6/9JaJB9PImgwQxf6cPfcEc//tQ9cnIUEhGDIJzijACNAE8WhVbBN16KheELBrzBE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453938; c=relaxed/simple;
	bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hixPeLJxXhCslZwtWLeiv1zJRtLxmOxTv5cPG3SUXM4LK4hDDDpICWGQZW6Jg88na4huwjTxYkVWWHPz0Y2uLEx14Ap6EOz9tA32iGhTcOaqhKPCnfcgViakzyCUX3PJ9yw+ZFUPdD6lFHZVGp0FfJfttBj0P5s3fQ7LiuCYt6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5CRJ9r3; arc=pass smtp.client-ip=74.125.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5CRJ9r3"
Received: by mail-pz2-f29.google.com with SMTP id 41be03b00d2f7-cc4e4979c55so80632a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789453936; cv=none;
        d=google.com; s=arc-20260327;
        b=A2QSDwLWpyoFzhAbrzOSokgMRDDzqEw9S0sm2k5PLzRAyOpOvvSs0MGV9jAUkmoZkQ
         gPVScUeq8IaR1suRnrEKaUKyrD5bwpYo+bMPorMt/ID1f6FexSI0jjvZnxZvBo03zaVl
         /jFV74ZRMp2MgyZIXQoD16IIbInKeXrKLkeUQq52VXZenvfg4ZrwvdG3rR6i0KGcjwko
         FVddopoS+1R1HrtUX+oivlpPwwVYu/zLElCanQ4T0HzCw1VzdhbOJNp0SuvuVoxIWwLh
         00ZpMZ27pJ7vJ2BhBI50NZaTLMCYr0DhtoUc/tXTAYAsQJlU93G4utho936DhMdWvfD8
         IpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        fh=0bTUNvo3DArXznoiiKDnQu/jwMATvTkmfsJLlFdL9KE=;
        b=KATsRewQNP+mlLcI1GFLOeYGmik86B70DxJlj0WKpmRKdIerdWaZjOnP0NGmZMYc37
         oDBohvpKzJlOCx2jnicxZBPQUCCxBIdopEAPr8g5Hxl27FOQNu7wgEtcC0mFX9TcQEvB
         omMo8ZtRMy/GNYInPwAqX3KtrTXBuUuhAPtTzvkP/K0ewBx7RlVVsAf5zcU4RNocpJKT
         JYhWByouvuCpY8maC4DA6ZAJhurvw5nZDo/ID6d16e6nzWG/s/9crihUNjwuITpU0FzS
         alKlVi7YOGIb4UXQW1bq8m/q8DDcjS29hTGN3lmxrTV/z4yr28eYFlFBO8KPAE/XsNoU
         x0sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453936; x=1790058736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        b=G5CRJ9r3yU+mY0l+N74B7S/Mjb6TnQqtFCT50TddgkDTFjmeAX7LKtouzxIblxQu7Z
         h7Z4cg9OQsXlODWiJ4sgVavpB9ZRE2A1fqvhWaI1/oMaUm3ZJIy6GIsgazv3vqM5McEt
         xGkXdE0pqihCwZshnRy0aSMMIslo+uYXDX7ueQ3LEQJU48Z96j4JVTpAVHnxfBhXKjop
         mbYpAvHUDnqE3aI2WoyhirXJaLKHJWQBpEM8NK0EDDeCtbvcdTvgNOOCPFFavZBqhcMf
         Bups1FuNo0+Wrg5gZmFapMkMsrAxt8m5jDvfLJ8SCIT13V3atN0IADBmd6R01ATsyRkn
         s+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453936; x=1790058736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        b=ye3nBwj/m2o1xtjCdIBl4DQs3tCmGvFGIZuHCwf5wO0qqltZLy38DmRm/yvuyPghjx
         smHw9PJxfQGMo8lFiMC5wEWOm0DDPQiW4heH1eGuh7fM5429CMOzOh5WHdqYSe2AKj4J
         LmuvTgoAR/zVCtU+3cghJnckT5VFDNN7XD58h54rIbqiscHcB5GM0vREqQIVo09YDVfb
         +RQcCWt7TfO0hggc4OQDfdRFQaCjduSohgUZjNqFtP0wlPW2Mno4E24HpmkGMshBOV0N
         GI4aXsBSdk69kerGHuHNo1HeozFOtcTcj9C47TgOBwAbAQm5xs/KlXQNJqDDcsFPLkG4
         r8IA==
X-Forwarded-Encrypted: i=1; AKwUvBxUEcG7nvu2OcKuW5KEsot8F94GotsXmpt8pufjBq6m6BiGxMM9DJ3BTrMkaniPNwGEYyadbjJKG/sYn4w=@vger.kernel.org
X-Gm-Message-State: AFuF++mJHKuZdMd1m/wJtvVv+XkFDfakLIHn//2uU3P8eNkQyaQ1rxd2
	x1zKu51DThDVCVoPc1htxlQj+PwUvGBcYRttCEh5UurX/e0F/0wEQiTDiOUyALdn/hjnB7I+lwH
	bks8OdZqtndrxgQKmLtrYxH+Fu/bIT5s=
X-Gm-Gg: AYBFou2fnGIaE7cPPnV5VRSDoEtx8AXhhu4LX5p3fEb/epvz137ehbzXXuDUFjRTfHD
	UVmGD1Ppaqjkv4WkeK9J2ZnH9NldLGmKQDcPP04xAFPDlK7dPOo3PBQt5U3xBdjrLuqaQhbPswH
	yx2j1Eo9YL8GPrnvfFrzTvKHGeyTfFtCHNcVA56Iqdxcou5tiqyq1QIt3p7dGcDHyJtcmsuh+t3
	iu5piT4sKDSvA363f31fZhfZsvHa1StnDIyek0EGIHkCYjoIS5MQdVTPJSZzdIBGrKW1aDntGD4
	hGXOdDT/9KPkTmo7xiyZupOm034QdCcdN+k6TX81RqMmXj9AARTAp19YuQXcBi825DYgDkRvgh7
	jaErm4D7NnM+f2wZ44djGGrVoSDv22GIbQ/Q53TirDwU0CpA19dxzNdQWzkmcVzkVS+ZzyQZ2vT
	QZH4DJ/NSpQ1wpcihE8VwS6hZhnWTopLRfpiyxjTryMi4DoLMWbA==
X-Received: by 2002:a17:90b:390d:b0:396:d27b:86a4 with SMTP id
 98e67ed59e1d1-39dec02ca06mr8212249a91.2.1789453935885; Mon, 14 Sep 2026
 23:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
In-Reply-To: <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Sep 2026 07:32:02 +0100
X-Gm-Features: AcwNN1XuX4yn0GdoJd77RsJx70W4snllWWAl7hBlEl0V9VQzhH3zC86aEhQjx38
Message-ID: <CANiq72naY0=iBaxfbWQaPv_06X4SjFSix4NybDQdht33+Tcs0g@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] kbuild: rust: optionally parallelise rustc front end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:24=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> Rust crates are compiled in a serial chain on the critical path - core,
> bindings, kernel crates and then the drivers - each a rustc invocation.

This confused the LWN article... :)

There is a critical path in the graph, indeed, and doing it in
`prepare` is painful, but to clarify: each crate is already built in
parallel with others where possible, and the fact that each crate is
built by one `rustc` is unrelated, plus the flag this patch proposes
is also unrelated to that.

I guess the LLM was trying to add context to the numbers below, but it
looks like it will easily confuse readers.

> Each time a change is made to any of the bindings, it triggers a rebuild.

This seems oddly focused (i.e. not sure why `bindings` is mentioned in
particular). It is also at least independent of this patch, i.e. it
will remain true regardless of the patch.

> rustc has a parallel front end, enabled with -Zthreads, available since
> rust 1.84 [0] and therefore on every rustc the kernel supports.
>
> It is not yet stable and its output is not reproducible, so it cannot be
> used by default - stabilisation is being worked on [1].

Not sure what it means by "by default". In any case, the main issue
with the flag is that it has had issues recently, not so much the fact
that it is unstable.

> Add optional build parameter KBUILD_RUST_THREADS, which when set passes
> that many threads to rustc.
>
> Observed build time changes with KBUILD_RUST_THREADS=3D8 (rustc 1.98, cla=
ng):

I assume the improvements are most notable due to the work being on
`prepare`, i.e. there is no other work available. When that is
relaxed, this should be way less needed. Though it will be still very
nice to have for full Rust rebuilds, like when changing the compiler
versions often, due to `core` mainly (e.g. I have to do that often, so
I would like it :).

In any case, I am not sure about adding a Kbuild variable already for
this at the moment, especially with that name, i.e. it is not really
"threads" but "frontend jobs" and the flag will not be called that in
the future anyway.

And if someone wants to risk their kernel builds, then they can
already pass the flag today...

(We probably also want to know what the flag will finally do before
committing to particular names, e.g. whether it affects
codegen/reproducibility in any way. But perhaps Kbuild doesn't mind
having new variables that may be replaced soon.)

Thanks!

Cheers,
Miguel
