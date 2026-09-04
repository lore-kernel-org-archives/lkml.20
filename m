Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643334A92E1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531162; cv=pass; b=MDRAH3XfHToEboxef4feafTGH5Kum97gcu9M9UYD6/IvxKbM7l1PGz1I7pWxnqxH8hFtTpeBUONCXzAi30m6fCcUVxIAwxKoJ6uXObjpm7ZPxsc9valPydy/NVoEJxt4DQa4REvPn64qthQbrbo/rnAoBW/R1+bt0kb5zPuFU0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531162; c=relaxed/simple;
	bh=tJiXGDNLyxuN396q5CUOQROK9/agExeMPwA8K6/acLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWNVwBKcH+bLTN4pPTwtpjTa6UTcz5SWiF7stFba23l+vn15cAj37wPKLzlDaUpL9XqxZ5ejScXK6YwENkQat9Z2OuVQT5dSofB9MRFtnxUSvy9BZw+axjOWV+pG/h6W11VDO93nqa4tOZcoxTlVcoj2QNmRV2b5XFkSfP19lx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzVe/MIv; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzVe/MIv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c253425b253so152709966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788531158; cv=none;
        d=google.com; s=arc-20260327;
        b=p8gMcaWhQZYvm4arXmdLIWp3IHNlp7J3QgMP0uC899XnEb6TAozE7lEHUYK5s4hVv/
         wtZiJWbDkfZu3xWf5sO2vSjv6eWodRMzjAwaztV3rSBA/486bmoPGvAWcgR5/nXe4LgK
         b8OGbgbR+YBGLAtSgoKP04pg2Nd+Irq+kY79rW+P8WAGstUOqKdt8LfM2xQ01C3nAVXW
         9gi2hE75+H0xHQlZqqHSbOcWLh+AF3X5hN3gsIdYf19cf775B8F4404tKzLAlCUQzNsv
         iT8OXK1+FWm19Y9utFGCwGr2BiEKCDsdr9JvcreLGApvQ3y6d6+hYpQ8V7WTLPXM/hKV
         0eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yNlBRwCMNMD3QTbLrkFdaLqTwN+WPCN5l1kXt+BpUQY=;
        fh=P+TS6l2oUJ7Y97W/CmrZoHKvnjAJ2XmWZpGx8RljbX8=;
        b=NK9CpoUivzVo9aRauMI7Gdp65L2grflxHo1E/Mg/RE8jIXAXV5yEN+/28kL9LE1Rnr
         pJcMXIsicysZXEEC6/IwMvwvmV9COW58EaeSBsZlH3YrR2pZhhp6CV3BtRdaY8GNKO6D
         MnghkUBV3JCPj3P88OlXBJf+53ghAdMRyaaOkUIB4TbnNbbwMRPB97XBPqC7ZHqPOUrH
         pRooGX680kwGQZrvT+xV6ZUOgfK98QMeO/d0NklxWUN81Gz5OcohCXVCoXUmY3PeOgoC
         kLcEitxRjcPZHmw6lfAVwIO9h36ENx6RhPCifcReDftkTnsJGWQU3rq4qhIOw0mYrB0P
         fdvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788531158; x=1789135958; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNlBRwCMNMD3QTbLrkFdaLqTwN+WPCN5l1kXt+BpUQY=;
        b=fzVe/MIvOn8dgctNVo5pmFSVoN8JTAaJ0WO1g/DQU4QI+/6kmz4oJ46sS2EHTUnDfP
         ghe2cifp62WrIBlWqVKndwYFETtGR0yusJ7J1I7nKzTspfc3t0CvnBqGwdQzF89P5a9P
         RDrzDNfI2Nc8UrcN+67VLp2G695dq/2OlCxO1aVjeoMquOovexI+CsS2rXJTcEgeZT2e
         8l0lnRcP7+VI0z4rT6i7lIhHdG7f4lrl+sWQFl1UE9VarRsnIujuMr4xpEFA+5VYVDQ+
         k/H2tPutE4/A2bfJVZBa08pbQuvBQOeQyK3A7G39MZbc25y2Op/pQp6D+TtyZfpl0LoJ
         hirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531158; x=1789135958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yNlBRwCMNMD3QTbLrkFdaLqTwN+WPCN5l1kXt+BpUQY=;
        b=sYmgmlr/rc3JJs0eFG1B3PojejhzBRtXvCZxivdVt9n5YIMxL1Xobw/HkXdSFJQuL5
         M90LssVBtWgr0WgeSl5W8L5ELChwqbOyKR4w41Btwzbt4j4njTGeDcBUS9r4ZhQ0fkaE
         +/g3lDG77G1LrV6WJpYK7eo2m65ArRiHOVjc5v1H3nwOj3RLKF1VI2mjkHS9gXxhs2+p
         6/egjzy8BO8cRVY5vL7Y5n1KhuhpNj0P4iZig1BVxSfa4Xkqz5oUuu/Ieh4HjxaRu5Tq
         x7aosk786+TUzVeeiq7foa0D2dHVTEqID5SIrTNPUemYog2BTb86peOcB6omNX8pvvVw
         bUag==
