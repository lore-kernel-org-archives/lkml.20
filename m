Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4822E3A2559;
	Sat, 17 Oct 2026 18:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261158; cv=none; b=oTqVYv6dbGyzQbfyUVTWkA2SRvTNlBTreQi7C/Yvh124AEK3SbTcUXK+PGqDZTqZ4JVRPU2E4fDjhBMn0T6HW89oQziw6mL8y8MAKHLZ1kGnYJj8MO/a7bOmpVSuJT5L2DLZlOmpnH1VpcXeOaKZ91RZhkw/5QK4HnY36KcFFa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261158; c=relaxed/simple;
	bh=L/P4HtHRbTJElNoTQJpIvdWlFl4tFtfm9DPAIaSyhQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTYO/cwBoIKp/EsxFW4sN5ZLtGmHllrYIfIE65LCTXPtawrPXZ+S0Qf5ZA4XMNCj2d43Rkk7OrZ3SLixpXLUqHxWMA97ZAkInKCBTc77ffAwQdJjXzCV9IYF2QmgBTSzl3gCTs7jdW0jXQ3RhhBb5ufkZueG1Clh7mM0sz1OMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=jzlvZpvD; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="jzlvZpvD"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 250AE1FB65;
	Sat, 17 Oct 2026 20:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792261151;
	bh=RpTSiOPXX8wfXwImlsolqAJ9WURkWVPhsipC38lvdxg=; h=From:To:Subject;
	b=jzlvZpvDijkHExpia6go2tWbL3gNnnjaUicl7J7bG70rCpdlLnO8iHeVsDtLJViux
	 G3R//dDgdpE7pm/TrJ9l0f9Wh50G4iFB+ITanrSWaa55O8UQncNVS8brkzOTdwAiEe
	 bhxDAd08+EjuGnO2gfRzltiq+umepgVu/4Bjdp1aqrlF4vw0CXPQBlXZ2CTIhxWCer
	 ZUFWxjn1WZ84+F8ib/kG8fP71kbQVHT0ARvMxM8EmRow+UZ81Sa1Ikz+yW4bJsqJYL
	 7747Z+S5rXrSaQydALonfGxM/fBRBQpgt38PiLRxMDq3hY0hxaRTLWVQaIIMIQcenJ
	 r6yvejn38Da1A==
Date: Sat, 17 Oct 2026 20:19:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 08/14] ARM: dts: imx6qdl-apalis: remove disabled node
 "panel-lvds"
Message-ID: <20261017181906.GA8265@francesco-nb>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
 <20261016-arm_dts_cleanup2-v1-8-3a0cab9fd784@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-arm_dts_cleanup2-v1-8-3a0cab9fd784@nxp.com>

Hi Frank,

On Fri, Oct 16, 2026 at 04:10:51PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> "panel-lvds"'s status is disabled and no dtso overlay to enable it. So
> remove it to fix below CHECK_DTBS:
>  arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
> 
> Reduce move than 44 lines warnings.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Please, do not merge this. This is just breaking functionality for real
user to fix a warning.

There is a series [1] already posted to address the issue correctly, so that
we can have the issue fixed without impacting users.

[1] https://lore.kernel.org/all/20261001155412.3177428-1-leoreis.costa@gmail.com/

Francesco

