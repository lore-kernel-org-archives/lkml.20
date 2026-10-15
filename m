Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC4F29BD9A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032435; cv=pass; b=EArCVv0wwsC51P4I776BeBN77Q2vpaMbDGymTDx/Y43exCyhaZz/SlkwQ1IouA4Lhbp8sN20ccFX3F5SN4fnWwhsl6PDIZ8C47o4GAolNEcSTJXZHbMvb0rDfcHvpsNWHtmtrpTcB8AGYH+AXWd9Dc507+rs5p23C9dgmxQ5h60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032435; c=relaxed/simple;
	bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5WuIPjmW23IOGnzBlWtVhWAbn0b1Pa8OqMQQiZZB0HMSSwLMfEuEQsL/3d4FvsFlY9k4mW05JO1Rcy5WNhYsWd/UjDV0EXNRAaoQOgwwgTJmGyLdOxuJFjBJysc3IvLIba3F+gzjmjAuhYa7AlllN+zJWuNclJU8MBIbUbSN90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9zBFT4g; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9zBFT4g"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7bec5112765so603296137.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792032432; cv=none;
        d=google.com; s=arc-20260327;
        b=Hjfon3kEs8ItnWzth9ZlGKEGob5lcV7+yyNZGoAuuAjLONyZTs3DOhdajmaLC2LFqM
         QXBb7JexLwcB8mn2CdgT0zj2jmGLBX4LVsRRDt+cdvxfneEZva1jtlLN9QPyPt1Md7EW
         +dMdnkzA5TUbQ5pYkXnE+7RxGn9JfJQvWvx3dOhJy0/5k419I9TC6mnBztYNiOi1wBXS
         cmXNZSKqlbOPFmJU3aba5OaHS2MC0PHTVbXn2B1Dk7jXb+OaLOZKo5O0Z4/nHNvJztTJ
         XhukhagnZvCooQPWAyhmnKRjorgb/vdneWh+A/K3bhR/YP95JuvPTK3aSb261QH6vPsR
         t+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        fh=6jscyl0MYiI5g8uoMhN7vpptA56IoCx2jTxUe4VOrXA=;
        b=lWHIae5FiGp9Sa2L4lg+dgzcICZYDogPH7OXOIOiAtINzBqIpJrrgXYvdaqSqglk2Q
         OXO3SwLd9DxcbAaKY2/Qnebn9Ss/HXF4C1K2STHrftGZEO0zaQBX1pH3VAdYRBSuzSLp
         YbhCZslVbN2sYDaTb8mGmwXSEc2eO/dpbWRAYamUkJ2IrBPjYBq+c42IyAFU7qQLduQa
         fIRM+CGB7yu1JGfl3nYSChtx3+ZJhwE02f6PV35RlEhVEZzCB2bUdSZQAZBPchkKsnl5
         slkeH2ZwbQhdbtJfaLtuyELjZZAyXDbsJuZPWMPk0HJbYEdbw9U3tVBbNFTkCXH/58Cx
         /yug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032432; x=1792637232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=b9zBFT4gV60ABLnctWyzzCBBtfC0buozh2D43daZBmRKfRwgGXt6IOFI5Ept0ZVKAg
         BVjCk73hML56dFXbOMWeC0839/alJYTdEc8BiEaEzZryvW0u7UFhIp5bumMaBMeAhJL7
         ulqNk/Ikzp65yx01NJ/4jHv/YS87Zha6YpTiR9sCNrpR63XZhwq+irLetuIRMYJsr6hx
         xyfpx8JjjmMg416JP9Jr15rfYGbWhnCeS1gZeuvZsOLSmq6hNiwRDzbKYIMOn1J7EIF7
         4WRuiuq5c7WmWKGHQIQFlp7tKjolB6HIs1a8zQGC9hcLAHjCDjwKc1HyjlTn+iwkMaVe
         FZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032432; x=1792637232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=YgdgpX/h65T25nmdFFt7p9fIsIAxuGGGd4hzAqq8QfyjVA06+z89FTJxvP63SSVHtu
         XpjMqG8ELVJNrmXT3rmqrZlF5I/HrZBVCCyoTfa5OHfyFAXjcJReF6r+MLQt0+UVJBZY
         qW8PxUuy+KCZPO3CupVtDAJ5l6D/4JCQGtGLvAh+iYs3vpDD9Hl/dWUhOWFJsJHaktxZ
         rErxpwNOZ+VMKJOTFq0XdtSOdWuwrn+wPqudsoWDNfaV6NEae4wY49HEm97qv2iBFkI+
         5+wFg2t1cwGCPWLoEKigmfaGXPQPV5C9qymVXKoKC3/CFrl9LCPNFVNrb1Heh5UIYmrJ
         BhYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHNXJ/1Q7EdbNqOqa7PzhHuHRi+gBniXlSxcQr8vXfmcE+GhCYW86xqlU+k6xu4jwSG0Ipoj/z/WNNopE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7O3QZmlR0DgWjfoHnOykmDL9AYU2d53duyHtV3SZcbfQNtWuk
	wM+Pi3Mn0wrxvebcjR3LvYHwEHgQHTPk3i569NpZgrp/QByNd0hsy9eWGHlIr4HZze8pi5gfvUn
	Ml1yrF0RIOQCrQB7qIHUq21POiBY55kOOUu+w1QM=
