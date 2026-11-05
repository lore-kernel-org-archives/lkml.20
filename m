Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902995;
	b=SWSfNusCnbB1KtnkJFNMnqhssaowIdAnt6WUN5xwA+7xSuDaC0w1pP7eDF5dClehQRJq
	 KOIKFLOrylngnsyrULEEXzoBroq6Lqv5vM+amguCGDbvKlHV7cyRBozg9wshGfs6vBoOn
	 AL7GOcF2xh40fYG6NWT138mtGJMr+QTY7kJRhdZKBUUikGS1aGqOLnuy/YrvWVDwOhF9k
	 HWEGWjT4MEgjAYcsL3xH45fSjf1scnA2nJdPHrksl7yLS8AXYoPjOGI7CxTHrjQjmNyqj
	 cm46HuJNcXE6Yl81fHiGtNqxuZFHWo+SMDZ2sLZTL74blo/zH+Ea0pigLR3AIOFQpfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
	b=PI6S0+yOl7v8lAR21VU2zpGntWEZP2AmCy7oRDLgLI22gd/RXFHRwpwpK+3AyiJ3iKhT
	 LR2JYWdHVvHoZI14uSz4z5VU8lH9GNWSmzg5Wp7BV9QTdMg8ffW+HQnvikeC9hilRairt
	 VApUPNvyJi57i6tMZmoQXzCB7JCNYd5gAVd5Hr3IEv6j7G3kSETWleg5XgcQSOAcgtalU
	 s6Re2BbL7bLcioBgzasX+OnwxiIm6Ra2XBPUX2QLux3tr075MapoCxlU1XI4QjRPBP/TF
	 0HiWbPSLY2yMlBTk47Tup2fR43C1glTswedK8EwHgLlTSybr1+q+AlBjE76W2Muy9kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="jT/ohXYh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E4606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jT/ohXYh
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso679a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902994; cv=none;
        d=google.com; s=arc-20260327;
        b=LuYyXDdZXNve95rQFHV+EGZAlvG8imfED89veokUqCoOJi0ZOvVM6c8YgLJnDH/9I4
         NqSCNeJqs4yYsGWWz/t5NpesqoczVE3+d7k5nvRq4JHg4haw0rLty+qMjBh97H9Ygxyd
         JPo6s22u+VfZfEgLfRQhShTekCgQEPvxdTNyQy0omJD8eBXPfDh4Zwiu2r2yjyilil5B
         amBdfZWG5dPd+nMcUmmUm8gOgAP0ewVdny+S7juxC1fiL+jP/QvNRlJnVN9OqjYqfjvr
         fBbFq9BCJoPUkYgXkt1vqntbQIlg5kvGAugaT9lYAeKt05cbmswg2clnRxPmWflV3PSo
         PZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        fh=Ss/mjbFN/c73ar1/q6E3zGle++qmKdGJkpC+sqPkkvE=;
        b=m7D+/7+CbSaQyYOXWUrfhMOETwEsJR/xVDK9aDNufwaAJx3QQ+V/6Wd03VV/x/Sq1H
         5iwiY0BvJs9kCCxcLR5YegIomc0M0Ocsq+X19pN4EFCrZg2dKN8kQzmIR2dT4GHSQgX9
         xHH8ZsCRq6muYbZ6ZxF+Jy/iUEa+AEJpu3Gn1ZL4fwzmNczL8odcMSC6bQ9LVDw9JPaG
         9VgRFzd5wAwzlL+dlzaLlyTYvypIij6heWt0CFppRO47NYdoJrlJl9dOw+51Wyh9ef13
         J/aKZqx0m/Jefnk/VS+31TdjRJgm+ZjdX0JZe5v+PG+t5egu7L0g6vlvefpHhVucp3Fq
         bklg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793902994; x=1794507794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        b=jT/ohXYhKPurLENgTWdqxeeQP7cstoC8e2GlkuKhpyjND/Mncp4runY2rcEIOPnNj8
         4O/hjV1tEE670ku4p8Jh1u6TQThxTZgrUkcbdyYoiROeKgBO38FcfJV9ZLkQ9sWsqS9h
         i01ljRplTBBKdaLnMoCF4tswKbz/Gn8vqORJq+BW8APdADU8AOgiYmKPSb51nJmXakK7
         OCBlM/roy05nY3GglWvrhafWi7C7uAlGK6uWVUqKTpMqJPBlndF4leG4QpkhxE6kkNq4
         VF+NEO+LZqhwOCi0g77/HbsCi6nIvblKlrJkCSFDchgKFkHcCRCd8dFDCAhoSDYMmhL4
         LJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902994; x=1794507794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        b=OIMKJrDDhr/m3S8mrcGfBR7dPJvywcoF801jq6Tpjq+K8teXCoJEFCKC+T5KQX5R81
         7OfA5kox+pIYUksuvLDAk4wXbEqcwqsfwzj2ajvXKIskKmoqY2QLfQCyrnBkRquQDnnH
         xyss6h6x6ta0ccmHu3vJuD6U5ZTwsmnWD3p4puL0WhNS5i8K+vUWzOjeO+IwFiEcqfXp
         KfXt3Adw7vB0dX01tFvDvyLEjMmw5ov4IQqDUQvBAeIS93YRhU+7VmLxuc7pdK4edZAl
         ZCaU+unuVhceA73v5OXTlDqDpJkmBQ2zEwO+7DX3+RRvMMfV5btIjqtqeG0VjRkZgBOv
         Ahzg==
