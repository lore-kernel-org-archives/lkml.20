Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481743;
	b=JsPRysf88TZCsExiA6PSfLikjyIx6HOiq1pZGhnsK8yygFQHAH8fuk6WJTlMoSmU3vHj
	 nRB9MC0DKbQo5hm7J3EZTaHxpJG/xOqyy4p1zm7wxFlgmuTGqhm6Xs9JT/Be79C+WLzed
	 UKmgPVSSlnae4+BTdZUZExdC7WMiSh27LLq38rtobR0HkgSejtNPC3HIrScVUenNTPcTK
	 L62Y2q33+JYAxhrS5qiCzWXGQ9gTcJ615bfGK1INSetcfSTY7DVOJn57BFzHwwry1P4At
	 XWCeQel4Q6UpM0vpexVUXCgUvtpk5t6+1y25pNngU1Ld+TD+uy5treFOxcJPdyJV+Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481743;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UwAE7JZbz6BZSDqMSG1PdFWp7D8tf1YwFLlJFvJVmaM=;
	b=khKAUs0wfUuAYQlPU8vLn8ARdDaCQ4oGhLJy3Xxg7lrh0DpQe3sBKH3Wc5QKjPEG9uHO
	 3p5uyVnICbYhrfSZkpFerLLBvZdV3WQ1CeVEyG/0YvwZsQyCA/GH7S59BcfaWHVVgXTZC
	 XjYYmmD64yywSOfMJn9Q/z1ROobV1L3CDlJTzz2aTu2aMM4Ti/lxwOjLNA/T41ZNwwLOD
	 d3jxFva+KkLo9lmvPDyEUTTOHtZRNqA0TnDs30suvnQdXSZD7BWSSO5TkwTeIXLg1FjSv
	 3Ahx0lxKN9WEmsTqt2TQeq4PPCNhPWa/9tPoqwve1eF/tl/Sc503ANqNEGo+a6EQWqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lDVZN/xj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F15606A31C;
	Thu, 12 Nov 2026 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDVZN/xj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927941F00A05;
	Thu, 12 Nov 2026 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481743;
	bh=UwAE7JZbz6BZSDqMSG1PdFWp7D8tf1YwFLlJFvJVmaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDVZN/xjnSgyoNZxykOUM3Smp2WGUkPhk9j7mDaN9E+JVptgcnjP2lOTs1wTllHiR
	 7T7ifFTHJ5Eb7Jnk6KjQdUwaMGLfQn+gdJBlXy7b87UL5fnHI77Bn93qfElLXl56hf
	 TRPklvFnuBF3h0B5me9Ipvfsjphlp0Nze5qbkSNFiii3uil+YcN6Gksl3jve+OiDv0
	 DAbNTNN16OR29/MWoYpahhudH1MXLyhXPBM6D3yfWPK38qBJPSPN7hcKpamwdgWbzT
	 jCy0J66OB5GcBXIVvBvMVmApo3apv9P/IUXCHZtuUbfsD3leaBH4U37jB+xowe4k3r
	 /LrWqjAM/OqGA==
Date: Thu, 12 Nov 2026 12:09:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Josua Mayer <josua@solid-run.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: Add Variscite
 VAR-SMARC-MX8M Plus
Message-ID: <20261112-vivacious-archetypal-kingfisher-edd054@quoll>
References: <cover.1794420001.git.stefano.r@variscite.com>
 <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794420001.git.stefano.r@variscite.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794420001.git.stefano.r@variscite.com>

On Wed, Nov 11, 2026 at 09:23:10PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
> and its Echo development board.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v1->v2:
>  - No changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