X-Gm-Gg: AYBFou15TzmrPs5a4g6fW4J6MtwQlK+xtsABs6H2wQenrA5HK26jfOpWUtvbwHbgHbT
	ubf/QCdi1xc71rb0LqcEP3lxDUUlMjyF1SPc5mzR+03bqU6TS2f268K20GYAoaUpvr0BTCgQ2aO
	SlGte3FeRu4tOEI3Yjhs9ei1tlraZ2nN1Z+1wPjl+tj6+aW9EDiJLWMN90aVZnxvcLJ09rkbuqa
	2RkCZnVPJVAS0A9dIB5m/zoDiOK+N7N8dIZ8IimKyP9O++yxCM9hm6Q1a8tD6kIDLsSl2pdoxMK
	J72nayQ24l2Qsbm5rKL1nw/+Jl8hTRer0QYK7oYtEwRcjN7V1e1HOjGODtCv7vjuNOtL1o2kt+O
	1voB5TAEezt8f/tFX386dgI6R86G58YtLcWqmK/NEOZq8QA2ge58ceUgztlCfV8PonijxJkKOGt
	lC8i+xiCVJy/+dzMt6Z72L0WknG3kvKUDbcgABjba5rfZ4
X-Received: by 2002:a05:6102:418b:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7cb3668b831mr6416805137.3.1792032432146; Wed, 14 Oct 2026
 19:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 20:47:00 -0600
X-Gm-Features: AclHuK8WjfPBl-snALh8yjK0sT9hEMdsL68lGw63Y8O6sDBZaP8Ds_BfAoAdcJg
Message-ID: <CADvTj4oCVOBiY-55OJt3xFaOiBrFVixmK=AmTRt40iEisDSO2g@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:06=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi James,
>
> On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > Allwinner NAND firmware leaves the bad-block marker in the randomizer
> > data stream. On H6/H616 it also places all protected user data before t=
he
> > first ECC step. These choices differ from the mainline format, which
> > keeps the physical marker plain and maximizes the H6/H616 user-data are=
a.
>
> [...]
>
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> I am sorry but I do not want to proceed further with this series.
>
> Even though I am not capable of finger pointing what is wrong in the
> diffs nor in the commit logs, I do not understand most of it. I cannot
> clearly explain why, but I have had a hard time trying to understand
> what the commits were doing.

I think I may have identified a substantial part of what made v6
difficult to follow. Format-specific handling was interspersed with the
PIO and DMA transfer paths, which also implemented similar ECC-result,
OOB retrieval and erased-chunk handling separately. Reviewing a change
required following those interactions across several functions.

v7 01/16, "mtd: rawnand: sunxi: centralize OOB handling" [0], separates
those responsibilities without changing behavior. The transfer functions
retain command sequencing, DMA ownership and randomizer control.
Per-chip OOB operations handle layout setup, marker transformation and
interpretation of completed reads. The existing formats share their
read-interpretation logic.

The Allwinner addition in v7 16/16, "mtd: rawnand: sunxi: support the
Allwinner randomized OOB format" [1], now has a clear boundary: its
layout and page-classification rules live in dedicated callbacks,
selected through the opt-in attach path. Its erased-page and bad-page
policy is separate from the existing formats' interpretation.

Common hardware helpers remain shared, but adding this format no longer
requires scattering format-specific branches through the PIO and DMA
sequencing. That should make both its behavior and the preservation of
existing behavior easier to review.

[0] https://lore.kernel.org/r/20261014-submit-sunxi-nand-vendor-oob-layout-=
v1-v7-1-5d3fc6ad2da1@gmail.com/
[1] https://lore.kernel.org/r/20261014-submit-sunxi-nand-vendor-oob-layout-=
v1-v7-16-5d3fc6ad2da1@gmail.com/

> The risk is that nobody would then be able
> to further maintain this driver and I am not willing to take that
> option. The kernel policy so far has been to ensure readability and
> maintainability, and my gut feeling is that this series is going
> sideways wrt this major constraint.
>
> Also, from a Linux kernel point of view, we generally just do not
> support vendor specific layouts. I already told so Richard Genoud back
> when he was working on H616.
>
> With this added to the pile, I prefer not to merge the entire series. I
> can still take some of the fixes if you feel like they would be relevant
> anyway. In which case I invite you to send a v7 with just the few fixes
> you think are actually relevant outside of the randomized layout
> support.

In v7 the behavior-preserving refactor comes first, followed by separate fi=
xes
and optimizations. Patches 1-14 do not depend on the binding and Allwinner
format in patches 15-16, so they can be considered independently.

>
> Thank you for your understanding,
> Miqu=C3=A8l
