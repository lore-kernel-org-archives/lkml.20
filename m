Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDE851B167
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801452; cv=none; b=hzSjszNuK1Hv+FIQWKwq5AQYFeSgP918aEmcAd2NdpV6vOtVxCyVSqVmfEd3zeFNZjI65MVh+GG+mRFZkHnDYbiJAIkkYXcWDRjgL2vHb+YLdIRyogEkgur9GJXxmVR1Xvzu4GIcvAWfuRL7xuIOHpJMw7mzhHV/m26iKa7xB64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801452; c=relaxed/simple;
	bh=M+/OyhH3Msg6tLgpwLBJhE4kGp7BkelrRjhrjnMBWTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjqrK/DShCN2JsvcETQDQlQYa9E5nBR5tibF6bZ7ynvmnXq789Dfh9R8pzlBBaBsnM5ABu0JN7SxlwCRax7EqDY6C4JwDMmLDBB9FKGuXKeHKlOQYyAiuLDHbDiErT/2RdXUZPPSQvaBNF2DzTBIWc2889maa7408lsLSiY3CGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZcQ2S60; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZcQ2S60"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB22E1F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801449;
	bh=M+/OyhH3Msg6tLgpwLBJhE4kGp7BkelrRjhrjnMBWTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EZcQ2S60TURDf6RFzJiWhjm+o8/pmGx8wukMMT1q4m3AHbpqyJ3kMHVS96VN6+gff
	 18fNggtgil4NYvRcbOSQviZraYzceFnV6sl5gLCSmaLuDwBUH/sHemD2dTPF1zRy/I
	 ckHufBDhqtRt/Kt/56GL0AVJC4Yn5Jw6b8b9AsSKVJnqp+ZC/DmVSf4jqfcw57cUE6
	 HWV+l2ZztouEzfqiUzYrvr99snV/FLahPucf1N2LrvLDx8Mfvu+m+Zbb2eGdyv747b
	 OEIvbdF72Qu1SGqLVw21QS+NmoJ4LVHKQiXUxAljHVMUfD7Go99NykZnQgqgenXcmM
	 y86tL3LQlcr3A==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3fc22439so934532e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:50:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx16LQwnXIjVnHO82PXAX7tzZuZJV061CRQC9XA6ddITZq+pYqb+cygq8bQE5j4RWp3VYP8YLJ7QBeoVLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKICl2aSZDX1mrOnMo3OvumTB0Ml3VidlWnEWVypCKGfpHSIxqH
	AwaUFtvYMc328Bl04Yg1FGC1UoS4KL6ZamCQnwtlSWapRgEgbUC/r/jPfM52q9fpN2dDu2pZkpq
	xmOVGOtGbkowP55FQG8R/N+tBqnObfUI=
X-Received: by 2002:a05:6512:3195:b0:5b8:f494:da93 with SMTP id
 2adb3069b0e04-5ba405d9c1cmr1310761e87.33.1790801447761; Wed, 30 Sep 2026
 13:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-3-will@kernel.org>
In-Reply-To: <20260918161407.2300-3-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:50:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLkyS-ZOkpEXeEDzhfe7t4sn8NbzEeNO4a8WKsk_OfRLmQ@mail.gmail.com>
X-Gm-Features: AclHuK9k9Dqon_4_7OCW1CMCtBrEiAX2BH_LGhxILnxAEFTHu__0YdC-t83XsPc
Message-ID: <CAD++jLkyS-ZOkpEXeEDzhfe7t4sn8NbzEeNO4a8WKsk_OfRLmQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] arm64: entry: Only check for stack overflow on
 exceptions from EL1
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

> Checking for kernel stack overflow on entry from EL0 is largely
> pointless and gets in the way of using SPSel to switch to the overflow
> stack. If the kernel stack overflows on entry from userspace, that
> implies that it was unbalanced on the last exception return which means
> we can't sensibly reason about the state of the system given that we
> could've returned to an arbitrary virtual address in an arbitrary mode.
>
> Remove the stack overflow check from the EL0 exception entry path.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

I agree with this reasoning, and it confirms my own understanding
of the futility of checking this at entry from EL0.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
