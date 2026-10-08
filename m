Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E832572F;
	Thu,  8 Oct 2026 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488601; cv=none; b=DhFkw8hsOH1kqapv3Z+rW/w4hc1/pUZbov9Bylo3M0jPXrdr3+KCrxvyujeZrKybbprAxfavRqLO9p0DRS/+v/5WByMhbR3/JjZX97AbDE3B/TVFaFkhe9Zo01cKk4UoQarq1e/RiAKYtVvQ3CDmvcSu6qGl/QKfCzaHnk6kzlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488601; c=relaxed/simple;
	bh=yoQ803RF211kS858My4ZpMTxH49EsC33ULsUq6MBFtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERnlknKrsQy0/xtH+kPBAT0l9v13igNrKKmsc6RAGVbuKtQP5hLBYrfNXb09aBtT1Rc9bu4D1wf+t7XtzLS+bvuq7qvGGZVoCmaDHXEMN3sloXOihdtibNcPV2dAi2+o/JL9k9HMB6kRNnGd6708pv4Uo6VetsZJWSxk1/beCyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boTpVs5s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boTpVs5s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAE91F000FF;
	Thu,  8 Oct 2026 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791488600;
	bh=NZwiRd4JpA+xTYM34D1mENI6YZR63Qw0QaDPwvT4gzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=boTpVs5sF+REI2wKV5fSoTw2NWmn+MTdUsV/8j/fV/Nw4dRGKlsFHFR0Nx4LJ16NZ
	 Ax/cHogE88gT4jo3fgQzHeM2vkhUtNyRCQEEYcdLoZa4FNOJI9fKe27kqopb2p6Bo4
	 VGohsikO1syqPowOqLywR3Nr1y7HWZc5JVKSOM16OVjwm3ctohb1H56/TTVp0txYUn
	 eYs8Iux1PisgmhrQnC4XHe29eFEI8WK+NnK3nV9Zsnyqs8bhMgBArCNvC4WLpcIWQu
	 oI3ND69q7obsnboE6+ghfIPaguaZODFJH3Bf6YT3qmctBiEknkMucYol8qwhMmmBRk
	 8Ph/den9jgvrA==
Date: Thu, 8 Oct 2026 14:43:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, upstream@lists.phytec.de,
	linux-arm-kernel@lists.infradead.org,
	David Airlie <airlied@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>, Frank Li <Frank.Li@nxp.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel-simple: Allow
 "data-mapping" for "auo,g104sn02"
Message-ID: <179148859709.884257.1016647053232080228.robh@kernel.org>
References: <20261008053850.2941955-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008053850.2941955-1-primoz.fiser@norik.com>


On Thu, 08 Oct 2026 07:38:49 +0200, Primoz Fiser wrote:
> As per the AUO G104SN02 datasheet, section 6.4.1 "SEL68", this panel's
> SEL68 pin selects between 6 bits (SEL68 low/NC) and 8 bits (SEL68 high)
> per color over LVDS, i.e. an 18-bit or a 24-bit input format.
> 
> Currently, the auo_g104sn02 panel_desc only allows for the 24-bit
> configuration by default. Boards wired for the 18-bit configuration need
> the override introduced by commit 1cd3ea3e4b12 ("drm/panel-simple: allow
> LVDS format override")) to describe that instead.
> 
> Thus allow "data-mapping" override for "auo,g104sn02" in the schema.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

