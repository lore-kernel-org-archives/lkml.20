Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C104AE8DC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003400; cv=pass; b=QntRB6Jneiy2bvAl98dnU2DxadMzpcEoxcr3oNnPvwMzkBNImLkzSeHUKIkn8gvWgfC8wQnL71DIWrce2AfZmvUme2zADLf+AfGk+t822+5dDQU02T2j6SzvbGItde3hNqIxvmcqn/rWbhnOZuxTKrFYTWS3TaPJpk1UIBZbW0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003400; c=relaxed/simple;
	bh=RRnt92cNZkan/7gjLZgpWKhsYasr+rG4EuXp94q+O0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n61EISjfNLu4F5fPg05ol6SOn1tdzqh39CGWy3yqWBVGTzJyJFrABKCY7x/pKoC9gmla2ScTjIRA86PdTb1jj0HxyH4LVzFmbb2BK/5wHXKzoe5YCcTL7E+4CCkpO6CTNwOl5QWwZDde5gz+UwFVUawzskxR71ZRe+xZ4C+Vk3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7ejU3T9; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7ejU3T9"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso1612919241.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003397; cv=none;
        d=google.com; s=arc-20260327;
        b=Ss5x5EGQBIZlSNG9DEx98wfeloSfN197XMYi0U0r9y5f1aZcklDST5RWqAChxAYVjt
         hJDLFpYODdMVAyaHrno2qFq/13ysYgHVA3S+uuCZKKeuF8EvfagRVBldrC2lZAMJ0oj2
         jjE7Vi9Playz7oTwuNpoi1T1A6QqOKMw7XqKNbj6PK/d/8LQDKlz/Pf/OfAD+9LUcNrU
         a9tMwdikuOjUPS6Vnr5HnspOjZdmsxwL4zsJPeKPpxxh4BTFD234gdYarj9FKkci29Zy
         L1SADCNvwN5vzgsM7kLCyQnCIGeKv+AFxi199w1H7WCnoJrLr18nDUFT7OEz2w5pXOYP
         Y5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        fh=wk+d5pPPuhJDJ792pumoYNnIYGV9CSkD4fvW0xF92CM=;
        b=dm3nYkBiRvuP1AClCK9WiJjjT1foRi/xqgywnv93qHBUtQE7Thv4Cg9HAQHLHMpb81
         Wy+dI6PXTuhs5D53epo+MbMyHr6Gv9n9JNrEAU+yJAah1Bf61Y90qTuZvS/XdogDau4v
         vZnm0RI3V0qbq9gYUiWlk7CgQBTEVmbaNaEEiQ/e2LwWQRqjrm3eYskPS8/uJuc2gVUZ
         KF8WEJBBZnc0fVytjgeWu0OHoGb4PtkmIHOSpW9bZ8EOp02RsigjxLqZ4sUE4y/Tjy8E
         0TSAKj+oDPGti/qv9xKcDyaWsWEJjZ3+yBBQ9260R6/05+6vlzivkYj3cjStWjMRj56i
         lfaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003397; x=1790608197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        b=p7ejU3T9zk/yJq0i+ywQG2DcNQFEZSiDraIlntCr+rtmLcG4bf6m5qinkJMa2ZNie7
         8ai/rMVCKfMMbaxXNHryj8iHP4VCTzNNwF33qjx6yeo+sqHjl6qI8ZqatabAmc3HSUdj
         cwxQHifLkcBVB2O5kYiYJzdNEWrnWLyvipqpAnzqnneKR1ARP7l1cMGd6pKWEUy36bG3
         kI0LqdkrjKDcp6IZ3vqbWp4daSYbVODOaatr+bHivw37RHoAqGhsMZcsOR/5PCKV92l4
         bTvYyVCiLG42qRdZS7HfbzfH3qapCjqxGkC7lbEP2H0VmPWI2a5BAVDogPChvpleNviC
         RpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003397; x=1790608197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        b=hH72XS/StBbwR2O0aQK/vRZ9QVi7FtxjyCKqzfXg61Oxy/27k4ElS1EuFGGay7AqxU
         FIxLNnwFgeeFnWoCUvhkj3k5h8+q+tRX04OBeEgXUuuKPWzJlQ021E+HNrpixkAXQhHj
         ikbLildoLlKPOZR5mLnDUjLnfxwgcL4cIrXRWO/ac9sqOEqbaNnWdDgYCslIXci9/1up
         bJjhvTkW72eknUZhVXg+Baf3sOvZc8vZUWg+gQ8ahk0s7MtiajhdABGs4fink5/zGCO5
         Nq0v+fXuxL1Rf4cMrxXQm7S+7V0cwkyl98PejGnNSVc+o0/11I2oFWC4gyukhHn2QSZ4
         D6rw==
