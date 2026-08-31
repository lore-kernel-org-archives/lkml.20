Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6041E4BA9FC;
	Mon, 31 Aug 2026 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185027; cv=none; b=Ijd1I+bTttg8OFimTiz6zK1vDVjB9/qNrFgqnQ+vuDvEn6vr4sYWHxMWwMgWAl8ZbCZOpCazb2slN3gilGgMQcIfKYdPwZpAXtKAfGhIIWwGPPJRV/GHBTfumObXA1dRC4NAmGVNY+O3uYZgdxDriUR5KH5FonImjDe5OeyYJF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185027; c=relaxed/simple;
	bh=u/JIEB1VZLVEUz1D5yYevW1fZKvNTUjrOOj9y0gM32E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1zw5ok54gYYXuh36ow0jo1jn242Ll6sCOEwlHB6RXHMxBdmQ5NFB1wjxD/VUzvKgrr4vuLaeO6rM7cUdeusD6lVyiJ0YL5Gf7Jc8SSld62elgXWwwUqwJLIKPK6x+e8BvM8UBJQxueDdcZUghNOgOAzAr5AXbbmnrh7ecxAzDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zyyi9KT5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zyyi9KT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110031F000E9;
	Mon, 31 Aug 2026 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788185026;
	bh=/68hFuw9bLfoF6dXZRX/Z57CoQKxfgxM5du8+GdZQ4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zyyi9KT5HEXY9WwuYrPGv/hQPw2oLCqB79wZ6909R7XbQsFgEqt+H02cC3usF9kGV
	 W9nnlVjNSwIZ+mloVz+C0m0rLGUPYfL7o+lkJ2GwxHGaWk/EaScP0mbLXz39mj4hPx
	 QmrVoUElh8CoF+Eu/Qj3HtvljJBbbeyptL+UudjitlT4Tw1qMXUdMtP4qZ3xBNKKID
	 sGlrzbsTWcIgN1OK7vGp6sHLasKrbZHPju2hhU5NnF2m5miwnR1+BAy2x2+S0qt5+T
	 ZrIPs0ElnoGJqeZdSITO7Da2MCKlYIUYZFwcgFZaDD2TxLeNCWrrj4RNI8MHJeFtEk
	 P4PxIqpKWSGPg==
Date: Mon, 31 Aug 2026 09:03:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org,
	m-chawdhry@ti.com, simona.toaca@nxp.com,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, daniel.baluta@gmail.com,
	goledhruva@gmail.com
Subject: Re: [PATCH] dt-bindings: bus: ti,omap-ocp2scp: Convert to DT schema
Message-ID: <178818502439.798571.879540033956134279.robh@kernel.org>
References: <20260818-ti-ocp2scp-v1-1-9d2885011cda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-ti-ocp2scp-v1-1-9d2885011cda@gmail.com>


On Tue, 18 Aug 2026 21:59:49 +0530, Bhargav Joshi wrote:
> Convert the TI OCP2SCP bridge device tree bindings to DT schema.
> Changes during conversion:
> - Add list #address-cells and #size-cells as required properties.
> - Drop ranges from the required properties as it is omitted in some
>   existing DTS.
> - Mark reg is not required for compatible ti,am437x-ocp2scp, driver skips
>   fetching memory resources for this, existing DTS also omit it.
> - Mark the ti,hwmods property as deprecated.
> - Set additionalProperties to type: object rather than using
>   patternProperties`. Since OCP2SCP acts as a generic bridge/bus, its
>   child nodes represent various PHY devices.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/bus/omap-ocp2scp.txt       | 29 ---------
>  .../devicetree/bindings/bus/ti,omap-ocp2scp.yaml   | 74 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+), 29 deletions(-)
> 

Applied, thanks!

