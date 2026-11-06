Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975713;
	b=bTFJEQqATnXx7OvsyMAojAoeLtJ37KoOz5qT17AAbYt5183MXSx8fCRACvgFm1mPPczD
	 J0jXpSRPUg7v4G+qn1pdGFdUYdhnGaFgdtJiPlqm8q/LqpexOfxw77JfjlxFpR9BZcqHq
	 e/b7KnqvCYUevnI9lCzw7FkcFzdCQMNq6EOCYeGFUqA1zZm5uQzbzH9Sfdt/j4ua13SUu
	 jXiXrxUR8y9VyM9Y+DXndT1gIak2iRIPNpTmoPQ+cNn5qdG6HaQIaqUPNNnbkC4h9ZZ2h
	 J2whL6nqnUxCJJ7gPYYDXC1ds8PWhBzhhZZ0ExU0x0Ae8l7oTT8YqhU3YRHL81myIfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975713;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ABFV9qqW5v9B/veTK1qFSxVFzw8UX9r8phfo5f88bHM=;
	b=moxlGTxVkrXJuNNZwG6Ye/bnKN1VMiQGjy1Pkr4IRHYDLMbQ+Eri90cD+bTKP0Od5UgR
	 KDiGN1XhllfJY3rMSoznesbkZMnGLjOdnF7DVMfafkx7i2xHCxJdnZeyjJqy771xHCFpN
	 rzr2VQdItlqAbGLxXmPRl+YJVLjj3KEY3+O8zh88Yq+rDInkPkFMaxbL7KPBXyeKWON4l
	 ArguVXX4a2BwPU9C49/KcUoczp5rZTy5aAtc1S4z+5JVyVoreqTocpfRK2zLUPZQDRzC7
	 RBOzZzQNzFlpubIXq/SioxfC/O+V4lw8bKUXTowR48TDclc5KPDEnJbiI5x9f1xDo1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NW+CiO38;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96936606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NW+CiO38
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3481F008A3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975712;
	bh=ABFV9qqW5v9B/veTK1qFSxVFzw8UX9r8phfo5f88bHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NW+CiO38XAipmRfvZb5pGzPtdB2zoSkBFY3QqVyfdPAFpM6fBH+ps3C/WRq7ZfzE2
	 o7WUwzmqQQ3PkE3gvMRfgOCP9XzXNGtg12V8S2fi5UZdZmB4q3mp8G+xTIwOtPAtXN
	 3uNZAFMQ5hm//mnLWi8wTsZWz9GGPkHPOFoVPJnbpwCohuzkA8Xk3qgp15B/Qd4kC/
	 XXTNMv1YKeN4P6VHCjS/J2rMGpKFjXdtYP8tYgnawdShP5GHiBIrTMXGFyBBhzj8Df
	 6SsOM4/1dFVK9LCCm2l2qkHcdnKYWKMJ3f1ACFpTO2jqaReJZQlahdWNR0bptLYcEb
	 BhkFz9AHmxvVw==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so706560a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:35:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG+uwWX1FiEvUu2Kid11KHrLhEDAw9MA9tUmu9gMoWQtvR9151VaUfHXKGlYiT+DmVOFdXl6XYqPdSr/xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VljHqg3yu4Re9AwwyzewFDuXjSQWXicCa1DapvOhS4HPRYYWk
	Wp7lNaxoaLjoAwB0GR8OTxP6aKR6ihNAg+LyFL8ZO0WBEJcQRnQvpz44oqGEE4PwK6lWJQkp1xj
	Jon9b6+s5UliqWS0aEt7eRTO6Ho7thHY=
X-Received: by 2002:a05:6402:1e94:b0:6b6:edd7:7928 with SMTP id
 4fb4d7f45d1cf-6b6edd7899emr802991a12.26.1793975711577; Fri, 06 Nov 2026
 06:35:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029172956.20791-1-dongtai.guo@linux.dev> <20261029172956.20791-6-dongtai.guo@linux.dev>
 <aux9Hm0QFJLUDPWv@kernel.org> <CAAhV-H7Dsnz03iXChzE6nYM2cs+D6fdDFiWrDxX5jM13kYL6HA@mail.gmail.com>
 <auypq8_7T-vml5_B@kernel.org>
In-Reply-To: <auypq8_7T-vml5_B@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 6 Nov 2026 22:35:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6aO_QNEzV-r6+FbNa=9EUQgv1vH0ET-ETXAH5x6oQGjA@mail.gmail.com>
X-Gm-Features: AclHuK9KCIrf61pzsewLNfcg32ftrSETM4BdWXL6OTYNNDPn4F3U0UamXyiZ-QM
Message-ID: <CAAhV-H6aO_QNEzV-r6+FbNa=9EUQgv1vH0ET-ETXAH5x6oQGjA@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] LoongArch: Allow memblock arrays to resize
To: Mike Rapoport <rppt@kernel.org>
Cc: George Guo <dongtai.guo@linux.dev>, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ardb@kernel.org, shuah@kernel.org, ilias.apalodimas@linaro.org, 
	akpm@linux-foundation.org, baoquan.he@linux.dev, ruirui.yang@linux.dev, 
	guodongtai@kylinos.cn, kernel@xen0n.name, graf@amazon.com, 
	liukexin@kylinos.cn, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:07=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, Nov 05, 2026 at 11:07:01PM +0800, Huacai Chen wrote:
> > Hi, Mike,
> >
> > On Thu, Nov 5, 2026 at 8:57=E2=80=AFPM Mike Rapoport <rppt@kernel.org> =
wrote:
> > >
> > > On Fri, Oct 30, 2026 at 02:29:52AM +0900, George Guo wrote:
> > > > From: George Guo <guodongtai@kylinos.cn>
> > > >
> > > > LoongArch never calls memblock_allow_resize(), so the reserved regi=
on
> > > > array cannot grow beyond INIT_MEMBLOCK_RESERVED_REGIONS entries
> > > > (INIT_MEMBLOCK_REGIONS + NR_CPUS).
> > >
> > > This might be something to fix independent of KHO.
> > >
> > > Huacai,
> > >
> > > What's the reason LoongArch never enables memblock resizing and why i=
t
> > > defines INIT_MEMBLOCK_RESERVED_REGIONS to include NR_CPUS?
> > At first we didn't define INIT_MEMBLOCK_RESERVED_REGIONS, then we got
> > boot failures on a 128-cores machine, so define it, and the value is
> > similar to arm64.
>
> AFAIR, arm64 had to reserve some per cpu data before they could enable
> memblock resizing, so they had to make it static.
LoongArch is similar, so below 64-cores machine has no problem.

>
> > The reason LoongArch never enables memblock resizing is because the mm
> > code is derived from MIPS, and MIPS never enables it.
>
> If that's the only reason, you might want to revisit that :)
Yes, it seems we need memblock_allow_resize(), but maybe it is better
to bring back paging_init()? Most other archs call
memblock_allow_resize() in paging_init().

Huacai

>
> > Huacai
> >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
>
> --
> Sincerely yours,
> Mike.
