Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793463482;
	b=elISxOW2B8q+vehYF71nHWSD+Zkt/6NXhMVaR5ux6WMfkGZmkrvQfvXKttGrFI08LKDl
	 gCpcogfuKBEHR4bHw240QRSyOnCfU0Dl6MQxOr3WInD4St4CIat5fTmZEmUY2RbrsCqcw
	 bxqexB9EhkzbIaVtc3lf2No3d2ONGFhqqN31BIKW+7qgVGLTqHCayACKUvVXtpi6fZrwL
	 +Saoy9mHuHpEMQ1kJX/Nw5Ob92Fs3Q2l1DAb7ewTuwxVeHwsUH9NCmnfFzclcKzZLqB8z
	 TCpQi/+SXzOUs9mbf4/GCMxgO3YwJPP4O1uXjT3xXRzOohkUz8XY2J34TJVeWZrWzFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B1bwDfWXqtdtKzMUXXL8Xhn7s+stBQep1iI2lQ9nd7Y=;
	b=RjQ8ztnxL1m9mIpR4COr6TuLaR1di2+KyE18ho7DIKYCP8nTPtA4h7uBVrcBOWYNX6ji
	 m2Z4N0bvvk9gXsLk5rgLkBZhTlkonOT+EwG/eZKFvjkQq1bPFrspijgwgrhWK0CkrElqa
	 shQfwVni+b7PpEBVQxc1wDHlrcZXxWqc8LaW7S0ts77+T44gjtUlw+tqKvmFEmb0uZ0oz
	 OEsBnRwrLRIMrVU62O7KXR3lTeRB2o+5OGoSBJqO1LSWDykcLOTy50XCOg0zcwKZscCk3
	 4uK8053zSA3RwiexzGGFbqGhgHrRC0Wt1VMlVJV5fDyhVtntqsgQ/oCmHu0m6Xnu6Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fsyXfqZA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366FB606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 366FB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fsyXfqZA
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1187707f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793463480; cv=none;
        d=google.com; s=arc-20260327;
        b=Qjkfz72AqlrSQmBt6X1LXBaPxY1n2LSphmopK5leopJFc/spCwPwU7YUulbu5uVGLZ
         rDVPN2L/QM2447kT6BERo6WUFy9ElSzMMkLCAbujQ02PCAnGmzsK9hNI7VYrV5VeGFYs
         I4ct6TfKpuUVuRlAHuCxLlwqa1HNcCpwZjfUAc2302IxuM6abRBpWclAqPPjetIVuakF
         Rl2GA6pwaXQ0TnTqasyhPmJVUhrMvSrOE3jyBaWrjW2yf7YoUiM0zKycHs8/4ZcGse0Z
         ffmr7d8hX2uEwHLFSfmJfBM49ow81XKRflPAhN2HDEK4kYobGvIWD+ia2Cn561UCbwbc
         Yt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B1bwDfWXqtdtKzMUXXL8Xhn7s+stBQep1iI2lQ9nd7Y=;
        fh=hm4hBTEeLnwAKQbTPWNRHvioyZsbPCc+WC41jugiDjM=;
        b=cg09xh90QvGPF3W0z8RGWdFmzBau1cUaeqbM68y3TFWM1Eh1hS/gUZOiXm7KzNeCyx
         qX+mwXRxo0/4vGJzbC25cgdtrKhdBPS9vKH2HdskLj4ZFVB68QlYcnWGo4hh/GLRpnk7
         L2K9v3QQzLNC/JB1Tf8D4Qaxtuxa0qD5mFR4YsLMnPBSPg8PXFrSd0TIy/8ItN7jlVag
         JM4l3yR7RLdC7Kw/iLsW3ii2AJXEHLtwgrM8EEDFfr7aEZqtSXAcEtAh3djChdddeuGd
         0zpsHKEwj0mgIPc1W59ErSr5dJxs7j2A4AiU2wSK/xTGGBCuRkgYuH+5iAC00G5DVupw
         D40w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793463480; x=1794068280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1bwDfWXqtdtKzMUXXL8Xhn7s+stBQep1iI2lQ9nd7Y=;
        b=fsyXfqZAOV3CRH/Mk9W5qKH+QAuXRoVHQiFPt8VfTL/X/gLTEeSd1Qb6sMYxW/PGcj
         ABk+PV3TePzv/Oo7TcVxy/UrGmGXeTr+i3GA1OyofX0ufwDoBTn0a1Er4zpusI7iL/CF
         X70Hdx0DwSaRWKi9TR5ApQ0aK4fdqlaKgfQI5rHW+g/TwtDXUknu6BjSpM9IskBEJ+Ah
         7sySD6zZjlZevdA1iTi7bupNo2z7aFxGZytmH6JXu1Kw5UNetlKYpuoMLmeA+gqyZeyA
         BQ3fLoh6ru6sZxD51rFSuxz3JuwYFzeTlqJ4KHxeB8GjMh2UWFSGy3BLrGRT/BWEVItT
         dqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463480; x=1794068280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1bwDfWXqtdtKzMUXXL8Xhn7s+stBQep1iI2lQ9nd7Y=;
        b=R4EtkQIIv7nvDxDiPZNcTVAeXFMkxntzw5gGkZT9XFoaifpSvCl0Sqlc4Zr+fsrgsR
         +j/L4UDd48SSRsOtjlWOsHD+16ywel/uoZU7Wu1ZEd7KPZjn7XniCIeBHIe8M6c0G3Tw
         o9U7ZeLitkO0kpIESs+057ndzx3hJZ7WV/vp+aGiW9pf2xX1d4gOaEFza8eqbLOM3gMf
         90QQhnwGdrGgKZ5Tvwv2cATCZ+Hd26nsusymvpcCX4ovHsqey4Zeic3Yn6nBGfCXZD92
         i1e1C+/un1H/N3PCmwFEUvUtNp1xHtObiZLoaI06YYDQLFlfKVbvbqbFyGQcUNyF2Se6
         g40A==
