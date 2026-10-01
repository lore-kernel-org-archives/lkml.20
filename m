Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F702457E70
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843920; cv=none; b=u/cP5Z4QXlkvVTyMoGUbHJDfC+htnrBkAjZe+nR1KRkyzcmHYXlkexEbEXt0GysL66+cDq4v0qsGrDYAWf21VzUwgmpDO6tXBJAWpVjdpNwnPxxXPXDCqWEHVRXHR1hWQOTAY9Zji++89pGFshPR42ULYyZazASNBX7cZINcei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843920; c=relaxed/simple;
	bh=is/ngq975mUjUBzTdIqiNV/aCl6skLZgP+5C7ZZcfo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJCt5xto/xRLUEGfH6aFKTsNmJ8jx6Xwp8E5IZn+lPaF33lLmyhLKAEUxJ1pyCzzvM3DnArRugzgjo4W5pR8G9P+6z41NQZHBMcw71Wyn+jgN50Gu87nV/dm+ctcRfnwlzNHk76FmuszN2RTvWYlTvnZEuf0mNAek35UuoxU5JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXx/PLNR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXx/PLNR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79ED1F0089C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843918;
	bh=is/ngq975mUjUBzTdIqiNV/aCl6skLZgP+5C7ZZcfo4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DXx/PLNR9NqnLC//mCAWY7SvbPVzN9mfq49qG89mVN0TfrXV0kuS9EyELgzXqMYAh
	 Uk8cbxTo5s1FgIPUFJa+JoN7BZ3NvCv308v7z+01wFzBOAB/uNWnJ3SbjxwaCc1Ld1
	 A1fgmFU6fm3tFtrCbgp8RkvPoAK1F8Ce/VL8JbL16bAi8ANRemcKTL2IDSKp/a6qN+
	 l1I88K2Q0eUhehJYOnWqMwDtESK6CC0B/U2TCf5E6PPxS9gIAXID1RfG3QIyLEe8mU
	 5FVpXaIALhbXY9prgI7QkNwFJ2SJXsJeV9bAP6n96OXi/S4HWrj254KUxw4LdKbxH5
	 stKAyn+TJm9YA==
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6de6b4c50f3so130154eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:38:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxd48TCZtii5uiSrnwxnC8p8SylCcrckIxpcXEGIumZPBAdDgozVKgQ3L8r4JSVkGxePKkzvlH1NgRVPhw=@vger.kernel.org
X-Gm-Message-State: AFuF++kdVsKl1FSMdp4XZH2tMXhvCn+T1knxOyWyEtU7g2mZphRVrz48
	3Cx7ntzqPGHzdkAfkZx21HVZXvjFaIdlh3WzazaeZRFNw5ZPIVMmhU2en+yIxp5LIihx/FTdpL4
	fAbFUEXp8VthEW+e9jH/UicHb+vjN7n0=
X-Received: by 2002:a05:6820:1806:b0:6d9:bad0:8374 with SMTP id
 006d021491bc7-6dcf1fa428amr3428672eaf.10.1790843918052; Thu, 01 Oct 2026
 01:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-20-will@kernel.org>
 <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com> <ar4LWGJ_qfV71_Ia@willie-the-truck>
In-Reply-To: <ar4LWGJ_qfV71_Ia@willie-the-truck>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:38:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>
X-Gm-Features: AclHuK9bZYHoY_AXjKZDaH1MPRes_W7KUtKQxFuh8xG-8gqtKY6GBTng2OBvj8Q
Message-ID: <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>
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

On Thu, Oct 1, 2026 at 9:27=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
> On Wed, Sep 30, 2026 at 11:36:35PM +0200, Linus Walleij wrote:
> > On Fri, Sep 18, 2026 at 6:15=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> >
> > > With the kernel stack pointer in SP_EL1 and the overflow stack pointe=
r
> > > in SP_EL0, it is now straightforward to switch between the two on
> > > exception entry from EL1 by writing to SPSel. However, since exceptio=
n
> > > entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> > > repurposing the overflow stack as a more general kernel exception sta=
ck
> > > would require writing to SPSel on every exception entry from the kern=
el.
> > >
> > > Switch things around so that the overflow stack resides in SP_EL1, wi=
th
> > > the kernel stack residing in SP_EL0.
> > >
> > > Signed-off-by: Will Deacon <will@kernel.org>
> >
> > This patch gives me panic, and as can be seen from the review
> > comments need some love...
>
> Please can you share the panic message? I'll definitely be reworking
> this based on the review comments, but if there's a bug it would be
> great to see the details now!

Haha. I was not referring to the kernel function but the emotion ;D

Yours,
Linus Walleij
