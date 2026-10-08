Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F378F41CB4D;
	Thu,  8 Oct 2026 20:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791491820; cv=none; b=PqGzmHSE5EwMX8cxPb4RhgH8hFM1j1Qo9ajoWqQNYIq0XjLf65OLpvtKOr6+wL6GUfmYATMtQ6HAjNhwHAVbcdvnNA1rGOf7CgpXnN7Iot38h2GtyYmO+sRex7OHNq6YTKyGSlucXiYFghSwixQXpXkJ+St/7+y7ACfFnv17cJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791491820; c=relaxed/simple;
	bh=zQo2nuBxN7Ug+dKcd2l3sShmyd4CLYQft080nga92Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivKzrAF0IdCiPf9YfE64OCAn0jkGHCTvAZ6Mn/huum4Kq2jw4LtZSMHXvpCUzGi7T77FBEgzqRwCrepFNlcTWvdCJF0lPgLgkEzS2r5sJw2lhNVJ2xzYTZEMC5EAJo1H6+rTDeFynvdwrAp17PFpWnDnjoaa/C8TDp4T67PX4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7+ThHKE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7+ThHKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB8D1F000FF;
	Thu,  8 Oct 2026 20:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791491819;
	bh=zLLpEUL7lzg5XioJECbzA7FMtui9Ch446kVmlYlsSs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i7+ThHKEw0iaMpwi7o+DGnu1BvfsKYLCKvE008JQi+uxi8VcOvhnu8lKVys8xwiyk
	 95+AQrFzjC7cVLCUIl5y+xrYvTJJK718Ed62Jgw8dszBDNfTybXmObzGXSWp7YV9cL
	 h/RYua5BJlYvmKDOE5OPMajmnElhaBEwgZiaPsP0Wy+FKIO/SvzUK48h3EBk+VJk1U
	 qRasNU+gJtmh4T6kEnfZq43wc1V3/ohIIMJNTJ+b1klmwOsdg+ZtX7g4jX0ZESUvJm
	 PlAFP4+1d8mv2rQnr79DP6DZhew4Vr3TIDCzZ8SGg4NEFRHMpr6jrtWOiLVRge3Kn+
	 pEnapfejy+vcQ==
Date: Thu, 8 Oct 2026 15:36:58 -0500
From: Rob Herring <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 0/3] arm64: dts: imx8mp-skov: add new 7" variant
Message-ID: <20261008203658.GA1198136-robh@kernel.org>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>

On Thu, Oct 08, 2026 at 11:15:58AM +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 7" panel than the existing ones.
> As the already upstream boards and this new one are almost identical,
> convert the other device trees to a base devicetree and apply the touch
> controllers and panels via overlays.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Changes in v9:
> - fix dtbscheck error
> - squash new compatible into 7" devicetree patch

That is not what krzk meant. Squash patches 2 and 4. Binding and .dts 
patches are always separate.

Rob
