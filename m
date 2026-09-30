Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2C841D11E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801926; cv=none; b=oAId605lxcyg3E49QCK1MlfHHnzLVX4vHA79BaSzLORxx/CfXf33AhSkzMOsOI8XxYm3hnAF4NbZc93hsRBjN/69p+anu3NXDacugX8Z2A1HkzpXMxrtmkgeIVIEwrQkpbvr+eJuJY5hclG4Nhh2EVMbzlIXNOAvj8QyPaK2hwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801926; c=relaxed/simple;
	bh=zvfMbb9HmTo7d5CJi/mcWfE1VYq/wzSgaTHxLgl0XGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUghsAX9Fle5JVmMq/AygFeDSURIgbqwEAl3FQxdj00U2Ugwemdn79fipx2Q7ab2qGUMY+4lqQJ5KlRDaWHMHWVvYT4wfJi2yMHcYLeDQEwimh0xdg0waE+1QUfCuPy50j4N/Ha0buUmJI9NVyqcEA9OnLtmtWUhK6LugLLwLRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjnNmnfJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjnNmnfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95491F008A0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801924;
	bh=zvfMbb9HmTo7d5CJi/mcWfE1VYq/wzSgaTHxLgl0XGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mjnNmnfJDxMia94Ym9Y0Y9IT6+Dy44UzIbaFSjXTWLp8uy3Vk5iYTvsjw8PcJMAn8
	 B8UIBgcxsyd4XdTVxGXrC/CTr+/dyqqrKS2GTTGsSzWrepNIxZebLcfUMYTmbJ+2LO
	 8OW17jn02oPcCMSPyQ2UBdyxaDYSbTcu68O9l6jtoElpbiQ2E+8782yF14b0xIzA3C
	 Y9jvjI/vrFVEuAx1auM9R92QXeUmM+cKfnF8EviyaJ2Nir54155plB7qTDLVCn83fO
	 bPGK39TcwihrYPIHWPeXOKJSYWQPx7XihWGwL7hmNnH7i7fpKdgyoJY6CkEWqIVLIa
	 i/SUZxEtQqSeQ==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a770b3ee1aso14655571fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:58:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDzvYAA8faev4Tqa85QYWXF7e0VK93m2fE7dZidrkB6zbKu7tmG4s24pmf9yHAftE9JoK1mKSFankSLWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCuH0rddfh0MH87hZ5pdMkJkfBS5qLzhT00xLYej/9AK/H5LTW
	+O/IjnW6niUdtB/I20PRirDw/STSyb3rrHWryWAP2+ebZliZEJnGEFMlEhUt7jk6gh9Khu7vWRd
	j4UsrnIyeghWqEpfeEqVVsmNH0WNrUtQ=
X-Received: by 2002:a05:651c:1509:b0:3a3:7682:49a1 with SMTP id
 38308e7fff4ca-3a7791fd5c0mr9557141fa.22.1790801923611; Wed, 30 Sep 2026
 13:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-7-will@kernel.org>
In-Reply-To: <20260918161407.2300-7-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:58:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkg14Hh4UNaQ+YiDr8-YOMp4ZvJekmpbh+vuhvgJ3heDQ@mail.gmail.com>
X-Gm-Features: AclHuK98rPoIJqzJs5n2eB6XOsyKo5-x6dITjL61dug9hHhjlZw3JiSQOV2iY_4
Message-ID: <CAD++jLkg14Hh4UNaQ+YiDr8-YOMp4ZvJekmpbh+vuhvgJ3heDQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/21] arm64: Store 'current' in TPIDRRO_EL0 instead of SP_EL0
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> To make SP_EL0 available to point at the per-cpu kernel overflow stack,
> we must relocate 'current' elsewhere. With TPIDRRO_EL0 now restored late
> in the return-to-user path, we can otherwise use it to hold 'current'
> and update the various accessors accordingly.
>
> Move 'current' from SP_EL0 to TPIDRRO_EL0.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

I just intuitively like this change, if for nothing else then for the
fact that SP_EL0 "stack pointer" was a bad register to use for
this and something named "thread/process ID register" (something)
is a more natural name for something that gets to contain
current.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
