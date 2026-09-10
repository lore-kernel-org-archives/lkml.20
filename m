Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD25F3A5422
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025923; cv=none; b=QNDy6zRrYL+vR/O8dVfaNEAydBP90h1V8QKmdl6OG1i16GBwt1zrqOxiRRE38Pkbr8dV4F6RfAUD3RSCUuVO+T54M9tKxY/ZCOaA60GYuXy92hSfH3+707wTKjWv887yISPtSRd5oUdnGRt11TVZ6kgA2/tO3k7MLBmjqMYXFiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025923; c=relaxed/simple;
	bh=/yWvJFcsfLY94VZatJztTeqYVUp8nPFV6zbHdI6TcWs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7/0oC6HhUI9EJseyVso5LQfwUYuRVMIe8yw1+9WhKdDoGGih1Mv+yeZZXTjf5DYcQrqF1I+ZyOiVtuMngt2bsvXTrmrnzUtDM9qV0nI8y7IjriBK7Rc7/ndQVmTmgCr46ym+fbqgGAMkdzrZkmyI6E7sGAYCqXPXbVgIsn7MQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0ogh5+Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0ogh5+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7445D1F008A2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025916;
	bh=/yWvJFcsfLY94VZatJztTeqYVUp8nPFV6zbHdI6TcWs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=A0ogh5+YJ4mrzndWK/Bzhf43E2ENxSbGunrSTbVEATb8hZEVaoNotU/Ntg9YeE/a2
	 528Vg7qmxg8VOSCSagO75pQWlMftga4oCSED2W+08+Gdtb6tTc1d+qxcc0/y/C+nWR
	 XZCxuJoxMYXL30l+BTOxWOJgKu+ycmBmhBIlgMS2DnFltwp8Yzh0q3vpfwqC2khun1
	 vpG6489pgs68Esy2QotTGeoyb66pvOxZQmEX3JryV3TnQgIjkI3uF3mIeBQ2x9v8Sw
	 T0wm4yORaoOodxNGVfM9scsBDdI+xsuprg5NJJdDqrFMjTT0UlXHyPNnDvMcqleoDN
	 9yFO6e+2CqCJw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a20367cf82so54733061fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:38:36 -0700 (PDT)
X-Gm-Message-State: AFuF++kgJWhNuWCk/2bN1t83uKKyEVPkwmQxjqYdo609+bWKNiZItE/b
	Ij2dnlXeGQy8TwF46He7uUF07brhqnBXnt/fwuxO5Pntf/ygAVRdXnQ2W81L+e/l4w4KcNnp90U
	6BH2YodRlh3m2xLrRF1fQGKzEzvmA0IU/+GdpQtXgGQ==
X-Received: by 2002:a05:651c:a162:b0:3a1:b658:feac with SMTP id
 38308e7fff4ca-3a371bd3747mr45593171fa.13.1789025915093; Thu, 10 Sep 2026
 00:38:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:38:33 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:38:33 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-2-24d192f93760@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com> <20260906-add-rust-gpio-consumer-v1-2-24d192f93760@gmail.com>
Date: Thu, 10 Sep 2026 00:38:33 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mer+rTE6Rmqo-wHX3D85wCppCm-A=SUw3zASTB0+JOD5A@mail.gmail.com>
X-Gm-Features: AcwNN1W1gzJdXi48l3F_-WSnJKwsjrm2sy9oatIc3ZNuHBR-db1aIy6pIqXYBKE
Message-ID: <CAMRc=Mer+rTE6Rmqo-wHX3D85wCppCm-A=SUw3zASTB0+JOD5A@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: gpio: Add basic consumer abstractions
To: Kohei Ito <koheiito.dev@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Sep 2026 10:45:50 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
> Add basic abstractions for GPIO consumer APIs.
>
> Due to a bindgen issue that may generate the wrong type for enum types,
> `gpio/consumer.h` is included at the top of `bindings_helper.h` as a
> temporary workaround. Once the issue is resolved, it can be moved back
> to its proper alphabetical position.
>
> Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
> ---

My rust skills are still quite limited. This doesn't look bad but I'd also
prefer someone more well versed have a look at tell me if these make sense.

Bartosz
