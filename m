Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E8D2DF138
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907999; cv=none; b=D9VIZJyhjAC5rQfQ2FwzqBozaHvROaYk0mWq42BLZgd8NFkDq/g+cNVUG64yg6/vz9Sj1KpqyuMz6QwW2bsxWBi80TehuKn2xWmuVX0oEWAVB6C6Jb1CSbnqf1TsI5aGivtTFdDmkeZoIjRGKP8CuDIbnRIT8nmC8LOXIVvg8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907999; c=relaxed/simple;
	bh=kAhCFv5LTaWStwG3ePgK/EOYB3WOTWUetK0ExCPUcGM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iPEvzO17wBEgisihzxb/Ne3+f2lE30W9IYaD7tiHOhhB1SpKJ2CjXEbTt1uxlAx5riwVqlqHJMw4YchHALE6NiIZ9P2mtoI4X87pALoog74Wn29y4PDlCnl9vmsnCHeyd4l0PWx0fxSZaEKGtxAnujCp0oeDJSyf3zm+/uMCp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sf70v3ce; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sf70v3ce"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-482e12bb58aso390406f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787907995; x=1788512795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zzb8PlgfViPl/NYp5cLrJkPm0ZJi/EOuK09lOiGeepg=;
        b=sf70v3ceUxh4CMMaxk81qZYF/fIXWPC/leuf+k4wCo4gjw+rIv2Lcw2e42rjK3Z/5H
         5wcA6vK+w9BDBAlU+NjiIrb7m21Nj56CX5WlxfseAnD8ZfLi/N8mkVoiX/cvPE0RrcnG
         paqhMbq9avJunQtFvRCgpG5Rdp9EWnDa1RcuRRnbIKuumbLqQPO6u85ga8khKJW3l/gH
         oZZvrntQ6Q4VGYLIKi8x+UuT8OcEJwv0nEfooo65X0IS4SQaR9l61qCFxevFgbTGgDTO
         l6DiFYQpJIVP+z1zxSjGgb+Wn15qt5pLfyIqN2R6pZww9kx77QuC1px09Vnsf41u80l/
         74Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907995; x=1788512795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zzb8PlgfViPl/NYp5cLrJkPm0ZJi/EOuK09lOiGeepg=;
        b=Bj+rOWwlt/Ex/ToXLxmO7jejlA7l3ekU0zGZ7R2R0iI/SoAV/3D5Tuw+ukJmACwwMj
         huSUF5Vr0iRiLnVdSxiuEsXadcSLYioC2H5w4qHjhZYgdSLgQKTNPhWYL+tpj4eSOdT3
         DqW92hQsSTeq26AZJzRawTCZXEL63Q1EVeevb3waSdBBkLwYINSE03CoU5lnRY87qjzr
         MwuBAmGZmD4lYf51sl/uH6SdomSwNgdkrdk8UG8j5dcCeSeLfSKxca6g6sviuJG+RTl8
         S8apFnOd2ZI1p3tF9KEHXZIwWPBJPHq3s5Nns9fKge4GVa/7LLFJW9jl5x8p59pthCeh
         Hzxg==
X-Forwarded-Encrypted: i=1; AHgh+RrRUIm04gY8bx2Ep4QedDXetLMTr9via9y4Z5s3m1SJzjjpckV6A9rqgA+ldfL424NeRjb4nf0YSNX6QhY=@vger.kernel.org
X-Gm-Message-State: AFuF++lpoFUBmPrPQXUFXpxsjBKEhTokryYIA2I8SOht0bdIHnUbCFYW
	9DCiwKB/GdtAtDH5oR2C3uEe5p2b/RHAZlPiWHgVPlYDBsGMZgXCWSAWqaphzNQEAKj4E6Z2CwA
	HyBFZUpe+vkZ6AizLDA==
X-Received: from wrue10.prod.google.com ([2002:a5d:4e8a:0:b0:47f:cab3:d461])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c12:b0:47f:80d1:be0a with SMTP id ffacd0b85a97d-482f79c7697mr7235087f8f.14.1787907995309;
 Fri, 28 Aug 2026 02:06:35 -0700 (PDT)
Date: Fri, 28 Aug 2026 09:06:32 +0000
In-Reply-To: <20260827150719.109145-1-georgeandrout13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827150719.109145-1-georgeandrout13@gmail.com>
Message-ID: <apFPmLLkH-FBXFdz@google.com>
Subject: Re: [PATCH] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
From: Alice Ryhl <aliceryhl@google.com>
To: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Burak Emir <burak.emir@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 27, 2026 at 11:07:19AM -0400, Georgios Androutsopoulos wrote:
> `next_bit()` and `next_zero_bit()` use `bitmap_assert!()` to check
> that `start` is less than `self.len()`, which panics when
> `CONFIG_RUST_BITMAP_HARDENED` is enabled. However, neither function
> has a `# Panics` section, and both document that `None` is returned
> for exactly the input that triggers the panic.
> 
> Add the missing `# Panics` sections and condition the `None` case on
> `CONFIG_RUST_BITMAP_HARDENED` being disabled, matching the style used
> by `set_bit()`, `clear_bit()` and their atomic versions in the same
> file. Also add the missing blank doc comment line before `Returns` in
> `next_zero_bit()`.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1252
> 
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

There's an unncessary empty newline between Link: and Signed-off-by:

>  rust/kernel/bitmap.rs | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index b27e0ec80..b33f7ce5c 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
>  
>      /// Finds next set bit, starting from `start`.
>      ///
> -    /// Returns `None` if `start` is greater or equal to `self.nbits`.
> +    /// If `CONFIG_RUST_BITMAP_HARDENED` is not enabled and `start` is greater
> +    /// than or equal to `self.len()`, returns `None`.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
> +    /// greater than or equal to `self.len()`.

This wording is a bit repetetive. I think we can simplify to:

/// Finds next set bit, starting from `start`.
///
/// Returns `None` if no bits are set on or after the given index. The
/// index `start` must be in bounds.
///
/// # Panics
///
/// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
/// out of bounds.

Alice
