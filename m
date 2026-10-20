Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792520558;
	b=4HcLomzvN6OeK13IQVRT7uoNephSScRiVWyfpzR6Swo+nkmaTXf8+J15unJA6ehyHeWr
	 MTsAVQAPLVpyfwxf2oEWwc/kfxoU3Aje/DriQ0tkFgL+/7XSOQ5tJqYkc7XUNLmz9CH/s
	 EEFFdxEaaY0clRO3o6qgY4l6VHSlqKJgEsiRPghTejvAZZDgFu4qP7z8bbok4xRmXQ61L
	 F2rH8bF3/iUq2KkzRhEqBcwPL2s8DZbw9SbL84ohDelFTgYPz1NKfVlWW+dRbj+mRceP3
	 U0z5JJzqpgKsx1XHglpdxx1qaXunj+AzDXWrt67n6NpwAKpLnP3D+m9xvVHkbhj9ciQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
	b=2hq/Oef5Ub8sEJwqPrv8Z1hYLmQSyC294HsPvIy5jTaPSdhTLlH8xkF5wZerVat+6apC
	 M90J5xPHEMl33m28q6FLn72PTvDXU1u1UhBRYN41Y+3EIk4BpWJWAMj3QfLolI7hWGlcw
	 VFLKzETDV8wDRKmFk1oBDE9+EZxoTSRe5iSV/wbjV/+EcWANFAuLp8lwAxLEBvP8wEACG
	 wI4iyGa5B15CtZno/wi3dZAGLktZDcFR7StTW0LvC0oGaWxj7yqyf9ug3Kz9p6z3mnsiD
	 D6MhljaKirndG8iPQxeKk1FVq8qt+PZNX15kBK6csU5J+jCE5RsaDjSM+hBqm+gELbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jCpPoMO5;
	arc=fail smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C9606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88C9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jCpPoMO5
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67583c777abso1159206d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520557; cv=none;
        d=google.com; s=arc-20260327;
        b=RQqdqqvzFP7S3ww8LQ6IobdsekLZeXjcM3CJNpcgdekOOKlu2wVGkV83WRZOgX800c
         hUGwyEjzac6eLxnYjHUX3v7I9IL5qn3xYXQiD4MBx9kbpzhmt3o/18hml0OAmcc2t4Qf
         nlGVYdu8G9v4Cl4+14caK+p5xuvYBeW+kfvk+vJrJ3G2Qo52A5tDeerSo1dhwKTkdwxx
         adwVbV5+ut0Zhfx/JM6o0H/tgGoiqN2QjmPgp+qMgNxJcWAdY32zD2f51TdOXYV5J31Q
         DF1UOIWhHAkOarkQ2Ec7XEYSbKRFpHuI4leRmsKLbt2FIFcBhhI/T5FSbwKenQNY++zE
         95hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        fh=HuIb1jl/Sz0FEe9SjkWPHLXcqFRPtag+TaWqaEYICKY=;
        b=q7/GANq8iSEGOX5n3sMXELqfwVRX+u+Hp9zVqLeC63jBNA+vEXWSHPJzILjte+ny4j
         hwoWlLqRpbJiXTKE1NHoI6wOuvvsCsZ1b7VRH+SygRR2ccVzNaXOB2Uly5NMpbVCCh9F
         bkX308aVg+hbppq2LZfBgsPzsS22gvbQ4uYpwjN/uvC5TGC9XxF+nZ8RE9LBKRNAUiWk
         2r+P0h/BsPQGKT86Vv5M/5kB0Dx5zQzeO1Sl7xM5st30hWZyysU3cZ/uDnhApe4lzeQs
         6VVziiCLXrrOU7nHq+LOrlz/ap8XlBRgpxhBs9n6Cnv1c5Zjz/hHbWd+Ymo1aV/tBEae
         NLow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520557; x=1793125357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=jCpPoMO58y6sJRNyUMWUWt3Xaw377KaYeVqrCJswRAQ7oKQE3kKZ95epr4PHsw8jDo
         +Vymhp4pDTcYix/GYcYigVbhJ1c35neN7bD/cng2pd+6S7s+QzkwOXRmFWhmrZrBgKtS
         uF9e/+MT5cJsEuOOvqCc7whuK+e6LEQbbFr6JTp6HpsdMQassQUMqaIylxCgHB7Nna4X
         DLnrnpOCODqRFSx8BjU8GCmq/xzr12NndAQ9cVvg0WQ8c0FEhJ/i5779DSYCzc6Mmt29
         TZInkgPURMOVAxBDShoWsPQiMMC6ZVT87Cq5hblK6YvF0yoLo69dvfI3KNOWArT7GB0M
         CZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520557; x=1793125357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=Y09V/mLvxlqXRFnZeBasSOWLpKxWop7BJDa0kADJm23/i297DdK7/WN8RMDkuNfeFD
         PwOmeFAr4S2UdzJfmG98mJ57F80FrhKPLq8ESOhlbXXQuyVqNPyM96kx5xtcKBtFAH1t
         Iyif/jxw17KHnokrs2quJJk0/eL/BzTFYgVsHs4bNHkYsHL1WcjIMVLOa1dLRqHvjUZt
         bvZgZVEszq5SYbWtlZa956N5Nt7wq3W2LWRLN+4JXK4xYoWqZVgaMJ3VA1V4xdtlpsKG
         UjJMCY4E0Bvak6pOXhUfvwEBhgmjP2DKmQcJbFZQGRPn9kEvgnzMJBfx/9Sa43zOEj5O
         xtIg==
