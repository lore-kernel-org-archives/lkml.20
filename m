Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447155;
	b=afSX1R0zSS0boWoCTLyV9zKtqxwgQ2r6b3YsRt8V1F1BRuqLDTEDh3HsLhzBaUtmdXFS
	 eqsmbX9sMtLboXVqAsXOnGFRSHmOujPb+Q+hyLudhGnk8qvyZOHjJ1cgsa6mn3AMQskKA
	 ktDp5VbAr7UAON9fE/DWMck5CVS+ELX23LNjuU6q0fljfhFHAIKxnGm8xX1iMWJmI1wFs
	 H3oyrwFKT3bA7+4fxXSJhvjRd4x1UuBiSvvDWe0kQn8jAuIOSly9MNSsgztyxo6r6LYLw
	 bChdfipu78K1wznXVUxWc2sfIxzzXYlD5XsA5FWJaQmqQ2ZUCki7xHUsDMcepCBI/2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
	b=P7G613emKG5xxUneOzXG2/CJD1sdr/jsqggR8X4diNMPTs6BBwcJJ/VvU5ja0TKoSv/c
	 kHWybOrjtfaMcq8q9gt84DRMrR7XRxEW8+DbbvXLibaLT0uZYxhFLpAkY+z/15k/nfegl
	 LS3sFgmjAIWVK+Vz7zrBiFOMCpf7QFdAk/Mj5VQ7tWSPO913F7i6nnACQQ3H/X0keZy5X
	 5cQ6pVE2Sp0JZxCcakxsMI1iSILlz6lBEeeayrq5YoIJAValsc8fBDT0UKitYYn8/545M
	 9nKp9GwPwgxxHLhInAr7KD2PGjxOT07c35O+M6gP6R5UqZFGDHVWkPs/scoPaMPNfKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LX1cEARj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D87A606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D87A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LX1cEARj
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so6769008eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447154; cv=none;
        d=google.com; s=arc-20260327;
        b=QiG6QnVupIp8pzYX+usawrbWq6S/v/jmwUqWqwev9aRffVCfQ+xpHw2+4N56GuvNP/
         5clojLZc5xpSI43UJPCLDNFVDvJ3rC2o4ARIHuqtCcEuYX5wm8s8R1vFkLXPjDxxCuuM
         sMJiBWLjpjieu/75OYbo6A6Lga8UrwyU7BjoZDQ9sJCWGDQJFnACcMUGHSehlFwOFaQh
         UbAYRaVf+TI3GztRyXx4s/iOmi3+4Ltn+H72Gj4Xdq0YsrQ9hnF6RslO1DnYkT/u/iaq
         vLelcVE9zCrHvkNMLLuScv7ZnsLrJTbqLRGZsncVdePskACP7hkLJvDb0jS312KmtKl5
         k3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        fh=8/O0chiP45SN48Xg04oU1PPt4UxTV5X5nrGqCDi3mQA=;
        b=rBlrpYWguQLDOiJ76rQFjq1kfPpTyqgCx5EmY6wDJV0bNSU8YUgheCFetNQgFKWd6M
         +dH8e2mOfznehWP8C4txT3OAhcphOzB4GXQJBfziIPiL6udpA6AD1ZW1h3qLlUarz5n6
         14kVa/++15w2Ksjxw8dec3Zewh0ME7vBh/yIjtw8NlDedwUcXcBKP0vW8laKFXfW8Kx8
         Lz/6fahLhfZPEFPlr+jx2JAk9s1vjRCkS3Pe6Q1ixG+eU7DDvEG/ckhQZkInFiyZ6Ghp
         x+ksQ9HCHFWbOYo92bJu0XbyXmJrTJOOKW5C16iRyWOeRTgyYpubVG99LXhq+9OJ+UW5
         /GdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792447154; x=1793051954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=LX1cEARjYjyLWsHVq0TnFadifJpMl1riEBFE/Xx8mL8ByCwynKD6qynI1EhJIyeHh3
         KzObEBds2ULVeYU3xtibaPVku7fXs8HIAaTa3IL8EqkJGKqsm5ZEnk2LuCr7nouCAPHL
         EEGupoMs35LpI0T8ZPFeezaSAVyDuCMdBUu4DOHGL/2xcMYSI+AosaGkmZdwQJaIiQBj
         micsO+P2ZUueb9J4/4bAfcId3doFTPR+MlqzRxN9HYoDSz2wConPCJdJWMLwmtKXs/wF
         85Zk/FzK0k1omjubufQ2cY8dCOMFq2UeQrg2Tng76mJCvceisZ2bPXPqk3aX3zkdqdid
         4gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447154; x=1793051954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=W2QvXiqOmiUmjz60SBGx6cTxh2hv41lCpm5uB+pkDr+4+dRIr59avv/P5DWE0DpcZR
         +a/sCbni1Kv25SWpq30aAPXpG41R/LSN2w3RcFhrBcysoJWkRZQ1oDrD1VfdmsqFzHqB
         f076Xuc53d9c51aftEp60hhYtF5xA98xRRM2w1D5TjBVcv2gUnSOFZLwYUsG3UwglVQB
         6VzdG/KNAtPxHF1ZZi/t/nf6mrWRiHSw3ksAlKdhfrHCEAUQh61JPnYA63aINZmkTLUu
         CYaTI8dbXOe0IJCrYxPw2tazM0Hiaw6l7fwcbmKUtU+wxUScqAEIOiBfeyx1E9vkZYmB
         DjCg==