X-Forwarded-Encrypted: i=1; AKwUvBztfp/ofuoAtFJ2H8eMPpwCd4hQ50MLPY1rkNku2+KVsz3YU/Z3zYtnQT9sKNP9REhGXc/U5DLRf8yXbCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDbJAGjPtTXG9Vy+UKh7P9z+f/jhMD9qPWlpNegedu/UuGdby3
	at37MoWuoSA3grk7XzEwifRD6DKZ8w9eEx7J/E6BvRAvU5v68SUqiut3Wc0LnvdE0o4SCW/MIkg
	igSCUsPALe7oGh+791+Af7VXEyGyg46t8D/tcw6Hw
X-Gm-Gg: AYBFou3FItisTtaSl4jqdEX/3kj9r5nR8V9mfWjAK8BTMP6qBM+ifXXTXpXYzApVXLZ
	UpdX22+A8RykDvVQtyUD/T5AfHISlTnIZW4boWzNoGXFuUdd97XLyo2xM7CwC9tHacg5sFnXhSp
	gYY9ZoN9JRejET4+ivN78E6Zi9riat7Pa8VgVVVramJSxBez+SYFnDwbBNbd8rWB+p1qexcttgr
	W2lI6U164UmIqLQOHli8lzY6AS9H/GvLEThi53w3Rtva0SQ+oTqrPXGUSER3yoQtZ4WXEOLl2O9
	QzBr4gw7oBZgDz9N8cW2BGx85NhLYxFKNjSrmN53pzZQrTZhI0Q208NW3+nNJ6wCOpFsnbfQyYt
	ZlZSUxNbQf5s5c+4MPuJlEX2z29kEF8KOudD3gKnUC/VJfK0PnKeo9nRhFwraFTis+ReVSGkazN
	as9SoFqaO8KDsDWByNIORzw3WvWqMZm+acjtw6
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id
 ffacd0b85a97d-48e6e501911mr12571791f8f.43.1793463480123; Sat, 31 Oct 2026
 09:18:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <27b58e47-723b-4d67-a1f0-ccb8b0ae66a9@kernel.dk> <20261031152846.746656-1-sashal@kernel.org>
In-Reply-To: <20261031152846.746656-1-sashal@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 Oct 2026 17:17:46 +0100
X-Gm-Features: AclHuK9l18-NBetzRhpu2rSGbrBFqOZ1yvwZnbwEAmvoiR_gPddFIoalS6dNMJQ
Message-ID: <CAH5fLgiSOae48jr65rv6ynLWUhT7xVCjjCEK=9oKXvSxKpdq6g@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: derive Zeroable for bindgen's opaque
 array wrappers
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Josef Bacik <josef@toxicpanda.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> bindgen 0.73 emits the blob of some opaque types, such as ones aligned
> to more than 4 bytes, as a `__BindgenOpaqueArray` or
> `__BindgenOpaqueArray<align>` newtype instead of a plain array. The
> newtype only derives `PartialEq`, `Eq`, `Copy`, `Clone`, `Debug` and
> `Hash`, and the `MaybeZeroable` custom derive does not reach it, so a
> struct that embeds such an opaque type is no longer `Zeroable`.
>
> `spinlock` is opaque (see rust/bindgen_parameters), and with lockdep its
> blob becomes a `__BindgenOpaqueArray8<[u8; 72]>`. Commit 71ec3c7d6db8
> ("blk-mq: quiesce a queue that joins a quiesced tag set") added a
> `spinlock_t` to `struct blk_mq_tag_set`, so an allmodconfig build with
> bindgen 0.73 now fails:
>
>   error[E0277]: the trait bound `bindings::__BindgenOpaqueArray8<[u8; 72]=
>: pin_init::Zeroable` is not satisfied
>     --> rust/kernel/block/mq/tag_set.rs:41:49
>
> Which wrappers exist depends on the bindgen version and on the opaque
> types of the configuration, so they cannot be covered by unconditional
> impls in rust/bindings/lib.rs like `__BindgenBitfieldUnit` is. Derive
> `Zeroable` for each wrapper in the generated bindings instead. The
> pattern allows for the spacing of bindgen's output when rustfmt is not
> available.
>
> Fixes: 71ec3c7d6db8 ("blk-mq: quiesce a queue that joins a quiesced tag s=
et")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Is it possible to instead fix this by adding the impl of Zeroable in
rust/bindings/lib.rs, similar to this piece of code that we already
have:

unsafe impl<Storage> Zeroable for __BindgenBitfieldUnit<Storage> where
Storage: Zeroable {}

Alice