X-Forwarded-Encrypted: i=1; AKwUvBwRTVb6eXybGCfSlZMiKviQJ3uvf25TkyF4/Dx5ABxCAeGYONWDCcQHRE/2uos5dI0VjSDKDcaWf5fUQf8=@vger.kernel.org
X-Gm-Message-State: AFuF++kT6XK4vhwUsPQko0vRBysM4NtFwwgU2wrD4zGeA239HS80xXto
	mzcFMIuf7Tg7DQXEJ5ACwDCYjHqVYcY5MO4t6iepR1zytAu0XFuTnkprP1Bb5Pbp5ZTPfUt1F5i
	6HChtt3pVKALME5IkX+1AafQGUe3xawE=
X-Gm-Gg: AYBFou2Ce9qhTHrcQQU+s1iED3roxvXoN1JmpPaaCfKAqvb7hiPt7C30IGiPiFiSG66
	Byov31J9x5MTlzhFUTJqQL8+ry/u7V5P0tKeSce0YeltV4rdU4HbCMo5LIcml0ImR0M+E5pQWqR
	zR3NXjvJBpw0fzkihi4C0PL2N5jaSgWGxjlK7Lx6xFeJ9it6AoXGAVSjGMdNNxjkw+dFo7fHeT3
	qsbmIuemSkDofjcvHzc332oaVsZ/NPYtoPlYnR/7HMvdtTkFKtHCEMhb4L0K3a93JVZuoLnp6gl
	JM5jUpEJRr3yjFdyZSjsrmhK6vzdth5CSYhj5eZp7wrX1XI=
X-Received: by 2002:a17:906:2099:b0:c26:207d:8a8f with SMTP id
 a640c23a62f3a-c26207d8bbfmr50356566b.27.1788531158400; Fri, 04 Sep 2026
 07:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903092211.2922058-1-o.rempel@pengutronix.de> <20260903092211.2922058-2-o.rempel@pengutronix.de>
In-Reply-To: <20260903092211.2922058-2-o.rempel@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 4 Sep 2026 11:12:24 -0300
X-Gm-Features: AcwNN1WbPDaaw00DsU5oy1rq55aIUcZnNRKdD71hzUNdp_uim09LPhoaHN9ApEE
Message-ID: <CAJq09z6w6DQsh4o+9nXinfi=WAUxW4ShmxJspBkXeakCf283tw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: phy: realtek: use C45 for
 RTL8365MB-VC internal PHY MMD access
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The RTL8365MB-VC PHYs are integrated into the switch and have no MMD
> registers of their own. What phylib accesses as MMD registers (EEE)
> actually lives in the switch's OCP registers; the realtek DSA driver maps
> those MMD requests onto OCP and exposes them over C45.
>
> For a C22 PHY, phy_read_mmd()/phy_write_mmd() would use C22 indirect-MMD,
> which this hardware does not implement. Point .read_mmd/.write_mmd at
> genphy_{read,write}_mmd_c45() so phylib's MMD accesses go over C45 to the
> DSA driver's mapping instead.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> Anticipated reviewer questions:
>
> Q: .read_mmd/.write_mmd now use the C45 helpers, but the DSA user MDIO bus
>    only gains .read_c45/.write_c45 in the next patch -- is this bisect-broken?
> A: No. Until then an MMD access returns -EOPNOTSUPP, but the only one that runs
>    is the EEE-ability read in phy_probe(), which phylib ignores; probe, link and
>    traffic are unaffected. ethtool --show-eee reports EEE unsupported here -- the
>    same as before this series, since these ports gain EEE only in the next patch
>    -- so it is not a regression. Verified on an RTL8365MB-VC.

I was going to do exactly that test but you saved me some time. Thanks.

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
