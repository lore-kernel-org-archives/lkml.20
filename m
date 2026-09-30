Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A04CE681
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804210; cv=none; b=eYF6iV6dkXdgfainn1R6l41FwFO65eya5gXyXJIk3D9ksnw/ICbOJPeuxohY/zWkoiD2XkwkpWWWVpkD7/DaKCrBCQmmisbZhE/FwekLDGF+KfpDbx5zoYdHF0LNR8sqSFWBfqnMWT+TP8tWLjZKe3I5fklx/w5fVzw7eXM3bTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804210; c=relaxed/simple;
	bh=PSD0JDbSe65kbMBHP4WI7zokG3zTVf+6YgzPX1qNXS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFdYIeySFpAhK128BVsN9158N7v3eqZaIgOWd5tO9J9SggxmeIbe/uSL4pmH67er2+bW3p3g/9vFuAFTehY9au0+2aRLoOV9CWfdUPJuxwfgUtHASyNppKu/eSasaUiO88bpXBRNM5JIHO6gaz/+OqtUWsE8eK/cemL3dAZ8a34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBrjeaei; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBrjeaei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A521F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804209;
	bh=PSD0JDbSe65kbMBHP4WI7zokG3zTVf+6YgzPX1qNXS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iBrjeaei2MWVVb7CKMMdB2JCZNq25FyXEAiT7Jb/BYoqSRaFx3LLe+8LiUJ2PPhIx
	 /Xw65DRGUcGLptw5RaF7pR3ViZJ6UB8Y+CcHxgQB/VeWXrGOsxkMkiLOwL97hF/Hil
	 ke3zdgc5zc6U9gYGXZRD3H4o+k09Jl61bgNChy6I9PbzK5orQxEXwMUhOOfIO9gp69
	 GUdwv7INlw9lAGN66K925EBds6B+r56kTrM/YLrLeZHJjTbHkaeH/0K/LMhBeY7Cn7
	 UPcyubQ1ccOxoO14U+bSgh0qKSFeefT1pgER3TuZ2IP4kltVJ/sXgl5+rHVwdt5K/g
	 O5XpzqLNUTJTQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d84150dso1166324e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:36:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxMXDRUnGeFC9YmRv/WxrB43HfSJMcQSLPjw6a0Jd/AkPfeWGy6Y5MnDXE5KhAJeuFwtafo6ONKI/ELSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFWZd42uU1gYoTjR3rlje7xQ69m4pCjlPtC7p1Zgg3q6yHEUG/
	D5IBcogUD6hY6S3CpxFoBNFDKCwyAxxU+JN7BScZDi/Twa8IylYVBIo0u2jP6UlimlVgCClrqaa
	0jJp2NQin+OsHrxpmo77igjojDlPGQfs=
X-Received: by 2002:a05:6512:a95:b0:5b8:99b1:fa26 with SMTP id
 2adb3069b0e04-5ba405da0f1mr993519e87.30.1790804207753; Wed, 30 Sep 2026
 14:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-20-will@kernel.org>
In-Reply-To: <20260918161407.2300-20-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:36:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
X-Gm-Features: AclHuK95Ga1PONm8R6FdZOOAiA_epDhcCasI5XpLPF99hoZQWlEpKbpbSmAWYJs
Message-ID: <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] arm64: entry: The great stack switcheroo
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:15=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> With the kernel stack pointer in SP_EL1 and the overflow stack pointer
> in SP_EL0, it is now straightforward to switch between the two on
> exception entry from EL1 by writing to SPSel. However, since exception
> entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> repurposing the overflow stack as a more general kernel exception stack
> would require writing to SPSel on every exception entry from the kernel.
>
> Switch things around so that the overflow stack resides in SP_EL1, with
> the kernel stack residing in SP_EL0.
>
> Signed-off-by: Will Deacon <will@kernel.org>

This patch gives me panic, and as can be seen from the review
comments need some love...

I think maybe we can merge the initial part of the patch series
first (up until the overflow stack gets worthy of its name at least)
for one kernel release and continue from there after we hashed
out that part?

That said I see no direct problem with this approach, other than
it may have side effects on some expected behaviours we cannot
foresee.

Yours,
Linus Walleij