X-Forwarded-Encrypted: i=1; AKwUvBziUsiq36ThFEfMum45RlHxJT4/4PyFyCXl1Z7lkfheDbDYLAfXF+KETqvGvLO4eFwc2vLbDFyl4jcztpc=@vger.kernel.org
X-Gm-Message-State: AFuF++kWZlWTESKpt+KpfdwGqVrOwjlaeMFrIz0iPD6dqHXLMZJHwgYU
	4AGLm9CrMDVGsim6VT0ns1QiWbkXqsERd7fs2aEK5G3LozDm2VGi6O7br8oIvpopM4W6fBL5rO9
	+k8WmGEU4A1zgpuxfo7oEOF95uljmdjg=
X-Gm-Gg: AYBFou16aKwuG9Wd/JrZKvChKH0ov8qICV/NHQZ8vhIcMpJ66yjKAqyRDnOx5cQQpiU
	PHHgEYBs3a4zqebc070E2Bbc/4NI0WGVG60DCeNuaiqSaAqKOM61qBt5AgRxDwfM0hN1Zofht45
	Aqdwu8xb7TNbjHzzEeg5ERFCthi+PwvlUnT6SB/yMcaStxJLz23Ln8+C/U9xWh8bPU+1D0ockDt
	oZecgaU4U447ZkLoCymIUGPusmfSAKrxcS4d4tzglr8GioUtopkjaq7FzZI4bT5ZCiijld3044j
	9/pCTxcLlOZMrtkfNfOz/ziQsZy6rza1KLGo61vWiNlVBy/ZF4irn5Io4Wbie3gZGG/fyE11IwB
	N5ki/FpUqgTuL6q4oN3wO4ZDgRApgRYKY8/sNyJBMQYt7xC5FAPaM5Pdfw/Kln2OIAhDMrm9kDK
	NUg9NwPW9FaHE3wcJo26kWHeP8QzXfDnYIW2wKWAqTewXTw1iAWDrr2H0=
X-Received: by 2002:a05:6102:148c:b0:7a7:198a:c2b5 with SMTP id
 ada2fe7eead31-7a7198ad369mr3357929137.29.1790003396967; Mon, 21 Sep 2026
 08:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com> <475799c2-7eaf-45ed-a6cb-80c2c2c556e7@bootlin.com>
In-Reply-To: <475799c2-7eaf-45ed-a6cb-80c2c2c556e7@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 09:09:45 -0600
X-Gm-Features: AcwNN1VLNx3dtquO69cswaFe7FbqPEaN3LW5P0JUb4jisnZv9ewZXpukHo1wT2U
Message-ID: <CADvTj4qdVGDXGyXHmCGpb+ztvXs2kS3_joaCZkM0dq_sYvHscw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/6] net: stmmac: add Allwinner H616 EMAC1 support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, "Alastair D'Silva" <alastair@d-silva.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:54=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi James,
>
> On 9/20/26 21:45, James Hilliard wrote:
> > The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separat=
e
> > system-control clock register at offset 0x34. Add its binding and a
> > sun8i stmmac variant using that register. A distinct compatible without
> > an older fallback prevents the driver from using EMAC0's clock register=
.
> >
> > EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and ha=
s
> > no external PHY pins. Leave PHY initialization to the PHY driver instea=
d
> > of using the H3 internal-PHY controls. The RMII-only variant does not
> > expose the RGMII clock-delay properties.
> >
> > First fix failed MTU-change reopening and hardware-resume cleanup in th=
e
> > stmmac core so the interface is closed without repeating NAPI shutdown
> > or resource teardown. Allow phylink to stop a suspended instance withou=
t
> > restarting its link. Then move the MAC software reset from probe to the
> > DMA reset callback, after PHY initialization. This lets the MAC and its
> > MDIO bus remain registered when the PHY driver or one of its suppliers
> > is not ready yet. Clear DMA and interrupt state even if the reset times
> > out. Keep the separate H3 MDIO-mux reset sequence unchanged.
> >
> > The AC200/AC300 EPHY driver and package bindings are already in
> > net-next. This series separates the H616 EMAC1 MAC driver and binding
> > support from the earlier combined series. PWM, MFD and device-tree
> > enablement are being handled separately.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes in v4:
> > - Add a prerequisite stmmac core fix closing the interface after a fail=
ed
> >   MTU-change reopen without repeating DMA, IRQ or NAPI teardown.
> > - Close the interface after failed hardware resume, and let phylink
> >   finish shutdown directly from its suspended state.
>
> [...]
> > ---
> > James Hilliard (6):
> >       net: phylink: allow stopping a suspended instance
> >       net: stmmac: close the interface after a failed MTU reopen
> >       net: stmmac: close the interface after failed hardware resume
>
> These new patches belong to net, don't mix the fixes and the glue code :)
>
> The glue can land without these, no ?

Should be able to.

>
> Maxime
>
