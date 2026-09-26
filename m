Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACDC3A63F3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412057; cv=none; b=qPI/6GTmcNrMwZGePyqj24dxsoL+WyGTg6yQikYJpPBf5xAmO9WF0uUOQ5Be2KgGgv5ljzwXCox6Iy4LreN8JpHnhLwu8wzI4RwEIfwggnG2UVXE4YAq3yQ0vaDFAIAY87vtUDxTiYKgxedN4GjhdfU330f29JYXA7KqcxsTLlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412057; c=relaxed/simple;
	bh=yfJjADf/hO1fRxYvy/AN/v3SrpzC/4Wi3xAd5XT6Vfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHyubQEg+wFfQ6odGvN41YcU1AcVFxGRyeRL9n3Q8LauE2VLl3UfuNAs+TpIEtw092yt0LxEIuwziYPITk4PQ3IYiLcm7OEncB3ZQKlVd0mCceoHeKIRlQNV2pEz7wfP/akn4oAqx8GIYdR1U4E0c9OcAPwt663GQesZEbq/Ypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHJN71Te; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHJN71Te"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so910395f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790412053; x=1791016853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKB7jX/87a5ucU2dpPAfqks2hCkBhkpECERSJJpQMwI=;
        b=jHJN71Ted+4EJSzEDgRQsxjJyBl7oD1seqQKsyBKjWZ1BrGy3/KjSSl6l2Y6JKDP1t
         MY8Vz4Li6Un0hyuJL0MvAk+GV9kbZ/Q7d8+cub8laDSZBjJ3Y03OrPdgUYWmk46dQ7Eg
         9ENr9dJZvKfD9hyuHWWQLEbrJnSCwxrnHsaPU5oBFZFRUlRlmaEJ4/l0/wVMg4e4iufW
         97b7wjN1oke5vEWpYVxAPbtKFojIYaMWg4Vf1vQpJiL8FfSz7tZoJGxmVibC/XuSdepC
         X5HNmijDWhJx2HKzYIbw+7G2cXXZXsM4nNXe1sHKeLNbd/97rawjbcAcPsAJgkqpKCTk
         rMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790412053; x=1791016853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKB7jX/87a5ucU2dpPAfqks2hCkBhkpECERSJJpQMwI=;
        b=Fk4Xj4JfqaDM83RruduuVIqZxLSQDftsJC/s7ZgynGBEt+mjHzyRvJmqHeJ11U/eBE
         4fXlMxv+ygE7BIsOlw5nihMJxeaWKUBBKggVBUOy+tTr9rWcV0nEg2KWM2dVSNQET3hC
         dPTkG/BHKLdyO4n6sVZNjjn1MyjzrcWp/WXuodnbZk0GBJx5WFMfiPrGXcEcLExO6hrY
         rWo7OyrGjPEstc12Fg2CDXuUSG0ENkBzn1EIGy9pNfP+ueiStqYrJyNTIXVPHKok7iM7
         hJgrYPGz7sYnPXaL5ekI/IGOrJqx3RnjINy2MCLO0OWU20FBOW1kBLt2gM+RTDekQacv
         bTvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1XjwcebGdlJ9J+O6JCclYC+YO7P0D4laEfjyn/q1WK10z9evy4GnYAU7XbTjk/nAXZz5tXgy1dbJnVaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+cc2Q/XO3iMkyChBL1PMG26UxFpjgWcwtYOzpVRpAt3GPTyTU
	qHjsg0aGHNGrqOllEiD9mZNFha7vCVyK71AxQnOVoSyzt/GbZRDJGL2Z
