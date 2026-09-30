Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A9151EE0F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804586; cv=none; b=oCBl7ZFFEHFSZFTM0Qs2imlulxGJq+xLuXgQSDLzk+aufLSViW6usFcd8z0W1Y1jbuP2rmpIVoEwtaIqIFquwvjrKwWceetY2wrksikMxURDb5+TjusVlZumuoIOxTs6BF87coq0W8VvE4WdjeiUzyROddRI+8/9DjlNwpMSm3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804586; c=relaxed/simple;
	bh=fSiI3TMsEzDueDKVgqXkfgIYEvxjScP+rhYWfresjgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pD/OYtJ66NwHMzv1vtF4NvTcba1+lO5+iB617qpkiiU8QogCVUIj7cR7qk8dcW1FfD7iBfICu3QbSJylPbz6rjWJcRK/8k7CiSaS3oZ/cfNj90Ey6Ykte2oqJaduCOR25/pIp4yHrNUnVrN1rA4xJo6+e8KO+WWuBrDCgwIFtQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFHGvzW0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFHGvzW0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD8A1F008A6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804584;
	bh=kP2Hc0xVxHp38/pOSmhAb4V3iGOUVb5jZAxSa8LNMDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jFHGvzW0d5XOYcFhKadHZWWVSm7jpwI0YuWUXBX2LbXTQsdwPiqKRpWeymsacUxbJ
	 Nl55Hak93RxBiw3IXEJ9rPlTeL6H58yK0yToOzdkOWt69KyqgeBd8+hxiiuMLojQdS
	 kpFPaPCZKPQIgc8r8ymxA4jdXOjNMNKLycFX1U7INUJgy48alP5+yIcmDhxO0CVgXe
	 wJdbrOkRJPA6Sjn7D9mgsIuBWy25l7E31gEr5S0u6hAU1SZLZCcMusieCA0wY39i/q
	 kaW6DhB4SV3Nmy9ONOEH1vmjhXk2wPRJqjVz5NoBmWt1FtMDYCAxTnJVWMDCBrbQJl
	 0Zo6XnDSIkM1Q==
Received: by mail-lr2-f23.google.com with SMTP id 38308e7fff4ca-3a782bdc1dbso4033661fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:43:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6aWtme1GSTHXa4mpXoGcRcWhf2Bb8I6e1uJgUK6chtfhOCGILZyxcTdjbewECejvLYon+ZOAtEMuMxvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2DIBKqbp1POa555xp+Qze4Fqh6fHvwbwWaXv2l/Fjtc46g4sW
	4ALgtmTLqXmUuj8iT6CWoSmiVgWm+5qZx6B7zKrFre8hjpTFw25XVTtqOfNWGzyNo9bUV0x4hKR
	awCjBBEC0zw8xrr59KYDDahuM+7p6t8o=
X-Received: by 2002:a2e:b8d2:0:b0:3a5:b524:e28c with SMTP id
 38308e7fff4ca-3a7791af9a8mr9222391fa.11.1790804583296; Wed, 30 Sep 2026
 14:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org>
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:42:51 +0200
X-Gmail-Original-Message-ID: <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
X-Gm-Features: AclHuK_u2Nc1iLerOHkQ6hvbUCBpiEkacWiDJM0sMa6PBj21Y5wcS7mqWJaIpQs
Message-ID: <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] arm64: Move overflow sp into SP_EL1 and kernel
 sp into SP_EL0
To: Will Deacon <will@kernel.org>, Usama Anjum <usama.anjum@arm.com>
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

> This is version two of the kernel stack juggling patches I previously
> posted here:
>
>   https://lore.kernel.org/r/20260907164247.17223-1-will@kernel.org
>
> Changes since v1 include:
>   * Fixed suspend/resume paths to handle the stack pointers properly
>   * Fixed restoration of ptrauth keys on resume
>   * Added tags

Overall I like what I see, but can we split it in two... like first the pat=
ches
up to fixing the overflow handling using SP_EL0 and finalize that?

Hopefully Usama can test just that part and see if it has a lesser
performance impact as well.

Then we can think about the rest once that is merged and works.

Yours,
Linus Walleij
