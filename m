Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0C84E7809
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672774; cv=none; b=OeMlLj+e6Medf+SavvQbbYk0Ej7wnrBZsQlTxO93AuA53S1e3hctTK3UjuAQQGrY81E7W+XJGt+UzuD0Za8mJLMQp/jtQ2IKrojnxkrwixE8gfCaKfF5KldfFWk/hQoIdIRe2we5juLFI7CkNoaWZD3okGQAuFNoF2p32nhbTpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672774; c=relaxed/simple;
	bh=tXJ+qY81QYX6ntiL17hDKcWY+jDR6CzEofjkGotGB90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hW0lzbwWFTHLEYBpEPLk5ga+AKImHSiclSj7ooefBbeN9mi6rrNDpCRWK7c5V4zB8veZ9NosnddcF01PtXjfv7QXRNmDBWogK3NYSskrSkiFJUaUQf3mUQO7vxHvm4tyhJUv0gebWQklJTeiNnn140E7jE3bApbkUpFICdiFSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSNpgtnO; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSNpgtnO"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so208550f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672769; x=1791277569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVeHQ0WAriz76dL1hysd44dqzM4X8EtO0BJ7xNzSj4A=;
        b=DSNpgtnOd5FV31vC8ZOmXn+8R0a9zXQAz+jVnfMhjmoh7Hs9z0pQo7KIOulBI9Rl+Q
         ig1KgCzTuj3F2GoQ9+8KgC+ep7ywewlNc8wajiYE88md8LgJ8FBBsWaGbv31nSk/ZBT6
         sQo2uhKeTL1QjoLi3nc2VOfVJUiQAaT8B/AW5DuXIvQCf6ICemg/VFFjD6RusGRYOMyN
         GdiDRkjpY/JG1e8w6PmwuZ3ntqwdXX/MFon8eqqOB0kRJ3Uhxnnsn1ZzpI2u8a4aN2XQ
         npypCMWc8XqiC0vSH4beQZ38GWb3pdJ6wuGBNaMdFbKsEqNeSNFyZnTOdWcwEtvTW8Wt
         QF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672769; x=1791277569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yVeHQ0WAriz76dL1hysd44dqzM4X8EtO0BJ7xNzSj4A=;
        b=Z2UG7IfUgPjgftis5ESJZwGnL14eFeU7k59W+xaCrCJUiD53xuc6rq+nZE6K3Bndac
         nlgotfqOrr3xOe+X3TGrl3/KwuosGxCnQSSC3Ogi5DhhniK2NXMXU3/V4bnkAQluXxOs
         1/mEq7P5XbL4vQYfUp4MnG6uGhofKJ/sNb0RCvSP+v2ksx36pWDpSmEkYQx8RFJVt6Db
         J+Aw2uqtxlHcNSDfDiVImDpr/PWEKuoBmvKThyx7LgSGZFlkSaX6TbVpBZd0wbuBE1rZ
         cN/NZ0Z7T+jUQCAJemIt2ycRzlMWvT4ro8SMmzuXq3a4SlYfdERNUsMI1N34oUeXZtn6
         f7ww==
X-Forwarded-Encrypted: i=1; AKwUvBw0TDXm+cuBZ9f+suHLkLP7huIMKIIKJT6B7vBMEEetH8SyDgChN2jIfSWxifBGoYx1d5JBf/mgQWfH35o=@vger.kernel.org
X-Gm-Message-State: AFuF++kpZGfuRbDvDLgHNjqvEsrgwLGqlA/0qQvP36aQA7cVramuYeOs
	936/H+f5EvryR8iS5sSMsVjru1Kx0GXtwjnFBgrYpFJdnBF4NVF9OKLg
X-Gm-Gg: AYBFou11xl8F/CgfRzinahOK4bmfw68LtnjjV5Go1G6ZQ0moJX7btZfvlvIKHihteXs
	Ki83epUGCTcKmQwOjW3OJqQiFHtUU6WmfA2D4VRj4cjg2o+eM+cikYBi+1WwknjEmtvgJHPE6zH
	644UfDqNaBSDwDjffflY9iU3H3UfnhtzpSlswlVq4vHkxsNItWxLfNAK3vsxwr0JKELpPR24M2L
	6bT99bUmUIhjzIHQTmKWJuA8yv32nA52bMc71RJ1m1E1C7EBoT1kSYZvTr3EclsVo7TGUrgSOKn
	jL7OJpnFackEyLLxsOsQ6i1PaCMRbukuEGUmMrgMJR/aChjVBQ4149T8Z5UNDwJA1Ef3nHnK7Dw
	UbTFOsMTZuOtG7Y/h2a2yOBp2pdp01Qsnq36mWp8rmvTCfEVCbLA5YIPpA1vP8ZVxchxLxf1NSR
	l1/TI64mTTsdz+0c8cNoPDWEN8RzpSvuvbJGTPL6N0HIvev1CRShpsOR7hbQ7qqPCJpOc1AhBNG
	9Cej4Ju3uvJXjEb83FwNhnC/4QaaPYICcR7xF69RG5RCs/hCs5f3qy9WCVPGr/Iy6G1JqJAHZb4
	Pnb6rbZWgs6M8yEMBTnK6Wptcskw
X-Received: by 2002:a05:600c:314f:b0:49f:e4ca:e09 with SMTP id 5b1f17b1804b1-49fe66ca9e5mr261828235e9.3.1790672768454;
        Tue, 29 Sep 2026 02:06:08 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm65937205e9.11.2026.09.29.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:06:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:06:05 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: arm: fsl: Document Variscite
 i.MX6UL boards
Message-ID: <art_faJ7Zx5CaWfW@Lord-Beerus.station>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
 <20260929-logical-fanatic-quail-2ff20b@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-logical-fanatic-quail-2ff20b@quoll>

On Tue, Sep 29, 2026 at 10:49:08AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Sep 27, 2026 at 02:46:16PM +0200, Stefano Radaelli wrote:
> >  
> > -      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
> > -        items:
> > -          - const: variscite,mx6ulconcerto
> > -          - const: variscite,var-som-imx6ul
> > -          - const: fsl,imx6ul
> > +      - description: i.MX6UL Variscite VAR-SOM-6UL and DART-6UL Boards
> > +        oneOf:
> 
> Please do not introduce own style.
> 
> > +          - items:
> > +              - enum:
> > +                  - variscite,mx6ulconcerto
> > +                  - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto-board
> 
> "board" is redundant
> 

Thank you for the review.
I will keep the existing Concerto binding entries separate, use the
surrounding items/enum style, and drop the redundant -board suffix.

> Also, look at other examples here, like Toradex. The actual variant
> should be the last.
> 

Could you clarify what you mean by “the actual variant should be the last”?
For a board with eMMC, SD card and WM8731 mounted on SOM, would you prefer
variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto or
variscite,var-som-imx6ul-concerto-emmc-sd-card-wm8731?
I had used the former ordering following examples such as
toradex,colibri-imx6ull-emmc-aster. (som - som variants - carrier)

Thank you!
Best Regards,
Stefano