X-Gm-Gg: AYBFou1ENrEY8mn4h0tDgsqpw/x0jV4kWxRUz78PUW6ZS/JcRh3KZk2MuVCnT1e/TTR
	oQjQIMW5cqez2IlNs1LqeTuXwoWPcnykk7lR+KlnXaXpWcilWa5jbhVl0nc/3B3Ofc0ZvOUV37S
	WhfxTOndEVMYpAL7BFJN87XFFU5C8A05xwawMKM8yKJbXYdNp1FLp9mZbz8Xha3tCHAU48D3F8u
	AZfg4ZYWotSDQhw61bRxnMCigrhTQ/6DgJMj8+1DuvJSOSGlCRyGjWrhFbex0G2m6DWfhvPDFv8
	7AN2b0HB91r9DNhwKHfaZp3XsH2XOwBFXykkK1/Ro/8ZqVHUsVenVMAfi2qsLbcnPAqyROZsMsF
	ZS4Xc/3meKTyHm4ZxkgkCP5dI2V7NSq8I/I3oPY/Zzz+yQB936chv1XeVh09dNhcuefU0OtVbCy
	cBVcubFtjFl0HN2etMJVEQh5x2HtOp8SV4xx/wwhxv9Gey66ZNoO3ptVLtyKS+T0InvejimOml1
	zp47YmM+anbTz8EvB75jP5KomDbNZr4uLSKuqmUFoS2WZ+/RFzeABWqU5VugUy5pIzqVgCWdAv4
	M1zglU2kQQ2S/gTOUWyo80ZlwYNN
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id ffacd0b85a97d-488716a5e3amr14226748f8f.27.1790412053273;
        Sat, 26 Sep 2026 01:40:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm18313534f8f.10.2026.09.26.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:40:52 -0700 (PDT)
Date: Sat, 26 Sep 2026 10:40:50 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
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
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v1 04/11] ARM: dts: imx6ul: Add Variscite audio codec
 files
Message-ID: <areFEuHcyziU2xXx@Lord-Beerus.station>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <ef56f98137eb9d1e0af3aa1b801186d829dba521.1790344389.git.stefano.r@variscite.com>
 <araMJFirhP86Dcb6@SMW015318>
 <araZ8pJGmDVXMjvE@Lord-Beerus.station>
 <arakXE94ZONxduMU@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arakXE94ZONxduMU@SMW015318>

On Fri, Sep 25, 2026 at 11:42:04AM -0500, Frank Li wrote:
> On Fri, Sep 25, 2026 at 05:57:38PM +0200, Stefano Radaelli wrote:
> > On Fri, Sep 25, 2026 at 09:58:44AM -0500, Frank Li wrote:
> > > On Fri, Sep 25, 2026 at 04:02:21PM +0200, Stefano Radaelli wrote:
> > > > From: Stefano Radaelli <stefano.r@variscite.com>
> > > >
> > > > Add separate DTSI files for the WM8904 and WM8731 audio options on
> > > > VAR-SOM-6UL and DART-6UL modules.
> > > >
> > > > Put each codec node, the SAI2 setup and its pinctrl in the selected
> > > > audio DTSI. This makes the WM8904 option explicit instead of placing
> > > > it in the shared module base.
> > > >
> > > > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> > > > ---
> > > >  .../imx/imx6ul-imx6ull-var-dart-wm8731.dtsi   | 71 +++++++++++++++
> > > >  .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 88 +++++++++++++++++++
> > > >  .../imx/imx6ul-imx6ull-var-som-wm8731.dtsi    | 71 +++++++++++++++
> > > >  .../imx/imx6ul-imx6ull-var-som-wm8904.dtsi    | 85 ++++++++++++++++++
> > >
> > > what's difference between imx6ul-imx6ull-var-som-wm8904.dtsi and
> > > imx6ul-imx6ull-var-dart-wm8904.dtsi?
> > >
> > > Frank
> > >
> > Hi Frank!
> > Thank you for taking the time to review this huge patch.
> >
> > The difference is in simple-audio-card,routing:
> > on DART-6UL, the microphone jack is routed to IN2L, IN2R and MICBIAS;
> > those routes are absent on VAR-SOM-6UL.
> 
> Is possible to share most part?
> 
> Frank
> 

Absolutely! I'll do that in V2.
Thanks!

Best Regards,
Stefano
