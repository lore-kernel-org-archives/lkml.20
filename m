Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C234078C6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287291; cv=none; b=rxEtWlJ8wooGHmdJXsdUpvYNR4pJaOXqop8Loyg/YGgyKKdVXhwTBZKhKFunMUYF5u2ve3AMPHDzDcwfm55lT4pWV1F38l6h87qyPb+24bH0HGxlP/DTRFJ+YlUxUJBVPrZiksYuwOjnEY0bCOBt8eGIzY5NR4U/6AvqIA64/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287291; c=relaxed/simple;
	bh=499NU1PtnmVpkfZBuubOoR4r215JQRLObkTgcVqFjGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAcFpRbVuvVM3+uv6Ccc1z6ZTgcxWAYHbYnhyp66yb4dQhNIEAtYTeJljCHbTGhBCE+wXM+MUXP0BH6Z+TCfURCvOv+GMgkVqg1i8y7kPOvtd1lRSrhJEI4XmlloYmMZg7ibojF3oW670JqW002LCf/TqPEJ5qowVNFlWsg6Trs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=b/Y/EowC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="b/Y/EowC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so1905305e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790287287; x=1790892087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+e7D3v2xQYVCmBJ2WfNuPIPZ5y1VyPpnDFgQMHUqTY=;
        b=b/Y/EowCZD54EtudeBVWuGzu4YutfdiDetZA+ewJLxN0oxTMGz4pJVzy8BPPgvcl2a
         W8BBpu3lhR3o8jsYGOh20p4forV3AsfHgG+/jSkEzs9+U5KV4Yuvoyc3/ylHuAkKIZ2q
         kY/ejaAr8WIhWLm7sEhfFydoZZ5H5gWOty8fhxsEo2Qz2GSdMIJjDS6MM4MmB7eLgd64
         pCOWDloYFPVo/1Z9GQ4PPA8NyZ1qMaeo4JBIheuiPZXcwlhaUF2TvuKt+adtX5ZJ36w6
         y+VP9D+sZw6bHpHC1GDDKLDC4g0ah6hfgetFcEBLr1Gau+0KkfDzcPG756sZyZONYrYi
         OCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287287; x=1790892087;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+e7D3v2xQYVCmBJ2WfNuPIPZ5y1VyPpnDFgQMHUqTY=;
        b=NUIqD+c77N9QKVt6VUeuHyymJgSBImwdMrqF8XwlfV5AsQpTJ76V8OqSxs6lzhp9EF
         gjqE1ys0+WN4aEdkTsBLrSijkUbTX4Ab76FqHSF97azhYHXzjr5woAo74c8pjADOflER
         mJUV64yDOkFV0w+24Ws7KdJsopkzl+RgAeGzfaRzeeScChd6vki1r8Z2KOJAn3IMkdkV
         ySULJE1R2wrOBsB4A7R/zEDg/hcQgAfVxPU9d07s77vKUgOZTqFIu6+IAwzkT5HXnrwo
         IQqwItrRr8xGXLj0CHikSIJ5D9G0U1N4J7KB0XRRBrzdWuDUcYdOkGO/bjvFAh1VlgzP
         XmUg==
X-Forwarded-Encrypted: i=1; AKwUvBymOio+8pIymtjtLKHhg12SZfWzxRZMcmwWVRUKkeosQZf5bd0E9XoLUZhBX0BQ4+PUJDjnL6bfGhtvT+4=@vger.kernel.org
X-Gm-Message-State: AFuF++lwn/c1PHmp+OFTwNARF+kjyy5sYldpKPiLtqqzeVztljwUGCsT
	Hwn667pghwBAw9sST6ysAW6RHa5/j1pXHeBs7Gx/XgInVveOe5+RRdYIt50jknkhzOk=
X-Gm-Gg: AYBFou3zZg3e/TTsf2wD+n9ZEDqEdcxTfWe892cCLiXhsTL13TUDNxFpJ5/sDowo6Gk
	89cXyo7QcUKMDKjl4a2nKcw7XJaUWjuvvtEg4/4SY4HVJkuUadFKEUQu08Xqvaz+5EgADlJETuF
	HKm//I+x42F37cWaurvkIwvAUkObIJmLVeocYmBhBiKmeAskyhiBHq7Yxx86XBa2UctHSTqTbw1
	bUSN/tI69zz1rRQ7T+yIiwK2WqgdSC7/TkD6xvU8w3XVjeTz7TA9dxTM/gOZvlbty0WbC/X+/6s
	PbSEE2eo7jNB1YA6EZfGk5I/t+Sy3fb5cL7ofgFZpoO+1kWwq65hYE4eq6phKHMEFbmiXzHIcgh
	N15bcR7ShsdDgR1oEbrRRELJE6kDvfjAJ4Ixglfx9TaH3y+TlxKz1yFJM41QlSOr69Z6kobY7pO
	wLBpqGjEVseuwrewRuN8Pn6zFkBqBSGONF3lY0nnXxpA6Jw0JkJA==
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ff06b2db4mr5253255e9.2.1790287287166;
        Thu, 24 Sep 2026 15:01:27 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff069d071sm10315615e9.5.2026.09.24.15.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:01:26 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?q?Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?utf-8?q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Frank Wunderlich <frank.wunderlich@linux.dev>,
	Pietro Ameruoso <p.ameruoso@live.it>
Subject: Re: [PATCH RESEND net-next v17 09/10] net: ethtool: Introduce ethtool command to list ports
Date: Fri, 25 Sep 2026 01:01:24 +0300
Message-ID: <20260924220124.2129700-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910170103.1029108-10-maxime.chevallier@bootlin.com>
References: <20260910170103.1029108-1-maxime.chevallier@bootlin.com> <20260910170103.1029108-10-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 19:01:01 +0200, Maxime Chevallier wrote:
> --- /dev/null
> +++ b/net/ethtool/port.c
> [...]
> +		ret = ethnl_put_bitset(skb, ETHTOOL_A_PORT_SUPPORTED_INTERFACES,
> +				       reply->interfaces, NULL,
> +				       PHY_INTERFACE_MODE_MAX,
> +				       phy_interface_names, compact);

The supported-interfaces bits are raw phy_interface_t values. OpenWrt's
layerscape kernel inserts PHY_INTERFACE_MODE_2500SGMII between
2500BASEX and 5GBASER, so on that kernel every bit above 2500BASEX
means something different than on mainline. With compact bitsets
userspace cannot notice. A string set or a uAPI enum for these names
would fix the numbering.

Aleksei
