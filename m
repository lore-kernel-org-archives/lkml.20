Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914595;
	b=coYR+XfBDVGZw8czV9kdO0BJdMBlfWIlRfjG+4SaFEqIelXan5wmKm83RDt8WcRfuOi1
	 uovjxIKhw4fFcAMgUi98fvJ/LEZKIcX6r38NLo9IYCKr7HLf1oKI4hfCFV7uTyJ3g9pDf
	 6aLbVWKmsZoQOipxeyrxY+ctnqcjgTatGdEu75u645IpaZJX8XdKbqKvfSwz5jZd95GGU
	 c42MaoxGEMPjO/hrqVp349jy5dQPSX//lN50k9uz9oN9aoO/iBcVFyKqGsFoIWeGsjdAI
	 +6pma7rmd5sKz3b9oAXW/+4jMkxKTSL7wyzMhwt/lcbTDBR5d5+gWdFnubmQbIGY+3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
	b=MbPe1KKcKl/XSP5vTEyRddinIYm/DuToLEskX7GE56kOYVyns6eNMVy3kshIuwAthGRY
	 ZN16QRxsgqB75/qjz42a8bYHy9EkmV1zI0f/xGuwADYhUFcdz1S4UHuDZVTedmfQq4zAx
	 e7+omklHsv9EIiMSjSfYocGUP2dHVkiCDGpCN/xqtiXVmBhxpKjAgLvaEJnrsE8pHLCb5
	 4/SUd/9sjDw4D9nC31WZq1cmpevkyWGLO9qfN2cYl0N901fQmA9+VLaH7lPQHOYur5IJ3
	 wBqIlN6R/Nsy9s6A31YIs3s5pk+tJ5/Suh3Hck6pqgY2FASdiOszKqv9VTcgVmN6fHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E+swxLJk;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8CB606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8CB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E+swxLJk
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4682977f9aso275616166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793914593; x=1794519393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
        b=E+swxLJkORqyEAhS0ihqPnSt7vPP3RQDZ1oEBVjaZiQbA674IkI06X3MIEP7rMWw2i
         T6hfjrw4hi2K6x1TJwje23rofdxa2aIcmrxiXl+sbPGtKF+vZRDEe+srICJrZzVWNXZG
         nLC3m48iFrwIH5Z9svT6y74ZIe+IeCjrgqwmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914593; x=1794519393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
        b=c5B3JjymumfD3M88ezz69EKhBVD2VFihjsiVQ+If+tuM5J8u7tWJ+sM4dlg3dK7kMR
         Ls5jkJ6u/KmQCShNhX+y8HOzhfVRJ4Cpvt0eELVid3qubNflcqd0VlaUbAb8tz4WeOcC
         Tt7eUv7vC71KqPaZCroKPxqGjgZ/VhZlO7lxr8DrW9dVHgwKHg+U1T2+mWJGBWylTt2w
         K72z/EU/Juq8m75g15D7602AEWvuTW758YosrEe64qbP3nYc4oxx3SBrs/5fZmNuiIRs
         xXFQ+9soQNu/zdwR2EDSMVYYgHj0ImVmcSl+QwXpWWHShxELi3UXcSRJ+yswfPvlEc3t
         dW7g==
X-Forwarded-Encrypted: i=1; AKwUvBwJIu7SMcKMIS5mbeazmfChuqlS6HEMBgU/LBr5SU87ZBrkzX+gwmz+4MANnLfICb4IfT49HMqKldBa0is=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ONOY4kwRTSnn2Fvm1vV2XtlsM7uueZ3mV/ZqFhXOBtiCtQNeU
	kZ476AtL9kJteO75ltVsb5mWULe3xuVv096M04wwNpbZ8TUoXnrO34j4ysKFdCS7UXwjPtkf7vT
	/WccqEdNL
X-Gm-Gg: AYBFou2pPjL5KWTs95oq7bIgf3usp6A6LHHLBT2ZCq/bGGk9tnwYQWGdiuCQj1ValOj
	WUpERgFAU1XI0FQgtJ3y8H3XfqKDMLR+KhNC6he7k5eUsIMYp9cgfW1l0jhQBwj5yfYTMcuU8PN
	MExwTGvlZUy+AUTnI2SaN5d+57f3WGITHM2iuMzQNlJ8dvLE2+p/aBc62xs1oymgVbOXSA9MXMZ
	ZiOs0T4DK7QXbLZ6wWSQQp/qmAezMxQnzVmC93rXeMoFEl+e2fUEQO+TfBAKCj9tV2YgcWdtfr4
	a8Ljny/8UOOxqRMSaxuyFDp18s2CNqNlLkyprlXOQh9nRpjT9WHI7eP0s017VCuQcWselosRsYU
	kNdWaxEUIhV1kpRGrBx4UOK3W492TcKsxB+hX9f7u8bDFvaVRfwmkNjK45QqqXNCQ1JctMJIaYs
	hUDt3LsBDePdWFzqx3+BwdD8jmlfVcimFGjCn5mDIlIIuFBYVJ/oZ42vM3AJWzysg6Gygzc88rh
	xP37NMQvlNUS3pVn/75j6w7OfyrTygzjUPlmr3TMMRBuko8Xo3ijtuE6xWUos4d+0G6WgsXsS3L
	RIDUoHw9IiGzbjK+PWak58eV+vV+h+I7AK9XHEwRyLvsdZoULBR0q1QhQ7REFUE3IoA=
X-Received: by 2002:a17:906:9f89:b0:c46:645f:cedf with SMTP id a640c23a62f3a-c4d3546bf6emr55274366b.15.1793914593001;
        Thu, 05 Nov 2026 13:36:33 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569f81esm18909966b.53.2026.11.05.13.36.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:36:31 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4922dbcee23so21603f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:36:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxpAoMeU+yiv95jx62dhGXG2G1MEtdeRXqBvGwoc4o34IP+jeoT6dUWVGH20aQN/y+NVT6lNr3S26SBE0g=@vger.kernel.org
X-Received: by 2002:a05:6000:385:b0:492:b1c5:6db4 with SMTP id
 ffacd0b85a97d-492b1c56de6mr417579f8f.26.1793914590008; Thu, 05 Nov 2026
 13:36:30 -0800 (PST)
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
 <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
In-Reply-To: <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 13:36:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XbBPOmuHZBuQVPQeA876CA7y79rGc4SL43e+At2+nMMw@mail.gmail.com>
X-Gm-Features: AclHuK_BAv4LnN1aXcM3KqfNxo3MqIMIcKw4DlHvuup3PEDMGIp0DVrOUgx1RpA
Message-ID: <CAD=FV=XbBPOmuHZBuQVPQeA876CA7y79rGc4SL43e+At2+nMMw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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

Hi,

On Thu, Nov 5, 2026 at 11:47=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 5, 2026 at 2:46=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> >
> > Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> > since LLVM 17) for C, Rust, and ThinLTO builds when
>
> > +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-salvage-stale-profile
>
> I double-checked that the flag was introduced in LLVM 17 as the cover
> letter mentions, and so it is likely fine given the Rust 1.85.0
> compiler (i.e. our minimum) supports LLVM 18 as the minimum major
> version, but if the patch goes ahead in the end, then we should make
> sure it works well with that one (or probably you already did, in
> which case, please ignore this!).

I haven't extensively tested the behavior across many versions of
rust. If you are worried, I guess we could remove the rustflags part
of the change? ...or, of course, we could just fully drop this patch
(and maybe add `-fno-sample-profile-use-profi` instead) ?

-Doug
