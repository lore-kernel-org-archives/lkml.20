Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD7234CFCA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476687; cv=pass; b=OD2X5U0EE0uuqK6qwCJmltCmbpyf+Y1thlT3Hm6sH0K/xwjIQHesbx2a9X+5Bre1yJssPu0ZUgnKd4ZC2JqoY44wkUUfAX0FYiwMFzRpSfEfNosSEVyj3IJ4Q8VVMcj+kLYKTsqgFALi0UFmru9LJLmFf99NBcd/dq0eJhymwjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476687; c=relaxed/simple;
	bh=pogpfGLRbc8pFVw8T9oRRZ9VzHI74RwYUpxF7mDhYvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFWguCVHPdXlk3uVAOmPQ915MrCSmOfIWvBf0c17lFFQv5tQhEhNlhV5M3rdSWhomMGhoueA0gVSyhTgObN1h97oER00T7hCLzncE0BqxUOzJ1IUXzaNm5kOVwnVd6WiESTvobd5wIvTKv88tqOzGOp65W+gmtdf8MzEYjORt2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iF2APi0o; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iF2APi0o"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398b21b02f3so39398a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788476686; cv=none;
        d=google.com; s=arc-20260327;
        b=GkaUwhDSj2e5kspS2r6uxlYCELW4FVYagmIKd395Abi/XaPvDI84p/gt8rftjeA0vP
         1uol0wufv0WSB5bPHSA8sDJjwOCUG1CjLOWjMUTrOlbFqSxu0cHCURHuBs7nV4rD/kmr
         U3lPl4cpMX6r9Fz9PNX5varePziy/nUn3jMZw8MYZIsigCkCvvu+q7XLYPSKS61YU3yg
         NDGnoaSBea105Iwf+my3fA/M4NUKgQ14GfuXTtFfCNjrVFp1YWJYyhZTYsVwgOOCR98I
         gb8WeP3rk/zPEfeb9vii2zlbqUA/UVVnfHxwCf4P5N1llQJOUmWf9ZOWokhkZ/fCGUDo
         xTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9+DSqCT6KWQiTogvQpx/z89XAxQVuXIiB2Wq5kzB7c=;
        fh=ieId5XqcSFIgnRHKIYrrjVHGu7xTwKVxU6EvtHg7Efo=;
        b=Us10m2sbdn64CBVkXpFYm0rZlSNDMuoLs+P71/yiHEdZNEYyyV2OmENZYeq0kvwN/a
         Cr3MOOvQaNJzLIJ+Wjab44q44rflIe3cyVqTgVioG7aacEjZ4SEaTIeLE6XRWnAC6J/k
         C01NgexNPDS/4sZ8CcSAUweL0IMzoCWyc0qO7H4N5Mjnx6IrnxHWU/5q77GtZDg0/On+
         5fhu48Y9eSYicIMfhNfVqj8vvtZ4T/SswYG4Ocp468Spf7sWyDYTh5gyTOmFRBGQ8Xxf
         JzgLImTb0PoGFD/WFCIUzUOpj3wG6Ty7Cjh5CJJWVZCbCWbdpzcJoklzKmrWbxQudjIn
         T67w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788476686; x=1789081486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9+DSqCT6KWQiTogvQpx/z89XAxQVuXIiB2Wq5kzB7c=;
        b=iF2APi0o9wqWFAJvYmyyfAmB9qxIXaNYn4GT/1RuATUeiDcg2rF36B/U8hDaIBPByk
         i90VyeMXnNZztqP+UnpjVidptUOBez9MOAVOqPp2PazVJzgejTRWZJF8FUNu19r/muDw
         Z+2xIAQXUnXEYLbvYKNjYtkTSioD7sVg3GVjRgeQ9IyHdJtClmSYstArHQTxNP10XQZz
         siJae/1kpXyWdUgIFkSwx2qimq6/qfSy8G/dDYU4G6Fz6v6CImgHur4v425BXiFQKF7O
         BvUf/XKjRdrGzOelx26QZ+sc9p8RIxopZChDFR29viVgxAmntZP69rNlIlBSQPfbUce5
         VnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476686; x=1789081486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9+DSqCT6KWQiTogvQpx/z89XAxQVuXIiB2Wq5kzB7c=;
        b=YGIh50ePxqhToms7CAxtVwUH4dLBSqjLev9pZVWwtXnS66NNgBjyopZ8DchartcOxR
         wXaKyqQrmRV1knyjBz0GMKJaGiRrK+TP0e4nT3LOLmHK41hIC+J65FBLpv5TnopfovTR
         xrZ465XMLK7U4in0ANDEtuG7ma6YJtRdBsJ+hKmrWC/sZ/Hsta/j5zRZ0EFco1xlK2N0
         2swXF1XTFo3FGdkmjVJXeVekYbE3rL2wuj1JwzRxROcxm0Xg+pkiRZSfLNB1W/YvD46I
         gJ3ON005z/9fZdRsrd1GfxKmFq26fBX95bZF9cwip/KCTwgjQMHk/SqRpJ/8iSentQyD
         lfZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4ynAta7rRiWTZ+CIE1T4z11xxIKs5rAJQZDH4tw9wqWzaaytd5fBZTOIsn1Nbie3uZKsbp4c4UAcMdAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n/N+ai4Q5bZmiZyL8mInlb3nPul4ZVdejC7V5pUYx1CYnWl7LD
	zVyqmQDQh1a59wfQKPvwrjNujJCUH1pazwri5XPTG3JXYaUNq0Xi6KngmyjAMlc9QgTz3gMPXjy
	tg0b4sKChcTY5bt9bJSCs1YyaMB21Qa0=
