Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94B3455602
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149086; cv=none; b=n0TkBSjYz94CAdjyn/ASeLy+BrE/bmJNMbdoPsQpjHefQDMfYkbuwSJ23GjEiNCpOf+NkjHqEqnBSYMsWVdut/9uI/2SFQUexzUUxx5B/nnPPA8GANJa9fcsgxEEcRNI2p+7GYvuQCZzrDWjiGL3ZrXo1AylwGLaq5RXUB9K6co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149086; c=relaxed/simple;
	bh=pn8GhlML0JvQlv8XCkL1gN9RQZWKQflTUH6iKyoTXWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yq3CmJsDnImg81P9QipCSu7qPKOYUj5I4K+VAWZNUmnuEe56dvnwAKwbJ+ol0kQKClP3VVw6HWz4evZDDf+x7ZCu6Xvvh5iMrHwnXyRTcy2UW+ri0Ka8voHAz5nGjyKZsiCof8hL4z/HuWJdVyCn8gu/pGTWVPyTGr+9tZvnxho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5c67e2ff27bso433385e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149083; x=1790753883;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gPyyWITg2Eop/iHLzqVBwj4t8oamM1QAzgzHz2VN9cs=;
        b=r4Uz8SUl13uIMDsIYF8TBWmaBSd81cSS7Q1hSKSwH0s4glwVChsahRuQYe/PmigTb6
         AeNRGvdT1XvYDigptph9pNMJ1HpE/BKx2abD6/MVhrxWQNvV4ehuYxC0WGchLOJg+t9m
         gsAIbEJ/LuWDxo4xWsYNz2+0LJ9TfQlhmeCm3u4OkmQwwWbVvXxkbxNXYbYwJhVHv2DA
         sE8K8hbv3JEJB8cQiOQXmglcnbqFwGkV0R+2htXBnskRgpGeICFEMEZ97E5n331puM3H
         9EWLYmHwSLYYuetyivTirhK+rSVxejNIyOIfHU+lDXubYxOY5eo88791DjRx+61zdoFK
         VSxg==
X-Forwarded-Encrypted: i=1; AKwUvByixlOv+C55aRITt0f5iIhlSGPm74fUtuSIL2VQQqa+MbaAxI4SMosCBuCS68IebtJHHd4CxINt3ACu4Yo=@vger.kernel.org
X-Gm-Message-State: AFuF++mkk1CBygSc39vmpDk1dPxgZfB2g9Dcb5uEWbPrcGEtR3BjYFt5
	uw8ue+sOwMT12cVVO/BUsHUY24d4YhoXBnmTDC3RApNjjmpRwcZ+W8mhM5kN65+I74s=
X-Gm-Gg: AYBFou1E3EKyYCO/2f6lm9ZP7iTRW2uc3qb0/1YmG+EWLZ4sRfYqtpNf64e4RYrumFM
	IsBhD9otxpV1NZ5TXBaA/yiHFd30WYidB25aMb8VV97+MupFMsO7tepmM+/kH3kZIWSIZJCUswO
	Fk5sbNcHNVGJRnq9ueSL0onK6SNifN5WhUXL7A0sOOQ5JpLuaZRZgsRKtTpXeBRTPzNNPCc1mxP
	+pxjUwURDjOuzmBWSV75pK2OOACE3dphHtLL9U7p0hjUzsD8f83qkxR5DwRfRmCdw0mi2T+HaGP
	kDBBASN5aGOYvfwgGhPIPZkaSQS7Pc+AFyRYVHLKppF6NUlJJWBBzAoBRg/rirnI3aBR/ZfQlbY
	Z3DLLpGdZMW+AZX9t4zOm8doHh96Jtk80aC4jBS3OYo/qFNjJfG978gaE/iu3QePlJ8BJMwXrsZ
	QKTXFFtH/BszBnod/truFaDw+dyyKmkTR/xoHGrbIf56A50fRm+7YFoT1uhTF76A1q5+UHhgOuG
	B8drCDwTKBvycqcmjSc5pGDilqJadAmLOPrjEgdn1QNA4tc
X-Received: by 2002:a05:6122:c95:b0:5c6:8480:35c8 with SMTP id 71dfb90a1353d-5c9f15c86admr2392314e0c.8.1790149083460;
        Wed, 23 Sep 2026 00:38:03 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm2438490e0c.9.2026.09.23.00.38.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:38:02 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97eaa1155b1so340892241.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:38:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIi3DKzaNeGa70ZFxXpwcV4FaRkXK7ToHOYzgVOMVbtL5tr8mXiQiPcBI1v0Atqx3fHzDIs/ZC3Cqgz6s=@vger.kernel.org
X-Received: by 2002:a05:6102:50a6:b0:7a4:fb71:25d1 with SMTP id
 ada2fe7eead31-7ac1a6c6e37mr1941921137.7.1790149082786; Wed, 23 Sep 2026
 00:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 09:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdv5up6d7rhhRyc7of9M5MthWFoeXCRWiTPSo+5B22Mg@mail.gmail.com>
X-Gm-Features: AclHuK-KliAgyjEnFc7fc7G0ednHxc9gvY5BOag4zMrSEzrWijgeZD9Diiyx23U
Message-ID: <CAMuHMdWdv5up6d7rhhRyc7of9M5MthWFoeXCRWiTPSo+5B22Mg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ironhide: Align inline ECC carveout
 sizes with bootloader settings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 00:08, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC. The
> current set of carveouts follows SoC documentation, which describes the
> three trailing carveouts as larger than the rest.
>
> Both the downstream IPL and mainline U-Boot on RSIP configure the ECC
> carveouts to the same size for all eight carveouts. Align the carveout
> sizes with the controller configuration set by the bootloader.
>
> This makes 1638 MiB of DRAM available for each of the three carveouts,
> which adds up to a total of 4915 MiB of newly accessible DRAM on this
> platform with this fix.
>
> Making this memory available does not pose a danger, since the current
> set of carveouts were carefully set to a larger size to prevent any
> possible issues until a confirmation from the hardware team become
> available, that it is safe to apply these less restrictive settings.
>
> Fixes: 6fa6ee724d8d ("arm64: dts: renesas: ironhide: Describe inline ECC carveouts")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

From the review thread on the original:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