X-Forwarded-Encrypted: i=1; AKwUvBwatvG7oWRUaA14WMtYPoH1q2wxjLdvF4KEC2NwXKUlJS97eTGEvZTKavoDmsmPFbuQyp85XEUXyZnLnaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AQeMmren9DGTntUYo/e7FDJG9tOSidYi2dE/G5oAcgYCuRGDC
	oSPnJpihJJE4anfzEA1bJKPViB08b7Yy2FaaGhZnj0mMjwTfFVNh+Zv1mNqorUNBeApg5yasfqf
	RABSXRoAJ5UYIJs9lzTCq+Q7xY++0O63RCM7jEx6Q
X-Gm-Gg: AYBFou1IrO6OtD++bltbmZK7gbItI+2nK7uYDBtzXJ9bCIBf6aLrvUkQ9ap8RTurrLI
	FZHioI+LOA2uktRMWBMIsYm7zFP7gMb83nRQmIkW2CTTCaV7xZ73sy3kLxS8qMiwD8d5P3RFmfr
	35t7V5g0U//jDPLE/I8dfA2Q1fvLXmkeAQd5YoyFIUfIvRC3MItCbDUKVefpO9vEPRTwcMXP5pj
	JmxbjJaQsoBJTvKTA+4LAT60+2G05kw7EurxT3YbAORuIYEoPRSkIy5ObJi6KtmdeC4fjFjSxcT
	59QV49pKVYOiXEI0WjonxKIVFvvOUtN83dTLrNBDaZMJltl6/JZTr04PcefYPAaSakHQMhFwBFe
	HELPJenaoh/l+PAjVTq+P4WF7hAO7WCLNmOO63Lle9pxVyJsVpAq9I6KNcEhRIoIf
X-Received: by 2002:aa7:d0cb:0:b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b5974977bfmr2576a12.0.1793902993423; Thu, 05 Nov 2026 10:23:13
 -0800 (PST)
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
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
In-Reply-To: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Thu, 5 Nov 2026 10:23:00 -0800
X-Gm-Features: AclHuK-iL3nM88J_jGCMxHWL2RXDHV3lXy-Du5jSeqmhM1AWFtXv6dHLUOOJdWg
Message-ID: <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
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

The issue you mentioned regarding excessive time in applyFlowInference
comes from Profi.

The AutoFDO implementation used in the kernel is FS-AFDO (which uses
FS discriminators). There are known issues when using Profi with
FS-AFDO; enabling Profi actually degrades performance compared to
original profile propagation. When we tested and worked on AutoFDO for
the kernel, we did not enable Profi.

