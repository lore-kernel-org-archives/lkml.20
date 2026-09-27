Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145703BA222
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540915; cv=none; b=Rcl0kAdFCKgBl9BtL8RsjPmdbjuMKVwfWYpfC8j6e7ruMRHVO1gzw3GmRmWsyw/uvIu4oO76nZoFEKQXplMepsRyQ7iYBegHsFQdoSHG72Hg79Jmq/EzxicgnvhuiIx6QHE/GxDoxvNFl+Sa+tdzd01/QHp3ejPtfyyJz1gIvbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540915; c=relaxed/simple;
	bh=FSVVe/cPDU2HiWT6f26OgXG1GyfOSzOG3siiaAo3dOY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iybCh8IdClvcS99/RZpLPG53XAOoMl9DUwkpjgfMzL6OB/Brsh8lsqRYS1SgyH+B4b0GMxt/IXBMyUAu65DKRyvLPlSbLSeRAgr4sQK0YVAP/IwaIHzvcXLaDVlTFqyKbyTEU3vlnBBQC5dssza9V5qNiRZFQkyut+cthEVGVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKZqtEiQ; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKZqtEiQ"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so874821f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540911; x=1791145711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=;
        b=gKZqtEiQNt2Gf2yCYfkyFVHF73EFKbd8MQ1TV9Nv4FKk+yIawe94Ud6voNrFcbuXsN
         4j7AceejpUTCeLf95nSQWnOFxY0x/pNNbL+g75Sv653PtHRkp3ZTBuPX3AvHIBYCSoug
         tLFpwWKdvQSzy7L7rt8tEBXP4nVHTixSuszgnCaOn/DRNmdYhZsmnYUhqSr266GFik1M
         ybWZ1lxhVnyPDCfeUneecCkX3EKLekTh8vsBperf+uXuH6gxZqAWIzg+dlsBe8ijTGL2
         5xl+ssxAU9sQA3q6SGC5E+HkTZd4or+aYT1IfVrR4ZEiGkjWFglhIWMTYl8z7K2gTL8I
         Y3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540911; x=1791145711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=;
        b=TLNtzTIg5Y5lpIThf8JGbyjpyeonPamD87mxc5FPfFcsp/d2mRXdGrMfXtrhNX+fTk
         DAFT1NaKpQkjp3uY+NSDhyY8qry0VVjkipI7Bn7wrgSjxz3qlzf8mcogbtVHLNWANFwW
         JRh2P+v0QHsB1whjb+5ES/vFQ9Hs3dOdiQBG96j4VkzSBcWePUVgaD7v3QYvtTra2/b0
         jl1EyDokIh0rvK3vFYqmJGj/g9QI6DJXP85+jHuSQzzFG/RxKPE/Vli9PAWN+sk3Nrrw
         QzYxGTGvcbijL2KNOJKXywjAnl2CQ1L+iaPnKTZc3iwowRSJYkOPl7eqz3m5eWi2Mouj
         YQjw==
X-Forwarded-Encrypted: i=1; AKwUvBxYoDMaOKZ6Q6PBwiPHN/8zsNYWX9EkPgpPRsWKCyLaQYcH2hvFPmuUKPQldm1UbD2ow893S/TaiYbMLXo=@vger.kernel.org
X-Gm-Message-State: AFuF++mKJOBR4uutvscT99gFe8X/8++mMWQPaVzAUmrMT8nLROpVTdjg
	O45w+DbnyM3JfJyRk41zxrSO0wp7NIbGuXVhE7vCU9vSzm0Bm7C5JJGE
X-Gm-Gg: AYBFou0xfkeRwvsD1DGfOQPequ/9USe4lD4XrNxrLLb32jST6bnfK7RzUDHzVpotToC
	+LntbWSnvadh9v3eOzFVAIFqM/KlXMBWty7ayp1ps7+M13PqWXf8aTJZ9Qk7ecx2ZP/hR6Pezso
	Wv8NvgSFJ7rbTFiQWslvyCS1oPaBIjdK3UrJTmFEOpuJ7VIpAXktDiYzjurzUaP4IGiq+Rki8gI
	eUKfzVf18cc9rwS5HXcCD/kpBXUZn/FnPUxVFLaSP/5cscMs6a30meLMn48bYy5NQaItxcyi1RS
	+antzJqRv5+znXwUpOt1F1yKnftx5Dkh3IMa6A6NuU+5fKJUX23PBVAIq1FZx90/Q/R0+3/VxGA
	9VuVmH7Gw5vBquekicY/dQGjOLNPDfRsIEvYE2Zz3j3+uzu9ILl5UTeDQpK6KYF4Bu26S86uCXV
	hUmLDVPAhqUlMH5sUD93W2MuQOpg/mW0HtB5gIlG2bbdPF71xe6NgJSYIz3duf8XbGFPrAmFzx2
	VQJYqL32sQsMFfN0v1ER36xQEJ3U5gh7tNOYL+alsAAVoQ=
X-Received: by 2002:a05:600c:1f83:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fe66c8087mr198495325e9.3.1790540911202;
        Sun, 27 Sep 2026 13:28:31 -0700 (PDT)
Received: from Ansuel-XPS. (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00571744csm17037495e9.13.2026.09.27.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:28:30 -0700 (PDT)
Message-ID: <6ab97c6e.f5ac67e6.37e70.11e5@mx.google.com>
X-Google-Original-Message-ID: <arl8aT34M7MBL89n@Ansuel-XPS.>
Date: Sun, 27 Sep 2026 22:28:25 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v23 8/9] net: dsa: mt7530: generalize and move
 common function to lib module
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-9-ansuelsmth@gmail.com>
 <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>

On Sun, Sep 27, 2026 at 09:02:09PM +0200, Andrew Lunn wrote:
> On Fri, Sep 25, 2026 at 08:24:30PM +0200, Christian Marangi wrote:
> > In preparation of support of DSA Switch from Airoha, create a mt7530
> > library module and move there all the common function.
> > 
> > Function are generalized to use the reg_field regmap API but still apply
> > the same exact logic. Every function is renamed to mt7530_lib prefix to
> > better identify it.
> > 
> > Minimum modification are needed to the register header and common enum and
> > macro are moved to the mt7530 library header to permit reuse.
> > 
> > A library struct is introduced with everything required for the common
> > functions.
> > 
> > The generalization and the introduction of reg_field regmap API have the
> > side effect of permitting to clean the mirror functions that required
> > special handling for MT7530 and MT7531 based switch that had different
> > registers. This is done by declaring a common MT7530 reg_field and a
> > specific one in the Switch match table.
> > 
> > No behaviour change is expected by this change as it's just a code move and
> > reimplementation.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/dsa/Kconfig       |    4 +
> >  drivers/net/dsa/Makefile      |    1 +
> >  drivers/net/dsa/mt7530-lib.c  | 1128 +++++++++++++++++++++++++++
> >  drivers/net/dsa/mt7530-lib.h  |  391 ++++++++++
> >  drivers/net/dsa/mt7530-mdio.c |    4 +
> >  drivers/net/dsa/mt7530-mmio.c |    4 +
> >  drivers/net/dsa/mt7530.c      | 1368 ++++++++-------------------------
> >  drivers/net/dsa/mt7530.h      |  256 ++----
> 
> The number of mt* file keep going up. Is it time to move it into a
> subdirectory?

The problem as always is that mediatek directory will also contain airoha
stuff...

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

I would like to fix some trivial things pointed out by sashiko. Can I apply
those and keep the review tag? For this patch for example it's just the
typo for the multicast MIB.

For the other patch is also very trivial stuff. 

-- 
	Ansuel
