Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492027;
	b=YOMwgzxHvmQaaMO0t0eWit1kOMhEB4T1llUlhgVr/CoLCXEhfpFBffxxykMCawKYmoEi
	 MV57QAQMn8HUufxq2Uqn5qVPFaZdXPV7XIrrbes0u1kW6HHKi7UTknpfsCzhlfkyG+zR4
	 9DA8liiaugBIDGWpyxI0aOtmzC56H2A3CfAbsl6NrM0G/h1J0/4YHOHD+/vuzRoUDkT8d
	 utUIkAkWYl9XxlHyldZj8ka/XsvVH/Z/+jGC7H7uJtoz18ABjNcA591ivqI2QyMnjYZrP
	 iozQy4bhm/ZCsIbN9v3CFJi67qKY32JlKUti2yW5s4lyZlt8FUjIE2fyXwURpB0ooUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
	b=pBY+FsfaCYhkIJr9fXGWXqNTPiRvbJsxDExgxf6DHKaouT78PExcnDCjiuJDvWICJD1R
	 Gr1/lVw8XphEsUx65tgSCNgMPOLJbeVW9cp1fDBNncEpIji8nbf8grKp0JZyazTXaemBA
	 dobax+3vFsRIrNwTTtlJ2w9VziLpYoes+vyoMcIXv0IF5hmQo7SUSdAALKPeYWeS4NmxK
	 icA6ovPQNpIMVfF6VamISd6fednFvttjXWFQ3PWcR7VbFMfN643NB2tq9vLexv3eWmbcP
	 j0FQWmE2TBZ6uE+TBZ/3Ff0zL6GGMcvH0E2+YW1BlvlNLDfbu/J9vQDBXpSM4F+VlAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B229606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B229606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3667e94418bso30170eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492026; cv=none;
        d=google.com; s=arc-20260327;
        b=JfWNyaL/0vXBFZCJ22y1wLgjgaC1fq0AmVELqcWoY26AkYbw6GxpUCxjN6fkxFDQOQ
         WaTizYFart36Jlsj6rwnIjosAdBFxqb7Gcg0LC4awLz7XKPTwNZeIzh2h1qLnXFtNNJB
         FQE+NtCP77+Qj+6H4IlRdeKHz9kFhJSApfziFEAn9VN4cANCrIfqBSTQy1s0k0JGE3Ht
         nfOxmIngrKeXEXEz3rAd9JhC/HaxxorlTryviqUoKtgmbIE90JzYMBp2wlijF1fLcNV8
         QcZQmK0Imu6BpT6cm9sUceWgfaKoYIss2qRqwjPz9L6jNeBfiIw+jvafVCiIRpuihj+h
         nmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        fh=386v7ZmdJ1xz5m1I1bnofuMJT8hvNSy7maa247o4yZ0=;
        b=LSd4WqyZB6mnNfAoMcliTBK51kp1vB31zsq7pesjF3xrNDEZH1QhR4sre2eSdRPTY8
         cDYn451NEzJR/wLa9btiw1R9G9gvnW/tZOoW91IE8YNHTLWOVOkkvBImtNCn4+/qVE0u
         KaP9eufTHX6oJqSqucbcfpUAsiB4zgmGkAZhVZL1x6Z1mDx/dv1QpIKMELtfhqmSlmGg
         AbTIrgNQSq1dfMJEysnwNpOEQVkfxe4KMpll06eCqFMwFmbFyI3jMeVyZtLoPQvMgLUz
         PRcpmLxt93RZotX9KOjPfjj9lkHH98wDiFEcsOFNMMC3Exf8zRU0m0tm6phLmSc3edQo
         Idyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492026; x=1793096826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=eK+TzsrG8ppsuUBTMaNmtZbCwx1Zipxq05QH5xDzFvCB8pUTqpe+AMfkezQc9FE4q+
         47eMC81vpyd1Omv5sO+zDkakHWpHql5m6bNxnQrVrvxr67vRPTY6ommHrH46rl4pbAGe
         oX6tn5uuhJ0Pny2Z7AimovUIRmVppIjpaIUGRyBcLReYhmWvOUSr+tvqcrmE8j6JqQ5P
         zlspHWJBGuPxO2SoBJ4XJKzWF7VFR+Lxl+xi39nnPAMB8SGoovD6X8OZvLAh4PTir1zc
         7fQxEGw85RUrzwIka79bjhAwvI/G9PAfrDnYuaEL7jdUzxlwUMz0LmM6SSEsa902xGjR
         EmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492026; x=1793096826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=nYv6bLzUzyJl+sOfB0+8WLUkyJWpHO3PvFGlcYVlZ3+pbsS3lVrDTh39AMtk59T0zk
         ThnaIoLJqvg4elUt203EZF4b9/TglU3WTaOSX785D/N0R8B2pAU+OtHDkJVD7CYOh7wU
         Rl5XhkjK+RP0FBwxpVjs/WQIoPJmo4RYvfOC/zfe14J/HH2Jjn1ndRFpKuxXhlpFtZnQ
         bkQiZ0gyXAmzjOYJtJGod147mplcCc/cGhitpWFACOleNaZeBLu8jAbga2oIuJqQUXwd
         eeDDV1Lz60E26VfO86of2D0IBpk3Q/CT0T3dDT1rfp7QL97AGaBtDjK6GWhcwNU7dFSN
         2ESg==
