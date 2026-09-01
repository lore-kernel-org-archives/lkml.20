Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA878383306
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304762; cv=pass; b=YvWKa61YS27vP2Fpb2LHn7nfglOIxJbjW0H3V0s2OVSD5HRQZ9LrbzErc1TabmVfVOb54zqNKiKn5Y8OHSEJGugMNhMjf+VH+sL1YFmrX2z7DK6Df+hkLQZcdyGqzIpB3MRQF9wR8vlzusMPbUCcijQHqv5kMfsCcpIE8Fu4jDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304762; c=relaxed/simple;
	bh=e3eIoE3QbpFgDPEvZO1d9sR5o5XokHbUYC1b4+KVcrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdMrjaIX/zJkRbyT78LnqeFhQjQk2f3pjtMdxbaEtZL116vZAIzHe4QgaSpxrhMMcNFUnn+ax9yQMH4O6nkgpUyCNVB+yYFV0ZjkbMgX3CuUV9KsERDfa9+410YGejrfggtzjCIbbqiwPeFsyb1LYm5yvoNSgIDBwsK3peEb5iU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHU8qZJJ; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHU8qZJJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c9b7c1e4so31206a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788304760; cv=none;
        d=google.com; s=arc-20260327;
        b=EEeob2/bo30qMtVxEZT36G7WFaWty3LFNQbRyngHSdayXUKzu87RayBNuzuHX/kaAn
         uP/rGJiBv7RXC6arbk8BflMn7DRXoTp5OwZwZ6nvedwjrl6UjCe47ICCMOVMofVjVVX8
         Df7hgsfu4PtlluFDrOEbDfvqvIS0ljSzyaB1SPG18gp/lO1UN2ir/jBxQasUUQdkLzVa
         mK6np1Ry1PwGC2BfjuNGefFp4GHnMlhE8mQ+xnivwzXw/QzJcQ1urCT1TeD/v3UJDHJS
         MSjrd0X4EteenLPMyosAh8uap8WuA1o/23eihEH+HzN9Bqjd+K/wmPt9n6dwhxhMVp3L
         3agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iTO9Bl1A4M4zo0TJ+YJltBWqZ51NBQa7Q62ZAYSv+dA=;
        fh=lonCwCtaB4bG/U4L8qZ3ivnD/pi6RTLleZRIuyyrhdE=;
        b=PduB8UaQH5NxkYd1MBlUMGKhHhUiNFnem0rjDSiJeJu8a/mRmBRd7vtXtBcHzvnrrf
         cPriUjo40KPUbLaLtrRVssJG/SwRcoDoqeSoVZsYCn0xU6qNmWujaIR4gstrPHlMlvTR
         27JnaQS5xYGaLDNQV95KRzHNWDuYswXwDG3ZRSyOtp1ohHTE9ucf1gNE1o7Sbp9dVgZI
         8XP0WSZh76VfAWn26J2ATftoMxgz7kuR2bWhbZvqZb5qJpf+yJQJNQoeQEkoEe0x5PPs
         0IQvjlgN8wuLAdLD0lLcczsLgMrsf9fDDkyhoYO5BoPwHon+6u5Jkoa2RL/t1vWZhLI6
         Yc2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788304760; x=1788909560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iTO9Bl1A4M4zo0TJ+YJltBWqZ51NBQa7Q62ZAYSv+dA=;
        b=NHU8qZJJsbIovzacun6W6j60DPY7qC/RXd0032SvchbEznI/C25s/BGi6LVhNSPHVw
         pCNbirXlyYGTAsW+KiVzX8gg6gUXkxFX85/qBwQEG+ASUOKBK2Z6epFKEcK/A87eQYwm
         ELH1MLG0twhagHxVRbSC2Ezbl6JD289wSpY2lqvAQUyqxbAtlVaWBvqPHvOszed7lfUj
         /FpgPOfIRvo6qgbGwXGleOvFWRd+Qc8r9FbFhDYqClumx4BwCWSjUtJiqWL2MOHbZa2A
         /j6Nqd3tbwmFJDg53ApOFI50wz1yP2vYrmrn+r7MSHcXFVf5ALI/O0xElePXWeF0HBSr
         OcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304760; x=1788909560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTO9Bl1A4M4zo0TJ+YJltBWqZ51NBQa7Q62ZAYSv+dA=;
        b=Y6vqCQ51oAL8/79MDy+pFmL0NZ55qJuBFsPpQTM078m5LwsxK7mcGOXGzG51RQBd5v
         E2HR+EAXKsXOX4CMDKnJDvf7nu5q8VMFbUEcw6EPGXuWZTQvu+WkaXVK85ArkD866Cam
         L83F0ooliHAwLl9cI4yWP70d8Pnr7OAfok27wog5glremAzW28yJWaM90irQBTU2Dqcr
         a4XQ1Gdn1dVqThPb4xQkJZrfaOi4YWlNvGhtF+iHa2zSAwdXv3h4V2BUQ9ha0sYJvcGJ
         vXkZ2y8CXEv1aIflcitLby8bazEGalMakZ7GMPsrD70Z56XAtnxnCa7fhvQ2u8+K4NQv
         X2hg==
