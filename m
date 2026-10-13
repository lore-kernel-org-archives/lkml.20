Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4A853E2E3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923587; cv=pass; b=Jzkdb2T2bPooytNd0zDdG9YaQsInxYTTb7FkFYAlbChx1lbVYVQC9ycFFiQYLfIYdibjTumgQbVtmf0BEXukrzdyBdIQR+Yjos08huNidMneCd8CUpfecSJMnsRdo3l32/AECN2WOM0P/EOv2el14b1TOGuT+SdBuznvn0KYTKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923587; c=relaxed/simple;
	bh=guoFD20zEk9cIM8OGpiI6ZacaO2x+w0vW/appO61b84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jA1/2OSv8dnBwWaUCJHj0HEsUg1qR+D07IaeD2xvoAZ/Ms8oNtZAwKSDfoIbw4VrTUU0baiMhdmTe73pVNQV/jFpRlL6ICbS/Qrtfrmme67p1EksZww/1pQjf9qt1wS3CDbuquYK829OgnxpemCbL+W4hAbmLxJHXvG8Tqua+48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCfdEhry; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCfdEhry"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-677b5148acaso3459188d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791923584; cv=none;
        d=google.com; s=arc-20260327;
        b=INTN1AklS2OpZvbv/vNQ9yYwK/MFmVq7rSP51PS9f+WI8NQ4fylWz0l+RkfA3fG/xJ
         Zlvdgw2o4H6Z0SeTOv14G3BZAfWspryCCatEzLWCBSS7zxO2tpO7GOPC3FTbZI0L1ciK
         InoTGMmaHEqWsSvVY8DGmFqpPaXHusLrYzH6JBiq9BPrDhyZisS5UMMuSe/UUfjGxb0S
         GhAWsXxky+BOxb3HPoPe98xF+mwonSpnLvtXwNpQi41sM7SV2Zy15pfuAnWTPz7w2Wd3
         wF4SEI3bIfClY1HONRT+Po5w312/LG2O1kDvpGDaH0mpSuM2NY54/13UCF9+RfVoCci1
         mFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fjZWNfknzV1F6JAInAE8o3x3W3fwqE841SsbudO4cc8=;
        fh=Tmd4c2j2aV2yi13pviQNFPXlmeOMP4hZPzhYGlBf6sM=;
        b=gdwlgwvMzi25mdQiJopUNzkNadH/gag3mK6wS9TU+51rhThwjhyq47DpvIcYPbKjpX
         90NVTtNXx6hrG0QNGZUIQGjsVGdftUbHb0oXcxfImJ1cI/ll1sgI3cr+DNYKO8pp+DH8
         59vZkjMghnE7W91Vq65N4mhQXmWJX4WoIC6mb7kz5s0c/MIj+CxpeiMiTmoTEBFBRQ0V
         1FHWgSitxjaxbWPmua9l9N0JK2bItimebE3Apmq0E9OZs8vDShYjSrafqTUOAUhosxl/
         n12U1ORAn4yVOwqV+LEIPOp+13fSWuKkb0PKLd2vlrGUjMLRWJUX1j7KWni6xcTs+ema
         SxwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923584; x=1792528384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjZWNfknzV1F6JAInAE8o3x3W3fwqE841SsbudO4cc8=;
        b=sCfdEhry7kUMkf8k5wxJjj4TkkJhUY/4aIduFykUdOoGmj4tu4TgmXXNR+WMyjctS5
         L5RvSWMrLfxAsVZjSGmXYcsf6j75eJfGq9BqeCKu3zfPidhRVTDLris++A2DhOU6fG3/
         CB5nRdY7foqKxUgrpZPW2teKWAi+WKTr1jmX2xr7OZ0XsvAZ4PoSBshWmbt+LwDxrMiw
         ys0UTFde17SkQz3X2M/dJ75W/OwxotQQheBI0iEto77knza4pU4ZpztmpFN7P+C9vlsY
         bhlPuGevilXOBGjNxAGxP34RX7wDviazB9wEwCvZNycFIu98M+B/EJi5+tSX/f1gQFiy
         pOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923584; x=1792528384;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fjZWNfknzV1F6JAInAE8o3x3W3fwqE841SsbudO4cc8=;
        b=aDFK8iPLeyUWDluftl7DnUUnWx7LEzRNkUDlPx3Jc1VGUTud0TQnZPd4cFrJ8fYAHe
         De9HkqiLCMYcKvgFXfnL2VjRfv+bFR2j5+VEWHdgScjrOfq7bygv5tpoy0r9hReIMn9w
         hfX+YRFXt1/+GcQa+E4irNUroUVDyFA90NrwoARB+R/KF0p8eqzxHzQDvRAV8glBITUb
         XkQgPZfxhyw3sfP3X7+5rwpVrdoDvS6dw83/E4Yjdr1p1/6+iBsi2m+oURHaC2b/Q0uv
         jlbRH630BjN/gspozXSYlOn28WF75+sLi+YMnH0L4utYNddGlhUprGH//Z7vqfFMaExj
         12eA==
