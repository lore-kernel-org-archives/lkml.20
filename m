Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896247;
	b=3Md+1xoTavlfJm3Jzx6FSEpt3stVFCErrjoz9nUZZQpXkELmpFiQmQXM9/C3AVhHws0r
	 Y+x+T97H/iGdqglkJbQdlHIR+phD/kxB9XkHZZT0lK/cCwnxT6J32W4v42jhO3Om1WfyQ
	 OVvL1RPjLsQeIH0Hz3yA5tLdo7Lo3aUGbF/khMlpWdr37t4xnJNtSWQCaHjYTPydjkh62
	 cV+S2hahEhq0jGTpW2s4D76lzyVMPz4OCepUS77qPLXzWGBSuLJa/43DvCKpoFsjNDozH
	 9JPNveU9MhQaAXPq84w28DajWAE5+gMuY/8TuyDAWFjBK2pTTYKc93pNbLoVd2Vx68Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
	b=I2h1I1nD0Y3GlCJlNZOAHOiyHJOR90Tx9xy+AQiodl1PyqSjMwC/7xzMAsTL/9nrn/tY
	 jmyjCPxpWv/FyP6hqXVG6FoxlF3Mc3Rg7iJqzyMNT5sK5iNhBoGlbxL1XatnhDRmFQjQn
	 wrLPk82PpBVDkWLXKpCv5vB3DgxBmYo99PQ1xUmvUaQ4XUd4NfbvK61V0M3MqoieR6jo2
	 GaCV1CarY65gP75XUkdpi3OYGc0XGJ68aeApc7zs45nMSZE3YCCrDuf4gtG5rMYWd1Jyl
	 dwM0kvLXDLnzgHst09bw0Iu1oP+ttYWHbJ2hY1JrIV5awqzDkdjJ++7/gI5JYcdYPGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oZj2Qthq;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401AF606A33F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401AF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oZj2Qthq
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a49a022221so17060881fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793896245; x=1794501045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
        b=oZj2QthqIaoMgX12bDQzDLYYigovLdATU1ZTvS2usFr/kf3cMUEP5DF+aV+bxQF11X
         DBERifKPAwogTciTcx+oUAujKCKAQyZz40EXzMb3WzGXer4sebyZ1pIz9PDmaRW7ZVbH
         GqQUSgQfTnrbBKzWTywZpI4MWB4K6h73PM0Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896245; x=1794501045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
        b=vd+XCuYMVtpQDspkkKLrdDlhJfkb1CwBClyB1s/LlX0sY8WIuiUlmmbpSVpwHxqhTH
         /vCxXcLfBiiCHNaBsDBAHXWCFiDw1oc7otLBNnLe6eKhyXPu2z1ER+roBmbmtzoGEL6W
         VjlzUwqd9Ea9UY+OTCBjED5k1JIXKpjLoKbyP1YiiLZ2I94kjVsBPQgvG4zV6d/aOQlK
         7j/GsRuuN3pd8RthCkTnLIg6MxOZa3VjKQzW/XKM/m2AG6UH67h5TDcpRiFTe/YEqUhc
         o0grRIgB0asGlDL0DKAOjmIRWkShcsn7hiSySAJ4h/hly8I/zfnHwW25kuwRIYVegSR7
         Qlyw==
X-Forwarded-Encrypted: i=1; AKwUvBx1NyshZ+QieV4mrjW0q4YxiTZx4G0lZPkKEDquQyMEvbTI8BCV0jDR6xPjQdiBUgJzPOczysUZlI8dUn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EN3vYdDA915DINZVbeNQoMNWKjolZGUSqIs6DarnqNOLk9XvR
	hSz7c4/LUDXtqDFAj3svxLUaSAznFOfhO5OBWRiTXMxHOO7CtL9CBr0onppoNfAAoD3tVDaXH45
	wzFwQnLu3
X-Gm-Gg: AYBFou3nJLLHsSk7ePaSmuUDKBkKnZCgHQ3XakFhCug4e3QbTR+9ej2BX9GLgW61iLy
	b0HFX4qgokI6hcjq9rNU4nJSDmMi28/kyswa7Tr/2D2l3DK/ouywkpv4mhO762KRdqx7X2I1seg
	oXLcBxouYmKf0KdVfZWPaLLQ6WF2KrOM1ffbFQZ7jf3POMlRvefeGEoAJUpimInv6bU/7/MKS9H
	SBP41gf8VgbDLIsU05E7vMZ7wde29CsKCSUfI6A3TJZS7Io5ErQxHyra2F1i74EyKc61/nKschN
	Vc7EAMsaVosyTCl8qhrzsyTjpW0nhfoR4L8y/bk+lZz3JUUM7bHFbRKk1CEla/vApc+5ekpmsYF
	4EaUIJk5fqiBr4FEKkkEPNkUpJTvI1EdER4PUP7QV1PgUfYTIbFHb+9kmMGx2HZIcinfUnJlzzD
	lWS3JIDav4onadZ0/ZZ8ee72oOVnRFt6DQUcr20JW2IKWHZAnACU6YMzZZyBEEP5cr6HNFOoZ6v
	GQP9x6GBK0tL8DeDRHr/i7JQAUQ1MLiMG/9YArSRG2koQNX1A/jod3YhbKPxcnZkh/NkmH7pOMt
	eBhB1wYN1MjZDpUbAMXY099ilcK27v/apoQS6haIJtX2WKHeFYfQbF6Ka/mUjpS6IlbaxME=
