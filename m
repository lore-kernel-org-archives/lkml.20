Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8B41A8F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640436; cv=none; b=Ctft2d9ceRa9s38jvUMbN9KQKd9jMG/31juy5mFcdjF2ypmyCHL8j0fSsmllBjF/gmBSkTWUJkcPogOFDsK13+fvLdTAMcAvtwP0RLZ3yoOd1pFRTfP6uB44rYqpVRGMMbKp8Ob944/bp/6Cq60lCaJ9Sa/IL3V6LL+t681VfVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640436; c=relaxed/simple;
	bh=mFW2G7qn0tHQ11P8dLXCXVHqgsu1POvtSpam5UrfvYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZmmDmL0/smJw/Y0+X7BEj8afrrJQOVLHY4VWxEr4rJ4Q+w5m9zzD4eMfuQq5du6AK6N8qJldqe/OBwJexl6v9VeyJBjitmBYef9Koa63pXP6I05Jk51qUJYA9SbVo9L8VqMsNsJG93oCni9kxUFfxS9lqy54GVhD7EGp2Anffc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=fXZuPleP; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="fXZuPleP"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2c7eb3b8cso432975ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790640433; x=1791245233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUvDYNeKYtEGt6nLpxNjasM9TEF3xIAo9jyaMtWUr+o=;
        b=fXZuPlePe/1+hQK5WLcvsi8xWoFygtNAKFpPwHuRIxzJ37kolZqehuJGpR4ILZbcF0
         NjaPGn/uWqDvsAmd2TI07oVxE5AbRQ862G9OkLjQFnAHh1SqCFmv9MbbYTCbq+krwLRY
         h6G2zMufRV0Q3vmZqxkupekuotOhOpu8LmLh9Tjw1/33qTuVDPqfPU+/170tnZ+/ruIu
         ZxyUDoIwjvtEDqlLOKYfuZbAnL2NUJ1bZnFWKhAp9YVo6IEzb3vvfl2ZAFVQVF86pmZ2
         Qv/gF2VmGczX3bWNK5pUPvLLPoU5ZAkc3zoqyOUNCImNSIxvpMm7rzMm5zZvPADnDXra
         gO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640433; x=1791245233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MUvDYNeKYtEGt6nLpxNjasM9TEF3xIAo9jyaMtWUr+o=;
        b=i7nJMoz35oID/0pa8Al9bbX7qiSa2l5jycPylcTVIapfpGZp6kFahUk9CgHtQQCY7Z
         N/bfcqpVVWsHul2K8IYyXqvCFw4fvXK2jA+lIhZkL8wAar2aFGYp0SiwSlqmtrfKq/6e
         zhLvbviKG+IuveK3JbgMdrpyPJyc7jUHW92VhIlES63OwrEexHE5OXka2F6/P/PiVb59
         RtfpXRWcBNiVJbXB4Juukqf653uhftTBW5Vszd098o74uF3a80Fn7BJFyE8sT29rw74C
         6Z29ufKvzwgvAgcodpKTSG8gVs/aOKPpTaxVIqJ3GI25cB8NU/PMST3GNXukGCKT8VAC
         MJVg==
X-Forwarded-Encrypted: i=1; AKwUvBy/8KGB3F7gKwbsBNLyaPBwhNcKdszxv5gWgnYXwdOac1yD6jv1Y61P79y/g90t4o5f+qDirL16qJkpBeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSQhhzGILUPNgwCCZhVGuxdtDPenquMQOaz6nY5+8bM5dg1JIz
	1eG/p2LAavKAm8wJccicjhpxk5oi5/e+kRvnia2Fj08DkytWhGI1Cg28jZa6aOR1Pjc=
X-Gm-Gg: AYBFou1BK9lomj+JY6C0bRJU+jSy8ZmAWs8jPtpQ4IwsLzJ0viIJMuw9xQLLZiL0UFj
	BLUmTfDBX9B7DWIc7GHCAlnMGCcaJ2evhR8OB24NYOpzdz8ZVgFBMaMegm3FfdgCnM18QzNde8a
	KPI+AjAiM0VNFGdHfyWQE1oyVx4iZkcpxdrsWa97PtiPnSEDoD7m5xJJ2HyD2Um39pXoidB9mJH
	iGoHsVsVMNuGLY0LqpaxrrLBbilaHFaFFuIYonn4yyPh2jvPfhKbQ3lmhjV2qRhGnXgh7iKsEWJ
	MNAQ7vfXVXq1mRDTxlUPV+CuDRxGqQYN8olpnSIXTAFsRmkhpw4/gA5ZXRaQu+ybhMeYrfD1L9q
	iQguoNzDWCfPQd/aHjxpHmGVG1bT1eOkNw1PalPqP6XAFtcgNRsCqfMz+okpXlsUrq0fsojiTfp
	0a7RYwww4iTG9zWzxdikhR+vgU1Ss0HqaTUPLBbFmrGUSlwnale01S4IDKLCKxvsfQSsBi3ZUM4
	yVfl7E3/hE=
X-Received: by 2002:a17:903:17c5:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2df7da6ccefmr117603485ad.16.1790640433612;
        Mon, 28 Sep 2026 17:07:13 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e23ecsm48165595ad.18.2026.09.28.17.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:07:13 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:07:12 -0700
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
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: Introduce a helper to check
 RSS support
Message-ID: <arsBMHaLVLylD4zV@devvm20253.cco0.facebook.com>
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
 <20260928145043.1228968-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928145043.1228968-2-maxime.chevallier@bootlin.com>

On Mon, Sep 28, 2026 at 04:50:41PM +0200, Maxime Chevallier wrote:
> The RSS feature is only available in stmmac if the hardware reports it
> through the DMA caps and if the platform glue sets rss_en.
> 
> Introduce a helper that checks both.
> 
> For now, no platform sets rss_en, but there's interest in the topic so
> leave the door open instead of dropping the feature altogether.
> 
> No functional changes intended.
> 
> Suggested-by: Nicolai Buchwitz <nb@tipi-net.de>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 5 +++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
