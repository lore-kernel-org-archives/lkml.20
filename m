Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6713D51E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640456; cv=none; b=ZFB+Ckgc8c89wRDj4r99DOYQkd6mtoHcwJyj4fO3W1d3HpkIwihznYjB1P/YoFgb/p/+KMzyEy54vwRA0IzFYVN8pB6hXY6HtUO7H4W07sN0+yIEyldzdGXobpKu6xWVHve/MuNcgNpE4smS5u/KiUaP3RJlXEqP89yomm26dqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640456; c=relaxed/simple;
	bh=GPv2ciJgb1FqSM03Qe/MGyHtybXFkEUQAALJGpO4FLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmruQKY51VuDfLaRu1NtZoXdlqsCVyX6Ons74zWfVmsUGn0++4oDKQyuDUYr3ASvrGfK69uOKcXSh3aiWgnCiduFxRQ8quDMZgGbn8g84MwkNjzd7TJ725G9kaR4PYqA2DZllMUgxowYeyfRgufNmHfhyD2MxkSxvXU3AYSE/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=z88C+Gun; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="z88C+Gun"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso2343912a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790640455; x=1791245255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hm0RErT6dOlbpaDX7ox14DSX4hQbirleVL8DwhzSyVg=;
        b=z88C+GuntwM//kjDEg9DMbMk//UsDZZVtUxbGOwuGdt8YcbHsQVk29H51+RXmq2yKK
         cgmmiYQpphWu7xDeRyNnLTiaVToqNFzc8fABuU8qbRBpHgZwxGvf0blC16H1rDf6e45x
         jjHv1KVixzydtsfUjEyJizgnT6ZMqyj5TsEbRlmqYCgWS+vMHs3KPgkJr415a2bzxNFZ
         Eq14MiMAJ0+tPCw/Mi0ui+z+Ra7at0dr6rJ8OowTL1PTcuobnjICfxJDbRShBEYRXno4
         YogllrJemQeFwhOfurBwPI9JB2VZLgC26sG36xO0DelayJBekNiNo75Xt6nkGmPucDvg
         WsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640455; x=1791245255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hm0RErT6dOlbpaDX7ox14DSX4hQbirleVL8DwhzSyVg=;
        b=pAIYMOXr0EdqaMytIqyDY2k7LfiEaeHkcS61EhEW3UzRmOKQ18TDGlF2g0MolVXNHa
         pq4rre7/ked9uACjpJxgI4ulyiGf8Tqh+aXaguTe5oBViUt/O/M4hGjbet6klP602PNM
         73Uh32hvHKLT/t2Cc2BY0N59MhwYAdqyl+iHNjuiziQPVX+QsfhmMaS1Mx3D6Bwe1k8i
         o2P+ulCHkLZJt56SrmPJk41/is9obmWg934HcFRWcVoYWMbvxEbi0JzKI3kERx7PAGYT
         gdLJQMmiq4D+Ywnz0dVslfp+2FRsoUff+YLJfEkGuh8wL/hRnJyReE5YNHBB1KS+EcS4
         5SQw==
X-Forwarded-Encrypted: i=1; AKwUvBzgpOcNn0TFF28FE/2UpP+JN0L0ntCsBllv2Ne3BbdUd8Scjjz1tFbaXINonnwtOBx7i+GSJbKMcjAItbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9lWNcH3xVdmjkDgDRg8Ox6G5s5/WL4FMPtM/EbgS6ceXmrLRv
	1pswjrqxVYUtkDp8k7O9iNWJdmrc5JQeqVt3nv1U2J7tWzpmJbXm2zfAV3WB5P6rzco=
X-Gm-Gg: AYBFou3pRaG6ekWXYlQNWHpSB59i4IEXGcLP+WKPbhlxr+GNdw45ygqTrJkyXpo3z2i
	K4/pqye7FGc47or8ln1On8XT39IaiID13FFiuZt39+f8YDUAuKm6+bPeFL92OlFVkbTP8VvEARS
	1zFOrQ8JmVG6e6ixN1LQ+bSrLD/PUKZpmdhN+cp3PaGV1f/cB5HUl+GMFw6r74vRvgSMxXzajSu
	X+fvoHikLaozbOE/qb+1YnxUXfR5ZElBRW5wLLwDaUmVSlhWnuIaoCnXXoryDOKSMdWRoSbR2Np
	hZ62eeeEmPBjZN70mc93Ur1LxXtA2TAKdn6wassW7YIg+SnMgdmlMwmp2sLzXg/XB52vAc97XKs
	m1wF1HkIw8mkCxulDAaBgfRKyXBdyT8Ta49TKtG6Bccay5Cp38kdOL3LOlKH4SwwQmjSpTV6y/4
	ik3NjbqL8lmPz3/WkueXRD/TzOPFSoem81OFsOkT5Ga07KlXof/AWdEdzkOyYhhyQZoPXQMHEfH
	fpUfGmALFMw
X-Received: by 2002:a17:90b:3b49:b0:3a4:8d74:2ebe with SMTP id 98e67ed59e1d1-3a48d74451emr1727662a91.32.1790640454667;
        Mon, 28 Sep 2026 17:07:34 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497e942eesm2356131a91.4.2026.09.28.17.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:07:34 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:07:33 -0700
From: Joe Damato <joe@dama.to>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Don't set or get RSS
 parameters when not supported
Message-ID: <arsBRcXKMFfNrIKK@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Peter Robinson <pbrobinson@gmail.com>
References: <20260928145043.1228968-1-maxime.chevallier@bootlin.com>
 <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928145043.1228968-3-maxime.chevallier@bootlin.com>

On Mon, Sep 28, 2026 at 04:50:42PM +0200, Maxime Chevallier wrote:
> The RSS kselftests fail on stmmac, and this is partly due to the driver
> reporting bogus data for the RSS ops :
> 
>  - ethtool -x reports an indirection table and a key while the hardware
>    doesn't have any of that
>  - ethtool -X fails with -EINVAL.
> 
> Let's return early in the rss ops if we know the hardware and platform
> don't support RSS.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>

Reviewed-by: Joe Damato <joe@dama.to>