X-Forwarded-Encrypted: i=1; AKwUvBwMqajgStEorIp3Und7ozhKLGgHrB8imtWZ3YUyWf0o12HKPooKwHEwsWYZ1ixdiZOCqkWofEW+0pxttBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1geym72X6lcPHwOJfRXxJRhGZGKDc2uixJT0T878Mps50dFkH
	7ImBMJzU/0Sq+2Rvw6HMzIFtWZKANRC9XE5ZdWc2aCKGuh4jFgogkR15Yyt5AKAPAmQGbq//f5x
	X36Bv2O2Fmjh1e7hq3VRUnOS66eRIHRPA8ZTeZtnD
X-Gm-Gg: AYBFou0bcYKkE2sHjI3+Afq90fFzsepu2A0gFi8pJJonMHIzNayxR4HkBSJdxdVE7Oz
	H849izic97Zl09qQkD/l2TDyWi8lSVHHndScqRfSVUA2mdXeS6PshDPgCNPEJeGta08DKsjUWTh
	zOg1hduTCHZPsri0vUH7DzSnc/PQFXXpsb274bUgL+kpX0l+apa4ABFMEOahQoZVa9u+PzCJ5H7
	H0F2b0mLW5RxMW03FhHHEXSAbuqTwMTzxXSPf9Hv4xE/rPiWHTS+O7t6t5O7ZOwefCNn/+EKjVq
	x0oQmhpQzOK74c8MOnVjzcO+ruyURO8UKZx/7gL8Jh0y8iIwdl3rHnpH4fA3+9iuEKcoP051yab
	+VgoyNfd0i3o=
X-Received: by 2002:a05:690e:1508:b0:675:61ed:ae79 with SMTP id
 956f58d0204a3-67a0e53f3camr15368d50.40.1792520555651; Tue, 20 Oct 2026
 11:22:35 -0700 (PDT)
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
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com> <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
In-Reply-To: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 20:21:56 +0200
X-Gm-Features: AclHuK_xIgQ2EfRpHmzLAMkZfp67LMe6ufygxtV1abJhpWdiWd3lua4TQ51kRJc
Message-ID: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 at 19:09, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Happy to take it - but in the interest of avoiding conflicts, thought
> > it might be better suited for the Rust (or Kbuild trees).
>
> Same -- happy to take it too next cycle, whatever you prefer.

If you think there's a low risk of conflict, I'll take it.

> > Needs some -next time, too.
> >
> > If I don't hear otherwise, I'll pick it up later this week / next week.
>
> Do you mean for this cycle? Linus may not like that, but up to you of cou=
rse.

No, next cycle. I'd pick it up next week, push it to a branch the test
robots see, and then update my -next branch after the current cycle.

Thanks,
-- Marco
