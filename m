Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4173546F0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380126; cv=pass; b=iIlyAOWQNdYGVmA1GyFg8YzXn3a4J5q6mPOb19kLGZ3WjK1e6Yd98H52sxyLH7v0lYlPyrzVAhwh3U/TMGmHpPxOutaZhjw9jPWIBqKVMDk5Z3FXyCs5Uo2m+krKmMh1QxmNIZaruhevslkKHvvnDvaxC6mJSx3Ih0VTKj1mkyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380126; c=relaxed/simple;
	bh=XCCBIJhL1uiHwfrbhW2jplxuax2K8XniIo9zDCZF6dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kO4Y32mQvdu/YA6Qixxsh/LAODF2gSFM7RyD2NP++AFe+zoARI4g09VoBQpOcL6i/pw1LJkeQrZYogyGKpuTPtrnME95lHTa2N7aEgNbY4XF+rd4/tpAXAjT/jYI39bPnl5ZdWD05hlyy63zMh4iBkcGCpj+W1nyCiulKnnlPo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFrNLFgH; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFrNLFgH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso244645966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792380123; cv=none;
        d=google.com; s=arc-20260327;
        b=YAQAwCkGIpKarMoQc2SU+rKD6JHoQgyNWNBKNKT9Zz2nHkE+Egn6qea61YUam5hC7M
         MsGshq0xWss/SmaoR/k54/Wrw7PddQuoB42iwu9Vzru0air4Q/LSG3Az6OXz5R9qkDf2
         Ly48F9oFJNDb7nkD9kCUDBYjG73ZQvWg6Pchix1I1KrcgcMycb8FTp1g9q1D3C1SZq7b
         WR7Fs3dOXFNGW5rASEKd211O+gcva1JmYs+wkWj+0nlJmlcYvQ2icEn6jzr4q/iFYkV6
         FTgPuq8SzCGLfo0IXop/cJ/iVFCCPBH5HYnTN017+rgS6Wdg56vvBcjk82ExktQXttGV
         yxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCCBIJhL1uiHwfrbhW2jplxuax2K8XniIo9zDCZF6dI=;
        fh=Pb3Dd+7rmEkJc2/zanXMiYpmV1jpT5fz5vBdh/peF78=;
        b=q0bXpn3p35uxE9oKuzKGbicCjQKJmOWn4KQn4cz1t0PSdYJbNJ5DW8tNhIzmlKHsWP
         9v1OGLDP4KMzsG54v2rt3ffsRwfP5FClVU/vEJY4+hT6SmMCLyIAqKuX3K4mt3Sg3KRc
         zgFjHYiaDryEazZrbHG00JfnPSndDG9bD+QXUuebAGGsyTAtn9RnzYpRp0PpPJtvWXFm
         +IsBQ9B5NoGiOpVcP7ScbbSTEN9yiOYIwrlMMu+2GK+QOG1xuFSRg6KgKKi/jImKBjQH
         t26+V2EPnBvDiJKDyk7uXziQWQ8NpAZSiaX2T81bIRHHw6bEUhoLuuwSVRpDMgXiYTnz
         s14g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792380123; x=1792984923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCCBIJhL1uiHwfrbhW2jplxuax2K8XniIo9zDCZF6dI=;
        b=mFrNLFgH7XOF2H70ozU+iHmwLhwox/7BjOzypZK33n1y4pdmh5Zo32FnaAADE9K0RE
         XPblvdqMW5ULR8ufPu1bZvD1orXFNCauzp67pAEaOB0ej0teBiWJfS72oI7cjh9OzwPt
         YE0Pz1/v1MrzN853bRRQlRhRKeTA9h1hcNwg5Qvk2r99ObQcAZies0JEtxXz4uxr+bvq
         gmmLNUz1JLoByvt2ZmvwlAt38812O7VxnZntiOmvubScL32ITr/FTBzgJXANUEhDC6Ez
         5syZbzngfLmZChtnjqLuf5gsxdvTArDNMlRNkKY5XXCvYPPchPWPNSyeJtdEEWbTAyiZ
         KlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792380123; x=1792984923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCCBIJhL1uiHwfrbhW2jplxuax2K8XniIo9zDCZF6dI=;
        b=0VwxL6r9ol9zCqVsNEwOomTfZVuMpHmLdhPvXNlwNOGoXdjdbGt34VqAlJ3YkS7hGX
         HYJvHNf/Jz9w1MQu0+djMhVMYX8qRZTs4yHeXvlsMXZH8NBy53/8H6yOY2nIS6CgnzCu
         IJrJHQQltuSPI2mhfguv4b+GqoSJoll2fYlWDoGqWrSnjWpErsCImX0u4OrqW23ks+4w
         a9jw17qu+/mbs9oW1PHmXK7ty0rLe+vXgwLRHAG+y2CEl8K+o8GuiCDAv5LFt1shVx2J
         RdpSJQg1muk3nR2tLQAP1t6kZibeRFa1Yl+hU32x5Q0Dx/poVAooPYdUApvjWs67vN5y
         +3TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS0hhCYH9ZskhVNM+05eG/D6VSHkgZD5qff0Eeb7eCzlwT7Hgjqk6NzlN5S69vldIN03YYnR8v+OQBbqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW5N+dK+chqPwhV7B1qnFBFllYcSs7Tn2GviH6tS7syeibWgr/
	L1sxcTRygAY1efP4Lvvg23v4ClXYqt1uJ1ZBF3xrc7hMq7UekPrSzNuKCbAamy3MnGg4SobPoF7
	m7bgRFWC5//vZQOpAIytLQo3SuVVsWS4=