X-Forwarded-Encrypted: i=1; AKwUvBwl6WIkMFyPM424wMsUw/UpvDq3AMgi/N90R1a6G/WZFHvM/F6UV0SU5xnGa+9TH7q5E05xhGflnpMRfFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/tFWOKUMrwMUBwFm+QXJHQc2R5G5MhZyeek28PBOeZ5u9Hnvm
	MpH39ajm7DXi3aDwmHqyrET5+5yMF4Cjobe1hhRXnY/VErIyWunHRGH+isob3kUDiYxDmb30ODb
	p+EHGkDRfJoYZbriyuVseT+2VRdzLLy/kxOzCdXqG
X-Gm-Gg: AYBFou0VS6dsESEqiBOLJo+koujzyVTeagwMiXNQQ5K/glMtgwh4DbNrstxfhFRHUlP
	4+bTKiKJOxCg3eOG5uQ6IMs8OBIKXTiEQksf978wJGRKAgSLB8BireXMojAMGg2EE8400T9Krwo
	wHdl6DsdspKhvTXSIlghKIxp+SCidfaqPW9Y3QIxbktxpfIbN7Ce/JYBYYFfAsG3k2qQ2QuiNNa
	Eb6DmizgHDSGzd80Q6y3vNtd/9N49WjSuWRAXD6XQbZF5WoWIgePRBbh6wptLaslf/qZw7R14pT
	5hIr4DxfMh2di9bfDGt+uhqF5R+5ZowjcsuQmd2JemWMi5OyvFW5GCcU/PHsal3GmcMrwhoAA3x
	LGx2UWXt9jd8=
X-Received: by 2002:a05:701b:2207:b0:136:c443:80e5 with SMTP id
 a92af1059eb24-1876658f6c4mr9237879c88.6.1792447152061; Mon, 19 Oct 2026
 14:59:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
In-Reply-To: <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
From: Marco Elver <elver@google.com>
Date: Mon, 19 Oct 2026 23:58:26 +0200
X-Gm-Features: AclHuK_qWUQb64XA37ScTQq_ZMKUMtenjdgDmPfnErmCHixLBqORRUjuSE_XZSQ
Message-ID: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Gary Guo <gary@garyguo.net>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 17:27, Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Oct 15, 2026 at 3:56 PM BST, Marco Elver wrote:
> > Rust supports ThreadSanitizer instrumentation via LLVM, which is what
> > KCSAN relies on; however, Rust code is not currently instrumented.
> >
> > Pass -Zsanitizer=thread and the same TSan backend options used for C
> > code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
> > with C (though rustc currently rejects linking crates with mismatched
> > instrumentation).
> >
> > rustc only accepts -Zsanitizer=thread for targets that declare support
> > for it. Of the targets used by the kernel, this is only possible for the
> > generated x86_64 target specification, so restrict instrumentation of
> > Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
> > Rust code remains uninstrumented as before.
> >
> > All TSan options used are supported by the LLVM versions of the minimum
> > supported rustc, so no rustc-option checks are needed (they would also
> > fail, because x86_64-unknown-none used for option checks does not
> > support -Zsanitizer=thread).
> >
> > Unlike Clang and GCC, an equivalent to -fno-optimize-sibling-calls is
> > omitted for Rust because rustc provides no corresponding option. While
> > disabling tail-call optimizations helps preserve complete stacks traces
> > in reports, it is optional and not required for KCSAN to function.
> >
> > With this enabled we can detect data races in kernel Rust code and
> > between Rust and C code.
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > Acked-by: Boqun Feng <boqun@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Acked-by: Gary Guo <gary@garyguo.net>

Thanks!

Which tree should this go through? The Rust tree? Probably too late
for this cycle.