X-Forwarded-Encrypted: i=1; AKwUvBy540qaJUKMc8+zxhGn78pU1x/jbOiZQvgHkB4QwxUvKRW0RBCJKP2ZBkdoTCsD8cVuN8yGRuCNqdD6YhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6wZQ+cglL7Yl8iN0c7t48t0PKImtio6hr8IEduZt6mPuCuS6P
	CSGfcHlxlmWNEx3MSY+BYz9fvMKRteqgqO9nW4Qox5oLtxV4LRL68PvRzgPCP5Pk94d4N/mS1bx
	CifP1aI4TdlTna+Y9w9Hsbj/OHE3XVkU=
X-Gm-Gg: AYBFou2elcwYZlhc33nIZ8YawbOgL+glhHFdr3LFS4V8fgns1TVVWDnzWjp+CaQDgNn
	qQ678YCfPWyI18NatCDf0nGAVy+3+gyzjf73aay2MiDbrJuUwj4kJ/4Z09RyGDz8CiNCGCN3t9V
	isR8u75qQOsA7m2pPkD6EU4rAPnrBSy0p10e9MaBsi8Jw8eqc3MnOmeUQvgMyRN9e8RIOZc1zQI
	rw5Ml7BCZT2sWW+hAyidryfx1+IZ5Sviqc/unacSmz3nGHpgCCMVSmpByLe0NJD2czb7tGOe1Ht
	HXGN2/5BEiJ7OnmFliUzdfO9/QysCErffcLM7e3qeebm4qZgXgALEFEv772VQs5bq7Q65Mi2JDd
	oiRfGKjwvN71WV4jMTWz3JptUqf0/J3yYF9gA4RaIJWjfyn/58QlxR+jN0vwdRZzN3RGWOSrtsi
	nWohyr90f1ybdkFaukFTe62waY6Icdz9LcYve3wCzHAeeaOO78MTc=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id
 5a478bee46e88-361a136a601mr21744064eec.2.1792492026480; Tue, 20 Oct 2026
 03:27:06 -0700 (PDT)
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
In-Reply-To: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 12:26:52 +0200
X-Gm-Features: AclHuK-QCNlJqtXqMEy-POlR7cKE_rSWRMxYBpanQuZ3UPD3z8WuYE16A81SYDk
Message-ID: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
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

On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Which tree should this go through? The Rust tree? Probably too late
> for this cycle.

I think you send KCSAN PRs, so I thought you would use that, thus the
Acked-bys (I suspect others thought the same). But the Rust or Kbuild
trees are also a possibility, yeah.

In any case, at least for Kbuild and Rust, the PRs were already sent
(and, generally speaking, I would have expected a patch like this to
be in the list for longer anyway).

Thanks!

Cheers,
Miguel
