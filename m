Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C675A3C09EA;
	Mon, 31 Aug 2026 08:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166272; cv=none; b=DszWEVNqQ4O1UbfvcxTXQ2NeAqo6qb63XdhXg8OmiyLYnuyYsSoFq5mVwB72aiGQ2VdK2OgPwOLzrBRoKLY9s7+4392BhADvondmNu7Y4FU4WusnpkOe3OBJj8WZ70diRTr/1kQeE+SjG5jTOQexHZ64iYT1BQCC+ocNlHjqPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166272; c=relaxed/simple;
	bh=0y9AqCPkmMzXg4y0H7b+txhn8q7YvaREMsruI6GeqSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGi2FU+lw0qvbMzaGfd3g7LNmk34MijUdZnv7S4nu9b7voNa95vC//f4tF10M9BhCUftxGoMaMJVrzsFRzXjj06PEnnX2jzjCHpqJpb+uqegZYfhJdBBiZ0IeC/RsHtg6f1nf1hQJTRzwteos39I/dlGhk34qhITVLaPdvvbwfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XL8fXmsE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XL8fXmsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D401F000E9;
	Mon, 31 Aug 2026 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166270;
	bh=aJhSr1y8SNVGJVWTrH8sOv+0JMoXHZb5RD+4Hd9G5m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XL8fXmsEqDF/eDGwhootlckY4E55cvv2oQqeOsEisCc+wHuyE+QwnAjYwAK4ro4QT
	 U+fyylyiFMVq0XyTyJ56T/nJguFoRbEEhVZ+faax5kQeg5Y/9S38O0RdePoCb/uyPA
	 +VycH0kSNOucWa9TAVf5qSYCqxrKXMDX7tky7aaqHQWLXeiPv2CcNcnunh4fRbOGE/
	 3RPLfzmtDm9rB1j7H2NJr72muX4HhIQuBxTVtEaOeoTHmYhrXTFGITdGPF4zSNzZEj
	 jvEkobecxKqWzmC+f9ndBwC4pX+HyY0Qiw7GUWjVq6Xz5Ayz3RzyI7dT93uCQz5gTw
	 x7hP7vMLmGJEA==
Date: Mon, 31 Aug 2026 10:51:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: generic-ohci: Document ST STM32MP1
 SoC compatibles
Message-ID: <20260831-gay-colorful-cat-edf6c7@quoll>
References: <20260828150202.173109-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828150202.173109-1-marex@nabladev.com>

On Fri, Aug 28, 2026 at 05:01:26PM +0200, Marek Vasut wrote:
> Document SoC compatibles for ST STM32MP13xx and STM32MP15xx series of
> SoC, so they can be used as more accurate compatible in SoC DTSI. The
> SoC DTSI currently use plain "generic-ohci" which is not future proof.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

This should go also with your access controllers property. What
happened to it?

Best regards,
Krzysztof

