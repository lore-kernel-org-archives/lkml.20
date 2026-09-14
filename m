Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9AE41A79C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377027; cv=none; b=uPwVHO04mcU3dxfYfMOZF4EZtgTMUgw0CBm2xvaG6FRkf2Ct1LUalL6BYOtfNYfVkECacAPAAwwcazuFgp849tGP3ojrvO4iWvQXi2jGWKd0q43Sj1dzbxom0M4D0/BbGl/E9ctrc7xrB7rA+McNkmWg1+5sDt1rpUKnF3KnEQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377027; c=relaxed/simple;
	bh=HiF6kaoY0vmI5yZ0jUaC6VsOtStEetN5jUYUzI7+c/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3PFk047QMwASIBwGWlnKTfckhE88euV6PjSugwFTguSRjv14Re7E6FWg19ZJrmfL8A+851nUoCWqO2rsvfkinKBgOeV2KFQHyo+xQaor2bGVzWm1htoDmBaVg0wzhOKR/1K3R3/LLdqN7LN/RURXJbXVt8ws0m4vb1eLjeVGDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Md4rnTmK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Md4rnTmK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5001F0089D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377025;
	bh=eM8Qgu6NYAz2KlTImTDOnkezDzsEl+drhOjvzifcCQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Md4rnTmKu+8ZHcpPlO1k029rTa7aHBYDxtFakKljBYWfvc0s6Rg2C1Y+nZ1AtwVQg
	 BDmUAalaph70nl+ULxhmI6rZvjHpJmeuDOdLK1Tgy/0o9JNhg27B6yzv3uu6HcsVr1
	 z5pEBOYA85TPfIvDk9g5j8fa5xm7i0UA4lzloHDDV/RvarIRnylF2GMHTuqob+mDAg
	 l1TmXRVnZifJ2EQKuxuEHu0EyALc4pMuy4q2GUdr+6xLdq6SJxcQ7cGvP8GQogxznj
	 Q052T5FBKCiLlwJ7T5+e0y9aG9n0r2DQ7km6d5+Q3uIFsFfnR9kHlXWu/NrCF0FMl8
	 sHxVNkSXzjRFg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so1869355e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:10:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwccpL6BdbOUhOEqmGok12I5I++HmTPV8MdJt3mw3Y8xVBUFKd3/HqocPEq+pIcrr6sro0ekmFJ008EKoo=@vger.kernel.org
X-Gm-Message-State: AFuF++m8J/REfZT0huVv7YU1OL6fApCRpVrOvyw/3HpzarsB9Hs0nZMz
	H/r5ImMnr7U5msh4vvFm2QQMe9qkbj1p5jeW01pxTnLbFuP4rreXZiaPgMdgNCbpz9GtsU04ke0
	TdCZiHff8q14BqMFU64UQNF0DupcMNq0=
X-Received: by 2002:a05:6512:1389:b0:5b4:ab2f:5bd5 with SMTP id
 2adb3069b0e04-5b8ae68c4d8mr760395e87.8.1789377023628; Mon, 14 Sep 2026
 02:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831105056.756259-5-conor@kernel.org>
In-Reply-To: <20260831105056.756259-5-conor@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:10:10 +0200
X-Gmail-Original-Message-ID: <CAD++jL=F5efmf+b8wvNRcBq3ORB03f+Zue5A5NiaMP=Deu5vAg@mail.gmail.com>
X-Gm-Features: AcwNN1UxwLBklInMTDkL86Qeyshy5Z5cOuZdxURaH6Lw5kZs_qB3HVR-u2maOv8
Message-ID: <CAD++jL=F5efmf+b8wvNRcBq3ORB03f+Zue5A5NiaMP=Deu5vAg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: mpfs-mssio: three fixes
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Mon, Aug 31, 2026 at 12:51=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:

(...)
> Conor Dooley (3):
>   pinctrl: mpfs-mssio: fix whitespace in debugfs output

Applied for next.

>   pinctrl: mpfs-mssio: fix width of unused bank voltage setting
>   pinctrl: mpfs-mssio: use correct regmap function to set bank voltage

Applied for fixes.

Sorry for slowness on my side :/

Yours,
Linus Walleij