X-Gm-Message-State: AFq9FYIP8sYrN8QkmTYvzQeQHkDv8OPPWAvPZxAKhXwmAEqZwsk3cPIC
	atNbTPLmgFwXRCyD9BK8oxc7Rm8g4A2Z9oJtP5UoRcMvAuxNTOZSAfGs7ZLslBxoZOF+WBwf+d6
	HYGH1uHRYOlOD62EUIyK7EFkZLUhHhzM=
X-Gm-Gg: AYBFou1QX8yghNYoDlmdjahBwsDFi302/XYTprMq0xkBahLnI6JRA29l1ItIB360XL9
	qvx+xf0o049D2NVn1cARksh4e6kOn7fi1zkRgikyTU7KcHVpCozLRmsMFmk3/Xg6+kSF4t5VXrM
	zVYBQYWNo4N/WAf57r4RGQWHm2sVn/fGCXHjXCgkOR7KTU7sq1qmvsgBE4xUkHuOd9D4v1IbbiD
	WUx2Jp8Dln6zBHTOfRuuG6W9XiZkofw9YCGUDgOsZeJEc625YIzpGNmWoKaFGrPpuGyPu/BSBbt
	dRyUwhWCHj2V77g4PQPZ6v3/N/hfwdrpFyqOXY8Buus/GPyCtMsvz78DT/EBBScfF+6p9j4cqSh
	1gMMOFHFVmRg43tgbWh+qFd9P/82G9XLapoOoE1vX
X-Received: by 2002:a05:690e:168b:b0:675:b778:a423 with SMTP id
 956f58d0204a3-679362bf517mr4886393d50.142.1791923584078; Tue, 13 Oct 2026
 13:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791887415.git.mst@redhat.com> <e12c6a45aae251d1642af55d8d3121e554993a66.1791887415.git.mst@redhat.com>
 <20261013070549-mutt-send-email-mst@kernel.org> <CAF=yD-KdTn2rHyp_j8ORr9F5hpm=TzaPRan5+gvLiYBd9HP-sg@mail.gmail.com>
 <20261013143335-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261013143335-mutt-send-email-mst@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 13 Oct 2026 14:32:26 -0600
X-Gm-Features: AclHuK_AY3efVdSO1MP2W2AAhlxVTMjkmeXG8cBqCPBuysQoPjuKaPNm0xvEtb8
Message-ID: <CAF=yD-Lz92nGVFab1Dq8M9VusDsKf-ioda8KrZoyh28x3Xtg4Q@mail.gmail.com>
Subject: Re: [PATCH net-next 3/4] net: resolve uncommon partial checksums at ingress
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	virtualization@lists.linux.dev, Max Krasnyansky <maxk@qualcomm.com>, 
	Rusty Russell <rusty@rustcorp.com.au>
Content-Type: text/plain; charset="UTF-8"

> > > > +
> > > > +     if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inner_nh,
> > > > +                                            inner_proto))
> > > > +             return 0;
> > > > +
> > > > +     if (skb_is_gso(skb))
> > > > +             return -EINVAL;
> >
> > This is a risk the commit message will have to call out.
>
> I tried with this:
>
>         > > > We can't easily "complete the checksum" for GSO we don't recognize - GSO
>         > > > assumes knowledge of the protocol. We could segment ignoring the
>         > > > checksum then do whatever csum_start and csum_offset say, but that
>         > > > seems like an overkill for something that should happen.
>
> I guess I can add a more detailed explanation about what the risk is?

Let's just explicitly mention the consequence: non-standard GSO
packets that previous would be sent may now fail.

>
> > I don't see a simple way around it. We discussed segmenting here too,
> > but that requires intrusive changes to all callers too.
> > Alternatively,
> >
> > 1. call segmentation, but only to see it remove the SKB_GSO_DODGY and
> > thus verify that the TSO/USO packet is valid. Still drop otherwise.
> > This also does not add overhead, because it would be called later
> > anyway.
> >
> > 2. a failsafe off-by-default sysctl + static_branch that skips the
> > drop when set. Messy, but so is the situation we're dealing with.
>
> Tack this on top or do you feel it's needed straight away.

Not urgent. Can even wait until a report appears. But worth taking a
look sooner if either of us gets around to it.
