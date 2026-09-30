Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5662D5187D4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803336; cv=none; b=rif2di+mos7bKJtqnQVg2HbnDfjAEKKZ0g/JlujBMAUAnYr/wvPzW/B07amdtHbhC+pXAHJtU4I4wRouHovl8vEDPlyEaiYEaMON2qLfHJILWoCL01BkdduaNMuEDhyaXYwIbf79+dsd+H+Pl9IIRpCoP5e9fKnY6NvD4RiH8bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803336; c=relaxed/simple;
	bh=avRL8muPwPcnKdiovtoiteXyU541AvWBfwtADejjfCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWvKWkJrD+5y0ziOlm3bPMea1PFaRCM6EqQKZxP+vbvrp2awfySysFff6mqFCMVwljvfbqqhUN+2dqdwx6VvppcF3tcuGQRYB8d8VmN6fbzc5H8Xdf6gREQSJBadDIAC8SBbCn3o8W7QH780/YVNYDVJKo3mFvoSXP5a6w4FG7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVGLNdd+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVGLNdd+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5F81F0089C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790803334;
	bh=avRL8muPwPcnKdiovtoiteXyU541AvWBfwtADejjfCQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lVGLNdd+b5Kr6s9mbR1iacX0iWpM528nSsKpynudQJHfM8DIWv2C+smngas7pjonG
	 8NdORv9MtE8kV+f9svJ7rUtL44v+HVohXyO34CuQd6LGqtoEvGmMPAcSqUbyCTgnCy
	 f47bmV0g+/PYuog8mOF2GZ3lY/c6O+cNbt6t/PPUy4ssXpS4m2VXhEL07Ze019eyxP
	 EBGgD4vjw4+A7LOYVWd2ZoRUfkY/aRnF8OKeun+W3rpy58hYi+N8BWETUfWi6WM4x5
	 I0cXNgHu4A4sGx4wG0v21vxsSpH0Pd5X2Emak1DSnLUw79ELe7KnfnQU+xo2100rPO
	 44J/q/GFlrxhg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3b8a5187so1429781e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:22:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxnKGp+lKkCG3gq3vYTdheyDcJEjbTdoXs+M0axSkQKHxsamyNNMGxgy40kOatmhMbm2aVdNXfciYFCd+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8ScajpCeLG0NL7QLGl0Q/pKwX82vXMCGa1WEErs5MySXvBzMZ
	hCELyW/F4S44q060gQ7QPnRpZriiz6/DumtiD2UBb641zDHXI/8XR5p1+dS6GBjYa4AFNgoleg7
	u1NVmX6U2NWHmqkUGKAMprPuJ9fq+foE=
X-Received: by 2002:ac2:4288:0:b0:5b8:f1d8:7ce4 with SMTP id
 2adb3069b0e04-5ba405e1ac8mr876871e87.12.1790803333659; Wed, 30 Sep 2026
 14:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-18-will@kernel.org>
In-Reply-To: <20260918161407.2300-18-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:22:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLm0BqTSj2xwvYuL_GFp7S3VxZoHpwNR1-vT11mhwKnmhg@mail.gmail.com>
X-Gm-Features: AclHuK-CNJaY6-3qfpXmoVmqu6T0qCnAPQ3R77dU3kQboZXPH_Uf0-1tyE8bREY
Message-ID: <CAD++jLm0BqTSj2xwvYuL_GFp7S3VxZoHpwNR1-vT11mhwKnmhg@mail.gmail.com>
Subject: Re: [PATCH v2 17/21] arm64: entry: Use SPSel to switch to overflow stack
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

> When detecting a stack overflow on exception entry from EL1, use SPSel
> to switch to the overflow stack without corrupting any GPRs. Not only is
> this simpler than the previous logic, but it also opens the door to
> more complicated overflow checks (for example, based on per-task stack
> sizes or stacks which are not aligned to a specific page order) as well
> as the possibility of returning from a stack fault if we were able to
> resolve it.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

I really like what I see here. The change up to this point
stands alone as a serious stability improvement because you are
not deleting code that made me feel very icky when I was reading
it. Before this patch it was pretty much an
"overflow and crash gracefully" stack, not an overflow stack.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
