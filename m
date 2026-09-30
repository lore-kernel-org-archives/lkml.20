Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F9344D99
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802023; cv=none; b=Hd3A2Ngz/nZRUnCUJc3Ja731C7dEF0p1MlpAhK4Os78ZQ/GzXpc5z+2RjkqW0M/4U+RVVDlwrN1RClpZqlmuuh6mdO/EvpXoK2rYJXTwI91np/+gZZuLWK9wZz4U0Zms80od75BqemqTHFGfG4XUHuz5g+KKIqvz88rNqVZatnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802023; c=relaxed/simple;
	bh=K+xd8PsGh7vgGlDpxABMwFI7ScYfqAlOP+8fqZEkAUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrI0sYeBze16IhfyD6tsGcJ29Wxp2LCzkSUS+ai7h6/GX8NWTT+gfc0/ezA2ivRGMkF6JXyoR0j0HNp6frne8MqZzlFreA0qisb/TorVC8oetVYrqAvvgRpe+GV0v0tueCPaMJdxj7oVv+Lm5ED6KJMW/L6pXchhojY4eOkjZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrmGMKEw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrmGMKEw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029FD1F0089D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802022;
	bh=K+xd8PsGh7vgGlDpxABMwFI7ScYfqAlOP+8fqZEkAUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZrmGMKEwAFYFJ6Bzh4Vz8fnUoOv9JiyZJzqwp1fnYiYNSdXlLw/WhqketgUM8tv47
	 i5lMQjDAGk2/9iO1S4YziDHqiSqbgaJ6J/yeT/XP5A8j7FlKonf6tHudvIKnjIHjcL
	 zpemFUrwSUpe+L0CVBhFEh3W5ychpk9B1YddxaYtxC+QHVaAFjKJx8HxHa6lbqFsjj
	 6raaekgmOL6EMHN1F6nBicH6NaM8G+ZtcZzT8AU1YCpGlDeapOsbYnmV/fXLdCXztM
	 0BnZukWtxpaPqpgi20H/bksWTQyKflIW/uaL3KJDbpiiY/PpCpYkeYuMMi3mGPWxbo
	 XYKqZyj2OqWXw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso5156310e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:00:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByCR2CATko684jLXw70yqRUiiy83eucL7jhrsqb8Aw7HEOma7VAjz4tpnFOTxXWSufQnWgKWBgR4TshkLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn4N0Df3ksAdxmxtklnJUQk3CO/LZOzFl6euPiEowptmwZlCbm
	UpI998UqsV5kI1X6YFOjWg8YPfXQaUkqy22Yuv9wrqutzlSoox/L9zioEULFgiLAqfkEyIF8xbZ
	d67AmaR7NxlTqung9m39LjTo/y6mQLkg=
X-Received: by 2002:a05:6512:3986:b0:5b8:c160:e3ca with SMTP id
 2adb3069b0e04-5ba405e1793mr1109566e87.13.1790802020776; Wed, 30 Sep 2026
 14:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-10-will@kernel.org>
In-Reply-To: <20260918161407.2300-10-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:00:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLnwaOcUgkc0hg1237w4HZ3pW5ejvWq_77GgDqKn07K4nw@mail.gmail.com>
X-Gm-Features: AclHuK-hEnRRhnMkXgdY-FOaLdv1L_6t2b0wI082mHofCadQfsZ8d0A6HHRhNBY
Message-ID: <CAD++jLnwaOcUgkc0hg1237w4HZ3pW5ejvWq_77GgDqKn07K4nw@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] arm64: stackprotector: Re-enable per-task stackprotector
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

> Now that 'current' resides in TPIDRRO_EL0, update the per-task
> stackprotector compiler invocation to use the new register.
>
> Note that this requires a very recent build of clang [1], as (unlike
> GCC), it historically rejected all registers other than SP_EL0.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Link: https://github.com/llvm/llvm-project/pull/188054 [1]
> Signed-off-by: Will Deacon <will@kernel.org>

I get why you need to do this now.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
