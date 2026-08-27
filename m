Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056211C2AA;
	Thu, 27 Aug 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835110; cv=none; b=XAMtyvuZRICHjivwXEtOR3QY1NLJE7iahClHSaIVumftPm9yA/gzkksHDtqPqSX7ZyXTQMP47ht7DvZVXh4AZfynoS2ii2rlJHNZdRuORLoouG5D7Qn47jW/+GKnnAYoowEc5kbAr1LqQknlD88Z9pc4b0LAUB9cIjruibCRt/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835110; c=relaxed/simple;
	bh=pSCtQtzDK+fJZ7f2hYsxOpzN/pNRBJE/lezCI+3+LwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVcA0PMQbbizL7LWkBX0w0q8IOon6JhE4bB7b+yQyLaZ5hZFufsVBSGHVnthGk6rOfBM3n0gCcCd+JZrfN82WCrkuzb6XDGwLBN0uHYGjUdG87W9gk4LNsS3emRAWqRf5FqOBrmneFlfqAaA0r8GF26iFfx67XOdIwDjssmlG9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKAtoyXI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKAtoyXI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DB31F00A3A;
	Thu, 27 Aug 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835097;
	bh=XSQGFmuwvMzM5rXdfSlgZ1DfoF/Bil2FRcC3/j+QQw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FKAtoyXIUVjVMDEn2bJ2rLkiz0oMg6z2un6eG+WB04Mgau1KeclOVrx/+jzMdmhfC
	 AnrIP9Tsnsub67iuPDIL3qU/lNFwHldReFpB7+ysS36L8ng5D1VtE3pV9QT/NZ6TJu
	 Uq/ZE21LXMyTUIFd/ZwUHSvk6nXmiNoPxb5ZXE+9OIKxhAwcondOTo4tus0uuh46Wd
	 z0COv4vo1oIYzy8YTpqtm6RfIm52+H0xSls0tAmX8L7d80KaEpme4u3VlHjymgWtv0
	 KDpnU8xhscrfmNplLUYCFI0vque73dKOdHNal978QclZWxCjJVCXItPiCIxpKq3NYc
	 zI3h1p1Re4xKw==
Date: Thu, 27 Aug 2026 14:51:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Marek Vasut <marex@nabladev.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Subject: Re: [PATCH 07/16] dt-bindings: nvmem: st,stm32-romem: align
 patternProperties regex on nvmem-deprecated-cells.yaml
Message-ID: <20260827-normal-amphibian-dormouse-9f8fdc@quoll>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-7-c5e27cbc0795@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-7-c5e27cbc0795@foss.st.com>

On Fri, Aug 21, 2026 at 06:23:18PM +0200, Fabrice Gasnier wrote:
> Align the regex with the one used in nvmem-deprecated-cells.yaml
> ("@[0-9a-f]+(,[0-7])?$") so both patternProperties definitions apply
> to the same set of node names.
> 
> The patternProperties key only matched node names of the form
> "name@address" ("^.*@[0-9a-f]+$"). It did not match nodes using the
> extra unit-address index used to disambiguate cells sharing the same
> reg, e.g. "trim_rd_cc1@1e8,4", causing dtbs_check failures such as:

That's not a valid name, underscores are not allowed.

I don't get why this is part of USB and PHY and SoC patch, but whoever
told you, that mixing FOUR independent subsystems is fine, was wrong. It
is not fine.

Best regards,
Krzysztof

