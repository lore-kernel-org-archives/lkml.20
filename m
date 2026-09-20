Received: from mail-ej2-f36.google.com (mail-ej2-f36.google.com [74.125.228.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FE71A6824
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789865543; cv=pass; b=WX87a7e1maKX8IBytPN5dbp1JiVXYBU97My1cJ0+RUNxGOXg/4RDgFRiMsYnIGPnsylEsd8xu9AYgY7cZgSvySnMVPMaHS+yiA7+JyehHFTqQ9SUBwrXESz6oXL5cXt9Lz3ymsDZtx7QZju1GZO1D78YPMXTrpPrSlqxjcPG6OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789865543; c=relaxed/simple;
	bh=3BUK8JAns4D4O94aFHeEQJQLFqjJlmEF8jJnUCFvuW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8rXr8+xBB6rACw31L//0rQV+I63Nvey6Bef8P4MskLLOwkZ8YjV2jfiJPmJcSj50zWATO6uuFTo2j/jZnox4wQgHSWCljA84Lr9h44f9ACcoCaDPBsO70kG6NliujvPcnnkW/Y3Le/7ErB4QuRPWIj4vDvnJIzMwy+3RS0FSS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJ4o9Jp1; arc=pass smtp.client-ip=74.125.228.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJ4o9Jp1"
Received: by mail-ej2-f36.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso309522366b.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789865540; cv=none;
        d=google.com; s=arc-20260327;
        b=s+GM1saWCVUXrYIkH9a5H2z8vdAE97m2RNbVcvpKM7zKB0pvIgNK147rJQBcHx0Aya
         PKIulThuQhS8Dl7jtD/marzBHfjRz7ZEwsTUwjK3PO21p2w7k81ya9Dow8uP7whTymGk
         hc7hRz/cCmazfx96TnhSLWsFJhr5aDbWohHgTG+dcbBKtaytQ8XIPfjKCa8DKdluAv7u
         tQCUrJqST8kJw5RBEMSv0gA5gWSuH3l1C8Luw0eX6tWYUWq26bGEqfHD1uV6h5w13pZ3
         LfdvSMyvOXHlo85lm1716S9ZfUr0GCnhAA55nE0trgjpqG1BEJ1/T0BjcdKZMMqqPV1H
         ZJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c3C3doPNU+BbPfNOlvgAp/S4D1VtR06ufBbUBrF8R8M=;
        fh=sZtHE/QsKwlkMnQiwoCfKEczg2zuNDfXn53gtNmsACQ=;
        b=m/2JPJUuKVcg0qwpzVLpxXJKoVBAFEoLKDaPvC84xa2aEvDqfxFlzaq+h8/Z4PYTqZ
         cAgKJSTLsv0pamLHDdWUow34VhxBs76dgmrtL1LuagbNi9PCZqI2YJFtDrFsDCTOHjor
         nmZUxIoJbg8R03JJkslLaADYJxZECKGBtQW9CQXXRbcLvExCTSEzXk0HRiM6rIzMB/eU
         Uv0sJtKrYrJkqXri+aLia+xmn38uGprnsZ63/mm+Kp93Xg1bA/j3UzCtodlo+ZMCKjJN
         idNyBeKDj0D/aqfio6tjIybL07+Lgdg2ftakAXmlssH345UnSs7JeyEyWnvRoL1iiHFl
         K7rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789865540; x=1790470340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3C3doPNU+BbPfNOlvgAp/S4D1VtR06ufBbUBrF8R8M=;
        b=CJ4o9Jp1K88SD9Hp5lpA/U0hecpMozet6Bz3RQEQZGn2TgvaQH2TdK9hll5L6xBGxC
         AcEb2oYCQQNq8tLfDagMzeMBWmbXg3AfRQMmPk/iscxnzDpww7E/JZeXs1McUB63M6bd
         WrcE/hn/18DX7ikZ1nrIAiybif4t5RnVh7Xyd57e881oCr6pGn/UFRiwIBo+6KYrchy9
         rNgrs9qEXVD6xOwjA2/JS++/+KpWAbg9nShRSGEJtOW5h6TppL5QbY6mAzjMgbPj1S++
         x7NM5BhA9aSTqR+xA+lAGJsPOeWgptb3nluoMnDdOfftlQXyZzR1Ty5ykstqzzuC1p+r
         Fi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789865540; x=1790470340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3C3doPNU+BbPfNOlvgAp/S4D1VtR06ufBbUBrF8R8M=;
        b=m/GO7WcrDc90/dA3UAHc7TT+ud/GIQdskQtB3mvid2MOmt632qnHoA/2LBVZkkZTj1
         N+rIYwNmHBwB/4U0ySPjvT/k+a+3mhQY0MPirtTiA0Mq4EvFvnRAOplU0OoLJR09DB1P
         5PlYA8DDYu+SQ/VtJ4o6sbw6hVtPnZMmyXRYfFc1zI0uhWjXe8/ITatUTDT2MDAIRJky
         rjjkWmux9Z6t7D4e+mh8EsRNM6CUO7x2GU3DIpfpKNMVi7V8cKHt1Z5buiOS+f3xVKaP
         pgPGhjvMCuoEWOqGtwRPnqtJM03AzWFCQEu3cA3Ut8S1USAFx0JE+6K5SUGFHMiq0FNR
         rOlA==
X-Forwarded-Encrypted: i=1; AKwUvBw9L46wo7KDu/ifPyg888Xv8T93wZYfFj2WjYo3kiFKZmDau3epoo9J/Rkjol7f70SudkAqWOzdLqv5bWc=@vger.kernel.org
X-Gm-Message-State: AFuF++nUKdt1Uj9DUFWovOltYZFtcT8CAaf3aB/nlnuk+yrkYPV9J9nc
	0jhgRPSMH7LPCokz67Jc6VtpbL3ebBKHYHDyKgiHYTg2O7fuNv7fRAddAgl1rqOJiYHA30Kbly7
	84DM3FUMMe3SfWPYZ/2BejeELoTwLUA==
X-Gm-Gg: AYBFou2UiG1+hxSZzXS54xoFwAZhYre9iM7kpIVOvzXnCJO5KSQf6WI8+H1nkXNJ4zf
	2RIVaYHitTVrJWyde/PcfmOZNF6oG/Emxvcbqlktt0yB7hv7RaGT86jDfwIlcE8t830Vy6qe2Kh
	WFpuX62dQm8K8B6V1WsxclOo33PPAQ19rs4VLETobM5W8biAENabCbm7dVf9GbOu4pRjjD/5+/U
	3kSgwGE1N34w1HjIgyOmJZYva/gkserzGmjrdV0gFJIdlTcMH1/HClXGZyeKGLnGwzFKnxDSt9O
	FV2W+j49fCApLiciyVfwhIqTsCsRq/SIdao22Rh9QKHD+QytNirvyfyfE64lcifKe1za6I5o3r8
	QDf7RpH92jEQLZ4hvCV3eCMH0sAh1uLaKZJGasKK5iq5MpPFEjgF1yIHLw7UxGHA86UbA
X-Received: by 2002:a17:907:97cd:b0:c25:58e:83ff with SMTP id
 a640c23a62f3a-c2a156a3794mr545290166b.10.1789865539670; Sat, 19 Sep 2026
 17:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917192835.58126-1-mhun512@gmail.com> <e544a2bc-79ed-4067-9be8-59453d25acb3@lunn.ch>
In-Reply-To: <e544a2bc-79ed-4067-9be8-59453d25acb3@lunn.ch>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Sat, 19 Sep 2026 20:52:07 -0400
X-Gm-Features: AcwNN1VWtFS9czLfcxGxhwerswgSwdEW0tGUGqcJxmZSe1Yapk0ciGjwin5ZEjw
Message-ID: <CAGEsz8EJyv-Ea04gFYysz=6hXD8ehHHtyzvLENpMffKnN85TrQ@mail.gmail.com>
Subject: Re: [PATCH] net: gemini: Free the shared queue after removing the ports
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linusw@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. You are right on both points. I will keep
devm_of_platform_populate() and let the parent's devres release the free
queue instead, and drop the teardown from gemini_ethernet_remove(). I
will send a v2 with that.


2026=EB=85=84 9=EC=9B=94 17=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 10:25, =
Andrew Lunn <andrew@lunn.ch>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit et=
hernet")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/net/ethernet/cortina/gemini.c |    6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethern=
et/cortina/gemini.c
> > index 4c762229ce42..e493d495f2ef 100644
> > --- a/drivers/net/ethernet/cortina/gemini.c
> > +++ b/drivers/net/ethernet/cortina/gemini.c
> > @@ -2364,7 +2364,6 @@ static void gemini_port_remove(struct gemini_ethe=
rnet_port *port)
> >               unregister_netdev(port->netdev);
> >       }
> >       clk_disable_unprepare(port->pclk);
> > -     geth_cleanup_freeq(port->geth);
> >  }
> >
> >  static void gemini_ethernet_init(struct gemini_ethernet *geth)
> > @@ -2656,7 +2655,10 @@ static void gemini_ethernet_remove(struct platfo=
rm_device *pdev)
> >  {
> >       struct gemini_ethernet *geth =3D platform_get_drvdata(pdev);
> >
> > -     geth_cleanup_freeq(geth);
> > +     devm_of_platform_depopulate(&pdev->dev);
>
> This seems wrong. If you have to call devm_of_platform_depopulate()
> why are you using devm?
>
> > +     writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
> > +     if (geth->freeq_ring)
> > +             geth_cleanup_freeq(geth);
>
> gemini_ethernet_remove() is supposed to do the opposite of
> gemini_ethernet_probe(). What is the opposite of geth_cleanup_freeq()?
> Where is it called in gemini_ethernet_probe()?
>
>         Andrew