While I haven't looked into this specific bug yet and am unsure if it
is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
to disable Profi for now.

Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
reservations about adding it for the following reasons:
1.  It is heuristic-based and not enabled by default. I am unsure how
thoroughly it has been tested, so we should assess it further before
enabling it.
2.  The recommended usage model for kernel AutoFDO (as documented) is
to use the same source. While it might help in an iterative build
model, I don't see a strong reason to use it if there is no source
drift.

Best regards,

Rong

On Thu, Nov 5, 2026 at 8:24=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi Nathan,
>
> On Wed, Nov 4, 2026 at 9:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
> >
> > On Wed, Nov 04, 2026 at 05:45:55PM -0800, Douglas Anderson wrote:
> > > From: Han Wang <nesthanwang@google.com>
> > >
> > > AutoFDO profiles are commonly collected on one kernel revision and
> > > reused across subsequent commits or stable merges before a fresh
> > > profile is generated. While AutoFDO uses function-relative line
> > > numbers to tolerate edits above a function, adding or removing lines
> > > inside a function (or an inlined helper) shifts all subsequent
> > > relative line offsets within that function. Without stale profile
> > > salvaging, shifted callsites fail to match their nested inlinee
> > > profiles in SampleProfileLoader (dropping profile-guided inlining for
> > > those callees) and basic block sample counts are misattributed to the
> > > wrong instructions, degrading branch probability estimation and
> > > machine function splitting.
> > >
> > > Enable LLVM stale profile salvaging (-salvage-stale-profile, supporte=
d
> > > since LLVM 17) for C, Rust, and ThinLTO builds when
> > > CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatch=
er
> > > to use lexical callsite anchors within functions to fuzzy-match and
> > > remap shifted line offsets when querying the profile.
> > >
> > > While -salvage-stale-profile is not enabled by default in LLVM due to
> > > the minor compile-time/memory cost of sequence-matching callsite
> > > anchors (which is unnecessary when profiles are freshly generated on
> > > the exact commit being built) and the heuristic nature of fuzzy
> > > matching on heavily rewritten functions, enabling it makes sense for
> > > the kernel: hardware PMU profiles are rarely regenerated on every
> > > commit, and anchoring on callsite names is strictly more resilient
> > > than blind line-offset lookup when functions are edited.
> > >
> > > As a side benefit, remapping shifted line offsets also avoids feeding
> > > mismatched weights from stale profiles into MIRProfileLoader's flow
> > > inference solver (applyFlowInference), working around a compiler bug
> > > [1] where a small intra-function line shift (such as in
> > > __vm_normal_page() in mm/memory.c) can cause applyFlowInference to
> > > spend 30+ minutes compiling unmap_page_range().
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
> > > Signed-off-by: Han Wang <nesthanwang@google.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > Much of the commit-message justification here is AI-generated. Sorry!
> > > :( Folks who know better, feel free to call bullshit.
> >
> > The justification does not seem wrong to me on initial read but it
> > definitely feels like the first and third paragraphs could be reduced i=
n
> > verbosity since this can basically be summarized by "AutoFDO profiles
> > are often reused, which can be problematic without profile salvaging
> > enabled, which is designed for this exact situation".
>
> Happy to reword or happy for upstream maintainers to reword themselves
> when landing. If you want a v2 sent with shorter wording, let me know.
>
> FWIW, I actually asked the AI to add some of this text. Specifically,
> I felt it was important to explain why LLVM would not make this the
> default behavior but why it was still the correct behavior for the
> kernel. ;-)
>
>
> > > Honestly, this patch came about because of AI analysis compiles takin=
g
> > > 30 minutes to run (see the clang bug [1]). It seems to work around th=
e
> > > problem. Obviously, we should fix the compiler. That being said, upon
> > > further analysis it seemed like adding this flag was beneficial
> > > anyway, so I'm posting it upstream. If folks disagree, we can simply
> > > drop this patch.
> >
> > I would definitely like to see that issue triaged but like you say, it
> > probably does not need to done before this is merged since it has
> > reasonable justification on its own. I would love to get thoughts from
> > other folks though.
>
> Sounds good. Thanks for looking. Let's see what others say. :-)
>
> -Doug
