Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0F2374745
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854532; cv=none; b=He0CWxPGWdCsFa666P8/9ocacMkjuOmnKFFf9EIzB7iAj4aiOV3Q0wPdufdMbmirhRmlp/qba/Ckb61JsLMpdgKodwmNGJw5OtP0RQ/Y0eSXqSiB/NLgPIdgv+AxbHX4D9D7ib1X42sFp5pHu7GwfQu31DoEKKj/VcxcYen8xIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854532; c=relaxed/simple;
	bh=lmVFF1nXCXJO244kYT0wDxxDBN+y/dJyhYK3aGkTJlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G94LUpeIKK1sTu3UBS8BUXp9lvmwULcbA7SdexRzr1RzcA9WII7VnjAjHh3oUWa2snYsuEBqUvJs5qHmxnpPV5BkZgQVwXeXVWJjiNft1jUu7jS8iMUq9QoxZyz2Oh5hb9XmWjZ4xpyZDZZRTC2GOuIODMdUIjs9CCTC3IKS4RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwXMABLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwXMABLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59311F0089D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854529;
	bh=lmVFF1nXCXJO244kYT0wDxxDBN+y/dJyhYK3aGkTJlY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jwXMABLGDse/lPscqO8TloE6bDUdUuDr0fKdSPAdYGQKZ+tXWPZQ97pjoHNbXokTX
	 86n3XtKkEXGx2oAJ/hhsn97FYrqQ+t/thnaTN8GgBbIxY7hd9UBeo1dYsQVn+6brP3
	 uyCLaIKVdrhkS3fNOLseME8si8m+JGSZx0Nql5Rq+JPiLMOXTneIWshUuu4xXLHD2T
	 Bbx7S0RgRnW2iY0rBMUucUZip1Mwt+3dr5o/BQecBrnYhguAhFj5GxzlIVXyAsODn2
	 fw6d93oNQiPPtl8IzcXpvcnydx1c+Yxtv8fkgsAPpyrf/abIvFgpoRIS0CcQlEtZ0H
	 Tm+xqultb0MhQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bb6ddbb75dso314984e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:35:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy0VYJA50b8L1F+xbJh2o97f88zHxzFfr/VNo/z6jkJu2Pyx+e5J0Fae4ElAvGMAymrKajqtmfa+MRSpVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQtCuCx3YEIEZFYWqIs3UT1VBH3MwUYM9tu1e4e8MGZcdADwgK
	6/Ctclx9SXQcFpFJS+I9k8tNT3BFpHsS/HbJl5RcmF/3fWMRudJTCTsmATUn/MCOtcwbW8d63A+
	LDb5XISTYheDpk/HqMZx1iUicbGtlVSw=
X-Received: by 2002:ac2:5930:0:b0:5b8:f816:ec70 with SMTP id
 2adb3069b0e04-5ba405f57d1mr1355745e87.24.1790854528685; Thu, 01 Oct 2026
 04:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-20-will@kernel.org>
 <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
 <ar4LWGJ_qfV71_Ia@willie-the-truck> <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>
 <ar5Ex6nNxmdgzbva@willie-the-truck>
In-Reply-To: <ar5Ex6nNxmdgzbva@willie-the-truck>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 13:35:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ujWPMdXGtuq=TF8vct=fB=Lpzj+mNzX6VD1Srro2Hhg@mail.gmail.com>
X-Gm-Features: AclHuK8I67CQYv5b9ACMbbIAsFozd-dw4qbwbLd-GEz-j_rLU-8nMqq0lUW0FN4
Message-ID: <CAD++jL=ujWPMdXGtuq=TF8vct=fB=Lpzj+mNzX6VD1Srro2Hhg@mail.gmail.com>
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

On Thu, Oct 1, 2026 at 1:32=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
> On Thu, Oct 01, 2026 at 10:38:22AM +0200, Linus Walleij wrote:

> > > > This patch gives me panic, and as can be seen from the review
> > > > comments need some love...
> > >
> > > Please can you share the panic message? I'll definitely be reworking
> > > this based on the review comments, but if there's a bug it would be
> > > great to see the details now!
> >
> > Haha. I was not referring to the kernel function but the emotion ;D
>
> Oh! That kind of panic is easier to fix :) Are you going to LPC?

Sadly no. This year looks great but I'm just not in travelling
mode for the moment. But later!

Yours,
Linus Walleij