X-Received: by 2002:a05:651c:c91:b0:3a6:6f81:1027 with SMTP id 38308e7fff4ca-3acb7b2366emr46774791fa.24.1793896245355;
        Thu, 05 Nov 2026 08:30:45 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bec5asm10526361fa.9.2026.11.05.08.30.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:30:44 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3acd239776cso18034771fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:30:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxkXLswoHQDEeUwgdlgRnwTuz/NNw5j16w/rMToUGLsp02mxEu1XjKagL+4OVDjAfgp7hkJyLhnvrNgpiA=@vger.kernel.org
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id
 5b1f17b1804b1-4acaae665a6mr332973265e9.13.1793895857514; Thu, 05 Nov 2026
 08:24:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162>
In-Reply-To: <20261105052401.GA862715@ax162>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 08:24:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
X-Gm-Features: AclHuK8NKe2Ice8G3ieACvjOY5cRy1bgQZ2ikhne4c6q9f8t2mnwrvferc3g3-I
Message-ID: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Wed, Nov 4, 2026 at 9:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Wed, Nov 04, 2026 at 05:45:55PM -0800, Douglas Anderson wrote:
> > From: Han Wang <nesthanwang@google.com>
> >
> > AutoFDO profiles are commonly collected on one kernel revision and
> > reused across subsequent commits or stable merges before a fresh
> > profile is generated. While AutoFDO uses function-relative line
> > numbers to tolerate edits above a function, adding or removing lines
> > inside a function (or an inlined helper) shifts all subsequent
> > relative line offsets within that function. Without stale profile
> > salvaging, shifted callsites fail to match their nested inlinee
> > profiles in SampleProfileLoader (dropping profile-guided inlining for
> > those callees) and basic block sample counts are misattributed to the
> > wrong instructions, degrading branch probability estimation and
> > machine function splitting.
> >
> > Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> > since LLVM 17) for C, Rust, and ThinLTO builds when
> > CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatcher
> > to use lexical callsite anchors within functions to fuzzy-match and
> > remap shifted line offsets when querying the profile.
> >
> > While -salvage-stale-profile is not enabled by default in LLVM due to
> > the minor compile-time/memory cost of sequence-matching callsite
> > anchors (which is unnecessary when profiles are freshly generated on
> > the exact commit being built) and the heuristic nature of fuzzy
> > matching on heavily rewritten functions, enabling it makes sense for
> > the kernel: hardware PMU profiles are rarely regenerated on every
> > commit, and anchoring on callsite names is strictly more resilient
> > than blind line-offset lookup when functions are edited.
> >
> > As a side benefit, remapping shifted line offsets also avoids feeding
> > mismatched weights from stale profiles into MIRProfileLoader's flow
> > inference solver (applyFlowInference), working around a compiler bug
> > [1] where a small intra-function line shift (such as in
> > __vm_normal_page() in mm/memory.c) can cause applyFlowInference to
> > spend 30+ minutes compiling unmap_page_range().
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
> > Signed-off-by: Han Wang <nesthanwang@google.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Much of the commit-message justification here is AI-generated. Sorry!
> > :( Folks who know better, feel free to call bullshit.
>
> The justification does not seem wrong to me on initial read but it
> definitely feels like the first and third paragraphs could be reduced in
> verbosity since this can basically be summarized by "AutoFDO profiles
> are often reused, which can be problematic without profile salvaging
> enabled, which is designed for this exact situation".

Happy to reword or happy for upstream maintainers to reword themselves
when landing. If you want a v2 sent with shorter wording, let me know.

FWIW, I actually asked the AI to add some of this text. Specifically,
I felt it was important to explain why LLVM would not make this the
default behavior but why it was still the correct behavior for the
kernel. ;-)


> > Honestly, this patch came about because of AI analysis compiles taking
> > 30 minutes to run (see the clang bug [1]). It seems to work around the
> > problem. Obviously, we should fix the compiler. That being said, upon
> > further analysis it seemed like adding this flag was beneficial
> > anyway, so I'm posting it upstream. If folks disagree, we can simply
> > drop this patch.
>
> I would definitely like to see that issue triaged but like you say, it
> probably does not need to done before this is merged since it has
> reasonable justification on its own. I would love to get thoughts from
> other folks though.

Sounds good. Thanks for looking. Let's see what others say. :-)

-Doug
