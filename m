Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783180;
	b=nfJHfU4hCn99Qdw+2OvELE/MD2FWusg13sZqVU7thPbWY5u0peUs8sCg8dwrVB5IYf09
	 yIToiX70rAs5e92K6XiiEAGoAHdiABmNp062slCV5WlIVba7E3vijpWybku+WeLfI5hDg
	 +4y/iX1ccaqKdIOQJ09aNoaNTx8O9njiIhYzLvkcOJbEReSqsnXwb9uEbNb202kQsKvyZ
	 u0e6x6W+BTO/RJLxVxYljZMLj4pxD1pU+JfD/N4sJEjhYOiqU4x36JUpxqm5YRsOI7q1m
	 e/LxRunrXfWZB82TwEg+ncmhAtNl3Ex5TumbuqTVlWKaFji0GMl3DnUaAObWkNj4vTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783180;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=TL+lpd9Tre0F9K5FTT6m3e9RtyKI/GiJUyTb5HPC2e0=;
	b=wMTBG61MO/tVs2UbbNw5X0d9ouYm93w59PUzz/aLWRK3sx9Ub2b8/m/jRlPPLQd/CkTO
	 GaWMrZ02qwrQHGAeSi/CLEVTAff3lMy5bIeC90Zylen3sLFu0mrFVRndYgWdoKSiDWDGx
	 q7OQgIl589j7iIeXyGpYC26b2T1L6uo8VnXH8lGnx38Mc6tf7AeY/9IHQps7FU0VAY2vF
	 ltsugSX7IxrKHnuoLWuOq+bhRwZoth51wdPCJC8z9ESgEdpfuM/aeed6tvF+Aepzd1DbX
	 sjwCeqdIy6rpMvtjty0j7LhK7XPN00N/pj0z9avztN1VmUyQdcXOEKKz39+hN+/8ODQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAf+r0nM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF8606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAf+r0nM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3541B1F000C1;
	Wed,  4 Nov 2026 09:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783179;
	bh=TL+lpd9Tre0F9K5FTT6m3e9RtyKI/GiJUyTb5HPC2e0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=OAf+r0nM6knPaZzy7i2l3S9Ulid2btsFBPVL8zJPf7pnpRT+28IU4WRY1oYuVtr20
	 i3pNFR3qpETwc1PaZ4bOwR1qkPW0GVhv+WjybdrfswfTqiMG7lB2zIb7AJAODK7/SK
	 ySKZNzlnuyGX8U9HxctuHaayT42ZfDp/RP1gMEZIVJWnV6ozDZB15x6xaCMqOmrO6E
	 yeJi7aMgq6pPaRL9xwqPLTg1vgiW0arxmbX+uihXXKOSHEvMU+XmmDTvj1XYQ/83Ud
	 zkac7NnUuLafRdhCzNqytng+JNdgo0qOrNJzmZY0ZN1aE+Y2CcFWTWa7pZmprOwWHY
	 jm+rT6f4Zu8Lg==
Date: Wed, 4 Nov 2026 02:06:03 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Michael Ellerman <mpe@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: Disable COMPAT_BRK
In-Reply-To: <20261029-compat-brk-v1-1-5b2cf86eb453@kernel.org>
Message-ID: <0b81d999-2aa1-83e3-6dce-e419ec5f55ac@kernel.org>
References: <20261029-compat-brk-v1-1-5b2cf86eb453@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Oct 2026, Michael Ellerman wrote:

> COMPAT_BRK defaults to y, which disables brk (heap) randomisation by
> default (ie. randomize_va_space=1 by default) for compatibility with
> "ancient" binaries, in particular libc5 based binaries.
> 
> libc5 predates RISC-V, so there can't be any libc5 binaries for RISC-V.
> 
> COMPAT_BRK was introduced in 2008, commit 32a932332c8b
> ("brk randomization: introduce CONFIG_COMPAT_BRK"). But even then the
> only non-libc5 binaries mentioned as being broken were ~5 year old
> versions of emacs (see commit c1d171a00294 ("x86: randomize brk")).
> 
> Distro kernels for riscv64 also disable it, including Debian, Fedora,
> openSUSE and Ubuntu. So even if there were riscv binaries out there
> that rely on it, no mainstream distro would support them.
> 
> Most other architectures already disable COMPAT_BRK in their primary
> defconfigs, including arm64, x86_64, powerpc, s390, loongarch and
> sparc64, as do the riscv nommu defconfigs. It is also disabled in
> kernel/configs/hardening.config.
> 
> So disable COMPAT_BRK in the riscv defconfig so that brk is randomised
> by default, matching distro and other arch configs.
> 
> Signed-off-by: Michael Ellerman <mpe@kernel.org>

Thanks, queued for v7.4-rc.


- Paul