X-Gm-Gg: AYBFou3u1Rn/DVzX9hWOsCBWNSaWJkaCZdNLnFdkEIjtcGrg/aDA5u6MBTIRRQeYOwi
	anp7QHFVgPWDiziLRiBV26mvhDXiME+AR5IRVHBLY0SHZj8fRqjqugQjGyTDSjQqDVCX2GjbbjQ
	VVKPMaeSq4bFCokaad/kwfGJIbAqNMx5yGMhd7ZpHkAvoeYHvAlyz7SrEgtjUQDuM31wnfHbys3
	IU9t2MRJjDY11XanHK6W06LAGLPkGQIwSQvcHR+Dcc5St3DN2weP6bmMB7FxnyTIZvu5G0ha4u8
	EGrZTHd3Gxj6rE3zcajNgrS6jY4CU+K3LxtUGnzWwiuq6ijO6K5An4xCw9SEV6rZMDvwN8DosfI
	jM54Xp3eupsA=
X-Received: by 2002:a17:907:c604:10b0:c42:3a77:80e5 with SMTP id
 a640c23a62f3a-c423a7781d9mr195405966b.29.1792380123432; Sun, 18 Oct 2026
 20:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002115850.962676-1-o.rempel@pengutronix.de>
 <20261002115850.962676-6-o.rempel@pengutronix.de> <CAD++jLmPfzi6FqF+xYFJoAjqz+Q9Ax9vhUp-MjUSFNTwOPAn4g@mail.gmail.com>
 <CAD++jLnYB2ec6yOF2so7W8kkq3PR-+c2kCscTSxPuGVC-L5G4Q@mail.gmail.com>
In-Reply-To: <CAD++jLnYB2ec6yOF2so7W8kkq3PR-+c2kCscTSxPuGVC-L5G4Q@mail.gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 19 Oct 2026 00:21:50 -0300
X-Gm-Features: AclHuK8xO8XmxHG3i4cMn6U2H2agbXczak466E3kXFsr0E8C4_HvzBC2G-OG7dU
Message-ID: <CAJq09z4KZ6kpF+VCTiezEVO5QU0fmYfdLNwn0gR7sjo2mHXh1A@mail.gmail.com>
Subject: Re: [PATCH net-next v1 5/8] net: dsa: realtek: rtl8365mb: store the
 egress queue count per chip
To: Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Mon, Oct 5, 2026 at 5:10=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
> > On Fri, Oct 2, 2026 at 1:58=E2=80=AFPM Oleksij Rempel <o.rempel@pengutr=
onix.de> wrote:
> >
> > > Store the number of egress queues in the per-chip info structure and
> > > advertise it through ds->num_tx_queues, following the ksz driver
> > > (struct ksz_chip_data.num_tx_queues).
> > >
> > > The queue count is a per-chip hardware property, and this driver supp=
orts
> > > several chips of the rtl8367c family. All currently-supported chips e=
xpose
> > > eight queues, but keeping the count in chip_info lets the QoS code th=
at
> > > follows program the priority-to-queue map via the ieee8021q helpers f=
or
> > > whatever queue count a chip carries, so the 802.1Q collapse is correc=
t
> > > rather than hard-coded to eight.
> > >
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> >
> > RTL8366RB has 8 queues so it's fine to keep this separate
> > per-subdriver.
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> I meant RTL8366RB has 6 queues. Hm maybe you rather want to
> store this in struct realtek_variant and have the core
> helper instead?

Hi Linus,

Right now, the common realtek core doesn't handle any queue or QoS
logic yet. In rtl8365mb, this property is primarily used internally by
the driver. Moving it to struct realtek_variant felt premature since
rtl8366rb doesn't implement this functionality yet. Unless we want to
refactor both drivers to share QoS helpers right now, keeping it
private to rtl8365mb's chip_info seems cleaner for this series. We can
always promote it to the variant when rtl8366rb gains similar support.

What do you think?

Best regards,

Luiz