X-Gm-Gg: AYBFou3BNko3W7W+cOZ2YG1hVtq4EApy6jy1kEtpG/aavd2z7I4Etb4eaUoqBRzAOxR
	og1ji0DYqqjr5NBjnlwR+/AYz3A+8Wt8AJbwByavJVloeMYybyENAFU8GgiEFdYTCjCIMYe/M91
	gSW7jc5diZ3yRTg5HE6JsH0iTIy7cqqylkShW1UY5bUYZjxxp5qtRifIt3MQYvgAlbKXigQDl8Z
	bODs6fHesvIueYOrJyv0SYb883E/tPHBgOdbjF7ymHUzQS1hzx8WKNRQ4WcW+ZNHX9KmwdVsD+b
	3Qju5HFLdJLThZSMO0tOMGIQtqpOwNGhIbC8qyjBiVyGrIjiYdksqhoU5tPwzibc+ARNUPGGmb7
	pPaiTjLHTE7WvMQdf8X+D/8TQKMS9ETfLxxUfXuAPK72kxLFQZrhJYf5fGA2n
X-Received: by 2002:a17:90b:2243:b0:395:4df3:8800 with SMTP id
 98e67ed59e1d1-39b25edbf98mr1644924a91.0.1788476685819; Thu, 03 Sep 2026
 16:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
In-Reply-To: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 01:04:33 +0200
X-Gm-Features: AcwNN1WBHo70zP4o1hDHlopgVQa-be7SFUVqk9JfwqC4a4f9ZIU4Rbq4K5LMntU
Message-ID: <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	WANG Rui <wangrui@loongson.cn>, Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit 2625480a1bf7 ("hardening: Default randstruct off with rust
> for better allmodconfig support"), which allows Rust to be enabled for
> allmodconfig, ARCH=3Dloongarch allmodconfig starts failing with:
>
>   error: kernel-address sanitizer is not supported for this target
>
>   error: aborting due to 1 previous error
>
>   make[4]: *** [rust/Makefile:741: rust/core.o] Error 1
>
> For the same reason as commit 84a0f7caafc6 ("ARM: Do not select
> HAVE_RUST when KASAN is enabled"), do not select HAVE_RUST when KASAN is
> enabled until the loongarch64-unknown-none-softfloat target in rustc
> supports KASAN.
>
> Fixes: 90868ff9cade ("LoongArch: Enable initial Rust support")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Sounds good to me -- if LoongArch gives their Acked-by, then I can
take it in the rust-fixes PR I will send soon; otherwise, this can go
through their tree or Kbuild's I guess.

Thanks!

Cheers,
Miguel
