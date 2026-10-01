Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F6A47B43B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889582; cv=none; b=lWevAFL630AEj/DRQySvLNgnaHis+3rgnIkEJkemBU33KamooHmGSCBs8IsRg15JpBbn8bAJHQI95ly9wELof45rbuywQkFUQuahSdtNNWcBbK+9JqflLTqEMkPReabfhoRajT1peWfplshfZ96/RbBArphLS6VIKzoA9x+ByGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889582; c=relaxed/simple;
	bh=zqK3hC9Nnu6tS6Qq7DR0DTc8nfHUCBenUfxDCC5HWfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeXmlq/KSPjznZvihC2qShFYDW77WbXKil06UuTpQfzKVzA7rTO57cKxoAMz5Oh1K51QBTE0Imzs8VtpEnM+ILJlCN8QaMiaoVI7+bxMUuCe1h3J1sqhUqMSXpI57NpakDtOTpE0oSsxxVB/U1DWo96iYlyx8VrXbWIfrMgfIqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVALaAZk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVALaAZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C115C1F0089E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889575;
	bh=zqK3hC9Nnu6tS6Qq7DR0DTc8nfHUCBenUfxDCC5HWfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nVALaAZkKoxjGuYBs7z2CLBKhcv2QN0Vh0IW4RiryfD+Xh+nqacUQUSke4pfbDws2
	 Zw9Zk3nGzgfoXXVVbtB5Bj0dhOWflrOIgR3eMM7M5nuj2H2QX+G1fUXjVP00ZrQGyJ
	 NZVMn+AkjYZVquE25YNwfUoNp+y6fRVRVPkYIaDr7dNjmSbXsclK5UcmKJvTJtn+ZH
	 Yml95f2QsRAQJSinv+/6V+H1HLmdDsI/qW0JFuEDfz4qEnPPhj2XRwO42B4bC3062C
	 gY8kayGE4toBSq9ei5cOGKue28hUnCrBnZSnqyV936KO1dfsD94kBdtDDY8ACGkIEl
	 c4X8bXKmEPP1g==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bb6ddbb75dso884322e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:19:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz84MDUKSCkPbNrFYTTB134M4tDNoWKjsrWKmJ+ta9z/xf2/ueCXDSPNHm213f+v2/ydkvZSNTtJ3QeyNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3pEnml2wfIyqM38H2cf/E+kWEpsGKeuwB72f3JJ4I09FYhtjy
	Zbw1f9ZqOAN+ki4WHVqJaUIs4kzyPzrPJmhWrAu/5BLMMnSKVRpFXlSvCGup/BKPPlMZQJwxCjl
	pJp2V9ptwVIUvYQrKxx8QQ3cbdV2oaDs=
X-Received: by 2002:a05:6512:36c2:b0:5b7:66e6:f5c2 with SMTP id
 2adb3069b0e04-5bb9bb20e7amr107379e87.31.1790889574520; Thu, 01 Oct 2026
 14:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
 <ar4KD6FTZzw2Wq6w@willie-the-truck> <15549877-85ad-49ad-b2f2-843dd506ba0a@arm.com>
In-Reply-To: <15549877-85ad-49ad-b2f2-843dd506ba0a@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 23:19:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLn7Hc3w5VitqfvVrA96kaDnOYgWKm6NfuKbjAPshcR5mA@mail.gmail.com>
X-Gm-Features: AclHuK93OXySQf9irZkdeoUGXwWmC2nbBaDFJmy0pSBCfDth3OhTplJf0dnY0fs
Message-ID: <CAD++jLn7Hc3w5VitqfvVrA96kaDnOYgWKm6NfuKbjAPshcR5mA@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] arm64: Move overflow sp into SP_EL1 and kernel
 sp into SP_EL0
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>, 
	David Hildenbrand <david@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Vladimir Murzin <vladimir.murzin@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mostafa Saleh <smostafa@google.com>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 11:01=E2=80=AFAM Muhammad Usama Anjum
<usama.anjum@arm.com> wrote:
> On 01/10/2026 8:21 am, Will Deacon wrote:
> > On Wed, Sep 30, 2026 at 11:42:51PM +0200, Linus Walleij wrote:

> >> Hopefully Usama can test just that part and see if it has a lesser
> >> performance impact as well.
> >
> > I'd like to see those numbers at various points during the series, tbh,
> > so we can rule out any stack-protector changes etc.
>
> Sure, I can trigger runs on different points if you can mention which wou=
ld be
> more valuable.

I would say comparison after applying 1 thru
- patch 12
- patch 14
- patch 18 and
- all patches

would be interesting to see. Will do you agree?

Yours,
Linus Walleij