X-Forwarded-Encrypted: i=1; AKwUvBxdYGttlyOEpinICr57oMQQdg2jn+uMFNtI5Xqu1U4k81B74MShe6ZNvv39rbFGEooM5sTe5B88uokliBU=@vger.kernel.org
X-Gm-Message-State: AFuF++nUIZhgzvdIr+bIMnI76wXlBzYyzbgk9224lDGqIhJTOcX1qJqh
	Kcosnb/mznz9u93c1UgVgbSO3TI31zpwFAo/etUX5s5jFU652fl5BUnlPVQImy2oLNinRGD6TQU
	Njr7C+rcJI+UoWHeY7qkW706o2cuda80=
X-Gm-Gg: AYBFou0Wgd92CRBcrHmxU+5O2haGgEN4f147Beb58YsY+Vrad1wY6lIPFvvels7YSXD
	BoHbbXeezKTGzsFxwALwSLa1UH8p+g/M7RGEV6Uj4xO6xi6Za7cfE8iBa9uOCYfAGibTdDNJzWb
	ALF/mckA24dDkrEwLd8+zLGKiWMmi7Y/nNQoSmoeqkx5Lth7wrDbXG7J/0l/40NpUD52qPzhFBP
	wNM1TiK9e7HyDPmKEAtnZfO/Vd5i9+bVS+z/9Qq7SMbdZLTEU+TgbkPpmR5lzbovLqMK5h0H+i6
	JPSxz4TR0htWQaWocshA1raoSqAEWgUAvMcJR98PE/W4wWCrHZhBNqBD7UbTrWhg9jrZhqCwoyR
	1+a4j6oseMXuOsMN439bYWUWPNUvxZUeTT/StH2g6QnQ943IRYiiB8ngWf0x9
X-Received: by 2002:a17:90b:4486:b0:398:cee0:67dc with SMTP id
 98e67ed59e1d1-39aee22219amr330724a91.5.1788304760234; Tue, 01 Sep 2026
 16:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-cv-v2-0-446bc69d2ade@nvidia.com> <20260901-cv-v2-1-446bc69d2ade@nvidia.com>
 <a796c716-4db0-4bd4-b69a-accfe0d382d5@nvidia.com>
In-Reply-To: <a796c716-4db0-4bd4-b69a-accfe0d382d5@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Sep 2026 01:19:07 +0200
X-Gm-Features: AcwNN1XNkEF1AhN8yU_Q6na6OP_zes3C1-Rjq21wcY7gsKXPtUmdPm79OvrMDS0
Message-ID: <CANiq72=k3O03vh+2EbTamAZHOZebOZ1-X8=qiyHWX+YhGsocfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: num: add cv! macro to create values from
 constant expressions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:19=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Remarkable, in the sense that it seems like an oversight at the Rust
> language level.
>
> Alex, Miguel, is this worth mentioning at Kangrejos?

Yeah, it wouldn't hurt to discuss it if we have time, since we will
want an improvement here one way or another.

I raised it to upstream Rust in our last meeting last week (we also
discussed integer casts), i.e. they are aware and they agree some of
this can definitely be improved. It is of course not a new thing for
them, e.g. this issue:

  https://github.com/rust-lang/rust/issues/69329

I also have it in our usual lists ("Better `NonZero` ergonomics
(`f(1)` integer literal coercion, `1nz` literals or other
solutions)"):

  https://github.com/Rust-for-Linux/linux/issues/354

I hope that helps!

Cheers,
Miguel
